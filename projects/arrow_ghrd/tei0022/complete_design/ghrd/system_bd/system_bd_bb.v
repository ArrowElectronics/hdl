
module system_bd (
	button_pio_external_connection_export,
	dipsw_pio_external_connection_export,
	hdmi_out_h_clk,
	hdmi_out_h16_hsync,
	hdmi_out_h16_vsync,
	hdmi_out_h16_data_e,
	hdmi_out_h16_data,
	hdmi_out_h16_es_data,
	hdmi_out_h24_hsync,
	hdmi_out_h24_vsync,
	hdmi_out_h24_data_e,
	hdmi_out_h24_data,
	hdmi_out_h36_hsync,
	hdmi_out_h36_vsync,
	hdmi_out_h36_data_e,
	hdmi_out_h36_data,
	led_pio_external_connection_export,
	sys_clk_clk,
	sys_hps_h2f_reset_reset_n,
	sys_hps_hps_io_hps_io_emac1_inst_TX_CLK,
	sys_hps_hps_io_hps_io_emac1_inst_TXD0,
	sys_hps_hps_io_hps_io_emac1_inst_TXD1,
	sys_hps_hps_io_hps_io_emac1_inst_TXD2,
	sys_hps_hps_io_hps_io_emac1_inst_TXD3,
	sys_hps_hps_io_hps_io_emac1_inst_RXD0,
	sys_hps_hps_io_hps_io_emac1_inst_MDIO,
	sys_hps_hps_io_hps_io_emac1_inst_MDC,
	sys_hps_hps_io_hps_io_emac1_inst_RX_CTL,
	sys_hps_hps_io_hps_io_emac1_inst_TX_CTL,
	sys_hps_hps_io_hps_io_emac1_inst_RX_CLK,
	sys_hps_hps_io_hps_io_emac1_inst_RXD1,
	sys_hps_hps_io_hps_io_emac1_inst_RXD2,
	sys_hps_hps_io_hps_io_emac1_inst_RXD3,
	sys_hps_hps_io_hps_io_qspi_inst_IO0,
	sys_hps_hps_io_hps_io_qspi_inst_IO1,
	sys_hps_hps_io_hps_io_qspi_inst_IO2,
	sys_hps_hps_io_hps_io_qspi_inst_IO3,
	sys_hps_hps_io_hps_io_qspi_inst_SS0,
	sys_hps_hps_io_hps_io_qspi_inst_CLK,
	sys_hps_hps_io_hps_io_sdio_inst_CMD,
	sys_hps_hps_io_hps_io_sdio_inst_D0,
	sys_hps_hps_io_hps_io_sdio_inst_D1,
	sys_hps_hps_io_hps_io_sdio_inst_CLK,
	sys_hps_hps_io_hps_io_sdio_inst_D2,
	sys_hps_hps_io_hps_io_sdio_inst_D3,
	sys_hps_hps_io_hps_io_usb1_inst_D0,
	sys_hps_hps_io_hps_io_usb1_inst_D1,
	sys_hps_hps_io_hps_io_usb1_inst_D2,
	sys_hps_hps_io_hps_io_usb1_inst_D3,
	sys_hps_hps_io_hps_io_usb1_inst_D4,
	sys_hps_hps_io_hps_io_usb1_inst_D5,
	sys_hps_hps_io_hps_io_usb1_inst_D6,
	sys_hps_hps_io_hps_io_usb1_inst_D7,
	sys_hps_hps_io_hps_io_usb1_inst_CLK,
	sys_hps_hps_io_hps_io_usb1_inst_STP,
	sys_hps_hps_io_hps_io_usb1_inst_DIR,
	sys_hps_hps_io_hps_io_usb1_inst_NXT,
	sys_hps_hps_io_hps_io_uart0_inst_RX,
	sys_hps_hps_io_hps_io_uart0_inst_TX,
	sys_hps_hps_io_hps_io_i2c0_inst_SDA,
	sys_hps_hps_io_hps_io_i2c0_inst_SCL,
	sys_hps_hps_io_hps_io_i2c1_inst_SDA,
	sys_hps_hps_io_hps_io_i2c1_inst_SCL,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO00,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO09,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO35,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO40,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO41,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO42,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO43,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO44,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO48,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO53,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO54,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO55,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO56,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO57,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO58,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO59,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO61,
	sys_hps_hps_io_hps_io_gpio_inst_GPIO65,
	sys_hps_memory_mem_a,
	sys_hps_memory_mem_ba,
	sys_hps_memory_mem_ck,
	sys_hps_memory_mem_ck_n,
	sys_hps_memory_mem_cke,
	sys_hps_memory_mem_cs_n,
	sys_hps_memory_mem_ras_n,
	sys_hps_memory_mem_cas_n,
	sys_hps_memory_mem_we_n,
	sys_hps_memory_mem_reset_n,
	sys_hps_memory_mem_dq,
	sys_hps_memory_mem_dqs,
	sys_hps_memory_mem_dqs_n,
	sys_hps_memory_mem_odt,
	sys_hps_memory_mem_dm,
	sys_hps_memory_oct_rzqin,
	sys_rst_reset_n);	

	input		button_pio_external_connection_export;
	input	[1:0]	dipsw_pio_external_connection_export;
	output		hdmi_out_h_clk;
	output		hdmi_out_h16_hsync;
	output		hdmi_out_h16_vsync;
	output		hdmi_out_h16_data_e;
	output	[15:0]	hdmi_out_h16_data;
	output	[15:0]	hdmi_out_h16_es_data;
	output		hdmi_out_h24_hsync;
	output		hdmi_out_h24_vsync;
	output		hdmi_out_h24_data_e;
	output	[23:0]	hdmi_out_h24_data;
	output		hdmi_out_h36_hsync;
	output		hdmi_out_h36_vsync;
	output		hdmi_out_h36_data_e;
	output	[35:0]	hdmi_out_h36_data;
	output	[1:0]	led_pio_external_connection_export;
	input		sys_clk_clk;
	output		sys_hps_h2f_reset_reset_n;
	output		sys_hps_hps_io_hps_io_emac1_inst_TX_CLK;
	output		sys_hps_hps_io_hps_io_emac1_inst_TXD0;
	output		sys_hps_hps_io_hps_io_emac1_inst_TXD1;
	output		sys_hps_hps_io_hps_io_emac1_inst_TXD2;
	output		sys_hps_hps_io_hps_io_emac1_inst_TXD3;
	input		sys_hps_hps_io_hps_io_emac1_inst_RXD0;
	inout		sys_hps_hps_io_hps_io_emac1_inst_MDIO;
	output		sys_hps_hps_io_hps_io_emac1_inst_MDC;
	input		sys_hps_hps_io_hps_io_emac1_inst_RX_CTL;
	output		sys_hps_hps_io_hps_io_emac1_inst_TX_CTL;
	input		sys_hps_hps_io_hps_io_emac1_inst_RX_CLK;
	input		sys_hps_hps_io_hps_io_emac1_inst_RXD1;
	input		sys_hps_hps_io_hps_io_emac1_inst_RXD2;
	input		sys_hps_hps_io_hps_io_emac1_inst_RXD3;
	inout		sys_hps_hps_io_hps_io_qspi_inst_IO0;
	inout		sys_hps_hps_io_hps_io_qspi_inst_IO1;
	inout		sys_hps_hps_io_hps_io_qspi_inst_IO2;
	inout		sys_hps_hps_io_hps_io_qspi_inst_IO3;
	output		sys_hps_hps_io_hps_io_qspi_inst_SS0;
	output		sys_hps_hps_io_hps_io_qspi_inst_CLK;
	inout		sys_hps_hps_io_hps_io_sdio_inst_CMD;
	inout		sys_hps_hps_io_hps_io_sdio_inst_D0;
	inout		sys_hps_hps_io_hps_io_sdio_inst_D1;
	output		sys_hps_hps_io_hps_io_sdio_inst_CLK;
	inout		sys_hps_hps_io_hps_io_sdio_inst_D2;
	inout		sys_hps_hps_io_hps_io_sdio_inst_D3;
	inout		sys_hps_hps_io_hps_io_usb1_inst_D0;
	inout		sys_hps_hps_io_hps_io_usb1_inst_D1;
	inout		sys_hps_hps_io_hps_io_usb1_inst_D2;
	inout		sys_hps_hps_io_hps_io_usb1_inst_D3;
	inout		sys_hps_hps_io_hps_io_usb1_inst_D4;
	inout		sys_hps_hps_io_hps_io_usb1_inst_D5;
	inout		sys_hps_hps_io_hps_io_usb1_inst_D6;
	inout		sys_hps_hps_io_hps_io_usb1_inst_D7;
	input		sys_hps_hps_io_hps_io_usb1_inst_CLK;
	output		sys_hps_hps_io_hps_io_usb1_inst_STP;
	input		sys_hps_hps_io_hps_io_usb1_inst_DIR;
	input		sys_hps_hps_io_hps_io_usb1_inst_NXT;
	input		sys_hps_hps_io_hps_io_uart0_inst_RX;
	output		sys_hps_hps_io_hps_io_uart0_inst_TX;
	inout		sys_hps_hps_io_hps_io_i2c0_inst_SDA;
	inout		sys_hps_hps_io_hps_io_i2c0_inst_SCL;
	inout		sys_hps_hps_io_hps_io_i2c1_inst_SDA;
	inout		sys_hps_hps_io_hps_io_i2c1_inst_SCL;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO00;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO09;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO35;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO40;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO41;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO42;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO43;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO44;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO48;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO53;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO54;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO55;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO56;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO57;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO58;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO59;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO61;
	inout		sys_hps_hps_io_hps_io_gpio_inst_GPIO65;
	output	[14:0]	sys_hps_memory_mem_a;
	output	[2:0]	sys_hps_memory_mem_ba;
	output		sys_hps_memory_mem_ck;
	output		sys_hps_memory_mem_ck_n;
	output		sys_hps_memory_mem_cke;
	output		sys_hps_memory_mem_cs_n;
	output		sys_hps_memory_mem_ras_n;
	output		sys_hps_memory_mem_cas_n;
	output		sys_hps_memory_mem_we_n;
	output		sys_hps_memory_mem_reset_n;
	inout	[31:0]	sys_hps_memory_mem_dq;
	inout	[3:0]	sys_hps_memory_mem_dqs;
	inout	[3:0]	sys_hps_memory_mem_dqs_n;
	output		sys_hps_memory_mem_odt;
	output	[3:0]	sys_hps_memory_mem_dm;
	input		sys_hps_memory_oct_rzqin;
	input		sys_rst_reset_n;
endmodule
