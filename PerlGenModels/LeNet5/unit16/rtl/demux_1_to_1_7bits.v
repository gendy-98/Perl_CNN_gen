`timescale 1ns / 1ps



module 
 demux_1_to_1_7bits 
(
	input  [6:0] din,
	input  [-1:0] sel,
	output [6:0] dout_1
);

	demux_1_to_1 dm_0	 (.din(din[0]), 	 .sel(sel),	 .dout_1(dout_1[0]));
	demux_1_to_1 dm_1	 (.din(din[1]), 	 .sel(sel),	 .dout_1(dout_1[1]));
	demux_1_to_1 dm_2	 (.din(din[2]), 	 .sel(sel),	 .dout_1(dout_1[2]));
	demux_1_to_1 dm_3	 (.din(din[3]), 	 .sel(sel),	 .dout_1(dout_1[3]));
	demux_1_to_1 dm_4	 (.din(din[4]), 	 .sel(sel),	 .dout_1(dout_1[4]));
	demux_1_to_1 dm_5	 (.din(din[5]), 	 .sel(sel),	 .dout_1(dout_1[5]));
	demux_1_to_1 dm_6	 (.din(din[6]), 	 .sel(sel),	 .dout_1(dout_1[6]));
	
endmodule
