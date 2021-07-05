`timescale 1ns / 1ps


module 
 mem_unit_3 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH				= 32,
///////////architecture parameters//////
	IFM_SIZE				= 16, 
    ADDRESS_SIZE_IFM		= $clog2(IFM_SIZE*IFM_SIZE))

	)(
	input clk,
	
	input [ADDRESS_SIZE_IFM-1:0]     Address_A,
	input [ADDRESS_SIZE_IFM-1:0]     Address_B,
	
	input Enable_Write_A_Mem, Enable_Read_A_Mem,
	input Enable_Write_B_Mem, Enable_Read_B_Mem,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem1,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem1,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem2,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem2,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem3,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem3,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem1,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem1,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem2,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem2,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem3,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem3
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM1 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem1),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem1),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem1),
		.Data_Output_B(Data_Output_B_Mem1)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM2 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem2),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem2),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem2),
		.Data_Output_B(Data_Output_B_Mem2)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM3 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem3),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem3),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem3),
		.Data_Output_B(Data_Output_B_Mem3)
	);
	
endmodule