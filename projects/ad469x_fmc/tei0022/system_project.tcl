
source ../../scripts/adi_env.tcl
source ../../scripts/adi_project_intel.tcl

adi_project ad469x_fmc_tei0022

source $ad_hdl_dir/projects/common/tei0022/tei0022_system_assign.tcl

# ad469x spi interface

set_location_assignment PIN_F14  -to ad469x_spi_sclk		; ## D09  LA01_CC_N
set_location_assignment PIN_C13  -to ad469x_spi_cs		; ## G06  LA00_CC_P
set_location_assignment PIN_F15  -to ad469x_spi_sdi_0		; ## D08  LA01_CC_P
set_location_assignment PIN_A10  -to ad469x_spi_sdi_1_busy	; ## H08  LA02_N
set_location_assignment PIN_A11  -to ad469x_spi_sdo		; ## H07  LA02_P 
set_location_assignment PIN_B12  -to ad469x_cnv 		; ## G07  LA00_CC_N

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad469x_spi_cs		
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad469x_spi_sclk		
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad469x_spi_sdo		
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad469x_spi_sdi_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad469x_spi_sdi_1_busy
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad469x_cnv 

set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad469x_spi_cs		
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad469x_spi_sclk		
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad469x_spi_sdo		
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad469x_spi_sdi_0	
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad469x_spi_sdi_1_busy	
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad469x_cnv 


execute_flow -compile

