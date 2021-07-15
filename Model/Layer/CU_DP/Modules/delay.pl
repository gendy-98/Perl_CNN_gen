use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


#argumets 
#ARGV[0] delay cycles
#ARGV[1] Delay_Data_Width
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

my $data_width = "SIG_DATA_WIDTH";
my $address_bits = "ADDRESS_BITS";
my $ifm_size = "IFM_SIZE";
my $ifm_depth = "IFM_DEPTH";
my $kernal_size = "KERNAL_SIZE";
my $num_filters = "NUMBER_OF_FILTERS";
my $full_path = "../../../../Verilog_files/";
#######################################################################################
my $i = 0;
my $j = 0;
my $file_name;
my $module_name;
my $multi_name;

$module_name = "delay_$ARGV[0]$under_Score$ARGV[1]";





$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
	$data_width = $ARGV[1],
	delay_cycles = $ARGV[0]
	)(
	$i_p clk,
	$i_p reset,
	$i_p [$data_width-1:0] Data_In,
	$o_p [$data_width-1:0] Data_Out
	);
	
DONATE



print $fh <<"DONATE";

	reg	[$data_width-1:0] FIFO  [delay_cycles-1:0] ;
	always @ (posedge clk or posedge reset)
    begin
        if(reset)
		begin
DONATE

for($i = 0;$i < $ARGV[0]; $i = $i + 1){
	print $fh "\t\t\tFIFO[$i] <= {SIG_DATA_WIDTH{1'b0}};\n";
	
}

print $fh <<"DONATE";
		end
		else
		begin
DONATE

print $fh "\t\t\tFIFO[0] <= Data_In;\n";
for($i = 0;$i < $ARGV[0]-1;$i = $i + 1){
	print $fh "\t\t\tFIFO[${\($i+1)}] <= FIFO[$i];\n";
}
	
print $fh <<"DONATE";
		end
	end

DONATE

print $fh "\tassign    Data_Out = FIFO[$i];\n";


print $fh "$end_module";

close $fh or die "Couldn't Close File : $!";
