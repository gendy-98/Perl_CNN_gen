`timescale 1ns / 1ps


module 
 fully_connected_10 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 			  = 32,
	ARITH_TYPE                = 0
)(
	input [DATA_WIDTH-1:0] Data_in,
	input [DATA_WIDTH-1:0] Data_Weight_1,
	input [DATA_WIDTH-1:0] Data_Weight_2,
	input [DATA_WIDTH-1:0] Data_Weight_3,
	input [DATA_WIDTH-1:0] Data_Weight_4,
	input [DATA_WIDTH-1:0] Data_Weight_5,
	input [DATA_WIDTH-1:0] Data_Weight_6,
	input [DATA_WIDTH-1:0] Data_Weight_7,
	input [DATA_WIDTH-1:0] Data_Weight_8,
	input [DATA_WIDTH-1:0] Data_Weight_9,
	input [DATA_WIDTH-1:0] Data_Weight_10,
	output [DATA_WIDTH-1:0] Data_out_FC_1,
	output [DATA_WIDTH-1:0] Data_out_FC_2,
	output [DATA_WIDTH-1:0] Data_out_FC_3,
	output [DATA_WIDTH-1:0] Data_out_FC_4,
	output [DATA_WIDTH-1:0] Data_out_FC_5,
	output [DATA_WIDTH-1:0] Data_out_FC_6,
	output [DATA_WIDTH-1:0] Data_out_FC_7,
	output [DATA_WIDTH-1:0] Data_out_FC_8,
	output [DATA_WIDTH-1:0] Data_out_FC_9,
	output [DATA_WIDTH-1:0] Data_out_FC_10
	);
	
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M1 (.in1 (Data_in) ,.in2 (Data_Weight_1),.out(Data_out_FC_1));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M2 (.in1 (Data_in) ,.in2 (Data_Weight_2),.out(Data_out_FC_2));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M3 (.in1 (Data_in) ,.in2 (Data_Weight_3),.out(Data_out_FC_3));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M4 (.in1 (Data_in) ,.in2 (Data_Weight_4),.out(Data_out_FC_4));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M5 (.in1 (Data_in) ,.in2 (Data_Weight_5),.out(Data_out_FC_5));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M6 (.in1 (Data_in) ,.in2 (Data_Weight_6),.out(Data_out_FC_6));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M7 (.in1 (Data_in) ,.in2 (Data_Weight_7),.out(Data_out_FC_7));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M8 (.in1 (Data_in) ,.in2 (Data_Weight_8),.out(Data_out_FC_8));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M9 (.in1 (Data_in) ,.in2 (Data_Weight_9),.out(Data_out_FC_9));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M10 (.in1 (Data_in) ,.in2 (Data_Weight_10),.out(Data_out_FC_10));
	endmodule
