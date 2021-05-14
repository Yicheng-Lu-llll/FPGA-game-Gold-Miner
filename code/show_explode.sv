module show_explode(
									input Clk, 
									input reset,
									input logic [9:0] DrawX, DrawY,
									input logic [9:0] taily,tailx,
									input logic is_explode,
									input logic display_random,

									
									output logic is_explode_show,
									output logic[3:0] explode_index,
									output logic [2:0] state_out_explode,
									output logic change_mode_signal

);

parameter [9:0] WIDTH =  10'd50;//horizontal line
parameter [9:0] LENGTH = 10'd50;

logic[9:0] current_x;
logic[9:0] current_y;


logic [31:0] roof=30000000;
logic [31:0] counter1,counter2;

logic [18:0] read_address;
//logic[2:0] state_out_explode;
assign state_out_explode=State;

enum logic[2:0]{stay,show1,show2}State, Next_state;
//logic [2:0] State_out;
//assign State_out=State;

always_ff@ (posedge Clk)begin

if(reset || display_random)
	State<=stay;
else
	State<=Next_state;
end




always_comb begin
	case(State)
	
	
		stay: begin 
			if(is_explode)
				Next_state=show1;
			else
				 Next_state=stay;
				
			end
	
		show1: begin
			if(counter1==roof)
				Next_state=show2;
			else
				Next_state=show1;
				
		
			end
			
		
		
		show2: begin
			if(counter2==roof)
				Next_state=stay;
			else
				Next_state=show2;
		
			end
			
			
			
		default: begin 
			if(is_explode)
				Next_state=show1;
			else
				 Next_state=stay;
				
			end

		endcase
end






always_ff@ (posedge Clk)begin
	case(State)
	
	
		stay: begin 
			is_explode_show<=0;
			current_x<=tailx-20;
			current_y<=taily-20;

			end

		show1: begin
			if (DrawX<=(current_x+LENGTH) && DrawX>=current_x  && DrawY<=(current_y+WIDTH)  && DrawY>=current_y )
				is_explode_show<=1;
			else
				is_explode_show<=0;
			current_x<=current_x;
			current_y<=current_y;
			end
			
		show2: begin
			if (DrawX<=(current_x+LENGTH) && DrawX>=current_x  && DrawY<=(current_y+WIDTH)  && DrawY>=current_y )
				is_explode_show<=1;
			else
				is_explode_show<=0;
			current_x<=current_x;
			current_y<=current_y;
			end			
	endcase


end





/////////////////////////////////////
//counter1
always_ff @ (posedge Clk) begin
	if (State!=show1)
		counter1<=1'd0;

	else 
		counter1<=1'd1+counter1;

end

/////////////////////////////////////


/////////////////////////////////////
//counter2
always_ff @ (posedge Clk) begin
	if (State!=show2)
		counter2<=1'd0;

	else 
		counter2<=1'd1+counter2;

end

/////////////////////////////////////


always_comb begin
if(State==show2)
	read_address= (DrawY-current_y) * LENGTH +  (DrawX-current_x)+2500;
else
	read_address= (DrawY-current_y) * LENGTH +  (DrawX-current_x);
	
end




explode_rom abc(.read_address(read_address) ,.clk(Clk),  .explode_index(explode_index));

endmodule

















module explode_rom(
										input logic [18:0] read_address,
										input logic clk,
										input logic [2:0] State_out,
										output logic[3:0] explode_index
	

);







logic [3:0] memory[5000];
initial
begin
	 $readmemh("sprite/explode.txt", memory);
end


always_ff @ (posedge clk) begin
	
	explode_index<= memory[read_address];
end

endmodule













