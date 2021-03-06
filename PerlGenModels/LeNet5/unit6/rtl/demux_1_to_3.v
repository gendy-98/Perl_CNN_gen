`timescale 1ns / 1ps



module 
 demux_1_to_3 
(
	input  din,
	input  [1:0] sel,
	output dout_1,
	output dout_2,
	output dout_3
);

	assign dout_1	= din & ( ~sel[0] ) & ( ~sel[1] );
	assign dout_2	= din & (  sel[0] ) & ( ~sel[1] );
	assign dout_3	= din & ( ~sel[0] ) & (  sel[1] );
	
endmodule
