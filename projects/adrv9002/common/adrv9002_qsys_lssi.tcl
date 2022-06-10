
set_instance_parameter_value sys_hps {H2F_user1_CLK_Enable} {1}
set_instance_parameter_value sys_hps {H2F_user1_CLK_FREQ} {100}

# adc-spi
# adc-spi
if 0 {
add_instance spi_0 altera_avalon_spi
set_instance_parameter_value spi_0 {clockPhase} {0}
set_instance_parameter_value spi_0 {clockPolarity} {0}
set_instance_parameter_value spi_0 {dataWidth} {8}
set_instance_parameter_value spi_0 {disableAvalonFlowControl} {0}
set_instance_parameter_value spi_0 {insertDelayBetweenSlaveSelectAndSClk} {0}
set_instance_parameter_value spi_0 {insertSync} {0}
set_instance_parameter_value spi_0 {lsbOrderedFirst} {0}
set_instance_parameter_value spi_0 {masterSPI} {1}
set_instance_parameter_value spi_0 {numberOfSlaves} {1}
set_instance_parameter_value spi_0 {syncRegDepth} {2}
set_instance_parameter_value spi_0 {targetClockRate} {10000000.0}
set_instance_parameter_value spi_0 {targetSlaveSelectToSClkDelay} {0.0}

add_connection sys_clk.clk_reset spi_0.reset
add_connection sys_hps.h2f_user1_clock spi_0.clk

add_connection sys_hps.h2f_lw_axi_master spi_0.spi_control_port avalon
set_connection_parameter_value sys_hps.h2f_lw_axi_master/spi_0.spi_control_port arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/spi_0.spi_control_port baseAddress {0x00020060}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/spi_0.spi_control_port defaultConnection {0}

#add_connection sys_hps.f2h_irq0 spi_0.irq interrupt
#set_connection_parameter_value sys_hps.f2h_irq0 irqNumber {5}

add_interface spi_0_external conduit end
set_interface_property spi_0_external EXPORT_OF spi_0.external
}
# adrv9001

add_instance axi_adrv9001 axi_adrv9001
set_instance_parameter_value axi_adrv9001 {ID} {0}
set_instance_parameter_value axi_adrv9001 {CMOS_LVDS_N} {0}
add_interface adrv9001_if conduit end
set_interface_property adrv9001_if EXPORT_OF axi_adrv9001.device_if
add_interface adrv9001_tdd_if conduit end
set_interface_property adrv9001_tdd_if EXPORT_OF axi_adrv9001.tdd_if
add_connection sys_hps.h2f_user1_clock axi_adrv9001.s_axi_clock
add_connection sys_clk.clk_reset axi_adrv9001.s_axi_reset
add_interface sys_clk clock sink
set_interface_property sys_clk EXPORT_OF sys_clk.clk_in

# adc-wfifo

add_instance util_adc_wfifo util_wfifo
set_instance_parameter_value util_adc_wfifo {NUM_OF_CHANNELS} {4}
set_instance_parameter_value util_adc_wfifo {DIN_DATA_WIDTH} {16}
set_instance_parameter_value util_adc_wfifo {DOUT_DATA_WIDTH} {16}
set_instance_parameter_value util_adc_wfifo {DIN_ADDRESS_WIDTH} {5}
add_connection axi_adrv9001.if_adc_1_clk util_adc_wfifo.if_din_clk
add_connection axi_adrv9001.if_adc_1_rst util_adc_wfifo.if_din_rst
add_connection sys_hps.h2f_user1_clock util_adc_wfifo.if_dout_clk
add_connection sys_clk.clk_reset util_adc_wfifo.if_dout_rstn
add_connection axi_adrv9001.adc_1_ch_0 util_adc_wfifo.din_0
add_connection axi_adrv9001.adc_1_ch_1 util_adc_wfifo.din_1
add_connection axi_adrv9001.adc_1_ch_2 util_adc_wfifo.din_2
add_connection axi_adrv9001.adc_1_ch_3 util_adc_wfifo.din_3
add_connection util_adc_wfifo.if_din_ovf axi_adrv9001.if_adc_1_dovf

# dac-rfifo

ddr4_init

add_instance util_dac_rfifo util_rfifo
set_instance_parameter_value util_dac_rfifo {NUM_OF_CHANNELS} {4}
set_instance_parameter_value util_dac_rfifo {DIN_DATA_WIDTH} {16}
set_instance_parameter_value util_dac_rfifo {DOUT_DATA_WIDTH} {16}
set_instance_parameter_value util_dac_rfifo {DIN_ADDRESS_WIDTH} {5}
add_connection axi_adrv9001.if_dac_1_clk util_dac_rfifo.if_dout_clk
add_connection axi_adrv9001.if_dac_1_rst util_dac_rfifo.if_dout_rst
add_connection sys_hps.h2f_user1_clock util_dac_rfifo.if_din_clk
add_connection sys_clk.clk_reset util_dac_rfifo.if_din_rstn
add_connection util_dac_rfifo.dout_0 axi_adrv9001.dac_1_ch_0
add_connection util_dac_rfifo.dout_1 axi_adrv9001.dac_1_ch_1
add_connection util_dac_rfifo.dout_2 axi_adrv9001.dac_1_ch_2
add_connection util_dac_rfifo.dout_3 axi_adrv9001.dac_1_ch_3
add_connection util_dac_rfifo.if_dout_unf axi_adrv9001.if_dac_1_dunf

# adc-pack

add_instance util_adc_pack util_cpack2_1
set_instance_parameter_value util_adc_pack {NUM_OF_CHANNELS} {4}
set_instance_parameter_value util_adc_pack {SAMPLE_DATA_WIDTH} {16}
add_connection sys_hps.h2f_user1_clock util_adc_pack.clk
add_connection sys_clk.clk_reset util_adc_pack.reset
add_connection util_adc_wfifo.dout_0 util_adc_pack.adc_ch_0
add_connection util_adc_wfifo.dout_1 util_adc_pack.adc_ch_1
add_connection util_adc_wfifo.dout_2 util_adc_pack.adc_ch_2
add_connection util_adc_wfifo.dout_3 util_adc_pack.adc_ch_3
add_connection util_adc_pack.if_fifo_wr_overflow util_adc_wfifo.if_dout_ovf

# dac-unpack

add_instance util_dac_upack util_upack2
set_instance_parameter_value util_dac_upack {NUM_OF_CHANNELS} {4}
set_instance_parameter_value util_dac_upack {SAMPLE_DATA_WIDTH} {16}
add_connection sys_hps.h2f_user1_clock util_dac_upack.clk
add_connection sys_clk.clk_reset util_dac_upack.reset
add_connection util_dac_upack.dac_ch_0 util_dac_rfifo.din_0
add_connection util_dac_upack.dac_ch_1 util_dac_rfifo.din_1
add_connection util_dac_upack.dac_ch_2 util_dac_rfifo.din_2
add_connection util_dac_upack.dac_ch_3 util_dac_rfifo.din_3
add_connection util_dac_upack.if_fifo_rd_underflow util_dac_rfifo.if_din_unf

# adc-dma 

add_instance axi_adc_dma axi_dmac 1.0
set_instance_parameter_value axi_adc_dma {ASYNC_CLK_DEST_REQ_MANUAL} {1}
set_instance_parameter_value axi_adc_dma {ASYNC_CLK_REQ_SRC_MANUAL} {1}
set_instance_parameter_value axi_adc_dma {ASYNC_CLK_SRC_DEST_MANUAL} {1}
set_instance_parameter_value axi_adc_dma {AUTO_ASYNC_CLK} {1}
set_instance_parameter_value axi_adc_dma {AXI_SLICE_DEST} {0}
set_instance_parameter_value axi_adc_dma {AXI_SLICE_SRC} {0}
set_instance_parameter_value axi_adc_dma {CYCLIC} {1}
set_instance_parameter_value axi_adc_dma {DISABLE_DEBUG_REGISTERS} {0}
set_instance_parameter_value axi_adc_dma {DMA_2D_TRANSFER} {0}
set_instance_parameter_value axi_adc_dma {DMA_AXIS_DEST_W} {4}
set_instance_parameter_value axi_adc_dma {DMA_AXIS_ID_W} {8}
set_instance_parameter_value axi_adc_dma {DMA_AXI_PROTOCOL_DEST} {1}
set_instance_parameter_value axi_adc_dma {DMA_AXI_PROTOCOL_SRC} {1}
set_instance_parameter_value axi_adc_dma {DMA_DATA_WIDTH_DEST} {64}
set_instance_parameter_value axi_adc_dma {DMA_DATA_WIDTH_SRC} {64}
set_instance_parameter_value axi_adc_dma {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value axi_adc_dma {DMA_TYPE_DEST} {0}
set_instance_parameter_value axi_adc_dma {DMA_TYPE_SRC} {2}
set_instance_parameter_value axi_adc_dma {ENABLE_DIAGNOSTICS_IF} {0}
set_instance_parameter_value axi_adc_dma {FIFO_SIZE} {4}
set_instance_parameter_value axi_adc_dma {HAS_AXIS_TDEST} {0}
set_instance_parameter_value axi_adc_dma {HAS_AXIS_TID} {0}
set_instance_parameter_value axi_adc_dma {HAS_AXIS_TKEEP} {0}
set_instance_parameter_value axi_adc_dma {HAS_AXIS_TLAST} {0}
set_instance_parameter_value axi_adc_dma {HAS_AXIS_TSTRB} {0}
set_instance_parameter_value axi_adc_dma {HAS_AXIS_TUSER} {0}
set_instance_parameter_value axi_adc_dma {ID} {0}
set_instance_parameter_value axi_adc_dma {MAX_BYTES_PER_BURST} {128}
set_instance_parameter_value axi_adc_dma {SYNC_TRANSFER_START} {1}






if 0 {
#added adc_dma from quartus
add_instance axi_adc_dma axi_dmac
set_instance_parameter_value axi_adc_dma {ID} {0}
set_instance_parameter_value axi_adc_dma {DMA_DATA_WIDTH_SRC} {64}
set_instance_parameter_value axi_adc_dma {DMA_DATA_WIDTH_DEST} {64}
set_instance_parameter_value axi_adc_dma {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value axi_adc_dma {DMA_2D_TRANSFER} {0}
set_instance_parameter_value axi_adc_dma {AXI_SLICE_DEST} {0}
set_instance_parameter_value axi_adc_dma {AXI_SLICE_SRC} {0}
set_instance_parameter_value axi_adc_dma {SYNC_TRANSFER_START} {1}
set_instance_parameter_value axi_adc_dma {CYCLIC} {0}
set_instance_parameter_value axi_adc_dma {DMA_TYPE_DEST} {0}
set_instance_parameter_value axi_adc_dma {DMA_TYPE_SRC} {2}
set_instance_parameter_value axi_adc_dma {FIFO_SIZE} {4}
}

add_connection sys_hps.h2f_user1_clock axi_adc_dma.s_axi_clock
add_connection sys_clk.clk_reset axi_adc_dma.s_axi_reset
add_connection sys_hps.h2f_user1_clock axi_adc_dma.m_dest_axi_clock
add_connection sys_clk.clk_reset axi_adc_dma.m_dest_axi_reset
add_connection sys_hps.h2f_user1_clock axi_adc_dma.if_fifo_wr_clk
add_connection util_adc_pack.if_packed_fifo_wr_en axi_adc_dma.if_fifo_wr_en
add_connection util_adc_pack.if_packed_fifo_wr_sync axi_adc_dma.if_fifo_wr_sync
add_connection util_adc_pack.if_packed_fifo_wr_data axi_adc_dma.if_fifo_wr_din
add_connection axi_adc_dma.if_fifo_wr_overflow util_adc_pack.if_packed_fifo_wr_overflow

# dac-dma

add_instance axi_dac_dma axi_dmac 1.0
set_instance_parameter_value axi_dac_dma {ASYNC_CLK_DEST_REQ_MANUAL} {1}
set_instance_parameter_value axi_dac_dma {ASYNC_CLK_REQ_SRC_MANUAL} {1}
set_instance_parameter_value axi_dac_dma {ASYNC_CLK_SRC_DEST_MANUAL} {1}
set_instance_parameter_value axi_dac_dma {AUTO_ASYNC_CLK} {1}
set_instance_parameter_value axi_dac_dma {AXI_SLICE_DEST} {0}
set_instance_parameter_value axi_dac_dma {AXI_SLICE_SRC} {0}
set_instance_parameter_value axi_dac_dma {CYCLIC} {1}
set_instance_parameter_value axi_dac_dma {DISABLE_DEBUG_REGISTERS} {0}
set_instance_parameter_value axi_dac_dma {DMA_2D_TRANSFER} {0}
set_instance_parameter_value axi_dac_dma {DMA_AXIS_DEST_W} {4}
set_instance_parameter_value axi_dac_dma {DMA_AXIS_ID_W} {8}
set_instance_parameter_value axi_dac_dma {DMA_AXI_PROTOCOL_DEST} {1}
set_instance_parameter_value axi_dac_dma {DMA_AXI_PROTOCOL_SRC} {1}
set_instance_parameter_value axi_dac_dma {DMA_DATA_WIDTH_DEST} {64}
set_instance_parameter_value axi_dac_dma {DMA_DATA_WIDTH_SRC} {64}
set_instance_parameter_value axi_dac_dma {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value axi_dac_dma {DMA_TYPE_DEST} {1}
set_instance_parameter_value axi_dac_dma {DMA_TYPE_SRC} {0}
set_instance_parameter_value axi_dac_dma {ENABLE_DIAGNOSTICS_IF} {0}
set_instance_parameter_value axi_dac_dma {FIFO_SIZE} {4}
set_instance_parameter_value axi_dac_dma {HAS_AXIS_TDEST} {0}
set_instance_parameter_value axi_dac_dma {HAS_AXIS_TID} {0}
set_instance_parameter_value axi_dac_dma {HAS_AXIS_TKEEP} {0}
set_instance_parameter_value axi_dac_dma {HAS_AXIS_TLAST} {0}
set_instance_parameter_value axi_dac_dma {HAS_AXIS_TSTRB} {0}
set_instance_parameter_value axi_dac_dma {HAS_AXIS_TUSER} {0}
set_instance_parameter_value axi_dac_dma {ID} {0}
set_instance_parameter_value axi_dac_dma {MAX_BYTES_PER_BURST} {128}
set_instance_parameter_value axi_dac_dma {SYNC_TRANSFER_START} {0}








if 0 {

add_instance axi_dac_dma axi_dmac
set_instance_parameter_value axi_dac_dma {ID} {0}
set_instance_parameter_value axi_dac_dma {DMA_DATA_WIDTH_SRC} {64}
set_instance_parameter_value axi_dac_dma {DMA_DATA_WIDTH_DEST} {64}
set_instance_parameter_value axi_dac_dma {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value axi_dac_dma {DMA_2D_TRANSFER} {0}
set_instance_parameter_value axi_dac_dma {AXI_SLICE_DEST} {0}
set_instance_parameter_value axi_dac_dma {AXI_SLICE_SRC} {0}
set_instance_parameter_value axi_dac_dma {SYNC_TRANSFER_START} {0}
set_instance_parameter_value axi_dac_dma {CYCLIC} {1}
set_instance_parameter_value axi_dac_dma {DMA_TYPE_DEST} {1}
set_instance_parameter_value axi_dac_dma {DMA_TYPE_SRC} {0}
set_instance_parameter_value axi_dac_dma {FIFO_SIZE} {4}

}

add_connection sys_hps.h2f_user1_clock axi_dac_dma.s_axi_clock
add_connection sys_clk.clk_reset axi_dac_dma.s_axi_reset
add_connection sys_hps.h2f_user1_clock axi_dac_dma.m_src_axi_clock
add_connection sys_clk.clk_reset axi_dac_dma.m_src_axi_reset
add_connection sys_hps.h2f_user1_clock axi_dac_dma.if_m_axis_aclk

add_connection axi_dac_dma.m_axis util_dac_upack.s_axis

# adrv9001 gpio

add_instance avl_adrv9001_gpio altera_avalon_pio
set_instance_parameter_value avl_adrv9001_gpio {direction} {Bidir}
set_instance_parameter_value avl_adrv9001_gpio {generateIRQ} {1}
set_instance_parameter_value avl_adrv9001_gpio {width} {20}
add_connection sys_hps.h2f_user1_clock avl_adrv9001_gpio.clk
add_connection sys_clk.clk_reset avl_adrv9001_gpio.reset
add_interface adrv9001_gpio conduit end
set_interface_property adrv9001_gpio EXPORT_OF avl_adrv9001_gpio.external_connection

add_interface adrv9001_gpio conduit end
set_interface_property adrv9001_gpio EXPORT_OF avl_adrv9001_gpio.external_connection


add_connection sys_dma_clk.clk_reset avl_adrv9001_gpio.reset


#sys_gpio_bd

add_instance sys_gpio_bd altera_avalon_pio 20.1
set_instance_parameter_value sys_gpio_bd {bitClearingEdgeCapReg} {0}
set_instance_parameter_value sys_gpio_bd {bitModifyingOutReg} {0}
set_instance_parameter_value sys_gpio_bd {captureEdge} {0}
set_instance_parameter_value sys_gpio_bd {direction} {InOut}
set_instance_parameter_value sys_gpio_bd {edgeType} {RISING}
set_instance_parameter_value sys_gpio_bd {generateIRQ} {1}
set_instance_parameter_value sys_gpio_bd {irqType} {LEVEL}
set_instance_parameter_value sys_gpio_bd {resetValue} {0.0}
set_instance_parameter_value sys_gpio_bd {simDoTestBenchWiring} {0}
set_instance_parameter_value sys_gpio_bd {simDrivenValue} {0.0}
set_instance_parameter_value sys_gpio_bd {width} {32}


add_interface sys_gpio_bd conduit end
set_interface_property sys_gpio_bd EXPORT_OF sys_gpio_bd.external_connection

add_connection sys_clk.clk_reset sys_gpio_bd.reset



#add gpio_in
add_instance sys_gpio_in altera_avalon_pio 20.1
set_instance_parameter_value sys_gpio_in {bitClearingEdgeCapReg} {0}
set_instance_parameter_value sys_gpio_in {bitModifyingOutReg} {0}
set_instance_parameter_value sys_gpio_in {captureEdge} {0}
set_instance_parameter_value sys_gpio_in {direction} {Input}
set_instance_parameter_value sys_gpio_in {edgeType} {RISING}
set_instance_parameter_value sys_gpio_in {generateIRQ} {1}
set_instance_parameter_value sys_gpio_in {irqType} {LEVEL}
set_instance_parameter_value sys_gpio_in {resetValue} {0.0}
set_instance_parameter_value sys_gpio_in {simDoTestBenchWiring} {0}
set_instance_parameter_value sys_gpio_in {simDrivenValue} {0.0}
set_instance_parameter_value sys_gpio_in {width} {32}



add_interface sys_gpio_in conduit end
set_interface_property sys_gpio_in EXPORT_OF sys_gpio_in.external_connection

add_connection sys_clk.clk_reset sys_gpio_in.reset








#added gpio-out
add_instance sys_gpio_out altera_avalon_pio 20.1
set_instance_parameter_value sys_gpio_out {bitClearingEdgeCapReg} {0}
set_instance_parameter_value sys_gpio_out {bitModifyingOutReg} {0}
set_instance_parameter_value sys_gpio_out {captureEdge} {0}
set_instance_parameter_value sys_gpio_out {direction} {Output}
set_instance_parameter_value sys_gpio_out {edgeType} {RISING}
set_instance_parameter_value sys_gpio_out {generateIRQ} {0}
set_instance_parameter_value sys_gpio_out {irqType} {LEVEL}
set_instance_parameter_value sys_gpio_out {resetValue} {0.0}
set_instance_parameter_value sys_gpio_out {simDoTestBenchWiring} {0}
set_instance_parameter_value sys_gpio_out {simDrivenValue} {0.0}
set_instance_parameter_value sys_gpio_out {width} {32}

add_connection sys_hps.h2f_user1_clock sys_gpio_out.clk
add_connection sys_clk.clk_reset sys_gpio_out.reset

add_interface sys_gpio_out conduit end
set_interface_property sys_gpio_out EXPORT_OF sys_gpio_out.external_connection



##sys_spi added
add_instance sys_spi altera_avalon_spi 20.1
set_instance_parameter_value sys_spi {clockPhase} {0}
set_instance_parameter_value sys_spi {clockPolarity} {0}
set_instance_parameter_value sys_spi {dataWidth} {8}
set_instance_parameter_value sys_spi {disableAvalonFlowControl} {0}
set_instance_parameter_value sys_spi {insertDelayBetweenSlaveSelectAndSClk} {0}
set_instance_parameter_value sys_spi {insertSync} {0}
set_instance_parameter_value sys_spi {lsbOrderedFirst} {0}
set_instance_parameter_value sys_spi {masterSPI} {1}
set_instance_parameter_value sys_spi {numberOfSlaves} {1}
set_instance_parameter_value sys_spi {syncRegDepth} {2}
set_instance_parameter_value sys_spi {targetClockRate} {10000000.0}
set_instance_parameter_value sys_spi {targetSlaveSelectToSClkDelay} {0.0}

add_interface sys_spi conduit end
set_interface_property sys_spi EXPORT_OF sys_spi.external
add_connection sys_clk.clk_reset sys_spi.reset
add_connection sys_hps.h2f_user1_clock sys_spi.clk


# interrupts

#ad_cpu_interrupt 2 axi_adc_dma.interrupt_sender
#ad_cpu_interrupt 3 axi_dac_dma.interrupt_sender
#ad_cpu_interrupt 8 avl_adrv9001_gpio.irq

# cpu interconnects









add_connection sys_hps.h2f_lw_axi_master avl_adrv9001_gpio.s1
set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adrv9001_gpio.s1 arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adrv9001_gpio.s1 baseAddress {0x00041000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adrv9001_gpio.s1 defaultConnection {0}

add_connection sys_hps.h2f_lw_axi_master axi_adc_dma.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_adc_dma.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_adc_dma.s_axi baseAddress {0x0003c000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_adc_dma.s_axi defaultConnection {0}

add_connection sys_hps.h2f_lw_axi_master axi_adrv9001.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_adrv9001.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_adrv9001.s_axi baseAddress {0x00060000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_adrv9001.s_axi defaultConnection {0}

add_connection sys_hps.h2f_lw_axi_master axi_dac_dma.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_dac_dma.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_dac_dma.s_axi baseAddress {0x0002c000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_dac_dma.s_axi defaultConnection {0}

add_connection sys_hps.h2f_lw_axi_master sys_gpio_bd.s1
set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_bd.s1 arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_bd.s1 baseAddress {0x00d0}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_bd.s1 defaultConnection {0}

add_connection sys_hps.h2f_lw_axi_master sys_gpio_in.s1
set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_in.s1 arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_in.s1 baseAddress {0x0000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_in.s1 defaultConnection {0}

add_connection sys_hps.h2f_lw_axi_master sys_gpio_out.s1
set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_out.s1 arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_out.s1 baseAddress {0x0020}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_out.s1 defaultConnection {0}

add_connection sys_hps.h2f_lw_axi_master sys_spi.spi_control_port
set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_spi.spi_control_port arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_spi.spi_control_port baseAddress {0x0040}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_spi.spi_control_port defaultConnection {0}




add_connection sys_hps.h2f_user1_clock sys_gpio_bd.clk
add_connection sys_hps.h2f_user1_clock sys_gpio_in.clk





#add_connection sys_hps.h2f_lw_axi_master axi_adrv9001.s_axi

#add_connection sys_hps.h2f_lw_axi_master axi_adc_dma.s_axi
#add_connection sys_hps.h2f_lw_axi_master axi_dac_dma.s_axi
#add_connection sys_hps.h2f_lw_axi_master avl_adrv9001_gpio.s1

#ad_cpu_interconnect 0x00060000 axi_adrv9001.s_axi
#ad_cpu_interconnect 0x0003c000 axi_adc_dma.s_axi
#ad_cpu_interconnect 0x0002c000 axi_dac_dma.s_axi
#ad_cpu_interconnect 0x00041000 avl_adrv9001_gpio.s1



add_connection sys_hps.f2h_irq0 avl_adrv9001_gpio.irq
set_connection_parameter_value sys_hps.f2h_irq0/avl_adrv9001_gpio.irq irqNumber {8}

add_connection sys_hps.f2h_irq0 axi_adc_dma.interrupt_sender
set_connection_parameter_value sys_hps.f2h_irq0/axi_adc_dma.interrupt_sender irqNumber {2}

add_connection sys_hps.f2h_irq0 axi_dac_dma.interrupt_sender
set_connection_parameter_value sys_hps.f2h_irq0/axi_dac_dma.interrupt_sender irqNumber {3}

add_connection sys_hps.f2h_irq0 sys_gpio_bd.irq
set_connection_parameter_value sys_hps.f2h_irq0/sys_gpio_bd.irq irqNumber {6}

add_connection sys_hps.f2h_irq0 sys_gpio_in.irq
set_connection_parameter_value sys_hps.f2h_irq0/sys_gpio_in.irq irqNumber {5}

add_connection sys_hps.f2h_irq0 sys_spi.irq
set_connection_parameter_value sys_hps.f2h_irq0/sys_spi.irq irqNumber {7}

add_connection sys_hps.f2h_irq1 avl_adrv9001_gpio.irq
set_connection_parameter_value sys_hps.f2h_irq1/avl_adrv9001_gpio.irq irqNumber {8}

add_connection sys_hps.f2h_irq1 axi_adc_dma.interrupt_sender
set_connection_parameter_value sys_hps.f2h_irq1/axi_adc_dma.interrupt_sender irqNumber {2}

add_connection sys_hps.f2h_irq1 axi_dac_dma.interrupt_sender
set_connection_parameter_value sys_hps.f2h_irq1/axi_dac_dma.interrupt_sender irqNumber {3}





# interconnect requirements
#set_interconnect_requirement {$system} {qsys_mm.burstAdapterImplementation} {PER_BURST_TYPE_CONVERTER}
#set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {AUTO}
#set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {4}


# mem interconnects

add_connection axi_adc_dma.m_dest_axi sys_hps.f2sdram0_data
set_connection_parameter_value axi_adc_dma.m_dest_axi/sys_hps.f2sdram0_data baseAddress {0x0000}

add_connection axi_dac_dma.m_src_axi sys_hps.f2sdram0_data
set_connection_parameter_value axi_dac_dma.m_src_axi/sys_hps.f2sdram0_data baseAddress {0x0000}

