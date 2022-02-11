
source ../../scripts/adi_env.tcl
source ../../scripts/adi_project_intel.tcl

adi_project ad463x_fmc_tei0022

source $ad_hdl_dir/projects/common/tei0022/tei0022_system_assign.tcl

# ad463x spi interface

set_location_assignment PIN_C13  -to ad463x_spi_sclk		; ## G06  LA00_CC_P
set_location_assignment PIN_B12  -to ad463x_spi_cs		; ## G07  LA00_CC_N
set_location_assignment PIN_A11  -to ad463x_spi_sdi[0]		; ## H07  LA02_CC_P
set_location_assignment PIN_A10  -to ad463x_spi_sdi[1]		; ## H08  LA02_CC_N
set_location_assignment PIN_K12  -to ad463x_spi_sdi[2]		; ## G09  LA03_CC_P
set_location_assignment PIN_J12  -to ad463x_spi_sdi[3]		; ## G10  LA03_CC_N
set_location_assignment PIN_B13  -to ad463x_spi_sdi[4]		; ## H10  LA04_CC_P
set_location_assignment PIN_A13  -to ad463x_spi_sdi[5]		; ## H11  LA04_CC_N
set_location_assignment PIN_H13  -to ad463x_spi_sdi[6]		; ## D11  LA05_CC_P
set_location_assignment PIN_H12  -to ad463x_spi_sdi[7]		; ## D12  LA05_CC_N
set_location_assignment PIN_F13  -to ad463x_echo_clk		; ## D20  LA17_CC_P
set_location_assignment PIN_D6   -to ad463x_busy		; ## C22  LA18_CC_P
set_location_assignment PIN_B11  -to ad463x_spi_sdo		; ## C11  LA06_N 
set_location_assignment PIN_F15  -to ad463x_cnv 		; ## D08  LA01_CC_P
set_location_assignment PIN_F14  -to ad463x_reset 		; ## D09  LA01_CC_N

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_spi_cs		
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_spi_sclk		
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_spi_sdo		
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_spi_sdi[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_spi_sdi[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_spi_sdi[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_spi_sdi[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_spi_sdi[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_spi_sdi[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_spi_sdi[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_spi_sdi[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_echo_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_busy
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_cnv 
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad463x_reset 

set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad463x_spi_cs		
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad463x_spi_sclk		
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad463x_spi_sdo			
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad463x_cnv 


execute_flow -compile

