module background_game(
								input Clk, 
								input logic [9:0] DrawX, DrawY,
								output logic is_background_game,
								output logic[3:0] background_game_index





);

parameter [9:0] SCREEN_WIDTH =  10'd480;
parameter [9:0] SCREEN_LENGTH = 10'd640;
logic [18:0] read_address;

always_comb begin

is_background_game=1;
read_address=  (DrawY/2) *(  SCREEN_LENGTH/2)  +  (DrawX/2);




end



background_game_rom rom(.read_address(read_address) ,.clk(Clk),    .background_game_index(background_game_index));

endmodule







module background_game_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] background_game_index
	

);







logic [3:0] memory[76800];
initial
begin
	 $readmemh("sprite/background_game.txt", memory);
end



always_ff @ (posedge clk) begin
	background_game_index<= memory[read_address];
end

endmodule



