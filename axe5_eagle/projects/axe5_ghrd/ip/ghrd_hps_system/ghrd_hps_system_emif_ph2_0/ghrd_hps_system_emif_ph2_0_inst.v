	ghrd_hps_system_emif_ph2_0 u0 (
		.ref_clk_0       (_connected_to_ref_clk_0_),       //   input,    width = 1,       ref_clk_0.clk
		.core_init_n_0   (_connected_to_core_init_n_0_),   //   input,    width = 1,   core_init_n_0.reset_n
		.usr_async_clk_0 (_connected_to_usr_async_clk_0_), //   input,    width = 1, usr_async_clk_0.clk
		.usr_rst_n_0     (_connected_to_usr_rst_n_0_),     //  output,    width = 1,     usr_rst_n_0.reset_n
		.s0_axi4_araddr  (_connected_to_s0_axi4_araddr_),  //   input,   width = 32,         s0_axi4.araddr
		.s0_axi4_arburst (_connected_to_s0_axi4_arburst_), //   input,    width = 2,                .arburst
		.s0_axi4_arid    (_connected_to_s0_axi4_arid_),    //   input,    width = 7,                .arid
		.s0_axi4_arlen   (_connected_to_s0_axi4_arlen_),   //   input,    width = 8,                .arlen
		.s0_axi4_arlock  (_connected_to_s0_axi4_arlock_),  //   input,    width = 1,                .arlock
		.s0_axi4_arqos   (_connected_to_s0_axi4_arqos_),   //   input,    width = 4,                .arqos
		.s0_axi4_arsize  (_connected_to_s0_axi4_arsize_),  //   input,    width = 3,                .arsize
		.s0_axi4_arvalid (_connected_to_s0_axi4_arvalid_), //   input,    width = 1,                .arvalid
		.s0_axi4_aruser  (_connected_to_s0_axi4_aruser_),  //   input,   width = 14,                .aruser
		.s0_axi4_arprot  (_connected_to_s0_axi4_arprot_),  //   input,    width = 3,                .arprot
		.s0_axi4_awaddr  (_connected_to_s0_axi4_awaddr_),  //   input,   width = 32,                .awaddr
		.s0_axi4_awburst (_connected_to_s0_axi4_awburst_), //   input,    width = 2,                .awburst
		.s0_axi4_awid    (_connected_to_s0_axi4_awid_),    //   input,    width = 7,                .awid
		.s0_axi4_awlen   (_connected_to_s0_axi4_awlen_),   //   input,    width = 8,                .awlen
		.s0_axi4_awlock  (_connected_to_s0_axi4_awlock_),  //   input,    width = 1,                .awlock
		.s0_axi4_awqos   (_connected_to_s0_axi4_awqos_),   //   input,    width = 4,                .awqos
		.s0_axi4_awsize  (_connected_to_s0_axi4_awsize_),  //   input,    width = 3,                .awsize
		.s0_axi4_awvalid (_connected_to_s0_axi4_awvalid_), //   input,    width = 1,                .awvalid
		.s0_axi4_awuser  (_connected_to_s0_axi4_awuser_),  //   input,   width = 14,                .awuser
		.s0_axi4_awprot  (_connected_to_s0_axi4_awprot_),  //   input,    width = 3,                .awprot
		.s0_axi4_bready  (_connected_to_s0_axi4_bready_),  //   input,    width = 1,                .bready
		.s0_axi4_rready  (_connected_to_s0_axi4_rready_),  //   input,    width = 1,                .rready
		.s0_axi4_wdata   (_connected_to_s0_axi4_wdata_),   //   input,  width = 256,                .wdata
		.s0_axi4_wstrb   (_connected_to_s0_axi4_wstrb_),   //   input,   width = 32,                .wstrb
		.s0_axi4_wlast   (_connected_to_s0_axi4_wlast_),   //   input,    width = 1,                .wlast
		.s0_axi4_wvalid  (_connected_to_s0_axi4_wvalid_),  //   input,    width = 1,                .wvalid
		.s0_axi4_wuser   (_connected_to_s0_axi4_wuser_),   //   input,   width = 64,                .wuser
		.s0_axi4_ruser   (_connected_to_s0_axi4_ruser_),   //  output,   width = 64,                .ruser
		.s0_axi4_arready (_connected_to_s0_axi4_arready_), //  output,    width = 1,                .arready
		.s0_axi4_awready (_connected_to_s0_axi4_awready_), //  output,    width = 1,                .awready
		.s0_axi4_bid     (_connected_to_s0_axi4_bid_),     //  output,    width = 7,                .bid
		.s0_axi4_bresp   (_connected_to_s0_axi4_bresp_),   //  output,    width = 2,                .bresp
		.s0_axi4_bvalid  (_connected_to_s0_axi4_bvalid_),  //  output,    width = 1,                .bvalid
		.s0_axi4_rdata   (_connected_to_s0_axi4_rdata_),   //  output,  width = 256,                .rdata
		.s0_axi4_rid     (_connected_to_s0_axi4_rid_),     //  output,    width = 7,                .rid
		.s0_axi4_rlast   (_connected_to_s0_axi4_rlast_),   //  output,    width = 1,                .rlast
		.s0_axi4_rresp   (_connected_to_s0_axi4_rresp_),   //  output,    width = 2,                .rresp
		.s0_axi4_rvalid  (_connected_to_s0_axi4_rvalid_),  //  output,    width = 1,                .rvalid
		.s0_axi4_wready  (_connected_to_s0_axi4_wready_),  //  output,    width = 1,                .wready
		.mem_ck_t_0      (_connected_to_mem_ck_t_0_),      //  output,    width = 1,           mem_0.mem_ck_t
		.mem_ck_c_0      (_connected_to_mem_ck_c_0_),      //  output,    width = 1,                .mem_ck_c
		.mem_cke_0       (_connected_to_mem_cke_0_),       //  output,    width = 1,                .mem_cke
		.mem_reset_n_0   (_connected_to_mem_reset_n_0_),   //  output,    width = 1,                .mem_reset_n
		.mem_cs_0        (_connected_to_mem_cs_0_),        //  output,    width = 1,                .mem_cs
		.mem_ca_0        (_connected_to_mem_ca_0_),        //  output,    width = 6,                .mem_ca
		.mem_dq_0        (_connected_to_mem_dq_0_),        //   inout,   width = 32,                .mem_dq
		.mem_dqs_t_0     (_connected_to_mem_dqs_t_0_),     //   inout,    width = 4,                .mem_dqs_t
		.mem_dqs_c_0     (_connected_to_mem_dqs_c_0_),     //   inout,    width = 4,                .mem_dqs_c
		.mem_dmi_0       (_connected_to_mem_dmi_0_),       //   inout,    width = 4,                .mem_dmi
		.oct_rzqin_0     (_connected_to_oct_rzqin_0_),     //   input,    width = 1,           oct_0.oct_rzqin
		.s0_axil_clk     (_connected_to_s0_axil_clk_),     //   input,    width = 1,     s0_axil_clk.clk
		.s0_axil_rst_n   (_connected_to_s0_axil_rst_n_),   //   input,    width = 1,   s0_axil_rst_n.reset_n
		.s0_axil_awaddr  (_connected_to_s0_axil_awaddr_),  //   input,   width = 27,         s0_axil.awaddr
		.s0_axil_awvalid (_connected_to_s0_axil_awvalid_), //   input,    width = 1,                .awvalid
		.s0_axil_awready (_connected_to_s0_axil_awready_), //  output,    width = 1,                .awready
		.s0_axil_wdata   (_connected_to_s0_axil_wdata_),   //   input,   width = 32,                .wdata
		.s0_axil_wstrb   (_connected_to_s0_axil_wstrb_),   //   input,    width = 4,                .wstrb
		.s0_axil_wvalid  (_connected_to_s0_axil_wvalid_),  //   input,    width = 1,                .wvalid
		.s0_axil_wready  (_connected_to_s0_axil_wready_),  //  output,    width = 1,                .wready
		.s0_axil_bresp   (_connected_to_s0_axil_bresp_),   //  output,    width = 2,                .bresp
		.s0_axil_bvalid  (_connected_to_s0_axil_bvalid_),  //  output,    width = 1,                .bvalid
		.s0_axil_bready  (_connected_to_s0_axil_bready_),  //   input,    width = 1,                .bready
		.s0_axil_araddr  (_connected_to_s0_axil_araddr_),  //   input,   width = 27,                .araddr
		.s0_axil_arvalid (_connected_to_s0_axil_arvalid_), //   input,    width = 1,                .arvalid
		.s0_axil_arready (_connected_to_s0_axil_arready_), //  output,    width = 1,                .arready
		.s0_axil_rdata   (_connected_to_s0_axil_rdata_),   //  output,   width = 32,                .rdata
		.s0_axil_rresp   (_connected_to_s0_axil_rresp_),   //  output,    width = 2,                .rresp
		.s0_axil_rvalid  (_connected_to_s0_axil_rvalid_),  //  output,    width = 1,                .rvalid
		.s0_axil_rready  (_connected_to_s0_axil_rready_),  //   input,    width = 1,                .rready
		.s0_axil_awprot  (_connected_to_s0_axil_awprot_),  //   input,    width = 3,                .awprot
		.s0_axil_arprot  (_connected_to_s0_axil_arprot_)   //   input,    width = 3,                .arprot
	);
