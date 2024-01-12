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

module altera_gtr_clock_mux (
    input   inclk0,
    input   rst0_n,
    input   inclk1,
    input   rst1_n,
    input   clksel,
    
    // Disable C104 rule check
    // outclk is a generated clock
    output  outclk /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"C104\"" */

);

reg     clksel0_sync_dly;
reg     clksel1_sync_dly;

wire    clksel0;
wire    clksel1;
wire    clksel0_sync;
wire    clksel1_sync;
wire    inclk0_gated;
wire    inclk1_gated;

assign clksel0 = ~clksel & ~clksel1_sync_dly;
assign clksel1 = clksel & ~clksel0_sync_dly;


// Disable D103 rule check on this synchronizer flops.
// AND gate combinatorial logic before going into synchronizer input is safe (clksel is static)
altera_std_synchronizer #(
    .depth    (2)
) u_inclk0_synchronizer /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D103\"" */ (
    .clk        (inclk0),
    .reset_n    (rst0_n),
    .din        (clksel0),
    .dout       (clksel0_sync)
);



// Disable D103 rule check on this synchronizer flops.
// AND gate combinatorial logic before going into synchronizer input is safe (clksel is static)
altera_std_synchronizer #(
    .depth    (2)
) u_inclk1_synchronizer /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D103\"" */ (
    .clk        (inclk1),
    .reset_n    (rst1_n),
    .din        (clksel1),
    .dout       (clksel1_sync)
);

tennm_clk_gate #(
    .ena_register_mode("negative latch"),
    .enable_type("sector")
) u_clk0_gate (
    .enable(clksel0_sync),
    .inclk(inclk0), 
    .outclk(inclk0_gated)
);

tennm_clk_gate #(
    .ena_register_mode("negative latch"),
    .enable_type("sector")
) u_clk1_gate (
    .enable(clksel1_sync),
    .inclk(inclk1), 
    .outclk(inclk1_gated)
);




// Disable C106 rule check
// Register used to latch the en in clock gating component is expected to be inverse of sampling edge
// altera_gtr_clock_gate u_clk0_gate /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"C106\"" */ (
    // .clk        (inclk0),
    // .rst_n      (rst0_n),
    // .en         (clksel0_sync),
    // .clk_gated  (inclk0_gated)
// );



// Disable C106 rule check
// Register used to latch the en in clock gating component is expected to be inverse of sampling edge
// altera_gtr_clock_gate u_clk1_gate /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"C106\"" */ (
    // .clk        (inclk1),
    // .rst_n      (rst1_n),
    // .en         (clksel1_sync),
    // .clk_gated  (inclk1_gated)
// );



always @(posedge inclk0 or negedge rst0_n) begin
    if (!rst0_n)
        clksel0_sync_dly    <= 1'b0;
    else
        clksel0_sync_dly    <= clksel0_sync;
end



always @(posedge inclk1 or negedge rst1_n) begin
    if (!rst1_n)
        clksel1_sync_dly    <= 1'b0;
    else
        clksel1_sync_dly    <= clksel1_sync;
end



assign outclk = inclk0_gated | inclk1_gated;


endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "rFam2OOQSshuL+eeTiF6ovooTHga3FuxmJ0pGFI8SKCGKNEi4UF+Yt52NudiSCyaGSStr7FjkcAoqYKcK1vS3TQ6nd+F44N8wwC4jERQwAMz1RyCnspOJFyY7ZydcqcL7fsC0OhmlJ7CZJagkFMvQx4ZHRwPmfljjuQuRdl6AhiFLcvLOAlyFTzIwPJT9tGS+HYBUgUrfd/E8t6Tk4Kqxhpr4e3e7hX3nJhRsac5d87SgeCPPWBWKTqtTnMDFSYhspTbqEa+/wean23f/ZGK6VpJbUzOrZwiBYA6ySG1hx02zblzLTt3U5WGLjo3z6v/jmBvESOqawWlCClGoPICxf0j7r9Kvqqm77IPvuFzmxTrBKEyaHdfzJWsheNAkVbA0+dU9KibzVgKxi/PPKkFLwIXlf1Jul9z1imbe5EfM2AG2TcT/gLGMRvlEzkDRdcu5CdJAfyMhA1IeOsOtzKGe3u3ZuNthuOe5OeNHY6Uc6HS9knyoPvpmVRuFU+A3mSpBHVdcD1U0IEoyFmujUGRAeT0ny0D5lKXs1dS3ktB4WNzLjFqaZFMfdNgRQTYNxpP05WXUSuJtL06cIwCFSOkzNRrnLJbwyh8d97ydYLSCf25OzZx43V59yUQ4xocE2/DGj9aolpz+Hpi/Fp4Cg9hM+k/9UlpgNQhCj0xMQJS5XY6AaMWZsjUFK6WX8CIeY+2ltenlEycsz28mtQlVulGdHiPNIxtvJygTldrDtWlwPAPRiv6yNR4Cmhst99HFR3/jP8SHknUIzTpwonSY748+Ofm4Q27r77rSdwa+C4MNfw/PvMWS0CIgzD7x/GMmQ5aywY56XBPDjhKdvkalUUjcvnYuRJI5YcoJbG1UoJpj/9l5W6Dhzz4gHuowxt1eBexa5WOFJwMlueSUuR40ae4Udf587l3wMN4icBNtHtbQ3Q1B73BjNwBKjTTjnIlO0E4TGJcDJt/3Yydhtd3ELfRrM7VZnYoft7AIE3cV7lbcQd3kn5o54zkQfFC0GIM9HOM"
`endif