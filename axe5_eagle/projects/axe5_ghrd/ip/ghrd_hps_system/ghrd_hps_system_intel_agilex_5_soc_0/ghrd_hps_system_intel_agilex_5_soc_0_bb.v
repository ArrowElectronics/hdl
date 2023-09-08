module ghrd_hps_system_intel_agilex_5_soc_0 (
		output wire         h2f_reset_reset_n,                  //                h2f_reset.reset_n
		input  wire         hps2fpga_axi_clock_clk,             //       hps2fpga_axi_clock.clk
		input  wire         hps2fpga_axi_reset_reset_n,         //       hps2fpga_axi_reset.reset_n
		output wire [3:0]   hps2fpga_awid,                      //                 hps2fpga.awid
		output wire [31:0]  hps2fpga_awaddr,                    //                         .awaddr
		output wire [7:0]   hps2fpga_awlen,                     //                         .awlen
		output wire [2:0]   hps2fpga_awsize,                    //                         .awsize
		output wire [1:0]   hps2fpga_awburst,                   //                         .awburst
		output wire         hps2fpga_awlock,                    //                         .awlock
		output wire [3:0]   hps2fpga_awcache,                   //                         .awcache
		output wire [2:0]   hps2fpga_awprot,                    //                         .awprot
		output wire         hps2fpga_awvalid,                   //                         .awvalid
		input  wire         hps2fpga_awready,                   //                         .awready
		output wire [31:0]  hps2fpga_wdata,                     //                         .wdata
		output wire [3:0]   hps2fpga_wstrb,                     //                         .wstrb
		output wire         hps2fpga_wlast,                     //                         .wlast
		output wire         hps2fpga_wvalid,                    //                         .wvalid
		input  wire         hps2fpga_wready,                    //                         .wready
		input  wire [3:0]   hps2fpga_bid,                       //                         .bid
		input  wire [1:0]   hps2fpga_bresp,                     //                         .bresp
		input  wire         hps2fpga_bvalid,                    //                         .bvalid
		output wire         hps2fpga_bready,                    //                         .bready
		output wire [3:0]   hps2fpga_arid,                      //                         .arid
		output wire [31:0]  hps2fpga_araddr,                    //                         .araddr
		output wire [7:0]   hps2fpga_arlen,                     //                         .arlen
		output wire [2:0]   hps2fpga_arsize,                    //                         .arsize
		output wire [1:0]   hps2fpga_arburst,                   //                         .arburst
		output wire         hps2fpga_arlock,                    //                         .arlock
		output wire [3:0]   hps2fpga_arcache,                   //                         .arcache
		output wire [2:0]   hps2fpga_arprot,                    //                         .arprot
		output wire         hps2fpga_arvalid,                   //                         .arvalid
		input  wire         hps2fpga_arready,                   //                         .arready
		input  wire [3:0]   hps2fpga_rid,                       //                         .rid
		input  wire [31:0]  hps2fpga_rdata,                     //                         .rdata
		input  wire [1:0]   hps2fpga_rresp,                     //                         .rresp
		input  wire         hps2fpga_rlast,                     //                         .rlast
		input  wire         hps2fpga_rvalid,                    //                         .rvalid
		output wire         hps2fpga_rready,                    //                         .rready
		input  wire         lwhps2fpga_axi_clock_clk,           //     lwhps2fpga_axi_clock.clk
		input  wire         lwhps2fpga_axi_reset_reset_n,       //     lwhps2fpga_axi_reset.reset_n
		output wire [3:0]   lwhps2fpga_awid,                    //               lwhps2fpga.awid
		output wire [28:0]  lwhps2fpga_awaddr,                  //                         .awaddr
		output wire [7:0]   lwhps2fpga_awlen,                   //                         .awlen
		output wire [2:0]   lwhps2fpga_awsize,                  //                         .awsize
		output wire [1:0]   lwhps2fpga_awburst,                 //                         .awburst
		output wire         lwhps2fpga_awlock,                  //                         .awlock
		output wire [3:0]   lwhps2fpga_awcache,                 //                         .awcache
		output wire [2:0]   lwhps2fpga_awprot,                  //                         .awprot
		output wire         lwhps2fpga_awvalid,                 //                         .awvalid
		input  wire         lwhps2fpga_awready,                 //                         .awready
		output wire [31:0]  lwhps2fpga_wdata,                   //                         .wdata
		output wire [3:0]   lwhps2fpga_wstrb,                   //                         .wstrb
		output wire         lwhps2fpga_wlast,                   //                         .wlast
		output wire         lwhps2fpga_wvalid,                  //                         .wvalid
		input  wire         lwhps2fpga_wready,                  //                         .wready
		input  wire [3:0]   lwhps2fpga_bid,                     //                         .bid
		input  wire [1:0]   lwhps2fpga_bresp,                   //                         .bresp
		input  wire         lwhps2fpga_bvalid,                  //                         .bvalid
		output wire         lwhps2fpga_bready,                  //                         .bready
		output wire [3:0]   lwhps2fpga_arid,                    //                         .arid
		output wire [28:0]  lwhps2fpga_araddr,                  //                         .araddr
		output wire [7:0]   lwhps2fpga_arlen,                   //                         .arlen
		output wire [2:0]   lwhps2fpga_arsize,                  //                         .arsize
		output wire [1:0]   lwhps2fpga_arburst,                 //                         .arburst
		output wire         lwhps2fpga_arlock,                  //                         .arlock
		output wire [3:0]   lwhps2fpga_arcache,                 //                         .arcache
		output wire [2:0]   lwhps2fpga_arprot,                  //                         .arprot
		output wire         lwhps2fpga_arvalid,                 //                         .arvalid
		input  wire         lwhps2fpga_arready,                 //                         .arready
		input  wire [3:0]   lwhps2fpga_rid,                     //                         .rid
		input  wire [31:0]  lwhps2fpga_rdata,                   //                         .rdata
		input  wire [1:0]   lwhps2fpga_rresp,                   //                         .rresp
		input  wire         lwhps2fpga_rlast,                   //                         .rlast
		input  wire         lwhps2fpga_rvalid,                  //                         .rvalid
		output wire         lwhps2fpga_rready,                  //                         .rready
		input  wire         emac_ptp_clk_clk,                   //             emac_ptp_clk.clk
		input  wire         emac_timestamp_clk_clk,             //       emac_timestamp_clk.clk
		input  wire [63:0]  emac_timestamp_data_data_in,        //      emac_timestamp_data.data_in
		output wire         emac0_mdio_mac_mdc,                 //               emac0_mdio.mac_mdc
		input  wire         emac0_mdio_mac_mdi,                 //                         .mac_mdi
		output wire         emac0_mdio_mac_mdo,                 //                         .mac_mdo
		output wire         emac0_mdio_mac_mdoe,                //                         .mac_mdoe
		output wire         emac0_app_rst_reset_n,              //            emac0_app_rst.reset_n
		output wire         emac0_mac_tx_clk_o,                 //                    emac0.mac_tx_clk_o
		input  wire         emac0_mac_tx_clk_i,                 //                         .mac_tx_clk_i
		input  wire         emac0_mac_rx_clk,                   //                         .mac_rx_clk
		output wire         emac0_mac_rst_tx_n,                 //                         .mac_rst_tx_n
		output wire         emac0_mac_rst_rx_n,                 //                         .mac_rst_rx_n
		output wire         emac0_mac_txen,                     //                         .mac_txen
		output wire         emac0_mac_txer,                     //                         .mac_txer
		input  wire         emac0_mac_rxdv,                     //                         .mac_rxdv
		input  wire         emac0_mac_rxer,                     //                         .mac_rxer
		input  wire [7:0]   emac0_mac_rxd,                      //                         .mac_rxd
		input  wire         emac0_mac_col,                      //                         .mac_col
		input  wire         emac0_mac_crs,                      //                         .mac_crs
		output wire [2:0]   emac0_mac_speed,                    //                         .mac_speed
		output wire [7:0]   emac0_mac_txd_o,                    //                         .mac_txd_o
		output wire         emac2_app_rst_reset_n,              //            emac2_app_rst.reset_n
		input  wire         spim0_miso_i,                       //                    spim0.miso_i
		output wire         spim0_mosi_o,                       //                         .mosi_o
		output wire         spim0_mosi_oe,                      //                         .mosi_oe
		input  wire         spim0_ss_in_n,                      //                         .ss_in_n
		output wire         spim0_ss0_n_o,                      //                         .ss0_n_o
		output wire         spim0_ss1_n_o,                      //                         .ss1_n_o
		output wire         spim0_ss2_n_o,                      //                         .ss2_n_o
		output wire         spim0_ss3_n_o,                      //                         .ss3_n_o
		output wire         spim0_sclk_out_clk,                 //           spim0_sclk_out.clk
		input  wire         I2C1_scl_i_clk,                     //               I2C1_scl_i.clk
		output wire         I2C1_scl_oe_clk,                    //              I2C1_scl_oe.clk
		input  wire         I2C1_sda_i,                         //                     I2C1.sda_i
		output wire         I2C1_sda_oe,                        //                         .sda_oe
		output wire         h2f_user0_clk_clk,                  //            h2f_user0_clk.clk
		output wire         h2f_user1_clk_clk,                  //            h2f_user1_clk.clk
		output wire         h2f_warm_reset_handshake_reset_req, // h2f_warm_reset_handshake.reset_req
		input  wire         h2f_warm_reset_handshake_reset_ack, //                         .reset_ack
		output wire         h2f_cold_reset_reset_n,             //           h2f_cold_reset.reset_n
		input  wire         hps_io_hps_osc_clk,                 //                   hps_io.hps_osc_clk
		inout  wire         hps_io_sdmmc_data0,                 //                         .sdmmc_data0
		inout  wire         hps_io_sdmmc_data1,                 //                         .sdmmc_data1
		output wire         hps_io_sdmmc_cclk,                  //                         .sdmmc_cclk
		inout  wire         hps_io_sdmmc_data2,                 //                         .sdmmc_data2
		inout  wire         hps_io_sdmmc_data3,                 //                         .sdmmc_data3
		inout  wire         hps_io_sdmmc_cmd,                   //                         .sdmmc_cmd
		input  wire         hps_io_usb1_clk,                    //                         .usb1_clk
		output wire         hps_io_usb1_stp,                    //                         .usb1_stp
		input  wire         hps_io_usb1_dir,                    //                         .usb1_dir
		inout  wire         hps_io_usb1_data0,                  //                         .usb1_data0
		inout  wire         hps_io_usb1_data1,                  //                         .usb1_data1
		input  wire         hps_io_usb1_nxr,                    //                         .usb1_nxr
		inout  wire         hps_io_usb1_data2,                  //                         .usb1_data2
		inout  wire         hps_io_usb1_data3,                  //                         .usb1_data3
		inout  wire         hps_io_usb1_data4,                  //                         .usb1_data4
		inout  wire         hps_io_usb1_data5,                  //                         .usb1_data5
		inout  wire         hps_io_usb1_data6,                  //                         .usb1_data6
		inout  wire         hps_io_usb1_data7,                  //                         .usb1_data7
		output wire         hps_io_emac2_tx_clk,                //                         .emac2_tx_clk
		output wire         hps_io_emac2_tx_ctl,                //                         .emac2_tx_ctl
		input  wire         hps_io_emac2_rx_clk,                //                         .emac2_rx_clk
		input  wire         hps_io_emac2_rx_ctl,                //                         .emac2_rx_ctl
		output wire         hps_io_emac2_txd0,                  //                         .emac2_txd0
		output wire         hps_io_emac2_txd1,                  //                         .emac2_txd1
		input  wire         hps_io_emac2_rxd0,                  //                         .emac2_rxd0
		input  wire         hps_io_emac2_rxd1,                  //                         .emac2_rxd1
		output wire         hps_io_emac2_txd2,                  //                         .emac2_txd2
		output wire         hps_io_emac2_txd3,                  //                         .emac2_txd3
		input  wire         hps_io_emac2_rxd2,                  //                         .emac2_rxd2
		input  wire         hps_io_emac2_rxd3,                  //                         .emac2_rxd3
		inout  wire         hps_io_mdio2_mdio,                  //                         .mdio2_mdio
		output wire         hps_io_mdio2_mdc,                   //                         .mdio2_mdc
		output wire         hps_io_uart0_tx,                    //                         .uart0_tx
		input  wire         hps_io_uart0_rx,                    //                         .uart0_rx
		inout  wire         hps_io_i2c0_sda,                    //                         .i2c0_sda
		inout  wire         hps_io_i2c0_scl,                    //                         .i2c0_scl
		inout  wire         hps_io_gpio6,                       //                         .gpio6
		inout  wire         hps_io_gpio7,                       //                         .gpio7
		inout  wire         hps_io_gpio8,                       //                         .gpio8
		inout  wire         hps_io_gpio9,                       //                         .gpio9
		inout  wire         hps_io_gpio10,                      //                         .gpio10
		inout  wire         hps_io_gpio11,                      //                         .gpio11
		inout  wire         hps_io_gpio28,                      //                         .gpio28
		inout  wire         hps_io_gpio34,                      //                         .gpio34
		inout  wire         hps_io_gpio35,                      //                         .gpio35
		input  wire         usb31_io_vbus_det,                  //                 usb31_io.vbus_det
		input  wire         usb31_io_flt_bar,                   //                         .flt_bar
		output wire [1:0]   usb31_io_usb_ctrl,                  //                         .usb_ctrl
		input  wire         usb31_io_usb31_id,                  //                         .usb31_id
		input  wire [62:0]  fpga2hps_interrupt_irq,             //       fpga2hps_interrupt.irq
		input  wire         f2sdram_axi_clock_clk,              //        f2sdram_axi_clock.clk
		input  wire         f2sdram_axi_reset_reset_n,          //        f2sdram_axi_reset.reset_n
		input  wire [31:0]  f2sdram_araddr,                     //                  f2sdram.araddr
		input  wire [1:0]   f2sdram_arburst,                    //                         .arburst
		input  wire [3:0]   f2sdram_arcache,                    //                         .arcache
		input  wire [4:0]   f2sdram_arid,                       //                         .arid
		input  wire [7:0]   f2sdram_arlen,                      //                         .arlen
		input  wire         f2sdram_arlock,                     //                         .arlock
		input  wire [2:0]   f2sdram_arprot,                     //                         .arprot
		input  wire [3:0]   f2sdram_arqos,                      //                         .arqos
		output wire         f2sdram_arready,                    //                         .arready
		input  wire [2:0]   f2sdram_arsize,                     //                         .arsize
		input  wire         f2sdram_arvalid,                    //                         .arvalid
		input  wire [31:0]  f2sdram_awaddr,                     //                         .awaddr
		input  wire [1:0]   f2sdram_awburst,                    //                         .awburst
		input  wire [3:0]   f2sdram_awcache,                    //                         .awcache
		input  wire [4:0]   f2sdram_awid,                       //                         .awid
		input  wire [7:0]   f2sdram_awlen,                      //                         .awlen
		input  wire         f2sdram_awlock,                     //                         .awlock
		input  wire [2:0]   f2sdram_awprot,                     //                         .awprot
		input  wire [3:0]   f2sdram_awqos,                      //                         .awqos
		output wire         f2sdram_awready,                    //                         .awready
		input  wire [2:0]   f2sdram_awsize,                     //                         .awsize
		input  wire         f2sdram_awvalid,                    //                         .awvalid
		output wire [4:0]   f2sdram_bid,                        //                         .bid
		input  wire         f2sdram_bready,                     //                         .bready
		output wire [1:0]   f2sdram_bresp,                      //                         .bresp
		output wire         f2sdram_bvalid,                     //                         .bvalid
		output wire [63:0]  f2sdram_rdata,                      //                         .rdata
		output wire [4:0]   f2sdram_rid,                        //                         .rid
		output wire         f2sdram_rlast,                      //                         .rlast
		input  wire         f2sdram_rready,                     //                         .rready
		output wire [1:0]   f2sdram_rresp,                      //                         .rresp
		output wire         f2sdram_rvalid,                     //                         .rvalid
		input  wire [63:0]  f2sdram_wdata,                      //                         .wdata
		input  wire         f2sdram_wlast,                      //                         .wlast
		output wire         f2sdram_wready,                     //                         .wready
		input  wire [7:0]   f2sdram_wstrb,                      //                         .wstrb
		input  wire         f2sdram_wvalid,                     //                         .wvalid
		input  wire [7:0]   f2sdram_aruser,                     //                         .aruser
		input  wire [7:0]   f2sdram_awuser,                     //                         .awuser
		input  wire [7:0]   f2sdram_wuser,                      //                         .wuser
		output wire [7:0]   f2sdram_buser,                      //                         .buser
		input  wire [3:0]   f2sdram_arregion,                   //                         .arregion
		output wire [7:0]   f2sdram_ruser,                      //                         .ruser
		input  wire [3:0]   f2sdram_awregion,                   //                         .awregion
		input  wire         fpga2hps_clock_clk,                 //           fpga2hps_clock.clk
		input  wire         fpga2hps_reset_reset_n,             //           fpga2hps_reset.reset_n
		input  wire [4:0]   fpga2hps_awid,                      //                 fpga2hps.awid
		input  wire [30:0]  fpga2hps_awaddr,                    //                         .awaddr
		input  wire [7:0]   fpga2hps_awlen,                     //                         .awlen
		input  wire [2:0]   fpga2hps_awsize,                    //                         .awsize
		input  wire [2:0]   fpga2hps_arsize,                    //                         .arsize
		input  wire [1:0]   fpga2hps_awburst,                   //                         .awburst
		input  wire         fpga2hps_awlock,                    //                         .awlock
		input  wire [3:0]   fpga2hps_awcache,                   //                         .awcache
		input  wire [2:0]   fpga2hps_awprot,                    //                         .awprot
		input  wire [3:0]   fpga2hps_awqos,                     //                         .awqos
		input  wire         fpga2hps_awvalid,                   //                         .awvalid
		output wire         fpga2hps_awready,                   //                         .awready
		input  wire [255:0] fpga2hps_wdata,                     //                         .wdata
		input  wire [31:0]  fpga2hps_wstrb,                     //                         .wstrb
		input  wire         fpga2hps_wlast,                     //                         .wlast
		input  wire         fpga2hps_wvalid,                    //                         .wvalid
		output wire         fpga2hps_wready,                    //                         .wready
		output wire [4:0]   fpga2hps_bid,                       //                         .bid
		output wire [1:0]   fpga2hps_bresp,                     //                         .bresp
		output wire         fpga2hps_bvalid,                    //                         .bvalid
		input  wire         fpga2hps_bready,                    //                         .bready
		input  wire [4:0]   fpga2hps_arid,                      //                         .arid
		input  wire [30:0]  fpga2hps_araddr,                    //                         .araddr
		input  wire [7:0]   fpga2hps_arlen,                     //                         .arlen
		input  wire [1:0]   fpga2hps_arburst,                   //                         .arburst
		input  wire         fpga2hps_arlock,                    //                         .arlock
		input  wire [3:0]   fpga2hps_arcache,                   //                         .arcache
		input  wire [2:0]   fpga2hps_arprot,                    //                         .arprot
		input  wire [3:0]   fpga2hps_arqos,                     //                         .arqos
		input  wire         fpga2hps_arvalid,                   //                         .arvalid
		output wire         fpga2hps_arready,                   //                         .arready
		output wire [4:0]   fpga2hps_rid,                       //                         .rid
		output wire [255:0] fpga2hps_rdata,                     //                         .rdata
		output wire [1:0]   fpga2hps_rresp,                     //                         .rresp
		output wire         fpga2hps_rlast,                     //                         .rlast
		output wire         fpga2hps_rvalid,                    //                         .rvalid
		input  wire         fpga2hps_rready,                    //                         .rready
		input  wire [7:0]   fpga2hps_aruser,                    //                         .aruser
		input  wire [7:0]   fpga2hps_awuser,                    //                         .awuser
		input  wire [3:0]   fpga2hps_arregion,                  //                         .arregion
		input  wire [3:0]   fpga2hps_awregion,                  //                         .awregion
		input  wire [7:0]   fpga2hps_wuser,                     //                         .wuser
		output wire [7:0]   fpga2hps_buser,                     //                         .buser
		output wire [7:0]   fpga2hps_ruser                      //                         .ruser
	);
endmodule

