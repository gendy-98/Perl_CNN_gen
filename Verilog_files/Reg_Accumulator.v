`timescale 1ns / 1ps


module 
 Reg_Accumulator #(parameter
///////////advanced parameters//////////
	ARITH_TYPE = 32,
	DATA_WIDTH = 0
	)(
	input clk,
	input reset, 
	input Enable,
	input bias_sel, 
	input [DATA_WIDTH-1:0] data_in_from_previous,
	input [DATA_WIDTH-1:0] data_bias,
	output reg [DATA_WIDTH-1:0] reg_accu_data_out
	);
    
    wire [DATA_WIDTH-1:0] data_out_mux;
    wire [DATA_WIDTH-1:0] adder_data_out;
    
	assign data_out_mux = bias_sel ? data_bias : adder_data_out;
	
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) add ( .in1(data_in_from_previous), .in2(reg_accu_data_out), .out(adder_data_out) );
	
    always @(posedge clk ,posedge reset)
    begin 
        if (reset) 
            reg_accu_data_out <= {DATA_WIDTH{1'b0}}; 
        else if (Enable) 
            reg_accu_data_out <= data_out_mux; 
    end 

endmodule 
