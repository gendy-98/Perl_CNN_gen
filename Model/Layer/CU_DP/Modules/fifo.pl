use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


#argumets 
#ARGV[0] stride 
#ARGV[1] DATA_WIDTH 
#ARGV[2] IFM_SIZE
#ARGV[3] KERNAL_SIZE 
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
my $num_outputs = $ARGV[3]*$ARGV[3];
my $fifo_regs = (($ARGV[3] - 1)*$ARGV[2] + $ARGV[3]);
$module_name = "FIFO_$num_outputs$under_Score$ARGV[0]$under_Score$fifo_regs";





$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 					= $ARGV[1],
///////////architecture parameters//////
	$ifm_size 					= $ARGV[2],
	$kernal_size 				= $ARGV[3],
///////////generated parameters/////////
	FIFO_SIZE               	= ($kernal_size-1)*IFM_SIZE + $kernal_size,            

	)(
	$i_p clk,
	$i_p reset,
	$i_p fifo_enable,
	$i_p [$data_width-1:0] fifo_data_in,
DONATE

if($ARGV[0] == 2){
	print $fh "\t$i_p [$data_width-1:0] fifo_data_in_2,\n";
}

for($i = 1;$i < $num_outputs; $i = $i + 1){
	print $fh <<"DONATE";
	$o_p [$data_width-1:0] fifo_data_out_$i,
DONATE
}

print $fh <<"DONATE";
	$o_p [$data_width-1:0] fifo_data_out_$i
	);
	reg	[$data_width-1:0] FIFO  [FIFO_SIZE-1:0] ;
	always @ (posedge clk or posedge reset)
    begin
        if(reset)
		begin
DONATE

for($i = 0;$i < ($ARGV[3] - 1)*$ARGV[2] + $ARGV[3];$i = $i + 1){
	print $fh "\t\t\tFIFO[$i] <= 0;\n";
	
}

print $fh <<"DONATE";
		end
		else if(fifo_enable)
		begin
DONATE
if($ARGV[0] == 2){
	print $fh "\t\t\tFIFO[0] <= fifo_data_in_2;\n";
	print $fh "\t\t\tFIFO[1] <= fifo_data_in;\n";
	for($i = 0;$i < (($ARGV[3] - 1)*$ARGV[2] + $ARGV[3])-3;$i = $i + 2){
		print $fh "\t\t\tFIFO[${\($i+2)}] <= FIFO[$i];\n";
		print $fh "\t\t\tFIFO[${\($i+3)}] <= FIFO[${\($i+1)}];\n";
	}
	if($ARGV[3] % 2 != 0){
		print $fh "\t\t\tFIFO[${\($i+2)}] <= FIFO[$i];\n";
	}
}
else{
	print $fh "\t\t\tFIFO[0] <= fifo_data_in;\n";
	for($i = 0;$i < (($ARGV[3] - 1)*$ARGV[2] + $ARGV[3])-1;$i = $i + 1){
		print $fh "\t\t\tFIFO[${\($i+1)}] <= FIFO[$i];\n";
	}
}
print $fh <<"DONATE";
		end
	end

DONATE

for($i = 1; $i <= $ARGV[3]; $i = $i + 1){
	for($j = 1; $j <= $ARGV[3]; $j = $j + 1){
		print $fh "\tassign    fifo_data_out_${\($j + ($i-1)*$ARGV[3])} = FIFO[($kernal_size-$i)*IFM_SIZE+($kernal_size-$j)];\n";
	}
	print $fh "\t\n";
}

print $fh "$end_module";

close $fh or die "Couldn't Close File : $!";
