`timescale 1ns / 1ps


module 
 top_poolb_U16_S2_K2 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE              = 10,
	IFM_DEPTH				= 16,
	KERNAL_SIZE			= 2,
    ARITH_TYPE 				= 0,
    NUMBER_OF_UNITS         = 16,
	//////////////////////////////////////
	NUMBER_OF_IFM_NEXT      = IFM_DEPTH,
	IFM_SIZE_NEXT           = (IFM_SIZE - KERNAL_SIZE)/2 + 1,
    ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
    ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT)
	)(
	input clk,
	input reset,
	input start_from_previous,           
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
	output                        ifm_enable_read_A_current,
    output                        ifm_enable_read_B_current,
	output [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_current,
	output [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_current,
	output end_to_previous,
     
    input  conv_ready,
    input  end_from_next,
    output                             ifm_enable_write_next,     
    output [ADDRESS_SIZE_NEXT_IFM-1:0] ifm_address_write_next,
	output [DATA_WIDTH-1 : 0]          data_out_1,
	output [DATA_WIDTH-1 : 0]          data_out_2,
	output [DATA_WIDTH-1 : 0]          data_out_3,
	output [DATA_WIDTH-1 : 0]          data_out_4,
	output [DATA_WIDTH-1 : 0]          data_out_5,
	output [DATA_WIDTH-1 : 0]          data_out_6,
	output [DATA_WIDTH-1 : 0]          data_out_7,
	output [DATA_WIDTH-1 : 0]          data_out_8,
	output [DATA_WIDTH-1 : 0]          data_out_9,
	output [DATA_WIDTH-1 : 0]          data_out_10,
	output [DATA_WIDTH-1 : 0]          data_out_11,
	output [DATA_WIDTH-1 : 0]          data_out_12,
	output [DATA_WIDTH-1 : 0]          data_out_13,
	output [DATA_WIDTH-1 : 0]          data_out_14,
	output [DATA_WIDTH-1 : 0]          data_out_15,
	output [DATA_WIDTH-1 : 0]          data_out_16,
	output start_to_next,
	output [$clog2(1)-1:0] ifm_sel_next //where 1 is ceil(NUMBER_OF_IFM_NEXT/NUMBER_OF_UNITS)
   );
   
   wire fifo_enable;
   wire pool_enable;
	poolb_cu_U16 #(.IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE))
    CU
    (
    .clk(clk),
    .reset(reset),
    .start_from_previous(start_from_previous),
    .conv_ready(conv_ready),
    .end_from_next(end_from_next),
    .end_to_previous(end_to_previous),
    .ifm_enable_read_A_current(ifm_enable_read_A_current), 
    .ifm_enable_read_B_current(ifm_enable_read_B_current), 
    .ifm_address_read_A_current(ifm_address_read_A_current),
    .ifm_address_read_B_current(ifm_address_read_B_current),
    .fifo_enable (fifo_enable),
    .pool_enable (pool_enable),
    .ifm_enable_write_next(ifm_enable_write_next),
    .ifm_address_write_next (ifm_address_write_next),
    .start_to_next(start_to_next),
    .ifm_sel_next (ifm_sel_next)
   );
    poolb_dp_U16 #(.DATA_WIDTH(DATA_WIDTH), 
    .IFM_SIZE(IFM_SIZE), 
    .IFM_DEPTH(IFM_DEPTH), 
    .ARITH_TYPE(ARITH_TYPE),
    .KERNAL_SIZE(KERNAL_SIZE))
    DP
	(
	.clk(clk),
	.reset(reset),
	
	.fifo_enable (fifo_enable),
	.pool_enable (pool_enable),
	
	.data_in_A_unit1(data_in_A_unit1),
	.data_in_B_unit1(data_in_B_unit1),
	.data_in_A_unit2(data_in_A_unit2),
	.data_in_B_unit2(data_in_B_unit2),
	.data_in_A_unit3(data_in_A_unit3),
	.data_in_B_unit3(data_in_B_unit3),
	.data_in_A_unit4(data_in_A_unit4),
	.data_in_B_unit4(data_in_B_unit4),
	.data_in_A_unit5(data_in_A_unit5),
	.data_in_B_unit5(data_in_B_unit5),
	.data_in_A_unit6(data_in_A_unit6),
	.data_in_B_unit6(data_in_B_unit6),
	.data_in_A_unit7(data_in_A_unit7),
	.data_in_B_unit7(data_in_B_unit7),
	.data_in_A_unit8(data_in_A_unit8),
	.data_in_B_unit8(data_in_B_unit8),
	.data_in_A_unit9(data_in_A_unit9),
	.data_in_B_unit9(data_in_B_unit9),
	.data_in_A_unit10(data_in_A_unit10),
	.data_in_B_unit10(data_in_B_unit10),
	.data_in_A_unit11(data_in_A_unit11),
	.data_in_B_unit11(data_in_B_unit11),
	.data_in_A_unit12(data_in_A_unit12),
	.data_in_B_unit12(data_in_B_unit12),
	.data_in_A_unit13(data_in_A_unit13),
	.data_in_B_unit13(data_in_B_unit13),
	.data_in_A_unit14(data_in_A_unit14),
	.data_in_B_unit14(data_in_B_unit14),
	.data_in_A_unit15(data_in_A_unit15),
	.data_in_B_unit15(data_in_B_unit15),
	.data_in_A_unit16(data_in_A_unit16),
	.data_in_B_unit16(data_in_B_unit16),
	.data_out_1 (data_out_1),
	.data_out_2 (data_out_2),
	.data_out_3 (data_out_3),
	.data_out_4 (data_out_4),
	.data_out_5 (data_out_5),
	.data_out_6 (data_out_6),
	.data_out_7 (data_out_7),
	.data_out_8 (data_out_8),
	.data_out_9 (data_out_9),
	.data_out_10 (data_out_10),
	.data_out_11 (data_out_11),
	.data_out_12 (data_out_12),
	.data_out_13 (data_out_13),
	.data_out_14 (data_out_14),
	.data_out_15 (data_out_15),
	.data_out_16 (data_out_16)
	);
	
endmodule