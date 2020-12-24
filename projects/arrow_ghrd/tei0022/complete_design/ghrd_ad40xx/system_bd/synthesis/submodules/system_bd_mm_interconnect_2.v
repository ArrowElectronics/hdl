// system_bd_mm_interconnect_2.v

// This file was auto-generated from altera_mm_interconnect_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 20.1 720

`timescale 1 ps / 1 ps
module system_bd_mm_interconnect_2 (
		input  wire [0:0]  hdmi_dmac_0_m_src_axi_awid,                                         //                                        hdmi_dmac_0_m_src_axi.awid
		input  wire [31:0] hdmi_dmac_0_m_src_axi_awaddr,                                       //                                                             .awaddr
		input  wire [3:0]  hdmi_dmac_0_m_src_axi_awlen,                                        //                                                             .awlen
		input  wire [2:0]  hdmi_dmac_0_m_src_axi_awsize,                                       //                                                             .awsize
		input  wire [1:0]  hdmi_dmac_0_m_src_axi_awburst,                                      //                                                             .awburst
		input  wire [1:0]  hdmi_dmac_0_m_src_axi_awlock,                                       //                                                             .awlock
		input  wire [3:0]  hdmi_dmac_0_m_src_axi_awcache,                                      //                                                             .awcache
		input  wire [2:0]  hdmi_dmac_0_m_src_axi_awprot,                                       //                                                             .awprot
		input  wire        hdmi_dmac_0_m_src_axi_awvalid,                                      //                                                             .awvalid
		output wire        hdmi_dmac_0_m_src_axi_awready,                                      //                                                             .awready
		input  wire [0:0]  hdmi_dmac_0_m_src_axi_wid,                                          //                                                             .wid
		input  wire [63:0] hdmi_dmac_0_m_src_axi_wdata,                                        //                                                             .wdata
		input  wire [7:0]  hdmi_dmac_0_m_src_axi_wstrb,                                        //                                                             .wstrb
		input  wire        hdmi_dmac_0_m_src_axi_wlast,                                        //                                                             .wlast
		input  wire        hdmi_dmac_0_m_src_axi_wvalid,                                       //                                                             .wvalid
		output wire        hdmi_dmac_0_m_src_axi_wready,                                       //                                                             .wready
		output wire [0:0]  hdmi_dmac_0_m_src_axi_bid,                                          //                                                             .bid
		output wire [1:0]  hdmi_dmac_0_m_src_axi_bresp,                                        //                                                             .bresp
		output wire        hdmi_dmac_0_m_src_axi_bvalid,                                       //                                                             .bvalid
		input  wire        hdmi_dmac_0_m_src_axi_bready,                                       //                                                             .bready
		input  wire [0:0]  hdmi_dmac_0_m_src_axi_arid,                                         //                                                             .arid
		input  wire [31:0] hdmi_dmac_0_m_src_axi_araddr,                                       //                                                             .araddr
		input  wire [3:0]  hdmi_dmac_0_m_src_axi_arlen,                                        //                                                             .arlen
		input  wire [2:0]  hdmi_dmac_0_m_src_axi_arsize,                                       //                                                             .arsize
		input  wire [1:0]  hdmi_dmac_0_m_src_axi_arburst,                                      //                                                             .arburst
		input  wire [1:0]  hdmi_dmac_0_m_src_axi_arlock,                                       //                                                             .arlock
		input  wire [3:0]  hdmi_dmac_0_m_src_axi_arcache,                                      //                                                             .arcache
		input  wire [2:0]  hdmi_dmac_0_m_src_axi_arprot,                                       //                                                             .arprot
		input  wire        hdmi_dmac_0_m_src_axi_arvalid,                                      //                                                             .arvalid
		output wire        hdmi_dmac_0_m_src_axi_arready,                                      //                                                             .arready
		output wire [0:0]  hdmi_dmac_0_m_src_axi_rid,                                          //                                                             .rid
		output wire [63:0] hdmi_dmac_0_m_src_axi_rdata,                                        //                                                             .rdata
		output wire [1:0]  hdmi_dmac_0_m_src_axi_rresp,                                        //                                                             .rresp
		output wire        hdmi_dmac_0_m_src_axi_rlast,                                        //                                                             .rlast
		output wire        hdmi_dmac_0_m_src_axi_rvalid,                                       //                                                             .rvalid
		input  wire        hdmi_dmac_0_m_src_axi_rready,                                       //                                                             .rready
		output wire [7:0]  sys_hps_f2h_sdram0_data_awid,                                       //                                      sys_hps_f2h_sdram0_data.awid
		output wire [31:0] sys_hps_f2h_sdram0_data_awaddr,                                     //                                                             .awaddr
		output wire [3:0]  sys_hps_f2h_sdram0_data_awlen,                                      //                                                             .awlen
		output wire [2:0]  sys_hps_f2h_sdram0_data_awsize,                                     //                                                             .awsize
		output wire [1:0]  sys_hps_f2h_sdram0_data_awburst,                                    //                                                             .awburst
		output wire [1:0]  sys_hps_f2h_sdram0_data_awlock,                                     //                                                             .awlock
		output wire [3:0]  sys_hps_f2h_sdram0_data_awcache,                                    //                                                             .awcache
		output wire [2:0]  sys_hps_f2h_sdram0_data_awprot,                                     //                                                             .awprot
		output wire        sys_hps_f2h_sdram0_data_awvalid,                                    //                                                             .awvalid
		input  wire        sys_hps_f2h_sdram0_data_awready,                                    //                                                             .awready
		output wire [7:0]  sys_hps_f2h_sdram0_data_wid,                                        //                                                             .wid
		output wire [63:0] sys_hps_f2h_sdram0_data_wdata,                                      //                                                             .wdata
		output wire [7:0]  sys_hps_f2h_sdram0_data_wstrb,                                      //                                                             .wstrb
		output wire        sys_hps_f2h_sdram0_data_wlast,                                      //                                                             .wlast
		output wire        sys_hps_f2h_sdram0_data_wvalid,                                     //                                                             .wvalid
		input  wire        sys_hps_f2h_sdram0_data_wready,                                     //                                                             .wready
		input  wire [7:0]  sys_hps_f2h_sdram0_data_bid,                                        //                                                             .bid
		input  wire [1:0]  sys_hps_f2h_sdram0_data_bresp,                                      //                                                             .bresp
		input  wire        sys_hps_f2h_sdram0_data_bvalid,                                     //                                                             .bvalid
		output wire        sys_hps_f2h_sdram0_data_bready,                                     //                                                             .bready
		output wire [7:0]  sys_hps_f2h_sdram0_data_arid,                                       //                                                             .arid
		output wire [31:0] sys_hps_f2h_sdram0_data_araddr,                                     //                                                             .araddr
		output wire [3:0]  sys_hps_f2h_sdram0_data_arlen,                                      //                                                             .arlen
		output wire [2:0]  sys_hps_f2h_sdram0_data_arsize,                                     //                                                             .arsize
		output wire [1:0]  sys_hps_f2h_sdram0_data_arburst,                                    //                                                             .arburst
		output wire [1:0]  sys_hps_f2h_sdram0_data_arlock,                                     //                                                             .arlock
		output wire [3:0]  sys_hps_f2h_sdram0_data_arcache,                                    //                                                             .arcache
		output wire [2:0]  sys_hps_f2h_sdram0_data_arprot,                                     //                                                             .arprot
		output wire        sys_hps_f2h_sdram0_data_arvalid,                                    //                                                             .arvalid
		input  wire        sys_hps_f2h_sdram0_data_arready,                                    //                                                             .arready
		input  wire [7:0]  sys_hps_f2h_sdram0_data_rid,                                        //                                                             .rid
		input  wire [63:0] sys_hps_f2h_sdram0_data_rdata,                                      //                                                             .rdata
		input  wire [1:0]  sys_hps_f2h_sdram0_data_rresp,                                      //                                                             .rresp
		input  wire        sys_hps_f2h_sdram0_data_rlast,                                      //                                                             .rlast
		input  wire        sys_hps_f2h_sdram0_data_rvalid,                                     //                                                             .rvalid
		output wire        sys_hps_f2h_sdram0_data_rready,                                     //                                                             .rready
		input  wire        sys_hps_h2f_user1_clock_clk,                                        //                                      sys_hps_h2f_user1_clock.clk
		input  wire        hdmi_dmac_0_m_src_axi_id_pad_clk_reset_reset_bridge_in_reset_reset, // hdmi_dmac_0_m_src_axi_id_pad_clk_reset_reset_bridge_in_reset.reset
		input  wire        hdmi_dmac_0_m_src_axi_reset_reset_bridge_in_reset_reset             //            hdmi_dmac_0_m_src_axi_reset_reset_bridge_in_reset.reset
	);

	altera_merlin_axi_translator #(
		.USE_S0_AWID                       (1),
		.USE_S0_AWREGION                   (0),
		.USE_M0_AWREGION                   (1),
		.USE_S0_AWLEN                      (1),
		.USE_S0_AWSIZE                     (1),
		.USE_S0_AWBURST                    (1),
		.USE_S0_AWLOCK                     (1),
		.USE_M0_AWLOCK                     (1),
		.USE_S0_AWCACHE                    (1),
		.USE_M0_AWCACHE                    (1),
		.USE_M0_AWPROT                     (1),
		.USE_S0_AWQOS                      (0),
		.USE_M0_AWQOS                      (1),
		.USE_S0_WSTRB                      (1),
		.USE_M0_WLAST                      (1),
		.USE_S0_BID                        (1),
		.USE_S0_BRESP                      (1),
		.USE_M0_BRESP                      (1),
		.USE_S0_ARID                       (1),
		.USE_S0_ARREGION                   (0),
		.USE_M0_ARREGION                   (1),
		.USE_S0_ARLEN                      (1),
		.USE_S0_ARSIZE                     (1),
		.USE_S0_ARBURST                    (1),
		.USE_S0_ARLOCK                     (1),
		.USE_M0_ARLOCK                     (1),
		.USE_M0_ARCACHE                    (1),
		.USE_M0_ARQOS                      (1),
		.USE_M0_ARPROT                     (1),
		.USE_S0_ARCACHE                    (1),
		.USE_S0_ARQOS                      (0),
		.USE_S0_RID                        (1),
		.USE_S0_RRESP                      (1),
		.USE_M0_RRESP                      (1),
		.USE_S0_RLAST                      (1),
		.M0_ID_WIDTH                       (8),
		.DATA_WIDTH                        (64),
		.S0_ID_WIDTH                       (1),
		.M0_ADDR_WIDTH                     (32),
		.S0_WRITE_ADDR_USER_WIDTH          (1),
		.S0_READ_ADDR_USER_WIDTH           (1),
		.M0_WRITE_ADDR_USER_WIDTH          (1),
		.M0_READ_ADDR_USER_WIDTH           (1),
		.S0_WRITE_DATA_USER_WIDTH          (1),
		.S0_WRITE_RESPONSE_DATA_USER_WIDTH (1),
		.S0_READ_DATA_USER_WIDTH           (1),
		.M0_WRITE_DATA_USER_WIDTH          (1),
		.M0_WRITE_RESPONSE_DATA_USER_WIDTH (1),
		.M0_READ_DATA_USER_WIDTH           (1),
		.S0_ADDR_WIDTH                     (32),
		.USE_S0_AWUSER                     (0),
		.USE_S0_ARUSER                     (0),
		.USE_S0_WUSER                      (0),
		.USE_S0_RUSER                      (0),
		.USE_S0_BUSER                      (0),
		.USE_M0_AWUSER                     (0),
		.USE_M0_ARUSER                     (0),
		.USE_M0_WUSER                      (0),
		.USE_M0_RUSER                      (0),
		.USE_M0_BUSER                      (0),
		.M0_AXI_VERSION                    ("AXI3"),
		.M0_BURST_LENGTH_WIDTH             (4),
		.S0_BURST_LENGTH_WIDTH             (4),
		.M0_LOCK_WIDTH                     (2),
		.S0_LOCK_WIDTH                     (2),
		.S0_AXI_VERSION                    ("AXI3")
	) hdmi_dmac_0_m_src_axi_id_pad (
		.aclk        (sys_hps_h2f_user1_clock_clk),                                          //       clk.clk
		.aresetn     (~hdmi_dmac_0_m_src_axi_id_pad_clk_reset_reset_bridge_in_reset_reset),  // clk_reset.reset_n
		.m0_awid     (sys_hps_f2h_sdram0_data_awid),                                         //        m0.awid
		.m0_awaddr   (sys_hps_f2h_sdram0_data_awaddr),                                       //          .awaddr
		.m0_awlen    (sys_hps_f2h_sdram0_data_awlen),                                        //          .awlen
		.m0_awsize   (sys_hps_f2h_sdram0_data_awsize),                                       //          .awsize
		.m0_awburst  (sys_hps_f2h_sdram0_data_awburst),                                      //          .awburst
		.m0_awlock   (sys_hps_f2h_sdram0_data_awlock),                                       //          .awlock
		.m0_awcache  (sys_hps_f2h_sdram0_data_awcache),                                      //          .awcache
		.m0_awprot   (sys_hps_f2h_sdram0_data_awprot),                                       //          .awprot
		.m0_awvalid  (sys_hps_f2h_sdram0_data_awvalid),                                      //          .awvalid
		.m0_awready  (sys_hps_f2h_sdram0_data_awready),                                      //          .awready
		.m0_wid      (sys_hps_f2h_sdram0_data_wid),                                          //          .wid
		.m0_wdata    (sys_hps_f2h_sdram0_data_wdata),                                        //          .wdata
		.m0_wstrb    (sys_hps_f2h_sdram0_data_wstrb),                                        //          .wstrb
		.m0_wlast    (sys_hps_f2h_sdram0_data_wlast),                                        //          .wlast
		.m0_wvalid   (sys_hps_f2h_sdram0_data_wvalid),                                       //          .wvalid
		.m0_wready   (sys_hps_f2h_sdram0_data_wready),                                       //          .wready
		.m0_bid      (sys_hps_f2h_sdram0_data_bid),                                          //          .bid
		.m0_bresp    (sys_hps_f2h_sdram0_data_bresp),                                        //          .bresp
		.m0_bvalid   (sys_hps_f2h_sdram0_data_bvalid),                                       //          .bvalid
		.m0_bready   (sys_hps_f2h_sdram0_data_bready),                                       //          .bready
		.m0_arid     (sys_hps_f2h_sdram0_data_arid),                                         //          .arid
		.m0_araddr   (sys_hps_f2h_sdram0_data_araddr),                                       //          .araddr
		.m0_arlen    (sys_hps_f2h_sdram0_data_arlen),                                        //          .arlen
		.m0_arsize   (sys_hps_f2h_sdram0_data_arsize),                                       //          .arsize
		.m0_arburst  (sys_hps_f2h_sdram0_data_arburst),                                      //          .arburst
		.m0_arlock   (sys_hps_f2h_sdram0_data_arlock),                                       //          .arlock
		.m0_arcache  (sys_hps_f2h_sdram0_data_arcache),                                      //          .arcache
		.m0_arprot   (sys_hps_f2h_sdram0_data_arprot),                                       //          .arprot
		.m0_arvalid  (sys_hps_f2h_sdram0_data_arvalid),                                      //          .arvalid
		.m0_arready  (sys_hps_f2h_sdram0_data_arready),                                      //          .arready
		.m0_rid      (sys_hps_f2h_sdram0_data_rid),                                          //          .rid
		.m0_rdata    (sys_hps_f2h_sdram0_data_rdata),                                        //          .rdata
		.m0_rresp    (sys_hps_f2h_sdram0_data_rresp),                                        //          .rresp
		.m0_rlast    (sys_hps_f2h_sdram0_data_rlast),                                        //          .rlast
		.m0_rvalid   (sys_hps_f2h_sdram0_data_rvalid),                                       //          .rvalid
		.m0_rready   (sys_hps_f2h_sdram0_data_rready),                                       //          .rready
		.s0_awid     (hdmi_dmac_0_m_src_axi_awid),                                           //        s0.awid
		.s0_awaddr   (hdmi_dmac_0_m_src_axi_awaddr),                                         //          .awaddr
		.s0_awlen    (hdmi_dmac_0_m_src_axi_awlen),                                          //          .awlen
		.s0_awsize   (hdmi_dmac_0_m_src_axi_awsize),                                         //          .awsize
		.s0_awburst  (hdmi_dmac_0_m_src_axi_awburst),                                        //          .awburst
		.s0_awlock   (hdmi_dmac_0_m_src_axi_awlock),                                         //          .awlock
		.s0_awcache  (hdmi_dmac_0_m_src_axi_awcache),                                        //          .awcache
		.s0_awprot   (hdmi_dmac_0_m_src_axi_awprot),                                         //          .awprot
		.s0_awvalid  (hdmi_dmac_0_m_src_axi_awvalid),                                        //          .awvalid
		.s0_awready  (hdmi_dmac_0_m_src_axi_awready),                                        //          .awready
		.s0_wid      (hdmi_dmac_0_m_src_axi_wid),                                            //          .wid
		.s0_wdata    (hdmi_dmac_0_m_src_axi_wdata),                                          //          .wdata
		.s0_wstrb    (hdmi_dmac_0_m_src_axi_wstrb),                                          //          .wstrb
		.s0_wlast    (hdmi_dmac_0_m_src_axi_wlast),                                          //          .wlast
		.s0_wvalid   (hdmi_dmac_0_m_src_axi_wvalid),                                         //          .wvalid
		.s0_wready   (hdmi_dmac_0_m_src_axi_wready),                                         //          .wready
		.s0_bid      (hdmi_dmac_0_m_src_axi_bid),                                            //          .bid
		.s0_bresp    (hdmi_dmac_0_m_src_axi_bresp),                                          //          .bresp
		.s0_bvalid   (hdmi_dmac_0_m_src_axi_bvalid),                                         //          .bvalid
		.s0_bready   (hdmi_dmac_0_m_src_axi_bready),                                         //          .bready
		.s0_arid     (hdmi_dmac_0_m_src_axi_arid),                                           //          .arid
		.s0_araddr   (hdmi_dmac_0_m_src_axi_araddr),                                         //          .araddr
		.s0_arlen    (hdmi_dmac_0_m_src_axi_arlen),                                          //          .arlen
		.s0_arsize   (hdmi_dmac_0_m_src_axi_arsize),                                         //          .arsize
		.s0_arburst  (hdmi_dmac_0_m_src_axi_arburst),                                        //          .arburst
		.s0_arlock   (hdmi_dmac_0_m_src_axi_arlock),                                         //          .arlock
		.s0_arcache  (hdmi_dmac_0_m_src_axi_arcache),                                        //          .arcache
		.s0_arprot   (hdmi_dmac_0_m_src_axi_arprot),                                         //          .arprot
		.s0_arvalid  (hdmi_dmac_0_m_src_axi_arvalid),                                        //          .arvalid
		.s0_arready  (hdmi_dmac_0_m_src_axi_arready),                                        //          .arready
		.s0_rid      (hdmi_dmac_0_m_src_axi_rid),                                            //          .rid
		.s0_rdata    (hdmi_dmac_0_m_src_axi_rdata),                                          //          .rdata
		.s0_rresp    (hdmi_dmac_0_m_src_axi_rresp),                                          //          .rresp
		.s0_rlast    (hdmi_dmac_0_m_src_axi_rlast),                                          //          .rlast
		.s0_rvalid   (hdmi_dmac_0_m_src_axi_rvalid),                                         //          .rvalid
		.s0_rready   (hdmi_dmac_0_m_src_axi_rready),                                         //          .rready
		.m0_awuser   (),                                                                     // (terminated)
		.m0_aruser   (),                                                                     // (terminated)
		.s0_awuser   (1'b0),                                                                 // (terminated)
		.s0_aruser   (1'b0),                                                                 // (terminated)
		.s0_awqos    (4'b0000),                                                              // (terminated)
		.s0_arqos    (4'b0000),                                                              // (terminated)
		.s0_awregion (4'b0000),                                                              // (terminated)
		.s0_arregion (4'b0000),                                                              // (terminated)
		.s0_wuser    (64'b0000000000000000000000000000000000000000000000000000000000000000), // (terminated)
		.s0_ruser    (),                                                                     // (terminated)
		.s0_buser    (),                                                                     // (terminated)
		.m0_awqos    (),                                                                     // (terminated)
		.m0_arqos    (),                                                                     // (terminated)
		.m0_awregion (),                                                                     // (terminated)
		.m0_arregion (),                                                                     // (terminated)
		.m0_wuser    (),                                                                     // (terminated)
		.m0_ruser    (64'b0000000000000000000000000000000000000000000000000000000000000000), // (terminated)
		.m0_buser    (64'b0000000000000000000000000000000000000000000000000000000000000000)  // (terminated)
	);

endmodule
