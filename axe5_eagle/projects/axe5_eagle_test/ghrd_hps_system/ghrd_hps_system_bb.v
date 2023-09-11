module ghrd_hps_system (
		output wire        emac0_mdio_mac_mdc,          //           emac0_mdio.mac_mdc
		input  wire        emac0_mdio_mac_mdi,          //                     .mac_mdi
		output wire        emac0_mdio_mac_mdo,          //                     .mac_mdo
		output wire        emac0_mdio_mac_mdoe,         //                     .mac_mdoe
		output wire        emac0_app_rst_reset_n,       //        emac0_app_rst.reset_n
		output wire        emac0_mac_tx_clk_o,          //                emac0.mac_tx_clk_o
		input  wire        emac0_mac_tx_clk_i,          //                     .mac_tx_clk_i
		input  wire        emac0_mac_rx_clk,            //                     .mac_rx_clk
		output wire        emac0_mac_rst_tx_n,          //                     .mac_rst_tx_n
		output wire        emac0_mac_rst_rx_n,          //                     .mac_rst_rx_n
		output wire        emac0_mac_txen,              //                     .mac_txen
		output wire        emac0_mac_txer,              //                     .mac_txer
		input  wire        emac0_mac_rxdv,              //                     .mac_rxdv
		input  wire        emac0_mac_rxer,              //                     .mac_rxer
		input  wire [7:0]  emac0_mac_rxd,               //                     .mac_rxd
		input  wire        emac0_mac_col,               //                     .mac_col
		input  wire        emac0_mac_crs,               //                     .mac_crs
		output wire [2:0]  emac0_mac_speed,             //                     .mac_speed
		output wire [7:0]  emac0_mac_txd_o,             //                     .mac_txd_o
		output wire        emac2_app_rst_reset_n,       //        emac2_app_rst.reset_n
		input  wire        spim0_miso_i,                //                spim0.miso_i
		output wire        spim0_mosi_o,                //                     .mosi_o
		output wire        spim0_mosi_oe,               //                     .mosi_oe
		input  wire        spim0_ss_in_n,               //                     .ss_in_n
		output wire        spim0_ss0_n_o,               //                     .ss0_n_o
		output wire        spim0_ss1_n_o,               //                     .ss1_n_o
		output wire        spim0_ss2_n_o,               //                     .ss2_n_o
		output wire        spim0_ss3_n_o,               //                     .ss3_n_o
		output wire        spim0_sclk_out_clk,          //       spim0_sclk_out.clk
		input  wire        i2c1_scl_i_clk,              //           i2c1_scl_i.clk
		output wire        i2c1_scl_oe_clk,             //          i2c1_scl_oe.clk
		input  wire        i2c1_sda_i,                  //                 i2c1.sda_i
		output wire        i2c1_sda_oe,                 //                     .sda_oe
		input  wire        hps_io_hps_osc_clk,          //               hps_io.hps_osc_clk
		inout  wire        hps_io_sdmmc_data0,          //                     .sdmmc_data0
		inout  wire        hps_io_sdmmc_data1,          //                     .sdmmc_data1
		output wire        hps_io_sdmmc_cclk,           //                     .sdmmc_cclk
		inout  wire        hps_io_sdmmc_data2,          //                     .sdmmc_data2
		inout  wire        hps_io_sdmmc_data3,          //                     .sdmmc_data3
		inout  wire        hps_io_sdmmc_cmd,            //                     .sdmmc_cmd
		input  wire        hps_io_usb1_clk,             //                     .usb1_clk
		output wire        hps_io_usb1_stp,             //                     .usb1_stp
		input  wire        hps_io_usb1_dir,             //                     .usb1_dir
		inout  wire        hps_io_usb1_data0,           //                     .usb1_data0
		inout  wire        hps_io_usb1_data1,           //                     .usb1_data1
		input  wire        hps_io_usb1_nxr,             //                     .usb1_nxr
		inout  wire        hps_io_usb1_data2,           //                     .usb1_data2
		inout  wire        hps_io_usb1_data3,           //                     .usb1_data3
		inout  wire        hps_io_usb1_data4,           //                     .usb1_data4
		inout  wire        hps_io_usb1_data5,           //                     .usb1_data5
		inout  wire        hps_io_usb1_data6,           //                     .usb1_data6
		inout  wire        hps_io_usb1_data7,           //                     .usb1_data7
		output wire        hps_io_emac2_tx_clk,         //                     .emac2_tx_clk
		output wire        hps_io_emac2_tx_ctl,         //                     .emac2_tx_ctl
		input  wire        hps_io_emac2_rx_clk,         //                     .emac2_rx_clk
		input  wire        hps_io_emac2_rx_ctl,         //                     .emac2_rx_ctl
		output wire        hps_io_emac2_txd0,           //                     .emac2_txd0
		output wire        hps_io_emac2_txd1,           //                     .emac2_txd1
		input  wire        hps_io_emac2_rxd0,           //                     .emac2_rxd0
		input  wire        hps_io_emac2_rxd1,           //                     .emac2_rxd1
		output wire        hps_io_emac2_txd2,           //                     .emac2_txd2
		output wire        hps_io_emac2_txd3,           //                     .emac2_txd3
		input  wire        hps_io_emac2_rxd2,           //                     .emac2_rxd2
		input  wire        hps_io_emac2_rxd3,           //                     .emac2_rxd3
		inout  wire        hps_io_mdio2_mdio,           //                     .mdio2_mdio
		output wire        hps_io_mdio2_mdc,            //                     .mdio2_mdc
		output wire        hps_io_uart0_tx,             //                     .uart0_tx
		input  wire        hps_io_uart0_rx,             //                     .uart0_rx
		inout  wire        hps_io_i2c0_sda,             //                     .i2c0_sda
		inout  wire        hps_io_i2c0_scl,             //                     .i2c0_scl
		inout  wire        hps_io_gpio6,                //                     .gpio6
		inout  wire        hps_io_gpio7,                //                     .gpio7
		inout  wire        hps_io_gpio8,                //                     .gpio8
		inout  wire        hps_io_gpio9,                //                     .gpio9
		inout  wire        hps_io_gpio10,               //                     .gpio10
		inout  wire        hps_io_gpio11,               //                     .gpio11
		inout  wire        hps_io_gpio28,               //                     .gpio28
		inout  wire        hps_io_gpio34,               //                     .gpio34
		inout  wire        hps_io_gpio35,               //                     .gpio35
		input  wire        usb31_io_vbus_det,           //             usb31_io.vbus_det
		input  wire        usb31_io_flt_bar,            //                     .flt_bar
		output wire [1:0]  usb31_io_usb_ctrl,           //                     .usb_ctrl
		input  wire        usb31_io_usb31_id,           //                     .usb31_id
		input  wire        bank3a_lpddr4_refclk_clk,    // bank3a_lpddr4_refclk.clk
		output wire        bank3a_lpddr4_mem_ck_t,      //        bank3a_lpddr4.mem_ck_t
		output wire        bank3a_lpddr4_mem_ck_c,      //                     .mem_ck_c
		output wire        bank3a_lpddr4_mem_cke,       //                     .mem_cke
		output wire        bank3a_lpddr4_mem_reset_n,   //                     .mem_reset_n
		output wire        bank3a_lpddr4_mem_cs,        //                     .mem_cs
		output wire [5:0]  bank3a_lpddr4_mem_ca,        //                     .mem_ca
		inout  wire [31:0] bank3a_lpddr4_mem_dq,        //                     .mem_dq
		inout  wire [3:0]  bank3a_lpddr4_mem_dqs_t,     //                     .mem_dqs_t
		inout  wire [3:0]  bank3a_lpddr4_mem_dqs_c,     //                     .mem_dqs_c
		inout  wire [3:0]  bank3a_lpddr4_mem_dmi,       //                     .mem_dmi
		input  wire        bank3a_lpddr4_oct_oct_rzqin, //    bank3a_lpddr4_oct.oct_rzqin
		input  wire        sys_reset_reset,             //            sys_reset.reset
		input  wire [7:0]  niosv_cruvi_ls_0_in_port,    //     niosv_cruvi_ls_0.in_port
		output wire [7:0]  niosv_cruvi_ls_0_out_port,   //                     .out_port
		input  wire [7:0]  niosv_cruvi_ls_1_in_port,    //     niosv_cruvi_ls_1.in_port
		output wire [7:0]  niosv_cruvi_ls_1_out_port,   //                     .out_port
		input  wire [1:0]  niosv_fpga_dipsw_export,     //     niosv_fpga_dipsw.export
		input  wire [1:0]  niosv0_fpga_pb_export,       //       niosv0_fpga_pb.export
		input  wire        niosv_hdmi_i2c_sda_in,       //       niosv_hdmi_i2c.sda_in
		input  wire        niosv_hdmi_i2c_scl_in,       //                     .scl_in
		output wire        niosv_hdmi_i2c_sda_oe,       //                     .sda_oe
		output wire        niosv_hdmi_i2c_scl_oe,       //                     .scl_oe
		output wire [2:0]  niosv_rgb_led0_export,       //       niosv_rgb_led0.export
		output wire [2:0]  niosv_rgb_led1_export,       //       niosv_rgb_led1.export
		output wire [2:0]  niosv_rgb_led2_export,       //       niosv_rgb_led2.export
		output wire [2:0]  niosv_rgb_led3_export,       //       niosv_rgb_led3.export
		input  wire [1:0]  dipsw_export,                //                dipsw.export
		input  wire [1:0]  pb_export,                   //                   pb.export
		output wire [2:0]  rgb_led0_export,             //             rgb_led0.export
		output wire [2:0]  rgb_led1_export,             //             rgb_led1.export
		output wire [2:0]  rgb_led2_export,             //             rgb_led2.export
		output wire [2:0]  rgb_led3_export,             //             rgb_led3.export
		output wire        hdmi_h_clk,                  //                 hdmi.h_clk
		output wire        hdmi_h16_hsync,              //                     .h16_hsync
		output wire        hdmi_h16_vsync,              //                     .h16_vsync
		output wire        hdmi_h16_data_e,             //                     .h16_data_e
		output wire [15:0] hdmi_h16_data,               //                     .h16_data
		output wire [15:0] hdmi_h16_es_data,            //                     .h16_es_data
		output wire        hdmi_h24_hsync,              //                     .h24_hsync
		output wire        hdmi_h24_vsync,              //                     .h24_vsync
		output wire        hdmi_h24_data_e,             //                     .h24_data_e
		output wire [23:0] hdmi_h24_data,               //                     .h24_data
		output wire        hdmi_h36_hsync,              //                     .h36_hsync
		output wire        hdmi_h36_vsync,              //                     .h36_vsync
		output wire        hdmi_h36_data_e,             //                     .h36_data_e
		output wire [35:0] hdmi_h36_data,               //                     .h36_data
		input  wire        hdmi_pll_refclk_clk          //      hdmi_pll_refclk.clk
	);
endmodule

