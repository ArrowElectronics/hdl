module ghrd_hps_system_emif_hps_ph2_0 (
		output wire         noc_aclk_0,              //      usr_clk_0.clk
		input  wire [39:0]  s0_axi4_araddr,          //        s0_axi4.araddr
		input  wire [1:0]   s0_axi4_arburst,         //               .arburst
		input  wire [6:0]   s0_axi4_arid,            //               .arid
		input  wire [7:0]   s0_axi4_arlen,           //               .arlen
		input  wire         s0_axi4_arlock,          //               .arlock
		input  wire [3:0]   s0_axi4_arqos,           //               .arqos
		input  wire [2:0]   s0_axi4_arsize,          //               .arsize
		input  wire         s0_axi4_arvalid,         //               .arvalid
		input  wire [13:0]  s0_axi4_aruser,          //               .aruser
		input  wire [2:0]   s0_axi4_arprot,          //               .arprot
		input  wire [39:0]  s0_axi4_awaddr,          //               .awaddr
		input  wire [1:0]   s0_axi4_awburst,         //               .awburst
		input  wire [6:0]   s0_axi4_awid,            //               .awid
		input  wire [7:0]   s0_axi4_awlen,           //               .awlen
		input  wire         s0_axi4_awlock,          //               .awlock
		input  wire [3:0]   s0_axi4_awqos,           //               .awqos
		input  wire [2:0]   s0_axi4_awsize,          //               .awsize
		input  wire         s0_axi4_awvalid,         //               .awvalid
		input  wire [13:0]  s0_axi4_awuser,          //               .awuser
		input  wire [2:0]   s0_axi4_awprot,          //               .awprot
		input  wire         s0_axi4_bready,          //               .bready
		input  wire         s0_axi4_rready,          //               .rready
		input  wire [255:0] s0_axi4_wdata,           //               .wdata
		input  wire [31:0]  s0_axi4_wstrb,           //               .wstrb
		input  wire         s0_axi4_wlast,           //               .wlast
		input  wire         s0_axi4_wvalid,          //               .wvalid
		input  wire [31:0]  s0_axi4_wuser,           //               .wuser
		output wire [31:0]  s0_axi4_ruser,           //               .ruser
		output wire         s0_axi4_arready,         //               .arready
		output wire         s0_axi4_awready,         //               .awready
		output wire [6:0]   s0_axi4_bid,             //               .bid
		output wire [1:0]   s0_axi4_bresp,           //               .bresp
		output wire         s0_axi4_bvalid,          //               .bvalid
		output wire [255:0] s0_axi4_rdata,           //               .rdata
		output wire [6:0]   s0_axi4_rid,             //               .rid
		output wire         s0_axi4_rlast,           //               .rlast
		output wire [1:0]   s0_axi4_rresp,           //               .rresp
		output wire         s0_axi4_rvalid,          //               .rvalid
		output wire         s0_axi4_wready,          //               .wready
		output wire         emif_mem_0_mem_ck_t,     //     emif_mem_0.mem_ck_t
		output wire         emif_mem_0_mem_ck_c,     //               .mem_ck_c
		output wire         emif_mem_0_mem_cke,      //               .mem_cke
		output wire         emif_mem_0_mem_reset_n,  //               .mem_reset_n
		output wire         emif_mem_0_mem_cs,       //               .mem_cs
		output wire [5:0]   emif_mem_0_mem_ca,       //               .mem_ca
		inout  wire [31:0]  emif_mem_0_mem_dq,       //               .mem_dq
		inout  wire [3:0]   emif_mem_0_mem_dqs_t,    //               .mem_dqs_t
		inout  wire [3:0]   emif_mem_0_mem_dqs_c,    //               .mem_dqs_c
		inout  wire [3:0]   emif_mem_0_mem_dmi,      //               .mem_dmi
		input  wire         emif_oct_0_oct_rzqin,    //     emif_oct_0.oct_rzqin
		output wire         s0_noc_axi4lite_clk,     //    s0_axil_clk.clk
		output wire         s0_noc_axi4lite_rst_n,   //  s0_axil_rst_n.reset_n
		input  wire [26:0]  s0_noc_axi4lite_awaddr,  //        s0_axil.awaddr
		input  wire         s0_noc_axi4lite_awvalid, //               .awvalid
		output wire         s0_noc_axi4lite_awready, //               .awready
		input  wire [31:0]  s0_noc_axi4lite_wdata,   //               .wdata
		input  wire [3:0]   s0_noc_axi4lite_wstrb,   //               .wstrb
		input  wire         s0_noc_axi4lite_wvalid,  //               .wvalid
		output wire         s0_noc_axi4lite_wready,  //               .wready
		output wire [1:0]   s0_noc_axi4lite_bresp,   //               .bresp
		output wire         s0_noc_axi4lite_bvalid,  //               .bvalid
		input  wire         s0_noc_axi4lite_bready,  //               .bready
		input  wire [26:0]  s0_noc_axi4lite_araddr,  //               .araddr
		input  wire         s0_noc_axi4lite_arvalid, //               .arvalid
		output wire         s0_noc_axi4lite_arready, //               .arready
		output wire [31:0]  s0_noc_axi4lite_rdata,   //               .rdata
		output wire [1:0]   s0_noc_axi4lite_rresp,   //               .rresp
		output wire         s0_noc_axi4lite_rvalid,  //               .rvalid
		input  wire         s0_noc_axi4lite_rready,  //               .rready
		input  wire [2:0]   s0_noc_axi4lite_awprot,  //               .awprot
		input  wire [2:0]   s0_noc_axi4lite_arprot,  //               .arprot
		output wire         out_reset_0_n,           //    usr_rst_n_0.reset_n
		input  wire         emif_ref_clk_0_clk       // emif_ref_clk_0.clk
	);
endmodule

