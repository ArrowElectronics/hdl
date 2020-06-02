package require qsys
source ../../scripts/adi_env.tcl
source ../../scripts/adi_ip_intel.tcl

set_module_property NAME axi_spi_engine_v1_0
set_module_property DESCRIPTION "SPI Engine"
set_module_property VERSION 1.1
set_module_property GROUP "Analog Devices"
set_module_property DISPLAY_NAME axi_spi_engine_v1_0

# files

add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL axi_spi_engine
add_fileset_file axi_spi_engine.v VERILOG PATH $ad_hdl_dir/library/spi_engine/axi_spi_engine/axi_spi_engine.v VERILOG
add_fileset_file up_axi.v VERILOG PATH $ad_hdl_dir/library/common/up_axi.v VERILOG
add_fileset_file ad_rst.v VERILOG PATH $ad_hdl_dir/library/common/ad_rst.v VERILOG
add_fileset_file util_axis_fifo.v VERILOG PATH $ad_hdl_dir/library/util_axis_fifo/util_axis_fifo.v VERILOG
add_fileset_file sync_bits.v VERILOG PATH $ad_hdl_dir/library/util_cdc/sync_bits.v VERILOG
add_fileset_file address_gray_pipelined.v VERILOG PATH $ad_hdl_dir/library/util_axis_fifo/address_gray_pipelined.v VERILOG
add_fileset_file sync_gray.v VERILOG PATH $ad_hdl_dir/library/util_cdc/sync_gray.v VERILOG
add_fileset_file ad_mem.v VERILOG PATH $ad_hdl_dir/library/common/ad_mem.v VERILOG
add_fileset_file address_sync.v VERILOG PATH $ad_hdl_dir/library/util_axis_fifo/address_sync.v VERILOG
add_fileset_file axi_spi_engine_constr.sdc SDC PATH axi_spi_engine_constr.sdc

# parameters

add_parameter CMD_FIFO_ADDRESS_WIDTH INTEGER 4
set_parameter_property CMD_FIFO_ADDRESS_WIDTH DEFAULT_VALUE 4
set_parameter_property CMD_FIFO_ADDRESS_WIDTH DISPLAY_NAME CMD_FIFO_ADDRESS_WIDTH
set_parameter_property CMD_FIFO_ADDRESS_WIDTH TYPE INTEGER
set_parameter_property CMD_FIFO_ADDRESS_WIDTH UNITS None
set_parameter_property CMD_FIFO_ADDRESS_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property CMD_FIFO_ADDRESS_WIDTH HDL_PARAMETER true

add_parameter SYNC_FIFO_ADDRESS_WIDTH INTEGER 4
set_parameter_property SYNC_FIFO_ADDRESS_WIDTH DEFAULT_VALUE 4
set_parameter_property SYNC_FIFO_ADDRESS_WIDTH DISPLAY_NAME SYNC_FIFO_ADDRESS_WIDTH
set_parameter_property SYNC_FIFO_ADDRESS_WIDTH TYPE INTEGER
set_parameter_property SYNC_FIFO_ADDRESS_WIDTH UNITS None
set_parameter_property SYNC_FIFO_ADDRESS_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property SYNC_FIFO_ADDRESS_WIDTH HDL_PARAMETER true

add_parameter SDO_FIFO_ADDRESS_WIDTH INTEGER 5
set_parameter_property SDO_FIFO_ADDRESS_WIDTH DEFAULT_VALUE 5
set_parameter_property SDO_FIFO_ADDRESS_WIDTH DISPLAY_NAME SDO_FIFO_ADDRESS_WIDTH
set_parameter_property SDO_FIFO_ADDRESS_WIDTH TYPE INTEGER
set_parameter_property SDO_FIFO_ADDRESS_WIDTH UNITS None
set_parameter_property SDO_FIFO_ADDRESS_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property SDO_FIFO_ADDRESS_WIDTH HDL_PARAMETER true

add_parameter SDI_FIFO_ADDRESS_WIDTH INTEGER 5
set_parameter_property SDI_FIFO_ADDRESS_WIDTH DEFAULT_VALUE 5
set_parameter_property SDI_FIFO_ADDRESS_WIDTH DISPLAY_NAME SDI_FIFO_ADDRESS_WIDTH
set_parameter_property SDI_FIFO_ADDRESS_WIDTH TYPE INTEGER
set_parameter_property SDI_FIFO_ADDRESS_WIDTH UNITS None
set_parameter_property SDI_FIFO_ADDRESS_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property SDI_FIFO_ADDRESS_WIDTH HDL_PARAMETER true

add_parameter MM_IF_TYPE INTEGER 0
set_parameter_property MM_IF_TYPE DEFAULT_VALUE 0
set_parameter_property MM_IF_TYPE DISPLAY_NAME MM_IF_TYPE
set_parameter_property MM_IF_TYPE TYPE INTEGER
set_parameter_property MM_IF_TYPE UNITS None
set_parameter_property MM_IF_TYPE ALLOWED_RANGES -2147483648:2147483647
set_parameter_property MM_IF_TYPE HDL_PARAMETER true

add_parameter ASYNC_SPI_CLK INTEGER 0
set_parameter_property ASYNC_SPI_CLK DEFAULT_VALUE 0
set_parameter_property ASYNC_SPI_CLK DISPLAY_NAME ASYNC_SPI_CLK
set_parameter_property ASYNC_SPI_CLK TYPE INTEGER
set_parameter_property ASYNC_SPI_CLK UNITS None
set_parameter_property ASYNC_SPI_CLK ALLOWED_RANGES -2147483648:2147483647
set_parameter_property ASYNC_SPI_CLK HDL_PARAMETER true

add_parameter NUM_OFFLOAD INTEGER 0
set_parameter_property NUM_OFFLOAD DEFAULT_VALUE 0
set_parameter_property NUM_OFFLOAD DISPLAY_NAME NUM_OFFLOAD
set_parameter_property NUM_OFFLOAD TYPE INTEGER
set_parameter_property NUM_OFFLOAD UNITS None
set_parameter_property NUM_OFFLOAD ALLOWED_RANGES -2147483648:2147483647
set_parameter_property NUM_OFFLOAD HDL_PARAMETER true

add_parameter OFFLOAD0_CMD_MEM_ADDRESS_WIDTH INTEGER 4
set_parameter_property OFFLOAD0_CMD_MEM_ADDRESS_WIDTH DEFAULT_VALUE 4
set_parameter_property OFFLOAD0_CMD_MEM_ADDRESS_WIDTH DISPLAY_NAME OFFLOAD0_CMD_MEM_ADDRESS_WIDTH
set_parameter_property OFFLOAD0_CMD_MEM_ADDRESS_WIDTH TYPE INTEGER
set_parameter_property OFFLOAD0_CMD_MEM_ADDRESS_WIDTH UNITS None
set_parameter_property OFFLOAD0_CMD_MEM_ADDRESS_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property OFFLOAD0_CMD_MEM_ADDRESS_WIDTH HDL_PARAMETER true

add_parameter OFFLOAD0_SDO_MEM_ADDRESS_WIDTH INTEGER 4
set_parameter_property OFFLOAD0_SDO_MEM_ADDRESS_WIDTH DEFAULT_VALUE 4
set_parameter_property OFFLOAD0_SDO_MEM_ADDRESS_WIDTH DISPLAY_NAME OFFLOAD0_SDO_MEM_ADDRESS_WIDTH
set_parameter_property OFFLOAD0_SDO_MEM_ADDRESS_WIDTH TYPE INTEGER
set_parameter_property OFFLOAD0_SDO_MEM_ADDRESS_WIDTH UNITS None
set_parameter_property OFFLOAD0_SDO_MEM_ADDRESS_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property OFFLOAD0_SDO_MEM_ADDRESS_WIDTH HDL_PARAMETER true

add_parameter ID INTEGER 0
set_parameter_property ID DEFAULT_VALUE 0
set_parameter_property ID DISPLAY_NAME ID
set_parameter_property ID TYPE INTEGER
set_parameter_property ID UNITS None
set_parameter_property ID ALLOWED_RANGES -2147483648:2147483647
set_parameter_property ID HDL_PARAMETER true

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
# connection point s_axi_aclk
# 
add_interface s_axi_aclk clock sink
set_interface_property s_axi_aclk clockRate 0
add_interface_port s_axi_aclk s_axi_aclk clk Input 1

# 
# connection point s_axi_aresetn
# 
add_interface s_axi_aresetn reset end
set_interface_property s_axi_aresetn associatedClock s_axi_aclk
add_interface_port s_axi_aresetn s_axi_aresetn reset_n Input 1

# 
# connection point s_axi
# 
add_interface s_axi axi4lite end
set_interface_property s_axi associatedClock s_axi_aclk
set_interface_property s_axi associatedReset s_axi_aresetn
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

# 
# connection point spi_clk
# 
add_interface spi_clk clock sink
set_interface_property spi_clk clockRate 0
add_interface_port spi_clk spi_clk clk Input 1

# 
# connection point spi_resetn
# 
add_interface spi_resetn reset start
set_interface_property spi_resetn associatedClock spi_clk
add_interface_port spi_resetn spi_resetn reset_n Output 1

# 
# connection point spi_engine_ctrl
# 
add_interface spi_engine_ctrl conduit end
set_interface_property spi_engine_ctrl associatedClock spi_clk
set_interface_property spi_engine_ctrl associatedReset ""
set_interface_property spi_engine_ctrl ENABLED true
set_interface_property spi_engine_ctrl EXPORT_OF ""
set_interface_property spi_engine_ctrl PORT_NAME_MAP ""
set_interface_property spi_engine_ctrl CMSIS_SVD_VARIABLES ""
set_interface_property spi_engine_ctrl SVD_ADDRESS_GROUP ""

add_interface_port spi_engine_ctrl cmd_ready cmd_ready Input 1
add_interface_port spi_engine_ctrl cmd_valid cmd_valid Output 1
add_interface_port spi_engine_ctrl cmd_data cmd_data Output 16
add_interface_port spi_engine_ctrl sdo_data_ready sdo_ready Input 1
add_interface_port spi_engine_ctrl sdo_data_valid sdo_valid Output 1
add_interface_port spi_engine_ctrl sdo_data sdo_data Output DATA_WIDTH
add_interface_port spi_engine_ctrl sdi_data_ready sdi_ready Output 1
add_interface_port spi_engine_ctrl sdi_data_valid sdi_valid Input 1
add_interface_port spi_engine_ctrl sdi_data sdi_data Input NUM_OF_SDI*DATA_WIDTH
add_interface_port spi_engine_ctrl sync_ready sync_ready Output 1
add_interface_port spi_engine_ctrl sync_valid sync_valid Input 1
add_interface_port spi_engine_ctrl sync_data sync_data Input 8

# 
# connection point spi_engine_offload_ctrl0
# 
add_interface spi_engine_offload_ctrl0 conduit end
set_interface_property spi_engine_offload_ctrl0 associatedClock spi_clk
set_interface_property spi_engine_offload_ctrl0 associatedReset ""
set_interface_property spi_engine_offload_ctrl0 ENABLED true
set_interface_property spi_engine_offload_ctrl0 EXPORT_OF ""
set_interface_property spi_engine_offload_ctrl0 PORT_NAME_MAP ""
set_interface_property spi_engine_offload_ctrl0 CMSIS_SVD_VARIABLES ""
set_interface_property spi_engine_offload_ctrl0 SVD_ADDRESS_GROUP ""

add_interface_port spi_engine_offload_ctrl0 offload0_cmd_wr_en cmd_wr_en Output 1
add_interface_port spi_engine_offload_ctrl0 offload0_cmd_wr_data cmd_wr_data Output 16
add_interface_port spi_engine_offload_ctrl0 offload0_sdo_wr_en sdo_wr_en Output 1
add_interface_port spi_engine_offload_ctrl0 offload0_sdo_wr_data sdo_wr_data Output DATA_WIDTH
add_interface_port spi_engine_offload_ctrl0 offload0_mem_reset reset Output 1
add_interface_port spi_engine_offload_ctrl0 offload0_enable enable Output 1
add_interface_port spi_engine_offload_ctrl0 offload0_enabled enabled Input 1

# 
# connection point irq
# 
add_interface irq interrupt end
set_interface_property irq associatedAddressablePoint s_axi
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
# connection point pulse_gen_period
# 
add_interface pulse_gen_period conduit end
set_interface_property pulse_gen_period associatedClock s_axi_aclk
add_interface_port pulse_gen_period pulse_gen_period pulse_gen_period Output 32

# 
# connection point pulse_gen_load
# 
add_interface pulse_gen_load conduit end
set_interface_property pulse_gen_load associatedClock s_axi_aclk
add_interface_port pulse_gen_load pulse_gen_load pulse_gen_load Output 1

