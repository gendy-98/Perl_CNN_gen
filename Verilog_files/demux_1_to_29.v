`timescale 1ns / 1ps



module 
 demux_1_to_29 
(
	input  din,
	input  [4:0] sel,
	output dout_1,
	output dout_2,
	output dout_3,
	output dout_4,
	output dout_5,
	output dout_6,
	output dout_7,
	output dout_8,
	output dout_9,
	output dout_10,
	output dout_11,
	output dout_12,
	output dout_13,
	output dout_14,
	output dout_15,
	output dout_16,
	output dout_17,
	output dout_18,
	output dout_19,
	output dout_20,
	output dout_21,
	output dout_22,
	output dout_23,
	output dout_24,
	output dout_25,
	output dout_26,
	output dout_27,
	output dout_28,
	output dout_29
);

	assign dout_1	= din & ( ~sel[0] ) & ( ~sel[1] ) & ( ~sel[2] ) & ( ~sel[3] ) & ( ~sel[4] );
	assign dout_2	= din & (  sel[0] ) & ( ~sel[1] ) & ( ~sel[2] ) & ( ~sel[3] ) & ( ~sel[4] );
	assign dout_3	= din & ( ~sel[0] ) & (  sel[1] ) & ( ~sel[2] ) & ( ~sel[3] ) & ( ~sel[4] );
	assign dout_4	= din & (  sel[0] ) & (  sel[1] ) & ( ~sel[2] ) & ( ~sel[3] ) & ( ~sel[4] );
	assign dout_5	= din & ( ~sel[0] ) & ( ~sel[1] ) & (  sel[2] ) & ( ~sel[3] ) & ( ~sel[4] );
	assign dout_6	= din & (  sel[0] ) & ( ~sel[1] ) & (  sel[2] ) & ( ~sel[3] ) & ( ~sel[4] );
	assign dout_7	= din & ( ~sel[0] ) & (  sel[1] ) & (  sel[2] ) & ( ~sel[3] ) & ( ~sel[4] );
	assign dout_8	= din & (  sel[0] ) & (  sel[1] ) & (  sel[2] ) & ( ~sel[3] ) & ( ~sel[4] );
	assign dout_9	= din & ( ~sel[0] ) & ( ~sel[1] ) & ( ~sel[2] ) & (  sel[3] ) & ( ~sel[4] );
	assign dout_10	= din & (  sel[0] ) & ( ~sel[1] ) & ( ~sel[2] ) & (  sel[3] ) & ( ~sel[4] );
	assign dout_11	= din & ( ~sel[0] ) & (  sel[1] ) & ( ~sel[2] ) & (  sel[3] ) & ( ~sel[4] );
	assign dout_12	= din & (  sel[0] ) & (  sel[1] ) & ( ~sel[2] ) & (  sel[3] ) & ( ~sel[4] );
	assign dout_13	= din & ( ~sel[0] ) & ( ~sel[1] ) & (  sel[2] ) & (  sel[3] ) & ( ~sel[4] );
	assign dout_14	= din & (  sel[0] ) & ( ~sel[1] ) & (  sel[2] ) & (  sel[3] ) & ( ~sel[4] );
	assign dout_15	= din & ( ~sel[0] ) & (  sel[1] ) & (  sel[2] ) & (  sel[3] ) & ( ~sel[4] );
	assign dout_16	= din & (  sel[0] ) & (  sel[1] ) & (  sel[2] ) & (  sel[3] ) & ( ~sel[4] );
	assign dout_17	= din & ( ~sel[0] ) & ( ~sel[1] ) & ( ~sel[2] ) & ( ~sel[3] ) & (  sel[4] );
	assign dout_18	= din & (  sel[0] ) & ( ~sel[1] ) & ( ~sel[2] ) & ( ~sel[3] ) & (  sel[4] );
	assign dout_19	= din & ( ~sel[0] ) & (  sel[1] ) & ( ~sel[2] ) & ( ~sel[3] ) & (  sel[4] );
	assign dout_20	= din & (  sel[0] ) & (  sel[1] ) & ( ~sel[2] ) & ( ~sel[3] ) & (  sel[4] );
	assign dout_21	= din & ( ~sel[0] ) & ( ~sel[1] ) & (  sel[2] ) & ( ~sel[3] ) & (  sel[4] );
	assign dout_22	= din & (  sel[0] ) & ( ~sel[1] ) & (  sel[2] ) & ( ~sel[3] ) & (  sel[4] );
	assign dout_23	= din & ( ~sel[0] ) & (  sel[1] ) & (  sel[2] ) & ( ~sel[3] ) & (  sel[4] );
	assign dout_24	= din & (  sel[0] ) & (  sel[1] ) & (  sel[2] ) & ( ~sel[3] ) & (  sel[4] );
	assign dout_25	= din & ( ~sel[0] ) & ( ~sel[1] ) & ( ~sel[2] ) & (  sel[3] ) & (  sel[4] );
	assign dout_26	= din & (  sel[0] ) & ( ~sel[1] ) & ( ~sel[2] ) & (  sel[3] ) & (  sel[4] );
	assign dout_27	= din & ( ~sel[0] ) & (  sel[1] ) & ( ~sel[2] ) & (  sel[3] ) & (  sel[4] );
	assign dout_28	= din & (  sel[0] ) & (  sel[1] ) & ( ~sel[2] ) & (  sel[3] ) & (  sel[4] );
	assign dout_29	= din & ( ~sel[0] ) & ( ~sel[1] ) & (  sel[2] ) & (  sel[3] ) & (  sel[4] );
	
endmodule
