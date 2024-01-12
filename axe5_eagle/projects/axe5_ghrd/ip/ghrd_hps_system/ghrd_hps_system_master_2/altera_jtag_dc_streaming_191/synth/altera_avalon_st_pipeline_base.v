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


// (C) 2001-2018 Intel Corporation. All rights reserved.
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


// $File: //acds/rel/23.4/ip/iconnect/avalon_st/altera_avalon_st_pipeline_stage/altera_avalon_st_pipeline_base.v $
// $Revision: #1 $
// $Date: 2023/10/12 $
// $Author: psgswbuild $
//------------------------------------------------------------------------------

`timescale 1ns / 1ns

module altera_avalon_st_pipeline_base (
                                       clk,
                                       reset,
                                       in_ready,
                                       in_valid,
                                       in_data,
                                       out_ready,
                                       out_valid,
                                       out_data
                                       );

   parameter  SYMBOLS_PER_BEAT  = 1;
   parameter  BITS_PER_SYMBOL   = 8;
   parameter  PIPELINE_READY    = 1;
   parameter  SYNC_RESET        = 0;
   parameter  BACKPRESSURE_DURING_RESET = 0;
   localparam DATA_WIDTH = SYMBOLS_PER_BEAT * BITS_PER_SYMBOL;
   
   input clk;
   input reset;
   
   output in_ready;
   input  in_valid;
   input [DATA_WIDTH-1:0] in_data;
   
   input                  out_ready;
   output                 out_valid;
   output [DATA_WIDTH-1:0] out_data;
   
   reg                     full0;
   reg                     full1;
   reg [DATA_WIDTH-1:0]    data0;
   reg [DATA_WIDTH-1:0]    data1;

   assign out_valid = full1;
   assign out_data  = data1;    
   
   // Generation of internal reset synchronization
   reg internal_sclr;
   generate if (SYNC_RESET == 1) begin : rst_syncronizer
      always @ (posedge clk) begin
         internal_sclr <= reset;
      end
   end
   endgenerate

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
       
        if (SYNC_RESET == 0) begin : async_rst0 
           always @(posedge clk or posedge reset) begin
              if (reset) begin
                 full0    <= BACKPRESSURE_DURING_RESET ? 1'b1 : 1'b0;
                 full1    <= 1'b0;
              end else begin
                 // out of reset. 
                 if(~full1 & full0)begin
                     full0 <= 1'b0;
                 end

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
       end // async_rst0
       else begin // sync_rst0
           always @(posedge clk ) begin
              if (internal_sclr) begin
                 full0    <= BACKPRESSURE_DURING_RESET ? 1'b1 : 1'b0;
                 full1    <= 1'b0;
              end else begin
                 // out of reset. 
                 if(~full1 & full0)begin
                     full0 <= 1'b0;
                 end

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
       end // sync_rst0
     end 
   else 
     begin : UNREGISTERED_READY_PLINE
	
	// in_ready will be a pass through of the out_ready signal as it is not registered
	assign in_ready = (~full1) | out_ready;

   if (SYNC_RESET == 0) begin : async_rst1	
	   always @(posedge clk or posedge reset) begin
	      if (reset) begin
	         data1 <= 'b0;
	         full1 <= BACKPRESSURE_DURING_RESET ? 1'b1 : 1'b0;
	      end
	      else begin
	         if (in_ready) begin
	   	 data1 <= in_data;
	   	 full1 <= in_valid;
	         end
	      end
	   end
   end // async_rst1
   else begin // sync_rst1
      always @(posedge clk ) begin
	      if (internal_sclr) begin
	         data1 <= 'b0;
	         full1 <= BACKPRESSURE_DURING_RESET ? 1'b1 : 1'b0;
	      end
	      else begin
	         if (in_ready) begin
	   	 data1 <= in_data;
	   	 full1 <= in_valid;
	         end
	      end
	   end
	end // sync_rst1	
     end
   endgenerate
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Gwt3whRcE3+dmXyqrSB7tq2BawD3oh9aWud7Z4eAN187O43IWvM/KG8cuzSO3rcLdOg/6M8a5bUzV8fSCamrY3rLfHnQy43nef+FViJgCalid4DqTidvdzU87e5ZQ/v7HVm3olDBJc6LsbYrqiDrF0RkIcqQRi4zpc6Rtw0M2aW8FBhW2R9GBM/OcdpnaI+Km4xIFjjLOMKR0kXUH+3JyiE6l+btThmGIC55ugx3xhq44VZkobu5eSbP+jXiwl6Pk8pab5vxLc5gJjoC5hxF6g3T7o0jSoio0d+SeH8ce/DjEucOVMccxQc722EAjxVN22AeAbLtOJvxP8xlyBUWHKHz9qv7PiLvF+C8gL+4TKImpldkKdWQ2F7TTLFukSkgT1VEyVeu+jOP1MUYRFrXbcigfOIJoKIdufc6TW22+AGEuLBsgESIQPkD/xw4YYMu6eV/mISyDroWW6ltwVS7II3RoXdowcepMvUhC6d7aPFHLAUnk4wvJrNftognSuLCNg7EgPlId/x4QANCIiqwaIQlW7fcdigI6lLrzICbV6WuTUTPJPYLnyD5jQc49hUMsrVV97Kg6p7D4PCA66mPkgi5ymVCBJNih/nFab1lu+m5/2aV05mFXirMHQSxdumIpOjRS19YXl+lMuQ0FRmO41C5633/5xMbs3e1JCjmDPCdR5TVY3YzqV114CejjdNFKvPVdl3tlWvyiyEqNXVpUJ1oEENTRfO9ytYSPKK8YuFZi9dxBdaQrwEp5UGT8Uwd0mYp5BxqESnzid4NKZfMUI7O39SOEwL93FxfDh+0YqXegEUN5IhAOMvaq2Hx+XpZ01eNL8GXjaiAdT1CUz+ZHhF6GpBQ8jL80Q/6qzWiM1BW+0fh/PP0WCt8gZsurQlqJ/ywmMJYpneH/OyVsqF5LKtLRmf7+OE8IWNLUdzHLeL6ibdMt3wnu5J5MoDXXe5+uFJfB4Kl0VLreozAT8Jd76MchtQ0z5myXLux4K55Siuh7bbkrVLhak4JsThBRqY5"
`endif