`timescale 1ns / 1ps


module 
 fully_connected_80 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 			  = 32,
	ARITH_TYPE                = 0
)(
	input [DATA_WIDTH-1:0] Data_in,
	input [DATA_WIDTH-1:0] Data_Weight_1,
	input [DATA_WIDTH-1:0] Data_Weight_2,
	input [DATA_WIDTH-1:0] Data_Weight_3,
	input [DATA_WIDTH-1:0] Data_Weight_4,
	input [DATA_WIDTH-1:0] Data_Weight_5,
	input [DATA_WIDTH-1:0] Data_Weight_6,
	input [DATA_WIDTH-1:0] Data_Weight_7,
	input [DATA_WIDTH-1:0] Data_Weight_8,
	input [DATA_WIDTH-1:0] Data_Weight_9,
	input [DATA_WIDTH-1:0] Data_Weight_10,
	input [DATA_WIDTH-1:0] Data_Weight_11,
	input [DATA_WIDTH-1:0] Data_Weight_12,
	input [DATA_WIDTH-1:0] Data_Weight_13,
	input [DATA_WIDTH-1:0] Data_Weight_14,
	input [DATA_WIDTH-1:0] Data_Weight_15,
	input [DATA_WIDTH-1:0] Data_Weight_16,
	input [DATA_WIDTH-1:0] Data_Weight_17,
	input [DATA_WIDTH-1:0] Data_Weight_18,
	input [DATA_WIDTH-1:0] Data_Weight_19,
	input [DATA_WIDTH-1:0] Data_Weight_20,
	input [DATA_WIDTH-1:0] Data_Weight_21,
	input [DATA_WIDTH-1:0] Data_Weight_22,
	input [DATA_WIDTH-1:0] Data_Weight_23,
	input [DATA_WIDTH-1:0] Data_Weight_24,
	input [DATA_WIDTH-1:0] Data_Weight_25,
	input [DATA_WIDTH-1:0] Data_Weight_26,
	input [DATA_WIDTH-1:0] Data_Weight_27,
	input [DATA_WIDTH-1:0] Data_Weight_28,
	input [DATA_WIDTH-1:0] Data_Weight_29,
	input [DATA_WIDTH-1:0] Data_Weight_30,
	input [DATA_WIDTH-1:0] Data_Weight_31,
	input [DATA_WIDTH-1:0] Data_Weight_32,
	input [DATA_WIDTH-1:0] Data_Weight_33,
	input [DATA_WIDTH-1:0] Data_Weight_34,
	input [DATA_WIDTH-1:0] Data_Weight_35,
	input [DATA_WIDTH-1:0] Data_Weight_36,
	input [DATA_WIDTH-1:0] Data_Weight_37,
	input [DATA_WIDTH-1:0] Data_Weight_38,
	input [DATA_WIDTH-1:0] Data_Weight_39,
	input [DATA_WIDTH-1:0] Data_Weight_40,
	input [DATA_WIDTH-1:0] Data_Weight_41,
	input [DATA_WIDTH-1:0] Data_Weight_42,
	input [DATA_WIDTH-1:0] Data_Weight_43,
	input [DATA_WIDTH-1:0] Data_Weight_44,
	input [DATA_WIDTH-1:0] Data_Weight_45,
	input [DATA_WIDTH-1:0] Data_Weight_46,
	input [DATA_WIDTH-1:0] Data_Weight_47,
	input [DATA_WIDTH-1:0] Data_Weight_48,
	input [DATA_WIDTH-1:0] Data_Weight_49,
	input [DATA_WIDTH-1:0] Data_Weight_50,
	input [DATA_WIDTH-1:0] Data_Weight_51,
	input [DATA_WIDTH-1:0] Data_Weight_52,
	input [DATA_WIDTH-1:0] Data_Weight_53,
	input [DATA_WIDTH-1:0] Data_Weight_54,
	input [DATA_WIDTH-1:0] Data_Weight_55,
	input [DATA_WIDTH-1:0] Data_Weight_56,
	input [DATA_WIDTH-1:0] Data_Weight_57,
	input [DATA_WIDTH-1:0] Data_Weight_58,
	input [DATA_WIDTH-1:0] Data_Weight_59,
	input [DATA_WIDTH-1:0] Data_Weight_60,
	input [DATA_WIDTH-1:0] Data_Weight_61,
	input [DATA_WIDTH-1:0] Data_Weight_62,
	input [DATA_WIDTH-1:0] Data_Weight_63,
	input [DATA_WIDTH-1:0] Data_Weight_64,
	input [DATA_WIDTH-1:0] Data_Weight_65,
	input [DATA_WIDTH-1:0] Data_Weight_66,
	input [DATA_WIDTH-1:0] Data_Weight_67,
	input [DATA_WIDTH-1:0] Data_Weight_68,
	input [DATA_WIDTH-1:0] Data_Weight_69,
	input [DATA_WIDTH-1:0] Data_Weight_70,
	input [DATA_WIDTH-1:0] Data_Weight_71,
	input [DATA_WIDTH-1:0] Data_Weight_72,
	input [DATA_WIDTH-1:0] Data_Weight_73,
	input [DATA_WIDTH-1:0] Data_Weight_74,
	input [DATA_WIDTH-1:0] Data_Weight_75,
	input [DATA_WIDTH-1:0] Data_Weight_76,
	input [DATA_WIDTH-1:0] Data_Weight_77,
	input [DATA_WIDTH-1:0] Data_Weight_78,
	input [DATA_WIDTH-1:0] Data_Weight_79,
	input [DATA_WIDTH-1:0] Data_Weight_80,
	output [DATA_WIDTH-1:0] Data_out_FC_1,
	output [DATA_WIDTH-1:0] Data_out_FC_2,
	output [DATA_WIDTH-1:0] Data_out_FC_3,
	output [DATA_WIDTH-1:0] Data_out_FC_4,
	output [DATA_WIDTH-1:0] Data_out_FC_5,
	output [DATA_WIDTH-1:0] Data_out_FC_6,
	output [DATA_WIDTH-1:0] Data_out_FC_7,
	output [DATA_WIDTH-1:0] Data_out_FC_8,
	output [DATA_WIDTH-1:0] Data_out_FC_9,
	output [DATA_WIDTH-1:0] Data_out_FC_10,
	output [DATA_WIDTH-1:0] Data_out_FC_11,
	output [DATA_WIDTH-1:0] Data_out_FC_12,
	output [DATA_WIDTH-1:0] Data_out_FC_13,
	output [DATA_WIDTH-1:0] Data_out_FC_14,
	output [DATA_WIDTH-1:0] Data_out_FC_15,
	output [DATA_WIDTH-1:0] Data_out_FC_16,
	output [DATA_WIDTH-1:0] Data_out_FC_17,
	output [DATA_WIDTH-1:0] Data_out_FC_18,
	output [DATA_WIDTH-1:0] Data_out_FC_19,
	output [DATA_WIDTH-1:0] Data_out_FC_20,
	output [DATA_WIDTH-1:0] Data_out_FC_21,
	output [DATA_WIDTH-1:0] Data_out_FC_22,
	output [DATA_WIDTH-1:0] Data_out_FC_23,
	output [DATA_WIDTH-1:0] Data_out_FC_24,
	output [DATA_WIDTH-1:0] Data_out_FC_25,
	output [DATA_WIDTH-1:0] Data_out_FC_26,
	output [DATA_WIDTH-1:0] Data_out_FC_27,
	output [DATA_WIDTH-1:0] Data_out_FC_28,
	output [DATA_WIDTH-1:0] Data_out_FC_29,
	output [DATA_WIDTH-1:0] Data_out_FC_30,
	output [DATA_WIDTH-1:0] Data_out_FC_31,
	output [DATA_WIDTH-1:0] Data_out_FC_32,
	output [DATA_WIDTH-1:0] Data_out_FC_33,
	output [DATA_WIDTH-1:0] Data_out_FC_34,
	output [DATA_WIDTH-1:0] Data_out_FC_35,
	output [DATA_WIDTH-1:0] Data_out_FC_36,
	output [DATA_WIDTH-1:0] Data_out_FC_37,
	output [DATA_WIDTH-1:0] Data_out_FC_38,
	output [DATA_WIDTH-1:0] Data_out_FC_39,
	output [DATA_WIDTH-1:0] Data_out_FC_40,
	output [DATA_WIDTH-1:0] Data_out_FC_41,
	output [DATA_WIDTH-1:0] Data_out_FC_42,
	output [DATA_WIDTH-1:0] Data_out_FC_43,
	output [DATA_WIDTH-1:0] Data_out_FC_44,
	output [DATA_WIDTH-1:0] Data_out_FC_45,
	output [DATA_WIDTH-1:0] Data_out_FC_46,
	output [DATA_WIDTH-1:0] Data_out_FC_47,
	output [DATA_WIDTH-1:0] Data_out_FC_48,
	output [DATA_WIDTH-1:0] Data_out_FC_49,
	output [DATA_WIDTH-1:0] Data_out_FC_50,
	output [DATA_WIDTH-1:0] Data_out_FC_51,
	output [DATA_WIDTH-1:0] Data_out_FC_52,
	output [DATA_WIDTH-1:0] Data_out_FC_53,
	output [DATA_WIDTH-1:0] Data_out_FC_54,
	output [DATA_WIDTH-1:0] Data_out_FC_55,
	output [DATA_WIDTH-1:0] Data_out_FC_56,
	output [DATA_WIDTH-1:0] Data_out_FC_57,
	output [DATA_WIDTH-1:0] Data_out_FC_58,
	output [DATA_WIDTH-1:0] Data_out_FC_59,
	output [DATA_WIDTH-1:0] Data_out_FC_60,
	output [DATA_WIDTH-1:0] Data_out_FC_61,
	output [DATA_WIDTH-1:0] Data_out_FC_62,
	output [DATA_WIDTH-1:0] Data_out_FC_63,
	output [DATA_WIDTH-1:0] Data_out_FC_64,
	output [DATA_WIDTH-1:0] Data_out_FC_65,
	output [DATA_WIDTH-1:0] Data_out_FC_66,
	output [DATA_WIDTH-1:0] Data_out_FC_67,
	output [DATA_WIDTH-1:0] Data_out_FC_68,
	output [DATA_WIDTH-1:0] Data_out_FC_69,
	output [DATA_WIDTH-1:0] Data_out_FC_70,
	output [DATA_WIDTH-1:0] Data_out_FC_71,
	output [DATA_WIDTH-1:0] Data_out_FC_72,
	output [DATA_WIDTH-1:0] Data_out_FC_73,
	output [DATA_WIDTH-1:0] Data_out_FC_74,
	output [DATA_WIDTH-1:0] Data_out_FC_75,
	output [DATA_WIDTH-1:0] Data_out_FC_76,
	output [DATA_WIDTH-1:0] Data_out_FC_77,
	output [DATA_WIDTH-1:0] Data_out_FC_78,
	output [DATA_WIDTH-1:0] Data_out_FC_79,
	output [DATA_WIDTH-1:0] Data_out_FC_80
	);
	
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M1 (.in1 (Data_in) ,.in2 (Data_Weight_1),.out(Data_out_FC_1));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M2 (.in1 (Data_in) ,.in2 (Data_Weight_2),.out(Data_out_FC_2));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M3 (.in1 (Data_in) ,.in2 (Data_Weight_3),.out(Data_out_FC_3));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M4 (.in1 (Data_in) ,.in2 (Data_Weight_4),.out(Data_out_FC_4));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M5 (.in1 (Data_in) ,.in2 (Data_Weight_5),.out(Data_out_FC_5));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M6 (.in1 (Data_in) ,.in2 (Data_Weight_6),.out(Data_out_FC_6));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M7 (.in1 (Data_in) ,.in2 (Data_Weight_7),.out(Data_out_FC_7));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M8 (.in1 (Data_in) ,.in2 (Data_Weight_8),.out(Data_out_FC_8));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M9 (.in1 (Data_in) ,.in2 (Data_Weight_9),.out(Data_out_FC_9));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M10 (.in1 (Data_in) ,.in2 (Data_Weight_10),.out(Data_out_FC_10));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M11 (.in1 (Data_in) ,.in2 (Data_Weight_11),.out(Data_out_FC_11));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M12 (.in1 (Data_in) ,.in2 (Data_Weight_12),.out(Data_out_FC_12));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M13 (.in1 (Data_in) ,.in2 (Data_Weight_13),.out(Data_out_FC_13));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M14 (.in1 (Data_in) ,.in2 (Data_Weight_14),.out(Data_out_FC_14));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M15 (.in1 (Data_in) ,.in2 (Data_Weight_15),.out(Data_out_FC_15));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M16 (.in1 (Data_in) ,.in2 (Data_Weight_16),.out(Data_out_FC_16));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M17 (.in1 (Data_in) ,.in2 (Data_Weight_17),.out(Data_out_FC_17));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M18 (.in1 (Data_in) ,.in2 (Data_Weight_18),.out(Data_out_FC_18));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M19 (.in1 (Data_in) ,.in2 (Data_Weight_19),.out(Data_out_FC_19));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M20 (.in1 (Data_in) ,.in2 (Data_Weight_20),.out(Data_out_FC_20));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M21 (.in1 (Data_in) ,.in2 (Data_Weight_21),.out(Data_out_FC_21));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M22 (.in1 (Data_in) ,.in2 (Data_Weight_22),.out(Data_out_FC_22));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M23 (.in1 (Data_in) ,.in2 (Data_Weight_23),.out(Data_out_FC_23));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M24 (.in1 (Data_in) ,.in2 (Data_Weight_24),.out(Data_out_FC_24));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M25 (.in1 (Data_in) ,.in2 (Data_Weight_25),.out(Data_out_FC_25));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M26 (.in1 (Data_in) ,.in2 (Data_Weight_26),.out(Data_out_FC_26));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M27 (.in1 (Data_in) ,.in2 (Data_Weight_27),.out(Data_out_FC_27));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M28 (.in1 (Data_in) ,.in2 (Data_Weight_28),.out(Data_out_FC_28));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M29 (.in1 (Data_in) ,.in2 (Data_Weight_29),.out(Data_out_FC_29));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M30 (.in1 (Data_in) ,.in2 (Data_Weight_30),.out(Data_out_FC_30));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M31 (.in1 (Data_in) ,.in2 (Data_Weight_31),.out(Data_out_FC_31));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M32 (.in1 (Data_in) ,.in2 (Data_Weight_32),.out(Data_out_FC_32));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M33 (.in1 (Data_in) ,.in2 (Data_Weight_33),.out(Data_out_FC_33));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M34 (.in1 (Data_in) ,.in2 (Data_Weight_34),.out(Data_out_FC_34));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M35 (.in1 (Data_in) ,.in2 (Data_Weight_35),.out(Data_out_FC_35));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M36 (.in1 (Data_in) ,.in2 (Data_Weight_36),.out(Data_out_FC_36));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M37 (.in1 (Data_in) ,.in2 (Data_Weight_37),.out(Data_out_FC_37));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M38 (.in1 (Data_in) ,.in2 (Data_Weight_38),.out(Data_out_FC_38));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M39 (.in1 (Data_in) ,.in2 (Data_Weight_39),.out(Data_out_FC_39));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M40 (.in1 (Data_in) ,.in2 (Data_Weight_40),.out(Data_out_FC_40));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M41 (.in1 (Data_in) ,.in2 (Data_Weight_41),.out(Data_out_FC_41));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M42 (.in1 (Data_in) ,.in2 (Data_Weight_42),.out(Data_out_FC_42));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M43 (.in1 (Data_in) ,.in2 (Data_Weight_43),.out(Data_out_FC_43));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M44 (.in1 (Data_in) ,.in2 (Data_Weight_44),.out(Data_out_FC_44));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M45 (.in1 (Data_in) ,.in2 (Data_Weight_45),.out(Data_out_FC_45));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M46 (.in1 (Data_in) ,.in2 (Data_Weight_46),.out(Data_out_FC_46));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M47 (.in1 (Data_in) ,.in2 (Data_Weight_47),.out(Data_out_FC_47));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M48 (.in1 (Data_in) ,.in2 (Data_Weight_48),.out(Data_out_FC_48));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M49 (.in1 (Data_in) ,.in2 (Data_Weight_49),.out(Data_out_FC_49));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M50 (.in1 (Data_in) ,.in2 (Data_Weight_50),.out(Data_out_FC_50));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M51 (.in1 (Data_in) ,.in2 (Data_Weight_51),.out(Data_out_FC_51));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M52 (.in1 (Data_in) ,.in2 (Data_Weight_52),.out(Data_out_FC_52));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M53 (.in1 (Data_in) ,.in2 (Data_Weight_53),.out(Data_out_FC_53));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M54 (.in1 (Data_in) ,.in2 (Data_Weight_54),.out(Data_out_FC_54));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M55 (.in1 (Data_in) ,.in2 (Data_Weight_55),.out(Data_out_FC_55));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M56 (.in1 (Data_in) ,.in2 (Data_Weight_56),.out(Data_out_FC_56));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M57 (.in1 (Data_in) ,.in2 (Data_Weight_57),.out(Data_out_FC_57));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M58 (.in1 (Data_in) ,.in2 (Data_Weight_58),.out(Data_out_FC_58));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M59 (.in1 (Data_in) ,.in2 (Data_Weight_59),.out(Data_out_FC_59));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M60 (.in1 (Data_in) ,.in2 (Data_Weight_60),.out(Data_out_FC_60));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M61 (.in1 (Data_in) ,.in2 (Data_Weight_61),.out(Data_out_FC_61));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M62 (.in1 (Data_in) ,.in2 (Data_Weight_62),.out(Data_out_FC_62));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M63 (.in1 (Data_in) ,.in2 (Data_Weight_63),.out(Data_out_FC_63));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M64 (.in1 (Data_in) ,.in2 (Data_Weight_64),.out(Data_out_FC_64));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M65 (.in1 (Data_in) ,.in2 (Data_Weight_65),.out(Data_out_FC_65));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M66 (.in1 (Data_in) ,.in2 (Data_Weight_66),.out(Data_out_FC_66));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M67 (.in1 (Data_in) ,.in2 (Data_Weight_67),.out(Data_out_FC_67));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M68 (.in1 (Data_in) ,.in2 (Data_Weight_68),.out(Data_out_FC_68));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M69 (.in1 (Data_in) ,.in2 (Data_Weight_69),.out(Data_out_FC_69));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M70 (.in1 (Data_in) ,.in2 (Data_Weight_70),.out(Data_out_FC_70));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M71 (.in1 (Data_in) ,.in2 (Data_Weight_71),.out(Data_out_FC_71));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M72 (.in1 (Data_in) ,.in2 (Data_Weight_72),.out(Data_out_FC_72));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M73 (.in1 (Data_in) ,.in2 (Data_Weight_73),.out(Data_out_FC_73));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M74 (.in1 (Data_in) ,.in2 (Data_Weight_74),.out(Data_out_FC_74));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M75 (.in1 (Data_in) ,.in2 (Data_Weight_75),.out(Data_out_FC_75));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M76 (.in1 (Data_in) ,.in2 (Data_Weight_76),.out(Data_out_FC_76));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M77 (.in1 (Data_in) ,.in2 (Data_Weight_77),.out(Data_out_FC_77));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M78 (.in1 (Data_in) ,.in2 (Data_Weight_78),.out(Data_out_FC_78));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M79 (.in1 (Data_in) ,.in2 (Data_Weight_79),.out(Data_out_FC_79));
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M80 (.in1 (Data_in) ,.in2 (Data_Weight_80),.out(Data_out_FC_80));
	endmodule
