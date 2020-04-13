package require qsys
source ../../scripts/adi_env.tcl
source ../../scripts/adi_ip_intel.tcl

set_module_property NAME spi_engine_interconnect_v1_0
set_module_property DESCRIPTION "SPI Engine interconnect"
set_module_property VERSION 1.0
set_module_property GROUP "Analog Devices"
set_module_property DISPLAY_NAME spi_engine_interconnect_v1_0

# files

add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL spi_engine_interconnect
add_fileset_file spi_engine_interconnect.v VERILOG PATH $ad_hdl_dir/library/spi_engine/spi_engine_interconnect/spi_engine_interconnect.v VERILOG

# parameters

add_parameter DATA_WIDTH INTEGER 8
set_parameter_property DATA_WIDTH DEFAULT_VALUE 8
set_parameter_property DATA_WIDTH DISPLAY_NAME DATA_WIDTH
set_parameter_property DATA_WIDTH TYPE INTEGER
set_parameter_property DATA_WIDTH UNITS None
set_parameter_property DATA_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property DATA_WIDTH HDL_PARAMETER true

add_parameter NUM_OF_SDI INTEGER 1
set_parameter_property NUM_OF_SDI DEFAULT_VALUE 1
set_parameter_property NUM_OF_SDI DISPLAY_NAME NUM_OF_SDI
set_parameter_property NUM_OF_SDI TYPE INTEGER
set_parameter_property NUM_OF_SDI UNITS None
set_parameter_property NUM_OF_SDI ALLOWED_RANGES -2147483648:2147483647
set_parameter_property NUM_OF_SDI HDL_PARAMETER true

# 
# connection point clk
# 
add_interface clk clock end
set_interface_property clk clockRate 0
set_interface_property clk ENABLED true
set_interface_property clk EXPORT_OF ""
set_interface_property clk PORT_NAME_MAP ""
set_interface_property clk CMSIS_SVD_VARIABLES ""
set_interface_property clk SVD_ADDRESS_GROUP ""

add_interface_port clk clk clk Input 1

# 
# connection point resetn
# 
add_interface resetn reset end
set_interface_property resetn associatedClock clk
set_interface_property resetn synchronousEdges DEASSERT
set_interface_property resetn ENABLED true
set_interface_property resetn EXPORT_OF ""
set_interface_property resetn PORT_NAME_MAP ""
set_interface_property resetn CMSIS_SVD_VARIABLES ""
set_interface_property resetn SVD_ADDRESS_GROUP ""

add_interface_port resetn resetn reset_n Input 1

# 
# connection point s0_ctrl
# 
add_interface s0_ctrl conduit end
set_interface_property s0_ctrl associatedClock clk
set_interface_property s0_ctrl associatedReset resetn
set_interface_property s0_ctrl ENABLED true
set_interface_property s0_ctrl EXPORT_OF ""
set_interface_property s0_ctrl PORT_NAME_MAP ""
set_interface_property s0_ctrl CMSIS_SVD_VARIABLES ""
set_interface_property s0_ctrl SVD_ADDRESS_GROUP ""

add_interface_port s0_ctrl s0_cmd_data cmd_data Input 16
add_interface_port s0_ctrl s0_cmd_ready cmd_ready Output 1
add_interface_port s0_ctrl s0_cmd_valid cmd_valid Input 1
add_interface_port s0_ctrl s0_sdo_data sdo_data Input DATA_WIDTH
add_interface_port s0_ctrl s0_sdo_valid sdo_valid Input 1
add_interface_port s0_ctrl s0_sdo_ready sdo_ready Output 1
add_interface_port s0_ctrl s0_sdi_data sdi_data Output NUM_OF_SDI*DATA_WIDTH
add_interface_port s0_ctrl s0_sdi_valid sdi_valid Output 1
add_interface_port s0_ctrl s0_sdi_ready sdi_ready Input 1
add_interface_port s0_ctrl s0_sync_ready sync_ready Input 1
add_interface_port s0_ctrl s0_sync_valid sync_valid Output 1
add_interface_port s0_ctrl s0_sync sync_data Output 8


# 
# connection point s1_ctrl
# 
add_interface s1_ctrl conduit end
set_interface_property s1_ctrl associatedClock clk
set_interface_property s1_ctrl associatedReset ""
set_interface_property s1_ctrl ENABLED true
set_interface_property s1_ctrl EXPORT_OF ""
set_interface_property s1_ctrl PORT_NAME_MAP ""
set_interface_property s1_ctrl CMSIS_SVD_VARIABLES ""
set_interface_property s1_ctrl SVD_ADDRESS_GROUP ""

add_interface_port s1_ctrl s1_cmd_valid cmd_valid Input 1
add_interface_port s1_ctrl s1_cmd_ready cmd_ready Output 1
add_interface_port s1_ctrl s1_cmd_data cmd_data Input 16
add_interface_port s1_ctrl s1_sdo_valid sdo_valid Input 1
add_interface_port s1_ctrl s1_sdo_ready sdo_ready Output 1
add_interface_port s1_ctrl s1_sdo_data sdo_data Input DATA_WIDTH
add_interface_port s1_ctrl s1_sdi_valid sdi_valid Output 1
add_interface_port s1_ctrl s1_sdi_ready sdi_ready Input 1
add_interface_port s1_ctrl s1_sdi_data sdi_data Output NUM_OF_SDI*DATA_WIDTH
add_interface_port s1_ctrl s1_sync_valid sync_valid Output 1
add_interface_port s1_ctrl s1_sync_ready sync_ready Input 1
add_interface_port s1_ctrl s1_sync sync_data Output 8

# 
# connection point m_ctrl
# 
add_interface m_ctrl conduit end
set_interface_property m_ctrl associatedClock clk
set_interface_property m_ctrl associatedReset resetn
set_interface_property m_ctrl ENABLED true
set_interface_property m_ctrl EXPORT_OF ""
set_interface_property m_ctrl PORT_NAME_MAP ""
set_interface_property m_ctrl CMSIS_SVD_VARIABLES ""
set_interface_property m_ctrl SVD_ADDRESS_GROUP ""

add_interface_port m_ctrl m_cmd_data cmd Output 16
add_interface_port m_ctrl m_cmd_valid cmd_valid Output 1
add_interface_port m_ctrl m_cmd_ready cmd_ready Input 1
add_interface_port m_ctrl m_sdo_valid sdo_data_valid Output 1
add_interface_port m_ctrl m_sdi_data sdi_data Input NUM_OF_SDI*DATA_WIDTH
add_interface_port m_ctrl m_sdi_valid sdi_data_valid Input 1
add_interface_port m_ctrl m_sdi_ready sdi_data_ready Output 1
add_interface_port m_ctrl m_sdo_data sdo_data Output DATA_WIDTH
add_interface_port m_ctrl m_sdo_ready sdo_data_ready Input 1
add_interface_port m_ctrl m_sync sync Input 8
add_interface_port m_ctrl m_sync_ready sync_ready Output 1
add_interface_port m_ctrl m_sync_valid sync_valid Input 1