use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#No arguments needed 
#They get passed from higher layer
#ARGV[0] $relative_path
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
my $full_path = "../../$ARGV[0]/";

#######################################################################################

my $file_name;
my $module_name;

$module_name = "relu";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	DATA_WIDTH      = 32
	)(
	input relu_enable,
    input [DATA_WIDTH-1:0] in,
    output [DATA_WIDTH-1:0] out
    );
   
	assign out = ( (in[DATA_WIDTH-1]) & relu_enable ) ?  32'h00000000 : in ;
    //assign out = in;
endmodule 


DONATE

close $fh or die "Couldn't Close File : $!";