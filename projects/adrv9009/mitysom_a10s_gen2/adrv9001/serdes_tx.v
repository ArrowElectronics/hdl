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

`timescale 1ps/1ps

module serdes_tx #(
  parameter   CMOS_LVDS_N = 0,
  parameter   FPGA_TECHNOLOGY = 0,
  parameter   SERDES_FACTOR = 8,
  parameter   DATA_WIDTH = 4) (

  input								 reset,
 input	                       tx_inclock,                   // input clock to serdes generated from PLL
  input   [(DATA_WIDTH*8-1):0]  tx_in,                        // parallel inputs(idata, qdata and storbe) to serdes 
  output  [DATA_WIDTH:0]        tx_out_p,                     // positive outputs (idata, qdata, strobe and dclk)
  output  [DATA_WIDTH:0]        tx_out_n,                      // negative outputs (idata, qdata, strobe and dclk)
 output   tx_clock
  );
 
 wire dclk;
	
genvar i;
generate
for (i = 0; i < (DATA_WIDTH-1); i = i + 1) begin: buf_i
	output_buf output_buf_tx_out (
	.din(tx_out[i]),
	.pad_out(tx_out_p[i]),
	.pad_out_b(tx_out_n[i])
	);
	end
endgenerate

	output_buf output_buf_dclk (
	.din(dclk),
	.pad_out(tx_out_p[3]),
	.pad_out_b(tx_out_n[3])
	);

wire reset_int;
wire [DATA_WIDTH:0]  tx_out;

lvds_tx lvds_tx_out_inst(
	.inclock(tx_inclock),
	.pll_areset(reset_int),
	.pll_locked(reset_int),
	.tx_in(tx_in),
	.tx_out(tx_out),
	.tx_outclock (dclk),
	.tx_coreclock(tx_clock));	
	
	

endmodule



// ***************************************************************************
// ***************************************************************************
