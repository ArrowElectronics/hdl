package require qsys
package require quartus::device

source ../scripts/adi_env.tcl
source ../scripts/adi_ip_intel.tcl

set_module_property NAME axi_generic_adc
set_module_property DESCRIPTION "AXI Generic ADC Interface"
set_module_property VERSION 1.0
set_module_property GROUP "Analog Devices"
set_module_property DISPLAY_NAME axi_generic_adc_v1_0
set_module_property ELABORATION_CALLBACK axi_generic_adc_elaborate

# files

add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL axi_generic_adc
add_fileset_file axi_generic_adc.v	VERILOG PATH $ad_hdl_dir/library/axi_generic_adc/axi_generic_adc.v
add_fileset_file ad_rst.v        	VERILOG PATH $ad_hdl_dir/library/common/ad_rst.v
add_fileset_file up_axi.v        	VERILOG PATH $ad_hdl_dir/library/common/up_axi.v
add_fileset_file up_xfer_cntrl.v	VERILOG PATH $ad_hdl_dir/library/common/up_xfer_cntrl.v
add_fileset_file up_xfer_status.v	VERILOG PATH $ad_hdl_dir/library/common/up_xfer_status.v
add_fileset_file up_clock_mon.v		VERILOG PATH $ad_hdl_dir/library/common/up_clock_mon.v
add_fileset_file up_adc_channel.v	VERILOG PATH $ad_hdl_dir/library/common/up_adc_channel.v
add_fileset_file up_adc_common.v	VERILOG PATH $ad_hdl_dir/library/common/up_adc_common.v

# parameters

add_parameter ID INTEGER 0
set_parameter_property ID DEFAULT_VALUE 0
set_parameter_property ID DISPLAY_NAME ID
set_parameter_property ID TYPE INTEGER
set_parameter_property ID UNITS None
set_parameter_property ID HDL_PARAMETER true

add_parameter NUM_OF_CHANNELS INTEGER 0
set_parameter_property NUM_OF_CHANNELS DEFAULT_VALUE 2
set_parameter_property NUM_OF_CHANNELS DISPLAY_NAME NUM_OF_CHANNELS
set_parameter_property NUM_OF_CHANNELS TYPE INTEGER
set_parameter_property NUM_OF_CHANNELS UNITS None
set_parameter_property NUM_OF_CHANNELS HDL_PARAMETER true

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
add_interface_port s_axi s_axi_awready awready Output 1
add_interface_port s_axi s_axi_awprot awprot Input 3
add_interface_port s_axi s_axi_wvalid wvalid Input 1
add_interface_port s_axi s_axi_wdata wdata Input 32
add_interface_port s_axi s_axi_wstrb wstrb Input 4
add_interface_port s_axi s_axi_wready wready Output 1
add_interface_port s_axi s_axi_bvalid bvalid Output 1
add_interface_port s_axi s_axi_bresp bresp Output 2
add_interface_port s_axi s_axi_bready bready Input 1
add_interface_port s_axi s_axi_arvalid arvalid Input 1
add_interface_port s_axi s_axi_araddr araddr Input 16
add_interface_port s_axi s_axi_arready arready Output 1
add_interface_port s_axi s_axi_arprot arprot Input 3
add_interface_port s_axi s_axi_rvalid rvalid Output 1
add_interface_port s_axi s_axi_rready rready Input 1
add_interface_port s_axi s_axi_rresp rresp Output 2
add_interface_port s_axi s_axi_rdata rdata Output 32

# adc interface

add_interface adc_clk clock end
add_interface_port adc_clk adc_clk clk Input 1

ad_interface signal adc_dovf Input 1 ovf

proc axi_generic_adc_elaborate {} {
  add_interface enable conduit end
  set num_channels [get_parameter_value NUM_OF_CHANNELS]
  add_interface_port enable adc_enable enable Output $num_channels

#  for {set n 0} {$n < $num_channels} {incr n} {
#    add_interface_port enable adc_enable_$n enable_$n Output 1
#  }
}
