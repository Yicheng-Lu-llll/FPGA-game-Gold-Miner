module fail_or_pass(
								input Clk, 
								input logic [9:0] DrawX, DrawY,
								input logic show_fail,   
								input logic time_end,
								output logic is_failorpass,
								output logic[3:0] fail_or_pass_index,
								output logic show_shop
						


);




parameter [9:0] SCREEN_WIDTH =  10'd480;
parameter [9:0] SCREEN_LENGTH = 10'd640;
logic [18:0] read_address;
/////////////////////////////
//show shop
logic [31:0] roof=150000000;
logic [31:0] current;
always_ff @(posedge Clk) begin
	if(time_end==1 && show_fail==0&& current==roof)begin
		current<=current;
		show_shop<=1;
	end
	else if(time_end==1 && show_fail==0&&current<roof)begin
		current<=current+32'd1;
		show_shop<=0;
	end
	
	else  begin
		current<=0;
		show_shop<=0;


	end
end
////////////////////////////
always_comb begin

read_address=  (DrawY/2) *(  SCREEN_LENGTH/2)  +  (DrawX/2);
end


always_ff @(posedge Clk)begin
if(show_fail==1 && time_end==1) begin
	is_failorpass<=1;end
	
else if(show_fail==0 && time_end==1)begin
	is_failorpass<=1;end
else if(show_fail==0 && time_end==1)begin
	is_failorpass<=0;end
else  begin
	is_failorpass<=0;end
	
end



fail_or_pass_rom rom(.read_address(read_address) ,.clk(Clk),    .fail_or_pass_index(fail_or_pass_index), .show_fail(show_fail));

endmodule



module fail_or_pass_rom(
										input logic [18:0] read_address,
										input logic clk,
										input logic show_fail,
										output logic[3:0] fail_or_pass_index
	

);







logic [3:0] memory[153600];
initial
begin
	 $readmemh("sprite/failorpass.txt", memory);
end



always_ff @ (posedge clk) begin
	if(show_fail==1)
	fail_or_pass_index<= memory[read_address];
	else
	fail_or_pass_index<= memory[read_address+76800];
end

endmodule

