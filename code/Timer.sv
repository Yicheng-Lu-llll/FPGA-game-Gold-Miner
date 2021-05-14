module Timer( input Clk,
					input logic [9:0] DrawX, DrawY,	
					input logic reset,
					
					
					input logic display_random,
					input logic	display_single,
					input logic display_double,
					input logic display_competition,
								
								
								
								
					output logic is_timer,
					output logic time_end,
					output logic [5:0]timer
					);
logic [19:0]read_address;
//logic [5:0]timer;
//control timer(change_mode_signal)
logic change_time;
logic [31:0] roof=50000000;
logic [31:0] current;
logic [5:0] n2,n1;
logic [3:0] num2,num1;
////////////////////////////////////////////////////////////////////////
//change change_time for every 1 second
always_ff @ (posedge Clk) begin
	if (reset) begin
		current<=32'd0;
		change_time<=1'd0;
		end
	else if (current==roof) begin
		current<=32'd0;
		change_time<=1'd1;
		end
	else begin
		current<=current+32'd1;
		change_time<=1'd0;
		end
end
//////////////////////////////////////////////////////////////////////
//timer change
always_ff@(posedge Clk)begin //change_time ||  reset||display_random
if (reset|| display_random) begin
	timer<=6'd50;
	time_end<=0;
	end

else if (change_time && timer==6'd0 && (display_single || display_double || display_competition) )begin
	timer<=timer;
	time_end<=1;
end
	
else if(change_time  && (display_single || display_double || display_competition)) begin
	timer<=timer-6'd1;
	time_end<=0;
end

else begin
	timer<=timer;
	time_end<=time_end;
end

end
/////////////////////////////////////////////////////////////////////////
always_ff@(posedge Clk)
begin
	n2<=timer/10;
	n1<=timer/1;
	num2<=n2;
	num1<=n1-10*n2;
end


/////////////////////////////////////////////////////////////////////////
//position desicion
always_comb begin

if (DrawY>=10'd15 && DrawY<=10'd30 && DrawX<=10'd565 && DrawX>=10'd500)begin
	if (DrawX>=10'd500 && DrawX<=10'd507)
		read_address=(DrawX-10'd500)+8*(DrawY-10'd15)+1280+128*5;
	else if (DrawX>=10'd511 && DrawX<=10'd518)
		read_address=(DrawX-10'd511)+8*(DrawY-10'd15)+1280+128*6;
	else if (DrawX>=10'd522 && DrawX<=10'd529)
		read_address=(DrawX-10'd522)+8*(DrawY-10'd15)+1280+128*7;
	else if (DrawX>=10'd533 && DrawX<=10'd540)
		read_address=(DrawX-10'd533)+8*(DrawY-10'd15)+1280+128*8;
	else if (DrawX>=10'd547 && DrawX<=10'd554)
		read_address=(DrawX-10'd547)+8*(DrawY-10'd15)+128*num2;
	else if (DrawX>=10'd558 && DrawX<=10'd565)
		read_address=(DrawX-10'd558)+8*(DrawY-10'd15)+128*num1;
   else
		read_address=0;
		
end
else read_address=0;

end
////////////////////////////////////////////////////////////////////////////





timer_rom timer_rom(.read_address(read_address) ,.clk(Clk),    .is_timer(is_timer));



endmodule

module timer_rom(input logic [18:0] read_address,
					input logic clk,
					output is_timer);
					
logic memory[2432];
initial
begin
	 $readmemh("sprite/font.txt", memory);
end



always_ff @ (posedge clk) begin
	is_timer<= memory[read_address];
end
			
					
					
					
					
endmodule

