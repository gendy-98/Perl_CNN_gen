use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

use POSIX; # for ceil and floor 

#argumets 
#ARGV[0] DATA_WIDTH 
#ARGV[1] ARITH_TYPE
#ARGV[2] Reg_Accmulator units
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
my $ceil = "\$ceil";
my $data_width = "DATA_WIDTH";
my $address_bits = "ADDRESS_BITS";
my $ifm_size = "IFM_SIZE";
my $ifm_depth = "IFM_DEPTH";
my $kernal_size = "KERNAL_SIZE";
my $num_filters = "NUMBER_OF_FILTERS";
my $full_path = "../../Verilog_files/";
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
my $units;

my $dual_port_name = "true_dual_port_memory";

if($ARGV[0] == 1){
	$IFM_number = 2;
	$units = 1;
}
else{
	$IFM_number = $ARGV[5];
	$units = $ARGV[1];
}

$module_name = "reg_acc_$ARGV[2]";
#U for units and D for IFM Depth S IFM SIZE



$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 					= $ARGV[0],
	ARITH_TYPE 						= $ARGV[1]

	$i_p clk,
	input reset,
	input bias_sel,
	input enable_write,

DONATE

for($i = 1;$i <= $ARGV[2]; $i = $i + 1){
	print $fh <<"DONATE";
	input [DATA_WIDTH - 1 : 0] Data_in_$i,
DONATE
}

for($i = 1;$i <= $ARGV[2]; $i = $i + 1){
	print $fh <<"DONATE";
	input [DATA_WIDTH - 1 : 0] data_bias_$i,
DONATE
}

for($i = 1;$i <= $ARGV[2]; $i = $i + 1){
	print $fh <<"DONATE";
	input [DATA_WIDTH - 1 : 0] Data_out_FC_$i,
DONATE
}
print $fh <<"DONATE";
	input [DATA_WIDTH - 1 : 0] Data_out_FC_$i
);
DONATE

for($i = 1;$i <= $ARGV[2]; $i = $i + 1){
	print $fh <<"DONATE";
    Reg_Accmulator #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) R_ACC$i (.clk(clk),.reset(reset),.data_in_from_previous( Data_in_$i),.data_bias(data_bias_$i),.bias_sel(bias_sel),.Enable(enable_write | bias_sel),.reg_accu_data_out( Data_out_FC_$i));
DONATE
}

print $fh "$end_module";

close $fh or die "Couldn't Close File : $!";
