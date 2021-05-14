module game_controller( input logic Clk,
								input logic reset,
								input logic[1:0] game_mode,   //0 to single 1 to double 2 to comp
								
								
								
								
								input logic time_end2_single,			//timer goes to 0 this be 1
								input logic show_fail_single,       // fail=1 means fail game otherwise pass
								
								
								input logic time_end2_double,			//timer goes to 0 this be 1
								input logic show_fail_double,       // fail=1 means fail game otherwise pass
								
								
								
								
								input logic time_end2_com,			//timer goes to 0 this be 1
								input logic show_fail_com,       // fail=1 means fail game otherwise pass
								
								
								
								
								input logic enter,      //enter==1 means change page
								output logic display_game_start,
								output logic display_random,
								output logic display_target,
								output logic display_single,
								output logic display_double,
								output logic display_competition,
								output logic display_fail,
								output logic display_pass,
								output logic display_shop
								    

);


////////////////////////////////////////////////////////////////////
// define state here
enum logic[4:0]{GAME_START,SINGLE,DOUBLE,COMPETITION,FAIL,PASS,PASS_hold,SHOP,SHOP_hold,RANDOM,TARGET}State, Next_state;
	always_ff @ (posedge Clk)
		begin
			if (reset) 
				State <= GAME_START;
			else 
				State <= Next_state;
		end
/////////////////////////////////////////////////////////////////////
//define state change
always_comb begin
	unique case(State)
GAME_START:	begin
	if (game_mode!=3)
		Next_state=RANDOM;
	else 
		Next_state=GAME_START;
end
/////
RANDOM: begin
	Next_state=TARGET;
	
end
/////
TARGET: begin
	if (enter==1 && game_mode==0)
		Next_state=SINGLE;
	else if (enter==1 && game_mode==1)
		Next_state=DOUBLE;
	else if (enter==1 && game_mode==2)
		Next_state=COMPETITION;
	else 
		Next_state=TARGET;


end
/////
SINGLE: begin
	if(time_end2_single==0)
		Next_state=SINGLE;
	else if(show_fail_single==1 && time_end2_single==1)
		Next_state=FAIL;
	else 
		Next_state=PASS;
end
//////
DOUBLE: begin
	if(time_end2_double==0)
		Next_state=DOUBLE;
	else if(show_fail_double==1 && time_end2_double==1)
		Next_state=FAIL;
	else 
		Next_state=PASS;
end
//////
COMPETITION: begin
	if(time_end2_com==0)
		Next_state=COMPETITION;
	else if(show_fail_com==1 && time_end2_com==1)
		Next_state=FAIL;
	else 
		Next_state=PASS;
end
//////
FAIL:begin
	Next_state=FAIL;
end
//////
PASS: begin
	if(enter==1)
		Next_state=PASS_hold;
	else
		Next_state=PASS;
end
//////


PASS_hold:begin
	if(enter==0)
		Next_state=SHOP;
	else
		Next_state=PASS_hold;

end
//////
SHOP: begin
	if(enter==1)
		Next_state=SHOP_hold;
	else
		Next_state=SHOP;
end
/////
SHOP_hold:begin
	if(enter==0)
		Next_state=RANDOM;
	else
		Next_state=SHOP_hold;


end
/////
default: begin

		Next_state=Next_state;
end
		
		
	endcase
end
////////////////////////////////////////////////////////////////////////
//here begin signal definition
always_ff @(posedge Clk) begin
case(State)
	GAME_START:begin
		display_game_start<=1;
		display_random<=0;
		display_target<=0;
		display_single<=0;
		display_double<=0;
		display_competition<=0;
		display_fail<=0;
		display_pass<=0;
		display_shop<=0;
	
	end
	/////
	RANDOM: begin
		display_game_start<=0;
		display_random<=1;
		display_target<=0;
		display_single<=0;
		display_double<=0;
		display_competition<=0;
		display_fail<=0;
		display_pass<=0;
		display_shop<=0;
	end
	/////
	TARGET:begin
		display_game_start<=0;
		display_random<=0;
		display_target<=1;
		display_single<=0;
		display_double<=0;
		display_competition<=0;
		display_fail<=0;
		display_pass<=0;
		display_shop<=0;
	
	end
	/////
	SINGLE: begin
		display_game_start<=0;
		display_random<=0;
		display_target<=0;
		display_single<=1;
		display_double<=0;
		display_competition<=0;
		display_fail<=0;
		display_pass<=0;
		display_shop<=0;
	
	
	end
	/////
	DOUBLE: begin
		display_game_start<=0;
		display_random<=0;
		display_target<=0;
		display_single<=0;
		display_double<=1;
		display_competition<=0;
		display_fail<=0;
		display_pass<=0;
		display_shop<=0;
	end
	/////
	COMPETITION: begin
		display_game_start<=0;
		display_random<=0;
		display_target<=0;
		display_single<=0;
		display_double<=0;
		display_competition<=1;
		display_fail<=0;
		display_pass<=0;
		display_shop<=0;
	end
	/////
	FAIL: begin
		display_game_start<=0;
		display_random<=0;
		display_target<=0;
		display_single<=0;
		display_double<=0;
		display_competition<=0;
		display_fail<=1;
		display_pass<=0;
		display_shop<=0;
	end
	/////
	PASS: begin
		display_game_start<=0;
		display_random<=0;
		display_target<=0;
		display_single<=0;
		display_double<=0;
		display_competition<=0;
		display_fail<=0;
		display_pass<=1;
		display_shop<=0;
	end
	/////
	PASS_hold:begin
		display_game_start<=0;
		display_random<=0;
		display_target<=0;
		display_single<=0;
		display_double<=0;
		display_competition<=0;
		display_fail<=0;
		display_pass<=1;
		display_shop<=0;
	end
	/////
	SHOP: begin
		display_game_start<=0;
		display_random<=0;
		display_target<=0;
		display_single<=0;
		display_double<=0;
		display_competition<=0;
		display_fail<=0;
		display_pass<=0;
		display_shop<=1;
	end
	/////
	SHOP_hold:begin
		display_game_start<=0;
		display_random<=0;
		display_target<=0;
		display_single<=0;
		display_double<=0;
		display_competition<=0;
		display_fail<=0;
		display_pass<=0;
		display_shop<=1;
	end

default: begin
display_game_start<=0;
display_random<=0;
display_target<=0;
display_single<=0;
display_double<=0;
display_competition<=0;
display_fail<=0;
display_pass<=0;
display_shop<=0;
end
endcase


end
//////////////////////////////////////////////////////////////////////


endmodule
