`timescale 1ns / 1ps

/*********************************************************************************
* Create Date: 01/19/2021 08:53:06 PM                                            *
* Module Name: FP_Multiplier                                                     *
* N : Number of bits 16 - 32 - 64                                                *
* E : Exponent Width 5  - 8  - 11                                                *
* M : Mantissa Width 10 - 23 - 52                                                *
* Bias: 2**(E-1)-1                                                               *
**********************************************************************************/


module 
 Float_Multiplier #(parameter
	DATA_WIDTH = 32
	,E = 8
	,M = 27
	)(
	input [DATA_WIDTH - 1:0] in1,
	input [DATA_WIDTH - 1:0] in2,
	output [DATA_WIDTH - 1:0] out
	);
	
	localparam [E-1:0] Bias = 2**(E-1)-1;   

	wire sign1,sign2,signOUT;
	wire [E-1:0] Exponent1,Exponent2,ExponentOUT;
	wire [M-1:0] Mantissa1,Mantissa2,MantissaOUT; 

	wire [E-1:0]   ExponentUnNORMALIZED;
	wire [2*M+1:0] MantissaUnNORMALIZED;
	wire NormalizationNeeded, ZeroIN;

	assign sign1 = in1[N-1];
	assign sign2 = in2[N-1];
	assign Exponent1 = in1[N-2:N-E-1];
	assign Exponent2 = in2[N-2:N-E-1];
	assign Mantissa1 = in1[M-1:0];
	assign Mantissa2 = in2[M-1:0];

	assign signOUT = sign1 ^ sign2;

	assign ExponentUnNORMALIZED = Exponent1 + Exponent2 - Bias;
	assign MantissaUnNORMALIZED = {1'b1,Mantissa1} * {1'b1,Mantissa2};

	assign NormalizationNeeded = MantissaUnNORMALIZED[2*M+1];
	assign MantissaOUT = NormalizationNeeded ? MantissaUnNORMALIZED[2*M:M+1] : MantissaUnNORMALIZED[2*M-1:M];
	assign ExponentOUT = NormalizationNeeded ? ExponentUnNORMALIZED+1 : ExponentUnNORMALIZED ;

	assign ZeroIN = (~|in1[N-2:0]) | (~|in2[N-2:0]);
	assign out = ZeroIN ? 'b0 : {signOUT, ExponentOUT, MantissaOUT};

endmodule
