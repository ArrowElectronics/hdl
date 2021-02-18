# tei0022 carrier qsys

set system_type c5soc

# system clock

add_instance sys_clk clock_source
set_instance_parameter_value sys_clk {clockFrequency} {50000000.0}
set_instance_parameter_value sys_clk {clockFrequencyKnown} {1}
set_instance_parameter_value sys_clk {resetSynchronousEdges} {NONE}
add_interface sys_clk clock sink
add_interface sys_rst reset sink
set_interface_property sys_clk EXPORT_OF sys_clk.clk_in
set_interface_property sys_rst EXPORT_OF sys_clk.clk_in_reset

# hps

add_instance sys_hps altera_hps
set_instance_parameter_value sys_hps {MPU_EVENTS_Enable} {0}
set_instance_parameter_value sys_hps {F2SDRAM_Type} {Avalon-MM\ Bidirectional AXI-3 AXI-3}
set_instance_parameter_value sys_hps {F2SDRAM_Width} {64 64 64}
set_instance_parameter_value sys_hps {F2SINTERRUPT_Enable} {1}
set_instance_parameter_value sys_hps {EMAC0_PinMuxing} {Unused}
set_instance_parameter_value sys_hps {EMAC0_Mode} {N/A}
set_instance_parameter_value sys_hps {EMAC1_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value sys_hps {EMAC1_Mode} {RGMII}
set_instance_parameter_value sys_hps {QSPI_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value sys_hps {QSPI_Mode} {1 SS}
set_instance_parameter_value sys_hps {SDIO_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value sys_hps {SDIO_Mode} {4-bit Data}
set_instance_parameter_value sys_hps {USB0_PinMuxing} {Unused}
set_instance_parameter_value sys_hps {USB0_Mode} {N/A}
set_instance_parameter_value sys_hps {USB1_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value sys_hps {USB1_Mode} {SDR}
set_instance_parameter_value sys_hps {SPIM0_PinMuxing} {Unused}
set_instance_parameter_value sys_hps {SPIM0_Mode} {N/A}
set_instance_parameter_value sys_hps {SPIM1_PinMuxing} {Unused}
set_instance_parameter_value sys_hps {SPIM1_Mode} {N/A}
set_instance_parameter_value sys_hps {UART0_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value sys_hps {UART0_Mode} {No Flow Control}
set_instance_parameter_value sys_hps {UART1_PinMuxing} {Unused}
set_instance_parameter_value sys_hps {UART1_Mode} {N/A}
set_instance_parameter_value sys_hps {I2C0_Mode} {I2C}
set_instance_parameter_value sys_hps {I2C0_PinMuxing} {HPS I/O Set 1}
set_instance_parameter_value sys_hps {I2C1_Mode} {I2C}
set_instance_parameter_value sys_hps {I2C1_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value sys_hps {GPIO_Enable} {Yes No No No No No No No No Yes No No No No No No No No No No No No No No No No No No No No No No No No No Yes No No No No Yes Yes Yes Yes Yes No No No Yes No No No No Yes Yes Yes Yes Yes Yes Yes No Yes No No No Yes No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No}
set_instance_parameter_value sys_hps {desired_cfg_clk_mhz} {80.0}
set_instance_parameter_value sys_hps {S2FCLK_USER0CLK_Enable} {0}
set_instance_parameter_value sys_hps {S2FCLK_USER1CLK_Enable} {1}
set_instance_parameter_value sys_hps {S2FCLK_USER1CLK_FREQ} {100.0}
set_instance_parameter_value sys_hps {S2FCLK_USER2CLK} {4}
set_instance_parameter_value sys_hps {S2FCLK_USER2CLK_Enable} {0}
set_instance_parameter_value sys_hps {S2FCLK_USER2CLK_FREQ} {100.0}
set_instance_parameter_value sys_hps {HPS_PROTOCOL} {DDR3}
set_instance_parameter_value sys_hps {MEM_CLK_FREQ} {333.3}
set_instance_parameter_value sys_hps {REF_CLK_FREQ} {25.0}
set_instance_parameter_value sys_hps {MEM_VOLTAGE} {1.5V DDR3}
set_instance_parameter_value sys_hps {MEM_CLK_FREQ_MAX} {800.0}
set_instance_parameter_value sys_hps {MEM_DQ_WIDTH} {32}
set_instance_parameter_value sys_hps {MEM_ROW_ADDR_WIDTH} {16}
set_instance_parameter_value sys_hps {MEM_COL_ADDR_WIDTH} {10}
set_instance_parameter_value sys_hps {MEM_BANKADDR_WIDTH} {3}
set_instance_parameter_value sys_hps {MEM_TCL} {5}
set_instance_parameter_value sys_hps {MEM_DRV_STR} {RZQ/6}
set_instance_parameter_value sys_hps {MEM_RTT_NOM} {RZQ/6}
set_instance_parameter_value sys_hps {MEM_WTCL} {5}
set_instance_parameter_value sys_hps {MEM_RTT_WR} {Dynamic ODT off}
set_instance_parameter_value sys_hps {TIMING_TIS} {180}
set_instance_parameter_value sys_hps {TIMING_TIH} {140}
set_instance_parameter_value sys_hps {TIMING_TDS} {30}
set_instance_parameter_value sys_hps {TIMING_TDH} {65}
set_instance_parameter_value sys_hps {TIMING_TDQSQ} {100}
set_instance_parameter_value sys_hps {TIMING_TQH} {0.38}
set_instance_parameter_value sys_hps {TIMING_TDQSCK} {225}
set_instance_parameter_value sys_hps {TIMING_TDQSS} {0.27}
set_instance_parameter_value sys_hps {TIMING_TQSH} {0.4}
set_instance_parameter_value sys_hps {TIMING_TDSH} {0.18}
set_instance_parameter_value sys_hps {TIMING_TDSS} {0.18}
set_instance_parameter_value sys_hps {MEM_TINIT_US} {500}
set_instance_parameter_value sys_hps {MEM_TMRD_CK} {4}
set_instance_parameter_value sys_hps {MEM_TRAS_NS} {35.0}
set_instance_parameter_value sys_hps {MEM_TRCD_NS} {13.75}
set_instance_parameter_value sys_hps {MEM_TRP_NS} {13.75}
set_instance_parameter_value sys_hps {MEM_TREFI_US} {7.8}
set_instance_parameter_value sys_hps {MEM_TRFC_NS} {350.0}
set_instance_parameter_value sys_hps {MEM_TWR_NS} {15.0}
set_instance_parameter_value sys_hps {MEM_TWTR} {4}
set_instance_parameter_value sys_hps {MEM_TFAW_NS} {40.0}
set_instance_parameter_value sys_hps {MEM_TRRD_NS} {12}
set_instance_parameter_value sys_hps {MEM_TRTP_NS} {12}
set_instance_parameter_value sys_hps {TIMING_BOARD_MAX_CK_DELAY} {0.03}
set_instance_parameter_value sys_hps {TIMING_BOARD_MAX_DQS_DELAY} {0.02}
set_instance_parameter_value sys_hps {TIMING_BOARD_SKEW_CKDQS_DIMM_MIN} {0.09}
set_instance_parameter_value sys_hps {TIMING_BOARD_SKEW_CKDQS_DIMM_MAX} {0.16}
set_instance_parameter_value sys_hps {TIMING_BOARD_SKEW_WITHIN_DQS} {0.01}
set_instance_parameter_value sys_hps {TIMING_BOARD_SKEW_BETWEEN_DQS} {0.08}
set_instance_parameter_value sys_hps {TIMING_BOARD_DQ_TO_DQS_SKEW} {0.0}
set_instance_parameter_value sys_hps {TIMING_BOARD_AC_SKEW} {0.03}
set_instance_parameter_value sys_hps {TIMING_BOARD_AC_TO_CK_SKEW} {0.0}
add_interface sys_hps_memory conduit end
set_interface_property sys_hps_memory EXPORT_OF sys_hps.memory
add_interface sys_hps_hps_io conduit end
set_interface_property sys_hps_hps_io EXPORT_OF sys_hps.hps_io
add_interface sys_hps_h2f_reset reset source
set_interface_property sys_hps_h2f_reset EXPORT_OF sys_hps.h2f_reset
add_connection sys_hps.h2f_user1_clock sys_hps.h2f_axi_clock
add_connection sys_hps.h2f_user1_clock sys_hps.f2h_axi_clock
add_connection sys_hps.h2f_user1_clock sys_hps.h2f_lw_axi_clock
add_connection sys_hps.h2f_user1_clock sys_hps.f2h_sdram0_clock
add_connection sys_hps.h2f_user1_clock sys_hps.f2h_sdram1_clock
add_connection sys_hps.h2f_user1_clock sys_hps.f2h_sdram2_clock

# cpu/hps handling

proc ad_cpu_interrupt {m_irq m_port} {

  add_connection sys_hps.f2h_irq0 ${m_port}
  set_connection_parameter_value sys_hps.f2h_irq0/${m_port} irqNumber ${m_irq}
}

proc ad_cpu_interconnect {m_base m_port} {

  add_connection sys_hps.h2f_lw_axi_master ${m_port}
  set_connection_parameter_value sys_hps.h2f_lw_axi_master/${m_port} baseAddress ${m_base}
}

proc ad_dma_interconnect {m_port m_id} {

  if {${m_id} == 1} {
    add_connection ${m_port} sys_hps.f2h_sdram1_data
    set_connection_parameter_value ${m_port}/sys_hps.f2h_sdram1_data baseAddress {0x0000}
    return
  }

  add_connection ${m_port} sys_hps.f2h_sdram2_data
  set_connection_parameter_value ${m_port}/sys_hps.f2h_sdram2_data baseAddress {0x0000}
}

# display (hdmi-pll)

add_instance hdmi_pll altera_pll
set_instance_parameter_value hdmi_pll {gui_device_speed_grade} {8}
set_instance_parameter_value hdmi_pll {gui_reference_clock_frequency} {100.0}
set_instance_parameter_value hdmi_pll {gui_use_locked} {0}
set_instance_parameter_value hdmi_pll {gui_number_of_clocks} {1}
set_instance_parameter_value hdmi_pll {gui_output_clock_frequency0} {148.5}
add_connection sys_hps.h2f_user1_clock hdmi_pll.refclk
add_connection sys_clk.clk_reset hdmi_pll.reset


# display (dmac)

add_instance hdmi_dmac_0 axi_dmac 1.0
set_instance_parameter_value hdmi_dmac_0 {ASYNC_CLK_DEST_REQ_MANUAL} {1}
set_instance_parameter_value hdmi_dmac_0 {ASYNC_CLK_REQ_SRC_MANUAL} {1}
set_instance_parameter_value hdmi_dmac_0 {ASYNC_CLK_SRC_DEST_MANUAL} {1}
set_instance_parameter_value hdmi_dmac_0 {AUTO_ASYNC_CLK} {1}
set_instance_parameter_value hdmi_dmac_0 {AXI_SLICE_DEST} {0}
set_instance_parameter_value hdmi_dmac_0 {AXI_SLICE_SRC} {0}
set_instance_parameter_value hdmi_dmac_0 {CYCLIC} {1}
set_instance_parameter_value hdmi_dmac_0 {DISABLE_DEBUG_REGISTERS} {0}
set_instance_parameter_value hdmi_dmac_0 {DMA_2D_TRANSFER} {1}
set_instance_parameter_value hdmi_dmac_0 {DMA_AXIS_DEST_W} {4}
set_instance_parameter_value hdmi_dmac_0 {DMA_AXIS_ID_W} {8}
set_instance_parameter_value hdmi_dmac_0 {DMA_AXI_PROTOCOL_DEST} {1}
set_instance_parameter_value hdmi_dmac_0 {DMA_AXI_PROTOCOL_SRC} {1}
set_instance_parameter_value hdmi_dmac_0 {DMA_DATA_WIDTH_DEST} {64}
set_instance_parameter_value hdmi_dmac_0 {DMA_DATA_WIDTH_SRC} {64}
set_instance_parameter_value hdmi_dmac_0 {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value hdmi_dmac_0 {DMA_TYPE_DEST} {1}
set_instance_parameter_value hdmi_dmac_0 {DMA_TYPE_SRC} {0}
set_instance_parameter_value hdmi_dmac_0 {ENABLE_DIAGNOSTICS_IF} {0}
set_instance_parameter_value hdmi_dmac_0 {FIFO_SIZE} {8}
set_instance_parameter_value hdmi_dmac_0 {HAS_AXIS_TDEST} {0}
set_instance_parameter_value hdmi_dmac_0 {HAS_AXIS_TID} {0}
set_instance_parameter_value hdmi_dmac_0 {HAS_AXIS_TKEEP} {0}
set_instance_parameter_value hdmi_dmac_0 {HAS_AXIS_TLAST} {1}
set_instance_parameter_value hdmi_dmac_0 {HAS_AXIS_TSTRB} {0}
set_instance_parameter_value hdmi_dmac_0 {HAS_AXIS_TUSER} {0}
set_instance_parameter_value hdmi_dmac_0 {ID} {0}
set_instance_parameter_value hdmi_dmac_0 {MAX_BYTES_PER_BURST} {128}
set_instance_parameter_value hdmi_dmac_0 {SYNC_TRANSFER_START} {0}
add_connection sys_hps.h2f_user1_clock hdmi_dmac_0.s_axi_clock
add_connection sys_hps.h2f_user1_clock hdmi_dmac_0.m_src_axi_clock
add_connection sys_hps.h2f_user1_clock hdmi_dmac_0.if_m_axis_aclk
add_connection sys_clk.clk_reset hdmi_dmac_0.s_axi_reset
add_connection sys_clk.clk_reset hdmi_dmac_0.m_src_axi_reset
add_connection sys_hps.h2f_lw_axi_master hdmi_dmac_0.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/hdmi_dmac_0.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/hdmi_dmac_0.s_axi baseAddress {0x0090000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/hdmi_dmac_0.s_axi defaultConnection {0}
add_connection sys_hps.f2h_irq0 hdmi_dmac_0.interrupt_sender
set_connection_parameter_value sys_hps.f2h_irq0/hdmi_dmac_0.interrupt_sender irqNumber {4}
add_connection hdmi_dmac_0.m_src_axi sys_hps.f2h_sdram0_data
set_connection_parameter_value hdmi_dmac_0.m_src_axi/sys_hps.f2h_sdram0_data arbitrationPriority {1}
set_connection_parameter_value hdmi_dmac_0.m_src_axi/sys_hps.f2h_sdram0_data baseAddress {0x0000}
set_connection_parameter_value hdmi_dmac_0.m_src_axi/sys_hps.f2h_sdram0_data defaultConnection {0}

# display (hdmi_tx)

add_instance axi_hdmi_tx_0 axi_hdmi_tx 1.0
set_instance_parameter_value axi_hdmi_tx_0 {CR_CB_N} {0}
set_instance_parameter_value axi_hdmi_tx_0 {FPGA_TECHNOLOGY} {101}
set_instance_parameter_value axi_hdmi_tx_0 {ID} {0}
set_instance_parameter_value axi_hdmi_tx_0 {INTERFACE} {16_BIT}
set_instance_parameter_value axi_hdmi_tx_0 {OUT_CLK_POLARITY} {0}
add_connection sys_hps.h2f_user1_clock axi_hdmi_tx_0.s_axi_clock
add_connection sys_clk.clk_reset axi_hdmi_tx_0.s_axi_reset
add_connection sys_hps.h2f_lw_axi_master axi_hdmi_tx_0.s_axi
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_hdmi_tx_0.s_axi arbitrationPriority {1}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_hdmi_tx_0.s_axi baseAddress {0x00a0000}
set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_hdmi_tx_0.s_axi defaultConnection {0}
add_connection hdmi_pll.outclk0 axi_hdmi_tx_0.hdmi_clock
add_interface hdmi_out conduit end
set_interface_property hdmi_out EXPORT_OF axi_hdmi_tx_0.hdmi_if
add_connection sys_hps.h2f_user1_clock axi_hdmi_tx_0.vdma_clock
add_connection sys_clk.clk_reset axi_hdmi_tx_0.vdma_reset
add_connection hdmi_dmac_0.m_axis axi_hdmi_tx_0.vdma_if

# id

add_instance sys_id altera_avalon_sysid_qsys
set_instance_parameter_value sys_id {id} {-1395322110}
add_connection sys_hps.h2f_user1_clock sys_id.clk
add_connection sys_clk.clk_reset sys_id.reset

# gpio-bd

add_instance sys_gpio_bd altera_avalon_pio
set_instance_parameter_value sys_gpio_bd {direction} {InOut}
set_instance_parameter_value sys_gpio_bd {edgeType} {RISING}
set_instance_parameter_value sys_gpio_bd {generateIRQ} {1}
set_instance_parameter_value sys_gpio_bd {irqType} {LEVEL}
set_instance_parameter_value sys_gpio_bd {width} {32}

add_connection sys_clk.clk_reset sys_gpio_bd.reset
add_connection sys_hps.h2f_user1_clock sys_gpio_bd.clk
add_interface sys_gpio_bd conduit end
set_interface_property sys_gpio_bd EXPORT_OF sys_gpio_bd.external_connection

add_connection sys_hps.f2h_irq0 sys_gpio_bd.irq interrupt
set_connection_parameter_value sys_hps.f2h_irq0/sys_gpio_bd.irq irqNumber {0}

ad_cpu_interconnect 0x00020000 sys_gpio_bd.s1


# gpio_in

add_instance sys_gpio_in altera_avalon_pio
set_instance_parameter_value sys_gpio_in {direction} {Input}
set_instance_parameter_value sys_gpio_in {edgeType} {RISING}
set_instance_parameter_value sys_gpio_in {generateIRQ} {1}
set_instance_parameter_value sys_gpio_in {irqType} {LEVEL}
set_instance_parameter_value sys_gpio_in {width} {32}

add_connection sys_clk.clk_reset sys_gpio_in.reset
add_connection sys_hps.h2f_user1_clock sys_gpio_in.clk
add_interface sys_gpio_in conduit end
set_interface_property sys_gpio_in EXPORT_OF sys_gpio_in.external_connection

add_connection sys_hps.f2h_irq0 sys_gpio_in.irq interrupt
set_connection_parameter_value sys_hps.f2h_irq0/sys_gpio_in.irq irqNumber {1}

ad_cpu_interconnect 0x00020010 sys_gpio_in.s1

# gpio_out

add_instance sys_gpio_out altera_avalon_pio
set_instance_parameter_value sys_gpio_out {direction} {Output}
set_instance_parameter_value sys_gpio_out {generateIRQ} {0}
set_instance_parameter_value sys_gpio_out {width} {32}

add_connection sys_clk.clk_reset sys_gpio_out.reset
add_connection sys_hps.h2f_user1_clock sys_gpio_out.clk
add_interface sys_gpio_out conduit end
set_interface_property sys_gpio_out EXPORT_OF sys_gpio_out.external_connection

ad_cpu_interconnect 0x00020020 sys_gpio_out.s1


# interrupts

# cpu interconnects

ad_cpu_interconnect 0x00010000 sys_id.control_slave

