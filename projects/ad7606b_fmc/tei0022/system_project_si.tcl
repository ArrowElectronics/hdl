#assingments for ad7606b boards 
# ad7606b serial interface
set_location_assignment PIN_C13  -to ad7606b_sclk    ; ## G6   FMC_LPC_LA00_CC_P
set_location_assignment PIN_K12  -to ad7606b_sdo     ; ## G9   FMC_LPC_LA03_P
set_location_assignment PIN_B12  -to ad7606b_sdi[0]  ; ## G7   FMC_LPC_LA00_CC_N
set_location_assignment PIN_B11  -to ad7606b_sdi[1]  ; ## C11  FMC_LPC_LA06_P   
set_location_assignment PIN_H13  -to ad7606b_sdi[2]  ; ## D11  FMC_LPC_LA05_P
set_location_assignment PIN_E9   -to ad7606b_sdi[3]  ; ## D14  FMC_LPC_LA09_P

# ad7606b control interface
set_location_assignment PIN_B13  -to ad7606b_csn     ; ## H10  FMC_LPC_LA04_P
set_location_assignment PIN_F11  -to ad7606b_busy    ; ## H13  FMC_LPC_LA07_P  
set_location_assignment PIN_H12  -to ad7606b_cnvst   ; ## D12  FMC_LA05_P  

# ad7606b serial interface
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_sdi[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_sdi[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_sdi[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_sdi[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_sdo
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_sclk

set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "80 MHz" -to ad7606b_sclk
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "80 MHz" -to ad7606b_sdo
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "80 MHz" -to ad7606b_sdi[0]
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "80 MHz" -to ad7606b_sdi[1]
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "80 MHz" -to ad7606b_sdi[2]
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "80 MHz" -to ad7606b_sdi[3]
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "80 MHz" -to ad7606b_sdi[0]

# ad7606b gpio interface
set_location_assignment PIN_D7   -to ad7606b_stby    ; ## C15  FMC_LPC_LA10_N
set_location_assignment PIN_C12  -to ad7606b_reset   ; ## C10  FMC_LPC_LA06_P
set_location_assignment PIN_C8   -to ad7606b_serpar  ; ## C18  FMC_LPC_LA14_P
set_location_assignment PIN_B8   -to ad7606b_refsel  ; ## C19  FMC_LPC_LA14_N
set_location_assignment PIN_D9   -to ad7606b_range   ; ## D15  FMC_LPC_LA09_P
set_location_assignment PIN_C10  -to ad7606b_frstdata; ## G12  FMC_LPC_LA08_P
set_location_assignment PIN_A9   -to ad7606b_os0     ; ## G15  FMC_LPC_LA12_P
set_location_assignment PIN_A11  -to ad7606b_os1     ; ## H7   FMC_LPC_LA02_P
set_location_assignment PIN_F9   -to ad7606b_os2     ; ## H16  FMC_LPC_LA11_P

# ad7606b gpio interface
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_stby
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_reset
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_serpar
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_refsel
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_range 
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_frstdata
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_os0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_os1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_os2

# ad7606b control interface
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_csn
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_busy
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_cnvst      

set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "80 MHz" -to ad7606b_csn

# ad7606B i2c interface

#set_location_assignment PIN_N12  -to fmc_scl	     ; ## C30  FMC_HPC_SCL
#set_location_assignment PIN_C23  -to fmc_sda	     ; ## C31  FMC_HPC_SDA

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to fmc_scl
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to fmc_sda


 