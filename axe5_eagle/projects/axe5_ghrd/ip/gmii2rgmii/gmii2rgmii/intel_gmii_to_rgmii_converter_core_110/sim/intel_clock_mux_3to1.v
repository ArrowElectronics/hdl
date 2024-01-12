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

module intel_clock_mux_3to1 (
    input         inclk0,
    input         inclk1,
    input         inclk2,
    input         rst0_n,
    input         rst1_n,
    input         rst2_n,
    input [1:0]   clksel,
 	
    // Disable C104 rule check
    // outclk is a generated clock
    output        outclk /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"C104\"" */

);

reg     clksel0_sync_dly;
reg     clksel1_sync_dly;
reg     clksel2_sync_dly;

wire    clksel0;
wire    clksel1;
wire    clksel2;
wire    clksel0_sync;
wire    clksel1_sync;
wire    clksel2_sync;
wire    inclk0_gated;
wire    inclk1_gated;
wire    inclk2_gated;

assign clksel0 = ~clksel[1] & ~clksel[0] & ~clksel1_sync_dly & ~clksel2_sync_dly;
assign clksel1 = ~clksel[1] &  clksel[0] & ~clksel0_sync_dly & ~clksel2_sync_dly;
assign clksel2 =  clksel[1] & ~clksel[0] & ~clksel0_sync_dly & ~clksel1_sync_dly;

// Disable D103 rule check on this synchronizer flops.
// AND gate combinatorial logic before going into synchronizer input is safe (clksel is static)
altera_std_synchronizer #(
    .depth    (4)
) u_inclk0_synchronizer /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D103\"" */ (
    .clk        (inclk0),
    .reset_n    (rst0_n),
    .din        (clksel0),
    .dout       (clksel0_sync)
);

// Disable D103 rule check on this synchronizer flops.
// AND gate combinatorial logic before going into synchronizer input is safe (clksel is static)
altera_std_synchronizer #(
    .depth    (4)
) u_inclk1_synchronizer /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D103\"" */ (
    .clk        (inclk1),
    .reset_n    (rst1_n),
    .din        (clksel1),
    .dout       (clksel1_sync)
);

// Disable D103 rule check on this synchronizer flops.
// AND gate combinatorial logic before going into synchronizer input is safe (clksel is static)
altera_std_synchronizer #(
    .depth    (4)
) u_inclk2_synchronizer /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D103\"" */ (
    .clk        (inclk2),
    .reset_n    (rst2_n),
    .din        (clksel2),
    .dout       (clksel2_sync)
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

tennm_clk_gate #(
    .ena_register_mode("negative latch"),
    .enable_type("sector")
) u_clk2_gate (
    .enable(clksel2_sync),
    .inclk(inclk2), 
    .outclk(inclk2_gated)
);

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

// Disable C106 rule check
// Register used to latch the en in clock gating component is expected to be inverse of sampling edge
// altera_gtr_clock_gate u_clk2_gate /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"C106\"" */ (
    // .clk        (inclk2),
    // .rst_n      (rst2_n),
    // .en         (clksel2_sync),
    // .clk_gated  (inclk2_gated)
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

always @(posedge inclk2 or negedge rst2_n) begin
    if (!rst2_n)
        clksel2_sync_dly    <= 1'b0;
    else
        clksel2_sync_dly    <= clksel2_sync;
end



assign outclk = inclk0_gated | inclk1_gated | inclk2_gated;


endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "rFam2OOQSshuL+eeTiF6ovooTHga3FuxmJ0pGFI8SKCGKNEi4UF+Yt52NudiSCyaGSStr7FjkcAoqYKcK1vS3TQ6nd+F44N8wwC4jERQwAMz1RyCnspOJFyY7ZydcqcL7fsC0OhmlJ7CZJagkFMvQx4ZHRwPmfljjuQuRdl6AhiFLcvLOAlyFTzIwPJT9tGS+HYBUgUrfd/E8t6Tk4Kqxhpr4e3e7hX3nJhRsac5d853UDhVpU2HD8rlrqmcpoIBRmCDXw56+wnTuHSiD01J8jUL/xmY2drXoWioajKijt/KWBeH3mYnuGzgAQ2FnzwXhHzF8HImUiYO9KRsYD/wFT9kX7MrSwlncGJk5c+7boyZ0UkMcC6s1iqhqHd/CYV1Ogrf0BK+HnHhxCrbbr1vJhscWoJRwlTJOcFLeWTEk6D0eYf4gLsXYvt81hlKQ/fKZDZizjc5jPzxnrQN0zy4LU2dAG8zaXsNleZJME6pi6We1gFOrk6TUbMjgjHbnKG/IgRo6CtJ+qHBkm9k9MWUTgJhoeFHyXqgbhmuWjxuOgfIjyJALj0aF+xhlhjQTF86Z2aYwYhb20B56uSvPzpAeUJwhORkr0dSQpCCYpNTWJC5A4U2wHRdNkWKD3oy+nXb+XvFvZL2pmOj1Eh5rpxoF3q2gz5FNieBDfLTAzjZ/T3ak8u2vjKI7foOP68GCVKy4HxNP0BaUsN4SXm9pdOfJqnL4rvcn83B0vYd8JGAmSeTSGiZbTUTDGFh19fQnrpZYjKApkONYasZS1upIf8bDYlFCUjkZFJkvFZMlte6jOagWi96o/g/ZrGxsolvR6kEYrj8bkRdudq/RLzwL5QFR9zgWEjR0tvMF4FUG4t1mAHPjS0iTtZNgD5gpnters/d/03kgbypPKFCjfl77IyvL3db0/F5c/xy2OkUfRPiWETYh8rMafMGzc8JOBxWN9TaF3C8iTEGnP/gIt57+g1///9Yr853Hl5DzgRHBvCznTvMRL90qXNDKlOWxTP/z44F"
`endif