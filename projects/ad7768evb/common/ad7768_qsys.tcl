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
set_connection_parameter_value sys_hps.f2h_irq0/ad7768_dma.interrupt_sender irqNumber {0}
	
add_connection sys_hps.h2f_lw_axi_master ad7768_dma.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad7768_dma.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad7768_dma.s_axi baseAddress {0x0000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad7768_dma.s_axi defaultConnection {0}

add_interface adc_clk clock sink
set_interface_property adc_clk EXPORT_OF ad7768_dma.if_fifo_wr_clk

add_interface adc_din conduit end
set_interface_property adc_din EXPORT_OF ad7768_dma.if_fifo_wr_din
	
add_interface adc_valid conduit end
set_interface_property adc_valid EXPORT_OF ad7768_dma.if_fifo_wr_en

# gpio_i

add_instance gpio_i altera_avalon_pio
set_instance_parameter_value gpio_i {direction} {Input}
set_instance_parameter_value gpio_i {edgeType} {RISING}
set_instance_parameter_value gpio_i {generateIRQ} {1}
set_instance_parameter_value gpio_i {irqType} {LEVEL}
set_instance_parameter_value gpio_i {width} {32}

add_connection sys_clk.clk_reset gpio_i.reset
add_connection sys_hps.h2f_user1_clock gpio_i.clk
add_interface gpio_i conduit end
set_interface_property gpio_i EXPORT_OF gpio_i.external_connection

add_connection sys_hps.f2h_irq0 gpio_i.irq interrupt
set_connection_parameter_value sys_hps.f2h_irq0/gpio_i.irq irqNumber {1}

ad_cpu_interconnect 0x00020000 gpio_i.s1

# gpio_o

add_instance gpio_o altera_avalon_pio
set_instance_parameter_value gpio_o {direction} {Output}
set_instance_parameter_value gpio_o {generateIRQ} {0}
set_instance_parameter_value gpio_o {width} {32}

add_connection sys_clk.clk_reset gpio_o.reset
add_connection sys_hps.h2f_user1_clock gpio_o.clk
add_interface gpio_o conduit end
set_interface_property gpio_o EXPORT_OF gpio_o.external_connection

ad_cpu_interconnect 0x00020010 gpio_o.s1


# adc_gpio_0_i

add_instance adc_gpio_0_i altera_avalon_pio
set_instance_parameter_value adc_gpio_0_i {direction} {Input}
set_instance_parameter_value adc_gpio_0_i {edgeType} {RISING}
set_instance_parameter_value adc_gpio_0_i {generateIRQ} {1}
set_instance_parameter_value adc_gpio_0_i {irqType} {LEVEL}
set_instance_parameter_value adc_gpio_0_i {width} {32}

add_connection sys_clk.clk_reset adc_gpio_0_i.reset
add_connection sys_hps.h2f_user1_clock adc_gpio_0_i.clk
add_interface adc_gpio_0_i conduit end
set_interface_property adc_gpio_0_i EXPORT_OF adc_gpio_0_i.external_connection

add_connection sys_hps.f2h_irq0 adc_gpio_0_i.irq interrupt
set_connection_parameter_value sys_hps.f2h_irq0/adc_gpio_0_i.irq irqNumber {2}

ad_cpu_interconnect 0x00020020 adc_gpio_0_i.s1

# adc_gpio_0_o

add_instance adc_gpio_0_o altera_avalon_pio
set_instance_parameter_value adc_gpio_0_o {direction} {Output}
set_instance_parameter_value adc_gpio_0_o {generateIRQ} {0}
set_instance_parameter_value adc_gpio_0_o {width} {32}

add_connection sys_clk.clk_reset adc_gpio_0_o.reset
add_connection sys_hps.h2f_user1_clock adc_gpio_0_o.clk
add_interface adc_gpio_0_o conduit end
set_interface_property adc_gpio_0_o EXPORT_OF adc_gpio_0_o.external_connection

ad_cpu_interconnect 0x00020030 adc_gpio_0_o.s1

# adc_gpio_1_i

add_instance adc_gpio_1_i altera_avalon_pio
set_instance_parameter_value adc_gpio_1_i {direction} {Input}
set_instance_parameter_value adc_gpio_1_i {edgeType} {RISING}
set_instance_parameter_value adc_gpio_1_i {generateIRQ} {1}
set_instance_parameter_value adc_gpio_1_i {irqType} {LEVEL}
set_instance_parameter_value adc_gpio_1_i {width} {32}

add_connection sys_clk.clk_reset adc_gpio_1_i.reset
add_connection sys_hps.h2f_user1_clock adc_gpio_1_i.clk
add_interface adc_gpio_1_i conduit end
set_interface_property adc_gpio_1_i EXPORT_OF adc_gpio_1_i.external_connection

add_connection sys_hps.f2h_irq0 adc_gpio_1_i.irq interrupt
set_connection_parameter_value sys_hps.f2h_irq0/adc_gpio_1_i.irq irqNumber {3}

ad_cpu_interconnect 0x00020040 adc_gpio_1_i.s1

# adc_gpio_1_o

add_instance adc_gpio_1_o altera_avalon_pio
set_instance_parameter_value adc_gpio_1_o {direction} {Output}
set_instance_parameter_value adc_gpio_1_o {generateIRQ} {0}
set_instance_parameter_value adc_gpio_1_o {width} {32}

add_connection sys_clk.clk_reset adc_gpio_1_o.reset
add_connection sys_hps.h2f_user1_clock adc_gpio_1_o.clk
add_interface adc_gpio_1_o conduit end
set_interface_property adc_gpio_1_o EXPORT_OF adc_gpio_1_o.external_connection

ad_cpu_interconnect 0x00020050 adc_gpio_1_o.s1

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










