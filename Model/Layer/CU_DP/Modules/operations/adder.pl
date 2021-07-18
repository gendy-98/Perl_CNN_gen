use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


#argumets 
#ARGV[0] ARITH_TYPE 
#ARGV[1] data_width
#ARGV[2] M - Mantissa, precision
#ARGV[3] E - Exponent, integer bits
#$ARGV[4]
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
my $full_path = "../../../../../$ARGV[4]/";
#######################################################################################
my $i = 0;

my $file_name;
my $module_name = "adder";
my $arith_type = "ARITH_TYPE";



$file_name = $full_path . $module_name . ".v";

open my $fh, '>', $file_name
  or die "Can't open file : $!";

system("perl fixed_point_adder.pl $ARGV[1] $ARGV[3] $ARGV[2] $ARGV[4]");
system("perl floating_point_adder.pl $ARGV[1] $ARGV[3] $ARGV[2] $ARGV[4]");


print $fh <<"DONATE";
$module $module_name $parameter
	$arith_type = $ARGV[0],
	$data_width = $ARGV[1],
	E = $ARGV[3], 
	M = $ARGV[2] )
    (
    input [DATA_WIDTH-1:0] in1,
    input [DATA_WIDTH-1:0] in2,
    output [DATA_WIDTH-1:0] out
    );
     
    generate
		if (ARITH_TYPE)
			fixed_point_adder    #(.DATA_WIDTH(DATA_WIDTH)) add (.in1(in1), .in2(in2), .out(out));
		else
			floating_point_adder #(.DATA_WIDTH(DATA_WIDTH), .E($ARGV[3]), .M($ARGV[2])) add (.in1(in1), .in2(in2), .out(out));
	endgenerate
    
endmodule
DONATE


close $fh or die "Couldn't Close File : $!";
