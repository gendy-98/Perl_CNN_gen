`timescale 1ns / 1ps


module 
 relu #(parameter
///////////advanced parameters//////////
	DATA_WIDTH      = 32
	)(
	input relu_enable,
    input [DATA_WIDTH-1:0] in,
    output [DATA_WIDTH-1:0] out
    );
   
	assign out = ( (in[DATA_WIDTH-1]) & relu_enable ) ?  32'h00000000 : in ;
    //assign out = in;
endmodule 


