`timescale 1ns / 1ps


module 
 fixed_point_adder #(parameter
	DATA_WIDTH = 32,
	INTEGER = 23, 
	FRACTION = 8 )
    (
    input [DATA_WIDTH-1:0] in1,
    input [DATA_WIDTH-1:0] in2,
    output [DATA_WIDTH-1:0] out
    );
   
	assign out = in1 + in2;
  
endmodule

