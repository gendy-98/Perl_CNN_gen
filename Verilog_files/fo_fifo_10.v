`timescale 1ns / 1ps


module 
 fo_fifo_10 #(parameter
	DATA_WIDTH = 32,
	REGS_NUM = 10
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
	input [DATA_WIDTH-1:0] fifo_data_in,
	input fifo_enable
	);

	reg	[DATA_WIDTH-1:0] FIFO  [REGS_NUM-1:0] ;
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
		end
	end

	assign    fifo_data_out_1 = FIFO[9];
	assign    fifo_data_out_2 = FIFO[8];
	assign    fifo_data_out_3 = FIFO[7];
	assign    fifo_data_out_4 = FIFO[6];
	assign    fifo_data_out_5 = FIFO[5];
	assign    fifo_data_out_6 = FIFO[4];
	assign    fifo_data_out_7 = FIFO[3];
	assign    fifo_data_out_8 = FIFO[2];
	assign    fifo_data_out_9 = FIFO[1];
	assign    fifo_data_out_10 = FIFO[0];
endmodule