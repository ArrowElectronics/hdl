
source ../../scripts/adi_env.tcl
source ../../scripts/adi_project_intel.tcl

adi_project adrv9001_tei0022

source $ad_hdl_dir/projects/common/tei0022/tei0022_system_assign.tcl

# adrv9001 fmc interface

set_location_assignment PIN_K14  -to dev_clk_in          ; ## FMCA_HPC_CLK0_M2C_P
set_location_assignment PIN_B8   -to dev_mcs_fpga_out_n  ; ## FMCA_HPC_LA14_N
set_location_assignment PIN_C8   -to dev_mcs_fpga_out_p  ; ## FMCA_HPC_LA14_P
set_location_assignment PIN_C7   -to dgpio_0             ; ## FMCA_HPC_LA16_P
set_location_assignment PIN_B7   -to dgpio_1             ; ## FMCA_HPC_LA16_N
set_location_assignment PIN_G13  -to dgpio_2             ; ## FMCA_HPC_LA15_N
set_location_assignment PIN_F8   -to dgpio_3             ; ## FMCA_HPC_LA11_N
set_location_assignment PIN_D9   -to dgpio_4             ; ## FMCA_HPC_LA09_N
set_location_assignment PIN_D7   -to dgpio_5             ; ## FMCA_HPC_LA10_N
set_location_assignment PIN_G10  -to dgpio_6             ; ## FMCA_HPC_LA27_P
set_location_assignment PIN_A4   -to dgpio_7             ; ## FMCA_HPC_LA26_P
set_location_assignment PIN_B2   -to dgpio_8             ; ## FMCA_HPC_LA28_P
set_location_assignment PIN_B1   -to dgpio_9             ; ## FMCA_HPC_LA28_N
set_location_assignment PIN_F9   -to dgpio_10            ; ## FMCA_HPC_LA11_P
set_location_assignment PIN_F10  -to dgpio_11            ; ## FMCA_HPC_LA27_N
set_location_assignment PIN_D1   -to fpga_mcs_in_n       ; ## FMCA_HPC_LA32_N
set_location_assignment PIN_E1   -to fpga_mcs_in_p       ; ## FMCA_HPC_LA32_P
set_location_assignment PIN_G15  -to fpga_ref_clk_n      ; ## FMCA_HPC_CLK1_M2C_N
set_location_assignment PIN_H15  -to fpga_ref_clk_p      ; ## FMCA_HPC_CLK1_M2C_P
set_location_assignment PIN_D2   -to gp_int              ; ## FMCA_HPC_LA30_P
set_location_assignment PIN_B6   -to mode                ; ## FMCA_HPC_LA13_P
set_location_assignment PIN_B5   -to reset_trx           ; ## FMCA_HPC_LA13_N
set_location_assignment PIN_E8   -to rx1_enable          ; ## FMCA_HPC_LA10_P
set_location_assignment PIN_A3   -to rx2_enable          ; ## FMCA_HPC_LA26_N
set_location_assignment PIN_J14  -to sm_fan_tach         ; ## FMCA_HPC_CLK0_M2C_N
set_location_assignment PIN_A9   -to spi_clk             ; ## FMCA_HPC_LA12_P
set_location_assignment PIN_H7   -to spi_miso            ; ## FMCA_HPC_LA29_N
set_location_assignment PIN_A8   -to spi_mosi            ; ## FMCA_HPC_LA12_N
set_location_assignment PIN_H14  -to spi_csn             ; ## FMCA_HPC_LA15_P
set_location_assignment PIN_E9   -to tx1_enable          ; ## FMCA_HPC_LA09_P
set_location_assignment PIN_J7   -to tx2_enable          ; ## FMCA_HPC_LA29_P
set_location_assignment PIN_J10  -to vadj_err            ; ## FMCA_HPC_LA31_P
set_location_assignment PIN_J9   -to platform_status     ; ## FMCA_HPC_LA31_N
set_location_assignment PIN_B12  -to rx1_dclk_in_n       ; ## FMCA_HPC_LA00_CC_N
set_location_assignment PIN_C13  -to rx1_dclk_in_p       ; ## FMCA_HPC_LA00_CC_P
set_location_assignment PIN_J12  -to rx1_idata_in_n      ; ## FMCA_HPC_LA03_N
set_location_assignment PIN_K12  -to rx1_idata_in_p      ; ## FMCA_HPC_LA03_P
set_location_assignment PIN_A13  -to rx1_qdata_in_n      ; ## FMCA_HPC_LA04_N
set_location_assignment PIN_B13  -to rx1_qdata_in_p      ; ## FMCA_HPC_LA04_P
set_location_assignment PIN_A10  -to rx1_strobe_in_n     ; ## FMCA_HPC_LA02_N
set_location_assignment PIN_A11  -to rx1_strobe_in_p     ; ## FMCA_HPC_LA02_P
set_location_assignment PIN_E13  -to rx2_dclk_in_n       ; ## FMCA_HPC_LA17_CC_N
set_location_assignment PIN_F13  -to rx2_dclk_in_p       ; ## FMCA_HPC_LA17_CC_P
set_location_assignment PIN_A5   -to rx2_idata_in_n      ; ## FMCA_HPC_LA20_N
set_location_assignment PIN_A6   -to rx2_idata_in_p      ; ## FMCA_HPC_LA20_P
set_location_assignment PIN_D12  -to rx2_qdata_in_n      ; ## FMCA_HPC_LA19_N
set_location_assignment PIN_E12  -to rx2_qdata_in_p      ; ## FMCA_HPC_LA19_P
set_location_assignment PIN_D10  -to rx2_strobe_in_n     ; ## FMCA_HPC_LA21_N
set_location_assignment PIN_D11  -to rx2_strobe_in_p     ; ## FMCA_HPC_LA21_P
set_location_assignment PIN_E11  -to tx1_dclk_out_n      ; ## FMCA_HPC_LA07_N
set_location_assignment PIN_F11  -to tx1_dclk_out_p      ; ## FMCA_HPC_LA07_P
set_location_assignment PIN_F14  -to tx1_dclk_in_n       ; ## FMCA_HPC_LA01_CC_N
set_location_assignment PIN_F15  -to tx1_dclk_in_p       ; ## FMCA_HPC_LA01_CC_P
set_location_assignment PIN_C9   -to tx1_idata_out_n     ; ## FMCA_HPC_LA08_N
set_location_assignment PIN_C10  -to tx1_idata_out_p     ; ## FMCA_HPC_LA08_P
set_location_assignment PIN_H12  -to tx1_qdata_out_n     ; ## FMCA_HPC_LA05_N
set_location_assignment PIN_H13  -to tx1_qdata_out_p     ; ## FMCA_HPC_LA05_P
set_location_assignment PIN_B11  -to tx1_strobe_out_n    ; ## FMCA_HPC_LA06_N
set_location_assignment PIN_C12  -to tx1_strobe_out_p    ; ## FMCA_HPC_LA06_P
set_location_assignment PIN_C4   -to tx2_dclk_out_n      ; ## FMCA_HPC_LA22_N
set_location_assignment PIN_D5   -to tx2_dclk_out_p      ; ## FMCA_HPC_LA22_P
set_location_assignment PIN_C5   -to tx2_dclk_in_n       ; ## FMCA_HPC_LA18_CC_N
set_location_assignment PIN_D6   -to tx2_dclk_in_p       ; ## FMCA_HPC_LA18_CC_P
set_location_assignment PIN_G11  -to tx2_idata_out_n     ; ## FMCA_HPC_LA23_N
set_location_assignment PIN_G12  -to tx2_idata_out_p     ; ## FMCA_HPC_LA23_P
set_location_assignment PIN_G8   -to tx2_qdata_out_n     ; ## FMCA_HPC_LA25_N
set_location_assignment PIN_H8   -to tx2_qdata_out_p     ; ## FMCA_HPC_LA25_P
set_location_assignment PIN_B3   -to tx2_strobe_out_n    ; ## FMCA_HPC_LA24_N
set_location_assignment PIN_C3   -to tx2_strobe_out_p    ; ## FMCA_HPC_LA24_P

execute_flow -compile

