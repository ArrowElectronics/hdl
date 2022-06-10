// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2017 (c) Analog Devices, Inc. All rights reserved.
//
// In this HDL repository, there are many different and unique modules, consisting
// of various HDL (Verilog or VHDL) components. The individual modules are
// developed independently, and may be accompanied by separate and unique license
// terms.
//
// The user should read each of these license terms, and understand the
// freedoms and responsibilities that he or she has by using this source/core.
//
// This core is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory
//      of this repository (LICENSE_GPL2), and also online at:
//      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license, which can be found in the top level directory
//      of this repository (LICENSE_ADIBSD), and also on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module system_top (

  // clock and resets

  input             	sys_clk,

  // hps-ddr
 input             hps_ddr_ref_clk,
  output  [ 14:0]   	ddr3_a,
  output  [  2:0]   	ddr3_ba,
  output            	ddr3_reset_n,
  output            	ddr3_ck_p,
  output            	ddr3_ck_n,
  output            	ddr3_cke,
  output            	ddr3_cs_n,
  output            	ddr3_ras_n,
  output            	ddr3_cas_n,
  output            	ddr3_we_n,
  inout   [ 31:0]   	ddr3_dq,
  inout   [  3:0]   	ddr3_dqs_p,
  inout   [  3:0]   	ddr3_dqs_n,
  inout  [  3:0]   	ddr3_dm,
  output            	ddr3_odt,
  input             	ddr3_rzq,
  input 					ddr_alert_n,


  // hps-ethernet

  output            	eth1_tx_clk,
  output            	eth1_tx_ctl,
  output  [  3:0]   	eth1_tx_d,
  input             	eth1_rx_clk,
  input             	eth1_rx_ctl,
  input   [  3:0]   	eth1_rx_d,
  output            	eth1_mdc,
  inout             	eth1_mdio,
 // inout			eth_rst,
  inout			phy_int,
  
  // hps-qspi

  output            	qspi_ss0,
  output            	qspi_clk,
  inout   [  3:0]   	qspi_io,

  // hps-sdio

  output            	sdio_clk,
  inout             	sdio_cmd,
  inout   [  3:0]   	sdio_d,

  // hps-usb

  input             	usb1_clk,
  output           	usb1_stp,
  input             	usb1_dir,
  input             	usb1_nxt,
  inout   [  7:0]   	usb1_d,
  //inout			usb1_rst,

  // hps-uart

  input             	uart0_rx,
  output            	uart0_tx,
  
  // hps-i2c

  inout             	hps_scl,
  inout            	hps_sda,

	// hps-fmc
  inout   [  0:0]   hps_vadj_en,
	inout   [  0:0] 					hps_eth_resetn,
	inout   [  0:0] 					hps_usb_resetn,

  // adrv9001-interface

  output            	spi_clk,
  output            	spi_mosi,
  input             	spi_miso,
  output            	spi_csn,

  input             	fpga_ref_clk_n,
  input             	fpga_ref_clk_p,

  // Device clock passed through 9001
  input             	dev_clk_in,

  input             	fpga_mcs_in_n,
  input             	fpga_mcs_in_p,
  output            	dev_mcs_fpga_out_n,
  output            	dev_mcs_fpga_out_p,

  inout             	dgpio_0,
  inout             	dgpio_1,
  inout             	dgpio_2,
  inout             	dgpio_3,
  inout             	dgpio_4,
  inout             	dgpio_5,
  inout             	dgpio_6,
  inout             	dgpio_7,
  inout             	dgpio_8,
  inout            	dgpio_9,
  inout             	dgpio_10,
  inout             	dgpio_11,

  inout             	gp_int,
  inout             	mode,
  inout             	reset_trx,

  // physical interface
  input             	rx1_dclk_in_n,
  input             	rx1_dclk_in_p,
  output           	rx1_enable,
  input             	rx1_idata_in_n,
  input             	rx1_idata_in_p,
  input             	rx1_qdata_in_n,
  input             	rx1_qdata_in_p,
  input             	rx1_strobe_in_n,
  input             	rx1_strobe_in_p,

  input             	rx2_dclk_in_n,
  input             	rx2_dclk_in_p,
  output            	rx2_enable,
  input             	rx2_idata_in_n,
  input             	rx2_idata_in_p,
  input             	rx2_qdata_in_n,
  input             	rx2_qdata_in_p,
  input             	rx2_strobe_in_n,
  input             	rx2_strobe_in_p,

  output            	tx1_dclk_out_n,
  output            	tx1_dclk_out_p,
  input             	tx1_dclk_in_n,
  input             	tx1_dclk_in_p,
  output            	tx1_enable,
  output            	tx1_idata_out_n,
  output            	tx1_idata_out_p,
  output            	tx1_qdata_out_n,
  output            	tx1_qdata_out_p,
  output            	tx1_strobe_out_n,
  output            	tx1_strobe_out_p,

  output            	tx2_dclk_out_n,
  output            	tx2_dclk_out_p,
  input             	tx2_dclk_in_n,
  input             	tx2_dclk_in_p,
  output            	tx2_enable,
  output            	tx2_idata_out_n,
  output            	tx2_idata_out_p,
  output            	tx2_qdata_out_n,
  output            	tx2_qdata_out_p,
  output            	tx2_strobe_out_n,
  output            	tx2_strobe_out_p,

  input             	vadj_err,
  output            	platform_status,


  output		fmc_pg_c2m_fpga
);

  // internal signals

  wire              	sys_resetn;
  
  wire	  [15:0]	hdmi_data_pd;

  wire    [7:0]   	gpio_bd_i;
  wire	  [3:0]   	gpio_bd_o;
  
  wire    [63:0]   	gpio_i;
  wire    [63:0]   	gpio_o;
  wire              	gpio_rx1_enable_in;
  wire              	gpio_rx2_enable_in;
  wire             	gpio_tx1_enable_in;
  wire              	gpio_tx2_enable_in;

  wire			ssi_sync;		// added to satisfy devicetree. does not do anything

  


  // assignments

  assign fmc_pg_c2m_fpga = 1'b1;

  assign gpio_i[54:32] = gpio_o[54:32];
  assign gpio_i[55] = vadj_err;
  assign gpio_i[63:56] = gpio_o[63:56];

  // board stuff (max-v-u21)

  //assign gpio_i[31:12] = gpio_o[31:12];
  assign gpio_i[31:13] = gpio_o[31:13];
  assign gpio_i[12] = ssi_sync;
  assign gpio_i[11: 4] = gpio_bd_i;
  assign gpio_i[ 3: 0] = gpio_o[ 3: 0];

  assign gpio_bd_o = gpio_o[3:0];
  
  // platform designer instantiation
  system_bd i_system_bd (
    .sys_clk_clk (sys_clk),
    .sys_rstn_reset_n (sys_resetn),
    .sys_hps_io_hps_io_phery_emac1_TX_CLK (eth1_tx_clk),
    .sys_hps_io_hps_io_phery_emac1_TXD0 (eth1_tx_d[0]),
    .sys_hps_io_hps_io_phery_emac1_TXD1 (eth1_tx_d[1]),
    .sys_hps_io_hps_io_phery_emac1_TXD2 (eth1_tx_d[2]),
    .sys_hps_io_hps_io_phery_emac1_TXD3 (eth1_tx_d[3]),
    .sys_hps_io_hps_io_phery_emac1_RXD0 (eth1_rx_d[0]),
    .sys_hps_io_hps_io_phery_emac1_MDIO (eth1_mdio),
    .sys_hps_io_hps_io_phery_emac1_MDC (eth1_mdc),
    .sys_hps_io_hps_io_phery_emac1_RX_CTL (eth1_rx_ctl),
    .sys_hps_io_hps_io_phery_emac1_TX_CTL (eth1_tx_ctl),
    .sys_hps_io_hps_io_phery_emac1_RX_CLK (eth1_rx_clk),
    .sys_hps_io_hps_io_phery_emac1_RXD1 (eth1_rx_d[1]),
    .sys_hps_io_hps_io_phery_emac1_RXD2 (eth1_rx_d[2]),
    .sys_hps_io_hps_io_phery_emac1_RXD3 (eth1_rx_d[3]),
	 
  /*  .sys_hps_hps_io_hps_io_qspi_inst_IO0 (qspi_io[0]),
    .sys_hps_hps_io_hps_io_qspi_inst_IO1 (qspi_io[1]),
    .sys_hps_hps_io_hps_io_qspi_inst_IO2 (qspi_io[2]),
    .sys_hps_hps_io_hps_io_qspi_inst_IO3 (qspi_io[3]),
    .sys_hps_hps_io_hps_io_qspi_inst_SS0 (qspi_ss0),
    .sys_hps_hps_io_hps_io_qspi_inst_CLK (qspi_clk),*/
	 
    .sys_hps_io_hps_io_phery_sdmmc_CMD (sdio_cmd),
    .sys_hps_io_hps_io_phery_sdmmc_D0 (sdio_d[0]),
    .sys_hps_io_hps_io_phery_sdmmc_D1 (sdio_d[1]),
    .sys_hps_io_hps_io_phery_sdmmc_CCLK (sdio_clk),
    .sys_hps_io_hps_io_phery_sdmmc_D2 (sdio_d[2]),
    .sys_hps_io_hps_io_phery_sdmmc_D3 (sdio_d[3]),
	 
    .sys_hps_io_hps_io_phery_usb1_DATA0 (usb1_d[0]),
    .sys_hps_io_hps_io_phery_usb1_DATA1 (usb1_d[1]),
    .sys_hps_io_hps_io_phery_usb1_DATA2 (usb1_d[2]),
    .sys_hps_io_hps_io_phery_usb1_DATA3 (usb1_d[3]),
    .sys_hps_io_hps_io_phery_usb1_DATA4 (usb1_d[4]),
    .sys_hps_io_hps_io_phery_usb1_DATA5 (usb1_d[5]),
    .sys_hps_io_hps_io_phery_usb1_DATA6 (usb1_d[6]),
    .sys_hps_io_hps_io_phery_usb1_DATA7 (usb1_d[7]),
    .sys_hps_io_hps_io_phery_usb1_CLK (usb1_clk),
    .sys_hps_io_hps_io_phery_usb1_STP (usb1_stp),
    .sys_hps_io_hps_io_phery_usb1_DIR (usb1_dir),
    .sys_hps_io_hps_io_phery_usb1_NXT (usb1_nxt),
	 
    .sys_hps_io_hps_io_phery_uart1_RX (uart0_rx),
    .sys_hps_io_hps_io_phery_uart1_TX (uart0_tx),
	 
   // .sys_hps_io_hps_io_phery_i2c1_SDA (fmc_sda),
  //  .sys_hps_io_hps_io_phery_i2c1_SCL (fmc_scl),
    .sys_hps_io_hps_io_phery_i2c1_SDA (hps_sda),
    .sys_hps_io_hps_io_phery_i2c1_SCL (hps_scl),
	 
    .sys_hps_ddr_mem_a (ddr3_a),
    .sys_hps_ddr_mem_ba (ddr3_ba),
    .sys_hps_ddr_mem_ck (ddr3_ck_p),
    .sys_hps_ddr_mem_ck_n (ddr3_ck_n),
    .sys_hps_ddr_mem_cke (ddr3_cke),
    .sys_hps_ddr_mem_cs_n (ddr3_cs_n),
   // .sys_hps_ddr_mem_ras_n (ddr3_ras_n),
   // .sys_hps_ddr_mem_cas_n (ddr3_cas_n),
   // .sys_hps_ddr_mem_we_n (ddr3_we_n),
    .sys_hps_ddr_mem_reset_n (ddr3_reset_n),
	 .sys_hps_ddr_mem_alert_n (ddr_alert_n),
    .sys_hps_ddr_mem_dq (ddr3_dq),
    .sys_hps_ddr_mem_dqs (ddr3_dqs_p),
    .sys_hps_ddr_mem_dqs_n (ddr3_dqs_n),
    .sys_hps_ddr_mem_odt (ddr3_odt),
    .sys_hps_ddr_mem_dbi_n (ddr3_dm),
	 .sys_hps_ddr_oct_oct_rzqin (ddr3_rzq),
	 .sys_hps_ddr_ref_clk_clk (hps_ddr_ref_clk),
	 
	 .sys_hps_io_hps_io_gpio_gpio0_io0 (hps_vadj_en),
    .sys_hps_io_hps_io_gpio_gpio0_io1 (hps_eth_resetn),
    .sys_hps_io_hps_io_gpio_gpio0_io9 (hps_usb_resetn),
	


    .adrv9001_if_rx1_dclk_in_n_NC	 (rx1_dclk_in_n),
	 .adrv9001_if_rx1_dclk_in_p_dclk_in (rx1_dclk_in_p),
    .adrv9001_if_rx1_idata_in_n_idata0 (rx1_idata_in_n),
    .adrv9001_if_rx1_idata_in_p_idata1 (rx1_idata_in_p),
    .adrv9001_if_rx1_qdata_in_n_qdata2 (rx1_qdata_in_n),
    .adrv9001_if_rx1_qdata_in_p_qdata3 (rx1_qdata_in_p),
    .adrv9001_if_rx1_strobe_in_n_NC (rx1_strobe_in_n),
	 .adrv9001_if_rx1_strobe_in_p_strobe_in (rx1_strobe_in_p),
	 
    .adrv9001_if_rx2_dclk_in_n_NC (rx2_dclk_in_n),
	 .adrv9001_if_rx2_dclk_in_p_dclk_in (rx2_dclk_in_p),
    .adrv9001_if_rx2_idata_in_n_idata0 (rx2_idata_in_n),
    .adrv9001_if_rx2_idata_in_p_idata1 (rx2_idata_in_p),
    .adrv9001_if_rx2_qdata_in_n_qdata2 (rx2_qdata_in_n),
    .adrv9001_if_rx2_qdata_in_p_qdata3 (rx2_qdata_in_p),
    .adrv9001_if_rx2_strobe_in_n_NC (rx2_strobe_in_n),
	 .adrv9001_if_rx2_strobe_in_p_strobe_in (rx2_strobe_in_p),
	 
    .adrv9001_if_tx1_dclk_out_n_NC (tx1_dclk_out_n),
	 .adrv9001_if_tx1_dclk_out_p_dclk_out (tx1_dclk_out_p),
    .adrv9001_if_tx1_dclk_in_n_NC (tx1_dclk_in_n),
	 .adrv9001_if_tx1_dclk_in_p_dclk_in (tx1_dclk_in_p),
    .adrv9001_if_tx1_idata_out_n_idata0 (tx1_idata_out_n),
    .adrv9001_if_tx1_idata_out_p_idata1 (tx1_idata_out_p),
    .adrv9001_if_tx1_qdata_out_n_qdata2 (tx1_qdata_out_n),
    .adrv9001_if_tx1_qdata_out_p_qdata3 (tx1_qdata_out_p),
    .adrv9001_if_tx1_strobe_out_n_NC (tx1_strobe_out_n),
	 .adrv9001_if_tx1_strobe_out_p_strobe_out (tx1_strobe_out_p),
	 
    .adrv9001_if_tx2_dclk_out_n_NC (tx2_dclk_out_n),
	 .adrv9001_if_tx2_dclk_out_p_dclk_out (tx2_dclk_out_p),
    .adrv9001_if_tx2_dclk_in_n_NC (tx2_dclk_in_n),
	 .adrv9001_if_tx2_dclk_in_p_dclk_in (tx2_dclk_in_p),
    .adrv9001_if_tx2_idata_out_n_idata0 (tx2_idata_out_n),
    .adrv9001_if_tx2_idata_out_p_idata1 (tx2_idata_out_p),
    .adrv9001_if_tx2_qdata_out_n_qdata2 (tx2_qdata_out_n),
    .adrv9001_if_tx2_qdata_out_p_qdata3 (tx2_qdata_out_p),
    .adrv9001_if_tx2_strobe_out_n_NC (tx2_strobe_out_n),
	 .adrv9001_if_tx2_strobe_out_p_strobe_out (tx2_strobe_out_p),

    .adrv9001_if_rx1_enable (rx1_enable),
    .adrv9001_if_rx2_enable (rx2_enable),
    .adrv9001_if_tx1_enable (tx1_enable),
    .adrv9001_if_tx2_enable (tx2_enable),

    .adrv9001_tdd_if_rx1_enable_in (gpio_rx1_enable_in),
    .adrv9001_tdd_if_rx2_enable_in (gpio_rx2_enable_in),
    .adrv9001_tdd_if_tx1_enable_in (gpio_tx1_enable_in),
    .adrv9001_tdd_if_tx2_enable_in (gpio_tx2_enable_in),
    .adrv9001_tdd_if_tdd_sync_in (1'b0),

    .sys_gpio_bd_in_port (gpio_i[31:0]),
    .sys_gpio_bd_out_port (gpio_o[31:0]),
    .sys_gpio_in_export (gpio_i[63:32]),
    .sys_gpio_out_export (gpio_o[63:32]),

    .sys_spi_MISO (spi_miso),
    .sys_spi_MOSI (spi_mosi),
    .sys_spi_SCLK (spi_clk),
    .sys_spi_SS_n (spi_csn),

    .adrv9001_gpio_export({ssi_sync,
			   gpio_tx2_enable_in,
                           gpio_tx1_enable_in,
                           gpio_rx2_enable_in,
                           gpio_rx1_enable_in,
                           reset_trx,
                           mode,
                           gp_int,
                           dgpio_11,
                           dgpio_10,
                           dgpio_9,
                           dgpio_8,
                           dgpio_7,
                           dgpio_6,
                           dgpio_5,
                           dgpio_4,
                           dgpio_3,
                           dgpio_2,
                           dgpio_1,
                           dgpio_0})
  );

endmodule

// ***************************************************************************
// ***************************************************************************
