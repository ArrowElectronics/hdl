
# fpga-ddr4 settings

set_location_assignment PIN_F6 -to sys_ddr_ref_clk
set_location_assignment PIN_F5 -to "sys_ddr_ref_clk(n)"

set_instance_assignment -name IO_STANDARD LVDS -to sys_ddr_ref_clk
set_instance_assignment -name IO_STANDARD LVDS -to "sys_ddr_ref_clk(n)"

set_location_assignment PIN_E6  -to sys_ddr_a[16]
set_location_assignment PIN_E7  -to sys_ddr_a[15]
set_location_assignment PIN_D2  -to sys_ddr_a[14]
set_location_assignment PIN_E2  -to sys_ddr_a[13]
set_location_assignment PIN_E3  -to sys_ddr_a[12]
set_location_assignment PIN_G6  -to sys_ddr_a[11]
set_location_assignment PIN_G5  -to sys_ddr_a[10]
set_location_assignment PIN_H2  -to sys_ddr_a[9]
set_location_assignment PIN_H3  -to sys_ddr_a[8]
set_location_assignment PIN_D1  -to sys_ddr_a[7]
set_location_assignment PIN_E1  -to sys_ddr_a[6]
set_location_assignment PIN_G3  -to sys_ddr_a[5]
set_location_assignment PIN_G2  -to sys_ddr_a[4]
set_location_assignment PIN_H4  -to sys_ddr_a[3]
set_location_assignment PIN_H5  -to sys_ddr_a[2]
set_location_assignment PIN_F1  -to sys_ddr_a[1]
set_location_assignment PIN_G1  -to sys_ddr_a[0]
set_location_assignment PIN_L11 -to sys_ddr_act_n
set_location_assignment PIN_N2  -to sys_ddr_alert_n
set_location_assignment PIN_C3  -to sys_ddr_ba[1]
set_location_assignment PIN_E4  -to sys_ddr_ba[0]
set_location_assignment PIN_B3  -to sys_ddr_bg
set_location_assignment PIN_L9  -to sys_ddr_ck_p
set_location_assignment PIN_L10 -to sys_ddr_ck_n
set_location_assignment PIN_F3  -to sys_ddr_oct_rzq
set_location_assignment PIN_J6  -to sys_ddr_cke
set_location_assignment PIN_M11 -to sys_ddr_cs_n
set_location_assignment PIN_A9  -to sys_ddr_dbi_n[7]
set_location_assignment PIN_D7  -to sys_ddr_dbi_n[6]
set_location_assignment PIN_G11 -to sys_ddr_dbi_n[5]
set_location_assignment PIN_D10 -to sys_ddr_dbi_n[4]
set_location_assignment PIN_W9  -to sys_ddr_dbi_n[3]
set_location_assignment PIN_P6  -to sys_ddr_dbi_n[2]
set_location_assignment PIN_L6  -to sys_ddr_dbi_n[1]
set_location_assignment PIN_N3  -to sys_ddr_dbi_n[0]
set_location_assignment PIN_C7  -to sys_ddr_dq[63]
set_location_assignment PIN_A10 -to sys_ddr_dq[62]
set_location_assignment PIN_B7  -to sys_ddr_dq[61]
set_location_assignment PIN_A11 -to sys_ddr_dq[60]
set_location_assignment PIN_B8  -to sys_ddr_dq[59]
set_location_assignment PIN_C8  -to sys_ddr_dq[57]
set_location_assignment PIN_C9  -to sys_ddr_dq[58]
set_location_assignment PIN_D9  -to sys_ddr_dq[56]
set_location_assignment PIN_C4  -to sys_ddr_dq[55]
set_location_assignment PIN_D4  -to sys_ddr_dq[54]
set_location_assignment PIN_D5  -to sys_ddr_dq[53]
set_location_assignment PIN_A6  -to sys_ddr_dq[52]
set_location_assignment PIN_B5  -to sys_ddr_dq[51]
set_location_assignment PIN_M13 -to sys_ddr_dq[40]
set_location_assignment PIN_C12 -to sys_ddr_dq[39]
set_location_assignment PIN_C13 -to sys_ddr_dq[38]
set_location_assignment PIN_C10 -to sys_ddr_dq[37]
set_location_assignment PIN_D12 -to sys_ddr_dq[36]
set_location_assignment PIN_A5  -to sys_ddr_dq[50]
set_location_assignment PIN_C5  -to sys_ddr_dq[49]
set_location_assignment PIN_B6  -to sys_ddr_dq[48]
set_location_assignment PIN_G12 -to sys_ddr_dq[47]
set_location_assignment PIN_H13 -to sys_ddr_dq[46]
set_location_assignment PIN_E13 -to sys_ddr_dq[45]
set_location_assignment PIN_L13 -to sys_ddr_dq[44]
set_location_assignment PIN_F13 -to sys_ddr_dq[43]
set_location_assignment PIN_J12 -to sys_ddr_dq[42]
set_location_assignment PIN_H12 -to sys_ddr_dq[41]
set_location_assignment PIN_F11 -to sys_ddr_dq[35]
set_location_assignment PIN_E11 -to sys_ddr_dq[34]
set_location_assignment PIN_B10 -to sys_ddr_dq[33]
set_location_assignment PIN_E12 -to sys_ddr_dq[32]
set_location_assignment PIN_V7  -to sys_ddr_dq[31]
set_location_assignment PIN_W10 -to sys_ddr_dq[30]
set_location_assignment PIN_V8  -to sys_ddr_dq[29]
set_location_assignment PIN_T9  -to sys_ddr_dq[28]
set_location_assignment PIN_V9  -to sys_ddr_dq[27]
set_location_assignment PIN_T8  -to sys_ddr_dq[26]
set_location_assignment PIN_U7  -to sys_ddr_dq[25]
set_location_assignment PIN_R9  -to sys_ddr_dq[24]
set_location_assignment PIN_R8  -to sys_ddr_dq[23]
set_location_assignment PIN_L8  -to sys_ddr_dq[22]
set_location_assignment PIN_P7  -to sys_ddr_dq[21]
set_location_assignment PIN_P9  -to sys_ddr_dq[20]
set_location_assignment PIN_R7  -to sys_ddr_dq[19]
set_location_assignment PIN_N9  -to sys_ddr_dq[18]
set_location_assignment PIN_N7  -to sys_ddr_dq[17]
set_location_assignment PIN_K7  -to sys_ddr_dq[16]
set_location_assignment PIN_L5  -to sys_ddr_dq[15]
set_location_assignment PIN_M6  -to sys_ddr_dq[14]
set_location_assignment PIN_M5  -to sys_ddr_dq[13]
set_location_assignment PIN_N4  -to sys_ddr_dq[12]
set_location_assignment PIN_L4  -to sys_ddr_dq[11]
set_location_assignment PIN_M7  -to sys_ddr_dq[10]
set_location_assignment PIN_K4  -to sys_ddr_dq[9]
set_location_assignment PIN_N5  -to sys_ddr_dq[8]
set_location_assignment PIN_M1  -to sys_ddr_dq[7]
set_location_assignment PIN_M2  -to sys_ddr_dq[6]
set_location_assignment PIN_L1  -to sys_ddr_dq[5]
set_location_assignment PIN_M3  -to sys_ddr_dq[4]
set_location_assignment PIN_K1  -to sys_ddr_dq[3]
set_location_assignment PIN_L3  -to sys_ddr_dq[2]
set_location_assignment PIN_K2  -to sys_ddr_dq[1]
set_location_assignment PIN_K3  -to sys_ddr_dq[0]
set_location_assignment PIN_E8  -to sys_ddr_dqs_p[7]
set_location_assignment PIN_E9  -to sys_ddr_dqs_n[7]
set_location_assignment PIN_A3  -to sys_ddr_dqs[6]
set_location_assignment PIN_A4  -to sys_ddr_dqs_n[6]
set_location_assignment PIN_K12 -to sys_ddr_dqs[5]
set_location_assignment PIN_K13 -to sys_ddr_dqs_n[5]
set_location_assignment PIN_B11 -to sys_ddr_dqs[4]
set_location_assignment PIN_B12 -to sys_ddr_dqs_n[4]
set_location_assignment PIN_U10 -to sys_ddr_dqs[3]
set_location_assignment PIN_T10 -to sys_ddr_dqs_n[3]
set_location_assignment PIN_N8  -to sys_ddr_dqs[2]
set_location_assignment PIN_M8  -to sys_ddr_dqs_n[2]
set_location_assignment PIN_J4  -to sys_ddr_dqs[1]
set_location_assignment PIN_J5  -to sys_ddr_dqs_n[1]
set_location_assignment PIN_J1  -to sys_ddr_dqs[0]
set_location_assignment PIN_J2  -to sys_ddr_dqs_n[0]
set_location_assignment PIN_K8  -to sys_ddr_odt
set_location_assignment PIN_J9  -to sys_ddr_par
set_location_assignment PIN_M10 -to sys_ddr_reset_n

