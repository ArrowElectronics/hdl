# mitysom_a10s carrier defaults

# configuration pin usage - allow DATA0 to be used as regular io in user mode
set_global_assignment -name RESERVE_DATA0_AFTER_CONFIGURATION "USE AS REGULAR IO"

# clocks and resets

set_global_assignment -name AUTO_RESERVE_CLKUSR_FOR_CALIBRATION OFF

set_location_assignment PIN_Y15   -to sys_clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to sys_clk

# hps-ddr4 (32)

set_location_assignment PIN_D15  -to hps_ddr_ref_clk
set_location_assignment PIN_E15   -to "hps_ddr_ref_clk(n)"
set_location_assignment PIN_C13   -to hps_ddr_clk_p     
set_location_assignment PIN_D13   -to hps_ddr_clk_n     
set_location_assignment PIN_B26   -to hps_ddr_a[0]
set_location_assignment PIN_B25   -to hps_ddr_a[1]
set_location_assignment PIN_A21   -to hps_ddr_a[2]
set_location_assignment PIN_A22   -to hps_ddr_a[3]
set_location_assignment PIN_A27   -to hps_ddr_a[4]
set_location_assignment PIN_A26    -to hps_ddr_a[5]
set_location_assignment PIN_B24   -to hps_ddr_a[6]
set_location_assignment PIN_B23   -to hps_ddr_a[7]
set_location_assignment PIN_B21   -to hps_ddr_a[8]
set_location_assignment PIN_C21   -to hps_ddr_a[9]
set_location_assignment PIN_A24   -to hps_ddr_a[10]
set_location_assignment PIN_A23   -to hps_ddr_a[11]
set_location_assignment PIN_C20   -to hps_ddr_a[12]
set_location_assignment PIN_B19   -to hps_ddr_a[13]
set_location_assignment PIN_B18   -to hps_ddr_a[14]
set_location_assignment PIN_B16   -to hps_ddr_a[15]
set_location_assignment PIN_C15   -to hps_ddr_a[16]
set_location_assignment PIN_A18   -to hps_ddr_ba[0]
set_location_assignment PIN_A17   -to hps_ddr_ba[1]
set_location_assignment PIN_A16   -to hps_ddr_bg[0]
set_location_assignment PIN_A11   -to hps_ddr_bg[1]
set_location_assignment PIN_B14   -to hps_ddr_cke
set_location_assignment PIN_A12   -to hps_ddr_cs_n
set_location_assignment PIN_A14   -to hps_ddr_odt
set_location_assignment PIN_B11   -to hps_ddr_reset_n
set_location_assignment PIN_A13   -to hps_ddr_act_n
set_location_assignment PIN_E14   -to hps_ddr_par
set_location_assignment PIN_AG19  -to hps_ddr_alert_n
set_location_assignment PIN_AF21  -to hps_ddr_dqs_p[0]
set_location_assignment PIN_AE21  -to hps_ddr_dqs_n[0]
set_location_assignment PIN_AA17  -to hps_ddr_dqs_p[1]
set_location_assignment PIN_Y17   -to hps_ddr_dqs_n[1]
set_location_assignment PIN_AC23  -to hps_ddr_dqs_p[2]
set_location_assignment PIN_AB23  -to hps_ddr_dqs_n[2]
set_location_assignment PIN_AH11  -to hps_ddr_dqs_p[3]
set_location_assignment PIN_AH10  -to hps_ddr_dqs_n[3]
set_location_assignment PIN_AG21  -to hps_ddr_dq[0]
set_location_assignment PIN_AB21  -to hps_ddr_dq[1]
set_location_assignment PIN_AC21  -to hps_ddr_dq[2]
set_location_assignment PIN_AH22  -to hps_ddr_dq[3]
set_location_assignment PIN_AG20  -to hps_ddr_dq[4]
set_location_assignment PIN_AH20  -to hps_ddr_dq[5]
set_location_assignment PIN_AH21  -to hps_ddr_dq[6]
set_location_assignment PIN_AC20  -to hps_ddr_dq[7]
set_location_assignment PIN_AA21  -to hps_ddr_dq[8]
set_location_assignment PIN_Y19   -to hps_ddr_dq[9]
set_location_assignment PIN_AB19  -to hps_ddr_dq[10]
set_location_assignment PIN_AB18  -to hps_ddr_dq[11]
set_location_assignment PIN_Y20   -to hps_ddr_dq[12]
set_location_assignment PIN_W21   -to hps_ddr_dq[13]
set_location_assignment PIN_W20   -to hps_ddr_dq[14]
set_location_assignment PIN_AA19  -to hps_ddr_dq[15]
set_location_assignment PIN_AG23  -to hps_ddr_dq[16]
set_location_assignment PIN_AA23  -to hps_ddr_dq[17]
set_location_assignment PIN_AE22  -to hps_ddr_dq[18]
set_location_assignment PIN_AC22  -to hps_ddr_dq[19]
set_location_assignment PIN_AA22  -to hps_ddr_dq[20]
set_location_assignment PIN_AF22  -to hps_ddr_dq[21]
set_location_assignment PIN_AD23  -to hps_ddr_dq[22]
set_location_assignment PIN_AE23  -to hps_ddr_dq[23]
set_location_assignment PIN_AG10  -to hps_ddr_dq[24]
set_location_assignment PIN_AH16  -to hps_ddr_dq[25]
set_location_assignment PIN_AH12  -to hps_ddr_dq[26]
set_location_assignment PIN_AG11  -to hps_ddr_dq[27]
set_location_assignment PIN_AH15  -to hps_ddr_dq[28]
set_location_assignment PIN_AG13  -to hps_ddr_dq[29]
set_location_assignment PIN_AH17  -to hps_ddr_dq[30]
set_location_assignment PIN_AH18  -to hps_ddr_dq[31]
set_location_assignment PIN_AB20  -to hps_ddr_dbi_n[0]
set_location_assignment PIN_Y21   -to hps_ddr_dbi_n[1]
set_location_assignment PIN_AF23  -to hps_ddr_dbi_n[2]
set_location_assignment PIN_AG9   -to hps_ddr_dbi_n[3]
set_location_assignment PIN_B20   -to hps_ddr_rzq

# hps-ethernet

set_location_assignment PIN_F21   -to hps_eth_rxclk
set_location_assignment PIN_G21   -to hps_eth_rxctl
set_location_assignment PIN_E22   -to hps_eth_rxd[0]
set_location_assignment PIN_F22   -to hps_eth_rxd[1]
set_location_assignment PIN_D22   -to hps_eth_rxd[2]
set_location_assignment PIN_E21   -to hps_eth_rxd[3]
set_location_assignment PIN_F23   -to hps_eth_txclk
set_location_assignment PIN_G23   -to hps_eth_txctl
set_location_assignment PIN_C23   -to hps_eth_txd[0]
set_location_assignment PIN_C22   -to hps_eth_txd[1]
set_location_assignment PIN_D23   -to hps_eth_txd[2]
set_location_assignment PIN_E23   -to hps_eth_txd[3]
set_location_assignment PIN_F16   -to hps_eth_mdc
set_location_assignment PIN_H15   -to hps_eth_mdio
set_location_assignment PIN_D17   -to hps_eth_resetn

set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_rxclk
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_rxctl
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_rxd[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_rxd[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_rxd[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_rxd[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_txclk
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_txctl
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_txd[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_txd[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_txd[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_txd[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_mdc
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_mdio
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_resetn

set_instance_assignment -name OUTPUT_DELAY_CHAIN 8 -to hps_eth_txclk

# hps-sdio

set_location_assignment PIN_D12   -to hps_sdio_clk
set_location_assignment PIN_G16   -to hps_sdio_cmd
set_location_assignment PIN_F12   -to hps_sdio_d[0]
set_location_assignment PIN_J12   -to hps_sdio_d[1]
set_location_assignment PIN_H12   -to hps_sdio_d[2]
set_location_assignment PIN_F14   -to hps_sdio_d[3]

set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_sdio_clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_sdio_cmd
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_sdio_d[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_sdio_d[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_sdio_d[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_sdio_d[3]

set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to hps_sdio_clk
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to hps_sdio_cmd
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to hps_sdio_d[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to hps_sdio_d[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to hps_sdio_d[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to hps_sdio_d[3]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to hps_sdio_d[4]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to hps_sdio_d[5]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to hps_sdio_d[6]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to hps_sdio_d[7]
set_instance_assignment -name SLEW_RATE 1 -to hps_sdio_clk
set_instance_assignment -name SLEW_RATE 1 -to hps_sdio_cmd
set_instance_assignment -name SLEW_RATE 1 -to hps_sdio_d[0]
set_instance_assignment -name SLEW_RATE 1 -to hps_sdio_d[1]
set_instance_assignment -name SLEW_RATE 1 -to hps_sdio_d[2]
set_instance_assignment -name SLEW_RATE 1 -to hps_sdio_d[3]

# hps-usb

set_location_assignment PIN_K23   -to hps_usb_clk
set_location_assignment PIN_K19   -to hps_usb_dir
set_location_assignment PIN_H21   -to hps_usb_nxt
set_location_assignment PIN_K22   -to hps_usb_stp
set_location_assignment PIN_K20   -to hps_usb_d[0]
set_location_assignment PIN_H20   -to hps_usb_d[1]
set_location_assignment PIN_J22   -to hps_usb_d[2]
set_location_assignment PIN_H22   -to hps_usb_d[3]
set_location_assignment PIN_J20   -to hps_usb_d[4]
set_location_assignment PIN_K21   -to hps_usb_d[5]
set_location_assignment PIN_J23   -to hps_usb_d[6]
set_location_assignment PIN_H23   -to hps_usb_d[7]
set_location_assignment PIN_E17   -to hps_usb_resetn

set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_dir
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_nxt
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_stp
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_d[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_d[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_d[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_d[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_d[4]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_d[5]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_d[6]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_d[7]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_resetn

# hps-uart

set_location_assignment PIN_K15   -to hps_uart_tx
set_location_assignment PIN_F13   -to hps_uart_rx

set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_uart_tx
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_uart_rx

# hps-i2c (fmc)

set_location_assignment PIN_C16   -to hps_i2c_scl
set_location_assignment PIN_C17   -to hps_i2c_sda

set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_i2c_scl
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_i2c_sda

# fpga-ddr4

set_location_assignment PIN_D3 -to sys_ddr_a[0]
set_location_assignment PIN_D4 -to sys_ddr_a[1]
set_location_assignment PIN_A2 -to sys_ddr_a[2]
set_location_assignment PIN_A3 -to sys_ddr_a[3]
set_location_assignment PIN_F4 -to sys_ddr_a[4]
set_location_assignment PIN_E4 -to sys_ddr_a[5]
set_location_assignment PIN_A4 -to sys_ddr_a[6]
set_location_assignment PIN_B4 -to sys_ddr_a[7]
set_location_assignment PIN_B3 -to sys_ddr_a[8]
set_location_assignment PIN_C3 -to sys_ddr_a[9]
set_location_assignment PIN_G5 -to sys_ddr_a[10]
set_location_assignment PIN_G6 -to sys_ddr_a[11]
set_location_assignment PIN_M6 -to sys_ddr_a[12]
set_location_assignment PIN_K5 -to sys_ddr_a[13]
set_location_assignment PIN_J5 -to sys_ddr_a[14]
set_location_assignment PIN_R6 -to sys_ddr_a[15]
set_location_assignment PIN_R7 -to sys_ddr_a[16]
set_location_assignment PIN_B1 -to sys_ddr_act_n
set_location_assignment PIN_C7 -to sys_ddr_alert_n
set_location_assignment PIN_P7 -to sys_ddr_ba[0]
set_location_assignment PIN_P9 -to sys_ddr_ba[1]
set_location_assignment PIN_P8 -to sys_ddr_bg[0]
set_location_assignment PIN_F1 -to sys_ddr_bg[1]
set_location_assignment PIN_E2 -to sys_ddr_ck_n[0]
set_location_assignment PIN_F2 -to sys_ddr_ck_p[0]
set_location_assignment PIN_G3 -to sys_ddr_cke[0]
set_location_assignment PIN_C1 -to sys_ddr_cs_n
set_location_assignment PIN_B5 -to sys_ddr_dq[0]
set_location_assignment PIN_B6 -to sys_ddr_dq[1]
set_location_assignment PIN_E5 -to sys_ddr_dq[2]
set_location_assignment PIN_E7 -to sys_ddr_dq[3]
set_location_assignment PIN_E6 -to sys_ddr_dq[4]
set_location_assignment PIN_D5 -to sys_ddr_dq[5]
set_location_assignment PIN_A7 -to sys_ddr_dq[6]
set_location_assignment PIN_A6 -to sys_ddr_dq[7]
set_location_assignment PIN_J7 -to sys_ddr_dq[8]
set_location_assignment PIN_H7 -to sys_ddr_dq[9]
set_location_assignment PIN_K7 -to sys_ddr_dq[10]
set_location_assignment PIN_H6 -to sys_ddr_dq[11]
set_location_assignment PIN_L6 -to sys_ddr_dq[12]
set_location_assignment PIN_K6 -to sys_ddr_dq[13]
set_location_assignment PIN_M8 -to sys_ddr_dq[14]
set_location_assignment PIN_N8 -to sys_ddr_dq[15]
set_location_assignment PIN_D7 -to sys_ddr_dbi_n[0]
set_location_assignment PIN_L7 -to sys_ddr_dbi_n[1]
set_location_assignment PIN_C6 -to sys_ddr_dqs_n[0]
set_location_assignment PIN_H5 -to sys_ddr_dqs_n[1]
set_location_assignment PIN_C5 -to sys_ddr_dqs_p[0]
set_location_assignment PIN_G4 -to sys_ddr_dqs_p[1]
set_location_assignment PIN_F6 -to sys_ddr_rzq
set_location_assignment PIN_H3 -to sys_ddr_odt[0]
set_location_assignment PIN_C2 -to sys_ddr_par[0]
set_location_assignment PIN_N5 -to sys_ddr_ref_clk
set_location_assignment PIN_E1 -to sys_ddr_reset_n

