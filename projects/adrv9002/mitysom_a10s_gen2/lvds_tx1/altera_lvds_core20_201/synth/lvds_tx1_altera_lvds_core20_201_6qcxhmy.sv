module lvds_tx1_altera_lvds_core20_201_6qcxhmy #(
   parameter NUM_CHANNELS                                       = 0,
   parameter J_FACTOR                                           = 0,
   parameter RX_BITSLIP_ROLLOVER                                = 0,
   parameter TX_REGISTER_CLOCK                                  = "",
   parameter TX_OUTCLOCK_NON_STD_PHASE_SHIFT                    = "",
   parameter SERDES_DPA_MODE                                    = "",
   parameter TX_OUTCLOCK_ENABLED                                = "",
   parameter TX_OUTCLOCK_DIV_WORD                               = 0,
   parameter TX_OUTCLOCK_BYPASS_SERIALIZER                      = "",
   parameter TX_OUTCLOCK_USE_FALLING_CLOCK_EDGE                 = "",
   parameter EXTERNAL_PLL                                       = "",
   parameter ALIGN_TO_RISING_EDGE_ONLY                          = "",
   parameter LOSE_LOCK_ON_ONE_CHANGE                            = "",
   parameter USE_BITSLIP                                        = "",
   parameter VCO_DIV_EXPONENT                                   = 0,
   parameter VCO_FREQUENCY                                      = 0,
   parameter LOOPBACK_MODE                                      = 0,
   parameter SILICON_REV                                        = "",
   parameter USE_DIV_RECONFIG                                   = "",
   parameter pll_input_clock_frequency                          = "",
   parameter pll_vco_clock_frequency                            = "",
   parameter m_cnt_hi_div                                       = 0,
   parameter m_cnt_lo_div                                       = 0,
   parameter n_cnt_hi_div                                       = 0,
   parameter n_cnt_lo_div                                       = 0,
   parameter m_cnt_bypass_en                                    = "",
   parameter n_cnt_bypass_en                                    = "",
   parameter m_cnt_odd_div_duty_en                              = "",
   parameter n_cnt_odd_div_duty_en                              = "",
   parameter pll_cp_setting                                     = "",
   parameter pll_bw_ctrl                                        = "",
   parameter c_cnt_hi_div0                                      = 0,
   parameter c_cnt_lo_div0                                      = 0,
   parameter c_cnt_prst0                                        = 0,
   parameter c_cnt_ph_mux_prst0                                 = 0,
   parameter c_cnt_bypass_en0                                   = "",
   parameter c_cnt_odd_div_duty_en0                             = "",
   parameter c_cnt_hi_div1                                      = 0,
   parameter c_cnt_lo_div1                                      = 0,
   parameter c_cnt_prst1                                        = 0,
   parameter c_cnt_ph_mux_prst1                                 = 0,
   parameter c_cnt_bypass_en1                                   = "",
   parameter c_cnt_odd_div_duty_en1                             = "",
   parameter c_cnt_hi_div2                                      = 0,
   parameter c_cnt_lo_div2                                      = 0,
   parameter c_cnt_prst2                                        = 0,
   parameter c_cnt_ph_mux_prst2                                 = 0,
   parameter c_cnt_bypass_en2                                   = "",
   parameter c_cnt_odd_div_duty_en2                             = "",
   parameter c_cnt_hi_div3                                      = 0,
   parameter c_cnt_lo_div3                                      = 0,
   parameter c_cnt_prst3                                        = 0,
   parameter c_cnt_ph_mux_prst3                                 = 0,
   parameter c_cnt_bypass_en3                                   = "",
   parameter c_cnt_odd_div_duty_en3                             = "",
   parameter c_cnt_hi_div4                                      = 0,
   parameter c_cnt_lo_div4                                      = 0,
   parameter c_cnt_prst4                                        = 0,
   parameter c_cnt_ph_mux_prst4                                 = 0,
   parameter c_cnt_bypass_en4                                   = "",
   parameter c_cnt_odd_div_duty_en4                             = "",
   parameter c_cnt_hi_div5                                      = 0,
   parameter c_cnt_lo_div5                                      = 0,
   parameter c_cnt_prst5                                        = 0,
   parameter c_cnt_ph_mux_prst5                                 = 0,
   parameter c_cnt_bypass_en5                                   = "",
   parameter c_cnt_odd_div_duty_en5                             = "",
   parameter c_cnt_hi_div6                                      = 0,
   parameter c_cnt_lo_div6                                      = 0,
   parameter c_cnt_prst6                                        = 0,
   parameter c_cnt_ph_mux_prst6                                 = 0,
   parameter c_cnt_bypass_en6                                   = "",
   parameter c_cnt_odd_div_duty_en6                             = "",
   parameter c_cnt_hi_div7                                      = 0,
   parameter c_cnt_lo_div7                                      = 0,
   parameter c_cnt_prst7                                        = 0,
   parameter c_cnt_ph_mux_prst7                                 = 0,
   parameter c_cnt_bypass_en7                                   = "",
   parameter c_cnt_odd_div_duty_en7                             = "",
   parameter c_cnt_hi_div8                                      = 0,
   parameter c_cnt_lo_div8                                      = 0,
   parameter c_cnt_prst8                                        = 0,
   parameter c_cnt_ph_mux_prst8                                 = 0,
   parameter c_cnt_bypass_en8                                   = "",
   parameter c_cnt_odd_div_duty_en8                             = "",
   parameter pll_output_clock_frequency_0                       = "",
   parameter pll_output_phase_shift_0                           = "",
   parameter pll_output_duty_cycle_0                            = 0,
   parameter pll_output_clock_frequency_1                       = "",
   parameter pll_output_phase_shift_1                           = "",
   parameter pll_output_duty_cycle_1                            = 0,
   parameter pll_output_clock_frequency_2                       = "",
   parameter pll_output_phase_shift_2                           = "",
   parameter pll_output_duty_cycle_2                            = 0,
   parameter pll_output_clock_frequency_3                       = "",
   parameter pll_output_phase_shift_3                           = "",
   parameter pll_output_duty_cycle_3                            = 0,
   parameter pll_output_clock_frequency_4                       = "",
   parameter pll_output_phase_shift_4                           = "",
   parameter pll_output_duty_cycle_4                            = 0,
   parameter pll_output_clock_frequency_5                       = "",
   parameter pll_output_phase_shift_5                           = "",
   parameter pll_output_duty_cycle_5                            = 0,
   parameter pll_output_clock_frequency_6                       = "",
   parameter pll_output_phase_shift_6                           = "",
   parameter pll_output_duty_cycle_6                            = 0,
   parameter pll_output_clock_frequency_7                       = "",
   parameter pll_output_phase_shift_7                           = "",
   parameter pll_output_duty_cycle_7                            = 0,
   parameter pll_output_clock_frequency_8                       = "",
   parameter pll_output_phase_shift_8                           = "",
   parameter pll_output_duty_cycle_8                            = 0,
   parameter pll_clk_out_en_0                                   = "",
   parameter pll_clk_out_en_1                                   = "",
   parameter pll_clk_out_en_2                                   = "",
   parameter pll_clk_out_en_3                                   = "",
   parameter pll_clk_out_en_4                                   = "",
   parameter pll_clk_out_en_5                                   = "",
   parameter pll_clk_out_en_6                                   = "",
   parameter pll_clk_out_en_7                                   = "",
   parameter pll_clk_out_en_8                                   = "",
   parameter pll_fbclk_mux_1                                    = "",
   parameter pll_fbclk_mux_2                                    = "",
   parameter pll_m_cnt_in_src                                   = "",
   parameter pll_bw_sel                                         = ""
) (
   input  logic [31:0]     tx_in,
   output logic [3:0]      tx_out,
   output logic            tx_outclock,
   output logic            tx_coreclock,
   input  logic [3:0]      rx_in,
   output logic [31:0]     rx_out,
   input  logic [3:0]      rx_bitslip_reset,
   input  logic [3:0]      rx_bitslip_ctrl,
   output logic [3:0]      rx_bitslip_max,
   output logic            rx_coreclock,
   input  logic            ext_fclk,
   input  logic            ext_loaden,
   input  logic            ext_coreclock,
   input  logic            ext_tx_outclock_fclk,
   input  logic            ext_tx_outclock_loaden,
   input  logic [7:0]      ext_vcoph,
   input  logic            ext_pll_locked,
   input  logic            ext_dprio_clk,
   input  logic            inclock,
   input  logic            pll_areset,
   output logic [3:0]      rx_dpa_locked,
   input  logic [3:0]      rx_dpa_hold,
   input  logic [3:0]      rx_dpa_reset,
   input  logic [3:0]      rx_fifo_reset,
   output logic [3:0]      rx_divfwdclk,
   input  logic [3:0]      loopback_in,
   output logic [3:0]      loopback_out,
   input  logic            user_mdio_dis,
   input  logic            user_dprio_rst_n,
   input  logic            user_dprio_read,
   input  logic [8:0]      user_dprio_reg_addr,
   input  logic            user_dprio_write,
   input  logic [7:0]      user_dprio_writedata,
   output logic            user_dprio_clk,
   output logic            user_dprio_block_select,
   output logic [7:0]      user_dprio_readdata,
   output logic            user_dprio_ready,
   output logic            pll_extra_clock0,
   output logic            pll_extra_clock1,
   output logic            pll_extra_clock2,
   output logic            pll_extra_clock3,
   output logic            pll_locked
);
   timeunit 1ns;
   timeprecision 1ps;

   altera_lvds_core20 # (
      .NUM_CHANNELS (NUM_CHANNELS),
      .J_FACTOR (J_FACTOR),
      .RX_BITSLIP_ROLLOVER (RX_BITSLIP_ROLLOVER),
      .TX_REGISTER_CLOCK (TX_REGISTER_CLOCK),
      .TX_OUTCLOCK_NON_STD_PHASE_SHIFT (TX_OUTCLOCK_NON_STD_PHASE_SHIFT),
      .SERDES_DPA_MODE (SERDES_DPA_MODE),
      .TX_OUTCLOCK_ENABLED (TX_OUTCLOCK_ENABLED),
      .TX_OUTCLOCK_DIV_WORD (TX_OUTCLOCK_DIV_WORD),
      .TX_OUTCLOCK_BYPASS_SERIALIZER (TX_OUTCLOCK_BYPASS_SERIALIZER),
      .TX_OUTCLOCK_USE_FALLING_CLOCK_EDGE (TX_OUTCLOCK_USE_FALLING_CLOCK_EDGE),
      .EXTERNAL_PLL (EXTERNAL_PLL),
      .ALIGN_TO_RISING_EDGE_ONLY (ALIGN_TO_RISING_EDGE_ONLY),
      .LOSE_LOCK_ON_ONE_CHANGE (LOSE_LOCK_ON_ONE_CHANGE),
      .USE_BITSLIP (USE_BITSLIP),
      .VCO_DIV_EXPONENT (VCO_DIV_EXPONENT),
      .VCO_FREQUENCY (VCO_FREQUENCY),
      .LOOPBACK_MODE (LOOPBACK_MODE),
      .SILICON_REV (SILICON_REV),
      .USE_DIV_RECONFIG (USE_DIV_RECONFIG),
      .pll_input_clock_frequency (pll_input_clock_frequency),
      .pll_vco_clock_frequency (pll_vco_clock_frequency),
      .m_cnt_hi_div (m_cnt_hi_div),
      .m_cnt_lo_div (m_cnt_lo_div),
      .n_cnt_hi_div (n_cnt_hi_div),
      .n_cnt_lo_div (n_cnt_lo_div),
      .m_cnt_bypass_en (m_cnt_bypass_en),
      .n_cnt_bypass_en (n_cnt_bypass_en),
      .m_cnt_odd_div_duty_en (m_cnt_odd_div_duty_en),
      .n_cnt_odd_div_duty_en (n_cnt_odd_div_duty_en),
      .pll_cp_setting (pll_cp_setting),
      .pll_bw_ctrl (pll_bw_ctrl),
      .c_cnt_hi_div0 (c_cnt_hi_div0),
      .c_cnt_lo_div0 (c_cnt_lo_div0),
      .c_cnt_prst0 (c_cnt_prst0),
      .c_cnt_ph_mux_prst0 (c_cnt_ph_mux_prst0),
      .c_cnt_bypass_en0 (c_cnt_bypass_en0),
      .c_cnt_odd_div_duty_en0 (c_cnt_odd_div_duty_en0),
      .c_cnt_hi_div1 (c_cnt_hi_div1),
      .c_cnt_lo_div1 (c_cnt_lo_div1),
      .c_cnt_prst1 (c_cnt_prst1),
      .c_cnt_ph_mux_prst1 (c_cnt_ph_mux_prst1),
      .c_cnt_bypass_en1 (c_cnt_bypass_en1),
      .c_cnt_odd_div_duty_en1 (c_cnt_odd_div_duty_en1),
      .c_cnt_hi_div2 (c_cnt_hi_div2),
      .c_cnt_lo_div2 (c_cnt_lo_div2),
      .c_cnt_prst2 (c_cnt_prst2),
      .c_cnt_ph_mux_prst2 (c_cnt_ph_mux_prst2),
      .c_cnt_bypass_en2 (c_cnt_bypass_en2),
      .c_cnt_odd_div_duty_en2 (c_cnt_odd_div_duty_en2),
      .c_cnt_hi_div3 (c_cnt_hi_div3),
      .c_cnt_lo_div3 (c_cnt_lo_div3),
      .c_cnt_prst3 (c_cnt_prst3),
      .c_cnt_ph_mux_prst3 (c_cnt_ph_mux_prst3),
      .c_cnt_bypass_en3 (c_cnt_bypass_en3),
      .c_cnt_odd_div_duty_en3 (c_cnt_odd_div_duty_en3),
      .c_cnt_hi_div4 (c_cnt_hi_div4),
      .c_cnt_lo_div4 (c_cnt_lo_div4),
      .c_cnt_prst4 (c_cnt_prst4),
      .c_cnt_ph_mux_prst4 (c_cnt_ph_mux_prst4),
      .c_cnt_bypass_en4 (c_cnt_bypass_en4),
      .c_cnt_odd_div_duty_en4 (c_cnt_odd_div_duty_en4),
      .c_cnt_hi_div5 (c_cnt_hi_div5),
      .c_cnt_lo_div5 (c_cnt_lo_div5),
      .c_cnt_prst5 (c_cnt_prst5),
      .c_cnt_ph_mux_prst5 (c_cnt_ph_mux_prst5),
      .c_cnt_bypass_en5 (c_cnt_bypass_en5),
      .c_cnt_odd_div_duty_en5 (c_cnt_odd_div_duty_en5),
      .c_cnt_hi_div6 (c_cnt_hi_div6),
      .c_cnt_lo_div6 (c_cnt_lo_div6),
      .c_cnt_prst6 (c_cnt_prst6),
      .c_cnt_ph_mux_prst6 (c_cnt_ph_mux_prst6),
      .c_cnt_bypass_en6 (c_cnt_bypass_en6),
      .c_cnt_odd_div_duty_en6 (c_cnt_odd_div_duty_en6),
      .c_cnt_hi_div7 (c_cnt_hi_div7),
      .c_cnt_lo_div7 (c_cnt_lo_div7),
      .c_cnt_prst7 (c_cnt_prst7),
      .c_cnt_ph_mux_prst7 (c_cnt_ph_mux_prst7),
      .c_cnt_bypass_en7 (c_cnt_bypass_en7),
      .c_cnt_odd_div_duty_en7 (c_cnt_odd_div_duty_en7),
      .c_cnt_hi_div8 (c_cnt_hi_div8),
      .c_cnt_lo_div8 (c_cnt_lo_div8),
      .c_cnt_prst8 (c_cnt_prst8),
      .c_cnt_ph_mux_prst8 (c_cnt_ph_mux_prst8),
      .c_cnt_bypass_en8 (c_cnt_bypass_en8),
      .c_cnt_odd_div_duty_en8 (c_cnt_odd_div_duty_en8),
      .pll_output_clock_frequency_0 (pll_output_clock_frequency_0),
      .pll_output_phase_shift_0 (pll_output_phase_shift_0),
      .pll_output_duty_cycle_0 (pll_output_duty_cycle_0),
      .pll_output_clock_frequency_1 (pll_output_clock_frequency_1),
      .pll_output_phase_shift_1 (pll_output_phase_shift_1),
      .pll_output_duty_cycle_1 (pll_output_duty_cycle_1),
      .pll_output_clock_frequency_2 (pll_output_clock_frequency_2),
      .pll_output_phase_shift_2 (pll_output_phase_shift_2),
      .pll_output_duty_cycle_2 (pll_output_duty_cycle_2),
      .pll_output_clock_frequency_3 (pll_output_clock_frequency_3),
      .pll_output_phase_shift_3 (pll_output_phase_shift_3),
      .pll_output_duty_cycle_3 (pll_output_duty_cycle_3),
      .pll_output_clock_frequency_4 (pll_output_clock_frequency_4),
      .pll_output_phase_shift_4 (pll_output_phase_shift_4),
      .pll_output_duty_cycle_4 (pll_output_duty_cycle_4),
      .pll_output_clock_frequency_5 (pll_output_clock_frequency_5),
      .pll_output_phase_shift_5 (pll_output_phase_shift_5),
      .pll_output_duty_cycle_5 (pll_output_duty_cycle_5),
      .pll_output_clock_frequency_6 (pll_output_clock_frequency_6),
      .pll_output_phase_shift_6 (pll_output_phase_shift_6),
      .pll_output_duty_cycle_6 (pll_output_duty_cycle_6),
      .pll_output_clock_frequency_7 (pll_output_clock_frequency_7),
      .pll_output_phase_shift_7 (pll_output_phase_shift_7),
      .pll_output_duty_cycle_7 (pll_output_duty_cycle_7),
      .pll_output_clock_frequency_8 (pll_output_clock_frequency_8),
      .pll_output_phase_shift_8 (pll_output_phase_shift_8),
      .pll_output_duty_cycle_8 (pll_output_duty_cycle_8),
      .pll_clk_out_en_0 (pll_clk_out_en_0),
      .pll_clk_out_en_1 (pll_clk_out_en_1),
      .pll_clk_out_en_2 (pll_clk_out_en_2),
      .pll_clk_out_en_3 (pll_clk_out_en_3),
      .pll_clk_out_en_4 (pll_clk_out_en_4),
      .pll_clk_out_en_5 (pll_clk_out_en_5),
      .pll_clk_out_en_6 (pll_clk_out_en_6),
      .pll_clk_out_en_7 (pll_clk_out_en_7),
      .pll_clk_out_en_8 (pll_clk_out_en_8),
      .pll_fbclk_mux_1 (pll_fbclk_mux_1),
      .pll_fbclk_mux_2 (pll_fbclk_mux_2),
      .pll_m_cnt_in_src (pll_m_cnt_in_src),
      .pll_bw_sel (pll_bw_sel)
   ) arch_inst (
      .tx_in (tx_in),
      .tx_out (tx_out),
      .tx_outclock (tx_outclock),
      .tx_coreclock (tx_coreclock),
      .rx_in (rx_in),
      .rx_out (rx_out),
      .rx_bitslip_reset (rx_bitslip_reset),
      .rx_bitslip_ctrl (rx_bitslip_ctrl),
      .rx_bitslip_max (rx_bitslip_max),
      .rx_coreclock (rx_coreclock),
      .ext_fclk (ext_fclk),
      .ext_loaden (ext_loaden),
      .ext_coreclock (ext_coreclock),
      .ext_tx_outclock_fclk (ext_tx_outclock_fclk),
      .ext_tx_outclock_loaden (ext_tx_outclock_loaden),
      .ext_vcoph (ext_vcoph),
      .ext_pll_locked (ext_pll_locked),
      .ext_dprio_clk (ext_dprio_clk),
      .inclock (inclock),
      .pll_areset (pll_areset),
      .rx_dpa_locked (rx_dpa_locked),
      .rx_dpa_hold (rx_dpa_hold),
      .rx_dpa_reset (rx_dpa_reset),
      .rx_fifo_reset (rx_fifo_reset),
      .rx_divfwdclk (rx_divfwdclk),
      .loopback_in (loopback_in),
      .loopback_out (loopback_out),
      .user_mdio_dis (user_mdio_dis),
      .user_dprio_rst_n (user_dprio_rst_n),
      .user_dprio_read (user_dprio_read),
      .user_dprio_reg_addr (user_dprio_reg_addr),
      .user_dprio_write (user_dprio_write),
      .user_dprio_writedata (user_dprio_writedata),
      .user_dprio_clk (user_dprio_clk),
      .user_dprio_block_select (user_dprio_block_select),
      .user_dprio_readdata (user_dprio_readdata),
      .user_dprio_ready (user_dprio_ready),
      .pll_extra_clock0 (pll_extra_clock0),
      .pll_extra_clock1 (pll_extra_clock1),
      .pll_extra_clock2 (pll_extra_clock2),
      .pll_extra_clock3 (pll_extra_clock3),
      .pll_locked (pll_locked)
   );
endmodule
