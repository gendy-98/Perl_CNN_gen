`timescale 1ns / 1ps


module 
 mem_array_U16_D16_S10 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE              = 10,                                                
    NUMBER_OF_IFM         = 16,
    NUMBER_OF_UNITS       = 16,
    ADDRESS_SIZE_IFM      = $clog2(IFM_SIZE*IFM_SIZE)

	)(
	input clk,
	input [$clog2(1)-1:0] ifm_sel,
	input                        ifm_enable_write_previous,            
	input                        ifm_enable_read_previous, 
	input  [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous,
	input  [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous,	

	input [DATA_WIDTH-1:0] data_in_from_previous1,
	input [DATA_WIDTH-1:0] data_in_from_previous2,
	input [DATA_WIDTH-1:0] data_in_from_previous3,
	input [DATA_WIDTH-1:0] data_in_from_previous4,
	input [DATA_WIDTH-1:0] data_in_from_previous5,
	input [DATA_WIDTH-1:0] data_in_from_previous6,
	input [DATA_WIDTH-1:0] data_in_from_previous7,
	input [DATA_WIDTH-1:0] data_in_from_previous8,
	input [DATA_WIDTH-1:0] data_in_from_previous9,
	input [DATA_WIDTH-1:0] data_in_from_previous10,
	input [DATA_WIDTH-1:0] data_in_from_previous11,
	input [DATA_WIDTH-1:0] data_in_from_previous12,
	input [DATA_WIDTH-1:0] data_in_from_previous13,
	input [DATA_WIDTH-1:0] data_in_from_previous14,
	input [DATA_WIDTH-1:0] data_in_from_previous15,
	input [DATA_WIDTH-1:0] data_in_from_previous16,
	output reg [DATA_WIDTH-1:0] data_out_for_previous1,
	output reg [DATA_WIDTH-1:0] data_out_for_previous2,
	output reg [DATA_WIDTH-1:0] data_out_for_previous3,
	output reg [DATA_WIDTH-1:0] data_out_for_previous4,
	output reg [DATA_WIDTH-1:0] data_out_for_previous5,
	output reg [DATA_WIDTH-1:0] data_out_for_previous6,
	output reg [DATA_WIDTH-1:0] data_out_for_previous7,
	output reg [DATA_WIDTH-1:0] data_out_for_previous8,
	output reg [DATA_WIDTH-1:0] data_out_for_previous9,
	output reg [DATA_WIDTH-1:0] data_out_for_previous10,
	output reg [DATA_WIDTH-1:0] data_out_for_previous11,
	output reg [DATA_WIDTH-1:0] data_out_for_previous12,
	output reg [DATA_WIDTH-1:0] data_out_for_previous13,
	output reg [DATA_WIDTH-1:0] data_out_for_previous14,
	output reg [DATA_WIDTH-1:0] data_out_for_previous15,
	output reg [DATA_WIDTH-1:0] data_out_for_previous16,
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
	output reg [DATA_WIDTH-1:0] data_out_B_for_next4,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next5,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next5,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next6,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next6,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next7,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next7,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next8,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next8,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next9,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next9,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next10,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next10,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next11,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next11,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next12,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next12,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next13,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next13,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next14,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next14,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next15,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next15,
	output reg [DATA_WIDTH-1:0] data_out_A_for_next16,
	output reg [DATA_WIDTH-1:0] data_out_B_for_next16
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
	.din(ifm_enable_read_A_next),
	.sel(ifm_sel),
	.dout_1(ifm_enable_read_A_next_dMuxOut1)
	);

	demux_1_to_1 d3(
	.din(ifm_enable_read_B_next),
	.sel(ifm_sel),
	.dout_1(ifm_enable_read_B_next_dMuxOut1)
	);

	demux_1_to_1_7bits d4(
	.din(ifm_address_write_previous),
	.sel(ifm_sel),
	.dout_1(ifm_address_write_previous_dMuxOut1)
	);

	demux_1_to_1_7bits d5(
	.din(ifm_address_read_previous),
	.sel(ifm_sel),
	.dout_1(ifm_address_read_previous_dMuxOut1)
	);

	demux_1_to_1_7bits d6(
	.din(ifm_address_read_A_next),
	.sel(ifm_sel),
	.dout_1(ifm_address_read_A_next_dMuxOut1)
	);

	demux_1_to_1_7bits d7(
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
			data_out_for_previous4 = Data_Output_B_Mem4;
			data_out_for_previous5 = Data_Output_B_Mem5;
			data_out_for_previous6 = Data_Output_B_Mem6;
			data_out_for_previous7 = Data_Output_B_Mem7;
			data_out_for_previous8 = Data_Output_B_Mem8;
			data_out_for_previous9 = Data_Output_B_Mem9;
			data_out_for_previous10 = Data_Output_B_Mem10;
			data_out_for_previous11 = Data_Output_B_Mem11;
			data_out_for_previous12 = Data_Output_B_Mem12;
			data_out_for_previous13 = Data_Output_B_Mem13;
			data_out_for_previous14 = Data_Output_B_Mem14;
			data_out_for_previous15 = Data_Output_B_Mem15;
			data_out_for_previous16 = Data_Output_B_Mem16;
		
			data_out_A_for_next1 = Data_Output_A_Mem1;
			data_out_B_for_next1 = Data_Output_B_Mem1;
		
			data_out_A_for_next2 = Data_Output_A_Mem2;
			data_out_B_for_next2 = Data_Output_B_Mem2;
		
			data_out_A_for_next3 = Data_Output_A_Mem3;
			data_out_B_for_next3 = Data_Output_B_Mem3;
		
			data_out_A_for_next4 = Data_Output_A_Mem4;
			data_out_B_for_next4 = Data_Output_B_Mem4;
		
			data_out_A_for_next5 = Data_Output_A_Mem5;
			data_out_B_for_next5 = Data_Output_B_Mem5;
		
			data_out_A_for_next6 = Data_Output_A_Mem6;
			data_out_B_for_next6 = Data_Output_B_Mem6;
		
			data_out_A_for_next7 = Data_Output_A_Mem7;
			data_out_B_for_next7 = Data_Output_B_Mem7;
		
			data_out_A_for_next8 = Data_Output_A_Mem8;
			data_out_B_for_next8 = Data_Output_B_Mem8;
		
			data_out_A_for_next9 = Data_Output_A_Mem9;
			data_out_B_for_next9 = Data_Output_B_Mem9;
		
			data_out_A_for_next10 = Data_Output_A_Mem10;
			data_out_B_for_next10 = Data_Output_B_Mem10;
		
			data_out_A_for_next11 = Data_Output_A_Mem11;
			data_out_B_for_next11 = Data_Output_B_Mem11;
		
			data_out_A_for_next12 = Data_Output_A_Mem12;
			data_out_B_for_next12 = Data_Output_B_Mem12;
		
			data_out_A_for_next13 = Data_Output_A_Mem13;
			data_out_B_for_next13 = Data_Output_B_Mem13;
		
			data_out_A_for_next14 = Data_Output_A_Mem14;
			data_out_B_for_next14 = Data_Output_B_Mem14;
		
			data_out_A_for_next15 = Data_Output_A_Mem15;
			data_out_B_for_next15 = Data_Output_B_Mem15;
		
			data_out_A_for_next16 = Data_Output_A_Mem16;
			data_out_B_for_next16 = Data_Output_B_Mem16;
		end
		
		endcase
		
	end

	
mem_unit_16 #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M1(  .clk(clk),
      .Data_Input_A_Mem1 (data_in_from_previous1),
      .Data_Input_B_Mem1 ('b0),
      .Data_Input_A_Mem2 (data_in_from_previous2),
      .Data_Input_B_Mem2 ('b0),
      .Data_Input_A_Mem3 (data_in_from_previous3),
      .Data_Input_B_Mem3 ('b0),
      .Data_Input_A_Mem4 (data_in_from_previous4),
      .Data_Input_B_Mem4 ('b0),
      .Data_Input_A_Mem5 (data_in_from_previous5),
      .Data_Input_B_Mem5 ('b0),
      .Data_Input_A_Mem6 (data_in_from_previous6),
      .Data_Input_B_Mem6 ('b0),
      .Data_Input_A_Mem7 (data_in_from_previous7),
      .Data_Input_B_Mem7 ('b0),
      .Data_Input_A_Mem8 (data_in_from_previous8),
      .Data_Input_B_Mem8 ('b0),
      .Data_Input_A_Mem9 (data_in_from_previous9),
      .Data_Input_B_Mem9 ('b0),
      .Data_Input_A_Mem10 (data_in_from_previous10),
      .Data_Input_B_Mem10 ('b0),
      .Data_Input_A_Mem11 (data_in_from_previous11),
      .Data_Input_B_Mem11 ('b0),
      .Data_Input_A_Mem12 (data_in_from_previous12),
      .Data_Input_B_Mem12 ('b0),
      .Data_Input_A_Mem13 (data_in_from_previous13),
      .Data_Input_B_Mem13 ('b0),
      .Data_Input_A_Mem14 (data_in_from_previous14),
      .Data_Input_B_Mem14 ('b0),
      .Data_Input_A_Mem15 (data_in_from_previous15),
      .Data_Input_B_Mem15 ('b0),
      .Data_Input_A_Mem16 (data_in_from_previous16),
      .Data_Input_B_Mem16 ('b0),
	
      .Address_A ( ifm_address_write_previous_dMuxOut1 | ifm_address_read_A_next_dMuxOut1 ),
      .Address_B ( ifm_address_read_previous_dMuxOut1  | ifm_address_read_B_next_dMuxOut1),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut1),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut1),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut1 | ifm_enable_read_B_next_dMuxOut1),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem1),
      .Data_Output_B_Mem1 (Data_Output_B_Mem1),
      .Data_Output_A_Mem2 (Data_Output_A_Mem2),
      .Data_Output_B_Mem2 (Data_Output_B_Mem2),
      .Data_Output_A_Mem3 (Data_Output_A_Mem3),
      .Data_Output_B_Mem3 (Data_Output_B_Mem3),
      .Data_Output_A_Mem4 (Data_Output_A_Mem4),
      .Data_Output_B_Mem4 (Data_Output_B_Mem4),
      .Data_Output_A_Mem5 (Data_Output_A_Mem5),
      .Data_Output_B_Mem5 (Data_Output_B_Mem5),
      .Data_Output_A_Mem6 (Data_Output_A_Mem6),
      .Data_Output_B_Mem6 (Data_Output_B_Mem6),
      .Data_Output_A_Mem7 (Data_Output_A_Mem7),
      .Data_Output_B_Mem7 (Data_Output_B_Mem7),
      .Data_Output_A_Mem8 (Data_Output_A_Mem8),
      .Data_Output_B_Mem8 (Data_Output_B_Mem8),
      .Data_Output_A_Mem9 (Data_Output_A_Mem9),
      .Data_Output_B_Mem9 (Data_Output_B_Mem9),
      .Data_Output_A_Mem10 (Data_Output_A_Mem10),
      .Data_Output_B_Mem10 (Data_Output_B_Mem10),
      .Data_Output_A_Mem11 (Data_Output_A_Mem11),
      .Data_Output_B_Mem11 (Data_Output_B_Mem11),
      .Data_Output_A_Mem12 (Data_Output_A_Mem12),
      .Data_Output_B_Mem12 (Data_Output_B_Mem12),
      .Data_Output_A_Mem13 (Data_Output_A_Mem13),
      .Data_Output_B_Mem13 (Data_Output_B_Mem13),
      .Data_Output_A_Mem14 (Data_Output_A_Mem14),
      .Data_Output_B_Mem14 (Data_Output_B_Mem14),
      .Data_Output_A_Mem15 (Data_Output_A_Mem15),
      .Data_Output_B_Mem15 (Data_Output_B_Mem15),
      .Data_Output_A_Mem16 (Data_Output_A_Mem16),
      .Data_Output_B_Mem16 (Data_Output_B_Mem16)
	  );
endmodule