`timescale 1ns / 1ps


module 
 accumulator #(parameter
///////////advanced parameters//////////
	DATA_WIDTH      = 32
	)(
	input clk,
	input accu_enable,
	input  [DATA_WIDTH-1:0] data_in_from_conv,
	input  [DATA_WIDTH-1:0] data_bias,
	input  [DATA_WIDTH-1:0] data_in_from_next,
	output [DATA_WIDTH-1:0] accu_data_out
    );

    wire [DATA_WIDTH-1:0] data_out_mux;
    
	assign data_out_mux = accu_enable ? data_in_from_next : data_bias;

    Float_Adder D1 (.in1 (data_in_from_conv), .in2 (data_out_mux), .out (accu_data_out));

endmodule

