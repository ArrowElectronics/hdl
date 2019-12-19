

source ../../scripts/adi_env.tcl
source ../../scripts/adi_project_alt.tcl

adi_project_altera daq2_iwg24d

source $ad_hdl_dir/projects/common/iwg24d/iwg24d_system_assign.tcl
source $ad_hdl_dir/projects/common/iwg24d/iwg24d_fpga_ddr4_assign.tcl

# files

set_global_assignment -name VERILOG_FILE ../common/daq2_spi.v

# lane interface

set_location_assignment PIN_AB28   -to rx_ref_clk            ; ## B20  REFCLK_GXBL1D_CHBp
set_location_assignment PIN_AB27   -to "rx_ref_clk(n)"       ; ## B21  REFCLK_GXBL1D_CHBn

set_location_assignment PIN_AF32   -to rx_serial_data[0]     ; ## A10  GXBL1C_RX_CH3P
set_location_assignment PIN_AF31   -to "rx_serial_data[0](n)"; ## A11  GXBL1C_RX_CH3N
set_location_assignment PIN_AL30   -to rx_serial_data[1]     ; ## C06  GXBL1C_RX_CH0P
set_location_assignment PIN_AL29   -to "rx_serial_data[1](n)"; ## C07  GXBL1C_RX_CH0N
set_location_assignment PIN_AG30   -to rx_serial_data[2]     ; ## A06  GXBL1C_RX_CH2P
set_location_assignment PIN_AG29   -to "rx_serial_data[2](n)"; ## A07  GXBL1C_RX_CH2N
set_location_assignment PIN_AJ30   -to rx_serial_data[3]     ; ## A02  GXBL1C_RX_CH1P
set_location_assignment PIN_AJ29   -to "rx_serial_data[3](n)"; ## A03  GXBL1C_RX_CH1N
set_location_assignment PIN_AF4    -to rx_sync               ; ## D08  FPGA_AF4_LVDS3B_15P/CLKOUT_0P
set_location_assignment PIN_AF3    -to "rx_sync(n)"          ; ## D09  FPGA_AF4_LVDS3B_15P/CLKOUT_0N
set_location_assignment PIN_AD5    -to rx_sysref             ; ## G09  FPGA_AD5_LVDS3B_8P_IO33
set_location_assignment PIN_AD6    -to "rx_sysref(n)"        ; ## G10  FPGA_AD5_LVDS3B_8N_IO34

set_location_assignment PIN_AF28   -to tx_ref_clk            ; ## D04  REFCLK_GXBL1C_CHBp
set_location_assignment PIN_AF27   -to "tx_ref_clk(n)"       ; ## D05  REFCLK_GXBL1C_CHBN

set_location_assignment PIN_AH32   -to tx_serial_data[0]     ; ## A30  GXBL1C_TX_CH3P (tx_data_p[0])
set_location_assignment PIN_AH31   -to "tx_serial_data[0](n)"; ## A31  GXBL1C_TX_CH3N (tx_data_n[0])
set_location_assignment PIN_AP32   -to tx_serial_data[1]     ; ## C02  GXBL1C_TX_CH0P (tx_data_p[3])
set_location_assignment PIN_AP31   -to "tx_serial_data[1](n)"; ## C03  GXBL1C_TX_CH0N (tx_data_n[3])
set_location_assignment PIN_AK32   -to tx_serial_data[2]     ; ## A26  GXBL1C_TX_CH2P (tx_data_p[1])
set_location_assignment PIN_AK31   -to "tx_serial_data[2](n)"; ## A27  GXBL1C_TX_CH2N (tx_data_n[1])
set_location_assignment PIN_AM32   -to tx_serial_data[3]     ; ## A22  GXBL1C_TX_CH1P (tx_data_p[2])
set_location_assignment PIN_AM31   -to "tx_serial_data[3](n)"; ## A23  GXBL1C_TX_CH1N (tx_data_n[2])
set_location_assignment PIN_AB8    -to tx_sync               ; ## H07  FPGA_AB8_LVDS3B_4P_IO41
set_location_assignment PIN_AB7    -to "tx_sync(n)"          ; ## H08  FPGA_AB8_LVDS3B_4N_IO42
set_location_assignment PIN_AG6    -to tx_sysref             ; ## H10  FPGA_AG6_LVDS3B_17P_IO15
set_location_assignment PIN_AF6    -to "tx_sysref(n)"        ; ## H11  FPGA_AG6_LVDS3B_17P_IO16

set_instance_assignment -name IO_STANDARD LVDS -to rx_ref_clk
set_instance_assignment -name IO_STANDARD LVDS -to "rx_ref_clk(n)"
set_instance_assignment -name IO_STANDARD "HIGH SPEED DIFFERENTIAL I/O" -to rx_serial_data
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to rx_serial_data
set_instance_assignment -name IO_STANDARD LVDS -to rx_sync
set_instance_assignment -name IO_STANDARD LVDS -to "rx_sync(n)"
set_instance_assignment -name IO_STANDARD LVDS -to rx_sysref
set_instance_assignment -name IO_STANDARD LVDS -to "rx_sysref(n)"
set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to rx_sysref

set_instance_assignment -name IO_STANDARD LVDS -to tx_ref_clk
set_instance_assignment -name IO_STANDARD LVDS -to "tx_ref_clk(n)"
set_instance_assignment -name IO_STANDARD "HIGH SPEED DIFFERENTIAL I/O" -to tx_serial_data
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to tx_serial_data
set_instance_assignment -name IO_STANDARD LVDS -to tx_sync
set_instance_assignment -name IO_STANDARD LVDS -to "tx_sync(n)"
set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to tx_sync
set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to "tx_sync(n)"
set_instance_assignment -name IO_STANDARD LVDS -to tx_sysref
set_instance_assignment -name IO_STANDARD LVDS -to "tx_sysref(n)"
set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to tx_sysref
set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to "tx_sysref(n)"

# Merge RX and TX into single transceiver
for {set i 0} {$i < 4} {incr i} {
  set_instance_assignment -name XCVR_RECONFIG_GROUP xcvr_${i} -to rx_serial_data[${i}]
  set_instance_assignment -name XCVR_RECONFIG_GROUP xcvr_${i} -to tx_serial_data[${i}]
}

# power-good

set_location_assignment PIN_AD17  -to pg_c2m               ; ## D01  FMCA_PG_C2M

# gpio

set_location_assignment PIN_AK4  -to trig                  ; ## H13  FPGA_AK4_LVDS3B_22P_IO5
set_location_assignment PIN_AK3  -to "trig(n)"             ; ## H14  FPGA_AK4_LVDS3B_22N_IO6
set_location_assignment PIN_AH4  -to adc_fdb               ; ## H17  FPGA_AH4_LVDS3B_21N_IO8
set_location_assignment PIN_AJ4  -to adc_fda               ; ## H16  FPGA_AJ4_LVDS3B_21P_IO7
set_location_assignment PIN_AD7  -to dac_irq               ; ## G15  FPGA_AD7_LVDS3B_7P_IO35
set_location_assignment PIN_AJ2  -to clkd_status[1]        ; ## D18  FPGA_AJ2_LVDS3B_23N_IO4
set_location_assignment PIN_AK2  -to clkd_status[0]        ; ## D17  FPGA_AK2_LVDS3B_23P_IO3
set_location_assignment PIN_AL1  -to adc_pd                ; ## C10  FPGA_AL1_LVDS3B_24P_IO1
set_location_assignment PIN_AC7  -to dac_txen              ; ## G16  FPGA_AC7_LVDS3B_7N_IO36
set_location_assignment PIN_AH2  -to dac_reset             ; ## C15  FPGA_AH2_LVDS3B_20N_IO10
set_location_assignment PIN_AC9  -to clkd_sync             ; ## G12  FPGA_AC9_LVDS3B_9P_IO31

set_instance_assignment -name IO_STANDARD LVDS -to trig
set_instance_assignment -name IO_STANDARD LVDS -to "trig(n)"
set_instance_assignment -name IO_STANDARD "1.8 V" -to adc_fdb
set_instance_assignment -name IO_STANDARD "1.8 V" -to adc_fda
set_instance_assignment -name IO_STANDARD "1.8 V" -to dac_irq
set_instance_assignment -name IO_STANDARD "1.8 V" -to clkd_status[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to clkd_status[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to adc_pd
set_instance_assignment -name IO_STANDARD "1.8 V" -to dac_txen
set_instance_assignment -name IO_STANDARD "1.8 V" -to dac_reset
set_instance_assignment -name IO_STANDARD "1.8 V" -to clkd_sync

# spi

set_location_assignment PIN_AE6  -to spi_csn_clk           ; ## D11  FPGA_AE6_LVDS3B_11P_IO27
set_location_assignment PIN_AJ1  -to spi_csn_dac           ; ## C14  FPGA_AJ1_LVDS3B_20P_IO9
set_location_assignment PIN_AF5  -to spi_csn_adc           ; ## D15  FPGA_AF5_LVDS3B_14N_IO22
set_location_assignment PIN_AE7  -to spi_clk               ; ## D12  FPGA_AE7_LVDS3B_11N_IO28
set_location_assignment PIN_AG5  -to spi_sdio              ; ## D14  FPGA_AG5_LVDS3B_14P_IO21
set_location_assignment PIN_AC10 -to spi_dir               ; ## G13  FPGA_AC10_LVDS3B_9N_IO32

set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_csn_clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_csn_dac
set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_csn_adc
set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_sdio
set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_dir

# set optimization to get a better timing closure
set_global_assignment -name OPTIMIZATION_MODE "HIGH PERFORMANCE EFFORT"

execute_flow -compile
