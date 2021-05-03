use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


#argumets 
#ARGV[0] outputs 
#ARGV[1] stride 
#ARGV[2] DATA_WIDTH 
#ARGV[3] ADDRESS_BITS
#ARGV[4] IFM_SIZE
#ARGV[5] KERNAL_SIZE 
#ARGV[6] IFM_DEPTH
#ARGV[6] NUMBER_OF_FILTERS
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

my $data_width = "DATA_WIDTH";
my $address_bits = "ADDRESS_BITS";
my $ifm_size = "IFM_SIZE";
my $kernal_size = "KERNAL_SIZE";
my $ifm_depth = "IFM_DEPTH";
my $num_filters = "NUMBER_OF_FILTERS";

#######################################################################################
my $i = 0;

my $file_name;
my $module_name;
my $multi_name;
if(lc ($ARGV[0]) eq "decimal"){
	$module_name = "Dec_Divider";
	$multi_name = "Dec_Multiplier";
}
if(lc ($ARGV[0]) eq "fixed"){
	$module_name = "Fixed_Divider";
	$multi_name = "Fixed_Multiplier";
}
if(lc ($ARGV[0]) eq "float"){
	$module_name = "Float_Divider";
	$multi_name = "Float_Multiplier";
}


$file_name = $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
	$data_width = $ARGV[1]
DONATE

if(lc ($ARGV[0]) eq "decimal"){
	print $fh <<"DONATE";
	)(
	$i_p [$data_width - 1:0] in1,
	$i_p [$data_width - 1:0] in2,
	$o_p [$data_width - 1:0] out
	);
	assign out = in1 + in2;
$end_module
DONATE
}
if(lc ($ARGV[0]) eq "fixed"){
	print $fh <<"DONATE";
	,E = $ARGV[3]
	,M = $ARGV[2]
	)(
	$i_p [$data_width - 1:0] in1,
	$i_p [$data_width - 1:0] in2,
	$o_p [$data_width - 1:0] out
	);
///////////////////////////////////////////////////////////////
//////////////this code is not complete////////////////////////
///////////////////////////////////////////////////////////////
$end_module
DONATE
}
if(lc ($ARGV[0]) eq "float"){
	print $fh <<"DONATE";
	,E = $ARGV[3]
	,M = $ARGV[2]
	)(
	$i_p [$data_width - 1:0] in1,
	$i_p [$data_width - 1:0] in2,
	$o_p [$data_width - 1:0] out
	);
	wire  [Data_Width-1:0] in2_rec;
	 
	assign  in2_rec =   (in2 == 32'b 01000000100000000000000000000000) ? (32'b 00111110100000000000000000000000) :
						(in2 == 32'b 01000001000100000000000000000000) ? (32'b 00111101111000111000110110100100) :
						(in2 == 32'b 01000001100000000000000000000000) ? (32'b 00111101100000000000000000000000) :
						(in2 == 32'b 01000001110010000000000000000000) ? (32'b 00111101001000111101011100001010) :
						(32'b 00111100111000111011110011010011);
	
	$multi_name	M1 ( .in1 (in1) ,.in2 (in2_rec),.out(out));
	

$end_module
DONATE
}


close $fh or die "Couldn't Close File : $!";
