// ============================================================================
// Copyright (c) 2021 by Arrow Electronics, Inc.
// ============================================================================
//
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
// Date:  Mon Aug 24:20:22 2021
// ============================================================================


module datastormdaq_ghrd_top (

  // clock and resets
  input  wire           sys_clk,
  input  wire           sys_reset_n,

  // hps-ddr
  output wire  [ 15:0]  ddr3_a,
  output wire  [  2:0]  ddr3_ba,
  output wire           ddr3_reset_n,
  output wire           ddr3_ck_p,
  output wire           ddr3_ck_n,
  output wire           ddr3_cke,
  output wire           ddr3_cs_n,
  output wire           ddr3_ras_n,
  output wire           ddr3_cas_n,
  output wire           ddr3_we_n,
  inout  wire  [ 31:0]  ddr3_dq,
  inout  wire  [  3:0]  ddr3_dqs_p,
  inout  wire  [  3:0]  ddr3_dqs_n,
  output wire  [  3:0]  ddr3_dm,
  output wire           ddr3_odt,
  input  wire           ddr3_rzq,

  // hps-ethernet
  output wire           eth1_tx_clk,
  output wire           eth1_tx_ctl,
  output wire  [  3:0]  eth1_tx_d,
  input  wire           eth1_rx_clk,
  input  wire           eth1_rx_ctl,
  input  wire  [  3:0]  eth1_rx_d,
  output wire           eth1_mdc,
  inout  wire           eth1_mdio,
  inout  wire           phy_int,
  inout  wire           eth_rst,
  
  // hps-qspi
  output wire           qspi_ss0,
  output wire           qspi_clk,
  inout  wire  [  3:0]  qspi_io,

  // hps-sdio
  output wire           sdio_clk,
  inout  wire           sdio_cmd,
  inout  wire  [  3:0]  sdio_d,

  // hps-usb
  input  wire           usb1_clk,
  output wire           usb1_stp,
  input  wire           usb1_dir,
  input  wire           usb1_nxt,
  inout  wire  [  7:0]  usb1_d,
  inout	wire            usb1_rst,

  // hps-uart
  input  wire           uart0_rx,
  output wire           uart0_tx,
  
  // hps-i2c
  inout  wire           hps_scl,
  inout  wire           hps_sda,

  // user led, pb, dipsw
  input	wire [1:0]   	user_dipsw_fpga,     
  output wire [1:0]   	user_led_fpga,
  input	wire            user_pb_fpga,  

  // misc
  inout  wire           led_hps_1,
  inout  wire           led_hps_2,
  input  wire           fpga_resetn,         // 2.5V    //FPGA Reset Pushbutton	(S4)

  // fpga ddr
  output [15:0]		ddr3_fpga_a,
  output [2:0]		ddr3_fpga_ba,
  output		ddr3_fpga_cas_n,
  output		ddr3_fpga_cke,
  output		ddr3_fpga_ck_n,
  output         	ddr3_fpga_ck_p,
  output         	ddr3_fpga_cs_n,
  output [3:0]   	ddr3_fpga_dm,
  inout  [31:0]  	ddr3_fpga_dq,
  inout  [3:0]   	ddr3_fpga_dqs_n,
  inout  [3:0]		ddr3_fpga_dqs_p,
  output		ddr3_fpga_odt,
  output		ddr3_fpga_ras_n,
  output		ddr3_fpga_reset_n,
  output		ddr3_fpga_we_n,
  input			ddr3_fpga_rzq

);
    
// internal wires and registers declaration
  wire      [1:0]     fpga_led_internal;
  wire                hps_fpga_reset_n;
  wire      [2:0]     hps_reset_req;
  wire                hps_cold_reset;
  wire                hps_warm_reset;
  wire                hps_debug_reset;
  wire      [27:0]    stm_hw_events;  
 

// connection of internal logics
//  assign user_led_fpga = ~fpga_led_internal;
  assign user_led_fpga = fpga_led_internal;
  assign stm_hw_events    = {{23{1'b0}}, user_dipsw_fpga, fpga_led_internal, user_pb_fpga};
  
	 
    datastormdaq_ghrd u0 (
        .button_pio_external_connection_export (user_pb_fpga), 
        .dipsw_pio_external_connection_export  (user_dipsw_fpga), 
        .led_pio_external_connection_export    (fpga_led_internal),
        .hps_0_f2h_cold_reset_req_reset_n      (~hps_reset_req[0]),      
        .hps_0_f2h_debug_reset_req_reset_n     (~hps_reset_req[2]),     
        .hps_0_f2h_stm_hw_events_stm_hwevents  (stm_hw_events),  
        .hps_0_f2h_warm_reset_req_reset_n      (~hps_reset_req[1]),      
        .hps_0_h2f_reset_reset_n               (hps_fpga_reset_n),               
        .issp_hps_resets_source                (hps_reset_req),                
        .hps_0_hps_io_hps_io_emac1_inst_TX_CLK (eth1_tx_clk),
        .hps_0_hps_io_hps_io_emac1_inst_TXD0 (eth1_tx_d[0]),
        .hps_0_hps_io_hps_io_emac1_inst_TXD1 (eth1_tx_d[1]),
        .hps_0_hps_io_hps_io_emac1_inst_TXD2 (eth1_tx_d[2]),
        .hps_0_hps_io_hps_io_emac1_inst_TXD3 (eth1_tx_d[3]),
        .hps_0_hps_io_hps_io_emac1_inst_RXD0 (eth1_rx_d[0]),
        .hps_0_hps_io_hps_io_emac1_inst_MDIO (eth1_mdio),
        .hps_0_hps_io_hps_io_emac1_inst_MDC (eth1_mdc),
        .hps_0_hps_io_hps_io_emac1_inst_RX_CTL (eth1_rx_ctl),
        .hps_0_hps_io_hps_io_emac1_inst_TX_CTL (eth1_tx_ctl),
        .hps_0_hps_io_hps_io_emac1_inst_RX_CLK (eth1_rx_clk),
        .hps_0_hps_io_hps_io_emac1_inst_RXD1 (eth1_rx_d[1]),
        .hps_0_hps_io_hps_io_emac1_inst_RXD2 (eth1_rx_d[2]),
        .hps_0_hps_io_hps_io_emac1_inst_RXD3 (eth1_rx_d[3]),
        .hps_0_hps_io_hps_io_qspi_inst_IO0 (qspi_io[0]),
        .hps_0_hps_io_hps_io_qspi_inst_IO1 (qspi_io[1]),
        .hps_0_hps_io_hps_io_qspi_inst_IO2 (qspi_io[2]),
        .hps_0_hps_io_hps_io_qspi_inst_IO3 (qspi_io[3]),
        .hps_0_hps_io_hps_io_qspi_inst_SS0 (qspi_ss0),
        .hps_0_hps_io_hps_io_qspi_inst_CLK (qspi_clk),
        .hps_0_hps_io_hps_io_sdio_inst_CMD (sdio_cmd),
        .hps_0_hps_io_hps_io_sdio_inst_D0 (sdio_d[0]),
        .hps_0_hps_io_hps_io_sdio_inst_D1 (sdio_d[1]),
        .hps_0_hps_io_hps_io_sdio_inst_CLK (sdio_clk),
        .hps_0_hps_io_hps_io_sdio_inst_D2 (sdio_d[2]),
        .hps_0_hps_io_hps_io_sdio_inst_D3 (sdio_d[3]),
        .hps_0_hps_io_hps_io_usb1_inst_D0 (usb1_d[0]),
        .hps_0_hps_io_hps_io_usb1_inst_D1 (usb1_d[1]),
        .hps_0_hps_io_hps_io_usb1_inst_D2 (usb1_d[2]),
        .hps_0_hps_io_hps_io_usb1_inst_D3 (usb1_d[3]),
        .hps_0_hps_io_hps_io_usb1_inst_D4 (usb1_d[4]),
        .hps_0_hps_io_hps_io_usb1_inst_D5 (usb1_d[5]),
        .hps_0_hps_io_hps_io_usb1_inst_D6 (usb1_d[6]),
        .hps_0_hps_io_hps_io_usb1_inst_D7 (usb1_d[7]),
        .hps_0_hps_io_hps_io_usb1_inst_CLK (usb1_clk),
        .hps_0_hps_io_hps_io_usb1_inst_STP (usb1_stp),
        .hps_0_hps_io_hps_io_usb1_inst_DIR (usb1_dir),
        .hps_0_hps_io_hps_io_usb1_inst_NXT (usb1_nxt),
        .hps_0_hps_io_hps_io_uart0_inst_RX     (uart0_rx),
        .hps_0_hps_io_hps_io_uart0_inst_TX     (uart0_tx),
	.hps_0_hps_io_hps_io_i2c1_inst_SDA   (hps_sda),
	.hps_0_hps_io_hps_io_i2c1_inst_SCL   (hps_scl),	
        .hps_0_hps_io_hps_io_gpio_inst_GPIO35 (phy_int),
        .hps_0_hps_io_hps_io_gpio_inst_GPIO42 (usb1_rst),
        .hps_0_hps_io_hps_io_gpio_inst_GPIO43 (eth_rst),
        .hps_0_hps_io_hps_io_gpio_inst_GPIO53 (led_hps_1),
        .hps_0_hps_io_hps_io_gpio_inst_GPIO54 (led_hps_2),
        .memory_mem_a                          (ddr3_a),                          
        .memory_mem_ba                         (ddr3_ba),                         
        .memory_mem_ck                         (ddr3_ck_p),                         
        .memory_mem_ck_n                       (ddr3_ck_n),                       
        .memory_mem_cke                        (ddr3_cke),                        
        .memory_mem_cs_n                       (ddr3_cs_n),                       
        .memory_mem_ras_n                      (ddr3_ras_n),                      
        .memory_mem_cas_n                      (ddr3_cas_n),                      
        .memory_mem_we_n                       (ddr3_we_n),                       
        .memory_mem_reset_n                    (ddr3_reset_n),                    
        .memory_mem_dq                         (ddr3_dq),                         
        .memory_mem_dqs                        (ddr3_dqs_p),                        
        .memory_mem_dqs_n                      (ddr3_dqs_n),                      
        .memory_mem_odt                        (ddr3_odt),                        
        .memory_mem_dm                         (ddr3_dm),                         
        .memory_oct_rzqin                      (ddr3_rzq),
        .fpga_memory_mem_a                     (ddr3_fpga_a),
        .fpga_memory_mem_ba                    (ddr3_fpga_ba),
        .fpga_memory_mem_ck                    (ddr3_fpga_ck_p),
        .fpga_memory_mem_ck_n                  (ddr3_fpga_ck_n),
        .fpga_memory_mem_cke                   (ddr3_fpga_cke),
        .fpga_memory_mem_cs_n                  (ddr3_fpga_cs_n),
        .fpga_memory_mem_dm                    (ddr3_fpga_dm),
        .fpga_memory_mem_ras_n                 (ddr3_fpga_ras_n),
        .fpga_memory_mem_cas_n                 (ddr3_fpga_cas_n),
        .fpga_memory_mem_we_n                  (ddr3_fpga_we_n),
        .fpga_memory_mem_reset_n               (ddr3_fpga_reset_n),
        .fpga_memory_mem_dq                    (ddr3_fpga_dq),
        .fpga_memory_mem_dqs                   (ddr3_fpga_dqs_p),
        .fpga_memory_mem_dqs_n                 (ddr3_fpga_dqs_n),
        .fpga_memory_mem_odt                   (ddr3_fpga_odt),
        .oct_rzqin                             (ddr3_fpga_rzq),                 
        .clk_clk                               (sys_clk), 
        .reset_reset_n                         (sys_reset_n)
    );

    
endmodule
