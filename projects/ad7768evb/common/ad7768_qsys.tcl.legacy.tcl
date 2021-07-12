# adc_gpio_0

add_instance adc_gpio_0 altera_avalon_pio
set_instance_parameter_value adc_gpio_0 {direction} {InOut}
set_instance_parameter_value adc_gpio_0 {edgeType} {RISING}
set_instance_parameter_value adc_gpio_0 {generateIRQ} {1}
set_instance_parameter_value adc_gpio_0 {irqType} {LEVEL}
set_instance_parameter_value adc_gpio_0 {width} {32}

add_connection sys_clk.clk_reset adc_gpio_0.reset
add_connection sys_hps.h2f_user1_clock adc_gpio_0.clk
add_interface adc_gpio_0 conduit end
set_interface_property adc_gpio_0 EXPORT_OF adc_gpio_0.external_connection

add_connection sys_hps.f2h_irq0 adc_gpio_0.irq interrupt
set_connection_parameter_value sys_hps.f2h_irq0/adc_gpio_0.irq irqNumber {2}

ad_cpu_interconnect 0x00020030 adc_gpio_0.s1

# adc_gpio_1

add_instance adc_gpio_1 altera_avalon_pio
set_instance_parameter_value adc_gpio_1 {direction} {InOut}
set_instance_parameter_value adc_gpio_1 {edgeType} {RISING}
set_instance_parameter_value adc_gpio_1 {generateIRQ} {1}
set_instance_parameter_value adc_gpio_1 {irqType} {LEVEL}
set_instance_parameter_value adc_gpio_1 {width} {32}

add_connection sys_clk.clk_reset adc_gpio_1.reset
add_connection sys_hps.h2f_user1_clock adc_gpio_1.clk
add_interface adc_gpio_1 conduit end
set_interface_property adc_gpio_1 EXPORT_OF adc_gpio_1.external_connection

add_connection sys_hps.f2h_irq0 adc_gpio_1.irq interrupt
set_connection_parameter_value sys_hps.f2h_irq0/adc_gpio_1.irq irqNumber {3}

ad_cpu_interconnect 0x00020040 adc_gpio_1.s1

# ad7768_gpio

add_instance ad7768_gpio altera_avalon_pio
set_instance_parameter_value ad7768_gpio {direction} {Bidir}
set_instance_parameter_value ad7768_gpio {edgeType} {RISING}
set_instance_parameter_value ad7768_gpio {generateIRQ} {0}
set_instance_parameter_value ad7768_gpio {irqType} {LEVEL}
set_instance_parameter_value ad7768_gpio {width} {32}

add_connection sys_clk.clk_reset ad7768_gpio.reset
add_connection sys_hps.h2f_user1_clock ad7768_gpio.clk
add_interface ad7768_gpio conduit end
set_interface_property ad7768_gpio EXPORT_OF ad7768_gpio.external_connection

ad_cpu_interconnect 0x00020050 ad7768_gpio.s1

# adc-spi

add_instance spi_0 altera_avalon_spi
set_instance_parameter_value spi_0 {clockPhase} {0}
set_instance_parameter_value spi_0 {clockPolarity} {0}
set_instance_parameter_value spi_0 {dataWidth} {16}
set_instance_parameter_value spi_0 {disableAvalonFlowControl} {0}
set_instance_parameter_value spi_0 {insertDelayBetweenSlaveSelectAndSClk} {0}
set_instance_parameter_value spi_0 {insertSync} {0}
set_instance_parameter_value spi_0 {lsbOrderedFirst} {0}
set_instance_parameter_value spi_0 {masterSPI} {1}
set_instance_parameter_value spi_0 {numberOfSlaves} {1}
set_instance_parameter_value spi_0 {syncRegDepth} {2}
set_instance_parameter_value spi_0 {targetClockRate} {1000000.0}
set_instance_parameter_value spi_0 {targetSlaveSelectToSClkDelay} {0.0}

add_connection sys_clk.clk_reset spi_0.reset
add_connection sys_hps.h2f_user1_clock spi_0.clk

add_connection sys_hps.h2f_lw_axi_master spi_0.spi_control_port avalon
set_connection_parameter_value sys_hps.h2f_lw_axi_master/spi_0.spi_control_port arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/spi_0.spi_control_port baseAddress {0x00020060}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/spi_0.spi_control_port defaultConnection {0}

add_connection sys_hps.f2h_irq0 spi_0.irq interrupt
set_connection_parameter_value sys_hps.f2h_irq0/spi_0.irq irqNumber {5}

add_interface spi_0_external conduit end
set_interface_property spi_0_external EXPORT_OF spi_0.external

# adc-dma

add_instance ad7768_dma axi_dmac 1.0
set_instance_parameter_value ad7768_dma {ASYNC_CLK_DEST_REQ_MANUAL} {1}
set_instance_parameter_value ad7768_dma {ASYNC_CLK_REQ_SRC_MANUAL} {1}
set_instance_parameter_value ad7768_dma {ASYNC_CLK_SRC_DEST_MANUAL} {1}
set_instance_parameter_value ad7768_dma {AUTO_ASYNC_CLK} {1}
set_instance_parameter_value ad7768_dma {AXI_SLICE_DEST} {0}
set_instance_parameter_value ad7768_dma {AXI_SLICE_SRC} {0}
set_instance_parameter_value ad7768_dma {CYCLIC} {0}
set_instance_parameter_value ad7768_dma {DISABLE_DEBUG_REGISTERS} {0}
set_instance_parameter_value ad7768_dma {DMA_2D_TRANSFER} {0}
set_instance_parameter_value ad7768_dma {DMA_AXIS_DEST_W} {4}
set_instance_parameter_value ad7768_dma {DMA_AXIS_ID_W} {8}
set_instance_parameter_value ad7768_dma {DMA_AXI_PROTOCOL_DEST} {1}
set_instance_parameter_value ad7768_dma {DMA_AXI_PROTOCOL_SRC} {1}
set_instance_parameter_value ad7768_dma {DMA_DATA_WIDTH_DEST} {64}
set_instance_parameter_value ad7768_dma {DMA_DATA_WIDTH_SRC} {32}
set_instance_parameter_value ad7768_dma {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value ad7768_dma {DMA_TYPE_DEST} {0}
set_instance_parameter_value ad7768_dma {DMA_TYPE_SRC} {2}
set_instance_parameter_value ad7768_dma {ENABLE_DIAGNOSTICS_IF} {0}
set_instance_parameter_value ad7768_dma {FIFO_SIZE} {8}
set_instance_parameter_value ad7768_dma {HAS_AXIS_TDEST} {0}
set_instance_parameter_value ad7768_dma {HAS_AXIS_TID} {0}
set_instance_parameter_value ad7768_dma {HAS_AXIS_TKEEP} {0}
set_instance_parameter_value ad7768_dma {HAS_AXIS_TLAST} {0}
set_instance_parameter_value ad7768_dma {HAS_AXIS_TSTRB} {0}
set_instance_parameter_value ad7768_dma {HAS_AXIS_TUSER} {0}
set_instance_parameter_value ad7768_dma {ID} {0}
set_instance_parameter_value ad7768_dma {MAX_BYTES_PER_BURST} {128}
set_instance_parameter_value ad7768_dma {SYNC_TRANSFER_START} {0}
	
add_connection sys_hps.h2f_user1_clock ad7768_dma.m_dest_axi_clock
add_connection sys_hps.h2f_user1_clock ad7768_dma.s_axi_clock

add_connection sys_clk.clk_reset ad7768_dma.m_dest_axi_reset
add_connection sys_clk.clk_reset ad7768_dma.s_axi_reset

add_connection ad7768_dma.m_dest_axi sys_hps.f2h_sdram1_data
set_connection_parameter_value ad7768_dma.m_dest_axi/sys_hps.f2h_sdram1_data arbitrationPriority {1}
set_connection_parameter_value ad7768_dma.m_dest_axi/sys_hps.f2h_sdram1_data baseAddress {0x0000}
set_connection_parameter_value ad7768_dma.m_dest_axi/sys_hps.f2h_sdram1_data defaultConnection {0}

add_connection sys_hps.f2h_irq0 ad7768_dma.interrupt_sender interrupt
set_connection_parameter_value sys_hps.f2h_irq0/ad7768_dma.interrupt_sender irqNumber {6}
	
add_connection sys_hps.h2f_lw_axi_master ad7768_dma.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad7768_dma.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad7768_dma.s_axi baseAddress {0x30000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad7768_dma.s_axi defaultConnection {0}

add_interface adc_clk clock sink
set_interface_property adc_clk EXPORT_OF ad7768_dma.if_fifo_wr_clk

add_interface adc_din conduit end
set_interface_property adc_din EXPORT_OF ad7768_dma.if_fifo_wr_din
	
add_interface adc_valid conduit end
set_interface_property adc_valid EXPORT_OF ad7768_dma.if_fifo_wr_en










