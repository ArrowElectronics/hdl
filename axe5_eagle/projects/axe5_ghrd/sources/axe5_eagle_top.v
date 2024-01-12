`timescale 1ns/10ps

`define wHPS_UART0
`define wHPS_I2C0
`define wHPS_EMAC2
`define wHPS_USB
`define wHPS_PB
`define wHPS_DIPSW
`define wHPS_SD
`define wHPS
`define wHPS_LED0
`define wHPS_LED1

//`define wFAB_EMAC
`define wRGB_LED0
`define wRGB_LED1
`define wRGB_LED2
`define wRGB_LED3
`define wFAB_PB
`define wFAB_DIPSW
//`define wFAB_I2C1
`define wFAB_QSPI
`define wADDA
//`define wHDMI
//`define wLPDDR4B
`define wLPDDR4A //EMIF HPS
//`define wFMC
//`define wCRUVI_HS_1
//`define wCRUVI_HS_2
//`define wCRUVI_LS_1
//`define wCRUVI_LS_2
//`define wSFP10G_1
//`define wSFP10G_2
//`define wFMC_XCVRS
//`define wPCIe


module axe5_eagle_top (
   `ifdef wHPS_LED0
	inout         HPS_LED0,
   `endif
   `ifdef wHPS_LED1
	inout         HPS_LED1,
   `endif
   `ifdef wHPS_UART0
   output        HPS_UART0_TX,
   input         HPS_UART0_RX,
   `endif
   `ifdef wHPS_I2C0
   inout         HPS_I2C0_SDA,
   inout         HPS_I2C0_SCL,
   `endif
   `ifdef wHPS_USB
   inout [7:0]   USB_DATA,
   input         USB_CLK, USB_NXT, USB_DIR,
   output        USB_STP, 
   inout		 USB_RST,
   output        USB_SSTX_p, USB_SSTX_n, 
   input         USB_SSRX_p, USB_SSRX_n, 
   input         USB_REFCLK_p, USB_REFCLK_n, 
   output		 USB_HUB_RST,   
   `endif
   `ifdef wHPS_SD
   output        SD_CLK,
   inout		 SD_CMD,
   inout         SD_DETECT,
   inout  [3:0]  SD_DAT,
   `endif
   `ifdef wHPS
   inout [1:0]   HPS_PB,
   inout 	     HPS_DIPSW[0:0],
   `endif
   

   `ifdef wFAB_I2C1
   inout         MUX_I2C_SDA,
   inout         MUX_I2C_SCL, MUX_I2C_INT,
   `endif
   `ifdef wADDA
   output        ADDA_CLK, ADDA_DIN, ADDA_SYNC, ADDA_RST,
   input         ADDA_DOUT,
   `endif
   `ifdef wFAB_EMAC
   output        ETH1_RST, ETH1_TXCK, ETH1_TXCTL,
   output [3:0]  ETH1_TXD,
   input         ETH1_RXCK, ETH1_RXCTL,
   input  [3:0]  ETH1_RXD,
   output        ETH1_MDC,
   inout         ETH1_MDIO,
   `endif
   `ifdef wHPS_EMAC2
   inout         HPS_ETH2_RST, 
   output        HPS_ETH2_TXCK, HPS_ETH2_TXCTL,
   output [3:0]  HPS_ETH2_TXD,
   input         HPS_ETH2_RXCK, HPS_ETH2_RXCTL,
   input  [3:0]  HPS_ETH2_RXD,
   output        HPS_ETH2_MDC,
   inout         HPS_ETH2_MDIO,
   `endif
   `ifdef wRGB_LED0
   inout        LED0R, LED0G, LED0B,
   `endif
   `ifdef wRGB_LED1
   output        LED1R, LED1G, LED1B,
   `endif
   `ifdef wRGB_LED2
   output        LED2R, LED2G, LED2B,
   `endif

   `ifdef wRGB_LED3
   output        LED3R, LED3G, LED3B,
   `endif
   `ifdef wFAB_PB
   input [1:0]   FPGA_PB,
   `endif
   `ifdef wFAB_DIPSW
   input [1:0]   FPGA_DIPSW,
   `endif
   `ifdef wHDMI
   output        HDMI_VS, HDMI_HS, HDMI_CLK, HDMI_DE, CT_HPD, HDMI_SPDIF,
   input         HDMI_INT,
   output [23:0] HDMI_D,
   `endif
   `ifdef wLPDDR4A
   output        LPDDR4A_CK_P, LPDDR4A_CK_N, LPDDR4A_RST, 
	input         LPDDR4A_REFCK_p,
   output [5:0]  LPDDR4A_CA,
   output	     LPDDR4A_CKE, LPDDR4A_CS_N,
   inout  [31:0] LPDDR4A_DQ,
   inout         LPDDR4A_DQSA1_p, LPDDR4A_DQSA1_n, LPDDR4A_DQSA0_p, LPDDR4A_DQSA0_n,
   inout         LPDDR4A_DQSB1_p, LPDDR4A_DQSB1_n, LPDDR4A_DQSB0_p, LPDDR4A_DQSB0_n,
   inout         LPDDR4A_DMB1, LPDDR4A_DMB0, LPDDR4A_DMA1, LPDDR4A_DMA0,
   input         LPDDR4A_OCT_RZQIN,
   `endif
   `ifdef wLPDDR4B
   output        LPDDR4B_CK_P, LPDDR4B_CK_N, LPDDR4B_RST, 
	input         LPDDR4B_REFCK_p,
   output [5:0]  LPDDR4B_CA,
   output		  LPDDR4B_CKE, LPDDR4B_CS_N,
   inout  [31:0] LPDDR4B_DQ,
   inout         LPDDR4B_DQSA1_p, LPDDR4B_DQSA1_n, LPDDR4B_DQSA0_p, LPDDR4B_DQSA0_n,
   inout         LPDDR4B_DQSB1_p, LPDDR4B_DQSB1_n, LPDDR4B_DQSB0_p, LPDDR4B_DQSB0_n,
   inout         LPDDR4B_DMB1, LPDDR4B_DMB0, LPDDR4B_DMA1, LPDDR4B_DMA0,
   input         LPDDR4B_OCT_RZQIN,
   `endif
   `ifdef wFMC
	output        FMC_REFCK_C2M_p, FMC_SYNC_C2M_p, FMC_REFCK_C2M_n, FMC_SYNC_C2M_n,
	input         FMC_REFCK_M2C_p, FMC_CLK0_M2C_p, FMC_CLK1_M2C_p,
	input         FMC_REFCK_M2C_n, FMC_CLK0_M2C_n, FMC_CLK1_M2C_n,
   inout         LA00_p, LA01_p, LA02_p, LA03_p, LA04_p, LA05_p, LA06_p,
   inout         LA07_p, LA08_p, LA09_p, LA10_p, LA11_p, LA12_p, LA13_p,
   inout         LA14_p, LA15_p, LA16_p, LA17_p, LA18_p, LA19_p, LA20_p,
   inout         LA21_p, LA22_p, LA23_p, LA24_p, LA25_p, LA26_p, LA27_p,
   inout         LA28_p, LA29_p, LA30_p, LA31_p, LA32_p, LA33_p,
   inout         LA00_n, LA01_n, LA02_n, LA03_n, LA04_n, LA05_n, LA06_n,
   inout         LA07_n, LA08_n, LA09_n, LA10_n, LA11_n, LA12_n, LA13_n,
   inout         LA14_n, LA15_n, LA16_n, LA17_n, LA18_n, LA19_n, LA20_n,
   inout         LA21_n, LA22_n, LA23_n, LA24_n, LA25_n, LA26_n, LA27_n,
   inout         LA28_n, LA29_n, LA30_n, LA31_n, LA32_n, LA33_n,
   `endif
	`ifdef wFMC_XCVRS
	input  [1:0]  FMC_GBTCLK_p, FMC_GBTCLK_n,
	input  [1:0]  FMC_GT_CK_p, FMC_GT_CK_n,
	input  [7:0]  DP_M2C_p, DP_M2C_n,
	output [7:0]  DP_C2M_p, DP_C2M_n,
	`endif
	
	`ifdef wPCIe
	input         PCIE_CLK_p, PCIE_CLK_n,
	input         PCIE_100M_CK_p, PCIE_100M_CK_n,
	input  [3:0]  PET_p, PET_n,
	output [3:0]  PER_p, PER_n,
	`endif
	`ifdef wCRUVI_HS_1
	inout         CX_SMB_ALERT,
	inout         CX_SMB_SDA,
	inout         CX_SMB_SCL,
	input         CX_REFCLK,
	inout         CX_HSIO,
	inout         CX_HSO, CX_RESET,
	input         CX_HSI,
	inout         CX_B0_p, CX_B1_p, CX_B2_p, CX_B3_p, CX_B4_p, CX_B5_p,
	inout         CX_B0_n, CX_B1_n, CX_B2_n, CX_B3_n, CX_B4_n, CX_B5_n,
	inout         CX_A0_p, CX_A1_p, CX_A2_p, CX_A3_p, CX_A4_p, CX_A5_p,
	inout         CX_A0_n, CX_A1_n, CX_A2_n, CX_A3_n, CX_A4_n, CX_A5_n,
   `endif
	`ifdef wCRUVI_HS_2
	inout         CY_SMB_ALERT,
	inout         CY_SMB_SDA,
	inout         CY_SMB_SCL,
	input         CY_REFCLK,
	inout         CY_HSIO,
	inout         CY_HSO, CY_RESET,
	input         CY_HSI,
	inout         CY_B0_p, CY_B1_p, CY_B2_p, CY_B3_p, CY_B4_p, CY_B5_p,
	inout         CY_B0_n, CY_B1_n, CY_B2_n, CY_B3_n, CY_B4_n, CY_B5_n,
	inout         CY_A0_p, CY_A1_p, CY_A2_p, CY_A3_p, CY_A4_p, CY_A5_p,
	inout         CY_A0_n, CY_A1_n, CY_A2_n, CY_A3_n, CY_A4_n, CY_A5_n,
   `endif
	`ifdef wCRUVI_LS_1
	inout  [7:0]  CRUVI_LS_B,
   `endif
	`ifdef wCRUVI_LS_2
	inout  [7:0]  CRUVI_LS_C,
   `endif
	`ifdef wFAB_QSPI
	output        FPGA_QSPI_CS, FPGA_QSPI_CLK, FPGA_QSPI_RST,
	inout [3:0]   FPGA_QSPI_D,
   `endif
	`ifdef wSFP10G_1
	output        SFPA_TD_p, SFPA_TD_n,
	output        SFPA_RD_p, SFPA_RD_n,
	`endif
	`ifdef wSFP10G_1
	output        SFPB_TD_p, SFPB_TD_n,
	output        SFPB_RD_p, SFPB_RD_n,
	`endif
	
	input         SFP_REFCLK_p, SFP_REFCLK_n,

	input         REFCLK_3B0_p, REFCLK_3B0_n,
   input         FPGA_RST,
   inout         PWR_SDA,
   inout         PWR_SCL,
   input         SDM_CLK_25MHz,
   input         HPS_COLD_RST,
   input         HPS_OSC_CLK_25MHz
   
);

   //wire  [3:0] LPDDR4B_DQS_p, LPDDR4B_DQS_n, LPDDR4B_DMI;
   //assign      LPDDR4B_DQS_p[3:2] = LPDDR4B_DQSA_p;
   //assign      LPDDR4B_DQS_p[1:0] = LPDDR4B_DQSB_p;
   //assign      LPDDR4B_DQS_n[3:2] = LPDDR4B_DQSA_n;
   //assign      LPDDR4B_DQS_n[1:0] = LPDDR4B_DQSB_n;
   //assign      LPDDR4B_DMI   = {LPDDR4B_DMA, LPDDR4B_DMB};
   
// comment if not using LEDs
	wire [11:0] led;
	
   `ifdef wRGB_LED0
	wire [2:0] rgb_led0;

   assign LED0R = rgb_led0[2];
   assign LED0G = rgb_led0[1];
   assign LED0B = rgb_led0[0];
   `endif
   `ifdef wRGB_LED1
	wire [2:0] rgb_led1;

   assign LED1R = rgb_led1[2];
   assign LED1G = rgb_led1[1];
   assign LED1B = rgb_led1[0];
   `endif
   `ifdef wRGB_LED2
	wire [2:0] rgb_led2;

   assign LED2R = rgb_led2[2];
   assign LED2G = rgb_led2[1];
   assign LED2B = rgb_led2[0];
   `endif
   `ifdef wRGB_LED3
	wire [2:0] rgb_led3;

   assign LED3R = rgb_led3[2];
   assign LED3G = rgb_led3[1];
   assign LED3B = rgb_led3[0];
   `endif

   `ifdef wFAB_EMAC
   wire        emac0_txen, emac0_txer, emac0_rxdv, emac0_rxer, emac0_col, emac0_crs, emac0_txclk, emac0_rxclk, emac0_tx_clk_o;
   wire        emac0_rst_rx_n, emac0_rst_tx_n, emac0_app_rst_reset_n, emac0_mdio_mdc, emac0_mdio_di, emac0_mdio_mdo, emac0_mdio_oe;
   wire [7:0]  emac0_rxd, emac0_txd;
   wire [2:0]  emac0_speed;
   wire        pll_25M_clk, pll_2p5M_clk, pll_50M_clk, pll_5M_clk;
	
   assign ETH1_MDIO = emac0_mdio_oe ? emac0_mdio_mdo : 1'bz;
   assign emac0_mdio_di = ETH1_MDIO;
   
    gmii2rgmii gmii2rgmii_shim (
        .hps_gmii_mac_tx_clk_o  (emac0_tx_clk_o),
        .hps_gmii_mac_rst_tx_n  (emac0_rst_tx_n),
        .hps_gmii_mac_rst_rx_n  (emac0_rst_rx_n),
        .hps_gmii_mac_txd_o     (emac0_txd),
        .hps_gmii_mac_txen      (emac0_txen),
        .hps_gmii_mac_txer      (emac0_txer),
        .hps_gmii_mac_speed     (emac0_speed),
        .hps_gmii_mac_tx_clk_i  (emac0_txclk),
        .hps_gmii_mac_rx_clk    (emac0_rxclk),
        .hps_gmii_mac_rxdv      (emac0_rxdv),
        .hps_gmii_mac_rxer      (emac0_rxer),
        .hps_gmii_mac_rxd       (emac0_rxd),
        .hps_gmii_mac_col       (emac0_col),
        .hps_gmii_mac_crs       (emac0_crs),
        .phy_rgmii_rgmii_rx_clk (ETH1_RXCK),
        .phy_rgmii_rgmii_rxd    (ETH1_RXD),
        .phy_rgmii_rgmii_tx_clk (ETH1_TXCK),
        .phy_rgmii_rgmii_txd    (ETH1_TXD),
        .phy_rgmii_rgmii_tx_ctl (ETH1_TXTL),
        .pll_50m_clock_clk      (pll_50M_clk),
        .pll_5m_clock_clk       (pll_5M_clk),
        .pll_25m_clock_clk      (pll_25M_clk),
        .pll_2_5m_clock_clk     (pll_2p5M_clk),
        .peri_reset_reset       (!emac0_app_rst_reset_n),
        .peri_clock_clk         (_connected_to_peri_clock_clk_)
    );
	 
	     gmii2rgmii_pll gmii2rgmii_iopll (
        .refclk   (SDM_CLK_25MHz),   //   input,  width = 1,  refclk.clk
        .locked   (),   //  output,  width = 1,  locked.export
        .rst      (HPS_COLD_RST),      //   input,  width = 1,   reset.reset
        .outclk_0 (pll_25M_clk),      //  25MHz clock
        .outclk_1 (pll_2p5M_clk),     //  2.5MHz clock
        .outclk_2 (pll_50M_clk),      //  50MHz clock
        .outclk_3 (pll_5M_clk)        //  5MHz clock
    );

   `endif

   `ifdef wFAB_I2C1
   wire     i2c1_scl_i_clk, i2c1_scl_oe_clk , i2c1_sda_i, i2c1_sda_oe;

   assign   MUX_I2C_SCL    = i2c1_scl_oe_clk ? 1'b0 : 1'bz;
   assign   i2c1_scl_i_clk = MUX_I2C_SCL;
   assign   MUX_I2C_SDA    = i2c1_sda_oe ? 1'b0 : 1'bz;
   assign   i2c1_sda_i     = MUX_I2C_SDA;
   `endif

	wire     osc_clock_bridge_out;
	
	//EG aggregates 
	wire o_src_rs_grant;    //         rsif.src_rs_grant,    SRC_GRANT
	wire i_src_rs_priority; //             .src_rs_priority, PRIORITY BIT
	wire i_src_rs_req;      //             .src_rs_req,      SRC_REQ
	wire o_pma_cu_clk;       // o_pma_cu_clk.clk,             PMA clock from PLL for proper calculation. For simulation only
	
	gts_reset_seq gts_reset_seq (
		.o_src_rs_grant(o_src_rs_grant),
		.i_src_rs_priority(i_src_rs_priority),
		.i_src_rs_req(i_src_rs_req),
		.o_pma_cu_clk(o_pma_cu_clk)
	);

	// Instantiate HPS system from Plaform Designer
    ghrd_hps_system hps_system (
        //.sys_clk_clk              (HPS_OSC_CLK_25MHz),
		  //.osc_clock_bridge_out_clk (osc_clock_bridge_out),
      `ifdef wHDMI
        .hdmi_pll_refclk_clk      (REFCLK_3B0_p),
        .hdmi_h_clk               (HDMI_CLK),
        .hdmi_h16_hsync           (),
        .hdmi_h16_vsync           (),
        .hdmi_h16_data_e          (),
        .hdmi_h16_data            (),
        .hdmi_h16_es_data         (),
        .hdmi_h24_hsync           (HDMI_HS),
        .hdmi_h24_vsync           (HDMI_VS),
        .hdmi_h24_data_e          (HDMI_DE),
        .hdmi_h24_data            (HDMI_D),
        .hdmi_h36_hsync           (),
        .hdmi_h36_vsync           (),
        .hdmi_h36_data_e          (),
        .hdmi_h36_data            (),
		`endif
      `ifdef wFAB_DIPSW
        .dipsw_export             (FPGA_DIPSW),
      `endif
      `ifdef wFAB_PB
        .pb_export                (FPGA_PB),
      `endif
        .sys_reset_reset          (HPS_COLD_RST),
      `ifdef wRGB_LED0
        .rgb_led0_export          (rgb_led0),
      `endif
      `ifdef wRGB_LED1
        .rgb_led1_export          (rgb_led1),
      `endif
      `ifdef wRGB_LED2
        .rgb_led2_export          (rgb_led2),
      `endif
      `ifdef wRGB_LED3
        .rgb_led3_export          (rgb_led3),
      `endif
      `ifdef wFAB_EMAC
        .emac0_mdio_mac_mdc       (emac0_mdio_mdc),
        .emac0_mdio_mac_mdi       (emac0_mdio_di),
        .emac0_mdio_mac_mdo       (emac0_mdio_mdo),
        .emac0_mdio_mac_mdoe      (emac0_mdio_oe),
        .emac0_app_rst_reset_n    (emac0_app_rst_reset_n),
        .emac0_mac_tx_clk_o       (emac0_tx_clk_o),
        .emac0_mac_tx_clk_i       (emac0_txclk),
        .emac0_mac_rx_clk         (emac0_rxclk),
        .emac0_mac_rst_tx_n       (emac0_rst_tx_n),
        .emac0_mac_rst_rx_n       (emac0_rst_rx_n),
        .emac0_mac_txen           (emac0_txen),
        .emac0_mac_txer           (emac0_txer),
        .emac0_mac_rxdv           (emac0_rxdv),
        .emac0_mac_rxer           (emac0_rxer),
        .emac0_mac_rxd            (emac0_rxd),
        .emac0_mac_col            (emac0_col),
        .emac0_mac_crs            (emac0_crs),
        .emac0_mac_speed          (emac0_speed),
        .emac0_mac_txd_o          (emac0_txd),
      `endif
      `ifdef wADDA
        .spim0_miso_i             (ADDA_DOUT),
        .spim0_mosi_o             (ADDA_DIN),
        .spim0_mosi_oe            (),
        .spim0_ss_in_n            (1'b1),
        .spim0_ss0_n_o            (ADDA_SYNC),
        .spim0_ss1_n_o            (),
        .spim0_sclk_out_clk       (ADDA_CLK),
        .spim0_ss2_n_o            (),
        .spim0_ss3_n_o            (),
       `endif
		`ifdef wFAB_I2C1
        .i2c1_scl_i_clk           (i2c1_scl_i_clk),
        .i2c1_scl_oe_clk          (i2c1_scl_oe_clk),
        .i2c1_sda_i               (i2c1_sda_i),
        .i2c1_sda_oe              (i2c1_sda_oe),
      `endif
        .hps_io_hps_osc_clk       (HPS_OSC_CLK_25MHz),
        .hps_io_sdmmc_data0       (SD_DAT[0]),
        .hps_io_sdmmc_data1       (SD_DAT[1]),
        .hps_io_sdmmc_cclk        (SD_CLK),
        .hps_io_sdmmc_data2       (SD_DAT[2]),
        .hps_io_sdmmc_data3       (SD_DAT[3]),
        .hps_io_sdmmc_cmd         (SD_CMD),
      `ifdef wHPS_EMAC2
        .hps_io_emac2_tx_clk      (HPS_ETH2_TXCK),
        .hps_io_emac2_tx_ctl      (HPS_ETH2_TXCTL),
        .hps_io_emac2_rx_clk      (HPS_ETH2_RXCK),
        .hps_io_emac2_rx_ctl      (HPS_ETH2_RXCTL),
        .hps_io_emac2_txd0        (HPS_ETH2_TXD[0]),
        .hps_io_emac2_txd1        (HPS_ETH2_TXD[1]),
        .hps_io_emac2_rxd0        (HPS_ETH2_RXD[0]),
        .hps_io_emac2_rxd1        (HPS_ETH2_RXD[1]),
        .hps_io_emac2_txd2        (HPS_ETH2_TXD[2]),
        .hps_io_emac2_txd3        (HPS_ETH2_TXD[3]),
        .hps_io_emac2_rxd2        (HPS_ETH2_RXD[2]),
        .hps_io_emac2_rxd3        (HPS_ETH2_RXD[3]),
        .hps_io_mdio2_mdio        (HPS_ETH2_MDIO),
        .hps_io_mdio2_mdc         (HPS_ETH2_MDC),
        .emac2_app_rst_reset_n    (),
      `endif
      `ifdef wHPS_UART0
        .hps_io_uart0_tx          (HPS_UART0_TX),
        .hps_io_uart0_rx          (HPS_UART0_RX),
      `endif
      `ifdef wHPS_I2C0
        .hps_io_i2c0_sda          (HPS_I2C0_SDA),
        .hps_io_i2c0_scl          (HPS_I2C0_SCL),
      `endif
      `ifdef wHPS_USB
        .usb31_io_vbus_det        (1'b1),
        .usb31_io_flt_bar         (1'b1),
        .usb31_io_usb_ctrl        (),
        .usb31_io_usb31_id        (1'b1),
        .hps_io_usb1_clk          (USB_CLK),
        .hps_io_usb1_stp          (USB_STP),
        .hps_io_usb1_dir          (USB_DIR),
        .hps_io_usb1_data0        (USB_DATA[0]),
        .hps_io_usb1_data1        (USB_DATA[1]),
        .hps_io_usb1_nxt          (USB_NXT),
        .hps_io_usb1_data2        (USB_DATA[2]),
        .hps_io_usb1_data3        (USB_DATA[3]),
        .hps_io_usb1_data4        (USB_DATA[4]),
        .hps_io_usb1_data5        (USB_DATA[5]),
        .hps_io_usb1_data6        (USB_DATA[6]),
        .hps_io_usb1_data7        (USB_DATA[7]),
		  // EG aggregates
			.usb31_phy_pma_cpu_clk_clk(o_pma_cu_clk),              //    usb31_phy_pma_cpu_clk.clk --to reset seq.
			.usb31_phy_refclk_p_clk(USB_REFCLK_p),                 //       usb31_phy_refclk_p.clk
			.usb31_phy_refclk_n_clk(USB_REFCLK_n),                 //       usb31_phy_refclk_n.clk
			.usb31_phy_rx_serial_n_i_rx_serial_n(USB_SSRX_n),    //    usb31_phy_rx_serial_n.i_rx_serial_n
			.usb31_phy_rx_serial_p_i_rx_serial_p(USB_SSRX_p),    //    usb31_phy_rx_serial_p.i_rx_serial_p
			.usb31_phy_tx_serial_n_o_tx_serial_n(USB_SSTX_n),    //    usb31_phy_tx_serial_n.o_tx_serial_n
			.usb31_phy_tx_serial_p_o_tx_serial_p(USB_SSTX_p),    //    usb31_phy_tx_serial_p.o_tx_serial_p
			.usb31_phy_reconfig_rst_reset(),           //   usb31_phy_reconfig_rst.reset
			.usb31_phy_reconfig_clk_clk(),             //   usb31_phy_reconfig_clk.clk
			.usb31_phy_reconfig_slave_address(),       // usb31_phy_reconfig_slave.address
			.usb31_phy_reconfig_slave_byteenable(),    //                         .byteenable
			.usb31_phy_reconfig_slave_readdatavalid(), //                         .readdatavalid
			.usb31_phy_reconfig_slave_read(),          //                         .read
			.usb31_phy_reconfig_slave_write(),         //                         .write
			.usb31_phy_reconfig_slave_readdata(),      //                         .readdata
			.usb31_phy_reconfig_slave_writedata(),     //                         .writedata
			.usb31_phy_reconfig_slave_waitrequest(),   //                         .waitrequest
		.usb_hub_rst_export		(USB_HUB_RST), 					
      `endif
      `ifdef wHPS
		 `ifdef wHPS_LED0
       .hps_io_gpio6             (HPS_LED0),
		  `endif
		 `ifdef wHPS_LED1
       .hps_io_gpio7             (HPS_LED1),
		  `endif
        .hps_io_gpio8             (HPS_PB[0]),
        .hps_io_gpio9             (HPS_PB[1]),
        .hps_io_gpio10            (HPS_DIPSW[0]),
        //.hps_io_gpio11            (HPS_DIPSW[1]),
        .hps_io_gpio28            (USB_RST),
		.hps_io_gpio34            (HPS_ETH2_RST),
        .hps_io_gpio35            (SD_DETECT),
		 `ifdef wLPDDR4A //Port names changed 
        .emif_bank3a_hps_emif_ref_clk_0_clk    (LPDDR4A_REFCK_p),
        .emif_bank3a_hps_emif_mem_0_mem_ck_t      (LPDDR4A_CK_P),
        .emif_bank3a_hps_emif_mem_0_mem_ck_c      (LPDDR4A_CK_N),
        .emif_bank3a_hps_emif_mem_0_mem_cke       (LPDDR4A_CKE),
        .emif_bank3a_hps_emif_mem_0_mem_reset_n   (LPDDR4A_RST),
        .emif_bank3a_hps_emif_mem_0_mem_cs        (LPDDR4A_CS_N),
        .emif_bank3a_hps_emif_mem_0_mem_ca        (LPDDR4A_CA), //?
        .emif_bank3a_hps_emif_mem_0_mem_dq        (LPDDR4A_DQ),
        .emif_bank3a_hps_emif_mem_0_mem_dqs_t     ({LPDDR4A_DQSB1_p, LPDDR4A_DQSB0_p, LPDDR4A_DQSA1_p, LPDDR4A_DQSA0_p}),
        .emif_bank3a_hps_emif_mem_0_mem_dqs_c     ({LPDDR4A_DQSB1_n, LPDDR4A_DQSB0_n, LPDDR4A_DQSA1_n, LPDDR4A_DQSA0_n}),
        .emif_bank3a_hps_emif_mem_0_mem_dmi       ({LPDDR4A_DMB1,LPDDR4A_DMB0,LPDDR4A_DMA1,LPDDR4A_DMA0}), //?
        .emif_bank3a_hps_emif_oct_0_oct_rzqin (LPDDR4A_OCT_RZQIN)
		 `endif
		`endif
		`ifdef wLPDDR4B
        .bank2a_lpddr4_refclk_clk    (LPDDR4B_REFCK_p),
        .bank2a_lpddr4_mem_ck_t      (LPDDR4B_CK_P),
        .bank2a_lpddr4_mem_ck_c      (LPDDR4B_CK_N),
        .bank2a_lpddr4_mem_cke       (LPDDR4B_CKE),
        .bank2a_lpddr4_mem_reset_n   (LPDDR4B_RST),
        .bank2a_lpddr4_mem_cs        (LPDDR4B_CS_N),
        .bank2a_lpddr4_mem_ca        (LPDDR4B_CA),
        .bank2a_lpddr4_mem_dq        (LPDDR4B_DQ),
        .bank2a_lpddr4_mem_dqs_t     ({LPDDR4B_DQSB1_p, LPDDR4B_DQSB0_p, LPDDR4B_DQSA1_p, LPDDR4B_DQSA0_p}),
        .bank2a_lpddr4_mem_dqs_c     ({LPDDR4B_DQSB1_n, LPDDR4B_DQSB0_n, LPDDR4B_DQSA1_n, LPDDR4B_DQSA0_n}),
        .bank2a_lpddr4_mem_dmi       ({LPDDR4B_DMB1,LPDDR4B_DMB0,LPDDR4B_DMA1,LPDDR4B_DMA0}),
        .bank2a_lpddr4_oct_oct_rzqin (LPDDR4B_OCT_RZQIN)
      `endif
    );




endmodule
