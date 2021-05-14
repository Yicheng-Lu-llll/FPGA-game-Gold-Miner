//-------------------------------------------------------------------------
//      lab8.sv                                                          --
//      Christine Chen                                                   --
//      Fall 2014                                                        --
//                                                                       --
//      Modified by Po-Han Huang                                         --
//      10/06/2017                                                       --
//                                                                       --
//      Fall 2017 Distribution                                           --
//                                                                       --
//      For use with ECE 385 Lab 8                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module lab8( input               CLOCK_50,
             input        [3:0]  KEY,          //bit 0 is set up as Reset
             // VGA Interface 
             output logic [7:0]  VGA_R,        //VGA Red
                                 VGA_G,        //VGA Green
                                 VGA_B,        //VGA Blue
             output logic        VGA_CLK,      //VGA Clock
                                 VGA_SYNC_N,   //VGA Sync signal
                                 VGA_BLANK_N,  //VGA Blank signal
                                 VGA_VS,       //VGA virtical sync signal
                                 VGA_HS,       //VGA horizontal sync signal
             // CY7C67200 Interface
             inout  wire  [15:0] OTG_DATA,     //CY7C67200 Data bus 16 Bits
             output logic [1:0]  OTG_ADDR,     //CY7C67200 Address 2 Bits
             output logic        OTG_CS_N,     //CY7C67200 Chip Select
                                 OTG_RD_N,     //CY7C67200 Write
                                 OTG_WR_N,     //CY7C67200 Read
                                 OTG_RST_N,    //CY7C67200 Reset
             input               OTG_INT,      //CY7C67200 Interrupt
             // SDRAM Interface for Nios II Software
             output logic [12:0] DRAM_ADDR,    //SDRAM Address 13 Bits
             inout  wire  [31:0] DRAM_DQ,      //SDRAM Data 32 Bits
             output logic [1:0]  DRAM_BA,      //SDRAM Bank Address 2 Bits
             output logic [3:0]  DRAM_DQM,     //SDRAM Data Mast 4 Bits
             output logic        DRAM_RAS_N,   //SDRAM Row Address Strobe
                                 DRAM_CAS_N,   //SDRAM Column Address Strobe
                                 DRAM_CKE,     //SDRAM Clock Enable
                                 DRAM_WE_N,    //SDRAM Write Enable
                                 DRAM_CS_N,    //SDRAM Chip Select
                                 DRAM_CLK,      //SDRAM Clock
				 output logic LEDG[9],LEDR[18],
				 output logic [6:0]HEX0, HEX1,HEX2,HEX4,HEX5,HEX6,HEX7,HEX3
				
                    );		
						  
////////////////////////////////////////
//test variable

//assign LEDG[0]=is_catchx1;
//assign LEDG[1]=is_catchx1;
//assign LEDG[2]=is_catchx1;
//assign LEDG[3]=is_catchx1;
//assign LEDG[4]=is_catchx1;
//assign LEDG[5]=is_catchx1;
//assign LEDG[6]=is_catchx1;
//assign LEDG[7]=is_catchx1;
//
//assign LEDG[8]=bomb_num;


assign LEDR[0]=is_exploder;
assign LEDR[1]=is_explodel;
assign LEDR[2]=is_catchx3;
assign LEDR[3]=is_catchx4;
assign LEDR[4]=is_catchx5;
assign LEDR[5]=is_catchx6;
assign LEDR[6]=is_catchx7;
assign LEDR[7]=is_catchx8;
assign LEDR[8]=is_catchx9;
assign LEDR[9]=is_catchx10;
assign LEDR[10]=is_catchx11;
assign LEDR[11]=is_catchx12;
assign LEDR[12]=is_catchx13;
assign LEDR[13]=is_catchx14;


//
//
//assign LEDR[17]=display_pass;
//assign LEDR[6]=display_shop;
//assign LEDR[7]=bomb_num;
//assign LEDR[8]=water_num;
//assign LEDR[9]=change_mode_signal;
//assign LEDR[10]=is_bomb;
//assign LEDR[11]=is_water;
//assign LEDR[12]=is_next;
//assign LEDR[13]=explode_text;
//assign LEDR[14]=zhayao_used;
//assign LEDR[15]=upper;









logic [2:0] State_gold_out1;
logic [2:0] State_gold_out2;



logic [2:0]  state_outr;
logic [2:0]  state_outl;



logic is_exploder;
logic is_explodel;




logic [2:0] State_gold_out;
logic [19:0] total_score;
logic [5:0]timer;
logic is_bound;
logic explode_text;
logic [9:0]test_dulp;
logic [2:0]state_out;










logic  is_catchx1;	
logic  is_catchx2;	
logic  is_catchx3;	
logic  is_catchx4;	
logic  is_catchx5;	
logic  is_catchx6;
logic  is_catchx7;	
logic  is_catchx8;	
logic  is_catchx9;	
logic  is_catchx10;	
logic  is_catchx11;	
logic  is_catchx12;	
logic  is_catchx13;	
logic  is_catchx14;




logic [2:0] state_out_explode;
logic change_mode_signal_explode;












    HexDriver Bhex0_inst
    (
        .In0({1'd0,State_gold_out1}),
        .Out0(HEX0)
    );
	 
	 
    
    HexDriver Bhex1_inst
    (
        .In0({1'd0,State_gold_out2}),
        .Out0(HEX1)
    );
	 
	 
	     HexDriver Bhex2_inst
    (
        .In0({1'd0,state_outr}),
        .Out0(HEX2)
    );
	 
	 
		 HexDriver Bhex3_inst
    (
        .In0({1'd0,state_outl}),
        .Out0(HEX3)
    ); 
	 
	 	 
	 
    HexDriver Bhex4_inst
    (
        .In0(test_state),
        .Out0(HEX4)
    );
	 
	 
    
    HexDriver Bhex5_inst
    (
        .In0({2'd0,total_score[3:0]}),
        .Out0(HEX5)
    );
	 
	 
	     HexDriver Bhex6_inst
    (
        .In0(total_score[7:4]),
        .Out0(HEX6)
    );
	 

	     HexDriver Bhex7_inst
    (
        .In0(total_score[11:8]),
        .Out0(HEX7)
    );

logic change_mode_signal;

///////////////////////////////////////////////////////////////////////






///////////////////////////////////////////////////////////////////////
//global variable
logic Reset_h, Clk;
assign Clk = CLOCK_50;
logic [1:0] hpi_addr;
logic [15:0] hpi_data_in, hpi_data_out;
logic hpi_r, hpi_w, hpi_cs, hpi_reset;
logic [9:0] DrawX;
logic [9:0] DrawY;
logic[3:0] num_p3,num_p4;

    always_ff @ (posedge Clk) begin
        Reset_h <= ~(KEY[0]);        // The push buttons are active low
		  //extend<=~(KEY[3]); 
    end
	 

///////////////////////////////////////////////////////////////////////







///////////////////////////////////////////////////////////////////////
//failorpass
//logic is_failorpass;	 
//logic [3:0]fail_or_pass_index;
//logic show_shop;
///////////////////////////////////////////////////////////////////////
	 
	 
	 
	 
	 
	 
///////////////////////////////////////////////////////////////////////
//shop_instance
logic[3:0] shop_index,test_state;
logic [3:0] bomb_index,water_index,next_index,boss_index,badboss_index;
logic is_shop, is_bomb,is_water,is_next,is_boss,is_badboss;
logic bomb_num, water_num;
 shop shop_instance( 
						.Clk(Clk),
						.reset(Reset_h),
						.DrawX(DrawX), 
						.DrawY(DrawY),
						.left(left),
						.right(right),
						.space(space),
						.display_shop(display_shop),
						
						.shop_index(shop_index),
						.bomb_index(bomb_index),
						.water_index(water_index),
						.next_index(next_index),
						.boss_index(boss_index),
						.badboss_index(badboss_index),
						.is_shop(is_shop), 
						.is_bomb(is_bomb),
						.is_water(is_water),
						.is_next(is_next),
						.is_boss(is_boss),
						.is_badboss(is_badboss),
						.bomb_num(bomb_num), 
						.water_num(water_num),
						. change_mode_signal( change_mode_signal),
						.test_state(test_state)
						
						




);	 
///////////////////////////////////////////////////////////////////////	 
	 
	 
	 
	 
	 
///////////////////////////////////////////////////////////////////////
// color_mapper_manager_instance
	 
	 
color_mapper_manager color_mapper_manager_instance(
									.clk(Clk),
									.DrawX(DrawX), 
									.DrawY(DrawY),
									.display_game_start(display_game_start),
									.display_random(display_random),
									.display_target(display_target),
									.display_single(display_single),
									.display_double(display_double),
									.display_competition(display_competition),
									.display_fail(display_fail),
									.display_pass(display_pass),
									.display_shop(display_shop),
									.reset(Reset_h),
									////
									.Game_start_index(Game_start_index),
									.singlebutton_index(singlebutton_index),
									.doublebutton_index(doublebutton_index),
									.compbutton_index(compbutton_index),
									.is_game_start(is_game_start), 
									.is_singlebutton(is_singlebutton),
									.is_doublebutton(is_doublebutton),
									.is_compbutton(is_compbutton),  //game start
									////
									.target_index(target_index),
									.is_targetscore(is_targetscore),
									.is_target(is_target),  //is target
									///
									.pass_index(pass_index),
									.is_pass(is_pass),               //is pass
									////
									.fail_index(fail_index),
									.is_fail(is_fail),
									///
									.shop_index(shop_index),
									.bomb_index(bomb_index),
									.water_index(water_index),
									.next_index(next_index),
									.boss_index(boss_index),
									.badboss_index(badboss_index),
									.is_shop(is_shop), 
									.is_bomb(is_bomb),
									.is_water(is_water),
									.is_next(is_next),
									.is_boss(is_boss),
									.is_badboss(is_badboss),
								
									///
									.VGA_R_single(VGA_R_single),
									.VGA_G_single(VGA_G_single),
									.VGA_B_single(VGA_B_single),//single
									///
									.VGA_R_double(VGA_R_double),
									.VGA_G_double(VGA_G_double),
									.VGA_B_double(VGA_B_double),//single
									///
									.VGA_R(VGA_R), 
									.VGA_G(VGA_G), 
									.VGA_B(VGA_B)

                     );


	 
///////////////////////////////////////////////////////////////////////
	 	 


///////////////////////////////////////////////////////////////////////
//keycode_manager variable




logic  player1_want_catch;
logic  player2_want_catch;
logic  left;
logic  right;
logic enter;
logic space;
logic upper;



keycode_manager keycode_manager_instance(

						.keycode(keycode),
						.keycode0(keycode0),
						.keycode1(keycode1),
						.keycode2(keycode2),
						
						.player1_want_catch(player1_want_catch),
						.player2_want_catch(player2_want_catch),
						.left(left),
						.right(right),
						.enter(enter),
						.space(space),
						.upper(upper)

); 
	 



/////////////////////////////////////////////////////////////////////// 







///////////////////////////////////////////////////////////////////////
//Game_start_instance
logic[3:0] Game_start_index;
logic [3:0] singlebutton_index,doublebutton_index,compbutton_index;
logic is_game_start, is_singlebutton,is_doublebutton,is_compbutton;
logic [1:0]game_mode;

 Game_start Game_start_instance(
						.Clk(Clk),
						.reset(Reset_h),
						.DrawX(DrawX), 
						.DrawY(DrawY),
						.left(left),
						.right(right),
						.space(space),
						.display_Game_start(display_game_start),
						
						
						
	
						.Game_start_index(Game_start_index),
						.singlebutton_index(singlebutton_index),
						.doublebutton_index(doublebutton_index),
						.compbutton_index(compbutton_index),
						.is_game_start(is_game_start), 
						.is_singlebutton(is_singlebutton),
						.is_doublebutton(is_doublebutton),
						.is_compbutton(is_compbutton),
						.game_mode(game_mode),
						
						
						
						
						);
						
///////////////////////////////////////////////////////////////////////		






	
///////////////////////////////////////////////////////////////////////	
//pass_instance
logic[3:0] pass_index;
logic is_pass;

Pass pass_instance(
						.Clk(Clk),
						.reset(Reset_h),
						.display_pass(display_pass),
						.DrawX(DrawX), 
						.DrawY(DrawY),
						
						
						.pass_index(pass_index),
						.is_pass(is_pass)
);
///////////////////////////////////////////////////////////////////////	


	
	
	
///////////////////////////////////////////////////////////////////////	
//	Fail
logic [3:0] fail_index;
logic is_fail;
 Fail Fail_instance(		
						.Clk(Clk),
						.reset(Reset_h),
						.DrawX(DrawX), 
						.DrawY(DrawY),
						.display_fail(display_fail),
						
						
						.fail_index(fail_index),
						.is_fail(is_fail)

);	
///////////////////////////////////////////////////////////////////////		
	
	
	
	
	
	
	
	
	
///////////////////////////////////////////////////////////////////////		
	//single_instance	
logic [7:0]  VGA_R_single;		
logic [7:0]  VGA_G_single;
logic [7:0]  VGA_B_single;

logic show_fail_single;
logic time_end2_single;
logic zhayao_used;
single single_instance(
								.Clk(Clk), 
								.DrawX(DrawX),
								.DrawY(DrawY),
								.Reset_h(Reset_h),
								
								
								.target_score(target_score),
								
								.player1_want_catch(player1_want_catch),
								.player2_want_catch(player2_want_catch),
								.left(left),
								.right(left),
								.enter(enter),
								.space(space),
								.upper(upper),
								
								.display_random(display_random),
								.display_single(display_single),
								.display_double(display_double),
								.display_competition(display_competition),
								.display_shop(display_shop),
								.water_num(water_num),
								.bomb_num(bomb_num),
								
								.state_out(state_out),
								
								.test_dulp(test_dulp),
								
								
								.goldx1(goldx1),
								.goldy1(goldy1),


								.goldx2(goldx2),
								.goldy2(goldy2),


								.goldx3(goldx3),
								.goldy3(goldy3),

								.goldx4(goldx4),
								.goldy4(goldy4),

								.goldx5(goldx5),
								.goldy5(goldy5),

								.goldx6(goldx6),
								.goldy6(goldy6),

								.goldx7(goldx7),
								.goldy7(goldy7),

								.goldx8(goldx8),
								.goldy8(goldy8),

								.goldx9(goldx9),
								.goldy9(goldy9),

								.goldx10(goldx10),
								.goldy10(goldy10),
								
								
								
								
								
								
								
								
								
								
								
								
								.goldx11(goldx11),
								.goldy11(goldy11),


								.goldx12(goldx12),
								.goldy12(goldy12),


								.goldx13(goldx13),
								.goldy13(goldy13),

								.goldx14(goldx14),
								.goldy14(goldy14),

								.goldx15(goldx15),
								.goldy15(goldy15),

								.goldx16(goldx16),
								.goldy16(goldy16),

								.goldx17(goldx17),
								.goldy17(goldy17),

								.goldx18(goldx18),
								.goldy18(goldy18),

					
								

		


		
								
								
								
								
								
								
								
								
								
								
								
								
								
								.VGA_R(VGA_R_single),        
                        .VGA_G(VGA_G_single),       
                        .VGA_B(VGA_B_single),   
							
							
								.show_fail(show_fail_single),
								.time_end2(time_end2_single),
								.timer(timer),
								.is_bound(is_bound),
								.zhayao_used(zhayao_used),
								
								
								
								
								
								.is_catchx1(is_catchx1),	
								.is_catchx2(is_catchx2),	
								.is_catchx3(is_catchx3),	
								.is_catchx4(is_catchx4),	
								.is_catchx5(is_catchx5),	
								.is_catchx6(is_catchx6),	
								.is_catchx7(is_catchx7),	
								.is_catchx8(is_catchx8),	
								.is_catchx9(is_catchx9),	
								.is_catchx10(is_catchx10),	
								.is_catchx11(is_catchx11),	
								.is_catchx12(is_catchx12),	
								.is_catchx13(is_catchx13),	
								.is_catchx14(is_catchx14),
								
								
								
								.total_score(total_score),
								.state_out_explode(state_out_explode),
								.change_mode_signal_explode(change_mode_signal_explode)
	
	
);
///////////////////////////////////////////////////////////////////////			








///////////////////////////////////////////////////////////////////////		
//double
logic [7:0]  VGA_R_double;		
logic [7:0]  VGA_G_double;
logic [7:0]  VGA_B_double;

logic show_fail_double;
logic time_end2_double;
//logic zhayao_used;
double double_instance(
								.Clk(Clk), 
								.DrawX(DrawX),
								.DrawY(DrawY),
								.Reset_h(Reset_h),
								
								
								.target_score(target_score),
								
								.player1_want_catch(player1_want_catch),
								.player2_want_catch(player2_want_catch),
								.left(left),
								.right(left),
								.enter(enter),
								.space(space),
								.upper(upper),
								
								.display_random(display_random),
								.display_single(display_single),
								.display_double(display_double),
								.display_competition(display_competition),
								.display_shop(display_shop),
								.water_num(water_num),
								.bomb_num(bomb_num),
//								
//								.state_out(state_out),
//								
//								.test_dulp(test_dulp),
								
								
								.goldx1(goldx1),
								.goldy1(goldy1),


								.goldx2(goldx2),
								.goldy2(goldy2),


								.goldx3(goldx3),
								.goldy3(goldy3),

								.goldx4(goldx4),
								.goldy4(goldy4),

								.goldx5(goldx5),
								.goldy5(goldy5),

								.goldx6(goldx6),
								.goldy6(goldy6),

								.goldx7(goldx7),
								.goldy7(goldy7),

								.goldx8(goldx8),
								.goldy8(goldy8),

								.goldx9(goldx9),
								.goldy9(goldy9),

								.goldx10(goldx10),
								.goldy10(goldy10),
								
								
								
								
								
								
								
								
								
								
								
								
								.goldx11(goldx11),
								.goldy11(goldy11),


								.goldx12(goldx12),
								.goldy12(goldy12),


								.goldx13(goldx13),
								.goldy13(goldy13),

								.goldx14(goldx14),
								.goldy14(goldy14),

								.goldx15(goldx15),
								.goldy15(goldy15),

								.goldx16(goldx16),
								.goldy16(goldy16),

								.goldx17(goldx17),
								.goldy17(goldy17),

								.goldx18(goldx18),
								.goldy18(goldy18),

					
								

		


		
								
								
								
								
								
								
								
								
								
								
								
								
								
								.VGA_R(VGA_R_double),        
                        .VGA_G(VGA_G_double),       
                        .VGA_B(VGA_B_double),   
							
							
								.show_fail(show_fail_double),
								.time_end2(time_end2_double),
								.timer(timer),
								.State_gold_out1(State_gold_out1),
								.State_gold_out2(State_gold_out2),
								.state_outr(state_outr),
								.state_outl(state_outl),
								.is_exploder(is_exploder),
								.is_explodel(is_explodel)

//								.is_bound(is_bound),
//								.zhayao_used(zhayao_used),
								
								
								
//								
//								
//								.is_catchx1(is_catchx1),	
//								.is_catchx2(is_catchx2),	
//								.is_catchx3(is_catchx3),	
//								.is_catchx4(is_catchx4),	
//								.is_catchx5(is_catchx5),	
//								.is_catchx6(is_catchx6),	
//								.is_catchx7(is_catchx7),	
//								.is_catchx8(is_catchx8),	
//								.is_catchx9(is_catchx9),	
//								.is_catchx10(is_catchx10),	
//								.is_catchx11(is_catchx11),	
//								.is_catchx12(is_catchx12),	
//								.is_catchx13(is_catchx13),	
//								.is_catchx14(is_catchx14),
								
								
								
//								.total_score(total_score),
//								.state_out_explode(state_out_explode),
//								.change_mode_signal_explode(change_mode_signal_explode)
	
	
);


///////////////////////////////////////////////////////////////////////		








			
						
					
///////////////////////////////////////////////////////////////////////			
////double		
//logic time_end2_double;
//logic show_fail_double;		
	
///////////////////////////////////////////////////////////////////////





///////////////////////////////////////////////////////////////////////
//competition					
logic time_end2_com;
logic show_fail_com;		
	
///////////////////////////////////////////////////////////////////////





	
///////////////////////////////////////////////////////////////////////
//game_controller define
logic display_game_start,display_random,display_target,display_single,display_double,display_competition,display_fail,display_pass,display_shop;

	game_controller game_controller_instance( 
								.Clk(Clk),
								.reset(Reset_h),
								.game_mode(game_mode),   //0 to single 1 to double 2 to comp
								
								
								.time_end2_single(time_end2_single),			
								.show_fail_single(show_fail_single),      
								
								
								.time_end2_double(time_end2_double),			
								.show_fail_double(show_fail_double),      
								
								
								
								
								.time_end2_com(time_end2_com),			
								.show_fail_com(show_fail_com),      
								
								
								.enter(enter),      //enter==1 means change page
								.display_game_start(display_game_start),
								.display_random(display_random),
								.display_target(display_target),
								.display_single(display_single),
								.display_double(display_double),
								.display_competition(display_competition),
								.display_fail(display_fail),
								.display_pass(display_pass),
								.display_shop(display_shop)
								    

);
///////////////////////////////////////////////////////////////////////



	 

///////////////////////////////////////////////////////////////////////
//Target
logic [19:0] target_score;
logic[3:0] target_index;
logic is_targetscore,is_target;

Target Target_ins(
						.Clk(Clk),
						.reset(Reset_h),
						.display_target(display_target),
						.DrawX(DrawX), 
						.DrawY(DrawY),
						
						.target_score(target_score),
						.target_index(target_index),
						.is_targetscore(is_targetscore),
						.is_target(is_target)



);


///////////////////////////////////////////////////////////////////////	 
	 
	 
	 


	 
	 

///////////////////////////////////////////////////////////////////////	 
//random_variable_processor_instance
logic [9:0] goldx1;
logic [9:0] goldy1;
logic [9:0] goldx2;
logic [9:0] goldy2;
logic [9:0] goldx3;
logic [9:0] goldy3;
logic [9:0] goldx4;
logic [9:0] goldy4;
logic [9:0] goldx5;
logic [9:0] goldy5;
logic [9:0] goldx6;
logic [9:0] goldy6;
logic [9:0] goldx7;
logic [9:0] goldy7;
logic [9:0] goldx8;
logic [9:0] goldy8;
logic [9:0] goldx9;
logic [9:0] goldy9;
logic [9:0] goldx10;
logic [9:0] goldy10;





logic [9:0] goldx11;
logic [9:0] goldy11;
logic [9:0] goldx12;
logic [9:0] goldy12;
logic [9:0] goldx13;
logic [9:0] goldy13;
logic [9:0] goldx14;
logic [9:0] goldy14;
logic [9:0] goldx15;
logic [9:0] goldy15;
logic [9:0] goldx16;
logic [9:0] goldy16;
logic [9:0] goldx17;
logic [9:0] goldy17;
logic [9:0] goldx18;
logic [9:0] goldy18;

 



random_variable_processor random_variable_processor_instance(


.Clk(Clk),
.position0(position0),
.position1(position1),
.position2(position2),
.position3(position3),
.position4(position4),
.position5(position5),
.position6(position6),
.position7(position7),
.position8(position8),
.position9(position9),
.position10(position10),
.position11(position11),
.position12(position12),
.position13(position13),
.position14(position14),
.position15(position15),
.position16(position16),
.position17(position17),
.position18(position18),
.position19(position19),
.position20(position20),
.is_new_game_start(display_random),


									.position21(position21),        //        position21.export
									.position22(position22),        //        position22.export
									.position23(position23),        //        position23.export
									.position24(position24),        //        position24.export
									.position25(position25),        //        position25.export
									.position26(position26),        //        position26.export
									.position27(position27),        //        position27.export
									.position28(position28),        //        position28.export
									.position29(position29),        //        position29.export
									.position30(position30),        //        position30.export
									.position31(position31),        //        position31.export
									.position32(position32),        //        position32.export
									.position33(position33),        //        position33.export
									.position34(position34),        //        position34.export
									.position35(position35),        //        position35.export
									.position36(position36),        //        position36.export


.goldx1(goldx1),
.goldy1(goldy1),


.goldx2(goldx2),
.goldy2(goldy2),


.goldx3(goldx3),
.goldy3(goldy3),

.goldx4(goldx4),
.goldy4(goldy4),

.goldx5(goldx5),
.goldy5(goldy5),

.goldx6(goldx6),
.goldy6(goldy6),

.goldx7(goldx7),
.goldy7(goldy7),

.goldx8(goldx8),
.goldy8(goldy8),

.goldx9(goldx9),
.goldy9(goldy9),

.goldx10(goldx10),
.goldy10(goldy10),













.goldx11(goldx11),
.goldy11(goldy11),


.goldx12(goldx12),
.goldy12(goldy12),


.goldx13(goldx13),
.goldy13(goldy13),

.goldx14(goldx14),
.goldy14(goldy14),

.goldx15(goldx15),
.goldy15(goldy15),

.goldx16(goldx16),
.goldy16(goldy16),

.goldx17(goldx17),
.goldy17(goldy17),

.goldx18(goldx18),
.goldy18(goldy18)


); 
	 

///////////////////////////////////////////////////////////////////////	 	 
	 
	 
	 

	 
	 

//
//
//
//
//);	 
//	 
//background_shop background_shop_instance(
//								.Clk(Clk), 
//								.DrawX(DrawX), 
//								.DrawY(DrawY),
//								.background_shop_index(background_shop_index)
//
//);	 
//
//



	 
///////////////////////////////////////////////////////////////////////	 
//random_variable_processor variable
	 
logic [31:0] position0;         //         position0.export
logic [31:0] position1;         //         position1.export
logic [31:0] position2;         //         position2.export
logic [31:0] position3;         //         position3.export
logic [31:0] position4;         //         position4.export
logic [31:0] position5;         //         position5.export
logic [31:0] position6;         //         position6.export
logic [31:0] position7;         //         position7.export
logic [31:0] position8;         //         position8.export
logic [31:0] position9;         //         position9.export
logic [31:0] position10;        //        position10.export
logic [31:0] position11;        //        position11.export
logic [31:0] position12;        //        position12.export
logic [31:0] position13;        //        position13.export
logic [31:0] position14;        //        position14.export
logic [31:0] position15;        //        position15.export
logic [31:0] position16;        //        position16.export
logic [31:0] position17;        //        position17.export
logic [31:0] position18;        //        position18.export
logic [31:0] position19;        //        position19.export
logic [31:0] position20;        //        position20.export
	 
		
		
logic [31:0] is_new_game_start; // is_new_game_start.export		





logic [31:0] position21;        //        position21.export
logic [31:0] position22;        //        position22.export
logic [31:0] position23;        //        position23.export
logic [31:0] position24;        //        position24.export
logic [31:0] position25;        //        position25.export
logic [31:0] position26;        //        position26.export
logic [31:0] position27;        //        position27.export
logic [31:0] position28;        //        position28.export
logic [31:0] position29;        //        position29.export
logic [31:0] position30;        //        position30.export
logic [31:0] position31;        //        position31.export
logic [31:0] position32;        //        position32.export
logic [31:0] position33;        //        position33.export
logic [31:0] position34;        //        position34.export
logic [31:0] position35;        //        position35.export
logic [31:0] position36;        //        position36.export












logic [31:0] keycode;
logic [31:0] keycode0;
logic [31:0] keycode1;
logic [31:0] keycode2;


     nios_system nios_system(
                             .clk_clk(Clk),         
                             .reset_reset_n(1'b1),    // Never reset NIOS
                             .sdram_wire_addr(DRAM_ADDR), 
                             .sdram_wire_ba(DRAM_BA),   
                             .sdram_wire_cas_n(DRAM_CAS_N),
                             .sdram_wire_cke(DRAM_CKE),  
                             .sdram_wire_cs_n(DRAM_CS_N), 
                             .sdram_wire_dq(DRAM_DQ),   
                             .sdram_wire_dqm(DRAM_DQM),  
                             .sdram_wire_ras_n(DRAM_RAS_N),
                             .sdram_wire_we_n(DRAM_WE_N), 
                             .sdram_clk_clk(DRAM_CLK),
									  
									  
									  
									  
                             .keycode_export(keycode),  
									  .keycode0_export(keycode0),        //        keycode0.export
									  .keycode1_export(keycode1),        //        keycode1.export
									  .keycode2_export(keycode2),        //        keycode2.export
									  
									  
									  
									  
                             .otg_hpi_address_export(hpi_addr),
                             .otg_hpi_data_in_port(hpi_data_in),
                             .otg_hpi_data_out_port(hpi_data_out),
                             .otg_hpi_cs_export(hpi_cs),
                             .otg_hpi_r_export(hpi_r),
                             .otg_hpi_w_export(hpi_w),
                             .otg_hpi_reset_export(hpi_reset),
									  
									  
									  
									  
									  
									.position0_export(position0),      
									.position1_export(position1),        
									.position10_export(position2),      
									.position11_export(position3),       
									.position12_export(position4),        
									.position13_export(position5),       
									.position14_export(position6),       
									.position15_export(position7),       
									.position16_export(position8),        
									.position17_export(position9),        
									.position18_export(position10),       
									.position19_export(position11),        
									.position2_export(position12),         
									.position20_export(position13),       
									.position3_export(position14),         
									.position4_export(position15),         
									.position5_export(position16),         
									.position6_export(position17),         
									.position7_export(position18),         
									.position8_export(position19),        
									.position9_export(position20),
									
									
									
									
									.position21_export(position21),        //        position21.export
									.position22_export(position22),        //        position22.export
									.position23_export(position23),        //        position23.export
									.position24_export(position24),        //        position24.export
									.position25_export(position25),        //        position25.export
									.position26_export(position26),        //        position26.export
									.position27_export(position27),        //        position27.export
									.position28_export(position28),        //        position28.export
									.position29_export(position29),        //        position29.export
									.position30_export(position30),        //        position30.export
									.position31_export(position31),        //        position31.export
									.position32_export(position32),        //        position32.export
									.position33_export(position33),        //        position33.export
									.position34_export(position34),        //        position34.export
									.position35_export(position35),        //        position35.export
									.position36_export(position36),        //        position36.export


									.is_new_game_start_export(is_new_game_start)
    );
///////////////////////////////////////////////////////////////////////	 













    hpi_io_intf hpi_io_inst(
                            .Clk(Clk),
                            .Reset(Reset_h),
                            // signals connected to NIOS II
                            .from_sw_address(hpi_addr),
                            .from_sw_data_in(hpi_data_in),
                            .from_sw_data_out(hpi_data_out),
                            .from_sw_r(hpi_r),
                            .from_sw_w(hpi_w),
                            .from_sw_cs(hpi_cs),
                            .from_sw_reset(hpi_reset),
                            // signals connected to EZ-OTG chip
                            .OTG_DATA(OTG_DATA),    
                            .OTG_ADDR(OTG_ADDR),    
                            .OTG_RD_N(OTG_RD_N),    
                            .OTG_WR_N(OTG_WR_N),    
                            .OTG_CS_N(OTG_CS_N),
                            .OTG_RST_N(OTG_RST_N)
    );
     
  


	 

	 
vga_clk vga_clk_instance(.inclk0(Clk), .c0(VGA_CLK));
 			
VGA_controller vga_controller_instance(   .Clk(Clk),        
                                           .Reset(Reset_h),       
                                           .VGA_HS(VGA_HS),      
                                           .VGA_VS(VGA_VS),      
                                           .VGA_CLK(VGA_CLK),     
                                           .VGA_BLANK_N(VGA_BLANK_N), 
                                           .VGA_SYNC_N(VGA_SYNC_N), 
                                                                        
                                           .DrawX(DrawX),       
                                           .DrawY(DrawY)        
                       
							  );  
    

	 
	 
	 
	 
	 

endmodule















