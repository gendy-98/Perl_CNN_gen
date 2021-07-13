use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


#argumets 
#ARGV[0] data_width 32
#ARGV[1] M - Mantissa, precision
#ARGV[2] E - Exponent, integer bits
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
my $data_width = "DATA_WIDTH";
my $end = "end";
my $end_module = "endmodule";
my $i_p = "input";
my $o_p = "output";
my $under_Score = "_";
my $full_path = "../../../../../Verilog_files/";
#######################################################################################
my $i = 0;

my $file_name;
my $module_name = "fixed_point_adder";
my $arith_type = "ARITH_TYPE";



$file_name = $full_path . $module_name . ".v";

open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
	$data_width = $ARGV[0],
	INTEGER = $ARGV[2], 
	FRACTION = $ARGV[1] )
    (
    input [DATA_WIDTH-1:0] in1,
    input [DATA_WIDTH-1:0] in2,
    output [DATA_WIDTH-1:0] out
    );
   
	assign out = in1 + in2;
  
endmodule

DONATE


close $fh or die "Couldn't Close File : $!";
