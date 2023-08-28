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


`timescale 1ps/1ps

module comp_sel #(
    parameter WIDTH=10,
    parameter PIPELINE_OUT=0,
    parameter PIPELINE_CMP=0
) (
    input           clk,
    input [WIDTH:0] in_0, // MSB=valid, WIDTH-1:0=ID
    input [WIDTH:0] in_1,
    input [WIDTH:0] in_2,
    input [WIDTH:0] in_3,
    input [WIDTH:0] in_4,
    input [WIDTH:0] in_5,
    input [WIDTH:0] in_6,
    input [WIDTH:0] in_7,
    input [WIDTH-1:0] base,
    input [7:0] shift_occurred, // indicates certain data shift shifted 
    output logic sel,
    output logic [2:0] sel_index
);
logic [WIDTH-1:0] equal,equal_reg;
logic sel_int;
logic [2:0] sel_index_int;
logic [7:0] shift_occurred_reg;

compare_eq #( .WIDTH (WIDTH) ) com0 ( .in_a(in_0[WIDTH-1:0]), .in_b(base), .equal(equal[0]) );
compare_eq #( .WIDTH (WIDTH) ) com1 ( .in_a(in_1[WIDTH-1:0]), .in_b(base), .equal(equal[1]) );
compare_eq #( .WIDTH (WIDTH) ) com2 ( .in_a(in_2[WIDTH-1:0]), .in_b(base), .equal(equal[2]) );
compare_eq #( .WIDTH (WIDTH) ) com3 ( .in_a(in_3[WIDTH-1:0]), .in_b(base), .equal(equal[3]) );
compare_eq #( .WIDTH (WIDTH) ) com4 ( .in_a(in_4[WIDTH-1:0]), .in_b(base), .equal(equal[4]) );
compare_eq #( .WIDTH (WIDTH) ) com5 ( .in_a(in_5[WIDTH-1:0]), .in_b(base), .equal(equal[5]) );
compare_eq #( .WIDTH (WIDTH) ) com6 ( .in_a(in_6[WIDTH-1:0]), .in_b(base), .equal(equal[6]) );
compare_eq #( .WIDTH (WIDTH) ) com7 ( .in_a(in_7[WIDTH-1:0]), .in_b(base), .equal(equal[7]) );

generate 
    if (PIPELINE_CMP) begin : PIPELINE_CMP_OUT
        always @ (posedge clk) begin
            equal_reg <= equal;
            shift_occurred_reg <= shift_occurred;
        end
    end
    else begin : NO_PIPELINE_CMP_OUT
        assign equal_reg = equal;
        assign shift_occurred_reg = 0;
    end
endgenerate

pri_mux pri_mux (
    .in0             (equal_reg[0] && in_0[WIDTH]),
    .in1             (equal_reg[1] && in_1[WIDTH]),
    .in2             (equal_reg[2] && in_2[WIDTH]),
    .in3             (equal_reg[3] && in_3[WIDTH]),
    .in4             (equal_reg[4] && in_4[WIDTH]),
    .in5             (equal_reg[5] && in_5[WIDTH]),
    .in6             (equal_reg[6] && in_6[WIDTH]),
    .in7             (equal_reg[7] && in_7[WIDTH]),
    .shift_index_out (shift_occurred_reg),
    .sel             (sel_int),
    .sel_index       (sel_index_int)
);

generate
    if (PIPELINE_OUT) begin
        always @ (posedge clk) begin
            sel       <= sel_int;
            sel_index <= sel_index_int;
        end
    end
    else begin
        assign sel = sel_int;
        assign sel_index = sel_index_int;
    end
endgenerate 
endmodule
