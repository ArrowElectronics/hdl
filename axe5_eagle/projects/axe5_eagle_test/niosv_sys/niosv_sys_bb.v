module niosv_sys (
		output wire [4:0]  axi_bridge_m0_awid,    // axi_bridge_m0.awid
		output wire [30:0] axi_bridge_m0_awaddr,  //              .awaddr
		output wire [7:0]  axi_bridge_m0_awlen,   //              .awlen
		output wire [2:0]  axi_bridge_m0_awsize,  //              .awsize
		output wire [1:0]  axi_bridge_m0_awburst, //              .awburst
		output wire [0:0]  axi_bridge_m0_awlock,  //              .awlock
		output wire [3:0]  axi_bridge_m0_awcache, //              .awcache
		output wire [2:0]  axi_bridge_m0_awprot,  //              .awprot
		output wire        axi_bridge_m0_awvalid, //              .awvalid
		input  wire        axi_bridge_m0_awready, //              .awready
		output wire [31:0] axi_bridge_m0_wdata,   //              .wdata
		output wire [3:0]  axi_bridge_m0_wstrb,   //              .wstrb
		output wire        axi_bridge_m0_wlast,   //              .wlast
		output wire        axi_bridge_m0_wvalid,  //              .wvalid
		input  wire        axi_bridge_m0_wready,  //              .wready
		input  wire [4:0]  axi_bridge_m0_bid,     //              .bid
		input  wire [1:0]  axi_bridge_m0_bresp,   //              .bresp
		input  wire        axi_bridge_m0_bvalid,  //              .bvalid
		output wire        axi_bridge_m0_bready,  //              .bready
		output wire [4:0]  axi_bridge_m0_arid,    //              .arid
		output wire [30:0] axi_bridge_m0_araddr,  //              .araddr
		output wire [7:0]  axi_bridge_m0_arlen,   //              .arlen
		output wire [2:0]  axi_bridge_m0_arsize,  //              .arsize
		output wire [1:0]  axi_bridge_m0_arburst, //              .arburst
		output wire [0:0]  axi_bridge_m0_arlock,  //              .arlock
		output wire [3:0]  axi_bridge_m0_arcache, //              .arcache
		output wire [2:0]  axi_bridge_m0_arprot,  //              .arprot
		output wire        axi_bridge_m0_arvalid, //              .arvalid
		input  wire        axi_bridge_m0_arready, //              .arready
		input  wire [4:0]  axi_bridge_m0_rid,     //              .rid
		input  wire [31:0] axi_bridge_m0_rdata,   //              .rdata
		input  wire [1:0]  axi_bridge_m0_rresp,   //              .rresp
		input  wire        axi_bridge_m0_rlast,   //              .rlast
		input  wire        axi_bridge_m0_rvalid,  //              .rvalid
		output wire        axi_bridge_m0_rready,  //              .rready
		input  wire        clk_100m_clk,          //      clk_100m.clk
		input  wire [7:0]  cruvi_ls_0_in_port,    //    cruvi_ls_0.in_port
		output wire [7:0]  cruvi_ls_0_out_port,   //              .out_port
		input  wire [7:0]  cruvi_ls_1_in_port,    //    cruvi_ls_1.in_port
		output wire [7:0]  cruvi_ls_1_out_port,   //              .out_port
		input  wire [1:0]  fpga_dipsw_export,     //    fpga_dipsw.export
		input  wire [1:0]  fpga_pb_export,        //       fpga_pb.export
		input  wire        hdmi_i2c_sda_in,       //      hdmi_i2c.sda_in
		input  wire        hdmi_i2c_scl_in,       //              .scl_in
		output wire        hdmi_i2c_sda_oe,       //              .sda_oe
		output wire        hdmi_i2c_scl_oe,       //              .scl_oe
		input  wire        dbg_uart_RXD,          //      dbg_uart.RXD
		output wire        dbg_uart_TXD,          //              .TXD
		input  wire        reset_in_reset,        //      reset_in.reset
		output wire [2:0]  rgb_led0_export,       //      rgb_led0.export
		output wire [2:0]  rgb_led1_export,       //      rgb_led1.export
		output wire [2:0]  rgb_led2_export,       //      rgb_led2.export
		output wire [2:0]  rgb_led3_export        //      rgb_led3.export
	);
endmodule

