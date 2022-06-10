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

module serdes_rx #(
  parameter   CMOS_LVDS_N = 0,
  parameter   FPGA_TECHNOLOGY = 0,
  parameter   SERDES_FACTOR = 8,
  parameter   DATA_WIDTH = 3) (

  input									reset,
  input	                        rx_inclock,                         // input clock to serdes generated from PLL
  input   [(DATA_WIDTH-1):0]    rx_in_p,                            // positive inputs (idata, qdata and strobe)
  input   [(DATA_WIDTH-1):0]    rx_in_n,                            // negative inputs (idata, qdata and strobe)
  output  [(DATA_WIDTH*SERDES_FACTOR-1):0]  rx_out,                              // parallel outputs(idata, qdata and storbe) from serdes
  output		rx_clock
  );
 
 
    wire  [(DATA_WIDTH-1):0] rx_data_in;
	wire                     rx_idata_in;
	wire                     rx_qdata_in;
	wire                     rx_strobe_in;
	
genvar i;
generate
for (i = 0; i < DATA_WIDTH; i = i + 1) begin: buf_i
/*	input_buf input_buf_rx_in (
	.dout(rx_data_in[i]),
	.pad_in(rx_in_p[i]),
	.pad_in_b(rx_in_n[i])
	);*/
	end
endgenerate

wire reset_int;

lvds_rx lvds_rx_in_inst(
	.inclock(rx_inclock),
	.pll_areset(reset_int),
	.pll_locked(reset_int),
	.rx_in(rx_data_in),
	.rx_out(rx_out),
	.rx_coreclock(rx_clock));	

endmodule



// ***************************************************************************
// ***************************************************************************
