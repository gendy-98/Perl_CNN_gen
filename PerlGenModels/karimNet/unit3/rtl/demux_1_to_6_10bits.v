`timescale 1ns / 1ps



module 
 demux_1_to_6_10bits 
(
	input  [9:0] din,
	input  [2:0] sel,
	output [9:0] dout_1,
	output [9:0] dout_2,
	output [9:0] dout_3,
	output [9:0] dout_4,
	output [9:0] dout_5,
	output [9:0] dout_6
);

	demux_1_to_6 dm_0	 (.din(din[0]), 	 .sel(sel),	 .dout_1(dout_1[0]),	 .dout_2(dout_2[0]),	 .dout_3(dout_3[0]),	 .dout_4(dout_4[0]),	 .dout_5(dout_5[0]),	 .dout_6(dout_6[0]));
	demux_1_to_6 dm_1	 (.din(din[1]), 	 .sel(sel),	 .dout_1(dout_1[1]),	 .dout_2(dout_2[1]),	 .dout_3(dout_3[1]),	 .dout_4(dout_4[1]),	 .dout_5(dout_5[1]),	 .dout_6(dout_6[1]));
	demux_1_to_6 dm_2	 (.din(din[2]), 	 .sel(sel),	 .dout_1(dout_1[2]),	 .dout_2(dout_2[2]),	 .dout_3(dout_3[2]),	 .dout_4(dout_4[2]),	 .dout_5(dout_5[2]),	 .dout_6(dout_6[2]));
	demux_1_to_6 dm_3	 (.din(din[3]), 	 .sel(sel),	 .dout_1(dout_1[3]),	 .dout_2(dout_2[3]),	 .dout_3(dout_3[3]),	 .dout_4(dout_4[3]),	 .dout_5(dout_5[3]),	 .dout_6(dout_6[3]));
	demux_1_to_6 dm_4	 (.din(din[4]), 	 .sel(sel),	 .dout_1(dout_1[4]),	 .dout_2(dout_2[4]),	 .dout_3(dout_3[4]),	 .dout_4(dout_4[4]),	 .dout_5(dout_5[4]),	 .dout_6(dout_6[4]));
	demux_1_to_6 dm_5	 (.din(din[5]), 	 .sel(sel),	 .dout_1(dout_1[5]),	 .dout_2(dout_2[5]),	 .dout_3(dout_3[5]),	 .dout_4(dout_4[5]),	 .dout_5(dout_5[5]),	 .dout_6(dout_6[5]));
	demux_1_to_6 dm_6	 (.din(din[6]), 	 .sel(sel),	 .dout_1(dout_1[6]),	 .dout_2(dout_2[6]),	 .dout_3(dout_3[6]),	 .dout_4(dout_4[6]),	 .dout_5(dout_5[6]),	 .dout_6(dout_6[6]));
	demux_1_to_6 dm_7	 (.din(din[7]), 	 .sel(sel),	 .dout_1(dout_1[7]),	 .dout_2(dout_2[7]),	 .dout_3(dout_3[7]),	 .dout_4(dout_4[7]),	 .dout_5(dout_5[7]),	 .dout_6(dout_6[7]));
	demux_1_to_6 dm_8	 (.din(din[8]), 	 .sel(sel),	 .dout_1(dout_1[8]),	 .dout_2(dout_2[8]),	 .dout_3(dout_3[8]),	 .dout_4(dout_4[8]),	 .dout_5(dout_5[8]),	 .dout_6(dout_6[8]));
	demux_1_to_6 dm_9	 (.din(din[9]), 	 .sel(sel),	 .dout_1(dout_1[9]),	 .dout_2(dout_2[9]),	 .dout_3(dout_3[9]),	 .dout_4(dout_4[9]),	 .dout_5(dout_5[9]),	 .dout_6(dout_6[9]));
	
endmodule
