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


// $Id: //acds/rel/23.4/ip/iconnect/merlin/altera_merlin_traffic_limiter/altera_merlin_reorder_memory.sv#1 $
// $Revision: #1 $
// $Date: 2023/10/12 $

// ------------------------------------------------------------------
// Merlin Order Memory: this stores responses from slave
// and do reorder. The memory structure is normal memory
// with many segments for different responses that master
// can handle.
// The number of segment is the number of MAX_OUTSTANDING_RESPONSE
// ------------------------------------------------------------------

`timescale 1 ns / 1 ns
module altera_merlin_reorder_memory 
#(
   parameter  DATA_W         = 32,
              ADDR_H_W       = 4, // width to represent how many segments
              ADDR_L_W       = 4,
              VALID_W        = 4,
              NUM_SEGMENT    = 4,
              SYNC_RESET     = 0,
              DEPTH          = 16,
              USE_FIFO       = 0

)
    
(
    // -------------------
    // Clock
    // -------------------
    input                       clk,
    input                       reset,
    // -------------------
    // Signals
    // -------------------
    input [DATA_W - 1 : 0]      in_data,
    input                       in_valid,
    output                      in_ready,
 
    output reg [DATA_W - 1 : 0] out_data,
    output reg                  out_valid,
    input                       out_ready,
    // --------------------------------------------
    // wr_segment: select write portion of memory
    // rd_segment: select read portion of memory
    // --------------------------------------------
    input [ADDR_H_W - 1 : 0]    wr_segment,
    input [ADDR_H_W - 1 : 0]    rd_segment
 
);

    // -------------------------------------
    // Local parameter
    // -------------------------------------
    localparam SEGMENT_W  = ADDR_H_W;
    
    wire [ADDR_H_W + ADDR_L_W - 1 : 0] mem_wr_addr;
    reg [ADDR_H_W + ADDR_L_W - 1 : 0]  mem_rd_addr;
    wire [ADDR_L_W - 1 : 0]            mem_wr_ptr;
    wire [ADDR_L_W - 1 : 0]            mem_rd_ptr;
    reg [ADDR_L_W - 1 : 0]             mem_next_rd_ptr;
    reg [DATA_W - 1 : 0]               out_payload;
    
    wire [NUM_SEGMENT - 1 : 0]         pointer_ctrl_in_ready;
    wire [NUM_SEGMENT - 1 : 0]         pointer_ctrl_in_valid;
    wire [NUM_SEGMENT - 1 : 0]         pointer_ctrl_out_valid;
    wire [NUM_SEGMENT - 1 : 0]         pointer_ctrl_out_ready;
    wire [ADDR_L_W - 1 : 0]            pointer_ctrl_wr_ptr [NUM_SEGMENT];
    wire [ADDR_L_W - 1 : 0]            pointer_ctrl_rd_ptr [NUM_SEGMENT];
    wire [ADDR_L_W - 1 : 0]            pointer_ctrl_next_rd_ptr [NUM_SEGMENT];
    
    
    // ---------------------------------
    // Memory storage
    // ---------------------------------
    (* ramstyle="no_rw_check" *) reg [DATA_W - 1 : 0]               mem [DEPTH - 1 : 0];
 always @(posedge clk) begin
  if (in_valid && in_ready)
   mem[mem_wr_addr] = in_data;
        out_payload = mem[mem_rd_addr];
 end
   
    // ---------------------------------
    // Memory addresses
    // ---------------------------------
    assign mem_wr_ptr       = pointer_ctrl_wr_ptr[wr_segment];

    assign mem_wr_addr  = {wr_segment, mem_wr_ptr};

    // ---------------------------------------------------------------------------
    // Bcos want, empty latency, mean assert read the data will appear on out_data. 
    // And need to jump around different segment of the memory. 
    // So when seeing endofpacket for this current segment, the read address
    // will jump to next segment at first read address, so that the data will be ready
    // it is okay to jump to next segment as this is the sequence of all transaction
    // and they just increment. (standing at segment 0, then for sure next segment 1)
    // ----------------------------------------------------------------------------
    wire endofpacket;
    wire [ADDR_H_W - 1: 0] next_rd_segment;
    assign next_rd_segment  = ((rd_segment + 1'b1) == NUM_SEGMENT) ? '0 : rd_segment + 1'b1;

    genvar j;
    generate 
    if (USE_FIFO == 1) begin
        reg [ADDR_H_W-1:0]rd_segment_d1;
        always@(posedge clk) begin
        rd_segment_d1 <= rd_segment;
        end
    
        always_comb begin
          out_valid = (rd_segment_d1 == NUM_SEGMENT) ? 1'b0 :  pointer_ctrl_out_valid[rd_segment_d1];  
          out_data  = out_payload;
        end
        assign endofpacket  = out_data[0];
        always_comb  begin
          mem_next_rd_ptr  = pointer_ctrl_next_rd_ptr[rd_segment];
          mem_rd_addr      = {rd_segment, mem_next_rd_ptr};
        end
          
       // ---------------------------------
       // Control signals for each segment
       // ---------------------------------
        for (j = 0; j < NUM_SEGMENT; j = j + 1)   begin : pointer_signal
           assign pointer_ctrl_in_valid[j]  = (wr_segment == j) && in_valid;
           assign pointer_ctrl_out_ready[j] = (rd_segment_d1 == j) && out_ready;
        end
    end
    else begin
        always_comb     begin
               out_data  = out_payload;
               out_valid = pointer_ctrl_out_valid[rd_segment];
           end
        assign endofpacket  = out_payload[0];
        always_comb     begin
           if (out_valid && out_ready && endofpacket)   begin
               mem_next_rd_ptr  = pointer_ctrl_rd_ptr[next_rd_segment];
               mem_rd_addr      = {next_rd_segment, mem_next_rd_ptr};
           end
           else    begin
               mem_next_rd_ptr  = pointer_ctrl_next_rd_ptr[rd_segment];
               mem_rd_addr      = {rd_segment, mem_next_rd_ptr};
           end
        end
       
       // ---------------------------------
       // Control signals for each segment
       // ---------------------------------
       for (j = 0; j < NUM_SEGMENT; j = j + 1)
       begin : pointer_signal
            assign pointer_ctrl_in_valid[j]  = (wr_segment == j) && in_valid;
            assign pointer_ctrl_out_ready[j]  = (rd_segment == j) && out_ready;
                   
       end
    end
    endgenerate 
    // ---------------------------------
    // Output signals
    // ---------------------------------
    assign in_ready  = pointer_ctrl_in_ready[wr_segment];
    
    
    // ---------------------------------
    // Seperate write and read pointer
    // for each segment in memory
    // ---------------------------------
    genvar i;
    generate
        for (i = 0; i < NUM_SEGMENT; i = i + 1)
            begin : each_segment_pointer_controller
      memory_pointer_controller 
                 #(
                   .SYNC_RESET (SYNC_RESET),
                   .ADDR_W   (ADDR_L_W)
                   ) reorder_memory_pointer_controller
                 (
                  .clk              (clk),
                  .reset            (reset),                  
                  .in_ready         (pointer_ctrl_in_ready[i]),
                  .in_valid         (pointer_ctrl_in_valid[i]),
                  .out_ready        (pointer_ctrl_out_ready[i]),
                  .out_valid        (pointer_ctrl_out_valid[i]),                  
                  .wr_pointer       (pointer_ctrl_wr_ptr[i]),
                  .rd_pointer       (pointer_ctrl_rd_ptr[i]),
                  .next_rd_pointer  (pointer_ctrl_next_rd_ptr[i])
                  );
            end // block: each_segment_pointer_controller
    endgenerate
endmodule


module memory_pointer_controller 
#(
    parameter SYNC_RESET = 0,
    parameter ADDR_W   = 4
)
(
    // -------------------
    // Clock
    // -------------------
    input                   clk,
    input                   reset,
    // -------------------
    // Signals
    // -------------------
    output reg              in_ready,
 input                   in_valid,
    input                   out_ready,
    output reg              out_valid,
 // -------------------------------
    // Output write and read pointer
    // -------------------------------
 output [ADDR_W - 1 : 0] wr_pointer,
 output [ADDR_W - 1 : 0] rd_pointer,
    output [ADDR_W - 1 : 0] next_rd_pointer
);

 reg [ADDR_W - 1 : 0]  incremented_wr_ptr;
 reg [ADDR_W - 1 : 0]  incremented_rd_ptr;
 reg [ADDR_W - 1 : 0]  wr_ptr;
 reg [ADDR_W - 1 : 0]  rd_ptr;
 reg [ADDR_W - 1 : 0]  next_wr_ptr;
 reg [ADDR_W - 1 : 0]  next_rd_ptr;
 reg full, empty, next_full, next_empty;
 reg read, write, internal_out_ready, internal_out_valid;
 
 assign incremented_wr_ptr = wr_ptr + 1'b1;
 assign incremented_rd_ptr = rd_ptr + 1'b1;
 assign next_wr_ptr =  write ?  incremented_wr_ptr : wr_ptr;
 assign next_rd_ptr = read ? incremented_rd_ptr : rd_ptr;
 assign wr_pointer  = wr_ptr;
   assign rd_pointer  = rd_ptr;
   assign next_rd_pointer  = next_rd_ptr;
   
   //Generate synchronous reset 
   reg internal_sclr;
   generate if (SYNC_RESET == 1) begin : rst_syncronizer
      always @ (posedge clk) begin
         internal_sclr <= reset;
      end
   end
   endgenerate
 
 // -------------------------------
    // Define write and read signals
    // --------------------------------
    // internal read, if it has any valid data
    // and output are ready to accepts data then a read will be performed.
    // -------------------------------
   assign read  = internal_out_ready && !empty;
   assign write = in_ready && in_valid;
     generate
     if (SYNC_RESET == 0) begin : aysnc_reg0 
      always_ff @(posedge clk or posedge reset) 
             begin
      if (reset) 
                     begin
    wr_ptr <= 0;
    rd_ptr <= 0;
   end 
                 else 
                     begin
    wr_ptr <= next_wr_ptr;
    rd_ptr <= next_rd_ptr;
   end
   end
      end // async_reg0
      else begin // sync_reg0 

         always_ff @(posedge clk ) 
             begin
      if (internal_sclr) 
                     begin
    wr_ptr <= 0;
    rd_ptr <= 0;
   end 
                 else 
                     begin
    wr_ptr <= next_wr_ptr;
    rd_ptr <= next_rd_ptr;
   end
   end
      end // sync_reg0
      endgenerate
    // ---------------------------------------------------------------------------
 // Generate full/empty signal for memory
    // if read and next read pointer same as write, set empty, write will clear empty
    // if write and next write pointer same as read, set full, read will clear full
    // -----------------------------------------------------------------------------
 always_comb 
        begin
            next_full = full;
            next_empty = empty;
      if (read && !write) 
                begin
    next_full = 1'b0;
    if (incremented_rd_ptr == wr_ptr)
     next_empty = 1'b1;
                end
      if (write && !read) 
                begin
                    next_empty = 1'b0;
                    if (incremented_wr_ptr == rd_ptr)
                        next_full = 1'b1;
   end
     end // always_comb
   generate 
    if (SYNC_RESET == 0) begin : aysnc_reg1
         always_ff @(posedge clk or posedge reset) 
             begin
                 if (reset) 
                     begin
                         empty <= 1;
                         full  <= 0;
                     end
                 else 
                     begin 
                         empty <= next_empty;
                         full  <= next_full;
                     end
              end

    end // async_reg1
 
    else begin //sync_reg1

       always_ff @(posedge clk ) 
            begin
                if (internal_sclr) 
                    begin
                        empty <= 1;
                        full  <= 0;
                    end
                else 
                    begin 
                        empty <= next_empty;
                        full  <= next_full;
                  end
            end
     end //sync_reg1
     endgenerate
 // --------------------
    // Control signals
    // --------------------
    always_comb
        begin
            in_ready            = !full;
            out_valid           = !empty;
            internal_out_ready  = out_ready;
  end // always_comb
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Oy3QR2mKNgmhEfGL3SW6HQfCmb79srhD44IOaAtUlH8/pTgcm9t2UrXActBjPTmN4Bv4NNlGdb4P/mc3rtoPRgAFqt2AVMJX3s0AQGiv7LFugS4Idf0kbtvb54pTXH+zn++Y2B/CghSRss/8348bn4PK6K78kVges9jyNixGVIibFRB8G5IWj5cfOPmgt+ydiX4ZjY+CtMVd406Jcd+oQRODgD4T+W1CBwJueCo1/aI8dmTANbrIbUC+neQMwRi1hjAhk9apqk3334R+8JzXXE5Fcwj1ueQ7iLEKnFT8ITl2ojj+t9bOl1NatkDxuoMe8lcDtOKe5bF1HZaffqzJrPkR7uKetZ7TcTbh3a9CGIUePlSe6tHqDSZlFDz66zYzewlXPWZ5obolWtYE+6LIYl3ntcIldHHZGQWZYGXYDnadIF6me8IPEEKClukKY+KedrXjo0YcN7CFvVitLQjtMCEgAEEwX/ENIyxw82WJ5dAcqRfUfML1tS/NJi1vzG8GKoqvi3O9Yzqfh+jTaUrY7vtVc2QBrvMBmyWnFCYdA8L6bwWG4qeLADYjQ0rkiuFO58WrkjFcioxLdPwu8b56RGrQcYLtXKqT+Ug56dPb//Wzrmsw94+D4YbZJgIkmvFuVtvIoctWD3/JSFFGEgemN57h4LDFXzVZE4swlHPlUkY5k+GeIpEeSIyMdEKrFxzmpvmjWrOSq1y8RUoD4aQidFVISly07g2rsps6XM08a/OeGGAft7mljvj8FMW/TqJd9RSogb3T5ob43Evllc08NCzzO8vYGqkGeUwDP8/wqf4HCI2PMuoDY2Mfeo01UmTy1kbB4SFOeHC6wS4kl3S3yvm7Gj87JARrPLPALud66L63oAV/iq+7KUBLP+1vB5F5uVEyNoSyfOQflDqmw+g8X3ZIZQD6Fc0i+roHOtGDuS7npREAqbwKn3W+LXKRY5r3D5B2MLOTGuPQPsLstpmaEPJUXSrV9KZwEUnvVv5gOlCaxKsDdh1b4Qwet9MVbk4S"
`endif