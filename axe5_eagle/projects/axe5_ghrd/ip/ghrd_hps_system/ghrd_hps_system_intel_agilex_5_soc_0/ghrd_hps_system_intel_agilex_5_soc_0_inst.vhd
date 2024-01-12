	component ghrd_hps_system_intel_agilex_5_soc_0 is
		port (
			h2f_reset_reset_n                      : out   std_logic;                                         -- reset_n
			hps2fpga_axi_clock_clk                 : in    std_logic                      := 'X';             -- clk
			hps2fpga_axi_reset_reset_n             : in    std_logic                      := 'X';             -- reset_n
			hps2fpga_awid                          : out   std_logic_vector(3 downto 0);                      -- awid
			hps2fpga_awaddr                        : out   std_logic_vector(31 downto 0);                     -- awaddr
			hps2fpga_awlen                         : out   std_logic_vector(7 downto 0);                      -- awlen
			hps2fpga_awsize                        : out   std_logic_vector(2 downto 0);                      -- awsize
			hps2fpga_awburst                       : out   std_logic_vector(1 downto 0);                      -- awburst
			hps2fpga_awlock                        : out   std_logic;                                         -- awlock
			hps2fpga_awcache                       : out   std_logic_vector(3 downto 0);                      -- awcache
			hps2fpga_awprot                        : out   std_logic_vector(2 downto 0);                      -- awprot
			hps2fpga_awvalid                       : out   std_logic;                                         -- awvalid
			hps2fpga_awready                       : in    std_logic                      := 'X';             -- awready
			hps2fpga_wdata                         : out   std_logic_vector(31 downto 0);                     -- wdata
			hps2fpga_wstrb                         : out   std_logic_vector(3 downto 0);                      -- wstrb
			hps2fpga_wlast                         : out   std_logic;                                         -- wlast
			hps2fpga_wvalid                        : out   std_logic;                                         -- wvalid
			hps2fpga_wready                        : in    std_logic                      := 'X';             -- wready
			hps2fpga_bid                           : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- bid
			hps2fpga_bresp                         : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			hps2fpga_bvalid                        : in    std_logic                      := 'X';             -- bvalid
			hps2fpga_bready                        : out   std_logic;                                         -- bready
			hps2fpga_arid                          : out   std_logic_vector(3 downto 0);                      -- arid
			hps2fpga_araddr                        : out   std_logic_vector(31 downto 0);                     -- araddr
			hps2fpga_arlen                         : out   std_logic_vector(7 downto 0);                      -- arlen
			hps2fpga_arsize                        : out   std_logic_vector(2 downto 0);                      -- arsize
			hps2fpga_arburst                       : out   std_logic_vector(1 downto 0);                      -- arburst
			hps2fpga_arlock                        : out   std_logic;                                         -- arlock
			hps2fpga_arcache                       : out   std_logic_vector(3 downto 0);                      -- arcache
			hps2fpga_arprot                        : out   std_logic_vector(2 downto 0);                      -- arprot
			hps2fpga_arvalid                       : out   std_logic;                                         -- arvalid
			hps2fpga_arready                       : in    std_logic                      := 'X';             -- arready
			hps2fpga_rid                           : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- rid
			hps2fpga_rdata                         : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- rdata
			hps2fpga_rresp                         : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			hps2fpga_rlast                         : in    std_logic                      := 'X';             -- rlast
			hps2fpga_rvalid                        : in    std_logic                      := 'X';             -- rvalid
			hps2fpga_rready                        : out   std_logic;                                         -- rready
			lwhps2fpga_axi_clock_clk               : in    std_logic                      := 'X';             -- clk
			lwhps2fpga_axi_reset_reset_n           : in    std_logic                      := 'X';             -- reset_n
			lwhps2fpga_awid                        : out   std_logic_vector(3 downto 0);                      -- awid
			lwhps2fpga_awaddr                      : out   std_logic_vector(28 downto 0);                     -- awaddr
			lwhps2fpga_awlen                       : out   std_logic_vector(7 downto 0);                      -- awlen
			lwhps2fpga_awsize                      : out   std_logic_vector(2 downto 0);                      -- awsize
			lwhps2fpga_awburst                     : out   std_logic_vector(1 downto 0);                      -- awburst
			lwhps2fpga_awlock                      : out   std_logic;                                         -- awlock
			lwhps2fpga_awcache                     : out   std_logic_vector(3 downto 0);                      -- awcache
			lwhps2fpga_awprot                      : out   std_logic_vector(2 downto 0);                      -- awprot
			lwhps2fpga_awvalid                     : out   std_logic;                                         -- awvalid
			lwhps2fpga_awready                     : in    std_logic                      := 'X';             -- awready
			lwhps2fpga_wdata                       : out   std_logic_vector(31 downto 0);                     -- wdata
			lwhps2fpga_wstrb                       : out   std_logic_vector(3 downto 0);                      -- wstrb
			lwhps2fpga_wlast                       : out   std_logic;                                         -- wlast
			lwhps2fpga_wvalid                      : out   std_logic;                                         -- wvalid
			lwhps2fpga_wready                      : in    std_logic                      := 'X';             -- wready
			lwhps2fpga_bid                         : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- bid
			lwhps2fpga_bresp                       : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			lwhps2fpga_bvalid                      : in    std_logic                      := 'X';             -- bvalid
			lwhps2fpga_bready                      : out   std_logic;                                         -- bready
			lwhps2fpga_arid                        : out   std_logic_vector(3 downto 0);                      -- arid
			lwhps2fpga_araddr                      : out   std_logic_vector(28 downto 0);                     -- araddr
			lwhps2fpga_arlen                       : out   std_logic_vector(7 downto 0);                      -- arlen
			lwhps2fpga_arsize                      : out   std_logic_vector(2 downto 0);                      -- arsize
			lwhps2fpga_arburst                     : out   std_logic_vector(1 downto 0);                      -- arburst
			lwhps2fpga_arlock                      : out   std_logic;                                         -- arlock
			lwhps2fpga_arcache                     : out   std_logic_vector(3 downto 0);                      -- arcache
			lwhps2fpga_arprot                      : out   std_logic_vector(2 downto 0);                      -- arprot
			lwhps2fpga_arvalid                     : out   std_logic;                                         -- arvalid
			lwhps2fpga_arready                     : in    std_logic                      := 'X';             -- arready
			lwhps2fpga_rid                         : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- rid
			lwhps2fpga_rdata                       : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- rdata
			lwhps2fpga_rresp                       : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			lwhps2fpga_rlast                       : in    std_logic                      := 'X';             -- rlast
			lwhps2fpga_rvalid                      : in    std_logic                      := 'X';             -- rvalid
			lwhps2fpga_rready                      : out   std_logic;                                         -- rready
			emac_ptp_clk_clk                       : in    std_logic                      := 'X';             -- clk
			emac_timestamp_clk_clk                 : in    std_logic                      := 'X';             -- clk
			emac_timestamp_data_data_in            : in    std_logic_vector(63 downto 0)  := (others => 'X'); -- data_in
			emac0_mdio_mac_mdc                     : out   std_logic;                                         -- mac_mdc
			emac0_mdio_mac_mdi                     : in    std_logic                      := 'X';             -- mac_mdi
			emac0_mdio_mac_mdo                     : out   std_logic;                                         -- mac_mdo
			emac0_mdio_mac_mdoe                    : out   std_logic;                                         -- mac_mdoe
			emac0_app_rst_reset_n                  : out   std_logic;                                         -- reset_n
			emac0_mac_tx_clk_o                     : out   std_logic;                                         -- mac_tx_clk_o
			emac0_mac_tx_clk_i                     : in    std_logic                      := 'X';             -- mac_tx_clk_i
			emac0_mac_rx_clk                       : in    std_logic                      := 'X';             -- mac_rx_clk
			emac0_mac_rst_tx_n                     : out   std_logic;                                         -- mac_rst_tx_n
			emac0_mac_rst_rx_n                     : out   std_logic;                                         -- mac_rst_rx_n
			emac0_mac_txen                         : out   std_logic;                                         -- mac_txen
			emac0_mac_txer                         : out   std_logic;                                         -- mac_txer
			emac0_mac_rxdv                         : in    std_logic                      := 'X';             -- mac_rxdv
			emac0_mac_rxer                         : in    std_logic                      := 'X';             -- mac_rxer
			emac0_mac_rxd                          : in    std_logic_vector(7 downto 0)   := (others => 'X'); -- mac_rxd
			emac0_mac_col                          : in    std_logic                      := 'X';             -- mac_col
			emac0_mac_crs                          : in    std_logic                      := 'X';             -- mac_crs
			emac0_mac_speed                        : out   std_logic_vector(2 downto 0);                      -- mac_speed
			emac0_mac_txd_o                        : out   std_logic_vector(7 downto 0);                      -- mac_txd_o
			emac2_app_rst_reset_n                  : out   std_logic;                                         -- reset_n
			spim0_miso_i                           : in    std_logic                      := 'X';             -- miso_i
			spim0_mosi_o                           : out   std_logic;                                         -- mosi_o
			spim0_mosi_oe                          : out   std_logic;                                         -- mosi_oe
			spim0_ss_in_n                          : in    std_logic                      := 'X';             -- ss_in_n
			spim0_ss0_n_o                          : out   std_logic;                                         -- ss0_n_o
			spim0_ss1_n_o                          : out   std_logic;                                         -- ss1_n_o
			spim0_ss2_n_o                          : out   std_logic;                                         -- ss2_n_o
			spim0_ss3_n_o                          : out   std_logic;                                         -- ss3_n_o
			spim0_sclk_out_clk                     : out   std_logic;                                         -- clk
			I2C1_scl_i_clk                         : in    std_logic                      := 'X';             -- clk
			I2C1_scl_oe_clk                        : out   std_logic;                                         -- clk
			I2C1_sda_i                             : in    std_logic                      := 'X';             -- sda_i
			I2C1_sda_oe                            : out   std_logic;                                         -- sda_oe
			h2f_user0_clk_clk                      : out   std_logic;                                         -- clk
			h2f_user1_clk_clk                      : out   std_logic;                                         -- clk
			h2f_warm_reset_handshake_reset_req     : out   std_logic;                                         -- reset_req
			h2f_warm_reset_handshake_reset_ack     : in    std_logic                      := 'X';             -- reset_ack
			h2f_cold_reset_reset_n                 : out   std_logic;                                         -- reset_n
			hps_io_hps_osc_clk                     : in    std_logic                      := 'X';             -- hps_osc_clk
			hps_io_sdmmc_data0                     : inout std_logic                      := 'X';             -- sdmmc_data0
			hps_io_sdmmc_data1                     : inout std_logic                      := 'X';             -- sdmmc_data1
			hps_io_sdmmc_cclk                      : out   std_logic;                                         -- sdmmc_cclk
			hps_io_sdmmc_data2                     : inout std_logic                      := 'X';             -- sdmmc_data2
			hps_io_sdmmc_data3                     : inout std_logic                      := 'X';             -- sdmmc_data3
			hps_io_sdmmc_cmd                       : inout std_logic                      := 'X';             -- sdmmc_cmd
			hps_io_usb1_clk                        : in    std_logic                      := 'X';             -- usb1_clk
			hps_io_usb1_stp                        : out   std_logic;                                         -- usb1_stp
			hps_io_usb1_dir                        : in    std_logic                      := 'X';             -- usb1_dir
			hps_io_usb1_data0                      : inout std_logic                      := 'X';             -- usb1_data0
			hps_io_usb1_data1                      : inout std_logic                      := 'X';             -- usb1_data1
			hps_io_usb1_nxt                        : in    std_logic                      := 'X';             -- usb1_nxt
			hps_io_usb1_data2                      : inout std_logic                      := 'X';             -- usb1_data2
			hps_io_usb1_data3                      : inout std_logic                      := 'X';             -- usb1_data3
			hps_io_usb1_data4                      : inout std_logic                      := 'X';             -- usb1_data4
			hps_io_usb1_data5                      : inout std_logic                      := 'X';             -- usb1_data5
			hps_io_usb1_data6                      : inout std_logic                      := 'X';             -- usb1_data6
			hps_io_usb1_data7                      : inout std_logic                      := 'X';             -- usb1_data7
			hps_io_emac2_tx_clk                    : out   std_logic;                                         -- emac2_tx_clk
			hps_io_emac2_tx_ctl                    : out   std_logic;                                         -- emac2_tx_ctl
			hps_io_emac2_rx_clk                    : in    std_logic                      := 'X';             -- emac2_rx_clk
			hps_io_emac2_rx_ctl                    : in    std_logic                      := 'X';             -- emac2_rx_ctl
			hps_io_emac2_txd0                      : out   std_logic;                                         -- emac2_txd0
			hps_io_emac2_txd1                      : out   std_logic;                                         -- emac2_txd1
			hps_io_emac2_rxd0                      : in    std_logic                      := 'X';             -- emac2_rxd0
			hps_io_emac2_rxd1                      : in    std_logic                      := 'X';             -- emac2_rxd1
			hps_io_emac2_txd2                      : out   std_logic;                                         -- emac2_txd2
			hps_io_emac2_txd3                      : out   std_logic;                                         -- emac2_txd3
			hps_io_emac2_rxd2                      : in    std_logic                      := 'X';             -- emac2_rxd2
			hps_io_emac2_rxd3                      : in    std_logic                      := 'X';             -- emac2_rxd3
			hps_io_mdio2_mdio                      : inout std_logic                      := 'X';             -- mdio2_mdio
			hps_io_mdio2_mdc                       : out   std_logic;                                         -- mdio2_mdc
			hps_io_uart0_tx                        : out   std_logic;                                         -- uart0_tx
			hps_io_uart0_rx                        : in    std_logic                      := 'X';             -- uart0_rx
			hps_io_i2c0_sda                        : inout std_logic                      := 'X';             -- i2c0_sda
			hps_io_i2c0_scl                        : inout std_logic                      := 'X';             -- i2c0_scl
			hps_io_gpio6                           : inout std_logic                      := 'X';             -- gpio6
			hps_io_gpio7                           : inout std_logic                      := 'X';             -- gpio7
			hps_io_gpio8                           : inout std_logic                      := 'X';             -- gpio8
			hps_io_gpio9                           : inout std_logic                      := 'X';             -- gpio9
			hps_io_gpio10                          : inout std_logic                      := 'X';             -- gpio10
			hps_io_gpio28                          : inout std_logic                      := 'X';             -- gpio28
			hps_io_gpio34                          : inout std_logic                      := 'X';             -- gpio34
			hps_io_gpio35                          : inout std_logic                      := 'X';             -- gpio35
			usb31_io_vbus_det                      : in    std_logic                      := 'X';             -- vbus_det
			usb31_io_flt_bar                       : in    std_logic                      := 'X';             -- flt_bar
			usb31_io_usb_ctrl                      : out   std_logic_vector(1 downto 0);                      -- usb_ctrl
			usb31_io_usb31_id                      : in    std_logic                      := 'X';             -- usb31_id
			fpga2hps_interrupt_irq                 : in    std_logic_vector(62 downto 0)  := (others => 'X'); -- irq
			usb31_phy_pma_cpu_clk_clk              : in    std_logic                      := 'X';             -- clk
			usb31_phy_refclk_p_clk                 : in    std_logic                      := 'X';             -- clk
			usb31_phy_refclk_n_clk                 : in    std_logic                      := 'X';             -- clk
			usb31_phy_rx_serial_n_i_rx_serial_n    : in    std_logic                      := 'X';             -- i_rx_serial_n
			usb31_phy_rx_serial_p_i_rx_serial_p    : in    std_logic                      := 'X';             -- i_rx_serial_p
			usb31_phy_tx_serial_n_o_tx_serial_n    : out   std_logic;                                         -- o_tx_serial_n
			usb31_phy_tx_serial_p_o_tx_serial_p    : out   std_logic;                                         -- o_tx_serial_p
			usb31_phy_reconfig_rst_reset           : in    std_logic                      := 'X';             -- reset
			usb31_phy_reconfig_clk_clk             : in    std_logic                      := 'X';             -- clk
			usb31_phy_reconfig_slave_address       : in    std_logic_vector(20 downto 0)  := (others => 'X'); -- address
			usb31_phy_reconfig_slave_byteenable    : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			usb31_phy_reconfig_slave_readdatavalid : out   std_logic;                                         -- readdatavalid
			usb31_phy_reconfig_slave_read          : in    std_logic                      := 'X';             -- read
			usb31_phy_reconfig_slave_write         : in    std_logic                      := 'X';             -- write
			usb31_phy_reconfig_slave_readdata      : out   std_logic_vector(31 downto 0);                     -- readdata
			usb31_phy_reconfig_slave_writedata     : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			usb31_phy_reconfig_slave_waitrequest   : out   std_logic;                                         -- waitrequest
			f2sdram_axi_clock_clk                  : in    std_logic                      := 'X';             -- clk
			f2sdram_axi_reset_reset_n              : in    std_logic                      := 'X';             -- reset_n
			f2sdram_araddr                         : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- araddr
			f2sdram_arburst                        : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- arburst
			f2sdram_arcache                        : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- arcache
			f2sdram_arid                           : in    std_logic_vector(4 downto 0)   := (others => 'X'); -- arid
			f2sdram_arlen                          : in    std_logic_vector(7 downto 0)   := (others => 'X'); -- arlen
			f2sdram_arlock                         : in    std_logic                      := 'X';             -- arlock
			f2sdram_arprot                         : in    std_logic_vector(2 downto 0)   := (others => 'X'); -- arprot
			f2sdram_arqos                          : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- arqos
			f2sdram_arready                        : out   std_logic;                                         -- arready
			f2sdram_arsize                         : in    std_logic_vector(2 downto 0)   := (others => 'X'); -- arsize
			f2sdram_arvalid                        : in    std_logic                      := 'X';             -- arvalid
			f2sdram_awaddr                         : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- awaddr
			f2sdram_awburst                        : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- awburst
			f2sdram_awcache                        : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- awcache
			f2sdram_awid                           : in    std_logic_vector(4 downto 0)   := (others => 'X'); -- awid
			f2sdram_awlen                          : in    std_logic_vector(7 downto 0)   := (others => 'X'); -- awlen
			f2sdram_awlock                         : in    std_logic                      := 'X';             -- awlock
			f2sdram_awprot                         : in    std_logic_vector(2 downto 0)   := (others => 'X'); -- awprot
			f2sdram_awqos                          : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- awqos
			f2sdram_awready                        : out   std_logic;                                         -- awready
			f2sdram_awsize                         : in    std_logic_vector(2 downto 0)   := (others => 'X'); -- awsize
			f2sdram_awvalid                        : in    std_logic                      := 'X';             -- awvalid
			f2sdram_bid                            : out   std_logic_vector(4 downto 0);                      -- bid
			f2sdram_bready                         : in    std_logic                      := 'X';             -- bready
			f2sdram_bresp                          : out   std_logic_vector(1 downto 0);                      -- bresp
			f2sdram_bvalid                         : out   std_logic;                                         -- bvalid
			f2sdram_rdata                          : out   std_logic_vector(63 downto 0);                     -- rdata
			f2sdram_rid                            : out   std_logic_vector(4 downto 0);                      -- rid
			f2sdram_rlast                          : out   std_logic;                                         -- rlast
			f2sdram_rready                         : in    std_logic                      := 'X';             -- rready
			f2sdram_rresp                          : out   std_logic_vector(1 downto 0);                      -- rresp
			f2sdram_rvalid                         : out   std_logic;                                         -- rvalid
			f2sdram_wdata                          : in    std_logic_vector(63 downto 0)  := (others => 'X'); -- wdata
			f2sdram_wlast                          : in    std_logic                      := 'X';             -- wlast
			f2sdram_wready                         : out   std_logic;                                         -- wready
			f2sdram_wstrb                          : in    std_logic_vector(7 downto 0)   := (others => 'X'); -- wstrb
			f2sdram_wvalid                         : in    std_logic                      := 'X';             -- wvalid
			f2sdram_aruser                         : in    std_logic_vector(7 downto 0)   := (others => 'X'); -- aruser
			f2sdram_awuser                         : in    std_logic_vector(7 downto 0)   := (others => 'X'); -- awuser
			f2sdram_wuser                          : in    std_logic_vector(7 downto 0)   := (others => 'X'); -- wuser
			f2sdram_buser                          : out   std_logic_vector(7 downto 0);                      -- buser
			f2sdram_arregion                       : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- arregion
			f2sdram_ruser                          : out   std_logic_vector(7 downto 0);                      -- ruser
			f2sdram_awregion                       : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- awregion
			io96b0_csr_axi_clk_clk                 : in    std_logic                      := 'X';             -- clk
			io96b0_csr_axi_rst_reset_n             : in    std_logic                      := 'X';             -- reset_n
			io96b0_csr_axi_arready                 : in    std_logic                      := 'X';             -- arready
			io96b0_csr_axi_awready                 : in    std_logic                      := 'X';             -- awready
			io96b0_csr_axi_bresp                   : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			io96b0_csr_axi_bvalid                  : in    std_logic                      := 'X';             -- bvalid
			io96b0_csr_axi_rdata                   : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- rdata
			io96b0_csr_axi_rresp                   : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			io96b0_csr_axi_rvalid                  : in    std_logic                      := 'X';             -- rvalid
			io96b0_csr_axi_wready                  : in    std_logic                      := 'X';             -- wready
			io96b0_csr_axi_araddr                  : out   std_logic_vector(31 downto 0);                     -- araddr
			io96b0_csr_axi_arvalid                 : out   std_logic;                                         -- arvalid
			io96b0_csr_axi_awaddr                  : out   std_logic_vector(31 downto 0);                     -- awaddr
			io96b0_csr_axi_awvalid                 : out   std_logic;                                         -- awvalid
			io96b0_csr_axi_bready                  : out   std_logic;                                         -- bready
			io96b0_csr_axi_rready                  : out   std_logic;                                         -- rready
			io96b0_csr_axi_wdata                   : out   std_logic_vector(31 downto 0);                     -- wdata
			io96b0_csr_axi_wstrb                   : out   std_logic_vector(3 downto 0);                      -- wstrb
			io96b0_csr_axi_wvalid                  : out   std_logic;                                         -- wvalid
			io96b0_csr_axi_arprot                  : out   std_logic_vector(2 downto 0);                      -- arprot
			io96b0_csr_axi_awprot                  : out   std_logic_vector(2 downto 0);                      -- awprot
			io96b0_ch0_axi_clk_clk                 : in    std_logic                      := 'X';             -- clk
			io96b0_ch0_axi_rst_reset_n             : in    std_logic                      := 'X';             -- reset_n
			io96b0_ch0_axi_arready                 : in    std_logic                      := 'X';             -- arready
			io96b0_ch0_axi_awready                 : in    std_logic                      := 'X';             -- awready
			io96b0_ch0_axi_bid                     : in    std_logic_vector(6 downto 0)   := (others => 'X'); -- bid
			io96b0_ch0_axi_bresp                   : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			io96b0_ch0_axi_bvalid                  : in    std_logic                      := 'X';             -- bvalid
			io96b0_ch0_axi_rdata                   : in    std_logic_vector(255 downto 0) := (others => 'X'); -- rdata
			io96b0_ch0_axi_rid                     : in    std_logic_vector(6 downto 0)   := (others => 'X'); -- rid
			io96b0_ch0_axi_rlast                   : in    std_logic                      := 'X';             -- rlast
			io96b0_ch0_axi_rresp                   : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			io96b0_ch0_axi_ruser                   : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- ruser
			io96b0_ch0_axi_rvalid                  : in    std_logic                      := 'X';             -- rvalid
			io96b0_ch0_axi_wready                  : in    std_logic                      := 'X';             -- wready
			io96b0_ch0_axi_araddr                  : out   std_logic_vector(43 downto 0);                     -- araddr
			io96b0_ch0_axi_arburst                 : out   std_logic_vector(1 downto 0);                      -- arburst
			io96b0_ch0_axi_arid                    : out   std_logic_vector(6 downto 0);                      -- arid
			io96b0_ch0_axi_arlen                   : out   std_logic_vector(7 downto 0);                      -- arlen
			io96b0_ch0_axi_arlock                  : out   std_logic;                                         -- arlock
			io96b0_ch0_axi_arqos                   : out   std_logic_vector(3 downto 0);                      -- arqos
			io96b0_ch0_axi_arsize                  : out   std_logic_vector(2 downto 0);                      -- arsize
			io96b0_ch0_axi_aruser                  : out   std_logic_vector(13 downto 0);                     -- aruser
			io96b0_ch0_axi_arvalid                 : out   std_logic;                                         -- arvalid
			io96b0_ch0_axi_awaddr                  : out   std_logic_vector(43 downto 0);                     -- awaddr
			io96b0_ch0_axi_awburst                 : out   std_logic_vector(1 downto 0);                      -- awburst
			io96b0_ch0_axi_awid                    : out   std_logic_vector(6 downto 0);                      -- awid
			io96b0_ch0_axi_awlen                   : out   std_logic_vector(7 downto 0);                      -- awlen
			io96b0_ch0_axi_awlock                  : out   std_logic;                                         -- awlock
			io96b0_ch0_axi_awqos                   : out   std_logic_vector(3 downto 0);                      -- awqos
			io96b0_ch0_axi_awsize                  : out   std_logic_vector(2 downto 0);                      -- awsize
			io96b0_ch0_axi_awuser                  : out   std_logic_vector(13 downto 0);                     -- awuser
			io96b0_ch0_axi_awvalid                 : out   std_logic;                                         -- awvalid
			io96b0_ch0_axi_bready                  : out   std_logic;                                         -- bready
			io96b0_ch0_axi_rready                  : out   std_logic;                                         -- rready
			io96b0_ch0_axi_wdata                   : out   std_logic_vector(255 downto 0);                    -- wdata
			io96b0_ch0_axi_wlast                   : out   std_logic;                                         -- wlast
			io96b0_ch0_axi_wstrb                   : out   std_logic_vector(31 downto 0);                     -- wstrb
			io96b0_ch0_axi_wuser                   : out   std_logic_vector(31 downto 0);                     -- wuser
			io96b0_ch0_axi_wvalid                  : out   std_logic;                                         -- wvalid
			io96b0_ch0_axi_arprot                  : out   std_logic_vector(2 downto 0);                      -- arprot
			io96b0_ch0_axi_awprot                  : out   std_logic_vector(2 downto 0)                       -- awprot
		);
	end component ghrd_hps_system_intel_agilex_5_soc_0;

	u0 : component ghrd_hps_system_intel_agilex_5_soc_0
		port map (
			h2f_reset_reset_n                      => CONNECTED_TO_h2f_reset_reset_n,                      --                h2f_reset.reset_n
			hps2fpga_axi_clock_clk                 => CONNECTED_TO_hps2fpga_axi_clock_clk,                 --       hps2fpga_axi_clock.clk
			hps2fpga_axi_reset_reset_n             => CONNECTED_TO_hps2fpga_axi_reset_reset_n,             --       hps2fpga_axi_reset.reset_n
			hps2fpga_awid                          => CONNECTED_TO_hps2fpga_awid,                          --                 hps2fpga.awid
			hps2fpga_awaddr                        => CONNECTED_TO_hps2fpga_awaddr,                        --                         .awaddr
			hps2fpga_awlen                         => CONNECTED_TO_hps2fpga_awlen,                         --                         .awlen
			hps2fpga_awsize                        => CONNECTED_TO_hps2fpga_awsize,                        --                         .awsize
			hps2fpga_awburst                       => CONNECTED_TO_hps2fpga_awburst,                       --                         .awburst
			hps2fpga_awlock                        => CONNECTED_TO_hps2fpga_awlock,                        --                         .awlock
			hps2fpga_awcache                       => CONNECTED_TO_hps2fpga_awcache,                       --                         .awcache
			hps2fpga_awprot                        => CONNECTED_TO_hps2fpga_awprot,                        --                         .awprot
			hps2fpga_awvalid                       => CONNECTED_TO_hps2fpga_awvalid,                       --                         .awvalid
			hps2fpga_awready                       => CONNECTED_TO_hps2fpga_awready,                       --                         .awready
			hps2fpga_wdata                         => CONNECTED_TO_hps2fpga_wdata,                         --                         .wdata
			hps2fpga_wstrb                         => CONNECTED_TO_hps2fpga_wstrb,                         --                         .wstrb
			hps2fpga_wlast                         => CONNECTED_TO_hps2fpga_wlast,                         --                         .wlast
			hps2fpga_wvalid                        => CONNECTED_TO_hps2fpga_wvalid,                        --                         .wvalid
			hps2fpga_wready                        => CONNECTED_TO_hps2fpga_wready,                        --                         .wready
			hps2fpga_bid                           => CONNECTED_TO_hps2fpga_bid,                           --                         .bid
			hps2fpga_bresp                         => CONNECTED_TO_hps2fpga_bresp,                         --                         .bresp
			hps2fpga_bvalid                        => CONNECTED_TO_hps2fpga_bvalid,                        --                         .bvalid
			hps2fpga_bready                        => CONNECTED_TO_hps2fpga_bready,                        --                         .bready
			hps2fpga_arid                          => CONNECTED_TO_hps2fpga_arid,                          --                         .arid
			hps2fpga_araddr                        => CONNECTED_TO_hps2fpga_araddr,                        --                         .araddr
			hps2fpga_arlen                         => CONNECTED_TO_hps2fpga_arlen,                         --                         .arlen
			hps2fpga_arsize                        => CONNECTED_TO_hps2fpga_arsize,                        --                         .arsize
			hps2fpga_arburst                       => CONNECTED_TO_hps2fpga_arburst,                       --                         .arburst
			hps2fpga_arlock                        => CONNECTED_TO_hps2fpga_arlock,                        --                         .arlock
			hps2fpga_arcache                       => CONNECTED_TO_hps2fpga_arcache,                       --                         .arcache
			hps2fpga_arprot                        => CONNECTED_TO_hps2fpga_arprot,                        --                         .arprot
			hps2fpga_arvalid                       => CONNECTED_TO_hps2fpga_arvalid,                       --                         .arvalid
			hps2fpga_arready                       => CONNECTED_TO_hps2fpga_arready,                       --                         .arready
			hps2fpga_rid                           => CONNECTED_TO_hps2fpga_rid,                           --                         .rid
			hps2fpga_rdata                         => CONNECTED_TO_hps2fpga_rdata,                         --                         .rdata
			hps2fpga_rresp                         => CONNECTED_TO_hps2fpga_rresp,                         --                         .rresp
			hps2fpga_rlast                         => CONNECTED_TO_hps2fpga_rlast,                         --                         .rlast
			hps2fpga_rvalid                        => CONNECTED_TO_hps2fpga_rvalid,                        --                         .rvalid
			hps2fpga_rready                        => CONNECTED_TO_hps2fpga_rready,                        --                         .rready
			lwhps2fpga_axi_clock_clk               => CONNECTED_TO_lwhps2fpga_axi_clock_clk,               --     lwhps2fpga_axi_clock.clk
			lwhps2fpga_axi_reset_reset_n           => CONNECTED_TO_lwhps2fpga_axi_reset_reset_n,           --     lwhps2fpga_axi_reset.reset_n
			lwhps2fpga_awid                        => CONNECTED_TO_lwhps2fpga_awid,                        --               lwhps2fpga.awid
			lwhps2fpga_awaddr                      => CONNECTED_TO_lwhps2fpga_awaddr,                      --                         .awaddr
			lwhps2fpga_awlen                       => CONNECTED_TO_lwhps2fpga_awlen,                       --                         .awlen
			lwhps2fpga_awsize                      => CONNECTED_TO_lwhps2fpga_awsize,                      --                         .awsize
			lwhps2fpga_awburst                     => CONNECTED_TO_lwhps2fpga_awburst,                     --                         .awburst
			lwhps2fpga_awlock                      => CONNECTED_TO_lwhps2fpga_awlock,                      --                         .awlock
			lwhps2fpga_awcache                     => CONNECTED_TO_lwhps2fpga_awcache,                     --                         .awcache
			lwhps2fpga_awprot                      => CONNECTED_TO_lwhps2fpga_awprot,                      --                         .awprot
			lwhps2fpga_awvalid                     => CONNECTED_TO_lwhps2fpga_awvalid,                     --                         .awvalid
			lwhps2fpga_awready                     => CONNECTED_TO_lwhps2fpga_awready,                     --                         .awready
			lwhps2fpga_wdata                       => CONNECTED_TO_lwhps2fpga_wdata,                       --                         .wdata
			lwhps2fpga_wstrb                       => CONNECTED_TO_lwhps2fpga_wstrb,                       --                         .wstrb
			lwhps2fpga_wlast                       => CONNECTED_TO_lwhps2fpga_wlast,                       --                         .wlast
			lwhps2fpga_wvalid                      => CONNECTED_TO_lwhps2fpga_wvalid,                      --                         .wvalid
			lwhps2fpga_wready                      => CONNECTED_TO_lwhps2fpga_wready,                      --                         .wready
			lwhps2fpga_bid                         => CONNECTED_TO_lwhps2fpga_bid,                         --                         .bid
			lwhps2fpga_bresp                       => CONNECTED_TO_lwhps2fpga_bresp,                       --                         .bresp
			lwhps2fpga_bvalid                      => CONNECTED_TO_lwhps2fpga_bvalid,                      --                         .bvalid
			lwhps2fpga_bready                      => CONNECTED_TO_lwhps2fpga_bready,                      --                         .bready
			lwhps2fpga_arid                        => CONNECTED_TO_lwhps2fpga_arid,                        --                         .arid
			lwhps2fpga_araddr                      => CONNECTED_TO_lwhps2fpga_araddr,                      --                         .araddr
			lwhps2fpga_arlen                       => CONNECTED_TO_lwhps2fpga_arlen,                       --                         .arlen
			lwhps2fpga_arsize                      => CONNECTED_TO_lwhps2fpga_arsize,                      --                         .arsize
			lwhps2fpga_arburst                     => CONNECTED_TO_lwhps2fpga_arburst,                     --                         .arburst
			lwhps2fpga_arlock                      => CONNECTED_TO_lwhps2fpga_arlock,                      --                         .arlock
			lwhps2fpga_arcache                     => CONNECTED_TO_lwhps2fpga_arcache,                     --                         .arcache
			lwhps2fpga_arprot                      => CONNECTED_TO_lwhps2fpga_arprot,                      --                         .arprot
			lwhps2fpga_arvalid                     => CONNECTED_TO_lwhps2fpga_arvalid,                     --                         .arvalid
			lwhps2fpga_arready                     => CONNECTED_TO_lwhps2fpga_arready,                     --                         .arready
			lwhps2fpga_rid                         => CONNECTED_TO_lwhps2fpga_rid,                         --                         .rid
			lwhps2fpga_rdata                       => CONNECTED_TO_lwhps2fpga_rdata,                       --                         .rdata
			lwhps2fpga_rresp                       => CONNECTED_TO_lwhps2fpga_rresp,                       --                         .rresp
			lwhps2fpga_rlast                       => CONNECTED_TO_lwhps2fpga_rlast,                       --                         .rlast
			lwhps2fpga_rvalid                      => CONNECTED_TO_lwhps2fpga_rvalid,                      --                         .rvalid
			lwhps2fpga_rready                      => CONNECTED_TO_lwhps2fpga_rready,                      --                         .rready
			emac_ptp_clk_clk                       => CONNECTED_TO_emac_ptp_clk_clk,                       --             emac_ptp_clk.clk
			emac_timestamp_clk_clk                 => CONNECTED_TO_emac_timestamp_clk_clk,                 --       emac_timestamp_clk.clk
			emac_timestamp_data_data_in            => CONNECTED_TO_emac_timestamp_data_data_in,            --      emac_timestamp_data.data_in
			emac0_mdio_mac_mdc                     => CONNECTED_TO_emac0_mdio_mac_mdc,                     --               emac0_mdio.mac_mdc
			emac0_mdio_mac_mdi                     => CONNECTED_TO_emac0_mdio_mac_mdi,                     --                         .mac_mdi
			emac0_mdio_mac_mdo                     => CONNECTED_TO_emac0_mdio_mac_mdo,                     --                         .mac_mdo
			emac0_mdio_mac_mdoe                    => CONNECTED_TO_emac0_mdio_mac_mdoe,                    --                         .mac_mdoe
			emac0_app_rst_reset_n                  => CONNECTED_TO_emac0_app_rst_reset_n,                  --            emac0_app_rst.reset_n
			emac0_mac_tx_clk_o                     => CONNECTED_TO_emac0_mac_tx_clk_o,                     --                    emac0.mac_tx_clk_o
			emac0_mac_tx_clk_i                     => CONNECTED_TO_emac0_mac_tx_clk_i,                     --                         .mac_tx_clk_i
			emac0_mac_rx_clk                       => CONNECTED_TO_emac0_mac_rx_clk,                       --                         .mac_rx_clk
			emac0_mac_rst_tx_n                     => CONNECTED_TO_emac0_mac_rst_tx_n,                     --                         .mac_rst_tx_n
			emac0_mac_rst_rx_n                     => CONNECTED_TO_emac0_mac_rst_rx_n,                     --                         .mac_rst_rx_n
			emac0_mac_txen                         => CONNECTED_TO_emac0_mac_txen,                         --                         .mac_txen
			emac0_mac_txer                         => CONNECTED_TO_emac0_mac_txer,                         --                         .mac_txer
			emac0_mac_rxdv                         => CONNECTED_TO_emac0_mac_rxdv,                         --                         .mac_rxdv
			emac0_mac_rxer                         => CONNECTED_TO_emac0_mac_rxer,                         --                         .mac_rxer
			emac0_mac_rxd                          => CONNECTED_TO_emac0_mac_rxd,                          --                         .mac_rxd
			emac0_mac_col                          => CONNECTED_TO_emac0_mac_col,                          --                         .mac_col
			emac0_mac_crs                          => CONNECTED_TO_emac0_mac_crs,                          --                         .mac_crs
			emac0_mac_speed                        => CONNECTED_TO_emac0_mac_speed,                        --                         .mac_speed
			emac0_mac_txd_o                        => CONNECTED_TO_emac0_mac_txd_o,                        --                         .mac_txd_o
			emac2_app_rst_reset_n                  => CONNECTED_TO_emac2_app_rst_reset_n,                  --            emac2_app_rst.reset_n
			spim0_miso_i                           => CONNECTED_TO_spim0_miso_i,                           --                    spim0.miso_i
			spim0_mosi_o                           => CONNECTED_TO_spim0_mosi_o,                           --                         .mosi_o
			spim0_mosi_oe                          => CONNECTED_TO_spim0_mosi_oe,                          --                         .mosi_oe
			spim0_ss_in_n                          => CONNECTED_TO_spim0_ss_in_n,                          --                         .ss_in_n
			spim0_ss0_n_o                          => CONNECTED_TO_spim0_ss0_n_o,                          --                         .ss0_n_o
			spim0_ss1_n_o                          => CONNECTED_TO_spim0_ss1_n_o,                          --                         .ss1_n_o
			spim0_ss2_n_o                          => CONNECTED_TO_spim0_ss2_n_o,                          --                         .ss2_n_o
			spim0_ss3_n_o                          => CONNECTED_TO_spim0_ss3_n_o,                          --                         .ss3_n_o
			spim0_sclk_out_clk                     => CONNECTED_TO_spim0_sclk_out_clk,                     --           spim0_sclk_out.clk
			I2C1_scl_i_clk                         => CONNECTED_TO_I2C1_scl_i_clk,                         --               I2C1_scl_i.clk
			I2C1_scl_oe_clk                        => CONNECTED_TO_I2C1_scl_oe_clk,                        --              I2C1_scl_oe.clk
			I2C1_sda_i                             => CONNECTED_TO_I2C1_sda_i,                             --                     I2C1.sda_i
			I2C1_sda_oe                            => CONNECTED_TO_I2C1_sda_oe,                            --                         .sda_oe
			h2f_user0_clk_clk                      => CONNECTED_TO_h2f_user0_clk_clk,                      --            h2f_user0_clk.clk
			h2f_user1_clk_clk                      => CONNECTED_TO_h2f_user1_clk_clk,                      --            h2f_user1_clk.clk
			h2f_warm_reset_handshake_reset_req     => CONNECTED_TO_h2f_warm_reset_handshake_reset_req,     -- h2f_warm_reset_handshake.reset_req
			h2f_warm_reset_handshake_reset_ack     => CONNECTED_TO_h2f_warm_reset_handshake_reset_ack,     --                         .reset_ack
			h2f_cold_reset_reset_n                 => CONNECTED_TO_h2f_cold_reset_reset_n,                 --           h2f_cold_reset.reset_n
			hps_io_hps_osc_clk                     => CONNECTED_TO_hps_io_hps_osc_clk,                     --                   hps_io.hps_osc_clk
			hps_io_sdmmc_data0                     => CONNECTED_TO_hps_io_sdmmc_data0,                     --                         .sdmmc_data0
			hps_io_sdmmc_data1                     => CONNECTED_TO_hps_io_sdmmc_data1,                     --                         .sdmmc_data1
			hps_io_sdmmc_cclk                      => CONNECTED_TO_hps_io_sdmmc_cclk,                      --                         .sdmmc_cclk
			hps_io_sdmmc_data2                     => CONNECTED_TO_hps_io_sdmmc_data2,                     --                         .sdmmc_data2
			hps_io_sdmmc_data3                     => CONNECTED_TO_hps_io_sdmmc_data3,                     --                         .sdmmc_data3
			hps_io_sdmmc_cmd                       => CONNECTED_TO_hps_io_sdmmc_cmd,                       --                         .sdmmc_cmd
			hps_io_usb1_clk                        => CONNECTED_TO_hps_io_usb1_clk,                        --                         .usb1_clk
			hps_io_usb1_stp                        => CONNECTED_TO_hps_io_usb1_stp,                        --                         .usb1_stp
			hps_io_usb1_dir                        => CONNECTED_TO_hps_io_usb1_dir,                        --                         .usb1_dir
			hps_io_usb1_data0                      => CONNECTED_TO_hps_io_usb1_data0,                      --                         .usb1_data0
			hps_io_usb1_data1                      => CONNECTED_TO_hps_io_usb1_data1,                      --                         .usb1_data1
			hps_io_usb1_nxt                        => CONNECTED_TO_hps_io_usb1_nxt,                        --                         .usb1_nxt
			hps_io_usb1_data2                      => CONNECTED_TO_hps_io_usb1_data2,                      --                         .usb1_data2
			hps_io_usb1_data3                      => CONNECTED_TO_hps_io_usb1_data3,                      --                         .usb1_data3
			hps_io_usb1_data4                      => CONNECTED_TO_hps_io_usb1_data4,                      --                         .usb1_data4
			hps_io_usb1_data5                      => CONNECTED_TO_hps_io_usb1_data5,                      --                         .usb1_data5
			hps_io_usb1_data6                      => CONNECTED_TO_hps_io_usb1_data6,                      --                         .usb1_data6
			hps_io_usb1_data7                      => CONNECTED_TO_hps_io_usb1_data7,                      --                         .usb1_data7
			hps_io_emac2_tx_clk                    => CONNECTED_TO_hps_io_emac2_tx_clk,                    --                         .emac2_tx_clk
			hps_io_emac2_tx_ctl                    => CONNECTED_TO_hps_io_emac2_tx_ctl,                    --                         .emac2_tx_ctl
			hps_io_emac2_rx_clk                    => CONNECTED_TO_hps_io_emac2_rx_clk,                    --                         .emac2_rx_clk
			hps_io_emac2_rx_ctl                    => CONNECTED_TO_hps_io_emac2_rx_ctl,                    --                         .emac2_rx_ctl
			hps_io_emac2_txd0                      => CONNECTED_TO_hps_io_emac2_txd0,                      --                         .emac2_txd0
			hps_io_emac2_txd1                      => CONNECTED_TO_hps_io_emac2_txd1,                      --                         .emac2_txd1
			hps_io_emac2_rxd0                      => CONNECTED_TO_hps_io_emac2_rxd0,                      --                         .emac2_rxd0
			hps_io_emac2_rxd1                      => CONNECTED_TO_hps_io_emac2_rxd1,                      --                         .emac2_rxd1
			hps_io_emac2_txd2                      => CONNECTED_TO_hps_io_emac2_txd2,                      --                         .emac2_txd2
			hps_io_emac2_txd3                      => CONNECTED_TO_hps_io_emac2_txd3,                      --                         .emac2_txd3
			hps_io_emac2_rxd2                      => CONNECTED_TO_hps_io_emac2_rxd2,                      --                         .emac2_rxd2
			hps_io_emac2_rxd3                      => CONNECTED_TO_hps_io_emac2_rxd3,                      --                         .emac2_rxd3
			hps_io_mdio2_mdio                      => CONNECTED_TO_hps_io_mdio2_mdio,                      --                         .mdio2_mdio
			hps_io_mdio2_mdc                       => CONNECTED_TO_hps_io_mdio2_mdc,                       --                         .mdio2_mdc
			hps_io_uart0_tx                        => CONNECTED_TO_hps_io_uart0_tx,                        --                         .uart0_tx
			hps_io_uart0_rx                        => CONNECTED_TO_hps_io_uart0_rx,                        --                         .uart0_rx
			hps_io_i2c0_sda                        => CONNECTED_TO_hps_io_i2c0_sda,                        --                         .i2c0_sda
			hps_io_i2c0_scl                        => CONNECTED_TO_hps_io_i2c0_scl,                        --                         .i2c0_scl
			hps_io_gpio6                           => CONNECTED_TO_hps_io_gpio6,                           --                         .gpio6
			hps_io_gpio7                           => CONNECTED_TO_hps_io_gpio7,                           --                         .gpio7
			hps_io_gpio8                           => CONNECTED_TO_hps_io_gpio8,                           --                         .gpio8
			hps_io_gpio9                           => CONNECTED_TO_hps_io_gpio9,                           --                         .gpio9
			hps_io_gpio10                          => CONNECTED_TO_hps_io_gpio10,                          --                         .gpio10
			hps_io_gpio28                          => CONNECTED_TO_hps_io_gpio28,                          --                         .gpio28
			hps_io_gpio34                          => CONNECTED_TO_hps_io_gpio34,                          --                         .gpio34
			hps_io_gpio35                          => CONNECTED_TO_hps_io_gpio35,                          --                         .gpio35
			usb31_io_vbus_det                      => CONNECTED_TO_usb31_io_vbus_det,                      --                 usb31_io.vbus_det
			usb31_io_flt_bar                       => CONNECTED_TO_usb31_io_flt_bar,                       --                         .flt_bar
			usb31_io_usb_ctrl                      => CONNECTED_TO_usb31_io_usb_ctrl,                      --                         .usb_ctrl
			usb31_io_usb31_id                      => CONNECTED_TO_usb31_io_usb31_id,                      --                         .usb31_id
			fpga2hps_interrupt_irq                 => CONNECTED_TO_fpga2hps_interrupt_irq,                 --       fpga2hps_interrupt.irq
			usb31_phy_pma_cpu_clk_clk              => CONNECTED_TO_usb31_phy_pma_cpu_clk_clk,              --    usb31_phy_pma_cpu_clk.clk
			usb31_phy_refclk_p_clk                 => CONNECTED_TO_usb31_phy_refclk_p_clk,                 --       usb31_phy_refclk_p.clk
			usb31_phy_refclk_n_clk                 => CONNECTED_TO_usb31_phy_refclk_n_clk,                 --       usb31_phy_refclk_n.clk
			usb31_phy_rx_serial_n_i_rx_serial_n    => CONNECTED_TO_usb31_phy_rx_serial_n_i_rx_serial_n,    --    usb31_phy_rx_serial_n.i_rx_serial_n
			usb31_phy_rx_serial_p_i_rx_serial_p    => CONNECTED_TO_usb31_phy_rx_serial_p_i_rx_serial_p,    --    usb31_phy_rx_serial_p.i_rx_serial_p
			usb31_phy_tx_serial_n_o_tx_serial_n    => CONNECTED_TO_usb31_phy_tx_serial_n_o_tx_serial_n,    --    usb31_phy_tx_serial_n.o_tx_serial_n
			usb31_phy_tx_serial_p_o_tx_serial_p    => CONNECTED_TO_usb31_phy_tx_serial_p_o_tx_serial_p,    --    usb31_phy_tx_serial_p.o_tx_serial_p
			usb31_phy_reconfig_rst_reset           => CONNECTED_TO_usb31_phy_reconfig_rst_reset,           --   usb31_phy_reconfig_rst.reset
			usb31_phy_reconfig_clk_clk             => CONNECTED_TO_usb31_phy_reconfig_clk_clk,             --   usb31_phy_reconfig_clk.clk
			usb31_phy_reconfig_slave_address       => CONNECTED_TO_usb31_phy_reconfig_slave_address,       -- usb31_phy_reconfig_slave.address
			usb31_phy_reconfig_slave_byteenable    => CONNECTED_TO_usb31_phy_reconfig_slave_byteenable,    --                         .byteenable
			usb31_phy_reconfig_slave_readdatavalid => CONNECTED_TO_usb31_phy_reconfig_slave_readdatavalid, --                         .readdatavalid
			usb31_phy_reconfig_slave_read          => CONNECTED_TO_usb31_phy_reconfig_slave_read,          --                         .read
			usb31_phy_reconfig_slave_write         => CONNECTED_TO_usb31_phy_reconfig_slave_write,         --                         .write
			usb31_phy_reconfig_slave_readdata      => CONNECTED_TO_usb31_phy_reconfig_slave_readdata,      --                         .readdata
			usb31_phy_reconfig_slave_writedata     => CONNECTED_TO_usb31_phy_reconfig_slave_writedata,     --                         .writedata
			usb31_phy_reconfig_slave_waitrequest   => CONNECTED_TO_usb31_phy_reconfig_slave_waitrequest,   --                         .waitrequest
			f2sdram_axi_clock_clk                  => CONNECTED_TO_f2sdram_axi_clock_clk,                  --        f2sdram_axi_clock.clk
			f2sdram_axi_reset_reset_n              => CONNECTED_TO_f2sdram_axi_reset_reset_n,              --        f2sdram_axi_reset.reset_n
			f2sdram_araddr                         => CONNECTED_TO_f2sdram_araddr,                         --                  f2sdram.araddr
			f2sdram_arburst                        => CONNECTED_TO_f2sdram_arburst,                        --                         .arburst
			f2sdram_arcache                        => CONNECTED_TO_f2sdram_arcache,                        --                         .arcache
			f2sdram_arid                           => CONNECTED_TO_f2sdram_arid,                           --                         .arid
			f2sdram_arlen                          => CONNECTED_TO_f2sdram_arlen,                          --                         .arlen
			f2sdram_arlock                         => CONNECTED_TO_f2sdram_arlock,                         --                         .arlock
			f2sdram_arprot                         => CONNECTED_TO_f2sdram_arprot,                         --                         .arprot
			f2sdram_arqos                          => CONNECTED_TO_f2sdram_arqos,                          --                         .arqos
			f2sdram_arready                        => CONNECTED_TO_f2sdram_arready,                        --                         .arready
			f2sdram_arsize                         => CONNECTED_TO_f2sdram_arsize,                         --                         .arsize
			f2sdram_arvalid                        => CONNECTED_TO_f2sdram_arvalid,                        --                         .arvalid
			f2sdram_awaddr                         => CONNECTED_TO_f2sdram_awaddr,                         --                         .awaddr
			f2sdram_awburst                        => CONNECTED_TO_f2sdram_awburst,                        --                         .awburst
			f2sdram_awcache                        => CONNECTED_TO_f2sdram_awcache,                        --                         .awcache
			f2sdram_awid                           => CONNECTED_TO_f2sdram_awid,                           --                         .awid
			f2sdram_awlen                          => CONNECTED_TO_f2sdram_awlen,                          --                         .awlen
			f2sdram_awlock                         => CONNECTED_TO_f2sdram_awlock,                         --                         .awlock
			f2sdram_awprot                         => CONNECTED_TO_f2sdram_awprot,                         --                         .awprot
			f2sdram_awqos                          => CONNECTED_TO_f2sdram_awqos,                          --                         .awqos
			f2sdram_awready                        => CONNECTED_TO_f2sdram_awready,                        --                         .awready
			f2sdram_awsize                         => CONNECTED_TO_f2sdram_awsize,                         --                         .awsize
			f2sdram_awvalid                        => CONNECTED_TO_f2sdram_awvalid,                        --                         .awvalid
			f2sdram_bid                            => CONNECTED_TO_f2sdram_bid,                            --                         .bid
			f2sdram_bready                         => CONNECTED_TO_f2sdram_bready,                         --                         .bready
			f2sdram_bresp                          => CONNECTED_TO_f2sdram_bresp,                          --                         .bresp
			f2sdram_bvalid                         => CONNECTED_TO_f2sdram_bvalid,                         --                         .bvalid
			f2sdram_rdata                          => CONNECTED_TO_f2sdram_rdata,                          --                         .rdata
			f2sdram_rid                            => CONNECTED_TO_f2sdram_rid,                            --                         .rid
			f2sdram_rlast                          => CONNECTED_TO_f2sdram_rlast,                          --                         .rlast
			f2sdram_rready                         => CONNECTED_TO_f2sdram_rready,                         --                         .rready
			f2sdram_rresp                          => CONNECTED_TO_f2sdram_rresp,                          --                         .rresp
			f2sdram_rvalid                         => CONNECTED_TO_f2sdram_rvalid,                         --                         .rvalid
			f2sdram_wdata                          => CONNECTED_TO_f2sdram_wdata,                          --                         .wdata
			f2sdram_wlast                          => CONNECTED_TO_f2sdram_wlast,                          --                         .wlast
			f2sdram_wready                         => CONNECTED_TO_f2sdram_wready,                         --                         .wready
			f2sdram_wstrb                          => CONNECTED_TO_f2sdram_wstrb,                          --                         .wstrb
			f2sdram_wvalid                         => CONNECTED_TO_f2sdram_wvalid,                         --                         .wvalid
			f2sdram_aruser                         => CONNECTED_TO_f2sdram_aruser,                         --                         .aruser
			f2sdram_awuser                         => CONNECTED_TO_f2sdram_awuser,                         --                         .awuser
			f2sdram_wuser                          => CONNECTED_TO_f2sdram_wuser,                          --                         .wuser
			f2sdram_buser                          => CONNECTED_TO_f2sdram_buser,                          --                         .buser
			f2sdram_arregion                       => CONNECTED_TO_f2sdram_arregion,                       --                         .arregion
			f2sdram_ruser                          => CONNECTED_TO_f2sdram_ruser,                          --                         .ruser
			f2sdram_awregion                       => CONNECTED_TO_f2sdram_awregion,                       --                         .awregion
			io96b0_csr_axi_clk_clk                 => CONNECTED_TO_io96b0_csr_axi_clk_clk,                 --       io96b0_csr_axi_clk.clk
			io96b0_csr_axi_rst_reset_n             => CONNECTED_TO_io96b0_csr_axi_rst_reset_n,             --       io96b0_csr_axi_rst.reset_n
			io96b0_csr_axi_arready                 => CONNECTED_TO_io96b0_csr_axi_arready,                 --           io96b0_csr_axi.arready
			io96b0_csr_axi_awready                 => CONNECTED_TO_io96b0_csr_axi_awready,                 --                         .awready
			io96b0_csr_axi_bresp                   => CONNECTED_TO_io96b0_csr_axi_bresp,                   --                         .bresp
			io96b0_csr_axi_bvalid                  => CONNECTED_TO_io96b0_csr_axi_bvalid,                  --                         .bvalid
			io96b0_csr_axi_rdata                   => CONNECTED_TO_io96b0_csr_axi_rdata,                   --                         .rdata
			io96b0_csr_axi_rresp                   => CONNECTED_TO_io96b0_csr_axi_rresp,                   --                         .rresp
			io96b0_csr_axi_rvalid                  => CONNECTED_TO_io96b0_csr_axi_rvalid,                  --                         .rvalid
			io96b0_csr_axi_wready                  => CONNECTED_TO_io96b0_csr_axi_wready,                  --                         .wready
			io96b0_csr_axi_araddr                  => CONNECTED_TO_io96b0_csr_axi_araddr,                  --                         .araddr
			io96b0_csr_axi_arvalid                 => CONNECTED_TO_io96b0_csr_axi_arvalid,                 --                         .arvalid
			io96b0_csr_axi_awaddr                  => CONNECTED_TO_io96b0_csr_axi_awaddr,                  --                         .awaddr
			io96b0_csr_axi_awvalid                 => CONNECTED_TO_io96b0_csr_axi_awvalid,                 --                         .awvalid
			io96b0_csr_axi_bready                  => CONNECTED_TO_io96b0_csr_axi_bready,                  --                         .bready
			io96b0_csr_axi_rready                  => CONNECTED_TO_io96b0_csr_axi_rready,                  --                         .rready
			io96b0_csr_axi_wdata                   => CONNECTED_TO_io96b0_csr_axi_wdata,                   --                         .wdata
			io96b0_csr_axi_wstrb                   => CONNECTED_TO_io96b0_csr_axi_wstrb,                   --                         .wstrb
			io96b0_csr_axi_wvalid                  => CONNECTED_TO_io96b0_csr_axi_wvalid,                  --                         .wvalid
			io96b0_csr_axi_arprot                  => CONNECTED_TO_io96b0_csr_axi_arprot,                  --                         .arprot
			io96b0_csr_axi_awprot                  => CONNECTED_TO_io96b0_csr_axi_awprot,                  --                         .awprot
			io96b0_ch0_axi_clk_clk                 => CONNECTED_TO_io96b0_ch0_axi_clk_clk,                 --       io96b0_ch0_axi_clk.clk
			io96b0_ch0_axi_rst_reset_n             => CONNECTED_TO_io96b0_ch0_axi_rst_reset_n,             --       io96b0_ch0_axi_rst.reset_n
			io96b0_ch0_axi_arready                 => CONNECTED_TO_io96b0_ch0_axi_arready,                 --           io96b0_ch0_axi.arready
			io96b0_ch0_axi_awready                 => CONNECTED_TO_io96b0_ch0_axi_awready,                 --                         .awready
			io96b0_ch0_axi_bid                     => CONNECTED_TO_io96b0_ch0_axi_bid,                     --                         .bid
			io96b0_ch0_axi_bresp                   => CONNECTED_TO_io96b0_ch0_axi_bresp,                   --                         .bresp
			io96b0_ch0_axi_bvalid                  => CONNECTED_TO_io96b0_ch0_axi_bvalid,                  --                         .bvalid
			io96b0_ch0_axi_rdata                   => CONNECTED_TO_io96b0_ch0_axi_rdata,                   --                         .rdata
			io96b0_ch0_axi_rid                     => CONNECTED_TO_io96b0_ch0_axi_rid,                     --                         .rid
			io96b0_ch0_axi_rlast                   => CONNECTED_TO_io96b0_ch0_axi_rlast,                   --                         .rlast
			io96b0_ch0_axi_rresp                   => CONNECTED_TO_io96b0_ch0_axi_rresp,                   --                         .rresp
			io96b0_ch0_axi_ruser                   => CONNECTED_TO_io96b0_ch0_axi_ruser,                   --                         .ruser
			io96b0_ch0_axi_rvalid                  => CONNECTED_TO_io96b0_ch0_axi_rvalid,                  --                         .rvalid
			io96b0_ch0_axi_wready                  => CONNECTED_TO_io96b0_ch0_axi_wready,                  --                         .wready
			io96b0_ch0_axi_araddr                  => CONNECTED_TO_io96b0_ch0_axi_araddr,                  --                         .araddr
			io96b0_ch0_axi_arburst                 => CONNECTED_TO_io96b0_ch0_axi_arburst,                 --                         .arburst
			io96b0_ch0_axi_arid                    => CONNECTED_TO_io96b0_ch0_axi_arid,                    --                         .arid
			io96b0_ch0_axi_arlen                   => CONNECTED_TO_io96b0_ch0_axi_arlen,                   --                         .arlen
			io96b0_ch0_axi_arlock                  => CONNECTED_TO_io96b0_ch0_axi_arlock,                  --                         .arlock
			io96b0_ch0_axi_arqos                   => CONNECTED_TO_io96b0_ch0_axi_arqos,                   --                         .arqos
			io96b0_ch0_axi_arsize                  => CONNECTED_TO_io96b0_ch0_axi_arsize,                  --                         .arsize
			io96b0_ch0_axi_aruser                  => CONNECTED_TO_io96b0_ch0_axi_aruser,                  --                         .aruser
			io96b0_ch0_axi_arvalid                 => CONNECTED_TO_io96b0_ch0_axi_arvalid,                 --                         .arvalid
			io96b0_ch0_axi_awaddr                  => CONNECTED_TO_io96b0_ch0_axi_awaddr,                  --                         .awaddr
			io96b0_ch0_axi_awburst                 => CONNECTED_TO_io96b0_ch0_axi_awburst,                 --                         .awburst
			io96b0_ch0_axi_awid                    => CONNECTED_TO_io96b0_ch0_axi_awid,                    --                         .awid
			io96b0_ch0_axi_awlen                   => CONNECTED_TO_io96b0_ch0_axi_awlen,                   --                         .awlen
			io96b0_ch0_axi_awlock                  => CONNECTED_TO_io96b0_ch0_axi_awlock,                  --                         .awlock
			io96b0_ch0_axi_awqos                   => CONNECTED_TO_io96b0_ch0_axi_awqos,                   --                         .awqos
			io96b0_ch0_axi_awsize                  => CONNECTED_TO_io96b0_ch0_axi_awsize,                  --                         .awsize
			io96b0_ch0_axi_awuser                  => CONNECTED_TO_io96b0_ch0_axi_awuser,                  --                         .awuser
			io96b0_ch0_axi_awvalid                 => CONNECTED_TO_io96b0_ch0_axi_awvalid,                 --                         .awvalid
			io96b0_ch0_axi_bready                  => CONNECTED_TO_io96b0_ch0_axi_bready,                  --                         .bready
			io96b0_ch0_axi_rready                  => CONNECTED_TO_io96b0_ch0_axi_rready,                  --                         .rready
			io96b0_ch0_axi_wdata                   => CONNECTED_TO_io96b0_ch0_axi_wdata,                   --                         .wdata
			io96b0_ch0_axi_wlast                   => CONNECTED_TO_io96b0_ch0_axi_wlast,                   --                         .wlast
			io96b0_ch0_axi_wstrb                   => CONNECTED_TO_io96b0_ch0_axi_wstrb,                   --                         .wstrb
			io96b0_ch0_axi_wuser                   => CONNECTED_TO_io96b0_ch0_axi_wuser,                   --                         .wuser
			io96b0_ch0_axi_wvalid                  => CONNECTED_TO_io96b0_ch0_axi_wvalid,                  --                         .wvalid
			io96b0_ch0_axi_arprot                  => CONNECTED_TO_io96b0_ch0_axi_arprot,                  --                         .arprot
			io96b0_ch0_axi_awprot                  => CONNECTED_TO_io96b0_ch0_axi_awprot                   --                         .awprot
		);

