`timescale 1ns / 1ps



module 
 demux_1_to_2 
(
	input  din,
	input  [0:0] sel,
	output dout_1,
	output dout_2
);

	assign dout_1	= din & ( ~sel[0] );
	assign dout_2	= din & (  sel[0] );
	
endmodule
