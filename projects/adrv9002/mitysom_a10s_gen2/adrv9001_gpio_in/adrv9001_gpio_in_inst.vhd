	component adrv9001_gpio_in is
		port (
			ck     : in  std_logic                    := 'X';             -- export
			dout   : out std_logic_vector(1 downto 0);                    -- export
			pad_in : in  std_logic_vector(0 downto 0) := (others => 'X')  -- export
		);
	end component adrv9001_gpio_in;

	u0 : component adrv9001_gpio_in
		port map (
			ck     => CONNECTED_TO_ck,     --     ck.export
			dout   => CONNECTED_TO_dout,   --   dout.export
			pad_in => CONNECTED_TO_pad_in  -- pad_in.export
		);

