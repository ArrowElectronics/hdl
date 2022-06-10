	component pll is
		port (
			loaden   : out std_logic_vector(1 downto 0);        -- loaden
			locked   : out std_logic;                           -- export
			lvds_clk : out std_logic_vector(1 downto 0);        -- lvds_clk
			outclk_2 : out std_logic;                           -- clk
			outclk_3 : out std_logic;                           -- clk
			outclk_4 : out std_logic;                           -- clk
			refclk   : in  std_logic                    := 'X'; -- clk
			rst      : in  std_logic                    := 'X'  -- reset
		);
	end component pll;

	u0 : component pll
		port map (
			loaden   => CONNECTED_TO_loaden,   --   loaden.loaden
			locked   => CONNECTED_TO_locked,   --   locked.export
			lvds_clk => CONNECTED_TO_lvds_clk, -- lvds_clk.lvds_clk
			outclk_2 => CONNECTED_TO_outclk_2, --  outclk2.clk
			outclk_3 => CONNECTED_TO_outclk_3, --  outclk3.clk
			outclk_4 => CONNECTED_TO_outclk_4, --  outclk4.clk
			refclk   => CONNECTED_TO_refclk,   --   refclk.clk
			rst      => CONNECTED_TO_rst       --    reset.reset
		);

