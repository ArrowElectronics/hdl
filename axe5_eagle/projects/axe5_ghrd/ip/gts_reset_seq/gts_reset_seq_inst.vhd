	component gts_reset_seq is
		port (
			o_src_rs_grant    : out std_logic_vector(0 downto 0);                    -- src_rs_grant
			i_src_rs_priority : in  std_logic_vector(0 downto 0) := (others => 'X'); -- src_rs_priority
			i_src_rs_req      : in  std_logic_vector(0 downto 0) := (others => 'X'); -- src_rs_req
			o_pma_cu_clk      : out std_logic_vector(0 downto 0)                     -- clk
		);
	end component gts_reset_seq;

	u0 : component gts_reset_seq
		port map (
			o_src_rs_grant    => CONNECTED_TO_o_src_rs_grant,    --         rsif.src_rs_grant
			i_src_rs_priority => CONNECTED_TO_i_src_rs_priority, --             .src_rs_priority
			i_src_rs_req      => CONNECTED_TO_i_src_rs_req,      --             .src_rs_req
			o_pma_cu_clk      => CONNECTED_TO_o_pma_cu_clk       -- o_pma_cu_clk.clk
		);

