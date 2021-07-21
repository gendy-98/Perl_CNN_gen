use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

use POSIX;
#argumets 
#ARGV[0] no of the conv 
#ARGV[1] Mul number
#ARGV[2] ARITH_TYPE
#ARGV[3] DATA_WIDTH
#ARGV[4] ADDRESS_BITS
#ARGV[5] IFM_SIZE  
#ARGV[6] IFM_DEPTH 
#ARGV[7] KERNAL_SIZE  
#ARGV[8] NUMBER_OF_FILTERS
#ARGV[9] RGB
#ARGV[10]stride
#ARGV[11] $relative_path
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
my $full_path = "../../$ARGV[11]/";
#######################################################################################
my $i = 0;
my $j = 0;
my $jj = 0;
my $file_name;
my $module_name;
my $adder_name = "adder";
my $mul_name = "multiplier";
my $odd_flag;
my $dummy_level;
my @levels;
my $levels_number;
my $dual_port_name = "true_dual_port_memory";
my $single_port_name = "single_port_memory";
my $unit_name = "unitA";
my $Relu_name = "relu";
my $cu_name;
my $dp_name;
my $accumulator_name = "accumulator"; 
$module_name = "top_conva$ARGV[0]";


 
if($ARGV[9] == 1){
	$cu_name = 3;
}
else{	
	$cu_name = 1;
}


$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
  print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 			  = $ARGV[3],
	$address_bits 		  = $ARGV[4],
	/////////////////////////////////////
	$ifm_size              = $ARGV[5],                                                
	$ifm_depth             = $ARGV[6],
	$kernal_size           = $ARGV[7],
	$number_of_filters     = $ARGV[8],
	$number_of_units       = $cu_name,
	ARITH_TYPE 				= $ARGV[2],
	//////////////////////////////////////
	IFM_SIZE_NEXT           = IFM_SIZE - KERNAL_SIZE + 1,
	ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
	ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT),
	ADDRESS_SIZE_WM         = $clog2( KERNAL_SIZE*KERNAL_SIZE*NUMBER_OF_FILTERS*(${\(ceil($ARGV[6]/$cu_name))}) ),    
	FIFO_SIZE               = (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE,
	NUMBER_OF_IFM           = IFM_DEPTH,
	NUMBER_OF_IFM_NEXT      = NUMBER_OF_FILTERS,
	NUMBER_OF_WM            = KERNAL_SIZE*KERNAL_SIZE,                              
	NUMBER_OF_BITS_SEL_IFM_NEXT = $clog2(NUMBER_OF_IFM_NEXT)
)(
	input clk,
	input reset,
	input [DATA_WIDTH-1:0]   riscv_data,
	input [ADDRESS_BITS-1:0] riscv_address,
	input [NUMBER_OF_UNITS-1:0] wm_enable_write,
	input  bm_enable_write,
	
	// previous
    input                        start_from_previous,
	input [NUMBER_OF_IFM-1:0]    ifm_enable_write_previous, 
	     
	// next
	input  end_from_next,
	output [DATA_WIDTH-1:0] data_out_for_next1,
	output [ADDRESS_SIZE_NEXT_IFM-1:0] ifm_address_write_next,
	output ifm_enable_write_next,
	output start_to_next,
	output ifm_sel_next,
	output ready
    );
	
DONATE



print $fh <<"DONATE";
	wire fifo_enable;
    wire conv_enable;
	
	wire                        ifm_enable_read_current;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_current;
   
    wire wm_addr_sel;
    wire wm_enable_read;
    wire [ADDRESS_SIZE_WM-1:0] wm_address_read_current;
    wire wm_fifo_enable;
    
    wire bm_addr_sel;
    wire bm_enable_read;
    wire [$clog2(NUMBER_OF_FILTERS)-1:0] bm_address_read_current ;
    
    
	
DONATE

chdir "./CU_DP";
system("perl CU_gen_First.pl $ARGV[0] $ARGV[1] $ARGV[3] $ARGV[4] $ARGV[5] $ARGV[6] $ARGV[7] $ARGV[8] $ARGV[9] $ARGV[11]");

$cu_name = "conva$ARGV[0]_CU";
print $fh <<"DONATE";

	$cu_name #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.IFM_DEPTH(IFM_DEPTH), 
	.KERNAL_SIZE(KERNAL_SIZE), 
	.NUMBER_OF_FILTERS(NUMBER_OF_FILTERS), 
	.NUMBER_OF_UNITS(NUMBER_OF_UNITS))
    CU_A$ARGV[0]
    (
    .clk(clk),
    .reset(reset),
    .end_from_next(end_from_next),
    .start_from_previous(start_from_previous),
    
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
    .ifm_enable_write_next(ifm_enable_write_next),
    .ifm_address_write_next(ifm_address_write_next),
    .start_to_next(start_to_next),
    .ifm_sel_next(ifm_sel_next),
    .ready(ready)
    );    
     

DONATE


system("perl DP_gen_First.pl $ARGV[0] $ARGV[1] $ARGV[2] $ARGV[3] $ARGV[4] $ARGV[5] $ARGV[6] $ARGV[7] $ARGV[8] $ARGV[9] $ARGV[10] $ARGV[11]");

$dp_name = "conva$ARGV[0]_DP";
print $fh <<"DONATE";

	$dp_name #(.DATA_WIDTH(DATA_WIDTH), 
	.IFM_SIZE(IFM_SIZE), 
	.IFM_DEPTH(IFM_DEPTH), 
	.KERNAL_SIZE(KERNAL_SIZE), 
	.ARITH_TYPE(ARITH_TYPE),
	.NUMBER_OF_FILTERS(NUMBER_OF_FILTERS), 
	.NUMBER_OF_UNITS(NUMBER_OF_UNITS))
    DP_A1
    (
    .clk(clk),
	.reset(reset),
	.riscv_data(riscv_data),
	.riscv_address(riscv_address),
	//////////////////////////////////////////////
	.fifo_enable(fifo_enable),
	.conv_enable(conv_enable),

    .ifm_enable_read_current(ifm_enable_read_current),
	.ifm_enable_write_previous(ifm_enable_write_previous),
	.ifm_address_read_current(ifm_address_read_current),
    
    .wm_addr_sel(wm_addr_sel),
    .wm_enable_write(wm_enable_write),
    .wm_enable_read(wm_enable_read),
    .wm_address_read_current(wm_address_read_current),
    .wm_fifo_enable(wm_fifo_enable),

    .bm_addr_sel(bm_addr_sel),                                            
    .bm_enable_read(bm_enable_read),                                         
    .bm_enable_write(bm_enable_write),
    .bm_address_read_current(bm_address_read_current),

	.data_out_for_next(data_out_for_next1)
    );
  
      
endmodule
DONATE

close $fh or die "Couldn't Close File : $!";
