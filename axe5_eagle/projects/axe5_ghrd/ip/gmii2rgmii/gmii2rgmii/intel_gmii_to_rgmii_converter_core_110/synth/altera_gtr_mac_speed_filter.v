// (C) 2001-2023 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module altera_gtr_mac_speed_filter (
    input               clk,
    input               rst_n,
    input [2:0]         mac_speed,
    output reg [2:0]    mac_speed_filtered

);

wire [2:0]  mac_speed_sync;
wire        update_speed;
wire        speed_change_det;

reg         speed_change_det_1;
reg         speed_change_det_2;
reg         speed_change_det_3;



altera_std_synchronizer #(
    .depth    (2)
) u_mac_speed_0_synchronizer (
    .clk        (clk),
    .reset_n    (rst_n),
    .din        (mac_speed[0]),
    .dout       (mac_speed_sync[0])
);

altera_std_synchronizer #(
    .depth    (2)
) u_mac_speed_1_synchronizer (
    .clk        (clk),
    .reset_n    (rst_n),
    .din        (mac_speed[1]),
    .dout       (mac_speed_sync[1])
);

altera_std_synchronizer #(
    .depth    (2)
) u_mac_speed_2_synchronizer (
    .clk        (clk),
    .reset_n    (rst_n),
    .din        (mac_speed[2]),
    .dout       (mac_speed_sync[2])
);

// Filtering logic
// Since mac_speed is a bus vector, filtering logic here aim at eliminating bit coherency issue after the synchronization
// Once change is detected, delay for 3 clocks before updating the mac_speed_filtered
// mac_speed input from HPS EMAC can be considered static 

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        mac_speed_filtered  <= 3'b000;
    else if (update_speed)
        mac_speed_filtered  <= mac_speed_sync;
end

assign speed_change_det = (mac_speed_sync[0] ^ mac_speed_filtered[0]) |
                          (mac_speed_sync[1] ^ mac_speed_filtered[1]) |
                          (mac_speed_sync[2] ^ mac_speed_filtered[2]);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        speed_change_det_1  <= 1'b0;
        speed_change_det_2  <= 1'b0;
        speed_change_det_3  <= 1'b0;
    end
    else begin
        speed_change_det_1  <= speed_change_det;
        speed_change_det_2  <= speed_change_det_1;
        speed_change_det_3  <= speed_change_det_2;
    end
end

assign update_speed = speed_change_det_3;


endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "rFam2OOQSshuL+eeTiF6ovooTHga3FuxmJ0pGFI8SKCGKNEi4UF+Yt52NudiSCyaGSStr7FjkcAoqYKcK1vS3TQ6nd+F44N8wwC4jERQwAMz1RyCnspOJFyY7ZydcqcL7fsC0OhmlJ7CZJagkFMvQx4ZHRwPmfljjuQuRdl6AhiFLcvLOAlyFTzIwPJT9tGS+HYBUgUrfd/E8t6Tk4Kqxhpr4e3e7hX3nJhRsac5d847tsmJev9xhc8wqTEn28vXS0WskBq6Q9qKJbLc4mfdzTIygmRp6X5p6QHXxJh8ZkDg2+vaJI12rZGfAtVnUtiOogzGxx2/0xj95XbDAkaagaGBsutXADD9pYc+eeyQvJZ6Fz30WgRxSwZHrdP1AT1F8iZ8Dz+G+T+GDgWgQz728qErIxDmzzApAN/5W7G3KYWEOay42OV57IITwmt8WyxNoDtjcwLH2SuoEtsxhxXwqIQdsLbuHch2NGdlV9CkDYDqgMCrGZis51lm8GeJT2nZ2TGETdaPtKrvFOmUUInhl3axUljQpZtRlEizNhbD2MafbnjYA99+i4JgZ5FdFObFiVYdJNHWT6PTKX0+ur3kR+sTXnq6ZUolJ6kGv8pu3534PLqTap1C9/cJkzPrSqCFtzWUf0tAdiXoe+0dCHX4mB2Q6oqzy/270iFULPnhz+ivc51ZZEcOGrRZrWisJf6fhHETauFdrGY9nM/icNSvltcQHKS3z9Iyl4kVcOrd/U1cKjENqfoEPgUJD8ZCZtEzFrvS4BrbmxLKCxE4kQ3MVmlb9Ezba1oHUNMC4f5dcJkQR1P494HYbwxz4UUix9jl/JwEgLzexoM8vSMcx1FO+B6+oO2u4UOjrCDuxXjioh/sw+TryE/mWMfsPbLtakeHyUannY/45mFGuJgQm3NzZFqzcTiJOt6pyEY02GXmNUlBY+Jha1xcRA9F4WQvR+n2JLXq2rl5Go1iRPWmMgkFsf69QDAQHogxe9d3fq4CAAM4rMXZqqj4kMW8Pkh8EqZE"
`endif