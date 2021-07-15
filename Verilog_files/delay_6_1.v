`timescale 1ns / 1ps


module 
 delay_6_1 #(parameter
	SIG_DATA_WIDTH = 1,
	delay_cycles = 6
	)(
	input clk,
	input reset,
	input [SIG_DATA_WIDTH-1:0] Data_In,
	output [SIG_DATA_WIDTH-1:0] Data_Out
	);
	

	reg	[SIG_DATA_WIDTH-1:0] FIFO  [delay_cycles-1:0] ;
	always @ (posedge clk or posedge reset)
    begin
        if(reset)
		begin
			FIFO[0] <= {SIG_DATA_WIDTH{1'b0}};
			FIFO[1] <= {SIG_DATA_WIDTH{1'b0}};
			FIFO[2] <= {SIG_DATA_WIDTH{1'b0}};
			FIFO[3] <= {SIG_DATA_WIDTH{1'b0}};
			FIFO[4] <= {SIG_DATA_WIDTH{1'b0}};
			FIFO[5] <= {SIG_DATA_WIDTH{1'b0}};
		end
		else
		begin
			FIFO[0] <= Data_In;
			FIFO[1] <= FIFO[0];
			FIFO[2] <= FIFO[1];
			FIFO[3] <= FIFO[2];
			FIFO[4] <= FIFO[3];
			FIFO[5] <= FIFO[4];
		end
	end

	assign    Data_Out = FIFO[5];
endmodule