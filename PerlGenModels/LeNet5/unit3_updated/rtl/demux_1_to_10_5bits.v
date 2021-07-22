`timescale 1ns / 1ps



module 
 demux_1_to_10_5bits 
(
	input  [4:0] din,
	input  [3:0] sel,
	output [4:0] dout_1,
	output [4:0] dout_2,
	output [4:0] dout_3,
	output [4:0] dout_4,
	output [4:0] dout_5,
	output [4:0] dout_6,
	output [4:0] dout_7,
	output [4:0] dout_8,
	output [4:0] dout_9,
	output [4:0] dout_10
);

	demux_1_to_10 dm_0	 (.din(din[0]), 	 .sel(sel),	 .dout_1(dout_1[0]),	 .dout_2(dout_2[0]),	 .dout_3(dout_3[0]),	 .dout_4(dout_4[0]),	 .dout_5(dout_5[0]),	 .dout_6(dout_6[0]),	 .dout_7(dout_7[0]),	 .dout_8(dout_8[0]),	 .dout_9(dout_9[0]),	 .dout_10(dout_10[0]));
	demux_1_to_10 dm_1	 (.din(din[1]), 	 .sel(sel),	 .dout_1(dout_1[1]),	 .dout_2(dout_2[1]),	 .dout_3(dout_3[1]),	 .dout_4(dout_4[1]),	 .dout_5(dout_5[1]),	 .dout_6(dout_6[1]),	 .dout_7(dout_7[1]),	 .dout_8(dout_8[1]),	 .dout_9(dout_9[1]),	 .dout_10(dout_10[1]));
	demux_1_to_10 dm_2	 (.din(din[2]), 	 .sel(sel),	 .dout_1(dout_1[2]),	 .dout_2(dout_2[2]),	 .dout_3(dout_3[2]),	 .dout_4(dout_4[2]),	 .dout_5(dout_5[2]),	 .dout_6(dout_6[2]),	 .dout_7(dout_7[2]),	 .dout_8(dout_8[2]),	 .dout_9(dout_9[2]),	 .dout_10(dout_10[2]));
	demux_1_to_10 dm_3	 (.din(din[3]), 	 .sel(sel),	 .dout_1(dout_1[3]),	 .dout_2(dout_2[3]),	 .dout_3(dout_3[3]),	 .dout_4(dout_4[3]),	 .dout_5(dout_5[3]),	 .dout_6(dout_6[3]),	 .dout_7(dout_7[3]),	 .dout_8(dout_8[3]),	 .dout_9(dout_9[3]),	 .dout_10(dout_10[3]));
	demux_1_to_10 dm_4	 (.din(din[4]), 	 .sel(sel),	 .dout_1(dout_1[4]),	 .dout_2(dout_2[4]),	 .dout_3(dout_3[4]),	 .dout_4(dout_4[4]),	 .dout_5(dout_5[4]),	 .dout_6(dout_6[4]),	 .dout_7(dout_7[4]),	 .dout_8(dout_8[4]),	 .dout_9(dout_9[4]),	 .dout_10(dout_10[4]));
	
endmodule
