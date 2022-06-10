	component lvds_tx is
		port (
			tx_in        : in  std_logic_vector(23 downto 0) := (others => 'X'); -- export
			tx_out       : out std_logic_vector(2 downto 0);                     -- export
			tx_outclock  : out std_logic;                                        -- export
			tx_coreclock : out std_logic;                                        -- export
			inclock      : in  std_logic                     := 'X';             -- export
			pll_areset   : in  std_logic                     := 'X';             -- export
			pll_locked   : out std_logic                                         -- export
		);
	end component lvds_tx;

	u0 : component lvds_tx
		port map (
			tx_in        => CONNECTED_TO_tx_in,        --        tx_in.export
			tx_out       => CONNECTED_TO_tx_out,       --       tx_out.export
			tx_outclock  => CONNECTED_TO_tx_outclock,  --  tx_outclock.export
			tx_coreclock => CONNECTED_TO_tx_coreclock, -- tx_coreclock.export
			inclock      => CONNECTED_TO_inclock,      --      inclock.export
			pll_areset   => CONNECTED_TO_pll_areset,   --   pll_areset.export
			pll_locked   => CONNECTED_TO_pll_locked    --   pll_locked.export
		);

