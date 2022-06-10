
set_location_assignment PIN_Y15   -to sys_clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to sys_clk

# hps-ddr4 (32)

set_location_assignment PIN_D15  -to hps_ddr_ref_clk
#set_location_assignment PIN_E15   -to "ddr3_ref_clk(n)"
set_location_assignment PIN_C13   -to ddr3_ck_p     
set_location_assignment PIN_D13   -to ddr3_ck_n     
set_location_assignment PIN_B26   -to ddr3_a[0]
set_location_assignment PIN_B25   -to ddr3_a[1]
set_location_assignment PIN_A21   -to ddr3_a[2]
set_location_assignment PIN_A22   -to ddr3_a[3]
set_location_assignment PIN_A27   -to ddr3_a[4]
set_location_assignment PIN_A26    -to ddr3_a[5]
set_location_assignment PIN_B24   -to ddr3_a[6]
set_location_assignment PIN_B23   -to ddr3_a[7]
set_location_assignment PIN_B21   -to ddr3_a[8]
set_location_assignment PIN_C21   -to ddr3_a[9]
set_location_assignment PIN_A24   -to ddr3_a[10]
set_location_assignment PIN_A23   -to ddr3_a[11]
set_location_assignment PIN_C20   -to ddr3_a[12]
set_location_assignment PIN_B19   -to ddr3_a[13]
set_location_assignment PIN_B18   -to ddr3_a[14]
#set_location_assignment PIN_B16   -to ddr3_a[15]
#set_location_assignment PIN_C15   -to ddr3_a[16]
set_location_assignment PIN_A18   -to ddr3_ba[0]
set_location_assignment PIN_A17   -to ddr3_ba[1]
#set_location_assignment PIN_A16   -to ddr3_bg[0]
#set_location_assignment PIN_A11   -to ddr3_bg[1]
set_location_assignment PIN_B14   -to ddr3_cke
set_location_assignment PIN_A12   -to ddr3_cs_n
set_location_assignment PIN_A14   -to ddr3_odt
set_location_assignment PIN_B11   -to ddr3_reset_n
#set_location_assignment PIN_A13   -to ddr3_act_n
#set_location_assignment PIN_E14   -to ddr3_par
set_location_assignment PIN_AG19  -to ddr3_alert_n
set_location_assignment PIN_AF21  -to ddr3_dqs_p[0]
set_location_assignment PIN_AE21  -to ddr3_dqs_n[0]
set_location_assignment PIN_AA17  -to ddr3_dqs_p[1]
set_location_assignment PIN_Y17   -to ddr3_dqs_n[1]
set_location_assignment PIN_AC23  -to ddr3_dqs_p[2]
set_location_assignment PIN_AB23  -to ddr3_dqs_n[2]
set_location_assignment PIN_AH11  -to ddr3_dqs_p[3]
set_location_assignment PIN_AH10  -to ddr3_dqs_n[3]
set_location_assignment PIN_AG21  -to ddr3_dq[0]
set_location_assignment PIN_AB21  -to ddr3_dq[1]
set_location_assignment PIN_AC21  -to ddr3_dq[2]
set_location_assignment PIN_AH22  -to ddr3_dq[3]
set_location_assignment PIN_AG20  -to ddr3_dq[4]
set_location_assignment PIN_AH20  -to ddr3_dq[5]
set_location_assignment PIN_AH21  -to ddr3_dq[6]
set_location_assignment PIN_AC20  -to ddr3_dq[7]
set_location_assignment PIN_AA21  -to ddr3_dq[8]
set_location_assignment PIN_Y19   -to ddr3_dq[9]
set_location_assignment PIN_AB19  -to ddr3_dq[10]
set_location_assignment PIN_AB18  -to ddr3_dq[11]
set_location_assignment PIN_Y20   -to ddr3_dq[12]
set_location_assignment PIN_W21   -to ddr3_dq[13]
set_location_assignment PIN_W20   -to ddr3_dq[14]
set_location_assignment PIN_AA19  -to ddr3_dq[15]
set_location_assignment PIN_AG23  -to ddr3_dq[16]
set_location_assignment PIN_AA23  -to ddr3_dq[17]
set_location_assignment PIN_AE22  -to ddr3_dq[18]
set_location_assignment PIN_AC22  -to ddr3_dq[19]
set_location_assignment PIN_AA22  -to ddr3_dq[20]
set_location_assignment PIN_AF22  -to ddr3_dq[21]
set_location_assignment PIN_AD23  -to ddr3_dq[22]
set_location_assignment PIN_AE23  -to ddr3_dq[23]
set_location_assignment PIN_AG10  -to ddr3_dq[24]
set_location_assignment PIN_AH16  -to ddr3_dq[25]
set_location_assignment PIN_AH12  -to ddr3_dq[26]
set_location_assignment PIN_AG11  -to ddr3_dq[27]
set_location_assignment PIN_AH15  -to ddr3_dq[28]
set_location_assignment PIN_AG13  -to ddr3_dq[29]
set_location_assignment PIN_AH17  -to ddr3_dq[30]
set_location_assignment PIN_AH18  -to ddr3_dq[31]
set_location_assignment PIN_AB20  -to ddr3_dm[0]
set_location_assignment PIN_Y21   -to ddr3_dm[1]
set_location_assignment PIN_AF23  -to ddr3_dm[2]
set_location_assignment PIN_AG9   -to ddr3_dm[3]
set_location_assignment PIN_B20   -to ddr3_rzq

# hps-ethernet

set_location_assignment PIN_F21   -to eth1_rx_clk
set_location_assignment PIN_G21   -to eth1_rx_ctl
set_location_assignment PIN_E22   -to eth1_rx_d[0]
set_location_assignment PIN_F22   -to eth1_rx_d[1]
set_location_assignment PIN_D22   -to eth1_rx_d[2]
set_location_assignment PIN_E21   -to eth1_rx_d[3]
set_location_assignment PIN_F23   -to eth1_tx_clk
set_location_assignment PIN_G23   -to eth1_tx_ctl
set_location_assignment PIN_C23   -to eth1_tx_d[0]
set_location_assignment PIN_C22   -to eth1_tx_d[1]
set_location_assignment PIN_D23   -to eth1_tx_d[2]
set_location_assignment PIN_E23   -to eth1_tx_d[3]
set_location_assignment PIN_F16   -to eth1_mdc
set_location_assignment PIN_H15   -to eth1_mdio
set_location_assignment PIN_D17   -to hps_eth_resetn

set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_rx_clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_rx_ctl
set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_rx_d[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_rx_d[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_rx_d[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_rx-d[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_tx_clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_tx_ctl
set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_tx_d[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_tx-d[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_tx_d[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_tx-d[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_mdc
set_instance_assignment -name IO_STANDARD "1.8 V" -to eth1_mdio
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_eth_resetn

set_instance_assignment -name OUTPUT_DELAY_CHAIN 8 -to eth1_tx_clk

# hps-sdio

set_location_assignment PIN_D12   -to sdio_clk
set_location_assignment PIN_G16   -to sdio_cmd
set_location_assignment PIN_F12   -to sdio_d[0]
set_location_assignment PIN_J12   -to sdio_d[1]
set_location_assignment PIN_H12   -to sdio_d[2]
set_location_assignment PIN_F14   -to sdio_d[3]

set_instance_assignment -name IO_STANDARD "1.8 V" -to sdio_clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to sdio_cmd
set_instance_assignment -name IO_STANDARD "1.8 V" -to sdio_d[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to sdio_d[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to sdio_d[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to sdio_d[3]

set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to sdio_clk
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to sdio_cmd
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to sdio_d[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to sdio_d[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to sdio_d[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to sdio_d[3]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to sdio_d[4]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to sdio_d[5]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to sdio_d[6]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to sdio_d[7]
set_instance_assignment -name SLEW_RATE 1 -to sdio_clk
set_instance_assignment -name SLEW_RATE 1 -to sdio_cmd
set_instance_assignment -name SLEW_RATE 1 -to sdio_d[0]
set_instance_assignment -name SLEW_RATE 1 -to sdio_d[1]
set_instance_assignment -name SLEW_RATE 1 -to sdio_d[2]
set_instance_assignment -name SLEW_RATE 1 -to sdio_d[3]

# hps-usb

set_location_assignment PIN_K23   -to usb1_clk
set_location_assignment PIN_K19   -to usb1_dir
set_location_assignment PIN_H21   -to usb1_nxt
set_location_assignment PIN_K22   -to usb1_stp
set_location_assignment PIN_K20   -to usb1_d[0]
set_location_assignment PIN_H20   -to usb1_d[1]
set_location_assignment PIN_J22   -to usb1_d[2]
set_location_assignment PIN_H22   -to usb1_d[3]
set_location_assignment PIN_J20   -to usb1_d[4]
set_location_assignment PIN_K21   -to usb1_d[5]
set_location_assignment PIN_J23   -to usb1_d[6]
set_location_assignment PIN_H23   -to usb1_d[7]
set_location_assignment PIN_E17   -to hps_usb_resetn

set_instance_assignment -name IO_STANDARD "1.8 V" -to usb1_clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to usb1_dir
set_instance_assignment -name IO_STANDARD "1.8 V" -to usb1_nxt
set_instance_assignment -name IO_STANDARD "1.8 V" -to usb1_stp
set_instance_assignment -name IO_STANDARD "1.8 V" -to usb1_d[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to usb1_d[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to usb1_d[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to usb1_d[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to usb1_d[4]
set_instance_assignment -name IO_STANDARD "1.8 V" -to usb1_d[5]
set_instance_assignment -name IO_STANDARD "1.8 V" -to usb1_d[6]
set_instance_assignment -name IO_STANDARD "1.8 V" -to usb1_d[7]
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_usb_resetn

# hps-uart

set_location_assignment PIN_K15   -to uart0_tx
set_location_assignment PIN_F13   -to uart0_rx

set_instance_assignment -name IO_STANDARD "1.8 V" -to uart0_tx
set_instance_assignment -name IO_STANDARD "1.8 V" -to uart0_rx

# hps-i2c (fmc)

set_location_assignment PIN_C16   -to hps_scl
set_location_assignment PIN_C17   -to hps_sda

set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_scl
set_instance_assignment -name IO_STANDARD "1.8 V" -to hps_sda


