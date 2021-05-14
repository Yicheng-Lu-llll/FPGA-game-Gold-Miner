module random_variable_processor(


input logic Clk,
input logic [31:0] position0,
input logic [31:0] position1,
input logic [31:0] position2,
input logic [31:0] position3,
input logic [31:0] position4,
input logic [31:0] position5,
input logic [31:0] position6,
input logic [31:0] position7,
input logic [31:0] position8,
input logic [31:0] position9,
input logic [31:0] position10,
input logic [31:0] position11,
input logic [31:0] position12,

input logic [31:0] position13,
input logic [31:0] position14,
input logic [31:0] position15,
input logic [31:0] position16,
input logic [31:0] position17,
input logic [31:0] position18,
input logic [31:0] position19,
input logic [31:0] position20,


input logic [31:0] is_new_game_start,


input logic [31:0] position21,        //        position21.export
input logic [31:0] position22,        //        position22.export
input logic [31:0] position23,        //        position23.export
input logic [31:0] position24,        //        position24.export
input logic [31:0] position25,        //        position25.export
input logic [31:0] position26,        //        position26.export
input logic [31:0] position27,        //        position27.export
input logic [31:0] position28,        //        position28.export
input logic [31:0] position29,        //        position29.export
input logic [31:0] position30,        //        position30.export
input logic [31:0] position31,        //        position31.export
input logic [31:0] position32,        //        position32.export
input logic [31:0] position33,        //        position33.export
input logic [31:0] position34,        //        position34.export
input logic [31:0] position35,        //        position35.export
input logic [31:0] position36,        //        position36.export



output logic [9:0] goldx1,
output logic [9:0] goldy1,


output logic [9:0] goldx2,
output logic [9:0] goldy2,

output logic [9:0] goldx3,
output logic [9:0] goldy3,

output logic [9:0] goldx4,
output logic [9:0] goldy4,

output logic [9:0] goldx5,
output logic [9:0] goldy5,

output logic [9:0] goldx6,
output logic [9:0] goldy6,

output logic [9:0] goldx7,
output logic [9:0] goldy7,

output logic [9:0] goldx8,
output logic [9:0] goldy8,

output logic [9:0] goldx9,
output logic [9:0] goldy9,

output logic [9:0] goldx10,
output logic [9:0] goldy10,









output logic [9:0] goldx11,
output logic [9:0] goldy11,

output logic [9:0] goldx12,
output logic [9:0] goldy12,

output logic [9:0] goldx13,
output logic [9:0] goldy13,

output logic [9:0] goldx14,
output logic [9:0] goldy14,

output logic [9:0] goldx15,
output logic [9:0] goldy15,

output logic [9:0] goldx16,
output logic [9:0] goldy16,

output logic [9:0] goldx17,
output logic [9:0] goldy17,


output logic [9:0] goldx18,
output logic [9:0] goldy18

);

always_ff@ (posedge Clk)begin


if (is_new_game_start==1) begin

	
////////////////////////////////////////////////
//big gold
	goldx1<=position0      %200+40;
	goldy1<=position9      %100 +330;
		
		
	goldx2<=position1      %200+300;
	goldy2<=position10     %100 +330;	
	
////////////////////////////////////////////////	



////////////////////////////////////////////////
//middle gold
	goldx3<=position2		 %50+300;	
	goldy3<=position11  	 %80 +300;
	
	
	goldx4<=position3     %50+250;	
	goldy4<=position12    %80 +200;	
	
////////////////////////////////////////////////



////////////////////////////////////////////////
//small gold
	goldx5<=position4    %570+30;
	goldy5<=position13   %40 +70;
		
		
		
	goldx6<=position5    %570+30;	
	goldy6<=position14   %40 +70;
////////////////////////////////////////////////



////////////////////////////////////////////////
//big stone


	goldx7<=position6    %150+100;
	goldy7<=position15   %40 +100;
	
	
	goldx8<=position7    %150+350;
	goldy8<=position16   %50 +90;
	
	
	goldx11<=position21	%50+250;
	goldy11<=position22	%50+200;

	goldx12<=position23	%50+350;
	goldy12<=position24	%50+350;


////////////////////////////////////////////////


////////////////////////////////////////////////
//demond
	goldx9<=position8    %80+300;	
	goldy9<=position17   %50 +300;
////////////////////////////////////////////////





////////////////////////////////////////////////
//small stone
	goldx10<=position18   %50+300;
	goldy10<=position19   %100 +70;
	
	goldx13<=position25	 %50+300;
	goldy13<=position26	 %100 +170;

	goldx14<=position27	 %50+300;
	goldy14<=position28	 %100 +270;
////////////////////////////////////////////////
	
	





	
	



	end 
	

else begin
	
	goldx1<=goldx1;
	goldx2<=goldx2;
	goldx3<=goldx3;
	goldx4<=goldx4;
	goldx5<=goldx5;
	goldx6<=goldx6;
	goldx7<=goldx7;
	goldx8<=goldx8;
	goldx9<=goldx9;
	goldx10<=goldx10;
	
	
	goldx11<=goldx11;
	goldx12<=goldx12;
	goldx13<=goldx13;
	goldx14<=goldx14;
	goldx14<=goldx15;
	goldx16<=goldx16;
	goldx17<=goldx17;
	goldx18<=goldx18;


	
	
	
	goldy1<=goldy1;
	goldy2<=goldy2;
	goldy3<=goldy3;
	goldy4<=goldy4;
	goldy5<=goldy5;
	goldy6<=goldy6;
	goldy7<=goldy7;
	goldy8<=goldy8;
	goldy9<=goldy9;
	goldy10<=goldy10;
	
	
	
	
	goldy11<=goldy11;
	goldy12<=goldy12;
	goldy13<=goldy13;
	goldy14<=goldy14;
	goldy15<=goldy15;
	goldy16<=goldy16;
	goldy17<=goldy17;
	goldy18<=goldy18;


	

	end










end


endmodule
