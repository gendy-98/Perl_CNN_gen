`timescale 1ns / 1ps


module 
 FIFO_4_2_30 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE 					= 28,
	KERNAL_SIZE 				= 2,
///////////generated parameters/////////
	FIFO_SIZE               	= (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE            

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
			FIFO[16] <= FIFO[14];
			FIFO[17] <= FIFO[15];
			FIFO[18] <= FIFO[16];
			FIFO[19] <= FIFO[17];
			FIFO[20] <= FIFO[18];
			FIFO[21] <= FIFO[19];
			FIFO[22] <= FIFO[20];
			FIFO[23] <= FIFO[21];
			FIFO[24] <= FIFO[22];
			FIFO[25] <= FIFO[23];
			FIFO[26] <= FIFO[24];
			FIFO[27] <= FIFO[25];
			FIFO[28] <= FIFO[26];
			FIFO[29] <= FIFO[27];
		end
	end

	assign    fifo_data_out_1 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_2 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-2)];
	
	assign    fifo_data_out_3 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_4 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-2)];
	
endmodule