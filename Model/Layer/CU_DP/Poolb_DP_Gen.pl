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
#ARGV[2] IFM_DEPTH 3
#ARGV[3] STRIDE 2
#ARGV[4] NO._OF_UNITS 3
#ARGV[5] KERNAL_SIZE 2
#ARGV[6] ARITH_TYPE

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
my $full_path = "../../../Verilog_files/";
#######################################################################################
my $i = 0;
my $j = 0;
my $jj = 0;
my $file_name;
my $module_name;
my $pool_unit_name = "poolb_unit_$ARGV[1]";
#ARGV[0] DATA_WIDTH 32
#ARGV[1] IFM_SIZE 14
#ARGV[2] IFM_DEPTH 3
#ARGV[3] STRIDE 2
#ARGV[4] NO._OF_UNITS 3
#ARGV[5] KERNAL_SIZE 2
#ARGV[6] ARITH_TYPE
system("perl PoolB_unit.pl  $ARGV[0] $ARGV[1] $ARGV[5] $ARGV[3] $ARGV[6] ");


$module_name = "poolb_dp_U$ARGV[4]";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
  print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 			  = $ARGV[0],
	////////////////////////////////////
	$ifm_size              = $ARGV[1],                                                
	$ifm_depth             = $ARGV[2],
	ARITH_TYPE 				= $ARGV[6],
	$kernal_size           = $ARGV[5]
)(
	$i_p 							clk,
	$i_p 							reset,
	$i_p 							fifo_enable,
	$i_p							pool_enable,
DONATE

if($ARGV[3] == 2){
	for($i=1; $i<= $ARGV[4]; $i = $i + 1){
		print $fh <<"DONATE";
	$i_p [$data_width-1:0] data_in_A_unit$i,
	$i_p [$data_width-1:0] data_in_B_unit$i,
DONATE
	}
}
else{
	for($i=1; $i<= $ARGV[4]; $i = $i + 1){
		print $fh <<"DONATE";
	$i_p [$data_width-1:0] data_in_A_unit$i,
DONATE
	}
}

for($i=1; $i< $ARGV[4]; $i = $i + 1){
	print $fh <<"DONATE";
	$o_p [$data_width-1:0] data_out_$i,
DONATE
}

	print $fh <<"DONATE";
	$o_p [$data_width-1:0] data_out_$i
	);
DONATE

if($ARGV[3] == 2){
	for($i=1; $i<= $ARGV[4]; $i = $i + 1){
		print $fh <<"DONATE";
	$pool_unit_name #(.$data_width($data_width), 
	.$ifm_size($ifm_size), 
	.ARITH_TYPE(ARITH_TYPE),
	.$kernal_size($kernal_size))
    unit$i(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit$i),
	.unit_data_in_2(data_in_B_unit$i),
    .unit_data_out(data_out_$i)
    );
	
DONATE
	}
}
else{
	for($i=1; $i<= $ARGV[4]; $i = $i + 1){
	print $fh <<"DONATE";
	$pool_unit_name #(.$data_width($data_width), 
	.$ifm_size($ifm_size), 
	.$ifm_depth($ifm_depth), 
	.ARITH_TYPE(ARITH_TYPE),
	.$kernal_size($kernal_size))
    unit$i(
    .clk(clk),
	.reset(reset),
	.fifo_enable(fifo_enable),
	.pool_enable(pool_enable),
	.unit_data_in(data_in_A_unit$i),
    .unit_data_out(data_out_$i)
    );
	
DONATE
	}
}

	print $fh <<"DONATE";
endmodule
	
DONATE

