use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] DATA_WIDTH 32
#ARGV[1] IFM_SIZE 14
#ARGV[2] KERNAL_SIZE 2
#ARGV[3] STRIDE 2
#ARGV[4] ARITH_TYPE
#ARGV[5]


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
my $number_of_filters = "NUMBER_OF_FILTERS";
my $number_of_units = "NUMBER_OF_UNITS";
my $full_path = "../../../$ARGV[5]/";
#######################################################################################
my $i = 0;
my $j = 0;
my $jj = 0;
my $file_name;
my $module_name;

$module_name = "poolb_unit_$ARGV[1]";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 			  = $ARGV[0],
	/////////////////////////////////////
	$ifm_size              = $ARGV[1],                                                
	ARITH_TYPE 				= $ARGV[4],
	$kernal_size           = $ARGV[2],
	//////////////////////////////////////

	IFM_SIZE_NEXT           = (IFM_SIZE - KERNAL_SIZE)/2 + 1,
    ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
    ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT),     
    FIFO_SIZE               = (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE)
    (

	$i_p 					clk,
	$i_p 					reset,
	$i_p					fifo_enable,
	$i_p					pool_enable,
	$i_p [$data_width-1:0]	unit_data_in,
DONATE

if($ARGV[3] == 2){
print $fh <<"DONATE";
	$i_p [$data_width-1:0]  unit_data_in_2,
DONATE
}

print $fh <<"DONATE";
	$o_p [$data_width-1:0]  unit_data_out
    );
	
DONATE

my $num_outputs_of_fifo = $ARGV[2]*$ARGV[2];
my $fifo_regs_of_fifo = (($ARGV[2] - 1)*$ARGV[1] + $ARGV[2]);
my $module_name_of_fifo;
$module_name_of_fifo = "FIFO_$num_outputs_of_fifo$under_Score$ARGV[3]$under_Score$fifo_regs_of_fifo";


for($i = 1; $i <= $num_outputs_of_fifo; $i = $i + 1){
print $fh <<"DONATE";
	wire [$data_width-1:0] signal_if$i;
DONATE
}

chdir "./Modules";
system("perl fifo.pl  $ARGV[3] $ARGV[0] $ARGV[1] $ARGV[2] $ARGV[5]");


print $fh <<"DONATE";

	$module_name_of_fifo #(.$data_width($data_width), .$ifm_size($ifm_size), .$kernal_size($kernal_size))
	FIFO1 (
	.clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.fifo_data_in(unit_data_in),
	
DONATE
if($ARGV[3] == 2){
print $fh <<"DONATE";
	.fifo_data_in_2(unit_data_in2),
DONATE
}

for($i = 1; $i < $num_outputs_of_fifo; $i = $i + 1){
print $fh <<"DONATE";
	.fifo_data_out_$i(signal_if$i),
DONATE
}

print $fh <<"DONATE";
	.fifo_data_out_$i(signal_if$i)
	);
	
DONATE

print $fh <<"DONATE";
	average_pooling #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))
	pool_1 (
	.clk(clk),
    .reset(reset),
    .pool_enable(pool_enable),

DONATE

for($i = 1; $i <= $num_outputs_of_fifo; $i = $i + 1){
print $fh <<"DONATE";
	.pool_data_in_$i(signal_if$i),
DONATE
}

print $fh <<"DONATE";
	.pool_data_out_reg(unit_data_out)
	);
		
endmodule
DONATE

close $fh or die "Couldn't Close File : $!";
