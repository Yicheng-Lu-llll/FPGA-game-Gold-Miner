module Pass(
						input logic Clk,
						input logic reset,
						input logic display_pass,
						input logic [9:0] DrawX, DrawY,
						
						
						output logic[3:0] pass_index,
						output logic is_pass
);




logic [18:0] read_address;
parameter [9:0] SCREEN_WIDTH =  10'd480;
parameter [9:0] SCREEN_LENGTH = 10'd640;		
assign is_pass=display_pass;
///////////////////////////////////
enum logic[4:0]{finish,show}State, Next_state;
always_ff @ (posedge Clk) begin
			if (reset) 
				State <= finish;
			else 
				State <= Next_state;
end




always_ff @ (posedge Clk) begin
	case(State) 
		finish: begin
			if(display_pass==1)
				Next_state=show;
			else
				Next_state=finish;
		end
		
		
		
		show: begin
			if(display_pass==0)
				Next_state=finish;
			else
				Next_state=show;
		end
		
	
	default:
		Next_state=Next_state;

	endcase
end

//////////////////////////////////////////////////////////////////////
always_comb begin

read_address=  (DrawY/2) *(  SCREEN_LENGTH/2)  +  (DrawX/2);


end
///////////////////////////////////////////////////////////////////


pass_rom pass_rom_ins(.read_address(read_address) ,.clk(Clk),    .pass_index(pass_index));


endmodule
///


module pass_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] pass_index
	

);







logic [3:0] memory[76800];
initial
begin
	 $readmemh("sprite/pass.txt", memory);
end



always_ff @ (posedge clk) begin
	
	pass_index<= memory[read_address];
end

endmodule