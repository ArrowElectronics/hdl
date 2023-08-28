	component ghrd_hps_system_intel_agilex_5_soc_0 is
		port (
			h2f_reset_reset_n                  : out   std_logic;                                         -- reset_n
			hps2fpga_axi_clock_clk             : in    std_logic                      := 'X';             -- clk
			hps2fpga_axi_reset_reset_n         : in    std_logic                      := 'X';             -- reset_n
			hps2fpga_awid                      : out   std_logic_vector(3 downto 0);                      -- awid
			hps2fpga_awaddr                    : out   std_logic_vector(31 downto 0);                     -- awaddr
			hps2fpga_awlen                     : out   std_logic_vector(7 downto 0);                      -- awlen
			hps2fpga_awsize                    : out   std_logic_vector(2 downto 0);                      -- awsize
			hps2fpga_awburst                   : out   std_logic_vector(1 downto 0);                      -- awburst
			hps2fpga_awlock                    : out   std_logic;                                         -- awlock
			hps2fpga_awcache                   : out   std_logic_vector(3 downto 0);                      -- awcache
			hps2fpga_awprot                    : out   std_logic_vector(2 downto 0);                      -- awprot
			hps2fpga_awvalid                   : out   std_logic;                                         -- awvalid
			hps2fpga_awready                   : in    std_logic                      := 'X';             -- awready
			hps2fpga_wdata                     : out   std_logic_vector(31 downto 0);                     -- wdata
			hps2fpga_wstrb                     : out   std_logic_vector(3 downto 0);                      -- wstrb
			hps2fpga_wlast                     : out   std_logic;                                         -- wlast
			hps2fpga_wvalid                    : out   std_logic;                                         -- wvalid
			hps2fpga_wready                    : in    std_logic                      := 'X';             -- wready
			hps2fpga_bid                       : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- bid
			hps2fpga_bresp                     : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			hps2fpga_bvalid                    : in    std_logic                      := 'X';             -- bvalid
			hps2fpga_bready                    : out   std_logic;                                         -- bready
			hps2fpga_arid                      : out   std_logic_vector(3 downto 0);                      -- arid
			hps2fpga_araddr                    : out   std_logic_vector(31 downto 0);                     -- araddr
			hps2fpga_arlen                     : out   std_logic_vector(7 downto 0);                      -- arlen
			hps2fpga_arsize                    : out   std_logic_vector(2 downto 0);                      -- arsize
			hps2fpga_arburst                   : out   std_logic_vector(1 downto 0);                      -- arburst
			hps2fpga_arlock                    : out   std_logic;                                         -- arlock
			hps2fpga_arcache                   : out   std_logic_vector(3 downto 0);                      -- arcache
			hps2fpga_arprot                    : out   std_logic_vector(2 downto 0);                      -- arprot
			hps2fpga_arvalid                   : out   std_logic;                                         -- arvalid
			hps2fpga_arready                   : in    std_logic                      := 'X';             -- arready
			hps2fpga_rid                       : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- rid
			hps2fpga_rdata                     : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- rdata
			hps2fpga_rresp                     : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			hps2fpga_rlast                     : in    std_logic                      := 'X';             -- rlast
			hps2fpga_rvalid                    : in    std_logic                      := 'X';             -- rvalid
			hps2fpga_rready                    : out   std_logic;                                         -- rready
			lwhps2fpga_axi_clock_clk           : in    std_logic                      := 'X';             -- clk
			lwhps2fpga_axi_reset_reset_n       : in    std_logic                      := 'X';             -- reset_n
			lwhps2fpga_awid                    : out   std_logic_vector(3 downto 0);                      -- awid
			lwhps2fpga_awaddr                  : out   std_logic_vector(28 downto 0);                     -- awaddr
			lwhps2fpga_awlen                   : out   std_logic_vector(7 downto 0);                      -- awlen
			lwhps2fpga_awsize                  : out   std_logic_vector(2 downto 0);                      -- awsize
			lwhps2fpga_awburst                 : out   std_logic_vector(1 downto 0);                      -- awburst
			lwhps2fpga_awlock                  : out   std_logic;                                         -- awlock
			lwhps2fpga_awcache                 : out   std_logic_vector(3 downto 0);                      -- awcache
			lwhps2fpga_awprot                  : out   std_logic_vector(2 downto 0);                      -- awprot
			lwhps2fpga_awvalid                 : out   std_logic;                                         -- awvalid
			lwhps2fpga_awready                 : in    std_logic                      := 'X';             -- awready
			lwhps2fpga_wdata                   : out   std_logic_vector(31 downto 0);                     -- wdata
			lwhps2fpga_wstrb                   : out   std_logic_vector(3 downto 0);                      -- wstrb
			lwhps2fpga_wlast                   : out   std_logic;                                         -- wlast
			lwhps2fpga_wvalid                  : out   std_logic;                                         -- wvalid
			lwhps2fpga_wready                  : in    std_logic                      := 'X';             -- wready
			lwhps2fpga_bid                     : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- bid
			lwhps2fpga_bresp                   : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			lwhps2fpga_bvalid                  : in    std_logic                      := 'X';             -- bvalid
			lwhps2fpga_bready                  : out   std_logic;                                         -- bready
			lwhps2fpga_arid                    : out   std_logic_vector(3 downto 0);                      -- arid
			lwhps2fpga_araddr                  : out   std_logic_vector(28 downto 0);                     -- araddr
			lwhps2fpga_arlen                   : out   std_logic_vector(7 downto 0);                      -- arlen
			lwhps2fpga_arsize                  : out   std_logic_vector(2 downto 0);                      -- arsize
			lwhps2fpga_arburst                 : out   std_logic_vector(1 downto 0);                      -- arburst
			lwhps2fpga_arlock                  : out   std_logic;                                         -- arlock
			lwhps2fpga_arcache                 : out   std_logic_vector(3 downto 0);                      -- arcache
			lwhps2fpga_arprot                  : out   std_logic_vector(2 downto 0);                      -- arprot
			lwhps2fpga_arvalid                 : out   std_logic;                                         -- arvalid
			lwhps2fpga_arready                 : in    std_logic                      := 'X';             -- arready
			lwhps2fpga_rid                     : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- rid
			lwhps2fpga_rdata                   : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- rdata
			lwhps2fpga_rresp                   : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			lwhps2fpga_rlast                   : in    std_logic                      := 'X';             -- rlast
			lwhps2fpga_rvalid                  : in    std_logic                      := 'X';             -- rvalid
			lwhps2fpga_rready                  : out   std_logic;                                         -- rready
			emac_ptp_clk_clk                   : in    std_logic                      := 'X';             -- clk
			emac_timestamp_clk_clk             : in    std_logic                      := 'X';             -- clk
			emac_timestamp_data_data_in        : in    std_logic_vector(63 downto 0)  := (others => 'X'); -- data_in
			emac0_mdio_mac_mdc                 : out   std_logic;                                         -- mac_mdc
			emac0_mdio_mac_mdi                 : in    std_logic                      := 'X';             -- mac_mdi
			emac0_mdio_mac_mdo                 : out   std_logic;                                         -- mac_mdo
			emac0_mdio_mac_mdoe                : out   std_logic;                                         -- mac_mdoe
			emac0_app_rst_reset_n              : out   std_logic;                                         -- reset_n
			emac0_mac_tx_clk_o                 : out   std_logic;                                         -- mac_tx_clk_o
			emac0_mac_tx_clk_i                 : in    std_logic                      := 'X';             -- mac_tx_clk_i
			emac0_mac_rx_clk                   : in    std_logic                      := 'X';             -- mac_rx_clk
			emac0_mac_rst_tx_n                 : out   std_logic;                                         -- mac_rst_tx_n
			emac0_mac_rst_rx_n                 : out   std_logic;                                         -- mac_rst_rx_n
			emac0_mac_txen                     : out   std_logic;                                         -- mac_txen
			emac0_mac_txer                     : out   std_logic;                                         -- mac_txer
			emac0_mac_rxdv                     : in    std_logic                      := 'X';             -- mac_rxdv
			emac0_mac_rxer                     : in    std_logic                      := 'X';             -- mac_rxer
			emac0_mac_rxd                      : in    std_logic_vector(7 downto 0)   := (others => 'X'); -- mac_rxd
			emac0_mac_col                      : in    std_logic                      := 'X';             -- mac_col
			emac0_mac_crs                      : in    std_logic                      := 'X';             -- mac_crs
			emac0_mac_speed                    : out   std_logic_vector(2 downto 0);                      -- mac_speed
			emac0_mac_txd_o                    : out   std_logic_vector(7 downto 0);                      -- mac_txd_o
			emac2_app_rst_reset_n              : out   std_logic;                                         -- reset_n
			spim0_miso_i                       : in    std_logic                      := 'X';             -- miso_i
			spim0_mosi_o                       : out   std_logic;                                         -- mosi_o
			spim0_mosi_oe                      : out   std_logic;                                         -- mosi_oe
			spim0_ss_in_n                      : in    std_logic                      := 'X';             -- ss_in_n
			spim0_ss0_n_o                      : out   std_logic;                                         -- ss0_n_o
			spim0_ss1_n_o                      : out   std_logic;                                         -- ss1_n_o
			spim0_ss2_n_o                      : out   std_logic;                                         -- ss2_n_o
			spim0_ss3_n_o                      : out   std_logic;                                         -- ss3_n_o
			spim0_sclk_out_clk                 : out   std_logic;                                         -- clk
			I2C1_scl_i_clk                     : in    std_logic                      := 'X';             -- clk
			I2C1_scl_oe_clk                    : out   std_logic;                                         -- clk
			I2C1_sda_i                         : in    std_logic                      := 'X';             -- sda_i
			I2C1_sda_oe                        : out   std_logic;                                         -- sda_oe
			h2f_user0_clk_clk                  : out   std_logic;                                         -- clk
			h2f_user1_clk_clk                  : out   std_logic;                                         -- clk
			h2f_warm_reset_handshake_reset_req : out   std_logic;                                         -- reset_req
			h2f_warm_reset_handshake_reset_ack : in    std_logic                      := 'X';             -- reset_ack
			h2f_cold_reset_reset_n             : out   std_logic;                                         -- reset_n
			hps_io_hps_osc_clk                 : in    std_logic                      := 'X';             -- hps_osc_clk
			hps_io_sdmmc_data0                 : inout std_logic                      := 'X';             -- sdmmc_data0
			hps_io_sdmmc_data1                 : inout std_logic                      := 'X';             -- sdmmc_data1
			hps_io_sdmmc_cclk                  : out   std_logic;                                         -- sdmmc_cclk
			hps_io_sdmmc_data2                 : inout std_logic                      := 'X';             -- sdmmc_data2
			hps_io_sdmmc_data3                 : inout std_logic                      := 'X';             -- sdmmc_data3
			hps_io_sdmmc_cmd                   : inout std_logic                      := 'X';             -- sdmmc_cmd
			hps_io_usb1_clk                    : in    std_logic                      := 'X';             -- usb1_clk
			hps_io_usb1_stp                    : out   std_logic;                                         -- usb1_stp
			hps_io_usb1_dir                    : in    std_logic                      := 'X';             -- usb1_dir
			hps_io_usb1_data0                  : inout std_logic                      := 'X';             -- usb1_data0
			hps_io_usb1_data1                  : inout std_logic                      := 'X';             -- usb1_data1
			hps_io_usb1_nxr                    : in    std_logic                      := 'X';             -- usb1_nxr
			hps_io_usb1_data2                  : inout std_logic                      := 'X';             -- usb1_data2
			hps_io_usb1_data3                  : inout std_logic                      := 'X';             -- usb1_data3
			hps_io_usb1_data4                  : inout std_logic                      := 'X';             -- usb1_data4
			hps_io_usb1_data5                  : inout std_logic                      := 'X';             -- usb1_data5
			hps_io_usb1_data6                  : inout std_logic                      := 'X';             -- usb1_data6
			hps_io_usb1_data7                  : inout std_logic                      := 'X';             -- usb1_data7
			hps_io_emac2_tx_clk                : out   std_logic;                                         -- emac2_tx_clk
			hps_io_emac2_tx_ctl                : out   std_logic;                                         -- emac2_tx_ctl
			hps_io_emac2_rx_clk                : in    std_logic                      := 'X';             -- emac2_rx_clk
			hps_io_emac2_rx_ctl                : in    std_logic                      := 'X';             -- emac2_rx_ctl
			hps_io_emac2_txd0                  : out   std_logic;                                         -- emac2_txd0
			hps_io_emac2_txd1                  : out   std_logic;                                         -- emac2_txd1
			hps_io_emac2_rxd0                  : in    std_logic                      := 'X';             -- emac2_rxd0
			hps_io_emac2_rxd1                  : in    std_logic                      := 'X';             -- emac2_rxd1
			hps_io_emac2_txd2                  : out   std_logic;                                         -- emac2_txd2
			hps_io_emac2_txd3                  : out   std_logic;                                         -- emac2_txd3
			hps_io_emac2_rxd2                  : in    std_logic                      := 'X';             -- emac2_rxd2
			hps_io_emac2_rxd3                  : in    std_logic                      := 'X';             -- emac2_rxd3
			hps_io_mdio2_mdio                  : inout std_logic                      := 'X';             -- mdio2_mdio
			hps_io_mdio2_mdc                   : out   std_logic;                                         -- mdio2_mdc
			hps_io_uart0_tx                    : out   std_logic;                                         -- uart0_tx
			hps_io_uart0_rx                    : in    std_logic                      := 'X';             -- uart0_rx
			hps_io_i2c0_sda                    : inout std_logic                      := 'X';             -- i2c0_sda
			hps_io_i2c0_scl                    : inout std_logic                      := 'X';             -- i2c0_scl
			hps_io_gpio8                       : inout std_logic                      := 'X';             -- gpio8
			hps_io_gpio9                       : inout std_logic                      := 'X';             -- gpio9
			hps_io_gpio10                      : inout std_logic                      := 'X';             -- gpio10
			hps_io_gpio11                      : inout std_logic                      := 'X';             -- gpio11
			hps_io_gpio28                      : inout std_logic                      := 'X';             -- gpio28
			hps_io_gpio35                      : inout std_logic                      := 'X';             -- gpio35
			usb31_io_vbus_det                  : in    std_logic                      := 'X';             -- vbus_det
			usb31_io_flt_bar                   : in    std_logic                      := 'X';             -- flt_bar
			usb31_io_usb_ctrl                  : out   std_logic_vector(1 downto 0);                      -- usb_ctrl
			usb31_io_usb31_id                  : in    std_logic                      := 'X';             -- usb31_id
			fpga2hps_interrupt_irq             : in    std_logic_vector(62 downto 0)  := (others => 'X'); -- irq
			emif0_csr_axi_clk_clk              : in    std_logic                      := 'X';             -- clk
			emif0_csr_axi_rst_reset_n          : in    std_logic                      := 'X';             -- reset_n
			emif0_csr_axi_arready              : in    std_logic                      := 'X';             -- arready
			emif0_csr_axi_awready              : in    std_logic                      := 'X';             -- awready
			emif0_csr_axi_bresp                : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			emif0_csr_axi_bvalid               : in    std_logic                      := 'X';             -- bvalid
			emif0_csr_axi_rdata                : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- rdata
			emif0_csr_axi_rresp                : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			emif0_csr_axi_rvalid               : in    std_logic                      := 'X';             -- rvalid
			emif0_csr_axi_wready               : in    std_logic                      := 'X';             -- wready
			emif0_csr_axi_araddr               : out   std_logic_vector(31 downto 0);                     -- araddr
			emif0_csr_axi_arvalid              : out   std_logic;                                         -- arvalid
			emif0_csr_axi_awaddr               : out   std_logic_vector(31 downto 0);                     -- awaddr
			emif0_csr_axi_awvalid              : out   std_logic;                                         -- awvalid
			emif0_csr_axi_bready               : out   std_logic;                                         -- bready
			emif0_csr_axi_rready               : out   std_logic;                                         -- rready
			emif0_csr_axi_wdata                : out   std_logic_vector(31 downto 0);                     -- wdata
			emif0_csr_axi_wstrb                : out   std_logic_vector(3 downto 0);                      -- wstrb
			emif0_csr_axi_wvalid               : out   std_logic;                                         -- wvalid
			emif0_csr_axi_arprot               : out   std_logic_vector(2 downto 0);                      -- arprot
			emif0_csr_axi_awprot               : out   std_logic_vector(2 downto 0);                      -- awprot
			emif0_ch0_axi_clk_clk              : in    std_logic                      := 'X';             -- clk
			emif0_ch0_axi_rst_reset_n          : in    std_logic                      := 'X';             -- reset_n
			emif0_ch0_axi_arready              : in    std_logic                      := 'X';             -- arready
			emif0_ch0_axi_awready              : in    std_logic                      := 'X';             -- awready
			emif0_ch0_axi_bid                  : in    std_logic_vector(6 downto 0)   := (others => 'X'); -- bid
			emif0_ch0_axi_bresp                : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			emif0_ch0_axi_bvalid               : in    std_logic                      := 'X';             -- bvalid
			emif0_ch0_axi_rdata                : in    std_logic_vector(255 downto 0) := (others => 'X'); -- rdata
			emif0_ch0_axi_rid                  : in    std_logic_vector(6 downto 0)   := (others => 'X'); -- rid
			emif0_ch0_axi_rlast                : in    std_logic                      := 'X';             -- rlast
			emif0_ch0_axi_rresp                : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			emif0_ch0_axi_ruser                : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- ruser
			emif0_ch0_axi_rvalid               : in    std_logic                      := 'X';             -- rvalid
			emif0_ch0_axi_wready               : in    std_logic                      := 'X';             -- wready
			emif0_ch0_axi_araddr               : out   std_logic_vector(43 downto 0);                     -- araddr
			emif0_ch0_axi_arburst              : out   std_logic_vector(1 downto 0);                      -- arburst
			emif0_ch0_axi_arid                 : out   std_logic_vector(6 downto 0);                      -- arid
			emif0_ch0_axi_arlen                : out   std_logic_vector(7 downto 0);                      -- arlen
			emif0_ch0_axi_arlock               : out   std_logic;                                         -- arlock
			emif0_ch0_axi_arqos                : out   std_logic_vector(3 downto 0);                      -- arqos
			emif0_ch0_axi_arsize               : out   std_logic_vector(2 downto 0);                      -- arsize
			emif0_ch0_axi_aruser               : out   std_logic_vector(13 downto 0);                     -- aruser
			emif0_ch0_axi_arvalid              : out   std_logic;                                         -- arvalid
			emif0_ch0_axi_awaddr               : out   std_logic_vector(43 downto 0);                     -- awaddr
			emif0_ch0_axi_awburst              : out   std_logic_vector(1 downto 0);                      -- awburst
			emif0_ch0_axi_awid                 : out   std_logic_vector(6 downto 0);                      -- awid
			emif0_ch0_axi_awlen                : out   std_logic_vector(7 downto 0);                      -- awlen
			emif0_ch0_axi_awlock               : out   std_logic;                                         -- awlock
			emif0_ch0_axi_awqos                : out   std_logic_vector(3 downto 0);                      -- awqos
			emif0_ch0_axi_awsize               : out   std_logic_vector(2 downto 0);                      -- awsize
			emif0_ch0_axi_awuser               : out   std_logic_vector(13 downto 0);                     -- awuser
			emif0_ch0_axi_awvalid              : out   std_logic;                                         -- awvalid
			emif0_ch0_axi_bready               : out   std_logic;                                         -- bready
			emif0_ch0_axi_rready               : out   std_logic;                                         -- rready
			emif0_ch0_axi_wdata                : out   std_logic_vector(255 downto 0);                    -- wdata
			emif0_ch0_axi_wlast                : out   std_logic;                                         -- wlast
			emif0_ch0_axi_wstrb                : out   std_logic_vector(31 downto 0);                     -- wstrb
			emif0_ch0_axi_wuser                : out   std_logic_vector(31 downto 0);                     -- wuser
			emif0_ch0_axi_wvalid               : out   std_logic;                                         -- wvalid
			emif0_ch0_axi_arprot               : out   std_logic_vector(2 downto 0);                      -- arprot
			emif0_ch0_axi_awprot               : out   std_logic_vector(2 downto 0)                       -- awprot
		);
	end component ghrd_hps_system_intel_agilex_5_soc_0;

	u0 : component ghrd_hps_system_intel_agilex_5_soc_0
		port map (
			h2f_reset_reset_n                  => CONNECTED_TO_h2f_reset_reset_n,                  --                h2f_reset.reset_n
			hps2fpga_axi_clock_clk             => CONNECTED_TO_hps2fpga_axi_clock_clk,             --       hps2fpga_axi_clock.clk
			hps2fpga_axi_reset_reset_n         => CONNECTED_TO_hps2fpga_axi_reset_reset_n,         --       hps2fpga_axi_reset.reset_n
			hps2fpga_awid                      => CONNECTED_TO_hps2fpga_awid,                      --                 hps2fpga.awid
			hps2fpga_awaddr                    => CONNECTED_TO_hps2fpga_awaddr,                    --                         .awaddr
			hps2fpga_awlen                     => CONNECTED_TO_hps2fpga_awlen,                     --                         .awlen
			hps2fpga_awsize                    => CONNECTED_TO_hps2fpga_awsize,                    --                         .awsize
			hps2fpga_awburst                   => CONNECTED_TO_hps2fpga_awburst,                   --                         .awburst
			hps2fpga_awlock                    => CONNECTED_TO_hps2fpga_awlock,                    --                         .awlock
			hps2fpga_awcache                   => CONNECTED_TO_hps2fpga_awcache,                   --                         .awcache
			hps2fpga_awprot                    => CONNECTED_TO_hps2fpga_awprot,                    --                         .awprot
			hps2fpga_awvalid                   => CONNECTED_TO_hps2fpga_awvalid,                   --                         .awvalid
			hps2fpga_awready                   => CONNECTED_TO_hps2fpga_awready,                   --                         .awready
			hps2fpga_wdata                     => CONNECTED_TO_hps2fpga_wdata,                     --                         .wdata
			hps2fpga_wstrb                     => CONNECTED_TO_hps2fpga_wstrb,                     --                         .wstrb
			hps2fpga_wlast                     => CONNECTED_TO_hps2fpga_wlast,                     --                         .wlast
			hps2fpga_wvalid                    => CONNECTED_TO_hps2fpga_wvalid,                    --                         .wvalid
			hps2fpga_wready                    => CONNECTED_TO_hps2fpga_wready,                    --                         .wready
			hps2fpga_bid                       => CONNECTED_TO_hps2fpga_bid,                       --                         .bid
			hps2fpga_bresp                     => CONNECTED_TO_hps2fpga_bresp,                     --                         .bresp
			hps2fpga_bvalid                    => CONNECTED_TO_hps2fpga_bvalid,                    --                         .bvalid
			hps2fpga_bready                    => CONNECTED_TO_hps2fpga_bready,                    --                         .bready
			hps2fpga_arid                      => CONNECTED_TO_hps2fpga_arid,                      --                         .arid
			hps2fpga_araddr                    => CONNECTED_TO_hps2fpga_araddr,                    --                         .araddr
			hps2fpga_arlen                     => CONNECTED_TO_hps2fpga_arlen,                     --                         .arlen
			hps2fpga_arsize                    => CONNECTED_TO_hps2fpga_arsize,                    --                         .arsize
			hps2fpga_arburst                   => CONNECTED_TO_hps2fpga_arburst,                   --                         .arburst
			hps2fpga_arlock                    => CONNECTED_TO_hps2fpga_arlock,                    --                         .arlock
			hps2fpga_arcache                   => CONNECTED_TO_hps2fpga_arcache,                   --                         .arcache
			hps2fpga_arprot                    => CONNECTED_TO_hps2fpga_arprot,                    --                         .arprot
			hps2fpga_arvalid                   => CONNECTED_TO_hps2fpga_arvalid,                   --                         .arvalid
			hps2fpga_arready                   => CONNECTED_TO_hps2fpga_arready,                   --                         .arready
			hps2fpga_rid                       => CONNECTED_TO_hps2fpga_rid,                       --                         .rid
			hps2fpga_rdata                     => CONNECTED_TO_hps2fpga_rdata,                     --                         .rdata
			hps2fpga_rresp                     => CONNECTED_TO_hps2fpga_rresp,                     --                         .rresp
			hps2fpga_rlast                     => CONNECTED_TO_hps2fpga_rlast,                     --                         .rlast
			hps2fpga_rvalid                    => CONNECTED_TO_hps2fpga_rvalid,                    --                         .rvalid
			hps2fpga_rready                    => CONNECTED_TO_hps2fpga_rready,                    --                         .rready
			lwhps2fpga_axi_clock_clk           => CONNECTED_TO_lwhps2fpga_axi_clock_clk,           --     lwhps2fpga_axi_clock.clk
			lwhps2fpga_axi_reset_reset_n       => CONNECTED_TO_lwhps2fpga_axi_reset_reset_n,       --     lwhps2fpga_axi_reset.reset_n
			lwhps2fpga_awid                    => CONNECTED_TO_lwhps2fpga_awid,                    --               lwhps2fpga.awid
			lwhps2fpga_awaddr                  => CONNECTED_TO_lwhps2fpga_awaddr,                  --                         .awaddr
			lwhps2fpga_awlen                   => CONNECTED_TO_lwhps2fpga_awlen,                   --                         .awlen
			lwhps2fpga_awsize                  => CONNECTED_TO_lwhps2fpga_awsize,                  --                         .awsize
			lwhps2fpga_awburst                 => CONNECTED_TO_lwhps2fpga_awburst,                 --                         .awburst
			lwhps2fpga_awlock                  => CONNECTED_TO_lwhps2fpga_awlock,                  --                         .awlock
			lwhps2fpga_awcache                 => CONNECTED_TO_lwhps2fpga_awcache,                 --                         .awcache
			lwhps2fpga_awprot                  => CONNECTED_TO_lwhps2fpga_awprot,                  --                         .awprot
			lwhps2fpga_awvalid                 => CONNECTED_TO_lwhps2fpga_awvalid,                 --                         .awvalid
			lwhps2fpga_awready                 => CONNECTED_TO_lwhps2fpga_awready,                 --                         .awready
			lwhps2fpga_wdata                   => CONNECTED_TO_lwhps2fpga_wdata,                   --                         .wdata
			lwhps2fpga_wstrb                   => CONNECTED_TO_lwhps2fpga_wstrb,                   --                         .wstrb
			lwhps2fpga_wlast                   => CONNECTED_TO_lwhps2fpga_wlast,                   --                         .wlast
			lwhps2fpga_wvalid                  => CONNECTED_TO_lwhps2fpga_wvalid,                  --                         .wvalid
			lwhps2fpga_wready                  => CONNECTED_TO_lwhps2fpga_wready,                  --                         .wready
			lwhps2fpga_bid                     => CONNECTED_TO_lwhps2fpga_bid,                     --                         .bid
			lwhps2fpga_bresp                   => CONNECTED_TO_lwhps2fpga_bresp,                   --                         .bresp
			lwhps2fpga_bvalid                  => CONNECTED_TO_lwhps2fpga_bvalid,                  --                         .bvalid
			lwhps2fpga_bready                  => CONNECTED_TO_lwhps2fpga_bready,                  --                         .bready
			lwhps2fpga_arid                    => CONNECTED_TO_lwhps2fpga_arid,                    --                         .arid
			lwhps2fpga_araddr                  => CONNECTED_TO_lwhps2fpga_araddr,                  --                         .araddr
			lwhps2fpga_arlen                   => CONNECTED_TO_lwhps2fpga_arlen,                   --                         .arlen
			lwhps2fpga_arsize                  => CONNECTED_TO_lwhps2fpga_arsize,                  --                         .arsize
			lwhps2fpga_arburst                 => CONNECTED_TO_lwhps2fpga_arburst,                 --                         .arburst
			lwhps2fpga_arlock                  => CONNECTED_TO_lwhps2fpga_arlock,                  --                         .arlock
			lwhps2fpga_arcache                 => CONNECTED_TO_lwhps2fpga_arcache,                 --                         .arcache
			lwhps2fpga_arprot                  => CONNECTED_TO_lwhps2fpga_arprot,                  --                         .arprot
			lwhps2fpga_arvalid                 => CONNECTED_TO_lwhps2fpga_arvalid,                 --                         .arvalid
			lwhps2fpga_arready                 => CONNECTED_TO_lwhps2fpga_arready,                 --                         .arready
			lwhps2fpga_rid                     => CONNECTED_TO_lwhps2fpga_rid,                     --                         .rid
			lwhps2fpga_rdata                   => CONNECTED_TO_lwhps2fpga_rdata,                   --                         .rdata
			lwhps2fpga_rresp                   => CONNECTED_TO_lwhps2fpga_rresp,                   --                         .rresp
			lwhps2fpga_rlast                   => CONNECTED_TO_lwhps2fpga_rlast,                   --                         .rlast
			lwhps2fpga_rvalid                  => CONNECTED_TO_lwhps2fpga_rvalid,                  --                         .rvalid
			lwhps2fpga_rready                  => CONNECTED_TO_lwhps2fpga_rready,                  --                         .rready
			emac_ptp_clk_clk                   => CONNECTED_TO_emac_ptp_clk_clk,                   --             emac_ptp_clk.clk
			emac_timestamp_clk_clk             => CONNECTED_TO_emac_timestamp_clk_clk,             --       emac_timestamp_clk.clk
			emac_timestamp_data_data_in        => CONNECTED_TO_emac_timestamp_data_data_in,        --      emac_timestamp_data.data_in
			emac0_mdio_mac_mdc                 => CONNECTED_TO_emac0_mdio_mac_mdc,                 --               emac0_mdio.mac_mdc
			emac0_mdio_mac_mdi                 => CONNECTED_TO_emac0_mdio_mac_mdi,                 --                         .mac_mdi
			emac0_mdio_mac_mdo                 => CONNECTED_TO_emac0_mdio_mac_mdo,                 --                         .mac_mdo
			emac0_mdio_mac_mdoe                => CONNECTED_TO_emac0_mdio_mac_mdoe,                --                         .mac_mdoe
			emac0_app_rst_reset_n              => CONNECTED_TO_emac0_app_rst_reset_n,              --            emac0_app_rst.reset_n
			emac0_mac_tx_clk_o                 => CONNECTED_TO_emac0_mac_tx_clk_o,                 --                    emac0.mac_tx_clk_o
			emac0_mac_tx_clk_i                 => CONNECTED_TO_emac0_mac_tx_clk_i,                 --                         .mac_tx_clk_i
			emac0_mac_rx_clk                   => CONNECTED_TO_emac0_mac_rx_clk,                   --                         .mac_rx_clk
			emac0_mac_rst_tx_n                 => CONNECTED_TO_emac0_mac_rst_tx_n,                 --                         .mac_rst_tx_n
			emac0_mac_rst_rx_n                 => CONNECTED_TO_emac0_mac_rst_rx_n,                 --                         .mac_rst_rx_n
			emac0_mac_txen                     => CONNECTED_TO_emac0_mac_txen,                     --                         .mac_txen
			emac0_mac_txer                     => CONNECTED_TO_emac0_mac_txer,                     --                         .mac_txer
			emac0_mac_rxdv                     => CONNECTED_TO_emac0_mac_rxdv,                     --                         .mac_rxdv
			emac0_mac_rxer                     => CONNECTED_TO_emac0_mac_rxer,                     --                         .mac_rxer
			emac0_mac_rxd                      => CONNECTED_TO_emac0_mac_rxd,                      --                         .mac_rxd
			emac0_mac_col                      => CONNECTED_TO_emac0_mac_col,                      --                         .mac_col
			emac0_mac_crs                      => CONNECTED_TO_emac0_mac_crs,                      --                         .mac_crs
			emac0_mac_speed                    => CONNECTED_TO_emac0_mac_speed,                    --                         .mac_speed
			emac0_mac_txd_o                    => CONNECTED_TO_emac0_mac_txd_o,                    --                         .mac_txd_o
			emac2_app_rst_reset_n              => CONNECTED_TO_emac2_app_rst_reset_n,              --            emac2_app_rst.reset_n
			spim0_miso_i                       => CONNECTED_TO_spim0_miso_i,                       --                    spim0.miso_i
			spim0_mosi_o                       => CONNECTED_TO_spim0_mosi_o,                       --                         .mosi_o
			spim0_mosi_oe                      => CONNECTED_TO_spim0_mosi_oe,                      --                         .mosi_oe
			spim0_ss_in_n                      => CONNECTED_TO_spim0_ss_in_n,                      --                         .ss_in_n
			spim0_ss0_n_o                      => CONNECTED_TO_spim0_ss0_n_o,                      --                         .ss0_n_o
			spim0_ss1_n_o                      => CONNECTED_TO_spim0_ss1_n_o,                      --                         .ss1_n_o
			spim0_ss2_n_o                      => CONNECTED_TO_spim0_ss2_n_o,                      --                         .ss2_n_o
			spim0_ss3_n_o                      => CONNECTED_TO_spim0_ss3_n_o,                      --                         .ss3_n_o
			spim0_sclk_out_clk                 => CONNECTED_TO_spim0_sclk_out_clk,                 --           spim0_sclk_out.clk
			I2C1_scl_i_clk                     => CONNECTED_TO_I2C1_scl_i_clk,                     --               I2C1_scl_i.clk
			I2C1_scl_oe_clk                    => CONNECTED_TO_I2C1_scl_oe_clk,                    --              I2C1_scl_oe.clk
			I2C1_sda_i                         => CONNECTED_TO_I2C1_sda_i,                         --                     I2C1.sda_i
			I2C1_sda_oe                        => CONNECTED_TO_I2C1_sda_oe,                        --                         .sda_oe
			h2f_user0_clk_clk                  => CONNECTED_TO_h2f_user0_clk_clk,                  --            h2f_user0_clk.clk
			h2f_user1_clk_clk                  => CONNECTED_TO_h2f_user1_clk_clk,                  --            h2f_user1_clk.clk
			h2f_warm_reset_handshake_reset_req => CONNECTED_TO_h2f_warm_reset_handshake_reset_req, -- h2f_warm_reset_handshake.reset_req
			h2f_warm_reset_handshake_reset_ack => CONNECTED_TO_h2f_warm_reset_handshake_reset_ack, --                         .reset_ack
			h2f_cold_reset_reset_n             => CONNECTED_TO_h2f_cold_reset_reset_n,             --           h2f_cold_reset.reset_n
			hps_io_hps_osc_clk                 => CONNECTED_TO_hps_io_hps_osc_clk,                 --                   hps_io.hps_osc_clk
			hps_io_sdmmc_data0                 => CONNECTED_TO_hps_io_sdmmc_data0,                 --                         .sdmmc_data0
			hps_io_sdmmc_data1                 => CONNECTED_TO_hps_io_sdmmc_data1,                 --                         .sdmmc_data1
			hps_io_sdmmc_cclk                  => CONNECTED_TO_hps_io_sdmmc_cclk,                  --                         .sdmmc_cclk
			hps_io_sdmmc_data2                 => CONNECTED_TO_hps_io_sdmmc_data2,                 --                         .sdmmc_data2
			hps_io_sdmmc_data3                 => CONNECTED_TO_hps_io_sdmmc_data3,                 --                         .sdmmc_data3
			hps_io_sdmmc_cmd                   => CONNECTED_TO_hps_io_sdmmc_cmd,                   --                         .sdmmc_cmd
			hps_io_usb1_clk                    => CONNECTED_TO_hps_io_usb1_clk,                    --                         .usb1_clk
			hps_io_usb1_stp                    => CONNECTED_TO_hps_io_usb1_stp,                    --                         .usb1_stp
			hps_io_usb1_dir                    => CONNECTED_TO_hps_io_usb1_dir,                    --                         .usb1_dir
			hps_io_usb1_data0                  => CONNECTED_TO_hps_io_usb1_data0,                  --                         .usb1_data0
			hps_io_usb1_data1                  => CONNECTED_TO_hps_io_usb1_data1,                  --                         .usb1_data1
			hps_io_usb1_nxr                    => CONNECTED_TO_hps_io_usb1_nxr,                    --                         .usb1_nxr
			hps_io_usb1_data2                  => CONNECTED_TO_hps_io_usb1_data2,                  --                         .usb1_data2
			hps_io_usb1_data3                  => CONNECTED_TO_hps_io_usb1_data3,                  --                         .usb1_data3
			hps_io_usb1_data4                  => CONNECTED_TO_hps_io_usb1_data4,                  --                         .usb1_data4
			hps_io_usb1_data5                  => CONNECTED_TO_hps_io_usb1_data5,                  --                         .usb1_data5
			hps_io_usb1_data6                  => CONNECTED_TO_hps_io_usb1_data6,                  --                         .usb1_data6
			hps_io_usb1_data7                  => CONNECTED_TO_hps_io_usb1_data7,                  --                         .usb1_data7
			hps_io_emac2_tx_clk                => CONNECTED_TO_hps_io_emac2_tx_clk,                --                         .emac2_tx_clk
			hps_io_emac2_tx_ctl                => CONNECTED_TO_hps_io_emac2_tx_ctl,                --                         .emac2_tx_ctl
			hps_io_emac2_rx_clk                => CONNECTED_TO_hps_io_emac2_rx_clk,                --                         .emac2_rx_clk
			hps_io_emac2_rx_ctl                => CONNECTED_TO_hps_io_emac2_rx_ctl,                --                         .emac2_rx_ctl
			hps_io_emac2_txd0                  => CONNECTED_TO_hps_io_emac2_txd0,                  --                         .emac2_txd0
			hps_io_emac2_txd1                  => CONNECTED_TO_hps_io_emac2_txd1,                  --                         .emac2_txd1
			hps_io_emac2_rxd0                  => CONNECTED_TO_hps_io_emac2_rxd0,                  --                         .emac2_rxd0
			hps_io_emac2_rxd1                  => CONNECTED_TO_hps_io_emac2_rxd1,                  --                         .emac2_rxd1
			hps_io_emac2_txd2                  => CONNECTED_TO_hps_io_emac2_txd2,                  --                         .emac2_txd2
			hps_io_emac2_txd3                  => CONNECTED_TO_hps_io_emac2_txd3,                  --                         .emac2_txd3
			hps_io_emac2_rxd2                  => CONNECTED_TO_hps_io_emac2_rxd2,                  --                         .emac2_rxd2
			hps_io_emac2_rxd3                  => CONNECTED_TO_hps_io_emac2_rxd3,                  --                         .emac2_rxd3
			hps_io_mdio2_mdio                  => CONNECTED_TO_hps_io_mdio2_mdio,                  --                         .mdio2_mdio
			hps_io_mdio2_mdc                   => CONNECTED_TO_hps_io_mdio2_mdc,                   --                         .mdio2_mdc
			hps_io_uart0_tx                    => CONNECTED_TO_hps_io_uart0_tx,                    --                         .uart0_tx
			hps_io_uart0_rx                    => CONNECTED_TO_hps_io_uart0_rx,                    --                         .uart0_rx
			hps_io_i2c0_sda                    => CONNECTED_TO_hps_io_i2c0_sda,                    --                         .i2c0_sda
			hps_io_i2c0_scl                    => CONNECTED_TO_hps_io_i2c0_scl,                    --                         .i2c0_scl
			hps_io_gpio8                       => CONNECTED_TO_hps_io_gpio8,                       --                         .gpio8
			hps_io_gpio9                       => CONNECTED_TO_hps_io_gpio9,                       --                         .gpio9
			hps_io_gpio10                      => CONNECTED_TO_hps_io_gpio10,                      --                         .gpio10
			hps_io_gpio11                      => CONNECTED_TO_hps_io_gpio11,                      --                         .gpio11
			hps_io_gpio28                      => CONNECTED_TO_hps_io_gpio28,                      --                         .gpio28
			hps_io_gpio35                      => CONNECTED_TO_hps_io_gpio35,                      --                         .gpio35
			usb31_io_vbus_det                  => CONNECTED_TO_usb31_io_vbus_det,                  --                 usb31_io.vbus_det
			usb31_io_flt_bar                   => CONNECTED_TO_usb31_io_flt_bar,                   --                         .flt_bar
			usb31_io_usb_ctrl                  => CONNECTED_TO_usb31_io_usb_ctrl,                  --                         .usb_ctrl
			usb31_io_usb31_id                  => CONNECTED_TO_usb31_io_usb31_id,                  --                         .usb31_id
			fpga2hps_interrupt_irq             => CONNECTED_TO_fpga2hps_interrupt_irq,             --       fpga2hps_interrupt.irq
			emif0_csr_axi_clk_clk              => CONNECTED_TO_emif0_csr_axi_clk_clk,              --        emif0_csr_axi_clk.clk
			emif0_csr_axi_rst_reset_n          => CONNECTED_TO_emif0_csr_axi_rst_reset_n,          --        emif0_csr_axi_rst.reset_n
			emif0_csr_axi_arready              => CONNECTED_TO_emif0_csr_axi_arready,              --            emif0_csr_axi.arready
			emif0_csr_axi_awready              => CONNECTED_TO_emif0_csr_axi_awready,              --                         .awready
			emif0_csr_axi_bresp                => CONNECTED_TO_emif0_csr_axi_bresp,                --                         .bresp
			emif0_csr_axi_bvalid               => CONNECTED_TO_emif0_csr_axi_bvalid,               --                         .bvalid
			emif0_csr_axi_rdata                => CONNECTED_TO_emif0_csr_axi_rdata,                --                         .rdata
			emif0_csr_axi_rresp                => CONNECTED_TO_emif0_csr_axi_rresp,                --                         .rresp
			emif0_csr_axi_rvalid               => CONNECTED_TO_emif0_csr_axi_rvalid,               --                         .rvalid
			emif0_csr_axi_wready               => CONNECTED_TO_emif0_csr_axi_wready,               --                         .wready
			emif0_csr_axi_araddr               => CONNECTED_TO_emif0_csr_axi_araddr,               --                         .araddr
			emif0_csr_axi_arvalid              => CONNECTED_TO_emif0_csr_axi_arvalid,              --                         .arvalid
			emif0_csr_axi_awaddr               => CONNECTED_TO_emif0_csr_axi_awaddr,               --                         .awaddr
			emif0_csr_axi_awvalid              => CONNECTED_TO_emif0_csr_axi_awvalid,              --                         .awvalid
			emif0_csr_axi_bready               => CONNECTED_TO_emif0_csr_axi_bready,               --                         .bready
			emif0_csr_axi_rready               => CONNECTED_TO_emif0_csr_axi_rready,               --                         .rready
			emif0_csr_axi_wdata                => CONNECTED_TO_emif0_csr_axi_wdata,                --                         .wdata
			emif0_csr_axi_wstrb                => CONNECTED_TO_emif0_csr_axi_wstrb,                --                         .wstrb
			emif0_csr_axi_wvalid               => CONNECTED_TO_emif0_csr_axi_wvalid,               --                         .wvalid
			emif0_csr_axi_arprot               => CONNECTED_TO_emif0_csr_axi_arprot,               --                         .arprot
			emif0_csr_axi_awprot               => CONNECTED_TO_emif0_csr_axi_awprot,               --                         .awprot
			emif0_ch0_axi_clk_clk              => CONNECTED_TO_emif0_ch0_axi_clk_clk,              --        emif0_ch0_axi_clk.clk
			emif0_ch0_axi_rst_reset_n          => CONNECTED_TO_emif0_ch0_axi_rst_reset_n,          --        emif0_ch0_axi_rst.reset_n
			emif0_ch0_axi_arready              => CONNECTED_TO_emif0_ch0_axi_arready,              --            emif0_ch0_axi.arready
			emif0_ch0_axi_awready              => CONNECTED_TO_emif0_ch0_axi_awready,              --                         .awready
			emif0_ch0_axi_bid                  => CONNECTED_TO_emif0_ch0_axi_bid,                  --                         .bid
			emif0_ch0_axi_bresp                => CONNECTED_TO_emif0_ch0_axi_bresp,                --                         .bresp
			emif0_ch0_axi_bvalid               => CONNECTED_TO_emif0_ch0_axi_bvalid,               --                         .bvalid
			emif0_ch0_axi_rdata                => CONNECTED_TO_emif0_ch0_axi_rdata,                --                         .rdata
			emif0_ch0_axi_rid                  => CONNECTED_TO_emif0_ch0_axi_rid,                  --                         .rid
			emif0_ch0_axi_rlast                => CONNECTED_TO_emif0_ch0_axi_rlast,                --                         .rlast
			emif0_ch0_axi_rresp                => CONNECTED_TO_emif0_ch0_axi_rresp,                --                         .rresp
			emif0_ch0_axi_ruser                => CONNECTED_TO_emif0_ch0_axi_ruser,                --                         .ruser
			emif0_ch0_axi_rvalid               => CONNECTED_TO_emif0_ch0_axi_rvalid,               --                         .rvalid
			emif0_ch0_axi_wready               => CONNECTED_TO_emif0_ch0_axi_wready,               --                         .wready
			emif0_ch0_axi_araddr               => CONNECTED_TO_emif0_ch0_axi_araddr,               --                         .araddr
			emif0_ch0_axi_arburst              => CONNECTED_TO_emif0_ch0_axi_arburst,              --                         .arburst
			emif0_ch0_axi_arid                 => CONNECTED_TO_emif0_ch0_axi_arid,                 --                         .arid
			emif0_ch0_axi_arlen                => CONNECTED_TO_emif0_ch0_axi_arlen,                --                         .arlen
			emif0_ch0_axi_arlock               => CONNECTED_TO_emif0_ch0_axi_arlock,               --                         .arlock
			emif0_ch0_axi_arqos                => CONNECTED_TO_emif0_ch0_axi_arqos,                --                         .arqos
			emif0_ch0_axi_arsize               => CONNECTED_TO_emif0_ch0_axi_arsize,               --                         .arsize
			emif0_ch0_axi_aruser               => CONNECTED_TO_emif0_ch0_axi_aruser,               --                         .aruser
			emif0_ch0_axi_arvalid              => CONNECTED_TO_emif0_ch0_axi_arvalid,              --                         .arvalid
			emif0_ch0_axi_awaddr               => CONNECTED_TO_emif0_ch0_axi_awaddr,               --                         .awaddr
			emif0_ch0_axi_awburst              => CONNECTED_TO_emif0_ch0_axi_awburst,              --                         .awburst
			emif0_ch0_axi_awid                 => CONNECTED_TO_emif0_ch0_axi_awid,                 --                         .awid
			emif0_ch0_axi_awlen                => CONNECTED_TO_emif0_ch0_axi_awlen,                --                         .awlen
			emif0_ch0_axi_awlock               => CONNECTED_TO_emif0_ch0_axi_awlock,               --                         .awlock
			emif0_ch0_axi_awqos                => CONNECTED_TO_emif0_ch0_axi_awqos,                --                         .awqos
			emif0_ch0_axi_awsize               => CONNECTED_TO_emif0_ch0_axi_awsize,               --                         .awsize
			emif0_ch0_axi_awuser               => CONNECTED_TO_emif0_ch0_axi_awuser,               --                         .awuser
			emif0_ch0_axi_awvalid              => CONNECTED_TO_emif0_ch0_axi_awvalid,              --                         .awvalid
			emif0_ch0_axi_bready               => CONNECTED_TO_emif0_ch0_axi_bready,               --                         .bready
			emif0_ch0_axi_rready               => CONNECTED_TO_emif0_ch0_axi_rready,               --                         .rready
			emif0_ch0_axi_wdata                => CONNECTED_TO_emif0_ch0_axi_wdata,                --                         .wdata
			emif0_ch0_axi_wlast                => CONNECTED_TO_emif0_ch0_axi_wlast,                --                         .wlast
			emif0_ch0_axi_wstrb                => CONNECTED_TO_emif0_ch0_axi_wstrb,                --                         .wstrb
			emif0_ch0_axi_wuser                => CONNECTED_TO_emif0_ch0_axi_wuser,                --                         .wuser
			emif0_ch0_axi_wvalid               => CONNECTED_TO_emif0_ch0_axi_wvalid,               --                         .wvalid
			emif0_ch0_axi_arprot               => CONNECTED_TO_emif0_ch0_axi_arprot,               --                         .arprot
			emif0_ch0_axi_awprot               => CONNECTED_TO_emif0_ch0_axi_awprot                --                         .awprot
		);

