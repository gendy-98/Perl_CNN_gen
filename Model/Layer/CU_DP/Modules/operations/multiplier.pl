use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


#argumets 
#ARGV[0] which adder (decimal, fixed, float) 
#ARGV[1] data_width
#ARGV[2] M - Mantissa, precision
#ARGV[3] E - Exponent, integer bits
#


######################################### CONSTANTS ###################################
my $module = <<"DONATE";
`timescale 1ns / 1ps

/*********************************************************************************
* Create Date: 01/19/2021 08:53:06 PM                                            *
* Module Name: FP_Multiplier                                                     *
* N : Number of bits 16 - 32 - 64                                                *
* E : Exponent Width 5  - 8  - 11                                                *
* M : Mantissa Width 10 - 23 - 52                                                *
* Bias: 2**(E-1)-1                                                               *
**********************************************************************************/


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

#######################################################################################
my $i = 0;

my $file_name;
my $module_name;

if(lc ($ARGV[0]) eq "decimal"){
	$module_name = "Dec_Multiplier";}
if(lc ($ARGV[0]) eq "fixed"){
	$module_name = "Fixed_Multiplier";}
if(lc ($ARGV[0]) eq "float"){
	$module_name = "Float_Multiplier";}


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
	assign out = in1 * in2;
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
	
	localparam [E-1:0] Bias = 2**(E-1)-1;   
	localparam N = E + M + 1;
	wire sign1,sign2,signOUT;
	wire [E-1:0] Exponent1,Exponent2,ExponentOUT;
	wire [M-1:0] Mantissa1,Mantissa2,MantissaOUT; 

	wire [E-1:0]   ExponentUnNORMALIZED;
	wire [2*M+1:0] MantissaUnNORMALIZED;
	wire NormalizationNeeded, ZeroIN;

	assign sign1 = in1[N-1];
	assign sign2 = in2[N-1];
	assign Exponent1 = in1[N-2:N-E-1];
	assign Exponent2 = in2[N-2:N-E-1];
	assign Mantissa1 = in1[M-1:0];
	assign Mantissa2 = in2[M-1:0];

	assign signOUT = sign1 ^ sign2;

	assign ExponentUnNORMALIZED = Exponent1 + Exponent2 - Bias;
	assign MantissaUnNORMALIZED = {1'b1,Mantissa1} * {1'b1,Mantissa2};

	assign NormalizationNeeded = MantissaUnNORMALIZED[2*M+1];
	assign MantissaOUT = NormalizationNeeded ? MantissaUnNORMALIZED[2*M:M+1] : MantissaUnNORMALIZED[2*M-1:M];
	assign ExponentOUT = NormalizationNeeded ? ExponentUnNORMALIZED+1 : ExponentUnNORMALIZED ;

	assign ZeroIN = (~|in1[N-2:0]) | (~|in2[N-2:0]);
	assign out = ZeroIN ? 'b0 : {signOUT, ExponentOUT, MantissaOUT};

$end_module
DONATE
}


close $fh or die "Couldn't Close File : $!";
