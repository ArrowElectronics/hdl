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
		inout  wire         hps_io_gpio8,                       //                         .gpio8
		inout  wire         hps_io_gpio9,                       //                         .gpio9
		inout  wire         hps_io_gpio10,                      //                         .gpio10
		inout  wire         hps_io_gpio11,                      //                         .gpio11
		inout  wire         hps_io_gpio28,                      //                         .gpio28
		inout  wire         hps_io_gpio35,                      //                         .gpio35
		input  wire         usb31_io_vbus_det,                  //                 usb31_io.vbus_det
		input  wire         usb31_io_flt_bar,                   //                         .flt_bar
		output wire [1:0]   usb31_io_usb_ctrl,                  //                         .usb_ctrl
		input  wire         usb31_io_usb31_id,                  //                         .usb31_id
		input  wire [62:0]  fpga2hps_interrupt_irq,             //       fpga2hps_interrupt.irq
		input  wire         emif0_csr_axi_clk_clk,              //        emif0_csr_axi_clk.clk
		input  wire         emif0_csr_axi_rst_reset_n,          //        emif0_csr_axi_rst.reset_n
		input  wire         emif0_csr_axi_arready,              //            emif0_csr_axi.arready
		input  wire         emif0_csr_axi_awready,              //                         .awready
		input  wire [1:0]   emif0_csr_axi_bresp,                //                         .bresp
		input  wire         emif0_csr_axi_bvalid,               //                         .bvalid
		input  wire [31:0]  emif0_csr_axi_rdata,                //                         .rdata
		input  wire [1:0]   emif0_csr_axi_rresp,                //                         .rresp
		input  wire         emif0_csr_axi_rvalid,               //                         .rvalid
		input  wire         emif0_csr_axi_wready,               //                         .wready
		output wire [31:0]  emif0_csr_axi_araddr,               //                         .araddr
		output wire         emif0_csr_axi_arvalid,              //                         .arvalid
		output wire [31:0]  emif0_csr_axi_awaddr,               //                         .awaddr
		output wire         emif0_csr_axi_awvalid,              //                         .awvalid
		output wire         emif0_csr_axi_bready,               //                         .bready
		output wire         emif0_csr_axi_rready,               //                         .rready
		output wire [31:0]  emif0_csr_axi_wdata,                //                         .wdata
		output wire [3:0]   emif0_csr_axi_wstrb,                //                         .wstrb
		output wire         emif0_csr_axi_wvalid,               //                         .wvalid
		output wire [2:0]   emif0_csr_axi_arprot,               //                         .arprot
		output wire [2:0]   emif0_csr_axi_awprot,               //                         .awprot
		input  wire         emif0_ch0_axi_clk_clk,              //        emif0_ch0_axi_clk.clk
		input  wire         emif0_ch0_axi_rst_reset_n,          //        emif0_ch0_axi_rst.reset_n
		input  wire         emif0_ch0_axi_arready,              //            emif0_ch0_axi.arready
		input  wire         emif0_ch0_axi_awready,              //                         .awready
		input  wire [6:0]   emif0_ch0_axi_bid,                  //                         .bid
		input  wire [1:0]   emif0_ch0_axi_bresp,                //                         .bresp
		input  wire         emif0_ch0_axi_bvalid,               //                         .bvalid
		input  wire [255:0] emif0_ch0_axi_rdata,                //                         .rdata
		input  wire [6:0]   emif0_ch0_axi_rid,                  //                         .rid
		input  wire         emif0_ch0_axi_rlast,                //                         .rlast
		input  wire [1:0]   emif0_ch0_axi_rresp,                //                         .rresp
		input  wire [31:0]  emif0_ch0_axi_ruser,                //                         .ruser
		input  wire         emif0_ch0_axi_rvalid,               //                         .rvalid
		input  wire         emif0_ch0_axi_wready,               //                         .wready
		output wire [43:0]  emif0_ch0_axi_araddr,               //                         .araddr
		output wire [1:0]   emif0_ch0_axi_arburst,              //                         .arburst
		output wire [6:0]   emif0_ch0_axi_arid,                 //                         .arid
		output wire [7:0]   emif0_ch0_axi_arlen,                //                         .arlen
		output wire         emif0_ch0_axi_arlock,               //                         .arlock
		output wire [3:0]   emif0_ch0_axi_arqos,                //                         .arqos
		output wire [2:0]   emif0_ch0_axi_arsize,               //                         .arsize
		output wire [13:0]  emif0_ch0_axi_aruser,               //                         .aruser
		output wire         emif0_ch0_axi_arvalid,              //                         .arvalid
		output wire [43:0]  emif0_ch0_axi_awaddr,               //                         .awaddr
		output wire [1:0]   emif0_ch0_axi_awburst,              //                         .awburst
		output wire [6:0]   emif0_ch0_axi_awid,                 //                         .awid
		output wire [7:0]   emif0_ch0_axi_awlen,                //                         .awlen
		output wire         emif0_ch0_axi_awlock,               //                         .awlock
		output wire [3:0]   emif0_ch0_axi_awqos,                //                         .awqos
		output wire [2:0]   emif0_ch0_axi_awsize,               //                         .awsize
		output wire [13:0]  emif0_ch0_axi_awuser,               //                         .awuser
		output wire         emif0_ch0_axi_awvalid,              //                         .awvalid
		output wire         emif0_ch0_axi_bready,               //                         .bready
		output wire         emif0_ch0_axi_rready,               //                         .rready
		output wire [255:0] emif0_ch0_axi_wdata,                //                         .wdata
		output wire         emif0_ch0_axi_wlast,                //                         .wlast
		output wire [31:0]  emif0_ch0_axi_wstrb,                //                         .wstrb
		output wire [31:0]  emif0_ch0_axi_wuser,                //                         .wuser
		output wire         emif0_ch0_axi_wvalid,               //                         .wvalid
		output wire [2:0]   emif0_ch0_axi_arprot,               //                         .arprot
		output wire [2:0]   emif0_ch0_axi_awprot                //                         .awprot
	);
endmodule

