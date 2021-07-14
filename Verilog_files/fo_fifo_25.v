`timescale 1ns / 1ps


module 
 fo_fifo_25 #(parameter
	DATA_WIDTH = 32,
	REGS_NUM = 25
	)(
	input clk,
	input reset,
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
	output [DATA_WIDTH-1:0] fifo_data_out_25,
	input [DATA_WIDTH-1:0] fifo_data_in,
	input fifo_enable
	);

	reg	[DATA_WIDTH-1:0] FIFO  [REGS_NUM-1:0] ;
	always @ (posedge clk or posedge reset)
    begin
		if(fifo_enable)
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
		end
        if(fifo_enable)
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
		end
	end

	assign    fifo_data_out_1 = FIFO[24];
	assign    fifo_data_out_2 = FIFO[23];
	assign    fifo_data_out_3 = FIFO[22];
	assign    fifo_data_out_4 = FIFO[21];
	assign    fifo_data_out_5 = FIFO[20];
	assign    fifo_data_out_6 = FIFO[19];
	assign    fifo_data_out_7 = FIFO[18];
	assign    fifo_data_out_8 = FIFO[17];
	assign    fifo_data_out_9 = FIFO[16];
	assign    fifo_data_out_10 = FIFO[15];
	assign    fifo_data_out_11 = FIFO[14];
	assign    fifo_data_out_12 = FIFO[13];
	assign    fifo_data_out_13 = FIFO[12];
	assign    fifo_data_out_14 = FIFO[11];
	assign    fifo_data_out_15 = FIFO[10];
	assign    fifo_data_out_16 = FIFO[9];
	assign    fifo_data_out_17 = FIFO[8];
	assign    fifo_data_out_18 = FIFO[7];
	assign    fifo_data_out_19 = FIFO[6];
	assign    fifo_data_out_20 = FIFO[5];
	assign    fifo_data_out_21 = FIFO[4];
	assign    fifo_data_out_22 = FIFO[3];
	assign    fifo_data_out_23 = FIFO[2];
	assign    fifo_data_out_24 = FIFO[1];
	assign    fifo_data_out_25 = FIFO[0];
endmodule