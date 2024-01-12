	component peripheral_sys is
		port (
			clk_clk                               : in  std_logic                     := 'X';             -- clk
			dipsw_export                          : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			dipsw_irq_irq                         : out std_logic;                                        -- irq
			jtag_uart_irq_irq                     : out std_logic;                                        -- irq
			mm_peripheral_bridge_s0_waitrequest   : out std_logic;                                        -- waitrequest
			mm_peripheral_bridge_s0_readdata      : out std_logic_vector(31 downto 0);                    -- readdata
			mm_peripheral_bridge_s0_readdatavalid : out std_logic;                                        -- readdatavalid
			mm_peripheral_bridge_s0_burstcount    : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- burstcount
			mm_peripheral_bridge_s0_writedata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			mm_peripheral_bridge_s0_address       : in  std_logic_vector(23 downto 0) := (others => 'X'); -- address
			mm_peripheral_bridge_s0_write         : in  std_logic                     := 'X';             -- write
			mm_peripheral_bridge_s0_read          : in  std_logic                     := 'X';             -- read
			mm_peripheral_bridge_s0_byteenable    : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			mm_peripheral_bridge_s0_debugaccess   : in  std_logic                     := 'X';             -- debugaccess
			pb_export                             : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			pb_irq_irq                            : out std_logic;                                        -- irq
			reset_reset                           : in  std_logic                     := 'X';             -- reset
			rgb_led0_export                       : out std_logic_vector(2 downto 0);                     -- export
			rgb_led1_export                       : out std_logic_vector(2 downto 0);                     -- export
			rgb_led2_export                       : out std_logic_vector(2 downto 0);                     -- export
			rgb_led3_export                       : out std_logic_vector(2 downto 0);                     -- export
			usb_hub_rst_export                    : out std_logic                                         -- export
		);
	end component peripheral_sys;

	u0 : component peripheral_sys
		port map (
			clk_clk                               => CONNECTED_TO_clk_clk,                               --                     clk.clk
			dipsw_export                          => CONNECTED_TO_dipsw_export,                          --                   dipsw.export
			dipsw_irq_irq                         => CONNECTED_TO_dipsw_irq_irq,                         --               dipsw_irq.irq
			jtag_uart_irq_irq                     => CONNECTED_TO_jtag_uart_irq_irq,                     --           jtag_uart_irq.irq
			mm_peripheral_bridge_s0_waitrequest   => CONNECTED_TO_mm_peripheral_bridge_s0_waitrequest,   -- mm_peripheral_bridge_s0.waitrequest
			mm_peripheral_bridge_s0_readdata      => CONNECTED_TO_mm_peripheral_bridge_s0_readdata,      --                        .readdata
			mm_peripheral_bridge_s0_readdatavalid => CONNECTED_TO_mm_peripheral_bridge_s0_readdatavalid, --                        .readdatavalid
			mm_peripheral_bridge_s0_burstcount    => CONNECTED_TO_mm_peripheral_bridge_s0_burstcount,    --                        .burstcount
			mm_peripheral_bridge_s0_writedata     => CONNECTED_TO_mm_peripheral_bridge_s0_writedata,     --                        .writedata
			mm_peripheral_bridge_s0_address       => CONNECTED_TO_mm_peripheral_bridge_s0_address,       --                        .address
			mm_peripheral_bridge_s0_write         => CONNECTED_TO_mm_peripheral_bridge_s0_write,         --                        .write
			mm_peripheral_bridge_s0_read          => CONNECTED_TO_mm_peripheral_bridge_s0_read,          --                        .read
			mm_peripheral_bridge_s0_byteenable    => CONNECTED_TO_mm_peripheral_bridge_s0_byteenable,    --                        .byteenable
			mm_peripheral_bridge_s0_debugaccess   => CONNECTED_TO_mm_peripheral_bridge_s0_debugaccess,   --                        .debugaccess
			pb_export                             => CONNECTED_TO_pb_export,                             --                      pb.export
			pb_irq_irq                            => CONNECTED_TO_pb_irq_irq,                            --                  pb_irq.irq
			reset_reset                           => CONNECTED_TO_reset_reset,                           --                   reset.reset
			rgb_led0_export                       => CONNECTED_TO_rgb_led0_export,                       --                rgb_led0.export
			rgb_led1_export                       => CONNECTED_TO_rgb_led1_export,                       --                rgb_led1.export
			rgb_led2_export                       => CONNECTED_TO_rgb_led2_export,                       --                rgb_led2.export
			rgb_led3_export                       => CONNECTED_TO_rgb_led3_export,                       --                rgb_led3.export
			usb_hub_rst_export                    => CONNECTED_TO_usb_hub_rst_export                     --             usb_hub_rst.export
		);

