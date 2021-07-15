use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] no of the conv 2
#ARGV[1] Mul number 25
#ARGV[2] ARITH_TYPE 0
#ARGV[3] DATA_WIDTH 32
#ARGV[4] ADDRESS_BITS 15
#ARGV[5] IFM_SIZE  32
#ARGV[6] IFM_DEPTH 3
#ARGV[7] KERNAL_SIZE 5  
#ARGV[8] NUMBER_OF_FILTERS 6 filter_num
#ARGV[9] NUMBER_OF_UNITS  3  layer_units
#ARGV[10] STRIDE 1
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
my $number_of_filters = "NUMBER_OF_FILTERS";
my $number_of_units = "NUMBER_OF_UNITS";
my $full_path = "../../Verilog_files/";
#######################################################################################
my $i = 0;
my $j = 0;
my $jj = 0;
my $file_name;
my $module_name;
my $adder_name;
my $mul_name;
my $odd_flag;
my $dummy_level;
my @levels;
my $levels_number;

my $single_port_name = "single_port_memory";
my $unit_name = "unitA";
my $Relu_name = "relu";
my $cu_name;
my $dp_name;
my $accumulator_name = "accumulator"; 
$module_name = "top_convb$ARGV[0]";




$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
  print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	ARITH_TYPE				= $ARGV[2],
	$data_width 			  = $ARGV[3],
	$address_bits 		  = $ARGV[4],
	/////////////////////////////////////
	$ifm_size              = $ARGV[5],                                                
	$ifm_depth             = $ARGV[6],
	$kernal_size           = $ARGV[7],
	$number_of_filters     = $ARGV[8],
	$number_of_units       = $ARGV[9],
	//////////////////////////////////////
	IFM_SIZE_NEXT           = IFM_SIZE - KERNAL_SIZE + 1,
	ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
	ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT),
	ADDRESS_SIZE_WM         = $clog2( KERNAL_SIZE*KERNAL_SIZE*NUMBER_OF_FILTERS*(IFM_DEPTH/NUMBER_OF_UNITS+1) ),    
	NUMBER_OF_IFM           = IFM_DEPTH,
	NUMBER_OF_IFM_NEXT      = NUMBER_OF_FILTERS
)(
	$i_p 							clk,
	$i_p 							reset,
	
	input [DATA_WIDTH-1:0]  riscv_data,
	input [ADDRESS_BITS-1:0] riscv_address,
	input [NUMBER_OF_UNITS-1:0] wm_enable_write,
	input [$number_of_units-1:0] bm_enable_write,

	input start_from_previous,
	
DONATE



print $fh <<"DONATE";
	input  [DATA_WIDTH-1:0]       data_in_from_previous,
	output                        ifm_enable_read_current,
	output [ADDRESS_SIZE_IFM-1:0] ifm_address_read_current,
	output                        end_to_previous,
	
	input                        conv_ready, 
	input  end_from_next,
DONATE

for ($i = 1; $i <= $ARGV[9]; $i = $i + 1){
	print $fh <<"DONATE";
		input  [DATA_WIDTH-1:0] data_in_from_next$i,
DONATE
}	

for ($i = 1; $i <= $ARGV[9]; $i = $i + 1){
	print $fh <<"DONATE";
		input  [DATA_WIDTH-1:0] data_out_for_next$i,
DONATE
}	
	
print $fh <<"DONATE";
	output ifm_enable_read_next,
	output ifm_enable_write_next,
    output [ADDRESS_SIZE_NEXT_IFM-1:0] ifm_address_read_next,
    output [ADDRESS_SIZE_NEXT_IFM-1:0] ifm_address_write_next,
	output start_to_next,
	
	output [$clog2(NUMBER_OF_IFM/NUMBER_OF_UNITS+1)-1:0] ifm_sel_next
    );
	
	wire fifo_enable;
    wire conv_enable;
    wire accu_enable;
    wire relu_enable;
    
    
    wire wm_addr_sel;
    wire wm_enable_read;
    wire [ADDRESS_SIZE_WM-1:0] wm_address_read_current;
    wire wm_fifo_enable;
    
    wire bm_addr_sel;
    wire bm_enable_read;
    wire [$clog2(NUMBER_OF_FILTERS)-1:0] bm_address_read_current ;
    
    
	
DONATE
chdir "./CU_DP";
system("perl CU_gen_B.pl $ARGV[0] $ARGV[1] $ARGV[5] $ARGV[6] $ARGV[7] $ARGV[8] $ARGV[9]");

$cu_name = "convb$ARGV[0]_CU";
print $fh <<"DONATE";

	$cu_name #(.IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE), .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS))
    CU_B$ARGV[0]
    (
    .clk(clk),
    .reset(reset),
    .end_from_next(end_from_next),
    .start_from_previous(start_from_previous),
    .end_to_previous(end_to_previous),
    .conv_ready(conv_ready),
    
    .ifm_sel_next(ifm_sel_next),
    .ifm_enable_read_current(ifm_enable_read_current),
    .ifm_address_read_current(ifm_address_read_current),
    
    .wm_addr_sel(wm_addr_sel),
    .wm_enable_read(wm_enable_read),
    .wm_address_read_current(wm_address_read_current),
    .wm_fifo_enable(wm_fifo_enable),
    
    .bm_addr_sel(bm_addr_sel),                                            
    .bm_enable_read(bm_enable_read),                                         
    .bm_address_read_current(bm_address_read_current),
    
    .fifo_enable(fifo_enable),
    .conv_enable(conv_enable),
    .accu_enable(accu_enable),
    .relu_enable(relu_enable),
    .ifm_enable_read_next(ifm_enable_read_next),
    .ifm_enable_write_next(ifm_enable_write_next),
    .ifm_address_read_next(ifm_address_read_next), 
    .ifm_address_write_next(ifm_address_write_next),
    .start_to_next(start_to_next)
    );    
     
DONATE


system("perl DP_gen_B.pl $ARGV[0] $ARGV[2] $ARGV[3] $ARGV[4] $ARGV[5] $ARGV[6] $ARGV[7] $ARGV[8] $ARGV[9] $ARGV[10] ");

$dp_name = "convb$ARGV[0]_DP";
print $fh <<"DONATE";

	$dp_name #(.ARITH_TYPE(ARITH_TYPE), .DATA_WIDTH(DATA_WIDTH), .ADDRESS_BITS(ADDRESS_BITS), .IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE), .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS), .NUMBER_OF_UNITS(NUMBER_OF_UNITS))
    DP_B$ARGV[0]
	(
    .clk(clk),
	.reset(reset),
	.riscv_data(riscv_data),
	.riscv_address(riscv_address),
	//////////////////////////////////////////////
	.data_in_from_previous(data_in_from_previous),
	.fifo_enable(fifo_enable),
	.conv_enable(conv_enable),
    .accu_enable(accu_enable),
    .relu_enable(relu_enable),
	
DONATE
for ($i = 1; $i <= $ARGV[9]; $i = $i + 1){
	print $fh <<"DONATE";
	.data_in_from_next$i(data_in_from_next$i),
	.data_out_for_next$i(data_out_for_next$i),
DONATE
}

print $fh <<"DONATE";

	
    .wm_addr_sel(wm_addr_sel),
    .wm_enable_read(wm_enable_read),
    .wm_enable_write(wm_enable_write),
    .wm_address_read_current(wm_address_read_current),
    .wm_fifo_enable(wm_fifo_enable),
    
    .bm_addr_sel(bm_addr_sel),                                            
    .bm_enable_read(bm_enable_read),
    .bm_enable_write(bm_enable_write),
    .bm_address_read_current(bm_address_read_current)
	//////////////////////////////////////////////

    );
	
	
endmodule	
DONATE


close $fh or die "Couldn't Close File : $!";
