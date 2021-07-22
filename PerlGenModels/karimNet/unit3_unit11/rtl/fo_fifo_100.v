`timescale 1ns / 1ps


module 
 fo_fifo_100 #(parameter
	DATA_WIDTH = 32,
	REGS_NUM = 100
	)(
	input clk,
	input reset,
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
	output [DATA_WIDTH-1:0] fifo_data_out_25,
	output [DATA_WIDTH-1:0] fifo_data_out_26,
	output [DATA_WIDTH-1:0] fifo_data_out_27,
	output [DATA_WIDTH-1:0] fifo_data_out_28,
	output [DATA_WIDTH-1:0] fifo_data_out_29,
	output [DATA_WIDTH-1:0] fifo_data_out_30,
	output [DATA_WIDTH-1:0] fifo_data_out_31,
	output [DATA_WIDTH-1:0] fifo_data_out_32,
	output [DATA_WIDTH-1:0] fifo_data_out_33,
	output [DATA_WIDTH-1:0] fifo_data_out_34,
	output [DATA_WIDTH-1:0] fifo_data_out_35,
	output [DATA_WIDTH-1:0] fifo_data_out_36,
	output [DATA_WIDTH-1:0] fifo_data_out_37,
	output [DATA_WIDTH-1:0] fifo_data_out_38,
	output [DATA_WIDTH-1:0] fifo_data_out_39,
	output [DATA_WIDTH-1:0] fifo_data_out_40,
	output [DATA_WIDTH-1:0] fifo_data_out_41,
	output [DATA_WIDTH-1:0] fifo_data_out_42,
	output [DATA_WIDTH-1:0] fifo_data_out_43,
	output [DATA_WIDTH-1:0] fifo_data_out_44,
	output [DATA_WIDTH-1:0] fifo_data_out_45,
	output [DATA_WIDTH-1:0] fifo_data_out_46,
	output [DATA_WIDTH-1:0] fifo_data_out_47,
	output [DATA_WIDTH-1:0] fifo_data_out_48,
	output [DATA_WIDTH-1:0] fifo_data_out_49,
	output [DATA_WIDTH-1:0] fifo_data_out_50,
	output [DATA_WIDTH-1:0] fifo_data_out_51,
	output [DATA_WIDTH-1:0] fifo_data_out_52,
	output [DATA_WIDTH-1:0] fifo_data_out_53,
	output [DATA_WIDTH-1:0] fifo_data_out_54,
	output [DATA_WIDTH-1:0] fifo_data_out_55,
	output [DATA_WIDTH-1:0] fifo_data_out_56,
	output [DATA_WIDTH-1:0] fifo_data_out_57,
	output [DATA_WIDTH-1:0] fifo_data_out_58,
	output [DATA_WIDTH-1:0] fifo_data_out_59,
	output [DATA_WIDTH-1:0] fifo_data_out_60,
	output [DATA_WIDTH-1:0] fifo_data_out_61,
	output [DATA_WIDTH-1:0] fifo_data_out_62,
	output [DATA_WIDTH-1:0] fifo_data_out_63,
	output [DATA_WIDTH-1:0] fifo_data_out_64,
	output [DATA_WIDTH-1:0] fifo_data_out_65,
	output [DATA_WIDTH-1:0] fifo_data_out_66,
	output [DATA_WIDTH-1:0] fifo_data_out_67,
	output [DATA_WIDTH-1:0] fifo_data_out_68,
	output [DATA_WIDTH-1:0] fifo_data_out_69,
	output [DATA_WIDTH-1:0] fifo_data_out_70,
	output [DATA_WIDTH-1:0] fifo_data_out_71,
	output [DATA_WIDTH-1:0] fifo_data_out_72,
	output [DATA_WIDTH-1:0] fifo_data_out_73,
	output [DATA_WIDTH-1:0] fifo_data_out_74,
	output [DATA_WIDTH-1:0] fifo_data_out_75,
	output [DATA_WIDTH-1:0] fifo_data_out_76,
	output [DATA_WIDTH-1:0] fifo_data_out_77,
	output [DATA_WIDTH-1:0] fifo_data_out_78,
	output [DATA_WIDTH-1:0] fifo_data_out_79,
	output [DATA_WIDTH-1:0] fifo_data_out_80,
	output [DATA_WIDTH-1:0] fifo_data_out_81,
	output [DATA_WIDTH-1:0] fifo_data_out_82,
	output [DATA_WIDTH-1:0] fifo_data_out_83,
	output [DATA_WIDTH-1:0] fifo_data_out_84,
	output [DATA_WIDTH-1:0] fifo_data_out_85,
	output [DATA_WIDTH-1:0] fifo_data_out_86,
	output [DATA_WIDTH-1:0] fifo_data_out_87,
	output [DATA_WIDTH-1:0] fifo_data_out_88,
	output [DATA_WIDTH-1:0] fifo_data_out_89,
	output [DATA_WIDTH-1:0] fifo_data_out_90,
	output [DATA_WIDTH-1:0] fifo_data_out_91,
	output [DATA_WIDTH-1:0] fifo_data_out_92,
	output [DATA_WIDTH-1:0] fifo_data_out_93,
	output [DATA_WIDTH-1:0] fifo_data_out_94,
	output [DATA_WIDTH-1:0] fifo_data_out_95,
	output [DATA_WIDTH-1:0] fifo_data_out_96,
	output [DATA_WIDTH-1:0] fifo_data_out_97,
	output [DATA_WIDTH-1:0] fifo_data_out_98,
	output [DATA_WIDTH-1:0] fifo_data_out_99,
	output [DATA_WIDTH-1:0] fifo_data_out_100,
	input [DATA_WIDTH-1:0] fifo_data_in,
	input fifo_enable
	);

	reg	[DATA_WIDTH-1:0] FIFO  [REGS_NUM-1:0] ;
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
		end
	end

	assign    fifo_data_out_1 = FIFO[99];
	assign    fifo_data_out_2 = FIFO[98];
	assign    fifo_data_out_3 = FIFO[97];
	assign    fifo_data_out_4 = FIFO[96];
	assign    fifo_data_out_5 = FIFO[95];
	assign    fifo_data_out_6 = FIFO[94];
	assign    fifo_data_out_7 = FIFO[93];
	assign    fifo_data_out_8 = FIFO[92];
	assign    fifo_data_out_9 = FIFO[91];
	assign    fifo_data_out_10 = FIFO[90];
	assign    fifo_data_out_11 = FIFO[89];
	assign    fifo_data_out_12 = FIFO[88];
	assign    fifo_data_out_13 = FIFO[87];
	assign    fifo_data_out_14 = FIFO[86];
	assign    fifo_data_out_15 = FIFO[85];
	assign    fifo_data_out_16 = FIFO[84];
	assign    fifo_data_out_17 = FIFO[83];
	assign    fifo_data_out_18 = FIFO[82];
	assign    fifo_data_out_19 = FIFO[81];
	assign    fifo_data_out_20 = FIFO[80];
	assign    fifo_data_out_21 = FIFO[79];
	assign    fifo_data_out_22 = FIFO[78];
	assign    fifo_data_out_23 = FIFO[77];
	assign    fifo_data_out_24 = FIFO[76];
	assign    fifo_data_out_25 = FIFO[75];
	assign    fifo_data_out_26 = FIFO[74];
	assign    fifo_data_out_27 = FIFO[73];
	assign    fifo_data_out_28 = FIFO[72];
	assign    fifo_data_out_29 = FIFO[71];
	assign    fifo_data_out_30 = FIFO[70];
	assign    fifo_data_out_31 = FIFO[69];
	assign    fifo_data_out_32 = FIFO[68];
	assign    fifo_data_out_33 = FIFO[67];
	assign    fifo_data_out_34 = FIFO[66];
	assign    fifo_data_out_35 = FIFO[65];
	assign    fifo_data_out_36 = FIFO[64];
	assign    fifo_data_out_37 = FIFO[63];
	assign    fifo_data_out_38 = FIFO[62];
	assign    fifo_data_out_39 = FIFO[61];
	assign    fifo_data_out_40 = FIFO[60];
	assign    fifo_data_out_41 = FIFO[59];
	assign    fifo_data_out_42 = FIFO[58];
	assign    fifo_data_out_43 = FIFO[57];
	assign    fifo_data_out_44 = FIFO[56];
	assign    fifo_data_out_45 = FIFO[55];
	assign    fifo_data_out_46 = FIFO[54];
	assign    fifo_data_out_47 = FIFO[53];
	assign    fifo_data_out_48 = FIFO[52];
	assign    fifo_data_out_49 = FIFO[51];
	assign    fifo_data_out_50 = FIFO[50];
	assign    fifo_data_out_51 = FIFO[49];
	assign    fifo_data_out_52 = FIFO[48];
	assign    fifo_data_out_53 = FIFO[47];
	assign    fifo_data_out_54 = FIFO[46];
	assign    fifo_data_out_55 = FIFO[45];
	assign    fifo_data_out_56 = FIFO[44];
	assign    fifo_data_out_57 = FIFO[43];
	assign    fifo_data_out_58 = FIFO[42];
	assign    fifo_data_out_59 = FIFO[41];
	assign    fifo_data_out_60 = FIFO[40];
	assign    fifo_data_out_61 = FIFO[39];
	assign    fifo_data_out_62 = FIFO[38];
	assign    fifo_data_out_63 = FIFO[37];
	assign    fifo_data_out_64 = FIFO[36];
	assign    fifo_data_out_65 = FIFO[35];
	assign    fifo_data_out_66 = FIFO[34];
	assign    fifo_data_out_67 = FIFO[33];
	assign    fifo_data_out_68 = FIFO[32];
	assign    fifo_data_out_69 = FIFO[31];
	assign    fifo_data_out_70 = FIFO[30];
	assign    fifo_data_out_71 = FIFO[29];
	assign    fifo_data_out_72 = FIFO[28];
	assign    fifo_data_out_73 = FIFO[27];
	assign    fifo_data_out_74 = FIFO[26];
	assign    fifo_data_out_75 = FIFO[25];
	assign    fifo_data_out_76 = FIFO[24];
	assign    fifo_data_out_77 = FIFO[23];
	assign    fifo_data_out_78 = FIFO[22];
	assign    fifo_data_out_79 = FIFO[21];
	assign    fifo_data_out_80 = FIFO[20];
	assign    fifo_data_out_81 = FIFO[19];
	assign    fifo_data_out_82 = FIFO[18];
	assign    fifo_data_out_83 = FIFO[17];
	assign    fifo_data_out_84 = FIFO[16];
	assign    fifo_data_out_85 = FIFO[15];
	assign    fifo_data_out_86 = FIFO[14];
	assign    fifo_data_out_87 = FIFO[13];
	assign    fifo_data_out_88 = FIFO[12];
	assign    fifo_data_out_89 = FIFO[11];
	assign    fifo_data_out_90 = FIFO[10];
	assign    fifo_data_out_91 = FIFO[9];
	assign    fifo_data_out_92 = FIFO[8];
	assign    fifo_data_out_93 = FIFO[7];
	assign    fifo_data_out_94 = FIFO[6];
	assign    fifo_data_out_95 = FIFO[5];
	assign    fifo_data_out_96 = FIFO[4];
	assign    fifo_data_out_97 = FIFO[3];
	assign    fifo_data_out_98 = FIFO[2];
	assign    fifo_data_out_99 = FIFO[1];
	assign    fifo_data_out_100 = FIFO[0];
endmodule