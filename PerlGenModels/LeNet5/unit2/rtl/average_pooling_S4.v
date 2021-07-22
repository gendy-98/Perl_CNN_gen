`timescale 1ns / 1ps


module 
 average_pooling_S4 #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 			  = 32,
	ARITH_TYPE				 = 0
	)
	(
	input 							clk,
	input 							reset,
	input 							pool_enable,
	input   [DATA_WIDTH - 1 : 0]    pool_data_in_1,
	input   [DATA_WIDTH - 1 : 0]    pool_data_in_2,
	input   [DATA_WIDTH - 1 : 0]    pool_data_in_3,
	input   [DATA_WIDTH - 1 : 0]    pool_data_in_4,
	output  reg [DATA_WIDTH - 1 : 0]    pool_data_out_reg
	);

	wire	[DATA_WIDTH - 1 : 0]	sum_1_1;
	wire	[DATA_WIDTH - 1 : 0]	sum_1_2;

	wire	[DATA_WIDTH - 1 : 0]	sum_2_1;

	reg 	[DATA_WIDTH - 1 : 0]	reg_sum_1_1;
	reg 	[DATA_WIDTH - 1 : 0]	reg_sum_1_2;

	reg 	[DATA_WIDTH - 1 : 0]	reg_sum_2_1;

	wire [DATA_WIDTH - 1 : 0]	avgIFM;

	adder  #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_1	(.in1(pool_data_in_1), .in2(pool_data_in_2), .out(sum_1_1));
	adder  #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_1_2	(.in1(pool_data_in_3), .in2(pool_data_in_4), .out(sum_1_2));

	adder  #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))		adr_2_1	(.in1(reg_sum_1_1), .in2(reg_sum_1_2), .out(sum_2_1));

	always @(posedge clk , posedge reset)
    if (reset)
    begin
		reg_sum_1_1 <= 0;
		reg_sum_1_2 <= 0;

	end
    
    else if(pool_enable)
    begin
		reg_sum_1_1 <= 	sum_1_1 ;
		reg_sum_1_2 <= 	sum_1_2 ;

	end
    
    always @(posedge clk, posedge reset)
    begin
		if(reset)
		begin
			reg_sum_2_1 <= 0;

		end
        
        else
        begin
			reg_sum_2_1 <= sum_2_1;

		end
	end

    always @(posedge clk or posedge reset)
    begin
        if(reset)
            pool_data_out_reg <= 0;
        else
            pool_data_out_reg <= avgIFM;
    end

	divider  #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) div ( .in1(reg_sum_2_1),  .out(avgIFM) );

    
endmodule

