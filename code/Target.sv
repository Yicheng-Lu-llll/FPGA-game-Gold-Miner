module Target(
						input logic Clk,
						input logic reset,
						input logic display_target,
						input logic [9:0] DrawX, DrawY,
						
						output logic [19:0] target_score,
						output logic[3:0] target_index,
						output logic is_targetscore,is_target



);


logic [9:0] level;
logic add_once;
logic [18:0] read_address,read_address1;
parameter [9:0] SCREEN_WIDTH =  10'd480;
parameter [9:0] SCREEN_LENGTH = 10'd640;						
logic [3:0]num_p5,num_p4,num_p3,num_p2,num_p1;
logic [19:0]n1,n2,n3,n4,n5;					
assign is_target=1;
enum logic[4:0]{finish,add}State, Next_state;
always_ff @ (posedge Clk) begin
			if (reset) 
				State <= finish;
			else 
				State <= Next_state;
end




always_ff @ (posedge Clk) begin
	case(State) 
		finish: begin
			if(display_target==1)
				Next_state=add;
			else
				Next_state=finish;
		end
		
		
		
		add: begin
			if(display_target==0)
				Next_state=finish;
			else
				Next_state=add;
		end
		
	
	default:
		Next_state=Next_state;

	endcase
end




always_ff @ (posedge Clk) begin

	case(State)
		finish: begin
			if(reset) begin
				level<=0;
				add_once<=0;
				end
			else begin		
				level<=level;
				add_once<=0;
			end

			
		end
		
		add: begin
			if(add_once==0) begin
				level<=level+1;
				add_once<=1;
				end
			else begin//will never reach
				level<=level;
				add_once<=1;
			end

		end
		
		
		default: begin
				level<=level;
				add_once<=0;
				end
	endcase
end




assign target_score=80*level*level;




////////////////////////////////
//socre transform
always_ff@(posedge Clk)
begin
	n5<=target_score /10000;
	n4<=target_score /1000 ;
	n3<=target_score /100;
	n2<=target_score /10;
	n1<=target_score /1;
	num_p1<=n1-10*n2;	
	num_p2<=n2-10*n3;
	num_p3<=n3-10*n4;
	num_p4<=n4-10*n5;
	num_p5<=n5;
end



//////////////////////////////////////////////////////////////////////////////////////////
//address assign
//address assign
always_comb begin

read_address=  (DrawY/2) *(  SCREEN_LENGTH/2)  +  (DrawX/2);
if (DrawY>=10'd200 && DrawY<=10'd231 && DrawX<=10'd279 && DrawX>=10'd180)begin
	if (DrawX>=10'd180 && DrawX<=10'd195)
		read_address1=((DrawY-200)/2)*8+(DrawX-180)/2+128*num_p5;
	else if(DrawX>=10'd201 && DrawX<=10'd216)
		read_address1=((DrawY-200)/2)*8+(DrawX-201)/2+128*num_p4;
	else if(DrawX>=10'd222 && DrawX<=10'd237)
		read_address1=((DrawY-200)/2)*8+(DrawX-222)/2+128*num_p3;
	else if(DrawX>=10'd243 && DrawX<=10'd258)
		read_address1=((DrawY-200)/2)*8+(DrawX-243)/2+128*num_p2;
	else if(DrawX>=10'd264 && DrawX<=10'd279)
		read_address1=((DrawY-200)/2)*8+(DrawX-264)/2+128*num_p1;
	else 
		read_address1=0;
		end
else 
		read_address1=0;




end

//////////////////////////////////////////////////////////////




target_rom target_rom(.read_address(read_address) ,.clk(Clk),    .target_index(target_index));


font2_rom font2_rom(.read_address(read_address1) ,.clk(Clk),    .is_targetscore(is_targetscore));

endmodule










module target_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] target_index
	

);







logic [3:0] memory[76800];
initial
begin
	 $readmemh("sprite/target.txt", memory);
end



always_ff @ (posedge clk) begin
	
	target_index<= memory[read_address];
end

endmodule





module font2_rom(input logic [18:0] read_address,
					input logic clk,
					output is_targetscore);
					
logic memory[1920];
initial
begin
	 $readmemh("sprite/font.txt", memory);
end



always_ff @ (posedge clk) begin
	is_targetscore<= memory[read_address];
end
			
					
					
					
					
endmodule




