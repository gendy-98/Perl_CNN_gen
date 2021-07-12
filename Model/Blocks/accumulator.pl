use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] decimal/fixed/float
#They get passed from higher layer
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

my $data_width = "DATA_WIDTH";
my $mem_size = "MEM_SIZE";
my $full_path = "../../Verilog_files/";

#######################################################################################
my $file_name;
my $module_name;
my $adder_name;
my $mul_name;




 if(lc ($ARGV[0]) eq "decimal"){
	$adder_name = "Dec_Adder";
	$mul_name = "Dec_Multiplier";
	}
if(lc ($ARGV[0]) eq "fixed"){
	$adder_name = "Fixed_Adder";
	$mul_name = "Fixed_Multiplier";
	}
if(lc ($ARGV[0]) eq "float"){
	$adder_name = "Float_Adder";
	$mul_name = "Float_Multiplier";
	}
 
$module_name = "accumulator";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	DATA_WIDTH      = 32
	)(
	input clk,
	input accu_enable,
	input  [DATA_WIDTH-1:0] data_in_from_conv,
	input  [DATA_WIDTH-1:0] data_bias,
	input  [DATA_WIDTH-1:0] data_in_from_next,
	output [DATA_WIDTH-1:0] accu_data_out
    );

    wire [DATA_WIDTH-1:0] data_out_mux;
    
	assign data_out_mux = accu_enable ? data_in_from_next : data_bias;

    $adder_name D1 (.in1 (data_in_from_conv), .in2 (data_out_mux), .out (accu_data_out));

endmodule

DONATE

close $fh or die "Couldn't Close File : $!";