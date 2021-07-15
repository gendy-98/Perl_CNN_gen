`timescale 1ns / 1ps


module 
 divider #(parameter
	ARITH_TYPE = 0,
	DATA_WIDTH = 32,
	E          = 8,
	M          = 24
)
	(
    input [DATA_WIDTH-1:0] in1,
    output  [DATA_WIDTH-1:0] out
    );
	
	generate
		if (ARITH_TYPE)
			fixed_point_mul    #(.DATA_WIDTH(DATA_WIDTH), .E(E), .M(M)) mul (.in1(in1), .in2(16'b000000_0100000000), .out(out));
		else
			floating_point_mul #(.DATA_WIDTH(DATA_WIDTH), .E(E), .M(M)) mul (.in1(in1), .in2(32'b00111110100000000000000000000000), .out(out));
	endgenerate
	
endmodule
