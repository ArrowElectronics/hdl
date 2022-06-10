	component lvds_rx is
		port (
			inclock      : in  std_logic                     := 'X';             -- export
			pll_areset   : in  std_logic                     := 'X';             -- export
			pll_locked   : out std_logic;                                        -- export
			rx_in        : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- export
			rx_out       : out std_logic_vector(23 downto 0);                    -- export
			rx_coreclock : out std_logic                                         -- export
		);
	end component lvds_rx;

	u0 : component lvds_rx
		port map (
			inclock      => CONNECTED_TO_inclock,      --      inclock.export
			pll_areset   => CONNECTED_TO_pll_areset,   --   pll_areset.export
			pll_locked   => CONNECTED_TO_pll_locked,   --   pll_locked.export
			rx_in        => CONNECTED_TO_rx_in,        --        rx_in.export
			rx_out       => CONNECTED_TO_rx_out,       --       rx_out.export
			rx_coreclock => CONNECTED_TO_rx_coreclock  -- rx_coreclock.export
		);

