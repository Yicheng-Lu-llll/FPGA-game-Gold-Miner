module background_game_double(
								input Clk, 
								input logic [9:0] DrawX, DrawY,
								output logic is_bgdouble,
								output logic[3:0] bgdouble_index,player1_index,player2_index,
								output logic is_player1,is_player2
						




);

parameter [9:0] SCREEN_WIDTH =  10'd480;
parameter [9:0] SCREEN_LENGTH = 10'd640;
logic [18:0] read_address,read_address1,read_address2;

always_comb begin

is_bgdouble=1;
read_address=  (DrawY/2) *(  SCREEN_LENGTH/2)  +  (DrawX/2);
if (DrawX>=70 &&DrawX<=210 &&DrawY>=20 &&DrawY<=80)begin
	is_player1=1;
	is_player2=0;
	end
else if (DrawX>=380 &&DrawX<=520 &&DrawY>=20 &&DrawY<=80)begin
	is_player1=0;
	is_player2=1;
	end
else begin
	is_player1=0;
	is_player2=0;
	end
read_address1=(DrawX-70)+140*(DrawY-20);
read_address2=(DrawX-380)+140*(DrawY-20);



end



bgdouble_rom rom_ins(.read_address(read_address) ,.clk(Clk),    .bgdouble_index(bgdouble_index));
man1_rom rom_player1(.read_address(read_address1) ,.clk(Clk),    .man1_index(player1_index));
man1_rom rom_player2(.read_address(read_address2) ,.clk(Clk),    .man1_index(player2_index));
endmodule





module bgdouble_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] bgdouble_index
	

);







logic [3:0] memory[76800];
initial
begin
	 $readmemh("sprite/bgdouble.txt", memory);
end



always_ff @ (posedge clk) begin
	bgdouble_index<= memory[read_address];
end

endmodule


module man1_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] man1_index
	

);







logic [3:0] memory[8400];
initial
begin
	 $readmemh("sprite/man1.txt", memory);
end



always_ff @ (posedge clk) begin
	man1_index<= memory[read_address];
end

endmodule


