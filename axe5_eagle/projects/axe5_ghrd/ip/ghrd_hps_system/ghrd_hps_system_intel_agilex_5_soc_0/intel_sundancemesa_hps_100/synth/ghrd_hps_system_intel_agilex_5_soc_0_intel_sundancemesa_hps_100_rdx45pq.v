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



module ghrd_hps_system_intel_agilex_5_soc_0_intel_sundancemesa_hps_100_rdx45pq(
  output wire [0 : 0 ] h2f_reset
 ,input wire [0 : 0 ] hps2fpga_clk
 ,input wire [0 : 0 ] hps2fpga_rst_n
 ,output wire [3 : 0 ] hps2fpga_awid
 ,output wire [31 : 0 ] hps2fpga_awaddr
 ,output wire [7 : 0 ] hps2fpga_awlen
 ,output wire [2 : 0 ] hps2fpga_awsize
 ,output wire [1 : 0 ] hps2fpga_awburst
 ,output wire [0 : 0 ] hps2fpga_awlock
 ,output wire [3 : 0 ] hps2fpga_awcache
 ,output wire [2 : 0 ] hps2fpga_awprot
 ,output wire [0 : 0 ] hps2fpga_awvalid
 ,input wire [0 : 0 ] hps2fpga_awready
 ,output wire [31 : 0 ] hps2fpga_wdata
 ,output wire [3 : 0 ] hps2fpga_wstrb
 ,output wire [0 : 0 ] hps2fpga_wlast
 ,output wire [0 : 0 ] hps2fpga_wvalid
 ,input wire [0 : 0 ] hps2fpga_wready
 ,input wire [3 : 0 ] hps2fpga_bid
 ,input wire [1 : 0 ] hps2fpga_bresp
 ,input wire [0 : 0 ] hps2fpga_bvalid
 ,output wire [0 : 0 ] hps2fpga_bready
 ,output wire [3 : 0 ] hps2fpga_arid
 ,output wire [31 : 0 ] hps2fpga_araddr
 ,output wire [7 : 0 ] hps2fpga_arlen
 ,output wire [2 : 0 ] hps2fpga_arsize
 ,output wire [1 : 0 ] hps2fpga_arburst
 ,output wire [0 : 0 ] hps2fpga_arlock
 ,output wire [3 : 0 ] hps2fpga_arcache
 ,output wire [2 : 0 ] hps2fpga_arprot
 ,output wire [0 : 0 ] hps2fpga_arvalid
 ,input wire [0 : 0 ] hps2fpga_arready
 ,input wire [3 : 0 ] hps2fpga_rid
 ,input wire [31 : 0 ] hps2fpga_rdata
 ,input wire [1 : 0 ] hps2fpga_rresp
 ,input wire [0 : 0 ] hps2fpga_rlast
 ,input wire [0 : 0 ] hps2fpga_rvalid
 ,output wire [0 : 0 ] hps2fpga_rready
 ,input wire [0 : 0 ] lwhps2fpga_clk
 ,input wire [0 : 0 ] lwhps2fpga_rst_n
 ,output wire [3 : 0 ] lwhps2fpga_awid
 ,output wire [28 : 0 ] lwhps2fpga_awaddr
 ,output wire [7 : 0 ] lwhps2fpga_awlen
 ,output wire [2 : 0 ] lwhps2fpga_awsize
 ,output wire [1 : 0 ] lwhps2fpga_awburst
 ,output wire [0 : 0 ] lwhps2fpga_awlock
 ,output wire [3 : 0 ] lwhps2fpga_awcache
 ,output wire [2 : 0 ] lwhps2fpga_awprot
 ,output wire [0 : 0 ] lwhps2fpga_awvalid
 ,input wire [0 : 0 ] lwhps2fpga_awready
 ,output wire [31 : 0 ] lwhps2fpga_wdata
 ,output wire [3 : 0 ] lwhps2fpga_wstrb
 ,output wire [0 : 0 ] lwhps2fpga_wlast
 ,output wire [0 : 0 ] lwhps2fpga_wvalid
 ,input wire [0 : 0 ] lwhps2fpga_wready
 ,input wire [3 : 0 ] lwhps2fpga_bid
 ,input wire [1 : 0 ] lwhps2fpga_bresp
 ,input wire [0 : 0 ] lwhps2fpga_bvalid
 ,output wire [0 : 0 ] lwhps2fpga_bready
 ,output wire [3 : 0 ] lwhps2fpga_arid
 ,output wire [28 : 0 ] lwhps2fpga_araddr
 ,output wire [7 : 0 ] lwhps2fpga_arlen
 ,output wire [2 : 0 ] lwhps2fpga_arsize
 ,output wire [1 : 0 ] lwhps2fpga_arburst
 ,output wire [0 : 0 ] lwhps2fpga_arlock
 ,output wire [3 : 0 ] lwhps2fpga_arcache
 ,output wire [2 : 0 ] lwhps2fpga_arprot
 ,output wire [0 : 0 ] lwhps2fpga_arvalid
 ,input wire [0 : 0 ] lwhps2fpga_arready
 ,input wire [3 : 0 ] lwhps2fpga_rid
 ,input wire [31 : 0 ] lwhps2fpga_rdata
 ,input wire [1 : 0 ] lwhps2fpga_rresp
 ,input wire [0 : 0 ] lwhps2fpga_rlast
 ,input wire [0 : 0 ] lwhps2fpga_rvalid
 ,output wire [0 : 0 ] lwhps2fpga_rready
 ,input wire [0 : 0 ] emac_ptp_ref_clk
 ,input wire [0 : 0 ] emac_timestamp_clk
 ,input wire [63 : 0 ] emac_timestamp_data
 ,output wire [0 : 0 ] emac0_gmii_mdc_o
 ,input wire [0 : 0 ] emac0_gmii_mdi_i
 ,output wire [0 : 0 ] emac0_gmii_mdo_o
 ,output wire [0 : 0 ] emac0_gmii_mdo_o_e
 ,output wire [0 : 0 ] emac0_rst_clk_app_n_o
 ,output wire [0 : 0 ] emac0_phy_txclk_o_hio
 ,input wire [0 : 0 ] emac0_phy_txclk_i
 ,input wire [0 : 0 ] emac0_phy_rxclk_i
 ,output wire [0 : 0 ] emac0_rst_clk_tx_n_o
 ,output wire [0 : 0 ] emac0_rst_clk_rx_n_o
 ,output wire [0 : 0 ] emac0_phy_txen_o
 ,output wire [0 : 0 ] emac0_phy_txer_o
 ,input wire [0 : 0 ] emac0_phy_rxdv_i
 ,input wire [0 : 0 ] emac0_phy_rxer_i
 ,input wire [7 : 0 ] emac0_phy_rxd_i
 ,input wire [0 : 0 ] emac0_phy_col_i
 ,input wire [0 : 0 ] emac0_phy_crs_i
 ,output wire [2 : 0 ] emac0_phy_mac_speed_o
 ,output wire [7 : 0 ] emac0_phy_txd_o
 ,output wire [0 : 0 ] emac2_rst_clk_app_n_o
 ,input wire [0 : 0 ] spim0_miso_i
 ,output wire [0 : 0 ] spim0_mosi_o
 ,output wire [0 : 0 ] spim0_mosi_oe
 ,input wire [0 : 0 ] spim0_ss_in_n
 ,output wire [0 : 0 ] spim0_ss0_n_o
 ,output wire [0 : 0 ] spim0_ss1_n_o
 ,output wire [0 : 0 ] spim0_ss2_n_o
 ,output wire [0 : 0 ] spim0_ss3_n_o
 ,output wire [0 : 0 ] spim0_sclk_out_hio
 ,input wire [0 : 0 ] i2c1_scl_i
 ,output wire [0 : 0 ] i2c1_scl_oe
 ,input wire [0 : 0 ] i2c1_sda_i
 ,output wire [0 : 0 ] i2c1_sda_oe
 ,output wire [0 : 0 ] user0_clk
 ,output wire [0 : 0 ] user1_clk
 ,output wire [0 : 0 ] h2f_pending_rst_req_n
 ,input wire [0 : 0 ] f2h_pending_rst_ack_n
 ,output wire [0 : 0 ] h2f_cold_rst_o
 ,input wire [0 : 0 ] hps_osc_clk
 ,inout wire [0 : 0 ] sdmmc_data0
 ,inout wire [0 : 0 ] sdmmc_data1
 ,output wire [0 : 0 ] sdmmc_cclk
 ,inout wire [0 : 0 ] sdmmc_data2
 ,inout wire [0 : 0 ] sdmmc_data3
 ,inout wire [0 : 0 ] sdmmc_cmd
 ,input wire [0 : 0 ] usb1_clk
 ,output wire [0 : 0 ] usb1_stp
 ,input wire [0 : 0 ] usb1_dir
 ,inout wire [0 : 0 ] usb1_data0
 ,inout wire [0 : 0 ] usb1_data1
 ,input wire [0 : 0 ] usb1_nxt
 ,inout wire [0 : 0 ] usb1_data2
 ,inout wire [0 : 0 ] usb1_data3
 ,inout wire [0 : 0 ] usb1_data4
 ,inout wire [0 : 0 ] usb1_data5
 ,inout wire [0 : 0 ] usb1_data6
 ,inout wire [0 : 0 ] usb1_data7
 ,output wire [0 : 0 ] emac2_tx_clk
 ,output wire [0 : 0 ] emac2_tx_ctl
 ,input wire [0 : 0 ] emac2_rx_clk
 ,input wire [0 : 0 ] emac2_rx_ctl
 ,output wire [0 : 0 ] emac2_txd0
 ,output wire [0 : 0 ] emac2_txd1
 ,input wire [0 : 0 ] emac2_rxd0
 ,input wire [0 : 0 ] emac2_rxd1
 ,output wire [0 : 0 ] emac2_txd2
 ,output wire [0 : 0 ] emac2_txd3
 ,input wire [0 : 0 ] emac2_rxd2
 ,input wire [0 : 0 ] emac2_rxd3
 ,inout wire [0 : 0 ] mdio2_mdio
 ,output wire [0 : 0 ] mdio2_mdc
 ,output wire [0 : 0 ] uart0_io_tx
 ,input wire [0 : 0 ] uart0_io_rx
 ,inout wire [0 : 0 ] i2c0_sda
 ,inout wire [0 : 0 ] i2c0_scl
 ,inout wire [0 : 0 ] gpio6
 ,inout wire [0 : 0 ] gpio7
 ,inout wire [0 : 0 ] gpio8
 ,inout wire [0 : 0 ] gpio9
 ,inout wire [0 : 0 ] gpio10
 ,inout wire [0 : 0 ] gpio11
 ,inout wire [0 : 0 ] gpio28
 ,inout wire [0 : 0 ] gpio34
 ,inout wire [0 : 0 ] gpio35
 ,input wire [0 : 0 ] usb1_usb31_vbus_det
 ,input wire [0 : 0 ] usb1_usb31_flt_bar
 ,output wire [1 : 0 ] usb1_usb31_usb_ctrl
 ,input wire [0 : 0 ] usb1_usb31_id
 ,input wire [0 : 0 ] mpfe2hps_clk
 ,input wire [0 : 0 ] mpfe2hps_rst
 ,input wire [39 : 0 ] mpfe2hps_araddr
 ,input wire [1 : 0 ] mpfe2hps_arburst
 ,input wire [3 : 0 ] mpfe2hps_arcache
 ,input wire [4 : 0 ] mpfe2hps_arid
 ,input wire [7 : 0 ] mpfe2hps_arlen
 ,input wire [0 : 0 ] mpfe2hps_arlock
 ,input wire [2 : 0 ] mpfe2hps_arprot
 ,input wire [3 : 0 ] mpfe2hps_arqos
 ,output wire [0 : 0 ] mpfe2hps_arready
 ,input wire [3 : 0 ] mpfe2hps_arregion
 ,input wire [2 : 0 ] mpfe2hps_arsize
 ,input wire [7 : 0 ] mpfe2hps_aruser
 ,input wire [0 : 0 ] mpfe2hps_arvalid
 ,input wire [39 : 0 ] mpfe2hps_awaddr
 ,input wire [1 : 0 ] mpfe2hps_awburst
 ,input wire [3 : 0 ] mpfe2hps_awcache
 ,input wire [4 : 0 ] mpfe2hps_awid
 ,input wire [7 : 0 ] mpfe2hps_awlen
 ,input wire [0 : 0 ] mpfe2hps_awlock
 ,input wire [2 : 0 ] mpfe2hps_awprot
 ,input wire [3 : 0 ] mpfe2hps_awqos
 ,output wire [0 : 0 ] mpfe2hps_awready
 ,input wire [3 : 0 ] mpfe2hps_awregion
 ,input wire [2 : 0 ] mpfe2hps_awsize
 ,input wire [7 : 0 ] mpfe2hps_awuser
 ,input wire [0 : 0 ] mpfe2hps_awvalid
 ,output wire [4 : 0 ] mpfe2hps_bid
 ,input wire [0 : 0 ] mpfe2hps_bready
 ,output wire [1 : 0 ] mpfe2hps_bresp
 ,output wire [7 : 0 ] mpfe2hps_buser
 ,output wire [0 : 0 ] mpfe2hps_bvalid
 ,output wire [255 : 0 ] mpfe2hps_rdata
 ,output wire [4 : 0 ] mpfe2hps_rid
 ,output wire [0 : 0 ] mpfe2hps_rlast
 ,input wire [0 : 0 ] mpfe2hps_rready
 ,output wire [1 : 0 ] mpfe2hps_rresp
 ,output wire [7 : 0 ] mpfe2hps_ruser
 ,output wire [0 : 0 ] mpfe2hps_rvalid
 ,input wire [255 : 0 ] mpfe2hps_wdata
 ,input wire [0 : 0 ] mpfe2hps_wlast
 ,output wire [0 : 0 ] mpfe2hps_wready
 ,input wire [31 : 0 ] mpfe2hps_wstrb
 ,input wire [7 : 0 ] mpfe2hps_wuser
 ,input wire [0 : 0 ] mpfe2hps_wvalid
 ,output wire [0 : 0 ] hps2mpfe_ccu_clk
 ,output wire [0 : 0 ] hps2mpfe_ccu_rst
 ,output wire [43 : 0 ] hps2mpfe_dmi0_araddr
 ,output wire [1 : 0 ] hps2mpfe_dmi0_arburst
 ,output wire [3 : 0 ] hps2mpfe_dmi0_arcache
 ,output wire [9 : 0 ] hps2mpfe_dmi0_arid
 ,output wire [7 : 0 ] hps2mpfe_dmi0_arlen
 ,output wire [0 : 0 ] hps2mpfe_dmi0_arlock
 ,output wire [2 : 0 ] hps2mpfe_dmi0_arprot
 ,output wire [3 : 0 ] hps2mpfe_dmi0_arqos
 ,input wire [0 : 0 ] hps2mpfe_dmi0_arready
 ,output wire [2 : 0 ] hps2mpfe_dmi0_arsize
 ,output wire [7 : 0 ] hps2mpfe_dmi0_aruser
 ,output wire [0 : 0 ] hps2mpfe_dmi0_arvalid
 ,output wire [43 : 0 ] hps2mpfe_dmi0_awaddr
 ,output wire [1 : 0 ] hps2mpfe_dmi0_awburst
 ,output wire [3 : 0 ] hps2mpfe_dmi0_awcache
 ,output wire [9 : 0 ] hps2mpfe_dmi0_awid
 ,output wire [7 : 0 ] hps2mpfe_dmi0_awlen
 ,output wire [0 : 0 ] hps2mpfe_dmi0_awlock
 ,output wire [2 : 0 ] hps2mpfe_dmi0_awprot
 ,output wire [3 : 0 ] hps2mpfe_dmi0_awqos
 ,input wire [0 : 0 ] hps2mpfe_dmi0_awready
 ,output wire [2 : 0 ] hps2mpfe_dmi0_awsize
 ,output wire [7 : 0 ] hps2mpfe_dmi0_awuser
 ,output wire [0 : 0 ] hps2mpfe_dmi0_awvalid
 ,input wire [9 : 0 ] hps2mpfe_dmi0_bid
 ,output wire [0 : 0 ] hps2mpfe_dmi0_bready
 ,input wire [1 : 0 ] hps2mpfe_dmi0_bresp
 ,input wire [0 : 0 ] hps2mpfe_dmi0_bvalid
 ,input wire [255 : 0 ] hps2mpfe_dmi0_rdata
 ,input wire [9 : 0 ] hps2mpfe_dmi0_rid
 ,input wire [0 : 0 ] hps2mpfe_dmi0_rlast
 ,output wire [0 : 0 ] hps2mpfe_dmi0_rready
 ,input wire [1 : 0 ] hps2mpfe_dmi0_rresp
 ,input wire [0 : 0 ] hps2mpfe_dmi0_rvalid
 ,output wire [255 : 0 ] hps2mpfe_dmi0_wdata
 ,output wire [0 : 0 ] hps2mpfe_dmi0_wlast
 ,input wire [0 : 0 ] hps2mpfe_dmi0_wready
 ,output wire [31 : 0 ] hps2mpfe_dmi0_wstrb
 ,output wire [0 : 0 ] hps2mpfe_dmi0_wvalid
 ,output wire [43 : 0 ] hps2mpfe_dmi1_araddr
 ,output wire [1 : 0 ] hps2mpfe_dmi1_arburst
 ,output wire [3 : 0 ] hps2mpfe_dmi1_arcache
 ,output wire [9 : 0 ] hps2mpfe_dmi1_arid
 ,output wire [7 : 0 ] hps2mpfe_dmi1_arlen
 ,output wire [0 : 0 ] hps2mpfe_dmi1_arlock
 ,output wire [2 : 0 ] hps2mpfe_dmi1_arprot
 ,output wire [3 : 0 ] hps2mpfe_dmi1_arqos
 ,input wire [0 : 0 ] hps2mpfe_dmi1_arready
 ,output wire [2 : 0 ] hps2mpfe_dmi1_arsize
 ,output wire [7 : 0 ] hps2mpfe_dmi1_aruser
 ,output wire [0 : 0 ] hps2mpfe_dmi1_arvalid
 ,output wire [43 : 0 ] hps2mpfe_dmi1_awaddr
 ,output wire [1 : 0 ] hps2mpfe_dmi1_awburst
 ,output wire [3 : 0 ] hps2mpfe_dmi1_awcache
 ,output wire [9 : 0 ] hps2mpfe_dmi1_awid
 ,output wire [7 : 0 ] hps2mpfe_dmi1_awlen
 ,output wire [0 : 0 ] hps2mpfe_dmi1_awlock
 ,output wire [2 : 0 ] hps2mpfe_dmi1_awprot
 ,output wire [3 : 0 ] hps2mpfe_dmi1_awqos
 ,input wire [0 : 0 ] hps2mpfe_dmi1_awready
 ,output wire [2 : 0 ] hps2mpfe_dmi1_awsize
 ,output wire [7 : 0 ] hps2mpfe_dmi1_awuser
 ,output wire [0 : 0 ] hps2mpfe_dmi1_awvalid
 ,input wire [9 : 0 ] hps2mpfe_dmi1_bid
 ,output wire [0 : 0 ] hps2mpfe_dmi1_bready
 ,input wire [1 : 0 ] hps2mpfe_dmi1_bresp
 ,input wire [0 : 0 ] hps2mpfe_dmi1_bvalid
 ,input wire [255 : 0 ] hps2mpfe_dmi1_rdata
 ,input wire [9 : 0 ] hps2mpfe_dmi1_rid
 ,input wire [0 : 0 ] hps2mpfe_dmi1_rlast
 ,output wire [0 : 0 ] hps2mpfe_dmi1_rready
 ,input wire [1 : 0 ] hps2mpfe_dmi1_rresp
 ,input wire [0 : 0 ] hps2mpfe_dmi1_rvalid
 ,output wire [255 : 0 ] hps2mpfe_dmi1_wdata
 ,output wire [0 : 0 ] hps2mpfe_dmi1_wlast
 ,input wire [0 : 0 ] hps2mpfe_dmi1_wready
 ,output wire [31 : 0 ] hps2mpfe_dmi1_wstrb
 ,output wire [0 : 0 ] hps2mpfe_dmi1_wvalid
 ,output wire [43 : 0 ] hps2mpfe_csr_araddr
 ,output wire [1 : 0 ] hps2mpfe_csr_arburst
 ,output wire [3 : 0 ] hps2mpfe_csr_arcache
 ,output wire [9 : 0 ] hps2mpfe_csr_arid
 ,output wire [7 : 0 ] hps2mpfe_csr_arlen
 ,output wire [0 : 0 ] hps2mpfe_csr_arlock
 ,output wire [2 : 0 ] hps2mpfe_csr_arprot
 ,input wire [0 : 0 ] hps2mpfe_csr_arready
 ,output wire [2 : 0 ] hps2mpfe_csr_arsize
 ,output wire [7 : 0 ] hps2mpfe_csr_aruser
 ,output wire [0 : 0 ] hps2mpfe_csr_arvalid
 ,output wire [43 : 0 ] hps2mpfe_csr_awaddr
 ,output wire [1 : 0 ] hps2mpfe_csr_awburst
 ,output wire [3 : 0 ] hps2mpfe_csr_awcache
 ,output wire [9 : 0 ] hps2mpfe_csr_awid
 ,output wire [7 : 0 ] hps2mpfe_csr_awlen
 ,output wire [0 : 0 ] hps2mpfe_csr_awlock
 ,output wire [2 : 0 ] hps2mpfe_csr_awprot
 ,input wire [0 : 0 ] hps2mpfe_csr_awready
 ,output wire [2 : 0 ] hps2mpfe_csr_awsize
 ,output wire [7 : 0 ] hps2mpfe_csr_awuser
 ,output wire [0 : 0 ] hps2mpfe_csr_awvalid
 ,input wire [9 : 0 ] hps2mpfe_csr_bid
 ,output wire [0 : 0 ] hps2mpfe_csr_bready
 ,input wire [1 : 0 ] hps2mpfe_csr_bresp
 ,input wire [0 : 0 ] hps2mpfe_csr_bvalid
 ,input wire [63 : 0 ] hps2mpfe_csr_rdata
 ,input wire [9 : 0 ] hps2mpfe_csr_rid
 ,input wire [0 : 0 ] hps2mpfe_csr_rlast
 ,output wire [0 : 0 ] hps2mpfe_csr_rready
 ,input wire [1 : 0 ] hps2mpfe_csr_rresp
 ,input wire [0 : 0 ] hps2mpfe_csr_rvalid
 ,output wire [63 : 0 ] hps2mpfe_csr_wdata
 ,output wire [0 : 0 ] hps2mpfe_csr_wlast
 ,input wire [0 : 0 ] hps2mpfe_csr_wready
 ,output wire [7 : 0 ] hps2mpfe_csr_wstrb
 ,output wire [0 : 0 ] hps2mpfe_csr_wvalid
 ,output wire [0 : 0 ] fpga2sdram_bridge_rst_n
 ,input wire [0 : 0 ] fpga2sdram_bridge_ack
 ,output wire [0 : 0 ] fpga2sdram_bridge_req
 ,input wire [0 : 0 ] fpga2sdram_tbu_pmu_irpt
 ,input wire [0 : 0 ] fpga2sdram_tbu_ras_irpt
 ,input wire [62 : 0 ] f2h_fpga_irq63
 ,output wire [0 : 0 ] h2emif_interconnect_axi_rst
);

wire [ 3:0] hps2fpga_awid_intr;
wire [ 31:0] hps2fpga_awaddr_intr;
wire [ 7:0] hps2fpga_awlen_intr;
wire [ 2:0] hps2fpga_awsize_intr;
wire [ 1:0] hps2fpga_awburst_intr;
wire [ 0:0] hps2fpga_awlock_intr;
wire [ 3:0] hps2fpga_awcache_intr;
wire [ 2:0] hps2fpga_awprot_intr;
wire [ 0:0] hps2fpga_awvalid_intr;
wire [ 0:0] hps2fpga_awready_intr;
wire [ 31:0] hps2fpga_wdata_intr;
wire [ 3:0] hps2fpga_wstrb_intr;
wire [ 0:0] hps2fpga_wlast_intr;
wire [ 0:0] hps2fpga_wvalid_intr;
wire [ 0:0] hps2fpga_wready_intr;
wire [ 3:0] hps2fpga_bid_intr;
wire [ 1:0] hps2fpga_bresp_intr;
wire [ 0:0] hps2fpga_bvalid_intr;
wire [ 0:0] hps2fpga_bready_intr;
wire [ 3:0] hps2fpga_arid_intr;
wire [ 31:0] hps2fpga_araddr_intr;
wire [ 7:0] hps2fpga_arlen_intr;
wire [ 2:0] hps2fpga_arsize_intr;
wire [ 1:0] hps2fpga_arburst_intr;
wire [ 0:0] hps2fpga_arlock_intr;
wire [ 3:0] hps2fpga_arcache_intr;
wire [ 2:0] hps2fpga_arprot_intr;
wire [ 0:0] hps2fpga_arvalid_intr;
wire [ 0:0] hps2fpga_arready_intr;
wire [ 3:0] hps2fpga_rid_intr;
wire [ 31:0] hps2fpga_rdata_intr;
wire [ 1:0] hps2fpga_rresp_intr;
wire [ 0:0] hps2fpga_rlast_intr;
wire [ 0:0] hps2fpga_rvalid_intr;
wire [ 0:0] hps2fpga_rready_intr;
wire [ 3:0] lwhps2fpga_awid_intr;
wire [ 28:0] lwhps2fpga_awaddr_intr;
wire [ 7:0] lwhps2fpga_awlen_intr;
wire [ 2:0] lwhps2fpga_awsize_intr;
wire [ 1:0] lwhps2fpga_awburst_intr;
wire [ 0:0] lwhps2fpga_awlock_intr;
wire [ 3:0] lwhps2fpga_awcache_intr;
wire [ 2:0] lwhps2fpga_awprot_intr;
wire [ 0:0] lwhps2fpga_awvalid_intr;
wire [ 0:0] lwhps2fpga_awready_intr;
wire [ 31:0] lwhps2fpga_wdata_intr;
wire [ 3:0] lwhps2fpga_wstrb_intr;
wire [ 0:0] lwhps2fpga_wlast_intr;
wire [ 0:0] lwhps2fpga_wvalid_intr;
wire [ 0:0] lwhps2fpga_wready_intr;
wire [ 3:0] lwhps2fpga_bid_intr;
wire [ 1:0] lwhps2fpga_bresp_intr;
wire [ 0:0] lwhps2fpga_bvalid_intr;
wire [ 0:0] lwhps2fpga_bready_intr;
wire [ 3:0] lwhps2fpga_arid_intr;
wire [ 28:0] lwhps2fpga_araddr_intr;
wire [ 7:0] lwhps2fpga_arlen_intr;
wire [ 2:0] lwhps2fpga_arsize_intr;
wire [ 1:0] lwhps2fpga_arburst_intr;
wire [ 0:0] lwhps2fpga_arlock_intr;
wire [ 3:0] lwhps2fpga_arcache_intr;
wire [ 2:0] lwhps2fpga_arprot_intr;
wire [ 0:0] lwhps2fpga_arvalid_intr;
wire [ 0:0] lwhps2fpga_arready_intr;
wire [ 3:0] lwhps2fpga_rid_intr;
wire [ 31:0] lwhps2fpga_rdata_intr;
wire [ 1:0] lwhps2fpga_rresp_intr;
wire [ 0:0] lwhps2fpga_rlast_intr;
wire [ 0:0] lwhps2fpga_rvalid_intr;
wire [ 0:0] lwhps2fpga_rready_intr;


wire [0:0] gpio9_ibuf_o;
tennm_ph2_io_ibuf hps_gpio9_ibuf(
    .i(gpio9),
    .o(gpio9_ibuf_o)
);

wire [0:0] gpio9_obuf_i;
tennm_ph2_io_obuf hps_gpio9_obuf(
    .i(gpio9_obuf_i),
    .o(gpio9),
    .oe(1'b1)
);

wire [0:0] hps_osc_clk_ibuf_o;
tennm_ph2_io_ibuf hps_hps_osc_clk_ibuf(
    .i(hps_osc_clk),
    .o(hps_osc_clk_ibuf_o)
);



wire [0:0] sdmmc_cclk_obuf_i;
tennm_ph2_io_obuf hps_sdmmc_cclk_obuf(
    .i(sdmmc_cclk_obuf_i),
    .o(sdmmc_cclk),
    .oe(1'b1)
);

wire [0:0] sdmmc_data3_ibuf_o;
tennm_ph2_io_ibuf hps_sdmmc_data3_ibuf(
    .i(sdmmc_data3),
    .o(sdmmc_data3_ibuf_o)
);

wire [0:0] sdmmc_data3_obuf_i;
tennm_ph2_io_obuf hps_sdmmc_data3_obuf(
    .i(sdmmc_data3_obuf_i),
    .o(sdmmc_data3),
    .oe(1'b1)
);


wire [0:0] usb1_stp_obuf_i;
tennm_ph2_io_obuf hps_usb1_stp_obuf(
    .i(usb1_stp_obuf_i),
    .o(usb1_stp),
    .oe(1'b1)
);

wire [0:0] usb1_dir_ibuf_o;
tennm_ph2_io_ibuf hps_usb1_dir_ibuf(
    .i(usb1_dir),
    .o(usb1_dir_ibuf_o)
);


wire [0:0] emac2_rx_clk_ibuf_o;
tennm_ph2_io_ibuf hps_emac2_rx_clk_ibuf(
    .i(emac2_rx_clk),
    .o(emac2_rx_clk_ibuf_o)
);


wire [0:0] mdio2_mdio_ibuf_o;
tennm_ph2_io_ibuf hps_mdio2_mdio_ibuf(
    .i(mdio2_mdio),
    .o(mdio2_mdio_ibuf_o)
);

wire [0:0] mdio2_mdio_obuf_i;
tennm_ph2_io_obuf hps_mdio2_mdio_obuf(
    .i(mdio2_mdio_obuf_i),
    .o(mdio2_mdio),
    .oe(1'b1)
);

wire [0:0] usb1_data0_ibuf_o;
tennm_ph2_io_ibuf hps_usb1_data0_ibuf(
    .i(usb1_data0),
    .o(usb1_data0_ibuf_o)
);

wire [0:0] usb1_data0_obuf_i;
tennm_ph2_io_obuf hps_usb1_data0_obuf(
    .i(usb1_data0_obuf_i),
    .o(usb1_data0),
    .oe(1'b1)
);

wire [0:0] uart0_io_rx_ibuf_o;
tennm_ph2_io_ibuf hps_uart0_io_rx_ibuf(
    .i(uart0_io_rx),
    .o(uart0_io_rx_ibuf_o)
);



wire [0:0] emac2_tx_clk_obuf_i;
tennm_ph2_io_obuf hps_emac2_tx_clk_obuf(
    .i(emac2_tx_clk_obuf_i),
    .o(emac2_tx_clk),
    .oe(1'b1)
);

wire [0:0] usb1_nxt_ibuf_o;
tennm_ph2_io_ibuf hps_usb1_nxt_ibuf(
    .i(usb1_nxt),
    .o(usb1_nxt_ibuf_o)
);


wire [0:0] usb1_clk_ibuf_o;
tennm_ph2_io_ibuf hps_usb1_clk_ibuf(
    .i(usb1_clk),
    .o(usb1_clk_ibuf_o)
);


wire [0:0] usb1_data1_ibuf_o;
tennm_ph2_io_ibuf hps_usb1_data1_ibuf(
    .i(usb1_data1),
    .o(usb1_data1_ibuf_o)
);

wire [0:0] usb1_data1_obuf_i;
tennm_ph2_io_obuf hps_usb1_data1_obuf(
    .i(usb1_data1_obuf_i),
    .o(usb1_data1),
    .oe(1'b1)
);

wire [0:0] emac2_rxd0_ibuf_o;
tennm_ph2_io_ibuf hps_emac2_rxd0_ibuf(
    .i(emac2_rxd0),
    .o(emac2_rxd0_ibuf_o)
);


wire [0:0] usb1_data2_ibuf_o;
tennm_ph2_io_ibuf hps_usb1_data2_ibuf(
    .i(usb1_data2),
    .o(usb1_data2_ibuf_o)
);

wire [0:0] usb1_data2_obuf_i;
tennm_ph2_io_obuf hps_usb1_data2_obuf(
    .i(usb1_data2_obuf_i),
    .o(usb1_data2),
    .oe(1'b1)
);

wire [0:0] emac2_rxd1_ibuf_o;
tennm_ph2_io_ibuf hps_emac2_rxd1_ibuf(
    .i(emac2_rxd1),
    .o(emac2_rxd1_ibuf_o)
);



wire [0:0] uart0_io_tx_obuf_i;
tennm_ph2_io_obuf hps_uart0_io_tx_obuf(
    .i(uart0_io_tx_obuf_i),
    .o(uart0_io_tx),
    .oe(1'b1)
);

wire [0:0] usb1_data3_ibuf_o;
tennm_ph2_io_ibuf hps_usb1_data3_ibuf(
    .i(usb1_data3),
    .o(usb1_data3_ibuf_o)
);

wire [0:0] usb1_data3_obuf_i;
tennm_ph2_io_obuf hps_usb1_data3_obuf(
    .i(usb1_data3_obuf_i),
    .o(usb1_data3),
    .oe(1'b1)
);


wire [0:0] emac2_txd0_obuf_i;
tennm_ph2_io_obuf hps_emac2_txd0_obuf(
    .i(emac2_txd0_obuf_i),
    .o(emac2_txd0),
    .oe(1'b1)
);

wire [0:0] emac2_rxd2_ibuf_o;
tennm_ph2_io_ibuf hps_emac2_rxd2_ibuf(
    .i(emac2_rxd2),
    .o(emac2_rxd2_ibuf_o)
);


wire [0:0] usb1_data4_ibuf_o;
tennm_ph2_io_ibuf hps_usb1_data4_ibuf(
    .i(usb1_data4),
    .o(usb1_data4_ibuf_o)
);

wire [0:0] usb1_data4_obuf_i;
tennm_ph2_io_obuf hps_usb1_data4_obuf(
    .i(usb1_data4_obuf_i),
    .o(usb1_data4),
    .oe(1'b1)
);


wire [0:0] emac2_txd1_obuf_i;
tennm_ph2_io_obuf hps_emac2_txd1_obuf(
    .i(emac2_txd1_obuf_i),
    .o(emac2_txd1),
    .oe(1'b1)
);

wire [0:0] emac2_rxd3_ibuf_o;
tennm_ph2_io_ibuf hps_emac2_rxd3_ibuf(
    .i(emac2_rxd3),
    .o(emac2_rxd3_ibuf_o)
);


wire [0:0] gpio10_ibuf_o;
tennm_ph2_io_ibuf hps_gpio10_ibuf(
    .i(gpio10),
    .o(gpio10_ibuf_o)
);

wire [0:0] gpio10_obuf_i;
tennm_ph2_io_obuf hps_gpio10_obuf(
    .i(gpio10_obuf_i),
    .o(gpio10),
    .oe(1'b1)
);

wire [0:0] usb1_data5_ibuf_o;
tennm_ph2_io_ibuf hps_usb1_data5_ibuf(
    .i(usb1_data5),
    .o(usb1_data5_ibuf_o)
);

wire [0:0] usb1_data5_obuf_i;
tennm_ph2_io_obuf hps_usb1_data5_obuf(
    .i(usb1_data5_obuf_i),
    .o(usb1_data5),
    .oe(1'b1)
);


wire [0:0] emac2_txd2_obuf_i;
tennm_ph2_io_obuf hps_emac2_txd2_obuf(
    .i(emac2_txd2_obuf_i),
    .o(emac2_txd2),
    .oe(1'b1)
);

wire [0:0] gpio11_ibuf_o;
tennm_ph2_io_ibuf hps_gpio11_ibuf(
    .i(gpio11),
    .o(gpio11_ibuf_o)
);

wire [0:0] gpio11_obuf_i;
tennm_ph2_io_obuf hps_gpio11_obuf(
    .i(gpio11_obuf_i),
    .o(gpio11),
    .oe(1'b1)
);

wire [0:0] gpio28_ibuf_o;
tennm_ph2_io_ibuf hps_gpio28_ibuf(
    .i(gpio28),
    .o(gpio28_ibuf_o)
);

wire [0:0] gpio28_obuf_i;
tennm_ph2_io_obuf hps_gpio28_obuf(
    .i(gpio28_obuf_i),
    .o(gpio28),
    .oe(1'b1)
);

wire [0:0] usb1_data6_ibuf_o;
tennm_ph2_io_ibuf hps_usb1_data6_ibuf(
    .i(usb1_data6),
    .o(usb1_data6_ibuf_o)
);

wire [0:0] usb1_data6_obuf_i;
tennm_ph2_io_obuf hps_usb1_data6_obuf(
    .i(usb1_data6_obuf_i),
    .o(usb1_data6),
    .oe(1'b1)
);


wire [0:0] emac2_txd3_obuf_i;
tennm_ph2_io_obuf hps_emac2_txd3_obuf(
    .i(emac2_txd3_obuf_i),
    .o(emac2_txd3),
    .oe(1'b1)
);

wire [0:0] usb1_data7_ibuf_o;
tennm_ph2_io_ibuf hps_usb1_data7_ibuf(
    .i(usb1_data7),
    .o(usb1_data7_ibuf_o)
);

wire [0:0] usb1_data7_obuf_i;
tennm_ph2_io_obuf hps_usb1_data7_obuf(
    .i(usb1_data7_obuf_i),
    .o(usb1_data7),
    .oe(1'b1)
);

wire [0:0] emac2_rx_ctl_ibuf_o;
tennm_ph2_io_ibuf hps_emac2_rx_ctl_ibuf(
    .i(emac2_rx_ctl),
    .o(emac2_rx_ctl_ibuf_o)
);


wire [0:0] sdmmc_data0_ibuf_o;
tennm_ph2_io_ibuf hps_sdmmc_data0_ibuf(
    .i(sdmmc_data0),
    .o(sdmmc_data0_ibuf_o)
);

wire [0:0] sdmmc_data0_obuf_i;
tennm_ph2_io_obuf hps_sdmmc_data0_obuf(
    .i(sdmmc_data0_obuf_i),
    .o(sdmmc_data0),
    .oe(1'b1)
);


wire [0:0] emac2_tx_ctl_obuf_i;
tennm_ph2_io_obuf hps_emac2_tx_ctl_obuf(
    .i(emac2_tx_ctl_obuf_i),
    .o(emac2_tx_ctl),
    .oe(1'b1)
);

wire [0:0] i2c0_sda_ibuf_o;
tennm_ph2_io_ibuf hps_i2c0_sda_ibuf(
    .i(i2c0_sda),
    .o(i2c0_sda_ibuf_o)
);

wire [0:0] i2c0_sda_obuf_i;
tennm_ph2_io_obuf hps_i2c0_sda_obuf(
    .i(1'b0),
    .o(i2c0_sda),
    .oe(i2c0_sda_obuf_i)
);

wire [0:0] gpio6_ibuf_o;
tennm_ph2_io_ibuf hps_gpio6_ibuf(
    .i(gpio6),
    .o(gpio6_ibuf_o)
);

wire [0:0] gpio6_obuf_i;
tennm_ph2_io_obuf hps_gpio6_obuf(
    .i(gpio6_obuf_i),
    .o(gpio6),
    .oe(1'b1)
);

wire [0:0] sdmmc_data1_ibuf_o;
tennm_ph2_io_ibuf hps_sdmmc_data1_ibuf(
    .i(sdmmc_data1),
    .o(sdmmc_data1_ibuf_o)
);

wire [0:0] sdmmc_data1_obuf_i;
tennm_ph2_io_obuf hps_sdmmc_data1_obuf(
    .i(sdmmc_data1_obuf_i),
    .o(sdmmc_data1),
    .oe(1'b1)
);


wire [0:0] mdio2_mdc_obuf_i;
tennm_ph2_io_obuf hps_mdio2_mdc_obuf(
    .i(mdio2_mdc_obuf_i),
    .o(mdio2_mdc),
    .oe(1'b1)
);

wire [0:0] gpio7_ibuf_o;
tennm_ph2_io_ibuf hps_gpio7_ibuf(
    .i(gpio7),
    .o(gpio7_ibuf_o)
);

wire [0:0] gpio7_obuf_i;
tennm_ph2_io_obuf hps_gpio7_obuf(
    .i(gpio7_obuf_i),
    .o(gpio7),
    .oe(1'b1)
);

wire [0:0] gpio34_ibuf_o;
tennm_ph2_io_ibuf hps_gpio34_ibuf(
    .i(gpio34),
    .o(gpio34_ibuf_o)
);

wire [0:0] gpio34_obuf_i;
tennm_ph2_io_obuf hps_gpio34_obuf(
    .i(gpio34_obuf_i),
    .o(gpio34),
    .oe(1'b1)
);

wire [0:0] sdmmc_cmd_ibuf_o;
tennm_ph2_io_ibuf hps_sdmmc_cmd_ibuf(
    .i(sdmmc_cmd),
    .o(sdmmc_cmd_ibuf_o)
);

wire [0:0] sdmmc_cmd_obuf_i;
tennm_ph2_io_obuf hps_sdmmc_cmd_obuf(
    .i(sdmmc_cmd_obuf_i),
    .o(sdmmc_cmd),
    .oe(1'b1)
);

wire [0:0] sdmmc_data2_ibuf_o;
tennm_ph2_io_ibuf hps_sdmmc_data2_ibuf(
    .i(sdmmc_data2),
    .o(sdmmc_data2_ibuf_o)
);

wire [0:0] sdmmc_data2_obuf_i;
tennm_ph2_io_obuf hps_sdmmc_data2_obuf(
    .i(sdmmc_data2_obuf_i),
    .o(sdmmc_data2),
    .oe(1'b1)
);

wire [0:0] i2c0_scl_ibuf_o;
tennm_ph2_io_ibuf hps_i2c0_scl_ibuf(
    .i(i2c0_scl),
    .o(i2c0_scl_ibuf_o)
);

wire [0:0] i2c0_scl_obuf_i;
tennm_ph2_io_obuf hps_i2c0_scl_obuf(
    .i(1'b0),
    .o(i2c0_scl),
    .oe(i2c0_scl_obuf_i)
);

wire [0:0] gpio8_ibuf_o;
tennm_ph2_io_ibuf hps_gpio8_ibuf(
    .i(gpio8),
    .o(gpio8_ibuf_o)
);

wire [0:0] gpio8_obuf_i;
tennm_ph2_io_obuf hps_gpio8_obuf(
    .i(gpio8_obuf_i),
    .o(gpio8),
    .oe(1'b1)
);

wire [0:0] gpio35_ibuf_o;
tennm_ph2_io_ibuf hps_gpio35_ibuf(
    .i(gpio35),
    .o(gpio35_ibuf_o)
);

wire [0:0] gpio35_obuf_i;
tennm_ph2_io_obuf hps_gpio35_obuf(
    .i(gpio35_obuf_i),
    .o(gpio35),
    .oe(1'b1)
);

hps_axi4_ready_latency_adp #(
        .NUM_PIPELINES(2)
        ,.LOG_DEPTH(3)
        ,.ID_WIDTH(4)
        ,.ADDR_WIDTH(29)
        ,.DATA_WIDTH(32)
        ,.STRB_WIDTH(4)
        ) lwhps2fpga_axi4_rl_adp_inst(
 .clk(lwhps2fpga_clk)
,.reset(~lwhps2fpga_rst_n)
,.awid(lwhps2fpga_awid_intr)
,.awid_r(lwhps2fpga_awid)
,.awaddr(lwhps2fpga_awaddr_intr)
,.awaddr_r(lwhps2fpga_awaddr)
,.awlen(lwhps2fpga_awlen_intr)
,.awlen_r(lwhps2fpga_awlen)
,.awsize(lwhps2fpga_awsize_intr)
,.awsize_r(lwhps2fpga_awsize)
,.awburst(lwhps2fpga_awburst_intr)
,.awburst_r(lwhps2fpga_awburst)
,.awlock(lwhps2fpga_awlock_intr)
,.awlock_r(lwhps2fpga_awlock)
,.awcache(lwhps2fpga_awcache_intr)
,.awcache_r(lwhps2fpga_awcache)
,.awprot(lwhps2fpga_awprot_intr)
,.awprot_r(lwhps2fpga_awprot)
,.awvalid(lwhps2fpga_awvalid_intr)
,.awvalid_r(lwhps2fpga_awvalid)
,.awready(lwhps2fpga_awready)
,.awready_r(lwhps2fpga_awready_intr)
,.wdata(lwhps2fpga_wdata_intr)
,.wdata_r(lwhps2fpga_wdata)
,.wstrb(lwhps2fpga_wstrb_intr)
,.wstrb_r(lwhps2fpga_wstrb)
,.wlast(lwhps2fpga_wlast_intr)
,.wlast_r(lwhps2fpga_wlast)
,.wvalid(lwhps2fpga_wvalid_intr)
,.wvalid_r(lwhps2fpga_wvalid)
,.wready(lwhps2fpga_wready)
,.wready_r(lwhps2fpga_wready_intr)
,.bid(lwhps2fpga_bid)
,.bid_r(lwhps2fpga_bid_intr)
,.bresp(lwhps2fpga_bresp)
,.bresp_r(lwhps2fpga_bresp_intr)
,.bvalid(lwhps2fpga_bvalid)
,.bvalid_r(lwhps2fpga_bvalid_intr)
,.bready(lwhps2fpga_bready_intr)
,.bready_r(lwhps2fpga_bready)
,.arid(lwhps2fpga_arid_intr)
,.arid_r(lwhps2fpga_arid)
,.araddr(lwhps2fpga_araddr_intr)
,.araddr_r(lwhps2fpga_araddr)
,.arlen(lwhps2fpga_arlen_intr)
,.arlen_r(lwhps2fpga_arlen)
,.arsize(lwhps2fpga_arsize_intr)
,.arsize_r(lwhps2fpga_arsize)
,.arburst(lwhps2fpga_arburst_intr)
,.arburst_r(lwhps2fpga_arburst)
,.arlock(lwhps2fpga_arlock_intr)
,.arlock_r(lwhps2fpga_arlock)
,.arcache(lwhps2fpga_arcache_intr)
,.arcache_r(lwhps2fpga_arcache)
,.arprot(lwhps2fpga_arprot_intr)
,.arprot_r(lwhps2fpga_arprot)
,.arvalid(lwhps2fpga_arvalid_intr)
,.arvalid_r(lwhps2fpga_arvalid)
,.arready(lwhps2fpga_arready)
,.arready_r(lwhps2fpga_arready_intr)
,.rid(lwhps2fpga_rid)
,.rid_r(lwhps2fpga_rid_intr)
,.rdata(lwhps2fpga_rdata)
,.rdata_r(lwhps2fpga_rdata_intr)
,.rresp(lwhps2fpga_rresp)
,.rresp_r(lwhps2fpga_rresp_intr)
,.rlast(lwhps2fpga_rlast)
,.rlast_r(lwhps2fpga_rlast_intr)
,.rvalid(lwhps2fpga_rvalid)
,.rvalid_r(lwhps2fpga_rvalid_intr)
,.rready(lwhps2fpga_rready_intr)
,.rready_r(lwhps2fpga_rready)
);
hps_axi4_ready_latency_adp #(
        .NUM_PIPELINES(2)
        ,.LOG_DEPTH(3)
        ,.ID_WIDTH(4)
        ,.ADDR_WIDTH(32)
        ,.DATA_WIDTH(32)
        ,.STRB_WIDTH(4)
        ) hps2fpga_axi4_rl_adp_inst(
 .clk(hps2fpga_clk)
,.reset(~hps2fpga_rst_n)
,.awid(hps2fpga_awid_intr)
,.awid_r(hps2fpga_awid)
,.awaddr(hps2fpga_awaddr_intr)
,.awaddr_r(hps2fpga_awaddr)
,.awlen(hps2fpga_awlen_intr)
,.awlen_r(hps2fpga_awlen)
,.awsize(hps2fpga_awsize_intr)
,.awsize_r(hps2fpga_awsize)
,.awburst(hps2fpga_awburst_intr)
,.awburst_r(hps2fpga_awburst)
,.awlock(hps2fpga_awlock_intr)
,.awlock_r(hps2fpga_awlock)
,.awcache(hps2fpga_awcache_intr)
,.awcache_r(hps2fpga_awcache)
,.awprot(hps2fpga_awprot_intr)
,.awprot_r(hps2fpga_awprot)
,.awvalid(hps2fpga_awvalid_intr)
,.awvalid_r(hps2fpga_awvalid)
,.awready(hps2fpga_awready)
,.awready_r(hps2fpga_awready_intr)
,.wdata(hps2fpga_wdata_intr)
,.wdata_r(hps2fpga_wdata)
,.wstrb(hps2fpga_wstrb_intr)
,.wstrb_r(hps2fpga_wstrb)
,.wlast(hps2fpga_wlast_intr)
,.wlast_r(hps2fpga_wlast)
,.wvalid(hps2fpga_wvalid_intr)
,.wvalid_r(hps2fpga_wvalid)
,.wready(hps2fpga_wready)
,.wready_r(hps2fpga_wready_intr)
,.bid(hps2fpga_bid)
,.bid_r(hps2fpga_bid_intr)
,.bresp(hps2fpga_bresp)
,.bresp_r(hps2fpga_bresp_intr)
,.bvalid(hps2fpga_bvalid)
,.bvalid_r(hps2fpga_bvalid_intr)
,.bready(hps2fpga_bready_intr)
,.bready_r(hps2fpga_bready)
,.arid(hps2fpga_arid_intr)
,.arid_r(hps2fpga_arid)
,.araddr(hps2fpga_araddr_intr)
,.araddr_r(hps2fpga_araddr)
,.arlen(hps2fpga_arlen_intr)
,.arlen_r(hps2fpga_arlen)
,.arsize(hps2fpga_arsize_intr)
,.arsize_r(hps2fpga_arsize)
,.arburst(hps2fpga_arburst_intr)
,.arburst_r(hps2fpga_arburst)
,.arlock(hps2fpga_arlock_intr)
,.arlock_r(hps2fpga_arlock)
,.arcache(hps2fpga_arcache_intr)
,.arcache_r(hps2fpga_arcache)
,.arprot(hps2fpga_arprot_intr)
,.arprot_r(hps2fpga_arprot)
,.arvalid(hps2fpga_arvalid_intr)
,.arvalid_r(hps2fpga_arvalid)
,.arready(hps2fpga_arready)
,.arready_r(hps2fpga_arready_intr)
,.rid(hps2fpga_rid)
,.rid_r(hps2fpga_rid_intr)
,.rdata(hps2fpga_rdata)
,.rdata_r(hps2fpga_rdata_intr)
,.rresp(hps2fpga_rresp)
,.rresp_r(hps2fpga_rresp_intr)
,.rlast(hps2fpga_rlast)
,.rlast_r(hps2fpga_rlast_intr)
,.rvalid(hps2fpga_rvalid)
,.rvalid_r(hps2fpga_rvalid_intr)
,.rready(hps2fpga_rready_intr)
,.rready_r(hps2fpga_rready)
);

(* preserve *)(* altera_attribute = {"-name PRESERVE_FANOUT_FREE_WYSIWYG ON; -name FORCE_HYPER_REGISTER_FOR_CORE_PERIPHERY_TRANSFER ON; -name HYPER_REGISTER_DELAY_CHAIN 350"} *) 
tennm_soc_hps #(
.soc_hps_wrapper_powerdown_mode("FALSE")
,.soc_hps_wrapper_hps_a55_core_state("HPS_A55_CORE_STATE_BOTH_ON")
,.soc_hps_wrapper_hps_a76_core_selection("HPS_A76_CORE_SELECTION_DUAL")
,.soc_hps_wrapper_hps_l3_memory_size("HPS_L3_MEMORY_SIZE_2_MB")
 ) sundancemesa_hps_inst (
  .ccu_dmi1_RDATA({
     hps2mpfe_dmi1_rdata[255:0]
  })
 ,.ccu_dmi0_AWREADY({
     hps2mpfe_dmi0_awready[0:0]
  })
 ,.hps_iob_15_bidir_in({
     emac2_rx_clk_ibuf_o
  })
 ,.lwsoc2fpga_b_resp({
     lwhps2fpga_bresp_intr
  })
 ,.hps_iob_8_bidir_in({
     sdmmc_cmd_ibuf_o
  })
 ,.ccu_dmi0_ARPROT({
     hps2mpfe_dmi0_arprot[2:0]
  })
 ,.f2soc_AWLEN({
     mpfe2hps_awlen[7:0]
  })
 ,.hps_iob_1_bidir_in({
     sdmmc_data0_ibuf_o
  })
 ,.spim0_ss3_n_o({
     spim0_ss3_n_o[0:0]
  })
 ,.lwsoc2fpga_b_id({
     lwhps2fpga_bid_intr
  })
 ,.ccu_dmi0_WLAST({
     hps2mpfe_dmi0_wlast[0:0]
  })
 ,.f2soc_ARUSER({
     mpfe2hps_aruser[7:0]
  })
 ,.soc2fpga_port_size_config_0({
     1'b0
  })
 ,.hps_iob_14_bidir_out({
     emac2_tx_ctl_obuf_i
  })
 ,.f2soc_ARLOCK({
     mpfe2hps_arlock[0:0]
  })
 ,.soc2fpga_port_size_config_1({
     1'b0
  })
 ,.ccu_dmi0_ARSIZE({
     hps2mpfe_dmi0_arsize[2:0]
  })
 ,.soc2fpga_b_id({
     hps2fpga_bid_intr
  })
 ,.f2s_fpga_irq({
     usb1_usb31_id[0:0]
    ,f2h_fpga_irq63[62:0]
  })
 ,.emac0_phy_txd_o({
     emac0_phy_txd_o[7:0]
  })
 ,.f2soc_ARREGION({
     mpfe2hps_arregion[3:0]
  })
 ,.f2soc_ARREADY({
     mpfe2hps_arready[0:0]
  })
 ,.f2soc_AWVALID({
     mpfe2hps_awvalid[0:0]
  })
 ,.lwsoc2fpga_aw_len({
     lwhps2fpga_awlen_intr
  })
 ,.hps_ioa_5_bidir_in({
     i2c0_sda_ibuf_o
  })
 ,.lwsoc2fpga_ar_ready({
     lwhps2fpga_arready_intr
  })
 ,.lwsoc2fpga_ar_id({
     lwhps2fpga_arid_intr
  })
 ,.ccu_dmi0_RDATA({
     hps2mpfe_dmi0_rdata[255:0]
  })
 ,.f2sdram_flush_req({
     fpga2sdram_bridge_req[0:0]
  })
 ,.mpfe_csr_RVALID({
     hps2mpfe_csr_rvalid[0:0]
  })
 ,.soc2fpga_ar_cache({
     hps2fpga_arcache_intr
  })
 ,.lwsoc2fpga_port_size_config_0({
     1'b1
  })
 ,.ccu_dmi1_BREADY({
     hps2mpfe_dmi1_bready[0:0]
  })
 ,.hps_ioa_22_bidir_out({
     usb1_data5_obuf_i
  })
 ,.ccu_dmi0_ARBURST({
     hps2mpfe_dmi0_arburst[1:0]
  })
 ,.hps_ioa_5_bidir_out({
     i2c0_sda_obuf_i
  })
 ,.ccu_dmi1_AWADDR({
     hps2mpfe_dmi1_awaddr[43:0]
  })
 ,.emac0_gmii_mdo_o({
     emac0_gmii_mdo_o[0:0]
  })
 ,.ccu_dmi1_BRESP({
     hps2mpfe_dmi1_bresp[1:0]
  })
 ,.f2soc_ARMMUSECSID({
     1'b0
  })
 ,.hps_iob_7_bidir_out({
     sdmmc_data3_obuf_i
  })
 ,.ccu_dmi0_ARID({
     hps2mpfe_dmi0_arid[9:0]
  })
 ,.hps_ioa_23_bidir_in({
     usb1_data6_ibuf_o
  })
 ,.emac0_phy_txer_o({
     emac0_phy_txer_o[0:0]
  })
 ,.soc2fpga_w_last({
     hps2fpga_wlast_intr
  })
 ,.f2soc_BVALID({
     mpfe2hps_bvalid[0:0]
  })
 ,.hps_ioa_15_bidir_in({
     usb1_dir_ibuf_o
  })
 ,.hps_ioa_14_bidir_out({
     usb1_stp_obuf_i
  })
 ,.ccu_dmi1_AWCACHE({
     hps2mpfe_dmi1_awcache[3:0]
  })
 ,.lwsoc2fpga_b_valid({
     lwhps2fpga_bvalid_intr
  })
 ,.spim0_ss0_n_o({
     spim0_ss0_n_o[0:0]
  })
 ,.ccu_dmi1_ARQOS({
     hps2mpfe_dmi1_arqos[3:0]
  })
 ,.soc2fpga_w_valid({
     hps2fpga_wvalid_intr
  })
 ,.hps_iob_19_bidir_in({
     emac2_rxd0_ibuf_o
  })
 ,.hps_iob_20_bidir_in({
     emac2_rxd1_ibuf_o
  })
 ,.ccu_dmi1_WDATA({
     hps2mpfe_dmi1_wdata[255:0]
  })
 ,.hps_iob_12_bidir_in({
     gpio35_ibuf_o
  })
 ,.lwsoc2fpga_aw_burst({
     lwhps2fpga_awburst_intr
  })
 ,.soc2fpga_aw_addr({
     hps2fpga_awaddr_intr
  })
 ,.lwsoc2fpga_ar_prot({
     lwhps2fpga_arprot_intr
  })
 ,.ccu_dmi0_BRESP({
     hps2mpfe_dmi0_bresp[1:0]
  })
 ,.soc2fpga_r_resp({
     hps2fpga_rresp_intr
  })
 ,.hps_iob_5_bidir_in({
     gpio28_ibuf_o
  })
 ,.ccu_dmi1_RRESP({
     hps2mpfe_dmi1_rresp[1:0]
  })
 ,.ccu_dmi0_AWPROT({
     hps2mpfe_dmi0_awprot[2:0]
  })
 ,.spim0_ss_in_n({
     spim0_ss_in_n[0:0]
  })
 ,.ccu_dmi0_WVALID({
     hps2mpfe_dmi0_wvalid[0:0]
  })
 ,.ccu_dmi0_RREADY({
     hps2mpfe_dmi0_rready[0:0]
  })
 ,.f2soc_AWUSER({
     mpfe2hps_awuser[7:0]
  })
 ,.lwsoc2fpga_ar_size({
     lwhps2fpga_arsize_intr
  })
 ,.emac0_gmii_mdi_i({
     emac0_gmii_mdi_i[0:0]
  })
 ,.f2soc_BUSER({
     mpfe2hps_buser[7:0]
  })
 ,.f2soc_AWLOCK({
     mpfe2hps_awlock[0:0]
  })
 ,.mpfe_csr_AWBURST({
     hps2mpfe_csr_awburst[1:0]
  })
 ,.ccu_dmi1_ARLEN({
     hps2mpfe_dmi1_arlen[7:0]
  })
 ,.ccu_dmi0_AWSIZE({
     hps2mpfe_dmi0_awsize[2:0]
  })
 ,.s2f_pending_rst_req({
     h2f_pending_rst_req_n[0:0]
  })
 ,.f2sdram_tbu_pmu_irpt({
     fpga2sdram_tbu_pmu_irpt[0:0]
  })
 ,.lwsoc2fpga_r_valid({
     lwhps2fpga_rvalid_intr
  })
 ,.mpfe_csr_ARVALID({
     hps2mpfe_csr_arvalid[0:0]
  })
 ,.ccu_dmi0_ARQOS({
     hps2mpfe_dmi0_arqos[3:0]
  })
 ,.f2soc_AWID({
     mpfe2hps_awid[4:0]
  })
 ,.emac0_phy_rxdv_i({
     emac0_phy_rxdv_i[0:0]
  })
 ,.lwsoc2fpga_w_ready({
     lwhps2fpga_wready_intr
  })
 ,.hps_ioa_9_bidir_in({
     gpio8_ibuf_o
  })
 ,.soc2fpga_ar_ready({
     hps2fpga_arready_intr
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
 ,.ccu_dmi0_RRESP({
     hps2mpfe_dmi0_rresp[1:0]
  })
 ,.ccu_dmi0_ARLOCK({
     hps2mpfe_dmi0_arlock[0:0]
  })
 ,.mpfe_csr_WSTRB({
     hps2mpfe_csr_wstrb[7:0]
  })
 ,.f2soc_AWCACHE({
     mpfe2hps_awcache[3:0]
  })
 ,.hps_ioa_24_bidir_out({
     usb1_data7_obuf_i
  })
 ,.hps_ioa_7_bidir_out({
     gpio6_obuf_i
  })
 ,.soc2fpga_ar_id({
     hps2fpga_arid_intr
  })
 ,.emac0_rst_clk_rx_n_o({
     emac0_rst_clk_rx_n_o[0:0]
  })
 ,.emac0_phy_col_i({
     emac0_phy_col_i[0:0]
  })
 ,.spim0_mosi_oe({
     spim0_mosi_oe[0:0]
  })
 ,.mpfe_csr_RLAST({
     hps2mpfe_csr_rlast[0:0]
  })
 ,.mpfe_csr_ARSIZE({
     hps2mpfe_csr_arsize[2:0]
  })
 ,.lwsoc2fpga_r_last({
     lwhps2fpga_rlast_intr
  })
 ,.hps_iob_9_bidir_out({
     mdio2_mdio_obuf_i
  })
 ,.ccu_dmi0_ARLEN({
     hps2mpfe_dmi0_arlen[7:0]
  })
 ,.f2soc_RUSER({
     mpfe2hps_ruser[7:0]
  })
 ,.ccu_dmi1_AWREADY({
     hps2mpfe_dmi1_awready[0:0]
  })
 ,.hps_ioa_16_bidir_out({
     usb1_data0_obuf_i
  })
 ,.f2soc_AWMMUSID({
     16'b0000000000000000
  })
 ,.hps_ioa_19_bidir_in({
     usb1_data2_ibuf_o
  })
 ,.hps_ioa_20_bidir_in({
     usb1_data3_ibuf_o
  })
 ,.hps_ioa_12_bidir_in({
     gpio11_ibuf_o
  })
 ,.hps_iob_2_bidir_out({
     sdmmc_data1_obuf_i
  })
 ,.f2soc_WREADY({
     mpfe2hps_wready[0:0]
  })
 ,.hps_iob_24_bidir_in({
     emac2_rxd3_ibuf_o
  })
 ,.hps_iob_16_bidir_in({
     emac2_rx_ctl_ibuf_o
  })
 ,.f2soc_ARADDR({
     mpfe2hps_araddr[39:0]
  })
 ,.lwsoc2fpga_aw_id({
     lwhps2fpga_awid_intr
  })
 ,.soc2fpga_aw_burst({
     hps2fpga_awburst_intr
  })
 ,.hps_iob_9_bidir_in({
     mdio2_mdio_ibuf_o
  })
 ,.soc2fpga_w_data({
     hps2fpga_wdata_intr
  })
 ,.emac0_gmii_mdc_o({
     emac0_gmii_mdc_o[0:0]
  })
 ,.hps_iob_2_bidir_in({
     sdmmc_data1_ibuf_o
  })
 ,.hps_iob_18_bidir_out({
     emac2_txd1_obuf_i
  })
 ,.ccu_dmi0_BVALID({
     hps2mpfe_dmi0_bvalid[0:0]
  })
 ,.spim0_sclk_out_hio({
     spim0_sclk_out_hio[0:0]
  })
 ,.emac0_gmii_mdo_o_e({
     emac0_gmii_mdo_o_e[0:0]
  })
 ,.s2f_cold_rst({
     h2f_cold_rst_o[0:0]
  })
 ,.hps_iob_11_bidir_out({
     gpio34_obuf_i
  })
 ,.ccu_dmi1_RVALID({
     hps2mpfe_dmi1_rvalid[0:0]
  })
 ,.ccu_dmi1_ARBURST({
     hps2mpfe_dmi1_arburst[1:0]
  })
 ,.hps_ioa_6_bidir_in({
     i2c0_scl_ibuf_o
  })
 ,.ccu_dmi1_AWID({
     hps2mpfe_dmi1_awid[9:0]
  })
 ,.f2soc_AWREADY({
     mpfe2hps_awready[0:0]
  })
 ,.hps_fi_spare_in({
     usb1_usb31_flt_bar[0:0]
    ,usb1_usb31_vbus_det[0:0]
    ,62'b00000000000000000000000000000000000000000000000000000000000000
  })
 ,.ccu_dmi0_AWUSER({
     hps2mpfe_dmi0_awuser[7:0]
  })
 ,.lwsoc2fpga_ar_lock({
     lwhps2fpga_arlock_intr
  })
 ,.mpfe_csr_AWPROT({
     hps2mpfe_csr_awprot[2:0]
  })
 ,.emac0_phy_txclk_i({
     emac0_phy_txclk_i[0:0]
  })
 ,.hps_ioa_9_bidir_out({
     gpio8_obuf_i
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
 ,.mpfe_csr_ARCACHE({
     hps2mpfe_csr_arcache[3:0]
  })
 ,.soc2fpga_b_valid({
     hps2fpga_bvalid_intr
  })
 ,.mpfe_csr_ARID({
     hps2mpfe_csr_arid[9:0]
  })
 ,.ccu_dmi1_AWQOS({
     hps2mpfe_dmi1_awqos[3:0]
  })
 ,.lwsoc2fpga_w_strb({
     lwhps2fpga_wstrb_intr
  })
 ,.mpfe_csr_WLAST({
     hps2mpfe_csr_wlast[0:0]
  })
 ,.mpfe_csr_AWSIZE({
     hps2mpfe_csr_awsize[2:0]
  })
 ,.f2soc_WUSER({
     mpfe2hps_wuser[7:0]
  })
 ,.emac0_rst_clk_app_n_o({
     emac0_rst_clk_app_n_o[0:0]
  })
 ,.ccu_dmi0_AWBURST({
     hps2mpfe_dmi0_awburst[1:0]
  })
 ,.soc2fpga_ar_prot({
     hps2fpga_arprot_intr
  })
 ,.spim0_ss2_n_o({
     spim0_ss2_n_o[0:0]
  })
 ,.emac2_rst_clk_app_n_o({
     emac2_rst_clk_app_n_o[0:0]
  })
 ,.ccu_dmi0_ARVALID({
     hps2mpfe_dmi0_arvalid[0:0]
  })
 ,.f2soc_WSTRB({
     mpfe2hps_wstrb[31:0]
  })
 ,.f2soc_clk({
     mpfe2hps_clk[0:0]
  })
 ,.hps_ioa_24_bidir_in({
     usb1_data7_ibuf_o
  })
 ,.mpfe_csr_ARUSER({
     hps2mpfe_csr_aruser[7:0]
  })
 ,.hps_ioa_16_bidir_in({
     usb1_data0_ibuf_o
  })
 ,.soc2fpga_ar_size({
     hps2fpga_arsize_intr
  })
 ,.mpfe_csr_RDATA({
     hps2mpfe_csr_rdata[63:0]
  })
 ,.mpfe_csr_ARLOCK({
     hps2mpfe_csr_arlock[0:0]
  })
 ,.f2soc_RLAST({
     mpfe2hps_rlast[0:0]
  })
 ,.lwsoc2fpga_r_data({
     lwhps2fpga_rdata_intr
  })
 ,.ccu_dmi1_AWLEN({
     hps2mpfe_dmi1_awlen[7:0]
  })
 ,.f2soc_BREADY({
     mpfe2hps_bready[0:0]
  })
 ,.hps_ioa_11_bidir_out({
     gpio10_obuf_i
  })
 ,.soc2fpga_r_valid({
     hps2fpga_rvalid_intr
  })
 ,.lwsoc2fpga_b_ready({
     lwhps2fpga_bready_intr
  })
 ,.ccu_dmi0_AWQOS({
     hps2mpfe_dmi0_awqos[3:0]
  })
 ,.hps_iob_21_bidir_out({
     emac2_txd2_obuf_i
  })
 ,.f2soc_AWADDR({
     mpfe2hps_awaddr[39:0]
  })
 ,.soc2fpga_w_ready({
     hps2fpga_wready_intr
  })
 ,.f2soc_ARBURST({
     mpfe2hps_arburst[1:0]
  })
 ,.i2c1_scl_i({
     i2c1_scl_i[0:0]
  })
 ,.hps_iob_6_bidir_in({
     sdmmc_data2_ibuf_o
  })
 ,.lwsoc2fpga_ar_burst({
     lwhps2fpga_arburst_intr
  })
 ,.s2f_user_clk1_hio({
     user1_clk[0:0]
  })
 ,.lwsoc2fpga_aw_prot({
     lwhps2fpga_awprot_intr
  })
 ,.lwsoc2fpga_aw_valid({
     lwhps2fpga_awvalid_intr
  })
 ,.ccu_dmi0_WREADY({
     hps2mpfe_dmi0_wready[0:0]
  })
 ,.hps_iob_13_bidir_out({
     emac2_tx_clk_obuf_i
  })
 ,.soc2fpga_aw_id({
     hps2fpga_awid_intr
  })
 ,.ccu_dmi0_ARADDR({
     hps2mpfe_dmi0_araddr[43:0]
  })
 ,.lwsoc2fpga_aw_size({
     lwhps2fpga_awsize_intr
  })
 ,.emac0_phy_rxclk_i({
     emac0_phy_rxclk_i[0:0]
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
 ,.lwsoc2fpga_r_ready({
     lwhps2fpga_rready_intr
  })
 ,.soc2fpga_ar_len({
     hps2fpga_arlen_intr
  })
 ,.mpu_ccu_clk({
     hps2mpfe_ccu_clk[0:0]
  })
 ,.emac_ptp_ref_clk({
     emac_ptp_ref_clk[0:0]
  })
 ,.mpfe_csr_ARREADY({
     hps2mpfe_csr_arready[0:0]
  })
 ,.mpfe_csr_AWVALID({
     hps2mpfe_csr_awvalid[0:0]
  })
 ,.emif_rst_n({
     h2emif_interconnect_axi_rst[0:0]
  })
 ,.mpfe_csr_BVALID({
     hps2mpfe_csr_bvalid[0:0]
  })
 ,.ccu_dmi1_ARSIZE({
     hps2mpfe_dmi1_arsize[2:0]
  })
 ,.mpfe_csr_BRESP({
     hps2mpfe_csr_bresp[1:0]
  })
 ,.s2f_rst({
     h2f_reset[0:0]
  })
 ,.f2sdram_tbu_ras_irpt({
     fpga2sdram_tbu_ras_irpt[0:0]
  })
 ,.hps_ioa_21_bidir_out({
     usb1_data4_obuf_i
  })
 ,.fpga2soc_emac_timestamp_clk({
     emac_timestamp_clk[0:0]
  })
 ,.f2soc_AWMMUSECSID({
     1'b0
  })
 ,.hps_iob_6_bidir_out({
     sdmmc_data2_obuf_i
  })
 ,.lwsoc2fpga_w_last({
     lwhps2fpga_wlast_intr
  })
 ,.i2c1_scl_oe({
     i2c1_scl_oe[0:0]
  })
 ,.ccu_dmi1_RID({
     hps2mpfe_dmi1_rid[9:0]
  })
 ,.hps_ioa_21_bidir_in({
     usb1_data4_ibuf_o
  })
 ,.hps_ioa_13_bidir_in({
     usb1_clk_ibuf_o
  })
 ,.emac0_rst_clk_tx_n_o({
     emac0_rst_clk_tx_n_o[0:0]
  })
 ,.mpfe_csr_AWUSER({
     hps2mpfe_csr_awuser[7:0]
  })
 ,.f2soc_ARMMUSID({
     16'b0000000000000000
  })
 ,.f2soc_WLAST({
     mpfe2hps_wlast[0:0]
  })
 ,.mpfe_csr_AWLOCK({
     hps2mpfe_csr_awlock[0:0]
  })
 ,.mpfe_csr_WDATA({
     hps2mpfe_csr_wdata[63:0]
  })
 ,.emac0_phy_txclk_o_hio({
     emac0_phy_txclk_o_hio[0:0]
  })
 ,.lwsoc2fpga_r_resp({
     lwhps2fpga_rresp_intr
  })
 ,.ccu_dmi0_ARCACHE({
     hps2mpfe_dmi0_arcache[3:0]
  })
 ,.mpfe_csr_RRESP({
     hps2mpfe_csr_rresp[1:0]
  })
 ,.f2soc_BID({
     mpfe2hps_bid[4:0]
  })
 ,.lwsoc2fpga_r_id({
     lwhps2fpga_rid_intr
  })
 ,.soc2fpga_ar_burst({
     hps2fpga_arburst_intr
  })
 ,.f2sdram_flush_ack({
     fpga2sdram_bridge_ack[0:0]
  })
 ,.soc2fpga_b_resp({
     hps2fpga_bresp_intr
  })
 ,.soc2fpga_ar_lock({
     hps2fpga_arlock_intr
  })
 ,.f2soc_RDATA({
     mpfe2hps_rdata[255:0]
  })
 ,.mpfe_csr_ARLEN({
     hps2mpfe_csr_arlen[7:0]
  })
 ,.soc2fpga_r_id({
     hps2fpga_rid_intr
  })
 ,.ccu_dmi0_BREADY({
     hps2mpfe_dmi0_bready[0:0]
  })
 ,.soc2fpga_aw_valid({
     hps2fpga_awvalid_intr
  })
 ,.lwsoc2fpga_ar_addr({
     lwhps2fpga_araddr_intr
  })
 ,.f2soc_ARID({
     mpfe2hps_arid[4:0]
  })
 ,.ccu_dmi0_AWADDR({
     hps2mpfe_dmi0_awaddr[43:0]
  })
 ,.hps_ioa_7_bidir_in({
     gpio6_ibuf_o
  })
 ,.lwsoc2fpga_clk({
     lwhps2fpga_clk
  })
 ,.ccu_dmi1_AWPROT({
     hps2mpfe_dmi1_awprot[2:0]
  })
 ,.soc2fpga_aw_len({
     hps2fpga_awlen_intr
  })
 ,.lwsoc2fpga_aw_cache({
     lwhps2fpga_awcache_intr
  })
 ,.f2soc_RID({
     mpfe2hps_rid[4:0]
  })
 ,.ccu_dmi1_RREADY({
     hps2mpfe_dmi1_rready[0:0]
  })
 ,.ccu_dmi1_WVALID({
     hps2mpfe_dmi1_wvalid[0:0]
  })
 ,.ccu_dmi1_AWBURST({
     hps2mpfe_dmi1_awburst[1:0]
  })
 ,.f2s_pending_rst_ack({
     f2h_pending_rst_ack_n[0:0]
  })
 ,.spim0_mosi_o({
     spim0_mosi_o[0:0]
  })
 ,.hps_ioa_23_bidir_out({
     usb1_data6_obuf_i
  })
 ,.lwsoc2fpga_aw_lock({
     lwhps2fpga_awlock_intr
  })
 ,.ccu_dmi1_ARVALID({
     hps2mpfe_dmi1_arvalid[0:0]
  })
 ,.ccu_dmi1_AWSIZE({
     hps2mpfe_dmi1_awsize[2:0]
  })
 ,.hps_ioa_6_bidir_out({
     i2c0_scl_obuf_i
  })
 ,.soc2fpga_b_ready({
     hps2fpga_bready_intr
  })
 ,.mpfe_csr_AWCACHE({
     hps2mpfe_csr_awcache[3:0]
  })
 ,.mpfe_csr_WREADY({
     hps2mpfe_csr_wready[0:0]
  })
 ,.hps_iob_8_bidir_out({
     sdmmc_cmd_obuf_i
  })
 ,.mpfe_csr_ARADDR({
     hps2mpfe_csr_araddr[43:0]
  })
 ,.f2soc_RVALID({
     mpfe2hps_rvalid[0:0]
  })
 ,.ccu_dmi1_ARUSER({
     hps2mpfe_dmi1_aruser[7:0]
  })
 ,.soc2fpga_aw_prot({
     hps2fpga_awprot_intr
  })
 ,.f2soc_BRESP({
     mpfe2hps_bresp[1:0]
  })
 ,.ccu_dmi0_AWID({
     hps2mpfe_dmi0_awid[9:0]
  })
 ,.ccu_dmi1_ARLOCK({
     hps2mpfe_dmi1_arlock[0:0]
  })
 ,.hps_ioa_17_bidir_in({
     usb1_data1_ibuf_o
  })
 ,.hps_ioa_10_bidir_in({
     gpio9_ibuf_o
  })
 ,.ccu_dmi0_ARREADY({
     hps2mpfe_dmi0_arready[0:0]
  })
 ,.ccu_dmi0_AWVALID({
     hps2mpfe_dmi0_awvalid[0:0]
  })
 ,.hps_iob_1_bidir_out({
     sdmmc_data0_obuf_i
  })
 ,.soc2fpga_aw_size({
     hps2fpga_awsize_intr
  })
 ,.lwsoc2fpga_w_data({
     lwhps2fpga_wdata_intr
  })
 ,.hps_iob_7_bidir_in({
     sdmmc_data3_ibuf_o
  })
 ,.hps_fi_spare_out({
     usb1_usb31_usb_ctrl[1:0]
    ,62'b00000000000000000000000000000000000000000000000000000000000000
  })
 ,.soc2fpga_r_ready({
     hps2fpga_rready_intr
  })
 ,.f2soc_ARQOS({
     mpfe2hps_arqos[3:0]
  })
 ,.hps_iob_17_bidir_out({
     emac2_txd0_obuf_i
  })
 ,.f2soc_AWBURST({
     mpfe2hps_awburst[1:0]
  })
 ,.f2soc_WDATA({
     mpfe2hps_wdata[255:0]
  })
 ,.soc2fpga_clk({
     hps2fpga_clk
  })
 ,.f2soc_ARVALID({
     mpfe2hps_arvalid[0:0]
  })
 ,.spim0_miso_i({
     spim0_miso_i[0:0]
  })
 ,.f2soc_AWREGION({
     mpfe2hps_awregion[3:0]
  })
 ,.f2soc_RRESP({
     mpfe2hps_rresp[1:0]
  })
 ,.lwsoc2fpga_ar_valid({
     lwhps2fpga_arvalid_intr
  })
 ,.spim0_ss1_n_o({
     spim0_ss1_n_o[0:0]
  })
 ,.emac0_phy_rxd_i({
     emac0_phy_rxd_i[7:0]
  })
 ,.lwsoc2fpga_aw_ready({
     lwhps2fpga_awready_intr
  })
 ,.hps_iob_10_bidir_out({
     mdio2_mdc_obuf_i
  })
 ,.ccu_dmi1_ARID({
     hps2mpfe_dmi1_arid[9:0]
  })
 ,.hps_ioa_4_bidir_in({
     uart0_io_rx_ibuf_o
  })
 ,.mpfe_csr_BID({
     hps2mpfe_csr_bid[9:0]
  })
 ,.emac0_phy_rxer_i({
     emac0_phy_rxer_i[0:0]
  })
 ,.fpga2soc_emac_timestamp_data({
     emac_timestamp_data[63:0]
  })
 ,.f2soc_ARLEN({
     mpfe2hps_arlen[7:0]
  })
 ,.ccu_dmi1_BVALID({
     hps2mpfe_dmi1_bvalid[0:0]
  })
 ,.soc2fpga_aw_cache({
     hps2fpga_awcache_intr
  })
 ,.hps_ioa_8_bidir_out({
     gpio7_obuf_i
  })
 ,.mpfe_csr_AWREADY({
     hps2mpfe_csr_awready[0:0]
  })
 ,.mpfe_csr_BREADY({
     hps2mpfe_csr_bready[0:0]
  })
 ,.i2c1_sda_i({
     i2c1_sda_i[0:0]
  })
 ,.ccu_dmi1_WSTRB({
     hps2mpfe_dmi1_wstrb[31:0]
  })
 ,.s2f_user_clk0_hio({
     user0_clk[0:0]
  })
 ,.soc2fpga_r_last({
     hps2fpga_rlast_intr
  })
 ,.mpfe_csr_AWADDR({
     hps2mpfe_csr_awaddr[43:0]
  })
 ,.hps_ioa_17_bidir_out({
     usb1_data1_obuf_i
  })
 ,.ccu_dmi1_RLAST({
     hps2mpfe_dmi1_rlast[0:0]
  })
 ,.ccu_dmi1_ARCACHE({
     hps2mpfe_dmi1_arcache[3:0]
  })
 ,.ccu_dmi1_AWUSER({
     hps2mpfe_dmi1_awuser[7:0]
  })
 ,.emac0_phy_mac_speed_o({
     emac0_phy_mac_speed_o[2:0]
  })
 ,.f2soc_ARPROT({
     mpfe2hps_arprot[2:0]
  })
 ,.hps_ioa_22_bidir_in({
     usb1_data5_ibuf_o
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
 ,.hps_iob_3_bidir_out({
     sdmmc_cclk_obuf_i
  })
 ,.i2c1_sda_oe({
     i2c1_sda_oe[0:0]
  })
 ,.soc2fpga_ar_addr({
     hps2fpga_araddr_intr
  })
 ,.emac0_phy_txen_o({
     emac0_phy_txen_o[0:0]
  })
 ,.f2soc_ARSIZE({
     mpfe2hps_arsize[2:0]
  })
 ,.ccu_dmi0_BID({
     hps2mpfe_dmi0_bid[9:0]
  })
 ,.hps_ioa_10_bidir_out({
     gpio9_obuf_i
  })
 ,.hps_iob_11_bidir_in({
     gpio34_ibuf_o
  })
 ,.ccu_dmi0_RVALID({
     hps2mpfe_dmi0_rvalid[0:0]
  })
 ,.ccu_dmi0_WSTRB({
     hps2mpfe_dmi0_wstrb[31:0]
  })
 ,.ccu_dmi0_AWCACHE({
     hps2mpfe_dmi0_awcache[3:0]
  })
 ,.ccu_dmi0_RLAST({
     hps2mpfe_dmi0_rlast[0:0]
  })
 ,.mpfe_csr_ARBURST({
     hps2mpfe_csr_arburst[1:0]
  })
 ,.soc2fpga_aw_lock({
     hps2fpga_awlock_intr
  })
 ,.lwsoc2fpga_w_valid({
     lwhps2fpga_wvalid_intr
  })
 ,.hps_iob_12_bidir_out({
     gpio35_obuf_i
  })
 ,.soc2fpga_ar_valid({
     hps2fpga_arvalid_intr
  })
 ,.lwsoc2fpga_ar_len({
     lwhps2fpga_arlen_intr
  })
 ,.soc2fpga_aw_ready({
     hps2fpga_awready_intr
  })
 ,.hps_ioa_8_bidir_in({
     gpio7_ibuf_o
  })
 ,.lwsoc2fpga_aw_addr({
     lwhps2fpga_awaddr_intr
  })
 ,.hps_ioa_1_bidir_in({
     hps_osc_clk_ibuf_o
  })
 ,.ccu_dmi0_RID({
     hps2mpfe_dmi0_rid[9:0]
  })
 ,.f2soc_ARCACHE({
     mpfe2hps_arcache[3:0]
  })
 ,.lwsoc2fpga_ar_cache({
     lwhps2fpga_arcache_intr
  })
 ,.ccu_dmi1_WREADY({
     hps2mpfe_dmi1_wready[0:0]
  })
 ,.ccu_dmi1_ARADDR({
     hps2mpfe_dmi1_araddr[43:0]
  })
 ,.mpfe_csr_AWID({
     hps2mpfe_csr_awid[9:0]
  })
 ,.hps_ioa_20_bidir_out({
     usb1_data3_obuf_i
  })
 ,.hps_ioa_19_bidir_out({
     usb1_data2_obuf_i
  })
 ,.ccu_dmi1_ARREADY({
     hps2mpfe_dmi1_arready[0:0]
  })
 ,.ccu_dmi1_AWVALID({
     hps2mpfe_dmi1_awvalid[0:0]
  })
 ,.hps_ioa_3_bidir_out({
     uart0_io_tx_obuf_i
  })
 ,.soc2fpga_w_strb({
     hps2fpga_wstrb_intr
  })
 ,.f2soc_AWQOS({
     mpfe2hps_awqos[3:0]
  })
 ,.ccu_dmi1_WLAST({
     hps2mpfe_dmi1_wlast[0:0]
  })
 ,.hps_iob_5_bidir_out({
     gpio28_obuf_i
  })
 ,.fpga2sdram_bridge_rst_n({
     fpga2sdram_bridge_rst_n[0:0]
  })
 ,.f2soc_AWPROT({
     mpfe2hps_awprot[2:0]
  })
 ,.hps_ioa_18_bidir_in({
     usb1_nxt_ibuf_o
  })
 ,.hps_ioa_11_bidir_in({
     gpio10_ibuf_o
  })
 ,.f2soc_RREADY({
     mpfe2hps_rready[0:0]
  })
 ,.f2soc_WVALID({
     mpfe2hps_wvalid[0:0]
  })
 ,.hps_ioa_12_bidir_out({
     gpio11_obuf_i
  })
 ,.emac0_phy_crs_i({
     emac0_phy_crs_i[0:0]
  })
 ,.hps_iob_23_bidir_in({
     emac2_rxd2_ibuf_o
  })
 ,.hps_iob_22_bidir_out({
     emac2_txd3_obuf_i
  })
 ,.soc2fpga_r_data({
     96'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    ,hps2fpga_rdata_intr
  })
 ,.f2soc_AWSIZE({
     mpfe2hps_awsize[2:0]
  })
);

endmodule


