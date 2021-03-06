module KeepSocre_doubule(
								input Clk, 
								input logic [9:0] DrawX, DrawY,
								input logic catch1r,catch2r,catch3r, catch4r, catch5r, catch6r, catch7r, catch8r, catch9r, catch10r, catch11r, catch12r, catch13r, catch14r,  
								input logic catch1l,catch2l,catch3l, catch4l, catch5l, catch6l, catch7l, catch8l, catch9l, catch10l, catch11l, catch12l, catch13l, catch14l,             

								input logic [2:0]state_outl,state_outr,
								input logic reset,
								input logic time_end,
								input logic display_random,
								input logic display_double,
								input logic [19:0] target_score,
								output logic is_score_double,
								
						
							//	output logic [19:0] total_score,
								output logic show_fail
								
								
								

								
);
logic [19:0]total_score_left,total_score_right,total_score;
logic [19:0]read_address;
// for total score
logic [3:0]num_p5,num_p4,num_p3,num_p2,num_p1;
logic [19:0]n1,n2,n3,n4,n5;
//logic is_1add,is_2add,is_3add,is_4add,is_5add,is_6add,is_7add,is_8add,is_9add,is_10add,is_11add,is_12add,is_13add,is_14add;

//for left score 
logic [3:0]num_p5l,num_p4l,num_p3l,num_p2l,num_p1l;
logic [19:0]n1l,n2l,n3l,n4l,n5l;
logic is_1addl,is_2addl,is_3addl,is_4addl,is_5addl,is_6addl,is_7addl,is_8addl,is_9addl,is_10addl,is_11addl,is_12addl,is_13addl,is_14addl;

//for right score 
logic [3:0]num_p5r,num_p4r,num_p3r,num_p2r,num_p1r;
logic [19:0]n1r,n2r,n3r,n4r,n5r;
logic is_1addr,is_2addr,is_3addr,is_4addr,is_5addr,is_6addr,is_7addr,is_8addr,is_9addr,is_10addr,is_11addr,is_12addr,is_13addr,is_14addr;



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
	
//for left
	n5l<=total_score_left /10000;
	n4l<=total_score_left /1000 ;
	n3l<=total_score_left /100;
	n2l<=total_score_left /10;
	n1l<=total_score_left /1;
	num_p1l<=n1l-10*n2l;	
	num_p2l<=n2l-10*n3l;
	num_p3l<=n3l-10*n4l;
	num_p4l<=n4l-10*n5l;
	num_p5l<=n5l;
//for right
	n5r<=total_score_right /10000;
	n4r<=total_score_right /1000 ;
	n3r<=total_score_right /100;
	n2r<=total_score_right /10;
	n1r<=total_score_right /1;
	num_p1r<=n1r-10*n2r;	
	num_p2r<=n2r-10*n3r;
	num_p3r<=n3r-10*n4r;
	num_p4r<=n4r-10*n5r;
	num_p5r<=n5r;
// for total
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
	if(reset) begin
		total_score<=0;
		total_score_left<=0;
		total_score_right<=0;
		is_1addr<=0;
		is_2addr<=0;
		is_3addr<=0;
		is_4addr<=0;
		is_5addr<=0;
		is_6addr<=0;
		is_7addr<=0;
		is_8addr<=0;
		is_9addr<=0;
		is_10addr<=0;
		is_11addr<=0;
		is_12addr<=0;
		is_13addr<=0;
		is_14addr<=0;
		is_1addl<=0;
		is_2addl<=0;
		is_3addl<=0;
		is_4addl<=0;
		is_5addl<=0;
		is_6addl<=0;
		is_7addl<=0;
		is_8addl<=0;
		is_9addl<=0;
		is_10addl<=0;
		is_11addl<=0;
		is_12addl<=0;
		is_13addl<=0;
		is_14addl<=0;
		end
	else if(display_random) begin
		total_score<=total_score;
		total_score_left<=0;
		total_score_right<=0;
		is_1addr<=0;
		is_2addr<=0;
		is_3addr<=0;
		is_4addr<=0;
		is_5addr<=0;
		is_6addr<=0;
		is_7addr<=0;
		is_8addr<=0;
		is_9addr<=0;
		is_10addr<=0;
		is_11addr<=0;
		is_12addr<=0;
		is_13addr<=0;
		is_14addr<=0;
		is_1addl<=0;
		is_2addl<=0;
		is_3addl<=0;
		is_4addl<=0;
		is_5addl<=0;
		is_6addl<=0;
		is_7addl<=0;
		is_8addl<=0;
		is_9addl<=0;
		is_10addl<=0;
		is_11addl<=0;
		is_12addl<=0;
		is_13addl<=0;
		is_14addl<=0;
		end
	
		
		

 else if (catch1r==1 && is_1addr==0 ) begin
		if(display_double)
			total_score_right<=total_score_right+20'd500;
			total_score<=total_score+20'd500;
			total_score_left<=total_score_left;
		is_1addr<=1;
		is_2addr<=is_2addr;
		is_3addr<=is_3addr;
		is_4addr<=is_4addr;
		is_5addr<=is_5addr;
		is_6addr<=is_6addr;
		is_7addr<=is_7addr;
		is_8addr<=is_8addr;
		is_9addr<=is_9addr;
		is_10addr<=is_10addr;
		is_11addr<=is_11addr;
		is_12addr<=is_12addr;
		is_13addr<=is_13addr;
		is_14addr<=is_14addr;
		end
	
	//
	else if (catch2r==1 && is_2addr==0 ) begin
		if(display_double)
			total_score_right<=total_score_right+20'd500;
			total_score<=total_score+20'd500;
			total_score_left<=total_score_left;
		is_1addr<=is_1addr;
		is_2addr<=1;
		is_3addr<=is_3addr;
		is_4addr<=is_4addr;
		is_5addr<=is_5addr;
		is_6addr<=is_6addr;
		is_7addr<=is_7addr;
		is_8addr<=is_8addr;
		is_9addr<=is_9addr;
		is_10addr<=is_10addr;
		is_11addr<=is_11addr;
		is_12addr<=is_12addr;
		is_13addr<=is_13addr;
		is_14addr<=is_14addr;
		end
	
	else if (catch3r==1 && is_3addr==0 ) begin
		if(display_double)
			total_score_right<=total_score_right+20'd250;
			total_score<=total_score+20'd250;
			total_score_left<=total_score_left;
		is_1addr<=is_1addr;
		is_2addr<=is_2addr;
		is_3addr<=1;
		is_4addr<=is_4addr;
		is_5addr<=is_5addr;
		is_6addr<=is_6addr;
		is_7addr<=is_7addr;
		is_8addr<=is_8addr;
		is_9addr<=is_9addr;
		is_10addr<=is_10addr;
		is_11addr<=is_11addr;
		is_12addr<=is_12addr;
		is_13addr<=is_13addr;
		is_14addr<=is_14addr;
		end
	
	else if (catch4r==1 && is_4addr==0  ) begin
		if(display_double)
			total_score_right<=total_score_right+20'd250;
			total_score<=total_score+20'd250;
			total_score_left<=total_score_left;
		is_1addr<=is_1addr;
		is_2addr<=is_2addr;
		is_3addr<=is_3addr;
		is_4addr<=1;
		is_5addr<=is_5addr;
		is_6addr<=is_6addr;
		is_7addr<=is_7addr;
		is_8addr<=is_8addr;
		is_9addr<=is_9addr;
		is_10addr<=is_10addr;
		is_11addr<=is_11addr;
		is_12addr<=is_12addr;
		is_13addr<=is_13addr;
		is_14addr<=is_14addr;
		end
	
	else if (catch5r==1 && is_5addr==0  ) begin
		if(display_double)
			total_score_right<=total_score_right+20'd100;
			total_score<=total_score+20'd100;
			total_score_left<=total_score_left;
		is_1addr<=is_1addr;
		is_2addr<=is_2addr;
		is_3addr<=is_3addr;
		is_4addr<=is_4addr;
		is_5addr<=1;
		is_6addr<=is_6addr;
		is_7addr<=is_7addr;
		is_8addr<=is_8addr;
		is_9addr<=is_9addr;
		is_10addr<=is_10addr;
		is_11addr<=is_11addr;
		is_12addr<=is_12addr;
		is_13addr<=is_13addr;
		is_14addr<=is_14addr;
		end
		
	else if (catch6r==1 && is_6addr==0 ) begin
		if(display_double)
			total_score_right<=total_score_right+20'd100;
			total_score<=total_score+20'd100;
			total_score_left<=total_score_left;
		is_1addr<=is_1addr;
		is_2addr<=is_2addr;
		is_3addr<=is_3addr;
		is_4addr<=is_4addr;
		is_5addr<=is_5addr;
		is_6addr<=1;
		is_7addr<=is_7addr;
		is_8addr<=is_8addr;
		is_9addr<=is_9addr;
		is_10addr<=is_10addr;
		is_11addr<=is_11addr;
		is_12addr<=is_12addr;
		is_13addr<=is_13addr;
		is_14addr<=is_14addr;
		end
	
	else if (catch7r==1 && is_7addr==0 ) begin
		if(display_double)
			total_score_right<=total_score_right+20'd50;
			total_score<=total_score+20'd50;
			total_score_left<=total_score_left;
		is_1addr<=is_1addr;
		is_2addr<=is_2addr;
		is_3addr<=is_3addr;
		is_4addr<=is_4addr;
		is_5addr<=is_5addr;
		is_6addr<=is_6addr;
		is_7addr<=1;
		is_8addr<=is_8addr;
		is_9addr<=is_9addr;
		is_10addr<=is_10addr;
		is_11addr<=is_11addr;
		is_12addr<=is_12addr;
		is_13addr<=is_13addr;
		is_14addr<=is_14addr;
		end
	
	else if (catch8r==1 && is_8addr==0 ) begin
		if(display_double)
			total_score_right<=total_score_right+20'd50;
			total_score<=total_score+20'd50;
			total_score_left<=total_score_left;
		is_1addr<=is_1addr;
		is_2addr<=is_2addr;
		is_3addr<=is_3addr;
		is_4addr<=is_4addr;
		is_5addr<=is_5addr;
		is_6addr<=is_6addr;
		is_7addr<=is_7addr;
		is_8addr<=1;
		is_9addr<=is_9addr;
		is_10addr<=is_10addr;
		is_11addr<=is_11addr;
		is_12addr<=is_12addr;
		is_13addr<=is_13addr;
		is_14addr<=is_14addr;
		end
		
	else if (catch11r==1 && is_11addr==0 ) begin
		if(display_double)
			total_score_right<=total_score_right+20'd50;
			total_score<=total_score+20'd50;
			total_score_left<=total_score_left;
		is_1addr<=is_1addr;
		is_2addr<=is_2addr;
		is_3addr<=is_3addr;
		is_4addr<=is_4addr;
		is_5addr<=is_5addr;
		is_6addr<=is_6addr;
		is_7addr<=is_7addr;
		is_8addr<=is_8addr;
		is_9addr<=is_9addr;
		is_10addr<=is_10addr;
		is_11addr<=1;
		is_12addr<=is_12addr;
		is_13addr<=is_13addr;
		is_14addr<=is_14addr;
		end
	
	else if (catch12r==1 && is_12addr==0 ) begin
		if(display_double)
			total_score_right<=total_score_right+20'd50;
			total_score<=total_score+20'd50;
			total_score_left<=total_score_left;
		is_1addr<=is_1addr;
		is_2addr<=is_2addr;
		is_3addr<=is_3addr;
		is_4addr<=is_4addr;
		is_5addr<=is_5addr;
		is_6addr<=is_6addr;
		is_7addr<=is_7addr;
		is_8addr<=is_8addr;
		is_9addr<=is_9addr;
		is_10addr<=is_10addr;
		is_11addr<=is_11addr;
		is_12addr<=1;
		is_13addr<=is_13addr;
		is_14addr<=is_14addr;
		end
	
	else if (catch9r==1 && is_9addr==0 ) begin
		if(display_double)
			total_score_right<=total_score_right+20'd600;
			total_score<=total_score+20'd600;
			total_score_left<=total_score_left;
		is_1addr<=is_1addr;
		is_2addr<=is_2addr;
		is_3addr<=is_3addr;
		is_4addr<=is_4addr;
		is_5addr<=is_5addr;
		is_6addr<=is_6addr;
		is_7addr<=is_7addr;
		is_8addr<=is_8addr;
		is_9addr<=1;
		is_10addr<=is_10addr;
		is_11addr<=is_11addr;
		is_12addr<=is_12addr;
		is_13addr<=is_13addr;
		is_14addr<=is_14addr;
		end
	
	else if (catch10r==1 && is_10addr==0 ) begin
		if(display_double)
			total_score_right<=total_score_right+20'd20;
			total_score<=total_score+20'd20;
			total_score_left<=total_score_left;
		is_1addr<=is_1addr;
		is_2addr<=is_2addr;
		is_3addr<=is_3addr;
		is_4addr<=is_4addr;
		is_5addr<=is_5addr;
		is_6addr<=is_6addr;
		is_7addr<=is_7addr;
		is_8addr<=is_8addr;
		is_9addr<=is_9addr;
		is_10addr<=1;
		is_11addr<=is_11addr;
		is_12addr<=is_12addr;
		is_13addr<=is_13addr;
		is_14addr<=is_14addr;
		end
	
	else if (catch13r==1 && is_13addr==0) begin
		if(display_double)
			total_score_right<=total_score_right+20'd20;
			total_score<=total_score+20'd20;
			total_score_left<=total_score_left;
		is_1addr<=is_1addr;
		is_2addr<=is_2addr;
		is_3addr<=is_3addr;
		is_4addr<=is_4addr;
		is_5addr<=is_5addr;
		is_6addr<=is_6addr;
		is_7addr<=is_7addr;
		is_8addr<=is_8addr;
		is_9addr<=is_9addr;
		is_10addr<=is_10addr;
		is_11addr<=is_11addr;
		is_12addr<=is_12addr;
		is_13addr<=1;
		is_14addr<=is_14addr;
		end
	
	else if (catch14r==1 && is_14addr==0 ) begin
		if(display_double)
			total_score_right<=total_score_right+20'd20;
			total_score<=total_score+20'd20;
			total_score_left<=total_score_left;
		is_1addr<=is_1addr;
		is_2addr<=is_2addr;
		is_3addr<=is_3addr;
		is_4addr<=is_4addr;
		is_5addr<=is_5addr;
		is_6addr<=is_6addr;
		is_7addr<=is_7addr;
		is_8addr<=is_8addr;
		is_9addr<=is_9addr;
		is_10addr<=is_10addr;
		is_11addr<=is_11addr;
		is_12addr<=is_12addr;
		is_13addr<=is_13addr;
		is_14addr<=1;
		end
	
////////////////////////////
//begin left
else if (catch1l==1 && is_1addl==0 ) begin
		if(display_double)
			total_score_left<=total_score_left+20'd500;
			total_score<=total_score+20'd500;
			total_score_right<=total_score_right;
		is_1addl<=1;
		is_2addl<=is_2addl;
		is_3addl<=is_3addl;
		is_4addl<=is_4addl;
		is_5addl<=is_5addl;
		is_6addl<=is_6addl;
		is_7addl<=is_7addl;
		is_8addl<=is_8addl;
		is_9addl<=is_9addl;
		is_10addl<=is_10addl;
		is_11addl<=is_11addl;
		is_12addl<=is_12addl;
		is_13addl<=is_13addl;
		is_14addl<=is_14addl;
		end
	
	//
	else if (catch2l==1 && is_2addl==0 ) begin
		if(display_double)
			total_score_left<=total_score_left+20'd500;
			total_score<=total_score+20'd500;
			total_score_right<=total_score_right;
		is_1addl<=is_1addl;
		is_2addl<=1;
		is_3addl<=is_3addl;
		is_4addl<=is_4addl;
		is_5addl<=is_5addl;
		is_6addl<=is_6addl;
		is_7addl<=is_7addl;
		is_8addl<=is_8addl;
		is_9addl<=is_9addl;
		is_10addl<=is_10addl;
		is_11addl<=is_11addl;
		is_12addl<=is_12addl;
		is_13addl<=is_13addl;
		is_14addl<=is_14addl;
		end
	
	else if (catch3l==1 && is_3addl==0) begin
		if(display_double)
			total_score_left<=total_score_left+20'd250;
			total_score<=total_score+20'd250;
			total_score_right<=total_score_right;
		is_1addl<=is_1addl;
		is_2addl<=is_2addl;
		is_3addl<=1;
		is_4addl<=is_4addl;
		is_5addl<=is_5addl;
		is_6addl<=is_6addl;
		is_7addl<=is_7addl;
		is_8addl<=is_8addl;
		is_9addl<=is_9addl;
		is_10addl<=is_10addl;
		is_11addl<=is_11addl;
		is_12addl<=is_12addl;
		is_13addl<=is_13addl;
		is_14addl<=is_14addl;
		end
	
	else if (catch4l==1 && is_4addl==0  ) begin
		if(display_double)
			total_score_left<=total_score_left+20'd250;
			total_score<=total_score+20'd250;
			total_score_right<=total_score_right;
		is_1addl<=is_1addl;
		is_2addl<=is_2addl;
		is_3addl<=is_3addl;
		is_4addl<=1;
		is_5addl<=is_5addl;
		is_6addl<=is_6addl;
		is_7addl<=is_7addl;
		is_8addl<=is_8addl;
		is_9addl<=is_9addl;
		is_10addl<=is_10addl;
		is_11addl<=is_11addl;
		is_12addl<=is_12addl;
		is_13addl<=is_13addl;
		is_14addl<=is_14addl;
		end
	
	else if (catch5l==1 && is_5addl==0  ) begin
		if(display_double)
			total_score_left<=total_score_left+20'd100;
			total_score<=total_score+20'd100;
			total_score_right<=total_score_right;
		is_1addl<=is_1addl;
		is_2addl<=is_2addl;
		is_3addl<=is_3addl;
		is_4addl<=is_4addl;
		is_5addl<=1;
		is_6addl<=is_6addl;
		is_7addl<=is_7addl;
		is_8addl<=is_8addl;
		is_9addl<=is_9addl;
		is_10addl<=is_10addl;
		is_11addl<=is_11addl;
		is_12addl<=is_12addl;
		is_13addl<=is_13addl;
		is_14addl<=is_14addl;
		end
		
	else if (catch6l==1 && is_6addl==0 ) begin
		if(display_double)
			total_score_left<=total_score_left+20'd100;
			total_score<=total_score+20'd100;
			total_score_right<=total_score_right;
		is_1addl<=is_1addl;
		is_2addl<=is_2addl;
		is_3addl<=is_3addl;
		is_4addl<=is_4addl;
		is_5addl<=is_5addl;
		is_6addl<=1;
		is_7addl<=is_7addl;
		is_8addl<=is_8addl;
		is_9addl<=is_9addl;
		is_10addl<=is_10addl;
		is_11addl<=is_11addl;
		is_12addl<=is_12addl;
		is_13addl<=is_13addl;
		is_14addl<=is_14addl;
		end
	
	else if (catch7l==1 && is_7addl==0) begin
		if(display_double)
			total_score_left<=total_score_left+20'd50;
			total_score<=total_score+20'd50;
			total_score_right<=total_score_right;
		is_1addl<=is_1addl;
		is_2addl<=is_2addl;
		is_3addl<=is_3addl;
		is_4addl<=is_4addl;
		is_5addl<=is_5addl;
		is_6addl<=is_6addl;
		is_7addl<=1;
		is_8addl<=is_8addl;
		is_9addl<=is_9addl;
		is_10addl<=is_10addl;
		is_11addl<=is_11addl;
		is_12addl<=is_12addl;
		is_13addl<=is_13addl;
		is_14addl<=is_14addl;
		end
	
	else if (catch8l==1 && is_8addl==0 ) begin
		if(display_double)
			total_score_left<=total_score_left+20'd50;
			total_score<=total_score+20'd50;
			total_score_right<=total_score_right;
		is_1addl<=is_1addl;
		is_2addl<=is_2addl;
		is_3addl<=is_3addl;
		is_4addl<=is_4addl;
		is_5addl<=is_5addl;
		is_6addl<=is_6addl;
		is_7addl<=is_7addl;
		is_8addl<=1;
		is_9addl<=is_9addl;
		is_10addl<=is_10addl;
		is_11addl<=is_11addl;
		is_12addl<=is_12addl;
		is_13addl<=is_13addl;
		is_14addl<=is_14addl;
		end
		
	else if (catch11l==1 && is_11addl==0 ) begin
		if(display_double)
			total_score_left<=total_score_left+20'd50;
			total_score<=total_score+20'd50;
			total_score_right<=total_score_right;
		is_1addl<=is_1addl;
		is_2addl<=is_2addl;
		is_3addl<=is_3addl;
		is_4addl<=is_4addl;
		is_5addl<=is_5addl;
		is_6addl<=is_6addl;
		is_7addl<=is_7addl;
		is_8addl<=is_8addl;
		is_9addl<=is_9addl;
		is_10addl<=is_10addl;
		is_11addl<=1;
		is_12addl<=is_12addl;
		is_13addl<=is_13addl;
		is_14addl<=is_14addl;
		end
	
	else if (catch12l==1 && is_12addl==0 ) begin
		if(display_double)
			total_score_left<=total_score_left+20'd50;
			total_score<=total_score+20'd50;
			total_score_right<=total_score_right;
		is_1addl<=is_1addl;
		is_2addl<=is_2addl;
		is_3addl<=is_3addl;
		is_4addl<=is_4addl;
		is_5addl<=is_5addl;
		is_6addl<=is_6addl;
		is_7addl<=is_7addl;
		is_8addl<=is_8addl;
		is_9addl<=is_9addl;
		is_10addl<=is_10addl;
		is_11addl<=is_11addl;
		is_12addl<=1;
		is_13addl<=is_13addl;
		is_14addl<=is_14addl;
		end
	
	else if (catch9l==1 && is_9addl==0 ) begin
		if(display_double)
			total_score_left<=total_score_left+20'd600;
			total_score<=total_score+20'd600;
			total_score_right<=total_score_right;
		is_1addl<=is_1addl;
		is_2addl<=is_2addl;
		is_3addl<=is_3addl;
		is_4addl<=is_4addl;
		is_5addl<=is_5addl;
		is_6addl<=is_6addl;
		is_7addl<=is_7addl;
		is_8addl<=is_8addl;
		is_9addl<=1;
		is_10addl<=is_10addl;
		is_11addl<=is_11addl;
		is_12addl<=is_12addl;
		is_13addl<=is_13addl;
		is_14addl<=is_14addl;
		end
	
	else if (catch10l==1 && is_10addl==0 ) begin
		if(display_double)
			total_score_left<=total_score_left+20'd20;
			total_score<=total_score+20'd20;
			total_score_right<=total_score_right;
		is_1addl<=is_1addl;
		is_2addl<=is_2addl;
		is_3addl<=is_3addl;
		is_4addl<=is_4addl;
		is_5addl<=is_5addl;
		is_6addl<=is_6addl;
		is_7addl<=is_7addl;
		is_8addl<=is_8addl;
		is_9addl<=1;
		is_10addl<=is_10addl;
		is_11addl<=is_11addl;
		is_12addl<=is_12addl;
		is_13addl<=is_13addl;
		is_14addl<=is_14addl;
		end
	
	else if (catch13l==1 && is_13addl==0 ) begin
		if(display_double)
			total_score_left<=total_score_left+20'd20;
			total_score<=total_score+20'd20;
			total_score_right<=total_score_right;
		is_1addl<=is_1addl;
		is_2addl<=is_2addl;
		is_3addl<=is_3addl;
		is_4addl<=is_4addl;
		is_5addl<=is_5addl;
		is_6addl<=is_6addl;
		is_7addl<=is_7addl;
		is_8addl<=is_8addl;
		is_9addl<=is_9addl;
		is_10addl<=is_10addl;
		is_11addl<=is_11addl;
		is_12addl<=is_12addl;
		is_13addl<=1;
		is_14addl<=is_14addl;
		end
	
	else if (catch14l==1 && is_14addl==0 ) begin
		if(display_double)
			total_score_left<=total_score_left+20'd20;
			total_score<=total_score+20'd20;
			total_score_right<=total_score_right;
		is_1addl<=is_1addl;
		is_2addl<=is_2addl;
		is_3addl<=is_3addl;
		is_4addl<=is_4addl;
		is_5addl<=is_5addl;
		is_6addl<=is_6addl;
		is_7addl<=is_7addl;
		is_8addl<=is_8addl;
		is_9addl<=is_9addl;
		is_10addl<=is_10addl;
		is_11addl<=is_11addl;
		is_12addl<=is_12addl;
		is_13addl<=is_13addl;
		is_14addl<=1;
		end
	
end
//////////////////////////////////////////////
always_comb begin
	if (DrawY>=10'd0 && DrawY<=10'd15 &&DrawX>=10'd15 && DrawX<=10'd22)
		read_address=(DrawX-10'd15)+8*(DrawY)+1280;
	else if (DrawY>=10'd0 && DrawY<=10'd15 &&DrawX>=10'd26 && DrawX<=10'd33)
		read_address=(DrawX-10'd26)+8*(DrawY)+1280+128;
	else if (DrawY>=10'd0 && DrawY<=10'd15 &&DrawX>=10'd37 && DrawX<=10'd44)
		read_address=(DrawX-10'd37)+8*(DrawY)+1280+128*2;
	else if (DrawY>=10'd0 && DrawY<=10'd15 &&DrawX>=10'd48 && DrawX<=10'd55)
		read_address=(DrawX-10'd48)+8*(DrawY)+1280+128*3;
	else if (DrawY>=10'd0 && DrawY<=10'd15 &&DrawX>=10'd59 && DrawX<=10'd66)
		read_address=(DrawX-10'd59)+8*(DrawY)+1280+128*4; // here draw SCORE
	else if (DrawY>=10'd0 && DrawY<=10'd15 &&DrawX>=10'd73 && DrawX<=10'd80)
		read_address=(DrawX-10'd73)+8*(DrawY)+128*num_p5;
	else if (DrawY>=10'd0 && DrawY<=10'd15 &&DrawX>=10'd84 && DrawX<=10'd91)
		read_address=(DrawX-10'd84)+8*(DrawY)+128*num_p4;
	else if (DrawY>=10'd0 && DrawY<=10'd15 &&DrawX>=10'd95 && DrawX<=10'd102)
		read_address=(DrawX-10'd95)+8*(DrawY)+128*num_p3;
	else if (DrawY>=10'd0 && DrawY<=10'd15 &&DrawX>=10'd106 && DrawX<=10'd113)
		read_address=(DrawX-10'd106)+8*(DrawY)+128*num_p2;
	else if (DrawY>=10'd0 && DrawY<=10'd15 &&DrawX>=10'd117 && DrawX<=10'd124)
		read_address=(DrawX-10'd117)+8*(DrawY)+128*num_p1;  // here 5 number from msb to lsb
	
//left
else if(DrawY>=85 && DrawY<=100 && DrawX>=110 && DrawX<=117)
		read_address=(DrawX-10'd110)+8*(DrawY-85)+128*num_p5l;
else if(DrawY>=85 && DrawY<=100 && DrawX>=123 && DrawX<=130)
		read_address=(DrawX-10'd123)+8*(DrawY-85)+128*num_p4l;	
else if(DrawY>=85 && DrawY<=100 && DrawX>=136 && DrawX<=143)
		read_address=(DrawX-10'd136)+8*(DrawY-85)+128*num_p3l;
else if(DrawY>=85 && DrawY<=100 && DrawX>=149 && DrawX<=156)
		read_address=(DrawX-10'd149)+8*(DrawY-85)+128*num_p2l;
else if(DrawY>=85 && DrawY<=100 && DrawX>=162 && DrawX<=169)
		read_address=(DrawX-10'd162)+8*(DrawY-85)+128*num_p1l;
//right
else if(DrawY>=85 && DrawY<=100 && DrawX>=420 && DrawX<=427)
		read_address=(DrawX-10'd420)+8*(DrawY-85)+128*num_p5r;
else if(DrawY>=85 && DrawY<=100 && DrawX>=433 && DrawX<=440)
		read_address=(DrawX-10'd433)+8*(DrawY-85)+128*num_p4r;	
else if(DrawY>=85 && DrawY<=100 && DrawX>=446 && DrawX<=453)
		read_address=(DrawX-10'd446)+8*(DrawY-85)+128*num_p3r;
else if(DrawY>=85 && DrawY<=100 && DrawX>=459 && DrawX<=466)
		read_address=(DrawX-10'd459)+8*(DrawY-85)+128*num_p2r;
else if(DrawY>=85 && DrawY<=100 && DrawX>=472 && DrawX<=479)
		read_address=(DrawX-10'd472)+8*(DrawY-85)+128*num_p1r;
else
	read_address=0;
	
end
////////////////////////////////////////////////













double_font_rom font_rom_ins(.read_address(read_address) ,.clk(Clk),    .is_score_double(is_score_double));



endmodule

module double_font_rom(input logic [18:0] read_address,
					input logic clk,
					output is_score_double);
					
logic memory[1920];
initial
begin
	 $readmemh("sprite/font.txt", memory);
end



always_ff @ (posedge clk) begin
	is_score_double<= memory[read_address];
end
			
					
					
					
					
endmodule
