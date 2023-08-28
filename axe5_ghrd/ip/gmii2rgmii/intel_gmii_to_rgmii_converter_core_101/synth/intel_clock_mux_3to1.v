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
wire    clksel3;
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

// Disable D103 rule check on this synchronizer flops.
// AND gate combinatorial logic before going into synchronizer input is safe (clksel is static)
altera_std_synchronizer #(
    .depth    (2)
) u_inclk2_synchronizer /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D103\"" */ (
    .clk        (inclk2),
    .reset_n    (rst2_n),
    .din        (clksel2),
    .dout       (clksel2_sync)
);


// Disable C106 rule check
// Register used to latch the en in clock gating component is expected to be inverse of sampling edge
altera_gtr_clock_gate u_clk0_gate /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"C106\"" */ (
    .clk        (inclk0),
    .rst_n      (rst0_n),
    .en         (clksel0_sync),
    .clk_gated  (inclk0_gated)
);

// Disable C106 rule check
// Register used to latch the en in clock gating component is expected to be inverse of sampling edge
altera_gtr_clock_gate u_clk1_gate /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"C106\"" */ (
    .clk        (inclk1),
    .rst_n      (rst1_n),
    .en         (clksel1_sync),
    .clk_gated  (inclk1_gated)
);

// Disable C106 rule check
// Register used to latch the en in clock gating component is expected to be inverse of sampling edge
altera_gtr_clock_gate u_clk2_gate /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"C106\"" */ (
    .clk        (inclk2),
    .rst_n      (rst2_n),
    .en         (clksel2_sync),
    .clk_gated  (inclk2_gated)
);



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
