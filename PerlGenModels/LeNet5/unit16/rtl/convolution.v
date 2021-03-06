`timescale 1ns / 1ps


module 
 convolution #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 			  = 32,
	ARITH_TYPE 			  = 0
	//////////////////////////////////////                     
)( 
	input 							clk,
	input 							reset,
	input 							conv_enable,
	input   [DATA_WIDTH - 1 : 0]    w1,if1,
	input   [DATA_WIDTH - 1 : 0]    w2,if2,
	input   [DATA_WIDTH - 1 : 0]    w3,if3,
	input   [DATA_WIDTH - 1 : 0]    w4,if4,
	input   [DATA_WIDTH - 1 : 0]    w5,if5,
	input   [DATA_WIDTH - 1 : 0]    w6,if6,
	input   [DATA_WIDTH - 1 : 0]    w7,if7,
	input   [DATA_WIDTH - 1 : 0]    w8,if8,
	input   [DATA_WIDTH - 1 : 0]    w9,if9,
	input   [DATA_WIDTH - 1 : 0]    w10,if10,
	input   [DATA_WIDTH - 1 : 0]    w11,if11,
	input   [DATA_WIDTH - 1 : 0]    w12,if12,
	input   [DATA_WIDTH - 1 : 0]    w13,if13,
	input   [DATA_WIDTH - 1 : 0]    w14,if14,
	input   [DATA_WIDTH - 1 : 0]    w15,if15,
	input   [DATA_WIDTH - 1 : 0]    w16,if16,
	input   [DATA_WIDTH - 1 : 0]    w17,if17,
	input   [DATA_WIDTH - 1 : 0]    w18,if18,
	input   [DATA_WIDTH - 1 : 0]    w19,if19,
	input   [DATA_WIDTH - 1 : 0]    w20,if20,
	input   [DATA_WIDTH - 1 : 0]    w21,if21,
	input   [DATA_WIDTH - 1 : 0]    w22,if22,
	input   [DATA_WIDTH - 1 : 0]    w23,if23,
	input   [DATA_WIDTH - 1 : 0]    w24,if24,
	input   [DATA_WIDTH - 1 : 0]    w25,if25,
	output  [DATA_WIDTH - 1 : 0]    conv_data_out
	);

	wire	[DATA_WIDTH - 1 : 0]	mul_out_1;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_2;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_3;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_4;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_5;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_6;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_7;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_8;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_9;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_10;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_11;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_12;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_13;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_14;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_15;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_16;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_17;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_18;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_19;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_20;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_21;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_22;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_23;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_24;
	wire	[DATA_WIDTH - 1 : 0]	mul_out_25;

	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_1;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_2;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_3;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_4;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_5;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_6;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_7;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_8;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_9;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_10;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_11;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_12;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_13;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_14;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_15;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_16;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_17;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_18;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_19;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_20;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_21;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_22;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_23;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_24;
	reg 	[DATA_WIDTH - 1 : 0]	reg_mul_out_25;

	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_1;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_2;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_3;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_4;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_5;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_6;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_7;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_8;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_9;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_10;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_11;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_12;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_1_13;

	wire	[DATA_WIDTH - 1 : 0]	adder_out_2_1;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_2_2;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_2_3;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_2_4;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_2_5;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_2_6;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_2_7;

	wire	[DATA_WIDTH - 1 : 0]	adder_out_3_1;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_3_2;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_3_3;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_3_4;

	wire	[DATA_WIDTH - 1 : 0]	adder_out_4_1;
	wire	[DATA_WIDTH - 1 : 0]	adder_out_4_2;

	wire	[DATA_WIDTH - 1 : 0]	adder_out_5_1;

	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_1;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_2;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_3;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_4;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_5;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_6;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_7;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_8;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_9;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_10;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_11;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_12;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_1_13;

	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_2_1;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_2_2;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_2_3;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_2_4;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_2_5;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_2_6;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_2_7;

	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_3_1;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_3_2;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_3_3;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_3_4;

	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_4_1;
	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_4_2;

	reg 	[DATA_WIDTH - 1 : 0]	reg_adder_out_5_1;

	always @(posedge clk , posedge reset)
    if (reset)
    begin
		reg_mul_out_1 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_2 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_3 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_4 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_5 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_6 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_7 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_8 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_9 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_10 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_11 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_12 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_13 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_14 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_15 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_16 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_17 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_18 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_19 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_20 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_21 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_22 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_23 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_24 <= {DATA_WIDTH{1'b0}};
		reg_mul_out_25 <= {DATA_WIDTH{1'b0}};
	end
    
    else if(conv_enable)
    begin
		reg_mul_out_1 <= mul_out_1;
		reg_mul_out_2 <= mul_out_2;
		reg_mul_out_3 <= mul_out_3;
		reg_mul_out_4 <= mul_out_4;
		reg_mul_out_5 <= mul_out_5;
		reg_mul_out_6 <= mul_out_6;
		reg_mul_out_7 <= mul_out_7;
		reg_mul_out_8 <= mul_out_8;
		reg_mul_out_9 <= mul_out_9;
		reg_mul_out_10 <= mul_out_10;
		reg_mul_out_11 <= mul_out_11;
		reg_mul_out_12 <= mul_out_12;
		reg_mul_out_13 <= mul_out_13;
		reg_mul_out_14 <= mul_out_14;
		reg_mul_out_15 <= mul_out_15;
		reg_mul_out_16 <= mul_out_16;
		reg_mul_out_17 <= mul_out_17;
		reg_mul_out_18 <= mul_out_18;
		reg_mul_out_19 <= mul_out_19;
		reg_mul_out_20 <= mul_out_20;
		reg_mul_out_21 <= mul_out_21;
		reg_mul_out_22 <= mul_out_22;
		reg_mul_out_23 <= mul_out_23;
		reg_mul_out_24 <= mul_out_24;
		reg_mul_out_25 <= mul_out_25;
	end
    
    always @(posedge clk, posedge reset)
    begin
		if(reset)
		begin
			reg_adder_out_1_1 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_1_2 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_1_3 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_1_4 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_1_5 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_1_6 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_1_7 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_1_8 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_1_9 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_1_10 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_1_11 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_1_12 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_1_13 <= {DATA_WIDTH{1'b0}};

			reg_adder_out_2_1 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_2_2 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_2_3 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_2_4 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_2_5 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_2_6 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_2_7 <= {DATA_WIDTH{1'b0}};

			reg_adder_out_3_1 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_3_2 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_3_3 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_3_4 <= {DATA_WIDTH{1'b0}};

			reg_adder_out_4_1 <= {DATA_WIDTH{1'b0}};
			reg_adder_out_4_2 <= {DATA_WIDTH{1'b0}};

			reg_adder_out_5_1 <= {DATA_WIDTH{1'b0}};

		end
        
        else
        begin
			reg_adder_out_1_1 <= adder_out_1_1;
			reg_adder_out_1_2 <= adder_out_1_2;
			reg_adder_out_1_3 <= adder_out_1_3;
			reg_adder_out_1_4 <= adder_out_1_4;
			reg_adder_out_1_5 <= adder_out_1_5;
			reg_adder_out_1_6 <= adder_out_1_6;
			reg_adder_out_1_7 <= adder_out_1_7;
			reg_adder_out_1_8 <= adder_out_1_8;
			reg_adder_out_1_9 <= adder_out_1_9;
			reg_adder_out_1_10 <= adder_out_1_10;
			reg_adder_out_1_11 <= adder_out_1_11;
			reg_adder_out_1_12 <= adder_out_1_12;
			reg_adder_out_1_13 <= adder_out_1_13;

			reg_adder_out_2_1 <= adder_out_2_1;
			reg_adder_out_2_2 <= adder_out_2_2;
			reg_adder_out_2_3 <= adder_out_2_3;
			reg_adder_out_2_4 <= adder_out_2_4;
			reg_adder_out_2_5 <= adder_out_2_5;
			reg_adder_out_2_6 <= adder_out_2_6;
			reg_adder_out_2_7 <= adder_out_2_7;

			reg_adder_out_3_1 <= adder_out_3_1;
			reg_adder_out_3_2 <= adder_out_3_2;
			reg_adder_out_3_3 <= adder_out_3_3;
			reg_adder_out_3_4 <= adder_out_3_4;

			reg_adder_out_4_1 <= adder_out_4_1;
			reg_adder_out_4_2 <= adder_out_4_2;

			reg_adder_out_5_1 <= adder_out_5_1;

		end
	end

	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_1	(.in1(w1), .in2(if1), .out(mul_out_1));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_2	(.in1(w2), .in2(if2), .out(mul_out_2));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_3	(.in1(w3), .in2(if3), .out(mul_out_3));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_4	(.in1(w4), .in2(if4), .out(mul_out_4));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_5	(.in1(w5), .in2(if5), .out(mul_out_5));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_6	(.in1(w6), .in2(if6), .out(mul_out_6));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_7	(.in1(w7), .in2(if7), .out(mul_out_7));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_8	(.in1(w8), .in2(if8), .out(mul_out_8));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_9	(.in1(w9), .in2(if9), .out(mul_out_9));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_10	(.in1(w10), .in2(if10), .out(mul_out_10));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_11	(.in1(w11), .in2(if11), .out(mul_out_11));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_12	(.in1(w12), .in2(if12), .out(mul_out_12));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_13	(.in1(w13), .in2(if13), .out(mul_out_13));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_14	(.in1(w14), .in2(if14), .out(mul_out_14));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_15	(.in1(w15), .in2(if15), .out(mul_out_15));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_16	(.in1(w16), .in2(if16), .out(mul_out_16));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_17	(.in1(w17), .in2(if17), .out(mul_out_17));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_18	(.in1(w18), .in2(if18), .out(mul_out_18));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_19	(.in1(w19), .in2(if19), .out(mul_out_19));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_20	(.in1(w20), .in2(if20), .out(mul_out_20));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_21	(.in1(w21), .in2(if21), .out(mul_out_21));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_22	(.in1(w22), .in2(if22), .out(mul_out_22));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_23	(.in1(w23), .in2(if23), .out(mul_out_23));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_24	(.in1(w24), .in2(if24), .out(mul_out_24));
	multiplier #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))	mul_25	(.in1(w25), .in2(if25), .out(mul_out_25));

	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_1	(.in1(reg_mul_out_1), .in2(reg_mul_out_2), .out(adder_out_1_1));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_2	(.in1(reg_mul_out_3), .in2(reg_mul_out_4), .out(adder_out_1_2));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_3	(.in1(reg_mul_out_5), .in2(reg_mul_out_6), .out(adder_out_1_3));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_4	(.in1(reg_mul_out_7), .in2(reg_mul_out_8), .out(adder_out_1_4));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_5	(.in1(reg_mul_out_9), .in2(reg_mul_out_10), .out(adder_out_1_5));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_6	(.in1(reg_mul_out_11), .in2(reg_mul_out_12), .out(adder_out_1_6));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_7	(.in1(reg_mul_out_13), .in2(reg_mul_out_14), .out(adder_out_1_7));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_8	(.in1(reg_mul_out_15), .in2(reg_mul_out_16), .out(adder_out_1_8));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_9	(.in1(reg_mul_out_17), .in2(reg_mul_out_18), .out(adder_out_1_9));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_10	(.in1(reg_mul_out_19), .in2(reg_mul_out_20), .out(adder_out_1_10));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_11	(.in1(reg_mul_out_21), .in2(reg_mul_out_22), .out(adder_out_1_11));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_12	(.in1(reg_mul_out_23), .in2(reg_mul_out_24), .out(adder_out_1_12));

	assign adder_out_1_13 = reg_mul_out_25;

	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_2_1	(.in1(reg_adder_out_1_1), .in2(reg_adder_out_1_2), .out(adder_out_2_1));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_2_2	(.in1(reg_adder_out_1_3), .in2(reg_adder_out_1_4), .out(adder_out_2_2));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_2_3	(.in1(reg_adder_out_1_5), .in2(reg_adder_out_1_6), .out(adder_out_2_3));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_2_4	(.in1(reg_adder_out_1_7), .in2(reg_adder_out_1_8), .out(adder_out_2_4));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_2_5	(.in1(reg_adder_out_1_9), .in2(reg_adder_out_1_10), .out(adder_out_2_5));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_2_6	(.in1(reg_adder_out_1_11), .in2(reg_adder_out_1_12), .out(adder_out_2_6));

	assign adder_out_2_7 = reg_adder_out_1_13;

	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_3_1	(.in1(reg_adder_out_2_1), .in2(reg_adder_out_2_2), .out(adder_out_3_1));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_3_2	(.in1(reg_adder_out_2_3), .in2(reg_adder_out_2_4), .out(adder_out_3_2));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_3_3	(.in1(reg_adder_out_2_5), .in2(reg_adder_out_2_6), .out(adder_out_3_3));

	assign adder_out_3_4 = reg_adder_out_2_7;

	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_4_1	(.in1(reg_adder_out_3_1), .in2(reg_adder_out_3_2), .out(adder_out_4_1));
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_4_2	(.in1(reg_adder_out_3_3), .in2(reg_adder_out_3_4), .out(adder_out_4_2));

	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_5_1	(.in1(reg_adder_out_4_1), .in2(reg_adder_out_4_2), .out(adder_out_5_1));

	assign conv_data_out = reg_adder_out_5_1;  

    
endmodule

