# (C) 2001-2023 Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files from any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License Subscription 
# Agreement, Intel FPGA IP License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Intel and sold by 
# Intel or its authorized distributors.  Please refer to the applicable 
# agreement for further details.



##intel_srcss_gts IP SDC##


set module_name gts_reset_seq_intel_srcss_gts_200_wnl7lpy



## set global variables
global ::ip_sdc_debug

set ip_sdc_debug 1

## get current IP instance 
set ip_inst_name [get_current_instance]
post_message -type info "IP SDC: $ip_inst_name"



#**************************************************************
# Create Clock
#**************************************************************


#**************************************************************
# Create Generated Clock
#**************************************************************




#Create Clock for the Shoreline reset sequencer 
#create_generated_clock -divide_by 2 -source [get_nodes {*|intosc|oscillator_dut~oscillator_clock}] -name "${ip_inst_name}_src_divided_osc_clk" [get_registers "${ip_inst_name}|inst|divided_osc_clk"]

set src_rs   [get_registers -nowarn ${ip_inst_name}|inst|*_src_rs*[*]]
 
    if {[get_collection_size ${src_rs}] > 0} {
        create_generated_clock -divide_by 2 -source [get_nodes {*|intosc|oscillator_dut~oscillator_clock}] -name "${ip_inst_name}_src_divided_osc_clk" [get_registers "${ip_inst_name}|inst|divided_osc_clk"] 
    }	

			
			
#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************


#**************************************************************
# Set Output Delay
#**************************************************************

#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



