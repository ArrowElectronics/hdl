source ../../scripts/adi_env.tcl
source ../../scripts/adi_project_intel.tcl

set ad7606b_if 0
set fp [open "interface_selection" r]
set ad7606b_if [read $fp 1]
close $fp

adi_project ad7606b_fmc_tei0022

if {$ad7606b_if == 0} {
set_global_assignment -name VERILOG_FILE $ad_hdl_dir/projects/ad7606b_fmc/tei0022/system_top_si.v
set_global_assignment -name TOP_LEVEL_ENTITY system_top_si
} elseif {$ad7606b_if == 1} {
set_global_assignment -name VERILOG_FILE $ad_hdl_dir/projects/ad7606b_fmc/tei0022/system_top_pi.v
set_global_assignment -name TOP_LEVEL_ENTITY system_top_pi
} else {
  return -code error [format "ERROR: Invalid interface type! Define as \'serial\' or \'parallel\' ..."]
}

source $ad_hdl_dir/projects/common/tei0022/tei0022_system_assign.tcl

#assingments for ad7606b boards 
if {$ad7606b_if == 0} {
  # ad7606b serial interface
  set_location_assignment PIN_C13  -to ad7606b_sclk    ; ## G6   FMC_LPC_LA00_CC_P
  set_location_assignment PIN_K12  -to ad7606b_sd0     ; ## G9   FMC_LPC_LA03_P
  set_location_assignment PIN_B12  -to ad7606b_sdi[0]  ; ## G7   FMC_LPC_LA00_CC_N
  set_location_assignment PIN_B11  -to ad7606b_sdi[1]  ; ## C10  FMC_LPC_LA06_P
  set_location_assignment PIN_H13  -to ad7606b_sdi[2]  ; ## D11  FMC_LPC_LA05_P
  set_location_assignment PIN_E9   -to ad7606b_sdi[3]  ; ## D14  FMC_LPC_LA09_P

  # ad7606b serial interface
  set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_sdi[0]
  set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_sdi[1]
  set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_sdi[2]
  set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_sdi[3]
  set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_sd0
  set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ad7606b_sclk

  set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad7606b_sclk
  set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad7606b_sd0
  set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad7606b_sdi[0]
  set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad7606b_sdi[1]
  set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad7606b_sdi[2]
  set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad7606b_sdi[3]
  set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to ad7606b_sdi[0]

} elseif {$ad7606b_if == 1} {
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

} else {
  return -code error [format "ERROR: Invalid interface type! Define as \'serial\' or \'parallel\' ..."]
}

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

# ad7606B i2c interface

#set_location_assignment PIN_N12  -to fmc_scl	     ; ## C30  FMC_HPC_SCL
#set_location_assignment PIN_C23  -to fmc_sda	     ; ## C31  FMC_HPC_SDA

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to fmc_scl
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to fmc_sda

execute_flow -compile
 