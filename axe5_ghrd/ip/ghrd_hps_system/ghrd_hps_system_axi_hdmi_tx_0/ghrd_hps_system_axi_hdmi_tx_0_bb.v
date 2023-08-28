module ghrd_hps_system_axi_hdmi_tx_0 (
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
endmodule

