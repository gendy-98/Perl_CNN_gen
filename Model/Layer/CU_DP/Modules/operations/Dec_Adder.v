`timescale 1ns / 1ps


module 
 Dec_Adder #(parameter
	DATA_WIDTH = 32
	)(
	input [DATA_WIDTH - 1:0] in1,
	input [DATA_WIDTH - 1:0] in2,
	output [DATA_WIDTH - 1:0] out
	);
	assign out = in1 + in2;
endmodule
