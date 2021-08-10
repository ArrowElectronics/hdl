# ad7606b parallel interface
set_location_assignment PIN_E8   -to ad7606b_wrn     ; ## C14  FMC_LPC_LA10_P
set_location_assignment PIN_C13  -to ad7606b_rdn     ; ## G6   FMC_LPC_LA00_CC_P
set_location_assignment PIN_F15  -to ad7606b_db[0]   ; ## D8   FMC_LPC_LA01_CC_P
set_location_assignment PIN_F14  -to ad7606b_db[1]   ; ## D9   FMC_LPC_LA01_CC_N
set_location_assignment PIN_A10  -to ad7606b_db[2]   ; ## H8   FMC_LPC_LA02_N
set_location_assignment PIN_J12  -to ad7606b_db[3]   ; ## G10  FMC_LPC_LA03_N
set_location_assignment PIN_A13  -to ad7606b_db[4]   ; ## H11  FMC_LPC_LA04_N
set_location_assignment PIN_e11  -to ad7606b_db[5]   ; ## H14  FMC_LPC_LA07_N
set_location_assignment PIN_C9   -to ad7606b_db[6]   ; ## G13  FMC_LPC_LA08_N
set_location_assignment PIN_B12  -to ad7606b_db[7]   ; ## G7   FMC_LPC_LA00_CC_N
set_location_assignment PIN_B11  -to ad7606b_db[8]   ; ## C11  FMC_LPC_LA06_N
set_location_assignment PIN_H13  -to ad7606b_db[9]   ; ## D12  FMC_LPC_LA05_P
set_location_assignment PIN_E9   -to ad7606b_db[10]  ; ## D14  FMC_LPC_LA09_P
set_location_assignment PIN_K12  -to ad7606b_db[11]  ; ## G9   FMC_LPC_LA03_P
set_location_assignment PIN_F8   -to ad7606b_db[12]  ; ## H17  FMC_LPC_LA11_N
set_location_assignment PIN_A8   -to ad7606b_db[13]  ; ## G16  FMC_LPC_LA12_N
set_location_assignment PIN_B6   -to ad7606b_db[14]  ; ## D17  FMC_LPC_LA13_P
set_location_assignment PIN_B5   -to ad7606b_db[15]  ; ## D18  FMC_LPC_LA13_N

# ad7606b control interface
set_location_assignment PIN_B13  -to ad7606b_csn     ; ## H10  FMC_LPC_LA04_P
set_location_assignment PIN_F11  -to ad7606b_busy    ; ## H13  FMC_LPC_LA07_P  
set_location_assignment PIN_H12  -to ad7606b_cnvst   ; ## D12  FMC_LA05_P  

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

#debug pins
set_location_assignment Pin_AD9  -to test[0]   ; ## D12  FMC_LA05_P 
set_location_assignment Pin_AD11  -to test[1]   ; ## D12  FMC_LA05_P  
set_location_assignment Pin_AD12  -to test[2]   ; ## D12  FMC_LA05_P  
set_location_assignment Pin_AC12  -to test[3]   ; ## D12  FMC_LA05_P 
 
set_location_assignment Pin_AC9  -to test1[0]   ; ## D12  FMC_LA05_P  
set_location_assignment Pin_AD10 -to test1[1]   ; ## D12  FMC_LA05_P  
set_location_assignment Pin_AA12 -to test1[2]   ; ## D12  FMC_LA05_P  
set_location_assignment Pin_AB12 -to test1[3]   ; ## D12  FMC_LA05_P  

set_location_assignment Pin_AG2 -to test2[0]   ; ## D12  FMC_LA05_P  
set_location_assignment Pin_AF4 -to test2[1]   ; ## D12  FMC_LA05_P  

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to test[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to test[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to test[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to test[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to test1[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to test1[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to test1[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to test1[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to test2[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to test2[1]

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

set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad7606b_csn

# ad7606b parallel interface
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_wrn
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_rdn
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_db[15]

# ad7606B i2c interface

#set_location_assignment PIN_N12  -to fmc_scl	     ; ## C30  FMC_HPC_SCL
#set_location_assignment PIN_C23  -to fmc_sda	     ; ## C31  FMC_HPC_SDA

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to fmc_scl
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to fmc_sda


 