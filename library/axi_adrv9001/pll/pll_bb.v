
module pll (
	loaden,
	locked,
	lvds_clk,
	outclk_2,
	outclk_3,
	outclk_4,
	refclk,
	rst);	

	output	[1:0]	loaden;
	output		locked;
	output	[1:0]	lvds_clk;
	output		outclk_2;
	output		outclk_3;
	output		outclk_4;
	input		refclk;
	input		rst;
endmodule
