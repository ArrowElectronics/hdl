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


//--------------------------------------------------------------------------------------------------------------------------
// File Name   : intel_srcss_gts_top.sv.terp
// Project     : <SRC> 
// Version     : <0.63>
// Description : SRC 
//               
//               
// Limitations : 
//--------------------------------------------------------------------------------------------------------------------------
// Copyright 2019 Intel Corporation. 
//
// This reference design file is subject licensed to you by the terms and 
// conditions of the applicable License Terms and Conditions for Hardware 
// Reference Designs and/or Design Examples (either as signed by you or 
// found at https://www.altera.com/common/legal/leg-license_agreement.html ).
//
// As stated in the license, you agree to only use this reference design 
// solely in conjunction with Intel FPGAs or Intel CPLDs.  
//
// THE REFERENCE DESIGN IS PROVIDED "AS IS" WITHOUT ANY EXPRESS OR IMPLIED
// WARRANTY OF ANY KIND INCLUDING WARRANTIES OF MERCHANTABILITY, 
// NONINFRINGEMENT, OR FITNESS FOR A PARTICULAR PURPOSE. Intel does not 
// warrant or assume responsibility for the accuracy or completeness of any
// information, links or other items within the Reference Design and any 
// accompanying materials.
//
// In the event that you do not agree with such terms and conditions, do not
// use the reference design file.
/////////////////////////////////////////////////////////////////////////////
`timescale 1 ps/1 ps               // time-unit = 1 ps, precision = 1 ps
module gts_reset_seq_intel_srcss_gts_200_wnl7lpy  #(
// shoreline sequencer:
    parameter SRC_RS_DISABLE = 0,
    parameter NUM_LANES_SHORELINE            = 12,
    parameter NUM_BANKS_SHORELINE            = 3
    
 ) (
   input  [NUM_LANES_SHORELINE-1:0] i_src_rs_req,
   input  [NUM_LANES_SHORELINE-1:0] i_src_rs_priority,
   output [NUM_LANES_SHORELINE-1:0] o_src_rs_grant,
   output [NUM_BANKS_SHORELINE-1:0] o_pma_cu_clk
  );
//=================================================================
//                          Shoreline sequencer
//=================================================================  
wire [NUM_BANKS_SHORELINE-1:0] cnoc_clk;
reg                   reg_cnoc_clk;
    if (!SRC_RS_DISABLE)begin
        intel_srcss_gts #(
        .NUM_LANES_SHORELINE ( NUM_LANES_SHORELINE )
        ) inst (

         .i_src_rs_req       (i_src_rs_req),
         .i_src_rs_priority  (i_src_rs_priority),
         .o_src_rs_grant     (o_src_rs_grant)
       );
    end
    
//Below generate block instantiates ATOMS and generates FLUX Clock used by QHIP 
//CONC and FLUX clock are one to one connection and the expected frequency of FLUX Clock is 450Mhz
    generate
    genvar idx_flux_clk;  
    for(idx_flux_clk=0;idx_flux_clk < NUM_BANKS_SHORELINE ; idx_flux_clk= idx_flux_clk+1) begin:bankflux
        tennm_sm_flux_s u0(
        .i_flux_sclk_mux(cnoc_clk[idx_flux_clk]),
        .o_flux_sclk_mux(o_pma_cu_clk[idx_flux_clk])
        );
        tennm_sm_cnoc_clk c0(
        .o_cnoc_clk(cnoc_clk[idx_flux_clk])
        );
    end
    endgenerate
endmodule    
//--------------------------------------------------------------------------------------------------------------------------
// Version             |  Changes                                        | Date                 | Owner ID
//--------------------------------------------------------------------------------------------------------------------------
//   0.0               |                                                 |                      | 
//   0.1               |                                                 |  27-Jul-2022         | sushilsh
//   0.2               | added CLOCK_RST_COMP_BYPASS parameter           |  06-Dec-2022         | sushilsh
//   0.3               | adding the Flux clock and instantiating the ATOM|  06-Jan-2023         | lnaraya2 
//   0.4               | Removing the earlier IFDEF for Sim and Synthesis|  13-Jan-2023         | lnaraya2 
//                     | removed the commented lines                     |                      |    
//   0.5               | Renaming IP                                     |  07-Mar-2023         | skgr 
//   0.6               | Renaming ports HSD: 15013174926                 |  13-Apr-2023         | skgr 
//                     | Removed CLK_RST_BYPASS macro                    |                      |
//   0.61              | HSD:16020615752                                 |  15-May-2023         | skgr
//   0.62              | HSD: Update num of banks                        |  26-Sep-2023         | skgr
//   0.63              | SRC RS Enable for PCIe only design              |  16-Oct-2023         | skgr
//--------------------------------------------------------------------------------------------------------------------------



