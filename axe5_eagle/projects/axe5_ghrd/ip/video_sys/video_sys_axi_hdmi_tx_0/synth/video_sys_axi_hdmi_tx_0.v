// video_sys_axi_hdmi_tx_0.v

// Generated using ACDS version 23.4 79

`timescale 1 ps / 1 ps
module video_sys_axi_hdmi_tx_0 (
		input  wire        s_axi_aclk,        // s_axi_clock.clk
		input  wire        s_axi_awvalid,     //       s_axi.awvalid
		input  wire [15:0] s_axi_awaddr,      //            .awaddr
		input  wire [2:0]  s_axi_awprot,      //            .awprot
		output wire        s_axi_awready,     //            .awready
		input  wire        s_axi_wvalid,      //            .wvalid
		input  wire [31:0] s_axi_wdata,       //            .wdata
		input  wire [3:0]  s_axi_wstrb,       //            .wstrb
		output wire        s_axi_wready,      //            .wready
		output wire        s_axi_bvalid,      //            .bvalid
		output wire [1:0]  s_axi_bresp,       //            .bresp
		input  wire        s_axi_bready,      //            .bready
		input  wire        s_axi_arvalid,     //            .arvalid
		input  wire [15:0] s_axi_araddr,      //            .araddr
		input  wire [2:0]  s_axi_arprot,      //            .arprot
		output wire        s_axi_arready,     //            .arready
		output wire        s_axi_rvalid,      //            .rvalid
		output wire [1:0]  s_axi_rresp,       //            .rresp
		output wire [31:0] s_axi_rdata,       //            .rdata
		input  wire        s_axi_rready,      //            .rready
		input  wire        hdmi_clk,          //  hdmi_clock.clk
		output wire        hdmi_out_clk,      //     hdmi_if.h_clk
		output wire        hdmi_16_hsync,     //            .h16_hsync
		output wire        hdmi_16_vsync,     //            .h16_vsync
		output wire        hdmi_16_data_e,    //            .h16_data_e
		output wire [15:0] hdmi_16_data,      //            .h16_data
		output wire [15:0] hdmi_16_es_data,   //            .h16_es_data
		output wire        hdmi_24_hsync,     //            .h24_hsync
		output wire        hdmi_24_vsync,     //            .h24_vsync
		output wire        hdmi_24_data_e,    //            .h24_data_e
		output wire [23:0] hdmi_24_data,      //            .h24_data
		output wire        hdmi_36_hsync,     //            .h36_hsync
		output wire        hdmi_36_vsync,     //            .h36_vsync
		output wire        hdmi_36_data_e,    //            .h36_data_e
		output wire [35:0] hdmi_36_data,      //            .h36_data
		input  wire        vdma_clk,          //  vdma_clock.clk
		input  wire        s_axi_aresetn,     //  vdma_reset.reset_n
		input  wire        vdma_end_of_frame, //     vdma_if.tlast
		input  wire        vdma_valid,        //            .tvalid
		input  wire [63:0] vdma_data,         //            .tdata
		output wire        vdma_ready         //            .tready
	);

	axi_hdmi_tx #(
		.FPGA_TECHNOLOGY  (102),
		.INTERFACE        ("16_BIT"),
		.CR_CB_N          (0),
		.OUT_CLK_POLARITY (0)
	) axi_hdmi_tx_0 (
		.s_axi_aclk        (s_axi_aclk),        //   input,   width = 1, s_axi_clock.clk
		.s_axi_awvalid     (s_axi_awvalid),     //   input,   width = 1,       s_axi.awvalid
		.s_axi_awaddr      (s_axi_awaddr),      //   input,  width = 16,            .awaddr
		.s_axi_awprot      (s_axi_awprot),      //   input,   width = 3,            .awprot
		.s_axi_awready     (s_axi_awready),     //  output,   width = 1,            .awready
		.s_axi_wvalid      (s_axi_wvalid),      //   input,   width = 1,            .wvalid
		.s_axi_wdata       (s_axi_wdata),       //   input,  width = 32,            .wdata
		.s_axi_wstrb       (s_axi_wstrb),       //   input,   width = 4,            .wstrb
		.s_axi_wready      (s_axi_wready),      //  output,   width = 1,            .wready
		.s_axi_bvalid      (s_axi_bvalid),      //  output,   width = 1,            .bvalid
		.s_axi_bresp       (s_axi_bresp),       //  output,   width = 2,            .bresp
		.s_axi_bready      (s_axi_bready),      //   input,   width = 1,            .bready
		.s_axi_arvalid     (s_axi_arvalid),     //   input,   width = 1,            .arvalid
		.s_axi_araddr      (s_axi_araddr),      //   input,  width = 16,            .araddr
		.s_axi_arprot      (s_axi_arprot),      //   input,   width = 3,            .arprot
		.s_axi_arready     (s_axi_arready),     //  output,   width = 1,            .arready
		.s_axi_rvalid      (s_axi_rvalid),      //  output,   width = 1,            .rvalid
		.s_axi_rresp       (s_axi_rresp),       //  output,   width = 2,            .rresp
		.s_axi_rdata       (s_axi_rdata),       //  output,  width = 32,            .rdata
		.s_axi_rready      (s_axi_rready),      //   input,   width = 1,            .rready
		.hdmi_clk          (hdmi_clk),          //   input,   width = 1,  hdmi_clock.clk
		.hdmi_out_clk      (hdmi_out_clk),      //  output,   width = 1,     hdmi_if.h_clk
		.hdmi_16_hsync     (hdmi_16_hsync),     //  output,   width = 1,            .h16_hsync
		.hdmi_16_vsync     (hdmi_16_vsync),     //  output,   width = 1,            .h16_vsync
		.hdmi_16_data_e    (hdmi_16_data_e),    //  output,   width = 1,            .h16_data_e
		.hdmi_16_data      (hdmi_16_data),      //  output,  width = 16,            .h16_data
		.hdmi_16_es_data   (hdmi_16_es_data),   //  output,  width = 16,            .h16_es_data
		.hdmi_24_hsync     (hdmi_24_hsync),     //  output,   width = 1,            .h24_hsync
		.hdmi_24_vsync     (hdmi_24_vsync),     //  output,   width = 1,            .h24_vsync
		.hdmi_24_data_e    (hdmi_24_data_e),    //  output,   width = 1,            .h24_data_e
		.hdmi_24_data      (hdmi_24_data),      //  output,  width = 24,            .h24_data
		.hdmi_36_hsync     (hdmi_36_hsync),     //  output,   width = 1,            .h36_hsync
		.hdmi_36_vsync     (hdmi_36_vsync),     //  output,   width = 1,            .h36_vsync
		.hdmi_36_data_e    (hdmi_36_data_e),    //  output,   width = 1,            .h36_data_e
		.hdmi_36_data      (hdmi_36_data),      //  output,  width = 36,            .h36_data
		.vdma_clk          (vdma_clk),          //   input,   width = 1,  vdma_clock.clk
		.s_axi_aresetn     (s_axi_aresetn),     //   input,   width = 1,  vdma_reset.reset_n
		.vdma_end_of_frame (vdma_end_of_frame), //   input,   width = 1,     vdma_if.tlast
		.vdma_valid        (vdma_valid),        //   input,   width = 1,            .tvalid
		.vdma_data         (vdma_data),         //   input,  width = 64,            .tdata
		.vdma_ready        (vdma_ready)         //  output,   width = 1,            .tready
	);

endmodule