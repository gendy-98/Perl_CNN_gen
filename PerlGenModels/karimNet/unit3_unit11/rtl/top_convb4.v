`timescale 1ns / 1ps


module 
 top_convb4 #(parameter
///////////advanced parameters//////////
	ARITH_TYPE				= 0,
	DATA_WIDTH 			  = 32,
	ADDRESS_BITS 		  = 17,
	/////////////////////////////////////
	IFM_SIZE              = 9,                                                
	IFM_DEPTH             = 28,
	KERNAL_SIZE           = 5,
	NUMBER_OF_FILTERS     = 88,
	NUMBER_OF_UNITS       = 11,
	//////////////////////////////////////
	IFM_SIZE_NEXT           = IFM_SIZE - KERNAL_SIZE + 1,
	ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
	ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT),
	ADDRESS_SIZE_WM         = $clog2( KERNAL_SIZE*KERNAL_SIZE*NUMBER_OF_FILTERS*(3) ),    
	NUMBER_OF_IFM           = IFM_DEPTH
	
)(
	input 							clk,
	input 							reset,
	
	input [DATA_WIDTH-1:0]  riscv_data,
	input [ADDRESS_BITS-1:0] riscv_address,
	input [NUMBER_OF_UNITS-1:0] wm_enable_write,
	input [NUMBER_OF_UNITS-1:0] bm_enable_write,

	input start_from_previous,
	
    output                        ifm_enable_read_A_current,
	output [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_current,
	input  [DATA_WIDTH-1:0]       data_in_A_from_previous1,
	output                        end_to_previous,
	
	input                        conv_ready, 
	input  end_from_next,
		input  [DATA_WIDTH-1:0] data_in_from_next1,
		input  [DATA_WIDTH-1:0] data_in_from_next2,
		input  [DATA_WIDTH-1:0] data_in_from_next3,
		input  [DATA_WIDTH-1:0] data_in_from_next4,
		input  [DATA_WIDTH-1:0] data_in_from_next5,
		input  [DATA_WIDTH-1:0] data_in_from_next6,
		input  [DATA_WIDTH-1:0] data_in_from_next7,
		input  [DATA_WIDTH-1:0] data_in_from_next8,
		input  [DATA_WIDTH-1:0] data_in_from_next9,
		input  [DATA_WIDTH-1:0] data_in_from_next10,
		input  [DATA_WIDTH-1:0] data_in_from_next11,
		output  [DATA_WIDTH-1:0] data_out_for_next1,
		output  [DATA_WIDTH-1:0] data_out_for_next2,
		output  [DATA_WIDTH-1:0] data_out_for_next3,
		output  [DATA_WIDTH-1:0] data_out_for_next4,
		output  [DATA_WIDTH-1:0] data_out_for_next5,
		output  [DATA_WIDTH-1:0] data_out_for_next6,
		output  [DATA_WIDTH-1:0] data_out_for_next7,
		output  [DATA_WIDTH-1:0] data_out_for_next8,
		output  [DATA_WIDTH-1:0] data_out_for_next9,
		output  [DATA_WIDTH-1:0] data_out_for_next10,
		output  [DATA_WIDTH-1:0] data_out_for_next11,
	output ifm_enable_read_next,
	output ifm_enable_write_next,
    output [ADDRESS_SIZE_NEXT_IFM-1:0] ifm_address_read_next,
    output [ADDRESS_SIZE_NEXT_IFM-1:0] ifm_address_write_next,
	output start_to_next,
	
	output [$clog2(8)-1:0] ifm_sel_next
    );
	
	wire fifo_enable;
    wire conv_enable;
    wire accu_enable;
    wire relu_enable;
    
    
    wire wm_addr_sel;
    wire wm_enable_read;
    wire [ADDRESS_SIZE_WM-1:0] wm_address_read_current;
    wire wm_fifo_enable;
    
    wire bm_addr_sel;
    wire bm_enable_read;
    wire [$clog2(NUMBER_OF_FILTERS)-1:0] bm_address_read_current ;
    
    
	

	convb4_CU #(.IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE), .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS))
    CU_B4
    (
    .clk(clk),
    .reset(reset),
    .end_from_next(end_from_next),
    .start_from_previous(start_from_previous),
    .end_to_previous(end_to_previous),
    .conv_ready(conv_ready),
    //this stride not real dont use stride = 2
    .ifm_sel_next(ifm_sel_next),
    .ifm_enable_read_current(ifm_enable_read_A_current),
    .ifm_address_read_current(ifm_address_read_A_current),
    
    .wm_addr_sel(wm_addr_sel),
    .wm_enable_read(wm_enable_read),
    .wm_address_read_current(wm_address_read_current),
    .wm_fifo_enable(wm_fifo_enable),
    
    .bm_addr_sel(bm_addr_sel),                                            
    .bm_enable_read(bm_enable_read),                                         
    .bm_address_read_current(bm_address_read_current),
    
    .fifo_enable(fifo_enable),
    .conv_enable(conv_enable),
    .accu_enable(accu_enable),
    .relu_enable(relu_enable),
    .ifm_enable_read_next(ifm_enable_read_next),
    .ifm_enable_write_next(ifm_enable_write_next),
    .ifm_address_read_next(ifm_address_read_next), 
    .ifm_address_write_next(ifm_address_write_next),
    .start_to_next(start_to_next)
    );    
     

	convb4_DP #(.ARITH_TYPE(ARITH_TYPE), .DATA_WIDTH(DATA_WIDTH), .ADDRESS_BITS(ADDRESS_BITS), .IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE), .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS), .NUMBER_OF_UNITS(NUMBER_OF_UNITS))
    DP_B4
	(
    .clk(clk),
	.reset(reset),
	.riscv_data(riscv_data),
	.riscv_address(riscv_address),
	//////////////////////////////////////////////
	.data_in_from_previous(data_in_A_from_previous1),
	.fifo_enable(fifo_enable),
	.conv_enable(conv_enable),
    .accu_enable(accu_enable),
    .relu_enable(relu_enable),
	
	.data_in_from_next1(data_in_from_next1),
	.data_out_for_next1(data_out_for_next1),
	.data_in_from_next2(data_in_from_next2),
	.data_out_for_next2(data_out_for_next2),
	.data_in_from_next3(data_in_from_next3),
	.data_out_for_next3(data_out_for_next3),
	.data_in_from_next4(data_in_from_next4),
	.data_out_for_next4(data_out_for_next4),
	.data_in_from_next5(data_in_from_next5),
	.data_out_for_next5(data_out_for_next5),
	.data_in_from_next6(data_in_from_next6),
	.data_out_for_next6(data_out_for_next6),
	.data_in_from_next7(data_in_from_next7),
	.data_out_for_next7(data_out_for_next7),
	.data_in_from_next8(data_in_from_next8),
	.data_out_for_next8(data_out_for_next8),
	.data_in_from_next9(data_in_from_next9),
	.data_out_for_next9(data_out_for_next9),
	.data_in_from_next10(data_in_from_next10),
	.data_out_for_next10(data_out_for_next10),
	.data_in_from_next11(data_in_from_next11),
	.data_out_for_next11(data_out_for_next11),

	
    .wm_addr_sel(wm_addr_sel),
    .wm_enable_read(wm_enable_read),
    .wm_enable_write(wm_enable_write),
    .wm_address_read_current(wm_address_read_current),
    .wm_fifo_enable(wm_fifo_enable),
    
    .bm_addr_sel(bm_addr_sel),                                            
    .bm_enable_read(bm_enable_read),
    .bm_enable_write(bm_enable_write),
    .bm_address_read_current(bm_address_read_current)
	//////////////////////////////////////////////

    );
	
	
endmodule	
