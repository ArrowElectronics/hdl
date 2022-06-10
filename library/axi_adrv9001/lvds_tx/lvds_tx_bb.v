
module lvds_tx (
	tx_in,
	tx_out,
	tx_outclock,
	tx_coreclock,
	inclock,
	pll_areset,
	pll_locked);	

	input	[23:0]	tx_in;
	output	[2:0]	tx_out;
	output		tx_outclock;
	output		tx_coreclock;
	input		inclock;
	input		pll_areset;
	output		pll_locked;
endmodule
