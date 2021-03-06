module single(
								input Clk, 
								input logic [9:0] DrawX, DrawY,
								input logic Reset_h,
								
								
								input logic [19:0] target_score,
								
								input logic  player1_want_catch,
								input logic  player2_want_catch,
								input logic  left,
								input logic  right,
								input logic upper,
								input logic enter,
								input logic space,
								
								input logic display_random,
								input logic	display_single,
								input logic display_double,
								input logic display_competition,
								input logic bomb_num,
								input logic water_num,
								input logic display_shop,

								
								input logic  [9:0] goldx1,
								input logic  [9:0] goldy1,


								input logic  [9:0] goldx2,
								input logic  [9:0] goldy2,

								input logic  [9:0] goldx3,
								input logic  [9:0] goldy3,

								input logic  [9:0] goldx4,
								input logic  [9:0] goldy4,

								input logic  [9:0] goldx5,
								input logic  [9:0] goldy5,

								input logic  [9:0] goldx6,
								input logic  [9:0] goldy6,

								input logic  [9:0] goldx7,
								input logic  [9:0] goldy7,

								input logic  [9:0] goldx8,
								input logic  [9:0] goldy8,

								input logic  [9:0] goldx9,
								input logic  [9:0] goldy9,

								input logic  [9:0] goldx10,
								input logic  [9:0] goldy10,
	
	
	
	
	
	
	
	
	
								input logic  [9:0] goldx11,
								input logic  [9:0] goldy11,


								input logic  [9:0] goldx12,
								input logic  [9:0] goldy12,

								input logic  [9:0] goldx13,
								input logic  [9:0] goldy13,

								input logic  [9:0] goldx14,
								input logic  [9:0] goldy14,

								input logic  [9:0] goldx15,
								input logic  [9:0] goldy15,

								input logic  [9:0] goldx16,
								input logic  [9:0] goldy16,

								input logic  [9:0] goldx17,
								input logic  [9:0] goldy17,

								input logic  [9:0] goldx18,
								input logic  [9:0] goldy18,	
				
	

	
	
	
	
	
								output logic [7:0]  VGA_R,        
                        output logic [7:0]  VGA_G,       
                        output logic [7:0]  VGA_B,   
							
							
								output logic show_fail,
								output logic time_end2,
								output logic [5:0]timer,
								output logic is_bound,
//								output logic explode_text,
								output logic 	zhayao_used,
								output logic [9:0]test_dulp,
								output logic [2:0]state_out,
							
						
					
				
			
		
	


								output logic  is_catchx1,	
								output logic  is_catchx2,	
								output logic  is_catchx3,	
								output logic  is_catchx4,	
								output logic  is_catchx5,	
								output logic  is_catchx6,	
								output logic  is_catchx7,	
								output logic  is_catchx8,	
								output logic  is_catchx9,	
								output logic  is_catchx10,	
								output logic  is_catchx11,	
								output logic  is_catchx12,	
								output logic  is_catchx13,	
								output logic  is_catchx14,
								
								
								output logic [19:0] total_score,
								output logic [2:0] state_out_explode,
								output logic change_mode_signal_explode
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
);

logic time_end1;

always_ff @ (posedge Clk) begin

	
	time_end1<=time_end;
	time_end2<=time_end1;


end
	
	
	
	
	
	
	
	
	
	
	
///////////////////////////////////////////////////////////////////////
//test
assign is_catchx1=is_catch1;
assign is_catchx2=is_catch2;
assign is_catchx3=is_catch3;
assign is_catchx4=is_catch4;
assign is_catchx5=is_catch5;
assign is_catchx6=is_catch6;
assign is_catchx7=is_catch7;
assign is_catchx8=is_catch8;
assign is_catchx9=is_catch9;
assign is_catchx10=is_catch10;
assign is_catchx11=is_catch11;
assign is_catchx12=is_catch12;
assign is_catchx13=is_catch13;
assign is_catchx14=is_catch14;

	
	
	
	
	
///////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	
	
	
	
	
	
	
	

///////////////////////////////////////////////////////////////////////
//background 
logic[3:0] background_game_index;
logic is_background_game;
//assign explode_text=is_explode;
logic is_explode;
	 
background_game background_game_instance(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.is_background_game(is_background_game),
								.background_game_index(background_game_index)

);

///////////////////////////////////////////////////////////////////////

always_ff @(posedge Clk) begin
	if( display_single==0&&display_shop==1 && bomb_num==1) begin
		zhayao_used<=0;
		is_explode<=0;
	end
//	else if( display_single==0&& display_shop==1 && bomb_num==0)begin
//		zhayao_used<=1;
//		is_explode<=0;
//	end

	else if(display_single==1&& display_shop==0&& bomb_num==1 && upper==1 &&zhayao_used==0)begin
		is_explode<=1;
		zhayao_used<=1;
		
		end
	else begin
		is_explode<=0;
		zhayao_used<=zhayao_used;
end
end
////////////////////////
logic[3:0] zhayao_index;
logic is_zhayao; 
logic [18:0] read_address;
always_comb begin
	if(bomb_num==1&& zhayao_used==0 && DrawX>=410 &&DrawX<=419 &&DrawY>=50 &&DrawY<=69)
		is_zhayao=1;
	else
		is_zhayao=0;
	read_address=(DrawX-410)+(DrawY-50)*10;	
end

zhayao_rom rom(.read_address(read_address) ,.clk(Clk),    .zhayao_index(zhayao_index));

///////////////////////////////////////////////////////////////////////	 
//hook
logic is_back;
//logic is_bound;
logic [9:0] string_taily;
logic [9:0] string_tailx;



logic[3:0] hook_index;
logic is_hook;
logic is_string;
logic[3:0]	R_mode;	
hook hook_instance(

							.Clk(Clk), 
							.reset(Reset_h),
							 .DrawX(DrawX), 
							 .DrawY(DrawY),
							.is_hook(is_hook),
							.hook_index(hook_index),
							.is_string(is_string),
							.extend(player1_want_catch),
							.is_back(is_back),
							.is_bound(is_bound),
							.is_explode(is_explode),
							.string_taily(string_taily),
							.string_tailx(string_tailx),
							.R_mode(R_mode),
							.state_out(state_out),
							
							
							.is_catch1(is_catch1),
							.is_catch2(is_catch2),	
							.is_catch3(is_catch3),
							.is_catch4(is_catch4),
							.is_catch5(is_catch5),
							.is_catch6(is_catch6),
							.is_catch7(is_catch7),
							.is_catch8(is_catch8),
							.is_catch9(is_catch9),
							.is_catch10(is_catch10),
							

							
							.is_catch11(is_catch11),
							.is_catch12(is_catch12),	
							.is_catch13(is_catch13),
							.is_catch14(is_catch14),
//							.is_catch15(is_catch15),
//							.is_catch16(is_catch16),
//							.is_catch17(is_catch17),
//							.is_catch18(is_catch18),

			

			
							.destroy1(destroy_big_gold_instance1),
							.destroy2(destroy_big_gold_instance2),
							.destroy3(destroy_big_gold_instance3),
							.destroy4(destroy_big_gold_instance4),
							.destroy5(destroy_big_gold_instance5),
							.destroy6(destroy_big_gold_instance6),
							.destroy7(destroy_big_gold_instance7),
							.destroy8(destroy_big_gold_instance8),
							.destroy9(destroy_big_gold_instance9),
							.destroy10(destroy_big_gold_instance10),
							
							
							

							.destroy11(destroy_big_gold_instance11),
							.destroy12(destroy_big_gold_instance12),
							.destroy13(destroy_big_gold_instance13),
							.destroy14(destroy_big_gold_instance14),
//							.destroy15(destroy_big_gold_instance15),
//							.destroy16(destroy_big_gold_instance16),
//							.destroy17(destroy_big_gold_instance17),
//							.destroy18(destroy_big_gold_instance18),						
							
							
							
							
							
							.test_dulp(test_dulp),
							.display_random(display_random)
						

);
///////////////////////////////////////////////////////////////////////	 







///////////////////////////////////////////////////////////////////////
//big_gold_instance1 
logic is_catch1;
logic destroy_big_gold_instance1;
	 
logic[3:0] big_gold_index1;
logic is_big_gold1;

big_gold big_gold_instance1(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx1),
								.goldy(goldy1),
								.is_big_gold(is_big_gold1),
								.big_gold_index(big_gold_index1),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance1),
								.is_catch(is_catch1),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);

///////////////////////////////////////////////////////////////////////





///////////////////////////////////////////////////////////////////////
//big_gold_instance2 
logic is_catch2;
logic destroy_big_gold_instance2;
	 
logic[3:0] big_gold_index2;
logic is_big_gold2;


big_gold big_gold_instance2(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx2),
								.goldy(goldy2),
								.is_big_gold(is_big_gold2),
								.big_gold_index(big_gold_index2),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance2),
								.is_catch(is_catch2),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);


///////////////////////////////////////////////////////////////////////




///////////////////////////////////////////////////////////////////////
//middle_gold_instance3
logic is_catch3;
logic destroy_big_gold_instance3;
	 
logic[3:0] big_gold_index3;
logic is_big_gold3;


middle_gold big_gold_instance3(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx3),
								.goldy(goldy3),
								.is_big_gold(is_big_gold3),
								.big_gold_index(big_gold_index3),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance3),
								.is_catch(is_catch3),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);


///////////////////////////////////////////////////////////////////////




///////////////////////////////////////////////////////////////////////
//middle_gold_instance4
logic is_catch4;
logic destroy_big_gold_instance4;
	 
logic[3:0] big_gold_index4;
logic is_big_gold4;


middle_gold big_gold_instance4(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx4),
								.goldy(goldy4),
								.is_big_gold(is_big_gold4),
								.big_gold_index(big_gold_index4),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance4),
								.is_catch(is_catch4),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);


///////////////////////////////////////////////////////////////////////






///////////////////////////////////////////////////////////////////////
//small_gold_instance5
logic is_catch5;
logic destroy_big_gold_instance5;
	 
logic[3:0] big_gold_index5;
logic is_big_gold5;


small_gold big_gold_instance5(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx5),
								.goldy(goldy5),
								.is_big_gold(is_big_gold5),
								.big_gold_index(big_gold_index5),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance5),
								.is_catch(is_catch5),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);


///////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////
//small_gold_instance6
logic is_catch6;
logic destroy_big_gold_instance6;
	 
logic[3:0] big_gold_index6;
logic is_big_gold6;


small_gold big_gold_instance6(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx6),
								.goldy(goldy6),
								.is_big_gold(is_big_gold6),
								.big_gold_index(big_gold_index6),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance6),
								.is_catch(is_catch6),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);

///////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////
//bigstone_instance7
logic is_catch7;
logic destroy_big_gold_instance7;
	 
logic[3:0] big_gold_index7;
logic is_big_gold7;


bigstone big_gold_instance7(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx7),
								.goldy(goldy7),
								.is_big_gold(is_big_gold7),
								.big_gold_index(big_gold_index7),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance7),
								.is_catch(is_catch7),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);

///////////////////////////////////////////////////////////////////////







///////////////////////////////////////////////////////////////////////
//bigstone_instance8
logic is_catch8;
logic destroy_big_gold_instance8;
	 
logic[3:0] big_gold_index8;
logic is_big_gold8;


bigstone big_gold_instance8(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx8),
								.goldy(goldy8),
								.is_big_gold(is_big_gold8),
								.big_gold_index(big_gold_index8),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance8),
								.is_catch(is_catch8),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);

///////////////////////////////////////////////////////////////////////





///////////////////////////////////////////////////////////////////////
//daimond_instance9
logic is_catch9;
logic destroy_big_gold_instance9;
	 
logic[3:0] big_gold_index9;
logic is_big_gold9;


daimond big_gold_instance9(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx9),
								.goldy(goldy9),
								.is_big_gold(is_big_gold9),
								.big_gold_index(big_gold_index9),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance9),
								.is_catch(is_catch9),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);

///////////////////////////////////////////////////////////////////////















///////////////////////////////////////////////////////////////////////
//small_stone_instance10
logic is_catch10;
logic destroy_big_gold_instance10;
	 
logic[3:0] big_gold_index10;
logic is_big_gold10;


smallstone big_gold_instance10(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx10),
								.goldy(goldy10),
								.is_big_gold(is_big_gold10),
								.big_gold_index(big_gold_index10),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance10),
								.is_catch(is_catch10),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);

///////////////////////////////////////////////////////////////////////


















///////////////////////////////////////////////////////////////////////
//bigstone_instance11
logic is_catch11;
logic destroy_big_gold_instance11;
	 
logic[3:0] big_gold_index11;
logic is_big_gold11;


bigstone big_gold_instance11(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx11),
								.goldy(goldy11),
								.is_big_gold(is_big_gold11),
								.big_gold_index(big_gold_index11),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance11),
								.is_catch(is_catch11),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);

///////////////////////////////////////////////////////////////////////






///////////////////////////////////////////////////////////////////////
//bigstone_instance12
logic is_catch12;
logic destroy_big_gold_instance12;
	 
logic[3:0] big_gold_index12;
logic is_big_gold12;


bigstone big_gold_instance12(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx12),
								.goldy(goldy12),
								.is_big_gold(is_big_gold12),
								.big_gold_index(big_gold_index12),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance12),
								.is_catch(is_catch12),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);

///////////////////////////////////////////////////////////////////////






///////////////////////////////////////////////////////////////////////
//small_stone_instance13
logic is_catch13;
logic destroy_big_gold_instance13;
	 
logic[3:0] big_gold_index13;
logic is_big_gold13;


smallstone big_gold_instance13(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx13),
								.goldy(goldy13),
								.is_big_gold(is_big_gold13),
								.big_gold_index(big_gold_index13),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance13),
								.is_catch(is_catch13),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);

///////////////////////////////////////////////////////////////////////






///////////////////////////////////////////////////////////////////////
//small_stone_instance14
logic is_catch14;
logic destroy_big_gold_instance14;
	 
logic[3:0] big_gold_index14;
logic is_big_gold14;


smallstone big_gold_instance14(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx14),
								.goldy(goldy14),
								.is_big_gold(is_big_gold14),
								.big_gold_index(big_gold_index14),
								.tailx(string_tailx),
								.taily(string_taily),
								.reset(Reset_h),
								.R_mode(R_mode),
								.state_out(state_out),
								.destroy(destroy_big_gold_instance14),
								.is_catch(is_catch14),
								.is_new_game_start(display_random),
								.is_explode(is_explode)
);

///////////////////////////////////////////////////////////////////////
















///////////////////////////////////////////////////////////////////////
//color_mapper

color_mapper color_instance(    
													.clk(Clk),
                                      .DrawX(DrawX), 
							                  .DrawY(DrawY),       
                                       .VGA_R(VGA_R), 
							                  .VGA_G(VGA_G), 
							                  .VGA_B(VGA_B),
													
													
													.is_background_game(is_background_game),
													.background_game_index(background_game_index),
													
													.is_zhayao(is_zhayao),
													.zhayao_index(zhayao_index),
												
													
													
													.is_big_gold1(is_big_gold1),
													.big_gold_index1(big_gold_index1),
													
													
													.is_big_gold2(is_big_gold2),
													.big_gold_index2(big_gold_index2),
													
													
													.is_big_gold3(is_big_gold3),
													.big_gold_index3(big_gold_index3),
													
													
													.is_big_gold4(is_big_gold4),
													.big_gold_index4(big_gold_index4),
													
													
													.is_big_gold5(is_big_gold5),
													.big_gold_index5(big_gold_index5),
													
													
													.is_big_gold6(is_big_gold6),
													.big_gold_index6(big_gold_index6),
													
													
													.is_big_gold7(is_big_gold7),
													.big_gold_index7(big_gold_index7),
													
													
													.is_big_gold8(is_big_gold8),
													.big_gold_index8(big_gold_index8),
													
													
													.is_big_gold9(is_big_gold9),
													.big_gold_index9(big_gold_index9),
													
													
													.is_big_gold10(is_big_gold10),
													.big_gold_index10(big_gold_index10),
													
													
				
				
				
				
				
				
				
				
				
				
				
				
				
				
													
													.is_big_gold11(is_big_gold11),
													.big_gold_index11(big_gold_index11),
													
													
													.is_big_gold12(is_big_gold12),
													.big_gold_index12(big_gold_index12),
													
													
													.is_big_gold13(is_big_gold13),
													.big_gold_index13(big_gold_index13),
													
													
													.is_big_gold14(is_big_gold14),
													.big_gold_index14(big_gold_index14),
													
													
//													.is_big_gold15(is_big_gold15),
//													.big_gold_index15(big_gold_index15),
//													
//													
//													.is_big_gold16(is_big_gold16),
//													.big_gold_index16(big_gold_index16),
//													
//													
//													.is_big_gold17(is_big_gold17),
//													.big_gold_index17(big_gold_index17),
//													
//													
//													.is_big_gold18(is_big_gold18),
//													.big_gold_index18(big_gold_index18),												
//													
//													
													
													
													
													
													
													
													
													
													.is_explode_show(is_explode_show),
													.explode_index(explode_index),
													
													
													
													
													
													.is_string(is_string),
													.is_hook(is_hook),
													.hook_index(hook_index),
													.is_score(is_score),
												
													
													.is_timer(is_timer)

													
											
                     );

///////////////////////////////////////////////////////////////////////
















////////////////////////////////////////////////////////////////  
//timer variable
logic is_timer;
logic time_end;

Timer Timer_instance(  .Clk(Clk),
					.DrawX(DrawX), 
					.DrawY(DrawY),
					.reset(Reset_h),
					.is_timer(is_timer),
					.time_end(time_end),
					.display_random(display_random),
					.timer(timer),
					.display_single(display_single),
					.display_double(display_double),
					.display_competition(display_competition)
					);	

 ////////////////////////////////////////////////////////////////   
 
 
 
 
 
 
 
 
 
 
 ///////////////////////////////////////////////////////////////////////
//score keeper 
logic is_score;
//logic show_fail;
//logic [19:0] total_score;


KeepSocre score_instace(
								.Clk(Clk), 
								.DrawX(DrawX), 
							   .DrawY(DrawY),
								.reset(Reset_h),
								.catch1(destroy_big_gold_instance1),
								.catch2(destroy_big_gold_instance2),
								.catch3(destroy_big_gold_instance3), 
								.catch4(destroy_big_gold_instance4), 
								.catch5(destroy_big_gold_instance5), 
								.catch6(destroy_big_gold_instance6), 
								.catch7(destroy_big_gold_instance7), 
								.catch8(destroy_big_gold_instance8), 
								.catch9(destroy_big_gold_instance9), 
								.catch10(destroy_big_gold_instance10), 
								.catch11(destroy_big_gold_instance11), 
								.catch12(destroy_big_gold_instance12), 
								.catch13(destroy_big_gold_instance13), 
								.catch14(destroy_big_gold_instance14),             
								.is_score(is_score),
								.is_explode(is_explode),
								.target_score(target_score),
								.total_score(total_score),
								.time_end(time_end),
								.show_fail(show_fail),
								.display_random(display_random),
								.state_out(state_out),
								.display_single(display_single)
);	 
///////////////////////////////////////////////////////////////////////







///////////////////////////////////////////////////////////////////////
//show_explode
logic is_explode_show;
logic[3:0] explode_index;
//logic [2:0] state_out_explode;
show_explode show_explode_instance(
								.Clk(Clk), 
								.reset(Reset_h),
								.DrawX(DrawX), 
							   .DrawY(DrawY),
								.taily(string_taily),
								.tailx(string_tailx),
								.is_explode(is_explode),
								.display_random(display_random),

									
								.is_explode_show(is_explode_show),
								.explode_index(explode_index),
								.state_out_explode(state_out_explode),
								.change_mode_signal(change_mode_signal_explode)

);
/////////////////////////////////////////////////////////////////////// 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
endmodule













module zhayao_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] zhayao_index
	

);







logic [3:0] memory[200];
initial
begin
	 $readmemh("sprite/zhayao2.txt", memory);
end



always_ff @ (posedge clk) begin
	
	zhayao_index<= memory[read_address];
end

endmodule
