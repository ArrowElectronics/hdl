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

module sipo_plus #(
    parameter DEPTH = 8, // do not override, or you need to change out ports
    parameter TOTAL_W = 35,
    parameter ID_W    =10
) (
    input clk,
    input rst,
    // ST Sink IF to accept data
    input in_valid,
    input [TOTAL_W-2:0] in_data, // data in 1 less since valid is internally generated
    output in_ready,
    // flush mem
    input [DEPTH-1:0] clr, // clear mem space -1 bit per element
    output [DEPTH-1:0] shift_occurred, // indicates certain data shift shifted 
    // mem parallel outs    
    output [TOTAL_W-1:0] dout0,
    output [TOTAL_W-1:0] dout1,
    output [TOTAL_W-1:0] dout2,
    output [TOTAL_W-1:0] dout3,
    output [TOTAL_W-1:0] dout4,
    output [TOTAL_W-1:0] dout5,
    output [TOTAL_W-1:0] dout6,
    output [TOTAL_W-1:0] dout7
);

// mem structure : valid    , meta_data,       ID
//                 TOTAL_W-1,TOTAL_W-2:ID_W ,ID_W-1:0
logic [TOTAL_W-1:0] mem[DEPTH-1:0];

// mem operation - 
// write data @ MSB location when valid data is in
//   i.e. new data enters @ location 7 (DEPTH-1)
// every time any valid is low move elements to right to make sure all
// non-valids are at left
// when moving element to new location clear valid bit of current location
// ---- data unchanged during move on current location

// === data moves
logic shift_1_0;
logic shift_2_1;
logic shift_3_2;
logic shift_4_3;
logic shift_5_4;
logic shift_6_5;
logic shift_7_6;

assign shift_1_0 = !mem[0][TOTAL_W-1];
assign shift_2_1 = !mem[0][TOTAL_W-1]| !mem[1][TOTAL_W-1];
assign shift_3_2 = !mem[0][TOTAL_W-1]| !mem[1][TOTAL_W-1]| !mem[2][TOTAL_W-1];
assign shift_4_3 = !mem[0][TOTAL_W-1]| !mem[1][TOTAL_W-1]| !mem[2][TOTAL_W-1]| !mem[3][TOTAL_W-1];
assign shift_5_4 = !mem[0][TOTAL_W-1]| !mem[1][TOTAL_W-1]| !mem[2][TOTAL_W-1]| !mem[3][TOTAL_W-1]| !mem[4][TOTAL_W-1];
assign shift_6_5 = !mem[0][TOTAL_W-1]| !mem[1][TOTAL_W-1]| !mem[2][TOTAL_W-1]| !mem[3][TOTAL_W-1]| !mem[4][TOTAL_W-1]| !mem[5][TOTAL_W-1];
assign shift_7_6 = !mem[0][TOTAL_W-1]| !mem[1][TOTAL_W-1]| !mem[2][TOTAL_W-1]| !mem[3][TOTAL_W-1]| !mem[4][TOTAL_W-1]| !mem[5][TOTAL_W-1]| !mem[6][TOTAL_W-1];
assign shift_in  = in_ready & in_valid;

assign shift_occurred = {shift_7_6,shift_6_5,shift_5_4,shift_4_3,shift_3_2,shift_2_1,shift_1_0,1'b0};
always @ (posedge clk) begin
    if (shift_in)
        mem[7][TOTAL_W-2:0] <= in_data[TOTAL_W-2:0];
    if (shift_7_6)
        mem[6][TOTAL_W-2:0] <= mem[7][TOTAL_W-2:0];
    if (shift_6_5)
        mem[5][TOTAL_W-2:0] <= mem[6][TOTAL_W-2:0];
    if (shift_5_4)
        mem[4][TOTAL_W-2:0] <= mem[5][TOTAL_W-2:0];
    if (shift_4_3)
        mem[3][TOTAL_W-2:0] <= mem[4][TOTAL_W-2:0];
    if (shift_3_2)
        mem[2][TOTAL_W-2:0] <= mem[3][TOTAL_W-2:0];
    if (shift_2_1)
        mem[1][TOTAL_W-2:0] <= mem[2][TOTAL_W-2:0];
    if (shift_1_0)
        mem[0][TOTAL_W-2:0] <= mem[1][TOTAL_W-2:0];
end
// === valid moves
always @ (posedge clk) begin

    if (rst)
        mem[7][TOTAL_W-1] <= 0;
    else if (shift_in)
        mem[7][TOTAL_W-1] <= 1;
    else if (shift_7_6|clr[7])
        mem[7][TOTAL_W-1] <= 0;

    if (rst)
        mem[6][TOTAL_W-1] <= 0;
    else if (shift_7_6)
        mem[6][TOTAL_W-1] <= mem[7][TOTAL_W-1] & (! clr[7]) ;
    else if (shift_6_5|clr[6])
        mem[6][TOTAL_W-1] <= 0;

    if (rst)
        mem[5][TOTAL_W-1] <= 0;
    else if (shift_6_5)
        mem[5][TOTAL_W-1] <= mem[6][TOTAL_W-1]  & (! clr[6]);
    else if (shift_5_4|clr[5])
        mem[5][TOTAL_W-1] <= 0;

    if (rst)
        mem[4][TOTAL_W-1] <= 0;
    else if (shift_5_4)
        mem[4][TOTAL_W-1] <= mem[5][TOTAL_W-1] & (! clr[5]);
    else if (shift_4_3|clr[4])
        mem[4][TOTAL_W-1] <= 0;

    if (rst)
        mem[3][TOTAL_W-1] <= 0;
    else if (shift_4_3)
        mem[3][TOTAL_W-1] <= mem[4][TOTAL_W-1] & (! clr[4]);
    else if (shift_3_2|clr[3])
        mem[3][TOTAL_W-1] <= 0;

    if (rst)
        mem[2][TOTAL_W-1] <= 0;
    else if (shift_3_2)
        mem[2][TOTAL_W-1] <= mem[3][TOTAL_W-1] & (! clr[3]);
    else if (shift_2_1|clr[2])
        mem[2][TOTAL_W-1] <= 0;

    if (rst)
        mem[1][TOTAL_W-1] <= 0;
    else if (shift_2_1)
        mem[1][TOTAL_W-1] <= mem[2][TOTAL_W-1] & (! clr[2]);
    else if (shift_1_0|clr[1])
        mem[1][TOTAL_W-1] <= 0;

    if (rst)
        mem[0][TOTAL_W-1] <= 0;
    else if (shift_1_0)
        mem[0][TOTAL_W-1] <= mem[1][TOTAL_W-1] & (! clr[1]);
    else if (clr[0])
        mem[0][TOTAL_W-1] <= 0;
end

// ready low when mem is full - all valids are up
assign in_ready = !( mem[0][TOTAL_W-1] & mem[1][TOTAL_W-1] & mem[2][TOTAL_W-1] & mem[3][TOTAL_W-1] &
                      mem[4][TOTAL_W-1] & mem[5][TOTAL_W-1] & mem[6][TOTAL_W-1] & mem[7][TOTAL_W-1] );
// mem parallel outs
assign dout0 = mem[0];
assign dout1 = mem[1];
assign dout2 = mem[2];
assign dout3 = mem[3];
assign dout4 = mem[4];
assign dout5 = mem[5];
assign dout6 = mem[6];
assign dout7 = mem[7];
endmodule
    
