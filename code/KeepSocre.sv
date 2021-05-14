module KeepSocre(
								input Clk, 
								input logic [9:0] DrawX, DrawY,
								input logic catch1,catch2,catch3, catch4, catch5, catch6, catch7, catch8, catch9, catch10, catch11, catch12, catch13, catch14,             
								input logic [2:0]state_out,
								input logic is_explode,
								input logic reset,
								input logic time_end,
								input logic [19:0] target_score,
								input logic display_random,
								input logic display_single,
								output logic is_score,
						
								output logic [19:0] total_score,
								output logic show_fail
								
							
								
);
//logic [19:0]total_score;
logic [19:0]read_address;

logic [3:0]num_p5,num_p4,num_p3,num_p2,num_p1;
logic [19:0]n1,n2,n3,n4,n5;
logic is_1add,is_2add,is_3add,is_4add,is_5add,is_6add,is_7add,is_8add,is_9add,is_10add,is_11add,is_12add,is_13add,is_14add;



///////////////////////////////////
//check fail or pass when time end
always_ff@(posedge Clk)begin
if(time_end==1 && total_score>=target_score)
	show_fail<=0;
else if(time_end==1 && total_score<target_score)
	show_fail<=1;
else show_fail<=0;
end

////////////////////////////////////
always_ff@(posedge Clk)
begin
	n5<=total_score /10000;
	n4<=total_score /1000 ;
	n3<=total_score /100;
	n2<=total_score /10;
	n1<=total_score /1;
	num_p1<=n1-10*n2;	
	num_p2<=n2-10*n3;
	num_p3<=n3-10*n4;
	num_p4<=n4-10*n5;
	num_p5<=n5;
end
//////////////////////////////////////////
always_ff @(posedge Clk ) begin
	if(reset||display_random)begin
		if(reset)
			total_score<=0;
		
		else
			total_score<=total_score;
		
		
		is_1add<=0;
		is_2add<=0;
		is_3add<=0;
		is_4add<=0;
		is_5add<=0;
		is_6add<=0;
		is_7add<=0;
		is_8add<=0;
		is_9add<=0;
		is_10add<=0;
		is_11add<=0;
		is_12add<=0;
		is_13add<=0;
		is_14add<=0;

	end
	else if (catch1==1 && is_1add==0 &&state_out==3'd0) begin
		if(display_single)
			total_score<=total_score+20'd500;
		is_1add<=1;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch1==1 && is_1add==0 &&state_out==3'd3) begin
		total_score<=total_score;
		is_1add<=1;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	//
	else if (catch2==1 && is_2add==0 &&state_out==3'd0) begin
		if(display_single)
			total_score<=total_score+20'd500;
		is_1add<=is_1add;
		is_2add<=1;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch2==1 && is_2add==0 &&state_out==3'd3) begin
		total_score<=total_score;
		is_1add<=is_1add;
		is_2add<=1;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch3==1 && is_3add==0 &&state_out==3'd0) begin
		if(display_single)
			total_score<=total_score+20'd250;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=1;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch3==1 && is_3add==0 &&state_out==3'd3) begin
		total_score<=total_score;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=1;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch4==1 && is_4add==0  &&state_out==3'd0) begin
		if(display_single)
			total_score<=total_score+20'd250;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=1;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch4==1 && is_4add==0  &&state_out==3'd3) begin
		total_score<=total_score;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=1;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch5==1 && is_5add==0 &&state_out==3'd0 ) begin
		if(display_single)
			total_score<=total_score+20'd100;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=1;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
		else if (catch5==1 && is_5add==0 &&state_out==3'd3 ) begin
		total_score<=total_score;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=1;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch6==1 && is_6add==0 &&state_out==3'd0) begin
		if(display_single)
			total_score<=total_score+20'd100;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=1;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch6==1 && is_6add==0&&state_out==3'd3 ) begin
		total_score<=total_score;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=1;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch7==1 && is_7add==0&&state_out==3'd0 ) begin
		if(display_single)
			total_score<=total_score+20'd50;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=1;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch7==1 && is_7add==0&&state_out==3'd3 ) begin
		total_score<=total_score;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=1;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch8==1 && is_8add==0 &&state_out==3'd0) begin
		if(display_single)
			total_score<=total_score+20'd50;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=1;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
		else if (catch8==1 && is_8add==0 &&state_out==3'd3) begin
		total_score<=total_score;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=1;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch11==1 && is_11add==0 &&state_out==3'd0) begin
		if(display_single)
			total_score<=total_score+20'd50;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=1;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch11==1 && is_11add==0 &&state_out==3'd3) begin
		total_score<=total_score;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=1;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch12==1 && is_12add==0 &&state_out==3'd0) begin
		if(display_single)
			total_score<=total_score+20'd50;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=1;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch12==1 && is_12add==0 &&state_out==3'd3) begin
		total_score<=total_score;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=1;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch9==1 && is_9add==0 &&state_out==3'd0) begin
		if(display_single)
			total_score<=total_score+20'd600;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=1;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch9==1 && is_9add==0 &&state_out==3'd3) begin
		total_score<=total_score;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=1;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch10==1 && is_10add==0 &&state_out==3'd0) begin
		if(display_single)
			total_score<=total_score+20'd20;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=1;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
		else if (catch10==1 && is_10add==0 &&state_out==3'd3) begin
		total_score<=total_score;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=1;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=is_14add;
		end
	else if (catch13==1 && is_13add==0 &&state_out==3'd0) begin
		if(display_single)
			total_score<=total_score+20'd20;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=1;
		is_14add<=is_14add;
		end
	else if (catch13==1 && is_13add==0 &&state_out==3'd3) begin
		total_score<=total_score;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=1;
		is_14add<=is_14add;
		end
	else if (catch14==1 && is_14add==0 &&state_out==3'd0) begin
		if(display_single)
			total_score<=total_score+20'd20;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=1;
		end
	else if (catch14==1 && is_14add==0 &&state_out==3'd3) begin
		total_score<=total_score;
		is_1add<=is_1add;
		is_2add<=is_2add;
		is_3add<=is_3add;
		is_4add<=is_4add;
		is_5add<=is_5add;
		is_6add<=is_6add;
		is_7add<=is_7add;
		is_8add<=is_8add;
		is_9add<=is_9add;
		is_10add<=is_10add;
		is_11add<=is_11add;
		is_12add<=is_12add;
		is_13add<=is_13add;
		is_14add<=1;
		end
end
//////////////////////////////////////////////
always_comb begin
if (DrawY>=10'd15 && DrawY<=10'd30 && DrawX<=10'd124 && DrawX>=10'd15)begin
	if (DrawX>=10'd15 && DrawX<=10'd22)
		read_address=(DrawX-10'd15)+8*(DrawY-10'd15)+1280;
	else if (DrawX>=10'd26 && DrawX<=10'd33)
		read_address=(DrawX-10'd26)+8*(DrawY-10'd15)+1280+128;
	else if (DrawX>=10'd37 && DrawX<=10'd44)
		read_address=(DrawX-10'd37)+8*(DrawY-10'd15)+1280+128*2;
	else if (DrawX>=10'd48 && DrawX<=10'd55)
		read_address=(DrawX-10'd48)+8*(DrawY-10'd15)+1280+128*3;
	else if (DrawX>=10'd59 && DrawX<=10'd66)
		read_address=(DrawX-10'd59)+8*(DrawY-10'd15)+1280+128*4; // here draw SCORE
	else if (DrawX>=10'd73 && DrawX<=10'd80)
		read_address=(DrawX-10'd73)+8*(DrawY-10'd15)+128*num_p5;
	else if (DrawX>=10'd84 && DrawX<=10'd91)
		read_address=(DrawX-10'd84)+8*(DrawY-10'd15)+128*num_p4;
	else if (DrawX>=10'd95 && DrawX<=10'd102)
		read_address=(DrawX-10'd95)+8*(DrawY-10'd15)+128*num_p3;
	else if (DrawX>=10'd106 && DrawX<=10'd113)
		read_address=(DrawX-10'd106)+8*(DrawY-10'd15)+128*num_p2;
	else if (DrawX>=10'd117 && DrawX<=10'd124)
		read_address=(DrawX-10'd117)+8*(DrawY-10'd15)+128*num_p1;  // here 5 number from msb to lsb
	else 
		read_address=0;
end
else
	read_address=0;
	





end
////////////////////////////////////////////////













font_rom font_rom(.read_address(read_address) ,.clk(Clk),    .is_score(is_score));



endmodule

module font_rom(input logic [18:0] read_address,
					input logic clk,
					output is_score);
					
logic memory[1920];
initial
begin
	 $readmemh("sprite/font.txt", memory);
end



always_ff @ (posedge clk) begin
	is_score<= memory[read_address];
end
			
					
					
					
					
endmodule
