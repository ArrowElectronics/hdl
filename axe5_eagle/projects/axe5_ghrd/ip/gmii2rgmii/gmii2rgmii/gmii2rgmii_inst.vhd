	component gmii2rgmii is
		port (
			hps_gmii_mac_tx_clk_o     : in  std_logic                    := 'X';             -- mac_tx_clk_o
			hps_gmii_mac_rst_tx_n     : in  std_logic                    := 'X';             -- mac_rst_tx_n
			hps_gmii_mac_rst_rx_n     : in  std_logic                    := 'X';             -- mac_rst_rx_n
			hps_gmii_mac_txd_o        : in  std_logic_vector(7 downto 0) := (others => 'X'); -- mac_txd_o
			hps_gmii_mac_txen         : in  std_logic                    := 'X';             -- mac_txen
			hps_gmii_mac_txer         : in  std_logic                    := 'X';             -- mac_txer
			hps_gmii_mac_speed        : in  std_logic_vector(2 downto 0) := (others => 'X'); -- mac_speed
			hps_gmii_mac_tx_clk_i     : out std_logic;                                       -- mac_tx_clk_i
			hps_gmii_mac_rx_clk       : out std_logic;                                       -- mac_rx_clk
			hps_gmii_mac_rxdv         : out std_logic;                                       -- mac_rxdv
			hps_gmii_mac_rxer         : out std_logic;                                       -- mac_rxer
			hps_gmii_mac_rxd          : out std_logic_vector(7 downto 0);                    -- mac_rxd
			hps_gmii_mac_col          : out std_logic;                                       -- mac_col
			hps_gmii_mac_crs          : out std_logic;                                       -- mac_crs
			phy_rgmii_rgmii_rx_clk    : in  std_logic                    := 'X';             -- rgmii_rx_clk
			phy_rgmii_rgmii_rxd       : in  std_logic_vector(3 downto 0) := (others => 'X'); -- rgmii_rxd
			phy_rgmii_rgmii_rx_ctl    : in  std_logic                    := 'X';             -- rgmii_rx_ctl
			phy_rgmii_rgmii_tx_clk    : out std_logic;                                       -- rgmii_tx_clk
			phy_rgmii_rgmii_txd       : out std_logic_vector(3 downto 0);                    -- rgmii_txd
			phy_rgmii_rgmii_tx_ctl    : out std_logic;                                       -- rgmii_tx_ctl
			pll_250m_tx_clock_clk     : in  std_logic                    := 'X';             -- clk
			pll_125m_tx_clock_clk     : in  std_logic                    := 'X';             -- clk
			pll_25m_clock_clk         : in  std_logic                    := 'X';             -- clk
			pll_2_5m_clock_clk        : in  std_logic                    := 'X';             -- clk
			locked_pll_250m_tx_export : in  std_logic                    := 'X';             -- export
			peri_reset_reset          : in  std_logic                    := 'X';             -- reset
			peri_clock_clk            : in  std_logic                    := 'X'              -- clk
		);
	end component gmii2rgmii;

	u0 : component gmii2rgmii
		port map (
			hps_gmii_mac_tx_clk_o     => CONNECTED_TO_hps_gmii_mac_tx_clk_o,     --           hps_gmii.mac_tx_clk_o
			hps_gmii_mac_rst_tx_n     => CONNECTED_TO_hps_gmii_mac_rst_tx_n,     --                   .mac_rst_tx_n
			hps_gmii_mac_rst_rx_n     => CONNECTED_TO_hps_gmii_mac_rst_rx_n,     --                   .mac_rst_rx_n
			hps_gmii_mac_txd_o        => CONNECTED_TO_hps_gmii_mac_txd_o,        --                   .mac_txd_o
			hps_gmii_mac_txen         => CONNECTED_TO_hps_gmii_mac_txen,         --                   .mac_txen
			hps_gmii_mac_txer         => CONNECTED_TO_hps_gmii_mac_txer,         --                   .mac_txer
			hps_gmii_mac_speed        => CONNECTED_TO_hps_gmii_mac_speed,        --                   .mac_speed
			hps_gmii_mac_tx_clk_i     => CONNECTED_TO_hps_gmii_mac_tx_clk_i,     --                   .mac_tx_clk_i
			hps_gmii_mac_rx_clk       => CONNECTED_TO_hps_gmii_mac_rx_clk,       --                   .mac_rx_clk
			hps_gmii_mac_rxdv         => CONNECTED_TO_hps_gmii_mac_rxdv,         --                   .mac_rxdv
			hps_gmii_mac_rxer         => CONNECTED_TO_hps_gmii_mac_rxer,         --                   .mac_rxer
			hps_gmii_mac_rxd          => CONNECTED_TO_hps_gmii_mac_rxd,          --                   .mac_rxd
			hps_gmii_mac_col          => CONNECTED_TO_hps_gmii_mac_col,          --                   .mac_col
			hps_gmii_mac_crs          => CONNECTED_TO_hps_gmii_mac_crs,          --                   .mac_crs
			phy_rgmii_rgmii_rx_clk    => CONNECTED_TO_phy_rgmii_rgmii_rx_clk,    --          phy_rgmii.rgmii_rx_clk
			phy_rgmii_rgmii_rxd       => CONNECTED_TO_phy_rgmii_rgmii_rxd,       --                   .rgmii_rxd
			phy_rgmii_rgmii_rx_ctl    => CONNECTED_TO_phy_rgmii_rgmii_rx_ctl,    --                   .rgmii_rx_ctl
			phy_rgmii_rgmii_tx_clk    => CONNECTED_TO_phy_rgmii_rgmii_tx_clk,    --                   .rgmii_tx_clk
			phy_rgmii_rgmii_txd       => CONNECTED_TO_phy_rgmii_rgmii_txd,       --                   .rgmii_txd
			phy_rgmii_rgmii_tx_ctl    => CONNECTED_TO_phy_rgmii_rgmii_tx_ctl,    --                   .rgmii_tx_ctl
			pll_250m_tx_clock_clk     => CONNECTED_TO_pll_250m_tx_clock_clk,     --  pll_250m_tx_clock.clk
			pll_125m_tx_clock_clk     => CONNECTED_TO_pll_125m_tx_clock_clk,     --  pll_125m_tx_clock.clk
			pll_25m_clock_clk         => CONNECTED_TO_pll_25m_clock_clk,         --      pll_25m_clock.clk
			pll_2_5m_clock_clk        => CONNECTED_TO_pll_2_5m_clock_clk,        --     pll_2_5m_clock.clk
			locked_pll_250m_tx_export => CONNECTED_TO_locked_pll_250m_tx_export, -- locked_pll_250m_tx.export
			peri_reset_reset          => CONNECTED_TO_peri_reset_reset,          --         peri_reset.reset
			peri_clock_clk            => CONNECTED_TO_peri_clock_clk             --         peri_clock.clk
		);

