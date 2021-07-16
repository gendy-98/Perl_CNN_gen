`timescale 1ns / 1ps


module 
 FIFO_4_2_9 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE 					= 7,
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
		end
	end

	assign    fifo_data_out_1 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_2 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-2)];
	
	assign    fifo_data_out_3 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_4 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-2)];
	
endmodule