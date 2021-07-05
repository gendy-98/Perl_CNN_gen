use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

use POSIX; # for ceil and floor 

#argumets  
#ARGV[0] Units number
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
my $ceil = "\$ceil";
my $data_width = "DATA_WIDTH";
my $address_bits = "ADDRESS_BITS";
my $ifm_size = "IFM_SIZE";
my $ifm_depth = "IFM_DEPTH";
my $kernal_size = "KERNAL_SIZE";
my $num_filters = "NUMBER_OF_FILTERS";
my $full_path = "../../Verilog_files/";
#######################################################################################
my $i = 0;
my $j = 0;
my $k = 0;
my $h = 0;
my $l = 0;
my $m = 0;
my $file_name;
my $module_name;
my $IFM_number;

$module_name = "mem_unit_$ARGV[0]"; 

my $dual_port_name = "true_dual_port_memory";



$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width				= 32,
///////////architecture parameters//////
	$ifm_size				= 16, 
    ADDRESS_SIZE_IFM		= $clog2($ifm_size*$ifm_size))

	)(
	$i_p clk,
	
	input [ADDRESS_SIZE_IFM-1:0]     Address_A,
	input [ADDRESS_SIZE_IFM-1:0]     Address_B,
	
	input Enable_Write_A_Mem, Enable_Read_A_Mem,
	input Enable_Write_B_Mem, Enable_Read_B_Mem,
DONATE

for($i = 1;$i <= $ARGV[0]; $i = $i + 1){
	print $fh <<"DONATE";
	$i_p [$data_width-1:0] Data_Input_A_Mem$i,
	$i_p [$data_width-1:0] Data_Input_B_Mem$i,
DONATE
}

for($i = 1;$i < $ARGV[0]; $i = $i + 1){
	print $fh <<"DONATE";
	$o_p [$data_width-1:0] Data_Output_A_Mem$i,
	$o_p [$data_width-1:0] Data_Output_B_Mem$i,
DONATE
}

print $fh <<"DONATE";
	$o_p [$data_width-1:0] Data_Output_A_Mem$i,
	$o_p [$data_width-1:0] Data_Output_B_Mem$i
	);
	
DONATE


for($i = 1;$i <= $ARGV[0]; $i = $i + 1){
	print $fh <<"DONATE";
	
	$dual_port_name #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	TDPM$i (
		.clk(clk),
		
		.Data_Input_A(Data_Input_A_Mem$i),
		.Address_A(Address_A),
		.Enable_Write_A(Enable_Write_A_Mem),
		.Enable_Read_A(Enable_Read_A_Mem), 
	  
		.Data_Input_B(Data_Input_B_Mem$i),
		.Address_B(Address_B),
		.Enable_Write_B(Enable_Write_B_Mem),
		.Enable_Read_B(Enable_Read_B_Mem), 
	  
		.Data_Output_A(Data_Output_A_Mem$i),
		.Data_Output_B(Data_Output_B_Mem$i)
	);
	
DONATE
}


print $fh "$end_module";

close $fh or die "Couldn't Close File : $!";
