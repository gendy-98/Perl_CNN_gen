`timescale 1ns / 1ps


module 
 top_poolb_U2_S2_K2 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE              = 10,
	IFM_DEPTH				= 16,
	KERNAL_SIZE			= 2,
    ARITH_TYPE 				= 0,
    NUMBER_OF_UNITS         = 2,
	//////////////////////////////////////
	NUMBER_OF_IFM_NEXT      = IFM_DEPTH,
	IFM_SIZE_NEXT           = (IFM_SIZE - KERNAL_SIZE)/2 + 1,
    ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
    ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT)
	)(
	input clk,
	input reset,
	input start_from_previous,           
	input [DATA_WIDTH-1:0] data_in_A_from_previous1,
	input [DATA_WIDTH-1:0] data_in_B_from_previous1,
	input [DATA_WIDTH-1:0] data_in_A_from_previous2,
	input [DATA_WIDTH-1:0] data_in_B_from_previous2,
	output                        ifm_enable_read_A_current,
    output                        ifm_enable_read_B_current,
	output [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_current,
	output [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_current,
	output end_to_previous,
     
    input  conv_ready,
    input  end_from_next,
    output                             ifm_enable_write_next,     
    output [ADDRESS_SIZE_NEXT_IFM-1:0] ifm_address_write_next,
	output [DATA_WIDTH-1 : 0]          data_out_for_next1,
	output [DATA_WIDTH-1 : 0]          data_out_for_next2,
	output start_to_next,
	output [$clog2(8)-1:0] ifm_sel_next //where 8 is ceil(NUMBER_OF_IFM_NEXT/NUMBER_OF_UNITS)
   );
   
   wire fifo_enable;
   wire pool_enable;
	poolb_cu_U2 #(.IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE))
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
    poolb_dp_U2 #(.DATA_WIDTH(DATA_WIDTH), 
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
	
	.data_in_A_unit1(data_in_A_from_previous1),
	.data_in_B_unit1(data_in_B_from_previous1),
	.data_in_A_unit2(data_in_A_from_previous2),
	.data_in_B_unit2(data_in_B_from_previous2),
	.data_out_1 (data_out_for_next1),
	.data_out_2 (data_out_for_next2)
	);
	
endmodule
