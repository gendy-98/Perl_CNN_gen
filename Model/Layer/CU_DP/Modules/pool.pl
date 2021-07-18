use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] Units number
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
my $address_bits = "ADDRESS_BITS";

my $ifm_size = "IFM_SIZE";                                               
my $ifm_depth = "IFM_DEPTH";
my $kernal_size = "KERNAL_SIZE";
my $number_of_filters = "NUMBER_OF_FILTERS";
my $number_of_units = "NUMBER_OF_UNITS";
my $full_path = "../../../../$ARGV[3]/";
#######################################################################################
my $i = 0;
my $j = 0;
my $jj = 0;
my $file_name;
my $module_name;
my $adder_name = "adder";
my $div_name = "divider";
my $odd_flag;
my $dummy_level;
my @levels;
my $levels_number;
my $divided_by;


if ($ARGV[0] == 4){
$divided_by = "32'b 00111110100000000000000000000000";}
elsif($ARGV[0] == 9){
$divided_by = "32'b 00111101111000111000110110100100";}
elsif($ARGV[0] == 16){
$divided_by = "32'b 00111101100000000000000000000000";}
elsif($ARGV[0] == 25){
$divided_by = "32'b 00111101001000111101011100001010";}
else {
$divided_by = "32'b 00111100111000111011110011010011";}


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
 

 
$module_name = "average_pooling";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
 print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 			  = $ARGV[2],
	ARITH_TYPE				 = $ARGV[1]
	)
	(
	$i_p 							clk,
	$i_p 							reset,
	$i_p 							pool_enable,
DONATE

for($i=1;$i <= $levels[0] ; $i = $i + 1){
	print $fh "\t$i_p   [$data_width - 1 : 0]    pool_data_in_$i,\n";
}
print $fh "\t$o_p  reg [$data_width - 1 : 0]    pool_data_out_reg\n\t);\n\n";

$odd_flag = 0;
for ($i = 1; $i < $levels_number; $i = $i + 1){
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	for($j = 1; $j <= $levels[$i] + ($odd_flag % 2);$j = $j + 1){
		print $fh "\twire\t[DATA_WIDTH - 1 : 0]	sum_$i$under_Score$j;\n";
	}
	print $fh "\n";
}

$odd_flag = 0;
for ($i = 1; $i < $levels_number; $i = $i + 1){
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	for($j = 1; $j <= $levels[$i] + ($odd_flag % 2);$j = $j + 1){
		print $fh "\treg \t[DATA_WIDTH - 1 : 0]	reg_sum_$i$under_Score$j;\n";
	}
	print $fh "\n";
}

print $fh "\twire [$data_width - 1 : 0]	avgIFM;\n\n";

$odd_flag = 0;

$i = 1;
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	$jj = 1;
	for($j = 1; $j <= $levels[$i] ;$j = $j + 1){
		
		print $fh "\t$adder_name  #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))\t\tadr_$i$under_Score$j\t(.in1(pool_data_in_$jj), .in2(pool_data_in_${\($jj+1)}), .out(sum_$i$under_Score$j));\n";
		$jj = $jj + 2;
	}
	if($odd_flag % 2){
		print $fh "\n\tassign sum_$i$under_Score$j = pool_data_in_$jj;\n";
	}
	print $fh "\n";

for ($i = 2; $i < $levels_number; $i = $i + 1){
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	$jj = 1;
	for($j = 1; $j <= $levels[$i] ;$j = $j + 1){
		print $fh "\t$adder_name  #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))\t\tadr_$i$under_Score$j\t(.in1(reg_sum_${\($i-1)}$under_Score$jj), .in2(reg_sum_${\($i-1)}$under_Score${\($jj+1)}), .out(sum_$i$under_Score$j));\n";
		$jj = $jj + 2;
	}
	if($odd_flag % 2){
		print $fh "\n\tassign sum_$i$under_Score$j = reg_sum_${\($i-1)}$under_Score$jj;\n";
	}
	print $fh "\n";
}

################


print $fh <<"DONATE";
	always @(posedge clk , posedge reset)
    if (reset)
    begin
DONATE

$odd_flag = 0;
$i = 1;
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	for($j = 1; $j <= $levels[$i] + ($odd_flag % 2);$j = $j + 1){
		print $fh "\t\treg_sum_$i$under_Score$j <= 0;\n";
	}
	print $fh "\n";

print $fh <<"DONATE";
	end
    
    else if(pool_enable)
    begin
DONATE

$odd_flag = 0;
$i = 1;
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	for($j = 1; $j <= $levels[$i] + ($odd_flag % 2);$j = $j + 1){
		print $fh "\t\treg_sum_$i$under_Score$j <= \tsum_$i$under_Score$j ;\n";
	}
	print $fh "\n";
	
print $fh <<"DONATE";
	end
    
    always @(posedge clk, posedge reset)
    begin
		if(reset)
		begin
DONATE






my $odd_flag_state = $odd_flag;


for ($i = 2; $i < $levels_number; $i = $i + 1){
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	for($j = 1; $j <= $levels[$i] + ($odd_flag % 2);$j = $j + 1){
		print $fh "\t\t\treg_sum_$i$under_Score$j <= 0;\n";
	}
	print $fh "\n";
}
print $fh <<"DONATE";
		end
        
        else
        begin
DONATE

$odd_flag = $odd_flag_state;
for ($i = 2; $i < $levels_number; $i = $i + 1){
	$odd_flag = $odd_flag + ($levels[$i-1] % 2);
	for($j = 1; $j <= $levels[$i] + ($odd_flag % 2);$j = $j + 1){
		print $fh "\t\t\treg_sum_$i$under_Score$j <= sum_$i$under_Score$j;\n";
	}
	print $fh "\n";
}

print $fh "\t\tend\n\tend\n\n";



print $fh <<"DONATE";
    always @(posedge clk or posedge reset)
    begin
        if(reset)
            pool_data_out_reg <= 0;
        else
            pool_data_out_reg <= avgIFM;
    end

DONATE

print $fh <<"DONATE";
	$div_name  #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) div ( .in1(reg_sum_${\($i-1)}$under_Score${\($jj-2)}),  .out(avgIFM) );

    
endmodule

DONATE

close $fh or die "Couldn't Close File : $!";

