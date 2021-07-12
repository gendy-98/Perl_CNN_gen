`timescale 1ns / 1ps


module 
 top_fc2_W10 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE              = 28,
	IFM_DEPTH				= 84,
	//////////////////////////////////////
    ADDRESS_BITS        = 16,
    ARITH_TYPE          = 1,
    ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
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
    output ifm_enable_write_next,
    
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


	FC2_CU #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) 
    CU
    (
    .clk(clk),
    .reset(reset),
    //////////////////////////////////////////////
    .wm_addr_sel(wm_addr_sel),
    .wm_address_read_current(wm_address_read_current),  
    .wm_enable_read(wm_enable_read),
    .bias_sel(bias_sel),
    /////////////////////////////////////////
    .enable_read_current(enable_read_current),
    .start_from_previous(start_from_previous),
    .sel_ifm (sel_ifm),
    .end_to_previous (end_to_previous),
    .fc_output_ready (fc_output_ready) , 
    .enable_write_next (ifm_enable_write_next),   
    .output_ready (output_ready)
   );

	FC1_DP #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) 
    DP
	(
    .clk(clk),
	.reset(reset),	
	.riscv_data(riscv_data),
	.riscv_address(riscv_address),
	/////////////////////////////////
    .wm_addr_sel(wm_addr_sel),
    .wm_address_read_current(wm_address_read_current),  
    .wm_enable_read(wm_enable_read),
    .wm_enable_write(wm_enable_write),
    .bm_enable_write(bm_enable_write),
    ///////////////////////////////////
	.fc_output_ready (fc_output_ready),
    .enable_read_current(enable_read_current),
	
	/////////////////////////////////////
   
    .Data_in_1(Data_in_1), 
    .Data_in_2(Data_in_2), 
    .Data_in_3(Data_in_3), 
    .Data_in_4(Data_in_4), 
    .Data_in_5(Data_in_5), 
    .Data_in_6(Data_in_6), 
    .Data_in_7(Data_in_7), 
    .Data_in_8(Data_in_8), 
    .Data_in_9(Data_in_9), 
    .Data_in_10(Data_in_10), 
    .Data_in_11(Data_in_11), 
    .Data_in_12(Data_in_12), 
    .Data_in_13(Data_in_13), 
    .Data_in_14(Data_in_14), 
    .Data_in_15(Data_in_15), 
    .Data_in_16(Data_in_16), 
    .Data_in_17(Data_in_17), 
    .Data_in_18(Data_in_18), 
    .Data_in_19(Data_in_19), 
    .Data_in_20(Data_in_20), 
    .Data_in_21(Data_in_21), 
    .Data_in_22(Data_in_22), 
    .Data_in_23(Data_in_23), 
    .Data_in_24(Data_in_24), 
    .Data_in_25(Data_in_25), 
    .Data_in_26(Data_in_26), 
    .Data_in_27(Data_in_27), 
    .Data_in_28(Data_in_28), 
    .Data_in_29(Data_in_29), 
    .Data_in_30(Data_in_30), 
    .Data_in_31(Data_in_31), 
    .Data_in_32(Data_in_32), 
    .Data_in_33(Data_in_33), 
    .Data_in_34(Data_in_34), 
    .Data_in_35(Data_in_35), 
    .Data_in_36(Data_in_36), 
    .Data_in_37(Data_in_37), 
    .Data_in_38(Data_in_38), 
    .Data_in_39(Data_in_39), 
    .Data_in_40(Data_in_40), 
    .Data_in_41(Data_in_41), 
    .Data_in_42(Data_in_42), 
    .Data_in_43(Data_in_43), 
    .Data_in_44(Data_in_44), 
    .Data_in_45(Data_in_45), 
    .Data_in_46(Data_in_46), 
    .Data_in_47(Data_in_47), 
    .Data_in_48(Data_in_48), 
    .Data_in_49(Data_in_49), 
    .Data_in_50(Data_in_50), 
    .Data_in_51(Data_in_51), 
    .Data_in_52(Data_in_52), 
    .Data_in_53(Data_in_53), 
    .Data_in_54(Data_in_54), 
    .Data_in_55(Data_in_55), 
    .Data_in_56(Data_in_56), 
    .Data_in_57(Data_in_57), 
    .Data_in_58(Data_in_58), 
    .Data_in_59(Data_in_59), 
    .Data_in_60(Data_in_60), 
    .Data_in_61(Data_in_61), 
    .Data_in_62(Data_in_62), 
    .Data_in_63(Data_in_63), 
    .Data_in_64(Data_in_64), 
    .Data_in_65(Data_in_65), 
    .Data_in_66(Data_in_66), 
    .Data_in_67(Data_in_67), 
    .Data_in_68(Data_in_68), 
    .Data_in_69(Data_in_69), 
    .Data_in_70(Data_in_70), 
    .Data_in_71(Data_in_71), 
    .Data_in_72(Data_in_72), 
    .Data_in_73(Data_in_73), 
    .Data_in_74(Data_in_74), 
    .Data_in_75(Data_in_75), 
    .Data_in_76(Data_in_76), 
    .Data_in_77(Data_in_77), 
    .Data_in_78(Data_in_78), 
    .Data_in_79(Data_in_79), 
    .Data_in_80(Data_in_80), 
    .Data_in_81(Data_in_81), 
    .Data_in_82(Data_in_82), 
    .Data_in_83(Data_in_83), 
    .Data_in_84(Data_in_84), 
    .reg_out_FC_1(reg_out_FC_1) , 
    .reg_out_FC_2(reg_out_FC_2) , 
    .reg_out_FC_3(reg_out_FC_3) , 
    .reg_out_FC_4(reg_out_FC_4) , 
    .reg_out_FC_5(reg_out_FC_5) , 
    .reg_out_FC_6(reg_out_FC_6) , 
    .reg_out_FC_7(reg_out_FC_7) , 
    .reg_out_FC_8(reg_out_FC_8) , 
    .reg_out_FC_9(reg_out_FC_9) , 
    .reg_out_FC_10(reg_out_FC_10) , 
    .data_bias_1  (data_bias_1 ),
    .data_bias_2  (data_bias_2 ),
    .data_bias_3  (data_bias_3 ),
    .data_bias_4  (data_bias_4 ),
    .data_bias_5  (data_bias_5 ),
    .data_bias_6  (data_bias_6 ),
    .data_bias_7  (data_bias_7 ),
    .data_bias_8  (data_bias_8 ),
    .data_bias_9  (data_bias_9 ),
    .data_bias_10  (data_bias_10 ),
    .sel_ifm (sel_ifm)
	);
endmodule
