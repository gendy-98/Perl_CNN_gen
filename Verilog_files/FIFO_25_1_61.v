`timescale 1ns / 1ps


module 
 FIFO_25_1_61 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
	ADDRESS_BITS 				= 18,
///////////architecture parameters//////
	IFM_SIZE 					= 14,
	IFM_DEPTH 					= 3,
	KERNAL_SIZE 				= 5,
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
	output [DATA_WIDTH-1:0] fifo_data_out_1,
	output [DATA_WIDTH-1:0] fifo_data_out_2,
	output [DATA_WIDTH-1:0] fifo_data_out_3,
	output [DATA_WIDTH-1:0] fifo_data_out_4,
	output [DATA_WIDTH-1:0] fifo_data_out_5,
	output [DATA_WIDTH-1:0] fifo_data_out_6,
	output [DATA_WIDTH-1:0] fifo_data_out_7,
	output [DATA_WIDTH-1:0] fifo_data_out_8,
	output [DATA_WIDTH-1:0] fifo_data_out_9,
	output [DATA_WIDTH-1:0] fifo_data_out_10,
	output [DATA_WIDTH-1:0] fifo_data_out_11,
	output [DATA_WIDTH-1:0] fifo_data_out_12,
	output [DATA_WIDTH-1:0] fifo_data_out_13,
	output [DATA_WIDTH-1:0] fifo_data_out_14,
	output [DATA_WIDTH-1:0] fifo_data_out_15,
	output [DATA_WIDTH-1:0] fifo_data_out_16,
	output [DATA_WIDTH-1:0] fifo_data_out_17,
	output [DATA_WIDTH-1:0] fifo_data_out_18,
	output [DATA_WIDTH-1:0] fifo_data_out_19,
	output [DATA_WIDTH-1:0] fifo_data_out_20,
	output [DATA_WIDTH-1:0] fifo_data_out_21,
	output [DATA_WIDTH-1:0] fifo_data_out_22,
	output [DATA_WIDTH-1:0] fifo_data_out_23,
	output [DATA_WIDTH-1:0] fifo_data_out_24,
	output [DATA_WIDTH-1:0] fifo_data_out_25
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
			FIFO[16] <= 0;
			FIFO[17] <= 0;
			FIFO[18] <= 0;
			FIFO[19] <= 0;
			FIFO[20] <= 0;
			FIFO[21] <= 0;
			FIFO[22] <= 0;
			FIFO[23] <= 0;
			FIFO[24] <= 0;
			FIFO[25] <= 0;
			FIFO[26] <= 0;
			FIFO[27] <= 0;
			FIFO[28] <= 0;
			FIFO[29] <= 0;
			FIFO[30] <= 0;
			FIFO[31] <= 0;
			FIFO[32] <= 0;
			FIFO[33] <= 0;
			FIFO[34] <= 0;
			FIFO[35] <= 0;
			FIFO[36] <= 0;
			FIFO[37] <= 0;
			FIFO[38] <= 0;
			FIFO[39] <= 0;
			FIFO[40] <= 0;
			FIFO[41] <= 0;
			FIFO[42] <= 0;
			FIFO[43] <= 0;
			FIFO[44] <= 0;
			FIFO[45] <= 0;
			FIFO[46] <= 0;
			FIFO[47] <= 0;
			FIFO[48] <= 0;
			FIFO[49] <= 0;
			FIFO[50] <= 0;
			FIFO[51] <= 0;
			FIFO[52] <= 0;
			FIFO[53] <= 0;
			FIFO[54] <= 0;
			FIFO[55] <= 0;
			FIFO[56] <= 0;
			FIFO[57] <= 0;
			FIFO[58] <= 0;
			FIFO[59] <= 0;
			FIFO[60] <= 0;
		end
		else if(fifo_enable)
		begin
			FIFO[0] <= fifo_data_in;
			FIFO[1] <= FIFO[0];
			FIFO[2] <= FIFO[1];
			FIFO[3] <= FIFO[2];
			FIFO[4] <= FIFO[3];
			FIFO[5] <= FIFO[4];
			FIFO[6] <= FIFO[5];
			FIFO[7] <= FIFO[6];
			FIFO[8] <= FIFO[7];
			FIFO[9] <= FIFO[8];
			FIFO[10] <= FIFO[9];
			FIFO[11] <= FIFO[10];
			FIFO[12] <= FIFO[11];
			FIFO[13] <= FIFO[12];
			FIFO[14] <= FIFO[13];
			FIFO[15] <= FIFO[14];
			FIFO[16] <= FIFO[15];
			FIFO[17] <= FIFO[16];
			FIFO[18] <= FIFO[17];
			FIFO[19] <= FIFO[18];
			FIFO[20] <= FIFO[19];
			FIFO[21] <= FIFO[20];
			FIFO[22] <= FIFO[21];
			FIFO[23] <= FIFO[22];
			FIFO[24] <= FIFO[23];
			FIFO[25] <= FIFO[24];
			FIFO[26] <= FIFO[25];
			FIFO[27] <= FIFO[26];
			FIFO[28] <= FIFO[27];
			FIFO[29] <= FIFO[28];
			FIFO[30] <= FIFO[29];
			FIFO[31] <= FIFO[30];
			FIFO[32] <= FIFO[31];
			FIFO[33] <= FIFO[32];
			FIFO[34] <= FIFO[33];
			FIFO[35] <= FIFO[34];
			FIFO[36] <= FIFO[35];
			FIFO[37] <= FIFO[36];
			FIFO[38] <= FIFO[37];
			FIFO[39] <= FIFO[38];
			FIFO[40] <= FIFO[39];
			FIFO[41] <= FIFO[40];
			FIFO[42] <= FIFO[41];
			FIFO[43] <= FIFO[42];
			FIFO[44] <= FIFO[43];
			FIFO[45] <= FIFO[44];
			FIFO[46] <= FIFO[45];
			FIFO[47] <= FIFO[46];
			FIFO[48] <= FIFO[47];
			FIFO[49] <= FIFO[48];
			FIFO[50] <= FIFO[49];
			FIFO[51] <= FIFO[50];
			FIFO[52] <= FIFO[51];
			FIFO[53] <= FIFO[52];
			FIFO[54] <= FIFO[53];
			FIFO[55] <= FIFO[54];
			FIFO[56] <= FIFO[55];
			FIFO[57] <= FIFO[56];
			FIFO[58] <= FIFO[57];
			FIFO[59] <= FIFO[58];
			FIFO[60] <= FIFO[59];
		end
	end

	assign    fifo_data_out_1 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_2 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-2)];
	assign    fifo_data_out_3 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-3)];
	assign    fifo_data_out_4 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-4)];
	assign    fifo_data_out_5 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-5)];
	
	assign    fifo_data_out_6 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_7 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-2)];
	assign    fifo_data_out_8 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-3)];
	assign    fifo_data_out_9 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-4)];
	assign    fifo_data_out_10 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-5)];
	
	assign    fifo_data_out_11 = FIFO[(KERNAL_SIZE-3)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_12 = FIFO[(KERNAL_SIZE-3)*IFM_SIZE+(KERNAL_SIZE-2)];
	assign    fifo_data_out_13 = FIFO[(KERNAL_SIZE-3)*IFM_SIZE+(KERNAL_SIZE-3)];
	assign    fifo_data_out_14 = FIFO[(KERNAL_SIZE-3)*IFM_SIZE+(KERNAL_SIZE-4)];
	assign    fifo_data_out_15 = FIFO[(KERNAL_SIZE-3)*IFM_SIZE+(KERNAL_SIZE-5)];
	
	assign    fifo_data_out_16 = FIFO[(KERNAL_SIZE-4)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_17 = FIFO[(KERNAL_SIZE-4)*IFM_SIZE+(KERNAL_SIZE-2)];
	assign    fifo_data_out_18 = FIFO[(KERNAL_SIZE-4)*IFM_SIZE+(KERNAL_SIZE-3)];
	assign    fifo_data_out_19 = FIFO[(KERNAL_SIZE-4)*IFM_SIZE+(KERNAL_SIZE-4)];
	assign    fifo_data_out_20 = FIFO[(KERNAL_SIZE-4)*IFM_SIZE+(KERNAL_SIZE-5)];
	
	assign    fifo_data_out_21 = FIFO[(KERNAL_SIZE-5)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_22 = FIFO[(KERNAL_SIZE-5)*IFM_SIZE+(KERNAL_SIZE-2)];
	assign    fifo_data_out_23 = FIFO[(KERNAL_SIZE-5)*IFM_SIZE+(KERNAL_SIZE-3)];
	assign    fifo_data_out_24 = FIFO[(KERNAL_SIZE-5)*IFM_SIZE+(KERNAL_SIZE-4)];
	assign    fifo_data_out_25 = FIFO[(KERNAL_SIZE-5)*IFM_SIZE+(KERNAL_SIZE-5)];
	
endmodule