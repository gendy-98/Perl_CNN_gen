`timescale 1ns / 1ps



module 
 demux_1_to_1 
(
	input  din,
	input  [-1:0] sel,
	output dout_1
);

	assign dout_1	= din;
	
endmodule
