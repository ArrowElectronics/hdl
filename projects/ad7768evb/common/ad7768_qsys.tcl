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

# adc-clock-bridge

add_instance adc_clock_bridge altera_clock_bridge
set_instance_parameter_value adc_clock_bridge {EXPLICIT_CLOCK_RATE} {0.0}
set_instance_parameter_value adc_clock_bridge {NUM_CLOCK_OUTPUTS} {1}

add_interface adc_clk clock sink
set_interface_property adc_clk EXPORT_OF adc_clock_bridge.in_clk

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
set_instance_parameter_value ad7768_dma {DMA_DATA_WIDTH_SRC} {256}
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
set_instance_parameter_value ad7768_dma {SYNC_TRANSFER_START} {1}
	

add_connection sys_hps.h2f_user1_clock ad7768_dma.s_axi_clock
add_connection sys_clk.clk_reset ad7768_dma.s_axi_reset
	
add_connection sys_hps.h2f_lw_axi_master ad7768_dma.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad7768_dma.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad7768_dma.s_axi baseAddress {0x30000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad7768_dma.s_axi defaultConnection {0}

add_connection sys_hps.f2h_irq0 ad7768_dma.interrupt_sender interrupt
set_connection_parameter_value sys_hps.f2h_irq0/ad7768_dma.interrupt_sender irqNumber {6}

add_connection sys_hps.h2f_user1_clock ad7768_dma.m_dest_axi_clock
add_connection sys_clk.clk_reset ad7768_dma.m_dest_axi_reset

add_connection adc_clock_bridge.out_clk ad7768_dma.if_fifo_wr_clk
	
add_interface adc_valid conduit end
set_interface_property adc_valid EXPORT_OF ad7768_dma.if_fifo_wr_en

add_interface adc_din conduit end
set_interface_property adc_din EXPORT_OF ad7768_dma.if_fifo_wr_din

add_interface adc_sync conduit end
set_interface_property adc_sync EXPORT_OF ad7768_dma.if_fifo_wr_sync

add_connection ad7768_dma.m_dest_axi sys_hps.f2h_sdram1_data
set_connection_parameter_value ad7768_dma.m_dest_axi/sys_hps.f2h_sdram1_data arbitrationPriority {1}
set_connection_parameter_value ad7768_dma.m_dest_axi/sys_hps.f2h_sdram1_data baseAddress {0x0000}
set_connection_parameter_value ad7768_dma.m_dest_axi/sys_hps.f2h_sdram1_data defaultConnection {0}

# adc-pack

add_instance util_ad7768_adc_pack util_cpack2 1.0
set_instance_parameter_value util_ad7768_adc_pack {NUM_OF_CHANNELS} {8}
set_instance_parameter_value util_ad7768_adc_pack {SAMPLES_PER_CHANNEL} {1}
set_instance_parameter_value util_ad7768_adc_pack {SAMPLE_DATA_WIDTH} {32}

add_connection adc_clock_bridge.out_clk util_ad7768_adc_pack.clk
add_connection sys_clk.clk_reset util_ad7768_adc_pack.reset

add_interface adc_valid_pp conduit end
set_interface_property adc_valid_pp EXPORT_OF util_ad7768_adc_pack.fifo_wr_en

add_interface util_ad7768_adc_pack_adc_ch_0 conduit end
set_interface_property adc_data_0 EXPORT_OF util_ad7768_adc_pack.adc_ch_0
add_interface util_ad7768_adc_pack_adc_ch_1 conduit end
set_interface_property adc_data_1 EXPORT_OF util_ad7768_adc_pack.adc_ch_1
add_interface util_ad7768_adc_pack_adc_ch_2 conduit end
set_interface_property adc_data_2 EXPORT_OF util_ad7768_adc_pack.adc_ch_2
add_interface util_ad7768_adc_pack_adc_ch_3 conduit end
set_interface_property adc_data_3 EXPORT_OF util_ad7768_adc_pack.adc_ch_3
add_interface util_ad7768_adc_pack_adc_ch_4 conduit end
set_interface_property adc_data_4 EXPORT_OF util_ad7768_adc_pack.adc_ch_4
add_interface util_ad7768_adc_pack_adc_ch_5 conduit end
set_interface_property adc_data_5 EXPORT_OF util_ad7768_adc_pack.adc_ch_5
add_interface util_ad7768_adc_pack_adc_ch_6 conduit end
set_interface_property adc_data_6 EXPORT_OF util_ad7768_adc_pack.adc_ch_6
add_interface util_ad7768_adc_pack_adc_ch_7 conduit end
set_interface_property adc_data_7 EXPORT_OF util_ad7768_adc_pack.adc_ch_7

# adc-dma 2

add_instance ad7768_dma_2 axi_dmac 1.0
set_instance_parameter_value ad7768_dma_2 {ASYNC_CLK_DEST_REQ_MANUAL} {1}
set_instance_parameter_value ad7768_dma_2 {ASYNC_CLK_REQ_SRC_MANUAL} {1}
set_instance_parameter_value ad7768_dma_2 {ASYNC_CLK_SRC_DEST_MANUAL} {1}
set_instance_parameter_value ad7768_dma_2 {AUTO_ASYNC_CLK} {1}
set_instance_parameter_value ad7768_dma_2 {AXI_SLICE_DEST} {0}
set_instance_parameter_value ad7768_dma_2 {AXI_SLICE_SRC} {0}
set_instance_parameter_value ad7768_dma_2 {CYCLIC} {0}
set_instance_parameter_value ad7768_dma_2 {DISABLE_DEBUG_REGISTERS} {0}
set_instance_parameter_value ad7768_dma_2 {DMA_2D_TRANSFER} {0}
set_instance_parameter_value ad7768_dma_2 {DMA_AXIS_DEST_W} {4}
set_instance_parameter_value ad7768_dma_2 {DMA_AXIS_ID_W} {8}
set_instance_parameter_value ad7768_dma_2 {DMA_AXI_PROTOCOL_DEST} {1}
set_instance_parameter_value ad7768_dma_2 {DMA_AXI_PROTOCOL_SRC} {1}
set_instance_parameter_value ad7768_dma_2 {DMA_DATA_WIDTH_DEST} {64}
set_instance_parameter_value ad7768_dma_2 {DMA_DATA_WIDTH_SRC} {256}
set_instance_parameter_value ad7768_dma_2 {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value ad7768_dma_2 {DMA_TYPE_DEST} {0}
set_instance_parameter_value ad7768_dma_2 {DMA_TYPE_SRC} {2}
set_instance_parameter_value ad7768_dma_2 {ENABLE_DIAGNOSTICS_IF} {0}
set_instance_parameter_value ad7768_dma_2 {FIFO_SIZE} {8}
set_instance_parameter_value ad7768_dma_2 {HAS_AXIS_TDEST} {0}
set_instance_parameter_value ad7768_dma_2 {HAS_AXIS_TID} {0}
set_instance_parameter_value ad7768_dma_2 {HAS_AXIS_TKEEP} {0}
set_instance_parameter_value ad7768_dma_2 {HAS_AXIS_TLAST} {0}
set_instance_parameter_value ad7768_dma_2 {HAS_AXIS_TSTRB} {0}
set_instance_parameter_value ad7768_dma_2 {HAS_AXIS_TUSER} {0}
set_instance_parameter_value ad7768_dma_2 {ID} {0}
set_instance_parameter_value ad7768_dma_2 {MAX_BYTES_PER_BURST} {128}
set_instance_parameter_value ad7768_dma_2 {SYNC_TRANSFER_START} {1}
	
add_connection sys_hps.h2f_user1_clock ad7768_dma_2.s_axi_clock
add_connection sys_clk.clk_reset ad7768_dma_2.s_axi_reset
	
add_connection sys_hps.h2f_lw_axi_master ad7768_dma_2.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad7768_dma_2.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad7768_dma_2.s_axi baseAddress {0x38000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad7768_dma_2.s_axi defaultConnection {0}

add_connection sys_hps.f2h_irq0 ad7768_dma_2.interrupt_sender interrupt
set_connection_parameter_value sys_hps.f2h_irq0/ad7768_dma_2.interrupt_sender irqNumber {7}

add_connection sys_hps.h2f_user1_clock ad7768_dma_2.m_dest_axi_clock
add_connection sys_clk.clk_reset ad7768_dma_2.m_dest_axi_reset

add_connection adc_clock_bridge.out_clk ad7768_dma_2.if_fifo_wr_clk

add_connection ad7768_dma_2.m_dest_axi sys_hps.f2h_sdram1_data
set_connection_parameter_value ad7768_dma_2.m_dest_axi/sys_hps.f2h_sdram1_data arbitrationPriority {1}
set_connection_parameter_value ad7768_dma_2.m_dest_axi/sys_hps.f2h_sdram1_data baseAddress {0x0000}
set_connection_parameter_value ad7768_dma_2.m_dest_axi/sys_hps.f2h_sdram1_data defaultConnection {0}

add_connection ad7768_dma_2.if_fifo_wr_din util_ad7768_adc_pack.if_packed_fifo_wr_data
add_connection ad7768_dma_2.if_fifo_wr_en util_ad7768_adc_pack.if_packed_fifo_wr_en
add_connection ad7768_dma_2.if_fifo_wr_overflow util_ad7768_adc_pack.if_packed_fifo_wr_overflow
add_connection ad7768_dma_2.if_fifo_wr_sync util_ad7768_adc_pack.if_packed_fifo_wr_sync

# axi-generic-adc

add_instance axi_ad7768_adc axi_generic_adc

set_instance_parameter_value axi_ad7768_adc {NUM_OF_CHANNELS} {8}

add_connection sys_hps.h2f_user1_clock axi_ad7768_adc.s_axi_aclk
add_connection sys_clk.clk_reset axi_ad7768_adc.s_axi_aresetn

add_connection sys_hps.h2f_lw_axi_master axi_ad7768_adc.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad7768_adc.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad7768_adc.s_axi baseAddress {0x40000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad7768_adc.s_axi defaultConnection {0}

add_connection adc_clock_bridge.out_clk axi_ad7768_adc.adc_clk

add_connection axi_ad7768_adc.enable util_ad7768_adc_pack.enable
add_connection axi_ad7768_adc.if_adc_dovf util_ad7768_adc_pack.if_fifo_wr_overflow












