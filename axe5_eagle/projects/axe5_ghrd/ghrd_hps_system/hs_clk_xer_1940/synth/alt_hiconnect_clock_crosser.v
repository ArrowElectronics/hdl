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


// $File: //acds/prototype/mm_s10/ip/avalon_st/altera_avalon_st_handshake_clock_crosser/altera_avalon_st_clock_crosser.v $
// $Revision: #4 $
// $Date: 2015/06/18 $
// $Author: nkrueger $
//------------------------------------------------------------------------------
 
`timescale 1ns / 1ns
`default_nettype none

module alt_hiconnect_clock_crosser (
                                 in_clk,
                                 in_reset,
                                 in_ready,
                                 in_valid,
                                 in_data,
                                 out_clk,
                                 out_reset,
                                 out_ready,
                                 out_valid,
                                 out_data
                                );

  parameter  SYMBOLS_PER_BEAT    = 1;
  parameter  BITS_PER_SYMBOL     = 8;
  parameter  FORWARD_SYNC_DEPTH  = 2;
  parameter  BACKWARD_SYNC_DEPTH = 2;
  parameter  USE_OUTPUT_PIPELINE = 1;
 
  localparam  DATA_WIDTH = SYMBOLS_PER_BEAT * BITS_PER_SYMBOL;
  localparam DRC_WAIVER_CDC_50005 = {"-name DESIGN_ASSISTANT_EXCLUDE \"CDC-50005\" "};
  localparam DRC_WAIVER_CDC_50006 = {"-name DESIGN_ASSISTANT_EXCLUDE \"CDC-50006\" "};
  localparam DRC_WAIVER_OUT_DATA_BUFFER = { DRC_WAIVER_CDC_50005,";",DRC_WAIVER_CDC_50006}; 

  input wire                  in_clk;
  input wire                  in_reset;
  output wire                 in_ready;
  input wire                  in_valid;
  input wire [DATA_WIDTH-1:0] in_data;

  input wire                   out_clk;
  input wire                   out_reset;
  input wire                   out_ready;
  output wire                  out_valid;
  output wire [DATA_WIDTH-1:0] out_data;

  // Data is guaranteed valid by control signal clock crossing.  Cut data
  // buffer false path.
(* altera_attribute = {"-name SUPPRESS_DA_RULE_INTERNAL \"D101,D102\""}*) reg [DATA_WIDTH-1:0] in_data_buffer;
(* altera_attribute = DRC_WAIVER_OUT_DATA_BUFFER *) reg [DATA_WIDTH-1:0] out_data_buffer;


  reg                     in_data_toggle;
  wire                    in_data_toggle_returned;
  wire                    out_data_toggle;
  reg                     out_data_toggle_flopped, out_data_toggle_1, out_data_toggle_flopped_n;

  wire                    take_in_data;
  wire                    out_data_taken;

  wire                    out_valid_internal;
  wire                    out_ready_internal;   
 
  // Synchronous resets
  reg                     internal_out_sclr;
  reg                     internal_in_sclr;
  wire                    reset_merged;
  wire                    in_reset_merged;
  wire                    out_reset_merged;
 
  assign in_ready = (in_data_toggle_returned ^ in_data_toggle);
  assign take_in_data = in_valid & in_ready;
  assign out_valid_internal = (out_data_toggle_1 ^ out_data_toggle_flopped);
  assign out_data_taken = out_ready_internal & out_valid_internal;
  
 
   
   always @(posedge out_clk) begin
      internal_out_sclr <= out_reset;
   end
    
   always @(posedge in_clk) begin
      internal_in_sclr  <= in_reset;
   end
 
 assign reset_merged  = internal_in_sclr  | internal_out_sclr;
 
        altera_reset_synchronizer
        #(
            .DEPTH      (2),
            .ASYNC_RESET(1'b1)
        )
        alt_rst_req_sync_in_rst
        (
            .clk        (in_clk),
            .reset_in   (reset_merged),
            .reset_out  (in_reset_merged)
        );
 
        altera_reset_synchronizer
        #(
            .DEPTH      (2),
            .ASYNC_RESET(1'b1)
        )
        alt_rst_req_sync_out_rst
        (
            .clk        (out_clk),
            .reset_in   (reset_merged),
            .reset_out  (out_reset_merged)
        );
 
  always @(posedge in_clk) begin
    if (in_reset_merged) begin
      in_data_toggle <= 1'b0;
    end else begin
      if (take_in_data) begin
        in_data_toggle <= ~in_data_toggle;
      end
    end //internal_in_sclr
  end //in_clk always block
  
 
  always @(posedge in_clk) begin
    if (take_in_data) begin
        in_data_buffer <= in_data;
    end
  end
  
  always @(posedge out_clk) begin
    out_data_buffer <= in_data_buffer;
  end
 
always @(posedge out_clk) begin
    if (out_reset_merged) begin
      out_data_toggle_1 <= 1'b0;
    end else begin
       out_data_toggle_1 <= out_data_toggle;
     end //internal_out_sclr
  end //out_clk always block
 
  always @(posedge out_clk) begin
    if (out_reset_merged) begin
      out_data_toggle_flopped <= 1'b0;
    end else begin
      if (out_data_taken) begin
        out_data_toggle_flopped <= out_data_toggle_1;
      end
    end //internal_out_sclr
  end //out_clk always block


  always @(posedge out_clk) begin //for in_ready
    if (out_reset_merged) begin
      out_data_toggle_flopped_n <= 1'b0;
    end else begin
      out_data_toggle_flopped_n <= ~out_data_toggle_flopped;
      end 
  end 

  altera_std_synchronizer #(.depth(FORWARD_SYNC_DEPTH+1)) in_to_out_synchronizer (
				     .clk(out_clk),
				     .reset_n(~out_reset_merged),
				     .din(in_data_toggle),
				     .dout(out_data_toggle)
				     );
  
  altera_std_synchronizer #(.depth(BACKWARD_SYNC_DEPTH+1)) out_to_in_synchronizer (
				     .clk(in_clk),
				     .reset_n(~in_reset_merged),
				     .din(out_data_toggle_flopped_n),
				     .dout(in_data_toggle_returned)
				     );

  generate if (USE_OUTPUT_PIPELINE == 1) begin

      alt_hiconnect_pipeline_base 
      #(
         .BITS_PER_SYMBOL(BITS_PER_SYMBOL),
         .SYMBOLS_PER_BEAT(SYMBOLS_PER_BEAT)
      ) output_stage (
         .clk(out_clk),
         .reset(out_reset_merged),
         .in_ready(out_ready_internal),
         .in_valid(out_valid_internal),
         .in_data(out_data_buffer),
         .out_ready(out_ready),
         .out_valid(out_valid),
         .out_data(out_data)
      );

  end else begin

      assign out_valid = out_valid_internal;
      assign out_ready_internal = out_ready;
      assign out_data = out_data_buffer;

  end

  endgenerate

endmodule

`default_nettype wire
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "oCGSH374621Hb8Vdx1zpbGFDRRlR/iQFxq4u9eFZ1vs535komH6o0gG3DAt3GoHyIEaf6dyx8DLuUuqMQslQs9etyMjXbnhsqJKBH0EjctlI8aAkXUqpZV/kCXYGyVHmbrsCK0w9cX9s5bqb0g2KbMqkWxOJnTmwkTBX8Q2A0c90YP13D4uZ9IEEfvQhN+GXXVTb7xbFtY0q1JjH/1OB6YQdi+xjgtxcotYzs1N1gR2MIbzJbUE5YTOaE1k2RKyvY+uNiRUAaNeaDpedCymfTT/HWE1ohp5y3A+POmrIejxj/CmldCbqzyswGYP5U1wpvWA8xHmNUxdocwezDTN10p+60v6PnBDUmdI7q6PEOMWT1eYd0zSCFSAoF2/886YDJ/7fR2q86dTM8S/PZ+gOiqUL3YuKRjT2gyw3gOLiZdto+Y0lnRmH4hcmkxSGaGmPOY2ezqiVhTC/wilaVGZqN33K1XnXvlSNgXuJA9n18wo5fDSijwM1HSobSa5MuuPlp93NDvgn2WAj4efgsZuVv1ed56OjrtxXwot4v9mv/OGZ3z4s3/Zb6k+V6kbPNFQjTGdJMdfepqXtVBsvppUu37VL9gsZRuKkiPp4/SdDbNx03sZNgI0VEoXUlCle5VqbwXgFy0EFKcpJQ8Xvg1tKiiZekLjZ/fHNEhp3OUeTJC1kM5+A3OWNagNpcg6k2wHXqt6Z6rgr8VpJ8qCCHUngRB0SckMJHPK7emBPw2vDEOmJp03/M8LQJUpOPvR7LfvGCyQeLonx6U/Id6yeTX/D5MpOAMTWkz2wLZMpU4vdczB1t3ceCH9jN+fSFwVKa0k4lr8B6aMm2sTH++HMD6et6XyFac3att0a4SuM86mJCNvOUWKlZS63Olju0Id+BHzxsWg62WhduxArOBnJ95ymlxr8XrBXEZuns/QruXfb+hz8c/sXeP+ax59WgdIO9VdbZCfmVKejq3u+JSo6kIbugoFOLBVkiO5bG+7L99i/guJHa2DquEnSaXXI0sQOTvff"
`endif