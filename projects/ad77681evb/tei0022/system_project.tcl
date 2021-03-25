source ../../scripts/adi_env.tcl
source ../../scripts/adi_project_intel.tcl

adi_project ad7768_1_fmc_tei0022

set_global_assignment -name VERILOG_FILE ../common/ad77681_upscale.v

source $ad_hdl_dir/projects/common/tei0022/tei0022_system_assign.tcl

# ad7768-1 spi interface

set_location_assignment PIN_F15  -to ad77681_spi_clk	; ## D08  FMC_LPC_LA01_CC_P
set_location_assignment PIN_H13  -to ad77681_drdy 	; ## D11 FMC_LPC_LA05_P
set_location_assignment PIN_B13  -to ad77681_spi_csn	; ## H10  FMC_LPC_LA04_N
set_location_assignment PIN_K12  -to ad77681_spi_mosi   ; ## G09  FMC_LPC_LA03_P
set_location_assignment PIN_A11  -to ad77681_spi_miso   ; ## H07  FMC_LPC_LA02_P  

set_location_assignment PIN_C13  -to ad77681_MCLK       ; ##G6 FMC_LA00_CC_P  

set_location_assignment PIN_C12  -to ad77681_sync_in    ; ## C10  FMC_LPC_LA06_P
set_location_assignment PIN_J14  -to ad77681_sync_out   ; ## H05  FMC_LPC_CLK0_M2C_N
set_location_assignment PIN_A9   -to ad77681_reset      ; ## G15  FMC_LPC_LA12_P
set_location_assignment PIN_C10  -to ad77681_gpio[0]    ; ## G12  FMC_LPC_LA08_P
set_location_assignment PIN_E9   -to ad77681_gpio[1]    ; ## D14  FMC_LPC_LA09_P
set_location_assignment PIN_E8   -to ad77681_gpio[2]    ; ## C14  FMC_LPC_LA10_P
set_location_assignment PIN_F9   -to ad77681_gpio[3]    ; ## H16  FMC_LPC_LA11 _P   //added lines check for assingment

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad77681_spi_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad77681_spi_csn
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad77681_spi_miso
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad77681_spi_mosi
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad77681_drdy 
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad77681_reset
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad77681_sync_out
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad77681_sync_in
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad77681_gpio[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad77681_gpio[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad77681_gpio[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad77681_gpio[3]

set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to ad77681_MCLK       

set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad77681_spi_clk
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad77681_spi_csn
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad77681_spi_miso
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad77681_spi_mosi

# ad7768-1 i2c interface

#set_location_assignment PIN_N12  -to fmc_scl			; ## C30  FMC_HPC_SCL
#set_location_assignment PIN_C23  -to fmc_sda			; ## C31  FMC_HPC_SDA

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to fmc_scl
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to fmc_sda

execute_flow -compile
