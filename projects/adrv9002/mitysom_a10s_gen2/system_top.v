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

  input             sys_clk,
  input             sys_resetn,

  // hps-ddr4 (32)

  input             hps_ddr_ref_clk,
  output  [  0:0]   hps_ddr_clk_p,
  output  [  0:0]   hps_ddr_clk_n,
  output  [ 16:0]   hps_ddr_a,
  output  [  1:0]   hps_ddr_ba,
  output  [  1:0]   hps_ddr_bg,
  output  [  0:0]   hps_ddr_cke,
  output  [  0:0]   hps_ddr_cs_n,
  output  [  0:0]   hps_ddr_odt,
  output  [  0:0]   hps_ddr_reset_n,
  output  [  0:0]   hps_ddr_act_n,
  output  [  0:0]   hps_ddr_par,
  input   [  0:0]   hps_ddr_alert_n,
  inout   [  3:0]   hps_ddr_dqs_p,
  inout   [  3:0]   hps_ddr_dqs_n,
  inout   [ 31:0]   hps_ddr_dq,
  inout   [  3:0]   hps_ddr_dbi_n,
  input             hps_ddr_rzq,

  // pl-ddr4
 
  input             sys_ddr_ref_clk,
  output  [  0:0]   sys_ddr_clk_p,
  output  [  0:0]   sys_ddr_clk_n,
  output  [ 16:0]   sys_ddr_a,
  output  [  1:0]   sys_ddr_ba,
  output  [  1:0]   sys_ddr_bg,
  output  [  0:0]   sys_ddr_cke,
  output  [  0:0]   sys_ddr_cs_n,
  output  [  0:0]   sys_ddr_odt,
  output  [  0:0]   sys_ddr_reset_n,
  output  [  0:0]   sys_ddr_act_n,
  output  [  0:0]   sys_ddr_par,
  input   [  0:0]   sys_ddr_alert_n,
  inout   [  1:0]   sys_ddr_dqs_p,
  inout   [  1:0]   sys_ddr_dqs_n,
  inout   [ 15:0]   sys_ddr_dq,
  inout   [  1:0]   sys_ddr_dbi_n,
  input             sys_ddr_rzq,

  // hps-ethernet

  input   [  0:0]   hps_eth_rxclk,
  input   [  0:0]   hps_eth_rxctl,
  input   [  3:0]   hps_eth_rxd,
  output  [  0:0]   hps_eth_txclk,
  output  [  0:0]   hps_eth_txctl,
  output  [  3:0]   hps_eth_txd,
  output  [  0:0]   hps_eth_mdc,
  inout   [  0:0]   hps_eth_mdio,
  inout   [  0:0]   hps_eth_resetn,

  // hps-sdio

  output  [  0:0]   hps_sdio_clk,
  inout   [  0:0]   hps_sdio_cmd,
  inout   [  3:0]   hps_sdio_d,

  // hps-usb

  input   [  0:0]   hps_usb_clk,
  input   [  0:0]   hps_usb_dir,
  input   [  0:0]   hps_usb_nxt,
  output  [  0:0]   hps_usb_stp,
  inout   [  7:0]   hps_usb_d,
  inout   [  0:0]   hps_usb_resetn,

  // hps-uart

  input   [  0:0]   hps_uart_rx,
  output  [  0:0]   hps_uart_tx,

  // hps-i2c (shared w fmc-a, fmc-b)

  inout   [  0:0]   hps_i2c_sda,
  inout   [  0:0]   hps_i2c_scl,

  // hps-fmc
  inout   [  0:0]   hps_vadj_en,

  // adrv9002interface
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
  output            	platform_status
  
);

  // internal signals

  wire              sys_ddr_cal_success;
  wire              sys_ddr_cal_fail;
  wire              sys_hps_resetn;
  wire              sys_resetn_s;
  wire    [ 63:0]   gpio_i;
  wire    [ 63:0]   gpio_o;
  wire    [  7:0]   spi_csn_s;
  wire              dac_fifo_bypass;
  
  
  wire              	gpio_rx1_enable_in;
  wire              	gpio_rx2_enable_in;
  wire             	gpio_tx1_enable_in;
  wire              	gpio_tx2_enable_in;

  wire			ssi_sync;	

  // assignments

  assign platform_status = vadj_err;

  // gpio (adrv9009)

  assign gpio_i[63:61] = gpio_o[63:61];

  assign dac_fifo_bypass = gpio_o[60];
  assign gpio_i[60:60] = gpio_o[60];


  assign adrv9009_reset_b = gpio_o[52];
  assign gpio_i[59:52] = gpio_o[59:52];

  assign gpio_i[51] = vadj_err;

  assign gpio_i[50:32] = gpio_o[50:32];
  
//   board stuff (max-v-u21)

  assign gpio_i[31:14] = gpio_o[31:14];
  assign gpio_i[13:13] = sys_ddr_cal_success;
  assign gpio_i[12:12] = sys_ddr_cal_fail;
  assign gpio_i[11:11] = ssi_sync;
  assign gpio_i[10: 4] = 3'b000;
  assign gpio_i[ 3: 0] = gpio_o[3:0];

  assign gpio_bd_o = gpio_o[3:0];

  // peripheral reset

  assign sys_resetn_s = sys_hps_resetn;

  // instantiations

  system_bd i_system_bd (
  //  .adrv9009_gpio_export (adrv9009_gpio),
    .sys_clk_clk (sys_clk),
    .sys_ddr_mem_mem_ck (sys_ddr_clk_p),
    .sys_ddr_mem_mem_ck_n (sys_ddr_clk_n),
    .sys_ddr_mem_mem_a (sys_ddr_a),
    .sys_ddr_mem_mem_act_n (sys_ddr_act_n),
    .sys_ddr_mem_mem_ba (sys_ddr_ba),
    .sys_ddr_mem_mem_bg (sys_ddr_bg),
    .sys_ddr_mem_mem_cke (sys_ddr_cke),
    .sys_ddr_mem_mem_cs_n (sys_ddr_cs_n),
    .sys_ddr_mem_mem_odt (sys_ddr_odt),
    .sys_ddr_mem_mem_reset_n (sys_ddr_reset_n),
    .sys_ddr_mem_mem_par (sys_ddr_par),
    .sys_ddr_mem_mem_alert_n (sys_ddr_alert_n),
    .sys_ddr_mem_mem_dqs (sys_ddr_dqs_p),
    .sys_ddr_mem_mem_dqs_n (sys_ddr_dqs_n),
    .sys_ddr_mem_mem_dq (sys_ddr_dq),
    .sys_ddr_mem_mem_dbi_n (sys_ddr_dbi_n),
    .sys_ddr_oct_oct_rzqin (sys_ddr_rzq),
    .sys_ddr_ref_clk_clk (sys_ddr_ref_clk),
    .sys_ddr_status_local_cal_success (sys_ddr_cal_success),
    .sys_ddr_status_local_cal_fail (sys_ddr_cal_fail),
    .sys_hps_ddr_mem_ck (hps_ddr_clk_p),
    .sys_hps_ddr_mem_ck_n (hps_ddr_clk_n),
    .sys_hps_ddr_mem_a (hps_ddr_a),
    .sys_hps_ddr_mem_act_n (hps_ddr_act_n),
    .sys_hps_ddr_mem_ba (hps_ddr_ba),
    .sys_hps_ddr_mem_bg (hps_ddr_bg),
    .sys_hps_ddr_mem_cke (hps_ddr_cke),
    .sys_hps_ddr_mem_cs_n (hps_ddr_cs_n),
    .sys_hps_ddr_mem_odt (hps_ddr_odt),
    .sys_hps_ddr_mem_reset_n (hps_ddr_reset_n),
    .sys_hps_ddr_mem_par (hps_ddr_par),
    .sys_hps_ddr_mem_alert_n (hps_ddr_alert_n),
    .sys_hps_ddr_mem_dqs (hps_ddr_dqs_p),
    .sys_hps_ddr_mem_dqs_n (hps_ddr_dqs_n),
    .sys_hps_ddr_mem_dq (hps_ddr_dq),
    .sys_hps_ddr_mem_dbi_n (hps_ddr_dbi_n),
    .sys_hps_ddr_oct_oct_rzqin (hps_ddr_rzq),
    .sys_hps_ddr_ref_clk_clk (hps_ddr_ref_clk),
    .sys_hps_ddr_rstn_reset_n (sys_resetn),
    .sys_hps_io_hps_io_phery_emac1_TX_CLK (hps_eth_txclk),
    .sys_hps_io_hps_io_phery_emac1_TXD0 (hps_eth_txd[0]),
    .sys_hps_io_hps_io_phery_emac1_TXD1 (hps_eth_txd[1]),
    .sys_hps_io_hps_io_phery_emac1_TXD2 (hps_eth_txd[2]),
    .sys_hps_io_hps_io_phery_emac1_TXD3 (hps_eth_txd[3]),
    .sys_hps_io_hps_io_phery_emac1_RX_CTL (hps_eth_rxctl),
    .sys_hps_io_hps_io_phery_emac1_TX_CTL (hps_eth_txctl),
    .sys_hps_io_hps_io_phery_emac1_RX_CLK (hps_eth_rxclk),
    .sys_hps_io_hps_io_phery_emac1_RXD0 (hps_eth_rxd[0]),
    .sys_hps_io_hps_io_phery_emac1_RXD1 (hps_eth_rxd[1]),
    .sys_hps_io_hps_io_phery_emac1_RXD2 (hps_eth_rxd[2]),
    .sys_hps_io_hps_io_phery_emac1_RXD3 (hps_eth_rxd[3]),
    .sys_hps_io_hps_io_phery_emac1_MDIO (hps_eth_mdio),
    .sys_hps_io_hps_io_phery_emac1_MDC (hps_eth_mdc),
    .sys_hps_io_hps_io_phery_sdmmc_CMD (hps_sdio_cmd),
    .sys_hps_io_hps_io_phery_sdmmc_D0 (hps_sdio_d[0]),
    .sys_hps_io_hps_io_phery_sdmmc_D1 (hps_sdio_d[1]),
    .sys_hps_io_hps_io_phery_sdmmc_D2 (hps_sdio_d[2]),
    .sys_hps_io_hps_io_phery_sdmmc_D3 (hps_sdio_d[3]),
    .sys_hps_io_hps_io_phery_sdmmc_CCLK (hps_sdio_clk),
    .sys_hps_io_hps_io_phery_usb1_DATA0 (hps_usb_d[0]),
    .sys_hps_io_hps_io_phery_usb1_DATA1 (hps_usb_d[1]),
    .sys_hps_io_hps_io_phery_usb1_DATA2 (hps_usb_d[2]),
    .sys_hps_io_hps_io_phery_usb1_DATA3 (hps_usb_d[3]),
    .sys_hps_io_hps_io_phery_usb1_DATA4 (hps_usb_d[4]),
    .sys_hps_io_hps_io_phery_usb1_DATA5 (hps_usb_d[5]),
    .sys_hps_io_hps_io_phery_usb1_DATA6 (hps_usb_d[6]),
    .sys_hps_io_hps_io_phery_usb1_DATA7 (hps_usb_d[7]),	
    .sys_hps_io_hps_io_phery_usb1_CLK (hps_usb_clk),
    .sys_hps_io_hps_io_phery_usb1_STP (hps_usb_stp),
    .sys_hps_io_hps_io_phery_usb1_DIR (hps_usb_dir),
    .sys_hps_io_hps_io_phery_usb1_NXT (hps_usb_nxt),
    .sys_hps_io_hps_io_phery_uart1_RX (hps_uart_rx),
    .sys_hps_io_hps_io_phery_uart1_TX (hps_uart_tx),
    .sys_hps_io_hps_io_phery_i2c1_SDA (hps_i2c_sda),
    .sys_hps_io_hps_io_phery_i2c1_SCL (hps_i2c_scl),
    .sys_hps_io_hps_io_gpio_gpio0_io0 (hps_vadj_en),
    .sys_hps_io_hps_io_gpio_gpio0_io1 (hps_eth_resetn),
    .sys_hps_io_hps_io_gpio_gpio0_io9 (hps_usb_resetn),
    .sys_hps_out_rstn_reset_n (sys_hps_resetn),
    .sys_rstn_reset_n (sys_resetn_s),
	 
	 

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
