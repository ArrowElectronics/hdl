`timescale 1ns/10ps
module  pll_altera_iopll_201_ix5otya(

	// interface 'reset'
	input wire rst,

	// interface 'refclk'
	input wire refclk,

	// interface 'locked'
	output wire locked,

	// interface 'lvds_clk'
	output wire [1:0] lvds_clk,

	// interface 'loaden'
	output wire [1:0] loaden,

	// interface 'outclk2'
	output wire outclk_2,

	// interface 'outclk3'
	output wire outclk_3,

	// interface 'outclk4'
	output wire outclk_4
);

	altera_iopll #(
		.c_cnt_bypass_en0("true"),
		.c_cnt_bypass_en1("false"),
		.c_cnt_bypass_en2("false"),
		.c_cnt_bypass_en3("false"),
		.c_cnt_bypass_en4("false"),
		.c_cnt_bypass_en5("true"),
		.c_cnt_bypass_en6("true"),
		.c_cnt_bypass_en7("true"),
		.c_cnt_bypass_en8("true"),
		.c_cnt_hi_div0(256),
		.c_cnt_hi_div1(1),
		.c_cnt_hi_div2(4),
		.c_cnt_hi_div3(1),
		.c_cnt_hi_div4(1),
		.c_cnt_hi_div5(256),
		.c_cnt_hi_div6(256),
		.c_cnt_hi_div7(256),
		.c_cnt_hi_div8(256),
		.c_cnt_in_src0("c_m_cnt_in_src_ph_mux_clk"),
		.c_cnt_in_src1("c_m_cnt_in_src_ph_mux_clk"),
		.c_cnt_in_src2("c_m_cnt_in_src_ph_mux_clk"),
		.c_cnt_in_src3("c_m_cnt_in_src_ph_mux_clk"),
		.c_cnt_in_src4("c_m_cnt_in_src_ph_mux_clk"),
		.c_cnt_in_src5("c_m_cnt_in_src_ph_mux_clk"),
		.c_cnt_in_src6("c_m_cnt_in_src_ph_mux_clk"),
		.c_cnt_in_src7("c_m_cnt_in_src_ph_mux_clk"),
		.c_cnt_in_src8("c_m_cnt_in_src_ph_mux_clk"),
		.c_cnt_lo_div0(256),
		.c_cnt_lo_div1(7),
		.c_cnt_lo_div2(4),
		.c_cnt_lo_div3(1),
		.c_cnt_lo_div4(7),
		.c_cnt_lo_div5(256),
		.c_cnt_lo_div6(256),
		.c_cnt_lo_div7(256),
		.c_cnt_lo_div8(256),
		.c_cnt_odd_div_duty_en0("false"),
		.c_cnt_odd_div_duty_en1("false"),
		.c_cnt_odd_div_duty_en2("false"),
		.c_cnt_odd_div_duty_en3("false"),
		.c_cnt_odd_div_duty_en4("false"),
		.c_cnt_odd_div_duty_en5("false"),
		.c_cnt_odd_div_duty_en6("false"),
		.c_cnt_odd_div_duty_en7("false"),
		.c_cnt_odd_div_duty_en8("false"),
		.c_cnt_ph_mux_prst0(4),
		.c_cnt_ph_mux_prst1(0),
		.c_cnt_ph_mux_prst2(4),
		.c_cnt_ph_mux_prst3(0),
		.c_cnt_ph_mux_prst4(0),
		.c_cnt_ph_mux_prst5(0),
		.c_cnt_ph_mux_prst6(0),
		.c_cnt_ph_mux_prst7(0),
		.c_cnt_ph_mux_prst8(0),
		.c_cnt_prst0(1),
		.c_cnt_prst1(8),
		.c_cnt_prst2(1),
		.c_cnt_prst3(2),
		.c_cnt_prst4(8),
		.c_cnt_prst5(1),
		.c_cnt_prst6(1),
		.c_cnt_prst7(1),
		.c_cnt_prst8(1),
		.clock_name_0("lvds_clk"),
		.clock_name_1("loaden"),
		.clock_name_2("coreclk"),
		.clock_name_3("adc_clk"),
		.clock_name_4("outclk4"),
		.clock_name_5(""),
		.clock_name_6(""),
		.clock_name_7(""),
		.clock_name_8(""),
		.clock_name_global_0("false"),
		.clock_name_global_1("false"),
		.clock_name_global_2("false"),
		.clock_name_global_3("false"),
		.clock_name_global_4("false"),
		.clock_name_global_5("false"),
		.clock_name_global_6("false"),
		.clock_name_global_7("false"),
		.clock_name_global_8("false"),
		.duty_cycle0(50),
		.duty_cycle1(13),
		.duty_cycle2(50),
		.duty_cycle3(50),
		.duty_cycle4(13),
		.duty_cycle5(50),
		.duty_cycle6(50),
		.duty_cycle7(50),
		.duty_cycle8(50),
		.m_cnt_bypass_en("false"),
		.m_cnt_hi_div(2),
		.m_cnt_lo_div(2),
		.m_cnt_odd_div_duty_en("false"),
		.n_cnt_bypass_en("false"),
		.n_cnt_hi_div(1),
		.n_cnt_lo_div(1),
		.n_cnt_odd_div_duty_en("false"),
		.number_of_clocks(5),
		.operation_mode("lvds"),
		.output_clock_frequency0("983.040000 MHz"),
		.output_clock_frequency1("122.880000 MHz"),
		.output_clock_frequency2("122.880000 MHz"),
		.output_clock_frequency3("491.520000 MHz"),
		.output_clock_frequency4("122.880000 MHz"),
		.output_clock_frequency5("0 ps"),
		.output_clock_frequency6("0 ps"),
		.output_clock_frequency7("0 ps"),
		.output_clock_frequency8("0 ps"),
		.phase_shift0("509 ps"),
		.phase_shift1("7121 ps"),
		.phase_shift2("509 ps"),
		.phase_shift3("1017 ps"),
		.phase_shift4("7121 ps"),
		.phase_shift5("0 ps"),
		.phase_shift6("0 ps"),
		.phase_shift7("0 ps"),
		.phase_shift8("0 ps"),
		.pll_bw_sel("Low"),
		.pll_bwctrl("pll_bw_res_setting2"),
		.pll_cp_current("pll_cp_setting10"),
		.pll_extclk_0_cnt_src("pll_extclk_cnt_src_vss"),
		.pll_extclk_1_cnt_src("pll_extclk_cnt_src_vss"),
		.pll_fbclk_mux_1("pll_fbclk_mux_1_lvds"),
		.pll_fbclk_mux_2("pll_fbclk_mux_2_fb_1"),
		.pll_m_cnt_in_src("c_m_cnt_in_src_ph_mux_clk"),
		.pll_output_clk_frequency("983.040000 MHz"),
		.pll_slf_rst("true"),
		.pll_subtype("General"),
		.pll_type("Arria 10"),
		.reference_clock_frequency("491.52 MHz")
	) altera_iopll_i (
		.refclk1	(1'b0),
		.rst	(rst),
		.fbclk	(1'b0),
		.fboutclk	( ),
		.zdbfbclk	( ),
		.locked	(locked),
		.loaden	(loaden),
		.phase_done	( ),
		.reconfig_to_pll	(64'b0),
		.refclk	(refclk),
		.scanclk	(1'b0),
		.phout	( ),
		.num_phase_shifts	(3'b0),
		.cntsel	(5'b0),
		.clkbad	( ),
		.extclk_out	( ),
		.lvds_clk	(lvds_clk),
		.outclk	({outclk_4, outclk_3, outclk_2, outclk_1, outclk_0}),
		.phase_en	(1'b0),
		.extswitch	(1'b0),
		.cascade_out	( ),
		.activeclk	( ),
		.adjpllin	(1'b0),
		.updn	(1'b0),
		.reconfig_from_pll	( )
	);
endmodule

