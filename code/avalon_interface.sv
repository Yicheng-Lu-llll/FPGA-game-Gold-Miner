module avalon_interface(
	input logic CLK,
	input logic RESET,
	input  logic AVL_READ,					
	input  logic AVL_WRITE,					
	input  logic AVL_CS,	
	input  logic [3:0] AVL_BYTE_EN,		// Avalon-MM Byte Enable
	input  logic [6:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data
	output logic [4095:0] EXPORT_DATA

	
	
);
logic [31:0][127:0]register_file;
always_ff @ (posedge CLK) begin

if(RESET) 
		register_file<=4096'b0;

else if (AVL_WRITE & AVL_CS) begin
	if(AVL_BYTE_EN[0]==1) 
		register_file[AVL_ADDR][7:0]<=AVL_WRITEDATA[7:0];
	if(AVL_BYTE_EN[1]==1) 
		register_file[AVL_ADDR][15:8]<=AVL_WRITEDATA[15:8];
	if(AVL_BYTE_EN[2]==1) 
		register_file[AVL_ADDR][23:16]<=AVL_WRITEDATA[23:16];
	if(AVL_BYTE_EN[3]==1) 
		register_file[AVL_ADDR][31:24]<=AVL_WRITEDATA[31:24];
end


end
assign EXPORT_DATA=register_file;

always_comb begin

AVL_READDATA=32'b0;
if (AVL_READ & AVL_CS) begin
	AVL_READDATA=register_file[AVL_ADDR];


end


end
	


endmodule

