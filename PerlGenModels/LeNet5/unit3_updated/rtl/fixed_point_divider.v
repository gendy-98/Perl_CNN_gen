`timescale 1ns / 1ps


module 
 fixed_point_divider #(parameter
	DATA_WIDTH = 32,
	INTEGER = 23, 
	FRACTION = 8 )
    (
    input [DATA_WIDTH-1:0] in1,
    output [DATA_WIDTH-1:0] out
    );

	assign out = {in1 [DATA_WIDTH-1],in1 [DATA_WIDTH-1],in1 [DATA_WIDTH-1:2]};
  
endmodule

