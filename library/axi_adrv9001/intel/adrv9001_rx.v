// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2020 (c) Analog Devices, Inc. All rights reserved.
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

module adrv9001_rx #(
  parameter CMOS_LVDS_N = 0,
  parameter FPGA_TECHNOLOGY = 0,
  parameter NUM_LANES = 3,
  parameter DRP_WIDTH = 5,
  parameter IODELAY_CTRL = 0,
  parameter IO_DELAY_GROUP = "dev_if_delay_group"
) (
  // device interface
  input                   rx_dclk_in_n_NC,                          
  input                   rx_dclk_in_p_dclk_in,
  input                   rx_idata_in_n_idata0,
  input                   rx_idata_in_p_idata1,
  input                   rx_qdata_in_n_qdata2,
  input                   rx_qdata_in_p_qdata3,
  input                   rx_strobe_in_n_NC,
  input                   rx_strobe_in_p_strobe_in,

  // internal reset and clocks
  input                   adc_rst,
  output                  adc_clk,                                 
  output                  adc_clk_div,
 // output                  adc_load_en,
  output      [7:0]       adc_data_0,
  output      [7:0]       adc_data_1,
  output      [7:0]       adc_data_2,
  output      [7:0]       adc_data_3,
  output      [7:0]       adc_data_strobe,
  output                  adc_valid,
 
  // delay interface (for IDELAY macros)
  input                             up_clk,
  input   [NUM_LANES-1:0]           up_adc_dld,
  input   [DRP_WIDTH*NUM_LANES-1:0] up_adc_dwdata,
  output  [DRP_WIDTH*NUM_LANES-1:0] up_adc_drdata,
  input                   delay_clk,
  input                   delay_rst,
  output                  delay_locked,

  input                   mssi_sync,
  output                  ssi_sync_out,
  input                   ssi_sync_in,
  output                  ssi_rst
  
);

  reg [3:0] valid_gen = 4'b0001;

  wire [NUM_LANES-1:0]   serdes_in_p;
  wire [NUM_LANES-1:0]   serdes_in_n;
  wire          [23:0]   lssi_serdes_out;
  wire          [39:0]   cssi_serdes_out;
  wire                   rx_inclock;
  wire                   rx_load_en;
  wire                   rx_clk;  
  
  generate
  if (CMOS_LVDS_N == 0) begin

    assign {adc_data_strobe,
	        adc_data_1,
			adc_data_0} = lssi_serdes_out;                                       // parellal 8bit ADC data from serdes block
			
    assign serdes_in_p = {rx_strobe_in_p_strobe_in,                              // serial input data to serdes block
                          rx_qdata_in_p_qdata3,
                          rx_idata_in_p_idata1};
						  
    assign serdes_in_n = {rx_strobe_in_n_NC,                                     // serial input data to serdes block
                          rx_qdata_in_n_qdata2,
                          rx_idata_in_n_idata0};
						  
    assign adc_clk_div = rx_clk;     	
    assign adc_valid   = valid_gen[3];	
					  

  end else begin

  periphery_clk_buf rx_clk_buf(
    .inclk (rx_dclk_in_p_dclk_in),
    .outclk (rx_clk1)
  );

   assign {adc_data_strobe,
          adc_data_3,
          adc_data_2,
          adc_data_1,
          adc_data_0} = cssi_serdes_out;

    assign serdes_in_p = {rx_strobe_in_p_strobe_in,
                      rx_qdata_in_p_qdata3,
                      rx_qdata_in_n_qdata2,
                      rx_idata_in_p_idata1,
                      rx_idata_in_n_idata0};
    assign serdes_in_n = 5'b0;
	
 // No clock divider, qualifier used instead	
    assign adc_clk_div = rx_clk1;     	
    assign adc_valid = valid_gen[3];

  end
  endgenerate  

//  data capturing logic for CSSI mode
  genvar i;
  generate
    if (CMOS_LVDS_N == 1) begin

    for (i = 0; i <= 4; i = i + 1) begin: g_ddr_i

      reg [7:0] shift_reg = 8'b0;
      wire [1:0] gpio_out;

      // DDR input
      adrv9001_gpio_in gpio_rx_in (
        .ck (rx_clk1),
        .dout (gpio_out),
        .pad_in (serdes_in_p[i])
      );

      // Temporal ordering:
      //   MSB - oldest received bit;
      //   LSB - newest received bit;
      always @(posedge rx_clk1) begin
        shift_reg <= {shift_reg[5:0],gpio_out[0],gpio_out[1]};
      end

      assign cssi_serdes_out[i*8+:8] = shift_reg;
    end
    end
  endgenerate
  
// PLL to generate clock and load enable for ALTLVDS_RX/TX IPs    
generate
  if (CMOS_LVDS_N == 0) begin
  
  
  wire [1:0] lvds_clk;
  wire [1:0] loaden;
  wire outclock_4;

  	lvds_rx lvds_rx_i (
	.ext_fclk(lvds_clk[0]),
	.ext_loaden(loaden[0]),
	//.pll_areset(reset_int),
	.rx_in(serdes_in_p),
	.rx_out(lssi_serdes_out),
	.ext_coreclock(outclock_4));
	
	pll pll_i(
	.rst(adc_rst),
	.refclk(rx_dclk_in_p_dclk_in),
	//.locked(reset_int),
	.lvds_clk(lvds_clk),
	.loaden(loaden),
	.outclk_2(outclock_4),
	.outclk_3(rx_clk));
	
   end
  endgenerate
 
// ADC data valid generation logic for CSSI
  always @(posedge rx_clk) begin
    if (adc_rst) begin
      valid_gen <= 4'b0001;
    end else begin
      valid_gen <= {valid_gen[2:0],valid_gen[3]};
    end
  end
 
  

 // clocks used for altlvds_tx serdes IP as we are sharing common PLL for both RX and TX channel
 // assign adc_load_en = rx_load_en;     
  assign adc_clk = rx_clk;

   
   // Drive unused signals
  assign delay_locked = 'b0;
  assign up_adc_drdata = 'b0;

  assign ssi_sync_out = 'b0;
  assign ssi_rst = 'b0;



endmodule
