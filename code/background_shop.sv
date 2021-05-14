module background_shop(
								input Clk, 
								input logic [9:0] DrawX, DrawY,
								output logic[3:0] background_shop_index





);
parameter [9:0] SCREEN_WIDTH =  10'd480;
parameter [9:0] SCREEN_LENGTH = 10'd640;
logic [18:0] read_address;

always_comb begin


read_address=  (DrawY/2) *(  SCREEN_LENGTH/2)  +  (DrawX/2);




end
background_shop_rom rom(.read_address(read_address) ,.clk(Clk),    .background_shop_index(background_shop_index));

endmodule


module background_shop_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] background_shop_index
	

);







logic [3:0] memory[76800];
initial
begin
	 $readmemh("sprite/shop.txt", memory);
end



always_ff @ (posedge clk) begin
	background_shop_index<= memory[read_address];
end

endmodule

