
module  color_mapper_double (
									input logic clk,
									input logic [9:0] DrawX, DrawY,
									
									
									
									input logic is_bgdouble,is_player1,is_player2,
									input logic[3:0] bgdouble_index,player1_index,player2_index,
									
									input logic is_zhayao,
									input logic[3:0]zhayao_index,

									
									input logic is_hookl,is_hookr,
									input logic[3:0]	hook_indexl,hook_indexr,
									
									input logic is_stringl,is_stringr,
									
									
							      input logic is_big_gold1,
									input logic[3:0]	big_gold_index1,
									
									
							      input logic is_big_gold2,
									input logic[3:0]	big_gold_index2,
									
									
							      input logic is_big_gold3,
									input logic[3:0]	big_gold_index3,
									
									
							      input logic is_big_gold4,
									input logic[3:0]	big_gold_index4,									
									
									
									
							      input logic is_big_gold5,
									input logic[3:0]	big_gold_index5,
									
									
							      input logic is_big_gold6,
									input logic[3:0]	big_gold_index6,
									
									
							      input logic is_big_gold7,
									input logic[3:0]	big_gold_index7,
									
									
							      input logic is_big_gold8,
									input logic[3:0]	big_gold_index8,	
									

							      input logic is_big_gold9,
									input logic[3:0]	big_gold_index9,
									
									
							      input logic is_big_gold10,
									input logic[3:0]	big_gold_index10,										


							      input logic is_big_gold11,
									input logic[3:0]	big_gold_index11,
									
									
							      input logic is_big_gold12,
									input logic[3:0]	big_gold_index12,
									
									
							      input logic is_big_gold13,
									input logic[3:0]	big_gold_index13,
									
									
							      input logic is_big_gold14,
									input logic[3:0]	big_gold_index14,		

									input logic is_timer,
									
									input logic is_score_double,

									input logic is_explode_showl,is_explode_showr,
							      input logic[3:0] explode_indexl,explode_indexr,

									output logic [7:0] VGA_R, VGA_G, VGA_B 
									

                     );
							
							
							
logic [23:0] background_game_palette [15];
logic [23:0] big_gold_palette [11];
logic [23:0] hook_palette [7];
logic [23:0] stone_palette[7];
logic [23:0] demond_palette[7];
logic [23:0] zhayao2_palette[6];
logic [23:0] explode_palette[8];
logic [23:0] player_palette[9];
//logic [23:0] background_shop_palette[9];
//logic [23:0] fail_or_pass_palette[13];

logic [23:0] color;			
    
always_comb begin

background_game_palette ='{24'hffc800,24'h00a2e8,24'h273ca8,24'hd7cbc0,24'h272727,24'hd6833e,24'h29377c,24'ha25c3e,24'h925d3b,24'h9f6947,24'h764629,24'h845233,24'hfdcd95,24'hba8059,24'h9d6844};
zhayao2_palette ='{24'hffffff,24'hff2e05,24'hd9200b,24'hebddda,24'h544426,24'h9d7b65};
big_gold_palette='{24'h000000,24'hBAA07E,24'h633B00,24'hC1B69A,24'h9B913E,24'hDEBC57,24'hA08332,24'h7E5B00,24'hFFFF2D,24'hF1FF66,24'hF8CD0D};

hook_palette=     '{24'hFFFFFF,24'h000000,24'h3F3F3F,24'h818181,24'h9A9999,24'h38383E,24'h74787B};
stone_palette =   '{24'hffffff,24'h747f87,24'h827a73,24'h847a74,24'h635e62,24'h7b7b7b,24'h666666};
demond_palette =  '{24'hffffff,24'ha6f4f6,24'h6fd9e7,24'h9fd5c3,24'hbbf5f9,24'h51c3b7,24'hd3ccc4};
explode_palette= '{24'h000000,24'hffdf0a,24'hf7b309,24'hb91421,24'h8a2800,24'he3ac00,24'hfff8fa,24'hf1e7d6};
player_palette= '{24'hffffff,24'hd3d3d3,24'h686c77,24'hea9b64,24'h232322,24'haa642e,24'hb3b7bb,24'h9e5f35,24'h734128};
//background_shop_palette='{24'h754628,24'h834e2e,24'h6d4126,24'h834e2e,24'h026507,24'h0bfc13,24'h006500,24'hdeb776,24'hc48c2f};

//fail_or_pass_palette='{24'hfedf00,24'hf3b601,24'hb58d01,24'hae8801,24'hffff38,24'hfecf11,24'h9b4e00,24'he4d000,24'hce9d01,24'hdd8000,24'had8701,24'hb18a01,24'hffffa2};
end


always_comb begin

	if(is_hookl==1 && hook_palette[hook_indexl]!=24'hFFFFFF)
	color=hook_palette[hook_indexl];
	else if(is_hookr==1 && hook_palette[hook_indexr]!=24'hFFFFFF)
	color=hook_palette[hook_indexr];
	
	else if (is_score_double==1)
	color=24'h000000;
	
	else if(is_timer==1)
	color=24'h000000;

	else if( is_stringl==1)
	color=24'h000000;
	else if( is_stringr==1)
	color=24'h000000;
	else if(is_zhayao==1 && zhayao_index!=4'd0)
	color=zhayao2_palette[zhayao_index];


	
	else if( is_explode_showl==1 && explode_indexl!=4'd0)
		color=explode_palette[explode_indexl];	
	
	
	else if( is_explode_showr==1 && explode_indexr!=4'd0)
		color=explode_palette[explode_indexr];	


	else if(is_player1==1 && player1_index!=4'd0)
		color=player_palette[player1_index];

	else if(is_player2==1 && player2_index!=4'd0)
		color=player_palette[player2_index];






	
	else if( is_big_gold1==1 && big_gold_index1!=4'd0)
	color=big_gold_palette[big_gold_index1];	
	
	
	else if( is_big_gold2==1 && big_gold_index2!=4'd0)
	color=big_gold_palette[big_gold_index2];
	

	else if( is_big_gold3==1 && big_gold_index3!=4'd0)
	color=big_gold_palette[big_gold_index3];	
	
	
	else if( is_big_gold4==1 && big_gold_index4!=4'd0)
	color=big_gold_palette[big_gold_index4];
	
	
	else if( is_big_gold5==1 && big_gold_index5!=4'd0)
	color=big_gold_palette[big_gold_index5];	
	
	
	else if( is_big_gold6==1 && big_gold_index6!=4'd0)
	color=big_gold_palette[big_gold_index6];

	
	else if( is_big_gold7==1 && big_gold_index7!=4'd0)
	color=stone_palette[big_gold_index7];
	
	
	else if( is_big_gold8==1 && big_gold_index8!=4'd0)
	color=stone_palette[big_gold_index8];

	
	else if( is_big_gold9==1 && big_gold_index9!=4'd0)
	color=demond_palette[big_gold_index9];	
	
	
	else if( is_big_gold10==1 && big_gold_index10!=4'd0)
	color=stone_palette[big_gold_index10];	
	
	
	
	
	else if( is_big_gold11==1 && big_gold_index11!=4'd0)
	color=stone_palette[big_gold_index11];	
	

	else if( is_big_gold12==1 && big_gold_index12!=4'd0)
	color=stone_palette[big_gold_index12];	
	

	else if( is_big_gold13==1 && big_gold_index13!=4'd0)
	color=stone_palette[big_gold_index13];	
	

	else if( is_big_gold14==1 && big_gold_index14!=4'd0)
	color=stone_palette[big_gold_index14];	
		

	
	
//	else if( is_explode_show==1 && explode_index!=4'd0)
//		color=explode_palette[explode_index];	
//	
	
	
	
	
	
	
	
	
	
	else if (is_bgdouble==1)
	color=background_game_palette[bgdouble_index];
	
	else
	color=background_game_palette[bgdouble_index];
		

	

VGA_R=color[23:16];
VGA_G=color[15:8];
VGA_B=color[7:0];

 
end
  
endmodule



