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
my $full_path = "../../Verilog_files/";

#######################################################################################

my $file_name;
my $module_name;

$module_name = "singlePortMemory";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 				= 32,
	$mem_size 				= 512
	)(
	input clk,
	input Enable_Write,
	input Enable_Read,
	input [$clog2(MEM_SIZE)-1:0] Address,
	input [DATA_WIDTH-1:0] Data_Input,
	output reg [DATA_WIDTH-1:0] Data_Output
    );
    
	reg [DATA_WIDTH-1:0] Memory[MEM_SIZE-1:0];

	always @ (posedge clk)
	begin
		if (Enable_Write) 
		   Memory[Address] <= Data_Input; 
		if(Enable_Read)
		   Data_Output<= Memory[Address];
	end
endmodule
DONATE

close $fh or die "Couldn't Close File : $!";