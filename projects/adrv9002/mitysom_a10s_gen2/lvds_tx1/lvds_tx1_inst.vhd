	component lvds_tx1 is
		port (
			ext_coreclock : in  std_logic                     := 'X';             -- export
			ext_fclk      : in  std_logic                     := 'X';             -- export
			ext_loaden    : in  std_logic                     := 'X';             -- export
			tx_coreclock  : out std_logic;                                        -- export
			tx_in         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			tx_out        : out std_logic_vector(3 downto 0);                     -- export
			tx_outclock   : out std_logic                                         -- export
		);
	end component lvds_tx1;

	u0 : component lvds_tx1
		port map (
			ext_coreclock => CONNECTED_TO_ext_coreclock, -- ext_coreclock.export
			ext_fclk      => CONNECTED_TO_ext_fclk,      --      ext_fclk.export
			ext_loaden    => CONNECTED_TO_ext_loaden,    --    ext_loaden.export
			tx_coreclock  => CONNECTED_TO_tx_coreclock,  --  tx_coreclock.export
			tx_in         => CONNECTED_TO_tx_in,         --         tx_in.export
			tx_out        => CONNECTED_TO_tx_out,        --        tx_out.export
			tx_outclock   => CONNECTED_TO_tx_outclock    --   tx_outclock.export
		);

