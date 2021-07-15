`timescale 1ns / 1ps


module 
 top_convb2 #(parameter
///////////advanced parameters//////////
	ARITH_TYPE				= 0,
	DATA_WIDTH 			  = 32,
	ADDRESS_BITS 		  = 15,
	/////////////////////////////////////
	IFM_SIZE              = 14,                                                
	IFM_DEPTH             = 6,
	KERNAL_SIZE           = 5,
	NUMBER_OF_FILTERS     = 16,
	NUMBER_OF_UNITS       = 3,
	//////////////////////////////////////
	IFM_SIZE_NEXT           = IFM_SIZE - KERNAL_SIZE + 1,
	ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
	ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT),
	ADDRESS_SIZE_WM         = $clog2( KERNAL_SIZE*KERNAL_SIZE*NUMBER_OF_FILTERS*(IFM_DEPTH/NUMBER_OF_UNITS+1) ),    
	NUMBER_OF_IFM           = IFM_DEPTH,
	NUMBER_OF_IFM_NEXT      = NUMBER_OF_FILTERS
)(
	input 							clk,
	input 							reset,
	
	input [DATA_WIDTH-1:0]  riscv_data,
	input [ADDRESS_BITS-1:0] riscv_address,
	input [NUMBER_OF_UNITS-1:0] wm_enable_write,
	input [NUMBER_OF_UNITS-1:0] bm_enable_write,

	input start_from_previous,
	
	input  [DATA_WIDTH-1:0]       data_in_from_previous,
	output                        ifm_enable_read_current,
	output [ADDRESS_SIZE_IFM-1:0] ifm_address_read_current,
	output                        end_to_previous,
	
	input                        conv_ready, 
	input  end_from_next,
		input  [DATA_WIDTH-1:0] data_in_from_next1,
		input  [DATA_WIDTH-1:0] data_in_from_next2,
		input  [DATA_WIDTH-1:0] data_in_from_next3,
		input  [DATA_WIDTH-1:0] data_out_for_next1,
		input  [DATA_WIDTH-1:0] data_out_for_next2,
		input  [DATA_WIDTH-1:0] data_out_for_next3,
	output ifm_enable_read_next,
	output ifm_enable_write_next,
    output [ADDRESS_SIZE_NEXT_IFM-1:0] ifm_address_read_next,
    output [ADDRESS_SIZE_NEXT_IFM-1:0] ifm_address_write_next,
	output start_to_next,
	
	output [$clog2(NUMBER_OF_IFM/NUMBER_OF_UNITS+1)-1:0] ifm_sel_next
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
    
    
	

	convb2_CU #(.IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE), .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS))
    CU_B2
    (
    .clk(clk),
    .reset(reset),
    .end_from_next(end_from_next),
    .start_from_previous(start_from_previous),
    .end_to_previous(end_to_previous),
    .conv_ready(conv_ready),
    
    .ifm_sel_next(ifm_sel_next),
    .ifm_enable_read_current(ifm_enable_read_current),
    .ifm_address_read_current(ifm_address_read_current),
    
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
     

	convb2_DP #(.ARITH_TYPE(ARITH_TYPE), .DATA_WIDTH(DATA_WIDTH), .ADDRESS_BITS(ADDRESS_BITS), .IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE), .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS), .NUMBER_OF_UNITS(NUMBER_OF_UNITS))
    DP_B2
	(
    .clk(clk),
	.reset(reset),
	.riscv_data(riscv_data),
	.riscv_address(riscv_address),
	//////////////////////////////////////////////
	.data_in_from_previous(data_in_from_previous),
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
