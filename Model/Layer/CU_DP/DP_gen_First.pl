use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] no of the conv 
#ARGV[1] Mul number
#ARGV[2] ARITH_TYPE
#ARGV[3] DATA_WIDTH
#ARGV[4] ADDRESS_BITS
#ARGV[5] IFM_SIZE  
#ARGV[6] IFM_DEPTH 
#ARGV[7] KERNAL_SIZE  
#ARGV[8] NUMBER_OF_FILTERS
#ARGV[9] RGB 0gray 1 rgb
#

######################################### CONSTANTS ###################################
my $module = <<"DONATE";
`timescale 1ns / 1ps


module 
DONATE
my $parameter = "#(parameter";

my $always_clk = <<"DONATE";
always @ (posedge clk)
    begin 
DONATE
my $end = "end";
my $end_module = "endmodule";
my $i_p = "input";
my $o_p = "output";
my $under_Score = "_";
my $clog2 = "\$clog2";

my $data_width = "DATA_WIDTH";
my $address_bits = "ADDRESS_BITS";

my $ifm_size = "IFM_SIZE";                                               
my $ifm_depth = "IFM_DEPTH";
my $kernal_size = "KERNAL_SIZE";
my $number_of_filters = "NUMBER_OF_FILTERS";
my $number_of_units = "NUMBER_OF_UNITS";
my $full_path = "../../../Verilog_files/";
#######################################################################################
my $i = 0;
my $j = 0;
my $jj = 0;
my $file_name;
my $module_name;
my $adder_name;
my $mul_name;
my $odd_flag;
my $dummy_level;
my @levels;
my $levels_number;
my $dual_port_name = "true_dual_port_memory";
my $single_port_name = "single_port_memory";
my $unit_name = "unitA";
my $Relu_name = "relu";
my $accumulator_name = "accumulator"; 
$module_name = "conva$ARGV[0]_DP";

 
 if(lc ($ARGV[2]) eq "decimal"){
	$adder_name = "Dec_Adder";
	$mul_name = "Dec_Multiplier";
	}
if(lc ($ARGV[2]) eq "fixed"){
	$adder_name = "Fixed_Adder";
	$mul_name = "Fixed_Multiplier";
	}
if(lc ($ARGV[2]) eq "float"){
	$adder_name = "Float_Adder";
	$mul_name = "Float_Multiplier";
	}



$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
  print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 			  = $ARGV[3],
	$address_bits 		  = $ARGV[4],
	/////////////////////////////////////
	$ifm_size              = $ARGV[5],                                                
	$ifm_depth             = $ARGV[6],
	$kernal_size           = $ARGV[7],
	$number_of_filters     = $ARGV[8],
	$number_of_units       = 3
    ARITH_TYPE              = $ARGV[2],
	//////////////////////////////////////
	IFM_SIZE_NEXT           = IFM_SIZE - KERNAL_SIZE + 1,
	ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
	ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT),
	ADDRESS_SIZE_WM         = $clog2( KERNAL_SIZE*KERNAL_SIZE*NUMBER_OF_FILTERS*(IFM_DEPTH/NUMBER_OF_UNITS+1) ),    
	FIFO_SIZE               = (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE,
	NUMBER_OF_IFM           = IFM_DEPTH,
	NUMBER_OF_IFM_NEXT      = NUMBER_OF_FILTERS,
	NUMBER_OF_WM            = KERNAL_SIZE*KERNAL_SIZE,                              
	NUMBER_OF_BITS_SEL_IFM_NEXT = $clog2(NUMBER_OF_IFM_NEXT)
)(
	input clk,
	input reset,
	input [DATA_WIDTH-1:0] riscv_data,
	input [ADDRESS_BITS-1:0] riscv_address,
	
	input fifo_enable,
	input conv_enable,
    
	input [NUMBER_OF_IFM-1:0]    ifm_enable_write_previous,            
	input [ADDRESS_SIZE_IFM-1:0] ifm_address_read_current,
    input                        ifm_enable_read_current,
    
    input                       wm_addr_sel,
    input                       wm_enable_read,
    input [NUMBER_OF_UNITS-1:0] wm_enable_write,
    input [ADDRESS_SIZE_WM-1:0] wm_address_read_current,
    input                       wm_fifo_enable,
    
    input                                 bm_addr_sel,
    input                                 bm_enable_read,
    input                                 bm_enable_write,
    input [$clog2(NUMBER_OF_FILTERS)-1:0] bm_address_read_current,

    output [DATA_WIDTH-1:0] data_out_for_next
    );
	
////////////////////////Signal declaration/////////////////

DONATE

if($ARGV[9] == 1){#rgb
	print $fh <<"DONATE";
	wire [DATA_WIDTH-1:0] data_read_for_unit1;
	wire [DATA_WIDTH-1:0] data_read_for_unit2;
	wire [DATA_WIDTH-1:0] data_read_for_unit3;
DONATE
}
else{#gray
	print $fh <<"DONATE";
	wire [DATA_WIDTH-1:0] data_read_for_unit1;
DONATE
}

if($ARGV[9] == 1){#rgb
	print $fh <<"DONATE";
	wire [DATA_WIDTH-1:0] unit1_data_out;
	wire [DATA_WIDTH-1:0] unit2_data_out;
	wire [DATA_WIDTH-1:0] unit3_data_out;
DONATE
}
else{#gray
	print $fh <<"DONATE";
	wire [DATA_WIDTH-1:0] unit1_data_out;
DONATE
}



if($ARGV[9] == 1){
	print $fh <<"DONATE";
 
	reg [DATA_WIDTH-1:0] partial_sum1;
	reg [DATA_WIDTH-1:0] partial_sum2;
	reg [DATA_WIDTH-1:0] full_sum;
	wire [DATA_WIDTH-1:0] full_sum_reg;

DONATE
}

 print $fh <<"DONATE";	
	wire [ADDRESS_SIZE_WM-1:0] wm_address;
	wire [$clog2(NUMBER_OF_FILTERS)-1:0] bm_address;
	
	assign wm_address = wm_addr_sel ? wm_address_read_current : riscv_address[ADDRESS_SIZE_WM-1:0];
	assign bm_address = bm_addr_sel ? bm_address_read_current : riscv_address[$clog2(NUMBER_OF_FILTERS)-1:0];
    
    SinglePort_Memory #(.MEM_SIZE (NUMBER_OF_FILTERS)) bm (.clk(clk),	.Enable_Write(bm_enable_write),
     .Enable_Read(bm_enable_read),	.Address(bm_address),
	 .Data_Input(riscv_data),	.Data_Output(data_bias));
	 

	TrueDualPort_Memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	convA1_IFM1 (
    .clk(clk),
    
    .Data_Input_A(riscv_data),
    .Address_A(riscv_address[ADDRESS_SIZE_IFM-1:0]),
    .Enable_Write_A(ifm_enable_write_previous[0]),
    .Enable_Read_A(1'b0), 
  
    .Data_Input_B(32'b0),
    .Address_B(ifm_address_read_current),
    .Enable_Write_B(1'b0),
    .Enable_Read_B(ifm_enable_read_current), 
  
    .Data_Output_A(),
    .Data_Output_B(data_read_for_unit1)
	);
	  
DONATE

if($ARGV[9] == 1){
	print $fh <<"DONATE";
	$dual_port_name #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	convA1_IFM2 (
    .clk(clk),
    
    .Data_Input_A(riscv_data),
    .Address_A(riscv_address),
    .Enable_Write_A(ifm_enable_write_previous[1]),
    .Enable_Read_A(0), 
  
    .Data_Input_B(0),
    .Address_B(ifm_address_read_current),
    .Enable_Write_B(0),
    .Enable_Read_B(ifm_enable_read_current), 
  
    .Data_Output_A(),
    .Data_Output_B(data_read_for_unit2)
	);
	
	$dual_port_name #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	convA1_IFM3 (
    .clk(clk),
    
    .Data_Input_A(riscv_data),
    .Address_A(riscv_address),
    .Enable_Write_A(ifm_enable_write_previous[2]),
    .Enable_Read_A(0), 
  
    .Data_Input_B(0),
    .Address_B(ifm_address_read_current),
    .Enable_Write_B(0),
    .Enable_Read_B(ifm_enable_read_current), 
  
    .Data_Output_A(),
    .Data_Output_B(data_read_for_unit3)
	);
DONATE
}

print $fh <<"DONATE"; 
    $unit_name 
    convA1_unit_1
    (
    .clk(clk),                                 
    .reset(reset),  
    .riscv_data(riscv_data),                             
    .unit_data_in(data_read_for_unit1),       
    .fifo_enable(fifo_enable),                         
    .conv_enable(conv_enable),
    .wm_enable_read(wm_enable_read),          
    .wm_enable_write(wm_enable_write[0]),          
    .wm_address(wm_address),
    .wm_fifo_enable(wm_fifo_enable),
    .unit_data_out(unit1_data_out)   
    );
	
DONATE


if($ARGV[9] == 1){
	print $fh <<"DONATE";
	$unit_name 
    convA1_unit_2
    (
    .clk(clk),                                 
    .reset(reset),  
    .riscv_data(riscv_data),                             
    .unit_data_in(data_read_for_unit2),       
    .fifo_enable(fifo_enable),                         
    .conv_enable(conv_enable),  
    .wm_enable_read(wm_enable_read),          
    .wm_enable_write(wm_enable_write[1]),          
    .wm_address(wm_address),
    .wm_fifo_enable(wm_fifo_enable),          
    .unit_data_out(unit2_data_out)   
    );
    
    $unit_name 
    convA1_unit_3
    (
    .clk(clk),                                 
    .reset(reset),  
    .riscv_data(riscv_data),                             
    .unit_data_in(data_read_for_unit3),       
    .fifo_enable(fifo_enable),                         
    .conv_enable(conv_enable),    
    .wm_enable_read(wm_enable_read),          
    .wm_enable_write(wm_enable_write[2]),         
    .wm_address(wm_address),
    .wm_fifo_enable(wm_fifo_enable),          
    .unit_data_out(unit3_data_out)   
    );
	
	
DONATE
}


if($ARGV[9] == 1){
	print $fh <<"DONATE";
	
	always @(posedge clk)
	begin
	   partial_sum1 <= unit1_data_out + unit2_data_out;
	   partial_sum2 <= unit3_data_out + data_bias;
	   full_sum     <= full_sum_reg;
	end
	
DONATE

}	


if($ARGV[9] == 1){#rgb
	print $fh <<"DONATE";
	
	adder #(.ARITH_TYPE(ARITH_TYPE), .DATA_WIDTH(DATA_WIDTH)) Add (.in1 (partial_sum1), .in2 (partial_sum2), .out (full_sum_reg));
	relu  Active1 (.in(full_sum),.out (data_out_for_next), .relu_enable(1'b1)); 
	
endmodule
DONATE
}

else{#gray

	print $fh <<"DONATE";   
	relu  Active1 (.in(unit1_data_out),.out (data_out_for_next), .relu_enable(1'b1)); 
 	 
	
endmodule

DONATE
}

close $fh or die "Couldn't Close File : $!";
