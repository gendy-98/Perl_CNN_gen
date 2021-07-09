`timescale 1ns / 1ps


module 
 mem_array_U4_D16 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE              = 14,                                                
    NUMBER_OF_IFM         = 16,
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
	
	demux_1_to_4 d0(
	.din(ifm_enable_write_previous),
	.sel(ifm_sel),
	.dout_1(ifm_enable_write_previous_dMuxOut1),
	.dout_2(ifm_enable_write_previous_dMuxOut2),
	.dout_3(ifm_enable_write_previous_dMuxOut3),
	.dout_4(ifm_enable_write_previous_dMuxOut4)
	);

	demux_1_to_4 d1(
	.din(ifm_enable_read_previous),
	.sel(ifm_sel),
	.dout_1(ifm_enable_read_previous_dMuxOut1),
	.dout_2(ifm_enable_read_previous_dMuxOut2),
	.dout_3(ifm_enable_read_previous_dMuxOut3),
	.dout_4(ifm_enable_read_previous_dMuxOut4)
	);

	demux_1_to_4 d2(
	.din(ifm_enable_read_B_next),
	.sel(ifm_sel),
	.dout_1(ifm_enable_read_B_next_dMuxOut1),
	.dout_2(ifm_enable_read_B_next_dMuxOut2),
	.dout_3(ifm_enable_read_B_next_dMuxOut3),
	.dout_4(ifm_enable_read_B_next_dMuxOut4)
	);

	demux_1_to_4 d3(
	.din(ifm_enable_write_previous),
	.sel(ifm_sel),
	.dout_1(ifm_enable_write_previous_dMuxOut1),
	.dout_2(ifm_enable_write_previous_dMuxOut2),
	.dout_3(ifm_enable_write_previous_dMuxOut3),
	.dout_4(ifm_enable_write_previous_dMuxOut4)
	);

	demux_1_to_4_8bits d4(
	.din(ifm_address_write_previous),
	.sel(ifm_sel),
	.dout_1(ifm_address_write_previous_dMuxOut1),
	.dout_2(ifm_address_write_previous_dMuxOut2),
	.dout_3(ifm_address_write_previous_dMuxOut3),
	.dout_4(ifm_address_write_previous_dMuxOut4)
	);

	demux_1_to_4_8bits d5(
	.din(ifm_address_read_previous),
	.sel(ifm_sel),
	.dout_1(ifm_address_read_previous_dMuxOut1),
	.dout_2(ifm_address_read_previous_dMuxOut2),
	.dout_3(ifm_address_read_previous_dMuxOut3),
	.dout_4(ifm_address_read_previous_dMuxOut4)
	);

	demux_1_to_4_8bits d6(
	.din(ifm_address_read_A_next),
	.sel(ifm_sel),
	.dout_1(ifm_address_read_A_next_dMuxOut1),
	.dout_2(ifm_address_read_A_next_dMuxOut2),
	.dout_3(ifm_address_read_A_next_dMuxOut3),
	.dout_4(ifm_address_read_A_next_dMuxOut4)
	);

	demux_1_to_4_8bits d7(
	.din(ifm_address_read_B_next),
	.sel(ifm_sel),
	.dout_1(ifm_address_read_B_next_dMuxOut1),
	.dout_2(ifm_address_read_B_next_dMuxOut2),
	.dout_3(ifm_address_read_B_next_dMuxOut3),
	.dout_4(ifm_address_read_B_next_dMuxOut4)
	);

	
    always @*
    begin

        case(ifm_sel)
//start case h = 13 div = 4 
		2'd0:
		begin
//start case no 0 h = 13 div = 4 
//start prev j  = 1 k = 1 h = 13 div = 4 
			data_out_for_previous1 = Data_Output_B_Mem1;
//start prev j  = 2 k = 2 h = 13 div = 4 
			data_out_for_previous2 = Data_Output_B_Mem2;
//start prev j  = 3 k = 3 h = 13 div = 4 
			data_out_for_previous3 = Data_Output_B_Mem3;
//start prev j  = 4 k = 4 h = 13 div = 4 
			data_out_for_previous4 = Data_Output_B_Mem4;
//start prev j  = 1 k = 5 h = 13 div = 4 div*u = 4*4 
		
			data_out_A_for_next1 = Data_Output_A_Mem13;
			data_out_B_for_next1 = Data_Output_B_Mem13;
//start prev j  = 2 k = 5 h = 14 div = 4 div*u = 4*4 
		
			data_out_A_for_next2 = Data_Output_A_Mem14;
			data_out_B_for_next2 = Data_Output_B_Mem14;
//start prev j  = 3 k = 5 h = 15 div = 4 div*u = 4*4 
		
			data_out_A_for_next3 = Data_Output_A_Mem15;
			data_out_B_for_next3 = Data_Output_B_Mem15;
//start prev j  = 4 k = 5 h = 16 div = 4 div*u = 4*4 
		
			data_out_A_for_next4 = Data_Output_A_Mem16;
			data_out_B_for_next4 = Data_Output_B_Mem16;
		end
		2'd1:
		begin
//start case no 1 h = 1 div = 4 
//start prev j  = 1 k = 5 h = 1 div = 4 
			data_out_for_previous1 = Data_Output_B_Mem5;
//start prev j  = 2 k = 6 h = 1 div = 4 
			data_out_for_previous2 = Data_Output_B_Mem6;
//start prev j  = 3 k = 7 h = 1 div = 4 
			data_out_for_previous3 = Data_Output_B_Mem7;
//start prev j  = 4 k = 8 h = 1 div = 4 
			data_out_for_previous4 = Data_Output_B_Mem8;
//start prev j  = 1 k = 9 h = 1 div = 4 div*u = 4*4 
		
			data_out_A_for_next1 = Data_Output_A_Mem1;
			data_out_B_for_next1 = Data_Output_B_Mem1;
//start prev j  = 2 k = 9 h = 2 div = 4 div*u = 4*4 
		
			data_out_A_for_next2 = Data_Output_A_Mem2;
			data_out_B_for_next2 = Data_Output_B_Mem2;
//start prev j  = 3 k = 9 h = 3 div = 4 div*u = 4*4 
		
			data_out_A_for_next3 = Data_Output_A_Mem3;
			data_out_B_for_next3 = Data_Output_B_Mem3;
//start prev j  = 4 k = 9 h = 4 div = 4 div*u = 4*4 
		
			data_out_A_for_next4 = Data_Output_A_Mem4;
			data_out_B_for_next4 = Data_Output_B_Mem4;
		end
		2'd2:
		begin
//start case no 2 h = 5 div = 4 
//start prev j  = 1 k = 9 h = 5 div = 4 
			data_out_for_previous1 = Data_Output_B_Mem9;
//start prev j  = 2 k = 10 h = 5 div = 4 
			data_out_for_previous2 = Data_Output_B_Mem10;
//start prev j  = 3 k = 11 h = 5 div = 4 
			data_out_for_previous3 = Data_Output_B_Mem11;
//start prev j  = 4 k = 12 h = 5 div = 4 
			data_out_for_previous4 = Data_Output_B_Mem12;
//start prev j  = 1 k = 13 h = 5 div = 4 div*u = 4*4 
		
			data_out_A_for_next1 = Data_Output_A_Mem5;
			data_out_B_for_next1 = Data_Output_B_Mem5;
//start prev j  = 2 k = 13 h = 6 div = 4 div*u = 4*4 
		
			data_out_A_for_next2 = Data_Output_A_Mem6;
			data_out_B_for_next2 = Data_Output_B_Mem6;
//start prev j  = 3 k = 13 h = 7 div = 4 div*u = 4*4 
		
			data_out_A_for_next3 = Data_Output_A_Mem7;
			data_out_B_for_next3 = Data_Output_B_Mem7;
//start prev j  = 4 k = 13 h = 8 div = 4 div*u = 4*4 
		
			data_out_A_for_next4 = Data_Output_A_Mem8;
			data_out_B_for_next4 = Data_Output_B_Mem8;
		end
		default:
		begin
			data_out_for_previous1 = Data_Output_B_Mem13;
			data_out_for_previous2 = Data_Output_B_Mem14;
			data_out_for_previous3 = Data_Output_B_Mem15;
			data_out_for_previous4 = Data_Output_B_Mem16;
		
			data_out_A_for_next1 = Data_Output_A_Mem9;
			data_out_B_for_next1 = Data_Output_B_Mem9;
		
			data_out_A_for_next2 = Data_Output_A_Mem10;
			data_out_B_for_next2 = Data_Output_B_Mem10;
		
			data_out_A_for_next3 = Data_Output_A_Mem11;
			data_out_B_for_next3 = Data_Output_B_Mem11;
		
			data_out_A_for_next4 = Data_Output_A_Mem12;
			data_out_B_for_next4 = Data_Output_B_Mem12;
		end
		
		endcase
		
	end

	
mem_unit_4 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M1(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
      .Data_Input_A_Mem4 (data_in_from_previous4),
      .Data_Input_B_Mem4 ('b0),
	
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
      .Data_Output_B_Mem3 (Data_Output_B_Mem3),
      .Data_Output_A_Mem4 (Data_Output_A_Mem4),
      .Data_Output_B_Mem4 (Data_Output_B_Mem4)
	  );

	
mem_unit_4 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M2(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
      .Data_Input_A_Mem4 (data_in_from_previous4),
      .Data_Input_B_Mem4 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut2 | ifm_address_read_A_next_dMuxOut3 ),
      .Address_B ( ifm_address_read_previous_dMuxOut2  | ifm_address_read_B_next_dMuxOut3 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut2),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut3),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut2 | ifm_enable_read_B_next_dMuxOut3),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem5),
      .Data_Output_B_Mem1 (Data_Output_B_Mem5),
      .Data_Output_A_Mem2 (Data_Output_A_Mem6),
      .Data_Output_B_Mem2 (Data_Output_B_Mem6),
      .Data_Output_A_Mem3 (Data_Output_A_Mem7),
      .Data_Output_B_Mem3 (Data_Output_B_Mem7),
      .Data_Output_A_Mem4 (Data_Output_A_Mem8),
      .Data_Output_B_Mem4 (Data_Output_B_Mem8)
	  );

	
mem_unit_4 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M3(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
      .Data_Input_A_Mem4 (data_in_from_previous4),
      .Data_Input_B_Mem4 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut3 | ifm_address_read_A_next_dMuxOut4 ),
      .Address_B ( ifm_address_read_previous_dMuxOut3  | ifm_address_read_B_next_dMuxOut4 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut3),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut4),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut3 | ifm_enable_read_B_next_dMuxOut4),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem9),
      .Data_Output_B_Mem1 (Data_Output_B_Mem9),
      .Data_Output_A_Mem2 (Data_Output_A_Mem10),
      .Data_Output_B_Mem2 (Data_Output_B_Mem10),
      .Data_Output_A_Mem3 (Data_Output_A_Mem11),
      .Data_Output_B_Mem3 (Data_Output_B_Mem11),
      .Data_Output_A_Mem4 (Data_Output_A_Mem12),
      .Data_Output_B_Mem4 (Data_Output_B_Mem12)
	  );

	
mem_unit_4 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M4(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
      .Data_Input_A_Mem4 (data_in_from_previous4),
      .Data_Input_B_Mem4 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut4 | ifm_address_read_A_next_dMuxOut5 ),
      .Address_B ( ifm_address_read_previous_dMuxOut4  | ifm_address_read_B_next_dMuxOut5 ),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut4),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut5),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut4 | ifm_enable_read_B_next_dMuxOut5),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem13),
      .Data_Output_B_Mem1 (Data_Output_B_Mem13),
      .Data_Output_A_Mem2 (Data_Output_A_Mem14),
      .Data_Output_B_Mem2 (Data_Output_B_Mem14),
      .Data_Output_A_Mem3 (Data_Output_A_Mem15),
      .Data_Output_B_Mem3 (Data_Output_B_Mem15),
      .Data_Output_A_Mem4 (Data_Output_A_Mem16),
      .Data_Output_B_Mem4 (Data_Output_B_Mem16)
	  );
endmodule