#to speedup system
set_instance_parameter_value sys_hps {S2FCLK_USER2CLK} {4}
set_instance_parameter_value sys_hps {S2FCLK_USER2CLK_Enable} {1}
set_instance_parameter_value sys_hps {S2FCLK_USER2CLK_FREQ} {150.0}

# spi engine pll

add_instance spi_engine_pll altera_pll
set_instance_parameter_value spi_engine_pll {gui_device_speed_grade} {6}
set_instance_parameter_value spi_engine_pll {gui_reference_clock_frequency} {100.0}
set_instance_parameter_value spi_engine_pll {gui_use_locked} {1}
set_instance_parameter_value spi_engine_pll {gui_number_of_clocks} {1}
set_instance_parameter_value spi_engine_pll {gui_output_clock_frequency0} {160.0}
add_connection sys_hps.h2f_user1_clock spi_engine_pll.refclk
add_connection sys_clk.clk_reset spi_engine_pll.reset

# axi_ad463x_if 

add_instance axi_ad463x axi_ad463x_if
set_instance_parameter_value axi_ad463x {ID} {0}
set_instance_parameter_value axi_ad463x {NUM_OF_SDI} {8}
set_instance_parameter_value axi_ad463x {NUM_OF_CHANNELS} {2}

add_connection spi_engine_pll.outclk0 axi_ad463x.spi_clk
add_connection sys_clk.clk_reset axi_ad463x.s_axi_aresetn
add_connection sys_hps.f2h_irq0 axi_ad463x.irq
set_connection_parameter_value sys_hps.f2h_irq0/axi_ad463x.irq irqNumber {6}

add_connection sys_hps.h2f_user2_clock axi_ad463x.s_axi_aclk

#add_connection sys_hps.h2f_user1_clock axi_ad463x.s_axi_aclk
add_connection sys_hps.h2f_lw_axi_master axi_ad463x.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad463x.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad463x.s_axi baseAddress {0x40000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad463x.s_axi defaultConnection {0}

add_interface ad463x_interface conduit end
set_interface_property ad463x_interface EXPORT_OF axi_ad463x.ad463x_interface

# adc-dma fifo

add_instance spi_dmac_0 axi_dmac 1.0
set_instance_parameter_value spi_dmac_0 {ASYNC_CLK_DEST_REQ_MANUAL} {1}
set_instance_parameter_value spi_dmac_0 {ASYNC_CLK_REQ_SRC_MANUAL} {1}
set_instance_parameter_value spi_dmac_0 {ASYNC_CLK_SRC_DEST_MANUAL} {1}
set_instance_parameter_value spi_dmac_0 {AUTO_ASYNC_CLK} {1}
set_instance_parameter_value spi_dmac_0 {AXI_SLICE_DEST} {0}
set_instance_parameter_value spi_dmac_0 {AXI_SLICE_SRC} {0}
set_instance_parameter_value spi_dmac_0 {CYCLIC} {0}
set_instance_parameter_value spi_dmac_0 {DISABLE_DEBUG_REGISTERS} {0}
set_instance_parameter_value spi_dmac_0 {DMA_2D_TRANSFER} {0}
set_instance_parameter_value spi_dmac_0 {DMA_AXIS_DEST_W} {4}
set_instance_parameter_value spi_dmac_0 {DMA_AXIS_ID_W} {8}
set_instance_parameter_value spi_dmac_0 {DMA_AXI_PROTOCOL_DEST} {1}
set_instance_parameter_value spi_dmac_0 {DMA_AXI_PROTOCOL_SRC} {1}
set_instance_parameter_value spi_dmac_0 {DMA_DATA_WIDTH_DEST} {64}
set_instance_parameter_value spi_dmac_0 {DMA_DATA_WIDTH_SRC} {64}
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

add_connection spi_engine_pll.outclk0 spi_dmac_0.if_s_axis_aclk 
#add_connection sys_hps.h2f_user1_clock spi_dmac_0.m_dest_axi_clock
#add_connection sys_hps.h2f_user1_clock spi_dmac_0.s_axi_clock
add_connection sys_hps.h2f_user2_clock spi_dmac_0.m_dest_axi_clock
add_connection sys_hps.h2f_user2_clock spi_dmac_0.s_axi_clock
add_connection sys_clk.clk_reset spi_dmac_0.m_dest_axi_reset
add_connection sys_clk.clk_reset spi_dmac_0.s_axi_reset
add_connection axi_ad463x.m_axis spi_dmac_0.s_axis

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
















