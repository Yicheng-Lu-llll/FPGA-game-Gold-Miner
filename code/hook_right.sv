module hook_right(
								input Clk, 
								input logic [9:0] DrawX, DrawY,
								input logic reset,
								input logic extend,
								
								
								
								input logic is_catch1,
								input logic is_catch2,
								input logic is_catch3,
								input logic is_catch4,
								input logic is_catch5,
								input logic is_catch6,
								input logic is_catch7,
								input logic is_catch8,
								input logic is_catch9,
								input logic is_catch10,

								
								input logic is_catch11,
								input logic is_catch12,
								input logic is_catch13,
								input logic is_catch14,
//								input logic is_catch15,
//								input logic is_catch16,
//								input logic is_catch17,
//								input logic is_catch18,
								input logic is_explode,
								
								
								output logic is_hook,
								output logic[3:0] hook_index,
								output logic is_string,
								output logic is_back,
								output logic is_bound,
								output logic [9:0] string_taily,string_tailx,
								output logic[3:0] R_mode,
								output logic [2:0]state_out,
								
								
								
								input logic destroy1,
								input logic destroy2,
								input logic destroy3,
								input logic destroy4,
								input logic destroy5,
								input logic destroy6,
								input logic destroy7,
								input logic destroy8,
								input logic destroy9,
								input logic destroy10,

							
								
								input logic destroy11,
								input logic destroy12,
								input logic destroy13,
								input logic destroy14,
//								input logic destroy15,
//								input logic destroy16,
//								input logic destroy17,
//								input logic destroy18,


								
								
								input logic display_random
);

//hook parameter
parameter [9:0] WIDTH =  10'd30;
parameter [9:0] LENGTH = 10'd35;
logic[9:0] hookx,hooky;
//////////////////////////////////
//vga parameter
parameter [9:0] SCREEN_WIDTH =  10'd480;
parameter [9:0] SCREEN_LENGTH = 10'd640;
//////////////////////////////////
//string parameter
logic [9:0] string_headx,string_heady;
//logic [9:0] string_tailx;//,string_taily;
assign string_headx=10'd430;   
assign string_heady=10'd70;     
//////////////////////////////////
//figure load
logic [18:0] read_address;

//logic is_bound;
//logic is_back;

assign state_out=State;
///////////////////////////////////
enum logic[2:0]{ROTATE1,ROTATE2,EXTENSION,SHRINK}State, Next_state;
	always_ff @ (posedge Clk)
		begin
			if (reset || display_random) 
				State <= ROTATE1;
			else 
				State <= Next_state;
		end
	
////////////////////////////////////
always_comb begin
//	Next_state = State;
	unique case(State)
	
	ROTATE1:begin
		if (extend==1)
			Next_state=ROTATE2;
		else
			Next_state = ROTATE1;			
			
				end

			
				
	ROTATE2:begin
		if (extend==0)
			Next_state=EXTENSION;
		else
			Next_state=ROTATE2;
				end
				
	EXTENSION:begin
  if (is_bound==1 )
		Next_state=SHRINK;
  else if((is_catch1==1 && destroy1==0) || (is_catch2==1 && destroy2==0)|| (is_catch3==1 && destroy3==0)|| (is_catch4==1 && destroy4==0) )
		Next_state=SHRINK;
  else if( (is_catch5==1 && destroy5==0)|| (is_catch6==1 && destroy6==0)|| (is_catch7==1 && destroy7==0)|| (is_catch8==1 && destroy8==0))
		Next_state=SHRINK;
  else if( (is_catch9==1 && destroy9==0)|| (is_catch10==1 && destroy10==0)|| (is_catch11==1 && destroy11==0)|| (is_catch12==1 && destroy12==0)|| (is_catch13==1 && destroy13==0)|| (is_catch14==1 && destroy14==0))
		Next_state=SHRINK;
	
  else
		Next_state=EXTENSION;
  end
  
	SHRINK:begin
		if(is_back==1)
			Next_state=ROTATE1;
		else
			Next_state=SHRINK;
		end
		endcase
	end
/////////////////////////////////////
//control timer(change_mode_signal)
logic change_mode_signal;
logic [31:0] roof=8000000;
logic [31:0] current;

 
always_ff @ (posedge Clk) begin
	if (reset==1'd1 ||display_random==1'd1) begin
		current<=32'd0;
		change_mode_signal<=1'd0;
		end
	else if (current==roof) begin
		current<=32'd0;
		change_mode_signal<=1'd1;
		end
	else begin
		current<=current+32'd1;
		change_mode_signal<=1'd0;
		end
end

/////////////////////////////////////
//10 initial R_mode x,y position for string define
//logic[3:0] R_mode;

logic[9:0] R_X0[4];
logic[9:0] R_Y0[4];
assign R_X0='{string_headx,string_headx-2,string_headx-4,string_headx-6};
assign R_Y0='{string_heady,string_heady,string_heady,string_heady};

logic[9:0] R_X1[4];
logic[9:0] R_Y1[4];
assign R_X1='{string_headx,string_headx-1,string_headx-4,string_headx-6};
assign R_Y1='{string_heady,string_heady,string_heady+1,string_heady+1};


logic[9:0] R_X2[4];
logic[9:0] R_Y2[4];
assign R_X2='{string_headx,string_headx-2,string_headx-4,string_headx-5};
assign R_Y2='{string_heady,string_heady+1,string_heady+2,string_heady+2};

logic[9:0] R_X3[4];
logic[9:0] R_Y3[4];
assign R_X3='{string_headx,string_headx-1,string_headx-2,string_headx-4};
assign R_Y3='{string_heady,string_heady+1,string_heady+2,string_heady+3};

logic[9:0] R_X4[4];
logic[9:0] R_Y4[4];
assign R_X4='{string_headx,string_headx,string_headx-1,string_headx-2};
assign R_Y4='{string_heady,string_heady+1,string_heady+2,string_heady+4};

logic[9:0] R_X5[4];
logic[9:0] R_Y5[4];
assign R_X5='{string_headx,string_headx,string_headx,string_headx};
assign R_Y5='{string_heady,string_heady+2,string_heady+4,string_heady+6};

logic[9:0] R_X6[4];
logic[9:0] R_Y6[4];
assign R_X6='{string_headx,string_headx,string_headx+1,string_headx+2};
assign R_Y6='{string_heady,string_heady+1,string_heady+2,string_heady+4};

logic[9:0] R_X7[4];
logic[9:0] R_Y7[4];
assign R_X7='{string_headx,string_headx+1,string_headx+2,string_headx+4};
assign R_Y7='{string_heady,string_heady+1,string_heady+2,string_heady+3};

logic[9:0] R_X8[4];
logic[9:0] R_Y8[4];
assign R_X8='{string_headx,string_headx+2,string_headx+4,string_headx+5};
assign R_Y8='{string_heady,string_heady+1,string_heady+2,string_heady+2};

logic[9:0] R_X9[4];
logic[9:0] R_Y9[4];
assign R_X9='{string_headx,string_headx+1,string_headx+4,string_headx+6};
assign R_Y9='{string_heady,string_heady,string_heady+1,string_heady+1}; 

logic[9:0] R_X10[4];
logic[9:0] R_Y10[4];
assign R_X10='{string_headx,string_headx+1,string_headx+4,string_headx+6};
assign R_Y10='{string_heady,string_heady,string_heady,string_heady}; 
///////////////////////////////////////////////////////////
//control R_mode, direction
logic [3:0] direction;
always_ff@ (posedge change_mode_signal ||  reset || display_random)begin
//	R_mode<=R_mode;
	
	if(reset || display_random) 
		R_mode<=4'b0000;
	else if (State==ROTATE1 )
		R_mode<=R_mode+direction;
	else
		R_mode<=R_mode;


		
//	direction<=direction;	
	if (reset ||display_random)
		direction<=1;
		
	else if(State==ROTATE1 && R_mode==4'd1)
		direction<=1;
		
	else if(State==ROTATE1 && R_mode==4'd9)	
		direction<=-1;
	
	else
		direction<=direction;
		
		
	
	
end
/////////////////////////////////////
//hook behavor
//always_comb begin
//	case(R_mode)
//		4'd0: begin
//				hookx=string_tailx-35;
//				hooky=string_taily-15;
//				end
//		4'd1: begin
//				hookx=string_tailx-35;
//				hooky=string_taily-15;
//				end
//		4'd2: begin
//				hookx=string_tailx-35;
//				hooky=string_taily-15;
//				end
//		4'd3: begin
//				hookx=string_tailx-30;
//				hooky=string_taily-13;
//				end
//		4'd4: begin
//				hookx=string_tailx-15;
//				hooky=string_taily;
//				end
//		4'd5: begin
//				hookx=string_tailx-15;
//				hooky=string_taily;
//				end
//		4'd6: begin
//				hookx=string_tailx-20;
//				hooky=string_taily-5;
//				end
//		4'd7: begin
//				hookx=string_tailx-17;
//				hooky=string_taily-15;
//				end	
//		4'd8: begin
//				hookx=string_tailx;
//				hooky=string_taily-15;
//				end
//		4'd9: begin
//				hookx=string_tailx;
//				hooky=string_taily-15;
//				end
//		4'd10: begin
//				hookx=string_tailx;
//				hooky=string_taily-15; 
//				end
//		endcase
//end
////////////////////////////////////
//string behavor at ROTATE1
always_ff@ (posedge Clk )begin
	if(reset || display_random)begin
				string_tailx<=string_headx-6;
				string_taily<=string_heady;
				hookx<=string_tailx-35;
				hooky<=string_taily-15;
	
	end
	else if (State==ROTATE1)begin
	case(R_mode)
		4'd0: begin
			   string_tailx<=string_headx-6;
				string_taily<=string_heady;
				hookx<=string_tailx-35;
				hooky<=string_taily-15;
				end
		4'd1: begin
				string_tailx<=string_headx-6;
				string_taily<=string_heady+1;
				hookx<=string_tailx-35;
				hooky<=string_taily-15;
				end
		4'd2: begin
				string_tailx<=string_headx-5;
				string_taily<=string_heady+2;
				hookx<=string_tailx-35;
				hooky<=string_taily-15;
				end
		4'd3: begin
				string_tailx<=string_headx-4;
				string_taily<=string_heady+3;
				hookx<=string_tailx-30;
				hooky<=string_taily-13;
				end
		4'd4: begin
				string_tailx<=string_headx-2;
				string_taily<=string_heady+4;
				hookx<=string_tailx-15;
				hooky<=string_taily;
				end
		4'd5: begin
				string_tailx<=string_headx;
				string_taily<=string_heady+6;
				hookx<=string_tailx-15;
				hooky<=string_taily;
				end
		4'd6: begin
				string_tailx<=string_headx+2;
				string_taily<=string_heady+4;
				hookx<=string_tailx-20;
				hooky<=string_taily-5;
				end
		4'd7: begin
				string_tailx<=string_headx+4;
				string_taily<=string_heady+3;
				hookx<=string_tailx-17;
				hooky<=string_taily-15;
				end	
		4'd8: begin
				string_tailx<=string_headx+5;
				string_taily<=string_heady+2;
				hookx<=string_tailx;
				hooky<=string_taily-15;
				end
		4'd9: begin
				string_tailx<=string_headx+6;
				string_taily<=string_heady+1;
				hookx<=string_tailx;
				hooky<=string_taily-15;
				end
		4'd10: begin
				string_tailx<=string_headx+6;
				string_taily<=string_heady;
				hookx<=string_tailx;
				hooky<=string_taily-15; 
				end
		default: begin
			   string_tailx<=string_headx-6;
				string_taily<=string_heady;
				hookx<=string_tailx-35;
				hooky<=string_taily-15;
				end
		endcase
	end
	
	else if(State==ROTATE2)begin
	case(R_mode)
		4'd0: begin
			   string_tailx<=string_headx-6;
				string_taily<=string_heady;
				hookx<=string_tailx-35;
				hooky<=string_taily-15;
				end
		4'd1: begin
				string_tailx<=string_headx-6;
				string_taily<=string_heady+1;
				hookx<=string_tailx-35;
				hooky<=string_taily-15;
				end
		4'd2: begin
				string_tailx<=string_headx-5;
				string_taily<=string_heady+2;
				hookx<=string_tailx-35;
				hooky<=string_taily-15;
				end
		4'd3: begin
				string_tailx<=string_headx-4;
				string_taily<=string_heady+3;
				hookx<=string_tailx-30;
				hooky<=string_taily-13;
				end
		4'd4: begin
				string_tailx<=string_headx-2;
				string_taily<=string_heady+4;
				hookx<=string_tailx-15;
				hooky<=string_taily;
				end
		4'd5: begin
				string_tailx<=string_headx;
				string_taily<=string_heady+6;
				hookx<=string_tailx-15;
				hooky<=string_taily;
				end
		4'd6: begin
				string_tailx<=string_headx+2;
				string_taily<=string_heady+4;
				hookx<=string_tailx-20;
				hooky<=string_taily-5;
				end
		4'd7: begin
				string_tailx<=string_headx+4;
				string_taily<=string_heady+3;
				hookx<=string_tailx-17;
				hooky<=string_taily-15;
				end	
		4'd8: begin
				string_tailx<=string_headx+5;
				string_taily<=string_heady+2;
				hookx<=string_tailx;
				hooky<=string_taily-15;
				end
		4'd9: begin
				string_tailx<=string_headx+6;
				string_taily<=string_heady+1;
				hookx<=string_tailx;
				hooky<=string_taily-15;
				end
		4'd10: begin
				string_tailx<=string_headx+6;
				string_taily<=string_heady;
				hookx<=string_tailx;
				hooky<=string_taily-15; 
				end
		default: begin
			   string_tailx<=string_headx-6;
				string_taily<=string_heady;
				hookx<=string_tailx-35;
				hooky<=string_taily-15;
				end
		endcase
	end
	
	else if (State==EXTENSION)begin
		case(R_mode)
			4'd0:   begin
					string_tailx<=R_X0[3]-6*counter;
					string_taily<=R_Y0[3];
					hookx<=string_tailx-35;
					hooky<=string_taily-15;
						end
					
						
			
			
			4'd1:   begin		
						
					string_tailx<=R_X1[3]-6*counter;
					string_taily<=R_Y1[3]+counter;
					hookx<=string_tailx-35;
					hooky<=string_taily-15;
						end
						
		
			4'd2:   begin
					string_tailx<=R_X2[3]-5*counter;
					string_taily<=R_Y2[3]+2*counter;
					hookx<=string_tailx-35;
					hooky<=string_taily-15;
						end
	
			4'd3:   begin				
					string_tailx<=R_X3[3]-4*counter;
					string_taily<=R_Y3[3]+3*counter;
					hookx<=string_tailx-30;
					hooky<=string_taily-13;
						end
						
			4'd4:   begin				
					string_tailx<=R_X4[3]-2*counter;
					string_taily<=R_Y4[3]+4*counter;
					hookx<=string_tailx-15;
					hooky<=string_taily;
						end

	
			4'd5:   begin
					string_tailx<=R_X5[3];
					string_taily<=R_Y5[3]+6*counter;
					hookx<=string_tailx-15;
					hooky<=string_taily;
						end
		
			4'd6:   begin				
					string_tailx<=R_X6[3]+2*counter;
					string_taily<=R_Y6[3]+4*counter;
					hookx<=string_tailx-20;
					hooky<=string_taily-5;
						end
						
			
			
			4'd7:   begin	
					string_tailx<=R_X7[3]+4*counter;
					string_taily<=R_Y7[3]+3*counter;
					hookx<=string_tailx-17;
					hooky<=string_taily-15;
						end
			
			
			4'd8:   begin			
					string_tailx<=R_X8[3]+5*counter;
					string_taily<=R_Y8[3]+2*counter;
					hookx<=string_tailx;
					hooky<=string_taily-15;
						end
		
			4'd9:   begin		
					string_tailx<=R_X9[3]+6*counter;
					string_taily<=R_Y9[3]+1*counter;
					hookx<=string_tailx;
					hooky<=string_taily-15;
						end
						

			4'd10:   begin
					string_tailx<=R_X10[3]+6*counter;
					string_taily<=R_Y10[3];
					hookx<=string_tailx;
					hooky<=string_taily-15;
						end	
			default:   begin
					string_tailx<=R_X0[3]-6*counter;
					string_taily<=R_Y0[3];
					hookx<=string_tailx-35;
					hooky<=string_taily-15;
						end	
		endcase
					
		
	
		
	end
	else if (State==SHRINK)begin
		case(R_mode)
			4'd0:   begin
					string_tailx<=R_X0[3]-6*duplicated_counter;
					string_taily<=R_Y0[3];
					hookx<=string_tailx-35;
					hooky<=string_taily-15;
						end
					
						
			
			
			4'd1:   begin		
						
					string_tailx<=R_X1[3]-6*duplicated_counter;
					string_taily<=R_Y1[3]+duplicated_counter;
					hookx<=string_tailx-35;
					hooky<=string_taily-15;
						end
						
		
			4'd2:   begin
			
					string_tailx<=R_X2[3]-5*duplicated_counter;
					string_taily<=R_Y2[3]+2*duplicated_counter;
					hookx<=string_tailx-35;
					hooky<=string_taily-15;
						end
	
			4'd3:   begin				
					string_tailx<=R_X3[3]-4*duplicated_counter;
					string_taily<=R_Y3[3]+3*duplicated_counter;
					hookx<=string_tailx-30;
					hooky<=string_taily-13;
						end
						
			4'd4:   begin				
					string_tailx<=R_X4[3]-2*duplicated_counter;
					string_taily<=R_Y4[3]+4*duplicated_counter;
					hookx<=string_tailx-15;
					hooky<=string_taily;
						end

	
			4'd5:   begin
					string_tailx<=R_X5[3];
					string_taily<=R_Y5[3]+6*duplicated_counter;
					hookx<=string_tailx-15;
					hooky<=string_taily;
						end
		
			4'd6:   begin				
					string_tailx<=R_X6[3]+2*duplicated_counter;
					string_taily<=R_Y6[3]+4*duplicated_counter;
					hookx<=string_tailx-20;
					hooky<=string_taily-5;
						end
						
			
			
			4'd7:   begin	
					string_tailx<=R_X7[3]+4*duplicated_counter;
					string_taily<=R_Y7[3]+3*duplicated_counter;
					hookx<=string_tailx-17;
					hooky<=string_taily-15;
						end
			
			
			4'd8:   begin			
					string_tailx<=R_X8[3]+5*duplicated_counter;
					string_taily<=R_Y8[3]+2*duplicated_counter;
					hookx<=string_tailx;
					hooky<=string_taily-15;
						end
		
			4'd9:   begin		
					string_tailx<=R_X9[3]+6*duplicated_counter;
					string_taily<=R_Y9[3]+1*duplicated_counter;
					hookx<=string_tailx;
					hooky<=string_taily-15;
						end
						

			4'd10:   begin
					string_tailx<=R_X10[3]+6*duplicated_counter;
					string_taily<=R_Y10[3];
					hookx<=string_tailx;
					hooky<=string_taily-15;
						end	
			default:   begin
					string_tailx<=R_X0[3]-6*duplicated_counter;
					string_taily<=R_Y0[3];
					hookx<=string_tailx-35;
					hooky<=string_taily-15;
						end	
		endcase	
	end
end
////////////////////////////////////
//draw string at state ROTATE1
always_comb begin
//	is_string=0;
	if (State==ROTATE1)begin

	case(R_mode)
	
	4'd0: 
			if ((DrawX==R_X0[0] && DrawY==R_Y0[0])||(DrawX==R_X0[1] && DrawY==R_Y0[1])||(DrawX==R_X0[2] && DrawY==R_Y0[2])||(DrawX==R_X0[3] && DrawY==R_Y0[3]))
				is_string=1;
			else
				is_string=0;

	4'd1: 
			if ((DrawX==R_X1[0] && DrawY==R_Y1[0])||(DrawX==R_X1[1] && DrawY==R_Y1[1])||(DrawX==R_X1[2] && DrawY==R_Y1[2])||(DrawX==R_X1[3] && DrawY==R_Y1[3]))
				is_string=1;
			else
				is_string=0;	
	4'd2: 
			if ((DrawX==R_X2[0] && DrawY==R_Y2[0])||(DrawX==R_X2[1] && DrawY==R_Y2[1])||(DrawX==R_X2[2] && DrawY==R_Y2[2])||(DrawX==R_X2[3] && DrawY==R_Y2[3]))
				is_string=1;
			else
				is_string=0;
	
	4'd3: 
			if ((DrawX==R_X3[0] && DrawY==R_Y3[0])||(DrawX==R_X3[1] && DrawY==R_Y3[1])||(DrawX==R_X3[2] && DrawY==R_Y3[2])||(DrawX==R_X3[3] && DrawY==R_Y3[3]))
				is_string=1;
			else
				is_string=0;	

	
	4'd4: 
			if ((DrawX==R_X4[0] && DrawY==R_Y4[0])||(DrawX==R_X4[1] && DrawY==R_Y4[1])||(DrawX==R_X4[2] && DrawY==R_Y4[2])||(DrawX==R_X4[3] && DrawY==R_Y4[3]))
				is_string=1;
			else
				is_string=0;
				
	4'd5: 
			if ((DrawX==R_X5[0] && DrawY==R_Y5[0])||(DrawX==R_X5[1] && DrawY==R_Y5[1])||(DrawX==R_X5[2] && DrawY==R_Y5[2])||(DrawX==R_X5[3] && DrawY==R_Y5[3]))
				is_string=1;
			else
				is_string=0;	
	
	4'd6: 
			if ((DrawX==R_X6[0] && DrawY==R_Y6[0])||(DrawX==R_X6[1] && DrawY==R_Y6[1])||(DrawX==R_X6[2] && DrawY==R_Y6[2])||(DrawX==R_X6[3] && DrawY==R_Y6[3]))
				is_string=1;
			else
				is_string=0;
	
	4'd7: 
			if ((DrawX==R_X7[0] && DrawY==R_Y7[0])||(DrawX==R_X7[1] && DrawY==R_Y7[1])||(DrawX==R_X7[2] && DrawY==R_Y7[2])||(DrawX==R_X7[3] && DrawY==R_Y7[3]))
				is_string=1;
			else
				is_string=0;
	
	4'd8: 
			if ((DrawX==R_X8[0] && DrawY==R_Y8[0])||(DrawX==R_X8[1] && DrawY==R_Y8[1])||(DrawX==R_X8[2] && DrawY==R_Y8[2])||(DrawX==R_X8[3] && DrawY==R_Y8[3]))
				is_string=1;
			else
				is_string=0;
	
	4'd9: 
			if ((DrawX==R_X9[0] && DrawY==R_Y9[0])||(DrawX==R_X9[1] && DrawY==R_Y9[1])||(DrawX==R_X9[2] && DrawY==R_Y9[2])||(DrawX==R_X9[3] && DrawY==R_Y9[3]))
				is_string=1;
			else
				is_string=0;
	
	4'd10: 
			if ((DrawX==R_X10[0] && DrawY==R_Y10[0])||(DrawX==R_X10[1] && DrawY==R_Y10[1])||(DrawX==R_X10[2] && DrawY==R_Y10[2])||(DrawX==R_X10[3] && DrawY==R_Y10[3]))
				is_string=1;
			else
				is_string=0;
				
	default:
			is_string=0;
		
	endcase
	end



///////////
//draw string at EXTENSION&SHRINK


	else if ((State==EXTENSION || State==SHRINK) )begin
	case(R_mode)
	4'd0: 
		if( DrawY<=string_taily && DrawY>=string_heady&&DrawX>=string_tailx && DrawX<=string_headx && DrawY==string_heady)
			is_string=1;
		else
			is_string=0;		

	4'd1: 
		if( DrawY<=string_taily && DrawY>=string_heady&&(DrawX==string_tailx && DrawY==string_taily) || (DrawX==string_tailx-1 && DrawY==string_taily) || ( DrawY!=string_heady && DrawX>=string_tailx && DrawX<=string_headx && ((string_headx-DrawX)==6*(DrawY-string_heady)||(string_headx-DrawX+2)==6*(DrawY-string_heady)||(string_headx-DrawX-1)==6*(DrawY-string_heady))))
			is_string=1;
		else
			is_string=0;			
	4'd2: 
		if( DrawY<=string_taily && DrawY>=string_heady&&(DrawX==string_tailx && DrawY==string_taily)  || (DrawY!=string_heady && DrawX>=string_tailx && DrawX<=string_headx &&(2*(string_headx-DrawX)==5*(DrawY-string_heady)||2*(string_headx-DrawX+1)==5*(DrawY-string_heady)||2*(string_headx-DrawX+3)==5*(DrawY-string_heady+1))))
			is_string=1;
		else
			is_string=0;			
	4'd3: 
		if( DrawY<=string_taily && DrawY>=string_heady&&(DrawX==string_tailx && DrawY==string_taily)  ||(DrawX==string_headx-1 && DrawY==string_heady+1)||(DrawX==string_headx-2 && DrawY==string_heady+2)||(DrawY!=string_heady && DrawX>=string_tailx && DrawX<=string_headx &&(3*(string_headx-DrawX)==4*(DrawY-string_heady)||3*(string_headx-DrawX+2)==4*(DrawY-string_heady+1)||3*(string_headx-DrawX+3)==4*(DrawY-string_heady+2))))
			is_string=1;
		else
			is_string=0;			
	4'd4: 
		if( DrawY<=string_taily && DrawY>=string_heady&&(DrawX==string_tailx && DrawY==string_taily)  ||(DrawX==string_headx && DrawY==string_heady+1)||(DrawY!=string_heady && DrawX>=string_tailx && DrawX<=string_headx &&(2*(string_headx-DrawX)==(DrawY-string_heady)||2*(string_headx-DrawX+1)==(DrawY-string_heady+1))))
			is_string=1;
		else
			is_string=0;			
	4'd5: 
		if( DrawY<=string_taily && DrawY>=string_heady&&DrawX==string_headx)
			is_string=1;
		else
			is_string=0;			
	4'd6: 
		if( DrawY<=string_taily && DrawY>=string_heady&&(DrawX==string_tailx && DrawY==string_taily)  ||(DrawX==string_headx && DrawY==string_heady+1)||(DrawY!=string_heady && DrawX<=string_tailx && DrawX>=string_headx &&(2*(DrawX-string_headx)==(DrawY-string_heady)||2*(DrawX-string_headx+1)==(DrawY-string_heady+1))))
			is_string=1;
		else
			is_string=0;			
	4'd7: 
		if( DrawY<=string_taily && DrawY>=string_heady&&(DrawX==string_tailx && DrawY==string_taily)  ||(DrawX==string_headx+1 && DrawY==string_heady+1)||(DrawX==string_headx+2 && DrawY==string_heady+2)||(DrawY!=string_heady && DrawX<=string_tailx && DrawX>=string_headx &&(3*(DrawX-string_headx)==4*(DrawY-string_heady)||3*(DrawX-string_headx+2)==4*(DrawY-string_heady+1)||3*(DrawX-string_headx+3)==4*(DrawY-string_heady+2))))
			is_string=1;
		else
			is_string=0;			
	4'd8:
		if( DrawY<=string_taily && DrawY>=string_heady&&(DrawX==string_tailx && DrawY==string_taily)  || (DrawY!=string_heady && DrawX<=string_tailx && DrawX>=string_headx &&(2*(DrawX-string_headx)==5*(DrawY-string_heady)||2*(DrawX-string_headx+1)==5*(DrawY-string_heady)||2*(DrawX-string_headx+3)==5*(DrawY-string_heady+1))))
			is_string=1;
		else
			is_string=0;			
	4'd9:
		if( DrawY<=string_taily && DrawY>=string_heady&&(DrawX==string_tailx && DrawY==string_taily) || (DrawX==string_tailx+1 && DrawY==string_taily) || ( DrawY!=string_heady && DrawX<=string_tailx && DrawX>=string_headx && ((DrawX-string_headx)==6*(DrawY-string_heady)||(DrawX-string_headx+2)==6*(DrawY-string_heady)||(DrawX-string_headx-1)==6*(DrawY-string_heady))))
			is_string=1;
		else
			is_string=0;			
	4'd10:
		if( DrawY<=string_taily && DrawY>=string_heady&&DrawX<=string_tailx && DrawX>=string_headx && DrawY==string_heady)
			is_string=1;
		else
			is_string=0;
	default:
			is_string=0;		
	endcase
end
	else
		is_string=0;


end
///////////////////////////////////////////////////////////////////////////////////////
//time indicator used in string extention.
logic[9:0] counter;
logic [31:0] local_counter;
always_ff @ (posedge Clk) begin
	if (reset||State!=EXTENSION||display_random) begin
		local_counter<=0;
		counter<=0;
		end
	else if (local_counter==(roof/2)) begin
		local_counter<=0;
		counter<=1+counter;
		end
	else begin
		local_counter<=local_counter+1;
		counter<=counter;
		end
end
////////////////////////////////////////////////////////////////////////////////
//behavor at ROTATE2 control is_bound and is_back!
always_comb begin
if(reset ||display_random)
	is_bound=0;
	
else if (string_tailx<=10'd40 )
		is_bound=1;

else if (string_tailx>=10'd620)
		is_bound=1;
		
else if (string_taily>=10'd460)
		is_bound=1;
else
	is_bound=0;
		

if(reset ||display_random)
	is_back=0;	
else
//	is_back=0;	
	case(R_mode)
	4'd0: begin
		if(string_tailx==string_headx-6 && string_taily==string_heady)
			is_back=1;
		else
			is_back=0;	
	end
	4'd1: begin
		if(string_tailx==string_headx-6 && string_taily==string_heady+1)
			is_back=1;
		else
			is_back=0;	
	end
	4'd2: begin
		if(string_tailx==string_headx-5 && string_taily==string_heady+2)
			is_back=1;
		else
			is_back=0;	
	end
	4'd3: begin
		if(string_tailx==string_headx-4 && string_taily==string_heady+3)
			is_back=1;
		else
			is_back=0;	
	end
	4'd4: begin
		if(string_tailx==string_headx-2 && string_taily==string_heady+4)
			is_back=1;
		else
			is_back=0;	
	end
	4'd5: begin
		if(string_tailx==string_headx && string_taily==string_heady+6)
			is_back=1;
		else
			is_back=0;	
	end
	4'd6: begin
		if(string_tailx==string_headx+2 && string_taily==string_heady+4)
			is_back=1;
		else
			is_back=0;	
	end
	4'd7: begin
		if(string_tailx==string_headx+4 && string_taily==string_heady+3)
			is_back=1;
		else
			is_back=0;	
	end
	4'd8: begin
		if(string_tailx==string_headx+5 && string_taily==string_heady+2)
			is_back=1;
		else
			is_back=0;	
	end
	4'd9: begin
		if(string_tailx==string_headx+6 && string_taily==string_heady+1)
			is_back=1;
		else
			is_back=0;	
	end
	4'd10: begin
		if(string_tailx==string_headx+6 && string_taily==string_heady)
			is_back=1;
		else
			is_back=0;	
	end
	
	default:
			is_back=0;	
	endcase
end

/////////////////////////////////////////////////////////////////////////////////////
//string behavor at EXTENSION

////////////////////////////////////////////////////////////////////////////
//chage is_bound
///////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
///time indicator used in deciding id the string is back ro its posotion or just start to move
logic[9:0] duplicated_counter;
logic [31:0] duplicated_local_counter;
assign test_dulp=duplicated_counter;

always_ff @ (posedge Clk) begin
//duplicated_local_counter<=0;
//duplicated_counter<=0;

	if(reset ||display_random || (State!=EXTENSION && State!=SHRINK)) begin
		duplicated_local_counter<=0;
		duplicated_counter<=0;
		end
	else if(State==EXTENSION) begin
		 if (duplicated_local_counter==(roof/2)) begin
				duplicated_local_counter<=0;
				duplicated_counter<=1+duplicated_counter;
				end
		
		 else begin
				duplicated_local_counter<=duplicated_local_counter+1;
				duplicated_counter<=duplicated_counter;
				end

	end
	
	
	else if( State==SHRINK) begin
			 if (duplicated_local_counter==(roof) && (is_catch1==1 || is_catch2==1 || is_catch7==1|| is_catch8==1|| is_catch11==1|| is_catch12==1)) begin
				duplicated_local_counter<=0;
				duplicated_counter<=duplicated_counter-1;
				end
				
			 else if (duplicated_local_counter==(roof/2) && (is_catch3==1 || is_catch4==1 )) begin
				duplicated_local_counter<=0;
				duplicated_counter<=duplicated_counter-1;
				end
				
			 else if (duplicated_local_counter==(roof/4) && (is_catch5==1 || is_catch6==1 || is_catch9==1|| is_catch10==1|| is_catch13==1|| is_catch14==1)) begin
				duplicated_local_counter<=0;
				duplicated_counter<=duplicated_counter-1;
				end	
			else if(duplicated_local_counter==(roof/4) && is_catch1==0 && is_catch2==0 && is_catch3==0 && is_catch4==0 && is_catch5==0 && is_catch6==0 && is_catch7==0 && is_catch8==0 && is_catch9==0 && is_catch10==0 && is_catch11==0 && is_catch12==0 && is_catch13==0 && is_catch14==0) begin
				duplicated_local_counter<=0;
				duplicated_counter<=duplicated_counter-1;
				end
			
			else if(duplicated_local_counter>(roof/4) && is_catch1==0 && is_catch2==0 && is_catch3==0 && is_catch4==0 && is_catch5==0 && is_catch6==0 && is_catch7==0 && is_catch8==0 && is_catch9==0 && is_catch10==0 && is_catch11==0 && is_catch12==0 && is_catch13==0 && is_catch14==0)begin
				duplicated_local_counter<=0;
				duplicated_counter<=duplicated_counter-1;
				end
		    else begin
				duplicated_local_counter<=duplicated_local_counter+1;
				duplicated_counter<=duplicated_counter;
				end
	end
	
	else begin
		duplicated_local_counter<=0;
		duplicated_counter<=0;

	end
	
	
end

/////////////////////////////////////////////////////////////////////////////////
//string behavor at SHRINK


////////////////////////////////////////////////////////////////////////
//chage is_back
/////////////////////////////////////////////////////////////////////










///////////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////////






///////////////////////////////////////////////////////////////////////////////////////////////
// this combinational logic decides whether current pixel is in hook or not base on hookx,hooky,R_mode and can output the palette index
always_comb begin
if (DrawX<=(hookx+LENGTH) && DrawX>=hookx  && DrawY<=(hooky+WIDTH)  && DrawY>=hooky) 
	is_hook=1;
else 
	is_hook=0;

case(R_mode)
4'd0: read_address=  (DrawY-hooky) * LENGTH +  (DrawX-hookx);
4'd1: read_address=  (DrawY-hooky) * LENGTH +  (DrawX-hookx)+1050;
4'd2: read_address=  (DrawY-hooky) * LENGTH +  (DrawX-hookx)+1050*2;
4'd3: read_address=  (DrawY-hooky) * LENGTH +  (DrawX-hookx)+1050*3;
4'd4: read_address=  (DrawY-hooky) * LENGTH +  (DrawX-hookx)+1050*4;
4'd5: read_address=  (DrawY-hooky) * LENGTH +  (DrawX-hookx)+1050*5;
4'd6: read_address=  (DrawY-hooky) * LENGTH +  (DrawX-hookx)+1050*6;
4'd7: read_address=  (DrawY-hooky) * LENGTH +  (DrawX-hookx)+1050*7;
	4'd8: read_address=  (DrawY-hooky) * LENGTH +  (DrawX-hookx)+1050*8;
	4'd9: read_address=  (DrawY-hooky) * LENGTH +  (DrawX-hookx)+1050*9;
	4'd10: read_address=  (DrawY-hooky) * LENGTH +  (DrawX-hookx)+1050*10;
	default:read_address=  (DrawY-hooky) * LENGTH +  (DrawX-hookx);



endcase
end
///////////////////////////////////////////////////////////////////////////////////////////////






///////////////////////////////////////////////////
// on chip memory- store hooks
hook_right_rom right_rom(.read_address(read_address) ,.clk(Clk),    .hook_index(hook_index));

endmodule
///////////////////////////////////////////////////






//hook rom here
module hook_right_rom(
										input logic [18:0] read_address,
										input logic clk,
										output logic[3:0] hook_index
	
);







logic [3:0] memory[11550];
initial
begin
	 $readmemh("sprite/hook0.txt", memory);
end



always_ff @ (posedge clk) begin
	hook_index<= memory[read_address];
end

endmodule
