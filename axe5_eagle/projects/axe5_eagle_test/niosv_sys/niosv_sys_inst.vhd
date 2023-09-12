	component niosv_sys is
		port (
			axi_bridge_m0_awid    : out std_logic_vector(4 downto 0);                     -- awid
			axi_bridge_m0_awaddr  : out std_logic_vector(30 downto 0);                    -- awaddr
			axi_bridge_m0_awlen   : out std_logic_vector(7 downto 0);                     -- awlen
			axi_bridge_m0_awsize  : out std_logic_vector(2 downto 0);                     -- awsize
			axi_bridge_m0_awburst : out std_logic_vector(1 downto 0);                     -- awburst
			axi_bridge_m0_awlock  : out std_logic_vector(0 downto 0);                     -- awlock
			axi_bridge_m0_awcache : out std_logic_vector(3 downto 0);                     -- awcache
			axi_bridge_m0_awprot  : out std_logic_vector(2 downto 0);                     -- awprot
			axi_bridge_m0_awvalid : out std_logic;                                        -- awvalid
			axi_bridge_m0_awready : in  std_logic                     := 'X';             -- awready
			axi_bridge_m0_wdata   : out std_logic_vector(31 downto 0);                    -- wdata
			axi_bridge_m0_wstrb   : out std_logic_vector(3 downto 0);                     -- wstrb
			axi_bridge_m0_wlast   : out std_logic;                                        -- wlast
			axi_bridge_m0_wvalid  : out std_logic;                                        -- wvalid
			axi_bridge_m0_wready  : in  std_logic                     := 'X';             -- wready
			axi_bridge_m0_bid     : in  std_logic_vector(4 downto 0)  := (others => 'X'); -- bid
			axi_bridge_m0_bresp   : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- bresp
			axi_bridge_m0_bvalid  : in  std_logic                     := 'X';             -- bvalid
			axi_bridge_m0_bready  : out std_logic;                                        -- bready
			axi_bridge_m0_arid    : out std_logic_vector(4 downto 0);                     -- arid
			axi_bridge_m0_araddr  : out std_logic_vector(30 downto 0);                    -- araddr
			axi_bridge_m0_arlen   : out std_logic_vector(7 downto 0);                     -- arlen
			axi_bridge_m0_arsize  : out std_logic_vector(2 downto 0);                     -- arsize
			axi_bridge_m0_arburst : out std_logic_vector(1 downto 0);                     -- arburst
			axi_bridge_m0_arlock  : out std_logic_vector(0 downto 0);                     -- arlock
			axi_bridge_m0_arcache : out std_logic_vector(3 downto 0);                     -- arcache
			axi_bridge_m0_arprot  : out std_logic_vector(2 downto 0);                     -- arprot
			axi_bridge_m0_arvalid : out std_logic;                                        -- arvalid
			axi_bridge_m0_arready : in  std_logic                     := 'X';             -- arready
			axi_bridge_m0_rid     : in  std_logic_vector(4 downto 0)  := (others => 'X'); -- rid
			axi_bridge_m0_rdata   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- rdata
			axi_bridge_m0_rresp   : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- rresp
			axi_bridge_m0_rlast   : in  std_logic                     := 'X';             -- rlast
			axi_bridge_m0_rvalid  : in  std_logic                     := 'X';             -- rvalid
			axi_bridge_m0_rready  : out std_logic;                                        -- rready
			clk_100m_clk          : in  std_logic                     := 'X';             -- clk
			cruvi_ls_0_in_port    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			cruvi_ls_0_out_port   : out std_logic_vector(7 downto 0);                     -- out_port
			cruvi_ls_1_in_port    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			cruvi_ls_1_out_port   : out std_logic_vector(7 downto 0);                     -- out_port
			fpga_dipsw_export     : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			fpga_pb_export        : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			hdmi_i2c_sda_in       : in  std_logic                     := 'X';             -- sda_in
			hdmi_i2c_scl_in       : in  std_logic                     := 'X';             -- scl_in
			hdmi_i2c_sda_oe       : out std_logic;                                        -- sda_oe
			hdmi_i2c_scl_oe       : out std_logic;                                        -- scl_oe
			dbg_uart_RXD          : in  std_logic                     := 'X';             -- RXD
			dbg_uart_TXD          : out std_logic;                                        -- TXD
			reset_in_reset        : in  std_logic                     := 'X';             -- reset
			rgb_led0_export       : out std_logic_vector(2 downto 0);                     -- export
			rgb_led1_export       : out std_logic_vector(2 downto 0);                     -- export
			rgb_led2_export       : out std_logic_vector(2 downto 0);                     -- export
			rgb_led3_export       : out std_logic_vector(2 downto 0)                      -- export
		);
	end component niosv_sys;

	u0 : component niosv_sys
		port map (
			axi_bridge_m0_awid    => CONNECTED_TO_axi_bridge_m0_awid,    -- axi_bridge_m0.awid
			axi_bridge_m0_awaddr  => CONNECTED_TO_axi_bridge_m0_awaddr,  --              .awaddr
			axi_bridge_m0_awlen   => CONNECTED_TO_axi_bridge_m0_awlen,   --              .awlen
			axi_bridge_m0_awsize  => CONNECTED_TO_axi_bridge_m0_awsize,  --              .awsize
			axi_bridge_m0_awburst => CONNECTED_TO_axi_bridge_m0_awburst, --              .awburst
			axi_bridge_m0_awlock  => CONNECTED_TO_axi_bridge_m0_awlock,  --              .awlock
			axi_bridge_m0_awcache => CONNECTED_TO_axi_bridge_m0_awcache, --              .awcache
			axi_bridge_m0_awprot  => CONNECTED_TO_axi_bridge_m0_awprot,  --              .awprot
			axi_bridge_m0_awvalid => CONNECTED_TO_axi_bridge_m0_awvalid, --              .awvalid
			axi_bridge_m0_awready => CONNECTED_TO_axi_bridge_m0_awready, --              .awready
			axi_bridge_m0_wdata   => CONNECTED_TO_axi_bridge_m0_wdata,   --              .wdata
			axi_bridge_m0_wstrb   => CONNECTED_TO_axi_bridge_m0_wstrb,   --              .wstrb
			axi_bridge_m0_wlast   => CONNECTED_TO_axi_bridge_m0_wlast,   --              .wlast
			axi_bridge_m0_wvalid  => CONNECTED_TO_axi_bridge_m0_wvalid,  --              .wvalid
			axi_bridge_m0_wready  => CONNECTED_TO_axi_bridge_m0_wready,  --              .wready
			axi_bridge_m0_bid     => CONNECTED_TO_axi_bridge_m0_bid,     --              .bid
			axi_bridge_m0_bresp   => CONNECTED_TO_axi_bridge_m0_bresp,   --              .bresp
			axi_bridge_m0_bvalid  => CONNECTED_TO_axi_bridge_m0_bvalid,  --              .bvalid
			axi_bridge_m0_bready  => CONNECTED_TO_axi_bridge_m0_bready,  --              .bready
			axi_bridge_m0_arid    => CONNECTED_TO_axi_bridge_m0_arid,    --              .arid
			axi_bridge_m0_araddr  => CONNECTED_TO_axi_bridge_m0_araddr,  --              .araddr
			axi_bridge_m0_arlen   => CONNECTED_TO_axi_bridge_m0_arlen,   --              .arlen
			axi_bridge_m0_arsize  => CONNECTED_TO_axi_bridge_m0_arsize,  --              .arsize
			axi_bridge_m0_arburst => CONNECTED_TO_axi_bridge_m0_arburst, --              .arburst
			axi_bridge_m0_arlock  => CONNECTED_TO_axi_bridge_m0_arlock,  --              .arlock
			axi_bridge_m0_arcache => CONNECTED_TO_axi_bridge_m0_arcache, --              .arcache
			axi_bridge_m0_arprot  => CONNECTED_TO_axi_bridge_m0_arprot,  --              .arprot
			axi_bridge_m0_arvalid => CONNECTED_TO_axi_bridge_m0_arvalid, --              .arvalid
			axi_bridge_m0_arready => CONNECTED_TO_axi_bridge_m0_arready, --              .arready
			axi_bridge_m0_rid     => CONNECTED_TO_axi_bridge_m0_rid,     --              .rid
			axi_bridge_m0_rdata   => CONNECTED_TO_axi_bridge_m0_rdata,   --              .rdata
			axi_bridge_m0_rresp   => CONNECTED_TO_axi_bridge_m0_rresp,   --              .rresp
			axi_bridge_m0_rlast   => CONNECTED_TO_axi_bridge_m0_rlast,   --              .rlast
			axi_bridge_m0_rvalid  => CONNECTED_TO_axi_bridge_m0_rvalid,  --              .rvalid
			axi_bridge_m0_rready  => CONNECTED_TO_axi_bridge_m0_rready,  --              .rready
			clk_100m_clk          => CONNECTED_TO_clk_100m_clk,          --      clk_100m.clk
			cruvi_ls_0_in_port    => CONNECTED_TO_cruvi_ls_0_in_port,    --    cruvi_ls_0.in_port
			cruvi_ls_0_out_port   => CONNECTED_TO_cruvi_ls_0_out_port,   --              .out_port
			cruvi_ls_1_in_port    => CONNECTED_TO_cruvi_ls_1_in_port,    --    cruvi_ls_1.in_port
			cruvi_ls_1_out_port   => CONNECTED_TO_cruvi_ls_1_out_port,   --              .out_port
			fpga_dipsw_export     => CONNECTED_TO_fpga_dipsw_export,     --    fpga_dipsw.export
			fpga_pb_export        => CONNECTED_TO_fpga_pb_export,        --       fpga_pb.export
			hdmi_i2c_sda_in       => CONNECTED_TO_hdmi_i2c_sda_in,       --      hdmi_i2c.sda_in
			hdmi_i2c_scl_in       => CONNECTED_TO_hdmi_i2c_scl_in,       --              .scl_in
			hdmi_i2c_sda_oe       => CONNECTED_TO_hdmi_i2c_sda_oe,       --              .sda_oe
			hdmi_i2c_scl_oe       => CONNECTED_TO_hdmi_i2c_scl_oe,       --              .scl_oe
			dbg_uart_RXD          => CONNECTED_TO_dbg_uart_RXD,          --      dbg_uart.RXD
			dbg_uart_TXD          => CONNECTED_TO_dbg_uart_TXD,          --              .TXD
			reset_in_reset        => CONNECTED_TO_reset_in_reset,        --      reset_in.reset
			rgb_led0_export       => CONNECTED_TO_rgb_led0_export,       --      rgb_led0.export
			rgb_led1_export       => CONNECTED_TO_rgb_led1_export,       --      rgb_led1.export
			rgb_led2_export       => CONNECTED_TO_rgb_led2_export,       --      rgb_led2.export
			rgb_led3_export       => CONNECTED_TO_rgb_led3_export        --      rgb_led3.export
		);

