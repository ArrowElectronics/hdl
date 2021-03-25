 
# spi engine pll

add_instance spi_engine_pll altera_pll
set_instance_parameter_value spi_engine_pll {gui_device_speed_grade} {6}
set_instance_parameter_value spi_engine_pll {gui_reference_clock_frequency} {100.0}
set_instance_parameter_value spi_engine_pll {gui_use_locked} {1}
set_instance_parameter_value spi_engine_pll {gui_number_of_clocks} {2}
set_instance_parameter_value spi_engine_pll {gui_output_clock_frequency0} {166.667}
set_instance_parameter_value spi_engine_pll {gui_output_clock_frequency1} {16.34}
set_interface_property spi_engine_pll_outclk1 EXPORT_OF spi_engine_pll.outclk1 

#clock bridge for outclock0
add_instance spi_engine_clk altera_clock_bridge
add_connection spi_engine_pll.outclk0 spi_engine_clk.in_clk
set_interface_property SPI_engine_clk_clk EXPORT_OF spi_engine_clk.out_clk

add_connection sys_hps.h2f_user1_clock spi_engine_pll.refclk
add_connection sys_clk.clk_reset spi_engine_pll.reset

# spi engine execution

add_instance spi_engine_execution_0 spi_engine_execution_v1_0 1.0
set_instance_parameter_value spi_engine_execution_0 {DATA_WIDTH} {32}
set_instance_parameter_value spi_engine_execution_0 {DEFAULT_CLK_DIV} {0}
set_instance_parameter_value spi_engine_execution_0 {DEFAULT_SPI_CFG} {0}
set_instance_parameter_value spi_engine_execution_0 {NUM_OF_CS} {1}
set_instance_parameter_value spi_engine_execution_0 {NUM_OF_SDI} {1}
set_instance_parameter_value spi_engine_execution_0 {SDI_DELAY} {1}
set_instance_parameter_value spi_engine_execution_0 {SDO_DEFAULT} {1}
add_connection spi_engine_pll.outclk0 spi_engine_execution_0.clk
add_interface spi_engine_execution_0_spi conduit end
set_interface_property spi_engine_execution_0_spi_out EXPORT_OF spi_engine_execution_0.spi

# interconnect

add_instance spi_engine_interconnect_0 spi_engine_interconnect_v1_0 1.0
set_instance_parameter_value spi_engine_interconnect_0 {DATA_WIDTH} {32}
set_instance_parameter_value spi_engine_interconnect_0 {NUM_OF_SDI} {1}
add_connection spi_engine_pll.outclk0 spi_engine_interconnect_0.clk
add_connection spi_engine_interconnect_0.m_ctrl spi_engine_execution_0.ctrl 

# engine offload

add_instance spi_engine_offload_0 spi_engine_offload_v1_0 1.0
set_instance_parameter_value spi_engine_offload_0 {ASYNC_SPI_CLK} {1}
set_instance_parameter_value spi_engine_offload_0 {ASYNC_TRIG} {1}
set_instance_parameter_value spi_engine_offload_0 {CMD_MEM_ADDRESS_WIDTH} {4}
set_instance_parameter_value spi_engine_offload_0 {DATA_WIDTH} {32}
set_instance_parameter_value spi_engine_offload_0 {NUM_OF_SDI} {1}
set_instance_parameter_value spi_engine_offload_0 {SDO_MEM_ADDRESS_WIDTH} {4}
add_connection spi_engine_offload_0.spi_engine_ctrl spi_engine_interconnect_0.s0_ctrl 
add_connection spi_engine_pll.outclk0 spi_engine_offload_0.ctrl_clk
add_connection spi_engine_pll.outclk0 spi_engine_offload_0.spi_clk
add_interface spi_engine_offload_0_trigger conduit end
set_interface_property spi_engine_offload_0_trigger  EXPORT_OF spi_engine_offload_0.trigger
set_interface_property spi_engine_offload_0_offload_sdi  EXPORT_OF spi_engine_offload_0.offload_sdi

# spi engine

add_instance axi_spi_engine_0 axi_spi_engine_v1_0 1.1
set_instance_parameter_value axi_spi_engine_0 {ASYNC_SPI_CLK} {1}
set_instance_parameter_value axi_spi_engine_0 {CMD_FIFO_ADDRESS_WIDTH} {4}
set_instance_parameter_value axi_spi_engine_0 {DATA_WIDTH} {32}
set_instance_parameter_value axi_spi_engine_0 {ID} {0}
set_instance_parameter_value axi_spi_engine_0 {MM_IF_TYPE} {0}
set_instance_parameter_value axi_spi_engine_0 {NUM_OFFLOAD} {1}
set_instance_parameter_value axi_spi_engine_0 {NUM_OF_SDI} {1}
set_instance_parameter_value axi_spi_engine_0 {OFFLOAD0_CMD_MEM_ADDRESS_WIDTH} {4}
set_instance_parameter_value axi_spi_engine_0 {OFFLOAD0_SDO_MEM_ADDRESS_WIDTH} {4}
set_instance_parameter_value axi_spi_engine_0 {SDI_FIFO_ADDRESS_WIDTH} {5}
set_instance_parameter_value axi_spi_engine_0 {SDO_FIFO_ADDRESS_WIDTH} {5}
set_instance_parameter_value axi_spi_engine_0 {SYNC_FIFO_ADDRESS_WIDTH} {4}
add_connection sys_hps.h2f_user1_clock axi_spi_engine_0.s_axi_aclk
add_connection spi_engine_pll.outclk0 axi_spi_engine_0.spi_clk
add_connection sys_clk.clk_reset axi_spi_engine_0.s_axi_aresetn
add_connection axi_spi_engine_0.spi_engine_ctrl spi_engine_interconnect_0.s1_ctrl 
add_connection sys_hps.h2f_lw_axi_master axi_spi_engine_0.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_spi_engine_0.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_spi_engine_0.s_axi baseAddress {0x0040000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_spi_engine_0.s_axi defaultConnection {0}
add_connection axi_spi_engine_0.spi_engine_offload_ctrl0 spi_engine_offload_0.spi_engine_offload_ctrl
add_connection sys_hps.f2h_irq0 axi_spi_engine_0.irq
set_connection_parameter_value sys_hps.f2h_irq0/axi_spi_engine_0.irq irqNumber {6}
add_connection axi_spi_engine_0.spi_resetn spi_engine_offload_0.spi_resetn
add_connection axi_spi_engine_0.spi_resetn spi_engine_execution_0.resetn
add_connection axi_spi_engine_0.spi_resetn spi_engine_interconnect_0.resetn
set_interface_property axi_spi_engine_0_spi_resetn EXPORT_OF axi_spi_engine_0.spi_resetn


# adc-dma

add_instance spi_dmac_0 axi_dmac 1.0
set_instance_parameter_value spi_dmac_0 {ASYNC_CLK_DEST_REQ_MANUAL} {1}
set_instance_parameter_value spi_dmac_0 {ASYNC_CLK_REQ_SRC_MANUAL} {1}
set_instance_parameter_value spi_dmac_0 {ASYNC_CLK_SRC_DEST_MANUAL} {1}
set_instance_parameter_value spi_dmac_0 {AUTO_ASYNC_CLK} {1}
set_instance_parameter_value spi_dmac_0 {AXI_SLICE_DEST} {1}
set_instance_parameter_value spi_dmac_0 {AXI_SLICE_SRC} {0}
set_instance_parameter_value spi_dmac_0 {CYCLIC} {0}
set_instance_parameter_value spi_dmac_0 {DISABLE_DEBUG_REGISTERS} {0}
set_instance_parameter_value spi_dmac_0 {DMA_2D_TRANSFER} {0}
set_instance_parameter_value spi_dmac_0 {DMA_AXIS_DEST_W} {4}
set_instance_parameter_value spi_dmac_0 {DMA_AXIS_ID_W} {8}
set_instance_parameter_value spi_dmac_0 {DMA_AXI_PROTOCOL_DEST} {1}
set_instance_parameter_value spi_dmac_0 {DMA_AXI_PROTOCOL_SRC} {1}
set_instance_parameter_value spi_dmac_0 {DMA_DATA_WIDTH_DEST} {64}
set_instance_parameter_value spi_dmac_0 {DMA_DATA_WIDTH_SRC} {32}
set_instance_parameter_value spi_dmac_0 {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value spi_dmac_0 {DMA_TYPE_DEST} {0}
set_instance_parameter_value spi_dmac_0 {DMA_TYPE_SRC} {1}
set_instance_parameter_value spi_dmac_0 {ENABLE_DIAGNOSTICS_IF} {0}
set_instance_parameter_value spi_dmac_0 {FIFO_SIZE} {8}
set_instance_parameter_value spi_dmac_0 {HAS_AXIS_TDEST} {0}
set_instance_parameter_value spi_dmac_0 {HAS_AXIS_TID} {0}
set_instance_parameter_value spi_dmac_0 {HAS_AXIS_TKEEP} {0}
set_instance_parameter_value spi_dmac_0 {HAS_AXIS_TLAST} {0}
set_instance_parameter_value spi_dmac_0 {HAS_AXIS_TSTRB} {0}
set_instance_parameter_value spi_dmac_0 {HAS_AXIS_TUSER} {0}
set_instance_parameter_value spi_dmac_0 {ID} {0}
set_instance_parameter_value spi_dmac_0 {MAX_BYTES_PER_BURST} {128}
set_instance_parameter_value spi_dmac_0 {SYNC_TRANSFER_START} {0}
add_connection sys_hps.h2f_user1_clock spi_dmac_0.m_dest_axi_clock
add_connection sys_hps.h2f_user1_clock spi_dmac_0.s_axi_clock
add_connection spi_engine_pll.outclk0 spi_dmac_0.if_s_axis_aclk 
add_connection sys_clk.clk_reset spi_dmac_0.m_dest_axi_reset
add_connection sys_clk.clk_reset spi_dmac_0.s_axi_reset
add_connection spi_dmac_0.m_dest_axi sys_hps.f2h_sdram1_data
set_connection_parameter_value spi_dmac_0.m_dest_axi/sys_hps.f2h_sdram1_data arbitrationPriority {1}
set_connection_parameter_value spi_dmac_0.m_dest_axi/sys_hps.f2h_sdram1_data baseAddress {0x0000}
set_connection_parameter_value spi_dmac_0.m_dest_axi/sys_hps.f2h_sdram1_data defaultConnection {0}
add_connection sys_hps.f2h_irq0 spi_dmac_0.interrupt_sender
set_connection_parameter_value sys_hps.f2h_irq0/spi_dmac_0.interrupt_sender irqNumber {5}
add_connection sys_hps.h2f_lw_axi_master spi_dmac_0.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/spi_dmac_0.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/spi_dmac_0.s_axi baseAddress {0x0050000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/spi_dmac_0.s_axi defaultConnection {0}

set_interface_property spi_dmac_0_s_axis EXPORT_OF spi_dmac_0.s_axis



# ad7768_1_gpio

add_instance ad7768_1_gpio altera_avalon_pio
set_instance_parameter_value ad7768_1_gpio {direction} {Bidir}
set_instance_parameter_value ad7768_1_gpio {edgeType} {RISING}
set_instance_parameter_value ad7768_1_gpio {generateIRQ} {0}
set_instance_parameter_value ad7768_1_gpio {irqType} {LEVEL}
set_instance_parameter_value ad7768_1_gpio {width} {32}

add_connection sys_clk.clk_reset ad7768_1_gpio.reset
add_connection sys_hps.h2f_user1_clock ad7768_1_gpio.clk
add_interface ad7768_1_gpio conduit end
set_interface_property ad7768_1_gpio EXPORT_OF ad7768_1_gpio.external_connection

ad_cpu_interconnect 0x00020050 ad7768_1_gpio.s1








