`timescale 1ns / 1ps


module 
 delay_1_0 #(parameter
	SIG_DATA_WIDTH = 0,
	delay_cycles = 1
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
		end
		else
		begin
			FIFO[0] <= Data_In;
		end
	end

	assign    Data_Out = FIFO[0];
endmodule