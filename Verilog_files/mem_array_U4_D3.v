`timescale 1ns / 1ps


module 
 mem_array_U4_D3 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE              = 32,                                                
    NUMBER_OF_IFM         = 3,
    NUMBER_OF_UNITS       = 4,
    ADDRESS_SIZE_IFM      = $clog2(IFM_SIZE*IFM_SIZE))

	)(
	input clk,
	input [$clog2($ceil(NUMBER_OF_IFM/NUMBER_OF_UNITS))-1:0] ifm_sel,
	input                        ifm_enable_write_previous,            
	input                        ifm_enable_read_previous, 
	input  [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous,
	input  [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous,	

	input [DATA_WIDTH-1:0] data_in_from_previous1,
	input [DATA_WIDTH-1:0] data_in_from_previous2,
	input [DATA_WIDTH-1:0] data_in_from_previous3,
	input [DATA_WIDTH-1:0] data_in_from_previous4,
	output reg [DATA_WIDTH-1:0] data_out_for_previous1,
	output reg [DATA_WIDTH-1:0] data_out_for_previous2,
	output reg [DATA_WIDTH-1:0] data_out_for_previous3,
	output reg [DATA_WIDTH-1:0] data_out_for_previous4,
	input                        ifm_enable_read_A_next,
    input                        ifm_enable_read_B_next,
	input [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next,
	input [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next1,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next1,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next2,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next2,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next3,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next3,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next4,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next4
	);
	
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem1;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem1;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem2;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem2;
	wire [DATA_WIDTH-1:0] Data_Output_A_Mem3;
	wire [DATA_WIDTH-1:0] Data_Output_B_Mem3;
	
	wire ifm_enable_write_previous_dMuxOut1;
	wire ifm_enable_read_previous_dMuxOut1;
	wire ifm_enable_read_A_next_dMuxOut1;
	wire ifm_enable_read_B_next_dMuxOut1;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut1;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut1;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut1;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut1;
	
	demux_1_to_1 d0(
	.din(ifm_enable_write_previous),
	.sel(ifm_sel),
	.dout_1(ifm_enable_write_previous_dMuxOut1)
	);

	demux_1_to_1 d1(
	.din(ifm_enable_read_previous),
	.sel(ifm_sel),
	.dout_1(ifm_enable_read_previous_dMuxOut1)
	);

	demux_1_to_1 d2(
	.din(ifm_enable_read_B_next),
	.sel(ifm_sel),
	.dout_1(ifm_enable_read_B_next_dMuxOut1)
	);

	demux_1_to_1 d3(
	.din(ifm_enable_write_previous),
	.sel(ifm_sel),
	.dout_1(ifm_enable_write_previous_dMuxOut1)
	);

	demux_1_to_1_10bits d4(
	.din(ifm_address_write_previous),
	.sel(ifm_sel),
	.dout_1(ifm_address_write_previous_dMuxOut1)
	);

	demux_1_to_1_10bits d5(
	.din(ifm_address_read_previous),
	.sel(ifm_sel),
	.dout_1(ifm_address_read_previous_dMuxOut1)
	);

	demux_1_to_1_10bits d6(
	.din(ifm_address_read_A_next),
	.sel(ifm_sel),
	.dout_1(ifm_address_read_A_next_dMuxOut1)
	);

	demux_1_to_1_10bits d7(
	.din(ifm_address_read_B_next),
	.sel(ifm_sel),
	.dout_1(ifm_address_read_B_next_dMuxOut1)
	);

	
    always @*
    begin

        case(ifm_sel)
		default:
		begin
			data_out_for_previous1 = Data_Output_B_Mem1;
			data_out_for_previous2 = Data_Output_B_Mem2;
			data_out_for_previous3 = Data_Output_B_Mem3;
			data_out_for_previous4 = 0;
		
			data_out_A_for_next1 = Data_Output_A_Mem1;
			data_out_B_for_next1 = Data_Output_B_Mem1;
		
			data_out_A_for_next2 = Data_Output_A_Mem2;
			data_out_B_for_next2 = Data_Output_B_Mem2;
		
			data_out_A_for_next3 = Data_Output_A_Mem3;
			data_out_B_for_next3 = Data_Output_B_Mem3;
		
			data_out_A_for_next4 = 0;
			data_out_B_for_next4 = 0;
		end
		
		endcase
		
	end
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	IFM1 (
    .clk(clk),
	
	.Data_Input_A(data_in_from_previous1),
	.Data_Input_B('b0),
	
	.Address_A ( ifm_address_write_previous_dMuxOut1 | ifm_address_read_A_next_dMuxOut1 ),
    .Address_B ( ifm_address_read_previous_dMuxOut1  | ifm_address_read_B_next_dMuxOut1 ),  
	
	.Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut1),
    .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut1),
    .Enable_Write_B_Mem (1'b0),
    .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut1 | ifm_enable_read_B_next_dMuxOut1),
	  
	
    .Data_Output_A(Data_Output_A_Mem1),
    .Data_Output_B(Data_Output_B_Mem1)
	);
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	IFM2 (
    .clk(clk),
	
	.Data_Input_A(data_in_from_previous2),
	.Data_Input_B('b0),
	
	.Address_A ( ifm_address_write_previous_dMuxOut1 | ifm_address_read_A_next_dMuxOut1 ),
    .Address_B ( ifm_address_read_previous_dMuxOut1  | ifm_address_read_B_next_dMuxOut1 ),  
	
	.Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut1),
    .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut1),
    .Enable_Write_B_Mem (1'b0),
    .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut1 | ifm_enable_read_B_next_dMuxOut1),
	  
	
    .Data_Output_A(Data_Output_A_Mem2),
    .Data_Output_B(Data_Output_B_Mem2)
	);
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	IFM3 (
    .clk(clk),
	
	.Data_Input_A(data_in_from_previous3),
	.Data_Input_B('b0),
	
	.Address_A ( ifm_address_write_previous_dMuxOut1 | ifm_address_read_A_next_dMuxOut1 ),
    .Address_B ( ifm_address_read_previous_dMuxOut1  | ifm_address_read_B_next_dMuxOut1 ),  
	
	.Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut1),
    .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut1),
    .Enable_Write_B_Mem (1'b0),
    .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut1 | ifm_enable_read_B_next_dMuxOut1),
	  
	
    .Data_Output_A(Data_Output_A_Mem3),
    .Data_Output_B(Data_Output_B_Mem3)
	);
	
endmodule