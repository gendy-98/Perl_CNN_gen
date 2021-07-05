`timescale 1ns / 1ps



module 
 demux_1_to_29_7bits 
(
	input  [6:0] din,
	input  [4:0] sel,
	output [6:0] dout_1,
	output [6:0] dout_2,
	output [6:0] dout_3,
	output [6:0] dout_4,
	output [6:0] dout_5,
	output [6:0] dout_6,
	output [6:0] dout_7,
	output [6:0] dout_8,
	output [6:0] dout_9,
	output [6:0] dout_10,
	output [6:0] dout_11,
	output [6:0] dout_12,
	output [6:0] dout_13,
	output [6:0] dout_14,
	output [6:0] dout_15,
	output [6:0] dout_16,
	output [6:0] dout_17,
	output [6:0] dout_18,
	output [6:0] dout_19,
	output [6:0] dout_20,
	output [6:0] dout_21,
	output [6:0] dout_22,
	output [6:0] dout_23,
	output [6:0] dout_24,
	output [6:0] dout_25,
	output [6:0] dout_26,
	output [6:0] dout_27,
	output [6:0] dout_28,
	output [6:0] dout_29
);

	demux_1_to_29 dm_0	 (.din(din[0]), 	 .sel(sel),	 .dout_1(dout_1[0]),	 .dout_2(dout_2[0]),	 .dout_3(dout_3[0]),	 .dout_4(dout_4[0]),	 .dout_5(dout_5[0]),	 .dout_6(dout_6[0]),	 .dout_7(dout_7[0]),	 .dout_8(dout_8[0]),	 .dout_9(dout_9[0]),	 .dout_10(dout_10[0]),	 .dout_11(dout_11[0]),	 .dout_12(dout_12[0]),	 .dout_13(dout_13[0]),	 .dout_14(dout_14[0]),	 .dout_15(dout_15[0]),	 .dout_16(dout_16[0]),	 .dout_17(dout_17[0]),	 .dout_18(dout_18[0]),	 .dout_19(dout_19[0]),	 .dout_20(dout_20[0]),	 .dout_21(dout_21[0]),	 .dout_22(dout_22[0]),	 .dout_23(dout_23[0]),	 .dout_24(dout_24[0]),	 .dout_25(dout_25[0]),	 .dout_26(dout_26[0]),	 .dout_27(dout_27[0]),	 .dout_28(dout_28[0]),	 .dout_29(dout_29[0]));
	demux_1_to_29 dm_1	 (.din(din[1]), 	 .sel(sel),	 .dout_1(dout_1[1]),	 .dout_2(dout_2[1]),	 .dout_3(dout_3[1]),	 .dout_4(dout_4[1]),	 .dout_5(dout_5[1]),	 .dout_6(dout_6[1]),	 .dout_7(dout_7[1]),	 .dout_8(dout_8[1]),	 .dout_9(dout_9[1]),	 .dout_10(dout_10[1]),	 .dout_11(dout_11[1]),	 .dout_12(dout_12[1]),	 .dout_13(dout_13[1]),	 .dout_14(dout_14[1]),	 .dout_15(dout_15[1]),	 .dout_16(dout_16[1]),	 .dout_17(dout_17[1]),	 .dout_18(dout_18[1]),	 .dout_19(dout_19[1]),	 .dout_20(dout_20[1]),	 .dout_21(dout_21[1]),	 .dout_22(dout_22[1]),	 .dout_23(dout_23[1]),	 .dout_24(dout_24[1]),	 .dout_25(dout_25[1]),	 .dout_26(dout_26[1]),	 .dout_27(dout_27[1]),	 .dout_28(dout_28[1]),	 .dout_29(dout_29[1]));
	demux_1_to_29 dm_2	 (.din(din[2]), 	 .sel(sel),	 .dout_1(dout_1[2]),	 .dout_2(dout_2[2]),	 .dout_3(dout_3[2]),	 .dout_4(dout_4[2]),	 .dout_5(dout_5[2]),	 .dout_6(dout_6[2]),	 .dout_7(dout_7[2]),	 .dout_8(dout_8[2]),	 .dout_9(dout_9[2]),	 .dout_10(dout_10[2]),	 .dout_11(dout_11[2]),	 .dout_12(dout_12[2]),	 .dout_13(dout_13[2]),	 .dout_14(dout_14[2]),	 .dout_15(dout_15[2]),	 .dout_16(dout_16[2]),	 .dout_17(dout_17[2]),	 .dout_18(dout_18[2]),	 .dout_19(dout_19[2]),	 .dout_20(dout_20[2]),	 .dout_21(dout_21[2]),	 .dout_22(dout_22[2]),	 .dout_23(dout_23[2]),	 .dout_24(dout_24[2]),	 .dout_25(dout_25[2]),	 .dout_26(dout_26[2]),	 .dout_27(dout_27[2]),	 .dout_28(dout_28[2]),	 .dout_29(dout_29[2]));
	demux_1_to_29 dm_3	 (.din(din[3]), 	 .sel(sel),	 .dout_1(dout_1[3]),	 .dout_2(dout_2[3]),	 .dout_3(dout_3[3]),	 .dout_4(dout_4[3]),	 .dout_5(dout_5[3]),	 .dout_6(dout_6[3]),	 .dout_7(dout_7[3]),	 .dout_8(dout_8[3]),	 .dout_9(dout_9[3]),	 .dout_10(dout_10[3]),	 .dout_11(dout_11[3]),	 .dout_12(dout_12[3]),	 .dout_13(dout_13[3]),	 .dout_14(dout_14[3]),	 .dout_15(dout_15[3]),	 .dout_16(dout_16[3]),	 .dout_17(dout_17[3]),	 .dout_18(dout_18[3]),	 .dout_19(dout_19[3]),	 .dout_20(dout_20[3]),	 .dout_21(dout_21[3]),	 .dout_22(dout_22[3]),	 .dout_23(dout_23[3]),	 .dout_24(dout_24[3]),	 .dout_25(dout_25[3]),	 .dout_26(dout_26[3]),	 .dout_27(dout_27[3]),	 .dout_28(dout_28[3]),	 .dout_29(dout_29[3]));
	demux_1_to_29 dm_4	 (.din(din[4]), 	 .sel(sel),	 .dout_1(dout_1[4]),	 .dout_2(dout_2[4]),	 .dout_3(dout_3[4]),	 .dout_4(dout_4[4]),	 .dout_5(dout_5[4]),	 .dout_6(dout_6[4]),	 .dout_7(dout_7[4]),	 .dout_8(dout_8[4]),	 .dout_9(dout_9[4]),	 .dout_10(dout_10[4]),	 .dout_11(dout_11[4]),	 .dout_12(dout_12[4]),	 .dout_13(dout_13[4]),	 .dout_14(dout_14[4]),	 .dout_15(dout_15[4]),	 .dout_16(dout_16[4]),	 .dout_17(dout_17[4]),	 .dout_18(dout_18[4]),	 .dout_19(dout_19[4]),	 .dout_20(dout_20[4]),	 .dout_21(dout_21[4]),	 .dout_22(dout_22[4]),	 .dout_23(dout_23[4]),	 .dout_24(dout_24[4]),	 .dout_25(dout_25[4]),	 .dout_26(dout_26[4]),	 .dout_27(dout_27[4]),	 .dout_28(dout_28[4]),	 .dout_29(dout_29[4]));
	demux_1_to_29 dm_5	 (.din(din[5]), 	 .sel(sel),	 .dout_1(dout_1[5]),	 .dout_2(dout_2[5]),	 .dout_3(dout_3[5]),	 .dout_4(dout_4[5]),	 .dout_5(dout_5[5]),	 .dout_6(dout_6[5]),	 .dout_7(dout_7[5]),	 .dout_8(dout_8[5]),	 .dout_9(dout_9[5]),	 .dout_10(dout_10[5]),	 .dout_11(dout_11[5]),	 .dout_12(dout_12[5]),	 .dout_13(dout_13[5]),	 .dout_14(dout_14[5]),	 .dout_15(dout_15[5]),	 .dout_16(dout_16[5]),	 .dout_17(dout_17[5]),	 .dout_18(dout_18[5]),	 .dout_19(dout_19[5]),	 .dout_20(dout_20[5]),	 .dout_21(dout_21[5]),	 .dout_22(dout_22[5]),	 .dout_23(dout_23[5]),	 .dout_24(dout_24[5]),	 .dout_25(dout_25[5]),	 .dout_26(dout_26[5]),	 .dout_27(dout_27[5]),	 .dout_28(dout_28[5]),	 .dout_29(dout_29[5]));
	demux_1_to_29 dm_6	 (.din(din[6]), 	 .sel(sel),	 .dout_1(dout_1[6]),	 .dout_2(dout_2[6]),	 .dout_3(dout_3[6]),	 .dout_4(dout_4[6]),	 .dout_5(dout_5[6]),	 .dout_6(dout_6[6]),	 .dout_7(dout_7[6]),	 .dout_8(dout_8[6]),	 .dout_9(dout_9[6]),	 .dout_10(dout_10[6]),	 .dout_11(dout_11[6]),	 .dout_12(dout_12[6]),	 .dout_13(dout_13[6]),	 .dout_14(dout_14[6]),	 .dout_15(dout_15[6]),	 .dout_16(dout_16[6]),	 .dout_17(dout_17[6]),	 .dout_18(dout_18[6]),	 .dout_19(dout_19[6]),	 .dout_20(dout_20[6]),	 .dout_21(dout_21[6]),	 .dout_22(dout_22[6]),	 .dout_23(dout_23[6]),	 .dout_24(dout_24[6]),	 .dout_25(dout_25[6]),	 .dout_26(dout_26[6]),	 .dout_27(dout_27[6]),	 .dout_28(dout_28[6]),	 .dout_29(dout_29[6]));
	
endmodule
