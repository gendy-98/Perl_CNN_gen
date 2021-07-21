`timescale 1ns / 1ps


module 
 mem_unit_16 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH				= 32,
///////////architecture parameters//////
	IFM_SIZE				= 16, 
    ADDRESS_SIZE_IFM		= $clog2(IFM_SIZE*IFM_SIZE)

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
	input [DATA_WIDTH-1:0] Data_Input_A_Mem4,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem4,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem5,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem5,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem6,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem6,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem7,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem7,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem8,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem8,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem9,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem9,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem10,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem10,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem11,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem11,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem12,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem12,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem13,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem13,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem14,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem14,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem15,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem15,
	input [DATA_WIDTH-1:0] Data_Input_A_Mem16,
	input [DATA_WIDTH-1:0] Data_Input_B_Mem16,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem1,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem1,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem2,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem2,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem3,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem3,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem4,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem4,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem5,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem5,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem6,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem6,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem7,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem7,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem8,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem8,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem9,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem9,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem10,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem10,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem11,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem11,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem12,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem12,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem13,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem13,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem14,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem14,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem15,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem15,
	output [DATA_WIDTH-1:0] Data_Output_A_Mem16,
	output [DATA_WIDTH-1:0] Data_Output_B_Mem16
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
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM4 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem4),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem4),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem4),
		.Data_Output_B(Data_Output_B_Mem4)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM5 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem5),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem5),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem5),
		.Data_Output_B(Data_Output_B_Mem5)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM6 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem6),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem6),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem6),
		.Data_Output_B(Data_Output_B_Mem6)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM7 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem7),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem7),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem7),
		.Data_Output_B(Data_Output_B_Mem7)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM8 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem8),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem8),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem8),
		.Data_Output_B(Data_Output_B_Mem8)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM9 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem9),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem9),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem9),
		.Data_Output_B(Data_Output_B_Mem9)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM10 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem10),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem10),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem10),
		.Data_Output_B(Data_Output_B_Mem10)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM11 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem11),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem11),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem11),
		.Data_Output_B(Data_Output_B_Mem11)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM12 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem12),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem12),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem12),
		.Data_Output_B(Data_Output_B_Mem12)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM13 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem13),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem13),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem13),
		.Data_Output_B(Data_Output_B_Mem13)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM14 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem14),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem14),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem14),
		.Data_Output_B(Data_Output_B_Mem14)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM15 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem15),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem15),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem15),
		.Data_Output_B(Data_Output_B_Mem15)
	);
	
	
	true_dual_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM16 (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem16),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem16),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem16),
		.Data_Output_B(Data_Output_B_Mem16)
	);
	
endmodule