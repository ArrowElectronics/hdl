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



module ghrd_hps_system_intel_agilex_5_soc_0_intel_sundancemesa_mpfe_100_hrvlzia(
  input wire [0 : 0 ] f2sdram_clk
 ,input wire [0 : 0 ] f2sdram_rst_n
 ,input wire [31 : 0 ] f2sdram_araddr
 ,input wire [1 : 0 ] f2sdram_arburst
 ,input wire [3 : 0 ] f2sdram_arcache
 ,input wire [4 : 0 ] f2sdram_arid
 ,input wire [7 : 0 ] f2sdram_arlen
 ,input wire [0 : 0 ] f2sdram_arlock
 ,input wire [2 : 0 ] f2sdram_arprot
 ,input wire [3 : 0 ] f2sdram_arqos
 ,output wire [0 : 0 ] f2sdram_arready
 ,input wire [2 : 0 ] f2sdram_arsize
 ,input wire [0 : 0 ] f2sdram_arvalid
 ,input wire [31 : 0 ] f2sdram_awaddr
 ,input wire [1 : 0 ] f2sdram_awburst
 ,input wire [3 : 0 ] f2sdram_awcache
 ,input wire [4 : 0 ] f2sdram_awid
 ,input wire [7 : 0 ] f2sdram_awlen
 ,input wire [0 : 0 ] f2sdram_awlock
 ,input wire [2 : 0 ] f2sdram_awprot
 ,input wire [3 : 0 ] f2sdram_awqos
 ,output wire [0 : 0 ] f2sdram_awready
 ,input wire [2 : 0 ] f2sdram_awsize
 ,input wire [0 : 0 ] f2sdram_awvalid
 ,output wire [4 : 0 ] f2sdram_bid
 ,input wire [0 : 0 ] f2sdram_bready
 ,output wire [1 : 0 ] f2sdram_bresp
 ,output wire [0 : 0 ] f2sdram_bvalid
 ,output wire [63 : 0 ] f2sdram_rdata
 ,output wire [4 : 0 ] f2sdram_rid
 ,output wire [0 : 0 ] f2sdram_rlast
 ,input wire [0 : 0 ] f2sdram_rready
 ,output wire [1 : 0 ] f2sdram_rresp
 ,output wire [0 : 0 ] f2sdram_rvalid
 ,input wire [63 : 0 ] f2sdram_wdata
 ,input wire [0 : 0 ] f2sdram_wlast
 ,output wire [0 : 0 ] f2sdram_wready
 ,input wire [7 : 0 ] f2sdram_wstrb
 ,input wire [0 : 0 ] f2sdram_wvalid
 ,input wire [7 : 0 ] f2sdram_aruser
 ,input wire [7 : 0 ] f2sdram_awuser
 ,input wire [7 : 0 ] f2sdram_wuser
 ,output wire [7 : 0 ] f2sdram_buser
 ,input wire [3 : 0 ] f2sdram_arregion
 ,output wire [7 : 0 ] f2sdram_ruser
 ,input wire [3 : 0 ] f2sdram_awregion
 ,input wire [0 : 0 ] sdram_bridge_rst_n
 ,output wire [0 : 0 ] sdram_bridge_ack
 ,input wire [0 : 0 ] sdram_bridge_req
 ,output wire [0 : 0 ] sdram_tbu_pmu_irpt
 ,output wire [0 : 0 ] sdram_tbu_ras_irpt
 ,input wire [0 : 0 ] emif_csr_axi_clk
 ,input wire [0 : 0 ] emif_csr_axi_rst
 ,input wire [0 : 0 ] emif_mem_cfg_arready
 ,input wire [0 : 0 ] emif_mem_cfg_awready
 ,input wire [1 : 0 ] emif_mem_cfg_bresp
 ,input wire [0 : 0 ] emif_mem_cfg_bvalid
 ,input wire [31 : 0 ] emif_mem_cfg_rdata
 ,input wire [1 : 0 ] emif_mem_cfg_rresp
 ,input wire [0 : 0 ] emif_mem_cfg_rvalid
 ,input wire [0 : 0 ] emif_mem_cfg_wready
 ,output wire [31 : 0 ] emif_mem_cfg_araddr
 ,output wire [0 : 0 ] emif_mem_cfg_arvalid
 ,output wire [31 : 0 ] emif_mem_cfg_awaddr
 ,output wire [0 : 0 ] emif_mem_cfg_awvalid
 ,output wire [0 : 0 ] emif_mem_cfg_bready
 ,output wire [0 : 0 ] emif_mem_cfg_rready
 ,output wire [31 : 0 ] emif_mem_cfg_wdata
 ,output wire [3 : 0 ] emif_mem_cfg_wstrb
 ,output wire [0 : 0 ] emif_mem_cfg_wvalid
 ,output wire [2 : 0 ] emif_mem_cfg_arprot
 ,output wire [2 : 0 ] emif_mem_cfg_awprot
 ,input wire [0 : 0 ] emif_ch0_axi_clk
 ,input wire [0 : 0 ] emif_ch0_axi_rst
 ,input wire [0 : 0 ] emif0_arready
 ,input wire [0 : 0 ] emif0_awready
 ,input wire [6 : 0 ] emif0_bid
 ,input wire [1 : 0 ] emif0_bresp
 ,input wire [0 : 0 ] emif0_bvalid
 ,input wire [255 : 0 ] emif0_rdata
 ,input wire [6 : 0 ] emif0_rid
 ,input wire [0 : 0 ] emif0_rlast
 ,input wire [1 : 0 ] emif0_rresp
 ,input wire [31 : 0 ] emif0_ruser
 ,input wire [0 : 0 ] emif0_rvalid
 ,input wire [0 : 0 ] emif0_wready
 ,output wire [43 : 0 ] emif0_araddr
 ,output wire [1 : 0 ] emif0_arburst
 ,output wire [6 : 0 ] emif0_arid
 ,output wire [7 : 0 ] emif0_arlen
 ,output wire [0 : 0 ] emif0_arlock
 ,output wire [3 : 0 ] emif0_arqos
 ,output wire [2 : 0 ] emif0_arsize
 ,output wire [13 : 0 ] emif0_aruser
 ,output wire [0 : 0 ] emif0_arvalid
 ,output wire [43 : 0 ] emif0_awaddr
 ,output wire [1 : 0 ] emif0_awburst
 ,output wire [6 : 0 ] emif0_awid
 ,output wire [7 : 0 ] emif0_awlen
 ,output wire [0 : 0 ] emif0_awlock
 ,output wire [3 : 0 ] emif0_awqos
 ,output wire [2 : 0 ] emif0_awsize
 ,output wire [13 : 0 ] emif0_awuser
 ,output wire [0 : 0 ] emif0_awvalid
 ,output wire [0 : 0 ] emif0_bready
 ,output wire [0 : 0 ] emif0_rready
 ,output wire [255 : 0 ] emif0_wdata
 ,output wire [0 : 0 ] emif0_wlast
 ,output wire [31 : 0 ] emif0_wstrb
 ,output wire [31 : 0 ] emif0_wuser
 ,output wire [0 : 0 ] emif0_wvalid
 ,output wire [2 : 0 ] emif0_arprot
 ,output wire [2 : 0 ] emif0_awprot
 ,input wire [0 : 0 ] hps2mpfe_ccu_clk
 ,input wire [0 : 0 ] hps2mpfe_ccu_rst
 ,input wire [43 : 0 ] hps2mpfe_dmi0_araddr
 ,input wire [1 : 0 ] hps2mpfe_dmi0_arburst
 ,input wire [3 : 0 ] hps2mpfe_dmi0_arcache
 ,input wire [9 : 0 ] hps2mpfe_dmi0_arid
 ,input wire [7 : 0 ] hps2mpfe_dmi0_arlen
 ,input wire [0 : 0 ] hps2mpfe_dmi0_arlock
 ,input wire [2 : 0 ] hps2mpfe_dmi0_arprot
 ,input wire [3 : 0 ] hps2mpfe_dmi0_arqos
 ,output wire [0 : 0 ] hps2mpfe_dmi0_arready
 ,input wire [2 : 0 ] hps2mpfe_dmi0_arsize
 ,input wire [7 : 0 ] hps2mpfe_dmi0_aruser
 ,input wire [0 : 0 ] hps2mpfe_dmi0_arvalid
 ,input wire [43 : 0 ] hps2mpfe_dmi0_awaddr
 ,input wire [1 : 0 ] hps2mpfe_dmi0_awburst
 ,input wire [3 : 0 ] hps2mpfe_dmi0_awcache
 ,input wire [9 : 0 ] hps2mpfe_dmi0_awid
 ,input wire [7 : 0 ] hps2mpfe_dmi0_awlen
 ,input wire [0 : 0 ] hps2mpfe_dmi0_awlock
 ,input wire [2 : 0 ] hps2mpfe_dmi0_awprot
 ,input wire [3 : 0 ] hps2mpfe_dmi0_awqos
 ,output wire [0 : 0 ] hps2mpfe_dmi0_awready
 ,input wire [2 : 0 ] hps2mpfe_dmi0_awsize
 ,input wire [7 : 0 ] hps2mpfe_dmi0_awuser
 ,input wire [0 : 0 ] hps2mpfe_dmi0_awvalid
 ,output wire [9 : 0 ] hps2mpfe_dmi0_bid
 ,input wire [0 : 0 ] hps2mpfe_dmi0_bready
 ,output wire [1 : 0 ] hps2mpfe_dmi0_bresp
 ,output wire [0 : 0 ] hps2mpfe_dmi0_bvalid
 ,output wire [255 : 0 ] hps2mpfe_dmi0_rdata
 ,output wire [9 : 0 ] hps2mpfe_dmi0_rid
 ,output wire [0 : 0 ] hps2mpfe_dmi0_rlast
 ,input wire [0 : 0 ] hps2mpfe_dmi0_rready
 ,output wire [1 : 0 ] hps2mpfe_dmi0_rresp
 ,output wire [0 : 0 ] hps2mpfe_dmi0_rvalid
 ,input wire [255 : 0 ] hps2mpfe_dmi0_wdata
 ,input wire [0 : 0 ] hps2mpfe_dmi0_wlast
 ,output wire [0 : 0 ] hps2mpfe_dmi0_wready
 ,input wire [31 : 0 ] hps2mpfe_dmi0_wstrb
 ,input wire [0 : 0 ] hps2mpfe_dmi0_wvalid
 ,input wire [43 : 0 ] hps2mpfe_dmi1_araddr
 ,input wire [1 : 0 ] hps2mpfe_dmi1_arburst
 ,input wire [3 : 0 ] hps2mpfe_dmi1_arcache
 ,input wire [9 : 0 ] hps2mpfe_dmi1_arid
 ,input wire [7 : 0 ] hps2mpfe_dmi1_arlen
 ,input wire [0 : 0 ] hps2mpfe_dmi1_arlock
 ,input wire [2 : 0 ] hps2mpfe_dmi1_arprot
 ,input wire [3 : 0 ] hps2mpfe_dmi1_arqos
 ,output wire [0 : 0 ] hps2mpfe_dmi1_arready
 ,input wire [2 : 0 ] hps2mpfe_dmi1_arsize
 ,input wire [7 : 0 ] hps2mpfe_dmi1_aruser
 ,input wire [0 : 0 ] hps2mpfe_dmi1_arvalid
 ,input wire [43 : 0 ] hps2mpfe_dmi1_awaddr
 ,input wire [1 : 0 ] hps2mpfe_dmi1_awburst
 ,input wire [3 : 0 ] hps2mpfe_dmi1_awcache
 ,input wire [9 : 0 ] hps2mpfe_dmi1_awid
 ,input wire [7 : 0 ] hps2mpfe_dmi1_awlen
 ,input wire [0 : 0 ] hps2mpfe_dmi1_awlock
 ,input wire [2 : 0 ] hps2mpfe_dmi1_awprot
 ,input wire [3 : 0 ] hps2mpfe_dmi1_awqos
 ,output wire [0 : 0 ] hps2mpfe_dmi1_awready
 ,input wire [2 : 0 ] hps2mpfe_dmi1_awsize
 ,input wire [7 : 0 ] hps2mpfe_dmi1_awuser
 ,input wire [0 : 0 ] hps2mpfe_dmi1_awvalid
 ,output wire [9 : 0 ] hps2mpfe_dmi1_bid
 ,input wire [0 : 0 ] hps2mpfe_dmi1_bready
 ,output wire [1 : 0 ] hps2mpfe_dmi1_bresp
 ,output wire [0 : 0 ] hps2mpfe_dmi1_bvalid
 ,output wire [255 : 0 ] hps2mpfe_dmi1_rdata
 ,output wire [9 : 0 ] hps2mpfe_dmi1_rid
 ,output wire [0 : 0 ] hps2mpfe_dmi1_rlast
 ,input wire [0 : 0 ] hps2mpfe_dmi1_rready
 ,output wire [1 : 0 ] hps2mpfe_dmi1_rresp
 ,output wire [0 : 0 ] hps2mpfe_dmi1_rvalid
 ,input wire [255 : 0 ] hps2mpfe_dmi1_wdata
 ,input wire [0 : 0 ] hps2mpfe_dmi1_wlast
 ,output wire [0 : 0 ] hps2mpfe_dmi1_wready
 ,input wire [31 : 0 ] hps2mpfe_dmi1_wstrb
 ,input wire [0 : 0 ] hps2mpfe_dmi1_wvalid
 ,input wire [43 : 0 ] hps2mpfe_csr_araddr
 ,input wire [1 : 0 ] hps2mpfe_csr_arburst
 ,input wire [3 : 0 ] hps2mpfe_csr_arcache
 ,input wire [9 : 0 ] hps2mpfe_csr_arid
 ,input wire [7 : 0 ] hps2mpfe_csr_arlen
 ,input wire [0 : 0 ] hps2mpfe_csr_arlock
 ,input wire [2 : 0 ] hps2mpfe_csr_arprot
 ,output wire [0 : 0 ] hps2mpfe_csr_arready
 ,input wire [2 : 0 ] hps2mpfe_csr_arsize
 ,input wire [7 : 0 ] hps2mpfe_csr_aruser
 ,input wire [0 : 0 ] hps2mpfe_csr_arvalid
 ,input wire [43 : 0 ] hps2mpfe_csr_awaddr
 ,input wire [1 : 0 ] hps2mpfe_csr_awburst
 ,input wire [3 : 0 ] hps2mpfe_csr_awcache
 ,input wire [9 : 0 ] hps2mpfe_csr_awid
 ,input wire [7 : 0 ] hps2mpfe_csr_awlen
 ,input wire [0 : 0 ] hps2mpfe_csr_awlock
 ,input wire [2 : 0 ] hps2mpfe_csr_awprot
 ,output wire [0 : 0 ] hps2mpfe_csr_awready
 ,input wire [2 : 0 ] hps2mpfe_csr_awsize
 ,input wire [7 : 0 ] hps2mpfe_csr_awuser
 ,input wire [0 : 0 ] hps2mpfe_csr_awvalid
 ,output wire [9 : 0 ] hps2mpfe_csr_bid
 ,input wire [0 : 0 ] hps2mpfe_csr_bready
 ,output wire [1 : 0 ] hps2mpfe_csr_bresp
 ,output wire [0 : 0 ] hps2mpfe_csr_bvalid
 ,output wire [63 : 0 ] hps2mpfe_csr_rdata
 ,output wire [9 : 0 ] hps2mpfe_csr_rid
 ,output wire [0 : 0 ] hps2mpfe_csr_rlast
 ,input wire [0 : 0 ] hps2mpfe_csr_rready
 ,output wire [1 : 0 ] hps2mpfe_csr_rresp
 ,output wire [0 : 0 ] hps2mpfe_csr_rvalid
 ,input wire [63 : 0 ] hps2mpfe_csr_wdata
 ,input wire [0 : 0 ] hps2mpfe_csr_wlast
 ,output wire [0 : 0 ] hps2mpfe_csr_wready
 ,input wire [7 : 0 ] hps2mpfe_csr_wstrb
 ,input wire [0 : 0 ] hps2mpfe_csr_wvalid
);




wire [0 : 0] f2sdram_clk_intr;
wire [0 : 0] f2sdram_rst_n_intr;
wire [31 : 0] f2sdram_araddr_intr;
wire [1 : 0] f2sdram_arburst_intr;
wire [3 : 0] f2sdram_arcache_intr;
wire [4 : 0] f2sdram_arid_intr;
wire [7 : 0] f2sdram_arlen_intr;
wire [0 : 0] f2sdram_arlock_intr;
wire [2 : 0] f2sdram_arprot_intr;
wire [3 : 0] f2sdram_arqos_intr;
wire [0 : 0] f2sdram_arready_intr;
wire [2 : 0] f2sdram_arsize_intr;
wire [0 : 0] f2sdram_arvalid_intr;
wire [31 : 0] f2sdram_awaddr_intr;
wire [1 : 0] f2sdram_awburst_intr;
wire [3 : 0] f2sdram_awcache_intr;
wire [4 : 0] f2sdram_awid_intr;
wire [7 : 0] f2sdram_awlen_intr;
wire [0 : 0] f2sdram_awlock_intr;
wire [2 : 0] f2sdram_awprot_intr;
wire [3 : 0] f2sdram_awqos_intr;
wire [0 : 0] f2sdram_awready_intr;
wire [2 : 0] f2sdram_awsize_intr;
wire [0 : 0] f2sdram_awvalid_intr;
wire [4 : 0] f2sdram_bid_intr;
wire [0 : 0] f2sdram_bready_intr;
wire [1 : 0] f2sdram_bresp_intr;
wire [0 : 0] f2sdram_bvalid_intr;
wire [63 : 0] f2sdram_rdata_intr;
wire [4 : 0] f2sdram_rid_intr;
wire [0 : 0] f2sdram_rlast_intr;
wire [0 : 0] f2sdram_rready_intr;
wire [1 : 0] f2sdram_rresp_intr;
wire [0 : 0] f2sdram_rvalid_intr;
wire [63 : 0] f2sdram_wdata_intr;
wire [0 : 0] f2sdram_wlast_intr;
wire [0 : 0] f2sdram_wready_intr;
wire [7 : 0] f2sdram_wstrb_intr;
wire [0 : 0] f2sdram_wvalid_intr;
wire [7 : 0] f2sdram_aruser_intr;
wire [7 : 0] f2sdram_awuser_intr;
wire [7 : 0] f2sdram_wuser_intr;
wire [7 : 0] f2sdram_buser_intr;
wire [3 : 0] f2sdram_arregion_intr;
wire [7 : 0] f2sdram_ruser_intr;
wire [3 : 0] f2sdram_awregion_intr;

hps_ready_latency_adp_axi4 # (.LOG_DEPTH(3), .NUM_PIPELINES(2), .ADDR_WIDTH(32), .DATA_WIDTH(64), .STRB_WIDTH(64/8), .ID_WIDTH(5), .AUSER_WIDTH(8)) sundancemesa_mpfe_ready_latency_adp_inst_f2sdram (  

  .clk(f2sdram_clk)
, .reset(~f2sdram_rst_n)
, .araddr(f2sdram_araddr)
, .arburst(f2sdram_arburst)
, .arcache(f2sdram_arcache)
, .arid(f2sdram_arid)
, .arlen(f2sdram_arlen)
, .arlock(f2sdram_arlock)
, .arprot(f2sdram_arprot)
, .arqos(f2sdram_arqos)
, .arready(f2sdram_arready_intr)
, .arsize(f2sdram_arsize)
, .arvalid(f2sdram_arvalid)
, .awaddr(f2sdram_awaddr)
, .awburst(f2sdram_awburst)
, .awcache(f2sdram_awcache)
, .awid(f2sdram_awid)
, .awlen(f2sdram_awlen)
, .awlock(f2sdram_awlock)
, .awprot(f2sdram_awprot)
, .awqos(f2sdram_awqos)
, .awready(f2sdram_awready_intr)
, .awsize(f2sdram_awsize)
, .awvalid(f2sdram_awvalid)
, .bid(f2sdram_bid_intr)
, .bready(f2sdram_bready)
, .bresp(f2sdram_bresp_intr)
, .bvalid(f2sdram_bvalid_intr)
, .rdata(f2sdram_rdata_intr)
, .rid(f2sdram_rid_intr)
, .rlast(f2sdram_rlast_intr)
, .rready(f2sdram_rready)
, .rresp(f2sdram_rresp_intr)
, .rvalid(f2sdram_rvalid_intr)
, .wdata(f2sdram_wdata)
, .wlast(f2sdram_wlast)
, .wready(f2sdram_wready_intr)
, .wstrb(f2sdram_wstrb)
, .wvalid(f2sdram_wvalid)
, .aruser(f2sdram_aruser)
, .awuser(f2sdram_awuser)
, .wuser(f2sdram_wuser)
, .buser(f2sdram_buser_intr)
, .arregion(f2sdram_arregion)
, .ruser(f2sdram_ruser_intr)
, .awregion(f2sdram_awregion)
, .araddr_r(f2sdram_araddr_intr)
, .arburst_r(f2sdram_arburst_intr)
, .arcache_r(f2sdram_arcache_intr)
, .arid_r(f2sdram_arid_intr)
, .arlen_r(f2sdram_arlen_intr)
, .arlock_r(f2sdram_arlock_intr)
, .arprot_r(f2sdram_arprot_intr)
, .arqos_r(f2sdram_arqos_intr)
, .arready_r(f2sdram_arready)
, .arsize_r(f2sdram_arsize_intr)
, .arvalid_r(f2sdram_arvalid_intr)
, .awaddr_r(f2sdram_awaddr_intr)
, .awburst_r(f2sdram_awburst_intr)
, .awcache_r(f2sdram_awcache_intr)
, .awid_r(f2sdram_awid_intr)
, .awlen_r(f2sdram_awlen_intr)
, .awlock_r(f2sdram_awlock_intr)
, .awprot_r(f2sdram_awprot_intr)
, .awqos_r(f2sdram_awqos_intr)
, .awready_r(f2sdram_awready)
, .awsize_r(f2sdram_awsize_intr)
, .awvalid_r(f2sdram_awvalid_intr)
, .bid_r(f2sdram_bid)
, .bready_r(f2sdram_bready_intr)
, .bresp_r(f2sdram_bresp)
, .bvalid_r(f2sdram_bvalid)
, .rdata_r(f2sdram_rdata)
, .rid_r(f2sdram_rid)
, .rlast_r(f2sdram_rlast)
, .rready_r(f2sdram_rready_intr)
, .rresp_r(f2sdram_rresp)
, .rvalid_r(f2sdram_rvalid)
, .wdata_r(f2sdram_wdata_intr)
, .wlast_r(f2sdram_wlast_intr)
, .wready_r(f2sdram_wready)
, .wstrb_r(f2sdram_wstrb_intr)
, .wvalid_r(f2sdram_wvalid_intr)
, .aruser_r(f2sdram_aruser_intr)
, .awuser_r(f2sdram_awuser_intr)
, .wuser_r(f2sdram_wuser_intr)
, .buser_r(f2sdram_buser)
, .arregion_r(f2sdram_arregion_intr)
, .ruser_r(f2sdram_ruser)
, .awregion_r(f2sdram_awregion_intr)

);


	
(* preserve *)(* altera_attribute = {"-name PRESERVE_FANOUT_FREE_WYSIWYG ON; -name FORCE_HYPER_REGISTER_FOR_CORE_PERIPHERY_TRANSFER ON; -name HYPER_REGISTER_DELAY_CHAIN 350"} *) 
tennm_sm_soc_mpfe #(
.mpfe_enable("MPFE_ENABLE_ENABLE")
,.mpfe_f2sdram_port_width("MPFE_F2SDRAM_PORT_WIDTH_DATA_WIDTH_64")
,.topology("TOPOLOGY_SINGLE_32_BIT")
 ) sundancemesa_mpfe_inst (
  .ccu_dmi0_AWREADY({
     hps2mpfe_dmi0_awready[0:0]
  })
 ,.ccu_dmi1_RDATA({
     hps2mpfe_dmi1_rdata[255:0]
  })
 ,.io96b0_p0_clk({
     emif_ch0_axi_clk[0:0]
  })
 ,.io96b0_p0_AWQOS({
     emif0_awqos[3:0]
  })
 ,.ccu_dmi0_ARPROT({
     hps2mpfe_dmi0_arprot[2:0]
  })
 ,.io96b0_csr_AWREADY({
     emif_mem_cfg_awready[0:0]
  })
 ,.ccu_dmi0_WLAST({
     hps2mpfe_dmi0_wlast[0:0]
  })
 ,.ccu_dmi0_ARSIZE({
     hps2mpfe_dmi0_arsize[2:0]
  })
 ,.f2sdram_AWBURST({
     f2sdram_awburst_intr[1:0]
  })
 ,.io96b0_csr_RREADY({
     emif_mem_cfg_rready[0:0]
  })
 ,.io96b0_csr_WVALID({
     emif_mem_cfg_wvalid[0:0]
  })
 ,.io96b0_p0_AWLEN({
     emif0_awlen[7:0]
  })
 ,.ccu_dmi0_RDATA({
     hps2mpfe_dmi0_rdata[255:0]
  })
 ,.io96b0_p0_ARID({
     emif0_arid[6:0]
  })
 ,.f2sdram_flush_req({
     sdram_bridge_req[0:0]
  })
 ,.mpfe_csr_RVALID({
     hps2mpfe_csr_rvalid[0:0]
  })
 ,.io96b0_p0_RVALID({
     emif0_rvalid[0:0]
  })
 ,.f2sdram_ARVALID({
     f2sdram_arvalid_intr[0:0]
  })
 ,.ccu_dmi1_BREADY({
     hps2mpfe_dmi1_bready[0:0]
  })
 ,.f2sdram_WUSER({
     f2sdram_wuser_intr[7:0]
  })
 ,.ccu_dmi0_ARBURST({
     hps2mpfe_dmi0_arburst[1:0]
  })
 ,.f2sdram_ARPROT({
     f2sdram_arprot_intr[2:0]
  })
 ,.ccu_dmi1_AWADDR({
     hps2mpfe_dmi1_awaddr[43:0]
  })
 ,.ccu_dmi1_BRESP({
     hps2mpfe_dmi1_bresp[1:0]
  })
 ,.f2sdram_WSTRB({
     f2sdram_wstrb_intr[7:0]
  })
 ,.f2soc_ARMMUSECSID({
     1'b0
  })
 ,.ccu_dmi0_ARID({
     hps2mpfe_dmi0_arid[9:0]
  })
 ,.f2sdram_ARSIZE({
     f2sdram_arsize_intr[2:0]
  })
 ,.f2sdram_RLAST({
     f2sdram_rlast_intr[0:0]
  })
 ,.ccu_dmi1_AWCACHE({
     hps2mpfe_dmi1_awcache[3:0]
  })
 ,.ccu_dmi1_ARQOS({
     hps2mpfe_dmi1_arqos[3:0]
  })
 ,.ccu_dmi1_WDATA({
     hps2mpfe_dmi1_wdata[255:0]
  })
 ,.ccu_dmi0_BRESP({
     hps2mpfe_dmi0_bresp[1:0]
  })
 ,.ccu_dmi1_RRESP({
     hps2mpfe_dmi1_rresp[1:0]
  })
 ,.ccu_dmi0_AWPROT({
     hps2mpfe_dmi0_awprot[2:0]
  })
 ,.ccu_dmi0_WVALID({
     hps2mpfe_dmi0_wvalid[0:0]
  })
 ,.ccu_dmi0_RREADY({
     hps2mpfe_dmi0_rready[0:0]
  })
 ,.ccu_dmi1_ARLEN({
     hps2mpfe_dmi1_arlen[7:0]
  })
 ,.ccu_dmi0_AWSIZE({
     hps2mpfe_dmi0_awsize[2:0]
  })
 ,.io96b0_p0_BID({
     emif0_bid[6:0]
  })
 ,.mpfe_csr_AWBURST({
     hps2mpfe_csr_awburst[1:0]
  })
 ,.f2sdram_tbu_pmu_irpt({
     sdram_tbu_pmu_irpt[0:0]
  })
 ,.ccu_dmi0_ARQOS({
     hps2mpfe_dmi0_arqos[3:0]
  })
 ,.io96b0_csr_BVALID({
     emif_mem_cfg_bvalid[0:0]
  })
 ,.io96b0_csr_clk({
     emif_csr_axi_clk[0:0]
  })
 ,.mpfe_csr_ARVALID({
     hps2mpfe_csr_arvalid[0:0]
  })
 ,.ccu_dmi0_WDATA({
     hps2mpfe_dmi0_wdata[255:0]
  })
 ,.ccu_dmi0_ARUSER({
     hps2mpfe_dmi0_aruser[7:0]
  })
 ,.mpfe_csr_ARPROT({
     hps2mpfe_csr_arprot[2:0]
  })
 ,.io96b0_p0_AWBURST({
     emif0_awburst[1:0]
  })
 ,.ccu_dmi0_ARLOCK({
     hps2mpfe_dmi0_arlock[0:0]
  })
 ,.ccu_dmi0_RRESP({
     hps2mpfe_dmi0_rresp[1:0]
  })
 ,.mpfe_csr_WSTRB({
     hps2mpfe_csr_wstrb[7:0]
  })
 ,.io96b0_p0_ARVALID({
     emif0_arvalid[0:0]
  })
 ,.f2sdram_AWPROT({
     f2sdram_awprot_intr[2:0]
  })
 ,.mpfe_csr_RLAST({
     hps2mpfe_csr_rlast[0:0]
  })
 ,.mpfe_csr_ARSIZE({
     hps2mpfe_csr_arsize[2:0]
  })
 ,.f2sdram_WVALID({
     f2sdram_wvalid_intr[0:0]
  })
 ,.f2sdram_RREADY({
     f2sdram_rready_intr[0:0]
  })
 ,.f2sdram_ARCACHE({
     f2sdram_arcache_intr[3:0]
  })
 ,.io96b0_p0_ARSIZE({
     emif0_arsize[2:0]
  })
 ,.ccu_dmi0_ARLEN({
     hps2mpfe_dmi0_arlen[7:0]
  })
 ,.f2sdram_ARID({
     f2sdram_arid_intr[4:0]
  })
 ,.io96b0_p0_RID({
     emif0_rid[6:0]
  })
 ,.f2sdram_WLAST({
     f2sdram_wlast_intr[0:0]
  })
 ,.f2sdram_AWSIZE({
     f2sdram_awsize_intr[2:0]
  })
 ,.ccu_dmi1_AWREADY({
     hps2mpfe_dmi1_awready[0:0]
  })
 ,.f2soc_AWMMUSID({
     16'b0000000000000000
  })
 ,.f2sdram_ARUSER({
     f2sdram_aruser_intr[7:0]
  })
 ,.io96b0_p0_RUSER({
     emif0_ruser[31:0]
  })
 ,.f2soc_ARADDR({
     10'b0000000000
  })
 ,.f2sdram_RDATA({
     f2sdram_rdata_intr[63:0]
  })
 ,.f2sdram_ARLOCK({
     f2sdram_arlock_intr[0:0]
  })
 ,.ccu_dmi0_BVALID({
     hps2mpfe_dmi0_bvalid[0:0]
  })
 ,.ccu_dmi1_RVALID({
     hps2mpfe_dmi1_rvalid[0:0]
  })
 ,.ccu_dmi1_ARBURST({
     hps2mpfe_dmi1_arburst[1:0]
  })
 ,.ccu_dmi1_AWID({
     hps2mpfe_dmi1_awid[9:0]
  })
 ,.ccu_dmi0_AWUSER({
     hps2mpfe_dmi0_awuser[7:0]
  })
 ,.mpfe_csr_AWPROT({
     hps2mpfe_csr_awprot[2:0]
  })
 ,.io96b0_csr_WREADY({
     emif_mem_cfg_wready[0:0]
  })
 ,.ccu_dmi0_AWLOCK({
     hps2mpfe_dmi0_awlock[0:0]
  })
 ,.mpfe_csr_WVALID({
     hps2mpfe_csr_wvalid[0:0]
  })
 ,.mpfe_csr_RREADY({
     hps2mpfe_csr_rready[0:0]
  })
 ,.io96b0_csr_ARADDR({
     emif_mem_cfg_araddr[31:0]
  })
 ,.mpfe_csr_ARCACHE({
     hps2mpfe_csr_arcache[3:0]
  })
 ,.f2sdram_AWVALID({
     f2sdram_awvalid_intr[0:0]
  })
 ,.f2sdram_ARREADY({
     f2sdram_arready_intr[0:0]
  })
 ,.io96b0_p0_RREADY({
     emif0_rready[0:0]
  })
 ,.io96b0_p0_WVALID({
     emif0_wvalid[0:0]
  })
 ,.mpfe_csr_ARID({
     hps2mpfe_csr_arid[9:0]
  })
 ,.ccu_dmi1_AWQOS({
     hps2mpfe_dmi1_awqos[3:0]
  })
 ,.f2sdram_BVALID({
     f2sdram_bvalid_intr[0:0]
  })
 ,.mpfe_csr_WLAST({
     hps2mpfe_csr_wlast[0:0]
  })
 ,.mpfe_csr_AWSIZE({
     hps2mpfe_csr_awsize[2:0]
  })
 ,.f2sdram_BRESP({
     f2sdram_bresp_intr[1:0]
  })
 ,.io96b0_p0_AWSIZE({
     emif0_awsize[2:0]
  })
 ,.ccu_dmi0_AWBURST({
     hps2mpfe_dmi0_awburst[1:0]
  })
 ,.ccu_dmi0_ARVALID({
     hps2mpfe_dmi0_arvalid[0:0]
  })
 ,.mpfe_csr_ARUSER({
     hps2mpfe_csr_aruser[7:0]
  })
 ,.io96b0_p0_ARUSER({
     emif0_aruser[13:0]
  })
 ,.mpfe_csr_RDATA({
     hps2mpfe_csr_rdata[63:0]
  })
 ,.io96b0_csr_ARVALID({
     emif_mem_cfg_arvalid[0:0]
  })
 ,.mpfe_csr_ARLOCK({
     hps2mpfe_csr_arlock[0:0]
  })
 ,.io96b0_p0_ARLOCK({
     emif0_arlock[0:0]
  })
 ,.ccu_dmi1_AWLEN({
     hps2mpfe_dmi1_awlen[7:0]
  })
 ,.f2sdram_ARQOS({
     f2sdram_arqos_intr[3:0]
  })
 ,.f2sdram_AWUSER({
     f2sdram_awuser_intr[7:0]
  })
 ,.io96b0_p0_WUSER({
     emif0_wuser[31:0]
  })
 ,.ccu_dmi0_AWQOS({
     hps2mpfe_dmi0_awqos[3:0]
  })
 ,.f2soc_AWADDR({
     10'b0000000000
  })
 ,.f2sdram_WDATA({
     f2sdram_wdata_intr[63:0]
  })
 ,.f2sdram_AWLOCK({
     f2sdram_awlock_intr[0:0]
  })
 ,.io96b0_p0_WSTRB({
     emif0_wstrb[31:0]
  })
 ,.f2sdram_RRESP({
     f2sdram_rresp_intr[1:0]
  })
 ,.io96b0_p0_RLAST({
     emif0_rlast[0:0]
  })
 ,.ccu_dmi0_WREADY({
     hps2mpfe_dmi0_wready[0:0]
  })
 ,.f2sdram_bridge_rst_n({
     sdram_bridge_rst_n[0:0]
  })
 ,.f2sdram_clk({
     f2sdram_clk[0:0]
  })
 ,.f2sdram_ARLEN({
     f2sdram_arlen_intr[7:0]
  })
 ,.ccu_dmi0_ARADDR({
     hps2mpfe_dmi0_araddr[43:0]
  })
 ,.ccu_dmi0_AWLEN({
     hps2mpfe_dmi0_awlen[7:0]
  })
 ,.ccu_dmi1_BID({
     hps2mpfe_dmi1_bid[9:0]
  })
 ,.ccu_dmi1_ARPROT({
     hps2mpfe_dmi1_arprot[2:0]
  })
 ,.mpu_ccu_clk({
     hps2mpfe_ccu_clk[0:0]
  })
 ,.mpfe_csr_AWVALID({
     hps2mpfe_csr_awvalid[0:0]
  })
 ,.mpfe_csr_ARREADY({
     hps2mpfe_csr_arready[0:0]
  })
 ,.io96b0_csr_BREADY({
     emif_mem_cfg_bready[0:0]
  })
 ,.mpfe_csr_BVALID({
     hps2mpfe_csr_bvalid[0:0]
  })
 ,.io96b0_p0_BVALID({
     emif0_bvalid[0:0]
  })
 ,.mpfe_csr_BRESP({
     hps2mpfe_csr_bresp[1:0]
  })
 ,.io96b0_csr_AWADDR({
     emif_mem_cfg_awaddr[31:0]
  })
 ,.ccu_dmi1_ARSIZE({
     hps2mpfe_dmi1_arsize[2:0]
  })
 ,.f2sdram_tbu_ras_irpt({
     sdram_tbu_ras_irpt[0:0]
  })
 ,.f2soc_AWMMUSECSID({
     1'b0
  })
 ,.io96b0_p0_ARREADY({
     emif0_arready[0:0]
  })
 ,.io96b0_p0_AWVALID({
     emif0_awvalid[0:0]
  })
 ,.f2sdram_WREADY({
     f2sdram_wready_intr[0:0]
  })
 ,.f2sdram_AWCACHE({
     f2sdram_awcache_intr[3:0]
  })
 ,.ccu_dmi1_RID({
     hps2mpfe_dmi1_rid[9:0]
  })
 ,.f2sdram_ARADDR({
     12'b000000000000
    ,f2sdram_araddr_intr[31:0]
  })
 ,.mpfe_csr_AWUSER({
     hps2mpfe_csr_awuser[7:0]
  })
 ,.f2soc_ARMMUSID({
     16'b0000000000000000
  })
 ,.io96b0_p0_AWUSER({
     emif0_awuser[13:0]
  })
 ,.mpfe_csr_WDATA({
     hps2mpfe_csr_wdata[63:0]
  })
 ,.mpfe_csr_AWLOCK({
     hps2mpfe_csr_awlock[0:0]
  })
 ,.io96b0_p0_AWLOCK({
     emif0_awlock[0:0]
  })
 ,.mpfe_csr_RRESP({
     hps2mpfe_csr_rresp[1:0]
  })
 ,.ccu_dmi0_ARCACHE({
     hps2mpfe_dmi0_arcache[3:0]
  })
 ,.f2sdram_flush_ack({
     sdram_bridge_ack[0:0]
  })
 ,.mpfe_csr_ARLEN({
     hps2mpfe_csr_arlen[7:0]
  })
 ,.io96b0_p0_WLAST({
     emif0_wlast[0:0]
  })
 ,.ccu_dmi0_BREADY({
     hps2mpfe_dmi0_bready[0:0]
  })
 ,.ccu_dmi0_AWADDR({
     hps2mpfe_dmi0_awaddr[43:0]
  })
 ,.io96b0_csr_WSTRB({
     emif_mem_cfg_wstrb[3:0]
  })
 ,.ccu_dmi1_AWPROT({
     hps2mpfe_dmi1_awprot[2:0]
  })
 ,.f2sdram_AWREGION({
     f2sdram_awregion_intr[3:0]
  })
 ,.io96b0_p0_RDATA({
     emif0_rdata[255:0]
  })
 ,.ccu_dmi1_RREADY({
     hps2mpfe_dmi1_rready[0:0]
  })
 ,.ccu_dmi1_WVALID({
     hps2mpfe_dmi1_wvalid[0:0]
  })
 ,.io96b0_p0_AWID({
     emif0_awid[6:0]
  })
 ,.ccu_dmi1_AWBURST({
     hps2mpfe_dmi1_awburst[1:0]
  })
 ,.f2sdram_BID({
     f2sdram_bid_intr[4:0]
  })
 ,.ccu_dmi1_ARVALID({
     hps2mpfe_dmi1_arvalid[0:0]
  })
 ,.ccu_dmi1_AWSIZE({
     hps2mpfe_dmi1_awsize[2:0]
  })
 ,.f2sdram_AWQOS({
     f2sdram_awqos_intr[3:0]
  })
 ,.mpfe_csr_WREADY({
     hps2mpfe_csr_wready[0:0]
  })
 ,.mpfe_csr_AWCACHE({
     hps2mpfe_csr_awcache[3:0]
  })
 ,.f2sdram_AWREADY({
     f2sdram_awready_intr[0:0]
  })
 ,.io96b0_p0_WREADY({
     emif0_wready[0:0]
  })
 ,.mpfe_csr_ARADDR({
     hps2mpfe_csr_araddr[43:0]
  })
 ,.f2sdram_BREADY({
     f2sdram_bready_intr[0:0]
  })
 ,.io96b0_p0_ARADDR({
     emif0_araddr[43:0]
  })
 ,.ccu_dmi1_ARUSER({
     hps2mpfe_dmi1_aruser[7:0]
  })
 ,.ccu_dmi0_AWID({
     hps2mpfe_dmi0_awid[9:0]
  })
 ,.ccu_dmi1_ARLOCK({
     hps2mpfe_dmi1_arlock[0:0]
  })
 ,.f2sdram_AWADDR({
     12'b000000000000
    ,f2sdram_awaddr_intr[31:0]
  })
 ,.ccu_dmi0_ARREADY({
     hps2mpfe_dmi0_arready[0:0]
  })
 ,.ccu_dmi0_AWVALID({
     hps2mpfe_dmi0_awvalid[0:0]
  })
 ,.f2sdram_RID({
     f2sdram_rid_intr[4:0]
  })
 ,.f2sdram_AWLEN({
     f2sdram_awlen_intr[7:0]
  })
 ,.io96b0_csr_ARREADY({
     emif_mem_cfg_arready[0:0]
  })
 ,.io96b0_csr_AWVALID({
     emif_mem_cfg_awvalid[0:0]
  })
 ,.io96b0_p0_BRESP({
     emif0_bresp[1:0]
  })
 ,.f2sdram_ARBURST({
     f2sdram_arburst_intr[1:0]
  })
 ,.io96b0_csr_RVALID({
     emif_mem_cfg_rvalid[0:0]
  })
 ,.ccu_dmi1_ARID({
     hps2mpfe_dmi1_arid[9:0]
  })
 ,.mpfe_csr_BID({
     hps2mpfe_csr_bid[9:0]
  })
 ,.io96b0_p0_ARQOS({
     emif0_arqos[3:0]
  })
 ,.ccu_dmi1_BVALID({
     hps2mpfe_dmi1_bvalid[0:0]
  })
 ,.io96b0_p0_WDATA({
     emif0_wdata[255:0]
  })
 ,.f2sdram_port_size_config({
     1'b0
    ,1'b0
  })
 ,.io96b0_p0_RRESP({
     emif0_rresp[1:0]
  })
 ,.mpfe_csr_AWREADY({
     hps2mpfe_csr_awready[0:0]
  })
 ,.mpfe_csr_BREADY({
     hps2mpfe_csr_bready[0:0]
  })
 ,.ccu_dmi1_WSTRB({
     hps2mpfe_dmi1_wstrb[31:0]
  })
 ,.io96b0_p0_BREADY({
     emif0_bready[0:0]
  })
 ,.io96b0_p0_ARLEN({
     emif0_arlen[7:0]
  })
 ,.mpfe_csr_AWADDR({
     hps2mpfe_csr_awaddr[43:0]
  })
 ,.ccu_dmi1_RLAST({
     hps2mpfe_dmi1_rlast[0:0]
  })
 ,.io96b0_p0_AWADDR({
     emif0_awaddr[43:0]
  })
 ,.ccu_dmi1_AWUSER({
     hps2mpfe_dmi1_awuser[7:0]
  })
 ,.ccu_dmi1_ARCACHE({
     hps2mpfe_dmi1_arcache[3:0]
  })
 ,.io96b0_csr_RDATA({
     emif_mem_cfg_rdata[31:0]
  })
 ,.f2sdram_AWID({
     f2sdram_awid_intr[4:0]
  })
 ,.io96b0_p0_AWREADY({
     emif0_awready[0:0]
  })
 ,.ccu_dmi1_AWLOCK({
     hps2mpfe_dmi1_awlock[0:0]
  })
 ,.mpfe_csr_AWLEN({
     hps2mpfe_csr_awlen[7:0]
  })
 ,.mpfe_csr_RID({
     hps2mpfe_csr_rid[9:0]
  })
 ,.ccu_dmi0_BID({
     hps2mpfe_dmi0_bid[9:0]
  })
 ,.ccu_dmi0_WSTRB({
     hps2mpfe_dmi0_wstrb[31:0]
  })
 ,.ccu_dmi0_RVALID({
     hps2mpfe_dmi0_rvalid[0:0]
  })
 ,.ccu_dmi0_AWCACHE({
     hps2mpfe_dmi0_awcache[3:0]
  })
 ,.f2sdram_BUSER({
     f2sdram_buser_intr[7:0]
  })
 ,.mpfe_csr_ARBURST({
     hps2mpfe_csr_arburst[1:0]
  })
 ,.ccu_dmi0_RLAST({
     hps2mpfe_dmi0_rlast[0:0]
  })
 ,.ccu_dmi0_RID({
     hps2mpfe_dmi0_rid[9:0]
  })
 ,.io96b0_p0_ARBURST({
     emif0_arburst[1:0]
  })
 ,.io96b0_csr_BRESP({
     emif_mem_cfg_bresp[1:0]
  })
 ,.f2sdram_ARREGION({
     f2sdram_arregion_intr[3:0]
  })
 ,.f2sdram_RUSER({
     f2sdram_ruser_intr[7:0]
  })
 ,.ccu_dmi1_WREADY({
     hps2mpfe_dmi1_wready[0:0]
  })
 ,.f2sdram_RVALID({
     f2sdram_rvalid_intr[0:0]
  })
 ,.ccu_dmi1_ARADDR({
     hps2mpfe_dmi1_araddr[43:0]
  })
 ,.mpfe_csr_AWID({
     hps2mpfe_csr_awid[9:0]
  })
 ,.ccu_dmi1_AWVALID({
     hps2mpfe_dmi1_awvalid[0:0]
  })
 ,.ccu_dmi1_ARREADY({
     hps2mpfe_dmi1_arready[0:0]
  })
 ,.ccu_dmi1_WLAST({
     hps2mpfe_dmi1_wlast[0:0]
  })
 ,.io96b0_csr_WDATA({
     emif_mem_cfg_wdata[31:0]
  })
 ,.io96b0_csr_RRESP({
     emif_mem_cfg_rresp[1:0]
  })
);

endmodule

