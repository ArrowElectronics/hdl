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

  input logic  bready,

  output logic  bvalid_r,
  output logic  [ID_WIDTH-1:0] bid_r,
  output logic  [1:0] bresp_r,

  output logic bready_r,


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
 localparam FIXED_WIDTH_AW =21;
 localparam DATA_WIDTH_AW = ID_WIDTH + ADDR_WIDTH + FIXED_WIDTH_AW;
 // arready,arvalid,arlen(8),arsize(3),arburst(2),arlock,arcache(4),arprot(3)
 localparam FIXED_WIDTH_AR =21;
 localparam DATA_WIDTH_AR = ID_WIDTH + ADDR_WIDTH + FIXED_WIDTH_AR;
 // 2: bresp(2) + bid -- this does not include bready & bvalid
 localparam DATA_WIDTH_B = ID_WIDTH + 2 + 2;
 // 3: wlast,wready,wvalid + wdata + wstrb
 localparam DATA_WIDTH_W = DATA_WIDTH + STRB_WIDTH + 1;
 // 3: rlast,rresp(2) + rdata + rid -- does not include rready & rvalid
 localparam DATA_WIDTH_R = DATA_WIDTH + ID_WIDTH + 3 + 2;

 localparam FLOP_DEPTH = NUM_PIPELINES/2; // half flops on cmd, rest on rsp path

  logic bvalid_b, rvalid_b;
  logic [DATA_WIDTH_AW-1:0] indata_aw,tempdata_aw,outdata_aw;
  logic [DATA_WIDTH_AR-1:0] indata_ar,tempdata_ar,outdata_ar;
  logic [DATA_WIDTH_B -1 :0] indata_b,tempdata_b, bdata_f;

  logic [DATA_WIDTH_R -1 :0] indata_r,tempdata_r, rdata_f;


  logic [DATA_WIDTH_W -1 :0] indata_w, outdata_w, tempdata_w;


  generate if ( NUM_PIPELINES == 0 ) begin : no_pipeline

    assign {awready_r,awvalid_r,awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awcache_r,awprot_r} ={awready,awvalid,awid,awaddr,awlen,awsize,awburst,awlock,awcache,awprot}; 

    assign {arready_r,arvalid_r,arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,arcache_r,arprot_r} ={arready,arvalid,arid,araddr,arlen,arsize,arburst,arlock,arcache,arprot};

    assign {wready_r,wvalid_r,wdata_r,wstrb_r,wlast_r} = {wready,wvalid,wdata,wstrb,wlast};

    assign {bready_r,bvalid_r,bid_r,bresp_r} = {bready,bvalid,bid,bresp};
    
    assign {rready_r,rvalid_r,rid_r,rresp_r,rdata_r,rlast_r} = {rready,rvalid,rid,rresp,rdata,rlast}; 

  end
  else begin

//    assign {awready_r,awvalid_r,awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awcache_r,awprot_r} ={awready,awvalid,awid,awaddr,awlen,awsize,awburst,awlock,awcache,awprot}; 
//
//    assign {arready_r,arvalid_r,arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,arcache_r,arprot_r} ={arready,arvalid,arid,araddr,arlen,arsize,arburst,arlock,arcache,arprot};
//
//    assign {wready_r,wvalid_r,wdata_r,wstrb_r,wlast_r} = {wready,wvalid,wdata,wstrb,wlast};



 // aw channel 

  assign indata_aw = {awid,awaddr,awlen,awsize,awburst,awlock,awcache,awprot};


  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (DATA_WIDTH_AW)

  ) aw_inst (

  .clk (clk),
  .in_data (indata_aw),
  .out_data (tempdata_aw)

  );
   
  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (2)

  ) aw_inst_ctl (

  .clk (clk),
  .in_data ({awready_f,awvalid}),
  .out_data ({awready_r,awvalid_b})

  );

  ready_latency_adapter # (
     .READY_LATENCY_OUT (NUM_PIPELINES),
     .PAYLOAD_WIDTH (DATA_WIDTH_AW),
     .LOG_DEPTH (LOG_DEPTH) 
    ) aw_inst_skid_buf (
     .clk (clk),
     .reset (reset),
     .in_ready (awready_f), // noc ready output 
     .in_valid (awvalid_b),
     .in_data (tempdata_aw),

     .out_ready (awready), // axi ready 0 latency
     .out_valid (awvalid_r),
     .out_data (outdata_aw)
 
    );


  assign {awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awcache_r,awprot_r} = outdata_aw;

 // ar channel 

  assign indata_ar = {arid,araddr,arlen,arsize,arburst,arlock,arcache,arprot};
 

ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (DATA_WIDTH_AR)

  ) ar_inst_data (

  .clk (clk),
  .in_data (indata_ar),
  .out_data (tempdata_ar)

  );

   
  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (2)

  ) ar_inst_ctl (

  .clk (clk),
  .in_data ({arready_f,arvalid}),
  .out_data ({arready_r,arvalid_b})

  );

  ready_latency_adapter # (
     .READY_LATENCY_OUT (NUM_PIPELINES),
     .PAYLOAD_WIDTH (DATA_WIDTH_AR),
     .LOG_DEPTH (LOG_DEPTH) 
    ) ar_inst_skid_buf (
     .clk (clk),
     .reset (reset),
     .in_ready (arready_f), // noc ready output 
     .in_valid (arvalid_b),
     .in_data (tempdata_ar),

     .out_ready (arready), // axi ready 0 latency
     .out_valid (arvalid_r),
     .out_data (outdata_ar)
 
    );

  assign {arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,arcache_r,arprot_r} = outdata_ar;
 

 // w channel 

 assign indata_w = {wdata,wlast,wstrb};
 

ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (DATA_WIDTH_W)

  ) w_inst_data (

  .clk (clk),
  .in_data (indata_w),
  .out_data (tempdata_w)

  );

   
  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (2)

  ) w_inst_ctl (

  .clk (clk),
  .in_data ({wready_f,wvalid}),
  .out_data ({wready_r,wvalid_b})

  );


  ready_latency_adapter # (
     .READY_LATENCY_OUT (NUM_PIPELINES),
     .PAYLOAD_WIDTH (DATA_WIDTH_W),
     .LOG_DEPTH (LOG_DEPTH) 
    ) w_inst_skid_buf (
     .clk (clk),
     .reset (reset),
     .in_ready (wready_f), // noc ready output 
     .in_valid (wvalid_b),
     .in_data (tempdata_w),

     .out_ready (wready), // axi ready 0 latency
     .out_valid (wvalid_r),
     .out_data (outdata_w)
 
    );

 assign {wdata_r,wlast_r,wstrb_r} = outdata_w;


  // write response channel

  assign indata_b = {bvalid,bready,bid,bresp};

  // data 
  
  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (DATA_WIDTH_B)

  ) b_inst_data (

  .clk (clk),
  .in_data (indata_b),
  .out_data (tempdata_b)

  );

   
 assign {bvalid_r,bready_r,bid_r,bresp_r} = tempdata_b;



 // read response channel

 assign indata_r = {rvalid,rready,rid,rresp,rdata,rlast};

  // data 
  
  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (DATA_WIDTH_R)

  ) r_inst_data (

  .clk (clk),
  .in_data (indata_r),
  .out_data (tempdata_r)

  );

   
 assign {rvalid_r,rready_r,rid_r,rresp_r,rdata_r,rlast_r} = tempdata_r;

 end
 endgenerate


endmodule 

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "cYUAutiPbJ9eAYHEYZJ4jDklBHhf9bnIlALIdgBLX6Jaa49G8B73gYgUIrgIPVNXKXW2JgLn+sUuCX3vFHQmNVHazCLl+Q3pYnSSyJ+VeEBUuTsCYk4WyHVUoFLNJh3h9mwfe0M7KTTBH7CKYKU8pXSi+wdSpKKjUH4aaEHr62cgHz51pqktBtVw2k+aF+gJpGfaDgdM8hrvt8QCIwb7/6NZZ+I55UQUfSDFG/PYg6nlJTyRei+/nhb6gp6Dz7FbnldJfYkXXcFUN1WVUNYFGz29hajESqSSit9DqUavTIGDRHV2pGEznnoslE9nFoBxY1mo1VYmgcVJH+60njfON8kAAW8pid/PM2WLxF+32MVi/5JSK33TMhe/B0hOxbZxZGgwphwoxZ/j3XeAO1c5j9mXzP5zkTQ2o68KFhr9uPcvHXZ9bmAxD7VlQZ8VljvykeU41SKNTOLak0+BMLy3XKhIMamOfYqjtvBWR6UWj7yQ6FMtIT+xpYPdVOFI4nyGE23egXvxTesVmeqQxyyhGPGW7jjfiQzD4UIncuvhn8eBlkTrqssIXpG2tqL84CAE5/+gBLz2C0qcHXTaTlGhZgBs2CG0CZYEAqzE3X2VA3Qojn41sq/XnMaNjQewelnKQrnVOHx0p4XCGiHf3J1pTpl2Qyqgn1dzu/jEdoHp0qGgUWrWV7PeJPGgDMSO7Kp7MCXLKetNWTPDdomAuyjTDrLF8vNdTAopmIWZx6cJlgI3gCOzLaoT3gwYTt9fpnAk0y0Ej4b+enjuCDyuoKHJuBCqHiM9jCCERhHXHdOB9uuGbOO4Efbr4bPZ3gjy62J7YqPeRhqVCPOQ3c3vF4isvWH8qFsZn9Db8za9sw7Fih5OuwMTGQPK+1IpJTamhYurxAHkjktWHPy+UeASLxY7ZaR7a0oamp0Wg+Ze8FpcCIG6VvYuhVEtQSkvwrOLVHJ1oMfvQt0gXY+KsA65/y4zXyGvkLuvFHrw/BE5hzLvSbPPJxQ/uqVMZQMU/18Lc2aM"
`endif