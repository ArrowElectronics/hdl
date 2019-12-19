# _hw.tcl file for system_bd
package require -exact qsys 14.0

# module properties
set_module_property NAME {system_bd_export}
set_module_property DISPLAY_NAME {system_bd_export_display}

# default module properties
set_module_property VERSION {1.0}
set_module_property GROUP {default group}
set_module_property DESCRIPTION {default description}
set_module_property AUTHOR {author}

set_module_property COMPOSITION_CALLBACK compose
set_module_property opaque_address_map false

proc compose { } {
    # Instances and instance parameters
    # (disabled instances are intentionally culled)
    add_instance ad9144_jesd204 adi_jesd204 1.0
    set_instance_parameter_value ad9144_jesd204 {ID} {0}
    set_instance_parameter_value ad9144_jesd204 {LANE_INVERT} {0}
    set_instance_parameter_value ad9144_jesd204 {LANE_MAP} {0 3 1 2}
    set_instance_parameter_value ad9144_jesd204 {LANE_RATE} {10000.0}
    set_instance_parameter_value ad9144_jesd204 {NUM_OF_LANES} {4}
    set_instance_parameter_value ad9144_jesd204 {REFCLK_FREQUENCY} {333.333333}
    set_instance_parameter_value ad9144_jesd204 {SOFT_PCS} {1}
    set_instance_parameter_value ad9144_jesd204 {SYSCLK_FREQUENCY} {100.0}
    set_instance_parameter_value ad9144_jesd204 {TX_OR_RX_N} {1}

    add_instance ad9680_adcfifo util_adcfifo 1.0
    set_instance_parameter_value ad9680_adcfifo {ADC_DATA_WIDTH} {128}
    set_instance_parameter_value ad9680_adcfifo {DEVICE_TYPE} {1}
    set_instance_parameter_value ad9680_adcfifo {DMA_ADDRESS_WIDTH} {16}
    set_instance_parameter_value ad9680_adcfifo {DMA_DATA_WIDTH} {128}
    set_instance_parameter_value ad9680_adcfifo {DMA_READY_ENABLE} {1}

    add_instance ad9680_jesd204 adi_jesd204 1.0
    set_instance_parameter_value ad9680_jesd204 {ID} {1}
    set_instance_parameter_value ad9680_jesd204 {LANE_INVERT} {0}
    set_instance_parameter_value ad9680_jesd204 {LANE_MAP} {}
    set_instance_parameter_value ad9680_jesd204 {LANE_RATE} {10000.0}
    set_instance_parameter_value ad9680_jesd204 {NUM_OF_LANES} {4}
    set_instance_parameter_value ad9680_jesd204 {REFCLK_FREQUENCY} {333.333333}
    set_instance_parameter_value ad9680_jesd204 {SOFT_PCS} {1}
    set_instance_parameter_value ad9680_jesd204 {SYSCLK_FREQUENCY} {100.0}
    set_instance_parameter_value ad9680_jesd204 {TX_OR_RX_N} {0}

    add_instance avl_ad9144_fifo avl_dacfifo 1.0
    set_instance_parameter_value avl_ad9144_fifo {AVL_ADDRESS_LIMIT} {-1879048193}
    set_instance_parameter_value avl_ad9144_fifo {AVL_ADDRESS_WIDTH} {26}
    set_instance_parameter_value avl_ad9144_fifo {AVL_BASE_ADDRESS} {0}
    set_instance_parameter_value avl_ad9144_fifo {AVL_BURST_LENGTH} {64}
    set_instance_parameter_value avl_ad9144_fifo {AVL_DATA_WIDTH} {512}
    set_instance_parameter_value avl_ad9144_fifo {DAC_DATA_WIDTH} {128}
    set_instance_parameter_value avl_ad9144_fifo {DAC_MEM_ADDRESS_WIDTH} {12}
    set_instance_parameter_value avl_ad9144_fifo {DMA_DATA_WIDTH} {128}
    set_instance_parameter_value avl_ad9144_fifo {DMA_MEM_ADDRESS_WIDTH} {12}

    add_instance avl_adxcfg_0 avl_adxcfg 1.0

    add_instance avl_adxcfg_1 avl_adxcfg 1.0

    add_instance avl_adxcfg_2 avl_adxcfg 1.0

    add_instance avl_adxcfg_3 avl_adxcfg 1.0

    add_instance axi_ad9144_core axi_ad9144 1.0
    set_instance_parameter_value axi_ad9144_core {ID} {0}
    set_instance_parameter_value axi_ad9144_core {QUAD_OR_DUAL_N} {0}

    add_instance axi_ad9144_dma axi_dmac 1.0
    set_instance_parameter_value axi_ad9144_dma {ASYNC_CLK_DEST_REQ_MANUAL} {1}
    set_instance_parameter_value axi_ad9144_dma {ASYNC_CLK_REQ_SRC_MANUAL} {1}
    set_instance_parameter_value axi_ad9144_dma {ASYNC_CLK_SRC_DEST_MANUAL} {1}
    set_instance_parameter_value axi_ad9144_dma {AUTO_ASYNC_CLK} {1}
    set_instance_parameter_value axi_ad9144_dma {AXI_SLICE_DEST} {0}
    set_instance_parameter_value axi_ad9144_dma {AXI_SLICE_SRC} {0}
    set_instance_parameter_value axi_ad9144_dma {CYCLIC} {0}
    set_instance_parameter_value axi_ad9144_dma {DISABLE_DEBUG_REGISTERS} {0}
    set_instance_parameter_value axi_ad9144_dma {DMA_2D_TRANSFER} {0}
    set_instance_parameter_value axi_ad9144_dma {DMA_AXI_PROTOCOL_DEST} {1}
    set_instance_parameter_value axi_ad9144_dma {DMA_AXI_PROTOCOL_SRC} {1}
    set_instance_parameter_value axi_ad9144_dma {DMA_DATA_WIDTH_DEST} {128}
    set_instance_parameter_value axi_ad9144_dma {DMA_DATA_WIDTH_SRC} {128}
    set_instance_parameter_value axi_ad9144_dma {DMA_LENGTH_WIDTH} {24}
    set_instance_parameter_value axi_ad9144_dma {DMA_TYPE_DEST} {1}
    set_instance_parameter_value axi_ad9144_dma {DMA_TYPE_SRC} {0}
    set_instance_parameter_value axi_ad9144_dma {ENABLE_DIAGNOSTICS_IF} {0}
    set_instance_parameter_value axi_ad9144_dma {FIFO_SIZE} {16}
    set_instance_parameter_value axi_ad9144_dma {ID} {0}
    set_instance_parameter_value axi_ad9144_dma {MAX_BYTES_PER_BURST} {128}
    set_instance_parameter_value axi_ad9144_dma {SYNC_TRANSFER_START} {0}
    set_instance_parameter_value axi_ad9144_dma {USE_TLAST_DEST} {1}
    set_instance_parameter_value axi_ad9144_dma {USE_TLAST_SRC} {0}

    add_instance axi_ad9680_core axi_ad9680 1.0
    set_instance_parameter_value axi_ad9680_core {ID} {0}

    add_instance axi_ad9680_dma axi_dmac 1.0
    set_instance_parameter_value axi_ad9680_dma {ASYNC_CLK_DEST_REQ_MANUAL} {1}
    set_instance_parameter_value axi_ad9680_dma {ASYNC_CLK_REQ_SRC_MANUAL} {1}
    set_instance_parameter_value axi_ad9680_dma {ASYNC_CLK_SRC_DEST_MANUAL} {1}
    set_instance_parameter_value axi_ad9680_dma {AUTO_ASYNC_CLK} {1}
    set_instance_parameter_value axi_ad9680_dma {AXI_SLICE_DEST} {0}
    set_instance_parameter_value axi_ad9680_dma {AXI_SLICE_SRC} {0}
    set_instance_parameter_value axi_ad9680_dma {CYCLIC} {0}
    set_instance_parameter_value axi_ad9680_dma {DISABLE_DEBUG_REGISTERS} {0}
    set_instance_parameter_value axi_ad9680_dma {DMA_2D_TRANSFER} {0}
    set_instance_parameter_value axi_ad9680_dma {DMA_AXI_PROTOCOL_DEST} {1}
    set_instance_parameter_value axi_ad9680_dma {DMA_AXI_PROTOCOL_SRC} {1}
    set_instance_parameter_value axi_ad9680_dma {DMA_DATA_WIDTH_DEST} {128}
    set_instance_parameter_value axi_ad9680_dma {DMA_DATA_WIDTH_SRC} {128}
    set_instance_parameter_value axi_ad9680_dma {DMA_LENGTH_WIDTH} {24}
    set_instance_parameter_value axi_ad9680_dma {DMA_TYPE_DEST} {0}
    set_instance_parameter_value axi_ad9680_dma {DMA_TYPE_SRC} {1}
    set_instance_parameter_value axi_ad9680_dma {ENABLE_DIAGNOSTICS_IF} {0}
    set_instance_parameter_value axi_ad9680_dma {FIFO_SIZE} {8}
    set_instance_parameter_value axi_ad9680_dma {ID} {0}
    set_instance_parameter_value axi_ad9680_dma {MAX_BYTES_PER_BURST} {128}
    set_instance_parameter_value axi_ad9680_dma {SYNC_TRANSFER_START} {0}
    set_instance_parameter_value axi_ad9680_dma {USE_TLAST_DEST} {0}
    set_instance_parameter_value axi_ad9680_dma {USE_TLAST_SRC} {0}

    add_instance fpga_ddr4_cntrl altera_emif 18.0
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_AC_TO_CK_SKEW_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_BRD_SKEW_WITHIN_DQS_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_DQS_TO_CK_SKEW_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_IS_SKEW_WITHIN_AC_DESKEWED} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_IS_SKEW_WITHIN_DQS_DESKEWED} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_MAX_CK_DELAY_NS} {0.6}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_MAX_DQS_DELAY_NS} {0.6}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_PKG_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_PKG_BRD_SKEW_WITHIN_DQS_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_SKEW_BETWEEN_DIMMS_NS} {0.05}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_SKEW_BETWEEN_DQS_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_USER_AC_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_USER_AC_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_USER_CK_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_USER_RCLK_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_USER_RCLK_SLEW_RATE} {5.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_USER_RDATA_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_USER_RDATA_SLEW_RATE} {2.5}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_USER_WCLK_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_USER_WCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_USER_WDATA_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_USER_WDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_USE_DEFAULT_ISI_VALUES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR3_USE_DEFAULT_SLEW_RATES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_AC_TO_CK_SKEW_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_BRD_SKEW_WITHIN_DQS_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_DQS_TO_CK_SKEW_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_IS_SKEW_WITHIN_AC_DESKEWED} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_IS_SKEW_WITHIN_DQS_DESKEWED} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_MAX_CK_DELAY_NS} {0.6}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_MAX_DQS_DELAY_NS} {0.6}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_PKG_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_PKG_BRD_SKEW_WITHIN_DQS_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_SKEW_BETWEEN_DIMMS_NS} {0.05}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_SKEW_BETWEEN_DQS_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_USER_AC_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_USER_AC_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_USER_CK_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_USER_RCLK_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_USER_RCLK_SLEW_RATE} {8.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_USER_RDATA_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_USER_RDATA_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_USER_WCLK_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_USER_WCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_USER_WDATA_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_USER_WDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_USE_DEFAULT_ISI_VALUES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_DDR4_USE_DEFAULT_SLEW_RATES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_AC_TO_CK_SKEW_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_BRD_SKEW_WITHIN_DQS_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_DQS_TO_CK_SKEW_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_IS_SKEW_WITHIN_AC_DESKEWED} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_IS_SKEW_WITHIN_DQS_DESKEWED} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_MAX_CK_DELAY_NS} {0.6}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_MAX_DQS_DELAY_NS} {0.6}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_PKG_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_PKG_BRD_SKEW_WITHIN_DQS_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_SKEW_BETWEEN_DIMMS_NS} {0.05}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_SKEW_BETWEEN_DQS_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_USER_AC_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_USER_AC_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_USER_CK_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_USER_RCLK_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_USER_RCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_USER_RDATA_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_USER_RDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_USER_WCLK_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_USER_WCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_USER_WDATA_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_USER_WDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_USE_DEFAULT_ISI_VALUES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_LPDDR3_USE_DEFAULT_SLEW_RATES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_AC_TO_K_SKEW_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_BRD_SKEW_WITHIN_D_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_BRD_SKEW_WITHIN_Q_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_IS_SKEW_WITHIN_AC_DESKEWED} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_IS_SKEW_WITHIN_D_DESKEWED} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_IS_SKEW_WITHIN_Q_DESKEWED} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_MAX_K_DELAY_NS} {0.6}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_PKG_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_PKG_BRD_SKEW_WITHIN_D_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_PKG_BRD_SKEW_WITHIN_Q_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_USER_AC_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_USER_AC_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_USER_K_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_USER_RCLK_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_USER_RCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_USER_RDATA_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_USER_RDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_USER_WCLK_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_USER_WDATA_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_USER_WDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_USE_DEFAULT_ISI_VALUES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR2_USE_DEFAULT_SLEW_RATES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_AC_TO_CK_SKEW_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_BRD_SKEW_WITHIN_QK_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_DK_TO_CK_SKEW_NS} {-0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_IS_SKEW_WITHIN_AC_DESKEWED} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_IS_SKEW_WITHIN_QK_DESKEWED} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_MAX_CK_DELAY_NS} {0.6}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_MAX_DK_DELAY_NS} {0.6}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_PKG_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_PKG_BRD_SKEW_WITHIN_QK_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_SKEW_BETWEEN_DIMMS_NS} {0.05}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_SKEW_BETWEEN_DK_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_USER_AC_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_USER_AC_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_USER_CK_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_USER_RCLK_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_USER_RCLK_SLEW_RATE} {5.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_USER_RDATA_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_USER_RDATA_SLEW_RATE} {2.5}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_USER_WCLK_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_USER_WCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_USER_WDATA_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_USER_WDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_USE_DEFAULT_ISI_VALUES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_QDR4_USE_DEFAULT_SLEW_RATES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_AC_TO_CK_SKEW_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_BRD_SKEW_WITHIN_QK_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_DK_TO_CK_SKEW_NS} {-0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_IS_SKEW_WITHIN_AC_DESKEWED} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_IS_SKEW_WITHIN_QK_DESKEWED} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_MAX_CK_DELAY_NS} {0.6}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_MAX_DK_DELAY_NS} {0.6}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_PKG_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_PKG_BRD_SKEW_WITHIN_QK_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_SKEW_BETWEEN_DIMMS_NS} {0.05}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_SKEW_BETWEEN_DK_NS} {0.02}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_USER_AC_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_USER_AC_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_USER_CK_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_USER_RCLK_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_USER_RCLK_SLEW_RATE} {7.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_USER_RDATA_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_USER_RDATA_SLEW_RATE} {3.5}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_USER_WCLK_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_USER_WCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_USER_WDATA_ISI_NS} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_USER_WDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_USE_DEFAULT_ISI_VALUES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {BOARD_RLD3_USE_DEFAULT_SLEW_RATES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_ADDR_ORDER_ENUM} {DDR3_CTRL_ADDR_ORDER_CS_R_B_C}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_AUTO_POWER_DOWN_CYCS} {32}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_AUTO_POWER_DOWN_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_AUTO_PRECHARGE_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_MM}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_ECC_AUTO_CORRECTION_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_ECC_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_MMR_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_RD_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_RD_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_RD_TO_WR_SAME_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_REORDER_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_SELF_REFRESH_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_STARVE_LIMIT} {10}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_USER_PRIORITY_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_USER_REFRESH_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_WR_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_WR_TO_RD_SAME_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR3_WR_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_ADDR_ORDER_ENUM} {DDR4_CTRL_ADDR_ORDER_CS_R_B_C_BG}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_AUTO_POWER_DOWN_CYCS} {32}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_AUTO_POWER_DOWN_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_AUTO_PRECHARGE_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_MM}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_ECC_AUTO_CORRECTION_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_ECC_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_MMR_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_RD_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_RD_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_RD_TO_WR_SAME_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_REORDER_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_SELF_REFRESH_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_STARVE_LIMIT} {10}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_USER_PRIORITY_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_USER_REFRESH_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_WR_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_WR_TO_RD_SAME_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_DDR4_WR_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_ADDR_ORDER_ENUM} {LPDDR3_CTRL_ADDR_ORDER_CS_R_B_C}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_AUTO_POWER_DOWN_CYCS} {32}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_AUTO_POWER_DOWN_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_AUTO_PRECHARGE_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_MM}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_MMR_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_RD_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_RD_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_RD_TO_WR_SAME_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_REORDER_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_SELF_REFRESH_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_STARVE_LIMIT} {10}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_USER_PRIORITY_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_USER_REFRESH_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_WR_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_WR_TO_RD_SAME_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_LPDDR3_WR_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_QDR2_AVL_ENABLE_POWER_OF_TWO_BUS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_QDR2_AVL_MAX_BURST_COUNT} {4}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_QDR2_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_MM}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_QDR4_ADD_RAW_TURNAROUND_DELAY_CYC} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_QDR4_ADD_WAR_TURNAROUND_DELAY_CYC} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_QDR4_AVL_ENABLE_POWER_OF_TWO_BUS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_QDR4_AVL_MAX_BURST_COUNT} {4}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_QDR4_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_MM}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_RLD2_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_MM}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_RLD3_ADDR_ORDER_ENUM} {RLD3_CTRL_ADDR_ORDER_CS_R_B_C}
    set_instance_parameter_value fpga_ddr4_cntrl {CTRL_RLD3_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_MM}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_BOARD_DELAY_CONFIG_STR} {}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_ABSTRACT_PHY} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_CAL_ADDR0} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_CAL_ADDR1} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_CAL_ENABLE_NON_DES} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_CAL_FULL_CAL_ON_RESET} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_CA_LEVEL_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_INTERFACE_ID} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR3_USE_TG_AVL_2} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_ABSTRACT_PHY} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_CAL_ADDR0} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_CAL_ADDR1} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_CAL_ENABLE_NON_DES} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_CAL_FULL_CAL_ON_RESET} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_INTERFACE_ID} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_SKIP_CA_DESKEW} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_SKIP_CA_LEVEL} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_SKIP_VREF_CAL} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_DDR4_USE_TG_AVL_2} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_ECLIPSE_DEBUG} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_ENABLE_HPS_EMIF_DEBUG} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_ENABLE_JTAG_UART} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_ENABLE_JTAG_UART_HEX} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_EXPORT_VJI} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_EXPOSE_DFT_SIGNALS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_EXTRA_CONFIGS} {}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_EXT_DOCS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_EX_DESIGN_ADD_TEST_EMIFS} {}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_EX_DESIGN_SEPARATE_RESETS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_FAST_SIM_OVERRIDE} {FAST_SIM_OVERRIDE_DEFAULT}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_ABSTRACT_PHY} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_INTERFACE_ID} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_SKIP_CA_DESKEW} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_SKIP_CA_LEVEL} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_LPDDR3_USE_TG_AVL_2} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_ABSTRACT_PHY} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_INTERFACE_ID} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR2_USE_TG_AVL_2} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_ABSTRACT_PHY} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_INTERFACE_ID} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_SKIP_VREF_CAL} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_QDR4_USE_TG_AVL_2} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_ABSTRACT_PHY} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_INTERFACE_ID} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD2_USE_TG_AVL_2} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_ABSTRACT_PHY} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_INTERFACE_ID} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RLD3_USE_TG_AVL_2} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_RS232_UART_BAUDRATE} {57600}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_SIM_REGTEST_MODE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_SOFT_NIOS_CLOCK_FREQUENCY} {100}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_SOFT_NIOS_MODE} {SOFT_NIOS_MODE_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_SYNTH_FOR_SIM} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_TG_AVL_2_EXPORT_CFG_INTERFACE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_TG_AVL_2_NUM_CFG_INTERFACES} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_TIMING_REGTEST_MODE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_USE_BOARD_DELAY_MODEL} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_USE_RS232_UART} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {DIAG_VERBOSE_IOAUX} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_DDR3_GEN_SIM} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_DDR3_GEN_SYNTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_DDR3_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_DDR3_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_DDR3_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_DDR3_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_DDR4_GEN_SIM} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_DDR4_GEN_SYNTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_DDR4_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_DDR4_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_DDR4_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_DDR4_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_LPDDR3_GEN_SIM} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_LPDDR3_GEN_SYNTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_LPDDR3_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_LPDDR3_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_LPDDR3_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_LPDDR3_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_QDR2_GEN_SIM} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_QDR2_GEN_SYNTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_QDR2_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_QDR2_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_QDR2_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_QDR2_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_QDR4_GEN_SIM} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_QDR4_GEN_SYNTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_QDR4_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_QDR4_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_QDR4_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_QDR4_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_RLD2_GEN_SIM} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_RLD2_GEN_SYNTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_RLD2_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_RLD2_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_RLD2_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_RLD2_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_RLD3_GEN_SIM} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_RLD3_GEN_SYNTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_RLD3_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_RLD3_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_RLD3_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value fpga_ddr4_cntrl {EX_DESIGN_GUI_RLD3_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value fpga_ddr4_cntrl {INTERNAL_TESTING_MODE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {IS_ED_SLAVE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_ALERT_N_DQS_GROUP} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_ALERT_N_PLACEMENT_ENUM} {DDR3_ALERT_N_PLACEMENT_AC_LANES}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_ASR_ENUM} {DDR3_ASR_MANUAL}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_ATCL_ENUM} {DDR3_ATCL_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_BANK_ADDR_WIDTH} {3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_BL_ENUM} {DDR3_BL_BL8}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_BT_ENUM} {DDR3_BT_SEQUENTIAL}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_CKE_PER_DIMM} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_CK_WIDTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_COL_ADDR_WIDTH} {10}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_DISCRETE_CS_WIDTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_DISCRETE_MIRROR_ADDRESSING_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_DLL_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_DM_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_DQ_PER_DQS} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_DQ_WIDTH} {72}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_DRV_STR_ENUM} {DDR3_DRV_STR_RZQ_7}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_FORMAT_ENUM} {MEM_FORMAT_UDIMM}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_HIDE_ADV_MR_SETTINGS} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_LRDIMM_EXTENDED_CONFIG} {000000000000000000}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_MIRROR_ADDRESSING_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_NUM_OF_DIMMS} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_PD_ENUM} {DDR3_PD_OFF}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_RANKS_PER_DIMM} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_RDIMM_CONFIG} {0000000000000000}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_ROW_ADDR_WIDTH} {15}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_RTT_NOM_ENUM} {DDR3_RTT_NOM_ODT_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_RTT_WR_ENUM} {DDR3_RTT_WR_RZQ_4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_R_ODT0_1X1} {off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_R_ODT0_2X2} {off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_R_ODT0_4X2} {off off on on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_R_ODT0_4X4} {off off off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_R_ODT1_2X2} {off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_R_ODT1_4X2} {on on off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_R_ODT1_4X4} {off off on on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_R_ODT2_4X4} {off off off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_R_ODT3_4X4} {on on off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_R_ODTN_1X1} {Rank\ 0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_R_ODTN_2X2} {Rank\ 0 Rank\ 1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_R_ODTN_4X2} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_R_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_SPEEDBIN_ENUM} {DDR3_SPEEDBIN_2133}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_SRT_ENUM} {DDR3_SRT_NORMAL}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TCL} {14}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TDH_DC_MV} {100}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TDH_PS} {55}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TDQSCK_PS} {180}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TDQSQ_PS} {75}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TDQSS_CYC} {0.27}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TDSH_CYC} {0.18}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TDSS_CYC} {0.18}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TDS_AC_MV} {135}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TDS_PS} {53}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TFAW_NS} {25.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TIH_DC_MV} {100}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TIH_PS} {95}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TINIT_US} {500}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TIS_AC_MV} {135}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TIS_PS} {60}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TMRD_CK_CYC} {4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TQH_CYC} {0.38}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TQSH_CYC} {0.4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TRAS_NS} {33.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TRCD_NS} {13.09}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TREFI_US} {7.8}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TRFC_NS} {160.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TRP_NS} {13.09}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TRRD_CYC} {6}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TRTP_CYC} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TWLH_PS} {125.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TWLS_PS} {125.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TWR_NS} {15.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_TWTR_CYC} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_USE_DEFAULT_ODT} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_WTCL} {10}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_W_ODT0_1X1} {on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_W_ODT0_2X2} {on off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_W_ODT0_4X2} {off off on on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_W_ODT0_4X4} {on on off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_W_ODT1_2X2} {off on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_W_ODT1_4X2} {on on off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_W_ODT1_4X4} {off off on on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_W_ODT2_4X4} {off off on on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_W_ODT3_4X4} {on on off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_W_ODTN_1X1} {Rank\ 0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_W_ODTN_2X2} {Rank\ 0 Rank\ 1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_W_ODTN_4X2} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR3_W_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_AC_PARITY_LATENCY} {DDR4_AC_PARITY_LATENCY_DISABLE}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_AC_PERSISTENT_ERROR} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_ALERT_N_AC_LANE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_ALERT_N_AC_PIN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_ALERT_N_DQS_GROUP} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_ALERT_N_PLACEMENT_ENUM} {DDR4_ALERT_N_PLACEMENT_AUTO}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_ALERT_PAR_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_ASR_ENUM} {DDR4_ASR_MANUAL_NORMAL}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_ATCL_ENUM} {DDR4_ATCL_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_BANK_ADDR_WIDTH} {2}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_BANK_GROUP_WIDTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_BL_ENUM} {DDR4_BL_BL8}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_BT_ENUM} {DDR4_BT_SEQUENTIAL}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_CAL_MODE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_CHIP_ID_WIDTH} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_CKE_PER_DIMM} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_CK_WIDTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_COL_ADDR_WIDTH} {10}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_DB_DQ_DRV_ENUM} {DDR4_DB_DRV_STR_RZQ_7}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_DB_RTT_NOM_ENUM} {DDR4_DB_RTT_NOM_ODT_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_DB_RTT_PARK_ENUM} {DDR4_DB_RTT_PARK_ODT_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_DB_RTT_WR_ENUM} {DDR4_DB_RTT_WR_RZQ_3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_DEFAULT_VREFOUT} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_DISCRETE_CS_WIDTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_DISCRETE_MIRROR_ADDRESSING_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_DLL_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_DM_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_DQ_PER_DQS} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_DQ_WIDTH} {64}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_DRV_STR_ENUM} {DDR4_DRV_STR_RZQ_7}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_FINE_GRANULARITY_REFRESH} {DDR4_FINE_REFRESH_FIXED_1X}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_FORMAT_ENUM} {MEM_FORMAT_DISCRETE}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_GEARDOWN} {DDR4_GEARDOWN_HR}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_HIDE_ADV_MR_SETTINGS} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_INTERNAL_VREFDQ_MONITOR} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_LRDIMM_ODT_LESS_BS} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_LRDIMM_ODT_LESS_BS_PARK_OHM} {240}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_LRDIMM_VREFDQ_VALUE} {1D}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_MAX_POWERDOWN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_MIRROR_ADDRESSING_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_MPR_READ_FORMAT} {DDR4_MPR_READ_FORMAT_SERIAL}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_NUM_OF_DIMMS} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_ODT_IN_POWERDOWN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_PER_DRAM_ADDR} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_RANKS_PER_DIMM} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_RCD_CA_IBT_ENUM} {DDR4_RCD_CA_IBT_100}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_RCD_CKE_IBT_ENUM} {DDR4_RCD_CKE_IBT_100}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_RCD_CS_IBT_ENUM} {DDR4_RCD_CS_IBT_100}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_RCD_ODT_IBT_ENUM} {DDR4_RCD_ODT_IBT_100}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_READ_DBI} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_READ_PREAMBLE} {2}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_READ_PREAMBLE_TRAINING} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_ROW_ADDR_WIDTH} {16}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_RTT_NOM_ENUM} {DDR4_RTT_NOM_RZQ_7}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_RTT_PARK} {DDR4_RTT_PARK_ODT_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_RTT_WR_ENUM} {DDR4_RTT_WR_ODT_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_R_ODT0_1X1} {off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_R_ODT0_2X2} {off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_R_ODT0_4X2} {off off on on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_R_ODT0_4X4} {off off off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_R_ODT1_2X2} {off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_R_ODT1_4X2} {on on off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_R_ODT1_4X4} {off off on on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_R_ODT2_4X4} {off off off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_R_ODT3_4X4} {on on off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_R_ODTN_1X1} {Rank\ 0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_R_ODTN_2X2} {Rank\ 0 Rank\ 1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_R_ODTN_4X2} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_R_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SELF_RFSH_ABORT} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_133_RCD_DB_VENDOR_LSB} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_134_RCD_DB_VENDOR_MSB} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_135_RCD_REV} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_137_RCD_CA_DRV} {101}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_138_RCD_CK_DRV} {5}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_139_DB_REV} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_140_DRAM_VREFDQ_R0} {29}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_141_DRAM_VREFDQ_R1} {29}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_142_DRAM_VREFDQ_R2} {29}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_143_DRAM_VREFDQ_R3} {29}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_144_DB_VREFDQ} {37}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_145_DB_MDQ_DRV} {21}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_148_DRAM_DRV} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_149_DRAM_RTT_WR_NOM} {20}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPD_152_DRAM_RTT_PARK} {39}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_SPEEDBIN_ENUM} {DDR4_SPEEDBIN_2400}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TCCD_L_CYC} {4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TCCD_S_CYC} {4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TCL} {12}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TDIVW_DJ_CYC} {0.1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TDIVW_TOTAL_UI} {0.2}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TDQSCK_PS} {175}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TDQSQ_PS} {66}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TDQSQ_UI} {0.17}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TDQSS_CYC} {0.27}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TDSH_CYC} {0.18}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TDSS_CYC} {0.18}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TDVWP_UI} {0.72}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TEMP_CONTROLLED_RFSH_ENA} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TEMP_CONTROLLED_RFSH_RANGE} {DDR4_TEMP_CONTROLLED_RFSH_NORMAL}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TEMP_SENSOR_READOUT} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TFAW_NS} {30.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TIH_DC_MV} {75}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TIH_PS} {87}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TINIT_US} {500}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TIS_AC_MV} {100}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TIS_PS} {62}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TMRD_CK_CYC} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TQH_CYC} {0.38}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TQH_UI} {0.74}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TQSH_CYC} {0.4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TRAS_NS} {32.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TRCD_NS} {13.32}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TREFI_US} {7.8}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TRFC_NS} {260.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TRP_NS} {13.32}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TRRD_L_CYC} {4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TRRD_S_CYC} {4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TWLH_PS} {108.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TWLS_PS} {108.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TWR_NS} {15.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TWTR_L_CYC} {4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_TWTR_S_CYC} {2}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_USER_VREFDQ_TRAINING_RANGE} {DDR4_VREFDQ_TRAINING_RANGE_1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_USER_VREFDQ_TRAINING_VALUE} {56.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_USE_DEFAULT_ODT} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_VDIVW_TOTAL} {130}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_WRITE_CRC} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_WRITE_DBI} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_WRITE_PREAMBLE} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_WTCL} {12}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_W_ODT0_1X1} {on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_W_ODT0_2X2} {on off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_W_ODT0_4X2} {off off on on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_W_ODT0_4X4} {on on off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_W_ODT1_2X2} {off on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_W_ODT1_4X2} {on on off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_W_ODT1_4X4} {off off on on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_W_ODT2_4X4} {off off on on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_W_ODT3_4X4} {on on off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_W_ODTN_1X1} {Rank\ 0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_W_ODTN_2X2} {Rank\ 0 Rank\ 1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_W_ODTN_4X2} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_DDR4_W_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_BANK_ADDR_WIDTH} {3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_BL} {LPDDR3_BL_BL8}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_CK_WIDTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_COL_ADDR_WIDTH} {10}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_DATA_LATENCY} {LPDDR3_DL_RL12_WL6}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_DISCRETE_CS_WIDTH} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_DM_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_DQODT} {LPDDR3_DQODT_DISABLE}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_DQ_WIDTH} {32}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_DRV_STR} {LPDDR3_DRV_STR_40D_40U}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_PDODT} {LPDDR3_PDODT_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_ROW_ADDR_WIDTH} {15}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_R_ODT0_1X1} {off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_R_ODT0_2X2} {off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_R_ODT0_4X4} {off off off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_R_ODT1_2X2} {off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_R_ODT1_4X4} {off off off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_R_ODT2_4X4} {off off off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_R_ODT3_4X4} {off off off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_R_ODTN_1X1} {Rank\ 0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_R_ODTN_2X2} {Rank\ 0 Rank\ 1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_R_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_SPEEDBIN_ENUM} {LPDDR3_SPEEDBIN_1600}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TDH_DC_MV} {100}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TDH_PS} {100}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TDQSCKDL} {614}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TDQSQ_PS} {135}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TDQSS_CYC} {1.25}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TDSH_CYC} {0.2}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TDSS_CYC} {0.2}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TDS_AC_MV} {150}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TDS_PS} {75}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TFAW_NS} {50.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TIH_DC_MV} {100}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TIH_PS} {100}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TINIT_US} {500}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TIS_AC_MV} {150}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TIS_PS} {75}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TMRR_CK_CYC} {4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TMRW_CK_CYC} {10}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TQH_CYC} {0.38}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TQSH_CYC} {0.38}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TRAS_NS} {42.5}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TRCD_NS} {18.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TREFI_US} {3.9}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TRFC_NS} {210.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TRP_NS} {18.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TRRD_CYC} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TRTP_CYC} {6}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TWLH_PS} {175.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TWLS_PS} {175.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TWR_NS} {15.0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_TWTR_CYC} {6}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_USE_DEFAULT_ODT} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_W_ODT0_1X1} {on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_W_ODT0_2X2} {on on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_W_ODT0_4X4} {on on on on}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_W_ODT1_2X2} {off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_W_ODT1_4X4} {off off off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_W_ODT2_4X4} {off off off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_W_ODT3_4X4} {off off off off}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_W_ODTN_1X1} {Rank\ 0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_W_ODTN_2X2} {Rank\ 0 Rank\ 1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_LPDDR3_W_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_ADDR_WIDTH} {19}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_BL} {4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_BWS_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_DATA_PER_DEVICE} {36}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_INTERNAL_JITTER_NS} {0.08}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_SPEEDBIN_ENUM} {QDR2_SPEEDBIN_633}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_TCCQO_NS} {0.45}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_TCQDOH_NS} {-0.09}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_TCQD_NS} {0.09}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_TCQH_NS} {0.71}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_THA_NS} {0.18}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_THD_NS} {0.18}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_TRL_CYC} {2.5}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_TSA_NS} {0.23}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_TSD_NS} {0.23}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR2_WIDTH_EXPANDED} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_AC_ODT_MODE_ENUM} {QDR4_ODT_25_PCT}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_ADDR_INV_ENA} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_ADDR_WIDTH} {21}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_CK_ODT_MODE_ENUM} {QDR4_ODT_25_PCT}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_DATA_INV_ENA} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_DATA_ODT_MODE_ENUM} {QDR4_ODT_25_PCT}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_DQ_PER_PORT_PER_DEVICE} {36}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_PD_OUTPUT_DRIVE_MODE_ENUM} {QDR4_OUTPUT_DRIVE_25_PCT}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_PU_OUTPUT_DRIVE_MODE_ENUM} {QDR4_OUTPUT_DRIVE_25_PCT}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_SPEEDBIN_ENUM} {QDR4_SPEEDBIN_2133}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_TASH_PS} {170}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_TCKDK_MAX_PS} {150}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_TCKDK_MIN_PS} {-150}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_TCKQK_MAX_PS} {225}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_TCSH_PS} {170}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_TISH_PS} {150}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_TQH_CYC} {0.4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_TQKQ_MAX_PS} {75}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_QDR4_WIDTH_EXPANDED} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_ADDR_WIDTH} {21}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_BANK_ADDR_WIDTH} {3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_BL} {4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_CONFIG_ENUM} {RLD2_CONFIG_TRC_8_TRL_8_TWL_9}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_DM_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_DQ_PER_DEVICE} {9}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_DRIVE_IMPEDENCE_ENUM} {RLD2_DRIVE_IMPEDENCE_INTERNAL_50}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_ODT_MODE_ENUM} {RLD2_ODT_ON}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_REFRESH_INTERVAL_US} {0.24}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_SPEEDBIN_ENUM} {RLD2_SPEEDBIN_18}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_TAH_NS} {0.3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_TAS_NS} {0.3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_TCKDK_MAX_NS} {0.3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_TCKDK_MIN_NS} {-0.3}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_TCKH_CYC} {0.45}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_TCKQK_MAX_NS} {0.2}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_TDH_NS} {0.17}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_TDS_NS} {0.17}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_TQKH_HCYC} {0.9}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_TQKQ_MAX_NS} {0.12}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_TQKQ_MIN_NS} {-0.12}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD2_WIDTH_EXPANDED} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_ADDR_WIDTH} {20}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_AREF_PROTOCOL_ENUM} {RLD3_AREF_BAC}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_BANK_ADDR_WIDTH} {4}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_BL} {2}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_DATA_LATENCY_MODE_ENUM} {RLD3_DL_RL16_WL17}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_DEPTH_EXPANDED} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_DM_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_DQ_PER_DEVICE} {36}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_ODT_MODE_ENUM} {RLD3_ODT_40}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_OUTPUT_DRIVE_MODE_ENUM} {RLD3_OUTPUT_DRIVE_40}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_SPEEDBIN_ENUM} {RLD3_SPEEDBIN_093E}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_TCKDK_MAX_CYC} {0.27}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_TCKDK_MIN_CYC} {-0.27}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_TCKQK_MAX_PS} {135}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_TDH_DC_MV} {100}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_TDH_PS} {5}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_TDS_AC_MV} {150}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_TDS_PS} {-30}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_TIH_DC_MV} {100}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_TIH_PS} {65}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_TIS_AC_MV} {150}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_TIS_PS} {85}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_TQH_CYC} {0.38}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_TQKQ_MAX_PS} {75}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_T_RC_MODE_ENUM} {RLD3_TRC_9}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_WIDTH_EXPANDED} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {MEM_RLD3_WRITE_PROTOCOL_ENUM} {RLD3_WRITE_1BANK}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_CAL_ADDR0} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_CAL_ADDR1} {8}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_CAL_ENABLE_NON_DES} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_CONFIG_ENUM} {CONFIG_PHY_AND_HARD_CTRL}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_DEFAULT_IO} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_IO_VOLTAGE} {1.5}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_MEM_CLK_FREQ_MHZ} {1066.667}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_RATE_ENUM} {RATE_QUARTER}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_AC_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_AC_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_CK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_CK_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_DATA_IN_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_DATA_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_DATA_OUT_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_PING_PONG_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_PLL_REF_CLK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_REF_CLK_FREQ_MHZ} {-1.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_RZQ_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR3_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_CONFIG_ENUM} {CONFIG_PHY_AND_HARD_CTRL}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_DEFAULT_IO} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_IO_VOLTAGE} {1.2}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_MEM_CLK_FREQ_MHZ} {1067.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_RATE_ENUM} {RATE_QUARTER}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_AC_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_AC_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_CK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_CK_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_DATA_IN_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_DATA_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_DATA_OUT_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_PING_PONG_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_PLL_REF_CLK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_REF_CLK_FREQ_MHZ} {266.75}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_RZQ_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_DDR4_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_CONFIG_ENUM} {CONFIG_PHY_AND_HARD_CTRL}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_DEFAULT_IO} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_IO_VOLTAGE} {1.2}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_MEM_CLK_FREQ_MHZ} {800.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_RATE_ENUM} {RATE_QUARTER}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_AC_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_AC_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_CK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_CK_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_DATA_IN_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_DATA_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_DATA_OUT_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_PING_PONG_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_PLL_REF_CLK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_REF_CLK_FREQ_MHZ} {-1.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_RZQ_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_LPDDR3_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_CONFIG_ENUM} {CONFIG_PHY_AND_SOFT_CTRL}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_DEFAULT_IO} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_IO_VOLTAGE} {1.5}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_MEM_CLK_FREQ_MHZ} {633.333}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_RATE_ENUM} {RATE_HALF}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_AC_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_AC_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_CK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_CK_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_DATA_IN_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_DATA_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_DATA_OUT_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_PING_PONG_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_PLL_REF_CLK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_REF_CLK_FREQ_MHZ} {-1.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_RZQ_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR2_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_CONFIG_ENUM} {CONFIG_PHY_AND_SOFT_CTRL}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_DEFAULT_IO} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_IO_VOLTAGE} {1.2}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_MEM_CLK_FREQ_MHZ} {1066.667}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_RATE_ENUM} {RATE_QUARTER}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_AC_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_AC_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_CK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_CK_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_DATA_IN_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_DATA_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_DATA_OUT_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_PING_PONG_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_PLL_REF_CLK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_REF_CLK_FREQ_MHZ} {-1.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_RZQ_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_QDR4_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_CONFIG_ENUM} {CONFIG_PHY_AND_SOFT_CTRL}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_DEFAULT_IO} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_IO_VOLTAGE} {1.8}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_MEM_CLK_FREQ_MHZ} {533.333}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_RATE_ENUM} {RATE_HALF}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_AC_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_AC_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_CK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_CK_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_DATA_IN_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_DATA_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_DATA_OUT_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_PING_PONG_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_PLL_REF_CLK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_REF_CLK_FREQ_MHZ} {-1.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_RZQ_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD2_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_CONFIG_ENUM} {CONFIG_PHY_ONLY}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_DEFAULT_IO} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_IO_VOLTAGE} {1.2}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_MEM_CLK_FREQ_MHZ} {1066.667}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_RATE_ENUM} {RATE_QUARTER}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_AC_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_AC_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_CK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_CK_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_DATA_IN_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_DATA_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_DATA_OUT_MODE_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_PING_PONG_EN} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_PLL_REF_CLK_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_REF_CLK_FREQ_MHZ} {-1.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_RZQ_IO_STD_ENUM} {unset}
    set_instance_parameter_value fpga_ddr4_cntrl {PHY_RLD3_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_ADD_EXTRA_CLKS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_5} {50.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_6} {50.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_7} {50.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_8} {50.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_5} {100.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_6} {100.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_7} {100.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_8} {100.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_5} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_6} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_7} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_8} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_5} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_6} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_7} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_8} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_5} {50.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_6} {50.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_7} {50.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_8} {50.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_5} {100.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_6} {100.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_7} {100.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_8} {100.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_PHASE_GUI_5} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_PHASE_GUI_6} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_PHASE_GUI_7} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_PHASE_GUI_8} {0.0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_0} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_1} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_2} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_3} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_4} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_5} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_6} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_7} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_8} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PLL_USER_NUM_OF_EXTRA_CLKS} {0}
    set_instance_parameter_value fpga_ddr4_cntrl {PROTOCOL_ENUM} {PROTOCOL_DDR4}
    set_instance_parameter_value fpga_ddr4_cntrl {SHORT_QSYS_INTERFACE_NAMES} {0}

    add_instance sys_clk clock_source 18.0
    set_instance_parameter_value sys_clk {clockFrequency} {100000000.0}
    set_instance_parameter_value sys_clk {clockFrequencyKnown} {1}
    set_instance_parameter_value sys_clk {resetSynchronousEdges} {NONE}

    add_instance sys_dma_clk clock_source 18.0
    set_instance_parameter_value sys_dma_clk {clockFrequency} {50000000.0}
    set_instance_parameter_value sys_dma_clk {clockFrequencyKnown} {1}
    set_instance_parameter_value sys_dma_clk {resetSynchronousEdges} {NONE}

    add_instance sys_gpio_in altera_avalon_pio 18.0
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

    add_instance sys_gpio_out altera_avalon_pio 18.0
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

    add_instance sys_hps altera_arria10_hps 18.0
    set_instance_parameter_value sys_hps {BOOT_FROM_FPGA_Enable} {0}
    set_instance_parameter_value sys_hps {BSEL} {1}
    set_instance_parameter_value sys_hps {BSEL_EN} {0}
    set_instance_parameter_value sys_hps {CLK_EMACA_SOURCE} {1}
    set_instance_parameter_value sys_hps {CLK_EMACB_SOURCE} {1}
    set_instance_parameter_value sys_hps {CLK_EMAC_PTP_SOURCE} {1}
    set_instance_parameter_value sys_hps {CLK_GPIO_SOURCE} {1}
    set_instance_parameter_value sys_hps {CLK_HMC_PLL_SOURCE} {0}
    set_instance_parameter_value sys_hps {CLK_MAIN_PLL_SOURCE2} {0}
    set_instance_parameter_value sys_hps {CLK_MPU_CNT} {0}
    set_instance_parameter_value sys_hps {CLK_MPU_SOURCE} {0}
    set_instance_parameter_value sys_hps {CLK_NOC_CNT} {0}
    set_instance_parameter_value sys_hps {CLK_NOC_SOURCE} {0}
    set_instance_parameter_value sys_hps {CLK_PERI_PLL_SOURCE2} {0}
    set_instance_parameter_value sys_hps {CLK_S2F_USER0_SOURCE} {0}
    set_instance_parameter_value sys_hps {CLK_S2F_USER1_SOURCE} {0}
    set_instance_parameter_value sys_hps {CLK_SDMMC_SOURCE} {1}
    set_instance_parameter_value sys_hps {CM_Mode} {N/A}
    set_instance_parameter_value sys_hps {CM_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {CTI_Enable} {0}
    set_instance_parameter_value sys_hps {CUSTOM_MPU_CLK} {800}
    set_instance_parameter_value sys_hps {DEBUG_APB_Enable} {0}
    set_instance_parameter_value sys_hps {DISABLE_PERI_PLL} {0}
    set_instance_parameter_value sys_hps {DMA_Enable} {No No No No No No No No}
    set_instance_parameter_value sys_hps {EMAC0_CLK} {250}
    set_instance_parameter_value sys_hps {EMAC0_Mode} {N/A}
    set_instance_parameter_value sys_hps {EMAC0_PTP} {0}
    set_instance_parameter_value sys_hps {EMAC0_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {EMAC0_SWITCH_Enable} {0}
    set_instance_parameter_value sys_hps {EMAC1_CLK} {250}
    set_instance_parameter_value sys_hps {EMAC1_Mode} {RGMII}
    set_instance_parameter_value sys_hps {EMAC1_PTP} {0}
    set_instance_parameter_value sys_hps {EMAC1_PinMuxing} {IO}
    set_instance_parameter_value sys_hps {EMAC1_SWITCH_Enable} {0}
    set_instance_parameter_value sys_hps {EMAC2_CLK} {250}
    set_instance_parameter_value sys_hps {EMAC2_Mode} {N/A}
    set_instance_parameter_value sys_hps {EMAC2_PTP} {0}
    set_instance_parameter_value sys_hps {EMAC2_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {EMAC2_SWITCH_Enable} {0}
    set_instance_parameter_value sys_hps {EMAC_PTP_REF_CLK} {100}
    set_instance_parameter_value sys_hps {EMIF_BYPASS_CHECK} {0}
    set_instance_parameter_value sys_hps {EMIF_CONDUIT_Enable} {1}
    set_instance_parameter_value sys_hps {F2H_COLD_RST_Enable} {1}
    set_instance_parameter_value sys_hps {F2H_DBG_RST_Enable} {0}
    set_instance_parameter_value sys_hps {F2H_FREE_CLK_Enable} {0}
    set_instance_parameter_value sys_hps {F2H_FREE_CLK_FREQ} {200}
    set_instance_parameter_value sys_hps {F2H_WARM_RST_Enable} {0}
    set_instance_parameter_value sys_hps {F2SDRAM0_ENABLED} {1}
    set_instance_parameter_value sys_hps {F2SDRAM1_ENABLED} {0}
    set_instance_parameter_value sys_hps {F2SDRAM2_DELAY} {4}
    set_instance_parameter_value sys_hps {F2SDRAM2_ENABLED} {0}
    set_instance_parameter_value sys_hps {F2SDRAM_ADDRESS_WIDTH} {32}
    set_instance_parameter_value sys_hps {F2SDRAM_PORT_CONFIG} {6}
    set_instance_parameter_value sys_hps {F2SDRAM_READY_LATENCY} {1}
    set_instance_parameter_value sys_hps {F2SINTERRUPT_Enable} {1}
    set_instance_parameter_value sys_hps {F2S_Width} {0}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC0_GTX_CLK} {100}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC0_MD_CLK} {2.5}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC1_GTX_CLK} {100}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC1_MD_CLK} {2.5}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC2_GTX_CLK} {100}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC2_MD_CLK} {2.5}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_I2C0_CLK} {100}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_I2C1_CLK} {100}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_I2CEMAC0_CLK} {100}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_I2CEMAC1_CLK} {100}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_I2CEMAC2_CLK} {100}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_QSPI_SCLK_OUT} {100}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_SDMMC_CCLK} {100}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_SPIM0_SCLK_OUT} {100}
    set_instance_parameter_value sys_hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_SPIM1_SCLK_OUT} {100}
    set_instance_parameter_value sys_hps {GPIO_REF_CLK} {4}
    set_instance_parameter_value sys_hps {GP_Enable} {0}
    set_instance_parameter_value sys_hps {H2F_COLD_RST_Enable} {0}
    set_instance_parameter_value sys_hps {H2F_PENDING_RST_Enable} {0}
    set_instance_parameter_value sys_hps {H2F_USER0_CLK_Enable} {1}
    set_instance_parameter_value sys_hps {H2F_USER0_CLK_FREQ} {175}
    set_instance_parameter_value sys_hps {H2F_USER1_CLK_Enable} {0}
    set_instance_parameter_value sys_hps {H2F_USER1_CLK_FREQ} {400}
    set_instance_parameter_value sys_hps {HMC_PLL_REF_CLK} {800}
    set_instance_parameter_value sys_hps {HPS_DIV_GPIO_FREQ} {125}
    set_instance_parameter_value sys_hps {HPS_IO_Enable} {SDMMC:D0 SDMMC:CMD SDMMC:CCLK SDMMC:D1 SDMMC:D2 SDMMC:D3 NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE UART0:TX UART0:RX I2C0:SDA I2C0:SCL UART1:TX UART1:RX NONE NONE NONE NONE USB1:CLK USB1:STP USB1:DIR USB1:DATA0 USB1:DATA1 USB1:NXT USB1:DATA2 USB1:DATA3 USB1:DATA4 USB1:DATA5 USB1:DATA6 USB1:DATA7 EMAC1:TX_CLK EMAC1:TX_CTL EMAC1:RX_CLK EMAC1:RX_CTL EMAC1:TXD0 EMAC1:TXD1 EMAC1:RXD0 EMAC1:RXD1 EMAC1:TXD2 EMAC1:TXD3 EMAC1:RXD2 EMAC1:RXD3 I2C1:SDA I2C1:SCL NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE}
    set_instance_parameter_value sys_hps {I2C0_Mode} {default}
    set_instance_parameter_value sys_hps {I2C0_PinMuxing} {IO}
    set_instance_parameter_value sys_hps {I2C1_Mode} {default}
    set_instance_parameter_value sys_hps {I2C1_PinMuxing} {IO}
    set_instance_parameter_value sys_hps {I2CEMAC0_Mode} {N/A}
    set_instance_parameter_value sys_hps {I2CEMAC0_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {I2CEMAC1_Mode} {N/A}
    set_instance_parameter_value sys_hps {I2CEMAC1_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {I2CEMAC2_Mode} {N/A}
    set_instance_parameter_value sys_hps {I2CEMAC2_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {INTERNAL_OSCILLATOR_ENABLE} {60}
    set_instance_parameter_value sys_hps {JTAG_Enable} {0}
    set_instance_parameter_value sys_hps {L3_MAIN_FREE_CLK} {400}
    set_instance_parameter_value sys_hps {L4_SYS_FREE_CLK} {1}
    set_instance_parameter_value sys_hps {LWH2F_Enable} {1}
    set_instance_parameter_value sys_hps {MPU_CLK_VCCL} {0}
    set_instance_parameter_value sys_hps {MPU_EVENTS_Enable} {0}
    set_instance_parameter_value sys_hps {NAND_Mode} {N/A}
    set_instance_parameter_value sys_hps {NAND_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {NOCDIV_CS_ATCLK} {0}
    set_instance_parameter_value sys_hps {NOCDIV_CS_PDBGCLK} {1}
    set_instance_parameter_value sys_hps {NOCDIV_CS_TRACECLK} {0}
    set_instance_parameter_value sys_hps {NOCDIV_L4MAINCLK} {0}
    set_instance_parameter_value sys_hps {NOCDIV_L4MPCLK} {1}
    set_instance_parameter_value sys_hps {NOCDIV_L4SPCLK} {2}
    set_instance_parameter_value sys_hps {OVERIDE_PERI_PLL} {0}
    set_instance_parameter_value sys_hps {PERI_PLL_MANUAL_VCO_FREQ} {2000}
    set_instance_parameter_value sys_hps {PLL_CLK0} {Unused}
    set_instance_parameter_value sys_hps {PLL_CLK1} {Unused}
    set_instance_parameter_value sys_hps {PLL_CLK2} {Unused}
    set_instance_parameter_value sys_hps {PLL_CLK3} {Unused}
    set_instance_parameter_value sys_hps {PLL_CLK4} {Unused}
    set_instance_parameter_value sys_hps {QSPI_Mode} {N/A}
    set_instance_parameter_value sys_hps {QSPI_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {RUN_INTERNAL_BUILD_CHECKS} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_CLOCKPERIPHERAL_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_CTI_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_DMA_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_EMAC0_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_EMAC1_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_EMAC2_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_FPGAMANAGER_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_GPIO_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_HMC_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_I2C0_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_I2C1_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_I2CEMAC0_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_I2CEMAC1_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_I2CEMAC2_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_L4TIMER_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_NAND_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_QSPI_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_SDMMC_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_SPIM0_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_SPIM1_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_SPIS0_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_SPIS1_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_SYSTEMMANAGER_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_SYSTIMER_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_UART0_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_UART1_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_USB0_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_USB1_Enable} {0}
    set_instance_parameter_value sys_hps {S2FINTERRUPT_WATCHDOG_Enable} {0}
    set_instance_parameter_value sys_hps {S2F_Width} {0}
    set_instance_parameter_value sys_hps {SDMMC_Mode} {4-bit}
    set_instance_parameter_value sys_hps {SDMMC_PinMuxing} {IO}
    set_instance_parameter_value sys_hps {SDMMC_REF_CLK} {200}
    set_instance_parameter_value sys_hps {SECURITY_MODULE_Enable} {0}
    set_instance_parameter_value sys_hps {SPIM0_Mode} {N/A}
    set_instance_parameter_value sys_hps {SPIM0_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {SPIM1_Mode} {N/A}
    set_instance_parameter_value sys_hps {SPIM1_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {SPIS0_Mode} {N/A}
    set_instance_parameter_value sys_hps {SPIS0_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {SPIS1_Mode} {N/A}
    set_instance_parameter_value sys_hps {SPIS1_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {STM_Enable} {0}
    set_instance_parameter_value sys_hps {TESTIOCTRL_DEBUGCLKSEL} {16}
    set_instance_parameter_value sys_hps {TESTIOCTRL_MAINCLKSEL} {8}
    set_instance_parameter_value sys_hps {TESTIOCTRL_PERICLKSEL} {8}
    set_instance_parameter_value sys_hps {TEST_Enable} {0}
    set_instance_parameter_value sys_hps {TRACE_Mode} {N/A}
    set_instance_parameter_value sys_hps {TRACE_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {UART0_Mode} {No_flow_control}
    set_instance_parameter_value sys_hps {UART0_PinMuxing} {IO}
    set_instance_parameter_value sys_hps {UART1_Mode} {No_flow_control}
    set_instance_parameter_value sys_hps {UART1_PinMuxing} {IO}
    set_instance_parameter_value sys_hps {USB0_Mode} {N/A}
    set_instance_parameter_value sys_hps {USB0_PinMuxing} {Unused}
    set_instance_parameter_value sys_hps {USB1_Mode} {default}
    set_instance_parameter_value sys_hps {USB1_PinMuxing} {IO}
    set_instance_parameter_value sys_hps {USE_DEFAULT_MPU_CLK} {0}
    set_instance_parameter_value sys_hps {eosc1_clk_mhz} {25.0}

    add_instance sys_hps_ddr4_cntrl altera_emif_a10_hps 18.0
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_AC_TO_CK_SKEW_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_BRD_SKEW_WITHIN_DQS_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_DQS_TO_CK_SKEW_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_IS_SKEW_WITHIN_AC_DESKEWED} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_IS_SKEW_WITHIN_DQS_DESKEWED} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_MAX_CK_DELAY_NS} {0.6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_MAX_DQS_DELAY_NS} {0.6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_PKG_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_PKG_BRD_SKEW_WITHIN_DQS_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_SKEW_BETWEEN_DIMMS_NS} {0.05}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_SKEW_BETWEEN_DQS_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_USER_AC_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_USER_AC_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_USER_CK_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_USER_RCLK_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_USER_RCLK_SLEW_RATE} {5.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_USER_RDATA_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_USER_RDATA_SLEW_RATE} {2.5}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_USER_WCLK_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_USER_WCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_USER_WDATA_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_USER_WDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_USE_DEFAULT_ISI_VALUES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR3_USE_DEFAULT_SLEW_RATES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_AC_TO_CK_SKEW_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_BRD_SKEW_WITHIN_DQS_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_DQS_TO_CK_SKEW_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_IS_SKEW_WITHIN_AC_DESKEWED} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_IS_SKEW_WITHIN_DQS_DESKEWED} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_MAX_CK_DELAY_NS} {0.6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_MAX_DQS_DELAY_NS} {0.6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_PKG_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_PKG_BRD_SKEW_WITHIN_DQS_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_SKEW_BETWEEN_DIMMS_NS} {0.05}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_SKEW_BETWEEN_DQS_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_USER_AC_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_USER_AC_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_USER_CK_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_USER_RCLK_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_USER_RCLK_SLEW_RATE} {8.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_USER_RDATA_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_USER_RDATA_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_USER_WCLK_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_USER_WCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_USER_WDATA_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_USER_WDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_USE_DEFAULT_ISI_VALUES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_DDR4_USE_DEFAULT_SLEW_RATES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_AC_TO_CK_SKEW_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_BRD_SKEW_WITHIN_DQS_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_DQS_TO_CK_SKEW_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_IS_SKEW_WITHIN_AC_DESKEWED} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_IS_SKEW_WITHIN_DQS_DESKEWED} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_MAX_CK_DELAY_NS} {0.6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_MAX_DQS_DELAY_NS} {0.6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_PKG_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_PKG_BRD_SKEW_WITHIN_DQS_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_SKEW_BETWEEN_DIMMS_NS} {0.05}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_SKEW_BETWEEN_DQS_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_USER_AC_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_USER_AC_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_USER_CK_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_USER_RCLK_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_USER_RCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_USER_RDATA_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_USER_RDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_USER_WCLK_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_USER_WCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_USER_WDATA_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_USER_WDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_USE_DEFAULT_ISI_VALUES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_LPDDR3_USE_DEFAULT_SLEW_RATES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_AC_TO_K_SKEW_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_BRD_SKEW_WITHIN_D_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_BRD_SKEW_WITHIN_Q_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_IS_SKEW_WITHIN_AC_DESKEWED} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_IS_SKEW_WITHIN_D_DESKEWED} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_IS_SKEW_WITHIN_Q_DESKEWED} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_MAX_K_DELAY_NS} {0.6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_PKG_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_PKG_BRD_SKEW_WITHIN_D_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_PKG_BRD_SKEW_WITHIN_Q_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_USER_AC_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_USER_AC_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_USER_K_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_USER_RCLK_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_USER_RCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_USER_RDATA_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_USER_RDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_USER_WCLK_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_USER_WDATA_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_USER_WDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_USE_DEFAULT_ISI_VALUES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR2_USE_DEFAULT_SLEW_RATES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_AC_TO_CK_SKEW_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_BRD_SKEW_WITHIN_QK_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_DK_TO_CK_SKEW_NS} {-0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_IS_SKEW_WITHIN_AC_DESKEWED} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_IS_SKEW_WITHIN_QK_DESKEWED} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_MAX_CK_DELAY_NS} {0.6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_MAX_DK_DELAY_NS} {0.6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_PKG_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_PKG_BRD_SKEW_WITHIN_QK_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_SKEW_BETWEEN_DIMMS_NS} {0.05}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_SKEW_BETWEEN_DK_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_USER_AC_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_USER_AC_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_USER_CK_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_USER_RCLK_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_USER_RCLK_SLEW_RATE} {5.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_USER_RDATA_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_USER_RDATA_SLEW_RATE} {2.5}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_USER_WCLK_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_USER_WCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_USER_WDATA_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_USER_WDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_USE_DEFAULT_ISI_VALUES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_QDR4_USE_DEFAULT_SLEW_RATES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_AC_TO_CK_SKEW_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_BRD_SKEW_WITHIN_QK_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_DK_TO_CK_SKEW_NS} {-0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_IS_SKEW_WITHIN_AC_DESKEWED} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_IS_SKEW_WITHIN_QK_DESKEWED} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_MAX_CK_DELAY_NS} {0.6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_MAX_DK_DELAY_NS} {0.6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_PKG_BRD_SKEW_WITHIN_AC_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_PKG_BRD_SKEW_WITHIN_QK_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_SKEW_BETWEEN_DIMMS_NS} {0.05}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_SKEW_BETWEEN_DK_NS} {0.02}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_USER_AC_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_USER_AC_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_USER_CK_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_USER_RCLK_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_USER_RCLK_SLEW_RATE} {7.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_USER_RDATA_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_USER_RDATA_SLEW_RATE} {3.5}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_USER_WCLK_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_USER_WCLK_SLEW_RATE} {4.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_USER_WDATA_ISI_NS} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_USER_WDATA_SLEW_RATE} {2.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_USE_DEFAULT_ISI_VALUES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {BOARD_RLD3_USE_DEFAULT_SLEW_RATES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_ADDR_ORDER_ENUM} {DDR3_CTRL_ADDR_ORDER_CS_R_B_C}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_AUTO_POWER_DOWN_CYCS} {32}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_AUTO_POWER_DOWN_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_AUTO_PRECHARGE_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_ST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_ECC_AUTO_CORRECTION_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_ECC_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_MMR_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_RD_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_RD_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_RD_TO_WR_SAME_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_REORDER_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_SELF_REFRESH_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_STARVE_LIMIT} {10}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_USER_PRIORITY_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_USER_REFRESH_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_WR_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_WR_TO_RD_SAME_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR3_WR_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_ADDR_ORDER_ENUM} {DDR4_CTRL_ADDR_ORDER_CS_R_B_C_BG}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_AUTO_POWER_DOWN_CYCS} {32}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_AUTO_POWER_DOWN_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_AUTO_PRECHARGE_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_ST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_ECC_AUTO_CORRECTION_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_ECC_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_MMR_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_RD_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_RD_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_RD_TO_WR_SAME_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_REORDER_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_SELF_REFRESH_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_STARVE_LIMIT} {10}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_USER_PRIORITY_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_USER_REFRESH_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_WR_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_WR_TO_RD_SAME_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_WR_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_ADDR_ORDER_ENUM} {LPDDR3_CTRL_ADDR_ORDER_CS_R_B_C}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_AUTO_POWER_DOWN_CYCS} {32}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_AUTO_POWER_DOWN_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_AUTO_PRECHARGE_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_ST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_MMR_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_RD_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_RD_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_RD_TO_WR_SAME_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_REORDER_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_SELF_REFRESH_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_STARVE_LIMIT} {10}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_USER_PRIORITY_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_USER_REFRESH_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_WR_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_WR_TO_RD_SAME_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_LPDDR3_WR_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_QDR2_AVL_ENABLE_POWER_OF_TWO_BUS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_QDR2_AVL_MAX_BURST_COUNT} {4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_QDR2_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_MM}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_QDR4_ADD_RAW_TURNAROUND_DELAY_CYC} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_QDR4_ADD_WAR_TURNAROUND_DELAY_CYC} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_QDR4_AVL_ENABLE_POWER_OF_TWO_BUS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_QDR4_AVL_MAX_BURST_COUNT} {4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_QDR4_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_MM}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_RLD2_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_MM}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_RLD3_ADDR_ORDER_ENUM} {RLD3_CTRL_ADDR_ORDER_CS_R_B_C}
    set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_RLD3_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_MM}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_BOARD_DELAY_CONFIG_STR} {}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_ABSTRACT_PHY} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_CAL_ADDR0} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_CAL_ADDR1} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_CAL_ENABLE_NON_DES} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_CAL_FULL_CAL_ON_RESET} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_CA_LEVEL_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_INTERFACE_ID} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR3_USE_TG_AVL_2} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_ABSTRACT_PHY} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_CAL_ADDR0} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_CAL_ADDR1} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_CAL_ENABLE_NON_DES} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_CAL_FULL_CAL_ON_RESET} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_INTERFACE_ID} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_SKIP_CA_DESKEW} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_SKIP_CA_LEVEL} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_SKIP_VREF_CAL} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_USE_TG_AVL_2} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_ECLIPSE_DEBUG} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_ENABLE_HPS_EMIF_DEBUG} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_ENABLE_JTAG_UART} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_ENABLE_JTAG_UART_HEX} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_EXPORT_VJI} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_EXPOSE_DFT_SIGNALS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_EXTRA_CONFIGS} {}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_EXT_DOCS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_EX_DESIGN_ADD_TEST_EMIFS} {}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_EX_DESIGN_SEPARATE_RESETS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_FAST_SIM_OVERRIDE} {FAST_SIM_OVERRIDE_DEFAULT}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_ABSTRACT_PHY} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_INTERFACE_ID} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_SKIP_CA_DESKEW} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_SKIP_CA_LEVEL} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_LPDDR3_USE_TG_AVL_2} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_ABSTRACT_PHY} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_INTERFACE_ID} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR2_USE_TG_AVL_2} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_ABSTRACT_PHY} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_INTERFACE_ID} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_SKIP_VREF_CAL} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_QDR4_USE_TG_AVL_2} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_ABSTRACT_PHY} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_INTERFACE_ID} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD2_USE_TG_AVL_2} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_ABSTRACT_PHY} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_BYPASS_DEFAULT_PATTERN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_BYPASS_REPEAT_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_BYPASS_STRESS_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_BYPASS_USER_STAGE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_EXPORT_SEQ_AVALON_MASTER} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_EX_DESIGN_ISSP_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_EX_DESIGN_NUM_OF_SLAVES} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_EX_DESIGN_SEPARATE_RZQS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_INTERFACE_ID} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_SEPARATE_READ_WRITE_ITFS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_TG_BE_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_TG_DATA_PATTERN_LENGTH} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RLD3_USE_TG_AVL_2} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_RS232_UART_BAUDRATE} {57600}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_SIM_REGTEST_MODE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_SOFT_NIOS_CLOCK_FREQUENCY} {100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_SOFT_NIOS_MODE} {SOFT_NIOS_MODE_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_SYNTH_FOR_SIM} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_TG_AVL_2_EXPORT_CFG_INTERFACE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_TG_AVL_2_NUM_CFG_INTERFACES} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_TIMING_REGTEST_MODE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_USE_BOARD_DELAY_MODEL} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_USE_RS232_UART} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_VERBOSE_IOAUX} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_DDR3_GEN_SIM} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_DDR3_GEN_SYNTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_DDR3_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_DDR3_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_DDR3_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_DDR3_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_DDR4_GEN_SIM} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_DDR4_GEN_SYNTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_DDR4_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_DDR4_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_DDR4_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_DDR4_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_LPDDR3_GEN_SIM} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_LPDDR3_GEN_SYNTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_LPDDR3_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_LPDDR3_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_LPDDR3_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_LPDDR3_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_QDR2_GEN_SIM} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_QDR2_GEN_SYNTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_QDR2_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_QDR2_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_QDR2_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_QDR2_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_QDR4_GEN_SIM} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_QDR4_GEN_SYNTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_QDR4_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_QDR4_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_QDR4_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_QDR4_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_RLD2_GEN_SIM} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_RLD2_GEN_SYNTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_RLD2_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_RLD2_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_RLD2_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_RLD2_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_RLD3_GEN_SIM} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_RLD3_GEN_SYNTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_RLD3_HDL_FORMAT} {HDL_FORMAT_VERILOG}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_RLD3_PREV_PRESET} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_RLD3_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
    set_instance_parameter_value sys_hps_ddr4_cntrl {EX_DESIGN_GUI_RLD3_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {INTERNAL_TESTING_MODE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {IS_ED_SLAVE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_ALERT_N_DQS_GROUP} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_ALERT_N_PLACEMENT_ENUM} {DDR3_ALERT_N_PLACEMENT_AC_LANES}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_ASR_ENUM} {DDR3_ASR_MANUAL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_ATCL_ENUM} {DDR3_ATCL_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_BANK_ADDR_WIDTH} {3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_BL_ENUM} {DDR3_BL_BL8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_BT_ENUM} {DDR3_BT_SEQUENTIAL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_CKE_PER_DIMM} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_CK_WIDTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_COL_ADDR_WIDTH} {10}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_DISCRETE_CS_WIDTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_DISCRETE_MIRROR_ADDRESSING_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_DLL_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_DM_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_DQ_PER_DQS} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_DQ_WIDTH} {32}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_DRV_STR_ENUM} {DDR3_DRV_STR_RZQ_7}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_FORMAT_ENUM} {MEM_FORMAT_UDIMM}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_HIDE_ADV_MR_SETTINGS} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_LRDIMM_EXTENDED_CONFIG} {000000000000000000}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_MIRROR_ADDRESSING_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_NUM_OF_DIMMS} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_PD_ENUM} {DDR3_PD_OFF}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_RANKS_PER_DIMM} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_RDIMM_CONFIG} {0000000000000000}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_ROW_ADDR_WIDTH} {15}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_RTT_NOM_ENUM} {DDR3_RTT_NOM_ODT_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_RTT_WR_ENUM} {DDR3_RTT_WR_RZQ_4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_R_ODT0_1X1} {off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_R_ODT0_2X2} {off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_R_ODT0_4X2} {off off on on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_R_ODT0_4X4} {off off off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_R_ODT1_2X2} {off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_R_ODT1_4X2} {on on off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_R_ODT1_4X4} {off off on on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_R_ODT2_4X4} {off off off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_R_ODT3_4X4} {on on off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_R_ODTN_1X1} {Rank\ 0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_R_ODTN_2X2} {Rank\ 0 Rank\ 1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_R_ODTN_4X2} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_R_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_SPEEDBIN_ENUM} {DDR3_SPEEDBIN_2133}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_SRT_ENUM} {DDR3_SRT_NORMAL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TCL} {14}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TDH_DC_MV} {100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TDH_PS} {55}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TDQSCK_PS} {180}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TDQSQ_PS} {75}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TDQSS_CYC} {0.27}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TDSH_CYC} {0.18}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TDSS_CYC} {0.18}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TDS_AC_MV} {135}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TDS_PS} {53}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TFAW_NS} {25.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TIH_DC_MV} {100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TIH_PS} {95}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TINIT_US} {500}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TIS_AC_MV} {135}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TIS_PS} {60}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TMRD_CK_CYC} {4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TQH_CYC} {0.38}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TQSH_CYC} {0.4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TRAS_NS} {33.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TRCD_NS} {13.09}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TREFI_US} {7.8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TRFC_NS} {160.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TRP_NS} {13.09}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TRRD_CYC} {6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TRTP_CYC} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TWLH_PS} {125.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TWLS_PS} {125.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TWR_NS} {15.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_TWTR_CYC} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_USE_DEFAULT_ODT} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_WTCL} {10}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_W_ODT0_1X1} {on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_W_ODT0_2X2} {on off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_W_ODT0_4X2} {off off on on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_W_ODT0_4X4} {on on off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_W_ODT1_2X2} {off on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_W_ODT1_4X2} {on on off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_W_ODT1_4X4} {off off on on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_W_ODT2_4X4} {off off on on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_W_ODT3_4X4} {on on off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_W_ODTN_1X1} {Rank\ 0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_W_ODTN_2X2} {Rank\ 0 Rank\ 1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_W_ODTN_4X2} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR3_W_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_AC_PARITY_LATENCY} {DDR4_AC_PARITY_LATENCY_DISABLE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_AC_PERSISTENT_ERROR} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_ALERT_N_AC_LANE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_ALERT_N_AC_PIN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_ALERT_N_DQS_GROUP} {3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_ALERT_N_PLACEMENT_ENUM} {DDR4_ALERT_N_PLACEMENT_AUTO}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_ALERT_PAR_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_ASR_ENUM} {DDR4_ASR_MANUAL_NORMAL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_ATCL_ENUM} {DDR4_ATCL_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_BANK_ADDR_WIDTH} {2}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_BANK_GROUP_WIDTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_BL_ENUM} {DDR4_BL_BL8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_BT_ENUM} {DDR4_BT_SEQUENTIAL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_CAL_MODE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_CHIP_ID_WIDTH} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_CKE_PER_DIMM} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_CK_WIDTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_COL_ADDR_WIDTH} {10}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_DB_DQ_DRV_ENUM} {DDR4_DB_DRV_STR_RZQ_7}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_DB_RTT_NOM_ENUM} {DDR4_DB_RTT_NOM_ODT_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_DB_RTT_PARK_ENUM} {DDR4_DB_RTT_PARK_ODT_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_DB_RTT_WR_ENUM} {DDR4_DB_RTT_WR_RZQ_3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_DEFAULT_VREFOUT} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_DISCRETE_CS_WIDTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_DISCRETE_MIRROR_ADDRESSING_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_DLL_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_DM_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_DQ_PER_DQS} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_DQ_WIDTH} {40}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_DRV_STR_ENUM} {DDR4_DRV_STR_RZQ_7}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_FINE_GRANULARITY_REFRESH} {DDR4_FINE_REFRESH_FIXED_1X}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_FORMAT_ENUM} {MEM_FORMAT_DISCRETE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_GEARDOWN} {DDR4_GEARDOWN_HR}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_HIDE_ADV_MR_SETTINGS} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_INTERNAL_VREFDQ_MONITOR} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_LRDIMM_ODT_LESS_BS} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_LRDIMM_ODT_LESS_BS_PARK_OHM} {240}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_LRDIMM_VREFDQ_VALUE} {}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_MAX_POWERDOWN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_MIRROR_ADDRESSING_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_MPR_READ_FORMAT} {DDR4_MPR_READ_FORMAT_SERIAL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_NUM_OF_DIMMS} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_ODT_IN_POWERDOWN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_PER_DRAM_ADDR} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_RANKS_PER_DIMM} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_RCD_CA_IBT_ENUM} {DDR4_RCD_CA_IBT_100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_RCD_CKE_IBT_ENUM} {DDR4_RCD_CKE_IBT_100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_RCD_CS_IBT_ENUM} {DDR4_RCD_CS_IBT_100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_RCD_ODT_IBT_ENUM} {DDR4_RCD_ODT_IBT_100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_READ_DBI} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_READ_PREAMBLE} {2}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_READ_PREAMBLE_TRAINING} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_ROW_ADDR_WIDTH} {15}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_RTT_NOM_ENUM} {DDR4_RTT_NOM_RZQ_6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_RTT_PARK} {DDR4_RTT_PARK_ODT_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_RTT_WR_ENUM} {DDR4_RTT_WR_ODT_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_R_ODT0_1X1} {off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_R_ODT0_2X2} {off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_R_ODT0_4X2} {off off on on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_R_ODT0_4X4} {off off off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_R_ODT1_2X2} {off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_R_ODT1_4X2} {on on off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_R_ODT1_4X4} {off off on on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_R_ODT2_4X4} {off off off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_R_ODT3_4X4} {on on off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_R_ODTN_1X1} {Rank\ 0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_R_ODTN_2X2} {Rank\ 0 Rank\ 1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_R_ODTN_4X2} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_R_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SELF_RFSH_ABORT} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_133_RCD_DB_VENDOR_LSB} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_134_RCD_DB_VENDOR_MSB} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_135_RCD_REV} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_137_RCD_CA_DRV} {101}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_138_RCD_CK_DRV} {5}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_139_DB_REV} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_140_DRAM_VREFDQ_R0} {29}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_141_DRAM_VREFDQ_R1} {29}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_142_DRAM_VREFDQ_R2} {29}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_143_DRAM_VREFDQ_R3} {29}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_144_DB_VREFDQ} {37}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_145_DB_MDQ_DRV} {21}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_148_DRAM_DRV} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_149_DRAM_RTT_WR_NOM} {20}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPD_152_DRAM_RTT_PARK} {39}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPEEDBIN_ENUM} {DDR4_SPEEDBIN_2400}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TCCD_L_CYC} {6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TCCD_S_CYC} {4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TCL} {18}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TDIVW_DJ_CYC} {0.1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TDIVW_TOTAL_UI} {0.2}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TDQSCK_PS} {165}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TDQSQ_PS} {66}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TDQSQ_UI} {0.16}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TDQSS_CYC} {0.27}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TDSH_CYC} {0.18}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TDSS_CYC} {0.18}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TDVWP_UI} {0.72}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TEMP_CONTROLLED_RFSH_ENA} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TEMP_CONTROLLED_RFSH_RANGE} {DDR4_TEMP_CONTROLLED_RFSH_NORMAL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TEMP_SENSOR_READOUT} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TFAW_NS} {30.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TIH_DC_MV} {75}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TIH_PS} {87}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TINIT_US} {500}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TIS_AC_MV} {100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TIS_PS} {62}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TMRD_CK_CYC} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TQH_CYC} {0.38}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TQH_UI} {0.76}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TQSH_CYC} {0.38}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TRAS_NS} {35.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TRCD_NS} {15.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TREFI_US} {7.8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TRFC_NS} {260.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TRP_NS} {15.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TRRD_L_CYC} {6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TRRD_S_CYC} {4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TWLH_PS} {162.5}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TWLS_PS} {162.5}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TWR_NS} {15.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TWTR_L_CYC} {4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TWTR_S_CYC} {3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_USER_VREFDQ_TRAINING_RANGE} {DDR4_VREFDQ_TRAINING_RANGE_1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_USER_VREFDQ_TRAINING_VALUE} {56.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_USE_DEFAULT_ODT} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_VDIVW_TOTAL} {130}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_WRITE_CRC} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_WRITE_DBI} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_WRITE_PREAMBLE} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_WTCL} {12}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_W_ODT0_1X1} {on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_W_ODT0_2X2} {on off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_W_ODT0_4X2} {off off on on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_W_ODT0_4X4} {on on off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_W_ODT1_2X2} {off on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_W_ODT1_4X2} {on on off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_W_ODT1_4X4} {off off on on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_W_ODT2_4X4} {off off on on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_W_ODT3_4X4} {on on off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_W_ODTN_1X1} {Rank\ 0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_W_ODTN_2X2} {Rank\ 0 Rank\ 1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_W_ODTN_4X2} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_W_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_BANK_ADDR_WIDTH} {3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_BL} {LPDDR3_BL_BL8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_CK_WIDTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_COL_ADDR_WIDTH} {10}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_DATA_LATENCY} {LPDDR3_DL_RL12_WL6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_DISCRETE_CS_WIDTH} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_DM_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_DQODT} {LPDDR3_DQODT_DISABLE}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_DQ_WIDTH} {32}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_DRV_STR} {LPDDR3_DRV_STR_40D_40U}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_PDODT} {LPDDR3_PDODT_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_ROW_ADDR_WIDTH} {15}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_R_ODT0_1X1} {off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_R_ODT0_2X2} {off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_R_ODT0_4X4} {off off off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_R_ODT1_2X2} {off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_R_ODT1_4X4} {off off off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_R_ODT2_4X4} {off off off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_R_ODT3_4X4} {off off off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_R_ODTN_1X1} {Rank\ 0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_R_ODTN_2X2} {Rank\ 0 Rank\ 1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_R_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_SPEEDBIN_ENUM} {LPDDR3_SPEEDBIN_1600}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TDH_DC_MV} {100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TDH_PS} {100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TDQSCKDL} {614}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TDQSQ_PS} {135}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TDQSS_CYC} {1.25}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TDSH_CYC} {0.2}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TDSS_CYC} {0.2}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TDS_AC_MV} {150}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TDS_PS} {75}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TFAW_NS} {50.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TIH_DC_MV} {100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TIH_PS} {100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TINIT_US} {500}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TIS_AC_MV} {150}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TIS_PS} {75}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TMRR_CK_CYC} {4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TMRW_CK_CYC} {10}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TQH_CYC} {0.38}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TQSH_CYC} {0.38}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TRAS_NS} {42.5}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TRCD_NS} {18.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TREFI_US} {3.9}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TRFC_NS} {210.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TRP_NS} {18.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TRRD_CYC} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TRTP_CYC} {6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TWLH_PS} {175.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TWLS_PS} {175.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TWR_NS} {15.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_TWTR_CYC} {6}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_USE_DEFAULT_ODT} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_W_ODT0_1X1} {on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_W_ODT0_2X2} {on on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_W_ODT0_4X4} {on on on on}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_W_ODT1_2X2} {off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_W_ODT1_4X4} {off off off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_W_ODT2_4X4} {off off off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_W_ODT3_4X4} {off off off off}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_W_ODTN_1X1} {Rank\ 0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_W_ODTN_2X2} {Rank\ 0 Rank\ 1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_LPDDR3_W_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_ADDR_WIDTH} {19}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_BL} {4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_BWS_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_DATA_PER_DEVICE} {36}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_INTERNAL_JITTER_NS} {0.08}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_SPEEDBIN_ENUM} {QDR2_SPEEDBIN_633}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_TCCQO_NS} {0.45}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_TCQDOH_NS} {-0.09}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_TCQD_NS} {0.09}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_TCQH_NS} {0.71}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_THA_NS} {0.18}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_THD_NS} {0.18}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_TRL_CYC} {2.5}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_TSA_NS} {0.23}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_TSD_NS} {0.23}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR2_WIDTH_EXPANDED} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_AC_ODT_MODE_ENUM} {QDR4_ODT_25_PCT}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_ADDR_INV_ENA} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_ADDR_WIDTH} {21}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_CK_ODT_MODE_ENUM} {QDR4_ODT_25_PCT}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_DATA_INV_ENA} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_DATA_ODT_MODE_ENUM} {QDR4_ODT_25_PCT}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_DQ_PER_PORT_PER_DEVICE} {36}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_PD_OUTPUT_DRIVE_MODE_ENUM} {QDR4_OUTPUT_DRIVE_25_PCT}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_PU_OUTPUT_DRIVE_MODE_ENUM} {QDR4_OUTPUT_DRIVE_25_PCT}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_SPEEDBIN_ENUM} {QDR4_SPEEDBIN_2133}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_TASH_PS} {170}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_TCKDK_MAX_PS} {150}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_TCKDK_MIN_PS} {-150}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_TCKQK_MAX_PS} {225}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_TCSH_PS} {170}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_TISH_PS} {150}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_TQH_CYC} {0.4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_TQKQ_MAX_PS} {75}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_QDR4_WIDTH_EXPANDED} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_ADDR_WIDTH} {21}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_BANK_ADDR_WIDTH} {3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_BL} {4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_CONFIG_ENUM} {RLD2_CONFIG_TRC_8_TRL_8_TWL_9}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_DM_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_DQ_PER_DEVICE} {9}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_DRIVE_IMPEDENCE_ENUM} {RLD2_DRIVE_IMPEDENCE_INTERNAL_50}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_ODT_MODE_ENUM} {RLD2_ODT_ON}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_REFRESH_INTERVAL_US} {0.24}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_SPEEDBIN_ENUM} {RLD2_SPEEDBIN_18}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_TAH_NS} {0.3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_TAS_NS} {0.3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_TCKDK_MAX_NS} {0.3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_TCKDK_MIN_NS} {-0.3}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_TCKH_CYC} {0.45}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_TCKQK_MAX_NS} {0.2}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_TDH_NS} {0.17}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_TDS_NS} {0.17}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_TQKH_HCYC} {0.9}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_TQKQ_MAX_NS} {0.12}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_TQKQ_MIN_NS} {-0.12}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD2_WIDTH_EXPANDED} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_ADDR_WIDTH} {20}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_AREF_PROTOCOL_ENUM} {RLD3_AREF_BAC}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_BANK_ADDR_WIDTH} {4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_BL} {2}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_DATA_LATENCY_MODE_ENUM} {RLD3_DL_RL16_WL17}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_DEPTH_EXPANDED} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_DM_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_DQ_PER_DEVICE} {36}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_ODT_MODE_ENUM} {RLD3_ODT_40}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_OUTPUT_DRIVE_MODE_ENUM} {RLD3_OUTPUT_DRIVE_40}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_SPEEDBIN_ENUM} {RLD3_SPEEDBIN_093E}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_TCKDK_MAX_CYC} {0.27}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_TCKDK_MIN_CYC} {-0.27}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_TCKQK_MAX_PS} {135}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_TDH_DC_MV} {100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_TDH_PS} {5}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_TDS_AC_MV} {150}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_TDS_PS} {-30}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_TIH_DC_MV} {100}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_TIH_PS} {65}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_TIS_AC_MV} {150}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_TIS_PS} {85}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_TQH_CYC} {0.38}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_TQKQ_MAX_PS} {75}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_T_RC_MODE_ENUM} {RLD3_TRC_9}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_WIDTH_EXPANDED} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_RLD3_WRITE_PROTOCOL_ENUM} {RLD3_WRITE_1BANK}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_CAL_ADDR0} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_CAL_ADDR1} {8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_CAL_ENABLE_NON_DES} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_CONFIG_ENUM} {CONFIG_PHY_AND_HARD_CTRL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_DEFAULT_IO} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_IO_VOLTAGE} {1.5}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_MEM_CLK_FREQ_MHZ} {1066.667}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_RATE_ENUM} {RATE_HALF}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_AC_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_AC_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_CK_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_CK_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_DATA_IN_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_DATA_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_DATA_OUT_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_PING_PONG_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_PLL_REF_CLK_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_REF_CLK_FREQ_MHZ} {-1.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_RZQ_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR3_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_CONFIG_ENUM} {CONFIG_PHY_AND_HARD_CTRL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_DEFAULT_IO} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_IO_VOLTAGE} {1.2}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_MEM_CLK_FREQ_MHZ} {1067.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_RATE_ENUM} {RATE_HALF}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_AC_IO_STD_ENUM} {IO_STD_SSTL_12}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_AC_MODE_ENUM} {OUT_OCT_40_CAL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_CK_IO_STD_ENUM} {IO_STD_SSTL_12}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_CK_MODE_ENUM} {OUT_OCT_40_CAL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_DATA_IN_MODE_ENUM} {IN_OCT_60_CAL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_DATA_IO_STD_ENUM} {IO_STD_POD_12}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_DATA_OUT_MODE_ENUM} {OUT_OCT_34_CAL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_PING_PONG_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_PLL_REF_CLK_IO_STD_ENUM} {IO_STD_LVDS}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_REF_CLK_FREQ_MHZ} {-1.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_RZQ_IO_STD_ENUM} {IO_STD_CMOS_12}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_CONFIG_ENUM} {CONFIG_PHY_AND_HARD_CTRL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_DEFAULT_IO} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_IO_VOLTAGE} {1.2}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_MEM_CLK_FREQ_MHZ} {800.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_RATE_ENUM} {RATE_HALF}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_AC_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_AC_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_CK_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_CK_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_DATA_IN_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_DATA_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_DATA_OUT_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_PING_PONG_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_PLL_REF_CLK_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_REF_CLK_FREQ_MHZ} {-1.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_RZQ_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_LPDDR3_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_CONFIG_ENUM} {CONFIG_PHY_AND_SOFT_CTRL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_DEFAULT_IO} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_IO_VOLTAGE} {1.5}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_MEM_CLK_FREQ_MHZ} {633.333}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_RATE_ENUM} {RATE_HALF}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_AC_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_AC_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_CK_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_CK_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_DATA_IN_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_DATA_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_DATA_OUT_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_PING_PONG_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_PLL_REF_CLK_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_REF_CLK_FREQ_MHZ} {-1.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_RZQ_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR2_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_CONFIG_ENUM} {CONFIG_PHY_AND_SOFT_CTRL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_DEFAULT_IO} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_IO_VOLTAGE} {1.2}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_MEM_CLK_FREQ_MHZ} {1066.667}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_RATE_ENUM} {RATE_QUARTER}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_AC_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_AC_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_CK_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_CK_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_DATA_IN_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_DATA_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_DATA_OUT_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_PING_PONG_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_PLL_REF_CLK_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_REF_CLK_FREQ_MHZ} {-1.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_RZQ_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_QDR4_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_CONFIG_ENUM} {CONFIG_PHY_AND_SOFT_CTRL}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_DEFAULT_IO} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_IO_VOLTAGE} {1.8}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_MEM_CLK_FREQ_MHZ} {533.333}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_RATE_ENUM} {RATE_HALF}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_AC_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_AC_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_CK_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_CK_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_DATA_IN_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_DATA_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_DATA_OUT_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_PING_PONG_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_PLL_REF_CLK_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_REF_CLK_FREQ_MHZ} {-1.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_RZQ_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD2_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_CONFIG_ENUM} {CONFIG_PHY_ONLY}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_DEFAULT_IO} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_DEFAULT_REF_CLK_FREQ} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_HPS_ENABLE_EARLY_RELEASE} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_IO_VOLTAGE} {1.2}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_MEM_CLK_FREQ_MHZ} {1066.667}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_RATE_ENUM} {RATE_QUARTER}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_REF_CLK_JITTER_PS} {10.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_AC_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_AC_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_AUTO_STARTING_VREFIN_EN} {1}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_CK_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_CK_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_DATA_IN_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_DATA_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_DATA_OUT_MODE_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_PING_PONG_EN} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_PLL_REF_CLK_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_REF_CLK_FREQ_MHZ} {-1.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_RZQ_IO_STD_ENUM} {unset}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_RLD3_USER_STARTING_VREFIN} {70.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_ADD_EXTRA_CLKS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_5} {50.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_6} {50.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_7} {50.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_8} {50.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_5} {100.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_6} {100.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_7} {100.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_8} {100.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_5} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_6} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_7} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_8} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_5} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_6} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_7} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_8} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_5} {50.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_6} {50.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_7} {50.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_8} {50.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_5} {100.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_6} {100.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_7} {100.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_8} {100.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_PHASE_GUI_5} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_PHASE_GUI_6} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_PHASE_GUI_7} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_PHASE_GUI_8} {0.0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_0} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_1} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_2} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_3} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_4} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_5} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_6} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_7} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_8} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PLL_USER_NUM_OF_EXTRA_CLKS} {0}
    set_instance_parameter_value sys_hps_ddr4_cntrl {PROTOCOL_ENUM} {PROTOCOL_DDR4}
    set_instance_parameter_value sys_hps_ddr4_cntrl {SHORT_QSYS_INTERFACE_NAMES} {0}

    add_instance sys_spi altera_avalon_spi 18.0
    set_instance_parameter_value sys_spi {clockPhase} {0}
    set_instance_parameter_value sys_spi {clockPolarity} {0}
    set_instance_parameter_value sys_spi {dataWidth} {8}
    set_instance_parameter_value sys_spi {disableAvalonFlowControl} {0}
    set_instance_parameter_value sys_spi {insertDelayBetweenSlaveSelectAndSClk} {0}
    set_instance_parameter_value sys_spi {insertSync} {0}
    set_instance_parameter_value sys_spi {lsbOrderedFirst} {0}
    set_instance_parameter_value sys_spi {masterSPI} {1}
    set_instance_parameter_value sys_spi {numberOfSlaves} {8}
    set_instance_parameter_value sys_spi {syncRegDepth} {2}
    set_instance_parameter_value sys_spi {targetClockRate} {128000.0}
    set_instance_parameter_value sys_spi {targetSlaveSelectToSClkDelay} {0.0}

    add_instance util_ad9144_upack util_upack 1.0
    set_instance_parameter_value util_ad9144_upack {CHANNEL_DATA_WIDTH} {64}
    set_instance_parameter_value util_ad9144_upack {NUM_OF_CHANNELS} {2}

    add_instance util_ad9680_cpack util_cpack 1.0
    set_instance_parameter_value util_ad9680_cpack {CHANNEL_DATA_WIDTH} {64}
    set_instance_parameter_value util_ad9680_cpack {NUM_OF_CHANNELS} {2}

    # connections and connection parameters
    add_connection ad9144_jesd204.link_clk avl_ad9144_fifo.if_dac_clk clock

    add_connection ad9144_jesd204.link_clk axi_ad9144_core.if_tx_clk clock

    add_connection ad9144_jesd204.link_clk util_ad9144_upack.if_dac_clk clock

    add_connection ad9144_jesd204.link_reset avl_ad9144_fifo.if_dac_rst reset

    add_connection ad9680_adcfifo.if_adc_wovf axi_ad9680_core.if_adc_dovf conduit
    set_connection_parameter_value ad9680_adcfifo.if_adc_wovf/axi_ad9680_core.if_adc_dovf endPort {}
    set_connection_parameter_value ad9680_adcfifo.if_adc_wovf/axi_ad9680_core.if_adc_dovf endPortLSB {0}
    set_connection_parameter_value ad9680_adcfifo.if_adc_wovf/axi_ad9680_core.if_adc_dovf startPort {}
    set_connection_parameter_value ad9680_adcfifo.if_adc_wovf/axi_ad9680_core.if_adc_dovf startPortLSB {0}
    set_connection_parameter_value ad9680_adcfifo.if_adc_wovf/axi_ad9680_core.if_adc_dovf width {0}

    add_connection ad9680_adcfifo.if_dma_wdata axi_ad9680_dma.if_s_axis_data conduit
    set_connection_parameter_value ad9680_adcfifo.if_dma_wdata/axi_ad9680_dma.if_s_axis_data endPort {}
    set_connection_parameter_value ad9680_adcfifo.if_dma_wdata/axi_ad9680_dma.if_s_axis_data endPortLSB {0}
    set_connection_parameter_value ad9680_adcfifo.if_dma_wdata/axi_ad9680_dma.if_s_axis_data startPort {}
    set_connection_parameter_value ad9680_adcfifo.if_dma_wdata/axi_ad9680_dma.if_s_axis_data startPortLSB {0}
    set_connection_parameter_value ad9680_adcfifo.if_dma_wdata/axi_ad9680_dma.if_s_axis_data width {0}

    add_connection ad9680_adcfifo.if_dma_wr axi_ad9680_dma.if_s_axis_valid conduit
    set_connection_parameter_value ad9680_adcfifo.if_dma_wr/axi_ad9680_dma.if_s_axis_valid endPort {}
    set_connection_parameter_value ad9680_adcfifo.if_dma_wr/axi_ad9680_dma.if_s_axis_valid endPortLSB {0}
    set_connection_parameter_value ad9680_adcfifo.if_dma_wr/axi_ad9680_dma.if_s_axis_valid startPort {}
    set_connection_parameter_value ad9680_adcfifo.if_dma_wr/axi_ad9680_dma.if_s_axis_valid startPortLSB {0}
    set_connection_parameter_value ad9680_adcfifo.if_dma_wr/axi_ad9680_dma.if_s_axis_valid width {0}

    add_connection ad9680_adcfifo.if_dma_wready axi_ad9680_dma.if_s_axis_ready conduit
    set_connection_parameter_value ad9680_adcfifo.if_dma_wready/axi_ad9680_dma.if_s_axis_ready endPort {}
    set_connection_parameter_value ad9680_adcfifo.if_dma_wready/axi_ad9680_dma.if_s_axis_ready endPortLSB {0}
    set_connection_parameter_value ad9680_adcfifo.if_dma_wready/axi_ad9680_dma.if_s_axis_ready startPort {}
    set_connection_parameter_value ad9680_adcfifo.if_dma_wready/axi_ad9680_dma.if_s_axis_ready startPortLSB {0}
    set_connection_parameter_value ad9680_adcfifo.if_dma_wready/axi_ad9680_dma.if_s_axis_ready width {0}

    add_connection ad9680_adcfifo.if_dma_xfer_req axi_ad9680_dma.if_s_axis_xfer_req conduit
    set_connection_parameter_value ad9680_adcfifo.if_dma_xfer_req/axi_ad9680_dma.if_s_axis_xfer_req endPort {}
    set_connection_parameter_value ad9680_adcfifo.if_dma_xfer_req/axi_ad9680_dma.if_s_axis_xfer_req endPortLSB {0}
    set_connection_parameter_value ad9680_adcfifo.if_dma_xfer_req/axi_ad9680_dma.if_s_axis_xfer_req startPort {}
    set_connection_parameter_value ad9680_adcfifo.if_dma_xfer_req/axi_ad9680_dma.if_s_axis_xfer_req startPortLSB {0}
    set_connection_parameter_value ad9680_adcfifo.if_dma_xfer_req/axi_ad9680_dma.if_s_axis_xfer_req width {0}

    add_connection ad9680_jesd204.link_clk ad9680_adcfifo.if_adc_clk clock

    add_connection ad9680_jesd204.link_clk axi_ad9680_core.if_rx_clk clock

    add_connection ad9680_jesd204.link_clk util_ad9680_cpack.if_adc_clk clock

    add_connection ad9680_jesd204.link_data axi_ad9680_core.if_rx_data avalon_streaming

    add_connection ad9680_jesd204.link_sof axi_ad9680_core.if_rx_sof conduit
    set_connection_parameter_value ad9680_jesd204.link_sof/axi_ad9680_core.if_rx_sof endPort {}
    set_connection_parameter_value ad9680_jesd204.link_sof/axi_ad9680_core.if_rx_sof endPortLSB {0}
    set_connection_parameter_value ad9680_jesd204.link_sof/axi_ad9680_core.if_rx_sof startPort {}
    set_connection_parameter_value ad9680_jesd204.link_sof/axi_ad9680_core.if_rx_sof startPortLSB {0}
    set_connection_parameter_value ad9680_jesd204.link_sof/axi_ad9680_core.if_rx_sof width {0}

    add_connection avl_ad9144_fifo.amm_ddr fpga_ddr4_cntrl.ctrl_amm_avalon_slave_0 avalon
    set_connection_parameter_value avl_ad9144_fifo.amm_ddr/fpga_ddr4_cntrl.ctrl_amm_avalon_slave_0 arbitrationPriority {1}
    set_connection_parameter_value avl_ad9144_fifo.amm_ddr/fpga_ddr4_cntrl.ctrl_amm_avalon_slave_0 baseAddress {0x0000}
    set_connection_parameter_value avl_ad9144_fifo.amm_ddr/fpga_ddr4_cntrl.ctrl_amm_avalon_slave_0 defaultConnection {0}

    add_connection avl_ad9144_fifo.if_dac_data util_ad9144_upack.if_dac_data conduit
    set_connection_parameter_value avl_ad9144_fifo.if_dac_data/util_ad9144_upack.if_dac_data endPort {}
    set_connection_parameter_value avl_ad9144_fifo.if_dac_data/util_ad9144_upack.if_dac_data endPortLSB {0}
    set_connection_parameter_value avl_ad9144_fifo.if_dac_data/util_ad9144_upack.if_dac_data startPort {}
    set_connection_parameter_value avl_ad9144_fifo.if_dac_data/util_ad9144_upack.if_dac_data startPortLSB {0}
    set_connection_parameter_value avl_ad9144_fifo.if_dac_data/util_ad9144_upack.if_dac_data width {0}

    add_connection avl_ad9144_fifo.if_dac_dunf axi_ad9144_core.if_dac_dunf conduit
    set_connection_parameter_value avl_ad9144_fifo.if_dac_dunf/axi_ad9144_core.if_dac_dunf endPort {}
    set_connection_parameter_value avl_ad9144_fifo.if_dac_dunf/axi_ad9144_core.if_dac_dunf endPortLSB {0}
    set_connection_parameter_value avl_ad9144_fifo.if_dac_dunf/axi_ad9144_core.if_dac_dunf startPort {}
    set_connection_parameter_value avl_ad9144_fifo.if_dac_dunf/axi_ad9144_core.if_dac_dunf startPortLSB {0}
    set_connection_parameter_value avl_ad9144_fifo.if_dac_dunf/axi_ad9144_core.if_dac_dunf width {0}

    add_connection avl_ad9144_fifo.if_dma_ready axi_ad9144_dma.if_m_axis_ready conduit
    set_connection_parameter_value avl_ad9144_fifo.if_dma_ready/axi_ad9144_dma.if_m_axis_ready endPort {}
    set_connection_parameter_value avl_ad9144_fifo.if_dma_ready/axi_ad9144_dma.if_m_axis_ready endPortLSB {0}
    set_connection_parameter_value avl_ad9144_fifo.if_dma_ready/axi_ad9144_dma.if_m_axis_ready startPort {}
    set_connection_parameter_value avl_ad9144_fifo.if_dma_ready/axi_ad9144_dma.if_m_axis_ready startPortLSB {0}
    set_connection_parameter_value avl_ad9144_fifo.if_dma_ready/axi_ad9144_dma.if_m_axis_ready width {0}

    add_connection avl_adxcfg_0.rcfg_m0 ad9144_jesd204.phy_reconfig_0 avalon
    set_connection_parameter_value avl_adxcfg_0.rcfg_m0/ad9144_jesd204.phy_reconfig_0 arbitrationPriority {1}
    set_connection_parameter_value avl_adxcfg_0.rcfg_m0/ad9144_jesd204.phy_reconfig_0 baseAddress {0x0000}
    set_connection_parameter_value avl_adxcfg_0.rcfg_m0/ad9144_jesd204.phy_reconfig_0 defaultConnection {0}

    add_connection avl_adxcfg_0.rcfg_m1 ad9680_jesd204.phy_reconfig_0 avalon
    set_connection_parameter_value avl_adxcfg_0.rcfg_m1/ad9680_jesd204.phy_reconfig_0 arbitrationPriority {1}
    set_connection_parameter_value avl_adxcfg_0.rcfg_m1/ad9680_jesd204.phy_reconfig_0 baseAddress {0x0000}
    set_connection_parameter_value avl_adxcfg_0.rcfg_m1/ad9680_jesd204.phy_reconfig_0 defaultConnection {0}

    add_connection avl_adxcfg_1.rcfg_m0 ad9144_jesd204.phy_reconfig_1 avalon
    set_connection_parameter_value avl_adxcfg_1.rcfg_m0/ad9144_jesd204.phy_reconfig_1 arbitrationPriority {1}
    set_connection_parameter_value avl_adxcfg_1.rcfg_m0/ad9144_jesd204.phy_reconfig_1 baseAddress {0x0000}
    set_connection_parameter_value avl_adxcfg_1.rcfg_m0/ad9144_jesd204.phy_reconfig_1 defaultConnection {0}

    add_connection avl_adxcfg_1.rcfg_m1 ad9680_jesd204.phy_reconfig_1 avalon
    set_connection_parameter_value avl_adxcfg_1.rcfg_m1/ad9680_jesd204.phy_reconfig_1 arbitrationPriority {1}
    set_connection_parameter_value avl_adxcfg_1.rcfg_m1/ad9680_jesd204.phy_reconfig_1 baseAddress {0x0000}
    set_connection_parameter_value avl_adxcfg_1.rcfg_m1/ad9680_jesd204.phy_reconfig_1 defaultConnection {0}

    add_connection avl_adxcfg_2.rcfg_m0 ad9144_jesd204.phy_reconfig_2 avalon
    set_connection_parameter_value avl_adxcfg_2.rcfg_m0/ad9144_jesd204.phy_reconfig_2 arbitrationPriority {1}
    set_connection_parameter_value avl_adxcfg_2.rcfg_m0/ad9144_jesd204.phy_reconfig_2 baseAddress {0x0000}
    set_connection_parameter_value avl_adxcfg_2.rcfg_m0/ad9144_jesd204.phy_reconfig_2 defaultConnection {0}

    add_connection avl_adxcfg_2.rcfg_m1 ad9680_jesd204.phy_reconfig_2 avalon
    set_connection_parameter_value avl_adxcfg_2.rcfg_m1/ad9680_jesd204.phy_reconfig_2 arbitrationPriority {1}
    set_connection_parameter_value avl_adxcfg_2.rcfg_m1/ad9680_jesd204.phy_reconfig_2 baseAddress {0x0000}
    set_connection_parameter_value avl_adxcfg_2.rcfg_m1/ad9680_jesd204.phy_reconfig_2 defaultConnection {0}

    add_connection avl_adxcfg_3.rcfg_m0 ad9144_jesd204.phy_reconfig_3 avalon
    set_connection_parameter_value avl_adxcfg_3.rcfg_m0/ad9144_jesd204.phy_reconfig_3 arbitrationPriority {1}
    set_connection_parameter_value avl_adxcfg_3.rcfg_m0/ad9144_jesd204.phy_reconfig_3 baseAddress {0x0000}
    set_connection_parameter_value avl_adxcfg_3.rcfg_m0/ad9144_jesd204.phy_reconfig_3 defaultConnection {0}

    add_connection avl_adxcfg_3.rcfg_m1 ad9680_jesd204.phy_reconfig_3 avalon
    set_connection_parameter_value avl_adxcfg_3.rcfg_m1/ad9680_jesd204.phy_reconfig_3 arbitrationPriority {1}
    set_connection_parameter_value avl_adxcfg_3.rcfg_m1/ad9680_jesd204.phy_reconfig_3 baseAddress {0x0000}
    set_connection_parameter_value avl_adxcfg_3.rcfg_m1/ad9680_jesd204.phy_reconfig_3 defaultConnection {0}

    add_connection axi_ad9144_core.dac_ch_0 util_ad9144_upack.dac_ch_0 conduit
    set_connection_parameter_value axi_ad9144_core.dac_ch_0/util_ad9144_upack.dac_ch_0 endPort {}
    set_connection_parameter_value axi_ad9144_core.dac_ch_0/util_ad9144_upack.dac_ch_0 endPortLSB {0}
    set_connection_parameter_value axi_ad9144_core.dac_ch_0/util_ad9144_upack.dac_ch_0 startPort {}
    set_connection_parameter_value axi_ad9144_core.dac_ch_0/util_ad9144_upack.dac_ch_0 startPortLSB {0}
    set_connection_parameter_value axi_ad9144_core.dac_ch_0/util_ad9144_upack.dac_ch_0 width {0}

    add_connection axi_ad9144_core.dac_ch_1 util_ad9144_upack.dac_ch_1 conduit
    set_connection_parameter_value axi_ad9144_core.dac_ch_1/util_ad9144_upack.dac_ch_1 endPort {}
    set_connection_parameter_value axi_ad9144_core.dac_ch_1/util_ad9144_upack.dac_ch_1 endPortLSB {0}
    set_connection_parameter_value axi_ad9144_core.dac_ch_1/util_ad9144_upack.dac_ch_1 startPort {}
    set_connection_parameter_value axi_ad9144_core.dac_ch_1/util_ad9144_upack.dac_ch_1 startPortLSB {0}
    set_connection_parameter_value axi_ad9144_core.dac_ch_1/util_ad9144_upack.dac_ch_1 width {0}

    add_connection axi_ad9144_core.if_tx_data ad9144_jesd204.link_data avalon_streaming

    add_connection axi_ad9144_dma.if_m_axis_data avl_ad9144_fifo.if_dma_data conduit
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_data/avl_ad9144_fifo.if_dma_data endPort {}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_data/avl_ad9144_fifo.if_dma_data endPortLSB {0}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_data/avl_ad9144_fifo.if_dma_data startPort {}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_data/avl_ad9144_fifo.if_dma_data startPortLSB {0}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_data/avl_ad9144_fifo.if_dma_data width {0}

    add_connection axi_ad9144_dma.if_m_axis_last avl_ad9144_fifo.if_dma_xfer_last conduit
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_last/avl_ad9144_fifo.if_dma_xfer_last endPort {}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_last/avl_ad9144_fifo.if_dma_xfer_last endPortLSB {0}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_last/avl_ad9144_fifo.if_dma_xfer_last startPort {}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_last/avl_ad9144_fifo.if_dma_xfer_last startPortLSB {0}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_last/avl_ad9144_fifo.if_dma_xfer_last width {0}

    add_connection axi_ad9144_dma.if_m_axis_valid avl_ad9144_fifo.if_dma_valid conduit
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_valid/avl_ad9144_fifo.if_dma_valid endPort {}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_valid/avl_ad9144_fifo.if_dma_valid endPortLSB {0}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_valid/avl_ad9144_fifo.if_dma_valid startPort {}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_valid/avl_ad9144_fifo.if_dma_valid startPortLSB {0}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_valid/avl_ad9144_fifo.if_dma_valid width {0}

    add_connection axi_ad9144_dma.if_m_axis_xfer_req avl_ad9144_fifo.if_dma_xfer_req conduit
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_xfer_req/avl_ad9144_fifo.if_dma_xfer_req endPort {}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_xfer_req/avl_ad9144_fifo.if_dma_xfer_req endPortLSB {0}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_xfer_req/avl_ad9144_fifo.if_dma_xfer_req startPort {}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_xfer_req/avl_ad9144_fifo.if_dma_xfer_req startPortLSB {0}
    set_connection_parameter_value axi_ad9144_dma.if_m_axis_xfer_req/avl_ad9144_fifo.if_dma_xfer_req width {0}

    add_connection axi_ad9144_dma.m_src_axi sys_hps.f2sdram0_data avalon
    set_connection_parameter_value axi_ad9144_dma.m_src_axi/sys_hps.f2sdram0_data arbitrationPriority {1}
    set_connection_parameter_value axi_ad9144_dma.m_src_axi/sys_hps.f2sdram0_data baseAddress {0x0000}
    set_connection_parameter_value axi_ad9144_dma.m_src_axi/sys_hps.f2sdram0_data defaultConnection {0}

    add_connection axi_ad9680_core.adc_ch_0 util_ad9680_cpack.adc_ch_0 conduit
    set_connection_parameter_value axi_ad9680_core.adc_ch_0/util_ad9680_cpack.adc_ch_0 endPort {}
    set_connection_parameter_value axi_ad9680_core.adc_ch_0/util_ad9680_cpack.adc_ch_0 endPortLSB {0}
    set_connection_parameter_value axi_ad9680_core.adc_ch_0/util_ad9680_cpack.adc_ch_0 startPort {}
    set_connection_parameter_value axi_ad9680_core.adc_ch_0/util_ad9680_cpack.adc_ch_0 startPortLSB {0}
    set_connection_parameter_value axi_ad9680_core.adc_ch_0/util_ad9680_cpack.adc_ch_0 width {0}

    add_connection axi_ad9680_core.adc_ch_1 util_ad9680_cpack.adc_ch_1 conduit
    set_connection_parameter_value axi_ad9680_core.adc_ch_1/util_ad9680_cpack.adc_ch_1 endPort {}
    set_connection_parameter_value axi_ad9680_core.adc_ch_1/util_ad9680_cpack.adc_ch_1 endPortLSB {0}
    set_connection_parameter_value axi_ad9680_core.adc_ch_1/util_ad9680_cpack.adc_ch_1 startPort {}
    set_connection_parameter_value axi_ad9680_core.adc_ch_1/util_ad9680_cpack.adc_ch_1 startPortLSB {0}
    set_connection_parameter_value axi_ad9680_core.adc_ch_1/util_ad9680_cpack.adc_ch_1 width {0}

    add_connection axi_ad9680_dma.m_dest_axi sys_hps.f2sdram0_data avalon
    set_connection_parameter_value axi_ad9680_dma.m_dest_axi/sys_hps.f2sdram0_data arbitrationPriority {1}
    set_connection_parameter_value axi_ad9680_dma.m_dest_axi/sys_hps.f2sdram0_data baseAddress {0x0000}
    set_connection_parameter_value axi_ad9680_dma.m_dest_axi/sys_hps.f2sdram0_data defaultConnection {0}

    add_connection fpga_ddr4_cntrl.emif_usr_clk_clock_source avl_ad9144_fifo.avl_clock clock

    add_connection fpga_ddr4_cntrl.emif_usr_reset_reset_source avl_ad9144_fifo.avl_reset reset

    add_connection sys_clk.clk ad9144_jesd204.sys_clk clock

    add_connection sys_clk.clk ad9680_jesd204.sys_clk clock

    add_connection sys_clk.clk avl_adxcfg_0.rcfg_clk clock

    add_connection sys_clk.clk avl_adxcfg_1.rcfg_clk clock

    add_connection sys_clk.clk avl_adxcfg_2.rcfg_clk clock

    add_connection sys_clk.clk avl_adxcfg_3.rcfg_clk clock

    add_connection sys_clk.clk axi_ad9144_core.s_axi_clock clock

    add_connection sys_clk.clk axi_ad9144_dma.s_axi_clock clock

    add_connection sys_clk.clk axi_ad9680_core.s_axi_clock clock

    add_connection sys_clk.clk axi_ad9680_dma.s_axi_clock clock

    add_connection sys_clk.clk sys_gpio_in.clk clock

    add_connection sys_clk.clk sys_gpio_out.clk clock

    add_connection sys_clk.clk sys_hps.h2f_lw_axi_clock clock

    add_connection sys_clk.clk sys_spi.clk clock

    add_connection sys_clk.clk_reset ad9144_jesd204.sys_resetn reset

    add_connection sys_clk.clk_reset ad9680_adcfifo.if_adc_rst reset

    add_connection sys_clk.clk_reset ad9680_jesd204.sys_resetn reset

    add_connection sys_clk.clk_reset avl_adxcfg_0.rcfg_reset_n reset

    add_connection sys_clk.clk_reset avl_adxcfg_1.rcfg_reset_n reset

    add_connection sys_clk.clk_reset avl_adxcfg_2.rcfg_reset_n reset

    add_connection sys_clk.clk_reset avl_adxcfg_3.rcfg_reset_n reset

    add_connection sys_clk.clk_reset axi_ad9144_core.s_axi_reset reset

    add_connection sys_clk.clk_reset axi_ad9144_dma.s_axi_reset reset

    add_connection sys_clk.clk_reset axi_ad9680_core.s_axi_reset reset

    add_connection sys_clk.clk_reset axi_ad9680_dma.s_axi_reset reset

    add_connection sys_clk.clk_reset fpga_ddr4_cntrl.global_reset_reset_sink reset

    add_connection sys_clk.clk_reset sys_dma_clk.clk_in_reset reset

    add_connection sys_clk.clk_reset sys_gpio_in.reset reset

    add_connection sys_clk.clk_reset sys_gpio_out.reset reset

    add_connection sys_clk.clk_reset sys_hps.h2f_lw_axi_reset reset

    add_connection sys_clk.clk_reset sys_spi.reset reset

    add_connection sys_clk.clk_reset util_ad9680_cpack.if_adc_rst reset

    add_connection sys_dma_clk.clk ad9680_adcfifo.if_dma_clk clock

    add_connection sys_dma_clk.clk avl_ad9144_fifo.if_dma_clk clock

    add_connection sys_dma_clk.clk axi_ad9144_dma.if_m_axis_aclk clock

    add_connection sys_dma_clk.clk axi_ad9144_dma.m_src_axi_clock clock

    add_connection sys_dma_clk.clk axi_ad9680_dma.if_s_axis_aclk clock

    add_connection sys_dma_clk.clk axi_ad9680_dma.m_dest_axi_clock clock

    add_connection sys_dma_clk.clk sys_hps.f2sdram0_clock clock

    add_connection sys_dma_clk.clk_reset ad9680_adcfifo.if_adc_rst reset

    add_connection sys_dma_clk.clk_reset avl_ad9144_fifo.if_dma_rst reset

    add_connection sys_dma_clk.clk_reset axi_ad9144_dma.m_src_axi_reset reset

    add_connection sys_dma_clk.clk_reset axi_ad9680_dma.m_dest_axi_reset reset

    add_connection sys_dma_clk.clk_reset sys_hps.f2sdram0_reset reset

    add_connection sys_hps.f2h_irq0 ad9144_jesd204.interrupt interrupt
    set_connection_parameter_value sys_hps.f2h_irq0/ad9144_jesd204.interrupt irqNumber {9}

    add_connection sys_hps.f2h_irq0 ad9680_jesd204.interrupt interrupt
    set_connection_parameter_value sys_hps.f2h_irq0/ad9680_jesd204.interrupt irqNumber {8}

    add_connection sys_hps.f2h_irq0 axi_ad9144_dma.interrupt_sender interrupt
    set_connection_parameter_value sys_hps.f2h_irq0/axi_ad9144_dma.interrupt_sender irqNumber {11}

    add_connection sys_hps.f2h_irq0 axi_ad9680_dma.interrupt_sender interrupt
    set_connection_parameter_value sys_hps.f2h_irq0/axi_ad9680_dma.interrupt_sender irqNumber {10}

    add_connection sys_hps.f2h_irq0 sys_gpio_in.irq interrupt
    set_connection_parameter_value sys_hps.f2h_irq0/sys_gpio_in.irq irqNumber {5}

    add_connection sys_hps.f2h_irq0 sys_spi.irq interrupt
    set_connection_parameter_value sys_hps.f2h_irq0/sys_spi.irq irqNumber {7}

    add_connection sys_hps.h2f_lw_axi_master ad9144_jesd204.lane_pll_reconfig avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9144_jesd204.lane_pll_reconfig arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9144_jesd204.lane_pll_reconfig baseAddress {0x00026000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9144_jesd204.lane_pll_reconfig defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master ad9144_jesd204.link_management avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9144_jesd204.link_management arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9144_jesd204.link_management baseAddress {0x00024000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9144_jesd204.link_management defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master ad9144_jesd204.link_pll_reconfig avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9144_jesd204.link_pll_reconfig arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9144_jesd204.link_pll_reconfig baseAddress {0x00025000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9144_jesd204.link_pll_reconfig defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master ad9144_jesd204.link_reconfig avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9144_jesd204.link_reconfig arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9144_jesd204.link_reconfig baseAddress {0x00020000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9144_jesd204.link_reconfig defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master ad9680_jesd204.link_management avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9680_jesd204.link_management arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9680_jesd204.link_management baseAddress {0x00044000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9680_jesd204.link_management defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master ad9680_jesd204.link_pll_reconfig avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9680_jesd204.link_pll_reconfig arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9680_jesd204.link_pll_reconfig baseAddress {0x00045000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9680_jesd204.link_pll_reconfig defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master ad9680_jesd204.link_reconfig avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9680_jesd204.link_reconfig arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9680_jesd204.link_reconfig baseAddress {0x00040000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/ad9680_jesd204.link_reconfig defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master avl_adxcfg_0.rcfg_s0 avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_0.rcfg_s0 arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_0.rcfg_s0 baseAddress {0x00028000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_0.rcfg_s0 defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master avl_adxcfg_0.rcfg_s1 avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_0.rcfg_s1 arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_0.rcfg_s1 baseAddress {0x00048000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_0.rcfg_s1 defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master avl_adxcfg_1.rcfg_s0 avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_1.rcfg_s0 arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_1.rcfg_s0 baseAddress {0x00029000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_1.rcfg_s0 defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master avl_adxcfg_1.rcfg_s1 avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_1.rcfg_s1 arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_1.rcfg_s1 baseAddress {0x00049000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_1.rcfg_s1 defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master avl_adxcfg_2.rcfg_s0 avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_2.rcfg_s0 arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_2.rcfg_s0 baseAddress {0x0002a000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_2.rcfg_s0 defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master avl_adxcfg_2.rcfg_s1 avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_2.rcfg_s1 arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_2.rcfg_s1 baseAddress {0x0004a000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_2.rcfg_s1 defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master avl_adxcfg_3.rcfg_s0 avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_3.rcfg_s0 arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_3.rcfg_s0 baseAddress {0x0002b000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_3.rcfg_s0 defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master avl_adxcfg_3.rcfg_s1 avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_3.rcfg_s1 arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_3.rcfg_s1 baseAddress {0x0004b000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/avl_adxcfg_3.rcfg_s1 defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master axi_ad9144_core.s_axi avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad9144_core.s_axi arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad9144_core.s_axi baseAddress {0x00030000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad9144_core.s_axi defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master axi_ad9144_dma.s_axi avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad9144_dma.s_axi arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad9144_dma.s_axi baseAddress {0x0002c000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad9144_dma.s_axi defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master axi_ad9680_core.s_axi avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad9680_core.s_axi arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad9680_core.s_axi baseAddress {0x00050000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad9680_core.s_axi defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master axi_ad9680_dma.s_axi avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad9680_dma.s_axi arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad9680_dma.s_axi baseAddress {0x0004c000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/axi_ad9680_dma.s_axi defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master sys_gpio_in.s1 avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_in.s1 arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_in.s1 baseAddress {0x0000}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_in.s1 defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master sys_gpio_out.s1 avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_out.s1 arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_out.s1 baseAddress {0x0020}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_gpio_out.s1 defaultConnection {0}

    add_connection sys_hps.h2f_lw_axi_master sys_spi.spi_control_port avalon
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_spi.spi_control_port arbitrationPriority {1}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_spi.spi_control_port baseAddress {0x0040}
    set_connection_parameter_value sys_hps.h2f_lw_axi_master/sys_spi.spi_control_port defaultConnection {0}

    add_connection sys_hps.h2f_user0_clock sys_dma_clk.clk_in clock

    add_connection sys_hps_ddr4_cntrl.hps_emif_conduit_end sys_hps.emif conduit
    set_connection_parameter_value sys_hps_ddr4_cntrl.hps_emif_conduit_end/sys_hps.emif endPort {}
    set_connection_parameter_value sys_hps_ddr4_cntrl.hps_emif_conduit_end/sys_hps.emif endPortLSB {0}
    set_connection_parameter_value sys_hps_ddr4_cntrl.hps_emif_conduit_end/sys_hps.emif startPort {}
    set_connection_parameter_value sys_hps_ddr4_cntrl.hps_emif_conduit_end/sys_hps.emif startPortLSB {0}
    set_connection_parameter_value sys_hps_ddr4_cntrl.hps_emif_conduit_end/sys_hps.emif width {0}

    add_connection util_ad9144_upack.if_dac_valid avl_ad9144_fifo.if_dac_valid conduit
    set_connection_parameter_value util_ad9144_upack.if_dac_valid/avl_ad9144_fifo.if_dac_valid endPort {}
    set_connection_parameter_value util_ad9144_upack.if_dac_valid/avl_ad9144_fifo.if_dac_valid endPortLSB {0}
    set_connection_parameter_value util_ad9144_upack.if_dac_valid/avl_ad9144_fifo.if_dac_valid startPort {}
    set_connection_parameter_value util_ad9144_upack.if_dac_valid/avl_ad9144_fifo.if_dac_valid startPortLSB {0}
    set_connection_parameter_value util_ad9144_upack.if_dac_valid/avl_ad9144_fifo.if_dac_valid width {0}

    add_connection util_ad9680_cpack.if_adc_data ad9680_adcfifo.if_adc_wdata conduit
    set_connection_parameter_value util_ad9680_cpack.if_adc_data/ad9680_adcfifo.if_adc_wdata endPort {}
    set_connection_parameter_value util_ad9680_cpack.if_adc_data/ad9680_adcfifo.if_adc_wdata endPortLSB {0}
    set_connection_parameter_value util_ad9680_cpack.if_adc_data/ad9680_adcfifo.if_adc_wdata startPort {}
    set_connection_parameter_value util_ad9680_cpack.if_adc_data/ad9680_adcfifo.if_adc_wdata startPortLSB {0}
    set_connection_parameter_value util_ad9680_cpack.if_adc_data/ad9680_adcfifo.if_adc_wdata width {0}

    add_connection util_ad9680_cpack.if_adc_valid ad9680_adcfifo.if_adc_wr conduit
    set_connection_parameter_value util_ad9680_cpack.if_adc_valid/ad9680_adcfifo.if_adc_wr endPort {}
    set_connection_parameter_value util_ad9680_cpack.if_adc_valid/ad9680_adcfifo.if_adc_wr endPortLSB {0}
    set_connection_parameter_value util_ad9680_cpack.if_adc_valid/ad9680_adcfifo.if_adc_wr startPort {}
    set_connection_parameter_value util_ad9680_cpack.if_adc_valid/ad9680_adcfifo.if_adc_wr startPortLSB {0}
    set_connection_parameter_value util_ad9680_cpack.if_adc_valid/ad9680_adcfifo.if_adc_wr width {0}

    # exported interfaces
    add_interface rx_ref_clk clock sink
    set_interface_property rx_ref_clk EXPORT_OF ad9680_jesd204.ref_clk
    add_interface rx_serial_data conduit end
    set_interface_property rx_serial_data EXPORT_OF ad9680_jesd204.serial_data
    add_interface rx_sync conduit end
    set_interface_property rx_sync EXPORT_OF ad9680_jesd204.sync
    add_interface rx_sysref conduit end
    set_interface_property rx_sysref EXPORT_OF ad9680_jesd204.sysref
    add_interface sys_clk clock sink
    set_interface_property sys_clk EXPORT_OF sys_clk.clk_in
    add_interface sys_ddr4_mem conduit end
    set_interface_property sys_ddr4_mem EXPORT_OF fpga_ddr4_cntrl.mem_conduit_end
    add_interface sys_ddr4_oct conduit end
    set_interface_property sys_ddr4_oct EXPORT_OF fpga_ddr4_cntrl.oct_conduit_end
    add_interface sys_ddr4_ref_clk clock sink
    set_interface_property sys_ddr4_ref_clk EXPORT_OF fpga_ddr4_cntrl.pll_ref_clk_clock_sink
    add_interface sys_ddr4_status conduit end
    set_interface_property sys_ddr4_status EXPORT_OF fpga_ddr4_cntrl.status_conduit_end
    add_interface sys_gpio_in conduit end
    set_interface_property sys_gpio_in EXPORT_OF sys_gpio_in.external_connection
    add_interface sys_gpio_out conduit end
    set_interface_property sys_gpio_out EXPORT_OF sys_gpio_out.external_connection
    add_interface sys_hps_ddr conduit end
    set_interface_property sys_hps_ddr EXPORT_OF sys_hps_ddr4_cntrl.mem_conduit_end
    add_interface sys_hps_ddr_oct conduit end
    set_interface_property sys_hps_ddr_oct EXPORT_OF sys_hps_ddr4_cntrl.oct_conduit_end
    add_interface sys_hps_ddr_ref_clk clock sink
    set_interface_property sys_hps_ddr_ref_clk EXPORT_OF sys_hps_ddr4_cntrl.pll_ref_clk_clock_sink
    add_interface sys_hps_ddr_rstn reset sink
    set_interface_property sys_hps_ddr_rstn EXPORT_OF sys_hps_ddr4_cntrl.global_reset_reset_sink
    add_interface sys_hps_out_rstn reset source
    set_interface_property sys_hps_out_rstn EXPORT_OF sys_hps.h2f_reset
    add_interface sys_hps_rstn reset sink
    set_interface_property sys_hps_rstn EXPORT_OF sys_hps.f2h_cold_reset_req
    add_interface sys_rstn reset sink
    set_interface_property sys_rstn EXPORT_OF sys_clk.clk_in_reset
    add_interface sys_spi conduit end
    set_interface_property sys_spi EXPORT_OF sys_spi.external
    add_interface tx_fifo_bypass conduit end
    set_interface_property tx_fifo_bypass EXPORT_OF avl_ad9144_fifo.if_bypass
    add_interface tx_ref_clk clock sink
    set_interface_property tx_ref_clk EXPORT_OF ad9144_jesd204.ref_clk
    add_interface tx_serial_data conduit end
    set_interface_property tx_serial_data EXPORT_OF ad9144_jesd204.serial_data
    add_interface tx_sync conduit end
    set_interface_property tx_sync EXPORT_OF ad9144_jesd204.sync
    add_interface tx_sysref conduit end
    set_interface_property tx_sysref EXPORT_OF ad9144_jesd204.sysref

    # interconnect requirements
    set_interconnect_requirement {$system} {qsys_mm.burstAdapterImplementation} {PER_BURST_TYPE_CONVERTER}
    set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {AUTO}
    set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {4}
}
