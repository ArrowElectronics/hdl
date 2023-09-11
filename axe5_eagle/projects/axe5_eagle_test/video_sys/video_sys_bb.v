module video_sys (
		output wire        hdmi_h_clk,                       //               hdmi.h_clk
		output wire        hdmi_h16_hsync,                   //                   .h16_hsync
		output wire        hdmi_h16_vsync,                   //                   .h16_vsync
		output wire        hdmi_h16_data_e,                  //                   .h16_data_e
		output wire [15:0] hdmi_h16_data,                    //                   .h16_data
		output wire [15:0] hdmi_h16_es_data,                 //                   .h16_es_data
		output wire        hdmi_h24_hsync,                   //                   .h24_hsync
		output wire        hdmi_h24_vsync,                   //                   .h24_vsync
		output wire        hdmi_h24_data_e,                  //                   .h24_data_e
		output wire [23:0] hdmi_h24_data,                    //                   .h24_data
		output wire        hdmi_h36_hsync,                   //                   .h36_hsync
		output wire        hdmi_h36_vsync,                   //                   .h36_vsync
		output wire        hdmi_h36_data_e,                  //                   .h36_data_e
		output wire [35:0] hdmi_h36_data,                    //                   .h36_data
		input  wire        clk_clk,                          //                clk.clk
		output wire        hdmi_dmac_irq,                    //          hdmi_dmac.irq
		output wire        hdmi_dmac_master_awvalid,         //   hdmi_dmac_master.awvalid
		output wire [31:0] hdmi_dmac_master_awaddr,          //                   .awaddr
		input  wire        hdmi_dmac_master_awready,         //                   .awready
		output wire        hdmi_dmac_master_wvalid,          //                   .wvalid
		output wire [63:0] hdmi_dmac_master_wdata,           //                   .wdata
		output wire [7:0]  hdmi_dmac_master_wstrb,           //                   .wstrb
		input  wire        hdmi_dmac_master_wready,          //                   .wready
		input  wire        hdmi_dmac_master_bvalid,          //                   .bvalid
		input  wire [1:0]  hdmi_dmac_master_bresp,           //                   .bresp
		output wire        hdmi_dmac_master_bready,          //                   .bready
		output wire        hdmi_dmac_master_arvalid,         //                   .arvalid
		output wire [31:0] hdmi_dmac_master_araddr,          //                   .araddr
		input  wire        hdmi_dmac_master_arready,         //                   .arready
		input  wire        hdmi_dmac_master_rvalid,          //                   .rvalid
		input  wire [1:0]  hdmi_dmac_master_rresp,           //                   .rresp
		input  wire [63:0] hdmi_dmac_master_rdata,           //                   .rdata
		output wire        hdmi_dmac_master_rready,          //                   .rready
		output wire [3:0]  hdmi_dmac_master_awlen,           //                   .awlen
		output wire [2:0]  hdmi_dmac_master_awsize,          //                   .awsize
		output wire [1:0]  hdmi_dmac_master_awburst,         //                   .awburst
		output wire [3:0]  hdmi_dmac_master_awcache,         //                   .awcache
		output wire [2:0]  hdmi_dmac_master_awprot,          //                   .awprot
		output wire        hdmi_dmac_master_wlast,           //                   .wlast
		output wire [3:0]  hdmi_dmac_master_arlen,           //                   .arlen
		output wire [2:0]  hdmi_dmac_master_arsize,          //                   .arsize
		output wire [1:0]  hdmi_dmac_master_arburst,         //                   .arburst
		output wire [3:0]  hdmi_dmac_master_arcache,         //                   .arcache
		output wire [2:0]  hdmi_dmac_master_arprot,          //                   .arprot
		output wire        hdmi_dmac_master_awid,            //                   .awid
		output wire [1:0]  hdmi_dmac_master_awlock,          //                   .awlock
		output wire        hdmi_dmac_master_wid,             //                   .wid
		output wire        hdmi_dmac_master_arid,            //                   .arid
		output wire [1:0]  hdmi_dmac_master_arlock,          //                   .arlock
		input  wire        hdmi_dmac_master_rid,             //                   .rid
		input  wire        hdmi_dmac_master_bid,             //                   .bid
		input  wire        hdmi_dmac_master_rlast,           //                   .rlast
		input  wire        hdmi_pll_refclk_clk,              //    hdmi_pll_refclk.clk
		output wire        mm_video_bridge_s0_waitrequest,   // mm_video_bridge_s0.waitrequest
		output wire [31:0] mm_video_bridge_s0_readdata,      //                   .readdata
		output wire        mm_video_bridge_s0_readdatavalid, //                   .readdatavalid
		input  wire [0:0]  mm_video_bridge_s0_burstcount,    //                   .burstcount
		input  wire [31:0] mm_video_bridge_s0_writedata,     //                   .writedata
		input  wire [23:0] mm_video_bridge_s0_address,       //                   .address
		input  wire        mm_video_bridge_s0_write,         //                   .write
		input  wire        mm_video_bridge_s0_read,          //                   .read
		input  wire [3:0]  mm_video_bridge_s0_byteenable,    //                   .byteenable
		input  wire        mm_video_bridge_s0_debugaccess,   //                   .debugaccess
		input  wire        reset_reset                       //              reset.reset
	);
endmodule

