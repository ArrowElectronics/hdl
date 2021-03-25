create_bd_intf_port -mode Master -vlnv analog.com:interface:spi_master_rtl:1.0 ad7768_1_spi
create_bd_port -dir I ad7768_1_drdy

create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_SAMPLE

create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_SAMPLE

# create a SPI Engine architecture for ADC

create_bd_cell -type hier spi_ad7768_1
current_bd_instance /spi_ad7768_1

  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -type rst resetn
  create_bd_pin -dir I -type clk spi_clk
  create_bd_pin -dir I drdy
  create_bd_pin -dir O irq
  create_bd_intf_pin -mode Master -vlnv analog.com:interface:spi_master_rtl:1.0 m_spi
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 SPI_AXIS_SAMPLE

  # Master AXI Stream interface
  create_bd_pin -dir O m_axis_tvalid
  create_bd_pin -dir I m_axis_tready
  create_bd_pin -dir O -from 31 -to 0 m_axis_tdata

  ad_ip_instance spi_engine_execution execution
  ad_ip_parameter execution CONFIG.DATA_WIDTH 32
  ad_ip_parameter execution CONFIG.NUM_OF_CS 1
  ad_ip_parameter execution CONFIG.NUM_OF_SDI 1
  ad_ip_parameter execution CONFIG.SDO_DEFAULT 1
  ad_ip_parameter execution CONFIG.SDI_DELAY 1

  ad_ip_instance axi_spi_engine axi
  ad_ip_parameter axi CONFIG.DATA_WIDTH 32
  ad_ip_parameter axi CONFIG.NUM_OFFLOAD 1
  ad_ip_parameter axi CONFIG.ASYNC_SPI_CLK 1
  ad_ip_parameter axi CONFIG.NUM_OF_SDI 1

  ad_ip_instance spi_engine_offload offload
  ad_ip_parameter offload CONFIG.DATA_WIDTH 32
  ad_ip_parameter offload CONFIG.ASYNC_TRIG 1
  ad_ip_parameter offload CONFIG.ASYNC_SPI_CLK 1
  ad_ip_parameter offload CONFIG.NUM_OF_SDI 1

  ad_ip_instance spi_engine_interconnect interconnect
  ad_ip_parameter interconnect CONFIG.DATA_WIDTH 32
  ad_ip_parameter interconnect CONFIG.NUM_OF_SDI 1

  ad_connect axi/spi_engine_offload_ctrl0 offload/spi_engine_offload_ctrl
  ad_connect offload/spi_engine_ctrl interconnect/s0_ctrl
  ad_connect axi/spi_engine_ctrl interconnect/s1_ctrl
  ad_connect interconnect/m_ctrl execution/ctrl
 
  ad_connect offload/offload_sdi SPI_AXIS_SAMPLE

  ad_connect execution/spi m_spi

  ad_connect spi_clk offload/spi_clk
  ad_connect spi_clk offload/ctrl_clk
  ad_connect spi_clk execution/clk
  ad_connect clk axi/s_axi_aclk
  ad_connect spi_clk axi/spi_clk
  ad_connect spi_clk interconnect/clk
  
  ad_connect axi/spi_resetn offload/spi_resetn
  ad_connect axi/spi_resetn execution/resetn
  ad_connect axi/spi_resetn interconnect/resetn
 
  ad_connect drdy offload/trigger

  ad_connect resetn axi/s_axi_aresetn
  ad_connect irq axi/irq


current_bd_instance /

ad_connect ad7768_1_drdy  spi_ad7768_1/drdy
ad_connect M_AXIS_SAMPLE  spi_ad7768_1/SPI_AXIS_SAMPLE

#  dma to receive data stream

ad_ip_instance axi_dmac axi_ad77681_dma
ad_ip_parameter axi_ad77681_dma CONFIG.DMA_TYPE_SRC 1
ad_ip_parameter axi_ad77681_dma CONFIG.DMA_TYPE_DEST 0
ad_ip_parameter axi_ad77681_dma CONFIG.CYCLIC 0
ad_ip_parameter axi_ad77681_dma CONFIG.SYNC_TRANSFER_START 0
ad_ip_parameter axi_ad77681_dma CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_ad77681_dma CONFIG.AXI_SLICE_DEST 1
ad_ip_parameter axi_ad77681_dma CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_ad77681_dma CONFIG.DMA_DATA_WIDTH_SRC 32
ad_ip_parameter axi_ad77681_dma CONFIG.DMA_DATA_WIDTH_DEST 64

ad_connect  sys_cpu_clk spi_ad7768_1/clk
ad_connect  sys_cpu_resetn spi_ad7768_1/resetn
ad_connect  sys_cpu_resetn axi_ad77681_dma/m_dest_axi_aresetn
ad_connect  spi_clk axi_ad77681_dma/s_axis_aclk

ad_connect  spi_clk spi_ad7768_1/spi_clk
ad_connect  spi_ad7768_1/m_spi ad7768_1_spi
ad_connect  axi_ad77681_dma/s_axis S_AXIS_SAMPLE

# AXI address definitions

ad_cpu_interconnect 0x44a00000 spi_ad7768_1/axi
ad_cpu_interconnect 0x44a30000 axi_ad77681_dma

# interrupts

ad_cpu_interrupt "ps-13" "mb-13" axi_ad77681_dma/irq
ad_cpu_interrupt "ps-11" "mb-11" /spi_ad7768_1/irq

# memory interconnects

ad_mem_hp2_interconnect sys_cpu_clk sys_ps7/S_AXI_HP2
ad_mem_hp2_interconnect sys_cpu_clk axi_ad77681_dma/m_dest_axi
