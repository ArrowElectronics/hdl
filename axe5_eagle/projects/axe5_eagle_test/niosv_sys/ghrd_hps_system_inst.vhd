	component ghrd_hps_system is
		port (
			emac0_mdio_mac_mdc          : out   std_logic;                                        -- mac_mdc
			emac0_mdio_mac_mdi          : in    std_logic                     := 'X';             -- mac_mdi
			emac0_mdio_mac_mdo          : out   std_logic;                                        -- mac_mdo
			emac0_mdio_mac_mdoe         : out   std_logic;                                        -- mac_mdoe
			emac0_app_rst_reset_n       : out   std_logic;                                        -- reset_n
			emac0_mac_tx_clk_o          : out   std_logic;                                        -- mac_tx_clk_o
			emac0_mac_tx_clk_i          : in    std_logic                     := 'X';             -- mac_tx_clk_i
			emac0_mac_rx_clk            : in    std_logic                     := 'X';             -- mac_rx_clk
			emac0_mac_rst_tx_n          : out   std_logic;                                        -- mac_rst_tx_n
			emac0_mac_rst_rx_n          : out   std_logic;                                        -- mac_rst_rx_n
			emac0_mac_txen              : out   std_logic;                                        -- mac_txen
			emac0_mac_txer              : out   std_logic;                                        -- mac_txer
			emac0_mac_rxdv              : in    std_logic                     := 'X';             -- mac_rxdv
			emac0_mac_rxer              : in    std_logic                     := 'X';             -- mac_rxer
			emac0_mac_rxd               : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- mac_rxd
			emac0_mac_col               : in    std_logic                     := 'X';             -- mac_col
			emac0_mac_crs               : in    std_logic                     := 'X';             -- mac_crs
			emac0_mac_speed             : out   std_logic_vector(2 downto 0);                     -- mac_speed
			emac0_mac_txd_o             : out   std_logic_vector(7 downto 0);                     -- mac_txd_o
			emac2_app_rst_reset_n       : out   std_logic;                                        -- reset_n
			spim0_miso_i                : in    std_logic                     := 'X';             -- miso_i
			spim0_mosi_o                : out   std_logic;                                        -- mosi_o
			spim0_mosi_oe               : out   std_logic;                                        -- mosi_oe
			spim0_ss_in_n               : in    std_logic                     := 'X';             -- ss_in_n
			spim0_ss0_n_o               : out   std_logic;                                        -- ss0_n_o
			spim0_ss1_n_o               : out   std_logic;                                        -- ss1_n_o
			spim0_ss2_n_o               : out   std_logic;                                        -- ss2_n_o
			spim0_ss3_n_o               : out   std_logic;                                        -- ss3_n_o
			spim0_sclk_out_clk          : out   std_logic;                                        -- clk
			i2c1_scl_i_clk              : in    std_logic                     := 'X';             -- clk
			i2c1_scl_oe_clk             : out   std_logic;                                        -- clk
			i2c1_sda_i                  : in    std_logic                     := 'X';             -- sda_i
			i2c1_sda_oe                 : out   std_logic;                                        -- sda_oe
			hps_io_hps_osc_clk          : in    std_logic                     := 'X';             -- hps_osc_clk
			hps_io_sdmmc_data0          : inout std_logic                     := 'X';             -- sdmmc_data0
			hps_io_sdmmc_data1          : inout std_logic                     := 'X';             -- sdmmc_data1
			hps_io_sdmmc_cclk           : out   std_logic;                                        -- sdmmc_cclk
			hps_io_sdmmc_data2          : inout std_logic                     := 'X';             -- sdmmc_data2
			hps_io_sdmmc_data3          : inout std_logic                     := 'X';             -- sdmmc_data3
			hps_io_sdmmc_cmd            : inout std_logic                     := 'X';             -- sdmmc_cmd
			hps_io_usb1_clk             : in    std_logic                     := 'X';             -- usb1_clk
			hps_io_usb1_stp             : out   std_logic;                                        -- usb1_stp
			hps_io_usb1_dir             : in    std_logic                     := 'X';             -- usb1_dir
			hps_io_usb1_data0           : inout std_logic                     := 'X';             -- usb1_data0
			hps_io_usb1_data1           : inout std_logic                     := 'X';             -- usb1_data1
			hps_io_usb1_nxr             : in    std_logic                     := 'X';             -- usb1_nxr
			hps_io_usb1_data2           : inout std_logic                     := 'X';             -- usb1_data2
			hps_io_usb1_data3           : inout std_logic                     := 'X';             -- usb1_data3
			hps_io_usb1_data4           : inout std_logic                     := 'X';             -- usb1_data4
			hps_io_usb1_data5           : inout std_logic                     := 'X';             -- usb1_data5
			hps_io_usb1_data6           : inout std_logic                     := 'X';             -- usb1_data6
			hps_io_usb1_data7           : inout std_logic                     := 'X';             -- usb1_data7
			hps_io_emac2_tx_clk         : out   std_logic;                                        -- emac2_tx_clk
			hps_io_emac2_tx_ctl         : out   std_logic;                                        -- emac2_tx_ctl
			hps_io_emac2_rx_clk         : in    std_logic                     := 'X';             -- emac2_rx_clk
			hps_io_emac2_rx_ctl         : in    std_logic                     := 'X';             -- emac2_rx_ctl
			hps_io_emac2_txd0           : out   std_logic;                                        -- emac2_txd0
			hps_io_emac2_txd1           : out   std_logic;                                        -- emac2_txd1
			hps_io_emac2_rxd0           : in    std_logic                     := 'X';             -- emac2_rxd0
			hps_io_emac2_rxd1           : in    std_logic                     := 'X';             -- emac2_rxd1
			hps_io_emac2_txd2           : out   std_logic;                                        -- emac2_txd2
			hps_io_emac2_txd3           : out   std_logic;                                        -- emac2_txd3
			hps_io_emac2_rxd2           : in    std_logic                     := 'X';             -- emac2_rxd2
			hps_io_emac2_rxd3           : in    std_logic                     := 'X';             -- emac2_rxd3
			hps_io_mdio2_mdio           : inout std_logic                     := 'X';             -- mdio2_mdio
			hps_io_mdio2_mdc            : out   std_logic;                                        -- mdio2_mdc
			hps_io_uart0_tx             : out   std_logic;                                        -- uart0_tx
			hps_io_uart0_rx             : in    std_logic                     := 'X';             -- uart0_rx
			hps_io_i2c0_sda             : inout std_logic                     := 'X';             -- i2c0_sda
			hps_io_i2c0_scl             : inout std_logic                     := 'X';             -- i2c0_scl
			hps_io_gpio6                : inout std_logic                     := 'X';             -- gpio6
			hps_io_gpio7                : inout std_logic                     := 'X';             -- gpio7
			hps_io_gpio8                : inout std_logic                     := 'X';             -- gpio8
			hps_io_gpio9                : inout std_logic                     := 'X';             -- gpio9
			hps_io_gpio10               : inout std_logic                     := 'X';             -- gpio10
			hps_io_gpio11               : inout std_logic                     := 'X';             -- gpio11
			hps_io_gpio28               : inout std_logic                     := 'X';             -- gpio28
			hps_io_gpio34               : inout std_logic                     := 'X';             -- gpio34
			hps_io_gpio35               : inout std_logic                     := 'X';             -- gpio35
			usb31_io_vbus_det           : in    std_logic                     := 'X';             -- vbus_det
			usb31_io_flt_bar            : in    std_logic                     := 'X';             -- flt_bar
			usb31_io_usb_ctrl           : out   std_logic_vector(1 downto 0);                     -- usb_ctrl
			usb31_io_usb31_id           : in    std_logic                     := 'X';             -- usb31_id
			bank2a_lpddr4_refclk_clk    : in    std_logic                     := 'X';             -- clk
			bank2a_lpddr4_mem_ck_t      : out   std_logic;                                        -- mem_ck_t
			bank2a_lpddr4_mem_ck_c      : out   std_logic;                                        -- mem_ck_c
			bank2a_lpddr4_mem_cke       : out   std_logic;                                        -- mem_cke
			bank2a_lpddr4_mem_reset_n   : out   std_logic;                                        -- mem_reset_n
			bank2a_lpddr4_mem_cs        : out   std_logic;                                        -- mem_cs
			bank2a_lpddr4_mem_ca        : out   std_logic_vector(5 downto 0);                     -- mem_ca
			bank2a_lpddr4_mem_dq        : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
			bank2a_lpddr4_mem_dqs_t     : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_t
			bank2a_lpddr4_mem_dqs_c     : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_c
			bank2a_lpddr4_mem_dmi       : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dmi
			bank2a_lpddr4_oct_oct_rzqin : in    std_logic                     := 'X';             -- oct_rzqin
			niosv_cruvi_ls_0_in_port    : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			niosv_cruvi_ls_0_out_port   : out   std_logic_vector(7 downto 0);                     -- out_port
			niosv_cruvi_ls_1_in_port    : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			niosv_cruvi_ls_1_out_port   : out   std_logic_vector(7 downto 0);                     -- out_port
			niosv_fpga_dipsw_export     : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			niosv0_fpga_pb_export       : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			niosv_hdmi_i2c_sda_in       : in    std_logic                     := 'X';             -- sda_in
			niosv_hdmi_i2c_scl_in       : in    std_logic                     := 'X';             -- scl_in
			niosv_hdmi_i2c_sda_oe       : out   std_logic;                                        -- sda_oe
			niosv_hdmi_i2c_scl_oe       : out   std_logic;                                        -- scl_oe
			niosv_dbg_uart_RXD          : in    std_logic                     := 'X';             -- RXD
			niosv_dbg_uart_TXD          : out   std_logic;                                        -- TXD
			niosv_rgb_led0_export       : out   std_logic_vector(2 downto 0);                     -- export
			niosv_rgb_led1_export       : out   std_logic_vector(2 downto 0);                     -- export
			niosv_rgb_led2_export       : out   std_logic_vector(2 downto 0);                     -- export
			niosv_rgb_led3_export       : out   std_logic_vector(2 downto 0);                     -- export
			dipsw_export                : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			pb_export                   : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			rgb_led0_export             : out   std_logic_vector(2 downto 0);                     -- export
			rgb_led1_export             : out   std_logic_vector(2 downto 0);                     -- export
			rgb_led2_export             : out   std_logic_vector(2 downto 0);                     -- export
			rgb_led3_export             : out   std_logic_vector(2 downto 0);                     -- export
			sys_reset_reset             : in    std_logic                     := 'X';             -- reset
			hdmi_h_clk                  : out   std_logic;                                        -- h_clk
			hdmi_h16_hsync              : out   std_logic;                                        -- h16_hsync
			hdmi_h16_vsync              : out   std_logic;                                        -- h16_vsync
			hdmi_h16_data_e             : out   std_logic;                                        -- h16_data_e
			hdmi_h16_data               : out   std_logic_vector(15 downto 0);                    -- h16_data
			hdmi_h16_es_data            : out   std_logic_vector(15 downto 0);                    -- h16_es_data
			hdmi_h24_hsync              : out   std_logic;                                        -- h24_hsync
			hdmi_h24_vsync              : out   std_logic;                                        -- h24_vsync
			hdmi_h24_data_e             : out   std_logic;                                        -- h24_data_e
			hdmi_h24_data               : out   std_logic_vector(23 downto 0);                    -- h24_data
			hdmi_h36_hsync              : out   std_logic;                                        -- h36_hsync
			hdmi_h36_vsync              : out   std_logic;                                        -- h36_vsync
			hdmi_h36_data_e             : out   std_logic;                                        -- h36_data_e
			hdmi_h36_data               : out   std_logic_vector(35 downto 0);                    -- h36_data
			hdmi_pll_refclk_clk         : in    std_logic                     := 'X'              -- clk
		);
	end component ghrd_hps_system;

	u0 : component ghrd_hps_system
		port map (
			emac0_mdio_mac_mdc          => CONNECTED_TO_emac0_mdio_mac_mdc,          --           emac0_mdio.mac_mdc
			emac0_mdio_mac_mdi          => CONNECTED_TO_emac0_mdio_mac_mdi,          --                     .mac_mdi
			emac0_mdio_mac_mdo          => CONNECTED_TO_emac0_mdio_mac_mdo,          --                     .mac_mdo
			emac0_mdio_mac_mdoe         => CONNECTED_TO_emac0_mdio_mac_mdoe,         --                     .mac_mdoe
			emac0_app_rst_reset_n       => CONNECTED_TO_emac0_app_rst_reset_n,       --        emac0_app_rst.reset_n
			emac0_mac_tx_clk_o          => CONNECTED_TO_emac0_mac_tx_clk_o,          --                emac0.mac_tx_clk_o
			emac0_mac_tx_clk_i          => CONNECTED_TO_emac0_mac_tx_clk_i,          --                     .mac_tx_clk_i
			emac0_mac_rx_clk            => CONNECTED_TO_emac0_mac_rx_clk,            --                     .mac_rx_clk
			emac0_mac_rst_tx_n          => CONNECTED_TO_emac0_mac_rst_tx_n,          --                     .mac_rst_tx_n
			emac0_mac_rst_rx_n          => CONNECTED_TO_emac0_mac_rst_rx_n,          --                     .mac_rst_rx_n
			emac0_mac_txen              => CONNECTED_TO_emac0_mac_txen,              --                     .mac_txen
			emac0_mac_txer              => CONNECTED_TO_emac0_mac_txer,              --                     .mac_txer
			emac0_mac_rxdv              => CONNECTED_TO_emac0_mac_rxdv,              --                     .mac_rxdv
			emac0_mac_rxer              => CONNECTED_TO_emac0_mac_rxer,              --                     .mac_rxer
			emac0_mac_rxd               => CONNECTED_TO_emac0_mac_rxd,               --                     .mac_rxd
			emac0_mac_col               => CONNECTED_TO_emac0_mac_col,               --                     .mac_col
			emac0_mac_crs               => CONNECTED_TO_emac0_mac_crs,               --                     .mac_crs
			emac0_mac_speed             => CONNECTED_TO_emac0_mac_speed,             --                     .mac_speed
			emac0_mac_txd_o             => CONNECTED_TO_emac0_mac_txd_o,             --                     .mac_txd_o
			emac2_app_rst_reset_n       => CONNECTED_TO_emac2_app_rst_reset_n,       --        emac2_app_rst.reset_n
			spim0_miso_i                => CONNECTED_TO_spim0_miso_i,                --                spim0.miso_i
			spim0_mosi_o                => CONNECTED_TO_spim0_mosi_o,                --                     .mosi_o
			spim0_mosi_oe               => CONNECTED_TO_spim0_mosi_oe,               --                     .mosi_oe
			spim0_ss_in_n               => CONNECTED_TO_spim0_ss_in_n,               --                     .ss_in_n
			spim0_ss0_n_o               => CONNECTED_TO_spim0_ss0_n_o,               --                     .ss0_n_o
			spim0_ss1_n_o               => CONNECTED_TO_spim0_ss1_n_o,               --                     .ss1_n_o
			spim0_ss2_n_o               => CONNECTED_TO_spim0_ss2_n_o,               --                     .ss2_n_o
			spim0_ss3_n_o               => CONNECTED_TO_spim0_ss3_n_o,               --                     .ss3_n_o
			spim0_sclk_out_clk          => CONNECTED_TO_spim0_sclk_out_clk,          --       spim0_sclk_out.clk
			i2c1_scl_i_clk              => CONNECTED_TO_i2c1_scl_i_clk,              --           i2c1_scl_i.clk
			i2c1_scl_oe_clk             => CONNECTED_TO_i2c1_scl_oe_clk,             --          i2c1_scl_oe.clk
			i2c1_sda_i                  => CONNECTED_TO_i2c1_sda_i,                  --                 i2c1.sda_i
			i2c1_sda_oe                 => CONNECTED_TO_i2c1_sda_oe,                 --                     .sda_oe
			hps_io_hps_osc_clk          => CONNECTED_TO_hps_io_hps_osc_clk,          --               hps_io.hps_osc_clk
			hps_io_sdmmc_data0          => CONNECTED_TO_hps_io_sdmmc_data0,          --                     .sdmmc_data0
			hps_io_sdmmc_data1          => CONNECTED_TO_hps_io_sdmmc_data1,          --                     .sdmmc_data1
			hps_io_sdmmc_cclk           => CONNECTED_TO_hps_io_sdmmc_cclk,           --                     .sdmmc_cclk
			hps_io_sdmmc_data2          => CONNECTED_TO_hps_io_sdmmc_data2,          --                     .sdmmc_data2
			hps_io_sdmmc_data3          => CONNECTED_TO_hps_io_sdmmc_data3,          --                     .sdmmc_data3
			hps_io_sdmmc_cmd            => CONNECTED_TO_hps_io_sdmmc_cmd,            --                     .sdmmc_cmd
			hps_io_usb1_clk             => CONNECTED_TO_hps_io_usb1_clk,             --                     .usb1_clk
			hps_io_usb1_stp             => CONNECTED_TO_hps_io_usb1_stp,             --                     .usb1_stp
			hps_io_usb1_dir             => CONNECTED_TO_hps_io_usb1_dir,             --                     .usb1_dir
			hps_io_usb1_data0           => CONNECTED_TO_hps_io_usb1_data0,           --                     .usb1_data0
			hps_io_usb1_data1           => CONNECTED_TO_hps_io_usb1_data1,           --                     .usb1_data1
			hps_io_usb1_nxr             => CONNECTED_TO_hps_io_usb1_nxr,             --                     .usb1_nxr
			hps_io_usb1_data2           => CONNECTED_TO_hps_io_usb1_data2,           --                     .usb1_data2
			hps_io_usb1_data3           => CONNECTED_TO_hps_io_usb1_data3,           --                     .usb1_data3
			hps_io_usb1_data4           => CONNECTED_TO_hps_io_usb1_data4,           --                     .usb1_data4
			hps_io_usb1_data5           => CONNECTED_TO_hps_io_usb1_data5,           --                     .usb1_data5
			hps_io_usb1_data6           => CONNECTED_TO_hps_io_usb1_data6,           --                     .usb1_data6
			hps_io_usb1_data7           => CONNECTED_TO_hps_io_usb1_data7,           --                     .usb1_data7
			hps_io_emac2_tx_clk         => CONNECTED_TO_hps_io_emac2_tx_clk,         --                     .emac2_tx_clk
			hps_io_emac2_tx_ctl         => CONNECTED_TO_hps_io_emac2_tx_ctl,         --                     .emac2_tx_ctl
			hps_io_emac2_rx_clk         => CONNECTED_TO_hps_io_emac2_rx_clk,         --                     .emac2_rx_clk
			hps_io_emac2_rx_ctl         => CONNECTED_TO_hps_io_emac2_rx_ctl,         --                     .emac2_rx_ctl
			hps_io_emac2_txd0           => CONNECTED_TO_hps_io_emac2_txd0,           --                     .emac2_txd0
			hps_io_emac2_txd1           => CONNECTED_TO_hps_io_emac2_txd1,           --                     .emac2_txd1
			hps_io_emac2_rxd0           => CONNECTED_TO_hps_io_emac2_rxd0,           --                     .emac2_rxd0
			hps_io_emac2_rxd1           => CONNECTED_TO_hps_io_emac2_rxd1,           --                     .emac2_rxd1
			hps_io_emac2_txd2           => CONNECTED_TO_hps_io_emac2_txd2,           --                     .emac2_txd2
			hps_io_emac2_txd3           => CONNECTED_TO_hps_io_emac2_txd3,           --                     .emac2_txd3
			hps_io_emac2_rxd2           => CONNECTED_TO_hps_io_emac2_rxd2,           --                     .emac2_rxd2
			hps_io_emac2_rxd3           => CONNECTED_TO_hps_io_emac2_rxd3,           --                     .emac2_rxd3
			hps_io_mdio2_mdio           => CONNECTED_TO_hps_io_mdio2_mdio,           --                     .mdio2_mdio
			hps_io_mdio2_mdc            => CONNECTED_TO_hps_io_mdio2_mdc,            --                     .mdio2_mdc
			hps_io_uart0_tx             => CONNECTED_TO_hps_io_uart0_tx,             --                     .uart0_tx
			hps_io_uart0_rx             => CONNECTED_TO_hps_io_uart0_rx,             --                     .uart0_rx
			hps_io_i2c0_sda             => CONNECTED_TO_hps_io_i2c0_sda,             --                     .i2c0_sda
			hps_io_i2c0_scl             => CONNECTED_TO_hps_io_i2c0_scl,             --                     .i2c0_scl
			hps_io_gpio6                => CONNECTED_TO_hps_io_gpio6,                --                     .gpio6
			hps_io_gpio7                => CONNECTED_TO_hps_io_gpio7,                --                     .gpio7
			hps_io_gpio8                => CONNECTED_TO_hps_io_gpio8,                --                     .gpio8
			hps_io_gpio9                => CONNECTED_TO_hps_io_gpio9,                --                     .gpio9
			hps_io_gpio10               => CONNECTED_TO_hps_io_gpio10,               --                     .gpio10
			hps_io_gpio11               => CONNECTED_TO_hps_io_gpio11,               --                     .gpio11
			hps_io_gpio28               => CONNECTED_TO_hps_io_gpio28,               --                     .gpio28
			hps_io_gpio34               => CONNECTED_TO_hps_io_gpio34,               --                     .gpio34
			hps_io_gpio35               => CONNECTED_TO_hps_io_gpio35,               --                     .gpio35
			usb31_io_vbus_det           => CONNECTED_TO_usb31_io_vbus_det,           --             usb31_io.vbus_det
			usb31_io_flt_bar            => CONNECTED_TO_usb31_io_flt_bar,            --                     .flt_bar
			usb31_io_usb_ctrl           => CONNECTED_TO_usb31_io_usb_ctrl,           --                     .usb_ctrl
			usb31_io_usb31_id           => CONNECTED_TO_usb31_io_usb31_id,           --                     .usb31_id
			bank2a_lpddr4_refclk_clk    => CONNECTED_TO_bank2a_lpddr4_refclk_clk,    -- bank2a_lpddr4_refclk.clk
			bank2a_lpddr4_mem_ck_t      => CONNECTED_TO_bank2a_lpddr4_mem_ck_t,      --        bank2a_lpddr4.mem_ck_t
			bank2a_lpddr4_mem_ck_c      => CONNECTED_TO_bank2a_lpddr4_mem_ck_c,      --                     .mem_ck_c
			bank2a_lpddr4_mem_cke       => CONNECTED_TO_bank2a_lpddr4_mem_cke,       --                     .mem_cke
			bank2a_lpddr4_mem_reset_n   => CONNECTED_TO_bank2a_lpddr4_mem_reset_n,   --                     .mem_reset_n
			bank2a_lpddr4_mem_cs        => CONNECTED_TO_bank2a_lpddr4_mem_cs,        --                     .mem_cs
			bank2a_lpddr4_mem_ca        => CONNECTED_TO_bank2a_lpddr4_mem_ca,        --                     .mem_ca
			bank2a_lpddr4_mem_dq        => CONNECTED_TO_bank2a_lpddr4_mem_dq,        --                     .mem_dq
			bank2a_lpddr4_mem_dqs_t     => CONNECTED_TO_bank2a_lpddr4_mem_dqs_t,     --                     .mem_dqs_t
			bank2a_lpddr4_mem_dqs_c     => CONNECTED_TO_bank2a_lpddr4_mem_dqs_c,     --                     .mem_dqs_c
			bank2a_lpddr4_mem_dmi       => CONNECTED_TO_bank2a_lpddr4_mem_dmi,       --                     .mem_dmi
			bank2a_lpddr4_oct_oct_rzqin => CONNECTED_TO_bank2a_lpddr4_oct_oct_rzqin, --    bank2a_lpddr4_oct.oct_rzqin
			niosv_cruvi_ls_0_in_port    => CONNECTED_TO_niosv_cruvi_ls_0_in_port,    --     niosv_cruvi_ls_0.in_port
			niosv_cruvi_ls_0_out_port   => CONNECTED_TO_niosv_cruvi_ls_0_out_port,   --                     .out_port
			niosv_cruvi_ls_1_in_port    => CONNECTED_TO_niosv_cruvi_ls_1_in_port,    --     niosv_cruvi_ls_1.in_port
			niosv_cruvi_ls_1_out_port   => CONNECTED_TO_niosv_cruvi_ls_1_out_port,   --                     .out_port
			niosv_fpga_dipsw_export     => CONNECTED_TO_niosv_fpga_dipsw_export,     --     niosv_fpga_dipsw.export
			niosv0_fpga_pb_export       => CONNECTED_TO_niosv0_fpga_pb_export,       --       niosv0_fpga_pb.export
			niosv_hdmi_i2c_sda_in       => CONNECTED_TO_niosv_hdmi_i2c_sda_in,       --       niosv_hdmi_i2c.sda_in
			niosv_hdmi_i2c_scl_in       => CONNECTED_TO_niosv_hdmi_i2c_scl_in,       --                     .scl_in
			niosv_hdmi_i2c_sda_oe       => CONNECTED_TO_niosv_hdmi_i2c_sda_oe,       --                     .sda_oe
			niosv_hdmi_i2c_scl_oe       => CONNECTED_TO_niosv_hdmi_i2c_scl_oe,       --                     .scl_oe
			niosv_dbg_uart_RXD          => CONNECTED_TO_niosv_dbg_uart_RXD,          --       niosv_dbg_uart.RXD
			niosv_dbg_uart_TXD          => CONNECTED_TO_niosv_dbg_uart_TXD,          --                     .TXD
			niosv_rgb_led0_export       => CONNECTED_TO_niosv_rgb_led0_export,       --       niosv_rgb_led0.export
			niosv_rgb_led1_export       => CONNECTED_TO_niosv_rgb_led1_export,       --       niosv_rgb_led1.export
			niosv_rgb_led2_export       => CONNECTED_TO_niosv_rgb_led2_export,       --       niosv_rgb_led2.export
			niosv_rgb_led3_export       => CONNECTED_TO_niosv_rgb_led3_export,       --       niosv_rgb_led3.export
			dipsw_export                => CONNECTED_TO_dipsw_export,                --                dipsw.export
			pb_export                   => CONNECTED_TO_pb_export,                   --                   pb.export
			rgb_led0_export             => CONNECTED_TO_rgb_led0_export,             --             rgb_led0.export
			rgb_led1_export             => CONNECTED_TO_rgb_led1_export,             --             rgb_led1.export
			rgb_led2_export             => CONNECTED_TO_rgb_led2_export,             --             rgb_led2.export
			rgb_led3_export             => CONNECTED_TO_rgb_led3_export,             --             rgb_led3.export
			sys_reset_reset             => CONNECTED_TO_sys_reset_reset,             --            sys_reset.reset
			hdmi_h_clk                  => CONNECTED_TO_hdmi_h_clk,                  --                 hdmi.h_clk
			hdmi_h16_hsync              => CONNECTED_TO_hdmi_h16_hsync,              --                     .h16_hsync
			hdmi_h16_vsync              => CONNECTED_TO_hdmi_h16_vsync,              --                     .h16_vsync
			hdmi_h16_data_e             => CONNECTED_TO_hdmi_h16_data_e,             --                     .h16_data_e
			hdmi_h16_data               => CONNECTED_TO_hdmi_h16_data,               --                     .h16_data
			hdmi_h16_es_data            => CONNECTED_TO_hdmi_h16_es_data,            --                     .h16_es_data
			hdmi_h24_hsync              => CONNECTED_TO_hdmi_h24_hsync,              --                     .h24_hsync
			hdmi_h24_vsync              => CONNECTED_TO_hdmi_h24_vsync,              --                     .h24_vsync
			hdmi_h24_data_e             => CONNECTED_TO_hdmi_h24_data_e,             --                     .h24_data_e
			hdmi_h24_data               => CONNECTED_TO_hdmi_h24_data,               --                     .h24_data
			hdmi_h36_hsync              => CONNECTED_TO_hdmi_h36_hsync,              --                     .h36_hsync
			hdmi_h36_vsync              => CONNECTED_TO_hdmi_h36_vsync,              --                     .h36_vsync
			hdmi_h36_data_e             => CONNECTED_TO_hdmi_h36_data_e,             --                     .h36_data_e
			hdmi_h36_data               => CONNECTED_TO_hdmi_h36_data,               --                     .h36_data
			hdmi_pll_refclk_clk         => CONNECTED_TO_hdmi_pll_refclk_clk          --      hdmi_pll_refclk.clk
		);

