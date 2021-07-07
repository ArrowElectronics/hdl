
source ../../scripts/adi_env.tcl
source ../../scripts/adi_project_intel.tcl

adi_project ad7768evb_tei0022

set_global_assignment -name VERILOG_FILE ../common/ad7768_if.v

source $ad_hdl_dir/projects/common/tei0022/tei0022_system_assign.tcl

# ad7768evb fmc interface

set_location_assignment PIN_K14  -to clk_in              ; ## H04  FMC_LPC_CLK0_M2C_P IO_L12P_T1_MRCC_34 
set_location_assignment PIN_C13  -to ready_in            ; ## G06  FMC_LPC_LA00_CC_P  IO_L13P_T2_MRCC_34 
set_location_assignment PIN_B12  -to data_in[0]          ; ## G07  FMC_LPC_LA00_CC_N  IO_L13N_T2_MRCC_34 
set_location_assignment PIN_B11  -to data_in[1]          ; ## C11  FMC_LPC_LA06_N     IO_L10N_T1_34      
set_location_assignment PIN_A11  -to data_in[2]          ; ## H07  FMC_LPC_LA02_P     IO_L20P_T3_34      
set_location_assignment PIN_A10  -to data_in[3]          ; ## H08  FMC_LPC_LA02_N     IO_L20N_T3_34      
set_location_assignment PIN_C10  -to data_in[4]          ; ## G12  FMC_LPC_LA08_P     IO_L8P_T1_34       
set_location_assignment PIN_C9   -to data_in[5]          ; ## G13  FMC_LPC_LA08_N     IO_L8N_T1_34       
set_location_assignment PIN_E9   -to data_in[6]          ; ## D14  FMC_LPC_LA09_P     IO_L17P_T2_34      
set_location_assignment PIN_D9   -to data_in[7]          ; ## D15  FMC_LPC_LA09_N     IO_L17N_T2_34      
set_location_assignment PIN_H13  -to spi_csn             ; ## D11  FMC_LPC_LA05_P     IO_L7P_T1_34       
set_location_assignment PIN_F15  -to spi_clk             ; ## D08  FMC_LPC_LA01_CC_P  IO_L14P_T2_SRCC_34 
set_location_assignment PIN_A13  -to spi_mosi            ; ## H11  FMC_LPC_LA04_N     IO_L15N_T2_DQS_34  
set_location_assignment PIN_K12  -to spi_miso            ; ## G09  FMC_LPC_LA03_P     IO_L16P_T2_34      
set_location_assignment PIN_D7   -to gpio_0_mode_0       ; ## C15  FMC_LPC_LA10_N     IO_L22N_T3_34             
set_location_assignment PIN_F11  -to gpio_1_mode_1       ; ## H13  FMC_LPC_LA07_P     IO_L21P_T3_DQS_34         
set_location_assignment PIN_E11  -to gpio_2_mode_2       ; ## H14  FMC_LPC_LA07_N     IO_L21N_T3_DQS_34         
set_location_assignment PIN_F9   -to gpio_3_mode_3       ; ## H16  FMC_LPC_LA11_P     IO_L5P_T0_34              
set_location_assignment PIN_E8   -to gpio_4_filter       ; ## C14  FMC_LPC_LA10_P     IO_L22P_T3_34             
set_location_assignment PIN_C12  -to reset_n             ; ## C10  FMC_LPC_LA06_P     IO_L10P_T1_34             
set_location_assignment PIN_J12  -to start_n             ; ## G10  FMC_LPC_LA03_N     IO_L16N_T2_34             
set_location_assignment PIN_B13  -to sync_n              ; ## H10  FMC_LPC_LA04_P     IO_L15P_T2_DQS_34         
set_location_assignment PIN_H12  -to sync_in_n           ; ## D12  FMC_LPC_LA05_N     IO_L7N_T1_34              
set_location_assignment PIN_F14  -to mclk                ; ## D09  FMC_LPC_LA01_CC_N  IO_L14N_T2_SRCC_34 

set_location_assignment Pin_AD9  -to test[0]   ; ## D12  FMC_LA05_P 
set_location_assignment Pin_AD11  -to test[1]   ; ## D12  FMC_LA05_P  
set_location_assignment Pin_AD12  -to test[2]   ; ## D12  FMC_LA05_P  
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to test[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to test[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to test[2]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to clk_in
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ready_in
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to data_in[0] 
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to data_in[1] 
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to data_in[2] 
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to data_in[3] 
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to data_in[4] 
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to data_in[5] 
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to data_in[6] 
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to data_in[7] 
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to spi_csn
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to spi_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to spi_mosi
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to spi_miso
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0_mode_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1_mode_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_2_mode_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_3_mode_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_4_filter
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to reset_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to start_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sync_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sync_in_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to mclk

set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to spi_csn
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to spi_clk
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to spi_mosi
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to spi_miso

# ad40xx i2c interface

#set_location_assignment PIN_N12  -to fmc_scl			; ## C30  FMC_HPC_SCL
#set_location_assignment PIN_C23  -to fmc_sda			; ## C31  FMC_HPC_SDA

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to fmc_scl
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to fmc_sda

execute_flow -compile
       


