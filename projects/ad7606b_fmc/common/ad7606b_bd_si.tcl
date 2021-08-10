#ad7606b serial interface selection
set_instance_parameter_value axi_ad7606b {IF_TYPE} {0}
set_instance_parameter_value axi_ad7606b {DATA_WIDTH} {32}
set_instance_parameter_value spi_dmac {DMA_DATA_WIDTH_SRC} {128}

# spi engine pll

#add_instance spi_engine_pll altera_pll
#set_instance_parameter_value spi_engine_pll {gui_device_speed_grade} {6}
#set_instance_parameter_value spi_engine_pll {gui_reference_clock_frequency} {100.0}
#set_instance_parameter_value spi_engine_pll {gui_use_locked} {0}
#set_instance_parameter_value spi_engine_pll {gui_number_of_clocks} {1}
#set_instance_parameter_value spi_engine_pll {gui_output_clock_frequency0} {160.00}

#add_connection sys_hps.h2f_user1_clock spi_engine_pll.refclk
#add_connection sys_clk.clk_reset spi_engine_pll.reset

# other connections

#add_connection spi_engine_pll.outclk0 axi_ad7606b.spi_clk
add_connection sys_hps.h2f_user1_clock axi_ad7606b.spi_clk

#add_connection spi_engine_pll.outclk0 util_ad7606b_adc_pack.clk
add_connection sys_hps.h2f_user1_clock util_ad7606b_adc_pack.clk

#add_connection spi_engine_pll.outclk0 axi_ad7606b_adc.adc_clk
add_connection sys_hps.h2f_user1_clock axi_ad7606b_adc.adc_clk

#add_connection spi_engine_pll.outclk0 spi_dmac.if_fifo_wr_clk
add_connection sys_hps.h2f_user1_clock spi_dmac.if_fifo_wr_clk

#add_connection spi_engine_pll.outclk0 spi_dmac_2.if_fifo_wr_clk
add_connection sys_hps.h2f_user1_clock spi_dmac_2.if_fifo_wr_clk