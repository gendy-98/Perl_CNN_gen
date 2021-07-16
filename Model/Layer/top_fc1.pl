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
#ARGV[1] IFM_SIZE //
#ARGV[2] IFM_DEPTH 3//
#ARGV[3] NUMBER_OF_WM 84
#ARGV[4] ADDRESS_BITS 16//
#ARGV[5] ARITH_TYPE = 1
#ARGV[6] FC_number 1
#ARGV[7] Is it the last FC? (1 Yes/0 No) 0
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
my $FC_number = $ARGV[6];

$module_name = "top_fcA_$ARGV[6]"; #ARGV[6] is the fc number

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
	//////////////////////////////////////
    ADDRESS_BITS        = $ARGV[4],
    ARITH_TYPE          = $ARGV[5],
    ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
    ADDRESS_SIZE_WM        = $clog2(IFM_DEPTH),
    NUMBER_OF_WM        = $ARGV[3]

	)(
	input clk,
	input reset,
    /////////////////////////////////////////////////////
    input [DATA_WIDTH-1:0]   riscv_data,
	input [ADDRESS_BITS-1:0] riscv_address,
	/////////////////////////////////////////////////////
	input [NUMBER_OF_WM-1:0] wm_enable_write,
	input  bm_enable_write,
    /////////////////////////////////////////////////////	 
    input [DATA_WIDTH-1:0] data_in_from_previous,	 
	input  start_from_previous,  
    output end_to_previous,
    output enable_read_current,
    output enable_write_next,

    output bias_sel,
    
    ////////////////////////////////////////// for next  
DONATE

if($ARGV[7] == 0){

	print $fh <<"DONATE";
    output start_to_next,
DONATE

}
else{
	
	print $fh <<"DONATE";
    output output_ready,
DONATE
	
}

for($i = 1; $i <= $ARGV[3]; $i = $i + 1 ){

	print $fh <<"DONATE";
    output [DATA_WIDTH-1:0]   reg_out_FC_$i ,
DONATE

}


for($i = 1; $i <= $ARGV[3]; $i = $i + 1 ){

	print $fh <<"DONATE";
    output [DATA_WIDTH-1:0]   data_bias_$i ,
DONATE

}
print $fh <<"DONATE";
	input  end_from_next
	);

    wire wm_enable_read;
    wire wm_addr_sel;
    wire [ADDRESS_SIZE_WM-1:0] wm_address_read_current;  
    
    wire fc_output_ready;

DONATE


chdir "./CU_DP";
system("perl FC1_CU_gen.pl $ARGV[0]  $ARGV[2] $ARGV[6] $ARGV[7]");
my $unit_name = "FCA${\($ARGV[6])}_CU";
print $fh <<"DONATE";

	$unit_name #(
    .$ifm_depth($ifm_depth)) 
    CU
    (
    .clk(clk),
    .reset(reset),
	.start_from_previous(start_from_previous), 
	.end_from_next(end_from_next),
	.wm_addr_sel(wm_addr_sel),
    .wm_enable_read (wm_enable_read),
    .wm_address_read_current(wm_address_read_current), 
	.enable_read_current(enable_read_current),
    .end_to_previous (end_to_previous),    
    .enable_write_next (enable_write_next),
    .fc_output_ready (fc_output_ready),
    .bias_sel(bias_sel),
DONATE

if($ARGV[7] == 0){

	print $fh <<"DONATE";
    .start_to_next (start_to_next)  
   );
DONATE

}
else{
	
	print $fh <<"DONATE";
	.output_ready (output_ready)  
   );
DONATE
	
}

system("perl FC1_DP_gen.pl $ARGV[5]  $ARGV[0] $ARGV[4] $ARGV[2] $ARGV[3] $ARGV[6]");
$unit_name = "FCA${\($ARGV[6])}_DP";

print $fh <<"DONATE";

	$unit_name #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE),
    .$ifm_depth($ifm_depth), .NUMBER_OF_WM(NUMBER_OF_WM)) 
    DP
	(
    .clk(clk),
	.reset(reset),	
	.riscv_data(riscv_data),
	.riscv_address(riscv_address),
	/////////////////////////////////
    .wm_addr_sel (wm_addr_sel) , 
    .wm_enable_read (wm_enable_read),
    .wm_enable_write (wm_enable_write),
    .wm_address_read_current (wm_address_read_current),
    ///////////////////////////////////
    .bm_enable_write (bm_enable_write),
    ///////////////////////////////////
	.data_in_from_previous(data_in_from_previous),
	
	/////////////////////////////////////
   
DONATE


for($i = 1; $i <= $ARGV[3]; $i = $i + 1 ){

	print $fh <<"DONATE";
    .reg_out_FC_$i(reg_out_FC_$i) , 
DONATE

}


for($i = 1; $i <= $ARGV[3]; $i = $i + 1 ){

	print $fh <<"DONATE";
    .data_bias_$i  (data_bias_$i ),
DONATE
}

print $fh <<"DONATE";
    .fc_output_ready (fc_output_ready)
	);
endmodule
DONATE







close $fh or die "Couldn't Close File : $!";
