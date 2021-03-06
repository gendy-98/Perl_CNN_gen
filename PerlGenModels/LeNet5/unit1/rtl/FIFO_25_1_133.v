`timescale 1ns / 1ps


module 
 FIFO_25_1_133 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE 					= 32,
	KERNAL_SIZE 				= 5,
///////////generated parameters/////////
	FIFO_SIZE               	= (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE            

	)(
	input clk,
	input reset,
	input fifo_enable,
	input [DATA_WIDTH-1:0] fifo_data_in,
	output [DATA_WIDTH-1:0] fifo_data_out_1,
	output [DATA_WIDTH-1:0] fifo_data_out_2,
	output [DATA_WIDTH-1:0] fifo_data_out_3,
	output [DATA_WIDTH-1:0] fifo_data_out_4,
	output [DATA_WIDTH-1:0] fifo_data_out_5,
	output [DATA_WIDTH-1:0] fifo_data_out_6,
	output [DATA_WIDTH-1:0] fifo_data_out_7,
	output [DATA_WIDTH-1:0] fifo_data_out_8,
	output [DATA_WIDTH-1:0] fifo_data_out_9,
	output [DATA_WIDTH-1:0] fifo_data_out_10,
	output [DATA_WIDTH-1:0] fifo_data_out_11,
	output [DATA_WIDTH-1:0] fifo_data_out_12,
	output [DATA_WIDTH-1:0] fifo_data_out_13,
	output [DATA_WIDTH-1:0] fifo_data_out_14,
	output [DATA_WIDTH-1:0] fifo_data_out_15,
	output [DATA_WIDTH-1:0] fifo_data_out_16,
	output [DATA_WIDTH-1:0] fifo_data_out_17,
	output [DATA_WIDTH-1:0] fifo_data_out_18,
	output [DATA_WIDTH-1:0] fifo_data_out_19,
	output [DATA_WIDTH-1:0] fifo_data_out_20,
	output [DATA_WIDTH-1:0] fifo_data_out_21,
	output [DATA_WIDTH-1:0] fifo_data_out_22,
	output [DATA_WIDTH-1:0] fifo_data_out_23,
	output [DATA_WIDTH-1:0] fifo_data_out_24,
	output [DATA_WIDTH-1:0] fifo_data_out_25
	);
	reg	[DATA_WIDTH-1:0] FIFO  [FIFO_SIZE-1:0] ;
	always @ (posedge clk or posedge reset)
    begin
        if(reset)
		begin
			FIFO[0] <= {DATA_WIDTH{1'b0}};
			FIFO[1] <= {DATA_WIDTH{1'b0}};
			FIFO[2] <= {DATA_WIDTH{1'b0}};
			FIFO[3] <= {DATA_WIDTH{1'b0}};
			FIFO[4] <= {DATA_WIDTH{1'b0}};
			FIFO[5] <= {DATA_WIDTH{1'b0}};
			FIFO[6] <= {DATA_WIDTH{1'b0}};
			FIFO[7] <= {DATA_WIDTH{1'b0}};
			FIFO[8] <= {DATA_WIDTH{1'b0}};
			FIFO[9] <= {DATA_WIDTH{1'b0}};
			FIFO[10] <= {DATA_WIDTH{1'b0}};
			FIFO[11] <= {DATA_WIDTH{1'b0}};
			FIFO[12] <= {DATA_WIDTH{1'b0}};
			FIFO[13] <= {DATA_WIDTH{1'b0}};
			FIFO[14] <= {DATA_WIDTH{1'b0}};
			FIFO[15] <= {DATA_WIDTH{1'b0}};
			FIFO[16] <= {DATA_WIDTH{1'b0}};
			FIFO[17] <= {DATA_WIDTH{1'b0}};
			FIFO[18] <= {DATA_WIDTH{1'b0}};
			FIFO[19] <= {DATA_WIDTH{1'b0}};
			FIFO[20] <= {DATA_WIDTH{1'b0}};
			FIFO[21] <= {DATA_WIDTH{1'b0}};
			FIFO[22] <= {DATA_WIDTH{1'b0}};
			FIFO[23] <= {DATA_WIDTH{1'b0}};
			FIFO[24] <= {DATA_WIDTH{1'b0}};
			FIFO[25] <= {DATA_WIDTH{1'b0}};
			FIFO[26] <= {DATA_WIDTH{1'b0}};
			FIFO[27] <= {DATA_WIDTH{1'b0}};
			FIFO[28] <= {DATA_WIDTH{1'b0}};
			FIFO[29] <= {DATA_WIDTH{1'b0}};
			FIFO[30] <= {DATA_WIDTH{1'b0}};
			FIFO[31] <= {DATA_WIDTH{1'b0}};
			FIFO[32] <= {DATA_WIDTH{1'b0}};
			FIFO[33] <= {DATA_WIDTH{1'b0}};
			FIFO[34] <= {DATA_WIDTH{1'b0}};
			FIFO[35] <= {DATA_WIDTH{1'b0}};
			FIFO[36] <= {DATA_WIDTH{1'b0}};
			FIFO[37] <= {DATA_WIDTH{1'b0}};
			FIFO[38] <= {DATA_WIDTH{1'b0}};
			FIFO[39] <= {DATA_WIDTH{1'b0}};
			FIFO[40] <= {DATA_WIDTH{1'b0}};
			FIFO[41] <= {DATA_WIDTH{1'b0}};
			FIFO[42] <= {DATA_WIDTH{1'b0}};
			FIFO[43] <= {DATA_WIDTH{1'b0}};
			FIFO[44] <= {DATA_WIDTH{1'b0}};
			FIFO[45] <= {DATA_WIDTH{1'b0}};
			FIFO[46] <= {DATA_WIDTH{1'b0}};
			FIFO[47] <= {DATA_WIDTH{1'b0}};
			FIFO[48] <= {DATA_WIDTH{1'b0}};
			FIFO[49] <= {DATA_WIDTH{1'b0}};
			FIFO[50] <= {DATA_WIDTH{1'b0}};
			FIFO[51] <= {DATA_WIDTH{1'b0}};
			FIFO[52] <= {DATA_WIDTH{1'b0}};
			FIFO[53] <= {DATA_WIDTH{1'b0}};
			FIFO[54] <= {DATA_WIDTH{1'b0}};
			FIFO[55] <= {DATA_WIDTH{1'b0}};
			FIFO[56] <= {DATA_WIDTH{1'b0}};
			FIFO[57] <= {DATA_WIDTH{1'b0}};
			FIFO[58] <= {DATA_WIDTH{1'b0}};
			FIFO[59] <= {DATA_WIDTH{1'b0}};
			FIFO[60] <= {DATA_WIDTH{1'b0}};
			FIFO[61] <= {DATA_WIDTH{1'b0}};
			FIFO[62] <= {DATA_WIDTH{1'b0}};
			FIFO[63] <= {DATA_WIDTH{1'b0}};
			FIFO[64] <= {DATA_WIDTH{1'b0}};
			FIFO[65] <= {DATA_WIDTH{1'b0}};
			FIFO[66] <= {DATA_WIDTH{1'b0}};
			FIFO[67] <= {DATA_WIDTH{1'b0}};
			FIFO[68] <= {DATA_WIDTH{1'b0}};
			FIFO[69] <= {DATA_WIDTH{1'b0}};
			FIFO[70] <= {DATA_WIDTH{1'b0}};
			FIFO[71] <= {DATA_WIDTH{1'b0}};
			FIFO[72] <= {DATA_WIDTH{1'b0}};
			FIFO[73] <= {DATA_WIDTH{1'b0}};
			FIFO[74] <= {DATA_WIDTH{1'b0}};
			FIFO[75] <= {DATA_WIDTH{1'b0}};
			FIFO[76] <= {DATA_WIDTH{1'b0}};
			FIFO[77] <= {DATA_WIDTH{1'b0}};
			FIFO[78] <= {DATA_WIDTH{1'b0}};
			FIFO[79] <= {DATA_WIDTH{1'b0}};
			FIFO[80] <= {DATA_WIDTH{1'b0}};
			FIFO[81] <= {DATA_WIDTH{1'b0}};
			FIFO[82] <= {DATA_WIDTH{1'b0}};
			FIFO[83] <= {DATA_WIDTH{1'b0}};
			FIFO[84] <= {DATA_WIDTH{1'b0}};
			FIFO[85] <= {DATA_WIDTH{1'b0}};
			FIFO[86] <= {DATA_WIDTH{1'b0}};
			FIFO[87] <= {DATA_WIDTH{1'b0}};
			FIFO[88] <= {DATA_WIDTH{1'b0}};
			FIFO[89] <= {DATA_WIDTH{1'b0}};
			FIFO[90] <= {DATA_WIDTH{1'b0}};
			FIFO[91] <= {DATA_WIDTH{1'b0}};
			FIFO[92] <= {DATA_WIDTH{1'b0}};
			FIFO[93] <= {DATA_WIDTH{1'b0}};
			FIFO[94] <= {DATA_WIDTH{1'b0}};
			FIFO[95] <= {DATA_WIDTH{1'b0}};
			FIFO[96] <= {DATA_WIDTH{1'b0}};
			FIFO[97] <= {DATA_WIDTH{1'b0}};
			FIFO[98] <= {DATA_WIDTH{1'b0}};
			FIFO[99] <= {DATA_WIDTH{1'b0}};
			FIFO[100] <= {DATA_WIDTH{1'b0}};
			FIFO[101] <= {DATA_WIDTH{1'b0}};
			FIFO[102] <= {DATA_WIDTH{1'b0}};
			FIFO[103] <= {DATA_WIDTH{1'b0}};
			FIFO[104] <= {DATA_WIDTH{1'b0}};
			FIFO[105] <= {DATA_WIDTH{1'b0}};
			FIFO[106] <= {DATA_WIDTH{1'b0}};
			FIFO[107] <= {DATA_WIDTH{1'b0}};
			FIFO[108] <= {DATA_WIDTH{1'b0}};
			FIFO[109] <= {DATA_WIDTH{1'b0}};
			FIFO[110] <= {DATA_WIDTH{1'b0}};
			FIFO[111] <= {DATA_WIDTH{1'b0}};
			FIFO[112] <= {DATA_WIDTH{1'b0}};
			FIFO[113] <= {DATA_WIDTH{1'b0}};
			FIFO[114] <= {DATA_WIDTH{1'b0}};
			FIFO[115] <= {DATA_WIDTH{1'b0}};
			FIFO[116] <= {DATA_WIDTH{1'b0}};
			FIFO[117] <= {DATA_WIDTH{1'b0}};
			FIFO[118] <= {DATA_WIDTH{1'b0}};
			FIFO[119] <= {DATA_WIDTH{1'b0}};
			FIFO[120] <= {DATA_WIDTH{1'b0}};
			FIFO[121] <= {DATA_WIDTH{1'b0}};
			FIFO[122] <= {DATA_WIDTH{1'b0}};
			FIFO[123] <= {DATA_WIDTH{1'b0}};
			FIFO[124] <= {DATA_WIDTH{1'b0}};
			FIFO[125] <= {DATA_WIDTH{1'b0}};
			FIFO[126] <= {DATA_WIDTH{1'b0}};
			FIFO[127] <= {DATA_WIDTH{1'b0}};
			FIFO[128] <= {DATA_WIDTH{1'b0}};
			FIFO[129] <= {DATA_WIDTH{1'b0}};
			FIFO[130] <= {DATA_WIDTH{1'b0}};
			FIFO[131] <= {DATA_WIDTH{1'b0}};
			FIFO[132] <= {DATA_WIDTH{1'b0}};
		end
		else if(fifo_enable)
		begin
			FIFO[0] <= fifo_data_in;
			FIFO[1] <= FIFO[0];
			FIFO[2] <= FIFO[1];
			FIFO[3] <= FIFO[2];
			FIFO[4] <= FIFO[3];
			FIFO[5] <= FIFO[4];
			FIFO[6] <= FIFO[5];
			FIFO[7] <= FIFO[6];
			FIFO[8] <= FIFO[7];
			FIFO[9] <= FIFO[8];
			FIFO[10] <= FIFO[9];
			FIFO[11] <= FIFO[10];
			FIFO[12] <= FIFO[11];
			FIFO[13] <= FIFO[12];
			FIFO[14] <= FIFO[13];
			FIFO[15] <= FIFO[14];
			FIFO[16] <= FIFO[15];
			FIFO[17] <= FIFO[16];
			FIFO[18] <= FIFO[17];
			FIFO[19] <= FIFO[18];
			FIFO[20] <= FIFO[19];
			FIFO[21] <= FIFO[20];
			FIFO[22] <= FIFO[21];
			FIFO[23] <= FIFO[22];
			FIFO[24] <= FIFO[23];
			FIFO[25] <= FIFO[24];
			FIFO[26] <= FIFO[25];
			FIFO[27] <= FIFO[26];
			FIFO[28] <= FIFO[27];
			FIFO[29] <= FIFO[28];
			FIFO[30] <= FIFO[29];
			FIFO[31] <= FIFO[30];
			FIFO[32] <= FIFO[31];
			FIFO[33] <= FIFO[32];
			FIFO[34] <= FIFO[33];
			FIFO[35] <= FIFO[34];
			FIFO[36] <= FIFO[35];
			FIFO[37] <= FIFO[36];
			FIFO[38] <= FIFO[37];
			FIFO[39] <= FIFO[38];
			FIFO[40] <= FIFO[39];
			FIFO[41] <= FIFO[40];
			FIFO[42] <= FIFO[41];
			FIFO[43] <= FIFO[42];
			FIFO[44] <= FIFO[43];
			FIFO[45] <= FIFO[44];
			FIFO[46] <= FIFO[45];
			FIFO[47] <= FIFO[46];
			FIFO[48] <= FIFO[47];
			FIFO[49] <= FIFO[48];
			FIFO[50] <= FIFO[49];
			FIFO[51] <= FIFO[50];
			FIFO[52] <= FIFO[51];
			FIFO[53] <= FIFO[52];
			FIFO[54] <= FIFO[53];
			FIFO[55] <= FIFO[54];
			FIFO[56] <= FIFO[55];
			FIFO[57] <= FIFO[56];
			FIFO[58] <= FIFO[57];
			FIFO[59] <= FIFO[58];
			FIFO[60] <= FIFO[59];
			FIFO[61] <= FIFO[60];
			FIFO[62] <= FIFO[61];
			FIFO[63] <= FIFO[62];
			FIFO[64] <= FIFO[63];
			FIFO[65] <= FIFO[64];
			FIFO[66] <= FIFO[65];
			FIFO[67] <= FIFO[66];
			FIFO[68] <= FIFO[67];
			FIFO[69] <= FIFO[68];
			FIFO[70] <= FIFO[69];
			FIFO[71] <= FIFO[70];
			FIFO[72] <= FIFO[71];
			FIFO[73] <= FIFO[72];
			FIFO[74] <= FIFO[73];
			FIFO[75] <= FIFO[74];
			FIFO[76] <= FIFO[75];
			FIFO[77] <= FIFO[76];
			FIFO[78] <= FIFO[77];
			FIFO[79] <= FIFO[78];
			FIFO[80] <= FIFO[79];
			FIFO[81] <= FIFO[80];
			FIFO[82] <= FIFO[81];
			FIFO[83] <= FIFO[82];
			FIFO[84] <= FIFO[83];
			FIFO[85] <= FIFO[84];
			FIFO[86] <= FIFO[85];
			FIFO[87] <= FIFO[86];
			FIFO[88] <= FIFO[87];
			FIFO[89] <= FIFO[88];
			FIFO[90] <= FIFO[89];
			FIFO[91] <= FIFO[90];
			FIFO[92] <= FIFO[91];
			FIFO[93] <= FIFO[92];
			FIFO[94] <= FIFO[93];
			FIFO[95] <= FIFO[94];
			FIFO[96] <= FIFO[95];
			FIFO[97] <= FIFO[96];
			FIFO[98] <= FIFO[97];
			FIFO[99] <= FIFO[98];
			FIFO[100] <= FIFO[99];
			FIFO[101] <= FIFO[100];
			FIFO[102] <= FIFO[101];
			FIFO[103] <= FIFO[102];
			FIFO[104] <= FIFO[103];
			FIFO[105] <= FIFO[104];
			FIFO[106] <= FIFO[105];
			FIFO[107] <= FIFO[106];
			FIFO[108] <= FIFO[107];
			FIFO[109] <= FIFO[108];
			FIFO[110] <= FIFO[109];
			FIFO[111] <= FIFO[110];
			FIFO[112] <= FIFO[111];
			FIFO[113] <= FIFO[112];
			FIFO[114] <= FIFO[113];
			FIFO[115] <= FIFO[114];
			FIFO[116] <= FIFO[115];
			FIFO[117] <= FIFO[116];
			FIFO[118] <= FIFO[117];
			FIFO[119] <= FIFO[118];
			FIFO[120] <= FIFO[119];
			FIFO[121] <= FIFO[120];
			FIFO[122] <= FIFO[121];
			FIFO[123] <= FIFO[122];
			FIFO[124] <= FIFO[123];
			FIFO[125] <= FIFO[124];
			FIFO[126] <= FIFO[125];
			FIFO[127] <= FIFO[126];
			FIFO[128] <= FIFO[127];
			FIFO[129] <= FIFO[128];
			FIFO[130] <= FIFO[129];
			FIFO[131] <= FIFO[130];
			FIFO[132] <= FIFO[131];
		end
	end

	assign    fifo_data_out_1 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_2 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-2)];
	assign    fifo_data_out_3 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-3)];
	assign    fifo_data_out_4 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-4)];
	assign    fifo_data_out_5 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-5)];
	
	assign    fifo_data_out_6 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_7 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-2)];
	assign    fifo_data_out_8 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-3)];
	assign    fifo_data_out_9 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-4)];
	assign    fifo_data_out_10 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-5)];
	
	assign    fifo_data_out_11 = FIFO[(KERNAL_SIZE-3)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_12 = FIFO[(KERNAL_SIZE-3)*IFM_SIZE+(KERNAL_SIZE-2)];
	assign    fifo_data_out_13 = FIFO[(KERNAL_SIZE-3)*IFM_SIZE+(KERNAL_SIZE-3)];
	assign    fifo_data_out_14 = FIFO[(KERNAL_SIZE-3)*IFM_SIZE+(KERNAL_SIZE-4)];
	assign    fifo_data_out_15 = FIFO[(KERNAL_SIZE-3)*IFM_SIZE+(KERNAL_SIZE-5)];
	
	assign    fifo_data_out_16 = FIFO[(KERNAL_SIZE-4)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_17 = FIFO[(KERNAL_SIZE-4)*IFM_SIZE+(KERNAL_SIZE-2)];
	assign    fifo_data_out_18 = FIFO[(KERNAL_SIZE-4)*IFM_SIZE+(KERNAL_SIZE-3)];
	assign    fifo_data_out_19 = FIFO[(KERNAL_SIZE-4)*IFM_SIZE+(KERNAL_SIZE-4)];
	assign    fifo_data_out_20 = FIFO[(KERNAL_SIZE-4)*IFM_SIZE+(KERNAL_SIZE-5)];
	
	assign    fifo_data_out_21 = FIFO[(KERNAL_SIZE-5)*IFM_SIZE+(KERNAL_SIZE-1)];
	assign    fifo_data_out_22 = FIFO[(KERNAL_SIZE-5)*IFM_SIZE+(KERNAL_SIZE-2)];
	assign    fifo_data_out_23 = FIFO[(KERNAL_SIZE-5)*IFM_SIZE+(KERNAL_SIZE-3)];
	assign    fifo_data_out_24 = FIFO[(KERNAL_SIZE-5)*IFM_SIZE+(KERNAL_SIZE-4)];
	assign    fifo_data_out_25 = FIFO[(KERNAL_SIZE-5)*IFM_SIZE+(KERNAL_SIZE-5)];
	
endmodule