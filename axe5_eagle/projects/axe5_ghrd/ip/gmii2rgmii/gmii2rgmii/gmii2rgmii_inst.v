	gmii2rgmii u0 (
		.hps_gmii_mac_tx_clk_o     (_connected_to_hps_gmii_mac_tx_clk_o_),     //   input,  width = 1,           hps_gmii.mac_tx_clk_o
		.hps_gmii_mac_rst_tx_n     (_connected_to_hps_gmii_mac_rst_tx_n_),     //   input,  width = 1,                   .mac_rst_tx_n
		.hps_gmii_mac_rst_rx_n     (_connected_to_hps_gmii_mac_rst_rx_n_),     //   input,  width = 1,                   .mac_rst_rx_n
		.hps_gmii_mac_txd_o        (_connected_to_hps_gmii_mac_txd_o_),        //   input,  width = 8,                   .mac_txd_o
		.hps_gmii_mac_txen         (_connected_to_hps_gmii_mac_txen_),         //   input,  width = 1,                   .mac_txen
		.hps_gmii_mac_txer         (_connected_to_hps_gmii_mac_txer_),         //   input,  width = 1,                   .mac_txer
		.hps_gmii_mac_speed        (_connected_to_hps_gmii_mac_speed_),        //   input,  width = 3,                   .mac_speed
		.hps_gmii_mac_tx_clk_i     (_connected_to_hps_gmii_mac_tx_clk_i_),     //  output,  width = 1,                   .mac_tx_clk_i
		.hps_gmii_mac_rx_clk       (_connected_to_hps_gmii_mac_rx_clk_),       //  output,  width = 1,                   .mac_rx_clk
		.hps_gmii_mac_rxdv         (_connected_to_hps_gmii_mac_rxdv_),         //  output,  width = 1,                   .mac_rxdv
		.hps_gmii_mac_rxer         (_connected_to_hps_gmii_mac_rxer_),         //  output,  width = 1,                   .mac_rxer
		.hps_gmii_mac_rxd          (_connected_to_hps_gmii_mac_rxd_),          //  output,  width = 8,                   .mac_rxd
		.hps_gmii_mac_col          (_connected_to_hps_gmii_mac_col_),          //  output,  width = 1,                   .mac_col
		.hps_gmii_mac_crs          (_connected_to_hps_gmii_mac_crs_),          //  output,  width = 1,                   .mac_crs
		.phy_rgmii_rgmii_rx_clk    (_connected_to_phy_rgmii_rgmii_rx_clk_),    //   input,  width = 1,          phy_rgmii.rgmii_rx_clk
		.phy_rgmii_rgmii_rxd       (_connected_to_phy_rgmii_rgmii_rxd_),       //   input,  width = 4,                   .rgmii_rxd
		.phy_rgmii_rgmii_rx_ctl    (_connected_to_phy_rgmii_rgmii_rx_ctl_),    //   input,  width = 1,                   .rgmii_rx_ctl
		.phy_rgmii_rgmii_tx_clk    (_connected_to_phy_rgmii_rgmii_tx_clk_),    //  output,  width = 1,                   .rgmii_tx_clk
		.phy_rgmii_rgmii_txd       (_connected_to_phy_rgmii_rgmii_txd_),       //  output,  width = 4,                   .rgmii_txd
		.phy_rgmii_rgmii_tx_ctl    (_connected_to_phy_rgmii_rgmii_tx_ctl_),    //  output,  width = 1,                   .rgmii_tx_ctl
		.pll_250m_tx_clock_clk     (_connected_to_pll_250m_tx_clock_clk_),     //   input,  width = 1,  pll_250m_tx_clock.clk
		.pll_125m_tx_clock_clk     (_connected_to_pll_125m_tx_clock_clk_),     //   input,  width = 1,  pll_125m_tx_clock.clk
		.pll_25m_clock_clk         (_connected_to_pll_25m_clock_clk_),         //   input,  width = 1,      pll_25m_clock.clk
		.pll_2_5m_clock_clk        (_connected_to_pll_2_5m_clock_clk_),        //   input,  width = 1,     pll_2_5m_clock.clk
		.locked_pll_250m_tx_export (_connected_to_locked_pll_250m_tx_export_), //   input,  width = 1, locked_pll_250m_tx.export
		.peri_reset_reset          (_connected_to_peri_reset_reset_),          //   input,  width = 1,         peri_reset.reset
		.peri_clock_clk            (_connected_to_peri_clock_clk_)             //   input,  width = 1,         peri_clock.clk
	);

