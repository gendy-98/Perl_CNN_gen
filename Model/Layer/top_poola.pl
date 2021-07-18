use strict;
use warnings;
use diagnostics;
use POSIX;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

use POSIX; # for ceil and floor 

#argumets 
#ARGV[0] DATA_WIDTH 32
#ARGV[1] IFM_SIZE 28
#ARGV[2] IFM_DEPTH 3
#ARGV[3] KERNAL_SIZE 2
#ARGV[4] NO._OF_UNITS 1
#ARGV[5] STRIDE 2
#ARGV[6] ARITH_TYPE
#ARGV[7]



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
my $ceil = "\$ceil";
my $data_width = "DATA_WIDTH";
my $address_bits = "ADDRESS_BITS";
my $ifm_size = "IFM_SIZE";
my $ifm_depth = "IFM_DEPTH";
my $kernal_size = "KERNAL_SIZE";
my $num_filters = "NUMBER_OF_FILTERS";
my $full_path = "../../$ARGV[7]/";
#######################################################################################
my $i = 0;
my $j = 0;
my $k = 0;
my $h = 0;
my $l = 0;
my $m = 0;
my $file_name;
my $module_name;
my $IFM_number;

chdir "./CU_DP";

system("perl Poola_CU_Gen.pl  $ARGV[1] $ARGV[3] $ARGV[5] $ARGV[7]");





system("perl Poola_DP_Gen.pl  $ARGV[0] $ARGV[1] $ARGV[2] $ARGV[3] $ARGV[4] $ARGV[5] $ARGV[6] $ARGV[7]");

chdir "..";

$module_name = "top_poola_S$ARGV[5]_K$ARGV[3]"; #S for stride K kernal size


$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 					= $ARGV[0],
///////////architecture parameters//////
	$ifm_size              = $ARGV[1],
	$ifm_depth				= $ARGV[2],
    ARITH_TYPE 				= $ARGV[6],
	$kernal_size			= $ARGV[3],
	//////////////////////////////////////
	IFM_SIZE_NEXT           = (IFM_SIZE - KERNAL_SIZE)/2 + 1,
    ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
    ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT)
	)(
	$i_p clk,
	$i_p reset,
	$i_p start_from_previous,           
DONATE

if($ARGV[5] == 2){

	print $fh <<"DONATE";
	input [DATA_WIDTH-1:0] data_in_A,
	input [DATA_WIDTH-1:0] data_in_B,
DONATE

}
else{

	print $fh <<"DONATE";
	input [DATA_WIDTH-1:0] data_in_A,
DONATE

}

if($ARGV[5] == 2){

	print $fh <<"DONATE";
	output                        ifm_enable_read_A_current,
    output                        ifm_enable_read_B_current,
	output [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_current,
	output [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_current,
DONATE

}
else{

	print $fh <<"DONATE";
	output                        ifm_enable_read_A_current,
	output [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_current,
DONATE

}

print $fh <<"DONATE";
	output end_to_previous,
     
    input  end_from_next,
    output                             ifm_enable_write_next,     
    output [ADDRESS_SIZE_NEXT_IFM-1:0] ifm_address_write_next,
	output [DATA_WIDTH-1 : 0]          data_out,
	output 					 		   start_to_next,
	output 							   ifm_sel_next
	);
   
   wire fifo_enable;
   wire pool_enable;
   
DONATE


if($ARGV[5] == 2){
	print $fh <<"DONATE";
	poola_cu_S$ARGV[5] #(.IFM_SIZE(IFM_SIZE), .KERNAL_SIZE(KERNAL_SIZE))
    CU
    (
    .clk(clk),
    .reset(reset),
    .start_from_previous(start_from_previous),
    .end_from_next(end_from_next),
    .end_to_previous(end_to_previous),
    .ifm_enable_read_A_current(ifm_enable_read_A_current), 
    .ifm_enable_read_B_current(ifm_enable_read_B_current), 
    .ifm_address_read_A_current(ifm_address_read_A_current),
    .ifm_address_read_B_current(ifm_address_read_B_current),
    .fifo_enable (fifo_enable),
    .pool_enable (pool_enable),
    .ifm_enable_write_next(ifm_enable_write_next),
    .ifm_address_write_next (ifm_address_write_next),
    .start_to_next(start_to_next),
    .ifm_sel_next (ifm_sel_next)
   );
DONATE

}
else{
	print $fh <<"DONATE";
	poola_cu_S$ARGV[5] #(.IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE))
    CU
    (
    .clk(clk),
    .reset(reset),
    .start_from_previous(start_from_previous),
    .end_from_next(end_from_next),
    .end_to_previous(end_to_previous),
    .ifm_enable_read_A_current(ifm_enable_read_A_current), 
    .ifm_address_read_A_current(ifm_address_read_A_current),
    .fifo_enable (fifo_enable),
    .pool_enable (pool_enable),
    .ifm_enable_write_next(ifm_enable_write_next),
    .ifm_address_write_next (ifm_address_write_next),
    .start_to_next(start_to_next),
    .ifm_sel_next (ifm_sel_next)
   );
DONATE
}

print $fh <<"DONATE";
    poola_dp_S$ARGV[5] #(.DATA_WIDTH(DATA_WIDTH), 
    .IFM_SIZE(IFM_SIZE), 
    .ARITH_TYPE(ARITH_TYPE),
    .IFM_DEPTH(IFM_DEPTH), 
    .KERNAL_SIZE(KERNAL_SIZE))
    DP
	(
	.clk(clk),
	.reset(reset),
	
	.fifo_enable (fifo_enable),
	.pool_enable (pool_enable),
	
DONATE



	if($ARGV[5] == 2){
	print $fh <<"DONATE";
	.data_in_A(data_in_A),
	.data_in_B(data_in_B),
DONATE
}
else{
	print $fh <<"DONATE";
	.data_in_A(data_in_A),
DONATE
}



print $fh <<"DONATE";
	.data_out (data_out)
	);
	
endmodule
DONATE







close $fh or die "Couldn't Close File : $!";
