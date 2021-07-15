`timescale 1ns / 1ps


module 
 poolb_dp_U3 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 			  = 32,
	////////////////////////////////////
	IFM_SIZE              = 7,                                                
	IFM_DEPTH             = 16,
	ARITH_TYPE 				= 0,
	KERNAL_SIZE           = 2
)(
	input 							clk,
	input 							reset,
	input 							fifo_enable,
	input							pool_enable,
	input [DATA_WIDTH-1:0] data_in_A_unit1,
	input [DATA_WIDTH-1:0] data_in_B_unit1,
	input [DATA_WIDTH-1:0] data_in_A_unit2,
	input [DATA_WIDTH-1:0] data_in_B_unit2,
	input [DATA_WIDTH-1:0] data_in_A_unit3,
	input [DATA_WIDTH-1:0] data_in_B_unit3,
	output [DATA_WIDTH-1:0] data_out_1,
	output [DATA_WIDTH-1:0] data_out_2,
	output [DATA_WIDTH-1:0] data_out_3
	);
	poolb_unit #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.IFM_DEPTH(IFM_DEPTH), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit1(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit1),
	.unit_data_in_2(data_in_B_unit1),
    .unit_data_out(data_out_1)
    );
	
	poolb_unit #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.IFM_DEPTH(IFM_DEPTH), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit2(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit2),
	.unit_data_in_2(data_in_B_unit2),
    .unit_data_out(data_out_2)
    );
	
	poolb_unit #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.IFM_DEPTH(IFM_DEPTH), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit3(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit3),
	.unit_data_in_2(data_in_B_unit3),
    .unit_data_out(data_out_3)
    );
	
endmodule
	
