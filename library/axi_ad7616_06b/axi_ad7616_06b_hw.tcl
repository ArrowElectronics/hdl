# TCL File Generated by Component Editor 18.1
# Wed Apr 21 12:33:39 IST 2021
# DO NOT MODIFY


# 
# axi_ad7616_06b "axi_ad7616_06b" v2.0
#  2021.04.21.12:33:39
# AXI AD7616_06b Interface
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1
source ../scripts/adi_env.tcl
source ../scripts/adi_ip_intel.tcl

# 
# module axi_ad7616_06b
# 
set_module_property DESCRIPTION "AXI AD7616_06b Interface"
set_module_property NAME axi_ad7616_06b
set_module_property VERSION 1.1
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "Analog Devices"
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME axi_ad7616_06b
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property QUARTUS_SYNTH TOP_LEVEL axi_ad7616_06b
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file axi_ad7616_06b.v 		VERILOG PATH axi_ad7616_06b.v TOP_LEVEL_FILE
add_fileset_file axi_ad7616_control.v 		VERILOG PATH axi_ad7616_control.v
add_fileset_file axi_ad7616_maxis2wrfifo.v 	VERILOG PATH axi_ad7616_maxis2wrfifo.v
add_fileset_file axi_ad7616_pif.v 		VERILOG PATH axi_ad7616_pif.v

add_fileset_file axi_spi_engine.v 		VERILOG PATH $ad_hdl_dir/library/spi_engine/axi_spi_engine/axi_spi_engine.v
add_fileset_file axi_spi_engine_constr.sdc 	SDC PATH $ad_hdl_dir/library/spi_engine/axi_spi_engine/axi_spi_engine_constr.sdc
add_fileset_file spi_engine_execution.v 	VERILOG PATH $ad_hdl_dir/library/spi_engine/spi_engine_execution/spi_engine_execution.v
add_fileset_file spi_engine_interconnect.v 	VERILOG PATH $ad_hdl_dir/library/spi_engine/spi_engine_interconnect/spi_engine_interconnect.v
add_fileset_file spi_engine_offload.v 		VERILOG PATH $ad_hdl_dir/library/spi_engine/spi_engine_offload/spi_engine_offload.v

add_fileset_file ad_edge_detect.v 		VERILOG PATH $ad_hdl_dir/library/common/ad_edge_detect.v
add_fileset_file up_axi.v 			VERILOG PATH $ad_hdl_dir/library/common/up_axi.v
add_fileset_file ad_rst.v 			VERILOG PATH $ad_hdl_dir/library/common/ad_rst.v
add_fileset_file address_gray_pipelined.v 	VERILOG PATH $ad_hdl_dir/library/util_axis_fifo/address_gray_pipelined.v
add_fileset_file address_sync.v 		VERILOG PATH $ad_hdl_dir/library/util_axis_fifo/address_sync.v
add_fileset_file util_axis_fifo.v 		VERILOG PATH $ad_hdl_dir/library/util_axis_fifo/util_axis_fifo.v
add_fileset_file sync_bits.v 			VERILOG PATH $ad_hdl_dir/library/util_cdc/sync_bits.v
add_fileset_file sync_gray.v 			VERILOG PATH $ad_hdl_dir/library/util_cdc/sync_gray.v
add_fileset_file util_cdc_constr.tcl 		OTHER PATH $ad_hdl_dir/library/util_cdc/util_cdc_constr.tcl
add_fileset_file ad_mem.v 			VERILOG PATH $ad_hdl_dir/library/common/ad_mem.v


# 
# parameters
# 
add_parameter ID INTEGER 0
set_parameter_property ID DEFAULT_VALUE 0
set_parameter_property ID DISPLAY_NAME ID
set_parameter_property ID TYPE INTEGER
set_parameter_property ID UNITS None
set_parameter_property ID ALLOWED_RANGES -2147483648:2147483647
set_parameter_property ID HDL_PARAMETER true

add_parameter IF_TYPE INTEGER 1
set_parameter_property IF_TYPE DEFAULT_VALUE 1
set_parameter_property IF_TYPE DISPLAY_NAME IF_TYPE
set_parameter_property IF_TYPE TYPE INTEGER
set_parameter_property IF_TYPE UNITS None
set_parameter_property IF_TYPE ALLOWED_RANGES -2147483648:2147483647
set_parameter_property IF_TYPE HDL_PARAMETER true

add_parameter NUM_OF_SDI INTEGER 2 
set_parameter_property NUM_OF_SDI DEFAULT_VALUE 2
set_parameter_property NUM_OF_SDI DISPLAY_NAME NUM_OF_SDI
set_parameter_property NUM_OF_SDI TYPE INTEGER
set_parameter_property NUM_OF_SDI UNITS None
set_parameter_property NUM_OF_SDI ALLOWED_RANGES -2147483648:2147483647
set_parameter_property NUM_OF_SDI HDL_PARAMETER true

add_parameter DATA_WIDTH INTEGER 8
set_parameter_property DATA_WIDTH DEFAULT_VALUE 8
set_parameter_property DATA_WIDTH DISPLAY_NAME DATA_WIDTH
set_parameter_property DATA_WIDTH TYPE INTEGER
set_parameter_property DATA_WIDTH UNITS None
set_parameter_property DATA_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property DATA_WIDTH HDL_PARAMETER true

# 
# display items
# 


# 
# connection point s_axi
# 
add_interface s_axi axi4lite end
set_interface_property s_axi associatedClock s_axi_aclk
set_interface_property s_axi associatedReset s_axi_aresetn
set_interface_property s_axi readAcceptanceCapability 1
set_interface_property s_axi writeAcceptanceCapability 1
set_interface_property s_axi combinedAcceptanceCapability 1
set_interface_property s_axi readDataReorderingDepth 1
set_interface_property s_axi bridgesToMaster ""
set_interface_property s_axi ENABLED true
set_interface_property s_axi EXPORT_OF ""
set_interface_property s_axi PORT_NAME_MAP ""
set_interface_property s_axi CMSIS_SVD_VARIABLES ""
set_interface_property s_axi SVD_ADDRESS_GROUP ""

add_interface_port s_axi s_axi_awvalid awvalid Input 1
add_interface_port s_axi s_axi_awaddr awaddr Input 16
add_interface_port s_axi s_axi_awprot awprot Input 3
add_interface_port s_axi s_axi_awready awready Output 1
add_interface_port s_axi s_axi_wvalid wvalid Input 1
add_interface_port s_axi s_axi_wdata wdata Input 32
add_interface_port s_axi s_axi_wstrb wstrb Input 4
add_interface_port s_axi s_axi_wready wready Output 1
add_interface_port s_axi s_axi_bvalid bvalid Output 1
add_interface_port s_axi s_axi_bresp bresp Output 2
add_interface_port s_axi s_axi_bready bready Input 1
add_interface_port s_axi s_axi_arvalid arvalid Input 1
add_interface_port s_axi s_axi_araddr araddr Input 16
add_interface_port s_axi s_axi_arprot arprot Input 3
add_interface_port s_axi s_axi_arready arready Output 1
add_interface_port s_axi s_axi_rvalid rvalid Output 1
add_interface_port s_axi s_axi_rresp rresp Output 2
add_interface_port s_axi s_axi_rdata rdata Output 32
add_interface_port s_axi s_axi_rready rready Input 1


# 
# connection point s_axi_aresetn
# 
add_interface s_axi_aresetn reset end
set_interface_property s_axi_aresetn associatedClock s_axi_aclk
set_interface_property s_axi_aresetn synchronousEdges DEASSERT
set_interface_property s_axi_aresetn ENABLED true
set_interface_property s_axi_aresetn EXPORT_OF ""
set_interface_property s_axi_aresetn PORT_NAME_MAP ""
set_interface_property s_axi_aresetn CMSIS_SVD_VARIABLES ""
set_interface_property s_axi_aresetn SVD_ADDRESS_GROUP ""

add_interface_port s_axi_aresetn s_axi_aresetn reset_n Input 1


# 
# connection point irq
# 
add_interface irq interrupt end
set_interface_property irq associatedAddressablePoint ""
set_interface_property irq associatedClock s_axi_aclk
set_interface_property irq associatedReset s_axi_aresetn
set_interface_property irq bridgedReceiverOffset ""
set_interface_property irq bridgesToReceiver ""
set_interface_property irq ENABLED true
set_interface_property irq EXPORT_OF ""
set_interface_property irq PORT_NAME_MAP ""
set_interface_property irq CMSIS_SVD_VARIABLES ""
set_interface_property irq SVD_ADDRESS_GROUP ""

add_interface_port irq irq irq Output 1


# 
# connection point Serial_interface
# 
add_interface Serial_interface conduit end
set_interface_property Serial_interface associatedClock s_axi_aclk
set_interface_property Serial_interface associatedReset s_axi_aresetn
set_interface_property Serial_interface ENABLED true
set_interface_property Serial_interface EXPORT_OF ""
set_interface_property Serial_interface PORT_NAME_MAP ""
set_interface_property Serial_interface CMSIS_SVD_VARIABLES ""
set_interface_property Serial_interface SVD_ADDRESS_GROUP ""

add_interface_port Serial_interface rx_sclk sclk Output 1
add_interface_port Serial_interface rx_sdi sdi Input "(NUM_OF_SDI-1) - (0) + 1"
add_interface_port Serial_interface rx_sdo sdo Output 1


# 
# connection point parallel_interface
# 
add_interface parallel_interface conduit end
set_interface_property parallel_interface associatedClock s_axi_aclk
set_interface_property parallel_interface associatedReset ""
set_interface_property parallel_interface ENABLED true
set_interface_property parallel_interface EXPORT_OF ""
set_interface_property parallel_interface PORT_NAME_MAP ""
set_interface_property parallel_interface CMSIS_SVD_VARIABLES ""
set_interface_property parallel_interface SVD_ADDRESS_GROUP ""

add_interface_port parallel_interface rx_db_i data_din Input 16
add_interface_port parallel_interface rx_db_o data_dout Output 16
add_interface_port parallel_interface rx_db_t data_dir Output 1
add_interface_port parallel_interface rx_rd_n rd_n Output 1
add_interface_port parallel_interface rx_wr_n wr_n Output 1


# 
# connection point control_interface
# 
add_interface control_interface conduit end
set_interface_property control_interface associatedClock s_axi_aclk
set_interface_property control_interface associatedReset ""
set_interface_property control_interface ENABLED true
set_interface_property control_interface EXPORT_OF ""
set_interface_property control_interface PORT_NAME_MAP ""
set_interface_property control_interface CMSIS_SVD_VARIABLES ""
set_interface_property control_interface SVD_ADDRESS_GROUP ""

add_interface_port control_interface rx_busy busy Input 1
add_interface_port control_interface rx_cnvst cnvst Output 1
add_interface_port control_interface rx_cs_n cs_n Output 1


# 
# connection point adc_data
# 
add_interface adc_data conduit end
set_interface_property adc_data associatedClock ""
set_interface_property adc_data associatedReset ""
set_interface_property adc_data ENABLED true
set_interface_property adc_data EXPORT_OF ""
set_interface_property adc_data PORT_NAME_MAP ""
set_interface_property adc_data CMSIS_SVD_VARIABLES ""
set_interface_property adc_data SVD_ADDRESS_GROUP ""

add_interface_port adc_data adc_data data Output 16


# 
# connection point adc_sync
# 
add_interface adc_sync conduit end
set_interface_property adc_sync associatedClock ""
set_interface_property adc_sync associatedReset ""
set_interface_property adc_sync ENABLED true
set_interface_property adc_sync EXPORT_OF ""
set_interface_property adc_sync PORT_NAME_MAP ""
set_interface_property adc_sync CMSIS_SVD_VARIABLES ""
set_interface_property adc_sync SVD_ADDRESS_GROUP ""

add_interface_port adc_sync adc_sync sync Output 1


# 
# connection point adc_valid
# 
add_interface adc_valid conduit end
set_interface_property adc_valid associatedClock ""
set_interface_property adc_valid associatedReset ""
set_interface_property adc_valid ENABLED true
set_interface_property adc_valid EXPORT_OF ""
set_interface_property adc_valid PORT_NAME_MAP ""
set_interface_property adc_valid CMSIS_SVD_VARIABLES ""
set_interface_property adc_valid SVD_ADDRESS_GROUP ""

add_interface_port adc_valid adc_valid valid Output 1


# 
# connection point s_axi_aclk
# 
add_interface s_axi_aclk clock end
set_interface_property s_axi_aclk clockRate 0
set_interface_property s_axi_aclk ENABLED true
set_interface_property s_axi_aclk EXPORT_OF ""
set_interface_property s_axi_aclk PORT_NAME_MAP ""
set_interface_property s_axi_aclk CMSIS_SVD_VARIABLES ""
set_interface_property s_axi_aclk SVD_ADDRESS_GROUP ""

add_interface_port s_axi_aclk s_axi_aclk clk Input 1

