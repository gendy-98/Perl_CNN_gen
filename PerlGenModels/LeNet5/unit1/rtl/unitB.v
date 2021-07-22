`timescale 1ns / 1ps


module 
 unitB #(parameter
///////////advanced parameters//////////
	ARITH_TYPE             = 0,
	DATA_WIDTH 			= 32,
	/////////////////////////////////////  
	IFM_DEPTH              = 6,
	KERNAL_SIZE            = 5,
	NUMBER_OF_FILTERS		= 16,
	NUMBER_OF_UNITS 		= 1,
	//////////////////////////////////////
	
	CEIL_FILTERS            = $rtoi($ceil(NUMBER_OF_FILTERS*1.0/NUMBER_OF_UNITS)),
    ADDRESS_SIZE_WM         = $clog2(KERNAL_SIZE*KERNAL_SIZE*IFM_DEPTH*CEIL_FILTERS)
	)
	(
	input 							clk,
	input 							reset,
	
	input 	[DATA_WIDTH-1:0]		riscv_data,
	input 	[DATA_WIDTH-1:0]		data_bias,
	input 	[DATA_WIDTH-1:0]		data_in_from_next,
	
	input 							conv_enable,
	input 							accu_enable,
	input 							relu_enable,
	
	input 							wm_enable_read,
	input 							wm_enable_write,
	input 							wm_fifo_enable,
	
	input 	[ADDRESS_SIZE_WM-1:0]	wm_address,
	
	input [DATA_WIDTH-1:0]	signal_if1,
	input [DATA_WIDTH-1:0]	signal_if2,
	input [DATA_WIDTH-1:0]	signal_if3,
	input [DATA_WIDTH-1:0]	signal_if4,
	input [DATA_WIDTH-1:0]	signal_if5,
	input [DATA_WIDTH-1:0]	signal_if6,
	input [DATA_WIDTH-1:0]	signal_if7,
	input [DATA_WIDTH-1:0]	signal_if8,
	input [DATA_WIDTH-1:0]	signal_if9,
	input [DATA_WIDTH-1:0]	signal_if10,
	input [DATA_WIDTH-1:0]	signal_if11,
	input [DATA_WIDTH-1:0]	signal_if12,
	input [DATA_WIDTH-1:0]	signal_if13,
	input [DATA_WIDTH-1:0]	signal_if14,
	input [DATA_WIDTH-1:0]	signal_if15,
	input [DATA_WIDTH-1:0]	signal_if16,
	input [DATA_WIDTH-1:0]	signal_if17,
	input [DATA_WIDTH-1:0]	signal_if18,
	input [DATA_WIDTH-1:0]	signal_if19,
	input [DATA_WIDTH-1:0]	signal_if20,
	input [DATA_WIDTH-1:0]	signal_if21,
	input [DATA_WIDTH-1:0]	signal_if22,
	input [DATA_WIDTH-1:0]	signal_if23,
	input [DATA_WIDTH-1:0]	signal_if24,
	input [DATA_WIDTH-1:0]	signal_if25,

	output	[DATA_WIDTH-1:0]		unit_data_out
    );
////////////////////////Signal declaration/////////////////
    wire [DATA_WIDTH-1:0] wm_data_out;   
    

	wire [DATA_WIDTH-1:0]	signal_w1;
	wire [DATA_WIDTH-1:0]	signal_w2;
	wire [DATA_WIDTH-1:0]	signal_w3;
	wire [DATA_WIDTH-1:0]	signal_w4;
	wire [DATA_WIDTH-1:0]	signal_w5;
	wire [DATA_WIDTH-1:0]	signal_w6;
	wire [DATA_WIDTH-1:0]	signal_w7;
	wire [DATA_WIDTH-1:0]	signal_w8;
	wire [DATA_WIDTH-1:0]	signal_w9;
	wire [DATA_WIDTH-1:0]	signal_w10;
	wire [DATA_WIDTH-1:0]	signal_w11;
	wire [DATA_WIDTH-1:0]	signal_w12;
	wire [DATA_WIDTH-1:0]	signal_w13;
	wire [DATA_WIDTH-1:0]	signal_w14;
	wire [DATA_WIDTH-1:0]	signal_w15;
	wire [DATA_WIDTH-1:0]	signal_w16;
	wire [DATA_WIDTH-1:0]	signal_w17;
	wire [DATA_WIDTH-1:0]	signal_w18;
	wire [DATA_WIDTH-1:0]	signal_w19;
	wire [DATA_WIDTH-1:0]	signal_w20;
	wire [DATA_WIDTH-1:0]	signal_w21;
	wire [DATA_WIDTH-1:0]	signal_w22;
	wire [DATA_WIDTH-1:0]	signal_w23;
	wire [DATA_WIDTH-1:0]	signal_w24;
	wire [DATA_WIDTH-1:0]	signal_w25;
	wire [DATA_WIDTH-1:0] conv_data_out;
	wire [DATA_WIDTH-1:0] accu_data_out;
	wire [DATA_WIDTH-1:0] relu_data_out;

single_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE (KERNAL_SIZE * KERNAL_SIZE * IFM_DEPTH * CEIL_FILTERS)) 
	WM 
	(
	 .clk(clk),	
	 .Enable_Write(wm_enable_write), 
	 .Enable_Read(wm_enable_read), 
	 .Address(wm_address), 
	 .Data_Input(riscv_data),	
	 .Data_Output(wm_data_out)
	 );    
    


fo_fifo_25 #(.DATA_WIDTH(DATA_WIDTH))
	WM_FIFO (
	 .clk(clk),
	 .reset(reset),
	 .fifo_enable(wm_fifo_enable),
	 .fifo_data_in(wm_data_out),
		.fifo_data_out_1(signal_w1),
		.fifo_data_out_2(signal_w2),
		.fifo_data_out_3(signal_w3),
		.fifo_data_out_4(signal_w4),
		.fifo_data_out_5(signal_w5),
		.fifo_data_out_6(signal_w6),
		.fifo_data_out_7(signal_w7),
		.fifo_data_out_8(signal_w8),
		.fifo_data_out_9(signal_w9),
		.fifo_data_out_10(signal_w10),
		.fifo_data_out_11(signal_w11),
		.fifo_data_out_12(signal_w12),
		.fifo_data_out_13(signal_w13),
		.fifo_data_out_14(signal_w14),
		.fifo_data_out_15(signal_w15),
		.fifo_data_out_16(signal_w16),
		.fifo_data_out_17(signal_w17),
		.fifo_data_out_18(signal_w18),
		.fifo_data_out_19(signal_w19),
		.fifo_data_out_20(signal_w20),
		.fifo_data_out_21(signal_w21),
		.fifo_data_out_22(signal_w22),
		.fifo_data_out_23(signal_w23),
		.fifo_data_out_24(signal_w24),
		.fifo_data_out_25(signal_w25)
		);

convolution_S25 #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))
	conv
	(
	 .clk(clk),
	 .reset(reset),
	 .conv_enable(conv_enable),
	 .conv_data_out(conv_data_out),
		.w1(signal_w1),.if1(signal_if1),
		.w2(signal_w2),.if2(signal_if2),
		.w3(signal_w3),.if3(signal_if3),
		.w4(signal_w4),.if4(signal_if4),
		.w5(signal_w5),.if5(signal_if5),
		.w6(signal_w6),.if6(signal_if6),
		.w7(signal_w7),.if7(signal_if7),
		.w8(signal_w8),.if8(signal_if8),
		.w9(signal_w9),.if9(signal_if9),
		.w10(signal_w10),.if10(signal_if10),
		.w11(signal_w11),.if11(signal_if11),
		.w12(signal_w12),.if12(signal_if12),
		.w13(signal_w13),.if13(signal_if13),
		.w14(signal_w14),.if14(signal_if14),
		.w15(signal_w15),.if15(signal_if15),
		.w16(signal_w16),.if16(signal_if16),
		.w17(signal_w17),.if17(signal_if17),
		.w18(signal_w18),.if18(signal_if18),
		.w19(signal_w19),.if19(signal_if19),
		.w20(signal_w20),.if20(signal_if20),
		.w21(signal_w21),.if21(signal_if21),
		.w22(signal_w22),.if22(signal_if22),
		.w23(signal_w23),.if23(signal_if23),
		.w24(signal_w24),.if24(signal_if24),
		.w25(signal_w25),.if25(signal_if25)
);

 accumulator #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))
 accu_B
 (
     .clk(clk),
     .accu_enable(accu_enable),
	 .data_in_from_conv(conv_data_out),
	 .data_bias(data_bias),
     .data_in_from_next(data_in_from_next),
     .accu_data_out(accu_data_out)
 );
 
 
relu #(.DATA_WIDTH(DATA_WIDTH)) Active1 (.in(accu_data_out), .out(relu_data_out), .relu_enable(relu_enable));
	
assign unit_data_out = relu_data_out;


endmodule
