
set_property  -dict {PACKAGE_PIN  F14 IOSTANDARD LVCMOS33 PULLTYPE PULLUP} [get_ports iic_scl]
set_property  -dict {PACKAGE_PIN  F13 IOSTANDARD LVCMOS33 PULLTYPE PULLUP} [get_ports iic_sda]

set_property  -dict {PACKAGE_PIN  E12 IOSTANDARD LVCMOS33 } [get_ports ad9963_resetn]

set_property  -dict {PACKAGE_PIN  G15 IOSTANDARD LVCMOS33} [get_ports adf4360_cs]
set_property  -dict {PACKAGE_PIN  E11 IOSTANDARD LVCMOS33} [get_ports ad9963_csn]
set_property  -dict {PACKAGE_PIN  E13 IOSTANDARD LVCMOS33} [get_ports spi_clk]
set_property  -dict {PACKAGE_PIN  F12 IOSTANDARD LVCMOS33} [get_ports spi_sdio]

set_property  -dict {PACKAGE_PIN  F15 IOSTANDARD LVCMOS33} [get_ports en_power_analog]

set_property  -dict {PACKAGE_PIN  M12 IOSTANDARD LVCMOS33} [get_ports trigger_bd[0]]
set_property  -dict {PACKAGE_PIN  N12 IOSTANDARD LVCMOS33} [get_ports trigger_bd[1]]

set_property  -dict {PACKAGE_PIN  K11 IOSTANDARD LVCMOS33} [get_ports data_bd[0]]
set_property  -dict {PACKAGE_PIN  K12 IOSTANDARD LVCMOS33} [get_ports data_bd[1]]
set_property  -dict {PACKAGE_PIN  K13 IOSTANDARD LVCMOS33} [get_ports data_bd[2]]
set_property  -dict {PACKAGE_PIN  L13 IOSTANDARD LVCMOS33} [get_ports data_bd[3]]
set_property  -dict {PACKAGE_PIN  L14 IOSTANDARD LVCMOS33} [get_ports data_bd[4]]
set_property  -dict {PACKAGE_PIN  M14 IOSTANDARD LVCMOS33} [get_ports data_bd[5]]
set_property  -dict {PACKAGE_PIN  L15 IOSTANDARD LVCMOS33} [get_ports data_bd[6]]
set_property  -dict {PACKAGE_PIN  M15 IOSTANDARD LVCMOS33} [get_ports data_bd[7]]
set_property  -dict {PACKAGE_PIN  N13 IOSTANDARD LVCMOS33} [get_ports data_bd[8]]
set_property  -dict {PACKAGE_PIN  P14 IOSTANDARD LVCMOS33} [get_ports data_bd[9]]
set_property  -dict {PACKAGE_PIN  R12 IOSTANDARD LVCMOS33} [get_ports data_bd[10]]
set_property  -dict {PACKAGE_PIN  R13 IOSTANDARD LVCMOS33} [get_ports data_bd[11]]
set_property  -dict {PACKAGE_PIN  P11 IOSTANDARD LVCMOS33} [get_ports data_bd[12]]
set_property  -dict {PACKAGE_PIN  R11 IOSTANDARD LVCMOS33} [get_ports data_bd[13]]
set_property  -dict {PACKAGE_PIN  P15 IOSTANDARD LVCMOS33} [get_ports data_bd[14]]
set_property  -dict {PACKAGE_PIN  R15 IOSTANDARD LVCMOS33} [get_ports data_bd[15]]

set_property  -dict {PACKAGE_PIN  N11 IOSTANDARD LVCMOS33} [get_ports rx_clk]
set_property  -dict {PACKAGE_PIN  P13 IOSTANDARD LVCMOS33} [get_ports rxiq]
set_property  -dict {PACKAGE_PIN  P10 IOSTANDARD LVCMOS33} [get_ports rxd[0]]
set_property  -dict {PACKAGE_PIN  R10 IOSTANDARD LVCMOS33} [get_ports rxd[1]]
set_property  -dict {PACKAGE_PIN  P8  IOSTANDARD LVCMOS33} [get_ports rxd[2]]
set_property  -dict {PACKAGE_PIN  P9  IOSTANDARD LVCMOS33} [get_ports rxd[3]]
set_property  -dict {PACKAGE_PIN  N7  IOSTANDARD LVCMOS33} [get_ports rxd[4]]
set_property  -dict {PACKAGE_PIN  N8  IOSTANDARD LVCMOS33} [get_ports rxd[5]]
set_property  -dict {PACKAGE_PIN  M10 IOSTANDARD LVCMOS33} [get_ports rxd[6]]
set_property  -dict {PACKAGE_PIN  M11 IOSTANDARD LVCMOS33} [get_ports rxd[7]]
set_property  -dict {PACKAGE_PIN  R7  IOSTANDARD LVCMOS33} [get_ports rxd[8]]
set_property  -dict {PACKAGE_PIN  R8  IOSTANDARD LVCMOS33} [get_ports rxd[9]]
set_property  -dict {PACKAGE_PIN  M9  IOSTANDARD LVCMOS33} [get_ports rxd[10]]
set_property  -dict {PACKAGE_PIN  N9  IOSTANDARD LVCMOS33} [get_ports rxd[11]]

set_property  -dict {PACKAGE_PIN  L12 IOSTANDARD LVCMOS33} [get_ports tx_clk]
set_property  -dict {PACKAGE_PIN  N14 IOSTANDARD LVCMOS33} [get_ports txiq]
set_property  -dict {PACKAGE_PIN  H12 IOSTANDARD LVCMOS33} [get_ports txd[0]]
set_property  -dict {PACKAGE_PIN  G11 IOSTANDARD LVCMOS33} [get_ports txd[1]]
set_property  -dict {PACKAGE_PIN  H13 IOSTANDARD LVCMOS33} [get_ports txd[2]]
set_property  -dict {PACKAGE_PIN  G12 IOSTANDARD LVCMOS33} [get_ports txd[3]]
set_property  -dict {PACKAGE_PIN  H14 IOSTANDARD LVCMOS33} [get_ports txd[4]]
set_property  -dict {PACKAGE_PIN  G14 IOSTANDARD LVCMOS33} [get_ports txd[5]]
set_property  -dict {PACKAGE_PIN  K15 IOSTANDARD LVCMOS33} [get_ports txd[6]]
set_property  -dict {PACKAGE_PIN  J15 IOSTANDARD LVCMOS33} [get_ports txd[7]]
set_property  -dict {PACKAGE_PIN  J14 IOSTANDARD LVCMOS33} [get_ports txd[8]]
set_property  -dict {PACKAGE_PIN  J13 IOSTANDARD LVCMOS33} [get_ports txd[9]]
set_property  -dict {PACKAGE_PIN  J11 IOSTANDARD LVCMOS33} [get_ports txd[10]]
set_property  -dict {PACKAGE_PIN  H11 IOSTANDARD LVCMOS33} [get_ports txd[11]]

create_clock -period 10.000 -name rx_clk [get_ports rx_clk]
create_clock -period 6.66 -name tx_clk [get_ports tx_clk]

create_clock -period 12.500 -name data_clk [get_ports {data_bd[0]}]

create_clock -name clk_fpga_0 -period 36 [get_pins "i_system_wrapper/system_i/sys_ps7/inst/PS7_i/FCLKCLK[0]"]
create_clock -name clk_fpga_1 -period  5 [get_pins "i_system_wrapper/system_i/sys_ps7/inst/PS7_i/FCLKCLK[1]"]
create_clock -name clk_fpga_2 -period 10 [get_pins "i_system_wrapper/system_i/sys_ps7/inst/PS7_i/FCLKCLK[2]"]
create_clock -name clk_fpga_3 -period 18 [get_pins "i_system_wrapper/system_i/sys_ps7/inst/PS7_i/FCLKCLK[3]"]

set_false_path -from [get_clocks data_clk] -to [get_pins {i_system_wrapper/system_i/logic_analyzer/inst/data_m1_reg[0]/D}]

set_clock_groups -name exclusive_ -physically_exclusive \
-group  [get_clocks data_clk] -group  [get_clocks clk_fpga_2]

set_input_jitter clk_fpga_0 0.3
set_input_jitter clk_fpga_1 0.15

set_property IOSTANDARD LVCMOS18 [get_ports *fixed_io_mio*]
set_property SLEW SLOW [get_ports *fixed_io_mio*]
set_property DRIVE 8 [get_ports *fixed_io_mio*]
set_property  -dict {PACKAGE_PIN D8   PULLTYPE PULLUP} [get_ports fixed_io_mio[ 0]]
set_property  -dict {PACKAGE_PIN A5   PULLTYPE PULLUP} [get_ports fixed_io_mio[ 1]]
set_property  -dict {PACKAGE_PIN A8                  } [get_ports fixed_io_mio[ 2]]
set_property  -dict {PACKAGE_PIN A7                  } [get_ports fixed_io_mio[ 3]]
set_property  -dict {PACKAGE_PIN C8                  } [get_ports fixed_io_mio[ 4]]
set_property  -dict {PACKAGE_PIN A9                  } [get_ports fixed_io_mio[ 5]]
set_property  -dict {PACKAGE_PIN A10                 } [get_ports fixed_io_mio[ 6]]
set_property  -dict {PACKAGE_PIN D9                  } [get_ports fixed_io_mio[ 7]]
set_property  -dict {PACKAGE_PIN B6                  } [get_ports fixed_io_mio[ 8]]
set_property  -dict {PACKAGE_PIN B5   PULLTYPE PULLUP} [get_ports fixed_io_mio[ 9]]
set_property  -dict {PACKAGE_PIN D6   PULLTYPE PULLUP} [get_ports fixed_io_mio[10]]
set_property  -dict {PACKAGE_PIN B10  PULLTYPE PULLUP} [get_ports fixed_io_mio[11]]
set_property  -dict {PACKAGE_PIN B7   PULLTYPE PULLUP} [get_ports fixed_io_mio[12]]
set_property  -dict {PACKAGE_PIN C6   PULLTYPE PULLUP} [get_ports fixed_io_mio[13]]
set_property  -dict {PACKAGE_PIN B9   PULLTYPE PULLUP} [get_ports fixed_io_mio[14]]
set_property  -dict {PACKAGE_PIN D10  PULLTYPE PULLUP} [get_ports fixed_io_mio[15]]
set_property  -dict {PACKAGE_PIN A15  PULLTYPE PULLUP} [get_ports fixed_io_mio[16]]
set_property  -dict {PACKAGE_PIN D11  PULLTYPE PULLUP} [get_ports fixed_io_mio[17]]
set_property  -dict {PACKAGE_PIN B15  PULLTYPE PULLUP} [get_ports fixed_io_mio[18]]
set_property  -dict {PACKAGE_PIN C12  PULLTYPE PULLUP} [get_ports fixed_io_mio[19]]
set_property  -dict {PACKAGE_PIN E15  PULLTYPE PULLUP} [get_ports fixed_io_mio[20]]
set_property  -dict {PACKAGE_PIN C11  PULLTYPE PULLUP} [get_ports fixed_io_mio[21]]
set_property  -dict {PACKAGE_PIN D15  PULLTYPE PULLUP} [get_ports fixed_io_mio[22]]
set_property  -dict {PACKAGE_PIN A14  PULLTYPE PULLUP} [get_ports fixed_io_mio[23]]
set_property  -dict {PACKAGE_PIN B14  PULLTYPE PULLUP} [get_ports fixed_io_mio[24]]
set_property  -dict {PACKAGE_PIN C14  PULLTYPE PULLUP} [get_ports fixed_io_mio[25]]
set_property  -dict {PACKAGE_PIN A13  PULLTYPE PULLUP} [get_ports fixed_io_mio[26]]
set_property  -dict {PACKAGE_PIN D14  PULLTYPE PULLUP} [get_ports fixed_io_mio[27]]
set_property  -dict {PACKAGE_PIN B12  PULLTYPE PULLUP} [get_ports fixed_io_mio[28]]
set_property  -dict {PACKAGE_PIN D13  PULLTYPE PULLUP} [get_ports fixed_io_mio[29]]
set_property  -dict {PACKAGE_PIN A12  PULLTYPE PULLUP} [get_ports fixed_io_mio[30]]
set_property  -dict {PACKAGE_PIN C13  PULLTYPE PULLUP} [get_ports fixed_io_mio[31]]

set_property IOSTANDARD LVCMOS18 [get_ports *fixed_io_ps*]
set_property SLEW SLOW [get_ports *fixed_io_ps*]
set_property DRIVE 8 [get_ports *fixed_io_ps*]
set_property PACKAGE_PIN C7 [get_ports fixed_io_ps_clk]
set_property PACKAGE_PIN C9 [get_ports fixed_io_ps_porb]

set_property IOSTANDARD SSTL15_T_DCI [get_ports *fixed_io_ddr_vr*]
set_property SLEW FAST [get_ports *fixed_io_ddr_vr*]
set_property PACKAGE_PIN H3 [get_ports fixed_io_ddr_vrp]
set_property PACKAGE_PIN J3 [get_ports fixed_io_ddr_vrn]

set_property IOSTANDARD DIFF_SSTL15 [get_ports *ddr_ck*]
set_property SLEW FAST [get_ports *ddr_ck*]
set_property PACKAGE_PIN N3 [get_ports ddr_ck_p]
set_property PACKAGE_PIN N2 [get_ports ddr_ck_n]

set_property IOSTANDARD SSTL15 [get_ports *ddr_addr*]
set_property SLEW SLOW [get_ports *ddr_addr*]
set_property PACKAGE_PIN P1 [get_ports ddr_addr[0]]
set_property PACKAGE_PIN N1 [get_ports ddr_addr[1]]
set_property PACKAGE_PIN M1 [get_ports ddr_addr[2]]
set_property PACKAGE_PIN M4 [get_ports ddr_addr[3]]
set_property PACKAGE_PIN P3 [get_ports ddr_addr[4]]
set_property PACKAGE_PIN P4 [get_ports ddr_addr[5]]
set_property PACKAGE_PIN P5 [get_ports ddr_addr[6]]
set_property PACKAGE_PIN M5 [get_ports ddr_addr[7]]
set_property PACKAGE_PIN P6 [get_ports ddr_addr[8]]
set_property PACKAGE_PIN N4 [get_ports ddr_addr[9]]
set_property PACKAGE_PIN J1 [get_ports ddr_addr[10]]
set_property PACKAGE_PIN L2 [get_ports ddr_addr[11]]
set_property PACKAGE_PIN M2 [get_ports ddr_addr[12]]
set_property PACKAGE_PIN K2 [get_ports ddr_addr[13]]
set_property PACKAGE_PIN K1 [get_ports ddr_addr[14]]

set_property IOSTANDARD SSTL15 [get_ports *ddr_ba*]
set_property SLEW SLOW [get_ports *ddr_ba*]
set_property PACKAGE_PIN M6 [get_ports ddr_ba[0]]
set_property PACKAGE_PIN R1 [get_ports ddr_ba[1]]
set_property PACKAGE_PIN N6 [get_ports ddr_ba[2]]

set_property IOSTANDARD SSTL15 [get_ports ddr_reset_n]
set_property SLEW FAST [get_ports ddr_reset_n]
set_property PACKAGE_PIN L4 [get_ports ddr_reset_n]
set_property IOSTANDARD SSTL15 [get_ports ddr_cs_n]
set_property SLEW SLOW [get_ports ddr_cs_n]
set_property PACKAGE_PIN R2 [get_ports ddr_cs_n]
set_property IOSTANDARD SSTL15 [get_ports ddr_ras_n]
set_property SLEW SLOW [get_ports ddr_ras_n]
set_property PACKAGE_PIN R6 [get_ports ddr_ras_n]
set_property IOSTANDARD SSTL15 [get_ports ddr_cas_n]
set_property SLEW SLOW [get_ports ddr_cas_n]
set_property PACKAGE_PIN R5 [get_ports ddr_cas_n]
set_property IOSTANDARD SSTL15 [get_ports ddr_we_n]
set_property SLEW SLOW [get_ports ddr_we_n]
set_property PACKAGE_PIN R3 [get_ports ddr_we_n]
set_property IOSTANDARD SSTL15 [get_ports ddr_cke]
set_property SLEW SLOW [get_ports ddr_cke]
set_property PACKAGE_PIN L3 [get_ports ddr_cke]
set_property IOSTANDARD SSTL15 [get_ports ddr_odt]
set_property SLEW SLOW [get_ports ddr_odt]
set_property PACKAGE_PIN K3 [get_ports ddr_odt]

set_property IOSTANDARD SSTL15_T_DCI [get_ports *ddr_dq[*]]
set_property SLEW FAST [get_ports *ddr_dq[*]]
set_property PACKAGE_PIN D4 [get_ports ddr_dq[0]]
set_property PACKAGE_PIN A2 [get_ports ddr_dq[1]]
set_property PACKAGE_PIN C4 [get_ports ddr_dq[2]]
set_property PACKAGE_PIN C1 [get_ports ddr_dq[3]]
set_property PACKAGE_PIN B4 [get_ports ddr_dq[4]]
set_property PACKAGE_PIN A4 [get_ports ddr_dq[5]]
set_property PACKAGE_PIN C3 [get_ports ddr_dq[6]]
set_property PACKAGE_PIN A3 [get_ports ddr_dq[7]]
set_property PACKAGE_PIN E1 [get_ports ddr_dq[8]]
set_property PACKAGE_PIN D1 [get_ports ddr_dq[9]]
set_property PACKAGE_PIN E2 [get_ports ddr_dq[10]]
set_property PACKAGE_PIN E3 [get_ports ddr_dq[11]]
set_property PACKAGE_PIN F3 [get_ports ddr_dq[12]]
set_property PACKAGE_PIN G1 [get_ports ddr_dq[13]]
set_property PACKAGE_PIN H1 [get_ports ddr_dq[14]]
set_property PACKAGE_PIN H2 [get_ports ddr_dq[15]]
set_property IOSTANDARD SSTL15_T_DCI [get_ports *ddr_dm[*]]
set_property SLEW FAST [get_ports *ddr_dm[*]]
set_property PACKAGE_PIN B1 [get_ports ddr_dm[0]]
set_property PACKAGE_PIN D3 [get_ports ddr_dm[1]]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports *ddr_dqs*]
set_property SLEW FAST [get_ports *ddr_dqs*]
set_property PACKAGE_PIN C2 [get_ports ddr_dqs_p[0]]
set_property PACKAGE_PIN B2 [get_ports ddr_dqs_n[0]]
set_property PACKAGE_PIN G2 [get_ports ddr_dqs_p[1]]
set_property PACKAGE_PIN F2 [get_ports ddr_dqs_n[1]]

set_switching_activity -static_probability 1 -toggle_rate 0 [get_nets i_system_wrapper/system_i/sys_cpu_resetn]
set_switching_activity -static_probability 0 -toggle_rate 0 [get_nets i_system_wrapper/system_i/logic_analyzer_reset_bus_struct_reset]
