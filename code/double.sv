module double(
								input Clk, 
								input logic [9:0] DrawX, DrawY,
								input logic Reset_h,
								
								
								input logic [19:0] target_score,
								
								input logic  player1_want_catch,
								input logic  player2_want_catch,
								input logic  left,
								input logic  right,
								input logic upper, upper2,
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
								
								
								output logic [2:0]State_gold_out1,
								output logic [2:0]State_gold_out2,
								output logic [2:0] state_outr,
								output logic [2:0] state_outl,
								output logic is_exploder,is_explodel

//								output logic is_bound,
//								output logic explode_text,
//								output logic 	zhayao_used,
//								output logic [9:0]test_dulp,
//								output logic [2:0]state_out,
//							
						
					
				
			
		
	


//								output logic  is_catchx1,	
//								output logic  is_catchx2,	
//								output logic  is_catchx3,	
//								output logic  is_catchx4,	
//								output logic  is_catchx5,	
//								output logic  is_catchx6,	
//								output logic  is_catchx7,	
//								output logic  is_catchx8,	
//								output logic  is_catchx9,	
//								output logic  is_catchx10,	
//								output logic  is_catchx11,	
//								output logic  is_catchx12,	
//								output logic  is_catchx13,	
//								output logic  is_catchx14,
//								
								
//								output logic [19:0] total_score,
//								output logic [2:0] state_out_explode,
//								output logic change_mode_signal_explode
//								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
);

logic time_end1;

always_ff @ (posedge Clk) begin

	
	time_end1<=time_end;
	time_end2<=time_end1;


end
	
	
	
	
	
	
	
	
	
	
	
///////////////////////////////////////////////////////////////////////
//test
//assign is_catchx1=is_catch1;
//assign is_catchx2=is_catch2;
//assign is_catchx3=is_catch3;
//assign is_catchx4=is_catch4;
//assign is_catchx5=is_catch5;
//assign is_catchx6=is_catch6;
//assign is_catchx7=is_catch7;
//assign is_catchx8=is_catch8;
//assign is_catchx9=is_catch9;
//assign is_catchx10=is_catch10;
//assign is_catchx11=is_catch11;
//assign is_catchx12=is_catch12;
//assign is_catchx13=is_catch13;
//assign is_catchx14=is_catch14;

	
	
	
	
	
///////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	
	
	
	
	
	
	
	

///////////////////////////////////////////////////////////////////////
//background  modified
logic is_bgdouble;
logic[3:0] bgdouble_index,player1_index,player2_index;
logic is_player1,is_player2;
						

background_game_double background_game_double_instance(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.is_bgdouble(is_bgdouble),
								.bgdouble_index(bgdouble_index),
								.player1_index(player1_index),
								.player2_index(player2_index),
								.is_player1(is_player1),
								.is_player2(is_player2),
						




);



///////////////////////////////////////////////////////////////////////
//
//logic is_exploder,is_explodel;
//logic zhayao_used;
//always_ff @(posedge Clk) begin
//	if( display_double==0&&display_shop==1 && bomb_num==1) begin
//		zhayao_used<=0;
//		is_exploder<=0;		
//		is_explodel<=0;
//	end
////	else if( display_single==0&& display_shop==1 && bomb_num==0)begin
////		zhayao_used<=1;
////		is_explode<=0;
////	end
//
//	else if(display_double==1&& display_shop==0&& bomb_num==1 && upper==1 &&zhayao_used==0)begin
//		is_explodel<=1;
//		zhayao_used<=1;
//		is_exploder<=0;
//		end
//	
//	else if(display_double==1&& display_shop==0&& bomb_num==1 && upper2==1 &&zhayao_used==0)begin
//		is_explodel<=0;
//		zhayao_used<=1;
//		is_exploder<=1;
//		end
//	else begin
//		is_explodel<=0;
//		zhayao_used<=zhayao_used;
//		is_exploder<=0;
//end
//end


//////////////////////////
//logic[3:0] zhayao_index;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//logic is_zhayao; 
//logic [18:0] read_address;
//always_comb begin
//	if(bomb_num==1&& zhayao_used==0 && DrawX>=410 &&DrawX<=419 &&DrawY>=50 &&DrawY<=69)
//		is_zhayao=1;
//	else
//		is_zhayao=0;
//	read_address=(DrawX-410)+(DrawY-50)*10;	
//end
//
//zhayao_rom rom(.read_address(read_address) ,.clk(Clk),    .zhayao_index(zhayao_index));
//














///////////////////////////////////////////////////////////////////////	 
//hook_left modified
//logic is_back_left;
//logic is_bound;
logic [9:0] string_tailyl;
logic [9:0] string_tailxl;



logic[3:0] hook_indexl;
logic is_hookl;
logic is_stringl;
logic[3:0]	R_model;	
//logic [2:0] state_outl;
hook_left hook_left_instance(

							.Clk(Clk), 
							.reset(Reset_h),
							 .DrawX(DrawX), 
							 .DrawY(DrawY),
							.is_hook(is_hookl),
							.hook_index(hook_indexl),
							.is_string(is_stringl),
							.extend(player1_want_catch),
//							.is_back(is_backl),
//							.is_bound(is_bound),
							.is_explode(is_explodel),
							.string_taily(string_tailyl),
							.string_tailx(string_tailxl),
							.R_mode(R_model),
							.state_out(state_outl),
							
							
							.is_catch1(is_catch1l),
							.is_catch2(is_catch2l),	
							.is_catch3(is_catch3l),
							.is_catch4(is_catch4l),
							.is_catch5(is_catch5l),
							.is_catch6(is_catch6l),
							.is_catch7(is_catch7l),
							.is_catch8(is_catch8l),
							.is_catch9(is_catch9l),
							.is_catch10(is_catch10l),
							

							
							.is_catch11(is_catch11l),
							.is_catch12(is_catch12l),	
							.is_catch13(is_catch13l),
							.is_catch14(is_catch14l),
//							.is_catch15(is_catch15l),
//							.is_catch16(is_catch16l),
//							.is_catch17(is_catch17l),
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
							.destroy10(destroy_big_gold_instance),
							
							
							

							.destroy11(destroy_big_gold_instance11),
							.destroy12(destroy_big_gold_instance12),
							.destroy13(destroy_big_gold_instance13),
							.destroy14(destroy_big_gold_instance14),
//							.destroy15(destroy_big_gold_instance15),
//							.destroy16(destroy_big_gold_instance16),
//							.destroy17(destroy_big_gold_instance17),
//							.destroy18(destroy_big_gold_instance18),						
//							
							
							
						
							.display_random(display_random)
						

);
///////////////////////////////////////////////////////////////////////	 








///////////////////////////////////////////////////////////////////////	 
//hook_right modified

//logic is_bound;
logic [9:0] string_tailyr;
logic [9:0] string_tailxr;



logic[3:0] hook_indexr;
logic is_hookr;
logic is_stringr;
logic[3:0]	R_moder;	
//logic [2:0] state_outr;
hook_right hook_right_instance(

							.Clk(Clk), 
							.reset(Reset_h),
							 .DrawX(DrawX), 
							 .DrawY(DrawY),
							.is_hook(is_hookr),
							.hook_index(hook_indexr),
							.is_string(is_stringr),
							.extend(player2_want_catch),
							//.is_back(is_back_right),
//							.is_bound(is_bound),
							.is_explode(is_exploder),
							.string_taily(string_tailyr),
							.string_tailx(string_tailxr),
							.R_mode(R_moder),
							.state_out(state_outr),
							
							
							.is_catch1(is_catch1r),
							.is_catch2(is_catch2r),	
							.is_catch3(is_catch3r),
							.is_catch4(is_catch4r),
							.is_catch5(is_catch5r),
							.is_catch6(is_catch6r),
							.is_catch7(is_catch7r),
							.is_catch8(is_catch8r),
							.is_catch9(is_catch9r),
							.is_catch10(is_catch10r),
							

							
							.is_catch11(is_catch11r),
							.is_catch12(is_catch12r),	
							.is_catch13(is_catch13r),
							.is_catch14(is_catch14r),
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
							
							
							
							
//							
//							.test_dulp(test_dulp),
							.display_random(display_random)
						

);
///////////////////////////////////////////////////////////////////////	 




































///////////////////////////////////////////////////////////////////////
//big_gold_instance1 
logic is_catch1l,is_catch1r;
logic destroy_big_gold_instance1;
	 
logic[3:0] big_gold_index1;
logic is_big_gold1;
logic destroy1r,destroy1l;
big_gold_double big_gold_instance1(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx1),
								.goldy(goldy1),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold1),
								.big_gold_index(big_gold_index1),
								.destroy(destroy_big_gold_instance1),
								.destroyl(destroy1l),
								.destroyr(destroy1r),
								.is_catchl(is_catch1l),
								.is_catchr(is_catch1r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder),
								.State_gold_out(State_gold_out1)
);



///////////////////////////////////////////////////////////////////////





///////////////////////////////////////////////////////////////////////
//big_gold_instance2 
logic is_catch2l,is_catch2r;
logic destroy_big_gold_instance2;
	 
logic[3:0] big_gold_index2;
logic is_big_gold2;
logic destroy2r,destroy2l;
big_gold_double big_gold_instance2(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx2),
								.goldy(goldy2),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold2),
								.big_gold_index(big_gold_index2),
								.destroy(destroy_big_gold_instance2),
								.destroyl(destroy2l),
								.destroyr(destroy2r),
								.is_catchl(is_catch2l),
								.is_catchr(is_catch2r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder),
								.State_gold_out(State_gold_out2)
);




///////////////////////////////////////////////////////////////////////




///////////////////////////////////////////////////////////////////////
//middle_gold_instance3
logic is_catch3l,is_catch3r;
logic destroy_big_gold_instance3;
	 
logic[3:0] big_gold_index3;
logic is_big_gold3;
logic destroy3r,destroy3l;
middle_gold_double big_gold_instance3(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx3),
								.goldy(goldy3),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold3),
								.big_gold_index(big_gold_index3),
								.destroy(destroy_big_gold_instance3),
								.destroyl(destroy3l),
								.destroyr(destroy3r),
								.is_catchl(is_catch3l),
								.is_catchr(is_catch3r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder)
);


///////////////////////////////////////////////////////////////////////




///////////////////////////////////////////////////////////////////////
//middle_gold_instance4
logic is_catch4l,is_catch4r;
logic destroy_big_gold_instance4;
	 
logic[3:0] big_gold_index4;
logic is_big_gold4;
logic destroy4r,destroy4l;
middle_gold_double big_gold_instance4(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx4),
								.goldy(goldy4),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold4),
								.big_gold_index(big_gold_index4),
								.destroy(destroy_big_gold_instance4),
								.destroyl(destroy4l),
								.destroyr(destroy4r),
								.is_catchl(is_catch4l),
								.is_catchr(is_catch4r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder)
);


///////////////////////////////////////////////////////////////////////






///////////////////////////////////////////////////////////////////////
//small_gold_instance5
logic is_catch5l,is_catch5r;
logic destroy_big_gold_instance5;
	 
logic[3:0] big_gold_index5;
logic is_big_gold5;
logic destroy5r,destroy5l;


small_gold_double big_gold_instance5(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx5),
								.goldy(goldy5),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold5),
								.big_gold_index(big_gold_index5),
								.destroy(destroy_big_gold_instance5),
								.destroyl(destroy5l),
								.destroyr(destroy5r),
								.is_catchl(is_catch5l),
								.is_catchr(is_catch5r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder)
);


///////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////
//small_gold_instance6
logic is_catch6l,is_catch6r;
logic destroy_big_gold_instance6;
	 
logic[3:0] big_gold_index6;
logic is_big_gold6;
logic destroy6r,destroy6l;

small_gold_double big_gold_instance6(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx6),
								.goldy(goldy6),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold6),
								.big_gold_index(big_gold_index6),
								.destroy(destroy_big_gold_instance6),
								.destroyl(destroy6l),
								.destroyr(destroy6r),
								.is_catchl(is_catch6l),
								.is_catchr(is_catch6r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder)
);

///////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////
//bigstone_instance7
logic is_catch7l,is_catch7r;
logic destroy_big_gold_instance7;
	 
logic[3:0] big_gold_index7;
logic is_big_gold7;
logic destroy7r,destroy7l;


bigstone_double big_gold_instance7(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx7),
								.goldy(goldy7),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold7),
								.big_gold_index(big_gold_index7),
								.destroy(destroy_big_gold_instance7),
								.destroyl(destroy7l),
								.destroyr(destroy7r),
								.is_catchl(is_catch7l),
								.is_catchr(is_catch7r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder)
);

///////////////////////////////////////////////////////////////////////







///////////////////////////////////////////////////////////////////////
//bigstone_instance8
logic is_catch8l,is_catch8r;
logic destroy_big_gold_instance8;
	 
logic[3:0] big_gold_index8;
logic is_big_gold8;
logic destroy8r,destroy8l;


bigstone_double big_gold_instance8(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx8),
								.goldy(goldy8),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold8),
								.big_gold_index(big_gold_index8),
								.destroy(destroy_big_gold_instance8),
								.destroyl(destroy8l),
								.destroyr(destroy8r),
								.is_catchl(is_catch8l),
								.is_catchr(is_catch8r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder)
);

///////////////////////////////////////////////////////////////////////





///////////////////////////////////////////////////////////////////////
//daimond_instance9
logic is_catch9l,is_catch9r;
logic destroy_big_gold_instance9;
	 
logic[3:0] big_gold_index9;
logic is_big_gold9;
logic destroy9r,destroy9l;



daimond_double big_gold_instance9(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx9),
								.goldy(goldy9),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold9),
								.big_gold_index(big_gold_index9),
								.destroy(destroy_big_gold_instance9),
								.destroyl(destroy9l),
								.destroyr(destroy9r),
								.is_catchl(is_catch9l),
								.is_catchr(is_catch9r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder)
);

///////////////////////////////////////////////////////////////////////















///////////////////////////////////////////////////////////////////////
//small_stone_instance10
logic is_catch10l,is_catch10r;
logic destroy_big_gold_instance10;
	 
logic[3:0] big_gold_index10;
logic is_big_gold10;
logic destroy10r,destroy10l;



smallstone_double big_gold_instance10(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx10),
								.goldy(goldy10),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold10),
								.big_gold_index(big_gold_index10),
								.destroy(destroy_big_gold_instance10),
								.destroyl(destroy10l),
								.destroyr(destroy10r),
								.is_catchl(is_catch10l),
								.is_catchr(is_catch10r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder)
);

///////////////////////////////////////////////////////////////////////


















///////////////////////////////////////////////////////////////////////
//bigstone_instance11
logic is_catch11l,is_catch11r;
logic destroy_big_gold_instance11;
	 
logic[3:0] big_gold_index11;
logic is_big_gold11;
logic destroy11r,destroy11l;



smallstone_double big_gold_instance11(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx11),
								.goldy(goldy11),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold11),
								.big_gold_index(big_gold_index11),
								.destroy(destroy_big_gold_instance11),
								.destroyl(destroy11l),
								.destroyr(destroy11r),
								.is_catchl(is_catch11l),
								.is_catchr(is_catch11r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder)
);


///////////////////////////////////////////////////////////////////////






///////////////////////////////////////////////////////////////////////
//bigstone_instance12
logic is_catch12l,is_catch12r;
logic destroy_big_gold_instance12;
	 
logic[3:0] big_gold_index12;
logic is_big_gold12;
logic destroy12r,destroy12l;



smallstone_double big_gold_instance12(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx12),
								.goldy(goldy12),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold12),
								.big_gold_index(big_gold_index12),
								.destroy(destroy_big_gold_instance12),
								.destroyl(destroy12l),
								.destroyr(destroy12r),
								.is_catchl(is_catch12l),
								.is_catchr(is_catch12r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder)
);

///////////////////////////////////////////////////////////////////////






///////////////////////////////////////////////////////////////////////
//small_stone_instance13
logic is_catch13l,is_catch13r;
logic destroy_big_gold_instance13;
	 
logic[3:0] big_gold_index13;
logic is_big_gold13;
logic destroy13r,destroy13l;



smallstone_double big_gold_instance13(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx13),
								.goldy(goldy13),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold13),
								.big_gold_index(big_gold_index13),
								.destroy(destroy_big_gold_instance13),
								.destroyl(destroy13l),
								.destroyr(destroy13r),
								.is_catchl(is_catch13l),
								.is_catchr(is_catch13r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder)
);
///////////////////////////////////////////////////////////////////////






///////////////////////////////////////////////////////////////////////
//small_stone_instance14
logic is_catch14l,is_catch14r;
logic destroy_big_gold_instance14;
	 
logic[3:0] big_gold_index14;
logic is_big_gold14;
logic destroy14r,destroy14l;



smallstone_double big_gold_instance14(
								.Clk(Clk), 
								.DrawX(DrawX), 
								.DrawY(DrawY),
								.goldx(goldx14),
								.goldy(goldy14),
								.tailyl(string_tailyl),
								.tailxl(string_tailxl),
								.tailxr(string_tailxr),
								.tailyr(string_tailyr),
								.reset(Reset_h),
								.R_model(R_model),
								.R_moder(R_moder),
								.is_big_gold(is_big_gold14),
								.big_gold_index(big_gold_index14),
								.destroy(destroy_big_gold_instance14),
								.destroyl(destroy14l),
								.destroyr(destroy14r),
								.is_catchl(is_catch14l),
								.is_catchr(is_catch14r),
								.is_new_game_start(display_random),
								.is_explodel(is_explodel),
								.is_exploder(is_exploder)
);
///////////////////////////////////////////////////////////////////////
















///////////////////////////////////////////////////////////////////////
//color_mapper

color_mapper_double  color_instance1(    
													.clk(Clk),
													.DrawX(DrawX), 
							                  .DrawY(DrawY),
													.is_bgdouble(is_bgdouble),
													.is_player1(is_player1),
													.is_player2(is_player2),
													.bgdouble_index(bgdouble_index),
													.player1_index(player1_index),
													.player2_index(player2_index),
													.is_zhayao(is_zhayao),
													.zhayao_index(zhayao_index),
													.is_hookr(is_hookr),
													.hook_indexr(hook_indexr),
													.is_hookl(is_hookl),
													.hook_indexl(hook_indexl),
													.is_stringr(is_stringr),
													.is_stringl(is_stringl),
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
														
													.is_score_double(is_score_double),
													
													.is_timer(is_timer),
													
													.is_explode_showr(is_explode_showr),
													.explode_indexr(explode_indexr),
													.is_explode_showl(is_explode_showl),
													.explode_indexl(explode_indexl),
													
						
                                       .VGA_R(VGA_R), 
							                  .VGA_G(VGA_G), 
							                  .VGA_B(VGA_B),
													
													
						
													
												
													
													
													
													
													
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
logic is_score_double;
//logic show_fail;
//logic [19:0] total_score;


KeepSocre_doubule score_instace(
								.Clk(Clk), 
								.DrawX(DrawX), 
							   .DrawY(DrawY),
								.reset(Reset_h),
								.catch1r(destroy1r),
								.catch2r(destroy2r),
								.catch3r(destroy3r), 
								.catch4r(destroy4r), 
								.catch5r(destroy5r), 
								.catch6r(destroy6r), 
								.catch7r(destroy7r), 
								.catch8r(destroy8r), 
								.catch9r(destroy9r), 
								.catch10r(destroy10r), 
								.catch11r(destroy11r), 
								.catch12r(destroy12r), 
								.catch13r(destroy13r), 
								.catch14r(destroy14r), 
								.catch1l(destroy1l),
								.catch2l(destroy2l),
								.catch3l(destroy3l), 
								.catch4l(destroy4l), 
								.catch5l(destroy5l), 
								.catch6l(destroy6l), 
								.catch7l(destroy7l), 
								.catch8l(destroy8l), 
								.catch9l(destroy9l), 
								.catch10l(destroy10l), 
								.catch11l(destroy11l), 
								.catch12l(destroy12l), 
								.catch13l(destroy13l), 
								.catch14l(destroy14l), 
								.state_outl(state_outl),
								.state_outr(state_outr),
								.time_end(time_end),
								.display_random(display_random),
								.display_double(display_double),
								.target_score(target_score),
								.is_score_double(is_score_double),
								//.total_score(total_score),
								.show_fail(show_fail),
								
								
);	 




///////////////////////////////////////////////////////////////////////







///////////////////////////////////////////////////////////////////////
//show_explode
logic is_explode_showl;
logic[3:0] explode_indexl;
//logic [2:0] state_out_explode;
show_explode show_explodel_instance(
								.Clk(Clk), 
								.reset(Reset_h),
								.DrawX(DrawX), 
							   .DrawY(DrawY),
								.taily(string_tailyl),
								.tailx(string_tailxl),
								.is_explode(1'd1),
								.display_random(display_random),

									
								.is_explode_show(is_explode_showl),
								.explode_index(explode_indexl),
//								.state_out_explode(state_out_explode),
//								.change_mode_signal(change_mode_signal_explode)

);
/////////////////////////////////////////////////////////////////////// 
 
 
 
 
 
 
 
///////////////////////////////////////////////////////////////////////
//show_explode
logic is_explode_showr;
logic[3:0] explode_indexr;
//logic [2:0] state_out_explode;
show_explode show_exploder_instance(
								.Clk(Clk), 
								.reset(Reset_h),
								.DrawX(DrawX), 
							   .DrawY(DrawY),
								.taily(string_tailyr),
								.tailx(string_tailxr),
								.is_explode(1'd1),
								.display_random(display_random),

									
								.is_explode_show(is_explode_showr),
								.explode_index(explode_indexr),
//								.state_out_explode(state_out_explode),
//								.change_mode_signal(change_mode_signal_explode)

);
////////////
 
 
 
 
 
 
 
 
 
 
endmodule








