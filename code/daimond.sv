module daimond(
								input Clk, 
								input logic [9:0] DrawX, DrawY,
								input logic [9:0] goldx,goldy,
								input logic [9:0] taily,tailx,
								input logic reset,
								input logic[3:0] R_mode,
								input logic [2:0]state_out,
								input logic is_explode,
								output logic is_big_gold,
								output logic[3:0] big_gold_index,
								output logic destroy,
								output logic is_catch,
								
								output logic [2:0]State_gold_out,
								
								
								input logic  is_new_game_start
								


);

////////////////////////////////////////////////////////////////////////
///width and length of gold picture ,///width and length of background
parameter [9:0] WIDTH =  10'd20;
parameter [9:0] LENGTH = 10'd20;
parameter [9:0] SCREEN_WIDTH =  10'd480;
parameter [9:0] SCREEN_LENGTH = 10'd640;


logic [18:0] read_address;
assign read_address=  (DrawY-current_y) * LENGTH +  (DrawX-current_x);
logic test;

logic [18:0] read_address1;
logic[3:0] big_gold_index1;
assign read_address1=  (string_taily-current_y) * LENGTH +  (string_tailx-current_x);



///current (x,y) of gold.
logic[9:0] current_x;
logic[9:0] current_y;

///State of gold
enum logic[2:0]{stay,move,disappear}State, Next_state;
//logic [2:0] State_gold_out;
assign State_gold_out=State;



//test

assign test=(string_tailx<=(current_x+LENGTH) && string_tailx>=current_x  && string_taily<=(current_y+WIDTH)  && string_taily>=current_y && big_gold_index1!=0) ;

logic [9:0] string_taily,string_tailx;
always_ff@ (posedge Clk)begin
	string_tailx<=tailx;
	string_taily<=taily;
	

end
////////////////////////////////////////////////////////////////////////







////////////////////////////////////////////////////////////////////////
///control the state of gold
always_ff@ (posedge Clk)begin

if(reset || is_new_game_start)
	State<=stay;
else
	State<=Next_state;
end
////////////////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////////////////
//control  next_state signal
always_comb begin
	case(State)
		stay: begin
			if(test==1)//string_tailx<=(current_x+LENGTH) && string_tailx>=current_x  && string_taily<=(current_y+WIDTH)  && string_taily>=current_y && big_gold_index1!=0) 
				Next_state=move;
			else
				Next_state=stay;
				

			
		end
		
		
		move: begin
			if (state_out==3'd0 || is_explode==1)
				Next_state=disappear;
			else
				Next_state=move;
				
				
		end
		
		
		disappear: begin
			Next_state = disappear;
		end
	endcase
	
end
////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////
logic[9:0] gold_adder;
logic [31:0] gold_adder_internal;
int target=8000000;

always_ff @ (posedge Clk) begin
	if (reset||State!=move||is_new_game_start) begin
		gold_adder_internal<=0;
		gold_adder<=0;
		end
	else if (gold_adder_internal==target/4) begin
		gold_adder_internal<=0;
		gold_adder<=1+gold_adder;
		end
	else begin
		gold_adder_internal<=gold_adder_internal+1;
		gold_adder<=gold_adder;
		end
end
////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////
///control the movement of current_x and current_y of the gold
always_ff@ (posedge Clk)begin

	case(State)
			stay: begin
						current_x<=goldx;
						current_y<=goldy;
						destroy<=0;		
						is_catch<=0;
					end
			
			

			move: begin
			
			
						case(R_mode)
											4'd10: begin
											
																current_x<=goldx-6*gold_adder;
																current_y<=goldy ;
																destroy<=0;	
																is_catch<=1;
											
													 end
													 
													 
											4'd9:  begin
											
																current_x<=goldx-6*gold_adder;
																current_y<=goldy-1*gold_adder ;
																destroy<=0;
																is_catch<=1;											
											
													 end
													 
													 
											4'd8:  begin
											
																current_x<=goldx-5*gold_adder;
																current_y<=goldy-2*gold_adder ;
																destroy<=0;											
																is_catch<=1;												
													 end	
									
									
											4'd7:  begin
											
																current_x<=goldx-4*gold_adder;
																current_y<=goldy-3*gold_adder ;
																destroy<=0;											
																is_catch<=1;												
													 end		
									
									
											4'd6:  begin
											
																current_x<=goldx-2*gold_adder;
																current_y<=goldy-4*gold_adder ;
																destroy<=0;											
																is_catch<=1;												
													 end	
										
										
											4'd5:  begin
											
																current_x<=goldx;
																current_y<=goldy-6*gold_adder ;
																destroy<=0;											
																is_catch<=1;	
													 end	
													 
													 
											4'd4:  begin
											
																current_x<=goldx+2*gold_adder;
																current_y<=goldy-4*gold_adder ;
																destroy<=0;											
																is_catch<=1;	
													 end		
													 
													 
											4'd3:  begin
											
																current_x<=goldx+4*gold_adder;
																current_y<=goldy-3*gold_adder ;
																destroy<=0;											
																is_catch<=1;	
													 end	
													 
													 
											4'd2:  begin
											
																current_x<=goldx+5*gold_adder;
																current_y<=goldy-2*gold_adder ;
																destroy<=0;											
																is_catch<=1;	
													 end		
									
									
											4'd1:  begin
											
																current_x<=goldx+6*gold_adder;
																current_y<=goldy-1*gold_adder ;
																destroy<=0;											
																is_catch<=1;	
													 end		
									
									
											4'd0:  begin
											
																current_x<=goldx+6*gold_adder;
																current_y<=goldy;
																destroy<=0;											
																is_catch<=1;	
													 end
						
						
											default: begin
											
																is_catch<=1;
																current_x<=goldx;
																current_y<=goldy ;
																destroy<=0;	
														
														end
						endcase
	
					end
			disappear: begin 
						current_x<=0;
						current_y<=0;
						destroy<=1;	
						is_catch<=0;
						end
	endcase
end


////////////////////////////////////////////////////////////////////////













always_comb begin
if (DrawX<=(current_x+LENGTH) && DrawX>=current_x  && DrawY<=(current_y+WIDTH)  && DrawY>=current_y &&destroy==0 ) 
	is_big_gold=1;
else 
	is_big_gold=0;
	

end



daimond_rom rom(.read_address(read_address) ,.clk(Clk),    .big_gold_index(big_gold_index));
daimond_rom rom1(.read_address(read_address1) ,.clk(Clk),    .big_gold_index(big_gold_index1));

endmodule







module daimond_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] big_gold_index
	

);







logic [3:0] memory[400];
initial
begin
	 $readmemh("sprite/daimond.txt", memory);
end



always_ff @ (posedge clk) begin
	big_gold_index<= memory[read_address];
end

endmodule
