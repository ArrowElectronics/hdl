# PLL Parameters

#USER W A R N I N G !
#USER The PLL parameters are statically defined in this
#USER file at generation time!
#USER To ensure timing constraints and timing reports are correct, when you make 
#USER any changes to the PLL component using the Qsys,
#USER apply those changes to the PLL parameters in this file

set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_corename video_sys_iopll_0_altera_iopll_1931_an35usq

set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_base_clock_data [dict create]
set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data [dict create]
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_base_clock_data refclk pattern __inst_name__|tennm_ph2_iopll|ref_clk0
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_base_clock_data refclk node_type pin
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_base_clock_data refclk pin_id ""
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_base_clock_data refclk pin_node_name ""
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_base_clock_data refclk port_id ""
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_base_clock_data refclk port_node_name ""
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_base_clock_data refclk is_fpga_pin false
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_base_clock_data refclk is_main_refclk true
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_base_clock_data refclk exists false
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_base_clock_data refclk name "__inst_name___refclk"
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_base_clock_data refclk period 20.000
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_base_clock_data refclk half_period 10.000
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data n_cnt_clock pattern __inst_name__|tennm_ph2_iopll~ncntr_reg
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data n_cnt_clock node_type register
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data n_cnt_clock pin_id ""
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data n_cnt_clock pin_node_name ""
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data n_cnt_clock is_valid false
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data n_cnt_clock exists false
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data n_cnt_clock name "__inst_name___n_cnt_clk"
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data n_cnt_clock src refclk
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data n_cnt_clock multiply_by 1
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data n_cnt_clock divide_by 3
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data n_cnt_clock phase 0.000
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data n_cnt_clock duty_cycle 50
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data m_cnt_clock pattern __inst_name__|tennm_ph2_iopll~mcntr_reg
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data m_cnt_clock node_type register
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data m_cnt_clock pin_id ""
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data m_cnt_clock pin_node_name ""
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data m_cnt_clock is_valid false
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data m_cnt_clock exists false
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data m_cnt_clock name "__inst_name___m_cnt_clk"
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data m_cnt_clock src refclk
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data m_cnt_clock multiply_by 1
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data m_cnt_clock divide_by 294
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data m_cnt_clock phase 0.000
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data m_cnt_clock duty_cycle 50
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data outclk0 pattern __inst_name__|tennm_ph2_iopll|out_clk\[0\]
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data outclk0 node_type pin
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data outclk0 pin_id ""
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data outclk0 pin_node_name ""
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data outclk0 is_valid false
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data outclk0 exists false
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data outclk0 name __inst_name___outclk0
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data outclk0 src refclk
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data outclk0 multiply_by 98
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data outclk0 divide_by 11
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data outclk0 phase 0.000
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data outclk0 duty_cycle 50
dict set ::GLOBAL_top_video_sys_iopll_0_altera_iopll_1931_an35usq_gen_clock_data outclk0 counter_index 0
