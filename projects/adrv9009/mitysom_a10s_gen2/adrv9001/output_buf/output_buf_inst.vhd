	component output_buf is
		port (
			din       : in  std_logic_vector(0 downto 0) := (others => 'X'); -- export
			pad_out   : out std_logic_vector(0 downto 0);                    -- export
			pad_out_b : out std_logic_vector(0 downto 0)                     -- export
		);
	end component output_buf;

	u0 : component output_buf
		port map (
			din       => CONNECTED_TO_din,       --       din.export
			pad_out   => CONNECTED_TO_pad_out,   --   pad_out.export
			pad_out_b => CONNECTED_TO_pad_out_b  -- pad_out_b.export
		);

