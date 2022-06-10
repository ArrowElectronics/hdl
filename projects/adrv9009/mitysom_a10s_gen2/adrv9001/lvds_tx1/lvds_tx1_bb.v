
module lvds_tx1 (
	tx_in,
	tx_out,
	tx_outclock,
	tx_coreclock,
	pll_areset,
	ext_fclk,
	ext_loaden,
	ext_coreclock);	

	input	[23:0]	tx_in;
	output	[2:0]	tx_out;
	output		tx_outclock;
	output		tx_coreclock;
	input		pll_areset;
	input		ext_fclk;
	input		ext_loaden;
	input		ext_coreclock;
endmodule
