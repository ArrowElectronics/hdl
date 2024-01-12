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


module hps_f2soc_ready_latency_adp_conduit # (

parameter LOG_DEPTH =3 ,
parameter NUM_PIPELINES =2,
parameter ID_WIDTH = 5,
parameter ADDR_WIDTH =44,
parameter DATA_WIDTH = 256,
parameter STRB_WIDTH = DATA_WIDTH/8,
parameter AUSER_WIDTH = 8

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
 output logic [AUSER_WIDTH-1:0] awuser_r,
 output logic [3:0] awqos_r,
 output logic [1:0] awbar_r,
 output logic [3:0] awcache_r,
 output logic [1:0] awdomain_r,
 output logic [2:0] awprot_r,
 output logic [2:0] awsnoop_r,
 output logic [3:0]  awregion_r,
 output logic [10:0] awstashid_r,		     
 output logic awstashiden_r,	     
 output logic [4:0]  awstashlpid_r,	     
 output logic awstashlpiden_r,	     
 output logic [5:0]  awatop_r,		

 output logic  awready_r,
 input logic awvalid,
 input logic [ID_WIDTH-1:0] awid,
 input logic [ADDR_WIDTH-1:0] awaddr,
 input logic [7:0] awlen,
 input logic [2:0] awsize,
 input logic [1:0] awburst,
 input logic awlock,
 input logic [AUSER_WIDTH-1:0] awuser,
 input logic [3:0] awqos,
 input logic [1:0] awbar,
 input logic [3:0] awcache,
 input logic [1:0] awdomain,
 input logic [2:0] awprot,
 input logic [2:0] awsnoop,
 input logic [3:0] awregion,
 input logic [10:0] awstashid,		  	   		
 input logic awstashiden,		   	   		
 input logic [4:0]  awstashlpid,		    	   
 input logic awstashlpiden,		   		
 input logic [5:0]  awatop,		           

 // ar channel

 input  logic arready,
 output logic arvalid_r,
 output logic [ID_WIDTH-1:0] arid_r,
 output logic [ADDR_WIDTH-1:0] araddr_r,
 output logic [7:0] arlen_r,
 output logic [2:0] arsize_r,
 output logic [1:0] arburst_r,
 output logic arlock_r,
 output logic [AUSER_WIDTH-1:0] aruser_r,
 output logic [3:0] arqos_r,
 output logic [1:0] arbar_r,
 output logic [3:0] arcache_r,
 output logic [1:0] ardomain_r,
 output logic [2:0] arprot_r,
 output logic [3:0] arsnoop_r,
 output logic [3:0] arregion_r,



 output logic arready_r,
 input logic arvalid,
 input logic [ID_WIDTH-1:0] arid,
 input logic [ADDR_WIDTH-1:0] araddr,
 input logic [7:0] arlen,
 input logic [2:0] arsize,
 input logic [1:0] arburst,
 input logic arlock,
 input logic [AUSER_WIDTH-1:0] aruser,
 input logic [3:0] arqos,
 input logic [1:0] arbar,
 input logic [3:0] arcache,
 input logic [1:0] ardomain,
 input logic [2:0] arprot,
 input logic [3:0] arsnoop,
 input logic [3:0] arregion,

 //w channel

 input logic wready,
 
 output logic wvalid_r,
 output logic [DATA_WIDTH-1:0] wdata_r,
 output logic wlast_r,
 output logic [STRB_WIDTH-1:0] wstrb_r,
 output logic [7:0]wuser_r,


 output logic wready_r,
 
 input logic wvalid,
 input logic [DATA_WIDTH-1:0] wdata,
 input logic wlast,
 input logic [STRB_WIDTH-1:0] wstrb,
 input logic [7:0]wuser,




 // response channel

  input logic bvalid ,
  input logic [ID_WIDTH-1:0] bid,
  input logic [1:0] bresp,
  input logic [7:0] buser,

  output logic  bready_r,

  output logic  bvalid_r ,
  output logic  [ID_WIDTH-1:0] bid_r,
  output logic  [1:0] bresp_r,
  output logic  [7:0] buser_r,

  input logic bready ,


  input logic rvalid,
  input logic [ID_WIDTH-1:0] rid,
  input logic [DATA_WIDTH-1:0] rdata,
  input logic [1:0] rresp,
  input logic rlast,
  input logic [7:0] ruser,


  output logic rready_r,


  output logic rvalid_r,
  output logic [ID_WIDTH-1:0] rid_r,
  output logic [DATA_WIDTH-1:0] rdata_r,
  output logic [1:0] rresp_r,
  output logic rlast_r,
  output logic [7:0] ruser_r,

  input logic rready
      
  );

 
  localparam FIXED_WIDTH_AW =20;
 // awbar(2),awcache(4),awdomain(2),awprot(3),awsnoop(3)
 // awregion(4)awstashid(11)awstashiden(1)awstashlpid(5)awstashlpiden(1)awatop(6)
 localparam ACE_WIDTH_AW = 14 + 28;
 localparam DATA_WIDTH_AW = ID_WIDTH + ADDR_WIDTH + AUSER_WIDTH + ACE_WIDTH_AW + FIXED_WIDTH_AW - 2;
 // arready,arvalid,arlen(8),arsize(3),arburst(2),arlock,arqos(4)
 localparam FIXED_WIDTH_AR =20;
 // arbar(2),arcache(4),ardomain(2),arprot(3),arsnoop(4),arregion(4)
 localparam ACE_WIDTH_AR =19;
 localparam DATA_WIDTH_AR = ID_WIDTH + ADDR_WIDTH + AUSER_WIDTH + ACE_WIDTH_AR + FIXED_WIDTH_AR - 2;
 // 2+8: bresp(2) + buser(8) -- this does not include bready & bvalid
 localparam DATA_WIDTH_B = ID_WIDTH + 2 + 8;
 // 3+8: wlast,wready,wvalid,wuser(8)
 localparam DATA_WIDTH_W = DATA_WIDTH + STRB_WIDTH + 3 + 8 -2;
 // 3+8: rlast,rresp(2) + ruser(8) -- does not include rready & rvalid
 localparam DATA_WIDTH_R = DATA_WIDTH + ID_WIDTH + 3 + 8;

 localparam FLOP_DEPTH = NUM_PIPELINES/2; // half flops on cmd, rest on rsp path

  logic bvalid_b, rvalid_b;
  logic [DATA_WIDTH_AW-1:0] indata_aw, tempdata_aw,outdata_aw;
  logic [DATA_WIDTH_AR-1:0] indata_ar, tempdata_ar,outdata_ar;
  logic [DATA_WIDTH_B -1 :0] indata_b,tempdata_b, bdata_f;

  logic [DATA_WIDTH_R -1 :0] indata_r,tempdata_r, rdata_f;


  logic [DATA_WIDTH_W -1 :0] indata_w, tempdata_w,outdata_w;


  generate if ( NUM_PIPELINES == 0 ) begin : no_pipeline

    assign {awready_r,awvalid_r,awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awuser_r,awqos_r,awbar_r,awcache_r,awdomain_r,awprot_r,awsnoop_r,awregion_r,awstashid_r,awstashiden_r,awstashlpid_r,awstashlpiden_r,awatop_r } ={awready,awvalid,awid,awaddr,awlen,awsize,awburst,awlock,awuser,awqos,awbar,awcache,awdomain,awprot,awsnoop,awregion,awstashid,awstashiden,awstashlpid,awstashlpiden,awatop }; 

    assign {arready_r,arvalid_r,arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,aruser_r,arqos_r,arbar_r,arcache_r,ardomain_r,arprot_r,arsnoop_r,arregion_r} ={arready,arvalid,arid,araddr,arlen,arsize,arburst,arlock,aruser,arqos,arbar,arcache,ardomain,arprot,arsnoop,arregion};

    assign {wready_r,wvalid_r,wdata_r,wstrb_r,wlast_r,wuser_r} = {wready,wvalid,wdata,wstrb,wlast,wuser};

    assign {bready_r,bvalid_r,bid_r,bresp_r,buser_r} = {bready,bvalid,bid,bresp,buser};
    
    assign {rready_r,rvalid_r,rid_r,rresp_r,rdata_r,rlast_r,ruser_r} = {rready,rvalid,rid,rresp,rdata,rlast,ruser}; 

  end
  else begin


 // aw channel 

  assign indata_aw = {awid,awaddr,awlen,awsize,awburst,awlock,awuser,awqos,awbar,awcache,awdomain,awprot,awsnoop,awregion,awstashid,awstashiden,awstashlpid,awstashlpiden,awatop };
 
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



  assign {awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awuser_r,awqos_r,awbar_r,awcache_r,awdomain_r,awprot_r,awsnoop_r,awregion_r,awstashid_r,awstashiden_r,awstashlpid_r,awstashlpiden_r,awatop_r } = outdata_aw;


 // ar channel 

 assign indata_ar = {arid,araddr,arlen,arsize,arburst,arlock,aruser,arqos,arbar,arcache,ardomain,arprot,arsnoop,arregion};
 
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




  assign {arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,aruser_r,arqos_r,arbar_r,arcache_r,ardomain_r,arprot_r,arsnoop_r,arregion_r} = outdata_ar;
 

 // w channel 

 assign indata_w = {wdata,wlast,wstrb,wuser};
 
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




  assign {wdata_r,wlast_r,wstrb_r,wuser_r} = outdata_w;
 


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

  assign indata_r = {rid,rresp,rdata,rlast,ruser};

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
 assign {rid_r,rresp_r,rdata_r,rlast_r,ruser_r} = rdata_f;

 end
 endgenerate



  



endmodule 



module hps_f2soc_ready_latency_adp_acelite # (
parameter LOG_DEPTH =3 ,
parameter NUM_PIPELINES =2,
parameter ID_WIDTH = 5,
parameter ADDR_WIDTH =44,
parameter DATA_WIDTH = 256,
parameter STRB_WIDTH = DATA_WIDTH/8,
parameter AUSER_WIDTH = 8

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
 output logic [AUSER_WIDTH-1:0] awuser_r,
 output logic [3:0] awqos_r,
 output logic [1:0] awbar_r,
 output logic [3:0] awcache_r,
 output logic [1:0] awdomain_r,
 output logic [2:0] awprot_r,
 output logic [2:0] awsnoop_r,
 output logic [3:0]  awregion_r,

 output logic  awready_r,
 input logic awvalid,
 input logic [ID_WIDTH-1:0] awid,
 input logic [ADDR_WIDTH-1:0] awaddr,
 input logic [7:0] awlen,
 input logic [2:0] awsize,
 input logic [1:0] awburst,
 input logic awlock,
 input logic [AUSER_WIDTH-1:0] awuser,
 input logic [3:0] awqos,
 input logic [1:0] awbar,
 input logic [3:0] awcache,
 input logic [1:0] awdomain,
 input logic [2:0] awprot,
 input logic [2:0] awsnoop,
 input logic [3:0] awregion,

 // ar channel

 input  logic arready,
 output logic arvalid_r,
 output logic [ID_WIDTH-1:0] arid_r,
 output logic [ADDR_WIDTH-1:0] araddr_r,
 output logic [7:0] arlen_r,
 output logic [2:0] arsize_r,
 output logic [1:0] arburst_r,
 output logic arlock_r,
 output logic [AUSER_WIDTH-1:0] aruser_r,
 output logic [3:0] arqos_r,
 output logic [1:0] arbar_r,
 output logic [3:0] arcache_r,
 output logic [1:0] ardomain_r,
 output logic [2:0] arprot_r,
 output logic [3:0] arsnoop_r,
 output logic [3:0] arregion_r,



 output logic arready_r,
 input logic arvalid,
 input logic [ID_WIDTH-1:0] arid,
 input logic [ADDR_WIDTH-1:0] araddr,
 input logic [7:0] arlen,
 input logic [2:0] arsize,
 input logic [1:0] arburst,
 input logic arlock,
 input logic [AUSER_WIDTH-1:0] aruser,
 input logic [3:0] arqos,
 input logic [1:0] arbar,
 input logic [3:0] arcache,
 input logic [1:0] ardomain,
 input logic [2:0] arprot,
 input logic [3:0] arsnoop,
 input logic [3:0] arregion,

 //w channel

 input logic wready,
 
 output logic wvalid_r,
 output logic [DATA_WIDTH-1:0] wdata_r,
 output logic wlast_r,
 output logic [STRB_WIDTH-1:0] wstrb_r,
 output logic [7:0]wuser_r,


 output logic wready_r,
 
 input logic wvalid,
 input logic [DATA_WIDTH-1:0] wdata,
 input logic wlast,
 input logic [STRB_WIDTH-1:0] wstrb,
 input logic [7:0]wuser,




 // response channel

  input logic bvalid ,
  input logic [ID_WIDTH-1:0] bid,
  input logic [1:0] bresp,
  input logic [7:0] buser,

  output logic  bready_r,

  output logic  bvalid_r ,
  output logic  [ID_WIDTH-1:0] bid_r,
  output logic  [1:0] bresp_r,
  output logic  [7:0] buser_r,

  input logic bready ,


  input logic rvalid,
  input logic [ID_WIDTH-1:0] rid,
  input logic [DATA_WIDTH-1:0] rdata,
  input logic [1:0] rresp,
  input logic rlast,
  input logic [7:0] ruser,


  output logic rready_r,


  output logic rvalid_r,
  output logic [ID_WIDTH-1:0] rid_r,
  output logic [DATA_WIDTH-1:0] rdata_r,
  output logic [1:0] rresp_r,
  output logic rlast_r,
  output logic [7:0] ruser_r,

  input logic rready

  
  //additional ports to support ace-lite interface

      
  );

 
  localparam FIXED_WIDTH_AW =20;
 // awbar(2),awcache(4),awdomain(2),awprot(3),awsnoop(3)
 // awregion(4)
 localparam ACE_WIDTH_AW = 14 + 4;
 localparam DATA_WIDTH_AW = ID_WIDTH + ADDR_WIDTH + AUSER_WIDTH + ACE_WIDTH_AW + FIXED_WIDTH_AW - 2;
 // arready,arvalid,arlen(8),arsize(3),arburst(2),arlock,arqos(4)
 localparam FIXED_WIDTH_AR =20;
 // arbar(2),arcache(4),ardomain(2),arprot(3),arsnoop(4),arregion(4)
 localparam ACE_WIDTH_AR =19;
 localparam DATA_WIDTH_AR = ID_WIDTH + ADDR_WIDTH + AUSER_WIDTH + ACE_WIDTH_AR + FIXED_WIDTH_AR - 2;
 // 2+8: bresp(2) + buser(8) -- this does not include bready & bvalid
 localparam DATA_WIDTH_B = ID_WIDTH + 2 + 8;
 // 3+8: wlast,wready,wvalid,wuser(8)
 localparam DATA_WIDTH_W = DATA_WIDTH + STRB_WIDTH + 3 + 8 - 2;
 // 3+8: rlast,rresp(2) + ruser(8) -- does not include rready & rvalid
 localparam DATA_WIDTH_R = DATA_WIDTH + ID_WIDTH + 3 + 8;

 localparam FLOP_DEPTH = NUM_PIPELINES/2; // half flops on cmd, rest on rsp path

  logic bvalid_b, rvalid_b;
  logic [DATA_WIDTH_AW-1:0] indata_aw, outdata_aw,tempdata_aw;
  logic [DATA_WIDTH_AR-1:0] indata_ar, outdata_ar,tempdata_ar;
  logic [DATA_WIDTH_B -1 :0] indata_b,tempdata_b, bdata_f;

  logic [DATA_WIDTH_R -1 :0] indata_r,tempdata_r, rdata_f;


  logic [DATA_WIDTH_W -1 :0] indata_w, outdata_w,tempdata_w;


  generate if ( NUM_PIPELINES == 0 ) begin : no_pipeline

    assign {awready_r,awvalid_r,awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awuser_r,awqos_r,awbar_r,awcache_r,awdomain_r,awprot_r,awsnoop_r,awregion_r} ={awready,awvalid,awid,awaddr,awlen,awsize,awburst,awlock,awuser,awqos,awbar,awcache,awdomain,awprot,awsnoop,awregion}; 

    assign {arready_r,arvalid_r,arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,aruser_r,arqos_r,arbar_r,arcache_r,ardomain_r,arprot_r,arsnoop_r,arregion_r} ={arready,arvalid,arid,araddr,arlen,arsize,arburst,arlock,aruser,arqos,arbar,arcache,ardomain,arprot,arsnoop,arregion};

    assign {wready_r,wvalid_r,wdata_r,wstrb_r,wlast_r,wuser_r} = {wready,wvalid,wdata,wstrb,wlast,wuser};

    assign {bready_r,bvalid_r,bid_r,bresp_r,buser_r} = {bready,bvalid,bid,bresp,buser};
    
    assign {rready_r,rvalid_r,rid_r,rresp_r,rdata_r,rlast_r,ruser_r} = {rready,rvalid,rid,rresp,rdata,rlast,ruser}; 

  end
  else begin


 // aw channel 

  assign indata_aw = {awid,awaddr,awlen,awsize,awburst,awlock,awuser,awqos,awbar,awcache,awdomain,awprot,awsnoop,awregion};
 
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



   assign {awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awuser_r,awqos_r,awbar_r,awcache_r,awdomain_r,awprot_r,awsnoop_r,awregion_r} = outdata_aw;


 // ar channel 

 assign indata_ar = {arid,araddr,arlen,arsize,arburst,arlock,aruser,arqos,arbar,arcache,ardomain,arprot,arsnoop,arregion};
 

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


   assign {arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,aruser_r,arqos_r,arbar_r,arcache_r,ardomain_r,arprot_r,arsnoop_r,arregion_r} = outdata_ar;
 

 // w channel 

 assign indata_w = {wdata,wlast,wstrb,wuser};
 
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



   assign {wdata_r,wlast_r,wstrb_r,wuser_r} = outdata_w;
 


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

  assign indata_r = {rid,rresp,rdata,rlast,ruser};

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
 assign {rid_r,rresp_r,rdata_r,rlast_r,ruser_r} = rdata_f;

 end
 endgenerate



  



endmodule 



module hps_f2soc_ready_latency_adp_axi5 # (
parameter LOG_DEPTH =3 ,
parameter NUM_PIPELINES =2,
parameter ID_WIDTH = 5,
parameter ADDR_WIDTH =44,
parameter DATA_WIDTH = 256,
parameter STRB_WIDTH = DATA_WIDTH/8,
parameter AUSER_WIDTH = 8

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
 output logic [AUSER_WIDTH-1:0] awuser_r,
 output logic [3:0] awqos_r,
 output logic [3:0] awcache_r,
 output logic [2:0] awprot_r,
 output logic [3:0] awregion_r,

 output logic  awready_r,
 input logic awvalid,
 input logic [ID_WIDTH-1:0] awid,
 input logic [ADDR_WIDTH-1:0] awaddr,
 input logic [7:0] awlen,
 input logic [2:0] awsize,
 input logic [1:0] awburst,
 input logic awlock,
 input logic [AUSER_WIDTH-1:0] awuser,
 input logic [3:0] awqos,
 input logic [3:0] awcache,
 input logic [2:0] awprot,
 input logic [3:0] awregion,

 // ar channel

 input  logic arready,
 output logic arvalid_r,
 output logic [ID_WIDTH-1:0] arid_r,
 output logic [ADDR_WIDTH-1:0] araddr_r,
 output logic [7:0] arlen_r,
 output logic [2:0] arsize_r,
 output logic [1:0] arburst_r,
 output logic arlock_r,
 output logic [AUSER_WIDTH-1:0] aruser_r,
 output logic [3:0] arqos_r,
 output logic [3:0] arcache_r,
 output logic [2:0] arprot_r,
 output logic [3:0] arregion_r,



 output logic arready_r,
 input logic arvalid,
 input logic [ID_WIDTH-1:0] arid,
 input logic [ADDR_WIDTH-1:0] araddr,
 input logic [7:0] arlen,
 input logic [2:0] arsize,
 input logic [1:0] arburst,
 input logic arlock,
 input logic [AUSER_WIDTH-1:0] aruser,
 input logic [3:0] arqos,
 input logic [3:0] arcache,
 input logic [2:0] arprot,
 input logic [3:0] arregion,

 //w channel

 input logic wready,
 
 output logic wvalid_r,
 output logic [DATA_WIDTH-1:0] wdata_r,
 output logic wlast_r,
 output logic [STRB_WIDTH-1:0] wstrb_r,
 output logic [7:0]wuser_r,


 output logic wready_r,
 
 input logic wvalid,
 input logic [DATA_WIDTH-1:0] wdata,
 input logic wlast,
 input logic [STRB_WIDTH-1:0] wstrb,
 input logic [7:0]wuser,




 // response channel

  input logic bvalid ,
  input logic [ID_WIDTH-1:0] bid,
  input logic [1:0] bresp,
  input logic [7:0] buser,

  output logic  bready_r,

  output logic  bvalid_r ,
  output logic  [ID_WIDTH-1:0] bid_r,
  output logic  [1:0] bresp_r,
  output logic  [7:0] buser_r,

  input logic bready ,


  input logic rvalid,
  input logic [ID_WIDTH-1:0] rid,
  input logic [DATA_WIDTH-1:0] rdata,
  input logic [1:0] rresp,
  input logic rlast,
  input logic [7:0] ruser,


  output logic rready_r,


  output logic rvalid_r,
  output logic [ID_WIDTH-1:0] rid_r,
  output logic [DATA_WIDTH-1:0] rdata_r,
  output logic [1:0] rresp_r,
  output logic rlast_r,
  output logic [7:0] ruser_r,

  input logic rready

  
  //additional ports to support ace-lite interface

      
  );

 
  localparam FIXED_WIDTH_AW =20;
 // awcache(4),awprot(3),awregion(4)
 localparam ACE_WIDTH_AW = 11;
 localparam DATA_WIDTH_AW = ID_WIDTH + ADDR_WIDTH + AUSER_WIDTH + ACE_WIDTH_AW + FIXED_WIDTH_AW - 2;
 // arready,arvalid,arlen(8),arsize(3),arburst(2),arlock,arqos(4)
 localparam FIXED_WIDTH_AR =20;
 // arcache(4),arprot(3),arregion(4)
 localparam ACE_WIDTH_AR =11;
 localparam DATA_WIDTH_AR = ID_WIDTH + ADDR_WIDTH + AUSER_WIDTH + ACE_WIDTH_AR + FIXED_WIDTH_AR - 2;
 // 2+8: bresp(2) + buser(8) -- this does not include bready & bvalid
 localparam DATA_WIDTH_B = ID_WIDTH + 2 + 8;
 // 3+8: wlast,wready,wvalid,wuser(8)
 localparam DATA_WIDTH_W = DATA_WIDTH + STRB_WIDTH + 3 + 8 - 2;
 // 3+8: rlast,rresp(2) + ruser(8) -- does not include rready & rvalid
 localparam DATA_WIDTH_R = DATA_WIDTH + ID_WIDTH + 3 + 8;

 localparam FLOP_DEPTH = NUM_PIPELINES/2; // half flops on cmd, rest on rsp path

  logic bvalid_b, rvalid_b;
  logic [DATA_WIDTH_AW-1:0] indata_aw, outdata_aw,tempdata_aw;
  logic [DATA_WIDTH_AR-1:0] indata_ar, outdata_ar,tempdata_ar;
  logic [DATA_WIDTH_B -1 :0] indata_b,tempdata_b, bdata_f;

  logic [DATA_WIDTH_R -1 :0] indata_r,tempdata_r, rdata_f;


  logic [DATA_WIDTH_W -1 :0] indata_w, outdata_w,tempdata_w;


  generate if ( NUM_PIPELINES == 0 ) begin : no_pipeline

    assign {awready_r,awvalid_r,awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awuser_r,awqos_r,awcache_r,awprot_r,awregion_r} ={awready,awvalid,awid,awaddr,awlen,awsize,awburst,awlock,awuser,awqos,awcache,awprot,awregion}; 

    assign {arready_r,arvalid_r,arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,aruser_r,arqos_r,arcache_r,arprot_r,arregion_r} ={arready,arvalid,arid,araddr,arlen,arsize,arburst,arlock,aruser,arqos,arcache,arprot,arregion};

    assign {wready_r,wvalid_r,wdata_r,wstrb_r,wlast_r,wuser_r} = {wready,wvalid,wdata,wstrb,wlast,wuser};

    assign {bready_r,bvalid_r,bid_r,bresp_r,buser_r} = {bready,bvalid,bid,bresp,buser};
    
    assign {rready_r,rvalid_r,rid_r,rresp_r,rdata_r,rlast_r,ruser_r} = {rready,rvalid,rid,rresp,rdata,rlast,ruser}; 

  end
  else begin


 // aw channel 

  assign indata_aw = {awid,awaddr,awlen,awsize,awburst,awlock,awuser,awqos,awcache,awprot,awregion};

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


  assign {awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awuser_r,awqos_r,awcache_r,awprot_r,awregion_r} = outdata_aw;


 // ar channel 

 assign indata_ar = {arid,araddr,arlen,arsize,arburst,arlock,aruser,arqos,arcache,arprot,arregion};
 
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



  assign {arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,aruser_r,arqos_r,arcache_r,arprot_r,arregion_r} = outdata_ar;
 

 // w channel 

  assign indata_w = {wdata,wlast,wstrb,wuser};
 
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



  assign {wdata_r,wlast_r,wstrb_r,wuser_r} = outdata_w;
 


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

  assign indata_r = {rid,rresp,rdata,rlast,ruser};

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
 assign {rid_r,rresp_r,rdata_r,rlast_r,ruser_r} = rdata_f;

 end
 endgenerate



  



endmodule 





module hps_ready_latency_adp_axi4 # (

parameter LOG_DEPTH =3 ,
parameter NUM_PIPELINES =2,
parameter ID_WIDTH = 5,
parameter ADDR_WIDTH =44,
parameter DATA_WIDTH = 256,
parameter STRB_WIDTH = DATA_WIDTH/8,
parameter AUSER_WIDTH = 8

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
 output logic [AUSER_WIDTH-1:0] awuser_r,
 output logic [3:0] awqos_r,
 output logic [3:0] awcache_r,
 output logic [2:0] awprot_r,
 output logic [3:0] awregion_r,

 output logic  awready_r,
 input logic awvalid,
 input logic [ID_WIDTH-1:0] awid,
 input logic [ADDR_WIDTH-1:0] awaddr,
 input logic [7:0] awlen,
 input logic [2:0] awsize,
 input logic [1:0] awburst,
 input logic awlock,
 input logic [AUSER_WIDTH-1:0] awuser,
 input logic [3:0] awqos,
 input logic [3:0] awcache,
 input logic [2:0] awprot,
 input logic [3:0] awregion,

 // ar channel

 input  logic arready,
 output logic arvalid_r,
 output logic [ID_WIDTH-1:0] arid_r,
 output logic [ADDR_WIDTH-1:0] araddr_r,
 output logic [7:0] arlen_r,
 output logic [2:0] arsize_r,
 output logic [1:0] arburst_r,
 output logic arlock_r,
 output logic [AUSER_WIDTH-1:0] aruser_r,
 output logic [3:0] arqos_r,
 output logic [3:0] arcache_r,
 output logic [2:0] arprot_r,
 output logic [3:0] arregion_r,



 output logic arready_r,
 input logic arvalid,
 input logic [ID_WIDTH-1:0] arid,
 input logic [ADDR_WIDTH-1:0] araddr,
 input logic [7:0] arlen,
 input logic [2:0] arsize,
 input logic [1:0] arburst,
 input logic arlock,
 input logic [AUSER_WIDTH-1:0] aruser,
 input logic [3:0] arqos,
 input logic [3:0] arcache,
 input logic [2:0] arprot,
 input logic [3:0] arregion,

 //w channel

 input logic wready,
 
 output logic wvalid_r,
 output logic [DATA_WIDTH-1:0] wdata_r,
 output logic wlast_r,
 output logic [STRB_WIDTH-1:0] wstrb_r,
 output logic [7:0]wuser_r,


 output logic wready_r,
 
 input logic wvalid,
 input logic [DATA_WIDTH-1:0] wdata,
 input logic wlast,
 input logic [STRB_WIDTH-1:0] wstrb,
 input logic [7:0]wuser,




 // response channel

  input logic bvalid ,
  input logic [ID_WIDTH-1:0] bid,
  input logic [1:0] bresp,
  input logic [7:0] buser,

  output logic  bready_r,

  output logic  bvalid_r ,
  output logic  [ID_WIDTH-1:0] bid_r,
  output logic  [1:0] bresp_r,
  output logic  [7:0] buser_r,

  input logic bready ,


  input logic rvalid,
  input logic [ID_WIDTH-1:0] rid,
  input logic [DATA_WIDTH-1:0] rdata,
  input logic [1:0] rresp,
  input logic rlast,
  input logic [7:0] ruser,


  output logic rready_r,


  output logic rvalid_r,
  output logic [ID_WIDTH-1:0] rid_r,
  output logic [DATA_WIDTH-1:0] rdata_r,
  output logic [1:0] rresp_r,
  output logic rlast_r,
  output logic [7:0] ruser_r,

  input logic rready

  
  //additional ports to support ace-lite interface

      
  );

 
  localparam FIXED_WIDTH_AW =20;
 // awcache(4),awprot(3),awregion(4)
 localparam ACE_WIDTH_AW = 11;
 localparam DATA_WIDTH_AW = ID_WIDTH + ADDR_WIDTH + AUSER_WIDTH + ACE_WIDTH_AW + FIXED_WIDTH_AW;
 // arready,arvalid,arlen(8),arsize(3),arburst(2),arlock,arqos(4)
 localparam FIXED_WIDTH_AR =20;
 // arcache(4),arprot(3),arregion(4)
 localparam ACE_WIDTH_AR =11;
 localparam DATA_WIDTH_AR = ID_WIDTH + ADDR_WIDTH + AUSER_WIDTH + ACE_WIDTH_AR + FIXED_WIDTH_AR;
 // 2+8: bresp(2) + buser(8) -- this does not include bready & bvalid
 localparam DATA_WIDTH_B = ID_WIDTH + 2 + 8;
 // 3+8: wlast,wready,wvalid,wuser(8)
 localparam DATA_WIDTH_W = DATA_WIDTH + STRB_WIDTH + 3 + 8;
 // 3+8: rlast,rresp(2) + ruser(8) -- does not include rready & rvalid
 localparam DATA_WIDTH_R = DATA_WIDTH + ID_WIDTH + 3 + 8;

 localparam FLOP_DEPTH = NUM_PIPELINES/2; // half flops on cmd, rest on rsp path

  logic bvalid_b, rvalid_b;
  logic [DATA_WIDTH_AW-1:0] indata_aw, outdata_aw;
  logic [DATA_WIDTH_AR-1:0] indata_ar, outdata_ar;
  logic [DATA_WIDTH_B -1 :0] indata_b,tempdata_b, bdata_f;

  logic [DATA_WIDTH_R -1 :0] indata_r,tempdata_r, rdata_f;


  logic [DATA_WIDTH_W -1 :0] indata_w, outdata_w;


  generate if ( NUM_PIPELINES == 0 ) begin : no_pipeline

    assign {awready_r,awvalid_r,awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awuser_r,awqos_r,awcache_r,awprot_r,awregion_r} ={awready,awvalid,awid,awaddr,awlen,awsize,awburst,awlock,awuser,awqos,awcache,awprot,awregion}; 

    assign {arready_r,arvalid_r,arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,aruser_r,arqos_r,arcache_r,arprot_r,arregion_r} ={arready,arvalid,arid,araddr,arlen,arsize,arburst,arlock,aruser,arqos,arcache,arprot,arregion};

    assign {wready_r,wvalid_r,wdata_r,wstrb_r,wlast_r,wuser_r} = {wready,wvalid,wdata,wstrb,wlast,wuser};

    assign {bready_r,bvalid_r,bid_r,bresp_r,buser_r} = {bready,bvalid,bid,bresp,buser};
    
    assign {rready_r,rvalid_r,rid_r,rresp_r,rdata_r,rlast_r,ruser_r} = {rready,rvalid,rid,rresp,rdata,rlast,ruser}; 

  end
  else begin


 // aw channel 

  assign indata_aw = {awready,awvalid,awid,awaddr,awlen,awsize,awburst,awlock,awuser,awqos,awcache,awprot,awregion};
 

  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (DATA_WIDTH_AW)

  ) aw_inst (

  .clk (clk),
  .in_data (indata_aw),
  .out_data ( outdata_aw)

  );

  assign {awready_r,awvalid_r,awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awuser_r,awqos_r,awcache_r,awprot_r,awregion_r} = outdata_aw;


 // ar channel 

 assign indata_ar = {arready,arvalid,arid,araddr,arlen,arsize,arburst,arlock,aruser,arqos,arcache,arprot,arregion};
 

  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (DATA_WIDTH_AR)

  ) ar_inst (

  .clk (clk),
  .in_data (indata_ar),
  .out_data ( outdata_ar)

  );

  assign {arready_r,arvalid_r,arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,aruser_r,arqos_r,arcache_r,arprot_r,arregion_r} = outdata_ar;
 

 // w channel 

 assign indata_w = {wready,wvalid,wdata,wlast,wstrb,wuser};
 

  ff_macro # (
  .NUM_FLOPS (FLOP_DEPTH),

  .DATA_WIDTH (DATA_WIDTH_W)

  ) w_inst (

  .clk (clk),
  .in_data (indata_w),
  .out_data ( outdata_w)

  );

  assign {wready_r,wvalid_r,wdata_r,wlast_r,wstrb_r,wuser_r} = outdata_w;
 
 

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

  assign indata_r = {rid,rresp,rdata,rlast,ruser};

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
 assign {rid_r,rresp_r,rdata_r,rlast_r,ruser_r} = rdata_f;

 end
 endgenerate



  



endmodule 



module hps_f2soc_ready_latency_adp_axi4 # (

parameter LOG_DEPTH =3 ,
parameter NUM_PIPELINES =2,
parameter ID_WIDTH = 5,
parameter ADDR_WIDTH =44,
parameter DATA_WIDTH = 256,
parameter STRB_WIDTH = DATA_WIDTH/8,
parameter AUSER_WIDTH = 8

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
 output logic [AUSER_WIDTH-1:0] awuser_r,
 output logic [3:0] awqos_r,
 output logic [3:0] awcache_r,
 output logic [2:0] awprot_r,
 output logic [3:0] awregion_r,

 output logic  awready_r,
 input logic awvalid,
 input logic [ID_WIDTH-1:0] awid,
 input logic [ADDR_WIDTH-1:0] awaddr,
 input logic [7:0] awlen,
 input logic [2:0] awsize,
 input logic [1:0] awburst,
 input logic awlock,
 input logic [AUSER_WIDTH-1:0] awuser,
 input logic [3:0] awqos,
 input logic [3:0] awcache,
 input logic [2:0] awprot,
 input logic [3:0] awregion,

 // ar channel

 input  logic arready,
 output logic arvalid_r,
 output logic [ID_WIDTH-1:0] arid_r,
 output logic [ADDR_WIDTH-1:0] araddr_r,
 output logic [7:0] arlen_r,
 output logic [2:0] arsize_r,
 output logic [1:0] arburst_r,
 output logic arlock_r,
 output logic [AUSER_WIDTH-1:0] aruser_r,
 output logic [3:0] arqos_r,
 output logic [3:0] arcache_r,
 output logic [2:0] arprot_r,
 output logic [3:0] arregion_r,



 output logic arready_r,
 input logic arvalid,
 input logic [ID_WIDTH-1:0] arid,
 input logic [ADDR_WIDTH-1:0] araddr,
 input logic [7:0] arlen,
 input logic [2:0] arsize,
 input logic [1:0] arburst,
 input logic arlock,
 input logic [AUSER_WIDTH-1:0] aruser,
 input logic [3:0] arqos,
 input logic [3:0] arcache,
 input logic [2:0] arprot,
 input logic [3:0] arregion,

 //w channel

 input logic wready,
 
 output logic wvalid_r,
 output logic [DATA_WIDTH-1:0] wdata_r,
 output logic wlast_r,
 output logic [STRB_WIDTH-1:0] wstrb_r,
 output logic [7:0]wuser_r,


 output logic wready_r,
 
 input logic wvalid,
 input logic [DATA_WIDTH-1:0] wdata,
 input logic wlast,
 input logic [STRB_WIDTH-1:0] wstrb,
 input logic [7:0]wuser,




 // response channel

  input logic bvalid ,
  input logic [ID_WIDTH-1:0] bid,
  input logic [1:0] bresp,
  input logic [7:0] buser,

  output logic  bready_r,

  output logic  bvalid_r ,
  output logic  [ID_WIDTH-1:0] bid_r,
  output logic  [1:0] bresp_r,
  output logic  [7:0] buser_r,

  input logic bready ,


  input logic rvalid,
  input logic [ID_WIDTH-1:0] rid,
  input logic [DATA_WIDTH-1:0] rdata,
  input logic [1:0] rresp,
  input logic rlast,
  input logic [7:0] ruser,


  output logic rready_r,


  output logic rvalid_r,
  output logic [ID_WIDTH-1:0] rid_r,
  output logic [DATA_WIDTH-1:0] rdata_r,
  output logic [1:0] rresp_r,
  output logic rlast_r,
  output logic [7:0] ruser_r,

  input logic rready

  
  //additional ports to support ace-lite interface

      
  );

 
 // awready,awvalid,awlen(8),awsize(3),awburst(2),awlock,awcache(4),awprot(3)
 localparam FIXED_WIDTH_AW =21;
 localparam DATA_WIDTH_AW = ID_WIDTH + ADDR_WIDTH + FIXED_WIDTH_AW;
 // arready,arvalid,arlen(8),arsize(3),arburst(2),arlock,arcache(4),arprot(3)
 localparam FIXED_WIDTH_AR =21;
 localparam DATA_WIDTH_AR = ID_WIDTH + ADDR_WIDTH + FIXED_WIDTH_AR;
 // 3: wlast,wready,wvalid + wdata + wstrb
 localparam DATA_WIDTH_W = DATA_WIDTH + STRB_WIDTH + 1; 
 // 3+8: rlast,rresp(2) + ruser(8) -- does not include rready & rvalid
 localparam DATA_WIDTH_R = DATA_WIDTH + ID_WIDTH + 3 + 8;
 // 2+8: bresp(2) + buser(8) -- this does not include bready & bvalid
 localparam DATA_WIDTH_B = ID_WIDTH + 2 + 8;
 
 localparam FLOP_DEPTH = NUM_PIPELINES/2; // half flops on cmd, rest on rsp path

  logic bvalid_b, rvalid_b;

  logic [DATA_WIDTH_AW-1:0] indata_aw,tempdata_aw,outdata_aw;
  logic [DATA_WIDTH_AR-1:0] indata_ar,tempdata_ar,outdata_ar;
  logic [DATA_WIDTH_W -1 :0] indata_w, outdata_w, tempdata_w;
  logic [DATA_WIDTH_B -1 :0] indata_b,tempdata_b, bdata_f;
  logic [DATA_WIDTH_R -1 :0] indata_r,tempdata_r, rdata_f;

  generate if ( NUM_PIPELINES == 0 ) begin : no_pipeline

    assign {awready_r,awvalid_r,awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awuser_r,awqos_r,awcache_r,awprot_r,awregion_r} ={awready,awvalid,awid,awaddr,awlen,awsize,awburst,awlock,awuser,awqos,awcache,awprot,awregion}; 

    assign {arready_r,arvalid_r,arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,aruser_r,arqos_r,arcache_r,arprot_r,arregion_r} ={arready,arvalid,arid,araddr,arlen,arsize,arburst,arlock,aruser,arqos,arcache,arprot,arregion};

    assign {wready_r,wvalid_r,wdata_r,wstrb_r,wlast_r,wuser_r} = {wready,wvalid,wdata,wstrb,wlast,wuser};

    assign {bready_r,bvalid_r,bid_r,bresp_r,buser_r} = {bready,bvalid,bid,bresp,buser};
    
    assign {rready_r,rvalid_r,rid_r,rresp_r,rdata_r,rlast_r,ruser_r} = {rready,rvalid,rid,rresp,rdata,rlast,ruser}; 

  end
  else begin

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

  assign indata_r = {rid,rresp,rdata,rlast,ruser};

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
 assign {rid_r,rresp_r,rdata_r,rlast_r,ruser_r} = rdata_f;

 end
 endgenerate

endmodule 


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "cYUAutiPbJ9eAYHEYZJ4jDklBHhf9bnIlALIdgBLX6Jaa49G8B73gYgUIrgIPVNXKXW2JgLn+sUuCX3vFHQmNVHazCLl+Q3pYnSSyJ+VeEBUuTsCYk4WyHVUoFLNJh3h9mwfe0M7KTTBH7CKYKU8pXSi+wdSpKKjUH4aaEHr62cgHz51pqktBtVw2k+aF+gJpGfaDgdM8hrvt8QCIwb7/6NZZ+I55UQUfSDFG/PYg6nd7gCVebDuFQ7CG9ZubFSjIlyyVDMvzjijmiV9efYpUVeQFUGuKerUXK5Eu+symJTs7RUY7PTIwseUqKrjpEFU4Ebd/+L0OwFK0H3PCmrfsQz5JSzQ1dn9ZFFlz3qn0eVR3nx9ddq9I0YIGOy+r4ieFDhXoBbb0ImorJwrHqyiPKarTByJBj/Gt78/H0mOOr+h9hVwcStvAi3igFYhtyci+djjnoMqd2wLzv7DkOA+KF0k1AxsS1eqpEa6/LZeKGZtY90M5Wn2VZY5Sxt5A4d/wAndzo4hOPqgQB/dptzAUvxLnLGpOEg1KI9hf56pYFphMRmoeGWftxq+rkMchwKSJ1LNfV3ehXtL0nfw9CAvUYgvL5BafhtFC4s+v/YaSu7JOrtr5+szsGRTgeHhq7+G3h/wQ/QTadIzKIBaZ6zPY3nbkH+2aZegdv4tGvGvxth6RcoSHip62c9RjKKjKKyLjOiMz9zIQQ39xWU36J3/I1VjsZNe6z+kLcUyfR4AXcljU0LpmkP2Pmict/NNBL7WwuTZqOAOV+tCkYjnmDaRXhf8sS8s5kDYf14Ep7PWtAe/Q7eGwzpJVC1eMjNKNWvF8NEsNWFa/Y2W8qenFswHXslUZBGC8EKGdj/P4pD89yvNjua1T/hU8oST6n5gtIkm8jy3JkrWKIxvLw19qoi4rVVuZv0v/RaQhfMl2LvMfEGWhZ07L1dQuiKeJI5wQsbH2rFAsdauCcyZRtpRXatlqbnEl11PpaesghI53m75YyKqThW652rwG1AfzYbzWMOB"
`endif