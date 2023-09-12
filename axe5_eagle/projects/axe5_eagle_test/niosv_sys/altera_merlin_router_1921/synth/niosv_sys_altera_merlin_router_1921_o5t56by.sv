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
//    default_channel         -1
//    default_destid          0
//    default_rd_channel      3
//    default_wr_channel      2
//    has_default_slave       0
//    memory_aliasing_decode  0
//    output_name             niosv_sys_altera_merlin_router_1921_o5t56by
//    pkt_addr_h              67
//    pkt_addr_l              36
//    pkt_dest_id_h           111
//    pkt_dest_id_l           108
//    pkt_protection_h        115
//    pkt_protection_l        113
//    pkt_trans_read          71
//    pkt_trans_write         70
//    slaves_info             0:00000000000100:0x0:0x100000:write:1:0:0:1,0:00000000001000:0x0:0x100000:read:1:0:0:1,8:00000000010000:0x100000:0x110000:both:1:0:0:1,6:00000000000010:0x110000:0x120000:both:1:0:0:1,7:10000000000000:0x120000:0x120040:both:1:0:0:1,5:00000000000001:0x120040:0x120080:both:1:0:0:1,2:01000000000000:0x120080:0x120090:both:1:0:0:1,1:00100000000000:0x120090:0x1200a0:both:1:0:0:1,3:00010000000000:0x1200a0:0x1200b0:both:1:0:0:1,4:00001000000000:0x1200b0:0x1200c0:both:1:0:0:1,12:00000100000000:0x1200c0:0x1200d0:both:1:0:0:1,11:00000010000000:0x1200d0:0x1200e0:both:1:0:0:1,10:00000001000000:0x1200e0:0x1200f0:both:1:0:0:1,9:00000000100000:0x1200f0:0x120100:both:1:0:0:1
//    st_channel_w            14
//    st_data_w               134
// ------------------------------------------

module niosv_sys_altera_merlin_router_1921_o5t56by_default_decode
  #(
     parameter DEFAULT_CHANNEL = -1,
               DEFAULT_WR_CHANNEL = 2,
               DEFAULT_RD_CHANNEL = 3,
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


module niosv_sys_altera_merlin_router_1921_o5t56by
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
    localparam ADDR_RANGE = 64'h120100;
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
    wire [14-1 : 0] default_rd_channel;
    wire [14-1 : 0] default_wr_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire write_transaction;
    assign write_transaction = sink_data[PKT_TRANS_WRITE];
    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    niosv_sys_altera_merlin_router_1921_o5t56by_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_wr_channel   (default_wr_channel),
      .default_rd_channel   (default_rd_channel),
      .default_src_channel  ()
    );

    always @* begin
        src_data    = sink_data;
        src_channel = write_transaction ? default_wr_channel : default_rd_channel;
        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;

        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------

        // slave 0: [0x0, 0x100000) : sel [20:20]
        if ( {address[20:20],{20 {1'b0}}} == 21'h0  && write_transaction  ) begin
            src_channel = 14'b00000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
        end

        // slave 1: [0x0, 0x100000) : sel [20:20]
        if ( {address[20:20],{20 {1'b0}}} == 21'h0  && read_transaction  ) begin
            src_channel = 14'b00000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
        end

        // slave 2: [0x100000, 0x110000) : sel [20:16]
        if ( {address[20:16],{16 {1'b0}}} == 21'h100000   ) begin
            src_channel = 14'b00000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
        end

        // slave 3: [0x110000, 0x120000) : sel [20:16]
        if ( {address[20:16],{16 {1'b0}}} == 21'h110000   ) begin
            src_channel = 14'b00000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
        end

        // slave 4: [0x120000, 0x120040) : sel [20:6]
        if ( {address[20:6],{6 {1'b0}}} == 21'h120000   ) begin
            src_channel = 14'b10000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
        end

        // slave 5: [0x120040, 0x120080) : sel [20:6]
        if ( {address[20:6],{6 {1'b0}}} == 21'h120040   ) begin
            src_channel = 14'b00000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
        end

        // slave 6: [0x120080, 0x120090) : sel [20:4]
        if ( {address[20:4],{4 {1'b0}}} == 21'h120080   ) begin
            src_channel = 14'b01000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
        end

        // slave 7: [0x120090, 0x1200a0) : sel [20:4]
        if ( {address[20:4],{4 {1'b0}}} == 21'h120090   ) begin
            src_channel = 14'b00100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
        end

        // slave 8: [0x1200a0, 0x1200b0) : sel [20:4]
        if ( {address[20:4],{4 {1'b0}}} == 21'h1200a0   ) begin
            src_channel = 14'b00010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
        end

        // slave 9: [0x1200b0, 0x1200c0) : sel [20:4]
        if ( {address[20:4],{4 {1'b0}}} == 21'h1200b0   ) begin
            src_channel = 14'b00001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
        end

        // slave 10: [0x1200c0, 0x1200d0) : sel [20:4]
        if ( {address[20:4],{4 {1'b0}}} == 21'h1200c0   ) begin
            src_channel = 14'b00000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
        end

        // slave 11: [0x1200d0, 0x1200e0) : sel [20:4]
        if ( {address[20:4],{4 {1'b0}}} == 21'h1200d0   ) begin
            src_channel = 14'b00000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
        end

        // slave 12: [0x1200e0, 0x1200f0) : sel [20:4]
        if ( {address[20:4],{4 {1'b0}}} == 21'h1200e0   ) begin
            src_channel = 14'b00000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
        end

        // slave 13: [0x1200f0, 0x120100) : sel [20:4]
        if ( {address[20:4],{4 {1'b0}}} == 21'h1200f0   ) begin
            src_channel = 14'b00000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
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


