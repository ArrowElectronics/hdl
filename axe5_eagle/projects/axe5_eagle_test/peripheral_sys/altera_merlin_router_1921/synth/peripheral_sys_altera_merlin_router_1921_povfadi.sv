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


// $Id: //acds/rel/23.2/ip/iconnect/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2023/04/27 $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// the address.
//
// Also sets the binary-encoded destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

// ------------------------------------------
// Generation parameters:
//    decoder_type            0 (address decoder)
//    default_channel         7
//    default_destid          6
//    default_rd_channel      -1
//    default_wr_channel      -1
//    has_default_slave       0
//    memory_aliasing_decode  0
//    output_name             peripheral_sys_altera_merlin_router_1921_povfadi
//    pkt_addr_h              59
//    pkt_addr_l              36
//    pkt_dest_id_h           84
//    pkt_dest_id_l           82
//    pkt_protection_h        88
//    pkt_protection_l        86
//    pkt_trans_read          63
//    pkt_trans_write         62
//    slaves_info             6:10000000:0x0:0x10:both:1:0:0:1,5:01000000:0x10:0x20:both:1:0:0:1,4:00100000:0x20:0x30:both:1:0:0:1,3:00010000:0x30:0x40:both:1:0:0:1,0:00001000:0x40:0x50:both:1:0:0:1,2:00000100:0x50:0x60:both:1:0:0:1,7:00000010:0x60:0x68:read:1:0:0:1,1:00000001:0x68:0x70:both:1:0:0:1
//    st_channel_w            8
//    st_data_w               107
// ------------------------------------------

module peripheral_sys_altera_merlin_router_1921_povfadi_default_decode
  #(
     parameter DEFAULT_CHANNEL = 7,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 6 
   )
  (output [84 - 82 : 0] default_destination_id,
   output [8-1 : 0] default_wr_channel,
   output [8-1 : 0] default_rd_channel,
   output [8-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[84 - 82 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 8'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 8'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 8'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module peripheral_sys_altera_merlin_router_1921_povfadi
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [107-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [107-1    : 0] src_data,
    output reg [8-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 59;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 84;
    localparam PKT_DEST_ID_L = 82;
    localparam PKT_PROTECTION_H = 88;
    localparam PKT_PROTECTION_L = 86;
    localparam ST_DATA_W = 107;
    localparam ST_CHANNEL_W = 8;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 62;
    localparam PKT_TRANS_READ  = 63;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'h70;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;

    localparam REAL_ADDRESS_RANGE = OPTIMIZED_ADDR_H - PKT_ADDR_L;

      reg [PKT_ADDR_W-1 : 0] address;
      always @* begin
        address = {PKT_ADDR_W{1'b0}};
        address [REAL_ADDRESS_RANGE:0] = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];
      end   

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;
    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [8-1 : 0] default_src_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    peripheral_sys_altera_merlin_router_1921_povfadi_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_wr_channel   (),
      .default_rd_channel   (),
      .default_src_channel  (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;
        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;

        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------

        // slave 0: [0x0, 0x10) : sel [6:4]
        if ( {address[6:4],{4 {1'b0}}} == 7'h0   ) begin
            src_channel = 8'b10000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
        end

        // slave 1: [0x10, 0x20) : sel [6:4]
        if ( {address[6:4],{4 {1'b0}}} == 7'h10   ) begin
            src_channel = 8'b01000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
        end

        // slave 2: [0x20, 0x30) : sel [6:4]
        if ( {address[6:4],{4 {1'b0}}} == 7'h20   ) begin
            src_channel = 8'b00100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
        end

        // slave 3: [0x30, 0x40) : sel [6:4]
        if ( {address[6:4],{4 {1'b0}}} == 7'h30   ) begin
            src_channel = 8'b00010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
        end

        // slave 4: [0x40, 0x50) : sel [6:4]
        if ( {address[6:4],{4 {1'b0}}} == 7'h40   ) begin
            src_channel = 8'b00001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
        end

        // slave 5: [0x50, 0x60) : sel [6:4]
        if ( {address[6:4],{4 {1'b0}}} == 7'h50   ) begin
            src_channel = 8'b00000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
        end

        // slave 6: [0x60, 0x68) : sel [6:3]
        if ( {address[6:3],{3 {1'b0}}} == 7'h60  && read_transaction  ) begin
            src_channel = 8'b00000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
        end

        // slave 7: [0x68, 0x70) : sel [6:3]
        if ( {address[6:3],{3 {1'b0}}} == 7'h68   ) begin
            src_channel = 8'b00000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
        end
    end


    // --------------------------------------------------
    // Ceil(log2()) function
    // It's the 21st century. Consider using $clog2().
    // --------------------------------------------------
    function integer log2ceil;
        input reg[65:0] val;
        reg [65:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


