module Game_start(input logic Clk,
						input logic reset,
						input logic [9:0] DrawX, DrawY,
						input logic left,
						input logic right,
						input logic space,
						input logic display_Game_start,
						
						
						
	
						output logic[3:0] Game_start_index,
						output logic [3:0] singlebutton_index,doublebutton_index,compbutton_index,
						output logic is_game_start, is_singlebutton,is_doublebutton,is_compbutton,
						output logic [1:0]game_mode
					//	output logic change_mode_signal
						
						
						
						);
						
						

logic [18:0] read_address,read_address1,read_address2,read_address3;
parameter [9:0] SCREEN_WIDTH =  10'd480;
parameter [9:0] SCREEN_LENGTH = 10'd640;						
						
					
enum logic[3:0]{single,single_hold,double,competition,competition_hold,finish}State, Next_state;


//
logic change_mode_signal;
logic [31:0] roof=25000000;
logic [31:0] current;
assign is_game_start=1;
 
always_ff @ (posedge Clk) begin
	if (reset==1'd1) begin
		current<=32'd0;
		change_mode_signal<=1'd0;
		end
	else if (current==roof) begin
		current<=32'd0;
		change_mode_signal<=change_mode_signal+1;
		end
	else begin
		current<=current+32'd1;
		change_mode_signal<=change_mode_signal;
		end
end







	always_ff @ (posedge Clk)
		begin
			if (reset) 
				State <= single;
			else 
				State <= Next_state;
		end
	

always_comb begin

	unique case(State)
		single: begin
			if(display_Game_start==0)
				Next_state=finish;
				
			else if(right==1) 
				Next_state=single_hold;
			
			else
				Next_state=single;
			end
			
			
		single_hold: begin
			if(right==0) 
				Next_state=double;
			else
				Next_state=single_hold;
			end
			
				
		double:begin
			if(display_Game_start==0)
				Next_state=finish;			
			else if(right==1)
				Next_state=competition;
			else if(left==1)
				Next_state=single;
			else
				Next_state=double;
			end
			
			
		competition: begin
			if(display_Game_start==0)
				Next_state=finish;
			else if(left==1)
				Next_state=competition_hold;
			else
				Next_state=competition;
			end
		
		
		
		competition_hold:begin
			if(left==0)
				Next_state=double;
			else
				Next_state=competition_hold;				
		
		end
		
		
		finish:
			Next_state=finish;
	endcase


	
end




always_ff @ (posedge Clk) begin

case(State)
	single: begin
		if (space==1)
			game_mode<=0;
		else
			game_mode<=3;
			
	
			
		if(DrawY>=270 && DrawY<=309 && DrawX>=20 && DrawX<=59)
			if(change_mode_signal==1)begin
				is_singlebutton<=1;
				is_doublebutton<=0;
				is_compbutton<=0;
			end
				
			else begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=0;
			end
		else if(DrawY>=270 && DrawY<=309 && DrawX>=68 && DrawX<=107)begin
				is_singlebutton<=0;
				is_doublebutton<=1;
				is_compbutton<=0;
		end
		else if(DrawY>=270 && DrawY<=309 && DrawX>=116 && DrawX<=155)begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=1;
		end
		else begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=0;
		end
	end
	
	
	single_hold:begin
		if (space==1)
			game_mode<=0;
		else
			game_mode<=3;
			
	
			
		if(DrawY>=270 && DrawY<=309 && DrawX>=20 && DrawX<=59)
			if(change_mode_signal==1)begin
				is_singlebutton<=1;
				is_doublebutton<=0;
				is_compbutton<=0;
			end
				
			else begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=0;
			end
		else if(DrawY>=270 && DrawY<=309 && DrawX>=68 && DrawX<=107)begin
				is_singlebutton<=0;
				is_doublebutton<=1;
				is_compbutton<=0;
		end
		else if(DrawY>=270 && DrawY<=309 && DrawX>=116 && DrawX<=155)begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=1;
		end
		else begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=0;
		end
	end

	double: begin
		if (space==1)
			game_mode<=1;
		else
			game_mode<=3;
			
			
		if(DrawY>=270 && DrawY<=309 && DrawX>=68 && DrawX<=107)
			if(change_mode_signal==1)begin
				is_singlebutton<=0;
				is_doublebutton<=1;
				is_compbutton<=0;
			end
				
			else begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=0;
			end
		else if(DrawY>=270 && DrawY<=309 && DrawX>=20 && DrawX<=59)begin
				is_singlebutton<=1;
				is_doublebutton<=0;
				is_compbutton<=0;
		end
		else if(DrawY>=270 && DrawY<=309 && DrawX>=116 && DrawX<=155)begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=1;
		end
		else begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=0;
		end
	end	

	competition: begin
		if (space==1)
			game_mode<=2;
		else
			game_mode<=3;
			
			
		if(DrawY>=270 && DrawY<=309 && DrawX>=116 && DrawX<=155)
			if(change_mode_signal==1)begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=1;
			end
				
			else begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=0;
			end
		else if(DrawY>=270 && DrawY<=309 && DrawX>=68 && DrawX<=107)begin
				is_singlebutton<=0;
				is_doublebutton<=1;
				is_compbutton<=0;
		end
		else if(DrawY>=270 && DrawY<=309 && DrawX>=20 && DrawX<=59)begin
				is_singlebutton<=1;
				is_doublebutton<=0;
				is_compbutton<=0;
		end
		else begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=0;
		end
	end
	
	competition_hold:begin
		if (space==1)
			game_mode<=2;
		else
			game_mode<=3;
			
			
		if(DrawY>=270 && DrawY<=309 && DrawX>=116 && DrawX<=155)
			if(change_mode_signal==1)begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=1;
			end
				
			else begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=0;
			end
		else if(DrawY>=270 && DrawY<=309 && DrawX>=68 && DrawX<=107)begin
				is_singlebutton<=0;
				is_doublebutton<=1;
				is_compbutton<=0;
		end
		else if(DrawY>=270 && DrawY<=309 && DrawX>=20 && DrawX<=59)begin
				is_singlebutton<=1;
				is_doublebutton<=0;
				is_compbutton<=0;
		end
		else begin
				is_singlebutton<=0;
				is_doublebutton<=0;
				is_compbutton<=0;
		end
	end
	
	
	
	
	finish: begin
			game_mode<=game_mode;
			is_singlebutton<=0;
			is_doublebutton<=0;
			is_compbutton<=0;
	end
	
	default: begin
		game_mode<=3;
		is_singlebutton<=0;
		is_doublebutton<=0;
		is_compbutton<=0;
	end

endcase





end
/////////////////////////////////////////////////////
//address assign
always_comb begin

read_address=  (DrawY/2) *(  SCREEN_LENGTH/2)  +  (DrawX/2);
read_address1=(DrawX-20)+40*(DrawY-270);
read_address2=(DrawX-68)+40*(DrawY-270);
read_address3=(DrawX-116)+40*(DrawY-270);


end




////////////////////////////////










Game_start_rom rom(.read_address(read_address) ,.clk(Clk),    .Game_start_index(Game_start_index));

single_rom single_rom_ins(.read_address(read_address1) ,.clk(Clk),    .singlebutton_index(singlebutton_index));

double_rom double_rom_ins(.read_address(read_address2) ,.clk(Clk),    .doublebutton_index(doublebutton_index));

comp_rom comp_rom_ins(.read_address(read_address3) ,.clk(Clk),    .compbutton_index(compbutton_index));

endmodule







module Game_start_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] Game_start_index
	

);







logic [3:0] memory[76800];
initial
begin
	 $readmemh("sprite/begin.txt", memory);
end



always_ff @ (posedge clk) begin
	
	Game_start_index<= memory[read_address];
end

endmodule

module single_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] singlebutton_index
	

);







logic [3:0] memory[1600];
initial
begin
	 $readmemh("sprite/single.txt", memory);
end



always_ff @ (posedge clk) begin
	
	singlebutton_index<= memory[read_address];
end

endmodule


module double_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] doublebutton_index
	

);







logic [3:0] memory[1600];
initial
begin
	 $readmemh("sprite/double.txt", memory);
end



always_ff @ (posedge clk) begin
	
	doublebutton_index<= memory[read_address];
end

endmodule



module comp_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] compbutton_index
	

);







logic [3:0] memory[1600];
initial
begin
	 $readmemh("sprite/comp.txt", memory);
end



always_ff @ (posedge clk) begin
	
	compbutton_index<= memory[read_address];
end

endmodule
