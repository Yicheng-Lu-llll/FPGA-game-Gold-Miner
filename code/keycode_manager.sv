module keycode_manager(

						input logic [31:0] keycode,
						input logic [31:0] keycode0,
						input logic [31:0] keycode1,
						input logic [31:0] keycode2,
						
						output logic  player1_want_catch,
						output logic  player2_want_catch,
						output logic  left,
						output logic  right,
						output logic  enter,
						output logic space,
						output logic upper,upper2

);




    
always_comb begin
				player1_want_catch=0;
				player2_want_catch=0;
				left=0;
				right=0;
				enter=0;
				space=0;
				upper=0;
				upper2=0;
	case(keycode[7:0])
		8'h16://s
					player1_want_catch=1;
		
		8'h51://down
					player2_want_catch=1;
		
		
		8'h4://A
					left=1;
		
		8'h7://D
					right=1;
					
					
		8'h28://enter
					enter=1;
					
		8'h2C://space
					space=1;
		8'h1A://W
				upper=1;
		8'h52: //up
				upper2=1;
				
	endcase
	

	case(keycode0[7:0])
		8'h16://s
					player1_want_catch=1;
		
		8'h51://down
					player2_want_catch=1;
		
		
		8'h4://A
					left=1;
		
		8'h7://D
					right=1;
					
		8'h28://enter
					enter=1;
					
		8'h2C://space
					space=1;
		8'h1A://W
				upper=1;
				
		8'h52: //up
				upper2=1;
						
	endcase
	
	
	case(keycode1[7:0])
		8'h16://s
					player1_want_catch=1;
		
		8'h51://down
					player2_want_catch=1;
		
		
		8'h4://A
					left=1;
		
		8'h7://D
					right=1;
					
		8'h28://enter
					enter=1;
					
		8'h2C://space
					space=1;
	
		8'h1A://W
				upper=1;
		8'h52: //up
				upper2=1;
								
	endcase
	
	
	case(keycode2[7:0])
		8'h16://s
					player1_want_catch=1;
		
		8'h51://down
					player2_want_catch=1;
		
		
		8'h4://A
					left=1;
		
		8'h7://D
					right=1;
					
		8'h28://enter
					enter=1;
					
		8'h2C://space
					space=1;
					
		8'h1A://W
				upper=1;
		8'h52: //up
				upper2=1;
						
	endcase

end

endmodule
