	component nios_system is
		port (
			clk_clk                  : in    std_logic                     := 'X';             -- clk
			is_new_game_start_export : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			keycode_export           : out   std_logic_vector(31 downto 0);                    -- export
			keycode0_export          : out   std_logic_vector(31 downto 0);                    -- export
			keycode1_export          : out   std_logic_vector(31 downto 0);                    -- export
			keycode2_export          : out   std_logic_vector(31 downto 0);                    -- export
			otg_hpi_address_export   : out   std_logic_vector(1 downto 0);                     -- export
			otg_hpi_cs_export        : out   std_logic;                                        -- export
			otg_hpi_data_in_port     : in    std_logic_vector(15 downto 0) := (others => 'X'); -- in_port
			otg_hpi_data_out_port    : out   std_logic_vector(15 downto 0);                    -- out_port
			otg_hpi_r_export         : out   std_logic;                                        -- export
			otg_hpi_reset_export     : out   std_logic;                                        -- export
			otg_hpi_w_export         : out   std_logic;                                        -- export
			position0_export         : out   std_logic_vector(31 downto 0);                    -- export
			position1_export         : out   std_logic_vector(31 downto 0);                    -- export
			position10_export        : out   std_logic_vector(31 downto 0);                    -- export
			position11_export        : out   std_logic_vector(31 downto 0);                    -- export
			position12_export        : out   std_logic_vector(31 downto 0);                    -- export
			position13_export        : out   std_logic_vector(31 downto 0);                    -- export
			position14_export        : out   std_logic_vector(31 downto 0);                    -- export
			position15_export        : out   std_logic_vector(31 downto 0);                    -- export
			position16_export        : out   std_logic_vector(31 downto 0);                    -- export
			position17_export        : out   std_logic_vector(31 downto 0);                    -- export
			position18_export        : out   std_logic_vector(31 downto 0);                    -- export
			position19_export        : out   std_logic_vector(31 downto 0);                    -- export
			position2_export         : out   std_logic_vector(31 downto 0);                    -- export
			position20_export        : out   std_logic_vector(31 downto 0);                    -- export
			position3_export         : out   std_logic_vector(31 downto 0);                    -- export
			position4_export         : out   std_logic_vector(31 downto 0);                    -- export
			position5_export         : out   std_logic_vector(31 downto 0);                    -- export
			position6_export         : out   std_logic_vector(31 downto 0);                    -- export
			position7_export         : out   std_logic_vector(31 downto 0);                    -- export
			position8_export         : out   std_logic_vector(31 downto 0);                    -- export
			position9_export         : out   std_logic_vector(31 downto 0);                    -- export
			reset_reset_n            : in    std_logic                     := 'X';             -- reset_n
			sdram_clk_clk            : out   std_logic;                                        -- clk
			sdram_wire_addr          : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba            : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n         : out   std_logic;                                        -- cas_n
			sdram_wire_cke           : out   std_logic;                                        -- cke
			sdram_wire_cs_n          : out   std_logic;                                        -- cs_n
			sdram_wire_dq            : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm           : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_wire_ras_n         : out   std_logic;                                        -- ras_n
			sdram_wire_we_n          : out   std_logic;                                        -- we_n
			position21_export        : out   std_logic_vector(31 downto 0);                    -- export
			position22_export        : out   std_logic_vector(31 downto 0);                    -- export
			position23_export        : out   std_logic_vector(31 downto 0);                    -- export
			position24_export        : out   std_logic_vector(31 downto 0);                    -- export
			position25_export        : out   std_logic_vector(31 downto 0);                    -- export
			position26_export        : out   std_logic_vector(31 downto 0);                    -- export
			position27_export        : out   std_logic_vector(31 downto 0);                    -- export
			position28_export        : out   std_logic_vector(31 downto 0);                    -- export
			position29_export        : out   std_logic_vector(31 downto 0);                    -- export
			position30_export        : out   std_logic_vector(31 downto 0);                    -- export
			position31_export        : out   std_logic_vector(31 downto 0);                    -- export
			position32_export        : out   std_logic_vector(31 downto 0);                    -- export
			position33_export        : out   std_logic_vector(31 downto 0);                    -- export
			position34_export        : out   std_logic_vector(31 downto 0);                    -- export
			position35_export        : out   std_logic_vector(31 downto 0);                    -- export
			position36_export        : out   std_logic_vector(31 downto 0)                     -- export
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			clk_clk                  => CONNECTED_TO_clk_clk,                  --               clk.clk
			is_new_game_start_export => CONNECTED_TO_is_new_game_start_export, -- is_new_game_start.export
			keycode_export           => CONNECTED_TO_keycode_export,           --           keycode.export
			keycode0_export          => CONNECTED_TO_keycode0_export,          --          keycode0.export
			keycode1_export          => CONNECTED_TO_keycode1_export,          --          keycode1.export
			keycode2_export          => CONNECTED_TO_keycode2_export,          --          keycode2.export
			otg_hpi_address_export   => CONNECTED_TO_otg_hpi_address_export,   --   otg_hpi_address.export
			otg_hpi_cs_export        => CONNECTED_TO_otg_hpi_cs_export,        --        otg_hpi_cs.export
			otg_hpi_data_in_port     => CONNECTED_TO_otg_hpi_data_in_port,     --      otg_hpi_data.in_port
			otg_hpi_data_out_port    => CONNECTED_TO_otg_hpi_data_out_port,    --                  .out_port
			otg_hpi_r_export         => CONNECTED_TO_otg_hpi_r_export,         --         otg_hpi_r.export
			otg_hpi_reset_export     => CONNECTED_TO_otg_hpi_reset_export,     --     otg_hpi_reset.export
			otg_hpi_w_export         => CONNECTED_TO_otg_hpi_w_export,         --         otg_hpi_w.export
			position0_export         => CONNECTED_TO_position0_export,         --         position0.export
			position1_export         => CONNECTED_TO_position1_export,         --         position1.export
			position10_export        => CONNECTED_TO_position10_export,        --        position10.export
			position11_export        => CONNECTED_TO_position11_export,        --        position11.export
			position12_export        => CONNECTED_TO_position12_export,        --        position12.export
			position13_export        => CONNECTED_TO_position13_export,        --        position13.export
			position14_export        => CONNECTED_TO_position14_export,        --        position14.export
			position15_export        => CONNECTED_TO_position15_export,        --        position15.export
			position16_export        => CONNECTED_TO_position16_export,        --        position16.export
			position17_export        => CONNECTED_TO_position17_export,        --        position17.export
			position18_export        => CONNECTED_TO_position18_export,        --        position18.export
			position19_export        => CONNECTED_TO_position19_export,        --        position19.export
			position2_export         => CONNECTED_TO_position2_export,         --         position2.export
			position20_export        => CONNECTED_TO_position20_export,        --        position20.export
			position3_export         => CONNECTED_TO_position3_export,         --         position3.export
			position4_export         => CONNECTED_TO_position4_export,         --         position4.export
			position5_export         => CONNECTED_TO_position5_export,         --         position5.export
			position6_export         => CONNECTED_TO_position6_export,         --         position6.export
			position7_export         => CONNECTED_TO_position7_export,         --         position7.export
			position8_export         => CONNECTED_TO_position8_export,         --         position8.export
			position9_export         => CONNECTED_TO_position9_export,         --         position9.export
			reset_reset_n            => CONNECTED_TO_reset_reset_n,            --             reset.reset_n
			sdram_clk_clk            => CONNECTED_TO_sdram_clk_clk,            --         sdram_clk.clk
			sdram_wire_addr          => CONNECTED_TO_sdram_wire_addr,          --        sdram_wire.addr
			sdram_wire_ba            => CONNECTED_TO_sdram_wire_ba,            --                  .ba
			sdram_wire_cas_n         => CONNECTED_TO_sdram_wire_cas_n,         --                  .cas_n
			sdram_wire_cke           => CONNECTED_TO_sdram_wire_cke,           --                  .cke
			sdram_wire_cs_n          => CONNECTED_TO_sdram_wire_cs_n,          --                  .cs_n
			sdram_wire_dq            => CONNECTED_TO_sdram_wire_dq,            --                  .dq
			sdram_wire_dqm           => CONNECTED_TO_sdram_wire_dqm,           --                  .dqm
			sdram_wire_ras_n         => CONNECTED_TO_sdram_wire_ras_n,         --                  .ras_n
			sdram_wire_we_n          => CONNECTED_TO_sdram_wire_we_n,          --                  .we_n
			position21_export        => CONNECTED_TO_position21_export,        --        position21.export
			position22_export        => CONNECTED_TO_position22_export,        --        position22.export
			position23_export        => CONNECTED_TO_position23_export,        --        position23.export
			position24_export        => CONNECTED_TO_position24_export,        --        position24.export
			position25_export        => CONNECTED_TO_position25_export,        --        position25.export
			position26_export        => CONNECTED_TO_position26_export,        --        position26.export
			position27_export        => CONNECTED_TO_position27_export,        --        position27.export
			position28_export        => CONNECTED_TO_position28_export,        --        position28.export
			position29_export        => CONNECTED_TO_position29_export,        --        position29.export
			position30_export        => CONNECTED_TO_position30_export,        --        position30.export
			position31_export        => CONNECTED_TO_position31_export,        --        position31.export
			position32_export        => CONNECTED_TO_position32_export,        --        position32.export
			position33_export        => CONNECTED_TO_position33_export,        --        position33.export
			position34_export        => CONNECTED_TO_position34_export,        --        position34.export
			position35_export        => CONNECTED_TO_position35_export,        --        position35.export
			position36_export        => CONNECTED_TO_position36_export         --        position36.export
		);

