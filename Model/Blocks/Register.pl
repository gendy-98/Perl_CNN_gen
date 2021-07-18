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
#mal7oza lazem tekteb el rakam ely howa 28*28 for example

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

$module_name = "Register";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width = 32
	)(
	input clk,
	input reset, 
	input [$data_width-1:0] Data_in,
	input Enable, 
	output reg [$data_width-1:0] Data_out
	);

	always @(posedge clk ,posedge reset)
	begin
	if (reset)
		Data_out<= {DATA_WIDTH{1'b0}};
	else if (Enable)
		Data_out <= Data_in;
	end		
endmodule 
DONATE

close $fh or die "Couldn't Close File : $!";