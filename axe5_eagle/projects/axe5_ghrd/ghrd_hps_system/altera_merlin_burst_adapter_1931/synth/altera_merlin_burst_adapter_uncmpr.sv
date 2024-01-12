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


// (C) 2001-2012 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other
// software and tools, and its AMPP partner logic functions, and any output
// files any of the foregoing (including device programming or simulation
// files), and any associated documentation or information are expressly subject
// to the terms and conditions of the Altera Program License Subscription
// Agreement, Altera MegaCore Function License Agreement, or other applicable
// license agreement, including, without limitation, that your use is for the
// sole purpose of programming logic devices manufactured by Altera and sold by
// Altera or its authorized distributors.  Please refer to the applicable
// agreement for further details.


// $Id: //acds/main/ip/merlin/altera_merlin_burst_adapter/altera_merlin_burst_adapter.sv#68 $
// $Revision: #68 $
// $Date: 2014/01/23 $

`timescale 1 ns / 1 ns

// -------------------------------------------------------
// Adapter for uncompressed transactions only. This adapter will
// typically be used to adapt burst length for non-bursting 
// wide to narrow Avalon links.
// -------------------------------------------------------
module altera_merlin_burst_adapter_uncompressed_only
#(
    parameter 
    PKT_BYTE_CNT_H  = 5,
    PKT_BYTE_CNT_L  = 0,
    PKT_BYTEEN_H    = 83,
    PKT_BYTEEN_L    = 80,
    ST_DATA_W       = 84,
    ST_CHANNEL_W    = 8
)
(
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                           sink0_valid,
    input  [ST_DATA_W-1 : 0]        sink0_data,
    input  [ST_CHANNEL_W-1 : 0]     sink0_channel,
    input                           sink0_startofpacket,
    input                           sink0_endofpacket,
    output reg                      sink0_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output reg                      source0_valid,
    output reg [ST_DATA_W-1    : 0] source0_data,
    output reg [ST_CHANNEL_W-1 : 0] source0_channel,
    output reg                      source0_startofpacket,
    output reg                      source0_endofpacket,
    input                           source0_ready
);
    localparam
        PKT_BYTE_CNT_W = PKT_BYTE_CNT_H - PKT_BYTE_CNT_L + 1,
        NUM_SYMBOLS    = PKT_BYTEEN_H - PKT_BYTEEN_L + 1;

    wire [PKT_BYTE_CNT_W - 1 : 0] num_symbols_sig = NUM_SYMBOLS[PKT_BYTE_CNT_W - 1 : 0];

    always_comb begin : source0_data_assignments
        source0_valid         = sink0_valid;
        source0_channel       = sink0_channel;
        source0_startofpacket = sink0_startofpacket;
        source0_endofpacket   = sink0_endofpacket;

        source0_data          = sink0_data;
        source0_data[PKT_BYTE_CNT_H : PKT_BYTE_CNT_L] = num_symbols_sig;

        sink0_ready = source0_ready;
    end

endmodule



`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Oy3QR2mKNgmhEfGL3SW6HQfCmb79srhD44IOaAtUlH8/pTgcm9t2UrXActBjPTmN4Bv4NNlGdb4P/mc3rtoPRgAFqt2AVMJX3s0AQGiv7LFugS4Idf0kbtvb54pTXH+zn++Y2B/CghSRss/8348bn4PK6K78kVges9jyNixGVIibFRB8G5IWj5cfOPmgt+ydiX4ZjY+CtMVd406Jcd+oQRODgD4T+W1CBwJueCo1/aJQzJNaBx9Amt39T3FOZwn27dBXG8dtSrukzONbaq6DkWlwq9Ot3aL7iPjL5RoF29HRt8nS9fmJZMEJeiTCVfBVyUf+JD3I0If2Ecg0keidxB7CYYcRBhcmbn6eFJi6Ode0jCvGFZsOL4zwfz7o4iNrgjO+F2rpZEQEZdMWprIFM+OcHcfCQqoo/UsjWFJdlZd536WgHpDfOOjcPzvZc09zrbP0vSKrthHzFWbUIAZ5YexDO0h2k0744lr5hQHxe2pWFjEncyR58MRTXYtF8emRfTqmzgxQucLTXE0RNhD2yl6XpNHRMzV9St+6w4v0xLDJR+neXOyD4xy0xClqpkvHwmNi2IBDDG5wiUysJryAIWj8/DpLLOmA7hL1dBLSkjkJCfTUjhZYhsaaoi+dyQl/aPzc48URHaBX0n0J8wxm92Dq9W6H2Q8xSmpDS6EoUhjgjojXEwSCQYJ06B4FUIjNXdiC/vW98N3xdT05O6WOvGaM2BCVuJfG03KJ+1AG+JuRuQcHvqM5QwPi3FmVZ3KC5yxEHMpRTATxg+YwaK/pzzSYJlq47gyxkX7oOMinxR5Qn3Hx7EjUwaZAfNN/l2HCfkav2hLBvLvokwzFhBTpSOXyNs0tOosiIuRK3pMc3uOc+ypT2OmkeNDTC8DaKoQ4NHLRiT1yK5O/AweAh8PHVSMMmdhBe0bSAlx5RMVJi33tY9XfxL+p/4t/WFWHLVX9wcEjkfB+XoJ+zFVOb1C7NJ2ZGOGGMWK46gBLq7NHjp1+XNp5MzlT16TH4kw1tdPE"
`endif