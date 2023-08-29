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

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        dataout_reg <= {DATA_WIDTH{1'b0}};
    else
        dataout_reg <= datain;
end

endmodule
