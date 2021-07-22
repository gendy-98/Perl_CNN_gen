`timescale 1ns / 1ps


module 
 convb2_DP #(parameter
///////////advanced parameters//////////
	ARITH_TYPE				= 0,
	DATA_WIDTH 			  = 32,
	ADDRESS_BITS 		  = 15,
	/////////////////////////////////////
	IFM_SIZE              = 14,                                                
	IFM_DEPTH             = 6,
	KERNAL_SIZE           = 5,
	NUMBER_OF_FILTERS     = 16,
	NUMBER_OF_UNITS       = 2,
	//////////////////////////////////////
	ADDRESS_SIZE_WM         = $clog2(KERNAL_SIZE*KERNAL_SIZE*IFM_DEPTH*8)                             
)(
	input clk,
	input reset,
	input [DATA_WIDTH-1:0] riscv_data,
	input [ADDRESS_BITS-1:0] riscv_address,
	
	input [DATA_WIDTH-1:0] data_in_A_from_previous,
	input fifo_enable,
	input conv_enable,
	input accu_enable,
	input relu_enable,
    
    input                       wm_addr_sel,
    input                       wm_enable_read,
    input [NUMBER_OF_UNITS-1:0] wm_enable_write,
    input [ADDRESS_SIZE_WM-1:0] wm_address_read_current,
    input                       wm_fifo_enable,
   
    input                                 bm_addr_sel,
    input                                 bm_enable_read,
    input                     [2-1:0]     bm_enable_write,
    input [$clog2(NUMBER_OF_FILTERS)-1:0] bm_address_read_current,

	
	input  [DATA_WIDTH-1:0] data_in_from_next1,
	input  [DATA_WIDTH-1:0] data_in_from_next2,
	output [DATA_WIDTH-1:0] data_out_for_next1,
	output [DATA_WIDTH-1:0] data_out_for_next2
	);
////////////////////////Signal declaration/////////////////

	wire	[DATA_WIDTH - 1 : 0]	signal_if1;
	wire	[DATA_WIDTH - 1 : 0]	signal_if2;
	wire	[DATA_WIDTH - 1 : 0]	signal_if3;
	wire	[DATA_WIDTH - 1 : 0]	signal_if4;
	wire	[DATA_WIDTH - 1 : 0]	signal_if5;
	wire	[DATA_WIDTH - 1 : 0]	signal_if6;
	wire	[DATA_WIDTH - 1 : 0]	signal_if7;
	wire	[DATA_WIDTH - 1 : 0]	signal_if8;
	wire	[DATA_WIDTH - 1 : 0]	signal_if9;
	wire	[DATA_WIDTH - 1 : 0]	signal_if10;
	wire	[DATA_WIDTH - 1 : 0]	signal_if11;
	wire	[DATA_WIDTH - 1 : 0]	signal_if12;
	wire	[DATA_WIDTH - 1 : 0]	signal_if13;
	wire	[DATA_WIDTH - 1 : 0]	signal_if14;
	wire	[DATA_WIDTH - 1 : 0]	signal_if15;
	wire	[DATA_WIDTH - 1 : 0]	signal_if16;
	wire	[DATA_WIDTH - 1 : 0]	signal_if17;
	wire	[DATA_WIDTH - 1 : 0]	signal_if18;
	wire	[DATA_WIDTH - 1 : 0]	signal_if19;
	wire	[DATA_WIDTH - 1 : 0]	signal_if20;
	wire	[DATA_WIDTH - 1 : 0]	signal_if21;
	wire	[DATA_WIDTH - 1 : 0]	signal_if22;
	wire	[DATA_WIDTH - 1 : 0]	signal_if23;
	wire	[DATA_WIDTH - 1 : 0]	signal_if24;
	wire	[DATA_WIDTH - 1 : 0]	signal_if25;
	wire [DATA_WIDTH-1:0] unit1_data_out;
	wire [DATA_WIDTH-1:0] unit2_data_out;
	wire [DATA_WIDTH-1:0] accu_data_out;
	wire [DATA_WIDTH-1:0] relu_data_out;
	wire [DATA_WIDTH-1:0] data_bias_1;
	wire [DATA_WIDTH-1:0] data_bias_2;
	    
	wire [ADDRESS_SIZE_WM-1:0] wm_address;
	wire [$clog2((8))-1:0] bm_address;
	
	assign wm_address = wm_addr_sel ? wm_address_read_current : riscv_address[ADDRESS_SIZE_WM-1:0];
	assign bm_address = bm_addr_sel ? bm_address_read_current : riscv_address[$clog2((8))-1:0];
	
	single_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE (8) )
	bm1 (
	.clk(clk),	
	.Enable_Write(bm_enable_write[0]),
    .Enable_Read(bm_enable_read),	
	.Address(bm_address),
	.Data_Input(riscv_data),	
	.Data_Output(data_bias_1)
	);
   
	single_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE (8) )
	bm2 (
	.clk(clk),	
	.Enable_Write(bm_enable_write[1]),
    .Enable_Read(bm_enable_read),	
	.Address(bm_address),
	.Data_Input(riscv_data),	
	.Data_Output(data_bias_2)
	);
   
 
	FIFO_25_1_61 #(.DATA_WIDTH(DATA_WIDTH), .IFM_SIZE(IFM_SIZE), .KERNAL_SIZE(KERNAL_SIZE) )
	FIFO1 (
	 .clk(clk),
	 .reset(reset),
	 .fifo_enable(fifo_enable),
	 .fifo_data_in(data_in_A_from_previous),
	 .fifo_data_out_1(signal_if1),  
	 .fifo_data_out_2(signal_if2),  
	 .fifo_data_out_3(signal_if3),  
	 .fifo_data_out_4(signal_if4),  
	 .fifo_data_out_5(signal_if5),  
	 .fifo_data_out_6(signal_if6),  
	 .fifo_data_out_7(signal_if7),  
	 .fifo_data_out_8(signal_if8),  
	 .fifo_data_out_9(signal_if9),  
	 .fifo_data_out_10(signal_if10),  
	 .fifo_data_out_11(signal_if11),  
	 .fifo_data_out_12(signal_if12),  
	 .fifo_data_out_13(signal_if13),  
	 .fifo_data_out_14(signal_if14),  
	 .fifo_data_out_15(signal_if15),  
	 .fifo_data_out_16(signal_if16),  
	 .fifo_data_out_17(signal_if17),  
	 .fifo_data_out_18(signal_if18),  
	 .fifo_data_out_19(signal_if19),  
	 .fifo_data_out_20(signal_if20),  
	 .fifo_data_out_21(signal_if21),  
	 .fifo_data_out_22(signal_if22),  
	 .fifo_data_out_23(signal_if23),  
	 .fifo_data_out_24(signal_if24),  
	 .fifo_data_out_25(signal_if25)
	);
	
	
	unitB #(
	 .ARITH_TYPE(ARITH_TYPE),
	 .DATA_WIDTH(DATA_WIDTH), 
	 .IFM_DEPTH(IFM_DEPTH), 
	 .KERNAL_SIZE(KERNAL_SIZE), 
	 .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS), 
	 .NUMBER_OF_UNITS(NUMBER_OF_UNITS))
	convB_unit_1
	(
    .clk(clk),                                 
    .reset(reset),  
    .riscv_data(riscv_data),
    .data_in_from_next(data_in_from_next1),
	.data_bias(data_bias_1), 
	.signal_if1(signal_if1),
	.signal_if2(signal_if2),
	.signal_if3(signal_if3),
	.signal_if4(signal_if4),
	.signal_if5(signal_if5),
	.signal_if6(signal_if6),
	.signal_if7(signal_if7),
	.signal_if8(signal_if8),
	.signal_if9(signal_if9),
	.signal_if10(signal_if10),
	.signal_if11(signal_if11),
	.signal_if12(signal_if12),
	.signal_if13(signal_if13),
	.signal_if14(signal_if14),
	.signal_if15(signal_if15),
	.signal_if16(signal_if16),
	.signal_if17(signal_if17),
	.signal_if18(signal_if18),
	.signal_if19(signal_if19),
	.signal_if20(signal_if20),
	.signal_if21(signal_if21),
	.signal_if22(signal_if22),
	.signal_if23(signal_if23),
	.signal_if24(signal_if24),
	.signal_if25(signal_if25),
	.conv_enable(conv_enable),
    .accu_enable(accu_enable),
    .relu_enable(relu_enable),
    .wm_enable_read(wm_enable_read),
	.wm_enable_write(wm_enable_write[0]), 
	.wm_address(wm_address),
    .wm_fifo_enable(wm_fifo_enable),          
    .unit_data_out(unit1_data_out)   
    );
	
	unitB #(
	 .ARITH_TYPE(ARITH_TYPE),
	 .DATA_WIDTH(DATA_WIDTH), 
	 .IFM_DEPTH(IFM_DEPTH), 
	 .KERNAL_SIZE(KERNAL_SIZE), 
	 .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS), 
	 .NUMBER_OF_UNITS(NUMBER_OF_UNITS))
	convB_unit_2
	(
    .clk(clk),                                 
    .reset(reset),  
    .riscv_data(riscv_data),
    .data_in_from_next(data_in_from_next2),
	.data_bias(data_bias_2), 
	.signal_if1(signal_if1),
	.signal_if2(signal_if2),
	.signal_if3(signal_if3),
	.signal_if4(signal_if4),
	.signal_if5(signal_if5),
	.signal_if6(signal_if6),
	.signal_if7(signal_if7),
	.signal_if8(signal_if8),
	.signal_if9(signal_if9),
	.signal_if10(signal_if10),
	.signal_if11(signal_if11),
	.signal_if12(signal_if12),
	.signal_if13(signal_if13),
	.signal_if14(signal_if14),
	.signal_if15(signal_if15),
	.signal_if16(signal_if16),
	.signal_if17(signal_if17),
	.signal_if18(signal_if18),
	.signal_if19(signal_if19),
	.signal_if20(signal_if20),
	.signal_if21(signal_if21),
	.signal_if22(signal_if22),
	.signal_if23(signal_if23),
	.signal_if24(signal_if24),
	.signal_if25(signal_if25),
	.conv_enable(conv_enable),
    .accu_enable(accu_enable),
    .relu_enable(relu_enable),
    .wm_enable_read(wm_enable_read),
	.wm_enable_write(wm_enable_write[1]), 
	.wm_address(wm_address),
    .wm_fifo_enable(wm_fifo_enable),          
    .unit_data_out(unit2_data_out)   
    );
	
assign data_out_for_next1 = unit1_data_out;
assign data_out_for_next2 = unit2_data_out;


endmodule
