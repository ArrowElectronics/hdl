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

module altera_gtr_pipeline_stage #(
    parameter DATA_WIDTH = 1
) (
    input                       clk,
    input                       rst_n,
    input [DATA_WIDTH-1:0]      datain,

    output [DATA_WIDTH-1:0]     dataout

);

(* altera_attribute = "-name FORCE_HYPER_REGISTER_FOR_CORE_PERIPHERY_TRANSFER ON" *)
reg [DATA_WIDTH-1:0] dataout_reg;

assign dataout = dataout_reg;

// always @(posedge clk or negedge rst_n) begin
always @(posedge clk) begin
    if (!rst_n)
        dataout_reg <= {DATA_WIDTH{1'b0}};
    else
        dataout_reg <= datain;
end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "rFam2OOQSshuL+eeTiF6ovooTHga3FuxmJ0pGFI8SKCGKNEi4UF+Yt52NudiSCyaGSStr7FjkcAoqYKcK1vS3TQ6nd+F44N8wwC4jERQwAMz1RyCnspOJFyY7ZydcqcL7fsC0OhmlJ7CZJagkFMvQx4ZHRwPmfljjuQuRdl6AhiFLcvLOAlyFTzIwPJT9tGS+HYBUgUrfd/E8t6Tk4Kqxhpr4e3e7hX3nJhRsac5d85Baddj85fPcrIpKs2gBkC+1i6XhC6NEyyT5OQ4RXWduCl6oeC6WVfHZ2wozNX5rRQu9EFq3bi1zjt32io9tTCfg6whTu0mlIPOfqVjxyVZmCCckXbjMXQShxCaNLUsGt1OsbSAoKT4UphZojlOVrHQJ3uHcwZWwtEFCsUSXbygFLuZkW5jHqFwhwCvxyHELdPnIoJ/zzt9tvQfNFHNJoLBYbw5ZkS4WRo5H+suEkLmlE6nsW/5r1NEfoSeG/T2+NrXv43zD8Ky3hJ/4h4duxVTpvhKrvb7zE2tkzYmsRbysFexI/SX5GZ1MJZnmgTQT/d7gX88DBJcI593zK/2s9zGnGodGwcg4l2K/os6jMxSpxHBYkv2TjNjMdPKIufVXWtN+WZ6THJOZBuiJKxsmbfGLXKRBMYdqFnUYZsdY15wtT6cPvneGeT7EStRPXYzmXik6yCellxVwQHZEhgeHY1q3aOXw/tR0fQKx49HvYFceN3Iat2zjFipQnm6EcbfqeQKah0l3mhOssfGBlL194osMCQ++gtpEBE3s07KRnTDd2C4DrIsU77VuUR7aJVOe60FxLxMYYEKQ4QjO2GQ4RdGj7bUSUM9ShT44qOH19oUrI1WTtM/ESILldlqxX/+AlvDYJEJi2NCbNjER2YX7YGyQqON377fTA41sTUpMqUp5hXj7tohTQazA2INK0SetCy7z8jSPgQCHTMA0HKzbu5zDrXEl9Cyx3sqViVPF2AIWk3xTxgtIyMxkv1lLxMpKQgLUyXdGdvK6ZVCllknSwpZ"
`endif