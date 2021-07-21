`timescale 1ns / 1ps


module 
 top_fcB_2 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE              = 32,
	IFM_DEPTH				= 100,
	//////////////////////////////////////
    ADDRESS_BITS        = 15,
    ARITH_TYPE          = 0,
    ADDRESS_SIZE_WM        = $clog2(IFM_DEPTH),
    NUMBER_OF_WM        = 10

	)(
	input clk,
	input reset,
    /////////////////////////////////////////////////////
    input [DATA_WIDTH-1:0]   riscv_data,
	input [ADDRESS_BITS-1:0] riscv_address,
	/////////////////////////////////////////////////////
	input [NUMBER_OF_WM-1:0] wm_enable_write,
	input  bm_enable_write,
    /////////////////////////////////////////////////////	 
    input start_from_previous,
    output end_to_previous,
    output bias_sel,
    output enable_write_next,
    
    ////////////////////////////////////////// for next  
    input [DATA_WIDTH - 1 : 0] Data_in_1 ,
    input [DATA_WIDTH - 1 : 0] Data_in_2 ,
    input [DATA_WIDTH - 1 : 0] Data_in_3 ,
    input [DATA_WIDTH - 1 : 0] Data_in_4 ,
    input [DATA_WIDTH - 1 : 0] Data_in_5 ,
    input [DATA_WIDTH - 1 : 0] Data_in_6 ,
    input [DATA_WIDTH - 1 : 0] Data_in_7 ,
    input [DATA_WIDTH - 1 : 0] Data_in_8 ,
    input [DATA_WIDTH - 1 : 0] Data_in_9 ,
    input [DATA_WIDTH - 1 : 0] Data_in_10 ,
    input [DATA_WIDTH - 1 : 0] Data_in_11 ,
    input [DATA_WIDTH - 1 : 0] Data_in_12 ,
    input [DATA_WIDTH - 1 : 0] Data_in_13 ,
    input [DATA_WIDTH - 1 : 0] Data_in_14 ,
    input [DATA_WIDTH - 1 : 0] Data_in_15 ,
    input [DATA_WIDTH - 1 : 0] Data_in_16 ,
    input [DATA_WIDTH - 1 : 0] Data_in_17 ,
    input [DATA_WIDTH - 1 : 0] Data_in_18 ,
    input [DATA_WIDTH - 1 : 0] Data_in_19 ,
    input [DATA_WIDTH - 1 : 0] Data_in_20 ,
    input [DATA_WIDTH - 1 : 0] Data_in_21 ,
    input [DATA_WIDTH - 1 : 0] Data_in_22 ,
    input [DATA_WIDTH - 1 : 0] Data_in_23 ,
    input [DATA_WIDTH - 1 : 0] Data_in_24 ,
    input [DATA_WIDTH - 1 : 0] Data_in_25 ,
    input [DATA_WIDTH - 1 : 0] Data_in_26 ,
    input [DATA_WIDTH - 1 : 0] Data_in_27 ,
    input [DATA_WIDTH - 1 : 0] Data_in_28 ,
    input [DATA_WIDTH - 1 : 0] Data_in_29 ,
    input [DATA_WIDTH - 1 : 0] Data_in_30 ,
    input [DATA_WIDTH - 1 : 0] Data_in_31 ,
    input [DATA_WIDTH - 1 : 0] Data_in_32 ,
    input [DATA_WIDTH - 1 : 0] Data_in_33 ,
    input [DATA_WIDTH - 1 : 0] Data_in_34 ,
    input [DATA_WIDTH - 1 : 0] Data_in_35 ,
    input [DATA_WIDTH - 1 : 0] Data_in_36 ,
    input [DATA_WIDTH - 1 : 0] Data_in_37 ,
    input [DATA_WIDTH - 1 : 0] Data_in_38 ,
    input [DATA_WIDTH - 1 : 0] Data_in_39 ,
    input [DATA_WIDTH - 1 : 0] Data_in_40 ,
    input [DATA_WIDTH - 1 : 0] Data_in_41 ,
    input [DATA_WIDTH - 1 : 0] Data_in_42 ,
    input [DATA_WIDTH - 1 : 0] Data_in_43 ,
    input [DATA_WIDTH - 1 : 0] Data_in_44 ,
    input [DATA_WIDTH - 1 : 0] Data_in_45 ,
    input [DATA_WIDTH - 1 : 0] Data_in_46 ,
    input [DATA_WIDTH - 1 : 0] Data_in_47 ,
    input [DATA_WIDTH - 1 : 0] Data_in_48 ,
    input [DATA_WIDTH - 1 : 0] Data_in_49 ,
    input [DATA_WIDTH - 1 : 0] Data_in_50 ,
    input [DATA_WIDTH - 1 : 0] Data_in_51 ,
    input [DATA_WIDTH - 1 : 0] Data_in_52 ,
    input [DATA_WIDTH - 1 : 0] Data_in_53 ,
    input [DATA_WIDTH - 1 : 0] Data_in_54 ,
    input [DATA_WIDTH - 1 : 0] Data_in_55 ,
    input [DATA_WIDTH - 1 : 0] Data_in_56 ,
    input [DATA_WIDTH - 1 : 0] Data_in_57 ,
    input [DATA_WIDTH - 1 : 0] Data_in_58 ,
    input [DATA_WIDTH - 1 : 0] Data_in_59 ,
    input [DATA_WIDTH - 1 : 0] Data_in_60 ,
    input [DATA_WIDTH - 1 : 0] Data_in_61 ,
    input [DATA_WIDTH - 1 : 0] Data_in_62 ,
    input [DATA_WIDTH - 1 : 0] Data_in_63 ,
    input [DATA_WIDTH - 1 : 0] Data_in_64 ,
    input [DATA_WIDTH - 1 : 0] Data_in_65 ,
    input [DATA_WIDTH - 1 : 0] Data_in_66 ,
    input [DATA_WIDTH - 1 : 0] Data_in_67 ,
    input [DATA_WIDTH - 1 : 0] Data_in_68 ,
    input [DATA_WIDTH - 1 : 0] Data_in_69 ,
    input [DATA_WIDTH - 1 : 0] Data_in_70 ,
    input [DATA_WIDTH - 1 : 0] Data_in_71 ,
    input [DATA_WIDTH - 1 : 0] Data_in_72 ,
    input [DATA_WIDTH - 1 : 0] Data_in_73 ,
    input [DATA_WIDTH - 1 : 0] Data_in_74 ,
    input [DATA_WIDTH - 1 : 0] Data_in_75 ,
    input [DATA_WIDTH - 1 : 0] Data_in_76 ,
    input [DATA_WIDTH - 1 : 0] Data_in_77 ,
    input [DATA_WIDTH - 1 : 0] Data_in_78 ,
    input [DATA_WIDTH - 1 : 0] Data_in_79 ,
    input [DATA_WIDTH - 1 : 0] Data_in_80 ,
    input [DATA_WIDTH - 1 : 0] Data_in_81 ,
    input [DATA_WIDTH - 1 : 0] Data_in_82 ,
    input [DATA_WIDTH - 1 : 0] Data_in_83 ,
    input [DATA_WIDTH - 1 : 0] Data_in_84 ,
    input [DATA_WIDTH - 1 : 0] Data_in_85 ,
    input [DATA_WIDTH - 1 : 0] Data_in_86 ,
    input [DATA_WIDTH - 1 : 0] Data_in_87 ,
    input [DATA_WIDTH - 1 : 0] Data_in_88 ,
    input [DATA_WIDTH - 1 : 0] Data_in_89 ,
    input [DATA_WIDTH - 1 : 0] Data_in_90 ,
    input [DATA_WIDTH - 1 : 0] Data_in_91 ,
    input [DATA_WIDTH - 1 : 0] Data_in_92 ,
    input [DATA_WIDTH - 1 : 0] Data_in_93 ,
    input [DATA_WIDTH - 1 : 0] Data_in_94 ,
    input [DATA_WIDTH - 1 : 0] Data_in_95 ,
    input [DATA_WIDTH - 1 : 0] Data_in_96 ,
    input [DATA_WIDTH - 1 : 0] Data_in_97 ,
    input [DATA_WIDTH - 1 : 0] Data_in_98 ,
    input [DATA_WIDTH - 1 : 0] Data_in_99 ,
    input [DATA_WIDTH - 1 : 0] Data_in_100 ,
    output [DATA_WIDTH-1:0]   reg_out_FC_1 ,
    output [DATA_WIDTH-1:0]   reg_out_FC_2 ,
    output [DATA_WIDTH-1:0]   reg_out_FC_3 ,
    output [DATA_WIDTH-1:0]   reg_out_FC_4 ,
    output [DATA_WIDTH-1:0]   reg_out_FC_5 ,
    output [DATA_WIDTH-1:0]   reg_out_FC_6 ,
    output [DATA_WIDTH-1:0]   reg_out_FC_7 ,
    output [DATA_WIDTH-1:0]   reg_out_FC_8 ,
    output [DATA_WIDTH-1:0]   reg_out_FC_9 ,
    output [DATA_WIDTH-1:0]   reg_out_FC_10 ,
    output [DATA_WIDTH-1:0]   data_bias_1 ,
    output [DATA_WIDTH-1:0]   data_bias_2 ,
    output [DATA_WIDTH-1:0]   data_bias_3 ,
    output [DATA_WIDTH-1:0]   data_bias_4 ,
    output [DATA_WIDTH-1:0]   data_bias_5 ,
    output [DATA_WIDTH-1:0]   data_bias_6 ,
    output [DATA_WIDTH-1:0]   data_bias_7 ,
    output [DATA_WIDTH-1:0]   data_bias_8 ,
    output [DATA_WIDTH-1:0]   data_bias_9 ,
    output [DATA_WIDTH-1:0]   data_bias_10 ,
    output output_ready 
	);

    wire wm_addr_sel;
    wire enable_read_current;  
    wire [ADDRESS_SIZE_WM-1:0] wm_address_read_current;
    wire wm_enable_read;
    wire [ ADDRESS_SIZE_WM-1 :  0 ] sel_ifm;
    wire fc_output_ready;

