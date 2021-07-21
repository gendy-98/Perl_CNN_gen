`timescale 1ns / 1ps


module 
 top_conva1 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 			  = 32,
	ADDRESS_BITS 		  = 15,
	/////////////////////////////////////
	IFM_SIZE              = 34,                                                
	IFM_DEPTH             = 1,
	KERNAL_SIZE           = 5,
	NUMBER_OF_FILTERS     = 8,
	NUMBER_OF_UNITS       = 1,
	ARITH_TYPE 				= 0,
	//////////////////////////////////////
	IFM_SIZE_NEXT           = IFM_SIZE - KERNAL_SIZE + 1,
	ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
	ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT),
	ADDRESS_SIZE_WM         = $clog2( KERNAL_SIZE*KERNAL_SIZE*NUMBER_OF_FILTERS*(1) ),    
	FIFO_SIZE               = (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE,
	NUMBER_OF_IFM           = IFM_DEPTH,
	NUMBER_OF_IFM_NEXT      = NUMBER_OF_FILTERS,
	NUMBER_OF_WM            = KERNAL_SIZE*KERNAL_SIZE,                              
	NUMBER_OF_BITS_SEL_IFM_NEXT = $clog2(NUMBER_OF_IFM_NEXT)
)(
	input clk,
	input reset,
	input [DATA_WIDTH-1:0]   riscv_data,
	input [ADDRESS_BITS-1:0] riscv_address,
	input [NUMBER_OF_UNITS-1:0] wm_enable_write,
	input  bm_enable_write,
	
	// previous
    input                        start_from_previous,
	input [NUMBER_OF_IFM-1:0]    ifm_enable_write_previous, 
	     
	// next
	input  end_from_next,
	output [DATA_WIDTH-1:0] data_out_for_next,
	output [ADDRESS_SIZE_NEXT_IFM-1:0] ifm_address_write_next,
	output ifm_enable_write_next,
	output start_to_next,
	output ifm_sel_next,
	output ready
    );
	
	wire fifo_enable;
    wire conv_enable;
	
	wire                        ifm_enable_read_current;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_current;
   
    wire wm_addr_sel;
    wire wm_enable_read;
    wire [ADDRESS_SIZE_WM-1:0] wm_address_read_current;
    wire wm_fifo_enable;
    
    wire bm_addr_sel;
    wire bm_enable_read;
    wire [$clog2(NUMBER_OF_FILTERS)-1:0] bm_address_read_current ;
    
    
	

	conva1_CU #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.IFM_DEPTH(IFM_DEPTH), 
	.KERNAL_SIZE(KERNAL_SIZE), 
	.NUMBER_OF_FILTERS(NUMBER_OF_FILTERS), 
	.NUMBER_OF_UNITS(NUMBER_OF_UNITS))
    CU_A1
    (
    .clk(clk),
    .reset(reset),
    .end_from_next(end_from_next),
    .start_from_previous(start_from_previous),
    
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
    .ifm_enable_write_next(ifm_enable_write_next),
    .ifm_address_write_next(ifm_address_write_next),
    .start_to_next(start_to_next),
    .ifm_sel_next(ifm_sel_next),
    .ready(ready)
    );    
     


	conva1_DP #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.IFM_DEPTH(IFM_DEPTH), 
	.KERNAL_SIZE(KERNAL_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.NUMBER_OF_FILTERS(NUMBER_OF_FILTERS), 
	.NUMBER_OF_UNITS(NUMBER_OF_UNITS))
    DP_A1
    (
    .clk(clk),
	.reset(reset),
	.riscv_data(riscv_data),
	.riscv_address(riscv_address),
	//////////////////////////////////////////////
	.fifo_enable(fifo_enable),
	.conv_enable(conv_enable),

    .ifm_enable_read_current(ifm_enable_read_current),
	.ifm_enable_write_previous(ifm_enable_write_previous),
	.ifm_address_read_current(ifm_address_read_current),
    
    .wm_addr_sel(wm_addr_sel),
    .wm_enable_write(wm_enable_write),
    .wm_enable_read(wm_enable_read),
    .wm_address_read_current(wm_address_read_current),
    .wm_fifo_enable(wm_fifo_enable),

    .bm_addr_sel(bm_addr_sel),                                            
    .bm_enable_read(bm_enable_read),                                         
    .bm_enable_write(bm_enable_write),
    .bm_address_read_current(bm_address_read_current),

	.data_out_for_next(data_out_for_next)
    );
  
      
endmodule
