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

  output  [ 15:0]   	ddr3_a,
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
  output  [  3:0]   	ddr3_dm,
  output            	ddr3_odt,
  input             	ddr3_rzq,

  // hps-ethernet
  // hps-ethernet

  output            	eth1_tx_clk,
  output            	eth1_tx_ctl,
  output  [  3:0]   	eth1_tx_d,
  input             	eth1_rx_clk,
  input             	eth1_rx_ctl,
  input   [  3:0]   	eth1_rx_d,
  output            	eth1_mdc,
  inout             	eth1_mdio,
  inout			phy_int,
  inout			eth_rst,
  
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
  inout			usb1_rst,

  // hps-uart

  input             	uart0_rx,
  output            	uart0_tx,
  
  // hps-i2c

  inout             	hps_scl,
  inout            	hps_sda,

  // display

  output            	hdmi_clk,
  output	        hdmi_de,
  output	        hdmi_hsync,
  output	        hdmi_vsync,
  output  [  23:0]	hdmi_data,
  
  output            	hdmi_spdif,
  input             	hdmi_spdifout,
  input             	hdmi_int,
  output            	ct_hpd,
  output            	ls_oe,
  output            	cec_clk,

  // fmc interface

  inout             	fmc_scl,
  inout             	fmc_sda,
  
  input             	clk_in,
  input             	ready_in,
  input       [ 7:0]    data_in,  
  
  output                spi_csn,
  output                spi_clk,
  output                spi_mosi,
  input             	spi_miso,

  // default to input when in spi mode, otherwise inout
  
  inout             	gpio_0_mode_0,		
  inout             	gpio_1_mode_1,
  inout             	gpio_2_mode_2,
  inout             	gpio_3_mode_3,
  inout             	gpio_4_filter,
  inout             	reset_n,
  inout             	start_n,
  inout             	sync_n,
  inout             	sync_in_n,
  output                mclk,

  // misc
  
  inout             	fmc_pg_c2m,
  inout             	fmc_prsnt_m2c,
  inout             	cpu_gpio_0,
  inout             	cpu_gpio_1,
  inout             	cpu_gpio_2,
  inout             	cpu_gpio_3,
  inout             	cpu_gpio_4,
  inout             	led_hps_1,
  inout             	led_hps_2,
  inout             	user_btn_hps,
  inout             	nc1,
  inout            	nc2,
  inout			nc3,
  inout			nc4,
  inout			nc5,
  output	[2:0]	test

);

  // internal signals

  wire              	sys_resetn;
  
  wire	[15:0]		hdmi_data_pd;
  
  wire            	adc_clk;
  wire            	adc_valid;
  wire            	adc_valid_pp;
  wire            	adc_sync;
  wire  [31:0]  	adc_data;
  wire  [31:0]  	adc_data_0;
  wire  [31:0]  	adc_data_1;
  wire  [31:0]  	adc_data_2;
  wire  [31:0]  	adc_data_3;
  wire  [31:0]  	adc_data_4;
  wire  [31:0]  	adc_data_5;
  wire  [31:0]  	adc_data_6;
  wire  [31:0]  	adc_data_7;
  wire            	up_sshot;
  wire  [ 1:0]  	up_format;
  wire            	up_crc_enable;
  wire            	up_crc_4_or_16_n;
  wire  [63:0] 		adc_gpio_i;
  wire  [63:0] 		adc_gpio_o;
  wire  [63:0]  	gpio_i;
  wire  [63:0]  	gpio_o;
  wire  [31:0]		ad7768_o;


  // defaults

  assign ct_hpd = 1'b1;
  assign ls_oe = 1'b1;  
  assign cec_clk = 1'b0;
 
  // yuv422, separate sync, x1 clk, style 1, table 18, 1080p, hdmi_clk 148.5M
  
  assign hdmi_data [23:0] = {hdmi_data_pd, {8{1'b0}}};

  // ad7768evb fmc signals

  assign gpio_4_filter = ad7768_o[20];        // 20
  assign gpio_3_mode_3 = ad7768_o[19];        // 19
  assign gpio_2_mode_2 = ad7768_o[18];        // 18
  assign gpio_1_mode_1 = ad7768_o[17];        // 17
  assign gpio_0_mode_0 = ad7768_o[16];        // 16
  assign sync_in_n = ad7768_o[11];            // 11
  assign sync_n = ad7768_o[10];               // 10  
  assign start_n = ad7768_o[9];               // 9
  assign reset_n = ad7768_o[8];               // 8
  
  assign mclk = 1'b0;			      // use external xtal on evb

  // internal signals for ad7768_if module

  assign up_sshot = gpio_o[4];
  assign up_format = gpio_o[3:2];
  assign up_crc_enable = gpio_o[1];
  assign up_crc_4_or_16_n = gpio_o[0];
  
  assign gpio_i[4:0] = 5'b0;
  assign gpio_i[7:5] = gpio_o[7:5];
  assign gpio_i[15:12] = gpio_o[15:12];
  assign gpio_i[31:21] = gpio_o[31:21];

  assign gpio_i[36:32] = 5'b0;
  assign gpio_i[39:37] = gpio_o[39:37];
  assign gpio_i[47:44] = gpio_o[47:44];
  assign gpio_i[63:53] = gpio_o[63:53];
  
    ad7768_if i_ad7768_if (
    .clk_in (clk_in),
    .ready_in (ready_in),
    .data_in (data_in),
    .adc_clk (adc_clk),
    .adc_valid (adc_valid),
    .adc_valid_pp (adc_valid_pp),
    .adc_sync (adc_sync),
    .adc_data (adc_data),
    .adc_data_0 (adc_data_0),
    .adc_data_1 (adc_data_1),
    .adc_data_2 (adc_data_2),
    .adc_data_3 (adc_data_3),
    .adc_data_4 (adc_data_4),
    .adc_data_5 (adc_data_5),
    .adc_data_6 (adc_data_6),
    .adc_data_7 (adc_data_7),
    .up_sshot (up_sshot),
    .up_format (up_format),
    .up_crc_enable (up_crc_enable),
    .up_crc_4_or_16_n (up_crc_4_or_16_n),
    .up_status_clr (adc_gpio_o[32:0]),
    .up_status (adc_gpio_i[32:0]));

  assign test[0]=adc_sync;
  assign test[1]=adc_valid;
  assign test[2]=adc_valid_pp;

  // platform designer instantiation
  system_bd i_system_bd (
    .sys_clk_clk (sys_clk),
    .sys_hps_h2f_reset_reset_n (sys_resetn),
    .sys_hps_hps_io_hps_io_emac1_inst_TX_CLK (eth1_tx_clk),
    .sys_hps_hps_io_hps_io_emac1_inst_TXD0 (eth1_tx_d[0]),
    .sys_hps_hps_io_hps_io_emac1_inst_TXD1 (eth1_tx_d[1]),
    .sys_hps_hps_io_hps_io_emac1_inst_TXD2 (eth1_tx_d[2]),
    .sys_hps_hps_io_hps_io_emac1_inst_TXD3 (eth1_tx_d[3]),
    .sys_hps_hps_io_hps_io_emac1_inst_RXD0 (eth1_rx_d[0]),
    .sys_hps_hps_io_hps_io_emac1_inst_MDIO (eth1_mdio),
    .sys_hps_hps_io_hps_io_emac1_inst_MDC (eth1_mdc),
    .sys_hps_hps_io_hps_io_emac1_inst_RX_CTL (eth1_rx_ctl),
    .sys_hps_hps_io_hps_io_emac1_inst_TX_CTL (eth1_tx_ctl),
    .sys_hps_hps_io_hps_io_emac1_inst_RX_CLK (eth1_rx_clk),
    .sys_hps_hps_io_hps_io_emac1_inst_RXD1 (eth1_rx_d[1]),
    .sys_hps_hps_io_hps_io_emac1_inst_RXD2 (eth1_rx_d[2]),
    .sys_hps_hps_io_hps_io_emac1_inst_RXD3 (eth1_rx_d[3]),
    .sys_hps_hps_io_hps_io_qspi_inst_IO0 (qspi_io[0]),
    .sys_hps_hps_io_hps_io_qspi_inst_IO1 (qspi_io[1]),
    .sys_hps_hps_io_hps_io_qspi_inst_IO2 (qspi_io[2]),
    .sys_hps_hps_io_hps_io_qspi_inst_IO3 (qspi_io[3]),
    .sys_hps_hps_io_hps_io_qspi_inst_SS0 (qspi_ss0),
    .sys_hps_hps_io_hps_io_qspi_inst_CLK (qspi_clk),
    .sys_hps_hps_io_hps_io_sdio_inst_CMD (sdio_cmd),
    .sys_hps_hps_io_hps_io_sdio_inst_D0 (sdio_d[0]),
    .sys_hps_hps_io_hps_io_sdio_inst_D1 (sdio_d[1]),
    .sys_hps_hps_io_hps_io_sdio_inst_CLK (sdio_clk),
    .sys_hps_hps_io_hps_io_sdio_inst_D2 (sdio_d[2]),
    .sys_hps_hps_io_hps_io_sdio_inst_D3 (sdio_d[3]),
    .sys_hps_hps_io_hps_io_usb1_inst_D0 (usb1_d[0]),
    .sys_hps_hps_io_hps_io_usb1_inst_D1 (usb1_d[1]),
    .sys_hps_hps_io_hps_io_usb1_inst_D2 (usb1_d[2]),
    .sys_hps_hps_io_hps_io_usb1_inst_D3 (usb1_d[3]),
    .sys_hps_hps_io_hps_io_usb1_inst_D4 (usb1_d[4]),
    .sys_hps_hps_io_hps_io_usb1_inst_D5 (usb1_d[5]),
    .sys_hps_hps_io_hps_io_usb1_inst_D6 (usb1_d[6]),
    .sys_hps_hps_io_hps_io_usb1_inst_D7 (usb1_d[7]),
    .sys_hps_hps_io_hps_io_usb1_inst_CLK (usb1_clk),
    .sys_hps_hps_io_hps_io_usb1_inst_STP (usb1_stp),
    .sys_hps_hps_io_hps_io_usb1_inst_DIR (usb1_dir),
    .sys_hps_hps_io_hps_io_usb1_inst_NXT (usb1_nxt),
    .sys_hps_hps_io_hps_io_uart0_inst_RX (uart0_rx),
    .sys_hps_hps_io_hps_io_uart0_inst_TX (uart0_tx),
    .sys_hps_hps_io_hps_io_i2c0_inst_SDA (fmc_sda),
    .sys_hps_hps_io_hps_io_i2c0_inst_SCL (fmc_scl),
    .sys_hps_hps_io_hps_io_i2c1_inst_SDA (hps_sda),
    .sys_hps_hps_io_hps_io_i2c1_inst_SCL (hps_scl),	
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO00 (nc3),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO09 (nc4),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO35 (phy_int),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO40 (fmc_pg_c2m),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO41 (fmc_prsnt_m2c),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO42 (usb1_rst),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO43 (eth_rst),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO44 (nc5),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO48 (cpu_gpio_0),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO53 (led_hps_1),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO54 (led_hps_2),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO55 (cpu_gpio_2),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO56 (cpu_gpio_3),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO57 (user_btn_hps),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO58 (cpu_gpio_1),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO59 (nc1),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO61 (cpu_gpio_4),
    .sys_hps_hps_io_hps_io_gpio_inst_GPIO65 (nc2),
    .sys_hps_memory_mem_a (ddr3_a),
    .sys_hps_memory_mem_ba (ddr3_ba),
    .sys_hps_memory_mem_ck (ddr3_ck_p),
    .sys_hps_memory_mem_ck_n (ddr3_ck_n),
    .sys_hps_memory_mem_cke (ddr3_cke),
    .sys_hps_memory_mem_cs_n (ddr3_cs_n),
    .sys_hps_memory_mem_ras_n (ddr3_ras_n),
    .sys_hps_memory_mem_cas_n (ddr3_cas_n),
    .sys_hps_memory_mem_we_n (ddr3_we_n),
    .sys_hps_memory_mem_reset_n (ddr3_reset_n),
    .sys_hps_memory_mem_dq (ddr3_dq),
    .sys_hps_memory_mem_dqs (ddr3_dqs_p),
    .sys_hps_memory_mem_dqs_n (ddr3_dqs_n),
    .sys_hps_memory_mem_odt (ddr3_odt),
    .sys_hps_memory_mem_dm (ddr3_dm),
    .sys_hps_memory_oct_rzqin (ddr3_rzq),
    .sys_rst_reset_n (sys_resetn),
    .hdmi_out_h_clk (hdmi_clk),
    .hdmi_out_h16_hsync (hdmi_hsync),
    .hdmi_out_h16_vsync (hdmi_vsync),
    .hdmi_out_h16_data_e (hdmi_de),
    .hdmi_out_h16_data (hdmi_data_pd),
    .adc_clk_clk (adc_clk),
    .adc_din_data (adc_data),
    .adc_data_0_data (adc_data_0),
    .adc_data_1_data (adc_data_1),
    .adc_data_2_data (adc_data_2),
    .adc_data_3_data (adc_data_3),
    .adc_data_4_data (adc_data_4),
    .adc_data_5_data (adc_data_5),
    .adc_data_6_data (adc_data_6),
    .adc_data_7_data (adc_data_7),
    .adc_valid_valid (adc_valid),
    .adc_valid_pp_fifo_wr_en (adc_valid_pp),
    .adc_sync_sync (adc_sync),
    .sys_gpio_bd_in_port (gpio_bd_i),
    .sys_gpio_bd_out_port (gpio_bd_o),
    .sys_gpio_in_export (gpio_i),
    .sys_gpio_out_export (gpio_o),
    .adc_gpio_0_in_port (adc_gpio_i[31:0]),
    .adc_gpio_0_out_port (adc_gpio_o[31:0]),
    .adc_gpio_1_in_port (adc_gpio_i[63:32]),
    .adc_gpio_1_out_port (adc_gpio_o[63:32]),
    .ad7768_gpio_export (ad7768_o[31:0]),
    .spi_0_external_MISO (spi_miso),
    .spi_0_external_MOSI (spi_mosi),
    .spi_0_external_SCLK (spi_clk),
    .spi_0_external_SS_n (spi_csn));

endmodule

// ***************************************************************************
// ***************************************************************************
