	component system_bd is
		port (
			button_pio_external_connection_export       : in    std_logic                     := 'X';             -- export
			dipsw_pio_external_connection_export        : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			hdmi_out_h_clk                              : out   std_logic;                                        -- h_clk
			hdmi_out_h16_hsync                          : out   std_logic;                                        -- h16_hsync
			hdmi_out_h16_vsync                          : out   std_logic;                                        -- h16_vsync
			hdmi_out_h16_data_e                         : out   std_logic;                                        -- h16_data_e
			hdmi_out_h16_data                           : out   std_logic_vector(15 downto 0);                    -- h16_data
			hdmi_out_h16_es_data                        : out   std_logic_vector(15 downto 0);                    -- h16_es_data
			hdmi_out_h24_hsync                          : out   std_logic;                                        -- h24_hsync
			hdmi_out_h24_vsync                          : out   std_logic;                                        -- h24_vsync
			hdmi_out_h24_data_e                         : out   std_logic;                                        -- h24_data_e
			hdmi_out_h24_data                           : out   std_logic_vector(23 downto 0);                    -- h24_data
			hdmi_out_h36_hsync                          : out   std_logic;                                        -- h36_hsync
			hdmi_out_h36_vsync                          : out   std_logic;                                        -- h36_vsync
			hdmi_out_h36_data_e                         : out   std_logic;                                        -- h36_data_e
			hdmi_out_h36_data                           : out   std_logic_vector(35 downto 0);                    -- h36_data
			led_pio_external_connection_export          : out   std_logic_vector(1 downto 0);                     -- export
			spi_engine_execution_0_spi_out_three_wire   : out   std_logic;                                        -- three_wire
			spi_engine_execution_0_spi_out_sdo_t        : out   std_logic;                                        -- sdo_t
			spi_engine_execution_0_spi_out_sdo          : out   std_logic;                                        -- sdo
			spi_engine_execution_0_spi_out_sdi          : in    std_logic                     := 'X';             -- sdi
			spi_engine_execution_0_spi_out_cs           : out   std_logic_vector(0 downto 0);                     -- cs
			spi_engine_execution_0_spi_out_sclk         : out   std_logic;                                        -- sclk
			sys_clk_clk                                 : in    std_logic                     := 'X';             -- clk
			sys_hps_h2f_reset_reset_n                   : out   std_logic;                                        -- reset_n
			sys_hps_hps_io_hps_io_emac1_inst_TX_CLK     : out   std_logic;                                        -- hps_io_emac1_inst_TX_CLK
			sys_hps_hps_io_hps_io_emac1_inst_TXD0       : out   std_logic;                                        -- hps_io_emac1_inst_TXD0
			sys_hps_hps_io_hps_io_emac1_inst_TXD1       : out   std_logic;                                        -- hps_io_emac1_inst_TXD1
			sys_hps_hps_io_hps_io_emac1_inst_TXD2       : out   std_logic;                                        -- hps_io_emac1_inst_TXD2
			sys_hps_hps_io_hps_io_emac1_inst_TXD3       : out   std_logic;                                        -- hps_io_emac1_inst_TXD3
			sys_hps_hps_io_hps_io_emac1_inst_RXD0       : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD0
			sys_hps_hps_io_hps_io_emac1_inst_MDIO       : inout std_logic                     := 'X';             -- hps_io_emac1_inst_MDIO
			sys_hps_hps_io_hps_io_emac1_inst_MDC        : out   std_logic;                                        -- hps_io_emac1_inst_MDC
			sys_hps_hps_io_hps_io_emac1_inst_RX_CTL     : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CTL
			sys_hps_hps_io_hps_io_emac1_inst_TX_CTL     : out   std_logic;                                        -- hps_io_emac1_inst_TX_CTL
			sys_hps_hps_io_hps_io_emac1_inst_RX_CLK     : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CLK
			sys_hps_hps_io_hps_io_emac1_inst_RXD1       : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD1
			sys_hps_hps_io_hps_io_emac1_inst_RXD2       : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD2
			sys_hps_hps_io_hps_io_emac1_inst_RXD3       : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD3
			sys_hps_hps_io_hps_io_qspi_inst_IO0         : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO0
			sys_hps_hps_io_hps_io_qspi_inst_IO1         : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO1
			sys_hps_hps_io_hps_io_qspi_inst_IO2         : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO2
			sys_hps_hps_io_hps_io_qspi_inst_IO3         : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO3
			sys_hps_hps_io_hps_io_qspi_inst_SS0         : out   std_logic;                                        -- hps_io_qspi_inst_SS0
			sys_hps_hps_io_hps_io_qspi_inst_CLK         : out   std_logic;                                        -- hps_io_qspi_inst_CLK
			sys_hps_hps_io_hps_io_sdio_inst_CMD         : inout std_logic                     := 'X';             -- hps_io_sdio_inst_CMD
			sys_hps_hps_io_hps_io_sdio_inst_D0          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D0
			sys_hps_hps_io_hps_io_sdio_inst_D1          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D1
			sys_hps_hps_io_hps_io_sdio_inst_CLK         : out   std_logic;                                        -- hps_io_sdio_inst_CLK
			sys_hps_hps_io_hps_io_sdio_inst_D2          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D2
			sys_hps_hps_io_hps_io_sdio_inst_D3          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D3
			sys_hps_hps_io_hps_io_usb1_inst_D0          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D0
			sys_hps_hps_io_hps_io_usb1_inst_D1          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D1
			sys_hps_hps_io_hps_io_usb1_inst_D2          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D2
			sys_hps_hps_io_hps_io_usb1_inst_D3          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D3
			sys_hps_hps_io_hps_io_usb1_inst_D4          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D4
			sys_hps_hps_io_hps_io_usb1_inst_D5          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D5
			sys_hps_hps_io_hps_io_usb1_inst_D6          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D6
			sys_hps_hps_io_hps_io_usb1_inst_D7          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D7
			sys_hps_hps_io_hps_io_usb1_inst_CLK         : in    std_logic                     := 'X';             -- hps_io_usb1_inst_CLK
			sys_hps_hps_io_hps_io_usb1_inst_STP         : out   std_logic;                                        -- hps_io_usb1_inst_STP
			sys_hps_hps_io_hps_io_usb1_inst_DIR         : in    std_logic                     := 'X';             -- hps_io_usb1_inst_DIR
			sys_hps_hps_io_hps_io_usb1_inst_NXT         : in    std_logic                     := 'X';             -- hps_io_usb1_inst_NXT
			sys_hps_hps_io_hps_io_uart0_inst_RX         : in    std_logic                     := 'X';             -- hps_io_uart0_inst_RX
			sys_hps_hps_io_hps_io_uart0_inst_TX         : out   std_logic;                                        -- hps_io_uart0_inst_TX
			sys_hps_hps_io_hps_io_i2c0_inst_SDA         : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SDA
			sys_hps_hps_io_hps_io_i2c0_inst_SCL         : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SCL
			sys_hps_hps_io_hps_io_i2c1_inst_SDA         : inout std_logic                     := 'X';             -- hps_io_i2c1_inst_SDA
			sys_hps_hps_io_hps_io_i2c1_inst_SCL         : inout std_logic                     := 'X';             -- hps_io_i2c1_inst_SCL
			sys_hps_hps_io_hps_io_gpio_inst_GPIO00      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO00
			sys_hps_hps_io_hps_io_gpio_inst_GPIO09      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO09
			sys_hps_hps_io_hps_io_gpio_inst_GPIO35      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO35
			sys_hps_hps_io_hps_io_gpio_inst_GPIO40      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO40
			sys_hps_hps_io_hps_io_gpio_inst_GPIO41      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO41
			sys_hps_hps_io_hps_io_gpio_inst_GPIO42      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO42
			sys_hps_hps_io_hps_io_gpio_inst_GPIO43      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO43
			sys_hps_hps_io_hps_io_gpio_inst_GPIO44      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO44
			sys_hps_hps_io_hps_io_gpio_inst_GPIO48      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO48
			sys_hps_hps_io_hps_io_gpio_inst_GPIO53      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO53
			sys_hps_hps_io_hps_io_gpio_inst_GPIO54      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO54
			sys_hps_hps_io_hps_io_gpio_inst_GPIO55      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO55
			sys_hps_hps_io_hps_io_gpio_inst_GPIO56      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO56
			sys_hps_hps_io_hps_io_gpio_inst_GPIO57      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO57
			sys_hps_hps_io_hps_io_gpio_inst_GPIO58      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO58
			sys_hps_hps_io_hps_io_gpio_inst_GPIO59      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO59
			sys_hps_hps_io_hps_io_gpio_inst_GPIO61      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO61
			sys_hps_hps_io_hps_io_gpio_inst_GPIO65      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO65
			sys_hps_memory_mem_a                        : out   std_logic_vector(14 downto 0);                    -- mem_a
			sys_hps_memory_mem_ba                       : out   std_logic_vector(2 downto 0);                     -- mem_ba
			sys_hps_memory_mem_ck                       : out   std_logic;                                        -- mem_ck
			sys_hps_memory_mem_ck_n                     : out   std_logic;                                        -- mem_ck_n
			sys_hps_memory_mem_cke                      : out   std_logic;                                        -- mem_cke
			sys_hps_memory_mem_cs_n                     : out   std_logic;                                        -- mem_cs_n
			sys_hps_memory_mem_ras_n                    : out   std_logic;                                        -- mem_ras_n
			sys_hps_memory_mem_cas_n                    : out   std_logic;                                        -- mem_cas_n
			sys_hps_memory_mem_we_n                     : out   std_logic;                                        -- mem_we_n
			sys_hps_memory_mem_reset_n                  : out   std_logic;                                        -- mem_reset_n
			sys_hps_memory_mem_dq                       : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
			sys_hps_memory_mem_dqs                      : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
			sys_hps_memory_mem_dqs_n                    : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
			sys_hps_memory_mem_odt                      : out   std_logic;                                        -- mem_odt
			sys_hps_memory_mem_dm                       : out   std_logic_vector(3 downto 0);                     -- mem_dm
			sys_hps_memory_oct_rzqin                    : in    std_logic                     := 'X';             -- oct_rzqin
			sys_rst_reset_n                             : in    std_logic                     := 'X';             -- reset_n
			trigger_gen_0_load_config_load_config       : in    std_logic                     := 'X';             -- load_config
			trigger_gen_0_pulse_period_pulse_period     : in    std_logic_vector(31 downto 0) := (others => 'X'); -- pulse_period
			trigger_gen_0_pulse_width_pulse_width       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- pulse_width
			upscale_converter_0_dfmt_enable_dfmt_enable : in    std_logic                     := 'X';             -- dfmt_enable
			upscale_converter_0_dfmt_se_dfmt_se         : in    std_logic                     := 'X';             -- dfmt_se
			upscale_converter_0_dfmt_type_dfmt_type     : in    std_logic                     := 'X'              -- dfmt_type
		);
	end component system_bd;

	u0 : component system_bd
		port map (
			button_pio_external_connection_export       => CONNECTED_TO_button_pio_external_connection_export,       --  button_pio_external_connection.export
			dipsw_pio_external_connection_export        => CONNECTED_TO_dipsw_pio_external_connection_export,        --   dipsw_pio_external_connection.export
			hdmi_out_h_clk                              => CONNECTED_TO_hdmi_out_h_clk,                              --                        hdmi_out.h_clk
			hdmi_out_h16_hsync                          => CONNECTED_TO_hdmi_out_h16_hsync,                          --                                .h16_hsync
			hdmi_out_h16_vsync                          => CONNECTED_TO_hdmi_out_h16_vsync,                          --                                .h16_vsync
			hdmi_out_h16_data_e                         => CONNECTED_TO_hdmi_out_h16_data_e,                         --                                .h16_data_e
			hdmi_out_h16_data                           => CONNECTED_TO_hdmi_out_h16_data,                           --                                .h16_data
			hdmi_out_h16_es_data                        => CONNECTED_TO_hdmi_out_h16_es_data,                        --                                .h16_es_data
			hdmi_out_h24_hsync                          => CONNECTED_TO_hdmi_out_h24_hsync,                          --                                .h24_hsync
			hdmi_out_h24_vsync                          => CONNECTED_TO_hdmi_out_h24_vsync,                          --                                .h24_vsync
			hdmi_out_h24_data_e                         => CONNECTED_TO_hdmi_out_h24_data_e,                         --                                .h24_data_e
			hdmi_out_h24_data                           => CONNECTED_TO_hdmi_out_h24_data,                           --                                .h24_data
			hdmi_out_h36_hsync                          => CONNECTED_TO_hdmi_out_h36_hsync,                          --                                .h36_hsync
			hdmi_out_h36_vsync                          => CONNECTED_TO_hdmi_out_h36_vsync,                          --                                .h36_vsync
			hdmi_out_h36_data_e                         => CONNECTED_TO_hdmi_out_h36_data_e,                         --                                .h36_data_e
			hdmi_out_h36_data                           => CONNECTED_TO_hdmi_out_h36_data,                           --                                .h36_data
			led_pio_external_connection_export          => CONNECTED_TO_led_pio_external_connection_export,          --     led_pio_external_connection.export
			spi_engine_execution_0_spi_out_three_wire   => CONNECTED_TO_spi_engine_execution_0_spi_out_three_wire,   --  spi_engine_execution_0_spi_out.three_wire
			spi_engine_execution_0_spi_out_sdo_t        => CONNECTED_TO_spi_engine_execution_0_spi_out_sdo_t,        --                                .sdo_t
			spi_engine_execution_0_spi_out_sdo          => CONNECTED_TO_spi_engine_execution_0_spi_out_sdo,          --                                .sdo
			spi_engine_execution_0_spi_out_sdi          => CONNECTED_TO_spi_engine_execution_0_spi_out_sdi,          --                                .sdi
			spi_engine_execution_0_spi_out_cs           => CONNECTED_TO_spi_engine_execution_0_spi_out_cs,           --                                .cs
			spi_engine_execution_0_spi_out_sclk         => CONNECTED_TO_spi_engine_execution_0_spi_out_sclk,         --                                .sclk
			sys_clk_clk                                 => CONNECTED_TO_sys_clk_clk,                                 --                         sys_clk.clk
			sys_hps_h2f_reset_reset_n                   => CONNECTED_TO_sys_hps_h2f_reset_reset_n,                   --               sys_hps_h2f_reset.reset_n
			sys_hps_hps_io_hps_io_emac1_inst_TX_CLK     => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_TX_CLK,     --                  sys_hps_hps_io.hps_io_emac1_inst_TX_CLK
			sys_hps_hps_io_hps_io_emac1_inst_TXD0       => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_TXD0,       --                                .hps_io_emac1_inst_TXD0
			sys_hps_hps_io_hps_io_emac1_inst_TXD1       => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_TXD1,       --                                .hps_io_emac1_inst_TXD1
			sys_hps_hps_io_hps_io_emac1_inst_TXD2       => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_TXD2,       --                                .hps_io_emac1_inst_TXD2
			sys_hps_hps_io_hps_io_emac1_inst_TXD3       => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_TXD3,       --                                .hps_io_emac1_inst_TXD3
			sys_hps_hps_io_hps_io_emac1_inst_RXD0       => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_RXD0,       --                                .hps_io_emac1_inst_RXD0
			sys_hps_hps_io_hps_io_emac1_inst_MDIO       => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_MDIO,       --                                .hps_io_emac1_inst_MDIO
			sys_hps_hps_io_hps_io_emac1_inst_MDC        => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_MDC,        --                                .hps_io_emac1_inst_MDC
			sys_hps_hps_io_hps_io_emac1_inst_RX_CTL     => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_RX_CTL,     --                                .hps_io_emac1_inst_RX_CTL
			sys_hps_hps_io_hps_io_emac1_inst_TX_CTL     => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_TX_CTL,     --                                .hps_io_emac1_inst_TX_CTL
			sys_hps_hps_io_hps_io_emac1_inst_RX_CLK     => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_RX_CLK,     --                                .hps_io_emac1_inst_RX_CLK
			sys_hps_hps_io_hps_io_emac1_inst_RXD1       => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_RXD1,       --                                .hps_io_emac1_inst_RXD1
			sys_hps_hps_io_hps_io_emac1_inst_RXD2       => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_RXD2,       --                                .hps_io_emac1_inst_RXD2
			sys_hps_hps_io_hps_io_emac1_inst_RXD3       => CONNECTED_TO_sys_hps_hps_io_hps_io_emac1_inst_RXD3,       --                                .hps_io_emac1_inst_RXD3
			sys_hps_hps_io_hps_io_qspi_inst_IO0         => CONNECTED_TO_sys_hps_hps_io_hps_io_qspi_inst_IO0,         --                                .hps_io_qspi_inst_IO0
			sys_hps_hps_io_hps_io_qspi_inst_IO1         => CONNECTED_TO_sys_hps_hps_io_hps_io_qspi_inst_IO1,         --                                .hps_io_qspi_inst_IO1
			sys_hps_hps_io_hps_io_qspi_inst_IO2         => CONNECTED_TO_sys_hps_hps_io_hps_io_qspi_inst_IO2,         --                                .hps_io_qspi_inst_IO2
			sys_hps_hps_io_hps_io_qspi_inst_IO3         => CONNECTED_TO_sys_hps_hps_io_hps_io_qspi_inst_IO3,         --                                .hps_io_qspi_inst_IO3
			sys_hps_hps_io_hps_io_qspi_inst_SS0         => CONNECTED_TO_sys_hps_hps_io_hps_io_qspi_inst_SS0,         --                                .hps_io_qspi_inst_SS0
			sys_hps_hps_io_hps_io_qspi_inst_CLK         => CONNECTED_TO_sys_hps_hps_io_hps_io_qspi_inst_CLK,         --                                .hps_io_qspi_inst_CLK
			sys_hps_hps_io_hps_io_sdio_inst_CMD         => CONNECTED_TO_sys_hps_hps_io_hps_io_sdio_inst_CMD,         --                                .hps_io_sdio_inst_CMD
			sys_hps_hps_io_hps_io_sdio_inst_D0          => CONNECTED_TO_sys_hps_hps_io_hps_io_sdio_inst_D0,          --                                .hps_io_sdio_inst_D0
			sys_hps_hps_io_hps_io_sdio_inst_D1          => CONNECTED_TO_sys_hps_hps_io_hps_io_sdio_inst_D1,          --                                .hps_io_sdio_inst_D1
			sys_hps_hps_io_hps_io_sdio_inst_CLK         => CONNECTED_TO_sys_hps_hps_io_hps_io_sdio_inst_CLK,         --                                .hps_io_sdio_inst_CLK
			sys_hps_hps_io_hps_io_sdio_inst_D2          => CONNECTED_TO_sys_hps_hps_io_hps_io_sdio_inst_D2,          --                                .hps_io_sdio_inst_D2
			sys_hps_hps_io_hps_io_sdio_inst_D3          => CONNECTED_TO_sys_hps_hps_io_hps_io_sdio_inst_D3,          --                                .hps_io_sdio_inst_D3
			sys_hps_hps_io_hps_io_usb1_inst_D0          => CONNECTED_TO_sys_hps_hps_io_hps_io_usb1_inst_D0,          --                                .hps_io_usb1_inst_D0
			sys_hps_hps_io_hps_io_usb1_inst_D1          => CONNECTED_TO_sys_hps_hps_io_hps_io_usb1_inst_D1,          --                                .hps_io_usb1_inst_D1
			sys_hps_hps_io_hps_io_usb1_inst_D2          => CONNECTED_TO_sys_hps_hps_io_hps_io_usb1_inst_D2,          --                                .hps_io_usb1_inst_D2
			sys_hps_hps_io_hps_io_usb1_inst_D3          => CONNECTED_TO_sys_hps_hps_io_hps_io_usb1_inst_D3,          --                                .hps_io_usb1_inst_D3
			sys_hps_hps_io_hps_io_usb1_inst_D4          => CONNECTED_TO_sys_hps_hps_io_hps_io_usb1_inst_D4,          --                                .hps_io_usb1_inst_D4
			sys_hps_hps_io_hps_io_usb1_inst_D5          => CONNECTED_TO_sys_hps_hps_io_hps_io_usb1_inst_D5,          --                                .hps_io_usb1_inst_D5
			sys_hps_hps_io_hps_io_usb1_inst_D6          => CONNECTED_TO_sys_hps_hps_io_hps_io_usb1_inst_D6,          --                                .hps_io_usb1_inst_D6
			sys_hps_hps_io_hps_io_usb1_inst_D7          => CONNECTED_TO_sys_hps_hps_io_hps_io_usb1_inst_D7,          --                                .hps_io_usb1_inst_D7
			sys_hps_hps_io_hps_io_usb1_inst_CLK         => CONNECTED_TO_sys_hps_hps_io_hps_io_usb1_inst_CLK,         --                                .hps_io_usb1_inst_CLK
			sys_hps_hps_io_hps_io_usb1_inst_STP         => CONNECTED_TO_sys_hps_hps_io_hps_io_usb1_inst_STP,         --                                .hps_io_usb1_inst_STP
			sys_hps_hps_io_hps_io_usb1_inst_DIR         => CONNECTED_TO_sys_hps_hps_io_hps_io_usb1_inst_DIR,         --                                .hps_io_usb1_inst_DIR
			sys_hps_hps_io_hps_io_usb1_inst_NXT         => CONNECTED_TO_sys_hps_hps_io_hps_io_usb1_inst_NXT,         --                                .hps_io_usb1_inst_NXT
			sys_hps_hps_io_hps_io_uart0_inst_RX         => CONNECTED_TO_sys_hps_hps_io_hps_io_uart0_inst_RX,         --                                .hps_io_uart0_inst_RX
			sys_hps_hps_io_hps_io_uart0_inst_TX         => CONNECTED_TO_sys_hps_hps_io_hps_io_uart0_inst_TX,         --                                .hps_io_uart0_inst_TX
			sys_hps_hps_io_hps_io_i2c0_inst_SDA         => CONNECTED_TO_sys_hps_hps_io_hps_io_i2c0_inst_SDA,         --                                .hps_io_i2c0_inst_SDA
			sys_hps_hps_io_hps_io_i2c0_inst_SCL         => CONNECTED_TO_sys_hps_hps_io_hps_io_i2c0_inst_SCL,         --                                .hps_io_i2c0_inst_SCL
			sys_hps_hps_io_hps_io_i2c1_inst_SDA         => CONNECTED_TO_sys_hps_hps_io_hps_io_i2c1_inst_SDA,         --                                .hps_io_i2c1_inst_SDA
			sys_hps_hps_io_hps_io_i2c1_inst_SCL         => CONNECTED_TO_sys_hps_hps_io_hps_io_i2c1_inst_SCL,         --                                .hps_io_i2c1_inst_SCL
			sys_hps_hps_io_hps_io_gpio_inst_GPIO00      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO00,      --                                .hps_io_gpio_inst_GPIO00
			sys_hps_hps_io_hps_io_gpio_inst_GPIO09      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO09,      --                                .hps_io_gpio_inst_GPIO09
			sys_hps_hps_io_hps_io_gpio_inst_GPIO35      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO35,      --                                .hps_io_gpio_inst_GPIO35
			sys_hps_hps_io_hps_io_gpio_inst_GPIO40      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO40,      --                                .hps_io_gpio_inst_GPIO40
			sys_hps_hps_io_hps_io_gpio_inst_GPIO41      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO41,      --                                .hps_io_gpio_inst_GPIO41
			sys_hps_hps_io_hps_io_gpio_inst_GPIO42      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO42,      --                                .hps_io_gpio_inst_GPIO42
			sys_hps_hps_io_hps_io_gpio_inst_GPIO43      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO43,      --                                .hps_io_gpio_inst_GPIO43
			sys_hps_hps_io_hps_io_gpio_inst_GPIO44      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO44,      --                                .hps_io_gpio_inst_GPIO44
			sys_hps_hps_io_hps_io_gpio_inst_GPIO48      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO48,      --                                .hps_io_gpio_inst_GPIO48
			sys_hps_hps_io_hps_io_gpio_inst_GPIO53      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO53,      --                                .hps_io_gpio_inst_GPIO53
			sys_hps_hps_io_hps_io_gpio_inst_GPIO54      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO54,      --                                .hps_io_gpio_inst_GPIO54
			sys_hps_hps_io_hps_io_gpio_inst_GPIO55      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO55,      --                                .hps_io_gpio_inst_GPIO55
			sys_hps_hps_io_hps_io_gpio_inst_GPIO56      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO56,      --                                .hps_io_gpio_inst_GPIO56
			sys_hps_hps_io_hps_io_gpio_inst_GPIO57      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO57,      --                                .hps_io_gpio_inst_GPIO57
			sys_hps_hps_io_hps_io_gpio_inst_GPIO58      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO58,      --                                .hps_io_gpio_inst_GPIO58
			sys_hps_hps_io_hps_io_gpio_inst_GPIO59      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO59,      --                                .hps_io_gpio_inst_GPIO59
			sys_hps_hps_io_hps_io_gpio_inst_GPIO61      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO61,      --                                .hps_io_gpio_inst_GPIO61
			sys_hps_hps_io_hps_io_gpio_inst_GPIO65      => CONNECTED_TO_sys_hps_hps_io_hps_io_gpio_inst_GPIO65,      --                                .hps_io_gpio_inst_GPIO65
			sys_hps_memory_mem_a                        => CONNECTED_TO_sys_hps_memory_mem_a,                        --                  sys_hps_memory.mem_a
			sys_hps_memory_mem_ba                       => CONNECTED_TO_sys_hps_memory_mem_ba,                       --                                .mem_ba
			sys_hps_memory_mem_ck                       => CONNECTED_TO_sys_hps_memory_mem_ck,                       --                                .mem_ck
			sys_hps_memory_mem_ck_n                     => CONNECTED_TO_sys_hps_memory_mem_ck_n,                     --                                .mem_ck_n
			sys_hps_memory_mem_cke                      => CONNECTED_TO_sys_hps_memory_mem_cke,                      --                                .mem_cke
			sys_hps_memory_mem_cs_n                     => CONNECTED_TO_sys_hps_memory_mem_cs_n,                     --                                .mem_cs_n
			sys_hps_memory_mem_ras_n                    => CONNECTED_TO_sys_hps_memory_mem_ras_n,                    --                                .mem_ras_n
			sys_hps_memory_mem_cas_n                    => CONNECTED_TO_sys_hps_memory_mem_cas_n,                    --                                .mem_cas_n
			sys_hps_memory_mem_we_n                     => CONNECTED_TO_sys_hps_memory_mem_we_n,                     --                                .mem_we_n
			sys_hps_memory_mem_reset_n                  => CONNECTED_TO_sys_hps_memory_mem_reset_n,                  --                                .mem_reset_n
			sys_hps_memory_mem_dq                       => CONNECTED_TO_sys_hps_memory_mem_dq,                       --                                .mem_dq
			sys_hps_memory_mem_dqs                      => CONNECTED_TO_sys_hps_memory_mem_dqs,                      --                                .mem_dqs
			sys_hps_memory_mem_dqs_n                    => CONNECTED_TO_sys_hps_memory_mem_dqs_n,                    --                                .mem_dqs_n
			sys_hps_memory_mem_odt                      => CONNECTED_TO_sys_hps_memory_mem_odt,                      --                                .mem_odt
			sys_hps_memory_mem_dm                       => CONNECTED_TO_sys_hps_memory_mem_dm,                       --                                .mem_dm
			sys_hps_memory_oct_rzqin                    => CONNECTED_TO_sys_hps_memory_oct_rzqin,                    --                                .oct_rzqin
			sys_rst_reset_n                             => CONNECTED_TO_sys_rst_reset_n,                             --                         sys_rst.reset_n
			trigger_gen_0_load_config_load_config       => CONNECTED_TO_trigger_gen_0_load_config_load_config,       --       trigger_gen_0_load_config.load_config
			trigger_gen_0_pulse_period_pulse_period     => CONNECTED_TO_trigger_gen_0_pulse_period_pulse_period,     --      trigger_gen_0_pulse_period.pulse_period
			trigger_gen_0_pulse_width_pulse_width       => CONNECTED_TO_trigger_gen_0_pulse_width_pulse_width,       --       trigger_gen_0_pulse_width.pulse_width
			upscale_converter_0_dfmt_enable_dfmt_enable => CONNECTED_TO_upscale_converter_0_dfmt_enable_dfmt_enable, -- upscale_converter_0_dfmt_enable.dfmt_enable
			upscale_converter_0_dfmt_se_dfmt_se         => CONNECTED_TO_upscale_converter_0_dfmt_se_dfmt_se,         --     upscale_converter_0_dfmt_se.dfmt_se
			upscale_converter_0_dfmt_type_dfmt_type     => CONNECTED_TO_upscale_converter_0_dfmt_type_dfmt_type      --   upscale_converter_0_dfmt_type.dfmt_type
		);

