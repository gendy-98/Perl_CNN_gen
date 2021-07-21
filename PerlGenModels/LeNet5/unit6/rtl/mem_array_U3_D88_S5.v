`timescale 1ns / 1ps


module 
 mem_array_U3_D88_S5 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE              = 5,                                                
    NUMBER_OF_IFM         = 88,
    NUMBER_OF_UNITS       = 3,
    ADDRESS_SIZE_IFM      = $clog2(IFM_SIZE*IFM_SIZE)

	)(
	input clk,
	input [$clog2(30)-1:0] ifm_sel,
	input                        ifm_enable_write_previous,            
	input                        ifm_enable_read_previous, 
	input  [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous,
	input  [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous,	

	input [DATA_WIDTH-1:0] data_in_from_previous1,
	input [DATA_WIDTH-1:0] data_in_from_previous2,
	input [DATA_WIDTH-1:0] data_in_from_previous3,
	output reg [DATA_WIDTH-1:0] data_out_for_previous1,
	output reg [DATA_WIDTH-1:0] data_out_for_previous2,
	output reg [DATA_WIDTH-1:0] data_out_for_previous3,
	input                        ifm_enable_read_A_next,
    input                        ifm_enable_read_B_next,
	input [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next,
	input [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next1,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next1,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next2,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next2,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next3,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next3
	);
	
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem1;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem1;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem2;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem2;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem3;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem3;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem4;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem4;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem5;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem5;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem6;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem6;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem7;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem7;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem8;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem8;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem9;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem9;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem10;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem10;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem11;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem11;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem12;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem12;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem13;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem13;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem14;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem14;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem15;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem15;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem16;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem16;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem17;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem17;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem18;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem18;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem19;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem19;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem20;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem20;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem21;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem21;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem22;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem22;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem23;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem23;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem24;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem24;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem25;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem25;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem26;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem26;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem27;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem27;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem28;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem28;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem29;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem29;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem30;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem30;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem31;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem31;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem32;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem32;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem33;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem33;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem34;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem34;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem35;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem35;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem36;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem36;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem37;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem37;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem38;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem38;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem39;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem39;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem40;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem40;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem41;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem41;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem42;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem42;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem43;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem43;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem44;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem44;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem45;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem45;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem46;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem46;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem47;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem47;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem48;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem48;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem49;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem49;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem50;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem50;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem51;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem51;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem52;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem52;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem53;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem53;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem54;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem54;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem55;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem55;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem56;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem56;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem57;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem57;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem58;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem58;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem59;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem59;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem60;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem60;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem61;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem61;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem62;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem62;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem63;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem63;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem64;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem64;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem65;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem65;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem66;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem66;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem67;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem67;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem68;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem68;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem69;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem69;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem70;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem70;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem71;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem71;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem72;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem72;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem73;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem73;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem74;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem74;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem75;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem75;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem76;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem76;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem77;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem77;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem78;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem78;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem79;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem79;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem80;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem80;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem81;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem81;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem82;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem82;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem83;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem83;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem84;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem84;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem85;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem85;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem86;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem86;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem87;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem87;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem88;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem88;
	
	wire ifm_enable_write_previous_dMuxOut1;
	wire ifm_enable_read_previous_dMuxOut1;
	wire ifm_enable_read_A_next_dMuxOut1;
	wire ifm_enable_read_B_next_dMuxOut1;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut1;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut1;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut1;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut1;
	
	
	wire ifm_enable_write_previous_dMuxOut2;
	wire ifm_enable_read_previous_dMuxOut2;
	wire ifm_enable_read_A_next_dMuxOut2;
	wire ifm_enable_read_B_next_dMuxOut2;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut2;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut2;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut2;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut2;
	
	
	wire ifm_enable_write_previous_dMuxOut3;
	wire ifm_enable_read_previous_dMuxOut3;
	wire ifm_enable_read_A_next_dMuxOut3;
	wire ifm_enable_read_B_next_dMuxOut3;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut3;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut3;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut3;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut3;
	
	
	wire ifm_enable_write_previous_dMuxOut4;
	wire ifm_enable_read_previous_dMuxOut4;
	wire ifm_enable_read_A_next_dMuxOut4;
	wire ifm_enable_read_B_next_dMuxOut4;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut4;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut4;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut4;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut4;
	
	
	wire ifm_enable_write_previous_dMuxOut5;
	wire ifm_enable_read_previous_dMuxOut5;
	wire ifm_enable_read_A_next_dMuxOut5;
	wire ifm_enable_read_B_next_dMuxOut5;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut5;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut5;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut5;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut5;
	
	
	wire ifm_enable_write_previous_dMuxOut6;
	wire ifm_enable_read_previous_dMuxOut6;
	wire ifm_enable_read_A_next_dMuxOut6;
	wire ifm_enable_read_B_next_dMuxOut6;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut6;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut6;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut6;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut6;
	
	
	wire ifm_enable_write_previous_dMuxOut7;
	wire ifm_enable_read_previous_dMuxOut7;
	wire ifm_enable_read_A_next_dMuxOut7;
	wire ifm_enable_read_B_next_dMuxOut7;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut7;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut7;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut7;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut7;
	
	
	wire ifm_enable_write_previous_dMuxOut8;
	wire ifm_enable_read_previous_dMuxOut8;
	wire ifm_enable_read_A_next_dMuxOut8;
	wire ifm_enable_read_B_next_dMuxOut8;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut8;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut8;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut8;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut8;
	
	
	wire ifm_enable_write_previous_dMuxOut9;
	wire ifm_enable_read_previous_dMuxOut9;
	wire ifm_enable_read_A_next_dMuxOut9;
	wire ifm_enable_read_B_next_dMuxOut9;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut9;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut9;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut9;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut9;
	
	
	wire ifm_enable_write_previous_dMuxOut10;
	wire ifm_enable_read_previous_dMuxOut10;
	wire ifm_enable_read_A_next_dMuxOut10;
	wire ifm_enable_read_B_next_dMuxOut10;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut10;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut10;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut10;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut10;
	
	
	wire ifm_enable_write_previous_dMuxOut11;
	wire ifm_enable_read_previous_dMuxOut11;
	wire ifm_enable_read_A_next_dMuxOut11;
	wire ifm_enable_read_B_next_dMuxOut11;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut11;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut11;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut11;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut11;
	
	
	wire ifm_enable_write_previous_dMuxOut12;
	wire ifm_enable_read_previous_dMuxOut12;
	wire ifm_enable_read_A_next_dMuxOut12;
	wire ifm_enable_read_B_next_dMuxOut12;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut12;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut12;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut12;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut12;
	
	
	wire ifm_enable_write_previous_dMuxOut13;
	wire ifm_enable_read_previous_dMuxOut13;
	wire ifm_enable_read_A_next_dMuxOut13;
	wire ifm_enable_read_B_next_dMuxOut13;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut13;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut13;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut13;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut13;
	
	
	wire ifm_enable_write_previous_dMuxOut14;
	wire ifm_enable_read_previous_dMuxOut14;
	wire ifm_enable_read_A_next_dMuxOut14;
	wire ifm_enable_read_B_next_dMuxOut14;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut14;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut14;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut14;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut14;
	
	
	wire ifm_enable_write_previous_dMuxOut15;
	wire ifm_enable_read_previous_dMuxOut15;
	wire ifm_enable_read_A_next_dMuxOut15;
	wire ifm_enable_read_B_next_dMuxOut15;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut15;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut15;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut15;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut15;
	
	
	wire ifm_enable_write_previous_dMuxOut16;
	wire ifm_enable_read_previous_dMuxOut16;
	wire ifm_enable_read_A_next_dMuxOut16;
	wire ifm_enable_read_B_next_dMuxOut16;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut16;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut16;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut16;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut16;
	
	
	wire ifm_enable_write_previous_dMuxOut17;
	wire ifm_enable_read_previous_dMuxOut17;
	wire ifm_enable_read_A_next_dMuxOut17;
	wire ifm_enable_read_B_next_dMuxOut17;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut17;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut17;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut17;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut17;
	
	
	wire ifm_enable_write_previous_dMuxOut18;
	wire ifm_enable_read_previous_dMuxOut18;
	wire ifm_enable_read_A_next_dMuxOut18;
	wire ifm_enable_read_B_next_dMuxOut18;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut18;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut18;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut18;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut18;
	
	
	wire ifm_enable_write_previous_dMuxOut19;
	wire ifm_enable_read_previous_dMuxOut19;
	wire ifm_enable_read_A_next_dMuxOut19;
	wire ifm_enable_read_B_next_dMuxOut19;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut19;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut19;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut19;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut19;
	
	
	wire ifm_enable_write_previous_dMuxOut20;
	wire ifm_enable_read_previous_dMuxOut20;
	wire ifm_enable_read_A_next_dMuxOut20;
	wire ifm_enable_read_B_next_dMuxOut20;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut20;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut20;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut20;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut20;
	
	
	wire ifm_enable_write_previous_dMuxOut21;
	wire ifm_enable_read_previous_dMuxOut21;
	wire ifm_enable_read_A_next_dMuxOut21;
	wire ifm_enable_read_B_next_dMuxOut21;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut21;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut21;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut21;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut21;
	
	
	wire ifm_enable_write_previous_dMuxOut22;
	wire ifm_enable_read_previous_dMuxOut22;
	wire ifm_enable_read_A_next_dMuxOut22;
	wire ifm_enable_read_B_next_dMuxOut22;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut22;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut22;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut22;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut22;
	
	
	wire ifm_enable_write_previous_dMuxOut23;
	wire ifm_enable_read_previous_dMuxOut23;
	wire ifm_enable_read_A_next_dMuxOut23;
	wire ifm_enable_read_B_next_dMuxOut23;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut23;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut23;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut23;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut23;
	
	
	wire ifm_enable_write_previous_dMuxOut24;
	wire ifm_enable_read_previous_dMuxOut24;
	wire ifm_enable_read_A_next_dMuxOut24;
	wire ifm_enable_read_B_next_dMuxOut24;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut24;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut24;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut24;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut24;
	
	
	wire ifm_enable_write_previous_dMuxOut25;
	wire ifm_enable_read_previous_dMuxOut25;
	wire ifm_enable_read_A_next_dMuxOut25;
	wire ifm_enable_read_B_next_dMuxOut25;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut25;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut25;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut25;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut25;
	
	
	wire ifm_enable_write_previous_dMuxOut26;
	wire ifm_enable_read_previous_dMuxOut26;
	wire ifm_enable_read_A_next_dMuxOut26;
	wire ifm_enable_read_B_next_dMuxOut26;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut26;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut26;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut26;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut26;
	
	
	wire ifm_enable_write_previous_dMuxOut27;
	wire ifm_enable_read_previous_dMuxOut27;
	wire ifm_enable_read_A_next_dMuxOut27;
	wire ifm_enable_read_B_next_dMuxOut27;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut27;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut27;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut27;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut27;
	
	
	wire ifm_enable_write_previous_dMuxOut28;
	wire ifm_enable_read_previous_dMuxOut28;
	wire ifm_enable_read_A_next_dMuxOut28;
	wire ifm_enable_read_B_next_dMuxOut28;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut28;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut28;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut28;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut28;
	
	
	wire ifm_enable_write_previous_dMuxOut29;
	wire ifm_enable_read_previous_dMuxOut29;
	wire ifm_enable_read_A_next_dMuxOut29;
	wire ifm_enable_read_B_next_dMuxOut29;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut29;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut29;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut29;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut29;
	
	
	wire ifm_enable_write_previous_dMuxOut30;
	wire ifm_enable_read_previous_dMuxOut30;
	wire ifm_enable_read_A_next_dMuxOut30;
	wire ifm_enable_read_B_next_dMuxOut30;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut30;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut30;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut30;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut30;
	
	demux_1_to_30 d0(
	.din(ifm_enable_write_previous),
	.sel(ifm_sel),
	.dout_1(ifm_enable_write_previous_dMuxOut1),
	.dout_2(ifm_enable_write_previous_dMuxOut2),
	.dout_3(ifm_enable_write_previous_dMuxOut3),
	.dout_4(ifm_enable_write_previous_dMuxOut4),
	.dout_5(ifm_enable_write_previous_dMuxOut5),
	.dout_6(ifm_enable_write_previous_dMuxOut6),
	.dout_7(ifm_enable_write_previous_dMuxOut7),
	.dout_8(ifm_enable_write_previous_dMuxOut8),
	.dout_9(ifm_enable_write_previous_dMuxOut9),
	.dout_10(ifm_enable_write_previous_dMuxOut10),
	.dout_11(ifm_enable_write_previous_dMuxOut11),
	.dout_12(ifm_enable_write_previous_dMuxOut12),
	.dout_13(ifm_enable_write_previous_dMuxOut13),
	.dout_14(ifm_enable_write_previous_dMuxOut14),
	.dout_15(ifm_enable_write_previous_dMuxOut15),
	.dout_16(ifm_enable_write_previous_dMuxOut16),
	.dout_17(ifm_enable_write_previous_dMuxOut17),
	.dout_18(ifm_enable_write_previous_dMuxOut18),
	.dout_19(ifm_enable_write_previous_dMuxOut19),
	.dout_20(ifm_enable_write_previous_dMuxOut20),
	.dout_21(ifm_enable_write_previous_dMuxOut21),
	.dout_22(ifm_enable_write_previous_dMuxOut22),
	.dout_23(ifm_enable_write_previous_dMuxOut23),
	.dout_24(ifm_enable_write_previous_dMuxOut24),
	.dout_25(ifm_enable_write_previous_dMuxOut25),
	.dout_26(ifm_enable_write_previous_dMuxOut26),
	.dout_27(ifm_enable_write_previous_dMuxOut27),
	.dout_28(ifm_enable_write_previous_dMuxOut28),
	.dout_29(ifm_enable_write_previous_dMuxOut29),
	.dout_30(ifm_enable_write_previous_dMuxOut30)
	);

	demux_1_to_30 d1(
	.din(ifm_enable_read_previous),
	.sel(ifm_sel),
	.dout_1(ifm_enable_read_previous_dMuxOut1),
	.dout_2(ifm_enable_read_previous_dMuxOut2),
	.dout_3(ifm_enable_read_previous_dMuxOut3),
	.dout_4(ifm_enable_read_previous_dMuxOut4),
	.dout_5(ifm_enable_read_previous_dMuxOut5),
	.dout_6(ifm_enable_read_previous_dMuxOut6),
	.dout_7(ifm_enable_read_previous_dMuxOut7),
	.dout_8(ifm_enable_read_previous_dMuxOut8),
	.dout_9(ifm_enable_read_previous_dMuxOut9),
	.dout_10(ifm_enable_read_previous_dMuxOut10),
	.dout_11(ifm_enable_read_previous_dMuxOut11),
	.dout_12(ifm_enable_read_previous_dMuxOut12),
	.dout_13(ifm_enable_read_previous_dMuxOut13),
	.dout_14(ifm_enable_read_previous_dMuxOut14),
	.dout_15(ifm_enable_read_previous_dMuxOut15),
	.dout_16(ifm_enable_read_previous_dMuxOut16),
	.dout_17(ifm_enable_read_previous_dMuxOut17),
	.dout_18(ifm_enable_read_previous_dMuxOut18),
	.dout_19(ifm_enable_read_previous_dMuxOut19),
	.dout_20(ifm_enable_read_previous_dMuxOut20),
	.dout_21(ifm_enable_read_previous_dMuxOut21),
	.dout_22(ifm_enable_read_previous_dMuxOut22),
	.dout_23(ifm_enable_read_previous_dMuxOut23),
	.dout_24(ifm_enable_read_previous_dMuxOut24),
	.dout_25(ifm_enable_read_previous_dMuxOut25),
	.dout_26(ifm_enable_read_previous_dMuxOut26),
	.dout_27(ifm_enable_read_previous_dMuxOut27),
	.dout_28(ifm_enable_read_previous_dMuxOut28),
	.dout_29(ifm_enable_read_previous_dMuxOut29),
	.dout_30(ifm_enable_read_previous_dMuxOut30)
	);

	demux_1_to_30 d2(
	.din(ifm_enable_read_A_next),
	.sel(ifm_sel),
	.dout_1(ifm_enable_read_A_next_dMuxOut1),
	.dout_2(ifm_enable_read_A_next_dMuxOut2),
	.dout_3(ifm_enable_read_A_next_dMuxOut3),
	.dout_4(ifm_enable_read_A_next_dMuxOut4),
	.dout_5(ifm_enable_read_A_next_dMuxOut5),
	.dout_6(ifm_enable_read_A_next_dMuxOut6),
	.dout_7(ifm_enable_read_A_next_dMuxOut7),
	.dout_8(ifm_enable_read_A_next_dMuxOut8),
	.dout_9(ifm_enable_read_A_next_dMuxOut9),
	.dout_10(ifm_enable_read_A_next_dMuxOut10),
	.dout_11(ifm_enable_read_A_next_dMuxOut11),
	.dout_12(ifm_enable_read_A_next_dMuxOut12),
	.dout_13(ifm_enable_read_A_next_dMuxOut13),
	.dout_14(ifm_enable_read_A_next_dMuxOut14),
	.dout_15(ifm_enable_read_A_next_dMuxOut15),
	.dout_16(ifm_enable_read_A_next_dMuxOut16),
	.dout_17(ifm_enable_read_A_next_dMuxOut17),
	.dout_18(ifm_enable_read_A_next_dMuxOut18),
	.dout_19(ifm_enable_read_A_next_dMuxOut19),
	.dout_20(ifm_enable_read_A_next_dMuxOut20),
	.dout_21(ifm_enable_read_A_next_dMuxOut21),
	.dout_22(ifm_enable_read_A_next_dMuxOut22),
	.dout_23(ifm_enable_read_A_next_dMuxOut23),
	.dout_24(ifm_enable_read_A_next_dMuxOut24),
	.dout_25(ifm_enable_read_A_next_dMuxOut25),
	.dout_26(ifm_enable_read_A_next_dMuxOut26),
	.dout_27(ifm_enable_read_A_next_dMuxOut27),
	.dout_28(ifm_enable_read_A_next_dMuxOut28),
	.dout_29(ifm_enable_read_A_next_dMuxOut29),
	.dout_30(ifm_enable_read_A_next_dMuxOut30)
	);

	demux_1_to_30 d3(
	.din(ifm_enable_read_B_next),
	.sel(ifm_sel),
	.dout_1(ifm_enable_read_B_next_dMuxOut1),
	.dout_2(ifm_enable_read_B_next_dMuxOut2),
	.dout_3(ifm_enable_read_B_next_dMuxOut3),
	.dout_4(ifm_enable_read_B_next_dMuxOut4),
	.dout_5(ifm_enable_read_B_next_dMuxOut5),
	.dout_6(ifm_enable_read_B_next_dMuxOut6),
	.dout_7(ifm_enable_read_B_next_dMuxOut7),
	.dout_8(ifm_enable_read_B_next_dMuxOut8),
	.dout_9(ifm_enable_read_B_next_dMuxOut9),
	.dout_10(ifm_enable_read_B_next_dMuxOut10),
	.dout_11(ifm_enable_read_B_next_dMuxOut11),
	.dout_12(ifm_enable_read_B_next_dMuxOut12),
	.dout_13(ifm_enable_read_B_next_dMuxOut13),
	.dout_14(ifm_enable_read_B_next_dMuxOut14),
	.dout_15(ifm_enable_read_B_next_dMuxOut15),
	.dout_16(ifm_enable_read_B_next_dMuxOut16),
	.dout_17(ifm_enable_read_B_next_dMuxOut17),
	.dout_18(ifm_enable_read_B_next_dMuxOut18),
	.dout_19(ifm_enable_read_B_next_dMuxOut19),
	.dout_20(ifm_enable_read_B_next_dMuxOut20),
	.dout_21(ifm_enable_read_B_next_dMuxOut21),
	.dout_22(ifm_enable_read_B_next_dMuxOut22),
	.dout_23(ifm_enable_read_B_next_dMuxOut23),
	.dout_24(ifm_enable_read_B_next_dMuxOut24),
	.dout_25(ifm_enable_read_B_next_dMuxOut25),
	.dout_26(ifm_enable_read_B_next_dMuxOut26),
	.dout_27(ifm_enable_read_B_next_dMuxOut27),
	.dout_28(ifm_enable_read_B_next_dMuxOut28),
	.dout_29(ifm_enable_read_B_next_dMuxOut29),
	.dout_30(ifm_enable_read_B_next_dMuxOut30)
	);

	demux_1_to_30_5bits d4(
	.din(ifm_address_write_previous),
	.sel(ifm_sel),
	.dout_1(ifm_address_write_previous_dMuxOut1),
	.dout_2(ifm_address_write_previous_dMuxOut2),
	.dout_3(ifm_address_write_previous_dMuxOut3),
	.dout_4(ifm_address_write_previous_dMuxOut4),
	.dout_5(ifm_address_write_previous_dMuxOut5),
	.dout_6(ifm_address_write_previous_dMuxOut6),
	.dout_7(ifm_address_write_previous_dMuxOut7),
	.dout_8(ifm_address_write_previous_dMuxOut8),
	.dout_9(ifm_address_write_previous_dMuxOut9),
	.dout_10(ifm_address_write_previous_dMuxOut10),
	.dout_11(ifm_address_write_previous_dMuxOut11),
	.dout_12(ifm_address_write_previous_dMuxOut12),
	.dout_13(ifm_address_write_previous_dMuxOut13),
	.dout_14(ifm_address_write_previous_dMuxOut14),
	.dout_15(ifm_address_write_previous_dMuxOut15),
	.dout_16(ifm_address_write_previous_dMuxOut16),
	.dout_17(ifm_address_write_previous_dMuxOut17),
	.dout_18(ifm_address_write_previous_dMuxOut18),
	.dout_19(ifm_address_write_previous_dMuxOut19),
	.dout_20(ifm_address_write_previous_dMuxOut20),
	.dout_21(ifm_address_write_previous_dMuxOut21),
	.dout_22(ifm_address_write_previous_dMuxOut22),
	.dout_23(ifm_address_write_previous_dMuxOut23),
	.dout_24(ifm_address_write_previous_dMuxOut24),
	.dout_25(ifm_address_write_previous_dMuxOut25),
	.dout_26(ifm_address_write_previous_dMuxOut26),
	.dout_27(ifm_address_write_previous_dMuxOut27),
	.dout_28(ifm_address_write_previous_dMuxOut28),
	.dout_29(ifm_address_write_previous_dMuxOut29),
	.dout_30(ifm_address_write_previous_dMuxOut30)
	);

	demux_1_to_30_5bits d5(
	.din(ifm_address_read_previous),
	.sel(ifm_sel),
	.dout_1(ifm_address_read_previous_dMuxOut1),
	.dout_2(ifm_address_read_previous_dMuxOut2),
	.dout_3(ifm_address_read_previous_dMuxOut3),
	.dout_4(ifm_address_read_previous_dMuxOut4),
	.dout_5(ifm_address_read_previous_dMuxOut5),
	.dout_6(ifm_address_read_previous_dMuxOut6),
	.dout_7(ifm_address_read_previous_dMuxOut7),
	.dout_8(ifm_address_read_previous_dMuxOut8),
	.dout_9(ifm_address_read_previous_dMuxOut9),
	.dout_10(ifm_address_read_previous_dMuxOut10),
	.dout_11(ifm_address_read_previous_dMuxOut11),
	.dout_12(ifm_address_read_previous_dMuxOut12),
	.dout_13(ifm_address_read_previous_dMuxOut13),
	.dout_14(ifm_address_read_previous_dMuxOut14),
	.dout_15(ifm_address_read_previous_dMuxOut15),
	.dout_16(ifm_address_read_previous_dMuxOut16),
	.dout_17(ifm_address_read_previous_dMuxOut17),
	.dout_18(ifm_address_read_previous_dMuxOut18),
	.dout_19(ifm_address_read_previous_dMuxOut19),
	.dout_20(ifm_address_read_previous_dMuxOut20),
	.dout_21(ifm_address_read_previous_dMuxOut21),
	.dout_22(ifm_address_read_previous_dMuxOut22),
	.dout_23(ifm_address_read_previous_dMuxOut23),
	.dout_24(ifm_address_read_previous_dMuxOut24),
	.dout_25(ifm_address_read_previous_dMuxOut25),
	.dout_26(ifm_address_read_previous_dMuxOut26),
	.dout_27(ifm_address_read_previous_dMuxOut27),
	.dout_28(ifm_address_read_previous_dMuxOut28),
	.dout_29(ifm_address_read_previous_dMuxOut29),
	.dout_30(ifm_address_read_previous_dMuxOut30)
	);

	demux_1_to_30_5bits d6(
	.din(ifm_address_read_A_next),
	.sel(ifm_sel),
	.dout_1(ifm_address_read_A_next_dMuxOut1),
	.dout_2(ifm_address_read_A_next_dMuxOut2),
	.dout_3(ifm_address_read_A_next_dMuxOut3),
	.dout_4(ifm_address_read_A_next_dMuxOut4),
	.dout_5(ifm_address_read_A_next_dMuxOut5),
	.dout_6(ifm_address_read_A_next_dMuxOut6),
	.dout_7(ifm_address_read_A_next_dMuxOut7),
	.dout_8(ifm_address_read_A_next_dMuxOut8),
	.dout_9(ifm_address_read_A_next_dMuxOut9),
	.dout_10(ifm_address_read_A_next_dMuxOut10),
	.dout_11(ifm_address_read_A_next_dMuxOut11),
	.dout_12(ifm_address_read_A_next_dMuxOut12),
	.dout_13(ifm_address_read_A_next_dMuxOut13),
	.dout_14(ifm_address_read_A_next_dMuxOut14),
	.dout_15(ifm_address_read_A_next_dMuxOut15),
	.dout_16(ifm_address_read_A_next_dMuxOut16),
	.dout_17(ifm_address_read_A_next_dMuxOut17),
	.dout_18(ifm_address_read_A_next_dMuxOut18),
	.dout_19(ifm_address_read_A_next_dMuxOut19),
	.dout_20(ifm_address_read_A_next_dMuxOut20),
	.dout_21(ifm_address_read_A_next_dMuxOut21),
	.dout_22(ifm_address_read_A_next_dMuxOut22),
	.dout_23(ifm_address_read_A_next_dMuxOut23),
	.dout_24(ifm_address_read_A_next_dMuxOut24),
	.dout_25(ifm_address_read_A_next_dMuxOut25),
	.dout_26(ifm_address_read_A_next_dMuxOut26),
	.dout_27(ifm_address_read_A_next_dMuxOut27),
	.dout_28(ifm_address_read_A_next_dMuxOut28),
	.dout_29(ifm_address_read_A_next_dMuxOut29),
	.dout_30(ifm_address_read_A_next_dMuxOut30)
	);

	demux_1_to_30_5bits d7(
	.din(ifm_address_read_B_next),
	.sel(ifm_sel),
	.dout_1(ifm_address_read_B_next_dMuxOut1),
	.dout_2(ifm_address_read_B_next_dMuxOut2),
	.dout_3(ifm_address_read_B_next_dMuxOut3),
	.dout_4(ifm_address_read_B_next_dMuxOut4),
	.dout_5(ifm_address_read_B_next_dMuxOut5),
	.dout_6(ifm_address_read_B_next_dMuxOut6),
	.dout_7(ifm_address_read_B_next_dMuxOut7),
	.dout_8(ifm_address_read_B_next_dMuxOut8),
	.dout_9(ifm_address_read_B_next_dMuxOut9),
	.dout_10(ifm_address_read_B_next_dMuxOut10),
	.dout_11(ifm_address_read_B_next_dMuxOut11),
	.dout_12(ifm_address_read_B_next_dMuxOut12),
	.dout_13(ifm_address_read_B_next_dMuxOut13),
	.dout_14(ifm_address_read_B_next_dMuxOut14),
	.dout_15(ifm_address_read_B_next_dMuxOut15),
	.dout_16(ifm_address_read_B_next_dMuxOut16),
	.dout_17(ifm_address_read_B_next_dMuxOut17),
	.dout_18(ifm_address_read_B_next_dMuxOut18),
	.dout_19(ifm_address_read_B_next_dMuxOut19),
	.dout_20(ifm_address_read_B_next_dMuxOut20),
	.dout_21(ifm_address_read_B_next_dMuxOut21),
	.dout_22(ifm_address_read_B_next_dMuxOut22),
	.dout_23(ifm_address_read_B_next_dMuxOut23),
	.dout_24(ifm_address_read_B_next_dMuxOut24),
	.dout_25(ifm_address_read_B_next_dMuxOut25),
	.dout_26(ifm_address_read_B_next_dMuxOut26),
	.dout_27(ifm_address_read_B_next_dMuxOut27),
	.dout_28(ifm_address_read_B_next_dMuxOut28),
	.dout_29(ifm_address_read_B_next_dMuxOut29),
	.dout_30(ifm_address_read_B_next_dMuxOut30)
	);

	
    always @*
    begin

        case(ifm_sel)
		5'd0:
		begin
			data_out_for_previous1 = Data_Output_B_Mem1;
			data_out_for_previous2 = Data_Output_B_Mem2;
			data_out_for_previous3 = Data_Output_B_Mem3;
		
			data_out_A_for_next1 = Data_Output_A_Mem88;
			data_out_B_for_next1 = Data_Output_B_Mem88;
		
			data_out_A_for_next2 = 0;
			data_out_B_for_next2 = 0;
		
			data_out_A_for_next3 = 0;
			data_out_B_for_next3 = 0;
		end
		5'd1:
		begin
			data_out_for_previous1 = Data_Output_B_Mem4;
			data_out_for_previous2 = Data_Output_B_Mem5;
			data_out_for_previous3 = Data_Output_B_Mem6;
		
			data_out_A_for_next1 = Data_Output_A_Mem1;
			data_out_B_for_next1 = Data_Output_B_Mem1;
		
			data_out_A_for_next2 = Data_Output_A_Mem2;
			data_out_B_for_next2 = Data_Output_B_Mem2;
		
			data_out_A_for_next3 = Data_Output_A_Mem3;
			data_out_B_for_next3 = Data_Output_B_Mem3;
		end
		5'd2:
		begin
			data_out_for_previous1 = Data_Output_B_Mem7;
			data_out_for_previous2 = Data_Output_B_Mem8;
			data_out_for_previous3 = Data_Output_B_Mem9;
		
			data_out_A_for_next1 = Data_Output_A_Mem4;
			data_out_B_for_next1 = Data_Output_B_Mem4;
		
			data_out_A_for_next2 = Data_Output_A_Mem5;
			data_out_B_for_next2 = Data_Output_B_Mem5;
		
			data_out_A_for_next3 = Data_Output_A_Mem6;
			data_out_B_for_next3 = Data_Output_B_Mem6;
		end
		5'd3:
		begin
			data_out_for_previous1 = Data_Output_B_Mem10;
			data_out_for_previous2 = Data_Output_B_Mem11;
			data_out_for_previous3 = Data_Output_B_Mem12;
		
			data_out_A_for_next1 = Data_Output_A_Mem7;
			data_out_B_for_next1 = Data_Output_B_Mem7;
		
			data_out_A_for_next2 = Data_Output_A_Mem8;
			data_out_B_for_next2 = Data_Output_B_Mem8;
		
			data_out_A_for_next3 = Data_Output_A_Mem9;
			data_out_B_for_next3 = Data_Output_B_Mem9;
		end
		5'd4:
		begin
			data_out_for_previous1 = Data_Output_B_Mem13;
			data_out_for_previous2 = Data_Output_B_Mem14;
			data_out_for_previous3 = Data_Output_B_Mem15;
		
			data_out_A_for_next1 = Data_Output_A_Mem10;
			data_out_B_for_next1 = Data_Output_B_Mem10;
		
			data_out_A_for_next2 = Data_Output_A_Mem11;
			data_out_B_for_next2 = Data_Output_B_Mem11;
		
			data_out_A_for_next3 = Data_Output_A_Mem12;
			data_out_B_for_next3 = Data_Output_B_Mem12;
		end
		5'd5:
		begin
			data_out_for_previous1 = Data_Output_B_Mem16;
			data_out_for_previous2 = Data_Output_B_Mem17;
			data_out_for_previous3 = Data_Output_B_Mem18;
		
			data_out_A_for_next1 = Data_Output_A_Mem13;
			data_out_B_for_next1 = Data_Output_B_Mem13;
		
			data_out_A_for_next2 = Data_Output_A_Mem14;
			data_out_B_for_next2 = Data_Output_B_Mem14;
		
			data_out_A_for_next3 = Data_Output_A_Mem15;
			data_out_B_for_next3 = Data_Output_B_Mem15;
		end
		5'd6:
		begin
			data_out_for_previous1 = Data_Output_B_Mem19;
			data_out_for_previous2 = Data_Output_B_Mem20;
			data_out_for_previous3 = Data_Output_B_Mem21;
		
			data_out_A_for_next1 = Data_Output_A_Mem16;
			data_out_B_for_next1 = Data_Output_B_Mem16;
		
			data_out_A_for_next2 = Data_Output_A_Mem17;
			data_out_B_for_next2 = Data_Output_B_Mem17;
		
			data_out_A_for_next3 = Data_Output_A_Mem18;
			data_out_B_for_next3 = Data_Output_B_Mem18;
		end
		5'd7:
		begin
			data_out_for_previous1 = Data_Output_B_Mem22;
			data_out_for_previous2 = Data_Output_B_Mem23;
			data_out_for_previous3 = Data_Output_B_Mem24;
		
			data_out_A_for_next1 = Data_Output_A_Mem19;
			data_out_B_for_next1 = Data_Output_B_Mem19;
		
			data_out_A_for_next2 = Data_Output_A_Mem20;
			data_out_B_for_next2 = Data_Output_B_Mem20;
		
			data_out_A_for_next3 = Data_Output_A_Mem21;
			data_out_B_for_next3 = Data_Output_B_Mem21;
		end
		5'd8:
		begin
			data_out_for_previous1 = Data_Output_B_Mem25;
			data_out_for_previous2 = Data_Output_B_Mem26;
			data_out_for_previous3 = Data_Output_B_Mem27;
		
			data_out_A_for_next1 = Data_Output_A_Mem22;
			data_out_B_for_next1 = Data_Output_B_Mem22;
		
			data_out_A_for_next2 = Data_Output_A_Mem23;
			data_out_B_for_next2 = Data_Output_B_Mem23;
		
			data_out_A_for_next3 = Data_Output_A_Mem24;
			data_out_B_for_next3 = Data_Output_B_Mem24;
		end
		5'd9:
		begin
			data_out_for_previous1 = Data_Output_B_Mem28;
			data_out_for_previous2 = Data_Output_B_Mem29;
			data_out_for_previous3 = Data_Output_B_Mem30;
		
			data_out_A_for_next1 = Data_Output_A_Mem25;
			data_out_B_for_next1 = Data_Output_B_Mem25;
		
			data_out_A_for_next2 = Data_Output_A_Mem26;
			data_out_B_for_next2 = Data_Output_B_Mem26;
		
			data_out_A_for_next3 = Data_Output_A_Mem27;
			data_out_B_for_next3 = Data_Output_B_Mem27;
		end
		5'd10:
		begin
			data_out_for_previous1 = Data_Output_B_Mem31;
			data_out_for_previous2 = Data_Output_B_Mem32;
			data_out_for_previous3 = Data_Output_B_Mem33;
		
			data_out_A_for_next1 = Data_Output_A_Mem28;
			data_out_B_for_next1 = Data_Output_B_Mem28;
		
			data_out_A_for_next2 = Data_Output_A_Mem29;
			data_out_B_for_next2 = Data_Output_B_Mem29;
		
			data_out_A_for_next3 = Data_Output_A_Mem30;
			data_out_B_for_next3 = Data_Output_B_Mem30;
		end
		5'd11:
		begin
			data_out_for_previous1 = Data_Output_B_Mem34;
			data_out_for_previous2 = Data_Output_B_Mem35;
			data_out_for_previous3 = Data_Output_B_Mem36;
		
			data_out_A_for_next1 = Data_Output_A_Mem31;
			data_out_B_for_next1 = Data_Output_B_Mem31;
		
			data_out_A_for_next2 = Data_Output_A_Mem32;
			data_out_B_for_next2 = Data_Output_B_Mem32;
		
			data_out_A_for_next3 = Data_Output_A_Mem33;
			data_out_B_for_next3 = Data_Output_B_Mem33;
		end
		5'd12:
		begin
			data_out_for_previous1 = Data_Output_B_Mem37;
			data_out_for_previous2 = Data_Output_B_Mem38;
			data_out_for_previous3 = Data_Output_B_Mem39;
		
			data_out_A_for_next1 = Data_Output_A_Mem34;
			data_out_B_for_next1 = Data_Output_B_Mem34;
		
			data_out_A_for_next2 = Data_Output_A_Mem35;
			data_out_B_for_next2 = Data_Output_B_Mem35;
		
			data_out_A_for_next3 = Data_Output_A_Mem36;
			data_out_B_for_next3 = Data_Output_B_Mem36;
		end
		5'd13:
		begin
			data_out_for_previous1 = Data_Output_B_Mem40;
			data_out_for_previous2 = Data_Output_B_Mem41;
			data_out_for_previous3 = Data_Output_B_Mem42;
		
			data_out_A_for_next1 = Data_Output_A_Mem37;
			data_out_B_for_next1 = Data_Output_B_Mem37;
		
			data_out_A_for_next2 = Data_Output_A_Mem38;
			data_out_B_for_next2 = Data_Output_B_Mem38;
		
			data_out_A_for_next3 = Data_Output_A_Mem39;
			data_out_B_for_next3 = Data_Output_B_Mem39;
		end
		5'd14:
		begin
			data_out_for_previous1 = Data_Output_B_Mem43;
			data_out_for_previous2 = Data_Output_B_Mem44;
			data_out_for_previous3 = Data_Output_B_Mem45;
		
			data_out_A_for_next1 = Data_Output_A_Mem40;
			data_out_B_for_next1 = Data_Output_B_Mem40;
		
			data_out_A_for_next2 = Data_Output_A_Mem41;
			data_out_B_for_next2 = Data_Output_B_Mem41;
		
			data_out_A_for_next3 = Data_Output_A_Mem42;
			data_out_B_for_next3 = Data_Output_B_Mem42;
		end
		5'd15:
		begin
			data_out_for_previous1 = Data_Output_B_Mem46;
			data_out_for_previous2 = Data_Output_B_Mem47;
			data_out_for_previous3 = Data_Output_B_Mem48;
		
			data_out_A_for_next1 = Data_Output_A_Mem43;
			data_out_B_for_next1 = Data_Output_B_Mem43;
		
			data_out_A_for_next2 = Data_Output_A_Mem44;
			data_out_B_for_next2 = Data_Output_B_Mem44;
		
			data_out_A_for_next3 = Data_Output_A_Mem45;
			data_out_B_for_next3 = Data_Output_B_Mem45;
		end
		5'd16:
		begin
			data_out_for_previous1 = Data_Output_B_Mem49;
			data_out_for_previous2 = Data_Output_B_Mem50;
			data_out_for_previous3 = Data_Output_B_Mem51;
		
			data_out_A_for_next1 = Data_Output_A_Mem46;
			data_out_B_for_next1 = Data_Output_B_Mem46;
		
			data_out_A_for_next2 = Data_Output_A_Mem47;
			data_out_B_for_next2 = Data_Output_B_Mem47;
		
			data_out_A_for_next3 = Data_Output_A_Mem48;
			data_out_B_for_next3 = Data_Output_B_Mem48;
		end
		5'd17:
		begin
			data_out_for_previous1 = Data_Output_B_Mem52;
			data_out_for_previous2 = Data_Output_B_Mem53;
			data_out_for_previous3 = Data_Output_B_Mem54;
		
			data_out_A_for_next1 = Data_Output_A_Mem49;
			data_out_B_for_next1 = Data_Output_B_Mem49;
		
			data_out_A_for_next2 = Data_Output_A_Mem50;
			data_out_B_for_next2 = Data_Output_B_Mem50;
		
			data_out_A_for_next3 = Data_Output_A_Mem51;
			data_out_B_for_next3 = Data_Output_B_Mem51;
		end
		5'd18:
		begin
			data_out_for_previous1 = Data_Output_B_Mem55;
			data_out_for_previous2 = Data_Output_B_Mem56;
			data_out_for_previous3 = Data_Output_B_Mem57;
		
			data_out_A_for_next1 = Data_Output_A_Mem52;
			data_out_B_for_next1 = Data_Output_B_Mem52;
		
			data_out_A_for_next2 = Data_Output_A_Mem53;
			data_out_B_for_next2 = Data_Output_B_Mem53;
		
			data_out_A_for_next3 = Data_Output_A_Mem54;
			data_out_B_for_next3 = Data_Output_B_Mem54;
		end
		5'd19:
		begin
			data_out_for_previous1 = Data_Output_B_Mem58;
			data_out_for_previous2 = Data_Output_B_Mem59;
			data_out_for_previous3 = Data_Output_B_Mem60;
		
			data_out_A_for_next1 = Data_Output_A_Mem55;
			data_out_B_for_next1 = Data_Output_B_Mem55;
		
			data_out_A_for_next2 = Data_Output_A_Mem56;
			data_out_B_for_next2 = Data_Output_B_Mem56;
		
			data_out_A_for_next3 = Data_Output_A_Mem57;
			data_out_B_for_next3 = Data_Output_B_Mem57;
		end
		5'd20:
		begin
			data_out_for_previous1 = Data_Output_B_Mem61;
			data_out_for_previous2 = Data_Output_B_Mem62;
			data_out_for_previous3 = Data_Output_B_Mem63;
		
			data_out_A_for_next1 = Data_Output_A_Mem58;
			data_out_B_for_next1 = Data_Output_B_Mem58;
		
			data_out_A_for_next2 = Data_Output_A_Mem59;
			data_out_B_for_next2 = Data_Output_B_Mem59;
		
			data_out_A_for_next3 = Data_Output_A_Mem60;
			data_out_B_for_next3 = Data_Output_B_Mem60;
		end
		5'd21:
		begin
			data_out_for_previous1 = Data_Output_B_Mem64;
			data_out_for_previous2 = Data_Output_B_Mem65;
			data_out_for_previous3 = Data_Output_B_Mem66;
		
			data_out_A_for_next1 = Data_Output_A_Mem61;
			data_out_B_for_next1 = Data_Output_B_Mem61;
		
			data_out_A_for_next2 = Data_Output_A_Mem62;
			data_out_B_for_next2 = Data_Output_B_Mem62;
		
			data_out_A_for_next3 = Data_Output_A_Mem63;
			data_out_B_for_next3 = Data_Output_B_Mem63;
		end
		5'd22:
		begin
			data_out_for_previous1 = Data_Output_B_Mem67;
			data_out_for_previous2 = Data_Output_B_Mem68;
			data_out_for_previous3 = Data_Output_B_Mem69;
		
			data_out_A_for_next1 = Data_Output_A_Mem64;
			data_out_B_for_next1 = Data_Output_B_Mem64;
		
			data_out_A_for_next2 = Data_Output_A_Mem65;
			data_out_B_for_next2 = Data_Output_B_Mem65;
		
			data_out_A_for_next3 = Data_Output_A_Mem66;
			data_out_B_for_next3 = Data_Output_B_Mem66;
		end
		5'd23:
		begin
			data_out_for_previous1 = Data_Output_B_Mem70;
			data_out_for_previous2 = Data_Output_B_Mem71;
			data_out_for_previous3 = Data_Output_B_Mem72;
		
			data_out_A_for_next1 = Data_Output_A_Mem67;
			data_out_B_for_next1 = Data_Output_B_Mem67;
		
			data_out_A_for_next2 = Data_Output_A_Mem68;
			data_out_B_for_next2 = Data_Output_B_Mem68;
		
			data_out_A_for_next3 = Data_Output_A_Mem69;
			data_out_B_for_next3 = Data_Output_B_Mem69;
		end
		5'd24:
		begin
			data_out_for_previous1 = Data_Output_B_Mem73;
			data_out_for_previous2 = Data_Output_B_Mem74;
			data_out_for_previous3 = Data_Output_B_Mem75;
		
			data_out_A_for_next1 = Data_Output_A_Mem70;
			data_out_B_for_next1 = Data_Output_B_Mem70;
		
			data_out_A_for_next2 = Data_Output_A_Mem71;
			data_out_B_for_next2 = Data_Output_B_Mem71;
		
			data_out_A_for_next3 = Data_Output_A_Mem72;
			data_out_B_for_next3 = Data_Output_B_Mem72;
		end
		5'd25:
		begin
			data_out_for_previous1 = Data_Output_B_Mem76;
			data_out_for_previous2 = Data_Output_B_Mem77;
			data_out_for_previous3 = Data_Output_B_Mem78;
		
			data_out_A_for_next1 = Data_Output_A_Mem73;
			data_out_B_for_next1 = Data_Output_B_Mem73;
		
			data_out_A_for_next2 = Data_Output_A_Mem74;
			data_out_B_for_next2 = Data_Output_B_Mem74;
		
			data_out_A_for_next3 = Data_Output_A_Mem75;
			data_out_B_for_next3 = Data_Output_B_Mem75;
		end
		5'd26:
		begin
			data_out_for_previous1 = Data_Output_B_Mem79;
			data_out_for_previous2 = Data_Output_B_Mem80;
			data_out_for_previous3 = Data_Output_B_Mem81;
		
			data_out_A_for_next1 = Data_Output_A_Mem76;
			data_out_B_for_next1 = Data_Output_B_Mem76;
		
			data_out_A_for_next2 = Data_Output_A_Mem77;
			data_out_B_for_next2 = Data_Output_B_Mem77;
		
			data_out_A_for_next3 = Data_Output_A_Mem78;
			data_out_B_for_next3 = Data_Output_B_Mem78;
		end
		5'd27:
		begin
			data_out_for_previous1 = Data_Output_B_Mem82;
			data_out_for_previous2 = Data_Output_B_Mem83;
			data_out_for_previous3 = Data_Output_B_Mem84;
		
			data_out_A_for_next1 = Data_Output_A_Mem79;
			data_out_B_for_next1 = Data_Output_B_Mem79;
		
			data_out_A_for_next2 = Data_Output_A_Mem80;
			data_out_B_for_next2 = Data_Output_B_Mem80;
		
			data_out_A_for_next3 = Data_Output_A_Mem81;
			data_out_B_for_next3 = Data_Output_B_Mem81;
		end
		5'd28:
		begin
			data_out_for_previous1 = Data_Output_B_Mem85;
			data_out_for_previous2 = Data_Output_B_Mem86;
			data_out_for_previous3 = Data_Output_B_Mem87;
		
			data_out_A_for_next1 = Data_Output_A_Mem82;
			data_out_B_for_next1 = Data_Output_B_Mem82;
		
			data_out_A_for_next2 = Data_Output_A_Mem83;
			data_out_B_for_next2 = Data_Output_B_Mem83;
		
			data_out_A_for_next3 = Data_Output_A_Mem84;
			data_out_B_for_next3 = Data_Output_B_Mem84;
		end
		default:
		begin
			data_out_for_previous1 = Data_Output_B_Mem88;
			data_out_for_previous2 = 0;
			data_out_for_previous3 = 0;
		
			data_out_A_for_next1 = Data_Output_A_Mem85;
			data_out_B_for_next1 = Data_Output_B_Mem85;
		
			data_out_A_for_next2 = Data_Output_A_Mem86;
			data_out_B_for_next2 = Data_Output_B_Mem86;
		
			data_out_A_for_next3 = Data_Output_A_Mem87;
			data_out_B_for_next3 = Data_Output_B_Mem87;
		end
		
		endcase
		
	end

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M1(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut1 | ifm_address_read_A_next_dMuxOut2 ),
      .Address_B ( ifm_address_read_previous_dMuxOut1  | ifm_address_read_B_next_dMuxOut2 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut1),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut2),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut1 | ifm_enable_read_B_next_dMuxOut2),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem1),
      .Data_Output_B_Mem1 (Data_Output_B_Mem1),
      .Data_Output_A_Mem2 (Data_Output_A_Mem2),
      .Data_Output_B_Mem2 (Data_Output_B_Mem2),
      .Data_Output_A_Mem3 (Data_Output_A_Mem3),
      .Data_Output_B_Mem3 (Data_Output_B_Mem3)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M2(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut2 | ifm_address_read_A_next_dMuxOut3 ),
      .Address_B ( ifm_address_read_previous_dMuxOut2  | ifm_address_read_B_next_dMuxOut3 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut2),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut3),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut2 | ifm_enable_read_B_next_dMuxOut3),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem4),
      .Data_Output_B_Mem1 (Data_Output_B_Mem4),
      .Data_Output_A_Mem2 (Data_Output_A_Mem5),
      .Data_Output_B_Mem2 (Data_Output_B_Mem5),
      .Data_Output_A_Mem3 (Data_Output_A_Mem6),
      .Data_Output_B_Mem3 (Data_Output_B_Mem6)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M3(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut3 | ifm_address_read_A_next_dMuxOut4 ),
      .Address_B ( ifm_address_read_previous_dMuxOut3  | ifm_address_read_B_next_dMuxOut4 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut3),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut4),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut3 | ifm_enable_read_B_next_dMuxOut4),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem7),
      .Data_Output_B_Mem1 (Data_Output_B_Mem7),
      .Data_Output_A_Mem2 (Data_Output_A_Mem8),
      .Data_Output_B_Mem2 (Data_Output_B_Mem8),
      .Data_Output_A_Mem3 (Data_Output_A_Mem9),
      .Data_Output_B_Mem3 (Data_Output_B_Mem9)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M4(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut4 | ifm_address_read_A_next_dMuxOut5 ),
      .Address_B ( ifm_address_read_previous_dMuxOut4  | ifm_address_read_B_next_dMuxOut5 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut4),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut5),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut4 | ifm_enable_read_B_next_dMuxOut5),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem10),
      .Data_Output_B_Mem1 (Data_Output_B_Mem10),
      .Data_Output_A_Mem2 (Data_Output_A_Mem11),
      .Data_Output_B_Mem2 (Data_Output_B_Mem11),
      .Data_Output_A_Mem3 (Data_Output_A_Mem12),
      .Data_Output_B_Mem3 (Data_Output_B_Mem12)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M5(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut5 | ifm_address_read_A_next_dMuxOut6 ),
      .Address_B ( ifm_address_read_previous_dMuxOut5  | ifm_address_read_B_next_dMuxOut6 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut5),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut6),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut5 | ifm_enable_read_B_next_dMuxOut6),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem13),
      .Data_Output_B_Mem1 (Data_Output_B_Mem13),
      .Data_Output_A_Mem2 (Data_Output_A_Mem14),
      .Data_Output_B_Mem2 (Data_Output_B_Mem14),
      .Data_Output_A_Mem3 (Data_Output_A_Mem15),
      .Data_Output_B_Mem3 (Data_Output_B_Mem15)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M6(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut6 | ifm_address_read_A_next_dMuxOut7 ),
      .Address_B ( ifm_address_read_previous_dMuxOut6  | ifm_address_read_B_next_dMuxOut7 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut6),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut7),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut6 | ifm_enable_read_B_next_dMuxOut7),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem16),
      .Data_Output_B_Mem1 (Data_Output_B_Mem16),
      .Data_Output_A_Mem2 (Data_Output_A_Mem17),
      .Data_Output_B_Mem2 (Data_Output_B_Mem17),
      .Data_Output_A_Mem3 (Data_Output_A_Mem18),
      .Data_Output_B_Mem3 (Data_Output_B_Mem18)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M7(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut7 | ifm_address_read_A_next_dMuxOut8 ),
      .Address_B ( ifm_address_read_previous_dMuxOut7  | ifm_address_read_B_next_dMuxOut8 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut7),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut8),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut7 | ifm_enable_read_B_next_dMuxOut8),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem19),
      .Data_Output_B_Mem1 (Data_Output_B_Mem19),
      .Data_Output_A_Mem2 (Data_Output_A_Mem20),
      .Data_Output_B_Mem2 (Data_Output_B_Mem20),
      .Data_Output_A_Mem3 (Data_Output_A_Mem21),
      .Data_Output_B_Mem3 (Data_Output_B_Mem21)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M8(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut8 | ifm_address_read_A_next_dMuxOut9 ),
      .Address_B ( ifm_address_read_previous_dMuxOut8  | ifm_address_read_B_next_dMuxOut9 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut8),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut9),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut8 | ifm_enable_read_B_next_dMuxOut9),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem22),
      .Data_Output_B_Mem1 (Data_Output_B_Mem22),
      .Data_Output_A_Mem2 (Data_Output_A_Mem23),
      .Data_Output_B_Mem2 (Data_Output_B_Mem23),
      .Data_Output_A_Mem3 (Data_Output_A_Mem24),
      .Data_Output_B_Mem3 (Data_Output_B_Mem24)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M9(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut9 | ifm_address_read_A_next_dMuxOut10 ),
      .Address_B ( ifm_address_read_previous_dMuxOut9  | ifm_address_read_B_next_dMuxOut10 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut9),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut10),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut9 | ifm_enable_read_B_next_dMuxOut10),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem25),
      .Data_Output_B_Mem1 (Data_Output_B_Mem25),
      .Data_Output_A_Mem2 (Data_Output_A_Mem26),
      .Data_Output_B_Mem2 (Data_Output_B_Mem26),
      .Data_Output_A_Mem3 (Data_Output_A_Mem27),
      .Data_Output_B_Mem3 (Data_Output_B_Mem27)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M10(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut10 | ifm_address_read_A_next_dMuxOut11 ),
      .Address_B ( ifm_address_read_previous_dMuxOut10  | ifm_address_read_B_next_dMuxOut11 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut10),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut11),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut10 | ifm_enable_read_B_next_dMuxOut11),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem28),
      .Data_Output_B_Mem1 (Data_Output_B_Mem28),
      .Data_Output_A_Mem2 (Data_Output_A_Mem29),
      .Data_Output_B_Mem2 (Data_Output_B_Mem29),
      .Data_Output_A_Mem3 (Data_Output_A_Mem30),
      .Data_Output_B_Mem3 (Data_Output_B_Mem30)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M11(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut11 | ifm_address_read_A_next_dMuxOut12 ),
      .Address_B ( ifm_address_read_previous_dMuxOut11  | ifm_address_read_B_next_dMuxOut12 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut11),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut12),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut11 | ifm_enable_read_B_next_dMuxOut12),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem31),
      .Data_Output_B_Mem1 (Data_Output_B_Mem31),
      .Data_Output_A_Mem2 (Data_Output_A_Mem32),
      .Data_Output_B_Mem2 (Data_Output_B_Mem32),
      .Data_Output_A_Mem3 (Data_Output_A_Mem33),
      .Data_Output_B_Mem3 (Data_Output_B_Mem33)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M12(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut12 | ifm_address_read_A_next_dMuxOut13 ),
      .Address_B ( ifm_address_read_previous_dMuxOut12  | ifm_address_read_B_next_dMuxOut13 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut12),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut13),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut12 | ifm_enable_read_B_next_dMuxOut13),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem34),
      .Data_Output_B_Mem1 (Data_Output_B_Mem34),
      .Data_Output_A_Mem2 (Data_Output_A_Mem35),
      .Data_Output_B_Mem2 (Data_Output_B_Mem35),
      .Data_Output_A_Mem3 (Data_Output_A_Mem36),
      .Data_Output_B_Mem3 (Data_Output_B_Mem36)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M13(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut13 | ifm_address_read_A_next_dMuxOut14 ),
      .Address_B ( ifm_address_read_previous_dMuxOut13  | ifm_address_read_B_next_dMuxOut14 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut13),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut14),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut13 | ifm_enable_read_B_next_dMuxOut14),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem37),
      .Data_Output_B_Mem1 (Data_Output_B_Mem37),
      .Data_Output_A_Mem2 (Data_Output_A_Mem38),
      .Data_Output_B_Mem2 (Data_Output_B_Mem38),
      .Data_Output_A_Mem3 (Data_Output_A_Mem39),
      .Data_Output_B_Mem3 (Data_Output_B_Mem39)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M14(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut14 | ifm_address_read_A_next_dMuxOut15 ),
      .Address_B ( ifm_address_read_previous_dMuxOut14  | ifm_address_read_B_next_dMuxOut15 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut14),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut15),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut14 | ifm_enable_read_B_next_dMuxOut15),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem40),
      .Data_Output_B_Mem1 (Data_Output_B_Mem40),
      .Data_Output_A_Mem2 (Data_Output_A_Mem41),
      .Data_Output_B_Mem2 (Data_Output_B_Mem41),
      .Data_Output_A_Mem3 (Data_Output_A_Mem42),
      .Data_Output_B_Mem3 (Data_Output_B_Mem42)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M15(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut15 | ifm_address_read_A_next_dMuxOut16 ),
      .Address_B ( ifm_address_read_previous_dMuxOut15  | ifm_address_read_B_next_dMuxOut16 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut15),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut16),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut15 | ifm_enable_read_B_next_dMuxOut16),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem43),
      .Data_Output_B_Mem1 (Data_Output_B_Mem43),
      .Data_Output_A_Mem2 (Data_Output_A_Mem44),
      .Data_Output_B_Mem2 (Data_Output_B_Mem44),
      .Data_Output_A_Mem3 (Data_Output_A_Mem45),
      .Data_Output_B_Mem3 (Data_Output_B_Mem45)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M16(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut16 | ifm_address_read_A_next_dMuxOut17 ),
      .Address_B ( ifm_address_read_previous_dMuxOut16  | ifm_address_read_B_next_dMuxOut17 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut16),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut17),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut16 | ifm_enable_read_B_next_dMuxOut17),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem46),
      .Data_Output_B_Mem1 (Data_Output_B_Mem46),
      .Data_Output_A_Mem2 (Data_Output_A_Mem47),
      .Data_Output_B_Mem2 (Data_Output_B_Mem47),
      .Data_Output_A_Mem3 (Data_Output_A_Mem48),
      .Data_Output_B_Mem3 (Data_Output_B_Mem48)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M17(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut17 | ifm_address_read_A_next_dMuxOut18 ),
      .Address_B ( ifm_address_read_previous_dMuxOut17  | ifm_address_read_B_next_dMuxOut18 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut17),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut18),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut17 | ifm_enable_read_B_next_dMuxOut18),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem49),
      .Data_Output_B_Mem1 (Data_Output_B_Mem49),
      .Data_Output_A_Mem2 (Data_Output_A_Mem50),
      .Data_Output_B_Mem2 (Data_Output_B_Mem50),
      .Data_Output_A_Mem3 (Data_Output_A_Mem51),
      .Data_Output_B_Mem3 (Data_Output_B_Mem51)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M18(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut18 | ifm_address_read_A_next_dMuxOut19 ),
      .Address_B ( ifm_address_read_previous_dMuxOut18  | ifm_address_read_B_next_dMuxOut19 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut18),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut19),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut18 | ifm_enable_read_B_next_dMuxOut19),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem52),
      .Data_Output_B_Mem1 (Data_Output_B_Mem52),
      .Data_Output_A_Mem2 (Data_Output_A_Mem53),
      .Data_Output_B_Mem2 (Data_Output_B_Mem53),
      .Data_Output_A_Mem3 (Data_Output_A_Mem54),
      .Data_Output_B_Mem3 (Data_Output_B_Mem54)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M19(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut19 | ifm_address_read_A_next_dMuxOut20 ),
      .Address_B ( ifm_address_read_previous_dMuxOut19  | ifm_address_read_B_next_dMuxOut20 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut19),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut20),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut19 | ifm_enable_read_B_next_dMuxOut20),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem55),
      .Data_Output_B_Mem1 (Data_Output_B_Mem55),
      .Data_Output_A_Mem2 (Data_Output_A_Mem56),
      .Data_Output_B_Mem2 (Data_Output_B_Mem56),
      .Data_Output_A_Mem3 (Data_Output_A_Mem57),
      .Data_Output_B_Mem3 (Data_Output_B_Mem57)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M20(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut20 | ifm_address_read_A_next_dMuxOut21 ),
      .Address_B ( ifm_address_read_previous_dMuxOut20  | ifm_address_read_B_next_dMuxOut21 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut20),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut21),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut20 | ifm_enable_read_B_next_dMuxOut21),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem58),
      .Data_Output_B_Mem1 (Data_Output_B_Mem58),
      .Data_Output_A_Mem2 (Data_Output_A_Mem59),
      .Data_Output_B_Mem2 (Data_Output_B_Mem59),
      .Data_Output_A_Mem3 (Data_Output_A_Mem60),
      .Data_Output_B_Mem3 (Data_Output_B_Mem60)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M21(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut21 | ifm_address_read_A_next_dMuxOut22 ),
      .Address_B ( ifm_address_read_previous_dMuxOut21  | ifm_address_read_B_next_dMuxOut22 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut21),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut22),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut21 | ifm_enable_read_B_next_dMuxOut22),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem61),
      .Data_Output_B_Mem1 (Data_Output_B_Mem61),
      .Data_Output_A_Mem2 (Data_Output_A_Mem62),
      .Data_Output_B_Mem2 (Data_Output_B_Mem62),
      .Data_Output_A_Mem3 (Data_Output_A_Mem63),
      .Data_Output_B_Mem3 (Data_Output_B_Mem63)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M22(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut22 | ifm_address_read_A_next_dMuxOut23 ),
      .Address_B ( ifm_address_read_previous_dMuxOut22  | ifm_address_read_B_next_dMuxOut23 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut22),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut23),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut22 | ifm_enable_read_B_next_dMuxOut23),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem64),
      .Data_Output_B_Mem1 (Data_Output_B_Mem64),
      .Data_Output_A_Mem2 (Data_Output_A_Mem65),
      .Data_Output_B_Mem2 (Data_Output_B_Mem65),
      .Data_Output_A_Mem3 (Data_Output_A_Mem66),
      .Data_Output_B_Mem3 (Data_Output_B_Mem66)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M23(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut23 | ifm_address_read_A_next_dMuxOut24 ),
      .Address_B ( ifm_address_read_previous_dMuxOut23  | ifm_address_read_B_next_dMuxOut24 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut23),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut24),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut23 | ifm_enable_read_B_next_dMuxOut24),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem67),
      .Data_Output_B_Mem1 (Data_Output_B_Mem67),
      .Data_Output_A_Mem2 (Data_Output_A_Mem68),
      .Data_Output_B_Mem2 (Data_Output_B_Mem68),
      .Data_Output_A_Mem3 (Data_Output_A_Mem69),
      .Data_Output_B_Mem3 (Data_Output_B_Mem69)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M24(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut24 | ifm_address_read_A_next_dMuxOut25 ),
      .Address_B ( ifm_address_read_previous_dMuxOut24  | ifm_address_read_B_next_dMuxOut25 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut24),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut25),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut24 | ifm_enable_read_B_next_dMuxOut25),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem70),
      .Data_Output_B_Mem1 (Data_Output_B_Mem70),
      .Data_Output_A_Mem2 (Data_Output_A_Mem71),
      .Data_Output_B_Mem2 (Data_Output_B_Mem71),
      .Data_Output_A_Mem3 (Data_Output_A_Mem72),
      .Data_Output_B_Mem3 (Data_Output_B_Mem72)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M25(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut25 | ifm_address_read_A_next_dMuxOut26 ),
      .Address_B ( ifm_address_read_previous_dMuxOut25  | ifm_address_read_B_next_dMuxOut26 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut25),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut26),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut25 | ifm_enable_read_B_next_dMuxOut26),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem73),
      .Data_Output_B_Mem1 (Data_Output_B_Mem73),
      .Data_Output_A_Mem2 (Data_Output_A_Mem74),
      .Data_Output_B_Mem2 (Data_Output_B_Mem74),
      .Data_Output_A_Mem3 (Data_Output_A_Mem75),
      .Data_Output_B_Mem3 (Data_Output_B_Mem75)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M26(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut26 | ifm_address_read_A_next_dMuxOut27 ),
      .Address_B ( ifm_address_read_previous_dMuxOut26  | ifm_address_read_B_next_dMuxOut27 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut26),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut27),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut26 | ifm_enable_read_B_next_dMuxOut27),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem76),
      .Data_Output_B_Mem1 (Data_Output_B_Mem76),
      .Data_Output_A_Mem2 (Data_Output_A_Mem77),
      .Data_Output_B_Mem2 (Data_Output_B_Mem77),
      .Data_Output_A_Mem3 (Data_Output_A_Mem78),
      .Data_Output_B_Mem3 (Data_Output_B_Mem78)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M27(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut27 | ifm_address_read_A_next_dMuxOut28 ),
      .Address_B ( ifm_address_read_previous_dMuxOut27  | ifm_address_read_B_next_dMuxOut28 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut27),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut28),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut27 | ifm_enable_read_B_next_dMuxOut28),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem79),
      .Data_Output_B_Mem1 (Data_Output_B_Mem79),
      .Data_Output_A_Mem2 (Data_Output_A_Mem80),
      .Data_Output_B_Mem2 (Data_Output_B_Mem80),
      .Data_Output_A_Mem3 (Data_Output_A_Mem81),
      .Data_Output_B_Mem3 (Data_Output_B_Mem81)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M28(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut28 | ifm_address_read_A_next_dMuxOut29 ),
      .Address_B ( ifm_address_read_previous_dMuxOut28  | ifm_address_read_B_next_dMuxOut29 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut28),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut29),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut28 | ifm_enable_read_B_next_dMuxOut29),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem82),
      .Data_Output_B_Mem1 (Data_Output_B_Mem82),
      .Data_Output_A_Mem2 (Data_Output_A_Mem83),
      .Data_Output_B_Mem2 (Data_Output_B_Mem83),
      .Data_Output_A_Mem3 (Data_Output_A_Mem84),
      .Data_Output_B_Mem3 (Data_Output_B_Mem84)
	  );

	
mem_unit_3 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M29(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut29 | ifm_address_read_A_next_dMuxOut30 ),
      .Address_B ( ifm_address_read_previous_dMuxOut29  | ifm_address_read_B_next_dMuxOut30 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut29),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut30),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut29 | ifm_enable_read_B_next_dMuxOut30),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem85),
      .Data_Output_B_Mem1 (Data_Output_B_Mem85),
      .Data_Output_A_Mem2 (Data_Output_A_Mem86),
      .Data_Output_B_Mem2 (Data_Output_B_Mem86),
      .Data_Output_A_Mem3 (Data_Output_A_Mem87),
      .Data_Output_B_Mem3 (Data_Output_B_Mem87)
	  );
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	IFM88 (
    .clk(clk),
	
	.Data_Input_A(data_in_from_previous1),
	.Data_Input_B('b0),
	
	.Address_A ( ifm_address_write_previous_dMuxOut30 | ifm_address_read_A_next_dMuxOut1 ),
    .Address_B ( ifm_address_read_previous_dMuxOut30  | ifm_address_read_B_next_dMuxOut1),  
	
	.Enable_Write_A (ifm_enable_write_previous_dMuxOut30),
    .Enable_Read_A  (ifm_enable_read_A_next_dMuxOut1),
    .Enable_Write_B (1'b0),
    .Enable_Read_B  (ifm_enable_read_previous_dMuxOut30 | ifm_enable_read_B_next_dMuxOut1),
	  
	
    .Data_Output_A(Data_Output_A_Mem88),
    .Data_Output_B(Data_Output_B_Mem88)
	);
	
endmodule