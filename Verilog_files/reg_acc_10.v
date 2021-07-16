`timescale 1ns / 1ps


module 
 reg_acc_10 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
	ARITH_TYPE 						= 0
	)(
	input clk,
	input reset,
	input bias_sel,
	input enable_write,

	input [DATA_WIDTH - 1 : 0] Data_in_1,
	input [DATA_WIDTH - 1 : 0] Data_in_2,
	input [DATA_WIDTH - 1 : 0] Data_in_3,
	input [DATA_WIDTH - 1 : 0] Data_in_4,
	input [DATA_WIDTH - 1 : 0] Data_in_5,
	input [DATA_WIDTH - 1 : 0] Data_in_6,
	input [DATA_WIDTH - 1 : 0] Data_in_7,
	input [DATA_WIDTH - 1 : 0] Data_in_8,
	input [DATA_WIDTH - 1 : 0] Data_in_9,
	input [DATA_WIDTH - 1 : 0] Data_in_10,
	input [DATA_WIDTH - 1 : 0] data_bias_1,
	input [DATA_WIDTH - 1 : 0] data_bias_2,
	input [DATA_WIDTH - 1 : 0] data_bias_3,
	input [DATA_WIDTH - 1 : 0] data_bias_4,
	input [DATA_WIDTH - 1 : 0] data_bias_5,
	input [DATA_WIDTH - 1 : 0] data_bias_6,
	input [DATA_WIDTH - 1 : 0] data_bias_7,
	input [DATA_WIDTH - 1 : 0] data_bias_8,
	input [DATA_WIDTH - 1 : 0] data_bias_9,
	input [DATA_WIDTH - 1 : 0] data_bias_10,
	output [DATA_WIDTH - 1 : 0] Data_out_FC_1,
	output [DATA_WIDTH - 1 : 0] Data_out_FC_2,
	output [DATA_WIDTH - 1 : 0] Data_out_FC_3,
	output [DATA_WIDTH - 1 : 0] Data_out_FC_4,
	output [DATA_WIDTH - 1 : 0] Data_out_FC_5,
	output [DATA_WIDTH - 1 : 0] Data_out_FC_6,
	output [DATA_WIDTH - 1 : 0] Data_out_FC_7,
	output [DATA_WIDTH - 1 : 0] Data_out_FC_8,
	output [DATA_WIDTH - 1 : 0] Data_out_FC_9,
	output [DATA_WIDTH - 1 : 0] Data_out_FC_10,
	output [DATA_WIDTH - 1 : 0] Data_out_FC_11
);
    Reg_Accumulator #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) R_ACC1 (.clk(clk),.reset(reset),.data_in_from_previous( Data_in_1),.data_bias(data_bias_1),.bias_sel(bias_sel),.Enable(enable_write | bias_sel),.reg_accu_data_out( Data_out_FC_1));
    Reg_Accumulator #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) R_ACC2 (.clk(clk),.reset(reset),.data_in_from_previous( Data_in_2),.data_bias(data_bias_2),.bias_sel(bias_sel),.Enable(enable_write | bias_sel),.reg_accu_data_out( Data_out_FC_2));
    Reg_Accumulator #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) R_ACC3 (.clk(clk),.reset(reset),.data_in_from_previous( Data_in_3),.data_bias(data_bias_3),.bias_sel(bias_sel),.Enable(enable_write | bias_sel),.reg_accu_data_out( Data_out_FC_3));
    Reg_Accumulator #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) R_ACC4 (.clk(clk),.reset(reset),.data_in_from_previous( Data_in_4),.data_bias(data_bias_4),.bias_sel(bias_sel),.Enable(enable_write | bias_sel),.reg_accu_data_out( Data_out_FC_4));
    Reg_Accumulator #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) R_ACC5 (.clk(clk),.reset(reset),.data_in_from_previous( Data_in_5),.data_bias(data_bias_5),.bias_sel(bias_sel),.Enable(enable_write | bias_sel),.reg_accu_data_out( Data_out_FC_5));
    Reg_Accumulator #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) R_ACC6 (.clk(clk),.reset(reset),.data_in_from_previous( Data_in_6),.data_bias(data_bias_6),.bias_sel(bias_sel),.Enable(enable_write | bias_sel),.reg_accu_data_out( Data_out_FC_6));
    Reg_Accumulator #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) R_ACC7 (.clk(clk),.reset(reset),.data_in_from_previous( Data_in_7),.data_bias(data_bias_7),.bias_sel(bias_sel),.Enable(enable_write | bias_sel),.reg_accu_data_out( Data_out_FC_7));
    Reg_Accumulator #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) R_ACC8 (.clk(clk),.reset(reset),.data_in_from_previous( Data_in_8),.data_bias(data_bias_8),.bias_sel(bias_sel),.Enable(enable_write | bias_sel),.reg_accu_data_out( Data_out_FC_8));
    Reg_Accumulator #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) R_ACC9 (.clk(clk),.reset(reset),.data_in_from_previous( Data_in_9),.data_bias(data_bias_9),.bias_sel(bias_sel),.Enable(enable_write | bias_sel),.reg_accu_data_out( Data_out_FC_9));
    Reg_Accumulator #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) R_ACC10 (.clk(clk),.reset(reset),.data_in_from_previous( Data_in_10),.data_bias(data_bias_10),.bias_sel(bias_sel),.Enable(enable_write | bias_sel),.reg_accu_data_out( Data_out_FC_10));
endmodule