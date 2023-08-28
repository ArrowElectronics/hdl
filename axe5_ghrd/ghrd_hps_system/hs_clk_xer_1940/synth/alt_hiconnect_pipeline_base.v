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


// $File: //acds/prototype/mm_s10/ip/avalon_st/altera_avalon_st_pipeline_stage/altera_avalon_st_pipeline_base.v $
// $Revision: #2 $
// $Date: 2015/05/15 $
// $Author: jyeap $
//------------------------------------------------------------------------------

`timescale 1ns / 1ns

module alt_hiconnect_pipeline_base (
                                       clk,
                                       reset,
                                       in_ready,
                                       in_valid,
                                       in_data,
                                       out_ready,
                                       out_valid,
                                       out_data
                                       );

   parameter SYMBOLS_PER_BEAT = 1;
   parameter BITS_PER_SYMBOL  = 8;
   parameter PIPELINE_READY   = 1;
   localparam DATA_WIDTH = SYMBOLS_PER_BEAT * BITS_PER_SYMBOL;
   
   input clk;
   input reset;
   
   output in_ready;
   input  in_valid;
   input [DATA_WIDTH-1:0] in_data;
   
   input                  out_ready;
   output                 out_valid;
   output [DATA_WIDTH-1:0] out_data;
   
   reg                     internal_sclr;
   reg                     full0;
   reg                     full1;
   reg [DATA_WIDTH-1:0]    data0;
   reg [DATA_WIDTH-1:0]    data1;

   assign out_valid = full1;
   assign out_data  = data1;    

   always @(posedge clk) begin
      internal_sclr <= reset;
   end
   
   generate if (PIPELINE_READY == 1) 
     begin : REGISTERED_READY_PLINE
        
        assign in_ready  = !full0;

        always @(posedge clk) begin
           // ----------------------------
           // always load the second slot if we can
           // ----------------------------
           if (~full0)
             data0 <= in_data;
           // ----------------------------
           // first slot is loaded either from the second,
           // or with new data
           // ----------------------------
           if (~full1 || (out_ready && out_valid)) begin
              if (full0)
                data1 <= data0;
              else
                data1 <= in_data;
           end
        end
        
        always @(posedge clk) begin
           if (internal_sclr) begin
              full0 <= 1'b0;
              full1 <= 1'b0;
           end else begin
              // no data in pipeline
              if (~full0 & ~full1) begin
                 if (in_valid) begin
                    full1 <= 1'b1;
                 end
              end // ~f1 & ~f0

              // one datum in pipeline 
              if (full1 & ~full0) begin
                 if (in_valid & ~out_ready) begin
                    full0 <= 1'b1;
                 end
                 // back to empty
                 if (~in_valid & out_ready) begin
                    full1 <= 1'b0;
                 end
              end // f1 & ~f0
              
              // two data in pipeline 
              if (full1 & full0) begin
                 // go back to one datum state
                 if (out_ready) begin
                    full0 <= 1'b0;
                 end
              end // end go back to one datum stage
           end
        end

     end 
   else 
     begin : UNREGISTERED_READY_PLINE
        
        // we're ready if the slot is unoccupied, or if the output is ready
        assign in_ready = (~full1) | out_ready;
        
        always @(posedge clk) begin
           if (in_ready) begin
              data1 <= in_data;
           end
        end                

        always @(posedge clk) begin
           if (internal_sclr) begin
              full1 <= 1'b0;
           end
           else begin
              if (in_ready) begin
                 full1 <= in_valid;
              end
           end
        end

     end
   endgenerate
endmodule
