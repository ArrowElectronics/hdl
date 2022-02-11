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
	
module axi_ad463x_if #(

  parameter[15:0]      ID = 0,         
  parameter[3:0]       NUM_OF_CHANNELS = 2,
  parameter[4:0]       NUM_OF_SDI = 8) (

  // physical data interface for AD469x

  output                  rx_sclk,
  output                  rx_cs_n,
  output                  rx_sdo,
  output                  rx_cnv,
  input[(NUM_OF_SDI-1):0] rx_sdi,
  input   					  echo_clk,
  input 						  rx_busy,
  
  // dma interface
  output reg				  adc_valid,
  output [(NUM_OF_CHANNELS*32-1) : 0] adc_data,
  input            		  adc_ready,
  

  // AXI Slave Memory Map

  input                   s_axi_aclk,
  input                   s_axi_aresetn,
  input                   s_axi_awvalid,
  input       [15:0]      s_axi_awaddr,
  input       [ 2:0]      s_axi_awprot,
  output                  s_axi_awready,
  input                   s_axi_wvalid,
  input       [31:0]      s_axi_wdata,
  input       [ 3:0]      s_axi_wstrb,
  output                  s_axi_wready,
  output                  s_axi_bvalid,
  output      [ 1:0]      s_axi_bresp,
  input                   s_axi_bready,
  input                   s_axi_arvalid,
  input       [15:0]      s_axi_araddr,
  input       [ 2:0]      s_axi_arprot,
  output                  s_axi_arready,
  output                  s_axi_rvalid,
  output      [ 1:0]      s_axi_rresp,
  output      [31:0]      s_axi_rdata,
  input                   s_axi_rready,

  // other interface
  input			  spi_clk,
  output         	  irq 
);


  localparam DATA_BUS =8; 

  /* up_axi setup for spi & control*/
  
  wire                              up_clk;
  wire                              up_rstn;
  wire                              up_rreq;
  wire    [13:0]                    up_raddr;
  wire                              up_wreq;
  wire    [13:0]                    up_waddr;
  wire    [31:0]                    up_wdata;

  
  wire 										up_wack ;
  wire 										up_rack ;
  wire 	 [31:0]							up_rdata;

  wire                              up_wack_if_s;
  wire                              up_rack_if_s;
  wire    [31:0]                    up_rdata_if_s;
  reg                               up_wack_cntrl_s;
  reg                               up_rack_cntrl_s;
  reg     [31:0]                    up_rdata_cntrl_s;

 
  assign up_clk = s_axi_aclk;
  assign up_rstn = s_axi_aresetn;


  // processor read interface


  
  wire 										up_wack_t ;
  wire 										up_rack_t ;
  wire 	 [31:0]							up_rdata_s ;
  
  assign   up_wack_t = up_wack_cntrl_s;
  assign   up_rack_t = up_rack_cntrl_s;
  assign   up_rdata_s = up_rdata_cntrl_s;
  
  assign   up_wack = up_wack_if_s | up_wack_t;
  assign   up_rack = up_rack_if_s | up_rack_t;
  assign   up_rdata = up_rdata_if_s | up_rdata_s;


  

	/* spi engine setup */

    wire                                    spi_resetn_s;
    wire                                    s0_cmd_ready_s;
    wire                                    s0_cmd_valid_s;
    wire  [15:0]                            s0_cmd_data_s;
    wire                                    s0_sdo_data_ready_s;
    wire                                    s0_sdo_data_valid_s;
    wire  [(DATA_BUS-1):0]            	     s0_sdo_data_s;
    wire                                    s0_sdi_data_ready_s;
    wire                                    s0_sdi_data_valid_s;
    wire  [(DATA_BUS*NUM_OF_SDI-1):0]       s0_sdi_data_s;
    wire                                    s0_sync_ready_s;
    wire                                    s0_sync_valid_s;
    wire  [ 7:0]                            s0_sync_s;
    wire                                    s1_cmd_ready_s;
    wire                                    s1_cmd_valid_s;
    wire  [15:0]                            s1_cmd_data_s;
    wire                                    s1_sdo_data_ready_s;
    wire                                    s1_sdo_data_valid_s;
    wire  [(DATA_BUS-1):0]                  s1_sdo_data_s;
    wire                                    s1_sdi_data_ready_s;
    wire                                    s1_sdi_data_valid_s;
    wire  [(DATA_BUS*NUM_OF_SDI-1):0]       s1_sdi_data_s;
    wire                                    s1_sync_ready_s;
    wire                                    s1_sync_valid_s;
    wire  [ 7:0]                            s1_sync_s;
    wire                                    m_cmd_ready_s;
    wire                                    m_cmd_valid_s;
    wire  [15:0]                            m_cmd_data_s;
    wire                                    m_sdo_data_ready_s;
    wire                                    m_sdo_data_valid_s;
    wire [(DATA_BUS-1):0]           	    m_sdo_data_s;
    wire                                    m_sdi_data_ready_s;
    wire                                    m_sdi_data_valid_s;
    wire [(DATA_BUS*NUM_OF_SDI-1):0]        m_sdi_data_s;
    wire                                    m_sync_ready_s;
    wire                                    m_sync_valid_s;
    wire  [ 7:0]                            m_sync_s;
    wire                                    offload0_cmd_wr_en_s;
    wire  [15:0]                            offload0_cmd_wr_data_s;
    wire                                    offload0_sdo_wr_en_s;
    wire  [(DATA_BUS-1):0]            	    offload0_sdo_wr_data_s;
    wire                                    offload0_mem_reset_s;
    wire                                    offload0_enable_s;
    wire                                    offload0_enabled_s;	
	 
    wire                    	            trigger_s;
    wire                    	            data_valid_s;
    wire [(DATA_BUS*NUM_OF_SDI-1):0]        data_in_s;
	 wire                    	            data_valid_e;
    wire [(DATA_BUS*NUM_OF_SDI-1):0]        data_in_e;
	 
	 	  
	  
  up_axi #(
    .AXI_ADDRESS_WIDTH (16)
  ) i_up_axi (
    .up_rstn (up_rstn),
    .up_clk (up_clk),
    .up_axi_awvalid (s_axi_awvalid),
    .up_axi_awaddr (s_axi_awaddr),
    .up_axi_awready (s_axi_awready),
    .up_axi_wvalid (s_axi_wvalid),
    .up_axi_wdata (s_axi_wdata),
    .up_axi_wstrb (s_axi_wstrb),
    .up_axi_wready (s_axi_wready),
    .up_axi_bvalid (s_axi_bvalid),
    .up_axi_bresp (s_axi_bresp),
    .up_axi_bready (s_axi_bready),
    .up_axi_arvalid (s_axi_arvalid),
    .up_axi_araddr (s_axi_araddr),
    .up_axi_arready (s_axi_arready),
    .up_axi_rvalid (s_axi_rvalid),
    .up_axi_rresp (s_axi_rresp),
    .up_axi_rdata (s_axi_rdata),
    .up_axi_rready (s_axi_rready),
    .up_wreq (up_wreq),
    .up_waddr (up_waddr),
    .up_wdata (up_wdata),
    .up_wack (up_wack),
    .up_rreq (up_rreq),
    .up_raddr (up_raddr),
    .up_rdata (up_rdata),
    .up_rack (up_rack));
	 	 
    axi_spi_engine #(
      .DATA_WIDTH (DATA_BUS),
      .NUM_OF_SDI (NUM_OF_SDI),
      .ASYNC_SPI_CLK (1),
      .NUM_OFFLOAD (1),
      .MM_IF_TYPE (1)
    ) i_axi_spi_engine (
      .up_clk (up_clk),
      .up_rstn (up_rstn),
      .up_wreq (up_wreq),
      .up_waddr (up_waddr),
      .up_wdata (up_wdata),
      .up_wack (up_wack_if_s),
      .up_rreq (up_rreq),
      .up_raddr (up_raddr),
      .up_rdata (up_rdata_if_s),
      .up_rack (up_rack_if_s),
      .irq (irq),
      .spi_clk (spi_clk),
      .spi_resetn (spi_resetn_s),
      .cmd_ready (s0_cmd_ready_s),
      .cmd_valid (s0_cmd_valid_s),
      .cmd_data (s0_cmd_data_s),
      .sdo_data_ready (s0_sdo_data_ready_s),
      .sdo_data_valid (s0_sdo_data_valid_s),
      .sdo_data (s0_sdo_data_s),
      .sdi_data_ready (s0_sdi_data_ready_s),
      .sdi_data_valid (s0_sdi_data_valid_s),
      .sdi_data (s0_sdi_data_s),
      .sync_ready (s0_sync_ready_s),
      .sync_valid (s0_sync_valid_s),
      .sync_data (s0_sync_s),
      .offload0_cmd_wr_en (offload0_cmd_wr_en_s),
      .offload0_cmd_wr_data (offload0_cmd_wr_data_s),
      .offload0_sdo_wr_en (offload0_sdo_wr_en_s),
      .offload0_sdo_wr_data (offload0_sdo_wr_data_s),
      .offload0_mem_reset (offload0_mem_reset_s),
      .offload0_enable (offload0_enable_s),
      .offload0_enabled(offload0_enabled_s));

    spi_engine_offload #(
      .DATA_WIDTH (DATA_BUS),
      .NUM_OF_SDI (NUM_OF_SDI),
      .ASYNC_SPI_CLK (1),
      .ASYNC_TRIG (1)
    ) i_spi_engine_offload (
      .ctrl_clk (spi_clk),
      .ctrl_cmd_wr_en (offload0_cmd_wr_en_s),
      .ctrl_cmd_wr_data (offload0_cmd_wr_data_s),
      .ctrl_sdo_wr_en (offload0_sdo_wr_en_s),
      .ctrl_sdo_wr_data (offload0_sdo_wr_data_s),
      .ctrl_enable (offload0_enable_s),
      .ctrl_enabled (offload0_enabled_s),
      .ctrl_mem_reset (offload0_mem_reset_s),
      .spi_clk (spi_clk),
      .spi_resetn (spi_resetn_s),
      .trigger (trigger_s),
      .cmd_valid (s1_cmd_valid_s),
      .cmd_ready (s1_cmd_ready_s),
      .cmd (s1_cmd_data_s),
      .sdo_data_valid (s1_sdo_data_valid_s),
      .sdo_data_ready (s1_sdo_data_ready_s),
      .sdo_data (s1_sdo_data_s),
      .sdi_data_valid (s1_sdi_data_valid_s),
      .sdi_data_ready (s1_sdi_data_ready_s),
      .sdi_data (s1_sdi_data_s),
      .sync_valid (s1_sync_valid_s),
      .sync_ready (s1_sync_ready_s),
      .sync_data (s1_sync_s),
      .offload_sdi_valid (data_valid_s),
      .offload_sdi_ready (1),
      .offload_sdi_data (data_in_s));
		

    spi_engine_interconnect #(
      .DATA_WIDTH (DATA_BUS),
      .NUM_OF_SDI (NUM_OF_SDI)
    ) i_spi_engine_interconnect (
      .clk (spi_clk),
      .resetn (spi_resetn_s),
      .m_cmd_valid (m_cmd_valid_s),
      .m_cmd_ready (m_cmd_ready_s),
      .m_cmd_data (m_cmd_data_s),
      .m_sdo_valid (m_sdo_data_valid_s),
      .m_sdo_ready (m_sdo_data_ready_s),
      .m_sdo_data (m_sdo_data_s),
      //.m_sdi_valid (m_sdi_data_valid_s),
		.m_sdi_valid (temp2),
      .m_sdi_ready (m_sdi_data_ready_s),
      .m_sdi_data (m_sdi_data_s),
      .m_sync_valid (m_sync_valid_s),
      .m_sync_ready (m_sync_ready_s),
      .m_sync (m_sync_s),
      .s0_cmd_valid (s0_cmd_valid_s),
      .s0_cmd_ready (s0_cmd_ready_s),
      .s0_cmd_data (s0_cmd_data_s),
      .s0_sdo_valid (s0_sdo_data_valid_s),
      .s0_sdo_ready (s0_sdo_data_ready_s),
      .s0_sdo_data (s0_sdo_data_s),
      .s0_sdi_valid (s0_sdi_data_valid_s),
      .s0_sdi_ready (s0_sdi_data_ready_s),
      .s0_sdi_data (s0_sdi_data_s),
      .s0_sync_valid (s0_sync_valid_s),
      .s0_sync_ready (s0_sync_ready_s),
      .s0_sync (s0_sync_s),
      .s1_cmd_valid (s1_cmd_valid_s),
      .s1_cmd_ready (s1_cmd_ready_s),
      .s1_cmd_data (s1_cmd_data_s),
      .s1_sdo_valid (s1_sdo_data_valid_s),
      .s1_sdo_ready (s1_sdo_data_ready_s),
      .s1_sdo_data (s1_sdo_data_s),
      .s1_sdi_valid (s1_sdi_data_valid_s),
      .s1_sdi_ready (s1_sdi_data_ready_s),
      .s1_sdi_data (s1_sdi_data_s),
      .s1_sync_valid (s1_sync_valid_s),
      .s1_sync_ready (s1_sync_ready_s),
      .s1_sync (s1_sync_s));
		
		
		//for timing adjustment of data and valid signal
		reg temp1,temp2;
		
		always@(posedge spi_clk)begin
			temp1<=m_sdi_data_valid_s;
			temp2<=temp1;end

			
			
			
    spi_engine_execution_2 #(
      .DATA_WIDTH (DATA_BUS),
      .NUM_OF_SDI (NUM_OF_SDI),
      .SDI_DELAY (2)
    ) i_spi_engine_execution_2 (
      .clk (spi_clk),
      .resetn (spi_resetn_s),
      .active (),
      .cmd_ready (m_cmd_ready_s),
      .cmd_valid (m_cmd_valid_s),
      .cmd (m_cmd_data_s),
      .sdo_data_valid (m_sdo_data_valid_s),
      .sdo_data_ready (m_sdo_data_ready_s),
      .sdo_data (m_sdo_data_s),
      .sdi_data_ready (m_sdi_data_ready_s),
      .sdi_data_valid (m_sdi_data_valid_s),
      .sdi_data (m_sdi_data_s),
      .sync_ready (m_sync_ready_s),
      .sync_valid (m_sync_valid_s),
      .sync (m_sync_s),
      .sclk (rx_sclk),
      .sdo (rx_sdo),
      //.sdo_t (),
      .sdi (rx_sdi[0]),
		.sdi_1 (rx_sdi[1]),
		.sdi_2 (rx_sdi[2]),
		.sdi_3 (rx_sdi[3]),
		.sdi_4 (rx_sdi[4]),
		.sdi_5 (rx_sdi[5]),
		.sdi_6 (rx_sdi[6]),
		.sdi_7 (rx_sdi[7]),
      .cs (rx_cs_n),
      .three_wire ());
		
		wire clk_d;
		assign clk_d = clk_md[1] ? rx_busy:echo_clk;
		
		
	ad463x_data_capture #(
      .NUM_OF_SDI (NUM_OF_SDI),
      .DATA_BUS (DATA_BUS)
    ) i_ad463x_data_capture (
	   .csn(rx_cs_n),
      .sdi(rx_sdi),
		.echo_clk(clk_d),
		.data_in_e(data_in_e),
		.data_valid_e(data_valid_e),
		.data_ready_e(1),
		.ECHO_EN(spi_echo_n),  
		.MASTER_EN(clk_md[1]),
		.DDR_EN(ddr_sdr_n),
		.NUM_OF_LANES(num_of_lanes),
		.spi_clk(spi_clk) );


 	/* config register blocks for AD469x*/
	
		//config registers sets
		reg [31:0] UP_CNV_RATE;
		reg up_cnv_en;
		reg up_resetn;
		reg ddr_sdr_n;
		reg [1:0] clk_md;
		reg test;
		reg [3:0] num_of_lanes;
		reg [15:0] UP_SCRATCH;
		reg [7:0] CNV_PULSE_WIDTH;
		wire [7:0] UP_VCOM[NUM_OF_CHANNELS-1:0];
		
		wire spi_echo_n;
		
		assign spi_echo_n = ~(clk_md[0]|clk_md[1]);
	
		
		 // config reg write block
	  always @(negedge up_rstn or posedge up_clk) begin
		 if (up_rstn == 0) begin
			up_wack_cntrl_s<= 1'h0;
			UP_SCRATCH <= 32'b0;
			up_resetn <= 1'b0;
			up_cnv_en <= 1'b0;
			ddr_sdr_n <= 1'b0;
			clk_md <= 2'b0;
			num_of_lanes <= 4'b1;			
			UP_CNV_RATE <= 32'b0;
			CNV_PULSE_WIDTH <= 32'b0;
		 end else begin
			up_wack_cntrl_s <= up_wreq;
			if ((up_wreq == 1'b1) && (up_waddr[8:0] == 9'h104)) begin
			  UP_SCRATCH <= up_wdata;
			end
			if ((up_wreq == 1'b1) && (up_waddr[8:0] == 9'h103)) begin
			  up_resetn <= up_wdata[0];
			  up_cnv_en <= up_wdata[1];
			end
			if ((up_wreq == 1'b1) && (up_waddr[8:0] == 9'h101)) begin
			  UP_CNV_RATE <= up_wdata;
			end
			if ((up_wreq == 1'b1) && (up_waddr[8:0] == 9'h102)) begin
			  CNV_PULSE_WIDTH <= up_wdata;
			end
			if ((up_wreq == 1'b1) && (up_waddr[8:0] == 9'h105)) begin
			   ddr_sdr_n <= up_wdata[1] ;
				clk_md <= up_wdata[3:2] ;
				test <= up_wdata[0] ;
				num_of_lanes <= up_wdata[7:4] ;
			end
		 end
	  end
	
		 // config reg read block	
	  always @(negedge up_rstn or posedge up_clk) begin
		 if (up_rstn == 0) begin
			up_rack_cntrl_s <= 1'b0;
			up_rdata_cntrl_s <= 32'b0;
		 end else begin
			up_rack_cntrl_s <= up_rreq;
			if (up_rreq == 1'b1) begin
			  case (up_raddr[8:0])
				 9'h101 : up_rdata_cntrl_s <= UP_CNV_RATE;
				 9'h102 : up_rdata_cntrl_s <= CNV_PULSE_WIDTH;
				 9'h103 : up_rdata_cntrl_s <= {14'b0,  up_cnv_en, up_resetn};
				 9'h104 : up_rdata_cntrl_s <= UP_SCRATCH;
				 9'h108 : up_rdata_cntrl_s <= 32'hAD4630; 
				 9'h105 : up_rdata_cntrl_s <= {8'b0,num_of_lanes,clk_md,ddr_sdr_n,test};
				 9'h106 : up_rdata_cntrl_s <= UP_VCOM[0];
				 9'h107 : up_rdata_cntrl_s <= UP_VCOM[1];
				 default : up_rdata_cntrl_s <= 'h0;
			  endcase
			end
		 end
	  end	

		/*cnv signal generation block	*/
		
		reg [31:0] pulse_counter;
		reg pulse;
		
		assign rx_cnv = pulse;
		
		ad_edge_detect # (
		 .EDGE (1)
		 ) i_ad_edge_detect (
		 .clk (spi_clk),
		 .rst (0),
		 .in (pulse),
		 .out (trigger_s)
		 );
		  
		 
	// a free running counter for CNV pulse generation

	  always @(posedge spi_clk) begin
		 if (!up_cnv_en || pulse_counter==0 ) begin
			pulse_counter <= UP_CNV_RATE;
		 end else begin
			pulse_counter <= pulse_counter - 1'b1;
		 end
	  end
	  
	  always @(posedge spi_clk) begin
		 if (pulse_counter==0 || !up_resetn ) begin
			pulse<=0;
		 end else if (CNV_PULSE_WIDTH == pulse_counter) begin
			pulse<=1;end
	  end

	   /* data re-aranging data capturing*/
		reg data_valid;
		reg [(DATA_BUS*NUM_OF_SDI-1):0]  data_in_t;
		reg [31:0] data_in[NUM_OF_CHANNELS-1:0] ;
		
		genvar k;
		generate 
			for (k=0 ; k<NUM_OF_CHANNELS ; k=k+1 ) begin : adc_data_K
				assign adc_data[32*(k+1) - 1 : k*32] = data_in[k][31:0]  ;
				assign UP_VCOM[k] = data_in[k][7:0];
			end
		endgenerate	
			
		always@(posedge spi_clk) begin
			if (spi_echo_n) begin
				data_valid <= data_valid_s;end
			else begin
				data_valid <= data_valid_e;end
		end
		
		always@(posedge spi_clk) begin
			if (spi_echo_n) begin
				data_in_t <= data_in_s;end
			else begin
				data_in_t <= data_in_e;end
		end
		
		reg [2:0] valid_count=1;
		reg [2:0] valid_ptr;
		
		always@(posedge spi_clk) begin
			if (rx_cs_n) begin
				valid_count<=1;
				adc_valid<=data_valid;end
			else if (valid_count == valid_ptr )begin
				adc_valid<=data_valid;end
			else if (data_valid) begin
				valid_count <= valid_count+1;end
			else begin
				adc_valid<=0;
				valid_count<= valid_count;end
		end
		
		always@(*)begin
			case(num_of_lanes)
				4'h1 : valid_ptr <= 4'h4;
				4'h2 : valid_ptr <= 4'h2;
				4'h4 : valid_ptr <= 4'h1;
				default : valid_ptr <= 4'h1;
			endcase
		end
		
		//data rearrage
		genvar i;
		generate 
			for (i=0 ; i<NUM_OF_CHANNELS ; i=i+1 ) begin : data_i
					always@(posedge spi_clk)begin
					if (data_valid) begin 
						case (num_of_lanes) 
							4'h1 : begin data_in[i][31:0] <= {data_in[i][23:0],data_in_t[7+32*i:32*i]};end
							4'h2 : begin data_in[i][31:0] <= {data_in[i][15:0],{data_in_t[7+32*i],data_in_t[15+32*i], data_in_t[6+32*i],data_in_t[14+32*i],
																	data_in_t[5+32*i],data_in_t[13+32*i], data_in_t[4+32*i],data_in_t[12+32*i]}, 
																	{data_in_t[3+32*i],data_in_t[11+32*i], data_in_t[2+32*i], data_in_t[10+32*i], 
																	data_in_t[1+32*i], data_in_t[9+32*i], data_in_t[0+32*i], data_in_t[8+32*i]}}; end													
							4'h4 : begin data_in[i][31:0] <= {{data_in_t[7+32*i], data_in_t[15+32*i], data_in_t[23+32*i],data_in_t[31+32*i],  
																	data_in_t[6+32*i],data_in_t[14+32*i],data_in_t[22+32*i],data_in_t[30+32*i]},
																	{data_in_t[5+32*i],data_in_t[13+32*i],data_in_t[21+32*i],data_in_t[29+32*i],  
																	data_in_t[4+32*i],data_in_t[12+32*i],data_in_t[20+32*i],data_in_t[28+32*i]},
																	{data_in_t[3+32*i],data_in_t[11+32*i],data_in_t[19+32*i],data_in_t[27+32*i],
																	data_in_t[2+32*i],data_in_t[10+32*i],data_in_t[18+32*i],data_in_t[26+32*i]}, 
																	{data_in_t[1+32*i],data_in_t[9+32*i],data_in_t[17+32*i], data_in_t[25+32*i], 
																	data_in_t[0+32*i],data_in_t[8+32*i],data_in_t[16+32*i], data_in_t[24+32*i]}}; end								
							default : begin data_in[i][31:0] <= {data_in[i][23:0],data_in_t[7+32*i:32*i]};end		
						endcase
					end
					else begin
							data_in[i] <= data_in[i];end
					end
		end endgenerate
		  
endmodule

// ***************************************************************************
// ***************************************************************************
