
source ../../scripts/adi_env.tcl
source ../../scripts/adi_project_intel.tcl

adi_project ad40xx_fmc_tei0022

source $ad_hdl_dir/projects/common/tei0022/tei0022_system_assign.tcl

# ad40xx spi interface

set_location_assignment PIN_C13  -to ad40xx_spi_clk		; ## G06  LA00_CC_P
set_location_assignment PIN_B12  -to ad40xx_spi_csn		; ## G07  LA00_CC_N
set_location_assignment PIN_F15   -to ad40xx_spi_miso	; ## D08  LA01_P
set_location_assignment PIN_A11  -to ad40xx_spi_mosi	; ## H07  LA02_P 

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad40xx_spi_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad40xx_spi_csn
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad40xx_spi_miso
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad40xx_spi_mosi

set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad40xx_spi_clk
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad40xx_spi_csn
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad40xx_spi_miso
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad40xx_spi_mosi

# ad40xx i2c interface

#set_location_assignment PIN_N12  -to fmc_scl			; ## C30  FMC_HPC_SCL
#set_location_assignment PIN_C23  -to fmc_sda			; ## C31  FMC_HPC_SDA

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to fmc_scl
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to fmc_sda

set_global_assignment -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON
set_global_assignment -name PHYSICAL_SYNTHESIS_EFFORT FAST

execute_flow -compile

