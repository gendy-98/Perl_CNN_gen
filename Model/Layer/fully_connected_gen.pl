use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] DATA_WIDTH 32
#ARGV[1] FC_SIZE 84
#ARGV[2] ARITH TYPE

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
my $full_path = "../../Verilog_files/";
#######################################################################################
my $i = 0;
my $j = 0;
my $jj = 0;
my $file_name;
my $module_name;




$module_name = "fully_connected_$ARGV[1]";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
  print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 			  = $ARGV[0],
	ARITH_TYPE                = $ARGV[2]
)(
	$i_p [$data_width-1:0] Data_in,
DONATE

for($i=1; $i<= $ARGV[1]; $i = $i + 1){
		print $fh <<"DONATE";
	$i_p [$data_width-1:0] Data_Weight_$i,
DONATE
	
}

for($i=1; $i< $ARGV[1]; $i = $i + 1){
		print $fh <<"DONATE";
	$o_p [$data_width-1:0] Data_out_FC_$i,
DONATE
	
}

print $fh <<"DONATE";
	$o_p [$data_width-1:0] Data_out_FC_$i
	);
	
DONATE

for($i=1; $i< $ARGV[1]; $i = $i + 1){
		print $fh <<"DONATE";
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M$i (.in1 (Data_in) ,.in2 (Data_Weight_$i),.out(Data_out_FC_$i));
DONATE
	
}


		print $fh <<"DONATE";
	multiplier #(.DATA_WIDTH(DATA_WIDTH) , .ARITH_TYPE(ARITH_TYPE)) M$i (.in1 (Data_in) ,.in2 (Data_Weight_$i),.out(Data_out_FC_$i));
	endmodule
DONATE


close $fh or die "Couldn't Close File : $!";