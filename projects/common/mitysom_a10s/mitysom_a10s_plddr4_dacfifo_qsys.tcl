proc ad_dacfifo_create {dac_fifo_name dac_data_width dac_dma_data_width dac_fifo_address_width} {

# pl-ddr4 settings

add_instance sys_ddr4_cntrl altera_emif

set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_ADDR_ORDER_ENUM} {DDR4_CTRL_ADDR_ORDER_CS_R_B_C_BG}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_AUTO_POWER_DOWN_CYCS} {32}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_AUTO_POWER_DOWN_EN} {0}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_AUTO_PRECHARGE_EN} {0}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_AVL_PROTOCOL_ENUM} {CTRL_AVL_PROTOCOL_MM}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_ECC_AUTO_CORRECTION_EN} {0}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_ECC_EN} {0}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_MMR_EN} {0}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_RD_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_RD_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_RD_TO_WR_SAME_CHIP_DELTA_CYCS} {0}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_REORDER_EN} {1}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_SELF_REFRESH_EN} {0}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_STARVE_LIMIT} {10}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_USER_PRIORITY_EN} {0}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_USER_REFRESH_EN} {0}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_WR_TO_RD_DIFF_CHIP_DELTA_CYCS} {0}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_WR_TO_RD_SAME_CHIP_DELTA_CYCS} {0}
set_instance_parameter_value sys_ddr4_cntrl {CTRL_DDR4_WR_TO_WR_DIFF_CHIP_DELTA_CYCS} {0}

set_instance_parameter_value sys_ddr4_cntrl {DIAG_BOARD_DELAY_CONFIG_STR} {}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_ABSTRACT_PHY} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_BYPASS_DEFAULT_PATTERN} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_BYPASS_REPEAT_STAGE} {1}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_BYPASS_STRESS_STAGE} {1}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_BYPASS_USER_STAGE} {1}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_CAL_ADDR0} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_CAL_ADDR1} {8}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_CAL_ENABLE_NON_DES} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_CAL_FULL_CAL_ON_RESET} {1}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_EFFICIENCY_MONITOR} {EFFMON_MODE_DISABLED}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_EXPORT_SEQ_AVALON_MASTER} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_EXPORT_SEQ_AVALON_SLAVE} {CAL_DEBUG_EXPORT_MODE_DISABLED}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_EX_DESIGN_ISSP_EN} {1}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_EX_DESIGN_NUM_OF_SLAVES} {1}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_EX_DESIGN_SEPARATE_RZQS} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_INTERFACE_ID} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_SEPARATE_READ_WRITE_ITFS} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_SIM_CAL_MODE_ENUM} {SIM_CAL_MODE_SKIP}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_SKIP_CA_DESKEW} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_SKIP_CA_LEVEL} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_SKIP_VREF_CAL} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_TG_BE_PATTERN_LENGTH} {8}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_TG_DATA_PATTERN_LENGTH} {8}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_DDR4_USE_TG_AVL_2} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_ECLIPSE_DEBUG} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_ENABLE_HPS_EMIF_DEBUG} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_ENABLE_JTAG_UART} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_ENABLE_JTAG_UART_HEX} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_EXPORT_VJI} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_EXPOSE_DFT_SIGNALS} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_EXTRA_CONFIGS} {}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_EXT_DOCS} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_EX_DESIGN_ADD_TEST_EMIFS} {}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_EX_DESIGN_SEPARATE_RESETS} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_FAST_SIM_OVERRIDE} {FAST_SIM_OVERRIDE_DEFAULT}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_RS232_UART_BAUDRATE} {57600}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_SIM_REGTEST_MODE} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_SOFT_NIOS_CLOCK_FREQUENCY} {100}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_SOFT_NIOS_MODE} {SOFT_NIOS_MODE_DISABLED}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_SYNTH_FOR_SIM} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_TG_AVL_2_EXPORT_CFG_INTERFACE} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_TG_AVL_2_NUM_CFG_INTERFACES} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_TIMING_REGTEST_MODE} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_USE_BOARD_DELAY_MODEL} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_USE_RS232_UART} {0}
set_instance_parameter_value sys_ddr4_cntrl {DIAG_VERBOSE_IOAUX} {0}

set_instance_parameter_value sys_ddr4_cntrl {EX_DESIGN_GUI_DDR4_GEN_SIM} {1}
set_instance_parameter_value sys_ddr4_cntrl {EX_DESIGN_GUI_DDR4_GEN_SYNTH} {1}
set_instance_parameter_value sys_ddr4_cntrl {EX_DESIGN_GUI_DDR4_HDL_FORMAT} {HDL_FORMAT_VERILOG}
set_instance_parameter_value sys_ddr4_cntrl {EX_DESIGN_GUI_DDR4_PREV_PRESET} {TARGET_DEV_KIT_NONE}
set_instance_parameter_value sys_ddr4_cntrl {EX_DESIGN_GUI_DDR4_SEL_DESIGN} {AVAIL_EX_DESIGNS_GEN_DESIGN}
set_instance_parameter_value sys_ddr4_cntrl {EX_DESIGN_GUI_DDR4_TARGET_DEV_KIT} {TARGET_DEV_KIT_NONE}

set_instance_parameter_value sys_ddr4_cntrl {INTERNAL_TESTING_MODE} {0}
set_instance_parameter_value sys_ddr4_cntrl {IS_ED_SLAVE} {0}

set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_AC_PARITY_LATENCY} {DDR4_AC_PARITY_LATENCY_DISABLE}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_AC_PERSISTENT_ERROR} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_ALERT_N_AC_LANE} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_ALERT_N_AC_PIN} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_ALERT_N_DQS_GROUP} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_ALERT_N_PLACEMENT_ENUM} {DDR4_ALERT_N_PLACEMENT_AUTO}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_ALERT_PAR_EN} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_ASR_ENUM} {DDR4_ASR_MANUAL_NORMAL}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_ATCL_ENUM} {DDR4_ATCL_DISABLED}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_BANK_ADDR_WIDTH} {2}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_BANK_GROUP_WIDTH} {2}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_BL_ENUM} {DDR4_BL_BL8}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_BT_ENUM} {DDR4_BT_SEQUENTIAL}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_CAL_MODE} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_CHIP_ID_WIDTH} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_CKE_PER_DIMM} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_CK_WIDTH} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_COL_ADDR_WIDTH} {10}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_DB_DQ_DRV_ENUM} {DDR4_DB_DRV_STR_RZQ_7}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_DB_RTT_NOM_ENUM} {DDR4_DB_RTT_NOM_ODT_DISABLED}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_DB_RTT_PARK_ENUM} {DDR4_DB_RTT_PARK_ODT_DISABLED}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_DB_RTT_WR_ENUM} {DDR4_DB_RTT_WR_RZQ_3}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_DEFAULT_VREFOUT} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_DISCRETE_CS_WIDTH} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_DISCRETE_MIRROR_ADDRESSING_EN} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_DLL_EN} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_DM_EN} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_DQ_PER_DQS} {8}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_DQ_WIDTH} {16}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_DRV_STR_ENUM} {DDR4_DRV_STR_RZQ_5}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_FINE_GRANULARITY_REFRESH} {DDR4_FINE_REFRESH_FIXED_1X}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_FORMAT_ENUM} {MEM_FORMAT_DISCRETE}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_GEARDOWN} {DDR4_GEARDOWN_HR}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_HIDE_ADV_MR_SETTINGS} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_INTERNAL_VREFDQ_MONITOR} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_LRDIMM_ODT_LESS_BS} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_LRDIMM_ODT_LESS_BS_PARK_OHM} {240}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_LRDIMM_VREFDQ_VALUE} {}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_MAX_POWERDOWN} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_MIRROR_ADDRESSING_EN} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_MPR_READ_FORMAT} {DDR4_MPR_READ_FORMAT_SERIAL}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_NUM_OF_DIMMS} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_ODT_IN_POWERDOWN} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_PER_DRAM_ADDR} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_RANKS_PER_DIMM} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_RCD_CA_IBT_ENUM} {DDR4_RCD_CA_IBT_100}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_RCD_CKE_IBT_ENUM} {DDR4_RCD_CKE_IBT_100}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_RCD_CS_IBT_ENUM} {DDR4_RCD_CS_IBT_100}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_RCD_ODT_IBT_ENUM} {DDR4_RCD_ODT_IBT_100}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_READ_DBI} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_READ_PREAMBLE} {2}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_READ_PREAMBLE_TRAINING} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_ROW_ADDR_WIDTH} {16}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_RTT_NOM_ENUM} {DDR4_RTT_NOM_RZQ_4}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_RTT_PARK} {DDR4_RTT_PARK_ODT_DISABLED}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_RTT_WR_ENUM} {DDR4_RTT_WR_ODT_DISABLED}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_R_ODT0_1X1} {off}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_R_ODT0_2X2} {off off}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_R_ODT0_4X2} {off off on on}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_R_ODT0_4X4} {off off off off}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_R_ODT1_2X2} {off off}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_R_ODT1_4X2} {on on off off}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_R_ODT1_4X4} {off off on on}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_R_ODT2_4X4} {off off off off}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_R_ODT3_4X4} {on on off off}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_R_ODTN_1X1} {Rank\ 0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_R_ODTN_2X2} {Rank\ 0 Rank\ 1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_R_ODTN_4X2} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_R_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SELF_RFSH_ABORT} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_133_RCD_DB_VENDOR_LSB} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_134_RCD_DB_VENDOR_MSB} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_135_RCD_REV} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_137_RCD_CA_DRV} {101}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_138_RCD_CK_DRV} {5}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_139_DB_REV} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_140_DRAM_VREFDQ_R0} {29}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_141_DRAM_VREFDQ_R1} {29}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_142_DRAM_VREFDQ_R2} {29}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_143_DRAM_VREFDQ_R3} {29}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_144_DB_VREFDQ} {37}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_145_DB_MDQ_DRV} {21}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_148_DRAM_DRV} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_149_DRAM_RTT_WR_NOM} {20}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPD_152_DRAM_RTT_PARK} {39}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_SPEEDBIN_ENUM} {DDR4_SPEEDBIN_2133}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TCCD_L_CYC} {6}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TCCD_S_CYC} {4}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TCL} {16}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TDIVW_DJ_CYC} {0.1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TDIVW_TOTAL_UI} {0.2}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TDQSCK_PS} {180}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TDQSQ_PS} {66}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TDQSQ_UI} {0.16}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TDQSS_CYC} {0.27}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TDSH_CYC} {0.18}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TDSS_CYC} {0.18}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TDVWP_UI} {0.69}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TEMP_CONTROLLED_RFSH_ENA} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TEMP_CONTROLLED_RFSH_RANGE} {DDR4_TEMP_CONTROLLED_RFSH_NORMAL}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TEMP_SENSOR_READOUT} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TFAW_NS} {21.0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TIH_DC_MV} {75}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TIH_PS} {95}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TINIT_US} {500}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TIS_AC_MV} {100}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TIS_PS} {60}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TMRD_CK_CYC} {8}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TQH_CYC} {0.38}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TQH_UI} {0.76}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TQSH_CYC} {0.38}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TRAS_NS} {33.0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TRCD_NS} {15.0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TREFI_US} {7.8}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TRFC_NS} {350.0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TRP_NS} {15.0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TRRD_L_CYC} {6}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TRRD_S_CYC} {4}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TWLH_PS} {108.0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TWLS_PS} {108.0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TWR_NS} {15.0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TWTR_L_CYC} {8}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_TWTR_S_CYC} {3}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_USER_VREFDQ_TRAINING_RANGE} {DDR4_VREFDQ_TRAINING_RANGE_1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_USER_VREFDQ_TRAINING_VALUE} {56.0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_USE_DEFAULT_ODT} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_VDIVW_TOTAL} {136}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_WRITE_CRC} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_WRITE_DBI} {0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_WRITE_PREAMBLE} {1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_WTCL} {11}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_W_ODT0_1X1} {on}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_W_ODT0_2X2} {on off}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_W_ODT0_4X2} {off off on on}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_W_ODT0_4X4} {on on off off}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_W_ODT1_2X2} {off on}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_W_ODT1_4X2} {on on off off}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_W_ODT1_4X4} {off off on on}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_W_ODT2_4X4} {off off on on}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_W_ODT3_4X4} {on on off off}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_W_ODTN_1X1} {Rank\ 0}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_W_ODTN_2X2} {Rank\ 0 Rank\ 1}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_W_ODTN_4X2} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}
set_instance_parameter_value sys_ddr4_cntrl {MEM_DDR4_W_ODTN_4X4} {Rank\ 0 Rank\ 1 Rank\ 2 Rank\ 3}

set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_CONFIG_ENUM} {CONFIG_PHY_AND_HARD_CTRL}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_CORE_CLKS_SHARING_ENUM} {CORE_CLKS_SHARING_DISABLED}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_DEFAULT_IO} {0}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_DEFAULT_REF_CLK_FREQ} {1}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_HPS_ENABLE_EARLY_RELEASE} {0}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_IO_VOLTAGE} {1.2}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_MEM_CLK_FREQ_MHZ} {1066.6667}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_RATE_ENUM} {RATE_QUARTER}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_REF_CLK_JITTER_PS} {10.0}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_AC_IO_STD_ENUM} {IO_STD_SSTL_12}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_AC_MODE_ENUM} {OUT_OCT_40_CAL}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_AC_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_AUTO_STARTING_VREFIN_EN} {0}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_CK_IO_STD_ENUM} {IO_STD_SSTL_12}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_CK_MODE_ENUM} {OUT_OCT_40_CAL}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_CK_SLEW_RATE_ENUM} {SLEW_RATE_FAST}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_DATA_IN_MODE_ENUM} {IN_OCT_120_CAL}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_DATA_IO_STD_ENUM} {IO_STD_POD_12}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_DATA_OUT_MODE_ENUM} {OUT_OCT_34_CAL}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_PERIODIC_OCT_RECAL_ENUM} {PERIODIC_OCT_RECAL_AUTO}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_PING_PONG_EN} {0}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_PLL_REF_CLK_IO_STD_ENUM} {IO_STD_LVDS}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_REF_CLK_FREQ_MHZ} {-1.0}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_RZQ_IO_STD_ENUM} {IO_STD_CMOS_12}
set_instance_parameter_value sys_ddr4_cntrl {PHY_DDR4_USER_STARTING_VREFIN} {64.2}

set_instance_parameter_value sys_ddr4_cntrl {PLL_ADD_EXTRA_CLKS} {0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_5} {50.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_6} {50.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_7} {50.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_8} {50.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_5} {100.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_6} {100.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_7} {100.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_8} {100.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_5} {0.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_6} {0.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_7} {0.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_8} {0.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_5} {0.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_6} {0.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_7} {0.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_8} {0.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_5} {50.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_6} {50.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_7} {50.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_8} {50.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_5} {100.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_6} {100.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_7} {100.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_8} {100.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_PHASE_GUI_5} {0.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_PHASE_GUI_6} {0.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_PHASE_GUI_7} {0.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_DESIRED_PHASE_GUI_8} {0.0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_0} {0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_1} {0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_2} {0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_3} {0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_4} {0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_5} {0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_6} {0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_7} {0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_8} {0}
set_instance_parameter_value sys_ddr4_cntrl {PLL_USER_NUM_OF_EXTRA_CLKS} {0}
set_instance_parameter_value sys_ddr4_cntrl {PROTOCOL_ENUM} {PROTOCOL_DDR4}
set_instance_parameter_value sys_ddr4_cntrl {SHORT_QSYS_INTERFACE_NAMES} {1}

add_interface sys_ddr_ref_clk clock sink
set_interface_property sys_ddr_ref_clk EXPORT_OF sys_ddr4_cntrl.pll_ref_clk
add_interface sys_ddr_oct conduit end
set_interface_property sys_ddr_oct EXPORT_OF sys_ddr4_cntrl.oct
add_interface sys_ddr_mem conduit end
set_interface_property sys_ddr_mem EXPORT_OF sys_ddr4_cntrl.mem
add_interface sys_ddr_status conduit end
set_interface_property sys_ddr_status EXPORT_OF sys_ddr4_cntrl.status

add_instance $dac_fifo_name avl_dacfifo
set_instance_parameter_value $dac_fifo_name {DAC_DATA_WIDTH} $dac_data_width
set_instance_parameter_value $dac_fifo_name {DMA_DATA_WIDTH} $dac_dma_data_width
set_instance_parameter_value $dac_fifo_name {AVL_DATA_WIDTH} {128}
set_instance_parameter_value $dac_fifo_name {AVL_ADDRESS_WIDTH} {27}
set_instance_parameter_value $dac_fifo_name {AVL_BASE_ADDRESS} {0}
set_instance_parameter_value $dac_fifo_name {AVL_ADDRESS_LIMIT} {0x8fffffff}
set_instance_parameter_value $dac_fifo_name {DAC_MEM_ADDRESS_WIDTH} {12}
set_instance_parameter_value $dac_fifo_name {DMA_MEM_ADDRESS_WIDTH} {12}
set_instance_parameter_value $dac_fifo_name {AVL_BURST_LENGTH} {64}

add_connection sys_clk.clk_reset sys_ddr4_cntrl.global_reset_n
add_connection sys_ddr4_cntrl.emif_usr_reset_n $dac_fifo_name.avl_reset
add_connection sys_ddr4_cntrl.emif_usr_clk $dac_fifo_name.avl_clock
add_connection $dac_fifo_name.amm_ddr sys_ddr4_cntrl.ctrl_amm_0
set_connection_parameter_value $dac_fifo_name.amm_ddr/sys_ddr4_cntrl.ctrl_amm_0 baseAddress {0x0}

}