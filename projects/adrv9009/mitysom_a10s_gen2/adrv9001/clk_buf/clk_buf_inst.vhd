	component clk_buf is
		port (
			dout   : out std_logic_vector(0 downto 0);                    -- export
			pad_in : in  std_logic_vector(0 downto 0) := (others => 'X')  -- export
		);
	end component clk_buf;

	u0 : component clk_buf
		port map (
			dout   => CONNECTED_TO_dout,   --   dout.export
			pad_in => CONNECTED_TO_pad_in  -- pad_in.export
		);

