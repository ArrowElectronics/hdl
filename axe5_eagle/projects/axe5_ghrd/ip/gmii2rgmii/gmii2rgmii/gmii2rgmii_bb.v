module gmii2rgmii (
		input  wire       hps_gmii_mac_tx_clk_o,     //           hps_gmii.mac_tx_clk_o
		input  wire       hps_gmii_mac_rst_tx_n,     //                   .mac_rst_tx_n
		input  wire       hps_gmii_mac_rst_rx_n,     //                   .mac_rst_rx_n
		input  wire [7:0] hps_gmii_mac_txd_o,        //                   .mac_txd_o
		input  wire       hps_gmii_mac_txen,         //                   .mac_txen
		input  wire       hps_gmii_mac_txer,         //                   .mac_txer
		input  wire [2:0] hps_gmii_mac_speed,        //                   .mac_speed
		output wire       hps_gmii_mac_tx_clk_i,     //                   .mac_tx_clk_i
		output wire       hps_gmii_mac_rx_clk,       //                   .mac_rx_clk
		output wire       hps_gmii_mac_rxdv,         //                   .mac_rxdv
		output wire       hps_gmii_mac_rxer,         //                   .mac_rxer
		output wire [7:0] hps_gmii_mac_rxd,          //                   .mac_rxd
		output wire       hps_gmii_mac_col,          //                   .mac_col
		output wire       hps_gmii_mac_crs,          //                   .mac_crs
		input  wire       phy_rgmii_rgmii_rx_clk,    //          phy_rgmii.rgmii_rx_clk
		input  wire [3:0] phy_rgmii_rgmii_rxd,       //                   .rgmii_rxd
		input  wire       phy_rgmii_rgmii_rx_ctl,    //                   .rgmii_rx_ctl
		output wire       phy_rgmii_rgmii_tx_clk,    //                   .rgmii_tx_clk
		output wire [3:0] phy_rgmii_rgmii_txd,       //                   .rgmii_txd
		output wire       phy_rgmii_rgmii_tx_ctl,    //                   .rgmii_tx_ctl
		input  wire       pll_250m_tx_clock_clk,     //  pll_250m_tx_clock.clk
		input  wire       pll_125m_tx_clock_clk,     //  pll_125m_tx_clock.clk
		input  wire       pll_25m_clock_clk,         //      pll_25m_clock.clk
		input  wire       pll_2_5m_clock_clk,        //     pll_2_5m_clock.clk
		input  wire       locked_pll_250m_tx_export, // locked_pll_250m_tx.export
		input  wire       peri_reset_reset,          //         peri_reset.reset
		input  wire       peri_clock_clk             //         peri_clock.clk
	);
endmodule

