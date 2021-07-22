`timescale 1ns / 1ps


module 
 FCB2_DP #(parameter
///////////advanced parameters//////////
	ARITH_TYPE             = 0,  
	DATA_WIDTH            = 32,
	ADDRESS_BITS           = 16,
	IFM_DEPTH              = 84,
	ADDRESS_SIZE_WM  = $clog2(IFM_DEPTH),
	NUMBER_OF_WM           = 10
)(
	input clk,
    input reset,
	/////////////////////////////////////////////////////
    input [DATA_WIDTH-1:0]   riscv_data,
	input [ADDRESS_BITS-1:0] riscv_address,
	/////////////////////////////////////////////////////
	input wm_addr_sel,
    input wm_enable_read,
    input [NUMBER_OF_WM - 1:0] wm_enable_write,
	input [ADDRESS_SIZE_WM-1:0] wm_address_read_current,
	/////////////////////////////////////////////////////
    input bm_enable_write,
	/////////////////////////////////////////////////////
	input enable_read_current,
	input [ ADDRESS_SIZE_WM-1 :  0 ] sel_ifm,
	
	input fc_output_ready,
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
	output [DATA_WIDTH-1:0]  data_bias_1  ,
	output [DATA_WIDTH-1:0]  data_bias_2  ,
	output [DATA_WIDTH-1:0]  data_bias_3  ,
	output [DATA_WIDTH-1:0]  data_bias_4  ,
	output [DATA_WIDTH-1:0]  data_bias_5  ,
	output [DATA_WIDTH-1:0]  data_bias_6  ,
	output [DATA_WIDTH-1:0]  data_bias_7  ,
	output [DATA_WIDTH-1:0]  data_bias_8  ,
	output [DATA_WIDTH-1:0]  data_bias_9  ,
	output [DATA_WIDTH-1:0]  data_bias_10  ,
	output reg [DATA_WIDTH-1:0] reg_out_FC_1,
	output reg [DATA_WIDTH-1:0] reg_out_FC_2,
	output reg [DATA_WIDTH-1:0] reg_out_FC_3,
	output reg [DATA_WIDTH-1:0] reg_out_FC_4,
	output reg [DATA_WIDTH-1:0] reg_out_FC_5,
	output reg [DATA_WIDTH-1:0] reg_out_FC_6,
	output reg [DATA_WIDTH-1:0] reg_out_FC_7,
	output reg [DATA_WIDTH-1:0] reg_out_FC_8,
	output reg [DATA_WIDTH-1:0] reg_out_FC_9,
	output reg [DATA_WIDTH-1:0] reg_out_FC_10
	);
////////////////////////Signal declaration/////////////////
    wire [DATA_WIDTH-1:0] Data_Weight_1;
    wire [DATA_WIDTH-1:0] Data_Weight_2;
    wire [DATA_WIDTH-1:0] Data_Weight_3;
    wire [DATA_WIDTH-1:0] Data_Weight_4;
    wire [DATA_WIDTH-1:0] Data_Weight_5;
    wire [DATA_WIDTH-1:0] Data_Weight_6;
    wire [DATA_WIDTH-1:0] Data_Weight_7;
    wire [DATA_WIDTH-1:0] Data_Weight_8;
    wire [DATA_WIDTH-1:0] Data_Weight_9;
    wire [DATA_WIDTH-1:0] Data_Weight_10;
	wire [DATA_WIDTH - 1 : 0] s_Data_out_FC_1  ;
	wire [DATA_WIDTH - 1 : 0] s_Data_out_FC_2  ;
	wire [DATA_WIDTH - 1 : 0] s_Data_out_FC_3  ;
	wire [DATA_WIDTH - 1 : 0] s_Data_out_FC_4  ;
	wire [DATA_WIDTH - 1 : 0] s_Data_out_FC_5  ;
	wire [DATA_WIDTH - 1 : 0] s_Data_out_FC_6  ;
	wire [DATA_WIDTH - 1 : 0] s_Data_out_FC_7  ;
	wire [DATA_WIDTH - 1 : 0] s_Data_out_FC_8  ;
	wire [DATA_WIDTH - 1 : 0] s_Data_out_FC_9  ;
	wire [DATA_WIDTH - 1 : 0] s_Data_out_FC_10  ;
  
	reg  [DATA_WIDTH - 1 : 0] Data_Read_mux;
	
	wire [ADDRESS_SIZE_WM-1:0] wm_address;
    assign wm_address = wm_addr_sel ? wm_address_read_current : riscv_address;
	
	single_port_memory  #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_DEPTH))
	W1
	(
	.clk(clk),
	.Enable_Write(wm_enable_write[0]),
	.Enable_Read(wm_enable_read),
	.Address(wm_address),
	.Data_Input(riscv_data),
	.Data_Output(Data_Weight_1)
	);
	single_port_memory  #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_DEPTH))
	W2
	(
	.clk(clk),
	.Enable_Write(wm_enable_write[1]),
	.Enable_Read(wm_enable_read),
	.Address(wm_address),
	.Data_Input(riscv_data),
	.Data_Output(Data_Weight_2)
	);
	single_port_memory  #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_DEPTH))
	W3
	(
	.clk(clk),
	.Enable_Write(wm_enable_write[2]),
	.Enable_Read(wm_enable_read),
	.Address(wm_address),
	.Data_Input(riscv_data),
	.Data_Output(Data_Weight_3)
	);
	single_port_memory  #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_DEPTH))
	W4
	(
	.clk(clk),
	.Enable_Write(wm_enable_write[3]),
	.Enable_Read(wm_enable_read),
	.Address(wm_address),
	.Data_Input(riscv_data),
	.Data_Output(Data_Weight_4)
	);
	single_port_memory  #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_DEPTH))
	W5
	(
	.clk(clk),
	.Enable_Write(wm_enable_write[4]),
	.Enable_Read(wm_enable_read),
	.Address(wm_address),
	.Data_Input(riscv_data),
	.Data_Output(Data_Weight_5)
	);
	single_port_memory  #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_DEPTH))
	W6
	(
	.clk(clk),
	.Enable_Write(wm_enable_write[5]),
	.Enable_Read(wm_enable_read),
	.Address(wm_address),
	.Data_Input(riscv_data),
	.Data_Output(Data_Weight_6)
	);
	single_port_memory  #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_DEPTH))
	W7
	(
	.clk(clk),
	.Enable_Write(wm_enable_write[6]),
	.Enable_Read(wm_enable_read),
	.Address(wm_address),
	.Data_Input(riscv_data),
	.Data_Output(Data_Weight_7)
	);
	single_port_memory  #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_DEPTH))
	W8
	(
	.clk(clk),
	.Enable_Write(wm_enable_write[7]),
	.Enable_Read(wm_enable_read),
	.Address(wm_address),
	.Data_Input(riscv_data),
	.Data_Output(Data_Weight_8)
	);
	single_port_memory  #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_DEPTH))
	W9
	(
	.clk(clk),
	.Enable_Write(wm_enable_write[8]),
	.Enable_Read(wm_enable_read),
	.Address(wm_address),
	.Data_Input(riscv_data),
	.Data_Output(Data_Weight_9)
	);
	single_port_memory  #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_DEPTH))
	W10
	(
	.clk(clk),
	.Enable_Write(wm_enable_write[9]),
	.Enable_Read(wm_enable_read),
	.Address(wm_address),
	.Data_Input(riscv_data),
	.Data_Output(Data_Weight_10)
	);
	
    always @(*)
    begin
        case (sel_ifm)
        7'd0 : Data_Read_mux =  Data_in_1 ;
        7'd1 : Data_Read_mux =  Data_in_2 ;
        7'd2 : Data_Read_mux =  Data_in_3 ;
        7'd3 : Data_Read_mux =  Data_in_4 ;
        7'd4 : Data_Read_mux =  Data_in_5 ;
        7'd5 : Data_Read_mux =  Data_in_6 ;
        7'd6 : Data_Read_mux =  Data_in_7 ;
        7'd7 : Data_Read_mux =  Data_in_8 ;
        7'd8 : Data_Read_mux =  Data_in_9 ;
        7'd9 : Data_Read_mux =  Data_in_10 ;
        7'd10 : Data_Read_mux =  Data_in_11 ;
        7'd11 : Data_Read_mux =  Data_in_12 ;
        7'd12 : Data_Read_mux =  Data_in_13 ;
        7'd13 : Data_Read_mux =  Data_in_14 ;
        7'd14 : Data_Read_mux =  Data_in_15 ;
        7'd15 : Data_Read_mux =  Data_in_16 ;
        7'd16 : Data_Read_mux =  Data_in_17 ;
        7'd17 : Data_Read_mux =  Data_in_18 ;
        7'd18 : Data_Read_mux =  Data_in_19 ;
        7'd19 : Data_Read_mux =  Data_in_20 ;
        7'd20 : Data_Read_mux =  Data_in_21 ;
        7'd21 : Data_Read_mux =  Data_in_22 ;
        7'd22 : Data_Read_mux =  Data_in_23 ;
        7'd23 : Data_Read_mux =  Data_in_24 ;
        7'd24 : Data_Read_mux =  Data_in_25 ;
        7'd25 : Data_Read_mux =  Data_in_26 ;
        7'd26 : Data_Read_mux =  Data_in_27 ;
        7'd27 : Data_Read_mux =  Data_in_28 ;
        7'd28 : Data_Read_mux =  Data_in_29 ;
        7'd29 : Data_Read_mux =  Data_in_30 ;
        7'd30 : Data_Read_mux =  Data_in_31 ;
        7'd31 : Data_Read_mux =  Data_in_32 ;
        7'd32 : Data_Read_mux =  Data_in_33 ;
        7'd33 : Data_Read_mux =  Data_in_34 ;
        7'd34 : Data_Read_mux =  Data_in_35 ;
        7'd35 : Data_Read_mux =  Data_in_36 ;
        7'd36 : Data_Read_mux =  Data_in_37 ;
        7'd37 : Data_Read_mux =  Data_in_38 ;
        7'd38 : Data_Read_mux =  Data_in_39 ;
        7'd39 : Data_Read_mux =  Data_in_40 ;
        7'd40 : Data_Read_mux =  Data_in_41 ;
        7'd41 : Data_Read_mux =  Data_in_42 ;
        7'd42 : Data_Read_mux =  Data_in_43 ;
        7'd43 : Data_Read_mux =  Data_in_44 ;
        7'd44 : Data_Read_mux =  Data_in_45 ;
        7'd45 : Data_Read_mux =  Data_in_46 ;
        7'd46 : Data_Read_mux =  Data_in_47 ;
        7'd47 : Data_Read_mux =  Data_in_48 ;
        7'd48 : Data_Read_mux =  Data_in_49 ;
        7'd49 : Data_Read_mux =  Data_in_50 ;
        7'd50 : Data_Read_mux =  Data_in_51 ;
        7'd51 : Data_Read_mux =  Data_in_52 ;
        7'd52 : Data_Read_mux =  Data_in_53 ;
        7'd53 : Data_Read_mux =  Data_in_54 ;
        7'd54 : Data_Read_mux =  Data_in_55 ;
        7'd55 : Data_Read_mux =  Data_in_56 ;
        7'd56 : Data_Read_mux =  Data_in_57 ;
        7'd57 : Data_Read_mux =  Data_in_58 ;
        7'd58 : Data_Read_mux =  Data_in_59 ;
        7'd59 : Data_Read_mux =  Data_in_60 ;
        7'd60 : Data_Read_mux =  Data_in_61 ;
        7'd61 : Data_Read_mux =  Data_in_62 ;
        7'd62 : Data_Read_mux =  Data_in_63 ;
        7'd63 : Data_Read_mux =  Data_in_64 ;
        7'd64 : Data_Read_mux =  Data_in_65 ;
        7'd65 : Data_Read_mux =  Data_in_66 ;
        7'd66 : Data_Read_mux =  Data_in_67 ;
        7'd67 : Data_Read_mux =  Data_in_68 ;
        7'd68 : Data_Read_mux =  Data_in_69 ;
        7'd69 : Data_Read_mux =  Data_in_70 ;
        7'd70 : Data_Read_mux =  Data_in_71 ;
        7'd71 : Data_Read_mux =  Data_in_72 ;
        7'd72 : Data_Read_mux =  Data_in_73 ;
        7'd73 : Data_Read_mux =  Data_in_74 ;
        7'd74 : Data_Read_mux =  Data_in_75 ;
        7'd75 : Data_Read_mux =  Data_in_76 ;
        7'd76 : Data_Read_mux =  Data_in_77 ;
        7'd77 : Data_Read_mux =  Data_in_78 ;
        7'd78 : Data_Read_mux =  Data_in_79 ;
        7'd79 : Data_Read_mux =  Data_in_80 ;
        7'd80 : Data_Read_mux =  Data_in_81 ;
        7'd81 : Data_Read_mux =  Data_in_82 ;
        7'd82 : Data_Read_mux =  Data_in_83 ;
        7'd83 : Data_Read_mux =  Data_in_84 ;
        default :  Data_Read_mux ={DATA_WIDTH {1'b0}} ;
        endcase
    end
    
    wire [DATA_WIDTH-1:0] Data_for_FC;
    wire [DATA_WIDTH-1:0] relu_out ;

	relu #(.DATA_WIDTH(DATA_WIDTH)) Active (.in(Data_Read_mux),.out (relu_out),.relu_enable(1'b1));
	
	Register #(.DATA_WIDTH(DATA_WIDTH)) 
	R (
	   .clk(clk),
	   .reset(reset),
	   .Enable(enable_read_current),
	   .Data_in(relu_out),
	   .Data_out(Data_for_FC)
	   ); 
 


	fully_connected_10 #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))
	F1
	(
	.Data_in(Data_for_FC),
	.Data_Weight_1(Data_Weight_1),
	.Data_Weight_2(Data_Weight_2),
	.Data_Weight_3(Data_Weight_3),
	.Data_Weight_4(Data_Weight_4),
	.Data_Weight_5(Data_Weight_5),
	.Data_Weight_6(Data_Weight_6),
	.Data_Weight_7(Data_Weight_7),
	.Data_Weight_8(Data_Weight_8),
	.Data_Weight_9(Data_Weight_9),
	.Data_Weight_10(Data_Weight_10),
	.Data_out_FC_1(s_Data_out_FC_1),
	.Data_out_FC_2(s_Data_out_FC_2),
	.Data_out_FC_3(s_Data_out_FC_3),
	.Data_out_FC_4(s_Data_out_FC_4),
	.Data_out_FC_5(s_Data_out_FC_5),
	.Data_out_FC_6(s_Data_out_FC_6),
	.Data_out_FC_7(s_Data_out_FC_7),
	.Data_out_FC_8(s_Data_out_FC_8),
	.Data_out_FC_9(s_Data_out_FC_9),
	.Data_out_FC_10(s_Data_out_FC_10)
);

  
	fo_fifo_10 #(.DATA_WIDTH(DATA_WIDTH), .REGS_NUM(10))
	FIFO1
	(
		.clk(clk),
		.fifo_data_in(riscv_data), 
		.fifo_enable(bm_enable_write),
		.fifo_data_out_1 (data_bias_1),
		.fifo_data_out_2 (data_bias_2),
		.fifo_data_out_3 (data_bias_3),
		.fifo_data_out_4 (data_bias_4),
		.fifo_data_out_5 (data_bias_5),
		.fifo_data_out_6 (data_bias_6),
		.fifo_data_out_7 (data_bias_7),
		.fifo_data_out_8 (data_bias_8),
		.fifo_data_out_9 (data_bias_9),
		.fifo_data_out_10 (data_bias_10)
	);
	
	always @ (posedge clk , posedge reset )
        begin 
         if (reset)
           begin 
           reg_out_FC_1  <= {DATA_WIDTH{1'b0}} ;
           reg_out_FC_2  <= {DATA_WIDTH{1'b0}} ;
           reg_out_FC_3  <= {DATA_WIDTH{1'b0}} ;
           reg_out_FC_4  <= {DATA_WIDTH{1'b0}} ;
           reg_out_FC_5  <= {DATA_WIDTH{1'b0}} ;
           reg_out_FC_6  <= {DATA_WIDTH{1'b0}} ;
           reg_out_FC_7  <= {DATA_WIDTH{1'b0}} ;
           reg_out_FC_8  <= {DATA_WIDTH{1'b0}} ;
           reg_out_FC_9  <= {DATA_WIDTH{1'b0}} ;
           reg_out_FC_10  <= {DATA_WIDTH{1'b0}} ;
           end
         else if (fc_output_ready)
            begin 
            reg_out_FC_1  <=s_Data_out_FC_1   ;
            reg_out_FC_2  <=s_Data_out_FC_2   ;
            reg_out_FC_3  <=s_Data_out_FC_3   ;
            reg_out_FC_4  <=s_Data_out_FC_4   ;
            reg_out_FC_5  <=s_Data_out_FC_5   ;
            reg_out_FC_6  <=s_Data_out_FC_6   ;
            reg_out_FC_7  <=s_Data_out_FC_7   ;
            reg_out_FC_8  <=s_Data_out_FC_8   ;
            reg_out_FC_9  <=s_Data_out_FC_9   ;
            reg_out_FC_10  <=s_Data_out_FC_10   ;
           
           end
        end
		
    


endmodule
