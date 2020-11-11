// ============================================================================
// Copyright (c) 2013 by Arrow Electronics, Inc.
// ============================================================================
//
// Permission:
//
//   Arrow grants permission to use and modify this code for use
//   in synthesis for all Arrow Development Boards. Other use of this code, 
//	  including the selling ,duplication, or modification of any portion is 
//   strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Arrow provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Arrow Technologies Inc
//  Englewood, CO. USA
//  
//  
//                     web: http://www.Arrow.com/  
//                     
//
// ============================================================================
// Date:  Mon Mar 27 13:20:22 2013
// ============================================================================
//
// ============================================================================
// Revision Change list:
// ============================================================================
//
// 								soc_system_20130323
//	
//	Description: Connected hps_fpga_reset_n output to verilog top level reset.
//					 Added button debounce circuitry. Bypassed at present. Debug required.
//					 Used clk_bot1. clk_50m_fpga does not work. Debug required.
//
//
// 								soc_system_20130408
//
//	Description: Changed vga_sync_n & vga_blank_n from inputs to outputs
//					 Changed ddr3_fpga_rasn, ddr3_fpga_resetn, ddr3_fpga_wen from 
//					 inputs to outputs.
//
//
// 								soc_system_20130411
//
//	Description: Removed debounce circuit. External 74HC245 performs pushbutton 
//					 debounce.
//
//
// 								soc_system_20131109
//
//	Description: Upgrade to release 13.1 
//					 Quartus: Changed top level to ghrd_top
//					 Quartus: Added Source/Probe Megawizard instances for f2h cold/warm/debug resets
//					 Quartus: Added system trace connections
//					 Qsys: Changed naming for jtag_master from master_secure to hps_only_master
//					 Qsys: Changed naming for jtag_master from master_non_sec to fpga_only_master
//					 Qsys: hps_component. Enabled input ports for f2h cold/warm/debug resets
//					 Qsys: hps_component. Enabled system trace ports
//
//
// 								soc_system_20140711
//
//	Description: Upgrade to release 14.0 
//					 Quartus: Changed device to 5CSXFC6D6F31C6
//					 Qsys: hps_component. Enabled f2dram_0, 256 bit bidirectional Avalon-MM FPGA to SDRAM interface
//					 Qsys: Added f2sdram_only jtag_master
//
//
// 								soc_system_20141225
//
//	Description: Upgrade to release 14.1 
//					 Quartus: 
//					 Qsys: Added a mm_bridge between the lw_axi_master and all fpga peripherals
//					 Qsys: hps_component / hps_clocks_tab. qspi clock freq changed to 333MHz 
//							 from 400MHz
//					 Qsys: hps_component / hps_clocks_tab. configuration / hps to fpga user 0 
//							 clock frequency changed to 123.333333MHz from 100MHz
//
//
// 								soc_system_20150901
//
//	Description: Upgrade to release 15.0 
//					 Quartus: 
//					 Qsys: 
//
//
// 								soc_system_20160212
//
//	Description: Upgrade to release 15.1 
//					 Quartus: 
//					 Qsys: 
//
// 								soc_system_20161011
//
//	Description: Upgrade to release 16.0 
//					 Quartus: 
//					 Qsys: Added  the Altera Interrupt Latency Counter component

// 								soc_system_20170311
//
//	Description: Upgrade to release 16.1 
//					 Quartus: removed source/probe megawizard instance
//					 Qsys: Added source/probe component

// 								sockit_ghrd_20201109
//
//	Description: Upgrade to release 20.1 
//					 Quartus: 
//					 Platform Designer:

//
// ============================================================================
// Qsys System :
// ============================================================================
//
// Description: 
//
//		To view the Qsys system open Qsys and selected soc_system.qsys.
//		This system mimics the Altera Development kit GHRD design. The system
//		console script, "ghrd_sc_script.tcl", which can be found in this projects  
//		root directory, is identical to the Altera script and will implement all 
//		the functionality described in the GHRD Users Guide. All software examples 
//		shown in the users guide will also be fully functional on the Arrow SoCKIT.
//
//
// ============================================================================

module sockit_ghrd_top (

   output wire [14:0] memory_mem_a,                          
   output wire [2:0]  memory_mem_ba,                         
   output wire        memory_mem_ck,                         
   output wire        memory_mem_ck_n,                       
   output wire        memory_mem_cke,                        
   output wire        memory_mem_cs_n,                       
   output wire        memory_mem_ras_n,                      
   output wire        memory_mem_cas_n,                      
   output wire        memory_mem_we_n,                       
   output wire        memory_mem_reset_n,                    
   inout  wire [31:0] memory_mem_dq,                         
   inout  wire [3:0]  memory_mem_dqs,                        
   inout  wire [3:0]  memory_mem_dqs_n,                      
   output wire        memory_mem_odt,                        
   output wire [3:0]  memory_mem_dm,                         
   input  wire        memory_oct_rzqin,                      
   output wire        hps_emac1_TX_CLK, 
   output wire        hps_emac1_TXD0,   
   output wire        hps_emac1_TXD1,   
   output wire        hps_emac1_TXD2,   
   output wire        hps_emac1_TXD3,   
   inout  wire        hps_emac1_RXD0,   
   inout  wire        hps_emac1_MDIO,   
   output wire        hps_emac1_MDC,    
   inout  wire        hps_emac1_RX_CTL, 
   output wire        hps_emac1_TX_CTL, 
   inout  wire        hps_emac1_RX_CLK, 
   inout  wire        hps_emac1_RXD1,   
   inout  wire        hps_emac1_RXD2,   
   inout  wire        hps_emac1_RXD3,   
   inout  wire        hps_qspi_IO0,     
   inout  wire        hps_qspi_IO1,     
   inout  wire        hps_qspi_IO2,     
   inout  wire        hps_qspi_IO3,     
   output wire        hps_qspi_SS0,     
   output wire        hps_qspi_CLK,     
   inout  wire        hps_sdio_CMD,     
   inout  wire        hps_sdio_D0,      
   inout  wire        hps_sdio_D1,      
   output wire        hps_sdio_CLK,     
   inout  wire        hps_sdio_D2,      
   inout  wire        hps_sdio_D3,      
   inout  wire        hps_usb1_D0,      
   inout  wire        hps_usb1_D1,      
   inout  wire        hps_usb1_D2,      
   inout  wire        hps_usb1_D3,      
   inout  wire        hps_usb1_D4,      
   inout  wire        hps_usb1_D5,      
   inout  wire        hps_usb1_D6,      
   inout  wire        hps_usb1_D7,      
   inout  wire        hps_usb1_CLK,     
   output wire        hps_usb1_STP,     
   inout  wire        hps_usb1_DIR,     
   inout  wire        hps_usb1_NXT,     
   output wire        hps_spim0_CLK,    
   output wire        hps_spim0_MOSI,   
   inout  wire        hps_spim0_MISO,   
   output wire        hps_spim0_SS0,    
   output wire        hps_spim1_CLK,    
   output wire        hps_spim1_MOSI,   
   inout  wire        hps_spim1_MISO,   
   output wire        hps_spim1_SS0,    
   input  wire        hps_uart0_RX,     
   output wire        hps_uart0_TX,     
   inout  wire        hps_i2c1_SDA,     
   inout  wire        hps_i2c1_SCL,     
   inout  wire        hps_gpio_GPIO00,  
   inout  wire        hps_gpio_GPIO09,  
   inout  wire        hps_gpio_GPIO35,  
   inout  wire        hps_gpio_GPIO48,  
   inout  wire        hps_gpio_GPIO53,  
   inout  wire        hps_gpio_GPIO54,  
   inout  wire        hps_gpio_GPIO55,  
   inout  wire        hps_gpio_GPIO56,  
   inout  wire        hps_gpio_GPIO61,  
   inout  wire        hps_gpio_GPIO62,   


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////	 
////////////////////		FPGA Interface			////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////								
	
	//FPGA-GPLL-CLK------------------------//X pins
   input              clk_100m_fpga,       // 2.5V    //50 MHz ajustable from SiLabs SI5338
   input              clk_50m_fpga,        // 2.5V    //50 MHz ajustable from SiLabs SI5338
   input              clk_top1,            // 2.5V    //50 MHz ajustable from SiLabs SI5338
   input              clk_bot1,            // 1.5V    //50 MHz ajustable from SiLabs SI5338
   input              fpga_resetn,         // 2.5V    //FPGA Reset Pushbutton	

	//////////////////// SiLabs Clock Generator I/F 	///////////////////  	   	   	   	   	   	
   output   wire      clk_i2c_sclk,        // I2C Clock 
   inout    wire      clk_i2c_sdat,        // I2C Data 
             
	//FPGA-User-IO-------------------------//14 pins //--------------------------
   input    [3:0]     user_dipsw_fpga,     //
   output   [3:0]     user_led_fpga,       //
   input    [3:0]     user_pb_fpga,        //
   input  	wire      irda_rxd,				// IRDA Receive LED   
   output  	wire      fan_ctrl				// control for fan
   
);
    
// internal wires and registers declaration
  wire      [3:0]     fpga_led_internal;
  wire                hps_fpga_reset_n;
  wire      [2:0]     hps_reset_req;
  wire                hps_cold_reset;
  wire                hps_warm_reset;
  wire                hps_debug_reset;
  wire      [27:0]    stm_hw_events;  
  

// connection of internal logics
//  assign user_led_fpga = ~fpga_led_internal;
  assign user_led_fpga = fpga_led_internal;
  assign stm_hw_events    = {{18{1'b0}}, user_dipsw_fpga, fpga_led_internal, user_pb_fpga};
  
	 

	 
 
    sockit_ghrd u0 (
        .clk_clk                               (clk_bot1),                          	 
        .reset_reset_n                         (hps_fpga_reset_n),                      
        .memory_mem_a                          (memory_mem_a),                          
        .memory_mem_ba                         (memory_mem_ba),                         
        .memory_mem_ck                         (memory_mem_ck),                         
        .memory_mem_ck_n                       (memory_mem_ck_n),                       
        .memory_mem_cke                        (memory_mem_cke),                        
        .memory_mem_cs_n                       (memory_mem_cs_n),                       
        .memory_mem_ras_n                      (memory_mem_ras_n),                      
        .memory_mem_cas_n                      (memory_mem_cas_n),                      
        .memory_mem_we_n                       (memory_mem_we_n),                       
        .memory_mem_reset_n                    (memory_mem_reset_n),                    
        .memory_mem_dq                         (memory_mem_dq),                         
        .memory_mem_dqs                        (memory_mem_dqs),                        
        .memory_mem_dqs_n                      (memory_mem_dqs_n),                      
        .memory_mem_odt                        (memory_mem_odt),                        
        .memory_mem_dm                         (memory_mem_dm),                         
        .memory_oct_rzqin                      (memory_oct_rzqin),                      
        .hps_0_hps_io_hps_io_emac1_inst_TX_CLK (hps_emac1_TX_CLK), 
        .hps_0_hps_io_hps_io_emac1_inst_TXD0   (hps_emac1_TXD0),   
        .hps_0_hps_io_hps_io_emac1_inst_TXD1   (hps_emac1_TXD1),   
        .hps_0_hps_io_hps_io_emac1_inst_TXD2   (hps_emac1_TXD2),   
        .hps_0_hps_io_hps_io_emac1_inst_TXD3   (hps_emac1_TXD3),   
        .hps_0_hps_io_hps_io_emac1_inst_RXD0   (hps_emac1_RXD0),   
        .hps_0_hps_io_hps_io_emac1_inst_MDIO   (hps_emac1_MDIO),   
        .hps_0_hps_io_hps_io_emac1_inst_MDC    (hps_emac1_MDC),    
        .hps_0_hps_io_hps_io_emac1_inst_RX_CTL (hps_emac1_RX_CTL), 
        .hps_0_hps_io_hps_io_emac1_inst_TX_CTL (hps_emac1_TX_CTL), 
        .hps_0_hps_io_hps_io_emac1_inst_RX_CLK (hps_emac1_RX_CLK), 
        .hps_0_hps_io_hps_io_emac1_inst_RXD1   (hps_emac1_RXD1),   
        .hps_0_hps_io_hps_io_emac1_inst_RXD2   (hps_emac1_RXD2),   
        .hps_0_hps_io_hps_io_emac1_inst_RXD3   (hps_emac1_RXD3),   
        .hps_0_hps_io_hps_io_qspi_inst_IO0     (hps_qspi_IO0),     
        .hps_0_hps_io_hps_io_qspi_inst_IO1     (hps_qspi_IO1),     
        .hps_0_hps_io_hps_io_qspi_inst_IO2     (hps_qspi_IO2),     
        .hps_0_hps_io_hps_io_qspi_inst_IO3     (hps_qspi_IO3),     
        .hps_0_hps_io_hps_io_qspi_inst_SS0     (hps_qspi_SS0),     
        .hps_0_hps_io_hps_io_qspi_inst_CLK     (hps_qspi_CLK),     
        .hps_0_hps_io_hps_io_sdio_inst_CMD     (hps_sdio_CMD),     
        .hps_0_hps_io_hps_io_sdio_inst_D0      (hps_sdio_D0),      
        .hps_0_hps_io_hps_io_sdio_inst_D1      (hps_sdio_D1),      
        .hps_0_hps_io_hps_io_sdio_inst_CLK     (hps_sdio_CLK),     
        .hps_0_hps_io_hps_io_sdio_inst_D2      (hps_sdio_D2),      
        .hps_0_hps_io_hps_io_sdio_inst_D3      (hps_sdio_D3),      
        .hps_0_hps_io_hps_io_usb1_inst_D0      (hps_usb1_D0),      
        .hps_0_hps_io_hps_io_usb1_inst_D1      (hps_usb1_D1),      
        .hps_0_hps_io_hps_io_usb1_inst_D2      (hps_usb1_D2),      
        .hps_0_hps_io_hps_io_usb1_inst_D3      (hps_usb1_D3),      
        .hps_0_hps_io_hps_io_usb1_inst_D4      (hps_usb1_D4),      
        .hps_0_hps_io_hps_io_usb1_inst_D5      (hps_usb1_D5),      
        .hps_0_hps_io_hps_io_usb1_inst_D6      (hps_usb1_D6),      
        .hps_0_hps_io_hps_io_usb1_inst_D7      (hps_usb1_D7),      
        .hps_0_hps_io_hps_io_usb1_inst_CLK     (hps_usb1_CLK),     
        .hps_0_hps_io_hps_io_usb1_inst_STP     (hps_usb1_STP),     
        .hps_0_hps_io_hps_io_usb1_inst_DIR     (hps_usb1_DIR),     
        .hps_0_hps_io_hps_io_usb1_inst_NXT     (hps_usb1_NXT),     
        .hps_0_hps_io_hps_io_spim0_inst_CLK    (hps_spim0_CLK),    
        .hps_0_hps_io_hps_io_spim0_inst_MOSI   (hps_spim0_MOSI),   
        .hps_0_hps_io_hps_io_spim0_inst_MISO   (hps_spim0_MISO),   
        .hps_0_hps_io_hps_io_spim0_inst_SS0    (hps_spim0_SS0),    
        .hps_0_hps_io_hps_io_spim1_inst_CLK    (hps_spim1_CLK),    
        .hps_0_hps_io_hps_io_spim1_inst_MOSI   (hps_spim1_MOSI),   
        .hps_0_hps_io_hps_io_spim1_inst_MISO   (hps_spim1_MISO),   
        .hps_0_hps_io_hps_io_spim1_inst_SS0    (hps_spim1_SS0),    
        .hps_0_hps_io_hps_io_uart0_inst_RX     (hps_uart0_RX),     
        .hps_0_hps_io_hps_io_uart0_inst_TX     (hps_uart0_TX),     
        .hps_0_hps_io_hps_io_i2c1_inst_SDA     (hps_i2c1_SDA),     
        .hps_0_hps_io_hps_io_i2c1_inst_SCL     (hps_i2c1_SCL),     
        .hps_0_hps_io_hps_io_gpio_inst_GPIO00  (hps_gpio_GPIO00),  
        .hps_0_hps_io_hps_io_gpio_inst_GPIO09  (hps_gpio_GPIO09),  
        .hps_0_hps_io_hps_io_gpio_inst_GPIO35  (hps_gpio_GPIO35),  
        .hps_0_hps_io_hps_io_gpio_inst_GPIO48  (hps_gpio_GPIO48),  
        .hps_0_hps_io_hps_io_gpio_inst_GPIO53  (hps_gpio_GPIO53),  
        .hps_0_hps_io_hps_io_gpio_inst_GPIO54  (hps_gpio_GPIO54),  
        .hps_0_hps_io_hps_io_gpio_inst_GPIO55  (hps_gpio_GPIO55),  
        .hps_0_hps_io_hps_io_gpio_inst_GPIO56  (hps_gpio_GPIO56),  
        .hps_0_hps_io_hps_io_gpio_inst_GPIO61  (hps_gpio_GPIO61),  
        .hps_0_hps_io_hps_io_gpio_inst_GPIO62  (hps_gpio_GPIO62),  
		  .hps_0_f2h_stm_hw_events_stm_hwevents  (stm_hw_events),		  
        .led_pio_external_connection_export  (fpga_led_internal),   						 
		  .dipsw_pio_external_connection_export  (user_dipsw_fpga),                 		 
        .button_pio_external_connection_export (user_pb_fpga),                			 
		  .hps_0_h2f_reset_reset_n               (hps_fpga_reset_n),
		  .issp_hps_resets_source                (hps_reset_req),		  
		  .hps_0_f2h_cold_reset_req_reset_n      (~hps_cold_reset),            			 	 
		  .hps_0_f2h_warm_reset_req_reset_n      (~hps_warm_reset),            			 	 
		  .hps_0_f2h_debug_reset_req_reset_n     (~hps_debug_reset)

    );
	 

altera_edge_detector pulse_cold_reset (
  .clk       (clk_bot1),
  .rst_n     (hps_fpga_reset_n),
  .signal_in (hps_reset_req[0]),
  .pulse_out (hps_cold_reset)
);
  defparam pulse_cold_reset.PULSE_EXT = 6;
  defparam pulse_cold_reset.EDGE_TYPE = 1;
  defparam pulse_cold_reset.IGNORE_RST_WHILE_BUSY = 1;

altera_edge_detector pulse_warm_reset (
  .clk       (clk_bot1),
  .rst_n     (hps_fpga_reset_n),
  .signal_in (hps_reset_req[1]),
  .pulse_out (hps_warm_reset)
);
  defparam pulse_warm_reset.PULSE_EXT = 2;
  defparam pulse_warm_reset.EDGE_TYPE = 1;
  defparam pulse_warm_reset.IGNORE_RST_WHILE_BUSY = 1;
  
altera_edge_detector pulse_debug_reset (
  .clk       (clk_bot1),
  .rst_n     (hps_fpga_reset_n),
  .signal_in (hps_reset_req[2]),
  .pulse_out (hps_debug_reset)
);
  defparam pulse_debug_reset.PULSE_EXT = 32;
  defparam pulse_debug_reset.EDGE_TYPE = 1;
  defparam pulse_debug_reset.IGNORE_RST_WHILE_BUSY = 1;
    
endmodule
