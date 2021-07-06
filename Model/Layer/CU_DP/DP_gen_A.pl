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
#ARGV[2] Mul & Add type which (decimal, fixed, float) 
#ARGV[3] DATA_WIDTH
#ARGV[4] ADDRESS_BITS
#ARGV[5] IFM_SIZE  
#ARGV[6] IFM_DEPTH 
#ARGV[7] KERNAL_SIZE  
#ARGV[8] NUMBER_OF_FILTERS
#ARGV[9] NUMBER_OF_UNITS

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

my $single_port_name = "single_port_memory";
my $unit_name = "unitA";
my $Relu_name = "relu";
my $accumulator_name = "accumulator"; 
$module_name = "conva$ARGV[0]_DP";


$odd_flag = 0;
$dummy_level = $ARGV[9]; 
 while($dummy_level  > 0)
{
	push @levels , $dummy_level;
	if($dummy_level % 2 == 1){
		if($odd_flag == 1){
			$dummy_level = int($dummy_level / 2) + 1;
			$odd_flag = 0;
		}
		else{
			$dummy_level = int ($dummy_level / 2);
			$odd_flag = 1;
		}
	}
	else{	
		$dummy_level = $dummy_level / 2;
	}
}

$levels_number = @levels;
 
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
	$number_of_units       = $ARGV[9],
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
	$i_p 							clk,
	$i_p 							reset,
	
	input [DATA_WIDTH-1:0] 			riscv_data,
	input [ADDRESS_BITS-1:0] 		riscv_address,
	
	input fifo_enable,
	input conv_enable,
	
	
	input accu_enable,
	input relu_enable,
	
	input                       wm_addr_sel,
    input                       wm_enable_read,
    input [NUMBER_OF_UNITS-1:0] wm_enable_write,
    input [ADDRESS_SIZE_WM-1:0] wm_address_read_current,
    input                       wm_fifo_enable,

	input                                 bm_addr_sel,
    input                                 bm_enable_read,
    input                                 bm_enable_write,
    input [$clog2(NUMBER_OF_FILTERS)-1:0] bm_address_read_current,
    
	
DONATE


for ($i = 1; $i <= $ARGV[9]; $i = $i + 1){
	print $fh <<"DONATE";
	input [DATA_WIDTH-1:0] data_in_from_previous$i,
DONATE
}

print $fh <<"DONATE";

	input  [DATA_WIDTH-1:0] data_in_from_next,
    output [DATA_WIDTH-1:0] data_out_for_next
    );

DONATE
 
 
 for ($i = 1; $i <= $ARGV[9]; $i = $i + 1){
	print $fh <<"DONATE";
	wire [DATA_WIDTH-1:0] unit${\($i)}_data_out;
DONATE
}


 print $fh <<"DONATE";
 
	wire [DATA_WIDTH-1:0] accu_data_out;
	wire [DATA_WIDTH-1:0] relu_data_out;
	
	wire [DATA_WIDTH-1:0] data_bias;
	

	wire [ADDRESS_SIZE_WM-1:0] wm_address;
	wire [$clog2(NUMBER_OF_FILTERS)-1:0] bm_address;
	
DONATE
 

	
$odd_flag = 0;
for ($i = 1; $i < $levels_number; $i = $i + 1){
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	for($j = 1; $j <= $levels[$i] + ($odd_flag % 2);$j = $j + 1){
		print $fh "\twire\t[DATA_WIDTH - 1 : 0]	adder_out_$i$under_Score$j;\n";
	}
	print $fh "\n";
}
 
 

 $odd_flag = 0;
for ($i = 1; $i < $levels_number; $i = $i + 1){
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	for($j = 1; $j <= $levels[$i] + ($odd_flag % 2);$j = $j + 1){
		print $fh "\treg \t[DATA_WIDTH - 1 : 0]	reg_adder_out_$i$under_Score$j;\n";
	}
	print $fh "\n";
}


print $fh <<"DONATE";   

	assign wm_address = wm_addr_sel ? wm_address_read_current : riscv_address[ADDRESS_SIZE_WM-1:0];
	assign bm_address = bm_addr_sel ? bm_address_read_current : riscv_address[$clog2(NUMBER_OF_FILTERS)-1:0];


DONATE

print $fh <<"DONATE"; 

	$single_port_name #(.MEM_SIZE (NUMBER_OF_FILTERS)) bm (.clk(clk),	.Enable_Write(bm_enable_write),
     .Enable_Read(bm_enable_read),	.Address(bm_address),
	 .Data_Input(riscv_data),	.Data_Output(data_bias));
	 
  
DONATE


for ($i = 1; $i <= $ARGV[9]; $i = $i + 1){
print $fh <<"DONATE"; 
	$unit_name #(.DATA_WIDTH(DATA_WIDTH), .IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE), .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS))
    unit_$i
    (
    .clk(clk),                                 
    .reset(reset),  
    .riscv_data(riscv_data),                             
    .unit_data_in(data_in_from_previous$i),       
    .fifo_enable(fifo_enable),                         
    .conv_enable(conv_enable),
    .wm_enable_read(wm_enable_read),          
    .wm_enable_write(wm_enable_write[${\($i-1)}]),          
    .wm_address(wm_address), 
    .wm_fifo_enable(wm_fifo_enable),         
    .unit_data_out(unit${\($i)}_data_out)   
    );
DONATE
}



print $fh <<"DONATE";

    
    always @(posedge clk)
    begin
		
DONATE


$odd_flag = 0;
for ($i = 1; $i < $levels_number; $i = $i + 1){
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	for($j = 1; $j <= $levels[$i] + ($odd_flag % 2);$j = $j + 1){
		print $fh "\t\t\treg_adder_out_$i$under_Score$j <= adder_out_$i$under_Score$j;\n";
	}
	print $fh "\n";
}


print $fh <<"DONATE";   
	end

DONATE


$i = 1;
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	$jj = 1;
	for($j = 1; $j <= $levels[$i] ;$j = $j + 1){
		
		print $fh "\t$adder_name\t\tadr_$i$under_Score$j\t(.in1(unit${\($jj)}_data_out), .in2(unit${\($jj+1)}_data_out), .out(adder_out_$i$under_Score$j));\n";
		$jj = $jj + 2;
	}
	if($odd_flag % 2){
		print $fh "\n\tassign adder_out_$i$under_Score$j = unit${\($jj)}_data_out;\n";
	}
	print $fh "\n";


for ($i = 2; $i < $levels_number; $i = $i + 1){
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	$jj = 1;
	for($j = 1; $j <= $levels[$i] ;$j = $j + 1){
		print $fh "\t$adder_name\t\tadr_$i$under_Score$j\t(.in1(reg_adder_out_${\($i-1)}$under_Score$jj), .in2(reg_adder_out_${\($i-1)}$under_Score${\($jj+1)}), .out(adder_out_$i$under_Score$j));\n";
		$jj = $jj + 2;
	}
	if($odd_flag % 2){
		print $fh "\n\tassign adder_out_$i$under_Score$j = reg_adder_out_${\($i-1)}$under_Score$jj;\n";
	}
	print $fh "\n";
}

print $fh <<"DONATE";  
	$accumulator_name #(.DATA_WIDTH(DATA_WIDTH))
    accu
    (
     .clk(clk),
     .accu_enable(accu_enable),
	 .data_in_from_conv(reg_adder_out_${\($i-1)}$under_Score${\($jj-2)}),
	 .data_bias(data_bias),
     .data_in_from_next(data_in_from_next),
     .accu_data_out(accu_data_out)
     );
DONATE


print $fh <<"DONATE";   

	$Relu_name  Active1 (.in(accu_data_out), .out (relu_data_out), .relu_enable(relu_enable));
	
    assign data_out_for_next = relu_data_out;	   	 
	
endmodule

DONATE
close $fh or die "Couldn't Close File : $!";
