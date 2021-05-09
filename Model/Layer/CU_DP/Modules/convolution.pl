use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] Layer name    (A, B)
#ARGV[1] Units number
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
$dummy_level = $ARGV[1];


$odd_flag = 0;
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
 
$module_name = "convolution";

$file_name = $module_name . ".v";
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
	// ADDRESS_SIZE_WM Differs between A and B but it doesn't matter in this file 
	FIFO_SIZE               = (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE,
	NUMBER_OF_IFM           = IFM_DEPTH,
	NUMBER_OF_IFM_NEXT      = NUMBER_OF_FILTERS,
	NUMBER_OF_WM            = KERNAL_SIZE*KERNAL_SIZE,                              
	NUMBER_OF_BITS_SEL_IFM_NEXT =$clog2(NUMBER_OF_IFM_NEXT)
)(
	$i_p 							clk,
	$i_p 							reset,
	$i_p 							conv_enable,
DONATE

for($i=1;$i <= $levels[0] ; $i = $i + 1){
	print $fh "\t$i_p   [$data_width - 1 : 0]    w$i,if$i,\n";
}
print $fh "\t$o_p  [$data_width - 1 : 0]    conv_data_out\n\t);\n\n";



for($i=1;$i <= $levels[0] ; $i = $i + 1){
	print $fh "\twire\t[$data_width - 1 : 0]\tmul_out_$i;\n";
}
print $fh "\n";
for($i=1;$i <= $levels[0] ; $i = $i + 1){
	print $fh "\treg \t[$data_width - 1 : 0]\treg_mul_out_$i;\n";
}
print $fh "\n";
	
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
	always @(posedge clk , posedge reset)
    if (reset)
    begin
DONATE
for($i=1;$i <= $levels[0] ; $i = $i + 1){
	print $fh "\t\treg_mul_out_$i <= 0;\n";
}
print $fh <<"DONATE";
	end
    
    else if(conv_enable)
    begin
DONATE
for($i=1;$i <= $levels[0] ; $i = $i + 1){
	print $fh "\t\treg_mul_out_$i <= mul_out_$i;\n";
}
print $fh <<"DONATE";
	end
    
    always @(posedge clk, posedge reset)
    begin
		if(reset)
		begin
DONATE

$odd_flag = 0;
for ($i = 1; $i < $levels_number; $i = $i + 1){
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	for($j = 1; $j <= $levels[$i] + ($odd_flag % 2);$j = $j + 1){
		print $fh "\t\t\treg_adder_out_$i$under_Score$j <= 0;\n";
	}
	print $fh "\n";
}
print $fh <<"DONATE";
		end
        
        else
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

print $fh "\t\tend\n\tend\n\n";

for($i=1;$i <= $levels[0] ; $i = $i + 1){
	print $fh "\t$mul_name\tmul_$i\t(.in1(w$i), .in2(if$i), .out(mul_out_$i));\n";
}

print $fh "\n";
$odd_flag = 0;

$i = 1;
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	$jj = 1;
	for($j = 1; $j <= $levels[$i] ;$j = $j + 1){
		
		print $fh "\t$adder_name\t\tadr_$i$under_Score$j\t(.in1(reg_mul_out_$jj), .in2(reg_mul_out_${\($jj+1)}), .out(adder_out_$i$under_Score$j));\n";
		$jj = $jj + 2;
	}
	if($odd_flag % 2){
		print $fh "\n\tassign adder_out_$i$under_Score$j = reg_mul_out_$jj;\n";
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
	assign conv_data_out = reg_adder_out_${\($i-1)}$under_Score${\($jj-2)};  

    
endmodule

DONATE





close $fh or die "Couldn't Close File : $!";
