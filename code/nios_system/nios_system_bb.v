
module nios_system (
	clk_clk,
	is_new_game_start_export,
	keycode_export,
	keycode0_export,
	keycode1_export,
	keycode2_export,
	otg_hpi_address_export,
	otg_hpi_cs_export,
	otg_hpi_data_in_port,
	otg_hpi_data_out_port,
	otg_hpi_r_export,
	otg_hpi_reset_export,
	otg_hpi_w_export,
	position0_export,
	position1_export,
	position10_export,
	position11_export,
	position12_export,
	position13_export,
	position14_export,
	position15_export,
	position16_export,
	position17_export,
	position18_export,
	position19_export,
	position2_export,
	position20_export,
	position3_export,
	position4_export,
	position5_export,
	position6_export,
	position7_export,
	position8_export,
	position9_export,
	reset_reset_n,
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	position21_export,
	position22_export,
	position23_export,
	position24_export,
	position25_export,
	position26_export,
	position27_export,
	position28_export,
	position29_export,
	position30_export,
	position31_export,
	position32_export,
	position33_export,
	position34_export,
	position35_export,
	position36_export);	

	input		clk_clk;
	input	[31:0]	is_new_game_start_export;
	output	[31:0]	keycode_export;
	output	[31:0]	keycode0_export;
	output	[31:0]	keycode1_export;
	output	[31:0]	keycode2_export;
	output	[1:0]	otg_hpi_address_export;
	output		otg_hpi_cs_export;
	input	[15:0]	otg_hpi_data_in_port;
	output	[15:0]	otg_hpi_data_out_port;
	output		otg_hpi_r_export;
	output		otg_hpi_reset_export;
	output		otg_hpi_w_export;
	output	[31:0]	position0_export;
	output	[31:0]	position1_export;
	output	[31:0]	position10_export;
	output	[31:0]	position11_export;
	output	[31:0]	position12_export;
	output	[31:0]	position13_export;
	output	[31:0]	position14_export;
	output	[31:0]	position15_export;
	output	[31:0]	position16_export;
	output	[31:0]	position17_export;
	output	[31:0]	position18_export;
	output	[31:0]	position19_export;
	output	[31:0]	position2_export;
	output	[31:0]	position20_export;
	output	[31:0]	position3_export;
	output	[31:0]	position4_export;
	output	[31:0]	position5_export;
	output	[31:0]	position6_export;
	output	[31:0]	position7_export;
	output	[31:0]	position8_export;
	output	[31:0]	position9_export;
	input		reset_reset_n;
	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[31:0]	sdram_wire_dq;
	output	[3:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	output	[31:0]	position21_export;
	output	[31:0]	position22_export;
	output	[31:0]	position23_export;
	output	[31:0]	position24_export;
	output	[31:0]	position25_export;
	output	[31:0]	position26_export;
	output	[31:0]	position27_export;
	output	[31:0]	position28_export;
	output	[31:0]	position29_export;
	output	[31:0]	position30_export;
	output	[31:0]	position31_export;
	output	[31:0]	position32_export;
	output	[31:0]	position33_export;
	output	[31:0]	position34_export;
	output	[31:0]	position35_export;
	output	[31:0]	position36_export;
endmodule
