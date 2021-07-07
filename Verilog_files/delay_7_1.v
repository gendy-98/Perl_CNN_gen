`timescale 1ns / 1ps


module 
 delay_7_1 #(parameter
	DATA_WIDTH = 1,
	delay_cycles = 7
	)(
	input clk,
	input reset,
	input [DATA_WIDTH-1:0] Data_In,
	output [DATA_WIDTH-1:0] Data_Out
	);
	

	reg	[DATA_WIDTH-1:0] FIFO  [delay_cycles-1:0] ;
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
		end
		else
		begin
			FIFO[0] <= Data_In;
			FIFO[1] <= FIFO[0];
			FIFO[2] <= FIFO[1];
			FIFO[3] <= FIFO[2];
			FIFO[4] <= FIFO[3];
			FIFO[5] <= FIFO[4];
			FIFO[6] <= FIFO[5];
		end
	end

	assign    Data_Out = FIFO[6];
endmodule