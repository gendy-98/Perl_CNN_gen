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
#ARGV[2] IFM_DEPTH 84
#ARGV[3] NUMBER_OF_WM 10
#ARGV[4] ADDRESS_BITS 16
#ARGV[5] ARITH_TYPE = 1
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


$module_name = "top_fc2_W$ARGV[3]"; #W for stride

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
    input start_from_previous,
    output end_to_previous,
    output bias_sel,
    output ifm_enable_write_next,
    
    ////////////////////////////////////////// for next  
DONATE


for($i = 1; $i <= $ARGV[2]; $i = $i + 1 ){

	print $fh <<"DONATE";
    input [DATA_WIDTH - 1 : 0] Data_in_$i ,
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
	output output_ready 
	);

    wire wm_addr_sel;
    wire enable_read_current;  
    wire [ADDRESS_SIZE_WM-1:0] wm_address_read_current;
    wire wm_enable_read;
    wire [ ADDRESS_SIZE_WM-1 :  0 ] sel_ifm;
    wire fc_output_ready;

DONATE


print $fh <<"DONATE";

	FC2_CU #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) 
    CU
    (
    .clk(clk),
    .reset(reset),
    //////////////////////////////////////////////
    .wm_addr_sel(wm_addr_sel),
    .wm_address_read_current(wm_address_read_current),  
    .wm_enable_read(wm_enable_read),
    .bias_sel(bias_sel),
    /////////////////////////////////////////
    .enable_read_current(enable_read_current),
    .start_from_previous(start_from_previous),
    .sel_ifm (sel_ifm),
    .end_to_previous (end_to_previous),
    .fc_output_ready (fc_output_ready) , 
    .enable_write_next (ifm_enable_write_next),   
    .output_ready (output_ready)
   );
DONATE


print $fh <<"DONATE";

	FC1_DP #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) 
    DP
	(
    .clk(clk),
	.reset(reset),	
	.riscv_data(riscv_data),
	.riscv_address(riscv_address),
	/////////////////////////////////
    .wm_addr_sel(wm_addr_sel),
    .wm_address_read_current(wm_address_read_current),  
    .wm_enable_read(wm_enable_read),
    .wm_enable_write(wm_enable_write),
    .bm_enable_write(bm_enable_write),
    ///////////////////////////////////
	.fc_output_ready (fc_output_ready),
    .enable_read_current(enable_read_current),
	
	/////////////////////////////////////
   
DONATE

for($i = 1; $i <= $ARGV[2]; $i = $i + 1 ){

	print $fh <<"DONATE";
    .Data_in_$i(Data_in_$i), 
DONATE

}

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
    .sel_ifm (sel_ifm)
	);
endmodule
DONATE







close $fh or die "Couldn't Close File : $!";