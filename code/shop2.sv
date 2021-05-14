
module shop2( input logic Clk,
						input logic reset,
						input logic [9:0] DrawX, DrawY,
						input logic left,
						input logic right,
						input logic space,
						input logic display_shop,
						
						output logic[3:0] shop_index,
						output logic [3:0] bomb_index,water_index,next_index,boss_index,badboss_index,
						output logic is_shop, is_bomb,is_water,is_next,is_boss,is_badboss,
						output logic bomb_num, water_num,
						output logic change_mode_signal,
						output logic [3:0]test_state
						
						




);
logic [18:0] read_address,read_address1,read_address2,read_address3,read_address4,read_address5;
parameter [9:0] SCREEN_WIDTH =  10'd480;
parameter [9:0] SCREEN_LENGTH = 10'd640;						
						
assign test_state=State;					
enum logic[3:0]{bomb,water,next,bomb_hold,next_hold,finish}State, Next_state;


//
//logic change_mode_signal;
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
				State <= bomb;
			else 
				State <= Next_state;
		end
	

always_comb begin

	unique case(State)
		bomb: begin
			if(display_shop==0)
				Next_state=finish;
				
			else if(right==1) 
				Next_state=bomb_hold;
			
			else
				Next_state=bomb;
			end
			
			
		bomb_hold: begin
			if(right==0) 
				Next_state=water;
			else
				Next_state=bomb_hold;
			end
			
				
		water:begin
			if(display_shop==0)
				Next_state=finish;			
			else if(right==1)
				Next_state=next;
			else if(left==1)
				Next_state=bomb;
			else
				Next_state=water;
			end
			
			
		next: begin
			if(display_shop==0)
				Next_state=finish;
			else if(left==1)
				Next_state=next_hold;
			else
				Next_state=next;
			end
		
		
		
		next_hold:begin
			if(left==0)
				Next_state=water;
			else
				Next_state=next_hold;				
		
		end
		
		
		finish:
			if(display_shop==1)
			Next_state=bomb;
			else
			Next_state=finish;
	endcase


	
end

logic water_add,bomb_add;

always_ff @(posedge Clk) begin
	case(State)
	bomb:begin
		if (space==1 && bomb_add==0)begin
			bomb_num<=1;
			bomb_add<=1;
			end
		else if (bomb_add==1)
			bomb_num<=1;
		else
			bomb_num<=0;
		
		if(DrawX>=60 && DrawX<=119 && DrawY>=141 &&DrawY<=200 )begin
			if(change_mode_signal==1)begin
				is_bomb<=1;
				is_water<=0;
				is_next<=0;
				is_boss<=0;
				is_badboss<=0;
			end
			else begin
				is_bomb<=1;
				is_water<=0;
				is_next<=0;
				is_boss<=0;
				is_badboss<=0;
			end
		end
		else if (DrawX>=160 && DrawX<=219 && DrawY>=141 &&DrawY<=200 )begin
				is_bomb<=0;
				is_water<=1;
				is_next<=0;
				is_boss<=0;
				is_badboss<=0;
		end
		else if(DrawX>=260 && DrawX<=339 && DrawY>=151 &&DrawY<=200 ) begin
			is_bomb<=0;
			is_water<=0;
			is_next<=1;
			is_boss<=0;
			is_badboss<=0;
		end
		else if(DrawX>=480 && DrawX<=579 && DrawY>=101 &&DrawY<=200 ) begin
			is_bomb<=0;
			is_water<=0;
			is_next<=0;
			is_boss<=1;
			is_badboss<=0;
		end
		else begin
			is_bomb<=0;
			is_water<=0;
			is_next<=0;
			is_boss<=0;
			is_badboss<=0;
		end
	end
	//
	bomb_hold:begin
		if (space==1 && bomb_add==0)begin
			bomb_num<=1;
			bomb_add<=1;
			end
		else if (bomb_add==1)
			bomb_num<=1;
		else
			bomb_num<=0;
		
		if(DrawX>=60 && DrawX<=119 && DrawY>=141 &&DrawY<=200 )begin
			if(change_mode_signal==1)begin
				is_bomb<=1;
				is_water<=0;
				is_next<=0;
				is_boss<=0;
				is_badboss<=0;
			end
			else begin
				is_bomb<=0;
				is_water<=0;
				is_next<=0;
				is_boss<=0;
				is_badboss<=0;
			end
		end
		else if (DrawX>=160 && DrawX<=219 && DrawY>=141 &&DrawY<=200 )begin
				is_bomb<=0;
				is_water<=1;
				is_next<=0;
				is_boss<=0;
				is_badboss<=0;
		end
		else if(DrawX>=260 && DrawX<=339 && DrawY>=151 &&DrawY<=200 ) begin
			is_bomb<=0;
			is_water<=0;
			is_next<=1;
			is_boss<=0;
			is_badboss<=0;
		end
		else if(DrawX>=480 && DrawX<=579 && DrawY>=101 &&DrawY<=200 ) begin
			is_bomb<=0;
			is_water<=0;
			is_next<=0;
			is_boss<=1;
			is_badboss<=0;
		end
		else begin
			is_bomb<=0;
			is_water<=0;
			is_next<=0;
			is_boss<=0;
			is_badboss<=0;
		end
	end
	//
	water:begin
		if (space==1 && water_add==0)begin
			water_num<=1;
			water_add<=1;
			end
		else if (water_add==1)
			water_num<=1;
		else
			water_num<=0;
		
		if(DrawX>=160 && DrawX<=219 && DrawY>=141 &&DrawY<=200 )begin
			if(change_mode_signal==1)begin
				is_bomb<=0;
				is_water<=1;
				is_next<=0;
				is_boss<=0;
				is_badboss<=0;
			end
			else begin
				is_bomb<=0;
				is_water<=0;
				is_next<=0;
				is_boss<=0;
				is_badboss<=0;
			end
		end
		else if (DrawX>=60 && DrawX<=119 && DrawY>=141 &&DrawY<=200 )begin
				is_bomb<=1;
				is_water<=0;
				is_next<=0;
				is_boss<=0;
				is_badboss<=0;
		end
		else if(DrawX>=260 && DrawX<=339 && DrawY>=151 &&DrawY<=200 ) begin
			is_bomb<=0;
			is_water<=0;
			is_next<=1;
			is_boss<=0;
			is_badboss<=0;
		end
		else if(DrawX>=480 && DrawX<=579 && DrawY>=101 &&DrawY<=200 ) begin
			is_bomb<=0;
			is_water<=0;
			is_next<=0;
			is_boss<=1;
			is_badboss<=0;
		end
		else begin
			is_bomb<=0;
			is_water<=0;
			is_next<=0;
			is_boss<=0;
			is_badboss<=0;
		end
	end
	//
	next:begin

		if(DrawX>=260 && DrawX<=339 && DrawY>=151 &&DrawY<=200 )begin
			if(change_mode_signal==1)begin
				is_bomb<=0;
				is_water<=0;
				is_next<=1;
				is_boss<=0;
				is_badboss<=0;
			end
			else begin
				is_bomb<=0;
				is_water<=0;
				is_next<=0;
				is_boss<=0;
				is_badboss<=0;
			end
		end
		else if (DrawX>=60 && DrawX<=119 && DrawY>=141 &&DrawY<=200 )begin
				is_bomb<=1;
				is_water<=0;
				is_next<=0;
				is_boss<=0;
				is_badboss<=0;
		end
		else if(DrawX>=160 && DrawX<=219 && DrawY>=141 &&DrawY<=200 )begin
			is_bomb<=0;
			is_water<=1;
			is_next<=0;
			is_boss<=0;
			is_badboss<=0;
		end
		else if(DrawX>=480 && DrawX<=579 && DrawY>=101 &&DrawY<=200 ) begin
			is_bomb<=0;
			is_water<=0;
			is_next<=0;
			is_boss<=0;
			is_badboss<=1;
		end
		else begin
			is_bomb<=0;
			is_water<=0;
			is_next<=0;
			is_boss<=0;
			is_badboss<=0;
		end
	end
	//
		next_hold:begin

		if(DrawX>=260 && DrawX<=339 && DrawY>=151 &&DrawY<=200 )begin
			if(change_mode_signal==1)begin
				is_bomb<=0;
				is_water<=0;
				is_next<=1;
				is_boss<=0;
				is_badboss<=0;
			end
			else begin
				is_bomb<=0;
				is_water<=0;
				is_next<=0;
				is_boss<=0;
				is_badboss<=0;
			end
		end
		else if (DrawX>=60 && DrawX<=119 && DrawY>=141 &&DrawY<=200 )begin
				is_bomb<=1;
				is_water<=0;
				is_next<=0;
				is_boss<=0;
				is_badboss<=0;
		end
		else if(DrawX>=160 && DrawX<=219 && DrawY>=141 &&DrawY<=200 )begin
			is_bomb<=0;
			is_water<=1;
			is_next<=0;
			is_boss<=0;
			is_badboss<=0;
		end
		else if(DrawX>=480 && DrawX<=579 && DrawY>=101 &&DrawY<=200 ) begin
			is_bomb<=0;
			is_water<=0;
			is_next<=0;
			is_boss<=0;
			is_badboss<=1;
		end
		else begin
			is_bomb<=0;
			is_water<=0;
			is_next<=0;
			is_boss<=0;
			is_badboss<=0;
		end
	end
	//
	finish: begin
			is_bomb<=0;
			is_water<=0;
			is_next<=0;
			is_boss<=0;
			is_badboss<=0;
			water_add<=0;
			bomb_add<=0;
			bomb_num<=bomb_num;
			water_num<=water_num;
end
//////
default: begin
			is_bomb<=is_bomb;
			is_water<=is_water;
			is_next<=is_next;
			is_boss<=is_boss;
			is_badboss<=is_badboss;
			bomb_num<=bomb_num;
			water_num<=water_num;
			water_add<=water_add;
			bomb_add<=water_add;
end
////////////////
endcase
end



///////////////////////////////////////////////////////////////////////////////
always_comb begin
read_address=  (DrawY/2) *(  SCREEN_LENGTH/2)  +  (DrawX/2);
read_address1=(DrawX-60)+60*(DrawY-141);
read_address2=(DrawX-160)+60*(DrawY-141);
read_address3=(DrawX-260)+50*(DrawY-151);
read_address4=(DrawX-480)+100*(DrawY-101);
read_address5=(DrawX-480)+100*(DrawY-101);
end
///////////////////////////////////////

shop_rom shop_rom(.read_address(read_address) ,.clk(Clk),    .shop_index(shop_index));

bomb_rom bomb_rom(.read_address(read_address1) ,.clk(Clk),    .bomb_index(bomb_index));

water_rom water_rom(.read_address(read_address2) ,.clk(Clk),    .water_index(water_index));

next_rom next_rom(.read_address(read_address3) ,.clk(Clk),    .next_index(next_index));

boss_rom boss_rom(.read_address(read_address4) ,.clk(Clk),    .boss_index(boss_index));

badboss_rom badboss_rom(.read_address(read_address5) ,.clk(Clk),    .badboss_index(badboss_index));


endmodule

module shop_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] shop_index
	

);







logic [3:0] memory[76800];
initial
begin
	 $readmemh("sprite/shop.txt", memory);
end



always_ff @ (posedge clk) begin
	
	shop_index<= memory[read_address];
end

endmodule

module bomb_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] bomb_index
	

);







logic [3:0] memory[3600];
initial
begin
	 $readmemh("sprite/zhayao.txt", memory);
end



always_ff @ (posedge clk) begin
	
	bomb_index<= memory[read_address];
end

endmodule


module water_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] water_index
	

);







logic [3:0] memory[3600];
initial
begin
	 $readmemh("sprite/water.txt", memory);
end



always_ff @ (posedge clk) begin
	
	water_index<= memory[read_address];
end

endmodule


module next_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] next_index
	

);







logic [3:0] memory[4000];
initial
begin
	 $readmemh("sprite/next.txt", memory);
end



always_ff @ (posedge clk) begin
	
	next_index<= memory[read_address];
end

endmodule


module boss_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] boss_index
	

);







logic [3:0] memory[9000];
initial
begin
	 $readmemh("sprite/boss.txt", memory);
end



always_ff @ (posedge clk) begin
	
	boss_index<= memory[read_address];
end

endmodule


module badboss_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] badboss_index
	

);







logic [3:0] memory[9000];
initial
begin
	 $readmemh("sprite/badboss.txt", memory);
end



always_ff @ (posedge clk) begin
	
	badboss_index<= memory[read_address];
end

endmodule
