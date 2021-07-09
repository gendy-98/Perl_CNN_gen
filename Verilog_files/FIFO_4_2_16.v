`timescale 1ns / 1ps


module 
 FIFO_4_2_16 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
	ADDRESS_BITS 				= 18,
///////////architecture parameters//////
	IFM_SIZE 					= 14,
	IFM_DEPTH 					= 3,
	KERNAL_SIZE 				= 2,
	NUMBER_OF_FILTERS 			= 6,
///////////generated parameters/////////
	IFM_SIZE_NEXT           	= IFM_SIZE - KERNAL_SIZE + 1,
	ADDRESS_SIZE_IFM        	= $clog2(IFM_SIZE*IFM_SIZE),
	ADDRESS_SIZE_NEXT_IFM   	= $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT),
	ADDRESS_SIZE_WM         	= $clog2(IFM_DEPTH*NUMBER_OF_FILTERS),
	NUMBER_OF_IFM           	= IFM_DEPTH,      
	FIFO_SIZE               	= (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE,
	NUMBER_OF_IFM_NEXT      	= NUMBER_OF_FILTERS,
	NUMBER_OF_WM            	= KERNAL_SIZE*KERNAL_SIZE,                              
	NUMBER_OF_BITS_SEL_IFM_NEXT = $clog2(NUMBER_OF_IFM_NEXT)
	)(
	input clk,
	input reset,
	input fifo_enable,
	input [DATA_WIDTH-1:0] fifo_data_in,
	input [DATA_WIDTH-1:0] fifo_data_in_2,
	output [DATA_WIDTH-1:0] fifo_data_out_1,
	output [DATA_WIDTH-1:0] fifo_data_out_2,
	output [DATA_WIDTH-1:0] fifo_data_out_3,
	output [DATA_WIDTH-1:0] fifo_data_out_4
	);
	reg	[DATA_WIDTH-1:0] FIFO  [FIFO_SIZE-1:0] ;
	always @ (posedge clk or posedge reset)
    begin
        if(reset)
		begin
			FIFO[0] <= 0;
			FIFO[1] <= 0;
			FIFO[2] <= 0;
			FIFO[3] <= 0;
			FIFO[4] <= 0;
			FIFO[5] <= 0;
			FIFO[6] <= 0;
			FIFO[7] <= 0;
			FIFO[8] <= 0;
			FIFO[9] <= 0;
			FIFO[10] <= 0;
			FIFO[11] <= 0;
			FIFO[12] <= 0;
			FIFO[13] <= 0;
			FIFO[14] <= 0;
			FIFO[15] <= 0;
		end
		else if(fifo_enable)
		begin
			FIFO[0] <= fifo_data_in_2;
			FIFO[1] <= fifo_data_in;
			FIFO[2] <= FIFO[0];
			FIFO[3] <= FIFO[1];
			FIFO[4] <= FIFO[2];
			FIFO[5] <= FIFO[3];
			FIFO[6] <= FIFO[4];
			FIFO[7] <= FIFO[5];
			FIFO[8] <= FIFO[6];
			FIFO[9] <= FIFO[7];
			FIFO[10] <= FIFO[8];
			FIFO[11] <= FIFO[9];
			FIFO[12] <= FIFO[10];
			FIFO[13] <= FIFO[11];
			FIFO[14] <= FIFO[12];
			FIFO[15] <= FIFO[13];
		end
	end

	assign    fifo_data_out_1 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_2 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-2)];
	
	assign    fifo_data_out_3 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_4 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-2)];
	
endmodule