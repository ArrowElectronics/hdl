#set_instance_parameter_value sys_hps {S2FCLK_USER2CLK} {4}
#set_instance_parameter_value sys_hps {S2FCLK_USER2CLK_Enable} {1}
#set_instance_parameter_value sys_hps {S2FCLK_USER2CLK_FREQ} {150.0}

# ad469x_data  

#add_instance ad469x_data  altera_avalon_pio
#set_instance_parameter_value ad469x_data  {direction} {Bidir}
#set_instance_parameter_value ad469x_data  {edgeType} {RISING}
#set_instance_parameter_value ad469x_data  {generateIRQ} {0}
#set_instance_parameter_value ad469x_data  {irqType} {LEVEL}
#set_instance_parameter_value ad469x_data  {width} {24}
#add_connection sys_clk.clk_reset ad469x_data.reset
#ad_cpu_interconnect 0x00020060 ad469x_data.s1
#add_connection sys_hps.h2f_user1_clock ad469x_data.clk

#add_interface ad469x_data conduit end
#set_interface_property ad469x_data EXPORT_OF ad469x_data.external_connection

# ad469x_control 

#add_instance ad469x_control   altera_avalon_pio
#set_instance_parameter_value ad469x_control   {direction} {Output}
#set_instance_parameter_value ad469x_control   {edgeType} {RISING}
#set_instance_parameter_value ad469x_control   {generateIRQ} {0}
#set_instance_parameter_value ad469x_control   {irqType} {LEVEL}
#set_instance_parameter_value ad469x_control   {width} {10}
#add_connection sys_clk.clk_reset ad469x_control.reset
#ad_cpu_interconnect 0x00020050 ad469x_control.s1
#add_connection sys_hps.h2f_user1_clock ad469x_control.clk

#add_interface ad469x_control conduit end
#set_interface_property ad469x_control EXPORT_OF ad469x_control.external_connection

# spi engine pll

add_instance spi_engine_pll altera_pll
set_instance_parameter_value spi_engine_pll {gui_device_speed_grade} {6}
set_instance_parameter_value spi_engine_pll {gui_reference_clock_frequency} {100.0}
set_instance_parameter_value spi_engine_pll {gui_use_locked} {1}
set_instance_parameter_value spi_engine_pll {gui_number_of_clocks} {1}
set_instance_parameter_value spi_engine_pll {gui_output_clock_frequency0} {160.0}
add_connection sys_hps.h2f_user1_clock spi_engine_pll.refclk
add_connection sys_clk.clk_reset spi_engine_pll.reset

# axi_ad469x_if 

add_instance axi_ad469x axi_ad469x_if
set_instance_parameter_value axi_ad469x {ID} {0}
set_instance_parameter_value axi_ad469x {NUM_OF_SDI} {2}
set_instance_parameter_value axi_ad469x {NUM_OF_CHANNELS} {16}
set_instance_parameter_value axi_ad469x {DATA_BUS} {32}
set_instance_parameter_value axi_ad469x {ADC_RESOLUTION} {16}

add_connection spi_engine_pll.outclk0 axi_ad469x.spi_clk
add_connection sys_clk.clk_reset axi_ad469x.s_axi_aresetn
add_connection sys_hps.f2h_irq0 axi_ad469x.irq
set_connection_parameter_value sys_hps.f2h_irq0/axi_ad469x.irq irqNumber {6}

add_connection sys_hps.h2f_user1_clock axi_ad469x.s_axi_aclk
add_connection sys_hps.h2f_lw_axi_master axi_ad469x.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad469x.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad469x.s_axi baseAddress {0x40000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad469x.s_axi defaultConnection {0}

#add_interface ad469x_up conduit end
#set_interface_property ad469x_up EXPORT_OF axi_ad469x.ad469x_up 

add_interface ad469x_interface conduit end
set_interface_property ad469x_interface EXPORT_OF axi_ad469x.ad469x_interface


# axi-generic-adc

add_instance axi_ad469x_adc axi_generic_adc
set_instance_parameter_value axi_ad469x_adc {NUM_OF_CHANNELS} {16}

add_connection spi_engine_pll.outclk0 axi_ad469x_adc.adc_clk
add_connection sys_hps.h2f_user1_clock axi_ad469x_adc.s_axi_aclk
add_connection sys_clk.clk_reset axi_ad469x_adc.s_axi_aresetn

add_connection sys_hps.h2f_lw_axi_master axi_ad469x_adc.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad469x_adc.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad469x_adc.s_axi baseAddress {0x60000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad469x_adc.s_axi defaultConnection {0}

add_connection axi_ad469x_adc.enable axi_ad469x.enable_in
add_connection axi_ad469x_adc.if_adc_dovf axi_ad469x.if_adc_wr_overflow

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
set_instance_parameter_value spi_dmac_0 {DMA_DATA_WIDTH_SRC} {256}
set_instance_parameter_value spi_dmac_0 {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value spi_dmac_0 {DMA_TYPE_DEST} {0}
set_instance_parameter_value spi_dmac_0 {DMA_TYPE_SRC} {2}
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
set_instance_parameter_value spi_dmac_0 {SYNC_TRANSFER_START} {1}

add_connection axi_ad469x.if_adc_data_packed spi_dmac_0.if_fifo_wr_din
add_connection axi_ad469x.if_adc_sync_packed spi_dmac_0.if_fifo_wr_sync
add_connection axi_ad469x.if_adc_en_packed spi_dmac_0.if_fifo_wr_en
add_connection axi_ad469x.if_adc_ovf_packed spi_dmac_0.if_fifo_wr_overflow

add_connection spi_engine_pll.outclk0 spi_dmac_0.if_fifo_wr_clk
add_connection sys_hps.h2f_user1_clock spi_dmac_0.m_dest_axi_clock
add_connection sys_hps.h2f_user1_clock spi_dmac_0.s_axi_clock
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
















