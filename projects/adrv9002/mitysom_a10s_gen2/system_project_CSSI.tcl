# adrv9001 fmc interface

#set_location_assignment PIN_AF13  -to dev_clk_in          ; ## FMCA_HPC_CLK0_M2C_P
set_location_assignment PIN_AE14   -to dev_mcs_fpga_out_n  ; ## FMCA_HPC_LA14_N
set_location_assignment PIN_AE15   -to dev_mcs_fpga_out_p  ; ## FMCA_HPC_LA14_P
set_location_assignment PIN_AG18   -to dgpio_0             ; ## FMCA_HPC_LA16_P
set_location_assignment PIN_AF19  -to dgpio_1             ; ## FMCA_HPC_LA16_N
set_location_assignment PIN_AF16  -to dgpio_2             ; ## FMCA_HPC_LA15_N
set_location_assignment PIN_AF18   -to dgpio_3             ; ## FMCA_HPC_LA11_N
set_location_assignment PIN_AD14   -to dgpio_4             ; ## FMCA_HPC_LA09_N
set_location_assignment PIN_AB13   -to dgpio_5             ; ## FMCA_HPC_LA10_N
set_location_assignment PIN_U3  -to dgpio_6             ; ## FMCA_HPC_LA27_P
set_location_assignment PIN_V1   -to dgpio_7             ; ## FMCA_HPC_LA26_P
set_location_assignment PIN_R4   -to dgpio_8             ; ## FMCA_HPC_LA28_P
set_location_assignment PIN_R5   -to dgpio_9             ; ## FMCA_HPC_LA28_N
set_location_assignment PIN_AF17   -to dgpio_10            ; ## FMCA_HPC_LA11_P
set_location_assignment PIN_U4  -to dgpio_11            ; ## FMCA_HPC_LA27_N
set_location_assignment PIN_T7   -to fpga_mcs_in_n       ; ## FMCA_HPC_LA32_N
set_location_assignment PIN_T6   -to fpga_mcs_in_p       ; ## FMCA_HPC_LA32_P
#set_location_assignment PIN_AG15  -to fpga_ref_clk_n      ; ## FMCA_HPC_CLK1_M2C_N
#set_location_assignment PIN_AG14  -to fpga_ref_clk_p      ; ## FMCA_HPC_CLK1_M2C_P
set_location_assignment PIN_L1   -to gp_int              ; ## FMCA_HPC_LA30_P
set_location_assignment PIN_AE17   -to mode                ; ## FMCA_HPC_LA13_P
set_location_assignment PIN_AD17   -to reset_trx           ; ## FMCA_HPC_LA13_N
set_location_assignment PIN_AC13   -to rx1_enable          ; ## FMCA_HPC_LA10_P
set_location_assignment PIN_U1   -to rx2_enable          ; ## FMCA_HPC_LA26_N
#set_location_assignment PIN_AF14  -to sm_fan_tach         ; ## FMCA_HPC_CLK0_M2C_N
set_location_assignment PIN_AC16   -to spi_clk             ; ## FMCA_HPC_LA12_P
set_location_assignment PIN_AC17   -to spi_miso            ; ## FMCA_HPC_LA12_N
set_location_assignment PIN_N3   -to spi_mosi            ; ## FMCA_HPC_LA29_N
set_location_assignment PIN_AG16  -to spi_csn             ; ## FMCA_HPC_LA15_P
set_location_assignment PIN_AD13   -to tx1_enable          ; ## FMCA_HPC_LA09_P
set_location_assignment PIN_N2   -to tx2_enable          ; ## FMCA_HPC_LA29_P
set_location_assignment PIN_W3  -to vadj_err            ; ## FMCA_HPC_LA31_P
set_location_assignment PIN_V3   -to platform_status     ; ## FMCA_HPC_LA31_N


set_location_assignment PIN_AE10  -to rx1_idata_in_n      ; ## FMCA_HPC_LA03_N
set_location_assignment PIN_AE11  -to rx1_idata_in_p      ; ## FMCA_HPC_LA03_P    ; #
set_location_assignment PIN_AF14  -to rx1_qdata_in_n      ; ## FMCA_HPC_LA04_N
set_location_assignment PIN_AF13  -to rx1_qdata_in_p      ; ## FMCA_HPC_LA04_P
set_location_assignment PIN_AA14 -to rx1_strobe_in_n     ; ## FMCA_HPC_LA02_N
set_location_assignment PIN_AB14  -to rx1_strobe_in_p     ; ## FMCA_HPC_LA02_P
set_location_assignment PIN_AG15  -to rx1_dclk_in_n       ; ## FMCA_HPC_LA00_CC_N
set_location_assignment PIN_AG14  -to rx1_dclk_in_p       ; ## FMCA_HPC_LA00_CC_P

set_location_assignment PIN_AD15  -to rx2_dclk_in_n       ; ## FMCA_HPC_LA17_CC_N
set_location_assignment PIN_AE16  -to rx2_dclk_in_p       ; ## FMCA_HPC_LA17_CC_P
set_location_assignment PIN_AC18   -to rx2_idata_in_n      ; ## FMCA_HPC_LA20_N
set_location_assignment PIN_AD18  -to rx2_idata_in_p      ; ## FMCA_HPC_LA20_P
set_location_assignment PIN_AE20  -to rx2_qdata_in_n      ; ## FMCA_HPC_LA19_N
set_location_assignment PIN_AE19  -to rx2_qdata_in_p      ; ## FMCA_HPC_LA19_P
set_location_assignment PIN_P4  -to rx2_strobe_in_n     ; ## FMCA_HPC_LA21_N
set_location_assignment PIN_P3  -to rx2_strobe_in_p     ; ## FMCA_HPC_LA21_P

set_location_assignment PIN_AD12  -to tx1_dclk_out_n      ; ## FMCA_HPC_LA07_N
set_location_assignment PIN_AE12  -to tx1_dclk_out_p      ; ## FMCA_HPC_LA07_P
set_location_assignment PIN_AC11   -to tx1_idata_out_n     ; ## FMCA_HPC_LA08_N
set_location_assignment PIN_AC12  -to tx1_idata_out_p     ; ## FMCA_HPC_LA08_P
set_location_assignment PIN_AA13  -to tx1_qdata_out_n     ; ## FMCA_HPC_LA05_N
set_location_assignment PIN_AA12  -to tx1_qdata_out_p     ; ## FMCA_HPC_LA05_P
set_location_assignment PIN_AF11  -to tx1_strobe_out_n    ; ## FMCA_HPC_LA06_N
set_location_assignment PIN_AF12 -to tx1_strobe_out_p    ; ## FMCA_HPC_LA06_P


set_location_assignment PIN_L3  -to tx1_dclk_in_n       ; ## FMCA_HPC_LA01_CC_N
set_location_assignment PIN_L2  -to tx1_dclk_in_p       ; ## FMCA_HPC_LA01_CC_P
set_location_assignment PIN_AB15   -to tx2_dclk_in_n     ; ## FMCA_HPC_LA22_N
set_location_assignment PIN_AC15   -to tx2_dclk_in_p      ; ## FMCA_HPC_LA22_P


set_location_assignment PIN_V8   -to tx2_dclk_out_n       ; ## FMCA_HPC_LA18_CC_N
set_location_assignment PIN_U8   -to tx2_dclk_out_p       ; ## FMCA_HPC_LA18_CC_P
set_location_assignment PIN_V7  -to tx2_idata_out_n     ; ## FMCA_HPC_LA23_N
set_location_assignment PIN_U6  -to tx2_idata_out_p     ; ## FMCA_HPC_LA23_P
set_location_assignment PIN_G1   -to tx2_qdata_out_n     ; ## FMCA_HPC_LA25_N
set_location_assignment PIN_H1   -to tx2_qdata_out_p     ; ## FMCA_HPC_LA25_P
set_location_assignment PIN_M4   -to tx2_strobe_out_n    ; ## FMCA_HPC_LA24_N
set_location_assignment PIN_M3   -to tx2_strobe_out_p    ; ## FMCA_HPC_LA24_P

set_location_assignment PIN_W25  -to fmc_pg_c2m_fpga     ; ## FMCA_PG_C2M

set_instance_assignment -name IO_STANDARD "1.8V" -to dev_clk_in
set_instance_assignment -name IO_STANDARD "1.8V" -to dev_mcs_fpga_out_n
set_instance_assignment -name IO_STANDARD "1.8V" -to dev_mcs_fpga_out_p 
set_instance_assignment -name IO_STANDARD "1.8V" -to dgpio_0 
set_instance_assignment -name IO_STANDARD "1.8V" -to dgpio_1 
set_instance_assignment -name IO_STANDARD "1.8V" -to dgpio_2 
set_instance_assignment -name IO_STANDARD "1.8V" -to dgpio_3 
set_instance_assignment -name IO_STANDARD "1.8V" -to dgpio_4 
set_instance_assignment -name IO_STANDARD "1.8V" -to dgpio_5 
set_instance_assignment -name IO_STANDARD "1.8V" -to dgpio_6 
set_instance_assignment -name IO_STANDARD "1.8V" -to dgpio_7
set_instance_assignment -name IO_STANDARD "1.8V" -to dgpio_8
set_instance_assignment -name IO_STANDARD "1.8V" -to dgpio_9
set_instance_assignment -name IO_STANDARD "1.8V" -to dgpio_10
set_instance_assignment -name IO_STANDARD "1.8V" -to dgpio_11
set_instance_assignment -name IO_STANDARD "1.8V" -to fpga_mcs_in_n
set_instance_assignment -name IO_STANDARD "1.8V" -to fpga_mcs_in_p
set_instance_assignment -name IO_STANDARD "1.8V" -to fpga_ref_clk_n
set_instance_assignment -name IO_STANDARD "1.8V" -to fpga_ref_clk_p
set_instance_assignment -name IO_STANDARD "1.8V" -to gp_int
set_instance_assignment -name IO_STANDARD "1.8V" -to mode
set_instance_assignment -name IO_STANDARD "1.8V" -to reset_trx
set_instance_assignment -name IO_STANDARD "1.8V" -to rx1_enable
set_instance_assignment -name IO_STANDARD "1.8V" -to rx2_enable

set_instance_assignment -name IO_STANDARD "1.8V" -to sm_fan_tach
set_instance_assignment -name IO_STANDARD "1.8V" -to spi_clk
set_instance_assignment -name IO_STANDARD "1.8V" -to spi_miso 
set_instance_assignment -name IO_STANDARD "1.8V" -to spi_mosi 
set_instance_assignment -name IO_STANDARD "1.8V" -to spi_csn 
set_instance_assignment -name IO_STANDARD "1.8V" -to tx1_enable 
set_instance_assignment -name IO_STANDARD "1.8V" -to tx2_enable 
set_instance_assignment -name IO_STANDARD "1.8V" -to vadj_err 
set_instance_assignment -name IO_STANDARD "1.8V" -to platform_status
 
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx1_dclk_in_n 
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx1_dclk_in_p
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx1_idata_in_n
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx1_idata_in_p
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx1_qdata_in_n
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx1_qdata_in_p

set_instance_assignment -name IO_STANDARD "1.8V"  -to rx1_strobe_in_n
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx1_strobe_in_p
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx2_dclk_in_n
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx2_dclk_in_p
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx2_idata_in_n
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx2_idata_in_p
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx2_qdata_in_n
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx2_qdata_in_p
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx2_strobe_in_n
set_instance_assignment -name IO_STANDARD "1.8V"  -to rx2_strobe_in_p

set_instance_assignment -name IO_STANDARD "1.8V" -to tx1_dclk_in_n
set_instance_assignment -name IO_STANDARD "1.8V"  -to tx1_dclk_in_p
set_instance_assignment -name IO_STANDARD "1.8V"  -to tx2_dclk_in_n 
set_instance_assignment -name IO_STANDARD "1.8V"  -to tx2_dclk_in_p 

set_instance_assignment -name IO_STANDARD "1.8V"  -to tx1_dclk_out_n
set_instance_assignment -name IO_STANDARD "1.8V"  -to tx1_dclk_out_p
set_instance_assignment -name IO_STANDARD "1.8V" -to tx1_idata_out_n
set_instance_assignment -name IO_STANDARD "1.8V" -to tx1_idata_out_p
set_instance_assignment -name IO_STANDARD "1.8V" -to tx1_qdata_out_n
set_instance_assignment -name IO_STANDARD "1.8V" -to tx1_qdata_out_p
set_instance_assignment -name IO_STANDARD "1.8V" -to tx1_strobe_out_n
set_instance_assignment -name IO_STANDARD "1.8V" -to tx1_strobe_out_p

set_instance_assignment -name IO_STANDARD "1.8V" -to tx2_dclk_out_n 
set_instance_assignment -name IO_STANDARD "1.8V" -to tx2_dclk_out_p 
set_instance_assignment -name IO_STANDARD "1.8V" -to tx2_idata_out_n 
set_instance_assignment -name IO_STANDARD "1.8V" -to tx2_idata_out_p 
set_instance_assignment -name IO_STANDARD "1.8V" -to tx2_qdata_out_n
set_instance_assignment -name IO_STANDARD "1.8V" -to tx2_qdata_out_p
set_instance_assignment -name IO_STANDARD "1.8V" -to tx2_strobe_out_n 
set_instance_assignment -name IO_STANDARD "1.8V" -to tx2_strobe_out_p 

set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to spi_csn
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to spi_clk
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to spi_mosi
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to spi_miso


