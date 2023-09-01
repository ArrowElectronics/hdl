set wADC 1
set wDAC 1
set wFAB_EMAC 1
set wRGB_LED0 1
set wRGB_LED1 1
set wRGB_LED2 1
set wRGB_LED3 1
set wHPS_LED0 1
set wHPS_LED1 1
set wFAB_QSPI 1
set wFAB_LPDDR4 1
set wHDMI 1
set wHPS_LED0 1
set wHPS_LED1 1
set wHPS_UART0 1
set wHPS_I2C0 1
set wMUX_I2C 1
set wHPS_PB 1
set wHPS_DIPSW 1
set wHPS_USB 1
set wHPS_EMAC2 1
set wHPS_SD 1
set wHPS 1
set wFMC 1
set wFAB_pB 1
set wFAB_DIPSW 1
set wCRUVI_HS_1 1
set wCRUVI_HS_2 1
set wCRUVI_LS_1 1
set wCRUVI_LS_2 1
set wSFP10G_1 1
set wSFP10G_2 1
set wFMC_XCVRS 1
set wPCIe 1

set_location_assignment PIN_BR102  -to SDM_CLK_25MHz
set_instance_assignment -name IO_STANDARD "1.8 V" -to SDM_CLK_25MHz
set_location_assignment PIN_W135   -to HPS_OSC_CLK_25MHz
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_OSC_CLK_25MHz

# Bank 1C (GXBL1C)
set_location_assignment PIN_AP120  -to USB_REFCLK_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to USB_REFCLK_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to USB_REFCLK_n

# Bank 1C (GXBL1C)
set_location_assignment PIN_AT120  -to SFP_REFCLK_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to SFP_REFCLK_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to SFP_REFCLK_n


set_location_assignment PIN_J2  -to PWR_SDA
set_instance_assignment -name IO_STANDARD "1.8 V" -to PWR_SDA
set_location_assignment PIN_G2  -to PWR_SCL
set_instance_assignment -name IO_STANDARD "1.8 V" -to PWR_SCL


if {$wFAB_pB == 1} {
# Bank HVIO_6D (3.3V)
set_location_assignment PIN_B30  -to PB[2]
set_instance_assignment -name IO_STANDARD "3.3 V" -to PB[2]
set_location_assignment PIN_A30  -to PB[3]
set_instance_assignment -name IO_STANDARD "3.3 V" -to PB[3]
}

if {$wFAB_DIPSW == 1} {
set_location_assignment PIN_  -to HPS_DIPSW[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_DIPSW[2]
set_location_assignment PIN_  -to HPS_DIPSW[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_DIPSW[3]
}


# Bank HVIO_6D (3.3V)
if {$wADC == 1} {
set_location_assignment PIN_A8  -to ADC_CLK
set_instance_assignment -name IO_STANDARD "3.3 V" -to ADC_CLK
set_location_assignment PIN_B4  -to ADC_DIN
set_instance_assignment -name IO_STANDARD "3.3 V" -to ADC_DIN
set_location_assignment PIN_A11  -to ADC_DOUT
set_instance_assignment -name IO_STANDARD "3.3 V" -to ADC_DOUT
set_location_assignment PIN_B11  -to ADC_SYNC
set_instance_assignment -name IO_STANDARD "3.3 V" -to ADC_SYNC
}

# Bank HVIO_6D (3.3V)
if {$wDAC == 1} {
set_location_assignment PIN_B14  -to DAC_CLK
set_instance_assignment -name IO_STANDARD "3.3 V" -to DAC_CLK
set_location_assignment PIN_A14  -to DAC_DIN
set_instance_assignment -name IO_STANDARD "3.3 V" -to DAC_DIN
set_location_assignment PIN_A20  -to DAC_LDAC
set_instance_assignment -name IO_STANDARD "3.3 V" -to DAC_LDAC
set_location_assignment PIN_A17  -to DAC_CLR
set_instance_assignment -name IO_STANDARD "3.3 V" -to DAC_CLR
set_location_assignment PIN_A23  -to DAC_SYNC1
set_instance_assignment -name IO_STANDARD "3.3 V" -to DAC_SYNC1
set_location_assignment PIN_B20  -to DAC_SYNC2
set_instance_assignment -name IO_STANDARD "3.3 V" -to DAC_SYNC2
}

# Bank HVIO_6C (1.8V)
if {$wFAB_EMAC == 1} {
set_location_assignment PIN_F27  -to ETH1_RST
set_instance_assignment -name IO_STANDARD "1.8 V" -to ETH1_RST
set_location_assignment PIN_F24  -to ETH1_TXCK
set_instance_assignment -name IO_STANDARD "1.8 V" -to ETH1_TXCK
set_location_assignment PIN_H27  -to ETH1_TXD[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to ETH1_TXD[0]
set_location_assignment PIN_D24  -to ETH1_TXD[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to ETH1_TXD[1]
set_location_assignment PIN_H18  -to ETH1_TXD[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to ETH1_TXD[2]
set_location_assignment PIN_D15  -to ETH1_TXD[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to ETH1_TXD[3]
set_location_assignment PIN_F18  -to ETH1_RXCTL
set_instance_assignment -name IO_STANDARD "1.8 V" -to ETH1_RXCTL
set_location_assignment PIN_F15  -to ETH1_TXCTL
set_instance_assignment -name IO_STANDARD "1.8 V" -to ETH1_TXCTL
set_location_assignment PIN_D8   -to ETH1_RXCK
set_instance_assignment -name IO_STANDARD "1.8 V" -to ETH1_RXCK
set_location_assignment PIN_K8   -to ETH1_RXD[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to ETH1_RXD[0]
set_location_assignment PIN_F8   -to ETH1_RXD[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to ETH1_RXD[1]
set_location_assignment PIN_H8   -to ETH1_RXD[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to ETH1_RXD[2]
set_location_assignment PIN_C2   -to ETH1_RXD[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to ETH1_RXD[3]
}

# Bank HVIO_5A
if {$wRGB_LED0 == 1} {
set_location_assignment PIN_CK125  -to LED0R
set_instance_assignment -name IO_STANDARD "3.3 V" -to LED0R
set_location_assignment PIN_CL125  -to LED0G
set_instance_assignment -name IO_STANDARD "3.3 V" -to LED0G
set_location_assignment PIN_BR118  -to LED0B
set_instance_assignment -name IO_STANDARD "3.3 V" -to LED0B
}
if {$wRGB_LED1 == 1} {
set_location_assignment PIN_BU118  -to LED1R
set_instance_assignment -name IO_STANDARD "3.3 V" -to LED1R
set_location_assignment PIN_BW118  -to LED1G
set_instance_assignment -name IO_STANDARD "3.3 V" -to LED1G
set_location_assignment PIN_CA118  -to LED1B
set_instance_assignment -name IO_STANDARD "3.3 V" -to LED1B
}
if {$wRGB_LED2 == 1} {
set_location_assignment PIN_CL128  -to LED2R
set_instance_assignment -name IO_STANDARD "3.3 V" -to LED2R
set_location_assignment PIN_CK128  -to LED2G
set_instance_assignment -name IO_STANDARD "3.3 V" -to LED2G
set_location_assignment PIN_CL130  -to LED2B
set_instance_assignment -name IO_STANDARD "3.3 V" -to LED2B
}
if {$wRGB_LED3 == 1} {
set_location_assignment PIN_CF128  -to LED3R
set_instance_assignment -name IO_STANDARD "3.3 V" -to LED3R
set_location_assignment PIN_CH132  -to LED3G
set_instance_assignment -name IO_STANDARD "3.3 V" -to LED3G
set_location_assignment PIN_CG135  -to LED3B
set_instance_assignment -name IO_STANDARD "3.3 V" -to LED3B
}

# Bank HVIO_6A/6B (1.8V)
if {$wHDMI == 1} {
set_location_assignment PIN_BH19  -to HDMI_SPDIF
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_SPDIF
set_location_assignment PIN_BE25  -to HDMI_VS
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_VS
set_location_assignment PIN_BF32  -to HDMI_HS
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_HS
set_location_assignment PIN_BK31  -to HDMI_CLK
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_CLK
set_location_assignment PIN_BF36  -to HDMI_DE
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_DE
set_location_assignment PIN_BF16  -to HDMI_INT
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_INT
set_location_assignment PIN_BF29  -to CT_HPD
set_instance_assignment -name IO_STANDARD "1.8 V" -to CT_HPD
set_location_assignment PIN_BU28  -to HDMI_D[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[0]
set_location_assignment PIN_BP31  -to HDMI_D[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[1]
set_location_assignment PIN_BR28  -to HDMI_D[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[2]
set_location_assignment PIN_BR31  -to HDMI_D[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[3]
set_location_assignment PIN_BU31  -to HDMI_D[4]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[4]
set_location_assignment PIN_BM28  -to HDMI_D[5]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[5]
set_location_assignment PIN_BW28  -to HDMI_D[6]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[6]
set_location_assignment PIN_BM31  -to HDMI_D[7]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[7]
set_location_assignment PIN_BP22  -to HDMI_D[8]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[8]
set_location_assignment PIN_BK28  -to HDMI_D[9]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[9]
set_location_assignment PIN_BR22  -to HDMI_D[10]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[10]
set_location_assignment PIN_CH12  -to HDMI_D[11]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[11]
set_location_assignment PIN_BU22  -to HDMI_D[12]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[12]
set_location_assignment PIN_BW19  -to HDMI_D[13]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[13]
set_location_assignment PIN_BH28  -to HDMI_D[14]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[14]
set_location_assignment PIN_BM22  -to HDMI_D[15]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[15]
set_location_assignment PIN_CF12  -to HDMI_D[16]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[16]
set_location_assignment PIN_BK19  -to HDMI_D[17]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[17]
set_location_assignment PIN_CF9   -to HDMI_D[18]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[18]
set_location_assignment PIN_BF21  -to HDMI_D[19]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[19]
set_location_assignment PIN_BE21  -to HDMI_D[20]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[20]
set_location_assignment PIN_BE43  -to HDMI_D[21]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[21]
set_location_assignment PIN_BF40  -to HDMI_D[22]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[22]
set_location_assignment PIN_BE29  -to HDMI_D[23]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_D[23]
}

# Bank HPS_IOA_7 (1.8V) - GPIO0_IO6
if {$wHPS_LED0 == 1} {
set_location_assignment PIN_AG115  -to HPS_LED1
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_LED1
}

# Bank HPS_IOA_8 (1.8V) - GPIO0_IO7
if {$wHPS_LED1 == 1} {
set_location_assignment PIN_W134  -to HPS_LED0
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_LED0
}

# Bank HPS_IOA (1.8V)
if {$wHPS_UART0 == 1} {
set_location_assignment PIN_R134  -to HPS_UART0_TX
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_UART0_TX
set_location_assignment PIN_AK115  -to HPS_UART0_RX
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_UART0_RX
}

# Bank HPS_IOA (1.8V)
if {$wHPS_I2C0 == 1} {
set_location_assignment PIN_U134  -to HPS_I2C0_SDA
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_I2C0_SDA
set_location_assignment PIN_AL120  -to HPS_I2C0_SCL
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_I2C0_SCL
}

# Bank HVIO_6C (1.8V)
if {$wMUX_I2C == 1} {
set_location_assignment PIN_F4  -to MUX_I2C_SDA
set_instance_assignment -name IO_STANDARD "1.8 V" -to MUX_I2C_SDA
set_location_assignment PIN_D4  -to MUX_I2C_SCL
set_instance_assignment -name IO_STANDARD "1.8 V" -to MUX_I2C_SCL
set_location_assignment PIN_K4  -to MUX_I2C_INT
set_instance_assignment -name IO_STANDARD "1.8 V" -to MUX_I2C_INT
}

# Bank HPS_IOA (1.8V)
if {$wHPS_USB == 1} {
set_location_assignment PIN_B134  -to USB_RST
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_RST
set_location_assignment PIN_P132  -to USB_CLK
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_CLK
set_location_assignment PIN_L135  -to USB_STP
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_STP
set_location_assignment PIN_J135  -to USB_DIR
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DIR
set_location_assignment PIN_AD134  -to USB_NXT
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_nXT
set_location_assignment PIN_AD135  -to USB_DATA[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[0]
set_location_assignment PIN_M132  -to USB_DATA[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[1]
set_location_assignment PIN_K132  -to USB_DATA[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[2]
set_location_assignment PIN_AG129  -to USB_DATA[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[3]
set_location_assignment PIN_J134  -to USB_DATA[4]
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[4]
set_location_assignment PIN_AG120  -to USB_DATA[5]
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[5]
set_location_assignment PIN_G134  -to USB_DATA[6]
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[6]
set_location_assignment PIN_G135  -to USB_DATA[7]
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[7]
# Bank 1C (GXBL1C)
set_location_assignment PIN_AN129  -to USB_SSTX_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to USB_SSTX_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to USB_SSTX_n
set_location_assignment PIN_AM135  -to USB_SSRX_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to USB_SSRX_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to USB_SSRX_n
}

# Bank HPS_IOB (1.8V)
if {$wHPS_EMAC2 == 1} {
set_location_assignment PIN_T124  -to HPS_ETH2_RST
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_RST
set_location_assignment PIN_M127  -to HPS_ETH2_TXCK
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_TXCK
set_location_assignment PIN_K124  -to HPS_ETH2_TXD[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_TXD[0]
set_location_assignment PIN_Y127  -to HPS_ETH2_TXD[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_TXD[1]
set_location_assignment PIN_F127  -to HPS_ETH2_TXD[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_TXD[2]
set_location_assignment PIN_Y124  -to HPS_ETH2_TXD[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_TXD[3]
set_location_assignment PIN_AB127  -to HPS_ETH2_RXCTL
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_RXCTL
set_location_assignment PIN_K127  -to HPS_ETH2_TXCTL
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_TXCTL
set_location_assignment PIN_M124   -to HPS_ETH2_RXCK
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_RXCK
set_location_assignment PIN_H127   -to HPS_ETH2_RXD[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_RXD[0]
set_location_assignment PIN_AB124   -to HPS_ETH2_RXD[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_RXD[1]
set_location_assignment PIN_F124   -to HPS_ETH2_RXD[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_RXD[2]
set_location_assignment PIN_D124   -to HPS_ETH2_RXD[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_RXD[3]
set_location_assignment PIN_Y132   -to HPS_ETH2_MDC
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_MDC
set_location_assignment PIN_T127   -to HPS_ETH2_MDIO
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_ETH2_MDIO
}

# Bank HPS_IOB (1.8V)
if {$wHPS_SD == 1} {
set_location_assignment PIN_D132  -to SD_CLK
set_instance_assignment -name IO_STANDARD "1.8 V" -to SD_CLK
set_location_assignment PIN_AB132  -to SD_CMD
set_instance_assignment -name IO_STANDARD "1.8 V" -to SD_CMD
set_location_assignment PIN_P124  -to SD_DETECT
set_instance_assignment -name IO_STANDARD "1.8 V" -to SD_DETECT
set_location_assignment PIN_E135  -to SD_DAT[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to SD_DAT[0]
set_location_assignment PIN_F132  -to SD_DAT[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to SD_DAT[1]
set_location_assignment PIN_AA135  -to SD_DAT[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to SD_DAT[2]
set_location_assignment PIN_V127  -to SD_DAT[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to SD_DAT[3]
}

# HPS LPDDR4 Bank 3A 1.1V_LPDDR4
if {$wHPS == 1} {
set_location_assignment PIN_AK107  -to HPS_LPDDR4_CK_p
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to HPS_LPDDR4_CK_p
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to HPS_LPDDR4_CK_n
set_location_assignment PIN_AG111  -to HPS_LPDDR4_RST
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_RST
set_location_assignment PIN_M105  -to HPS_LPDDR4_REFCK_p
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to HPS_LPDDR4_REFCK_p
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to HPS_LPDDR4_REFCK_n
set_location_assignment PIN_p105  -to HPS_LPDDR4_CS_n[1]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_CS_n[1]
set_location_assignment PIN_T105  -to HPS_LPDDR4_CS_n[0]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_CS_n[0]
set_location_assignment PIN_T108  -to HPS_LPDDR4_CKE[1]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_CKE[1]
set_location_assignment PIN_V108  -to HPS_LPDDR4_CKE[0]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_CKE[0]
set_location_assignment PIN_T114  -to HPS_LPDDR4_CA[0]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_CA[0]
set_location_assignment PIN_p114  -to HPS_LPDDR4_CA[1]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_CA[1]
set_location_assignment PIN_V117  -to HPS_LPDDR4_CA[2]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_CA[2]
set_location_assignment PIN_T117  -to HPS_LPDDR4_CA[3]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_CA[3]
set_location_assignment PIN_M114  -to HPS_LPDDR4_CA[4]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_CA[4]
set_location_assignment PIN_K114  -to HPS_LPDDR4_CA[5]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_CA[5]
set_location_assignment PIN_B128  -to HPS_LPDDR4_DQ[0]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[0]
set_location_assignment PIN_A128  -to HPS_LPDDR4_DQ[1]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[1]
set_location_assignment PIN_B130  -to HPS_LPDDR4_DQ[2]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[2]
set_location_assignment PIN_A130  -to HPS_LPDDR4_DQ[3]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[3]
set_location_assignment PIN_B116  -to HPS_LPDDR4_DQ[4]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[4]
set_location_assignment PIN_A116  -to HPS_LPDDR4_DQ[5]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[5]
set_location_assignment PIN_B113  -to HPS_LPDDR4_DQ[6]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[6]
set_location_assignment PIN_A113  -to HPS_LPDDR4_DQ[7]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[7]
set_location_assignment PIN_F117  -to HPS_LPDDR4_DQ[8]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[8]
set_location_assignment PIN_H117  -to HPS_LPDDR4_DQ[9]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[9]
set_location_assignment PIN_K117  -to HPS_LPDDR4_DQ[10]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[10]
set_location_assignment PIN_M117  -to HPS_LPDDR4_DQ[11]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[11]
set_location_assignment PIN_H108  -to HPS_LPDDR4_DQ[12]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to  HPS_LPDDR4_DQ[12]
set_location_assignment PIN_F108  -to HPS_LPDDR4_DQ[13]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to  HPS_LPDDR4_DQ[13]
set_location_assignment PIN_M108  -to HPS_LPDDR4_DQ[14]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to  HPS_LPDDR4_DQ[14]
set_location_assignment PIN_K108  -to HPS_LPDDR4_DQ[15]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[15]
set_location_assignment PIN_H98   -to HPS_LPDDR4_DQ[16]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[16]
set_location_assignment PIN_F98   -to HPS_LPDDR4_DQ[17]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[17]
set_location_assignment PIN_M98   -to HPS_LPDDR4_DQ[18]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[18]
set_location_assignment PIN_K98   -to HPS_LPDDR4_DQ[19]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[19]
set_location_assignment PIN_K87   -to HPS_LPDDR4_DQ[20]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[20]
set_location_assignment PIN_M87   -to HPS_LPDDR4_DQ[21]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[21]
set_location_assignment PIN_F84   -to HPS_LPDDR4_DQ[22]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[22]
set_location_assignment PIN_D84   -to HPS_LPDDR4_DQ[23]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[23]
set_location_assignment PIN_A106   -to HPS_LPDDR4_DQ[24]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[24]
set_location_assignment PIN_B103   -to HPS_LPDDR4_DQ[25]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[25]
set_location_assignment PIN_B106   -to HPS_LPDDR4_DQ[26]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[26]
set_location_assignment PIN_A110   -to HPS_LPDDR4_DQ[27]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[27]
set_location_assignment PIN_B91   -to HPS_LPDDR4_DQ[28]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[28]
set_location_assignment PIN_A94   -to HPS_LPDDR4_DQ[29]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[29]
set_location_assignment PIN_B88   -to HPS_LPDDR4_DQ[30]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[30]
set_location_assignment PIN_A91   -to HPS_LPDDR4_DQ[31]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DQ[31]
set_location_assignment PIN_F114   -to HPS_LPDDR4_DQSA_p[1]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to HPS_LPDDR4_DQSA_p[1]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to HPS_LPDDR4_DQSA_n[1]
set_location_assignment PIN_B122   -to HPS_LPDDR4_DQSA_p[0]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to HPS_LPDDR4_DQSA_p[0]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to HPS_LPDDR4_DQSA_n[0]
set_location_assignment PIN_A101   -to HPS_LPDDR4_DQSB_p[1]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to HPS_LPDDR4_DQSB_p[1]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to HPS_LPDDR4_DQSB_n[1]
set_location_assignment PIN_F95   -to HPS_LPDDR4_DQSB_p[0]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to HPS_LPDDR4_DQSB_p[0]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to HPS_LPDDR4_DQSB_n[0]
set_location_assignment PIN_F105   -to HPS_LPDDR4_DMA[1]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DMA[1]
set_location_assignment PIN_B119   -to HPS_LPDDR4_DMA[0]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DMA[0]
set_location_assignment PIN_B97   -to HPS_LPDDR4_DMB[1]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DMB[1]
set_location_assignment PIN_H87   -to HPS_LPDDR4_DMB[0]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_DMB[0]
set_location_assignment PIN_AK111   -to HPS_LPDDR4_OCT_RZQIN
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to HPS_LPDDR4_OCT_RZQIN
# HPS_IOA (1.8V)
set_location_assignment PIN_N135  -to HPS_PB[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_PB[0]
set_location_assignment PIN_AK120  -to HPS_PB[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_PB[1]
set_location_assignment PIN_N134  -to HPS_DIPSW[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_DIPSW[0]
set_location_assignment PIN_T132  -to HPS_DIPSW[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HPS_DIPSW[1]
}


# Fabric LPDDR4 Bank 2A  1.1V_LPDDR4
if {$wFAB_LPDDR4 == 1} {
set_location_assignment PIN_BM81  -to LPDDR4_CK_p
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to LPDDR4_CK_p
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to LPDDR4_CK_n
set_location_assignment PIN_BH92  -to LPDDR4_RST
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_RST
set_location_assignment PIN_BW78  -to LPDDR4_REFCK_p
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to LPDDR4_REFCK_p
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to LPDDR4_REFCK_n
set_location_assignment PIN_BU78  -to LPDDR4_CS_n[1]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_CS_n[1]
set_location_assignment PIN_BR78  -to LPDDR4_CS_n[0]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_CS_n[0]
set_location_assignment PIN_BU81  -to LPDDR4_CKE[1]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_CKE[1]
set_location_assignment PIN_BR81  -to LPDDR4_CKE[0]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to  LPDDR4_CKE[0]
set_location_assignment PIN_BR89  -to LPDDR4_CA[0]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_CA[0]
set_location_assignment PIN_BU89  -to LPDDR4_CA[1]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_CA[1]
set_location_assignment PIN_BR92  -to LPDDR4_CA[2]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_CA[2]
set_location_assignment PIN_BU92  -to LPDDR4_CA[3]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_CA[3]
set_location_assignment PIN_BW89  -to LPDDR4_CA[4]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_CA[4]
set_location_assignment PIN_CA89  -to LPDDR4_CA[5]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_CA[5]
set_location_assignment PIN_CL91  -to LPDDR4_DQ[0]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[0]
set_location_assignment PIN_CK94  -to LPDDR4_DQ[1]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[1]
set_location_assignment PIN_CK97  -to LPDDR4_DQ[2]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[2]
set_location_assignment PIN_CL97  -to LPDDR4_DQ[3]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[3]
set_location_assignment PIN_CK80  -to LPDDR4_DQ[4]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[4]
set_location_assignment PIN_CL82  -to LPDDR4_DQ[5]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[5]
set_location_assignment PIN_CK76  -to LPDDR4_DQ[6]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[6]
set_location_assignment PIN_CL76  -to LPDDR4_DQ[7]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[7]
set_location_assignment PIN_CC92  -to LPDDR4_DQ[8]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[8]
set_location_assignment PIN_CA92  -to LPDDR4_DQ[9]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[9]
set_location_assignment PIN_CF92  -to LPDDR4_DQ[10]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[10]
set_location_assignment PIN_CH92  -to LPDDR4_DQ[11]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[11]
set_location_assignment PIN_CA81  -to LPDDR4_DQ[12]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[12]
set_location_assignment PIN_CC81  -to LPDDR4_DQ[13]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[13]
set_location_assignment PIN_CH78  -to LPDDR4_DQ[14]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[14]
set_location_assignment PIN_CF78  -to LPDDR4_DQ[15]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[15]
set_location_assignment PIN_BR69  -to LPDDR4_DQ[16]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[16]
set_location_assignment PIN_BU69  -to LPDDR4_DQ[17]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[17]
set_location_assignment PIN_BR71  -to LPDDR4_DQ[18]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[18]
set_location_assignment PIN_BU71  -to LPDDR4_DQ[19]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[19]
set_location_assignment PIN_BU59  -to LPDDR4_DQ[20]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[20]
set_location_assignment PIN_BR59  -to LPDDR4_DQ[21]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[21]
set_location_assignment PIN_BW59  -to LPDDR4_DQ[22]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[22]
set_location_assignment PIN_CA59  -to LPDDR4_DQ[23]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[23]
set_location_assignment PIN_CF71  -to LPDDR4_DQ[24]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[24]
set_location_assignment PIN_CH71  -to LPDDR4_DQ[25]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[25]
set_location_assignment PIN_CC71  -to LPDDR4_DQ[26]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[26]
set_location_assignment PIN_CA71  -to LPDDR4_DQ[27]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[27]
set_location_assignment PIN_CF62  -to LPDDR4_DQ[28]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[28]
set_location_assignment PIN_CH62  -to LPDDR4_DQ[29]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[29]
set_location_assignment PIN_CF59  -to LPDDR4_DQ[30]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[30]
set_location_assignment PIN_CH59  -to LPDDR4_DQ[31]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DQ[31]
set_location_assignment PIN_CH89  -to LPDDR4_DQSA_p[1]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to LPDDR4_DQSA_p[1]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to LPDDR4_DQSA_n[1]
set_location_assignment PIN_CL88  -to LPDDR4_DQSA_p[0]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to LPDDR4_DQSA_p[0]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to LPDDR4_DQSA_n[0]
set_location_assignment PIN_CH69  -to LPDDR4_DQSB_p[1]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to LPDDR4_DQSB_p[1]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to LPDDR4_DQSB_n[1]
set_location_assignment PIN_BW69  -to LPDDR4_DQSB_p[0]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to LPDDR4_DQSB_p[0]
set_instance_assignment -name IO_STANDARD "Differential 1.1-V LVSTL" -to LPDDR4_DQSB_n[0]
set_location_assignment PIN_CF81  -to LPDDR4_DMA[1]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DMA[1]
set_location_assignment PIN_CK85  -to LPDDR4_DMA[0]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DMA[0]
set_location_assignment PIN_CA62  -to LPDDR4_DMB[1]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DMB[1]
set_location_assignment PIN_BU62  -to LPDDR4_DMB[0]
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_DMB[0]
set_location_assignment PIN_BH89   -to LPDDR4_OCT_RZQIN
set_instance_assignment -name IO_STANDARD "1.1-V LVSTL" -to LPDDR4_OCT_RZQIN
}

# Bank 2B FMC_ADJ=1.2V
if {$wFMC == 1} {
set_location_assignment PIN_BE61  -to FMC_REFCK_C2M_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to FMC_REFCK_C2M_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to FMC_REFCK_C2M_n
set_location_assignment PIN_CH38  -to FMC_REFCK_M2C_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to FMC_REFCK_M2C_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to FMC_REFCK_M2C_n
set_location_assignment PIN_BK38  -to FMC_CLK0_M2C_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to FMC_CLK0_M2C_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to FMC_CLK0_M2C_n
set_location_assignment PIN_BF68  -to FMC_CLK1_M2C_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to FMC_CLK1_M2C_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to FMC_CLK1_M2C_n
set_location_assignment PIN_BH49  -to FMC_SYNC_M2C_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to FMC_SYNC_M2C_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to FMC_SYNC_M2C_n
set_location_assignment PIN_CH41  -to FMC_SYNC_C2M_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to FMC_SYNC_C2M_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to FMC_SYNC_C2M_n
set_location_assignment PIN_CF19  -to LA00_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA00_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA00_n
set_location_assignment PIN_CF22  -to LA01_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA01_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA01_n
set_location_assignment PIN_CC22  -to LA02_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA02_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA02_n
set_location_assignment PIN_CF28  -to LA03_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA03_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA03_n
set_location_assignment PIN_CA31  -to LA04_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA04_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA04_n
set_location_assignment PIN_CH31  -to LA05_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA05_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA05_n
set_location_assignment PIN_CK8   -to LA06_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA06_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA06_n
set_location_assignment PIN_CK11  -to LA07_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA07_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA07_n
set_location_assignment PIN_CL14  -to LA08_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA08_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA08_n
set_location_assignment PIN_CK17  -to LA09_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA09_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA09_n
set_location_assignment PIN_CL20  -to LA10_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA10_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA10_n
set_location_assignment PIN_CL23  -to LA11_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA11_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA11_n
set_location_assignment PIN_BH38  -to LA12_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA12_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA12_n
set_location_assignment PIN_BF57  -to LA13_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA13_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA13_n
set_location_assignment PIN_BE46  -to LA14_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA14_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA14_n
set_location_assignment PIN_BE64  -to LA15_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA15_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA15_n
set_location_assignment PIN_BF50  -to LA16_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA16_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA16_n
set_location_assignment PIN_BR41  -to LA17_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA17_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA17_n
set_location_assignment PIN_BK49  -to LA18_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA18_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA18_n
set_location_assignment PIN_CK73  -to LA19_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA19_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA19_n
set_location_assignment PIN_CA38  -to LA20_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA20_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA20_n
set_location_assignment PIN_BR38  -to LA21_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA21_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA21_n
set_location_assignment PIN_CF49  -to LA22_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA22_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA22_n
set_location_assignment PIN_BW49  -to LA23_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA23_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA23_n
set_location_assignment PIN_CF52  -to LA24_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA24_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA24_n
set_location_assignment PIN_CL51  -to LA25_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA25_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA25_n
set_location_assignment PIN_BM52  -to LA26_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA26_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA26_n
set_location_assignment PIN_CC52  -to LA27_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA27_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA27_n
set_location_assignment PIN_BP41  -to LA28_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA28_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA28_n
set_location_assignment PIN_CK33  -to LA29_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA29_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA29_n
set_location_assignment PIN_CK35  -to LA30_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA30_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA30_n
set_location_assignment PIN_CK39  -to LA31_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA31_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA31_n
set_location_assignment PIN_CK48  -to LA32_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA32_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA32_n
set_location_assignment PIN_CL42  -to LA33_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA33_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to LA33_n
}


if {$wCRUVI_HS_1 == 1} {
# BANK 3B (1.2V)
set_location_assignment PIN_B45  -to CX_HSIO
set_instance_assignment -name IO_STANDARD "1.2 V" -to CX_HSIO
set_location_assignment PIN_A48  -to CX_HSO
set_instance_assignment -name IO_STANDARD "1.2 V" -to CX_HSO
set_location_assignment PIN_A51  -to CX_RESET
set_instance_assignment -name IO_STANDARD "1.2 V" -to CX_RESET
set_location_assignment PIN_A63  -to CX_HSI
set_instance_assignment -name IO_STANDARD "1.2 V" -to CX_HSI
set_location_assignment PIN_p44  -to CX_B5_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_B5_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_B5_n
set_location_assignment PIN_V58  -to CX_B4_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_B4_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_B4_n
set_location_assignment PIN_p55  -to CX_B3_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_B3_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_B3_n
set_location_assignment PIN_K55  -to CX_B2_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_B2_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_B2_n
set_location_assignment PIN_M58  -to CX_B1_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_B1_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_B1_n
set_location_assignment PIN_F55  -to CX_B0_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_B0_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_B0_n
set_location_assignment PIN_D44  -to CX_A0_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_A0_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_A0_n
set_location_assignment PIN_H58  -to CX_A1_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_A1_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_A1_n
set_location_assignment PIN_F47  -to CX_A2_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_A2_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_A2_n
set_location_assignment PIN_M47  -to CX_A3_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_A3_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_A3_n
set_location_assignment PIN_V47  -to CX_A4_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_A4_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_A4_n
set_location_assignment PIN_K44  -to CX_A5_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_A5_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CX_A5_n
# HVIO BANK 5B (3.3V)
set_location_assignment PIN_BR112  -to CX_SMB_ALERT
set_instance_assignment -name IO_STANDARD "3.3 V" -to CX_SMB_ALERT
set_location_assignment PIN_BU109  -to CX_SMB_SDA
set_instance_assignment -name IO_STANDARD "3.3 V" -to CX_SMB_SDA
set_location_assignment PIN_BR109  -to CX_SMB_SCL
set_instance_assignment -name IO_STANDARD "3.3 V" -to CX_SMB_SCL
set_location_assignment PIN_BM109  -to CX_REFCLK
set_instance_assignment -name IO_STANDARD "3.3 V" -to CX_REFCLK
}

if {$wCRUVI_HS_2 == 1} {
# BANK 3B (1.2V)
set_location_assignment PIN_T65  -to CY_HSIO
set_instance_assignment -name IO_STANDARD "1.2 V" -to CY_HSIO
set_location_assignment PIN_p65  -to CY_HSO
set_instance_assignment -name IO_STANDARD "1.2 V" -to CY_HSO
set_location_assignment PIN_M65  -to CY_RESET
set_instance_assignment -name IO_STANDARD "1.2 V" -to CY_RESET
set_location_assignment PIN_K65  -to CY_HSI
set_instance_assignment -name IO_STANDARD "1.2 V" -to CY_HSI
set_location_assignment PIN_H67  -to CY_B5_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_B5_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_B5_n
set_location_assignment PIN_F77  -to CY_B4_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_B4_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_B4_n
set_location_assignment PIN_K77  -to CY_B3_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_B3_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_B3_n
set_location_assignment PIN_D74  -to CY_B2_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_B2_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_B2_n
set_location_assignment PIN_B85  -to CY_B1_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_B1_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_B1_n
set_location_assignment PIN_A80  -to CY_B0_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_B0_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_B0_n
set_location_assignment PIN_B66  -to CY_A0_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_A0_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_A0_n
set_location_assignment PIN_A82  -to CY_A1_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_A1_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_A1_n
set_location_assignment PIN_B70  -to CY_A2_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_A2_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_A2_n
set_location_assignment PIN_B73  -to CY_A3_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_A3_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_A3_n
set_location_assignment PIN_M67  -to CY_A4_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_A4_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_A4_n
set_location_assignment PIN_F65  -to CY_A5_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_A5_p
set_instance_assignment -name IO_STANDARD "Differential 1.2-V SSTL" -to CY_A5_n
# HVIO BANK 5V (3.3V)
set_location_assignment PIN_CG134  -to CY_SMB_ALERT
set_instance_assignment -name IO_STANDARD "3.3 V" -to CY_SMB_ALERT
set_location_assignment PIN_CD135  -to CY_SMB_SDA
set_instance_assignment -name IO_STANDARD "3.3 V" -to CY_SMB_SDA
set_location_assignment PIN_CD134  -to CY_SMB_SCL
set_instance_assignment -name IO_STANDARD "3.3 V" -to CY_SMB_SCL
set_location_assignment PIN_CH128  -to CY_REFCLK
set_instance_assignment -name IO_STANDARD "3.3 V" -to CY_REFCLK
}

if {$wCRUVI_LS_1 == 1} {
# Bank HVIO_5B (3.3V)
set_location_assignment PIN_BE115  -to CRUVI_LS_B[0]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_B[0]
set_location_assignment PIN_BF111  -to CRUVI_LS_B[1]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_B[1]
set_location_assignment PIN_BF107  -to CRUVI_LS_B[2]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_B[2]
set_location_assignment PIN_BE107  -to CRUVI_LS_B[3]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_B[3]
set_location_assignment PIN_BF120  -to CRUVI_LS_B[4]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_B[4]
set_location_assignment PIN_BE111  -to CRUVI_LS_B[5]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_B[5]
set_location_assignment PIN_BF115  -to CRUVI_LS_B[6]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_B[6]
set_location_assignment PIN_BH118  -to CRUVI_LS_B[7]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_B[7]
}

if {$wCRUVI_LS_2 == 1} {
# Bank HVIO_5B (3.3V)
set_location_assignment PIN_BK109  -to CRUVI_LS_C[0]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_C[0]
set_location_assignment PIN_BF104  -to CRUVI_LS_C[1]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_C[1]
set_location_assignment PIN_BM118  -to CRUVI_LS_C[2]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_C[2]
set_location_assignment PIN_BK118  -to CRUVI_LS_C[3]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_C[3]
set_location_assignment PIN_BP112  -to CRUVI_LS_C[4]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_C[4]
set_location_assignment PIN_BH109  -to CRUVI_LS_C[5]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_C[5]
set_location_assignment PIN_BM112  -to CRUVI_LS_C[6]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_C[6]
set_location_assignment PIN_BK112  -to CRUVI_LS_C[7]
set_instance_assignment -name IO_STANDARD "3.3 V" -to CRUVI_LS_C[7]
}

if {$wFAB_QSPI == 1} {
# Bank HVIO_6B (1.8V)
set_location_assignment PIN_BM19  -to FPGA_QSPI_CS
set_instance_assignment -name IO_STANDARD "1.8 V" -to FPGA_QSPI_CS
set_location_assignment PIN_BU19  -to FPGA_QSPI_CLK
set_instance_assignment -name IO_STANDARD "1.8 V" -to FPGA_QSPI_CLK
set_location_assignment PIN_CH4  -to FPGA_QSPI_RST
set_instance_assignment -name IO_STANDARD "1.8 V" -to FPGA_QSPI_RST
set_location_assignment PIN_BR19  -to FPGA_QSPI_D[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to FPGA_QSPI_D[0]
set_location_assignment PIN_CK4  -to FPGA_QSPI_D[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to FPGA_QSPI_D[1]
set_location_assignment PIN_CJ2  -to FPGA_QSPI_D[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to FPGA_QSPI_D[2]
set_location_assignment PIN_CK2  -to FPGA_QSPI_D[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to FPGA_QSPI_D[3]
}

# Bank 1C (GXBL1C)
if {$wSFP10G_1 == 1} {

# Need to also set wMUX_I2C to 1

set_location_assignment PIN_AU129  -to SFPA_TD_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to SFPA_TD_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to SFPA_TD_n
set_location_assignment PIN_AT135  -to SFPA_RD_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to SFPA_RD_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to SFPA_RD_n

# Bank 3B (1.2V)
set_location_assignment PIN_A80  -to SFPA_M_DEF0
set_instance_assignment -name IO_STANDARD "1.2 V" -to SFPA_M_DEF0
set_location_assignment PIN_AC64  -to SFPA_RS0
set_instance_assignment -name IO_STANDARD "1.2 V" -to SFPA_RS0
set_location_assignment PIN_Y58  -to SFPA_RS1
set_instance_assignment -name IO_STANDARD "1.2 V" -to SFPA_RS1
set_location_assignment PIN_AG64  -to SFPA_LOS
set_instance_assignment -name IO_STANDARD "1.2 V" -to SFPA_LOS
set_location_assignment PIN_Y77  -to SFPA_TX_DIS
set_instance_assignment -name IO_STANDARD "1.2 V" -to SFPA_TX_DIS
set_location_assignment PIN_Y74  -to SFPA_TX_FAULT
set_instance_assignment -name IO_STANDARD "1.2 V" -to SFPA_TX_FAULT
}

# Bank 1C (GXBL1C)
if {$wSFP10G_2 == 1} {

# Need to also set wMUX_I2C to 1

set_location_assignment PIN_AL129  -to SFPB_TD_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to SFPB_TD_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to SFPB_TD_n
set_location_assignment PIN_AK135  -to SFPB_RD_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to SFPB_RD_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to SFPB_RD_n

# Bank 3B (1.2V)
set_location_assignment PIN_AG83  -to SFPB_M_DEF0
set_instance_assignment -name IO_STANDARD "1.2 V" -to SFPB_M_DEF0
set_location_assignment PIN_AG57  -to SFPB_RS0
set_instance_assignment -name IO_STANDARD "1.2 V" -to SFPB_RS0
set_location_assignment PIN_AC53  -to SFPB_RS1
set_instance_assignment -name IO_STANDARD "1.2 V" -to SFPB_RS1
set_location_assignment PIN_AC61  -to SFPB_LOS
set_instance_assignment -name IO_STANDARD "1.2 V" -to SFPB_LOS
set_location_assignment PIN_AC50  -to SFPB_TX_DIS
set_instance_assignment -name IO_STANDARD "1.2 V" -to SFPB_TX_DIS
set_location_assignment PIN_Y55  -to SFPB_TX_FAULT
set_instance_assignment -name IO_STANDARD "1.2 V" -to SFPB_TX_FAULT
}

if {$wPCIe == 1} {
# Bank 1B (GXBL1B)
set_location_assignment PIN_AV120  -to PCIE_CLK_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PCIE_CLK_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PCIE_CLK_n
set_location_assignment PIN_AY120  -to PCIE_100M_CK_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PCIE_100M_CK_p
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PCIE_100M_CK_n
set_location_assignment PIN_AP120  -to PET_p[0]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PET_p[0]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PET_n[0]
set_location_assignment PIN_AP120  -to PET_p[1]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PET_p[1]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PET_n[1]
set_location_assignment PIN_AP120  -to PET_p[2]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PET_p[2]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PET_n[2]
set_location_assignment PIN_AP120  -to PET_p[3]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PET_p[3]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PET_n[3]
set_location_assignment PIN_AP120  -to PER_p[0]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PER_p[0]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PER_n[0]
set_location_assignment PIN_AP120  -to PER_p[1]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PER_p[1]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PER_n[1]
set_location_assignment PIN_AP120  -to PER_p[2]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PER_p[2]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PER_n[2]
set_location_assignment PIN_AP120  -to PER_p[3]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PER_p[3]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to PER_n[3]
}

if {$wFMC_XCVRS == 1} {
# Bank 4B (GXBR4B)
set_location_assignment PIN_AV16  -to FMC_GBTCLK_p[0]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to FMC_GBTCLK_p[0]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to FMC_GBTCLK_n[0]
set_location_assignment PIN_AY16  -to FMC_GT_CK_p[0]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to FMC_GT_CK_p[0]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to FMC_GT_CK_n[0]
set_location_assignment PIN_BF1  -to DP_M2C_p[0]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_p[0]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_n[0]
set_location_assignment PIN_BD1  -to DP_M2C_p[1]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_p[1]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_n[1]
set_location_assignment PIN_BB1  -to DP_M2C_p[2]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_p[2]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_n[2]
set_location_assignment PIN_AY1  -to DP_M2C_p[3]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_p[3]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_n[3]
set_location_assignment PIN_BE7  -to DP_C2M_p[0]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_p[0]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_n[0]
set_location_assignment PIN_BC7  -to DP_C2M_p[1]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_p[1]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_n[1]
set_location_assignment PIN_BA7  -to DP_C2M_p[2]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_p[2]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_n[2]
set_location_assignment PIN_AW7  -to DP_C2M_p[3]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_p[3]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_n[3]

# Bank 4C (GXBR4C)
set_location_assignment PIN_AP16  -to FMC_GBTCLK_p[1]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to FMC_GBTCLK_p[1]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to FMC_GBTCLK_n[1]
set_location_assignment PIN_AT16  -to FMC_GT_CK_p[1]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to FMC_GT_CK_p[1]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to FMC_GT_CK_n[1]
set_location_assignment PIN_AV1  -to DP_M2C_p[4]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_p[4]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_n[4]
set_location_assignment PIN_AT1  -to DP_M2C_p[5]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_p[5]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_n[5]
set_location_assignment PIN_AP1  -to DP_M2C_p[6]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_p[6]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_n[6]
set_location_assignment PIN_AM1  -to DP_M2C_p[7]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_p[7]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_M2C_n[7]
set_location_assignment PIN_AU7  -to DP_C2M_p[4]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_p[4]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_n[4]
set_location_assignment PIN_AR7  -to DP_C2M_p[5]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_p[5]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_n[5]
set_location_assignment PIN_AN7  -to DP_C2M_p[6]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_p[6]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_n[6]
set_location_assignment PIN_AL7  -to DP_C2M_p[7]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_p[7]
set_instance_assignment -name IO_STANDARD "Current Mode Logic (CML)" -to DP_C2M_n[7]

}

