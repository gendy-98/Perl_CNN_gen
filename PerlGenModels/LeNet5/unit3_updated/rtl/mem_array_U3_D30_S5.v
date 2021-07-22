`timescale 1ns / 1ps


module 
 mem_array_U3_D30_S5 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 					= 32,
///////////architecture parameters//////
	IFM_SIZE              = 5,                                                
    NUMBER_OF_IFM         = 30,
    NUMBER_OF_UNITS       = 3,
    ADDRESS_SIZE_IFM      = $clog2(IFM_SIZE*IFM_SIZE)

	)(
	input clk,
	input [$clog2(10)-1:0] ifm_sel,
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
	
	demux_1_to_10 d0(
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
	.dout_10(ifm_enable_write_previous_dMuxOut10)
	);

	demux_1_to_10 d1(
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
	.dout_10(ifm_enable_read_previous_dMuxOut10)
	);

	demux_1_to_10 d2(
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
	.dout_10(ifm_enable_read_A_next_dMuxOut10)
	);

	demux_1_to_10 d3(
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
	.dout_10(ifm_enable_read_B_next_dMuxOut10)
	);

	demux_1_to_10_5bits d4(
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
	.dout_10(ifm_address_write_previous_dMuxOut10)
	);

	demux_1_to_10_5bits d5(
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
	.dout_10(ifm_address_read_previous_dMuxOut10)
	);

	demux_1_to_10_5bits d6(
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
	.dout_10(ifm_address_read_A_next_dMuxOut10)
	);

	demux_1_to_10_5bits d7(
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
	.dout_10(ifm_address_read_B_next_dMuxOut10)
	);

	
    always @*
    begin

        case(ifm_sel)
		4'd0:
		begin
			data_out_for_previous1 = Data_Output_B_Mem1;
			data_out_for_previous2 = Data_Output_B_Mem2;
			data_out_for_previous3 = Data_Output_B_Mem3;
		
			data_out_A_for_next1 = Data_Output_A_Mem28;
			data_out_B_for_next1 = Data_Output_B_Mem28;
		
			data_out_A_for_next2 = Data_Output_A_Mem29;
			data_out_B_for_next2 = Data_Output_B_Mem29;
		
			data_out_A_for_next3 = Data_Output_A_Mem30;
			data_out_B_for_next3 = Data_Output_B_Mem30;
		end
		4'd1:
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
		4'd2:
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
		4'd3:
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
		4'd4:
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
		4'd5:
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
		4'd6:
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
		4'd7:
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
		4'd8:
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
		default:
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
	
      .Address_A ( ifm_address_write_previous_dMuxOut10 | ifm_address_read_A_next_dMuxOut1 ),
      .Address_B ( ifm_address_read_previous_dMuxOut10  | ifm_address_read_B_next_dMuxOut1),  
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut10),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut1),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut10 | ifm_enable_read_B_next_dMuxOut1),
	  
      .Data_Output_A_Mem1 (Data_Output_A_Mem28),
      .Data_Output_B_Mem1 (Data_Output_B_Mem28),
      .Data_Output_A_Mem2 (Data_Output_A_Mem29),
      .Data_Output_B_Mem2 (Data_Output_B_Mem29),
      .Data_Output_A_Mem3 (Data_Output_A_Mem30),
      .Data_Output_B_Mem3 (Data_Output_B_Mem30)
	  );
endmodule