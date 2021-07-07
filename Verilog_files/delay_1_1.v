`timescale 1ns / 1ps


module 
 delay_1_1 #(parameter
	DATA_WIDTH = 1,
	delay_cycles = 1
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
		end
		else
		begin
			FIFO[0] <= Data_In;
		end
	end

	assign    Data_Out = FIFO[0];
endmodule