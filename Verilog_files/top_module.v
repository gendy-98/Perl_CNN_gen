`timescale 1ns / 1ps


module 
 top_module #(parameter
		///////////advanced parameters//////////
		DATA_WIDTH 				= 32,
		ADDRESS_BUS		  		= 22,
		ADDRESS_BITS 			= 15, 
		/////////////////////////////////////
		// 1.conva1
		CONVA1_KERNAL_SIZE			= 5,
		CONVA1_NUMBER_OF_FILTERS 	= 6,
		CONVA1_IFM_SIZE				= 32,
		CONVA1_IFM_DEPTH 			= 3,
		CONVA1_NUMBER_OF_UNITS 		= 1,
		CONVA1_ADDRESS_SIZE_IFM		= $clog2(CONVA1_IFM_SIZE * CONVA1_IFM_SIZE),
		
		// 2.pool1
		POOL1_KERNAL_SIZE			= 2,
		POOL1_IFM_SIZE				= 28,
		POOL1_IFM_DEPTH 			= 6,
		POOL1_NUMBER_OF_UNITS 		= 1,
		POOL1_ADDRESS_SIZE_IFM		= $clog2(POOL1_IFM_SIZE * POOL1_IFM_SIZE),
		
		// 3.convb2
		CONVB2_KERNAL_SIZE			= 5,
		CONVB2_NUMBER_OF_FILTERS 	= 16,
		CONVB2_IFM_SIZE				= 14,
		CONVB2_IFM_DEPTH 			= 6,
		CONVB2_NUMBER_OF_UNITS 		= 3,
		CONVB2_ADDRESS_SIZE_IFM		= $clog2(CONVB2_IFM_SIZE * CONVB2_IFM_SIZE),
		
		// 4.pool2
		POOL2_KERNAL_SIZE			= 2,
		POOL2_IFM_SIZE				= 32,
		POOL2_IFM_DEPTH 			= 16,
		POOL2_NUMBER_OF_UNITS 		= 3,
		POOL2_ADDRESS_SIZE_IFM		= $clog2(POOL2_IFM_SIZE * POOL2_IFM_SIZE),
		
		// 5.conva3
		CONVA3_KERNAL_SIZE			= 5,
		CONVA3_NUMBER_OF_FILTERS 	= 120,
		CONVA3_IFM_SIZE				= 32,
		CONVA3_IFM_DEPTH 			= 16,
		CONVA3_NUMBER_OF_UNITS 		= 3,
		CONVA3_ADDRESS_SIZE_IFM		= $clog2(CONVA3_IFM_SIZE * CONVA3_IFM_SIZE),
		
		// 6.fc1
		FC1_IFM_DEPTH 		= 120,
		
		// 7.fc2
		FC2_IFM_DEPTH 		= 84,
		


		ENABLE_BITS  			= ADDRESS_BUS - ADDRESS_BITS
	)(
	input clk,
	input reset,
	input [DATA_WIDTH-1:0] riscv_data_bus,
	input [ADDRESS_BUS-1:0]riscv_address_bus,
	input initialization_done,
	
	output [DATA_WIDTH-1:0] Data_out_1_final,
	output [DATA_WIDTH-1:0] Data_out_2_final,
	output [DATA_WIDTH-1:0] Data_out_3_final,
	output [DATA_WIDTH-1:0] Data_out_4_final,
	output [DATA_WIDTH-1:0] Data_out_5_final,
	output [DATA_WIDTH-1:0] Data_out_6_final,
	output [DATA_WIDTH-1:0] Data_out_7_final,
	output [DATA_WIDTH-1:0] Data_out_8_final,
	output [DATA_WIDTH-1:0] Data_out_9_final,
	output [DATA_WIDTH-1:0] Data_out_10_final,
	output ready,
    output Get_final_value
    );
	
	wire memControl_conva1_start;
	//3 indicates the input img is RGB
	wire [3-1:0] memControl_conva1_ifm_enable_write;
	
	wire [1-1:0] memControl_conva1_wm_enable_write;
	wire [3-1:0] memControl_convb2_wm_enable_write;
	wire [3-1:0] memControl_conva3_wm_enable_write;
	wire [1-1:0] memControl_fc1_wm_enable_write;
	wire [1-1:0] memControl_fc2_wm_enable_write;

	wire [DATA_WIDTH-1:0] memControl_riscv_data;
    wire [ADDRESS_BITS-1:0] memControl_riscv_address;
	
	wire memControl_conva1_bm_enable_write;
	wire [3-1:0] memControl_convb2_bm_enable_write;
	wire memControl_conva3_bm_enable_write;
	wire memControl_fc1_bm_enable_write;
	wire memControl_fc2_bm_enable_write;
			
	// Outputs of layer Conv 0
	wire [DATA_WIDTH-1:0]  conva1_data_out_for_next;
    wire [CONVA1_ADDRESS_SIZE_IFM-1:0] conva1_ifm_address_write_next;
    wire conva1_ifm_enable_write_next;
    wire conva1_start_to_next;  
    wire conva1_ifm_sel_next;  

	// Outputs of Mem_Array 1 conva1 - pool1
	wire [DATA_WIDTH-1:0] mem_arr1_data_A_out_for_previous1;
	wire [DATA_WIDTH-1:0] mem_arr1_data_A_out_for_next1;
	wire [DATA_WIDTH-1:0] mem_arr1_data_B_out_for_next1;

	// Outputs of layer Pool 1
	wire pool1_ifm_enable_read_A_current; 
    wire [POOL1_ADDRESS_SIZE_IFM-1:0] pool1_ifm_address_read_A_current;
	wire pool1_ifm_enable_read_B_current; 
    wire [POOL1_ADDRESS_SIZE_IFM-1:0] pool1_ifm_address_read_B_current;
	wire [DATA_WIDTH-1 : 0] pool1_data_out_1;
    wire pool1_end_to_previous;
    wire [DATA_WIDTH-1:0] pool1_data_out;
    wire [CONVB2_ADDRESS_SIZE_IFM-1:0] pool1_ifm_address_write_next;
    wire pool1_ifm_enable_write_next;
    wire pool1_start_to_next;
    wire pool1_ifm_sel_next;  		

	// Outputs of Mem_Array 2 pool1 - convb2
	wire [DATA_WIDTH-1:0] mem_arr2_data_A_out_for_next1;
			
	// Outputs of layer Conv 2
	wire convb2_end_to_previous;
	wire convb2_ifm_enable_read_A_current;
	wire convb2_ifm_enable_read_B_current;
	wire [[CONVB2_ADDRESS_SIZE_IFM-1:0] convb2_ifm_address_read_A_current; 
	wire [[CONVB2_ADDRESS_SIZE_IFM-1:0] convb2_ifm_address_read_B_current;
	wire convb2_ifm_enable_read_next;
	wire convb2_ifm_enable_write_next;
    wire [POOL2_ADDRESS_SIZE_IFM-1:0] convb2_ifm_address_read_next; 
	wire [POOL2_ADDRESS_SIZE_IFM-1:0] convb2_ifm_address_write_next; 
	wire [DATA_WIDTH-1:0] convb2_data_out_for_next1;
	wire [DATA_WIDTH-1:0] convb2_data_out_for_next2;
	wire [DATA_WIDTH-1:0] convb2_data_out_for_next3;
	wire convb2_start_to_next;//all
	wire [$clog2(pool2_IFM_DEPTH/convb2_NUMBER_OF_UNITS+1)-1:0] convb2_ifm_sel_next;// all
				

	// Outputs of Mem_Array 3 convb2 - pool2
	wire [DATA_WIDTH-1:0] mem_arr3_data_A_out_for_previous1;
	wire [DATA_WIDTH-1:0] mem_arr3_data_A_out_for_previous2;
	wire [DATA_WIDTH-1:0] mem_arr3_data_A_out_for_previous3;
	wire [DATA_WIDTH-1:0] mem_arr3_data_A_out_for_next1;
	wire [DATA_WIDTH-1:0] mem_arr3_data_B_out_for_next1;
	wire [DATA_WIDTH-1:0] mem_arr3_data_A_out_for_next2;
	wire [DATA_WIDTH-1:0] mem_arr3_data_B_out_for_next2;
	wire [DATA_WIDTH-1:0] mem_arr3_data_A_out_for_next3;
	wire [DATA_WIDTH-1:0] mem_arr3_data_B_out_for_next3;
			
	// Outputs of layer Pool 3		
	wire pool2_ifm_enable_read_A_current; 
    wire [POOL2_ADDRESS_SIZE_IFM-1:0] pool2_ifm_address_read_A_current;
	wire pool2_ifm_enable_read_B_current; 
    wire [POOL2_ADDRESS_SIZE_IFM-1:0] pool2_ifm_address_read_B_current;
    wire pool2_end_to_previous;
    wire [CONVA3_ADDRESS_SIZE_IFM-1:0] pool2_ifm_address_write_next;
    wire pool2_ifm_enable_write_next;
    wire pool2_start_to_next;
    wire pool2_ifm_sel_next;  		

	// Outputs of Mem_Array 4 pool2 - conva3
	wire [DATA_WIDTH-1:0] mem_arr4_data_A_out_for_next1;
	wire [DATA_WIDTH-1:0] mem_arr4_data_A_out_for_next2;
	wire [DATA_WIDTH-1:0] mem_arr4_data_A_out_for_next3;
			
	// Outputs of layer Conv 4
	wire conva3_end_to_previous;
    wire conva3_ready;
	wire conva3_ifm_enable_read_A_current;
	wire [CONVA3_ADDRESS_SIZE_IFM-1:0] conva3_ifm_address_read_A_current;
    wire [DATA_WIDTH-1:0] conva3_data_out_for_next;
	wire conva3_ifm_enable_write_next;
	wire conva3_ifm_enable_read_next;
	wire conva3_start_to_next;
	wire [$clog2(CONVA3_IFM_DEPTH/conva3_NUMBER_OF_UNITS+1)-1:0] conva3_ifm_sel_previous;
    wire [$clog2(FC1_IFM_DEPTH/conva3_NUMBER_OF_UNITS+1)-1:0] conva3_ifm_sel_next;	

	// Outputs of Mem_Array 5 conva3 - fc1
	wire [DATA_WIDTH-1:0] mem_arr5_data_A_out_for_previous1;
	wire [DATA_WIDTH-1:0] mem_arr5_data_A_out_for_next1;

	// Outputs of Mem_Array 6 fc1 - fc2
	wire [DATA_WIDTH-1:0] mem_arr6_data_A_out_for_previous1;
	wire [DATA_WIDTH-1:0] mem_arr6_data_A_out_for_next1;
	Memory_Control 
    MEM_Control
    (.clk (clk),
     .riscv_data_bus(riscv_data_bus),
     .riscv_address_bus(riscv_address_bus),
     .initialization_done(initialization_done), 
	
	
	
	
    MEM_Control
    (.clk (clk),
     .riscv_data_bus(riscv_data_bus),
     .riscv_address_bus(riscv_address_bus),
     .initialization_done(initialization_done), 
	
	
	
	/////////////////4 - top_conva3////////////////		
	top_conva3 #(.IFM_SIZE(CONVA3_IFM_SIZE), 
                .IFM_DEPTH(CONVA3_IFM_DEPTH), 
                .KERNAL_SIZE(CONVA3_KERNAL_SIZE), 
                .NUMBER_OF_FILTERS(CONVA3_NUMBER_OF_FILTERS))
    top_conva3_inst
    (
     .clk(clk),
	 .reset(reset),
	 ///////////////////////////////////////////////////////////////
	 /////////el 7ta de bta3et karim////////////////////////////////
	 .riscv_data(memControl_riscv_data),						////	
	 .riscv_address(memControl_riscv_address),					////	
	 .wm_enable_write(memControl_conva2_wm_enable_write),		////
	 .bm_enable_write(memControl_conva2_bm_enable_write), 		////
	 ///////////////////////////////////////////////////////////////
	 .ifm_sel_previous(conva3_ifm_sel_previous),	
	 .ifm_sel_next(conva3_ifm_sel_next),	
	 .ifm_enable_read_A_current(conva3_ifm_enable_read_A_current),
	 .ifm_address_read_A_current(conva3_ifm_address_read_A_current),
	 .ifm_enable_read_B_current(),
	 .ifm_address_read_B_current(),
	 .data_in_A_from_previous1(mem_arr4_data_A_out_for_next1),
	 .data_in_A_from_previous2(mem_arr4_data_A_out_for_next2),
	 .data_in_A_from_previous3(mem_arr4_data_A_out_for_next3),
	 
	 .start_from_previous(pool2_start_to_next),
	 .end_to_previous(conva3_end_to_previous), 
	 .ready(conva3_ready),          
	 .end_from_next(fc1_end_to_previous),
	 .data_in_from_next(fc1_data_out_for_previous),
	 .data_out_for_next(conva3_data_out_for_next),
	 .ifm_enable_read_next(conva3_ifm_enable_read_next),
	 .ifm_enable_write_next(conva3_ifm_enable_write_next),
	 .start_to_next(conva3_start_to_next)
    );
	
