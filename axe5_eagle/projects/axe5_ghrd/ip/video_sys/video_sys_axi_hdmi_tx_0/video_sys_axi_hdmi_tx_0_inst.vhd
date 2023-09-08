	component video_sys_axi_hdmi_tx_0 is
		port (
			s_axi_aclk        : in  std_logic                     := 'X';             -- clk
			s_axi_awvalid     : in  std_logic                     := 'X';             -- awvalid
			s_axi_awaddr      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- awaddr
			s_axi_awprot      : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- awprot
			s_axi_awready     : out std_logic;                                        -- awready
			s_axi_wvalid      : in  std_logic                     := 'X';             -- wvalid
			s_axi_wdata       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- wdata
			s_axi_wstrb       : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- wstrb
			s_axi_wready      : out std_logic;                                        -- wready
			s_axi_bvalid      : out std_logic;                                        -- bvalid
			s_axi_bresp       : out std_logic_vector(1 downto 0);                     -- bresp
			s_axi_bready      : in  std_logic                     := 'X';             -- bready
			s_axi_arvalid     : in  std_logic                     := 'X';             -- arvalid
			s_axi_araddr      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- araddr
			s_axi_arprot      : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- arprot
			s_axi_arready     : out std_logic;                                        -- arready
			s_axi_rvalid      : out std_logic;                                        -- rvalid
			s_axi_rresp       : out std_logic_vector(1 downto 0);                     -- rresp
			s_axi_rdata       : out std_logic_vector(31 downto 0);                    -- rdata
			s_axi_rready      : in  std_logic                     := 'X';             -- rready
			hdmi_clk          : in  std_logic                     := 'X';             -- clk
			hdmi_out_clk      : out std_logic;                                        -- h_clk
			hdmi_16_hsync     : out std_logic;                                        -- h16_hsync
			hdmi_16_vsync     : out std_logic;                                        -- h16_vsync
			hdmi_16_data_e    : out std_logic;                                        -- h16_data_e
			hdmi_16_data      : out std_logic_vector(15 downto 0);                    -- h16_data
			hdmi_16_es_data   : out std_logic_vector(15 downto 0);                    -- h16_es_data
			hdmi_24_hsync     : out std_logic;                                        -- h24_hsync
			hdmi_24_vsync     : out std_logic;                                        -- h24_vsync
			hdmi_24_data_e    : out std_logic;                                        -- h24_data_e
			hdmi_24_data      : out std_logic_vector(23 downto 0);                    -- h24_data
			hdmi_36_hsync     : out std_logic;                                        -- h36_hsync
			hdmi_36_vsync     : out std_logic;                                        -- h36_vsync
			hdmi_36_data_e    : out std_logic;                                        -- h36_data_e
			hdmi_36_data      : out std_logic_vector(35 downto 0);                    -- h36_data
			vdma_clk          : in  std_logic                     := 'X';             -- clk
			s_axi_aresetn     : in  std_logic                     := 'X';             -- reset_n
			vdma_end_of_frame : in  std_logic                     := 'X';             -- tlast
			vdma_valid        : in  std_logic                     := 'X';             -- tvalid
			vdma_data         : in  std_logic_vector(63 downto 0) := (others => 'X'); -- tdata
			vdma_ready        : out std_logic                                         -- tready
		);
	end component video_sys_axi_hdmi_tx_0;

	u0 : component video_sys_axi_hdmi_tx_0
		port map (
			s_axi_aclk        => CONNECTED_TO_s_axi_aclk,        -- s_axi_clock.clk
			s_axi_awvalid     => CONNECTED_TO_s_axi_awvalid,     --       s_axi.awvalid
			s_axi_awaddr      => CONNECTED_TO_s_axi_awaddr,      --            .awaddr
			s_axi_awprot      => CONNECTED_TO_s_axi_awprot,      --            .awprot
			s_axi_awready     => CONNECTED_TO_s_axi_awready,     --            .awready
			s_axi_wvalid      => CONNECTED_TO_s_axi_wvalid,      --            .wvalid
			s_axi_wdata       => CONNECTED_TO_s_axi_wdata,       --            .wdata
			s_axi_wstrb       => CONNECTED_TO_s_axi_wstrb,       --            .wstrb
			s_axi_wready      => CONNECTED_TO_s_axi_wready,      --            .wready
			s_axi_bvalid      => CONNECTED_TO_s_axi_bvalid,      --            .bvalid
			s_axi_bresp       => CONNECTED_TO_s_axi_bresp,       --            .bresp
			s_axi_bready      => CONNECTED_TO_s_axi_bready,      --            .bready
			s_axi_arvalid     => CONNECTED_TO_s_axi_arvalid,     --            .arvalid
			s_axi_araddr      => CONNECTED_TO_s_axi_araddr,      --            .araddr
			s_axi_arprot      => CONNECTED_TO_s_axi_arprot,      --            .arprot
			s_axi_arready     => CONNECTED_TO_s_axi_arready,     --            .arready
			s_axi_rvalid      => CONNECTED_TO_s_axi_rvalid,      --            .rvalid
			s_axi_rresp       => CONNECTED_TO_s_axi_rresp,       --            .rresp
			s_axi_rdata       => CONNECTED_TO_s_axi_rdata,       --            .rdata
			s_axi_rready      => CONNECTED_TO_s_axi_rready,      --            .rready
			hdmi_clk          => CONNECTED_TO_hdmi_clk,          --  hdmi_clock.clk
			hdmi_out_clk      => CONNECTED_TO_hdmi_out_clk,      --     hdmi_if.h_clk
			hdmi_16_hsync     => CONNECTED_TO_hdmi_16_hsync,     --            .h16_hsync
			hdmi_16_vsync     => CONNECTED_TO_hdmi_16_vsync,     --            .h16_vsync
			hdmi_16_data_e    => CONNECTED_TO_hdmi_16_data_e,    --            .h16_data_e
			hdmi_16_data      => CONNECTED_TO_hdmi_16_data,      --            .h16_data
			hdmi_16_es_data   => CONNECTED_TO_hdmi_16_es_data,   --            .h16_es_data
			hdmi_24_hsync     => CONNECTED_TO_hdmi_24_hsync,     --            .h24_hsync
			hdmi_24_vsync     => CONNECTED_TO_hdmi_24_vsync,     --            .h24_vsync
			hdmi_24_data_e    => CONNECTED_TO_hdmi_24_data_e,    --            .h24_data_e
			hdmi_24_data      => CONNECTED_TO_hdmi_24_data,      --            .h24_data
			hdmi_36_hsync     => CONNECTED_TO_hdmi_36_hsync,     --            .h36_hsync
			hdmi_36_vsync     => CONNECTED_TO_hdmi_36_vsync,     --            .h36_vsync
			hdmi_36_data_e    => CONNECTED_TO_hdmi_36_data_e,    --            .h36_data_e
			hdmi_36_data      => CONNECTED_TO_hdmi_36_data,      --            .h36_data
			vdma_clk          => CONNECTED_TO_vdma_clk,          --  vdma_clock.clk
			s_axi_aresetn     => CONNECTED_TO_s_axi_aresetn,     --  vdma_reset.reset_n
			vdma_end_of_frame => CONNECTED_TO_vdma_end_of_frame, --     vdma_if.tlast
			vdma_valid        => CONNECTED_TO_vdma_valid,        --            .tvalid
			vdma_data         => CONNECTED_TO_vdma_data,         --            .tdata
			vdma_ready        => CONNECTED_TO_vdma_ready         --            .tready
		);

