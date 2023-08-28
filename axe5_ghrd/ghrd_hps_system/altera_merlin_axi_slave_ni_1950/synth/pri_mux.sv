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

// priority mux
// in0 has highest priority
// in7 has lowest priority
// shift_occured - used to adjust index-out in case when pipeline is enabled
// and now the index needs to be updated since data/(hence compare output was
// shifted

module pri_mux (
input in0,
input in1,
input in2,
input in3,
input in4,
input in5,
input in6,
input in7,
input [7:0] shift_index_out, 
output logic sel,
output logic [2:0] sel_index
);

always @ * begin
    if (in0) begin
        sel = in0;
        sel_index=0;
    end
    else if (in1) begin
        sel = in1;
        sel_index=1-shift_index_out[1];
    end
    else if (in2) begin
        sel = in2;
        sel_index=2-shift_index_out[2];
    end
    else if (in3) begin
        sel = in3;
        sel_index=3-shift_index_out[3];
    end
    else if (in4) begin
        sel = in4;
        sel_index=4-shift_index_out[4];
    end
    else if (in5) begin
        sel = in5;
        sel_index=5-shift_index_out[5];
    end
    else if (in6) begin
        sel = in6;
        sel_index=6-shift_index_out[6];
    end
    else begin
        sel = in7;
        sel_index=7-shift_index_out[7];
    end
end 
endmodule
