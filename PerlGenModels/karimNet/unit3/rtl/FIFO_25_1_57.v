`timescale 1ns / 1ps


module 
 FIFO_25_1_57 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE 					= 13,
	KERNAL_SIZE 				= 5,
///////////generated parameters/////////
	FIFO_SIZE               	= (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE            

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
			FIFO[0] <= {DATA_WIDTH{1'b0}};
			FIFO[1] <= {DATA_WIDTH{1'b0}};
			FIFO[2] <= {DATA_WIDTH{1'b0}};
			FIFO[3] <= {DATA_WIDTH{1'b0}};
			FIFO[4] <= {DATA_WIDTH{1'b0}};
			FIFO[5] <= {DATA_WIDTH{1'b0}};
			FIFO[6] <= {DATA_WIDTH{1'b0}};
			FIFO[7] <= {DATA_WIDTH{1'b0}};
			FIFO[8] <= {DATA_WIDTH{1'b0}};
			FIFO[9] <= {DATA_WIDTH{1'b0}};
			FIFO[10] <= {DATA_WIDTH{1'b0}};
			FIFO[11] <= {DATA_WIDTH{1'b0}};
			FIFO[12] <= {DATA_WIDTH{1'b0}};
			FIFO[13] <= {DATA_WIDTH{1'b0}};
			FIFO[14] <= {DATA_WIDTH{1'b0}};
			FIFO[15] <= {DATA_WIDTH{1'b0}};
			FIFO[16] <= {DATA_WIDTH{1'b0}};
			FIFO[17] <= {DATA_WIDTH{1'b0}};
			FIFO[18] <= {DATA_WIDTH{1'b0}};
			FIFO[19] <= {DATA_WIDTH{1'b0}};
			FIFO[20] <= {DATA_WIDTH{1'b0}};
			FIFO[21] <= {DATA_WIDTH{1'b0}};
			FIFO[22] <= {DATA_WIDTH{1'b0}};
			FIFO[23] <= {DATA_WIDTH{1'b0}};
			FIFO[24] <= {DATA_WIDTH{1'b0}};
			FIFO[25] <= {DATA_WIDTH{1'b0}};
			FIFO[26] <= {DATA_WIDTH{1'b0}};
			FIFO[27] <= {DATA_WIDTH{1'b0}};
			FIFO[28] <= {DATA_WIDTH{1'b0}};
			FIFO[29] <= {DATA_WIDTH{1'b0}};
			FIFO[30] <= {DATA_WIDTH{1'b0}};
			FIFO[31] <= {DATA_WIDTH{1'b0}};
			FIFO[32] <= {DATA_WIDTH{1'b0}};
			FIFO[33] <= {DATA_WIDTH{1'b0}};
			FIFO[34] <= {DATA_WIDTH{1'b0}};
			FIFO[35] <= {DATA_WIDTH{1'b0}};
			FIFO[36] <= {DATA_WIDTH{1'b0}};
			FIFO[37] <= {DATA_WIDTH{1'b0}};
			FIFO[38] <= {DATA_WIDTH{1'b0}};
			FIFO[39] <= {DATA_WIDTH{1'b0}};
			FIFO[40] <= {DATA_WIDTH{1'b0}};
			FIFO[41] <= {DATA_WIDTH{1'b0}};
			FIFO[42] <= {DATA_WIDTH{1'b0}};
			FIFO[43] <= {DATA_WIDTH{1'b0}};
			FIFO[44] <= {DATA_WIDTH{1'b0}};
			FIFO[45] <= {DATA_WIDTH{1'b0}};
			FIFO[46] <= {DATA_WIDTH{1'b0}};
			FIFO[47] <= {DATA_WIDTH{1'b0}};
			FIFO[48] <= {DATA_WIDTH{1'b0}};
			FIFO[49] <= {DATA_WIDTH{1'b0}};
			FIFO[50] <= {DATA_WIDTH{1'b0}};
			FIFO[51] <= {DATA_WIDTH{1'b0}};
			FIFO[52] <= {DATA_WIDTH{1'b0}};
			FIFO[53] <= {DATA_WIDTH{1'b0}};
			FIFO[54] <= {DATA_WIDTH{1'b0}};
			FIFO[55] <= {DATA_WIDTH{1'b0}};
			FIFO[56] <= {DATA_WIDTH{1'b0}};
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