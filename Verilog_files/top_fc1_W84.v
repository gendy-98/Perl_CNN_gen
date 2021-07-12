`timescale 1ns / 1ps


module 
 top_fc1_W84 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE              = 28,
	IFM_DEPTH				= 3,
	//////////////////////////////////////
    ADDRESS_BITS        = 16,
    ARITH_TYPE          = 1,
    ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
    NUMBER_OF_WM        = 84

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
    input [DATA_WIDTH-1:0] data_in_from_previous,	 
	input  start_from_previous,  
    output end_to_previous,
    output enable_read_current,
    output enable_write_next,
    output start_to_next,
    output bias_sel,
    
    ////////////////////////////////////////// for next  
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   reg_out_FC_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
    output [DATA_WIDTH-1:0]   data_bias_%j ,
	input  end_from_next
	);

    wire wm_enable_read;
    wire wm_addr_sel;
    wire [ADDRESS_SIZE_WM-1:0] wm_address_read_current;  
    
    wire fc_output_ready;


	FC1_DP #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) 
    DP
	(
    .clk(clk),
	.reset(reset),	
	.riscv_data(riscv_data),
	.riscv_address(riscv_address),
	/////////////////////////////////
    .wm_addr_sel (wm_addr_sel) , 
    .wm_enable_read (wm_enable_read),
    .wm_enable_write (wm_enable_write),
    .wm_address_read_current (wm_address_read_current),
    ///////////////////////////////////
    .bm_enable_write (bm_enable_write),
    ///////////////////////////////////
	.data_in_from_previous(data_in_from_previous),
	
	/////////////////////////////////////
   
    .reg_out_FC_1(reg_out_FC_1) , 

}


for(1 = 1; 1 <= 84; 1 = 1 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_1  (data_bias_1 ),
    .reg_out_FC_2(reg_out_FC_2) , 

}


for(2 = 1; 2 <= 84; 2 = 2 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_2  (data_bias_2 ),
    .reg_out_FC_3(reg_out_FC_3) , 

}


for(3 = 1; 3 <= 84; 3 = 3 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_3  (data_bias_3 ),
    .reg_out_FC_4(reg_out_FC_4) , 

}


for(4 = 1; 4 <= 84; 4 = 4 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_4  (data_bias_4 ),
    .reg_out_FC_5(reg_out_FC_5) , 

}


for(5 = 1; 5 <= 84; 5 = 5 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_5  (data_bias_5 ),
    .reg_out_FC_6(reg_out_FC_6) , 

}


for(6 = 1; 6 <= 84; 6 = 6 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_6  (data_bias_6 ),
    .reg_out_FC_7(reg_out_FC_7) , 

}


for(7 = 1; 7 <= 84; 7 = 7 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_7  (data_bias_7 ),
    .reg_out_FC_8(reg_out_FC_8) , 

}


for(8 = 1; 8 <= 84; 8 = 8 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_8  (data_bias_8 ),
    .reg_out_FC_9(reg_out_FC_9) , 

}


for(9 = 1; 9 <= 84; 9 = 9 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_9  (data_bias_9 ),
    .reg_out_FC_10(reg_out_FC_10) , 

}


for(10 = 1; 10 <= 84; 10 = 10 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_10  (data_bias_10 ),
    .reg_out_FC_11(reg_out_FC_11) , 

}


for(11 = 1; 11 <= 84; 11 = 11 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_11  (data_bias_11 ),
    .reg_out_FC_12(reg_out_FC_12) , 

}


for(12 = 1; 12 <= 84; 12 = 12 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_12  (data_bias_12 ),
    .reg_out_FC_13(reg_out_FC_13) , 

}


for(13 = 1; 13 <= 84; 13 = 13 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_13  (data_bias_13 ),
    .reg_out_FC_14(reg_out_FC_14) , 

}


for(14 = 1; 14 <= 84; 14 = 14 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_14  (data_bias_14 ),
    .reg_out_FC_15(reg_out_FC_15) , 

}


for(15 = 1; 15 <= 84; 15 = 15 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_15  (data_bias_15 ),
    .reg_out_FC_16(reg_out_FC_16) , 

}


for(16 = 1; 16 <= 84; 16 = 16 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_16  (data_bias_16 ),
    .reg_out_FC_17(reg_out_FC_17) , 

}


for(17 = 1; 17 <= 84; 17 = 17 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_17  (data_bias_17 ),
    .reg_out_FC_18(reg_out_FC_18) , 

}


for(18 = 1; 18 <= 84; 18 = 18 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_18  (data_bias_18 ),
    .reg_out_FC_19(reg_out_FC_19) , 

}


for(19 = 1; 19 <= 84; 19 = 19 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_19  (data_bias_19 ),
    .reg_out_FC_20(reg_out_FC_20) , 

}


for(20 = 1; 20 <= 84; 20 = 20 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_20  (data_bias_20 ),
    .reg_out_FC_21(reg_out_FC_21) , 

}


for(21 = 1; 21 <= 84; 21 = 21 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_21  (data_bias_21 ),
    .reg_out_FC_22(reg_out_FC_22) , 

}


for(22 = 1; 22 <= 84; 22 = 22 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_22  (data_bias_22 ),
    .reg_out_FC_23(reg_out_FC_23) , 

}


for(23 = 1; 23 <= 84; 23 = 23 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_23  (data_bias_23 ),
    .reg_out_FC_24(reg_out_FC_24) , 

}


for(24 = 1; 24 <= 84; 24 = 24 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_24  (data_bias_24 ),
    .reg_out_FC_25(reg_out_FC_25) , 

}


for(25 = 1; 25 <= 84; 25 = 25 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_25  (data_bias_25 ),
    .reg_out_FC_26(reg_out_FC_26) , 

}


for(26 = 1; 26 <= 84; 26 = 26 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_26  (data_bias_26 ),
    .reg_out_FC_27(reg_out_FC_27) , 

}


for(27 = 1; 27 <= 84; 27 = 27 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_27  (data_bias_27 ),
    .reg_out_FC_28(reg_out_FC_28) , 

}


for(28 = 1; 28 <= 84; 28 = 28 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_28  (data_bias_28 ),
    .reg_out_FC_29(reg_out_FC_29) , 

}


for(29 = 1; 29 <= 84; 29 = 29 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_29  (data_bias_29 ),
    .reg_out_FC_30(reg_out_FC_30) , 

}


for(30 = 1; 30 <= 84; 30 = 30 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_30  (data_bias_30 ),
    .reg_out_FC_31(reg_out_FC_31) , 

}


for(31 = 1; 31 <= 84; 31 = 31 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_31  (data_bias_31 ),
    .reg_out_FC_32(reg_out_FC_32) , 

}


for(32 = 1; 32 <= 84; 32 = 32 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_32  (data_bias_32 ),
    .reg_out_FC_33(reg_out_FC_33) , 

}


for(33 = 1; 33 <= 84; 33 = 33 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_33  (data_bias_33 ),
    .reg_out_FC_34(reg_out_FC_34) , 

}


for(34 = 1; 34 <= 84; 34 = 34 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_34  (data_bias_34 ),
    .reg_out_FC_35(reg_out_FC_35) , 

}


for(35 = 1; 35 <= 84; 35 = 35 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_35  (data_bias_35 ),
    .reg_out_FC_36(reg_out_FC_36) , 

}


for(36 = 1; 36 <= 84; 36 = 36 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_36  (data_bias_36 ),
    .reg_out_FC_37(reg_out_FC_37) , 

}


for(37 = 1; 37 <= 84; 37 = 37 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_37  (data_bias_37 ),
    .reg_out_FC_38(reg_out_FC_38) , 

}


for(38 = 1; 38 <= 84; 38 = 38 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_38  (data_bias_38 ),
    .reg_out_FC_39(reg_out_FC_39) , 

}


for(39 = 1; 39 <= 84; 39 = 39 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_39  (data_bias_39 ),
    .reg_out_FC_40(reg_out_FC_40) , 

}


for(40 = 1; 40 <= 84; 40 = 40 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_40  (data_bias_40 ),
    .reg_out_FC_41(reg_out_FC_41) , 

}


for(41 = 1; 41 <= 84; 41 = 41 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_41  (data_bias_41 ),
    .reg_out_FC_42(reg_out_FC_42) , 

}


for(42 = 1; 42 <= 84; 42 = 42 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_42  (data_bias_42 ),
    .reg_out_FC_43(reg_out_FC_43) , 

}


for(43 = 1; 43 <= 84; 43 = 43 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_43  (data_bias_43 ),
    .reg_out_FC_44(reg_out_FC_44) , 

}


for(44 = 1; 44 <= 84; 44 = 44 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_44  (data_bias_44 ),
    .reg_out_FC_45(reg_out_FC_45) , 

}


for(45 = 1; 45 <= 84; 45 = 45 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_45  (data_bias_45 ),
    .reg_out_FC_46(reg_out_FC_46) , 

}


for(46 = 1; 46 <= 84; 46 = 46 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_46  (data_bias_46 ),
    .reg_out_FC_47(reg_out_FC_47) , 

}


for(47 = 1; 47 <= 84; 47 = 47 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_47  (data_bias_47 ),
    .reg_out_FC_48(reg_out_FC_48) , 

}


for(48 = 1; 48 <= 84; 48 = 48 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_48  (data_bias_48 ),
    .reg_out_FC_49(reg_out_FC_49) , 

}


for(49 = 1; 49 <= 84; 49 = 49 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_49  (data_bias_49 ),
    .reg_out_FC_50(reg_out_FC_50) , 

}


for(50 = 1; 50 <= 84; 50 = 50 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_50  (data_bias_50 ),
    .reg_out_FC_51(reg_out_FC_51) , 

}


for(51 = 1; 51 <= 84; 51 = 51 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_51  (data_bias_51 ),
    .reg_out_FC_52(reg_out_FC_52) , 

}


for(52 = 1; 52 <= 84; 52 = 52 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_52  (data_bias_52 ),
    .reg_out_FC_53(reg_out_FC_53) , 

}


for(53 = 1; 53 <= 84; 53 = 53 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_53  (data_bias_53 ),
    .reg_out_FC_54(reg_out_FC_54) , 

}


for(54 = 1; 54 <= 84; 54 = 54 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_54  (data_bias_54 ),
    .reg_out_FC_55(reg_out_FC_55) , 

}


for(55 = 1; 55 <= 84; 55 = 55 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_55  (data_bias_55 ),
    .reg_out_FC_56(reg_out_FC_56) , 

}


for(56 = 1; 56 <= 84; 56 = 56 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_56  (data_bias_56 ),
    .reg_out_FC_57(reg_out_FC_57) , 

}


for(57 = 1; 57 <= 84; 57 = 57 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_57  (data_bias_57 ),
    .reg_out_FC_58(reg_out_FC_58) , 

}


for(58 = 1; 58 <= 84; 58 = 58 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_58  (data_bias_58 ),
    .reg_out_FC_59(reg_out_FC_59) , 

}


for(59 = 1; 59 <= 84; 59 = 59 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_59  (data_bias_59 ),
    .reg_out_FC_60(reg_out_FC_60) , 

}


for(60 = 1; 60 <= 84; 60 = 60 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_60  (data_bias_60 ),
    .reg_out_FC_61(reg_out_FC_61) , 

}


for(61 = 1; 61 <= 84; 61 = 61 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_61  (data_bias_61 ),
    .reg_out_FC_62(reg_out_FC_62) , 

}


for(62 = 1; 62 <= 84; 62 = 62 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_62  (data_bias_62 ),
    .reg_out_FC_63(reg_out_FC_63) , 

}


for(63 = 1; 63 <= 84; 63 = 63 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_63  (data_bias_63 ),
    .reg_out_FC_64(reg_out_FC_64) , 

}


for(64 = 1; 64 <= 84; 64 = 64 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_64  (data_bias_64 ),
    .reg_out_FC_65(reg_out_FC_65) , 

}


for(65 = 1; 65 <= 84; 65 = 65 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_65  (data_bias_65 ),
    .reg_out_FC_66(reg_out_FC_66) , 

}


for(66 = 1; 66 <= 84; 66 = 66 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_66  (data_bias_66 ),
    .reg_out_FC_67(reg_out_FC_67) , 

}


for(67 = 1; 67 <= 84; 67 = 67 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_67  (data_bias_67 ),
    .reg_out_FC_68(reg_out_FC_68) , 

}


for(68 = 1; 68 <= 84; 68 = 68 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_68  (data_bias_68 ),
    .reg_out_FC_69(reg_out_FC_69) , 

}


for(69 = 1; 69 <= 84; 69 = 69 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_69  (data_bias_69 ),
    .reg_out_FC_70(reg_out_FC_70) , 

}


for(70 = 1; 70 <= 84; 70 = 70 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_70  (data_bias_70 ),
    .reg_out_FC_71(reg_out_FC_71) , 

}


for(71 = 1; 71 <= 84; 71 = 71 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_71  (data_bias_71 ),
    .reg_out_FC_72(reg_out_FC_72) , 

}


for(72 = 1; 72 <= 84; 72 = 72 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_72  (data_bias_72 ),
    .reg_out_FC_73(reg_out_FC_73) , 

}


for(73 = 1; 73 <= 84; 73 = 73 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_73  (data_bias_73 ),
    .reg_out_FC_74(reg_out_FC_74) , 

}


for(74 = 1; 74 <= 84; 74 = 74 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_74  (data_bias_74 ),
    .reg_out_FC_75(reg_out_FC_75) , 

}


for(75 = 1; 75 <= 84; 75 = 75 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_75  (data_bias_75 ),
    .reg_out_FC_76(reg_out_FC_76) , 

}


for(76 = 1; 76 <= 84; 76 = 76 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_76  (data_bias_76 ),
    .reg_out_FC_77(reg_out_FC_77) , 

}


for(77 = 1; 77 <= 84; 77 = 77 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_77  (data_bias_77 ),
    .reg_out_FC_78(reg_out_FC_78) , 

}


for(78 = 1; 78 <= 84; 78 = 78 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_78  (data_bias_78 ),
    .reg_out_FC_79(reg_out_FC_79) , 

}


for(79 = 1; 79 <= 84; 79 = 79 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_79  (data_bias_79 ),
    .reg_out_FC_80(reg_out_FC_80) , 

}


for(80 = 1; 80 <= 84; 80 = 80 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_80  (data_bias_80 ),
    .reg_out_FC_81(reg_out_FC_81) , 

}


for(81 = 1; 81 <= 84; 81 = 81 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_81  (data_bias_81 ),
    .reg_out_FC_82(reg_out_FC_82) , 

}


for(82 = 1; 82 <= 84; 82 = 82 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_82  (data_bias_82 ),
    .reg_out_FC_83(reg_out_FC_83) , 

}


for(83 = 1; 83 <= 84; 83 = 83 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_83  (data_bias_83 ),
    .reg_out_FC_84(reg_out_FC_84) , 

}


for(84 = 1; 84 <= 84; 84 = 84 + 1 ){

	print GLOB(0x7eb350) <<"DONATE";
    .data_bias_84  (data_bias_84 ),
    .fc_output_ready (fc_output_ready)
	);
endmodule
