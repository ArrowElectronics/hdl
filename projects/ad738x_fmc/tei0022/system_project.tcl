
source ../../scripts/adi_env.tcl
source ../../scripts/adi_project_intel.tcl

adi_project ad738x_fmc_tei0022

source $ad_hdl_dir/projects/common/tei0022/tei0022_system_assign.tcl

# ad738x spi interface

set_location_assignment PIN_C13  -to ad738x_spi_sclk		; ## G06  LA00_CC_P
set_location_assignment PIN_B12  -to ad738x_spi_cs		; ## G07  LA00_CC_N
set_location_assignment PIN_F15  -to ad738x_spi_sdi[0]		; ## D08  LA01_CC_P
set_location_assignment PIN_F14  -to ad738x_spi_sdi[1]		; ## D09  LA01_CC_N
set_location_assignment PIN_A11  -to ad738x_spi_sdo		; ## H07  LA02_P 

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad738x_spi_cs		
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad738x_spi_sclk		
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad738x_spi_sdo		
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad738x_spi_sdi[0]	
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad738x_spi_sdi[1]		

set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad738x_spi_cs		
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad738x_spi_sclk		
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad738x_spi_sdo		
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad738x_spi_sdi[0]	
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad738x_spi_sdi[1]		


execute_flow -compile

