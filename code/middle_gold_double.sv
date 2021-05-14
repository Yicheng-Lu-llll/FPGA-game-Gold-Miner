module middle_gold_double(
								input Clk, 
								input logic [9:0] DrawX, DrawY,
								input logic [9:0] goldx,goldy,
								input logic [9:0] tailyl,tailxl,tailxr,tailyr,
								input logic reset,
								input logic[3:0] R_model,R_moder,
								input logic [2:0]state_outl,state_outr,
								output logic is_big_gold,
								output logic[3:0] big_gold_index,
								output logic destroy,destroyl,destroyr,
								output logic is_catchl,is_catchr,
								
								output logic [2:0]State_gold_out,
								
								
								input logic  is_new_game_start,
								input logic is_explodel,is_exploder
								


);

////////////////////////////////////////////////////////////////////////
///width and length of gold picture ,///width and length of background
parameter [9:0] WIDTH =  10'd30;
parameter [9:0] LENGTH = 10'd40;
parameter [9:0] SCREEN_WIDTH =  10'd480;
parameter [9:0] SCREEN_LENGTH = 10'd640;


logic [18:0] read_address;
assign read_address=  (DrawY-current_y) * LENGTH +  (DrawX-current_x);
logic test;

logic [18:0] read_address1;
logic[3:0] big_gold_index1;
assign read_address1=  (string_tailyl-current_y) * LENGTH +  (string_tailxl-current_x);


logic [18:0] read_address2;
logic[3:0] big_gold_index2;
assign read_address2=  (string_tailyr-current_y) * LENGTH +  (string_tailxr-current_x);


///current (x,y) of gold.
logic[9:0] current_x;
logic[9:0] current_y;

///State of gold
enum logic[2:0]{stay,movel,mover,disappearl,disappearr}State, Next_state;
//logic [2:0] State_gold_out;
assign State_gold_out=State;



//test
logic testl,testr;
assign testl=(string_tailxl<=(current_x+LENGTH) && string_tailxl>=current_x  && string_tailyl<=(current_y+WIDTH)  && string_tailyl>=current_y && big_gold_index1!=0) ;
assign testr=(string_tailxr<=(current_x+LENGTH) && string_tailxr>=current_x  && string_tailyr<=(current_y+WIDTH)  && string_tailyr>=current_y && big_gold_index2!=0) ;




logic [9:0] string_tailyr,string_tailxr,string_tailyl,string_tailxl;
always_ff@ (posedge Clk)begin
	string_tailxl<=tailxl;
	string_tailyl<=tailyl;
	string_tailxr<=tailxr;
	string_tailyr<=tailyr;
	

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
			if(testl==1 )//string_tailx<=(current_x+LENGTH) && string_tailx>=current_x  && string_taily<=(current_y+WIDTH)  && string_taily>=current_y && big_gold_index1!=0) 
				Next_state=movel;
			else if( testr==1)
				Next_state=mover;
			else
				Next_state=stay;
				

			
		end
		
		movel: begin
		
				Next_state=disappearl;
	
				
				
		end
		
		
		mover: begin
			
				Next_state=disappearr;
		
				
				
		end		
		
		
		disappearl: begin
			Next_state = disappearl;
		end
		
		disappearr: begin
			Next_state = disappearr;
		end
	endcase
	
end
////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////
logic[9:0] gold_adder;
logic [31:0] gold_adder_internal;
int target=8000000;

always_ff @ (posedge Clk) begin
	if (reset||(State!=mover&&State!=movel)||is_new_game_start) begin
		gold_adder_internal<=0;
		gold_adder<=0;
		end
	else if (gold_adder_internal==target/2) begin
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
						destroyl<=0;	
						destroyr<=0;			
						is_catchl<=0;
						is_catchr<=0;
					end
			
			

			movel: begin
			
			
						case(R_model)
											4'd10: begin
											
																current_x<=goldx-6*gold_adder;
																current_y<=goldy ;
																destroy<=0;
																destroyl<=0;	
																destroyr<=0;	
																is_catchl<=1;
																is_catchr<=0;
											
													 end
													 
													 
											4'd9:  begin
											
																current_x<=goldx-6*gold_adder;
																current_y<=goldy-1*gold_adder ;
																destroy<=0;
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=1;	
																is_catchr<=0;
											
													 end
													 
													 
											4'd8:  begin
											
																current_x<=goldx-5*gold_adder;
																current_y<=goldy-2*gold_adder ;
																destroy<=0;	
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=1;	
																is_catchr<=0;
													 end	
									
									
											4'd7:  begin
											
																current_x<=goldx-4*gold_adder;
																current_y<=goldy-3*gold_adder ;
																destroy<=0;	
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=1;
																is_catchr<=0;
													 end		
									
									
											4'd6:  begin
											
																current_x<=goldx-2*gold_adder;
																current_y<=goldy-4*gold_adder ;
																destroy<=0;
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=1;
																is_catchr<=0;
													 end	
										
										
											4'd5:  begin
											
																current_x<=goldx;
																current_y<=goldy-6*gold_adder ;
																destroy<=0;		
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=1;
																is_catchr<=0;
													 end	
													 
													 
											4'd4:  begin
											
																current_x<=goldx+2*gold_adder;
																current_y<=goldy-4*gold_adder ;
																destroy<=0;	
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=1;
																is_catchr<=0;	
													 end		
													 
													 
											4'd3:  begin
											
																current_x<=goldx+4*gold_adder;
																current_y<=goldy-3*gold_adder ;
																destroy<=0;
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=1;
																is_catchr<=0;	
													 end	
													 
													 
											4'd2:  begin
											
																current_x<=goldx+5*gold_adder;
																current_y<=goldy-2*gold_adder ;
																destroy<=0;		
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=1;
																is_catchr<=0;	
													 end		
									
									
											4'd1:  begin
											
																current_x<=goldx+6*gold_adder;
																current_y<=goldy-1*gold_adder ;
																destroy<=0;	
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=1;
																is_catchr<=0;	
													 end		
									
									
											4'd0:  begin
											
																current_x<=goldx+6*gold_adder;
																current_y<=goldy;
																destroy<=0;	
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=1;
																is_catchr<=0;	
													 end
						
						
											default: begin
											
																is_catchl<=0;
																is_catchr<=0;
																current_x<=goldx;
																current_y<=goldy ;
																destroy<=0;	
																destroyl<=0;	
																destroyr<=0;
														
														end
						endcase
	
					end
					
					
			mover: begin
			
			
						case(R_moder)
											4'd10: begin
											
																current_x<=goldx-6*gold_adder;
																current_y<=goldy ;
																destroy<=0;	
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=0;
																is_catchr<=1;
											
													 end
													 
													 
											4'd9:  begin
											
																current_x<=goldx-6*gold_adder;
																current_y<=goldy-1*gold_adder ;
																destroy<=0;
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=0;	
																is_catchr<=1;
											
													 end
													 
													 
											4'd8:  begin
											
																current_x<=goldx-5*gold_adder;
																current_y<=goldy-2*gold_adder ;
																destroy<=0;	
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=0;	
																is_catchr<=1;
													 end	
									
									
											4'd7:  begin
											
																current_x<=goldx-4*gold_adder;
																current_y<=goldy-3*gold_adder ;
																destroy<=0;	
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=0;
																is_catchr<=1;
													 end		
									
									
											4'd6:  begin
											
																current_x<=goldx-2*gold_adder;
																current_y<=goldy-4*gold_adder ;
																destroy<=0;		
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=0;
																is_catchr<=1;
													 end	
										
										
											4'd5:  begin
											
																current_x<=goldx;
																current_y<=goldy-6*gold_adder ;
																destroy<=0;	
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=0;
																is_catchr<=1;
													 end	
													 
													 
											4'd4:  begin
											
																current_x<=goldx+2*gold_adder;
																current_y<=goldy-4*gold_adder ;
																destroy<=0;	
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=0;
																is_catchr<=1;	
													 end		
													 
													 
											4'd3:  begin
											
																current_x<=goldx+4*gold_adder;
																current_y<=goldy-3*gold_adder ;
																destroy<=0;	
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=0;
																is_catchr<=1;	
													 end	
													 
													 
											4'd2:  begin
											
																current_x<=goldx+5*gold_adder;
																current_y<=goldy-2*gold_adder ;
																destroy<=0;
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=0;
																is_catchr<=1;	
													 end		
									
									
											4'd1:  begin
											
																current_x<=goldx+6*gold_adder;
																current_y<=goldy-1*gold_adder ;
																destroy<=0;		
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=0;
																is_catchr<=1;	
													 end		
									
									
											4'd0:  begin
											
																current_x<=goldx+6*gold_adder;
																current_y<=goldy;
																destroy<=0;	
																destroyl<=0;	
																destroyr<=0;
																is_catchl<=0;
																is_catchr<=1;	
													 end
						
						
											default: begin
											
																is_catchl<=0;
																is_catchr<=0;
																destroyl<=0;	
																destroyr<=0;
																current_x<=goldx;
																current_y<=goldy ;
																destroy<=0;	
														
														end
						endcase
	
					end
					
					
					
			disappearl: begin 
						current_x<=0;
						current_y<=0;
						destroy<=1;	
						destroyl<=1;	
						destroyr<=0;
						is_catchl<=0;
						is_catchr<=0;	
						end
						
						
			disappearr: begin 
						current_x<=0;
						current_y<=0;
						destroy<=1;	
						destroyl<=0;	
						destroyr<=1;
						is_catchl<=0;
						is_catchr<=0;	
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



midgold_rom rom(.read_address(read_address) ,.clk(Clk),    .big_gold_index(big_gold_index));
midgold_rom rom1(.read_address(read_address1) ,.clk(Clk),    .big_gold_index(big_gold_index1));
midgold_rom rom2(.read_address(read_address2) ,.clk(Clk),    .big_gold_index(big_gold_index2));
endmodule






