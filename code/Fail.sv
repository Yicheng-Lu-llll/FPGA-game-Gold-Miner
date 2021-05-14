module Fail(		input logic Clk,
					    input logic reset,
						input logic [9:0] DrawX, DrawY,
						input logic display_fail,
						output logic [3:0] fail_index,
						output logic is_fail

);
logic [18:0] read_address;
parameter [9:0] SCREEN_WIDTH =  10'd480;
parameter [9:0] SCREEN_LENGTH = 10'd640;		
assign is_fail=1;

always_comb begin
read_address=  (DrawY/2) *(  SCREEN_LENGTH/2)  +  (DrawX/2);

end
fail_rom fail_rom_ins(.read_address(read_address) ,.clk(Clk),    .fail_index(fail_index));

endmodule
//
module fail_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] fail_index
	

);







logic [3:0] memory[76800];
initial
begin
	 $readmemh("sprite/fail.txt", memory);
end



always_ff @ (posedge clk) begin
	fail_index<= memory[read_address];
	
end

endmodule

