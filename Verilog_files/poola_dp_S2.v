`timescale 1ns / 1ps


module 
 poola_dp_S2 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 			  = 32,
	////////////////////////////////////
	IFM_SIZE              = 28,                                                
	IFM_DEPTH             = 6,
	KERNAL_SIZE           = 2
)(
	input 							clk,
	input 							reset,
	
	input 							fifo_enable,
	input							pool_enable,
	input [DATA_WIDTH-1:0] data_in_A,
	input [DATA_WIDTH-1:0] data_in_B,
	output [DATA_WIDTH-1:0] data_out
    );
////////////////////////Signal declaration/////////////////
	
	wire [DATA_WIDTH-1:0] signal_if1;
	wire [DATA_WIDTH-1:0] signal_if2;
	wire [DATA_WIDTH-1:0] signal_if3;
	wire [DATA_WIDTH-1:0] signal_if4;

	FIFO_4_2_30 #(.DATA_WIDTH(DATA_WIDTH), .IFM_SIZE(IFM_SIZE), .KERNAL_SIZE(KERNAL_SIZE))
	FIFO1 (
	.clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.fifo_data_in(data_in_A),
	
	.fifo_data_in_2(data_in_B),
	.fifo_data_out_1(signal_if1),
	.fifo_data_out_2(signal_if2),
	.fifo_data_out_3(signal_if3),
	.fifo_data_out_4(signal_if4)
	);
	
	average_pooling #(.DATA_WIDTH(DATA_WIDTH))
	pool_1 (
	.clk(clk),
    .reset(reset),
    .pool_enable(pool_enable),

	.pool_data_in_1(signal_if1),
	.pool_data_in_2(signal_if2),
	.pool_data_in_3(signal_if3),
	.pool_data_in_4(signal_if4),
	.pool_data_out_reg(data_out)
	);
		
endmodule
