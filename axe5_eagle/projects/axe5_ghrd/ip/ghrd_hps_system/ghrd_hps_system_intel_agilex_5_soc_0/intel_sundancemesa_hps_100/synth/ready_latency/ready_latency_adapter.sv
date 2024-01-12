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


`timescale 1ns / 100ps

// this module has zero ready latency input and non zero latency output


module ready_latency_adapter # (
 parameter READY_LATENCY_OUT = 2,
 parameter PAYLOAD_WIDTH = 256,
 parameter LOG_DEPTH = 3


) (  
 output logic         in_ready,
 input  logic            in_valid,
 input  logic   [PAYLOAD_WIDTH-1: 0]  in_data,
 // Interface: out
 input  logic             out_ready,
 output logic          out_valid,
 output logic [PAYLOAD_WIDTH-1: 0] out_data,
  // Interface: clk
 input logic          clk,
 // Interface: reset
 input logic           reset

 /*AUTOARG*/);

   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------
   
   logic [PAYLOAD_WIDTH-1:0]   in_payload;
   logic [PAYLOAD_WIDTH-1:0]   out_payload;
   logic            in_ready_wire;
   logic            out_valid_wire;
   logic [2:0]      fifo_fill;
   logic    rdreq;
   logic empty;   

   logic [READY_LATENCY_OUT-1:0] in_ready_dly_reg;
   logic in_ready_dly;
   assign in_ready_dly = (READY_LATENCY_OUT > 0) ? in_ready_dly_reg[0] : in_ready;
 
   localparam DEPTH = 2 ** LOG_DEPTH -1 ;

   // ---------------------------------------------------------------------
   //| Payload Mapping
   // ---------------------------------------------------------------------
   always @* begin
     in_payload = {in_data};
     {out_data} = out_payload;
   end

   // ---------------------------------------------------------------------
   //| FIFO
   // ---------------------------------------------------------------------                           
    scfifo_s # (
      .LOG_DEPTH (LOG_DEPTH),
      .WIDTH (PAYLOAD_WIDTH),
      .ALMOST_FULL_VALUE (DEPTH-1),
      .SHOW_AHEAD (1),
      .FAMILY ("Agilex")
    ) fifo_inst ( 
       .clock        (clk),
       .aclr       (reset),
       .sclr (1'b0),
       //.in_ready   (),
       .wrreq  (in_valid && in_ready_dly),      
       .data    (in_payload),
      //.out_ready  (out_ready),
       .rdreq      (rdreq),
       .q (out_payload),
       .usedw (fifo_fill),
       .empty (empty),
       .full (full),
       .almost_empty (),
       .almost_full ()
       );

   // ---------------------------------------------------------------------
   //| Ready & valid signals.
   // ---------------------------------------------------------------------
   always @* begin
      in_ready = ( DEPTH- fifo_fill > READY_LATENCY_OUT);
   end

    always @(posedge clk) begin
        in_ready_dly_reg[READY_LATENCY_OUT-1] <= in_ready;
        for (int i = 0; i < READY_LATENCY_OUT - 1; i++) begin
            in_ready_dly_reg[i] <= in_ready_dly_reg[i+1];
        end
    end

assign rdreq = out_ready && !empty;

assign out_valid = !empty;


endmodule


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "0SkZjS+9fJ+j5t/1eRLDSmYlrEk+/fn1n04GXW77wQ6zIb2xNDDUSUKHuq8xgUU/x5fl5HnvXE40EQiNtcreHpQdBYyewrwz5u+N8AriKl/2eSG4Sud1BOsd+Be6VZ8eApDF6OzCBILugtUNPEmRHtAKu+6veVGtcI3VxpZp3VYIvTgRcLreIH1gSgJC0aDXHf3J/4bUCmCuzXKdIIT7JazIrfwbYZHtjFylQuGPvob16T9TxLyzWk1X3eYjk252FkbxweKQ6C9qyi/cw7ZtmpdvW9Tg6nBT3urnG7OSt0itaM8PlQEstkcEWAiHviBvWU5wAAcV2XjJ7uVvqxYfna010iH28EFUpPk1rLAvhYh+kjKb0K5tRk00rJQBqYR2Lxf0g/qiFFI/TA0s1HUrEGx3jnIRcd8cmcyjcseEPH0HsWgq3mtqdX/jcBcUFf1s1EBT3Ygr3F3CvW9A/AK4Xaxwg+NKAQ+Rr9hzobdm0lJ2zgM2X12rXMl/fY32dublI71EXYUEyjRt8V1rRp07Q+T++Qk8BWiNImsxU6gVEwp2yymyuGFfqN8bZy2NMQnx916xhD2NqLLjXiyl9Kg66jNNYxOTuaAW/Eq9opM/H3Kw266QUVRqAfjbZGaJUyOK2Jp7lHX3ZMIZUiGsukhYcYR9BMHP7qkh27spaTYXCNs6q7z6k/ohZioC16S/2sAOXtUI3RPGHCEEh7RIbja+JZBByvWQ7UiQ1xfzuxTxN/2YafGKEppx66WWvK2L02WH3lPi/KRJL6WPa+iuEtAdgQiu6MPRjDYH/1wzIyPDTF19SFQM4G8XgZbSS/iIBoPS0EgfPF1fY6wQoOzhyDGmYjAbxF/ew3yAzkiAUnRXsnF+WL2X79ugHB61/39EaVrohJOTChvjeef2Atmoh9Xp0myjcRrZfYQn235XRHhqbNoSYp6wfcifm0XLluZ341yqiXUR71tfcFEYGUabrC7l2HN/i6MPaJCcG3G2T6NBcOoH0CP11B1PNU2y9pvxSSPT"
`endif