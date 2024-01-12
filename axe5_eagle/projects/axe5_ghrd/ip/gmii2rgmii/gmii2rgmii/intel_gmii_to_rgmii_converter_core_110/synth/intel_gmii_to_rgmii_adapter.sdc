# (C) 2001-2023 Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files from any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License Subscription 
# Agreement, Intel FPGA IP License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Intel and sold by 
# Intel or its authorized distributors.  Please refer to the applicable 
# agreement for further details.




if {[get_current_instance] == ""} { set ipath "" } else { set ipath "[get_current_instance]|*" } 



post_message -type info "\[GMII-to-RGMII\] Following instance found in the design ---  $ipath"




create_generated_clock -name 2_5m_3mux1 -source [get_pins ${ipath}u_rgmii_o_c2p_clock_mux|u_clk0_gate|inclk] [get_pins ${ipath}u_rgmii_o_c2p_clock_mux|outclk|combout]

create_generated_clock -name 25m_3mux1 -source [get_pins ${ipath}u_rgmii_o_c2p_clock_mux|u_clk1_gate|inclk] [get_pins ${ipath}u_rgmii_o_c2p_clock_mux|outclk|combout] -add

create_generated_clock -name 250m_3mux1 -source [get_pins ${ipath}u_rgmii_o_c2p_clock_mux|u_clk2_gate|inclk] [get_pins ${ipath}u_rgmii_o_c2p_clock_mux|outclk|combout] -add


set_clock_groups -logically_exclusive -group {2_5m_3mux1} -group {25m_3mux1} -group {250m_3mux1}


create_generated_clock -name rgmii_o0_sf_divclk -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|txd_int0|clk_in] -master_clock [get_clocks 250m_3mux1]  [get_registers  ${ipath}u_rgmii_module|txd_int0~rgmii_div_reg]

create_generated_clock -name rgmii_o1_sf_divclk -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|txd_int1|clk_in] -master_clock [get_clocks 250m_3mux1]  [get_registers  ${ipath}u_rgmii_module|txd_int1~rgmii_div_reg]

create_generated_clock -name rgmii_o2_sf_divclk -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|txd_int2|clk_in] -master_clock [get_clocks 250m_3mux1]  [get_registers  ${ipath}u_rgmii_module|txd_int2~rgmii_div_reg]

create_generated_clock -name rgmii_o3_sf_divclk -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|txd_int3|clk_in] -master_clock [get_clocks 250m_3mux1]  [get_registers  ${ipath}u_rgmii_module|txd_int3~rgmii_div_reg]

create_generated_clock -name rgmii_octl_sf_divclk -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|tx_ctrl_int|clk_in] -master_clock [get_clocks 250m_3mux1]  [get_registers  ${ipath}u_rgmii_module|tx_ctrl_int~rgmii_div_reg]



#for 25MHz

create_generated_clock -name rgmii_o0_sf_divclk_25 -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|txd_int0|clk_in] -master_clock [get_clocks 25m_3mux1]  [get_registers  ${ipath}u_rgmii_module|txd_int0~rgmii_div_reg] -add

create_generated_clock -name rgmii_o1_sf_divclk_25 -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|txd_int1|clk_in] -master_clock [get_clocks 25m_3mux1]  [get_registers  ${ipath}u_rgmii_module|txd_int1~rgmii_div_reg] -add

create_generated_clock -name rgmii_o2_sf_divclk_25 -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|txd_int2|clk_in] -master_clock [get_clocks 25m_3mux1]  [get_registers  ${ipath}u_rgmii_module|txd_int2~rgmii_div_reg] -add

create_generated_clock -name rgmii_o3_sf_divclk_25 -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|txd_int3|clk_in] -master_clock [get_clocks 25m_3mux1]  [get_registers  ${ipath}u_rgmii_module|txd_int3~rgmii_div_reg] -add

create_generated_clock -name rgmii_octl_sf_divclk_25 -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|tx_ctrl_int|clk_in] -master_clock [get_clocks 25m_3mux1]  [get_registers  ${ipath}u_rgmii_module|tx_ctrl_int~rgmii_div_reg] -add



#for 2.5MHz 

create_generated_clock -name rgmii_o0_sf_divclk_2_5 -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|txd_int0|clk_in] -master_clock [get_clocks 2_5m_3mux1]  [get_registers  ${ipath}u_rgmii_module|txd_int0~rgmii_div_reg] -add

create_generated_clock -name rgmii_o1_sf_divclk_2_5 -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|txd_int1|clk_in] -master_clock [get_clocks 2_5m_3mux1]  [get_registers  ${ipath}u_rgmii_module|txd_int1~rgmii_div_reg] -add

create_generated_clock -name rgmii_o2_sf_divclk_2_5 -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|txd_int2|clk_in] -master_clock [get_clocks 2_5m_3mux1]  [get_registers  ${ipath}u_rgmii_module|txd_int2~rgmii_div_reg] -add

create_generated_clock -name rgmii_o3_sf_divclk_2_5 -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|txd_int3|clk_in] -master_clock [get_clocks 2_5m_3mux1]  [get_registers  ${ipath}u_rgmii_module|txd_int3~rgmii_div_reg] -add

create_generated_clock -name rgmii_octl_sf_divclk_2_5 -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|tx_ctrl_int|clk_in] -master_clock [get_clocks 2_5m_3mux1]  [get_registers  ${ipath}u_rgmii_module|tx_ctrl_int~rgmii_div_reg] -add



set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o0_sf_divclk_2_5 ]   -group [ get_clocks rgmii_o0_sf_divclk_25 ]   -group [ get_clocks rgmii_o0_sf_divclk ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o1_sf_divclk_2_5 ]   -group [ get_clocks rgmii_o1_sf_divclk_25 ]   -group [ get_clocks rgmii_o1_sf_divclk ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o2_sf_divclk_2_5 ]   -group [ get_clocks rgmii_o2_sf_divclk_25 ]   -group [ get_clocks rgmii_o2_sf_divclk ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o3_sf_divclk_2_5 ]   -group [ get_clocks rgmii_o3_sf_divclk_25 ]   -group [ get_clocks rgmii_o3_sf_divclk ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_octl_sf_divclk_2_5 ] -group [ get_clocks rgmii_octl_sf_divclk_25 ] -group [ get_clocks rgmii_octl_sf_divclk ]



set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o0_sf_divclk_2_5 ]   -group [ get_clocks 25m_3mux1 ]   -group [ get_clocks 250m_3mux1 ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o1_sf_divclk_2_5 ]   -group [ get_clocks 25m_3mux1 ]   -group [ get_clocks 250m_3mux1 ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o2_sf_divclk_2_5 ]   -group [ get_clocks 25m_3mux1 ]   -group [ get_clocks 250m_3mux1 ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o3_sf_divclk_2_5 ]   -group [ get_clocks 25m_3mux1 ]   -group [ get_clocks 250m_3mux1 ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_octl_sf_divclk_2_5 ] -group [ get_clocks 25m_3mux1 ]   -group [ get_clocks 250m_3mux1 ]



set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o0_sf_divclk_25 ]   -group [ get_clocks 2_5m_3mux1 ]   -group [ get_clocks 250m_3mux1 ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o1_sf_divclk_25 ]   -group [ get_clocks 2_5m_3mux1 ]   -group [ get_clocks 250m_3mux1 ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o2_sf_divclk_25 ]   -group [ get_clocks 2_5m_3mux1 ]   -group [ get_clocks 250m_3mux1 ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o3_sf_divclk_25 ]   -group [ get_clocks 2_5m_3mux1 ]   -group [ get_clocks 250m_3mux1 ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_octl_sf_divclk_25 ] -group [ get_clocks 2_5m_3mux1 ]   -group [ get_clocks 250m_3mux1 ]



set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o0_sf_divclk ]   -group [ get_clocks 2_5m_3mux1 ]   -group [ get_clocks 25m_3mux1 ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o1_sf_divclk ]   -group [ get_clocks 2_5m_3mux1 ]   -group [ get_clocks 25m_3mux1 ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o2_sf_divclk ]   -group [ get_clocks 2_5m_3mux1 ]   -group [ get_clocks 25m_3mux1 ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_o3_sf_divclk ]   -group [ get_clocks 2_5m_3mux1 ]   -group [ get_clocks 25m_3mux1 ]

set_clock_groups -logically_exclusive -group [ get_clocks rgmii_octl_sf_divclk ] -group [ get_clocks 2_5m_3mux1 ]   -group [ get_clocks 25m_3mux1 ]





create_generated_clock -name rgmii_i0_sf_divclk -divide_by 2 -source [get_pins ${ipath}u_rgmii_module|rxd_int0|clk_in] [get_registers  ${ipath}u_rgmii_module|rxd_int0~rgmii_div_reg]

create_generated_clock -name rgmii_i1_sf_divclk -divide_by 2 -source [get_pins ${ipath}u_rgmii_module|rxd_int1|clk_in] [get_registers  ${ipath}u_rgmii_module|rxd_int1~rgmii_div_reg]

create_generated_clock -name rgmii_i2_sf_divclk -divide_by 2 -source [get_pins ${ipath}u_rgmii_module|rxd_int2|clk_in] [get_registers  ${ipath}u_rgmii_module|rxd_int2~rgmii_div_reg]

create_generated_clock -name rgmii_i3_sf_divclk -divide_by 2 -source [get_pins ${ipath}u_rgmii_module|rxd_int3|clk_in] [get_registers  ${ipath}u_rgmii_module|rxd_int3~rgmii_div_reg]

create_generated_clock -name rgmii_ictl_sf_divclk -divide_by 2 -source [get_pins  ${ipath}u_rgmii_module|rxd_ctrl_inst|clk_in] [get_registers  ${ipath}u_rgmii_module|rxd_ctrl_inst~rgmii_div_reg]





#synchronizer false path

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_c2p_clk_reset_sync|din_sync_1]

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_c2p_clk_reset_sync|din_sync_2]

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_mux_2x_clk_reset_sync|din_sync_1]

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_mux_2x_clk_reset_sync|din_sync_2]

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_c2p_clk_reset_sync|din_sync_1]

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_c2p_clk_reset_sync|din_sync_2]

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_250m_clk_reset_sync|din_sync_2]

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_250m_clk_reset_sync|din_sync_1]

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_125m_clk_reset_sync|din_sync_1]

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_125m_clk_reset_sync|din_sync_2]

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_rx_clk_reset_even_sync|din_sync_1]

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_rx_clk_reset_even_sync|din_sync_2]

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_rx_clk_reset_sync|din_sync_1]

set_false_path -from * -to [get_keepers -no_duplicates ${ipath}u_rx_clk_reset_sync|din_sync_2]

set_clock_uncertainty -to [get_clocks rgmii_o0_sf_divclk] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_o1_sf_divclk] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_o2_sf_divclk] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_o3_sf_divclk] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_octl_sf_divclk] -hold 0

set_clock_uncertainty -to [get_clocks rgmii_o0_sf_divclk_25] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_o1_sf_divclk_25] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_o2_sf_divclk_25] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_o3_sf_divclk_25] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_octl_sf_divclk_25] -hold 0

set_clock_uncertainty -to [get_clocks rgmii_o0_sf_divclk_2_5] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_o1_sf_divclk_2_5] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_o2_sf_divclk_2_5] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_o3_sf_divclk_2_5] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_octl_sf_divclk_2_5] -hold 0

set_clock_uncertainty -to [get_clocks rgmii_i0_sf_divclk] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_i1_sf_divclk] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_i2_sf_divclk] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_i3_sf_divclk] -hold 0
set_clock_uncertainty -to [get_clocks rgmii_ictl_sf_divclk] -hold 0
