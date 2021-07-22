`timescale 1ns / 1ps


module 
 conva1_DP #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 			  = 32,
	ADDRESS_BITS 		  = 15,
	/////////////////////////////////////
	IFM_SIZE              = 32,                                                
	IFM_DEPTH             = 1,
	KERNAL_SIZE           = 5,
	NUMBER_OF_FILTERS     = 15,
	NUMBER_OF_UNITS       = 3,
    ARITH_TYPE              = 0,
	//////////////////////////////////////
	ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
	ADDRESS_SIZE_WM         = $clog2( KERNAL_SIZE*KERNAL_SIZE*NUMBER_OF_FILTERS),    
	NUMBER_OF_IFM           = IFM_DEPTH
)(
	input clk,
	input reset,
	input [DATA_WIDTH-1:0] riscv_data,
	input [ADDRESS_BITS-1:0] riscv_address,
	
	input fifo_enable,
	input conv_enable,
    
	input [NUMBER_OF_IFM-1:0]    ifm_enable_write_previous,            
	input [ADDRESS_SIZE_IFM-1:0] ifm_address_read_current,
    input                        ifm_enable_read_current,
    
    input                       wm_addr_sel,
    input                       wm_enable_read,
    input [NUMBER_OF_UNITS-1:0] wm_enable_write,
    input [ADDRESS_SIZE_WM-1:0] wm_address_read_current,
    input                       wm_fifo_enable,
    
    input                                 bm_addr_sel,
    input                                 bm_enable_read,
    input                                 bm_enable_write,
    input [$clog2(NUMBER_OF_FILTERS)-1:0] bm_address_read_current,

    output [DATA_WIDTH-1:0] data_out_for_next
    );
	
////////////////////////Signal declaration/////////////////

	wire [DATA_WIDTH-1:0] data_read_for_unit1;
	wire [DATA_WIDTH-1:0] unit1_data_out;

	reg [DATA_WIDTH-1:0] full_sum_r;
	wire [DATA_WIDTH-1:0] full_sum;

    wire [DATA_WIDTH-1:0] data_bias;
	wire [ADDRESS_SIZE_WM-1:0] wm_address;
	wire [$clog2(NUMBER_OF_FILTERS)-1:0] bm_address;
	
	assign wm_address = wm_addr_sel ? wm_address_read_current : riscv_address[ADDRESS_SIZE_WM-1:0];
	assign bm_address = bm_addr_sel ? bm_address_read_current : riscv_address[$clog2(NUMBER_OF_FILTERS)-1:0];
    
    single_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE (NUMBER_OF_FILTERS)) bm (.clk(clk),	.Enable_Write(bm_enable_write),
     .Enable_Read(bm_enable_read),	.Address(bm_address),
	 .Data_Input(riscv_data),	.Data_Output(data_bias));
	 

	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	convA1_IFM1 (
    .clk(clk),
    
    .Data_Input_A(riscv_data),
    .Address_A(riscv_address[ADDRESS_SIZE_IFM-1:0]),
    .Enable_Write_A(ifm_enable_write_previous[0]),
    .Enable_Read_A(1'b0), 
  
    .Data_Input_B({DATA_WIDTH{1'b0}}),
    .Address_B(ifm_address_read_current),
    .Enable_Write_B(1'b0),
    .Enable_Read_B(ifm_enable_read_current), 
  
    .Data_Output_A(),
    .Data_Output_B(data_read_for_unit1)
	);
	  
    unitA_32 #(
     .ARITH_TYPE(ARITH_TYPE),
	 .DATA_WIDTH(DATA_WIDTH), 
	 .IFM_DEPTH(IFM_DEPTH), 
	 .KERNAL_SIZE(KERNAL_SIZE), 
	 .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS))
    convA1_unit_1
    (
    .clk(clk),                                 
    .reset(reset),  
    .riscv_data(riscv_data),                             
    .unit_data_in(data_read_for_unit1),       
    .fifo_enable(fifo_enable),                         
    .conv_enable(conv_enable),
    .wm_enable_read(wm_enable_read),          
    .wm_enable_write(wm_enable_write[0]),          
    .wm_address(wm_address),
    .wm_fifo_enable(wm_fifo_enable),
    .unit_data_out(unit1_data_out)   
    );
	
    always @(posedge clk)
	begin
	   full_sum_r     <= full_sum;
	end


	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) Add (.in1 (unit1_data_out), .in2 (data_bias), .out (full_sum));
 
	relu  #(.DATA_WIDTH(DATA_WIDTH)) Active1 (.in(full_sum_r),.out (data_out_for_next), .relu_enable(1'b1)); 
 	 
	
endmodule

