

module testbench();

// half clock cycle at 50 MHz
// this is the amount of time represented by #1 delay
timeunit 10ns;
timeprecision 1ns;


logic Clk;
logic [9:0] DrawX, DrawY;
logic reset, extend;
logic is_hook;
logic[3:0] hook_index;
logic is_string;




	
	// initialize the toplevel entity
hook test( .*);






	
	// set clock rule
   always begin : CLOCK_GENERATION 
		#1 Clk = ~Clk;
   end

	



	// initialize clock signal 
	initial begin: CLOCK_INITIALIZATION 
		Clk = 0;
   end
	
	// begin testing
	initial begin: TEST_VECTORS
		reset=1;
		extend=0;
		#2
		reset=0;
		extend=0;
		DrawX=10'd30;
		DrawY=10'd30;
		#2
		extend=1;
		
	   #1000;
		
	
	

	end
	 
endmodule
