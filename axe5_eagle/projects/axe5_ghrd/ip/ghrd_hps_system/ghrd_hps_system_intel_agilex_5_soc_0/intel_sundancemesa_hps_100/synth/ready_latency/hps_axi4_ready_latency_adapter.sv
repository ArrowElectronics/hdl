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


module hps_axi4_ready_latency_adp # (

parameter LOG_DEPTH =3 ,
parameter NUM_PIPELINES =2,
parameter ID_WIDTH = 9,
parameter ADDR_WIDTH =44,
parameter DATA_WIDTH = 256,
parameter STRB_WIDTH = 32

 ) (

input logic clk,
input logic reset,

// aw channel

 input  logic awready,
 output logic awvalid_r,
 output logic [ID_WIDTH-1:0] awid_r,
 output logic [ADDR_WIDTH-1:0] awaddr_r,
 output logic [7:0] awlen_r,
 output logic [2:0] awsize_r,
 output logic [1:0] awburst_r,
 output logic awlock_r,
 output logic [3:0] awcache_r,
 output logic [2:0] awprot_r,

 output logic  awready_r,
 input logic awvalid,
 input logic [ID_WIDTH-1:0] awid,
 input logic [ADDR_WIDTH-1:0] awaddr,
 input logic [7:0] awlen,
 input logic [2:0] awsize,
 input logic [1:0] awburst,
 input logic awlock,
 input logic [3:0] awcache,
 input logic [2:0] awprot,


 // ar channel

 input  logic arready,
 output logic arvalid_r,
 output logic [ID_WIDTH-1:0] arid_r,
 output logic [ADDR_WIDTH-1:0] araddr_r,
 output logic [7:0] arlen_r,
 output logic [2:0] arsize_r,
 output logic [1:0] arburst_r,
 output logic arlock_r,
 output logic [3:0] arcache_r,
 output logic [2:0] arprot_r,

 output logic arready_r,
 input logic arvalid,
 input logic [ID_WIDTH-1:0] arid,
 input logic [ADDR_WIDTH-1:0] araddr,
 input logic [7:0] arlen,
 input logic [2:0] arsize,
 input logic [1:0] arburst,
 input logic arlock,
 input logic [3:0] arcache,
 input logic [2:0] arprot,


 //w channel

 input logic wready,
 
 output logic wvalid_r,
 output logic [DATA_WIDTH-1:0] wdata_r,
 output logic wlast_r,
 output logic [STRB_WIDTH-1:0] wstrb_r,


 output logic wready_r,
 
 input logic wvalid,
 input logic [DATA_WIDTH-1:0] wdata,
 input logic wlast,
 input logic [STRB_WIDTH-1:0] wstrb,


 // response channel

  input logic bvalid ,
  input logic [ID_WIDTH-1:0] bid,
  input logic [1:0] bresp,

  output logic  bready_r,

  output logic  bvalid_r ,
  output logic  [ID_WIDTH-1:0] bid_r,
  output logic  [1:0] bresp_r,

  input logic bready ,


  input logic rvalid,
  input logic [ID_WIDTH-1:0] rid,
  input logic [DATA_WIDTH-1:0] rdata,
  input logic [1:0] rresp,
  input logic rlast,

  output logic rready_r,


  output logic rvalid_r,
  output logic [ID_WIDTH-1:0] rid_r,
  output logic [DATA_WIDTH-1:0] rdata_r,
  output logic [1:0] rresp_r,
  output logic rlast_r,

  input logic rready

 );

 // awready,awvalid,awlen(8),awsize(3),awburst(2),awlock,awcache(4),awprot(3)
 localparam FIXED_WIDTH_AW =23;
 localparam DATA_WIDTH_AW = ID_WIDTH + ADDR_WIDTH + FIXED_WIDTH_AW;
 // arready,arvalid,arlen(8),arsize(3),arburst(2),arlock,arcache(4),arprot(3)
 localparam FIXED_WIDTH_AR =23;
 localparam DATA_WIDTH_AR = ID_WIDTH + ADDR_WIDTH + FIXED_WIDTH_AR;
 // 2: bresp(2) + bid -- this does not include bready & bvalid
 localparam DATA_WIDTH_B = ID_WIDTH + 2;
 // 3: wlast,wready,wvalid + wdata + wstrb
 localparam DATA_WIDTH_W = DATA_WIDTH + STRB_WIDTH + 3;
 // 3: rlast,rresp(2) + rdata + rid -- does not include rready & rvalid
 localparam DATA_WIDTH_R = DATA_WIDTH + ID_WIDTH + 3;

 localparam FLOP_DEPTH = NUM_PIPELINES/2; // half flops on cmd, rest on rsp path

  logic bvalid_b, rvalid_b;
  logic [DATA_WIDTH_AW-1:0] indata_aw, outdata_aw;
  logic [DATA_WIDTH_AR-1:0] indata_ar, outdata_ar;
  logic [DATA_WIDTH_B -1 :0] indata_b,tempdata_b, bdata_f;

  logic [DATA_WIDTH_R -1 :0] indata_r,tempdata_r, rdata_f;


  logic [DATA_WIDTH_W -1 :0] indata_w, outdata_w;


  generate if ( NUM_PIPELINES == 0 ) begin : no_pipeline

    assign {awready_r,awvalid_r,awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awcache_r,awprot_r} ={awready,awvalid,awid,awaddr,awlen,awsize,awburst,awlock,awcache,awprot}; 

    assign {arready_r,arvalid_r,arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,arcache_r,arprot_r} ={arready,arvalid,arid,araddr,arlen,arsize,arburst,arlock,arcache,arprot};

    assign {wready_r,wvalid_r,wdata_r,wstrb_r,wlast_r} = {wready,wvalid,wdata,wstrb,wlast};

    assign {bready_r,bvalid_r,bid_r,bresp_r} = {bready,bvalid,bid,bresp};
    
    assign {rready_r,rvalid_r,rid_r,rresp_r,rdata_r,rlast_r} = {rready,rvalid,rid,rresp,rdata,rlast}; 

  end
  else begin


 // aw channel 

  assign indata_aw = {awready,awvalid,awid,awaddr,awlen,awsize,awburst,awlock,awcache,awprot};
 

  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (DATA_WIDTH_AW)

  ) aw_inst (

  .clk (clk),
  .in_data (indata_aw),
  .out_data ( outdata_aw)

  );

  assign {awready_r,awvalid_r,awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awcache_r,awprot_r} = outdata_aw;


 // ar channel 

 assign indata_ar = {arready,arvalid,arid,araddr,arlen,arsize,arburst,arlock,arcache,arprot};
 

  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (DATA_WIDTH_AR)

  ) ar_inst (

  .clk (clk),
  .in_data (indata_ar),
  .out_data ( outdata_ar)

  );

  assign {arready_r,arvalid_r,arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,arcache_r,arprot_r} = outdata_ar;
 

 // w channel 

 assign indata_w = {wready,wvalid,wdata,wlast,wstrb};
 

  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (DATA_WIDTH_W)

  ) w_inst (

  .clk (clk),
  .in_data (indata_w),
  .out_data ( outdata_w)

  );

  assign {wready_r,wvalid_r,wdata_r,wlast_r,wstrb_r} = outdata_w;
 


  // write response channel

  assign indata_b = {bid,bresp};

  // data 
  
  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (DATA_WIDTH_B)

  ) b_inst_data (

  .clk (clk),
  .in_data (indata_b),
  .out_data (tempdata_b)

  );

   
  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (2)

  ) b_inst_ctl (

  .clk (clk),
  .in_data ({bready_f,bvalid}),
  .out_data ({bready_r,bvalid_b})

  );


  ready_latency_adapter # (
     .READY_LATENCY_OUT (NUM_PIPELINES),
     .PAYLOAD_WIDTH (DATA_WIDTH_B),
     .LOG_DEPTH (LOG_DEPTH) 
    ) bresp_inst (
     .clk (clk),
     .reset (reset),
     .in_ready (bready_f), // noc ready output 
     .in_valid (bvalid_b),
     .in_data (tempdata_b),

     .out_ready (bready), // axi ready 0 latency
     .out_valid (bvalid_f),
     .out_data (bdata_f)
 
    );


 assign bvalid_r = bvalid_f;
 assign {bid_r,bresp_r} = bdata_f;



 // read response channel

  assign indata_r = {rid,rresp,rdata,rlast};

  // data 
  
  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (DATA_WIDTH_R)

  ) r_inst_data (

  .clk (clk),
  .in_data (indata_r),
  .out_data (tempdata_r)

  );

   
  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (2)

  ) r_inst_ctl (

  .clk (clk),
  .in_data ({rready_f,rvalid}),
  .out_data ({rready_r,rvalid_b})

  );


  ready_latency_adapter # (
     .READY_LATENCY_OUT (NUM_PIPELINES),
     .PAYLOAD_WIDTH (DATA_WIDTH_R),
     .LOG_DEPTH (LOG_DEPTH) 
    ) rresp_inst (
     .clk (clk),
     .reset (reset),
     .in_ready (rready_f), // noc ready output 
     .in_valid (rvalid_b),
     .in_data (tempdata_r),

     .out_ready (rready), // axi ready 0 latency
     .out_valid (rvalid_f),
     .out_data (rdata_f)
 
    );


 assign rvalid_r = rvalid_f;
 assign {rid_r,rresp_r,rdata_r,rlast_r} = rdata_f;

 end
 endgenerate


endmodule 

