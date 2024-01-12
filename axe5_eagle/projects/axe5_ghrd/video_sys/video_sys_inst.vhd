	component video_sys is
		port (
			hdmi_h_clk                       : out std_logic;                                        -- h_clk
			hdmi_h16_hsync                   : out std_logic;                                        -- h16_hsync
			hdmi_h16_vsync                   : out std_logic;                                        -- h16_vsync
			hdmi_h16_data_e                  : out std_logic;                                        -- h16_data_e
			hdmi_h16_data                    : out std_logic_vector(15 downto 0);                    -- h16_data
			hdmi_h16_es_data                 : out std_logic_vector(15 downto 0);                    -- h16_es_data
			hdmi_h24_hsync                   : out std_logic;                                        -- h24_hsync
			hdmi_h24_vsync                   : out std_logic;                                        -- h24_vsync
			hdmi_h24_data_e                  : out std_logic;                                        -- h24_data_e
			hdmi_h24_data                    : out std_logic_vector(23 downto 0);                    -- h24_data
			hdmi_h36_hsync                   : out std_logic;                                        -- h36_hsync
			hdmi_h36_vsync                   : out std_logic;                                        -- h36_vsync
			hdmi_h36_data_e                  : out std_logic;                                        -- h36_data_e
			hdmi_h36_data                    : out std_logic_vector(35 downto 0);                    -- h36_data
			clk_clk                          : in  std_logic                     := 'X';             -- clk
			hdmi_dmac_irq                    : out std_logic;                                        -- irq
			hdmi_dmac_master_awvalid         : out std_logic;                                        -- awvalid
			hdmi_dmac_master_awaddr          : out std_logic_vector(31 downto 0);                    -- awaddr
			hdmi_dmac_master_awready         : in  std_logic                     := 'X';             -- awready
			hdmi_dmac_master_wvalid          : out std_logic;                                        -- wvalid
			hdmi_dmac_master_wdata           : out std_logic_vector(63 downto 0);                    -- wdata
			hdmi_dmac_master_wstrb           : out std_logic_vector(7 downto 0);                     -- wstrb
			hdmi_dmac_master_wready          : in  std_logic                     := 'X';             -- wready
			hdmi_dmac_master_bvalid          : in  std_logic                     := 'X';             -- bvalid
			hdmi_dmac_master_bresp           : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- bresp
			hdmi_dmac_master_bready          : out std_logic;                                        -- bready
			hdmi_dmac_master_arvalid         : out std_logic;                                        -- arvalid
			hdmi_dmac_master_araddr          : out std_logic_vector(31 downto 0);                    -- araddr
			hdmi_dmac_master_arready         : in  std_logic                     := 'X';             -- arready
			hdmi_dmac_master_rvalid          : in  std_logic                     := 'X';             -- rvalid
			hdmi_dmac_master_rresp           : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- rresp
			hdmi_dmac_master_rdata           : in  std_logic_vector(63 downto 0) := (others => 'X'); -- rdata
			hdmi_dmac_master_rready          : out std_logic;                                        -- rready
			hdmi_dmac_master_awlen           : out std_logic_vector(3 downto 0);                     -- awlen
			hdmi_dmac_master_awsize          : out std_logic_vector(2 downto 0);                     -- awsize
			hdmi_dmac_master_awburst         : out std_logic_vector(1 downto 0);                     -- awburst
			hdmi_dmac_master_awcache         : out std_logic_vector(3 downto 0);                     -- awcache
			hdmi_dmac_master_awprot          : out std_logic_vector(2 downto 0);                     -- awprot
			hdmi_dmac_master_wlast           : out std_logic;                                        -- wlast
			hdmi_dmac_master_arlen           : out std_logic_vector(3 downto 0);                     -- arlen
			hdmi_dmac_master_arsize          : out std_logic_vector(2 downto 0);                     -- arsize
			hdmi_dmac_master_arburst         : out std_logic_vector(1 downto 0);                     -- arburst
			hdmi_dmac_master_arcache         : out std_logic_vector(3 downto 0);                     -- arcache
			hdmi_dmac_master_arprot          : out std_logic_vector(2 downto 0);                     -- arprot
			hdmi_dmac_master_awid            : out std_logic;                                        -- awid
			hdmi_dmac_master_awlock          : out std_logic_vector(1 downto 0);                     -- awlock
			hdmi_dmac_master_wid             : out std_logic;                                        -- wid
			hdmi_dmac_master_arid            : out std_logic;                                        -- arid
			hdmi_dmac_master_arlock          : out std_logic_vector(1 downto 0);                     -- arlock
			hdmi_dmac_master_rid             : in  std_logic                     := 'X';             -- rid
			hdmi_dmac_master_bid             : in  std_logic                     := 'X';             -- bid
			hdmi_dmac_master_rlast           : in  std_logic                     := 'X';             -- rlast
			hdmi_pll_refclk_clk              : in  std_logic                     := 'X';             -- clk
			mm_video_bridge_s0_waitrequest   : out std_logic;                                        -- waitrequest
			mm_video_bridge_s0_readdata      : out std_logic_vector(31 downto 0);                    -- readdata
			mm_video_bridge_s0_readdatavalid : out std_logic;                                        -- readdatavalid
			mm_video_bridge_s0_burstcount    : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- burstcount
			mm_video_bridge_s0_writedata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			mm_video_bridge_s0_address       : in  std_logic_vector(23 downto 0) := (others => 'X'); -- address
			mm_video_bridge_s0_write         : in  std_logic                     := 'X';             -- write
			mm_video_bridge_s0_read          : in  std_logic                     := 'X';             -- read
			mm_video_bridge_s0_byteenable    : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			mm_video_bridge_s0_debugaccess   : in  std_logic                     := 'X';             -- debugaccess
			reset_reset                      : in  std_logic                     := 'X'              -- reset
		);
	end component video_sys;

	u0 : component video_sys
		port map (
			hdmi_h_clk                       => CONNECTED_TO_hdmi_h_clk,                       --               hdmi.h_clk
			hdmi_h16_hsync                   => CONNECTED_TO_hdmi_h16_hsync,                   --                   .h16_hsync
			hdmi_h16_vsync                   => CONNECTED_TO_hdmi_h16_vsync,                   --                   .h16_vsync
			hdmi_h16_data_e                  => CONNECTED_TO_hdmi_h16_data_e,                  --                   .h16_data_e
			hdmi_h16_data                    => CONNECTED_TO_hdmi_h16_data,                    --                   .h16_data
			hdmi_h16_es_data                 => CONNECTED_TO_hdmi_h16_es_data,                 --                   .h16_es_data
			hdmi_h24_hsync                   => CONNECTED_TO_hdmi_h24_hsync,                   --                   .h24_hsync
			hdmi_h24_vsync                   => CONNECTED_TO_hdmi_h24_vsync,                   --                   .h24_vsync
			hdmi_h24_data_e                  => CONNECTED_TO_hdmi_h24_data_e,                  --                   .h24_data_e
			hdmi_h24_data                    => CONNECTED_TO_hdmi_h24_data,                    --                   .h24_data
			hdmi_h36_hsync                   => CONNECTED_TO_hdmi_h36_hsync,                   --                   .h36_hsync
			hdmi_h36_vsync                   => CONNECTED_TO_hdmi_h36_vsync,                   --                   .h36_vsync
			hdmi_h36_data_e                  => CONNECTED_TO_hdmi_h36_data_e,                  --                   .h36_data_e
			hdmi_h36_data                    => CONNECTED_TO_hdmi_h36_data,                    --                   .h36_data
			clk_clk                          => CONNECTED_TO_clk_clk,                          --                clk.clk
			hdmi_dmac_irq                    => CONNECTED_TO_hdmi_dmac_irq,                    --          hdmi_dmac.irq
			hdmi_dmac_master_awvalid         => CONNECTED_TO_hdmi_dmac_master_awvalid,         --   hdmi_dmac_master.awvalid
			hdmi_dmac_master_awaddr          => CONNECTED_TO_hdmi_dmac_master_awaddr,          --                   .awaddr
			hdmi_dmac_master_awready         => CONNECTED_TO_hdmi_dmac_master_awready,         --                   .awready
			hdmi_dmac_master_wvalid          => CONNECTED_TO_hdmi_dmac_master_wvalid,          --                   .wvalid
			hdmi_dmac_master_wdata           => CONNECTED_TO_hdmi_dmac_master_wdata,           --                   .wdata
			hdmi_dmac_master_wstrb           => CONNECTED_TO_hdmi_dmac_master_wstrb,           --                   .wstrb
			hdmi_dmac_master_wready          => CONNECTED_TO_hdmi_dmac_master_wready,          --                   .wready
			hdmi_dmac_master_bvalid          => CONNECTED_TO_hdmi_dmac_master_bvalid,          --                   .bvalid
			hdmi_dmac_master_bresp           => CONNECTED_TO_hdmi_dmac_master_bresp,           --                   .bresp
			hdmi_dmac_master_bready          => CONNECTED_TO_hdmi_dmac_master_bready,          --                   .bready
			hdmi_dmac_master_arvalid         => CONNECTED_TO_hdmi_dmac_master_arvalid,         --                   .arvalid
			hdmi_dmac_master_araddr          => CONNECTED_TO_hdmi_dmac_master_araddr,          --                   .araddr
			hdmi_dmac_master_arready         => CONNECTED_TO_hdmi_dmac_master_arready,         --                   .arready
			hdmi_dmac_master_rvalid          => CONNECTED_TO_hdmi_dmac_master_rvalid,          --                   .rvalid
			hdmi_dmac_master_rresp           => CONNECTED_TO_hdmi_dmac_master_rresp,           --                   .rresp
			hdmi_dmac_master_rdata           => CONNECTED_TO_hdmi_dmac_master_rdata,           --                   .rdata
			hdmi_dmac_master_rready          => CONNECTED_TO_hdmi_dmac_master_rready,          --                   .rready
			hdmi_dmac_master_awlen           => CONNECTED_TO_hdmi_dmac_master_awlen,           --                   .awlen
			hdmi_dmac_master_awsize          => CONNECTED_TO_hdmi_dmac_master_awsize,          --                   .awsize
			hdmi_dmac_master_awburst         => CONNECTED_TO_hdmi_dmac_master_awburst,         --                   .awburst
			hdmi_dmac_master_awcache         => CONNECTED_TO_hdmi_dmac_master_awcache,         --                   .awcache
			hdmi_dmac_master_awprot          => CONNECTED_TO_hdmi_dmac_master_awprot,          --                   .awprot
			hdmi_dmac_master_wlast           => CONNECTED_TO_hdmi_dmac_master_wlast,           --                   .wlast
			hdmi_dmac_master_arlen           => CONNECTED_TO_hdmi_dmac_master_arlen,           --                   .arlen
			hdmi_dmac_master_arsize          => CONNECTED_TO_hdmi_dmac_master_arsize,          --                   .arsize
			hdmi_dmac_master_arburst         => CONNECTED_TO_hdmi_dmac_master_arburst,         --                   .arburst
			hdmi_dmac_master_arcache         => CONNECTED_TO_hdmi_dmac_master_arcache,         --                   .arcache
			hdmi_dmac_master_arprot          => CONNECTED_TO_hdmi_dmac_master_arprot,          --                   .arprot
			hdmi_dmac_master_awid            => CONNECTED_TO_hdmi_dmac_master_awid,            --                   .awid
			hdmi_dmac_master_awlock          => CONNECTED_TO_hdmi_dmac_master_awlock,          --                   .awlock
			hdmi_dmac_master_wid             => CONNECTED_TO_hdmi_dmac_master_wid,             --                   .wid
			hdmi_dmac_master_arid            => CONNECTED_TO_hdmi_dmac_master_arid,            --                   .arid
			hdmi_dmac_master_arlock          => CONNECTED_TO_hdmi_dmac_master_arlock,          --                   .arlock
			hdmi_dmac_master_rid             => CONNECTED_TO_hdmi_dmac_master_rid,             --                   .rid
			hdmi_dmac_master_bid             => CONNECTED_TO_hdmi_dmac_master_bid,             --                   .bid
			hdmi_dmac_master_rlast           => CONNECTED_TO_hdmi_dmac_master_rlast,           --                   .rlast
			hdmi_pll_refclk_clk              => CONNECTED_TO_hdmi_pll_refclk_clk,              --    hdmi_pll_refclk.clk
			mm_video_bridge_s0_waitrequest   => CONNECTED_TO_mm_video_bridge_s0_waitrequest,   -- mm_video_bridge_s0.waitrequest
			mm_video_bridge_s0_readdata      => CONNECTED_TO_mm_video_bridge_s0_readdata,      --                   .readdata
			mm_video_bridge_s0_readdatavalid => CONNECTED_TO_mm_video_bridge_s0_readdatavalid, --                   .readdatavalid
			mm_video_bridge_s0_burstcount    => CONNECTED_TO_mm_video_bridge_s0_burstcount,    --                   .burstcount
			mm_video_bridge_s0_writedata     => CONNECTED_TO_mm_video_bridge_s0_writedata,     --                   .writedata
			mm_video_bridge_s0_address       => CONNECTED_TO_mm_video_bridge_s0_address,       --                   .address
			mm_video_bridge_s0_write         => CONNECTED_TO_mm_video_bridge_s0_write,         --                   .write
			mm_video_bridge_s0_read          => CONNECTED_TO_mm_video_bridge_s0_read,          --                   .read
			mm_video_bridge_s0_byteenable    => CONNECTED_TO_mm_video_bridge_s0_byteenable,    --                   .byteenable
			mm_video_bridge_s0_debugaccess   => CONNECTED_TO_mm_video_bridge_s0_debugaccess,   --                   .debugaccess
			reset_reset                      => CONNECTED_TO_reset_reset                       --              reset.reset
		);

