use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";
use POSIX qw/ceil/;

#argumets 
#ARGV[0] N number of outputs 
#ARGV[1] M number of bits (data_width)
#$ARGV[2]
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
my $braket = "[";
my $full_path = "../../../../../$ARGV[2]/";
#######################################################################################
my $i = 0;
my $j = 0;
my $file_name;
my $module_name;
my $log_N =  ceil(log($ARGV[0]) / log(2));
my $log_M =  ceil(log($ARGV[1]) / log(2));
my $bit_state;
my $demux_instance_name;

$module_name = "demux_1_to_$ARGV[0]_$ARGV[1]bits";


$demux_instance_name = "demux_1_to_$ARGV[0]";
system("perl Demux1toN.pl  $ARGV[0] $ARGV[2]");
$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name 
(
	$i_p  [${\($ARGV[1]-1)}:0] din,
	$i_p  [${\($log_N-1)}:0] sel,
DONATE

for($i=1;$i < $ARGV[0] ; $i = $i + 1){
	print $fh "\t$o_p [${\($ARGV[1]-1)}:0] dout_$i,\n";
}
print $fh "\t$o_p [${\($ARGV[1]-1)}:0] dout_$i\n);\n\n";

for($i=0;$i < $ARGV[1] ; $i = $i + 1){
	print $fh "\t$demux_instance_name dm_$i\t (.din(din[$i]), \t .sel(sel)";
	for($j=1;$j <= $ARGV[0] ; $j = $j + 1){
		print $fh ",\t .dout_$j(dout_$j$braket$i])";
	}
	print $fh ");\n";
}

print $fh <<"DONATE";
	
$end_module
DONATE

close $fh or die "Couldn't Close File : $!";
