module whole_game_controller(

								input logic Clk, 
								input logic reset,
								input logic show_fail,   
								input logic time_end,
//								output logic is_failorpass,
//								output logic[3:0] fail_or_pass_index,
//								output logic show_shop,
//								
								
								output logic [31:0] is_new_game_start
						
);

always_ff@ (posedge Clk)begin

if(time_end==1 || reset==1)
	is_new_game_start<=32'd1;
	
else
	is_new_game_start<=0;
	
	




end


endmodule