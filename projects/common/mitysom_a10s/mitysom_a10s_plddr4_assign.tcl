
# pl-ddr4 settings

set_location_assignment PIN_N5    -to sys_ddr_ref_clk
set_location_assignment PIN_P5    -to "sys_ddr_ref_clk(n)"

set_instance_assignment -name IO_STANDARD LVDS -to sys_ddr_ref_clk
set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to sys_ddr_ref_clk -disable

set_location_assignment PIN_F2    -to sys_ddr_clk_p
set_location_assignment PIN_E2    -to sys_ddr_clk_n
set_location_assignment PIN_D3    -to sys_ddr_a[0]
set_location_assignment PIN_D4    -to sys_ddr_a[1]
set_location_assignment PIN_A2    -to sys_ddr_a[2]
set_location_assignment PIN_A3    -to sys_ddr_a[3]
set_location_assignment PIN_F4    -to sys_ddr_a[4]
set_location_assignment PIN_E4    -to sys_ddr_a[5]
set_location_assignment PIN_A4    -to sys_ddr_a[6]
set_location_assignment PIN_B4    -to sys_ddr_a[7]
set_location_assignment PIN_B3    -to sys_ddr_a[8]
set_location_assignment PIN_C3    -to sys_ddr_a[9]
set_location_assignment PIN_G5    -to sys_ddr_a[10]
set_location_assignment PIN_G6    -to sys_ddr_a[11]
set_location_assignment PIN_M6    -to sys_ddr_a[12]
set_location_assignment PIN_K5    -to sys_ddr_a[13]
set_location_assignment PIN_J5    -to sys_ddr_a[14]
set_location_assignment PIN_R6    -to sys_ddr_a[15]
set_location_assignment PIN_R7    -to sys_ddr_a[16]
set_location_assignment PIN_P7    -to sys_ddr_ba[0]
set_location_assignment PIN_P9    -to sys_ddr_ba[1]
set_location_assignment PIN_P8    -to sys_ddr_bg
set_location_assignment PIN_G3    -to sys_ddr_cke
set_location_assignment PIN_C1    -to sys_ddr_cs_n
set_location_assignment PIN_H3    -to sys_ddr_odt
set_location_assignment PIN_E1    -to sys_ddr_reset_n
set_location_assignment PIN_B1    -to sys_ddr_act_n
set_location_assignment PIN_C2    -to sys_ddr_par
set_location_assignment PIN_C7    -to sys_ddr_alert_n
set_location_assignment PIN_C5    -to sys_ddr_dqs_p[0]
set_location_assignment PIN_C6    -to sys_ddr_dqs_n[0]
set_location_assignment PIN_G4    -to sys_ddr_dqs_p[1]
set_location_assignment PIN_H5    -to sys_ddr_dqs_n[1]
set_location_assignment PIN_B5    -to sys_ddr_dq[0]
set_location_assignment PIN_B6    -to sys_ddr_dq[1]
set_location_assignment PIN_E5    -to sys_ddr_dq[2]
set_location_assignment PIN_E7    -to sys_ddr_dq[3]
set_location_assignment PIN_E6    -to sys_ddr_dq[4]
set_location_assignment PIN_D5    -to sys_ddr_dq[5]
set_location_assignment PIN_A7    -to sys_ddr_dq[6]
set_location_assignment PIN_A6    -to sys_ddr_dq[7]
set_location_assignment PIN_J7    -to sys_ddr_dq[8]
set_location_assignment PIN_H7    -to sys_ddr_dq[9]
set_location_assignment PIN_K7    -to sys_ddr_dq[10]
set_location_assignment PIN_H6    -to sys_ddr_dq[11]
set_location_assignment PIN_L6    -to sys_ddr_dq[12]
set_location_assignment PIN_K6    -to sys_ddr_dq[13]
set_location_assignment PIN_M8    -to sys_ddr_dq[14]
set_location_assignment PIN_N8    -to sys_ddr_dq[15]

set_location_assignment PIN_D7    -to sys_ddr_dbi_n[0]
set_location_assignment PIN_L7    -to sys_ddr_dbi_n[1]

set_location_assignment PIN_F6    -to sys_ddr_rzq

