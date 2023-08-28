	component ghrd_hps_system_iopll_0 is
		port (
			refclk   : in  std_logic := 'X'; -- clk
			rst      : in  std_logic := 'X'; -- reset
			outclk_0 : out std_logic         -- clk
		);
	end component ghrd_hps_system_iopll_0;

	u0 : component ghrd_hps_system_iopll_0
		port map (
			refclk   => CONNECTED_TO_refclk,   --  refclk.clk
			rst      => CONNECTED_TO_rst,      --   reset.reset
			outclk_0 => CONNECTED_TO_outclk_0  -- outclk0.clk
		);

