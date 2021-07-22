`timescale 1ns / 1ps


module 
 adder #(parameter
	ARITH_TYPE = 0,
	DATA_WIDTH = 32,
	E = 8, 
	M = 23 )
    (
    input [DATA_WIDTH-1:0] in1,
    input [DATA_WIDTH-1:0] in2,
    output [DATA_WIDTH-1:0] out
    );
     
    generate
		if (ARITH_TYPE)
			fixed_point_adder    #(.DATA_WIDTH(DATA_WIDTH)) add (.in1(in1), .in2(in2), .out(out));
		else
			floating_point_adder #(.DATA_WIDTH(DATA_WIDTH), .E(8), .M(23)) add (.in1(in1), .in2(in2), .out(out));
	endgenerate
    
endmodule
