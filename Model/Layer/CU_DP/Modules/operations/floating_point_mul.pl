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
my $module_name = "floating_point_mul";
my $arith_type = "ARITH_TYPE";



$file_name = $full_path . $module_name . ".v";

open my $fh, '>', $file_name
  or die "Can't open file : $!";


print $fh <<"DONATE";
$module $module_name $parameter
	$data_width = $ARGV[0],
	E = $ARGV[2], 
	M = $ARGV[1] )
    (
    input [DATA_WIDTH-1:0] in1,
    input [DATA_WIDTH-1:0] in2,
    output [DATA_WIDTH-1:0] out
    );
  
    localparam [E-1:0] Bias = 2**(E-1)-1;   
    
    wire sign1,sign2,signOUT;
    wire [E-1:0] Exponent1,Exponent2,ExponentOUT;
    wire [M-1:0] Mantissa1,Mantissa2,MantissaOUT; 
    
    wire [E-1:0]   ExponentUnNORMALIZED;
    wire [2*M+1:0] MantissaUnNORMALIZED;
    wire NormalizationNeeded, ZeroIN;
    
    assign sign1 = in1[DATA_WIDTH-1];
    assign sign2 = in2[DATA_WIDTH-1];
    assign Exponent1 = in1[DATA_WIDTH-2:DATA_WIDTH-E-1];
    assign Exponent2 = in2[DATA_WIDTH-2:DATA_WIDTH-E-1];
    assign Mantissa1 = in1[M-1:0];
    assign Mantissa2 = in2[M-1:0];
    
    assign signOUT = sign1 ^ sign2;
    
    assign ExponentUnNORMALIZED = Exponent1 + Exponent2 - Bias;
    assign MantissaUnNORMALIZED = {1'b1,Mantissa1} * {1'b1,Mantissa2};
    
    assign NormalizationNeeded = MantissaUnNORMALIZED[2*M+1];
    assign MantissaOUT = NormalizationNeeded ? MantissaUnNORMALIZED[2*M:M+1] : MantissaUnNORMALIZED[2*M-1:M];
    assign ExponentOUT = NormalizationNeeded ? ExponentUnNORMALIZED+1 : ExponentUnNORMALIZED ;
    
    assign ZeroIN = (~|in1[DATA_WIDTH-2:0]) | (~|in2[DATA_WIDTH-2:0]);
    assign out = ZeroIN ? 'b0 : {signOUT, ExponentOUT, MantissaOUT};
    
endmodule

DONATE


close $fh or die "Couldn't Close File : $!";
