use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] ARITH_TYPE
#ARGV[1] DATA_WIDTH
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
my $adder_name = "adder";
my $mul_name = "multiplier";


$module_name = "accumulator";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	DATA_WIDTH      = $ARGV[1]
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

    $adder_name #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) D1 (.in1 (data_in_from_conv), .in2 (data_out_mux), .out (accu_data_out));

endmodule

DONATE

close $fh or die "Couldn't Close File : $!";