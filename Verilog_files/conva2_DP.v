`timescale 1ns / 1ps


module 
 conva2_DP #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 			  = 32,
	ADDRESS_BITS 		  = 16,
	/////////////////////////////////////
	IFM_SIZE              = 32,                                                
	IFM_DEPTH             = 3,
	KERNAL_SIZE           = 5,
	NUMBER_OF_FILTERS     = 6,
	NUMBER_OF_UNITS       = 3,
	//////////////////////////////////////
	IFM_SIZE_NEXT           = IFM_SIZE - KERNAL_SIZE + 1,
	ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
	ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT),
	ADDRESS_SIZE_WM         = $clog2( KERNAL_SIZE*KERNAL_SIZE*NUMBER_OF_FILTERS*(IFM_DEPTH/NUMBER_OF_UNITS+1) ),    
	FIFO_SIZE               = (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE,
	NUMBER_OF_IFM           = IFM_DEPTH,
	NUMBER_OF_IFM_NEXT      = NUMBER_OF_FILTERS,
	NUMBER_OF_WM            = KERNAL_SIZE*KERNAL_SIZE,                              
	NUMBER_OF_BITS_SEL_IFM_NEXT = $clog2(NUMBER_OF_IFM_NEXT)
)(
	input 							clk,
	input 							reset,
	
	input [DATA_WIDTH-1:0] 			riscv_data,
	input [ADDRESS_BITS-1:0] 		riscv_address,
	
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
    input                                 bm_enable_write,
    input [$clog2(NUMBER_OF_FILTERS)-1:0] bm_address_read_current,
    
	
	input [DATA_WIDTH-1:0] data_in_from_previous1,
	input [DATA_WIDTH-1:0] data_in_from_previous2,
	input [DATA_WIDTH-1:0] data_in_from_previous3,

	input  [DATA_WIDTH-1:0] data_in_from_next,
    output [DATA_WIDTH-1:0] data_out_for_next
    );

	wire [DATA_WIDTH-1:0] unit1_data_out;
	wire [DATA_WIDTH-1:0] unit2_data_out;
	wire [DATA_WIDTH-1:0] unit3_data_out;
 
	wire [DATA_WIDTH-1:0] accu_data_out;
	wire [DATA_WIDTH-1:0] relu_data_out;
	
	wire [DATA_WIDTH-1:0] data_bias;
	

	wire [ADDRESS_SIZE_WM-1:0] wm_address;
	wire [$clog2(NUMBER_OF_FILTERS)-1:0] bm_address;
	
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_1;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_2;

	wire	[DATA_WIDTH - 1 : 0]	adder_out_2_1;

	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_1;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_2;

	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_2_1;


	assign wm_address = wm_addr_sel ? wm_address_read_current : riscv_address[ADDRESS_SIZE_WM-1:0];
	assign bm_address = bm_addr_sel ? bm_address_read_current : riscv_address[$clog2(NUMBER_OF_FILTERS)-1:0];



	single_port_memory #(.MEM_SIZE (NUMBER_OF_FILTERS)) bm (.clk(clk),	.Enable_Write(bm_enable_write),
     .Enable_Read(bm_enable_read),	.Address(bm_address),
	 .Data_Input(riscv_data),	.Data_Output(data_bias));
	 
  
	unitA #(.DATA_WIDTH(DATA_WIDTH), .IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE), .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS))
    unit_1
    (
    .clk(clk),                                 
    .reset(reset),  
    .riscv_data(riscv_data),                             
    .unit_data_in(data_in_from_previous1),       
    .fifo_enable(fifo_enable),                         
    .conv_enable(conv_enable),
    .wm_enable_read(wm_enable_read),          
    .wm_enable_write(wm_enable_write[0]),          
    .wm_address(wm_address), 
    .wm_fifo_enable(wm_fifo_enable),         
    .unit_data_out(unit1_data_out)   
    );
	unitA #(.DATA_WIDTH(DATA_WIDTH), .IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE), .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS))
    unit_2
    (
    .clk(clk),                                 
    .reset(reset),  
    .riscv_data(riscv_data),                             
    .unit_data_in(data_in_from_previous2),       
    .fifo_enable(fifo_enable),                         
    .conv_enable(conv_enable),
    .wm_enable_read(wm_enable_read),          
    .wm_enable_write(wm_enable_write[1]),          
    .wm_address(wm_address), 
    .wm_fifo_enable(wm_fifo_enable),         
    .unit_data_out(unit2_data_out)   
    );
	unitA #(.DATA_WIDTH(DATA_WIDTH), .IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE), .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS))
    unit_3
    (
    .clk(clk),                                 
    .reset(reset),  
    .riscv_data(riscv_data),                             
    .unit_data_in(data_in_from_previous3),       
    .fifo_enable(fifo_enable),                         
    .conv_enable(conv_enable),
    .wm_enable_read(wm_enable_read),          
    .wm_enable_write(wm_enable_write[2]),          
    .wm_address(wm_address), 
    .wm_fifo_enable(wm_fifo_enable),         
    .unit_data_out(unit3_data_out)   
    );

    
    always @(posedge clk)
    begin
		
			reg_adder_out_1_1 <= adder_out_1_1;
			reg_adder_out_1_2 <= adder_out_1_2;

			reg_adder_out_2_1 <= adder_out_2_1;

	end

	Float_Adder		adr_1_1	(.in1(unit1_data_out), .in2(unit2_data_out), .out(adder_out_1_1));

	assign adder_out_1_2 = unit3_data_out;

	Float_Adder		adr_2_1	(.in1(reg_adder_out_1_1), .in2(reg_adder_out_1_2), .out(adder_out_2_1));

	accumulator #(.DATA_WIDTH(DATA_WIDTH))
    accu
    (
     .clk(clk),
     .accu_enable(accu_enable),
	 .data_in_from_conv(reg_adder_out_2_1),
	 .data_bias(data_bias),
     .data_in_from_next(data_in_from_next),
     .accu_data_out(accu_data_out)
     );

	relu  Active1 (.in(accu_data_out), .out (relu_data_out), .relu_enable(relu_enable));
	
    assign data_out_for_next = relu_data_out;	   	 
	
endmodule

