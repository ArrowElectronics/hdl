// lvds_tx1_altera_lvds_201_jz36mbq.v

// This file was auto-generated from altera_lvds_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 20.1 720

`timescale 1 ps / 1 ps
module lvds_tx1_altera_lvds_201_jz36mbq (
		input  wire [31:0] tx_in,         //         tx_in.export
		output wire [3:0]  tx_out,        //        tx_out.export
		output wire        tx_outclock,   //   tx_outclock.export
		output wire        tx_coreclock,  //  tx_coreclock.export
		input  wire        ext_fclk,      //      ext_fclk.export
		input  wire        ext_loaden,    //    ext_loaden.export
		input  wire        ext_coreclock  // ext_coreclock.export
	);

	lvds_tx1_altera_lvds_core20_201_p3mg7ny #(
		.NUM_CHANNELS                       (4),
		.J_FACTOR                           (8),
		.RX_BITSLIP_ROLLOVER                (8),
		.TX_REGISTER_CLOCK                  ("tx_coreclock"),
		.TX_OUTCLOCK_NON_STD_PHASE_SHIFT    ("false"),
		.SERDES_DPA_MODE                    ("tx_mode"),
		.TX_OUTCLOCK_ENABLED                ("true"),
		.TX_OUTCLOCK_DIV_WORD               (85),
		.TX_OUTCLOCK_BYPASS_SERIALIZER      ("false"),
		.TX_OUTCLOCK_USE_FALLING_CLOCK_EDGE ("false"),
		.EXTERNAL_PLL                       ("true"),
		.ALIGN_TO_RISING_EDGE_ONLY          ("false"),
		.LOSE_LOCK_ON_ONE_CHANGE            ("false"),
		.USE_BITSLIP                        ("false"),
		.VCO_DIV_EXPONENT                   (0),
		.VCO_FREQUENCY                      (984),
		.LOOPBACK_MODE                      (0),
		.SILICON_REV                        ("20nm2"),
		.USE_DIV_RECONFIG                   ("false"),
		.pll_input_clock_frequency          ("492.1 MHz"),
		.pll_vco_clock_frequency            ("984.1999999999999 MHz"),
		.m_cnt_hi_div                       (2),
		.m_cnt_lo_div                       (2),
		.n_cnt_hi_div                       (1),
		.n_cnt_lo_div                       (1),
		.m_cnt_bypass_en                    ("false"),
		.n_cnt_bypass_en                    ("false"),
		.m_cnt_odd_div_duty_en              ("false"),
		.n_cnt_odd_div_duty_en              ("false"),
		.pll_cp_setting                     ("pll_cp_setting15"),
		.pll_bw_ctrl                        ("pll_bw_res_setting2"),
		.c_cnt_hi_div0                      (256),
		.c_cnt_lo_div0                      (256),
		.c_cnt_prst0                        (1),
		.c_cnt_ph_mux_prst0                 (4),
		.c_cnt_bypass_en0                   ("true"),
		.c_cnt_odd_div_duty_en0             ("false"),
		.c_cnt_hi_div1                      (1),
		.c_cnt_lo_div1                      (7),
		.c_cnt_prst1                        (8),
		.c_cnt_ph_mux_prst1                 (0),
		.c_cnt_bypass_en1                   ("false"),
		.c_cnt_odd_div_duty_en1             ("false"),
		.c_cnt_hi_div2                      (4),
		.c_cnt_lo_div2                      (4),
		.c_cnt_prst2                        (1),
		.c_cnt_ph_mux_prst2                 (0),
		.c_cnt_bypass_en2                   ("false"),
		.c_cnt_odd_div_duty_en2             ("false"),
		.c_cnt_hi_div3                      (256),
		.c_cnt_lo_div3                      (256),
		.c_cnt_prst3                        (1),
		.c_cnt_ph_mux_prst3                 (0),
		.c_cnt_bypass_en3                   ("true"),
		.c_cnt_odd_div_duty_en3             ("false"),
		.c_cnt_hi_div4                      (256),
		.c_cnt_lo_div4                      (256),
		.c_cnt_prst4                        (1),
		.c_cnt_ph_mux_prst4                 (0),
		.c_cnt_bypass_en4                   ("true"),
		.c_cnt_odd_div_duty_en4             ("false"),
		.c_cnt_hi_div5                      (256),
		.c_cnt_lo_div5                      (256),
		.c_cnt_prst5                        (1),
		.c_cnt_ph_mux_prst5                 (0),
		.c_cnt_bypass_en5                   ("true"),
		.c_cnt_odd_div_duty_en5             ("false"),
		.c_cnt_hi_div6                      (256),
		.c_cnt_lo_div6                      (256),
		.c_cnt_prst6                        (1),
		.c_cnt_ph_mux_prst6                 (0),
		.c_cnt_bypass_en6                   ("true"),
		.c_cnt_odd_div_duty_en6             ("false"),
		.c_cnt_hi_div7                      (256),
		.c_cnt_lo_div7                      (256),
		.c_cnt_prst7                        (1),
		.c_cnt_ph_mux_prst7                 (0),
		.c_cnt_bypass_en7                   ("true"),
		.c_cnt_odd_div_duty_en7             ("false"),
		.c_cnt_hi_div8                      (256),
		.c_cnt_lo_div8                      (256),
		.c_cnt_prst8                        (1),
		.c_cnt_ph_mux_prst8                 (0),
		.c_cnt_bypass_en8                   ("true"),
		.c_cnt_odd_div_duty_en8             ("false"),
		.pll_output_clock_frequency_0       ("984.2 MHz"),
		.pll_output_phase_shift_0           ("508 ps"),
		.pll_output_duty_cycle_0            (50),
		.pll_output_clock_frequency_1       ("123.025 MHz"),
		.pll_output_phase_shift_1           ("7112 ps"),
		.pll_output_duty_cycle_1            (13),
		.pll_output_clock_frequency_2       ("123.025 MHz"),
		.pll_output_phase_shift_2           ("0 ps"),
		.pll_output_duty_cycle_2            (50),
		.pll_output_clock_frequency_3       ("0.0 MHz"),
		.pll_output_phase_shift_3           ("0 ps"),
		.pll_output_duty_cycle_3            (50),
		.pll_output_clock_frequency_4       ("0.0 MHz"),
		.pll_output_phase_shift_4           ("0 ps"),
		.pll_output_duty_cycle_4            (50),
		.pll_output_clock_frequency_5       ("0.0 MHz"),
		.pll_output_phase_shift_5           ("0 ps"),
		.pll_output_duty_cycle_5            (50),
		.pll_output_clock_frequency_6       ("0.0 MHz"),
		.pll_output_phase_shift_6           ("0 ps"),
		.pll_output_duty_cycle_6            (50),
		.pll_output_clock_frequency_7       ("0.0 MHz"),
		.pll_output_phase_shift_7           ("0 ps"),
		.pll_output_duty_cycle_7            (50),
		.pll_output_clock_frequency_8       ("0.0 MHz"),
		.pll_output_phase_shift_8           ("0 ps"),
		.pll_output_duty_cycle_8            (50),
		.pll_clk_out_en_0                   ("true"),
		.pll_clk_out_en_1                   ("true"),
		.pll_clk_out_en_2                   ("true"),
		.pll_clk_out_en_3                   ("false"),
		.pll_clk_out_en_4                   ("false"),
		.pll_clk_out_en_5                   ("false"),
		.pll_clk_out_en_6                   ("false"),
		.pll_clk_out_en_7                   ("false"),
		.pll_clk_out_en_8                   ("false"),
		.pll_fbclk_mux_1                    ("pll_fbclk_mux_1_glb"),
		.pll_fbclk_mux_2                    ("pll_fbclk_mux_2_m_cnt"),
		.pll_m_cnt_in_src                   ("c_m_cnt_in_src_ph_mux_clk"),
		.pll_bw_sel                         ("high")
	) core (
		.tx_in                   (tx_in),         //         tx_in_conduit_end.export
		.tx_out                  (tx_out),        //        tx_out_conduit_end.export
		.tx_outclock             (tx_outclock),   //   tx_outclock_conduit_end.export
		.tx_coreclock            (tx_coreclock),  //  tx_coreclock_conduit_end.export
		.ext_fclk                (ext_fclk),      //      ext_fclk_conduit_end.export
		.ext_loaden              (ext_loaden),    //    ext_loaden_conduit_end.export
		.ext_coreclock           (ext_coreclock), // ext_coreclock_conduit_end.export
		.rx_in                   (4'b0000),       //               (terminated)
		.rx_out                  (),              //               (terminated)
		.rx_bitslip_reset        (4'b0000),       //               (terminated)
		.rx_bitslip_ctrl         (4'b0000),       //               (terminated)
		.rx_bitslip_max          (),              //               (terminated)
		.rx_coreclock            (),              //               (terminated)
		.ext_tx_outclock_fclk    (1'b0),          //               (terminated)
		.ext_tx_outclock_loaden  (1'b0),          //               (terminated)
		.ext_vcoph               (8'b00000000),   //               (terminated)
		.ext_pll_locked          (1'b0),          //               (terminated)
		.ext_dprio_clk           (1'b0),          //               (terminated)
		.inclock                 (1'b0),          //               (terminated)
		.pll_areset              (1'b0),          //               (terminated)
		.rx_dpa_locked           (),              //               (terminated)
		.rx_dpa_hold             (4'b0000),       //               (terminated)
		.rx_dpa_reset            (4'b0000),       //               (terminated)
		.rx_fifo_reset           (4'b0000),       //               (terminated)
		.rx_divfwdclk            (),              //               (terminated)
		.loopback_in             (4'b0000),       //               (terminated)
		.loopback_out            (),              //               (terminated)
		.user_mdio_dis           (1'b0),          //               (terminated)
		.user_dprio_rst_n        (1'b0),          //               (terminated)
		.user_dprio_read         (1'b0),          //               (terminated)
		.user_dprio_reg_addr     (9'b000000000),  //               (terminated)
		.user_dprio_write        (1'b0),          //               (terminated)
		.user_dprio_writedata    (8'b00000000),   //               (terminated)
		.user_dprio_clk          (),              //               (terminated)
		.user_dprio_block_select (),              //               (terminated)
		.user_dprio_readdata     (),              //               (terminated)
		.user_dprio_ready        (),              //               (terminated)
		.pll_extra_clock0        (),              //               (terminated)
		.pll_extra_clock1        (),              //               (terminated)
		.pll_extra_clock2        (),              //               (terminated)
		.pll_extra_clock3        (),              //               (terminated)
		.pll_locked              ()               //               (terminated)
	);

endmodule
