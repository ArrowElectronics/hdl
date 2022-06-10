	component adrv9001_gpio_out is
		port (
			din     : in  std_logic_vector(1 downto 0) := (others => 'X'); -- export
			pad_out : out std_logic_vector(0 downto 0);                    -- export
			ck      : in  std_logic                    := 'X'              -- export
		);
	end component adrv9001_gpio_out;

	u0 : component adrv9001_gpio_out
		port map (
			din     => CONNECTED_TO_din,     --     din.export
			pad_out => CONNECTED_TO_pad_out, -- pad_out.export
			ck      => CONNECTED_TO_ck       --      ck.export
		);

