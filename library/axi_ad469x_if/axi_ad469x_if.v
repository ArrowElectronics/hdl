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
	
module axi_ad469x_if #(

  parameter[15:0]      ID = 0,         
  parameter[5:0]       NUM_OF_CHANNELS = 16,
  parameter[6:0]       DATA_BUS = 32,
  parameter[6:0]       ADC_RESOLUTION = 16,
  parameter[2:0]       NUM_OF_SDI = 1) (

  // physical data interface for AD469x

  output                  rx_sclk,
  output                  rx_cs_n,
  output                  rx_sdo,
  output                  rx_cnv,
  input wire [(NUM_OF_SDI-1):0]   rx_sdi,
  input wire   busy,
  
   //axi_adc signals
  input [NUM_OF_CHANNELS-1:0] enable_in,

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

  // Write FIFO interface
  output		  adc_wr_overflow,
  output		  adc_en_packed,
  input			  adc_ovf_packed,
  output		  adc_sync_packed,
  output [ADC_RESOLUTION*NUM_OF_CHANNELS-1:0]	adc_data_packed,
  
  input			  spi_clk,
  output         	  irq 
);


  localparam chID_length = 4;
  localparam status_length = 8;
  localparam DATA_WIDTH = status_length + ADC_RESOLUTION;
 
		
   

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
  wire 	 [31:0]							up_rdata_t ;
  
  assign   up_wack_t = up_wack_cntrl_s;
  assign   up_rack_t = up_rack_cntrl_s;
  assign   up_rdata_t = up_rdata_cntrl_s;
  
  assign   up_wack = up_wack_if_s | up_wack_t;
  assign   up_rack = up_rack_if_s | up_rack_t;
  assign   up_rdata = up_rdata_if_s | up_rdata_t;


  

	/* spi engine setup */

    wire                                    spi_resetn_s;
    wire                                    s0_cmd_ready_s;
    wire                                    s0_cmd_valid_s;
    wire  [15:0]                            s0_cmd_data_s;
    wire                                    s0_sdo_data_ready_s;
    wire                                    s0_sdo_data_valid_s;
    wire  [(DATA_BUS-1):0]            	    s0_sdo_data_s;
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
    wire                    	            data_valid;
    wire [(DATA_BUS*NUM_OF_SDI-1):0]        data_in;
	 	 
    axi_spi_engine #(
      .DATA_WIDTH (32),
      .NUM_OF_SDI (1),
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
      .DATA_WIDTH (32),
      .NUM_OF_SDI (1),
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
      .offload_sdi_valid (data_valid),
      .offload_sdi_ready (1),
      .offload_sdi_data (data_in));
		

    spi_engine_interconnect #(
      .DATA_WIDTH (32),
      .NUM_OF_SDI (1)
    ) i_spi_engine_interconnect (
      .clk (spi_clk),
      .resetn (spi_resetn_s),
      .m_cmd_valid (m_cmd_valid_s),
      .m_cmd_ready (m_cmd_ready_s),
      .m_cmd_data (m_cmd_data_s),
      .m_sdo_valid (m_sdo_data_valid_s),
      .m_sdo_ready (m_sdo_data_ready_s),
      .m_sdo_data (m_sdo_data_s),
      .m_sdi_valid (m_sdi_data_valid_s),
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

    spi_engine_execution_1 #(
      .DATA_WIDTH (32),
      .NUM_OF_SDI (1),
      .SDI_DELAY (2)
    ) i_spi_engine_execution_1 (
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
      .sdo_t (),
      .sdi (rx_sdi[0]),
      .cs (rx_cs_n),
      .three_wire ());
  
  
  
  /*block for generating a mux and data based on CHannel ID of input ADC_Data	*/
  		
		reg [ADC_RESOLUTION-1:0] ADC_DATA[NUM_OF_CHANNELS-1:0];
		wire [status_length-1:0] ADC_STATUS;
		reg [chID_length-1 :0] CH_ID; 
		reg data_valid_t;
		
		assign ADC_STATUS = data_in[status_length-1 : 0];
		
				
		always@(posedge spi_clk)begin
			data_valid_t <= data_valid;
		if (data_valid)begin
			CH_ID = ADC_STATUS[chID_length-1 : 0];end
		end
		
		always@(posedge spi_clk)begin
		if (data_valid_t)begin
			ADC_DATA[CH_ID]=data_in[DATA_WIDTH-1:status_length];end
		end


 	/* config register blocks for AD469x*/
	
		//config registers sets
		reg [15:0] up_data_seq;
		reg [31:0] up_cnv_rate;
		reg up_cnv_en;
		reg up_resetn;
		reg adc_data_mode;
		reg [15:0] up_scratch;
		reg [4:0] up_data_count;
		reg [7:0] CNV_PULSE_WIDTH;
		
		 // config reg write block
	  always @(negedge up_rstn or posedge up_clk) begin
		 if (up_rstn == 0) begin
			up_wack_cntrl_s<= 1'h0;
			up_scratch <= 32'b0;
			up_resetn <= 1'b0;
			up_cnv_en <= 1'b0;
			up_cnv_rate <= 32'b0;
			up_data_seq <= 5'h0;
			up_data_count <= 'h0;
		 end else begin
			up_wack_cntrl_s <= up_wreq;
			if ((up_wreq == 1'b1) && (up_waddr[8:0] == 9'h104)) begin
			  up_scratch <= up_wdata;
			end
			if ((up_wreq == 1'b1) && (up_waddr[8:0] == 9'h103)) begin
			  up_resetn <= up_wdata[0];
			  up_cnv_en <= up_wdata[1];
			  adc_data_mode <= up_wdata[2];
			end
			if ((up_wreq == 1'b1) && (up_waddr[8:0] == 9'h102)) begin
			  up_cnv_rate <= up_wdata;
			end
			if ((up_wreq == 1'b1) && (up_waddr[8:0] == 9'h101)) begin
			  up_data_seq <= up_wdata;
			end
			if ((up_wreq == 1'b1) && (up_waddr[8:0] == 9'h106)) begin
			  up_data_count <= up_wdata ;
			end
			if ((up_wreq == 1'b1) && (up_waddr[8:0] == 9'h107)) begin
			  CNV_PULSE_WIDTH <= up_wdata;
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
				 9'h101 : up_rdata_cntrl_s <= up_data_seq;
				 9'h102 : up_rdata_cntrl_s <= up_cnv_rate;
				 9'h103 : up_rdata_cntrl_s <= {13'b0, adc_data_mode, up_cnv_en, up_resetn};
				 9'h104 : up_rdata_cntrl_s <= up_scratch;
				 9'h105 : up_rdata_cntrl_s <= 32'hAD4696; 
				 9'h106 : up_rdata_cntrl_s <= up_data_count;
				 9'h107 : up_rdata_cntrl_s <= CNV_PULSE_WIDTH;
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
		  
		 
		  // a free running counter

	  always @(posedge spi_clk) begin
		 if (!up_cnv_en || pulse_counter==0 ) begin
			pulse_counter <= up_cnv_rate;
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
 
     /*cpack data module	*/
		//user to comment out not required enable and data connection
		
	  util_cpack2_impl #(
	  .NUM_OF_CHANNELS (NUM_OF_CHANNELS),
	  .SAMPLE_DATA_WIDTH (ADC_RESOLUTION),
	  .SAMPLES_PER_CHANNEL (1)
	  ) i_cpack (
	  .clk (spi_clk),
	  .reset (~up_rstn),
	  .enable (enable_in),
	  .fifo_wr_en ({NUM_OF_CHANNELS{adc_valid}}),
	  .fifo_wr_overflow (adc_wr_overflow),
	  .fifo_wr_data (data_temp),
	  .packed_fifo_wr_en (adc_en_packed),
	  .packed_fifo_wr_overflow (adc_ovf_packed),
	  .packed_fifo_wr_data (adc_data_packed),
	  .packed_fifo_wr_sync (adc_sync_packed)
	  );


	  wire [NUM_OF_CHANNELS*ADC_RESOLUTION-1:0] data_temp ;
	  reg adc_valid;
	  reg [4:0] valid_counter;
	  
	  genvar k;
	  generate
		for (k=0; k<(NUM_OF_CHANNELS); k=k+1) begin :cpack
			assign data_temp[(k+1)*ADC_RESOLUTION-1 : k*ADC_RESOLUTION]= adc_data_mode?(up_data_seq[k]? ADC_DATA[k] : 16'hDEAD) 
															: ADC_DATA[k] ;
	  end endgenerate
	  
	  always@(posedge spi_clk)begin
	  if (adc_data_mode) begin
		  if (valid_counter[4:0] == up_data_count[4:0])begin
				valid_counter<='h0;
				adc_valid<=up_resetn;end
		  else if (data_valid) begin
				adc_valid<=0;
				valid_counter<=valid_counter+1;end
		  else begin
				adc_valid<=0;end
		  end			
	  else begin 
			adc_valid <= data_valid_t; end
	  end 
	  
	  
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
	  
endmodule

// ***************************************************************************
// ***************************************************************************
