set_false_path  -from [get_registers **cdc_sync_stage0*]                                  -to [get_registers *cdc_sync_stage1*]
set_false_path  -from [get_registers *offload0_enable*]                                   -to [get_registers *cdc_sync_stage1*]
set_false_path  -from *																	  -to [get_registers *i_offload_enabled_sync|cdc_sync_stage1*]
set_false_path  -from [get_registers *offload0_mem_reset*]                                -to [get_registers *cdc_sync_stage1*]

set_false_path  -from [get_registers *up_sw_reset*]    		                              -to [get_registers *rst_async_d1*]
set_false_path  -from [get_registers *up_sw_reset*]    		                              -to [get_registers *rst_async_d2*]
set_false_path  -from [get_registers *up_sw_reset*]    		                              -to [get_registers *rst_sync*]

