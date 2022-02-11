// ***************************************************************************
// ***************************************************************************
// Copyright, Inc. All rights reserved.
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
	
module ad463x_data_capture #(  
  parameter[4:0]       NUM_OF_SDI = 8,
  parameter[4:0]       DATA_BUS = 8) (
  
  //signals inface ADC side data capturing
  input csn,
  input [NUM_OF_SDI-1 : 0] sdi,
  input echo_clk,

  //signal interfae FPGA side
  output reg [(NUM_OF_SDI*DATA_BUS)-1:0] data_in_e,
  output reg  data_valid_e,
  input  data_ready_e,
  
  //config signal
  input [3:0] NUM_OF_LANES,
  input ECHO_EN, 
  input MASTER_EN, 
  input DDR_EN,
  input spi_clk
  );
  
  reg [6:0] clk_counter;
  reg valid_8_4,valid_24_12,valid_16_8;
  reg valid_p;
  wire valid_pp;
  wire valid_pp1;
  reg valid_i;
  reg valid_i1;

  reg [DATA_BUS-1:0] data_sdr [NUM_OF_SDI-1:0];
  wire [DATA_BUS-1:0] data_ddr [NUM_OF_SDI-1:0];
  reg [3:0] data_ddr_p [NUM_OF_SDI-1:0];
  reg [3:0] data_ddr_n [NUM_OF_SDI-1:0];

  reg csn_d;
  reg csn_d1;
  reg csn_d2;
  wire reset;

  
  //echo clock counter
  	always @(posedge echo_clk or posedge csn_d1) begin
		if(csn_d1)begin
			clk_counter <= 'h0;
		end else begin
			clk_counter <= clk_counter + 1 ;end
	end

	
	// cdc handling of valid signal	
	always@(posedge spi_clk)begin
		valid_i <= valid_p;
		valid_i1 <= valid_i;end
		
		
		ad_edge_detect # (
		 .EDGE (0)
		 ) i_ad_edge_detect (
		 .clk (spi_clk),
		 .rst (0),
		 .in (valid_p),
		 .out (valid_pp1)
		 );
		
	assign valid_pp =(MASTER_EN & DDR_EN)?(~valid_i & valid_p):(~valid_i1 & valid_i);

		
	always @(*) begin
		case (NUM_OF_LANES)
			1 :  valid_p = valid_8_4 | valid_24_12 | valid_16_8;
			3:  valid_p = valid_8_4 | valid_16_8 ;
			2 :  valid_p = valid_8_4 ;
			4 :  valid_p = 0;
			default :   valid_p = 0;
		endcase
	end
			
	
	always @(*) begin
		if(DDR_EN)begin
		    valid_8_4 = clk_counter==4 ? 1:0;
			 valid_24_12 = clk_counter==12 ? 1:0;
			 valid_16_8 = clk_counter==8 ? 1:0;
		end else begin	
			 valid_8_4 = clk_counter==8 ? 1:0;
			 valid_24_12 = clk_counter==24 ? 1:0;
			 valid_16_8 = clk_counter==16 ? 1:0;
		end
	end
	
   /* reset condition generation and valid signal generation and data latching*/

	always @(posedge spi_clk) begin
		csn_d <= csn;
		csn_d1 <= csn_d;
		csn_d2 <= csn_d1;
	end
						 
	// negative edge resets the shift registers
	assign reset =(csn_d2 | ECHO_EN) ;
	
	// CSN positive edge validates the output data
	// WARNING: there isn't any buffering for data, if the sink module is not
	// ready, the data will be discarded
	
	always@(posedge spi_clk)begin
		data_valid_e <=(csn_d & ~csn_d1 & data_ready_e) || valid_pp;end

	
	
	always@(posedge spi_clk)begin
	if (DDR_EN)begin
		data_in_e <={data_ddr[7],data_ddr[6],data_ddr[5],data_ddr[4],
					data_ddr[3],data_ddr[2],data_ddr[1],data_ddr[0]};end
	else begin
		data_in_e <={data_sdr[7],data_sdr[6],data_sdr[5],data_sdr[4],
					data_sdr[3],data_sdr[2],data_sdr[1],data_sdr[0]};end
	end
	 
 // data capturing on echo_clk for SDR 
  genvar i;
  generate 
		for (i=0 ; i<NUM_OF_SDI ; i=i+1 ) begin : data_i 
			always@(negedge echo_clk or posedge reset)begin
				if (reset )begin
					data_sdr[i]<= 'h0; 
				end else if (!DDR_EN && !csn_d) begin
					data_sdr[i]<= {data_sdr[i][DATA_BUS-2:0],sdi[i]};
				end else begin
					data_sdr[i]<= 'h0; 
				end
		end
	end
	endgenerate 
	
	
 //data capturing for echo_clk for DDR mode
 //for possitive edge data
  genvar j;
  generate 
		for (j=0 ; j<NUM_OF_SDI ; j=j+1 ) begin : data_j 
			always@(posedge echo_clk or posedge reset)begin
				if (reset )begin
					data_ddr_p[j]<= 'h0; 
				end else if (DDR_EN && !csn_d) begin
					data_ddr_p[j]<= {data_ddr_p[j][3:0],sdi[j]};
				end else begin
					data_ddr_p[j]<= 'h0; 
				end
		end
	end
	endgenerate 
	
  //for negtive edge data
  genvar k;
  generate 
		for (k=0 ; k<NUM_OF_SDI ; k=k+1 ) begin : data_k 
			always@(negedge echo_clk or posedge reset)begin
				if (reset )begin
					data_ddr_n[k]<= 'h0; 
				end else if (DDR_EN && !csn_d) begin
					data_ddr_n[k]<= {data_ddr_n[k][3:0],sdi[k]};
				end else begin
					data_ddr_n[k]<= 'h0; 
				end
		end
	end
	endgenerate 
	

  //for data ddr arranging edge data
  genvar l;
  generate 
		for (l=0 ; l<NUM_OF_SDI ; l=l+1 ) begin : data_l 
			assign data_ddr[l] = MASTER_EN?
										{data_ddr_p[l][3],data_ddr_n[l][3],data_ddr_p[l][2],data_ddr_n[l][2],
										 data_ddr_p[l][1],data_ddr_n[l][1],data_ddr_p[l][0],data_ddr_n[l][0]}:
										{data_ddr_n[l][3],data_ddr_p[l][2],data_ddr_n[l][2],data_ddr_p[l][1],
										 data_ddr_n[l][1],data_ddr_p[l][0],data_ddr_n[l][0],sdi[l]};
		end
	endgenerate 
  
endmodule	
			