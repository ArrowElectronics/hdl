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
//    default_channel         2
//    default_destid          0
//    default_rd_channel      -1
//    default_wr_channel      -1
//    has_default_slave       0
//    memory_aliasing_decode  0
//    output_name             niosv_sys_altera_merlin_router_1921_z2xxbwy
//    pkt_addr_h              67
//    pkt_addr_l              36
//    pkt_dest_id_h           111
//    pkt_dest_id_l           108
//    pkt_protection_h        115
//    pkt_protection_l        113
//    pkt_trans_read          71
//    pkt_trans_write         70
//    slaves_info             0:0000000000100:0x0:0x80000000:write:1:0:0:1,7:0000000001000:0x80000000:0x80010000:both:1:0:0:1,6:1000000000000:0x80010000:0x80010040:both:1:0:0:1,5:0000000000010:0x80010040:0x80010080:both:1:0:0:1,2:0100000000000:0x80010080:0x80010090:both:1:0:0:1,1:0010000000000:0x80010090:0x800100a0:both:1:0:0:1,3:0001000000000:0x800100a0:0x800100b0:both:1:0:0:1,4:0000100000000:0x800100b0:0x800100c0:both:1:0:0:1,11:0000010000000:0x800100c0:0x800100d0:both:1:0:0:1,10:0000001000000:0x800100d0:0x800100e0:both:1:0:0:1,9:0000000100000:0x800100e0:0x800100f0:both:1:0:0:1,8:0000000010000:0x800100f0:0x80010100:both:1:0:0:1,12:0000000000001:0x80010100:0x80010108:both:1:0:0:1
//    st_channel_w            14
//    st_data_w               134
// ------------------------------------------

module niosv_sys_altera_merlin_router_1921_z2xxbwy_default_decode
  #(
     parameter DEFAULT_CHANNEL = 2,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 0 
   )
  (output [111 - 108 : 0] default_destination_id,
   output [14-1 : 0] default_wr_channel,
   output [14-1 : 0] default_rd_channel,
   output [14-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[111 - 108 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 14'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 14'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 14'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module niosv_sys_altera_merlin_router_1921_z2xxbwy
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
    input  [134-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [134-1    : 0] src_data,
    output reg [14-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 67;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 111;
    localparam PKT_DEST_ID_L = 108;
    localparam PKT_PROTECTION_H = 115;
    localparam PKT_PROTECTION_L = 113;
    localparam ST_DATA_W = 134;
    localparam ST_CHANNEL_W = 14;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 70;
    localparam PKT_TRANS_READ  = 71;

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
    localparam ADDR_RANGE = 64'h80010108;
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
    wire [14-1 : 0] default_src_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire write_transaction;
    assign write_transaction = sink_data[PKT_TRANS_WRITE];


    niosv_sys_altera_merlin_router_1921_z2xxbwy_default_decode the_default_decode(
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

        // slave 0: [0x0, 0x80000000) : sel [31:31]
        if ( {address[31:31],{31 {1'b0}}} == 32'h0  && write_transaction  ) begin
            src_channel = 14'b0000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
        end

        // slave 1: [0x80000000, 0x80010000) : sel [31:16]
        if ( {address[31:16],{16 {1'b0}}} == 32'h80000000   ) begin
            src_channel = 14'b0000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
        end

        // slave 2: [0x80010000, 0x80010040) : sel [31:6]
        if ( {address[31:6],{6 {1'b0}}} == 32'h80010000   ) begin
            src_channel = 14'b1000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
        end

        // slave 3: [0x80010040, 0x80010080) : sel [31:6]
        if ( {address[31:6],{6 {1'b0}}} == 32'h80010040   ) begin
            src_channel = 14'b0000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
        end

        // slave 4: [0x80010080, 0x80010090) : sel [31:4]
        if ( {address[31:4],{4 {1'b0}}} == 32'h80010080   ) begin
            src_channel = 14'b0100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
        end

        // slave 5: [0x80010090, 0x800100a0) : sel [31:4]
        if ( {address[31:4],{4 {1'b0}}} == 32'h80010090   ) begin
            src_channel = 14'b0010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
        end

        // slave 6: [0x800100a0, 0x800100b0) : sel [31:4]
        if ( {address[31:4],{4 {1'b0}}} == 32'h800100a0   ) begin
            src_channel = 14'b0001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
        end

        // slave 7: [0x800100b0, 0x800100c0) : sel [31:4]
        if ( {address[31:4],{4 {1'b0}}} == 32'h800100b0   ) begin
            src_channel = 14'b0000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
        end

        // slave 8: [0x800100c0, 0x800100d0) : sel [31:4]
        if ( {address[31:4],{4 {1'b0}}} == 32'h800100c0   ) begin
            src_channel = 14'b0000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
        end

        // slave 9: [0x800100d0, 0x800100e0) : sel [31:4]
        if ( {address[31:4],{4 {1'b0}}} == 32'h800100d0   ) begin
            src_channel = 14'b0000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
        end

        // slave 10: [0x800100e0, 0x800100f0) : sel [31:4]
        if ( {address[31:4],{4 {1'b0}}} == 32'h800100e0   ) begin
            src_channel = 14'b0000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
        end

        // slave 11: [0x800100f0, 0x80010100) : sel [31:4]
        if ( {address[31:4],{4 {1'b0}}} == 32'h800100f0   ) begin
            src_channel = 14'b0000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
        end

        // slave 12: [0x80010100, 0x80010108) : sel [31:3]
        if ( {address[31:3],{3 {1'b0}}} == 32'h80010100   ) begin
            src_channel = 14'b0000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
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


