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

module adrv9001_tx #(
  parameter CMOS_LVDS_N = 0,
  parameter NUM_LANES = 4,
  parameter FPGA_TECHNOLOGY = 0,
  parameter USE_RX_CLK_FOR_TX = 0
) (
  input                   ref_clk,
  input                   up_clk,

  input                   mssi_sync,
  input                   tx_output_enable,

  // physical interface (transmit)
  output                  tx_dclk_out_n_NC,
  output                  tx_dclk_out_p_dclk_out,
  input                   tx_dclk_in_n_NC,
  input                   tx_dclk_in_p_dclk_in,
  output                  tx_idata_out_n_idata0,
  output                  tx_idata_out_p_idata1,
  output                  tx_qdata_out_n_qdata2,
  output                  tx_qdata_out_p_qdata3,
  output                  tx_strobe_out_n_NC,
  output                  tx_strobe_out_p_strobe_out,

  input                   rx_clk_div,
  //input                   rx_load_en,
  input                   rx_clk,
  input                   rx_ssi_rst,

  // internal resets and clocks

  input                   dac_rst,
  output                  dac_clk_div,

  input       [7:0]       dac_data_0,
  input       [7:0]       dac_data_1,
  input       [7:0]       dac_data_2,
  input       [7:0]       dac_data_3,
  input       [7:0]       dac_data_strb,
  input       [7:0]       dac_data_clk,
  input                   dac_data_valid
);

  wire [(NUM_LANES*8-1):0] serdes_in;
  wire [5:0] gpio_out;
  wire [NUM_LANES-1:0] serdes_out_p;
  wire [NUM_LANES-1:0] serdes_out_n;
  
   //assign tx_inclock = rx_clk;
   //assign tx_load_en = rx_load_en;
   
  generate
  if (CMOS_LVDS_N == 0) begin

    assign serdes_in = {dac_data_clk,dac_data_strb,dac_data_1,dac_data_0};   // parellel input data to serdes block 

    assign {tx_dclk_out_p_dclk_out,
			  tx_strobe_out_p_strobe_out,
				tx_qdata_out_p_qdata3,
            tx_idata_out_p_idata1} = serdes_out_p;                           // serial output data from serdes block which need to transmit to DAC

    assign {tx_dclk_out_n_NC,
				tx_strobe_out_n_NC,
				tx_qdata_out_n_qdata2,
            tx_idata_out_n_idata0} = serdes_out_n;                           // serial output data from serdes block which need to transmit to DAC
			
  assign dac_clk_div = rx_clk_div;

	assign tx_inclock = tx_dclk_in_p_dclk_in;
	
	wire temp;
	wire fclk,loaden,coreclk;
	

			
  end else begin

  periphery_clk_buf tx_clk_buf(
    .inclk (tx_dclk_in_p_dclk_in),
    .outclk (tx_clk)
  );

  assign serdes_in = {dac_data_clk,
                      dac_data_strb,
                      dac_data_3,
                      dac_data_2,
                      dac_data_1,
                      dac_data_0};

  assign {tx_dclk_out_p_dclk_out,
          tx_strobe_out_p_strobe_out,
          tx_qdata_out_p_qdata3,
          tx_qdata_out_n_qdata2,
          tx_idata_out_p_idata1,
          tx_idata_out_n_idata0} = gpio_out;

  assign {tx_dclk_out_n_NC,
          tx_strobe_out_n_NC} = 2'b0;
		  
  // No clock divider, qualifier used instead
  assign dac_clk_div = tx_clk;

  end

  endgenerate  
  

//  data transmission logic for CSSI mode

  genvar i;
  generate
    if (CMOS_LVDS_N == 1) begin

    for (i = 0; i <= 5; i = i + 1) begin: g_ddr_o

      reg [7:0] shift_reg = 8'b0;
      wire [1:0] gpio_in;

      // DDR output
      adrv9001_gpio_out gpio_tx_out (
        .ck(tx_clk),
        .din(gpio_in),
        .pad_out(gpio_out[i])
      );

      always @(posedge tx_clk) begin
        if (dac_data_valid) begin
          shift_reg <= serdes_in[i*8+:8];
        end else begin
          shift_reg <= {shift_reg[5:0],2'b0};
        end
      end
      // Order of transmission:
      // gpio_in[0] - first
      // gpio_in[1] - last
      assign gpio_in = {shift_reg[6],shift_reg[7]};
    end
    end
  endgenerate

  // data capturing logic for LSSI mode  
genvar j;  
generate 
if (CMOS_LVDS_N == 0) begin

//serdes block for serialize data to transmite to DAC

  wire [1:0] lvds_clk;
  wire [1:0] loaden;
  wire outclock_4;
	
	pll pll_i(
	.rst(adc_rst),
	.refclk(rx_dclk_in_p_dclk_in),
	//.locked(reset_int),
	.lvds_clk(lvds_clk),
	.loaden(loaden),
	.outclk_2(outclock_4),
	.outclk_3(rx_clk));
	
	lvds_tx1 lvds_tx1_i (
	.tx_in(serdes_in),
	.tx_out(serdes_out_p[2:0]),
	.tx_outclock(serdes_out_p[3]),
	.tx_coreclock(),
	//.pll_areset(1),
	.ext_fclk(lvds_clk[1]),
	.ext_loaden(loaden[1]),
	.ext_coreclock(outclock_4));
	
    end
  endgenerate


endmodule
