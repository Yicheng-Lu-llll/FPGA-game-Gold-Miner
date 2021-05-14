module  color_mapper_manager (
									input logic clk,
									input logic [9:0] DrawX, DrawY,
									input logic display_game_start,
									input logic display_random,
									input logic display_target,
									input logic display_single,
									input logic display_double,
									input logic display_competition,
									input logic display_fail,
									input logic display_pass,
									input logic display_shop,
									input logic reset,
									////
									input logic[3:0] Game_start_index,
									input logic [3:0] singlebutton_index,doublebutton_index,compbutton_index,
									input logic is_game_start, is_singlebutton,is_doublebutton,is_compbutton,  //game start
									////
									input logic[3:0] target_index,
									input logic is_targetscore,is_target,  //is target
									////
									input logic[3:0] pass_index,
									input logic is_pass,               //is pass
									////
									input logic [3:0] fail_index,
									input logic is_fail,

									////
									input logic[3:0] shop_index,
									input logic [3:0] bomb_index,water_index,next_index,boss_index,badboss_index,
									input logic is_shop, is_bomb,is_water,is_next,is_boss,is_badboss,    //shop
									///
									input logic [7:0]  VGA_R_single,		
									input logic [7:0]  VGA_G_single,
									input logic [7:0]  VGA_B_single,//single
									////
									input logic [7:0]  VGA_R_double,		
									input logic [7:0]  VGA_G_double,
									input logic [7:0]  VGA_B_double,//double
									///
									
									output logic [7:0] VGA_R, VGA_G, VGA_B

                     );

							
							
							
////////////////////////////////////////////////////////////////////
// define state here
enum logic[4:0]{color_mapper_GAME_START,color_mapper_SINGLE,color_mapper_DOUBLE,color_mapper_COMPETITION,color_mapper_FAIL,color_mapper_PASS,color_mapper_SHOP,color_mapper_TARGET}State, Next_state;
	always_ff @ (posedge clk)
		begin
			if (reset) 
				State <= color_mapper_GAME_START;
			else 
				State <= Next_state;
		end
/////////////////////////////////////////////////////////////////////
logic [23:0] color;                                                //
/////////////////////////////////////////////////////////////////////							
//palette 
logic [23:0] single_palette[11];
logic [23:0] double_palette[7];
logic [23:0] comp_palette[6];
logic [23:0] game_start_palette[15];
logic [23:0] target_palette[13];
logic [23:0] passfail_palette[13];
logic [23:0] goldbomb_palette[12];
logic [23:0] water_palette[8];
logic [23:0] next_palette[5];
logic [23:0] boss_palette[11];
logic [23:0] shop_palette[9];

always_comb begin

single_palette ='{24'hffffff,24'hBAA07E,24'h633B00,24'hC1B69A,24'h9B913E,24'hDEBC57,24'hA08332,24'h7E5B00,24'hFFFF2D,24'hF1FF66,24'hF8CD0D};
double_palette ='{24'hffffff,24'ha6f4f6,24'h6fd9e7,24'h9fd5c3,24'hbbf5f9,24'h51c3b7,24'hd3ccc4};
comp_palette ='{24'hffffff,24'hff2e05,24'hd9200b,24'hebddda,24'h544426,24'h9d7b65};
game_start_palette ='{24'hb08700,24'h010101,24'hfdfe59,24'hffcb91,24'hdc1a11,24'ha7a7a7,24'hf7f7f7,24'h949494,24'he3ac00,24'hb18d02,24'h5e5405,24'h7e7e7e,24'h9a7708,24'h697aa3,24'hffea03};
target_palette='{24'hfedf00,24'hf3b601,24'hb58d01,24'hae8801,24'hffff38,24'hfecf11,24'h9b4e00,24'he4d000,24'hce9d01,24'hdd8000,24'had8701,24'hb18a01,24'hffffa2};
passfail_palette='{24'hfedf00,24'hf3b601,24'hb58d01,24'hae8801,24'hffff38,24'hfecf11,24'h9b4e00,24'he4d000,24'hce9d01,24'hdd8000,24'had8701,24'hb18a01,24'hffffa2};
goldbomb_palette='{24'h000000,24'hefcf20,24'h852200,24'hfde308,24'hf29205,24'hc3994d,24'hdcc000,24'h8b2400,24'hfbd908,24'he49400,24'hffe6c6,24'hff9247};
water_palette='{24'h000000,24'hf7d16a,24'hf9cf6c,24'hf8d16a,24'hfef7e7,24'hfacf6c,24'hfdfdfa,24'hd19c3e};
next_palette='{24'h006600,24'h008906,24'h11ed0b,24'h11e415,24'h01630c};
boss_palette='{24'h000000,24'hf9ca97,24'hffffff,24'he6e6e6,24'h2e2d2f,24'h333333,24'h6b2b02,24'hf3ba83,24'h343230,24'hfee5ce,24'h7c5a39};
shop_palette='{24'h754628,24'h834e2e,24'h6d4126,24'h834e2e,24'h026507,24'h0bfc13,24'h006500,24'hdeb776,24'hc48c2f};
end
////////////////////////////////////////////////////////////////////										
							
//define state change
always_comb begin





	unique case(State)
	
color_mapper_GAME_START:	begin
	if(display_target)
		Next_state=color_mapper_TARGET;
	else
		Next_state=color_mapper_GAME_START;
		
		

end

/////
color_mapper_TARGET: begin
	if(display_single)
		Next_state=color_mapper_SINGLE;
	else if(display_double)
		Next_state=color_mapper_DOUBLE;	
	else if(display_competition)
		Next_state=color_mapper_COMPETITION;
	else
		Next_state=color_mapper_TARGET;
		
		


end
/////
color_mapper_SINGLE: begin
	if(display_fail)
		Next_state=color_mapper_FAIL;
	else if(display_pass)
		Next_state=color_mapper_PASS;
	else
		Next_state=color_mapper_SINGLE;
		

end
//////
color_mapper_DOUBLE: begin
	if(display_fail)
		Next_state=color_mapper_FAIL;
	else if(display_pass)
		Next_state=color_mapper_PASS;
	else
		Next_state=color_mapper_DOUBLE;

end
//////
color_mapper_COMPETITION: begin

	if(display_fail)
		Next_state=color_mapper_FAIL;
	else if(display_pass)
		Next_state=color_mapper_PASS;
	else
		Next_state=color_mapper_COMPETITION;

end
//////
color_mapper_FAIL:begin
	Next_state=color_mapper_FAIL;
	

end
//////
color_mapper_PASS: begin
	if(display_shop)
		 Next_state=color_mapper_SHOP;
	else
		Next_state=color_mapper_PASS;		

end
//////

color_mapper_SHOP: begin
	if(display_target)
		Next_state=color_mapper_TARGET;
	else
		Next_state=color_mapper_SHOP;
		

end

default: begin
	Next_state=Next_state;

	
end
		
		
	endcase
end					
///////////////////////////////////////////////////////////////////////////////////
//discuss the display
always_comb  begin
case(State)
	color_mapper_GAME_START:begin
	if (is_singlebutton==1 &&singlebutton_index!=4'd3)
		color=single_palette[singlebutton_index];
	else if (is_doublebutton==1 && doublebutton_index!=4'b0)
		color=double_palette[doublebutton_index];
	else if (is_compbutton==1 && compbutton_index!=4'b0)
		color=comp_palette[compbutton_index];
	else 
		color=game_start_palette[Game_start_index];
	end
	///
	color_mapper_TARGET: begin
		if(is_targetscore==1)
			color=24'h24bb0d;
		else 
			color=target_palette[target_index];
	end
	///
	color_mapper_SINGLE: begin
	
		color={VGA_R_single,	VGA_G_single, VGA_B_single};

	end
	///
	color_mapper_DOUBLE: begin
	
		color={VGA_R_double,	VGA_G_double, VGA_B_double};

	end
	///
	color_mapper_PASS:begin
		color=passfail_palette[pass_index];
	
	end
	///
	color_mapper_FAIL:begin
		color=passfail_palette[fail_index];
	
	end
	///
	color_mapper_SHOP	:begin
		if(is_bomb==1 && bomb_index!=4'b0)
		color=comp_palette[bomb_index];
		else if(is_water==1&& water_index!=4'd6)
		color=water_palette[water_index];
		else if (is_next==1)
		color=next_palette[next_index];
		else if (is_boss==1&& boss_index!=4'b0)
		color=boss_palette[boss_index];
		else if (is_badboss==1&& badboss_index!=4'b0)
		color=boss_palette[badboss_index];
		else
		color=shop_palette[shop_index];
	
	end
	///
	
default: color=24'd0;
endcase
end							
////////////////////////////////////////////////////////////////////////////////////							
always_comb begin

VGA_R=color[23:16];
VGA_G=color[15:8];
VGA_B=color[7:0];



end							
							
							
/////////////////////////////////////////////////////////////////////////////////////////							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
endmodule
							