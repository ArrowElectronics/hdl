global ad7606b_if 

# ad7606b_gpio

add_instance ad7606b_gpio altera_avalon_pio
set_instance_parameter_value ad7606b_gpio {direction} {Bidir}
set_instance_parameter_value ad7606b_gpio {edgeType} {RISING}
set_instance_parameter_value ad7606b_gpio {generateIRQ} {0}
set_instance_parameter_value ad7606b_gpio {irqType} {LEVEL}
set_instance_parameter_value ad7606b_gpio {width} {16}

add_connection sys_clk.clk_reset ad7606b_gpio.reset
add_connection sys_hps.h2f_user1_clock ad7606b_gpio.clk
add_interface ad7606b_gpio_export conduit end
set_interface_property ad7606b_gpio_export EXPORT_OF ad7606b_gpio.external_connection

ad_cpu_interconnect 0x00020050 ad7606b_gpio.s1

# ad7606b_if 

add_instance axi_ad7606b axi_ad7616_06b
set_instance_parameter_value axi_ad7606b {DATA_WIDTH} {16}
set_instance_parameter_value axi_ad7606b {ID} {0}
set_instance_parameter_value axi_ad7606b {IF_TYPE} {$ad7606b_if}
set_instance_parameter_value axi_ad7606b {NUM_OF_SDI} {4}

add_interface axi_ad7606b_control_interface conduit end
set_interface_property axi_ad7606b_control_interface EXPORT_OF axi_ad7606b.control_interface
add_interface axi_ad7606b_parallel_interface conduit end
set_interface_property axi_ad7606b_parallel_interface EXPORT_OF axi_ad7606b.parallel_interface
add_interface axi_ad7606b_serial_interface conduit end
set_interface_property axi_ad7606b_serial_interface EXPORT_OF axi_ad7606b.Serial_interface
add_connection sys_clk.clk_reset axi_ad7606b.s_axi_aresetn
add_connection sys_hps.f2h_irq0 axi_ad7606b.irq
set_connection_parameter_value sys_hps.f2h_irq0/axi_ad7606b.irq irqNumber {6}
add_connection sys_hps.f2h_irq1 axi_ad7606b.irq
set_connection_parameter_value sys_hps.f2h_irq1/axi_ad7606b.irq irqNumber {6}

add_connection sys_hps.h2f_user1_clock axi_ad7606b.s_axi_aclk
add_connection sys_hps.h2f_lw_axi_master axi_ad7606b.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad7606b.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad7606b.s_axi baseAddress {0x00040000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad7606b.s_axi defaultConnection {0}

# spi-dma fifo

add_instance spi_dmac axi_dmac 
set_instance_parameter_value spi_dmac {ASYNC_CLK_DEST_REQ_MANUAL} {1}
set_instance_parameter_value spi_dmac {ASYNC_CLK_REQ_SRC_MANUAL} {1}
set_instance_parameter_value spi_dmac {ASYNC_CLK_SRC_DEST_MANUAL} {1}
set_instance_parameter_value spi_dmac {AUTO_ASYNC_CLK} {1}
set_instance_parameter_value spi_dmac {AXI_SLICE_DEST} {1}
set_instance_parameter_value spi_dmac {AXI_SLICE_SRC} {0}
set_instance_parameter_value spi_dmac {CYCLIC} {0}
set_instance_parameter_value spi_dmac {DISABLE_DEBUG_REGISTERS} {0}
set_instance_parameter_value spi_dmac {DMA_2D_TRANSFER} {0}
set_instance_parameter_value spi_dmac {DMA_AXIS_DEST_W} {4}
set_instance_parameter_value spi_dmac {DMA_AXIS_ID_W} {8}
set_instance_parameter_value spi_dmac {DMA_AXI_PROTOCOL_DEST} {1}
set_instance_parameter_value spi_dmac {DMA_AXI_PROTOCOL_SRC} {1}
set_instance_parameter_value spi_dmac {DMA_DATA_WIDTH_DEST} {64}
set_instance_parameter_value spi_dmac {DMA_DATA_WIDTH_SRC} {16}
set_instance_parameter_value spi_dmac {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value spi_dmac {DMA_TYPE_DEST} {0}
set_instance_parameter_value spi_dmac {DMA_TYPE_SRC} {2}
set_instance_parameter_value spi_dmac {ENABLE_DIAGNOSTICS_IF} {0}
set_instance_parameter_value spi_dmac {FIFO_SIZE} {8}
set_instance_parameter_value spi_dmac {HAS_AXIS_TDEST} {0}
set_instance_parameter_value spi_dmac {HAS_AXIS_TID} {0}
set_instance_parameter_value spi_dmac {HAS_AXIS_TKEEP} {0}
set_instance_parameter_value spi_dmac {HAS_AXIS_TLAST} {0}
set_instance_parameter_value spi_dmac {HAS_AXIS_TSTRB} {0}
set_instance_parameter_value spi_dmac {HAS_AXIS_TUSER} {0}
set_instance_parameter_value spi_dmac {ID} {0}
set_instance_parameter_value spi_dmac {MAX_BYTES_PER_BURST} {128}
set_instance_parameter_value spi_dmac {SYNC_TRANSFER_START} {1}

add_connection axi_ad7606b.adc_data spi_dmac.if_fifo_wr_din
add_connection axi_ad7606b.adc_sync spi_dmac.if_fifo_wr_sync
add_connection axi_ad7606b.adc_valid spi_dmac.if_fifo_wr_en

add_connection spi_dmac.m_dest_axi sys_hps.f2h_sdram1_data
set_connection_parameter_value spi_dmac.m_dest_axi/sys_hps.f2h_sdram1_data arbitrationPriority {1}
set_connection_parameter_value spi_dmac.m_dest_axi/sys_hps.f2h_sdram1_data baseAddress {0x0000}
set_connection_parameter_value spi_dmac.m_dest_axi/sys_hps.f2h_sdram1_data defaultConnection {0}
add_connection sys_clk.clk_reset spi_dmac.m_dest_axi_reset
add_connection sys_clk.clk_reset spi_dmac.s_axi_reset
add_connection sys_hps.f2h_irq0 spi_dmac.interrupt_sender
set_connection_parameter_value sys_hps.f2h_irq0/spi_dmac.interrupt_sender irqNumber {5}
add_connection sys_hps.f2h_irq1 spi_dmac.interrupt_sender
set_connection_parameter_value sys_hps.f2h_irq1/spi_dmac.interrupt_sender irqNumber {5}

add_connection sys_hps.h2f_user1_clock spi_dmac.if_fifo_wr_clk
add_connection sys_hps.h2f_user1_clock spi_dmac.m_dest_axi_clock
add_connection sys_hps.h2f_user1_clock spi_dmac.s_axi_clock
add_connection sys_hps.h2f_lw_axi_master spi_dmac.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/spi_dmac.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/spi_dmac.s_axi baseAddress {0x00050000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/spi_dmac.s_axi defaultConnection {0}

