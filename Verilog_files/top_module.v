`timescale 1ns / 1ps


module
 top_module #(parameter
		///////////advanced parameters//////////
        DATA_WIDTH                 = 32,
        ADDRESS_BUS                  = 22,
        ADDRESS_BITS             = 15,
        ARITH_TYPE                  = 0,
		/////////////////////////////////////
		// 1.conva1
        CONVA1_KERNAL_SIZE            = 5,
        CONVA1_NUMBER_OF_FILTERS     = 6,
        CONVA1_IFM_SIZE                = 32,
        CONVA1_IFM_DEPTH             = 3,
        CONVA1_NUMBER_OF_UNITS         = 1,
        CONVA1_ADDRESS_SIZE_IFM        = $clog2(CONVA1_IFM_SIZE * CONVA1_IFM_SIZE),
		
		// 2.pool1
        POOL1_KERNAL_SIZE            = 2,
        POOL1_IFM_SIZE                = 28,
        POOL1_IFM_DEPTH             = 6,
        POOL1_NUMBER_OF_UNITS         = 1,
        POOL1_ADDRESS_SIZE_IFM        = $clog2(POOL1_IFM_SIZE * POOL1_IFM_SIZE),
		
		// 3.convb2
        CONVB2_KERNAL_SIZE            = 5,
        CONVB2_NUMBER_OF_FILTERS     = 16,
        CONVB2_IFM_SIZE                = 14,
        CONVB2_IFM_DEPTH             = 6,
        CONVB2_NUMBER_OF_UNITS         = 3,
        CONVB2_ADDRESS_SIZE_IFM        = $clog2(CONVB2_IFM_SIZE * CONVB2_IFM_SIZE),
		
		// 4.pool2
        POOL2_KERNAL_SIZE            = 2,
        POOL2_IFM_SIZE                = 7,
        POOL2_IFM_DEPTH             = 16,
        POOL2_NUMBER_OF_UNITS         = 3,
        POOL2_ADDRESS_SIZE_IFM        = $clog2(POOL2_IFM_SIZE * POOL2_IFM_SIZE),
		
		// 5.conva3
        CONVA3_KERNAL_SIZE            = 5,
        CONVA3_NUMBER_OF_FILTERS     = 120,
        CONVA3_IFM_SIZE                = 5,
        CONVA3_IFM_DEPTH             = 16,
        CONVA3_NUMBER_OF_UNITS         = 3,
        CONVA3_ADDRESS_SIZE_IFM        = $clog2(CONVA3_IFM_SIZE * CONVA3_IFM_SIZE),
		
		// 6.fc1
        FC1_NUMBER_OF_FILTERS         = 84,
		
		// 7.fc2
        FC2_NUMBER_OF_FILTERS         = 10,
		


        ENABLE_BITS              = ADDRESS_BUS - ADDRESS_BITS
    )(
    input                               clk                        ,
    input                               reset                      ,
    input              [DATA_WIDTH-1:0] riscv_data_bus             ,
    input              [ADDRESS_BUS-1:0]riscv_address_bus          ,
    input                               initialization_done        ,
	
    output             [DATA_WIDTH-1:0] Data_out_1_final    ,
    output             [DATA_WIDTH-1:0] Data_out_2_final    ,
    output             [DATA_WIDTH-1:0] Data_out_3_final    ,
    output             [DATA_WIDTH-1:0] Data_out_4_final    ,
    output             [DATA_WIDTH-1:0] Data_out_5_final    ,
    output             [DATA_WIDTH-1:0] Data_out_6_final    ,
    output             [DATA_WIDTH-1:0] Data_out_7_final    ,
    output             [DATA_WIDTH-1:0] Data_out_8_final    ,
    output             [DATA_WIDTH-1:0] Data_out_9_final    ,
    output             [DATA_WIDTH-1:0] Data_out_10_final    ,
    output                              ready                      ,
    output                              Get_final_value             
    );
	
wire                                    memControl_conva1_start    ;
	//3 indicates the input img is RGB
wire                   [3-1:0]          memControl_conva1_ifm_enable_write;
	
wire                   [1-1:0] memControl_conva1_wm_enable_write           ;
wire                   [3-1:0] memControl_convb2_wm_enable_write           ;
wire                   [3-1:0] memControl_conva3_wm_enable_write           ;
wire                   [1-1:0] memControl_fc1_wm_enable_write           ;
wire                   [1-1:0] memControl_fc2_wm_enable_write           ;

wire                   [DATA_WIDTH-1:0] memControl_riscv_data      ;
wire                   [ADDRESS_BITS-1:0]memControl_riscv_address   ;
	
wire                                    memControl_conva1_bm_enable_write;
wire                   [3-1:0] memControl_convb2_bm_enable_write           ;
wire                                    memControl_conva3_bm_enable_write;
wire                                    memControl_fc1_bm_enable_write;
wire                                    memControl_fc2_bm_enable_write;
			
	// Outputs of layer Conv 0
wire                   [DATA_WIDTH-1:0]  conva1_data_out_for_next       ;
wire                   [CONVA1_ADDRESS_SIZE_IFM-1:0] conva1_ifm_address_write_next  ;
wire                                    conva1_ifm_enable_write_next;
wire                                    conva1_start_to_next;
wire                                    conva1_ifm_sel_next;

	                                             // Outputs of Mem_Array 1 conva1 - pool1
	wire [DATA_WIDTH-1:0] mem_arr1_data_A_out_for_previous1;
	wire [DATA_WIDTH-1:0] mem_arr1_data_A_out_for_next1;
	wire [DATA_WIDTH-1:0] mem_arr1_data_B_out_for_next1;

	// Outputs of layer Pool 1
wire                                    pool1_ifm_enable_read_A_current;
wire                   [POOL1_ADDRESS_SIZE_IFM-1:0] pool1_ifm_address_read_A_current;
wire                                    pool1_ifm_enable_read_B_current;
wire                   [POOL1_ADDRESS_SIZE_IFM-1:0] pool1_ifm_address_read_B_current;
	wire [DATA_WIDTH-1 : 0] pool1_data_out_1;
wire                                    pool1_end_to_previous;
wire                   [DATA_WIDTH-1:0] pool1_data_out                ;
wire                   [CONVB2_ADDRESS_SIZE_IFM-1:0] pool1_ifm_address_write_next  ;
wire                                    pool1_ifm_enable_write_next;
wire                                    pool1_start_to_next;
wire                                    pool1_ifm_sel_next;

	                                             // Outputs of Mem_Array 2 pool1 - convb2
	wire [DATA_WIDTH-1:0] mem_arr2_data_A_out_for_next1;
			
	// Outputs of layer Conv 2
wire                                    convb2_end_to_previous;
wire                                    convb2_ifm_enable_read_A_current;
wire                                    convb2_ifm_enable_read_B_current;
wire                   [[CONVB2_ADDRESS_SIZE_IFM-1:0] convb2_ifm_address_read_A_current;
wire                   [[CONVB2_ADDRESS_SIZE_IFM-1:0] convb2_ifm_address_read_B_current;
wire                                    convb2_ifm_enable_read_next;
wire                                    convb2_ifm_enable_write_next;
wire                   [POOL2_ADDRESS_SIZE_IFM-1:0] convb2_ifm_address_read_next   ;
wire                   [POOL2_ADDRESS_SIZE_IFM-1:0] convb2_ifm_address_write_next  ;
	wire [DATA_WIDTH-1:0] convb2_data_out_for_next1;
	wire [DATA_WIDTH-1:0] convb2_data_out_for_next2;
	wire [DATA_WIDTH-1:0] convb2_data_out_for_next3;
wire                                    convb2_start_to_next;//all
wire                   [$clog2(pool2_IFM_DEPTH/convb2_NUMBER_OF_UNITS+1)-1:0] convb2_ifm_sel_next            ;// all
				

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
wire                                    pool2_ifm_enable_read_A_current;
wire                   [POOL2_ADDRESS_SIZE_IFM-1:0] pool2_ifm_address_read_A_current;
wire                                    pool2_ifm_enable_read_B_current;
wire                   [POOL2_ADDRESS_SIZE_IFM-1:0] pool2_ifm_address_read_B_current;
wire                                    pool2_end_to_previous;
wire                   [CONVA3_ADDRESS_SIZE_IFM-1:0] pool2_ifm_address_write_next  ;
wire                                    pool2_ifm_enable_write_next;
wire                                    pool2_start_to_next;
wire                                    pool2_ifm_sel_next;

	                                             // Outputs of Mem_Array 4 pool2 - conva3
	wire [DATA_WIDTH-1:0] mem_arr4_data_A_out_for_next1;
	wire [DATA_WIDTH-1:0] mem_arr4_data_A_out_for_next2;
	wire [DATA_WIDTH-1:0] mem_arr4_data_A_out_for_next3;
			
	// Outputs of layer Conv 4
wire                                    conva3_end_to_previous;
wire                                    conva3_ready;
wire                                    conva3_ifm_enable_read_A_current;
	wire [CONVA3_ADDRESS_SIZE_IFM-1:0] conva3_ifm_address_read_A_current;
wire                   [DATA_WIDTH-1:0] conva3_data_out_for_next       ;
wire                                    conva3_ifm_enable_write_next;
wire                                    conva3_ifm_enable_read_next;
wire                                    conva3_start_to_next;
wire                   [$clog2(CONVA3_IFM_DEPTH/conva3_NUMBER_OF_UNITS+1)-1:0] conva3_ifm_sel_previous        ;
wire                   [$clog2(FC1_IFM_DEPTH/conva3_NUMBER_OF_UNITS+1)-1:0] conva3_ifm_sel_next            ;

	                                             // Outputs of Mem_Array 5 conva3 - fc1
	wire [DATA_WIDTH-1:0] mem_arr5_data_A_out_for_previous1;
	wire [DATA_WIDTH-1:0] mem_arr5_data_A_out_for_next1;

	                                             // Outputs of Mem_Array 6 fc1 - fc2
	wire [DATA_WIDTH-1:0] mem_arr6_data_A_out_for_previous1;
	wire [DATA_WIDTH-1:0] mem_arr6_data_A_out_for_next1;

	//memory controler
    memory_control
    MEM_Cont
    (
	.clk (clk),
    .riscv_data_bus                    (riscv_data_bus            ),
    .riscv_address_bus                 (riscv_address_bus         ),
    .initialization_done               (initialization_done       ),
    .conva1_start                      (memControl_conva1_start   ),
    .conva1_ifm_enable_write           (memControl_conva1_ifm_enable_write),	
	.conva1_wm_enable_write(memControl_conva1_wm_enable_write),
	.pool1_wm_enable_write(memControl_pool1_wm_enable_write),
	.convb2_wm_enable_write(memControl_convb2_wm_enable_write),
	.pool2_wm_enable_write(memControl_pool2_wm_enable_write),
	.conva3_wm_enable_write(memControl_conva3_wm_enable_write),
	.fc1_wm_enable_write(memControl_fc1_wm_enable_write),
	.fc2_wm_enable_write(memControl_fc2_wm_enable_write),
	.conva1_bm_enable_write(memControl_conva1_bm_enable_write),
	.convb2_bm_enable_write(memControl_convb2_bm_enable_write),
	.conva3_bm_enable_write(memControl_conva3_bm_enable_write),
	.fc1_bm_enable_write(memControl_fc1_bm_enable_write),
	.fc2_bm_enable_write(memControl_fc2_bm_enable_write),
	
    .riscv_data                        (memControl_riscv_data     ),
    .riscv_address                     (memControl_riscv_address  ) 
	);

	/////////////////0 - top_conva1////////////////		
	////////////////////lsa msh kamla///////////////////////////
    /*
    top_conva1
    .DATA_WIDTH                        (DATA_WIDTH),
    .IFM_SIZE                          (CONVA1_IFM_SIZE),
    .IFM_DEPTH                         (CONVA1_IFM_DEPTH),
    .KERNAL_SIZE                       (CONVA1_KERNAL_SIZE),
    .NUMBER_OF_FILTERS                 (CONVA1_NUMBER_OF_FILTERS)), 
    .ARITH_TYPE                        (ARITH_TYPE)
    top_conva1_inst
    (
    .clk                               (clk                       ),
    .reset                             (reset                     ),
    .riscv_data                        (memControl_riscv_data     ),
    .riscv_address                     (memControl_riscv_address  ),
    .wm_enable_write                   (memControl_conva1_wm_enable_write),
    .bm_enable_write                   (memControl_conva1_bm_enable_write),
	// previous
    .start_from_previous               (memControl_conva1_start   ),
    .ifm_enable_write_previous         (memControl_conva1_ifm_enable_write),
    // next
    .end_from_next                     (pool1_end_to_previous     ),
    .data_out_for_next                 (conva1_data_out_for_next  ),
    .ifm_address_write_next            (conva1_ifm_address_write_next),
    .ifm_enable_write_next             (conva1_ifm_enable_write_next),
    .start_to_next                     (conva1_start_to_next      ),
    .ifm_sel_next                      (conva1_ifm_sel_next       ),
    .ready                             (ready                     ) 
    );

	/////////////////1 - mem_array_U1_D2_S28////////////////					
    mem_array_U1_D2_S28 #(
    .DATA_WIDTH                        (DATA_WIDTH                ),
    .IFM_SIZE                          (POOL1_IFM_SIZE),
    .NUMBER_OF_IFM                     (2                         ),
    .NUMBER_OF_UNITS                   (NUMBER_OF_UNITS)          ) 
    mem_array_U1_D2_S28_inst
    (.clk (clk),
    .ifm_sel                           (conva1_ifm_sel_next),
    .ifm_enable_write_previous         (conva1_ifm_enable_write_next),
    .ifm_enable_read_previous          (1'b0                      ),
    .ifm_address_write_previous        (conva1_ifm_address_write_next),
    .ifm_address_read_previous         ({POOL1_ADDRESS_SIZE_IFM{1'b0}}),

	 .data_in_from_previous1 		   (conva1_data_out_for_next),
	 .data_out_for_previous1		   (mem_arr1_data_A_out_for_previous1),
    .ifm_enable_read_A_next            (pool1_ifm_enable_read_A_current),
    .ifm_enable_read_B_next            (pool1_ifm_enable_read_B_current),
    .ifm_address_read_A_next           (pool1_ifm_address_read_A_current),
    .ifm_address_read_B_next           (pool1_ifm_address_read_B_current),
	 .data_out_A_for_next1(mem_arr1_data_A_out_for_next1),
	 .data_out_B_for_next1(mem_arr1_data_B_out_for_next1)
     );

	/////////////////1 - top_poola_S2_K2////////////////					
    top_poola_S2_K2 #(.DATA_WIDTH(DATA_WIDTH),
    #(
    .IFM_SIZE                          (POOL1_IFM_SIZE),
    .IFM_DEPTH                         (POOL1_IFM_DEPTH),
    .KERNAL_SIZE                       (POOL1_KERNAL_SIZE)) 
    top_poola_S2_K2_inst
    (
    .clk                               (clk                       ),
    .reset                             (reset                     ),
	 
    .start_from_previous               (conva1_start_to_next),
    .data_in_A                         (mem_arr1_data_A_out_for_next1),
    .data_in_B                         (mem_arr1_data_B_out_for_next1),
    .ifm_enable_read_A_current         (pool1_ifm_enable_read_A_current),
    .ifm_enable_read_B_current         (pool1_ifm_enable_read_B_current),
    .ifm_address_read_A_current        (pool1_ifm_address_read_A_current),
    .ifm_address_read_B_current        (pool1_ifm_address_read_B_current),
    .end_to_previous                   (pool1_end_to_previous),

    .end_from_next                     (convb2_end_to_previous),
    .data_out                          (pool1_data_out),
    .ifm_address_write_next            (pool1_ifm_address_write_next),
    .ifm_enable_write_next             (pool1_ifm_enable_write_next),
    .start_to_next                     (pool1_start_to_next),
    .ifm_sel_next                      (pool1_ifm_sel_next) 
    );


	/////////////////2 - mem_array_U1_D2_S14////////////////					
    mem_array_U1_D2_S14 #(
    .DATA_WIDTH                        (DATA_WIDTH                ),
    .IFM_SIZE                          (CONVB2_IFM_SIZE),
    .NUMBER_OF_IFM                     (2                         ),
    .NUMBER_OF_UNITS                   (NUMBER_OF_UNITS)          ) 
    mem_array_U1_D2_S14_inst
    (.clk (clk),
    .ifm_sel                           (pool1_ifm_sel_next),
    .ifm_enable_write_previous         (pool1_ifm_enable_write_next),
    .ifm_enable_read_previous          (1'b0                      ),
    .ifm_address_write_previous        (pool1_ifm_address_write_next),
    .ifm_address_read_previous         ({CONVB2_ADDRESS_SIZE_IFM{1'b0}}),

	 .data_in_from_previous1 		   (pool1_data_out_for_next),
	 .data_out_for_previous1		   (mem_arr2_data_A_out_for_previous1),
    .ifm_enable_read_A_next            (convb2_ifm_enable_read_A_current),
    .ifm_enable_read_B_next            (convb2_ifm_enable_read_B_current),
    .ifm_address_read_A_next           (convb2_ifm_address_read_A_current),
    .ifm_address_read_B_next           (convb2_ifm_address_read_B_current),
	 .data_out_A_for_next2(mem_arr2_data_A_out_for_next1),
	 .data_out_B_for_next2(mem_arr2_data_B_out_for_next1)
     );
    /////////////////2 - top_convb2////////////////		
    top_convb2 #(.IFM_SIZE(CONVB2_IFM_SIZE),
    .IFM_DEPTH                         (CONVB2_IFM_DEPTH),
    .KERNAL_SIZE                       (CONVB2_KERNAL_SIZE),
    .NUMBER_OF_FILTERS                 (CONVB2_NUMBER_OF_FILTERS)) 
    top_convb2_inst
    (
    .clk                               (clk                       ),
    .reset                             (reset                     ),
	 ///////////////////////////////////////////////////////////////
	.riscv_data                        (memControl_riscv_data     ),
    .riscv_address                     (memControl_riscv_address  ),	
    .wm_enable_write                   (memControl_convb2_wm_enable_write),
    .bm_enable_write                   (memControl_convb2_bm_enable_write),
    ///////////////////////////////////////////////////
    .ifm_sel_previous                  (convb2_ifm_sel_previous),
    .ifm_sel_next                      (convb2_ifm_sel_next),
    .ifm_enable_read_A_current         (convb2_ifm_enable_read_A_current),
    .ifm_address_read_A_current        (convb2_ifm_address_read_A_current),
    .data_in_from_previous           (mem_arr1_data_A_out_for_next),
    .ifm_enable_read_B_current         (                          ),
    .ifm_address_read_B_current        (                          ),
    .data_in_from_next1                 (mem_arr2_data_A_out_for_previous1),
    .data_out_for_next1                 (convb2_data_out_for_next1),

    .data_in_from_next2                 (mem_arr2_data_A_out_for_previous2),
    .data_out_for_next2                 (convb2_data_out_for_next2),

    .data_in_from_next3                 (mem_arr2_data_A_out_for_previous3),
    .data_out_for_next3                 (convb2_data_out_for_next3),

	 
    .start_from_previous               (pool1_start_to_next),
    .end_to_previous                   (convb2_end_to_previous),
    .conv_ready                        (1'b1  ),
    .end_from_next                     (pool2_end_to_previous),
    .ifm_enable_read_next              (convb2_ifm_enable_read_next),
    .ifm_enable_write_next             (convb2_ifm_enable_write_next),
    .start_to_next                     (convb2_start_to_next) 
    );
	

	/////////////////3 - mem_array_U3_D16_S7////////////////					
    mem_array_U3_D16_S7 #(
    .DATA_WIDTH                        (DATA_WIDTH                ),
    .IFM_SIZE                          (POOL2_IFM_SIZE),
    .NUMBER_OF_IFM                     (2                         ),
    .NUMBER_OF_UNITS                   (NUMBER_OF_UNITS)          ) 
    mem_array_U3_D16_S7_inst
    (.clk (clk),
    .ifm_sel                           (convb2_ifm_sel_next),
    .ifm_enable_write_previous         (convb2_ifm_enable_write_next),
    .ifm_enable_read_previous          (1'b0                      ),
    .ifm_address_write_previous        (convb2_ifm_address_write_next),
    .ifm_address_read_previous         ({POOL2_ADDRESS_SIZE_IFM{1'b0}}),

	 .data_in_from_previous1 		   (convb2_data_out_for_next),
	 .data_in_from_previous2 		   (convb2_data_out_for_next),
	 .data_in_from_previous3 		   (convb2_data_out_for_next),
	 .data_out_for_previous1		   (mem_arr3_data_A_out_for_previous1),
	 .data_out_for_previous2		   (mem_arr3_data_A_out_for_previous2),
	 .data_out_for_previous3		   (mem_arr3_data_A_out_for_previous3),
    .ifm_enable_read_A_next            (pool2_ifm_enable_read_A_current),
    .ifm_enable_read_B_next            (pool2_ifm_enable_read_B_current),
    .ifm_address_read_A_next           (pool2_ifm_address_read_A_current),
    .ifm_address_read_B_next           (pool2_ifm_address_read_B_current),
	 .data_out_A_for_next3(mem_arr3_data_A_out_for_next1),
	 .data_out_B_for_next3(mem_arr3_data_B_out_for_next1),
	 .data_out_A_for_next3(mem_arr3_data_A_out_for_next2),
	 .data_out_B_for_next3(mem_arr3_data_B_out_for_next2),
	 .data_out_A_for_next3(mem_arr3_data_A_out_for_next3),
	 .data_out_B_for_next3(mem_arr3_data_B_out_for_next3)
     );

				
	/////////////////3 - top_poolb_U3_S2_K2////////////////					
    top_poolb_U3_S2_K2 #(
	.DATA_WIDTH						   (DATA_WIDTH),
	.IFM_SIZE    					   (POOL2_IFM_SIZE),
    .IFM_DEPTH                         (POOL2_IFM_DEPTH           ),
    .KERNAL_SIZE                       (POOL2_KERNAL_SIZE)        ) 
	top_poolb_U3_S2_K2_inst
	(
	.clk                               (clk                       ),
    .reset                             (reset                     ),
	 
    .start_from_previous               (convb2_start_to_next       ),
	.ifm_enable_read_A_current         (pool2_ifm_enable_read_A_current),
    .ifm_enable_read_B_current         (pool2_ifm_enable_read_B_current),
    .ifm_address_read_A_current        (pool2_ifm_address_read_A_current),
    .ifm_address_read_B_current        (pool2_ifm_address_read_B_current),
	.data_in_A_unit1                    (mem_arr3_data_A_out_for_next1),
    .data_in_B_unit1                    (mem_arr3_data_B_out_for_next1),
	.data_in_A_unit2                    (mem_arr3_data_A_out_for_next2),
    .data_in_B_unit2                    (mem_arr3_data_B_out_for_next2),
	.data_in_A_unit3                    (mem_arr3_data_A_out_for_next3),
    .data_in_B_unit3                    (mem_arr3_data_B_out_for_next3),
    .end_to_previous                   (pool2_end_to_previous     ),
     
    .conv_ready                        (conva3_ready              ),
    .end_from_next                     (conva3_end_to_previous    ),
	.data_out_1                        (pool1_data_out_1          ),
	.data_out_2                        (convb2_data_out_2          ),
	.data_out_3                        (pool2_data_out_3          ),
	.ifm_address_write_next            (pool2_ifm_address_write_next),
    .ifm_enable_write_next             (pool2_ifm_enable_write_next),
    .start_to_next                     (pool2_start_to_next       ),
    .ifm_sel_next                      (pool2_ifm_sel_next        ) 
	);


	/////////////////4 - mem_array_U3_D16_S5////////////////		
    mem_array_U3_D16_S5 #(.DATA_WIDTH(DATA_WIDTH),
    .IFM_SIZE                          (CONVA3_IFM_SIZE),
    .NUMBER_OF_IFM                     (2                         ),
    .NUMBER_OF_UNITS                   (NUMBER_OF_UNITS           ) 
    mem_array_U3_D16_S5_inst
    (.clk (clk),
    .ifm_sel                           (pool2_ifm_sel_next),
    .ifm_enable_write_previous         (pool2_ifm_enable_write_next),
    .ifm_enable_read_previous          (1'b0                      ),
    .ifm_address_write_previous        (pool2_ifm_address_write_next),
    .ifm_address_read_previous         (                          ),

	 .data_in_from_previous1(pool2_data_out_for_next),
	 .data_in_from_previous2(pool2_data_out_for_next),
	 .data_in_from_previous3(pool2_data_out_for_next),
	 .data_out_for_previous1(mem_arr4_data_A_out_for_previous1),
	 .data_out_for_previous2(mem_arr4_data_A_out_for_previous2),
	 .data_out_for_previous3(mem_arr4_data_A_out_for_previous3),
    .ifm_enable_read_A_next            (conva3_ifm_enable_read_A_current),
    .ifm_enable_read_B_next            (conva3_ifm_enable_read_B_current),
    .ifm_address_read_A_next           (conva3_ifm_address_read_A_current),
    .ifm_address_read_B_next           (conva3_ifm_address_read_B_current),
	 .data_out_A_for_next4(mem_arr4_data_A_out_for_next1),
	 .data_out_B_for_next4(mem_arr4_data_B_out_for_next1),
	 .data_out_A_for_next4(mem_arr4_data_A_out_for_next2),
	 .data_out_B_for_next4(mem_arr4_data_B_out_for_next2),
	 .data_out_A_for_next4(mem_arr4_data_A_out_for_next3),
	 .data_out_B_for_next4(mem_arr4_data_B_out_for_next3)
     );
				
	/////////////////4 - top_conva3////////////////		
    top_conva3 #(
    .IFM_SIZE(CONVA3_IFM_SIZE),
    .IFM_DEPTH                         (CONVA3_IFM_DEPTH),
    .KERNAL_SIZE                       (CONVA3_KERNAL_SIZE),
    .NUMBER_OF_FILTERS                 (CONVA3_NUMBER_OF_FILTERS)) 
    top_conva3_inst
    (
    .clk                               (clk                       ),
    .reset                             (reset                     ),
	 
    .riscv_data                        (memControl_riscv_data     ),
    .riscv_address                     (memControl_riscv_address  ),	
    .wm_enable_write                   (memControl_conva3_wm_enable_write),
    .bm_enable_write                   (memControl_conva3_bm_enable_write),
    
    .ifm_sel_previous                  (conva3_ifm_sel_previous),
    .ifm_sel_next                      (conva3_ifm_sel_next),
    .ifm_enable_read_A_current         (conva3_ifm_enable_read_A_current),
    .ifm_address_read_A_current        (conva3_ifm_address_read_A_current),
    .ifm_enable_read_B_current         (                          ),
    .ifm_address_read_B_current        (                          ),
	 .data_in_A_from_previous1(mem_arr4_data_A_out_for_next1),
	 .data_in_A_from_previous2(mem_arr4_data_A_out_for_next2),
	 .data_in_A_from_previous3(mem_arr4_data_A_out_for_next3),
	 
    .start_from_previous               (pool2_start_to_next),
    .end_to_previous                   (conva3_end_to_previous),
    .ready                             (conva3_ready),
    .end_from_next                     (fc1_end_to_previous),
    .data_in_from_next                 (fc1_data_out_for_previous),
    .data_out_for_next                 (conva3_data_out_for_next),
    .ifm_enable_read_next              (conva3_ifm_enable_read_next),
    .ifm_enable_write_next             (conva3_ifm_enable_write_next),
    .start_to_next                     (conva3_start_to_next) 
    );
	

				
	/////////////////5 - top_conva3////////////////					
    top_conva3 #(.DATA_WIDTH(DATA_WIDTH),



				
	/////////////////6 - top_conva3////////////////					
    top_conva3 #(.DATA_WIDTH(DATA_WIDTH),


