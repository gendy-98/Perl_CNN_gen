use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] Mul_number
#ARGV[1] ARITH_TYPE
#ARGV[2] DATA_WIDTH
#$ARGV[3]
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

my $full_path = "../../../../$ARGV[3]/";
#######################################################################################
my $i = 0;
my $j = 0;
my $jj = 0;
my $file_name;
my $module_name;
my $adder_name = "adder";
my $mul_name = "multiplier";
my $odd_flag;
my $dummy_level;
my @levels;
my $levels_number;
my $arith_type = "ARITH_TYPE";

$dummy_level = $ARGV[0];


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
 
# if(lc ($ARGV[1]) eq "decimal"){
#	$adder_name = "Dec_Adder";
#	$mul_name = "Dec_Multiplier";
#	}
#if(lc ($ARGV[1]) eq "fixed"){
#	$adder_name = "Fixed_Adder";
#	$mul_name = "Fixed_Multiplier";
#	}
#if(lc ($ARGV[1]) eq "float"){
#	$adder_name = "Float_Adder";
#	$mul_name = "Float_Multiplier";
#	}
 
$module_name = "convolution";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
  print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 			  = $ARGV[2],
	$arith_type 			  = $ARGV[1]
	//////////////////////////////////////                     
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
	print $fh "\t\treg_mul_out_$i <= {DATA_WIDTH{1'b0}};\n";
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
		print $fh "\t\t\treg_adder_out_$i$under_Score$j <= {DATA_WIDTH{1'b0}};\n";
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
	print $fh "\t$mul_name #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))\tmul_$i\t(.in1(w$i), .in2(if$i), .out(mul_out_$i));\n";
}

print $fh "\n";
$odd_flag = 0;

$i = 1;
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	$jj = 1;
	for($j = 1; $j <= $levels[$i] ;$j = $j + 1){
		
		print $fh "\t$adder_name #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))\t\tadr_$i$under_Score$j\t(.in1(reg_mul_out_$jj), .in2(reg_mul_out_${\($jj+1)}), .out(adder_out_$i$under_Score$j));\n";
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
		print $fh "\t$adder_name #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))\t\tadr_$i$under_Score$j\t(.in1(reg_adder_out_${\($i-1)}$under_Score$jj), .in2(reg_adder_out_${\($i-1)}$under_Score${\($jj+1)}), .out(adder_out_$i$under_Score$j));\n";
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
