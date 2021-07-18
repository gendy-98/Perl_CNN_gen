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
#ARGV[4] Number to divide by
#$ARGV[5]
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
my $full_path = "../../../../../$ARGV[5]/";
#######################################################################################
my $i = 0;

my $file_name;
my $module_name = "divider";
my $arith_type = "ARITH_TYPE";
my $multi_name;
my $number_to_divide_by_fixed;
my $number_to_divide_by_float;


$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

system("perl fixed_point_divider.pl $ARGV[1] $ARGV[3] $ARGV[2] $ARGV[4] $ARGV[5]");
system("perl floating_point_mul.pl $ARGV[1] $ARGV[3] $ARGV[2] $ARGV[5]");

if($ARGV[4] == 4){
	$number_to_divide_by_float = "32'b00111110100000000000000000000000";
}
elsif($ARGV[4] == 16){
	$number_to_divide_by_float = "32'b00111101100000000000000000000000";
}

print $fh <<"DONATE";
$module $module_name $parameter
	$arith_type = $ARGV[0],
	DATA_WIDTH = $ARGV[1],
	E          = $ARGV[3],
	M          = $ARGV[2]
)
	(
    input [DATA_WIDTH-1:0] in1,
    output  [DATA_WIDTH-1:0] out
    );
	
	generate
		if (ARITH_TYPE)
			fixed_point_divider    #(.DATA_WIDTH(DATA_WIDTH), .INTEGER(E), .FRACTION(M)) div (.in1(in1), .out(out));
		else
			floating_point_mul #(.DATA_WIDTH(DATA_WIDTH), .E(E), .M(M)) mul (.in1(in1), .in2($number_to_divide_by_float), .out(out));
	endgenerate
	
endmodule
DONATE

close $fh or die "Couldn't Close File : $!";
