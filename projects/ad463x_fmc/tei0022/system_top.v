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
  output  [  3:0]   	ddr3_dm,
  output            	ddr3_odt,
  input             	ddr3_rzq,

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
  output	       	hdmi_de,
  output	      	hdmi_hsync,
  output	      	hdmi_vsync,
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
  
  output            	ad463x_spi_cs,
  output            	ad463x_spi_sclk,
  output            	ad463x_spi_sdo,
  input   [7:0]     	ad463x_spi_sdi,
  input          	ad463x_echo_clk,
  input          	ad463x_busy,
  output 		ad463x_cnv, 
  output 		ad463x_reset,

  // misc
   
  inout            	fmc_pg_c2m,
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
  output		fmc_pg_c2m_fpga
);




  // internal signals

  wire              	sys_resetn;

  
  wire	[15:0]		hdmi_data_pd;

  assign ct_hpd = 1'b1;
  assign ls_oe = 1'b1;  
  assign cec_clk = 1'b0;

 assign fmc_pg_c2m_fpga = 1'b1; 
 assign ad463x_reset =1'b1;


  // yuv422, separate sync, x1 clk, style 1, table 18, 1080p, hdmi_clk 148.5M
  
  assign hdmi_data [23:0] = {hdmi_data_pd, {8{1'b0}}};

  // instantiations
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
    //.sys_hps_hps_io_hps_io_gpio_inst_GPIO40 (fmc_pg_c2m),
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

	.ad463x_interface_sdo (ad463x_spi_sdo),       
	.ad463x_interface_sdi (ad463x_spi_sdi), 
	.ad463x_interface_cs_n (ad463x_spi_cs),         
	.ad463x_interface_sclk (ad463x_spi_sclk),
	.ad463x_interface_cnv (ad463x_cnv),
	.ad463x_interface_echo_clk (ad463x_echo_clk),
	.ad463x_interface_master_clk (ad463x_busy),
      
    .sys_rst_reset_n (sys_resetn),
    .hdmi_out_h_clk (hdmi_clk),
    .hdmi_out_h16_hsync (hdmi_hsync),
    .hdmi_out_h16_vsync (hdmi_vsync),
    .hdmi_out_h16_data_e (hdmi_de),
    .hdmi_out_h16_data (hdmi_data_pd));

endmodule

// ***************************************************************************
// ***************************************************************************