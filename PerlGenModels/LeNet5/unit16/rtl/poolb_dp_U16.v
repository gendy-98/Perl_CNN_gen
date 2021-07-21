`timescale 1ns / 1ps


module 
 poolb_dp_U16 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 			  = 32,
	////////////////////////////////////
	IFM_SIZE              = 10,                                                
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
	input [DATA_WIDTH-1:0] data_in_A_unit4,
	input [DATA_WIDTH-1:0] data_in_B_unit4,
	input [DATA_WIDTH-1:0] data_in_A_unit5,
	input [DATA_WIDTH-1:0] data_in_B_unit5,
	input [DATA_WIDTH-1:0] data_in_A_unit6,
	input [DATA_WIDTH-1:0] data_in_B_unit6,
	input [DATA_WIDTH-1:0] data_in_A_unit7,
	input [DATA_WIDTH-1:0] data_in_B_unit7,
	input [DATA_WIDTH-1:0] data_in_A_unit8,
	input [DATA_WIDTH-1:0] data_in_B_unit8,
	input [DATA_WIDTH-1:0] data_in_A_unit9,
	input [DATA_WIDTH-1:0] data_in_B_unit9,
	input [DATA_WIDTH-1:0] data_in_A_unit10,
	input [DATA_WIDTH-1:0] data_in_B_unit10,
	input [DATA_WIDTH-1:0] data_in_A_unit11,
	input [DATA_WIDTH-1:0] data_in_B_unit11,
	input [DATA_WIDTH-1:0] data_in_A_unit12,
	input [DATA_WIDTH-1:0] data_in_B_unit12,
	input [DATA_WIDTH-1:0] data_in_A_unit13,
	input [DATA_WIDTH-1:0] data_in_B_unit13,
	input [DATA_WIDTH-1:0] data_in_A_unit14,
	input [DATA_WIDTH-1:0] data_in_B_unit14,
	input [DATA_WIDTH-1:0] data_in_A_unit15,
	input [DATA_WIDTH-1:0] data_in_B_unit15,
	input [DATA_WIDTH-1:0] data_in_A_unit16,
	input [DATA_WIDTH-1:0] data_in_B_unit16,
	output [DATA_WIDTH-1:0] data_out_1,
	output [DATA_WIDTH-1:0] data_out_2,
	output [DATA_WIDTH-1:0] data_out_3,
	output [DATA_WIDTH-1:0] data_out_4,
	output [DATA_WIDTH-1:0] data_out_5,
	output [DATA_WIDTH-1:0] data_out_6,
	output [DATA_WIDTH-1:0] data_out_7,
	output [DATA_WIDTH-1:0] data_out_8,
	output [DATA_WIDTH-1:0] data_out_9,
	output [DATA_WIDTH-1:0] data_out_10,
	output [DATA_WIDTH-1:0] data_out_11,
	output [DATA_WIDTH-1:0] data_out_12,
	output [DATA_WIDTH-1:0] data_out_13,
	output [DATA_WIDTH-1:0] data_out_14,
	output [DATA_WIDTH-1:0] data_out_15,
	output [DATA_WIDTH-1:0] data_out_16
	);
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
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
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
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
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
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
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit4(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit4),
	.unit_data_in_2(data_in_B_unit4),
    .unit_data_out(data_out_4)
    );
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit5(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit5),
	.unit_data_in_2(data_in_B_unit5),
    .unit_data_out(data_out_5)
    );
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit6(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit6),
	.unit_data_in_2(data_in_B_unit6),
    .unit_data_out(data_out_6)
    );
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit7(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit7),
	.unit_data_in_2(data_in_B_unit7),
    .unit_data_out(data_out_7)
    );
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit8(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit8),
	.unit_data_in_2(data_in_B_unit8),
    .unit_data_out(data_out_8)
    );
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit9(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit9),
	.unit_data_in_2(data_in_B_unit9),
    .unit_data_out(data_out_9)
    );
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit10(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit10),
	.unit_data_in_2(data_in_B_unit10),
    .unit_data_out(data_out_10)
    );
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit11(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit11),
	.unit_data_in_2(data_in_B_unit11),
    .unit_data_out(data_out_11)
    );
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit12(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit12),
	.unit_data_in_2(data_in_B_unit12),
    .unit_data_out(data_out_12)
    );
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit13(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit13),
	.unit_data_in_2(data_in_B_unit13),
    .unit_data_out(data_out_13)
    );
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit14(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit14),
	.unit_data_in_2(data_in_B_unit14),
    .unit_data_out(data_out_14)
    );
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit15(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit15),
	.unit_data_in_2(data_in_B_unit15),
    .unit_data_out(data_out_15)
    );
	
	poolb_unit_10 #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.KERNAL_SIZE(KERNAL_SIZE))
    unit16(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit16),
	.unit_data_in_2(data_in_B_unit16),
    .unit_data_out(data_out_16)
    );
	
endmodule
	
