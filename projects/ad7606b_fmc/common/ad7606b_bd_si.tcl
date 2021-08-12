#ad7606b serial interface selection
set_instance_parameter_value axi_ad7606b {IF_TYPE} {0}
set_instance_parameter_value axi_ad7606b {DATA_WIDTH} {32}
set_instance_parameter_value spi_dmac {DMA_DATA_WIDTH_SRC} {128}

#source of clock connection
add_connection sys_hps.h2f_user1_clock axi_ad7606b.spi_clk
add_connection sys_hps.h2f_user1_clock util_ad7606b_adc_pack.clk
add_connection sys_hps.h2f_user1_clock axi_ad7606b_adc.adc_clk
add_connection sys_hps.h2f_user1_clock spi_dmac.if_fifo_wr_clk
add_connection sys_hps.h2f_user1_clock spi_dmac_2.if_fifo_wr_clk