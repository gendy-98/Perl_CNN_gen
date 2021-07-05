use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] Units number
#ARGV[1] Mul & Add type which (decimal, fixed, float) 
#ARGV[2] DATA_WIDTH
#ARGV[3] IFM_SIZE  
#ARGV[4] IFM_DEPTH 
#ARGV[5] KERNAL_SIZE  

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
my $full_path = "../../../../Verilog_files/";
#######################################################################################
my $i = 0;
my $j = 0;
my $jj = 0;
my $file_name;
my $module_name;
my $adder_name;
my $div_name;
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
 
 if(lc ($ARGV[1]) eq "decimal"){
	$adder_name = "Dec_Adder";
	$div_name = "Dec_Divider";
	}
if(lc ($ARGV[1]) eq "fixed"){
	$adder_name = "Fixed_Adder";
	$div_name = "Fixed_Divider";
	}
if(lc ($ARGV[1]) eq "float"){
	$adder_name = "Float_Adder";
	$div_name = "Float_Divider";
	}
 
$module_name = "average_pooling";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
 print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 			  = $ARGV[2],
	/////////////////////////////////////
	$ifm_size              = $ARGV[3],                                                
	$ifm_depth             = $ARGV[4],
	$kernal_size           = $ARGV[5],
	//////////////////////////////////////
	NUMBER_OF_IFM           = IFM_DEPTH,
	IFM_SIZE_NEXT           = IFM_SIZE - KERNAL_SIZE + 1,
	ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
	ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT),
	FIFO_SIZE               = (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE)
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
		
		print $fh "\t$adder_name\t\tadr_$i$under_Score$j\t(.in1(pool_data_in_$jj), .in2(pool_data_in_${\($jj+1)}), .out(sum_$i$under_Score$j));\n";
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
		print $fh "\t$adder_name\t\tadr_$i$under_Score$j\t(.in1(reg_sum_${\($i-1)}$under_Score$jj), .in2(reg_sum_${\($i-1)}$under_Score${\($jj+1)}), .out(sum_$i$under_Score$j));\n";
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
	$div_name div ( .in1(reg_sum_${\($i-1)}$under_Score${\($jj-2)}), .in2($divided_by), .out(avgIFM) );

    
endmodule

DONATE

close $fh or die "Couldn't Close File : $!";

