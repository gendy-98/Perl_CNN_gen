use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] LAYERS_NAMES //NAMES DELIMITED BY COMAS
#ex: conva1,convb,conva2,fc1,fc2
#ARGV[1] NUMBER OF UNITS //NUMBER OF UNITS IN EACH LAYER DELIMITED BY COMAS
#ex: 3,3,3,84,10
#ARGV[2] DATA_WIDTH
#ARGV[3] ADDRESS_BUS
#ARGV[4] ADDRESS_BITS
#ARGV[5] ENABLE_BITS
#ARGV[6] RGB FLAG



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
my $address_bus = "ADDRESS_BUS";
my $address_bits = "ADDRESS_BITS";
my $enable_bits = "ENABLE_BITS";
my $ifm_size = "IFM_SIZE";                                               
my $ifm_depth = "IFM_DEPTH";
my $kernal_size = "KERNAL_SIZE";
my $number_of_filters = "NUMBER_OF_FILTERS";
my $number_of_units = "NUMBER_OF_UNITS";
my $full_path = "../Verilog_files/";
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

my @Layers_names = split(',', $ARGV[0]);
my $Array_number = @Layers_names;

my @UnitsInEachLayer  = split(',', $ARGV[1]);
my $Units_Array_number = @UnitsInEachLayer;

$module_name = "memory_control";
my $single_port_name = "single_port_memory";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 		       = $ARGV[2],
///////////architecture parameters//////
	$address_bus            = $ARGV[3],                                                
    $address_bits           = $ARGV[4],
    $enable_bits            = $ARGV[5])

	(
	$i_p clk,
    $i_p [$data_width-1:0] riscv_data_bus,
    $i_p [$address_bus-1:0] riscv_address_bus,
    $i_p initialization_done, 
	$o_p conva1_start,

DONATE

if($ARGV[6] == 0){
	print $fh <<"DONATE";
	//1 indicates the input img is grayscale
	output [1-1:0] conva1_ifm_enable_write, 
	
DONATE
}
else{
	print $fh <<"DONATE";
	//3 indicates the input img is RGB
	output [3-1:0] conva1_ifm_enable_write,
	
DONATE
}


for($i = 0; $i <$Array_number; $i = $i + 1){
	if (index($Layers_names[$i], "pool") == -1) {
	print $fh <<"DONATE";
	$o_p [$UnitsInEachLayer[$i]-1:0] $Layers_names[$i]_wm_enable_write,
DONATE
	}
}

for($i = 0; $i <$Array_number; $i = $i + 1){
	if (index($Layers_names[$i], "pool") == -1) {
	if (index($Layers_names[$i], "convb") == -1) {
	print $fh <<"DONATE";
	$o_p $Layers_names[$i]_bm_enable_write,
DONATE
}
else{
	print $fh <<"DONATE";
	$o_p [$UnitsInEachLayer[$i]-1:0] $Layers_names[$i]_bm_enable_write,
DONATE
}
	}
}

	print $fh <<"DONATE";
	
	$o_p [$data_width-1:0] riscv_data,
    $o_p [$address_bits-1:0] riscv_address
	);
DONATE

#7esbet el no of memories total

my $no_of_memories_total = 0;
for($i = 0; $i <$Array_number; $i = $i + 1){
	$no_of_memories_total = $no_of_memories_total + $UnitsInEachLayer[$i];
}

if($ARGV[6] == 0){
	$no_of_memories_total = $no_of_memories_total + 1;
	}
else{
	$no_of_memories_total = $no_of_memories_total + 3;
	}
#7esbet el bias
my $bias_count = 0;
for($i = 0; $i <$Array_number; $i = $i + 1){
	if (index($Layers_names[$i], "convb") == -1) {
		$bias_count = $bias_count + 1;
	}
	else{
		$bias_count = $bias_count + $UnitsInEachLayer[$i];
	}
}
	
#7esbet el no of memories total final value
$no_of_memories_total = $no_of_memories_total + $bias_count;

	print $fh <<"DONATE";
	
	reg [$no_of_memories_total-1:0] enable_write;
    wire [$enable_bits-1:0] address_enable_bits;
	
    assign riscv_data          = riscv_data_bus;
    assign riscv_address       = riscv_address_bus[$address_bits-1:0];
    
    assign address_enable_bits = riscv_address_bus[$address_bus-1 : $address_bus-$enable_bits];
	
	assign    conva1_start = initialization_done;
	
	
	    always @*
		begin
        case(address_enable_bits)
DONATE

for($i = 1; $i <=$no_of_memories_total; $i = $i + 1){

	print $fh "\t\t\t$ARGV[5]'d$i  : begin enable_write = $no_of_memories_total\'b";
		my $zeroesleft = $no_of_memories_total-$i;
	for($j = $no_of_memories_total-$i; $j > 0; $j = $j - 1){
		print $fh "0";
	};
	print $fh "1";

	for($jj = 0; $jj < $no_of_memories_total-$zeroesleft-1; $jj = $jj + 1){
		print $fh "0";
	};
	print $fh ";end\n";

}

	print $fh "\n\t\t\tdefault : begin enable_write = $no_of_memories_total\'b";
	for($j = $no_of_memories_total; $j > 0; $j = $j - 1){
		print $fh "0";
	};
	print $fh ";end\n";
	
	print $fh "\n\t\tendcase\n";
	print $fh "\tend\n";
	
	print $fh "\n\n\n";
	
	print $fh "assign conva1_ifm_enable_write = enable_write[${\($no_of_memories_total-1)}:";
	
	if($ARGV[6] == 0){
	print $fh "${\($no_of_memories_total-1)}];";
}
else{
		print $fh "${\($no_of_memories_total-1-2)}];";
}
print $fh "\n\n";

my $index_summer = 0;
for($i = 0; $i <$Array_number; $i = $i + 1){
	print $fh <<"DONATE";
	assign $Layers_names[$i]_wm_enable_write = enable_write[${\($index_summer+$UnitsInEachLayer[$i]-1)}:$index_summer];
DONATE
$index_summer = $index_summer + $UnitsInEachLayer[$i];
}

print $fh "\n";



for($i = 0; $i <$Array_number; $i = $i + 1){
	if (index($Layers_names[$i], "convb") == -1) {
	print $fh <<"DONATE";
	assign $Layers_names[$i]_bm_enable_write = enable_write[$index_summer];
DONATE
$index_summer = $index_summer + 1;
	}
	else{
	print $fh <<"DONATE";
	assign $Layers_names[$i]_bm_enable_write = enable_write[${\($index_summer + $UnitsInEachLayer[$i]-1)}:$index_summer];
DONATE
$index_summer = $index_summer + $UnitsInEachLayer[$i];
	}
}


print $fh "$end_module";

close $fh or die "Couldn't Close File : $!";






