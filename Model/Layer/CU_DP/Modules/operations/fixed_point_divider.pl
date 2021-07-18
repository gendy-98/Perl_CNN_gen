use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


#argumets 
#ARGV[0] data_width 20
#ARGV[1] M - Mantissa, precision 12
#ARGV[2] E - Exponent, integer bits 8
#ARGV[3] Number to divide by
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
my $module_name = "fixed_point_divider";
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
    output [DATA_WIDTH-1:0] out
    );

DONATE

if($ARGV[3] == 4){
	print $fh <<"DONATE";
	assign out = {in1 [DATA_WIDTH-1],in1 [DATA_WIDTH-1],in1 [DATA_WIDTH-1:2]};
DONATE
}
elsif($ARGV[3] == 16){
	print $fh <<"DONATE";
	assign out = {in1 [DATA_WIDTH-1],in1 [DATA_WIDTH-1],in1 [DATA_WIDTH-1],in1 [DATA_WIDTH-1],in1 [DATA_WIDTH-1:4]};
DONATE
	
}


print $fh <<"DONATE";
  
endmodule

DONATE
close $fh or die "Couldn't Close File : $!";
