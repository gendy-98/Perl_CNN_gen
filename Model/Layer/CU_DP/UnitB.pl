use strict;
use warnings;
use diagnostics;
use POSIX;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] DATA_WIDTH 32
#ARGV[1] IFM_DEPTH 3
#ARGV[2] KERNAL_SIZE 5
#ARGV[3] NUMBER_OF_FILTERS 6
#ARGV[4] NUMBER_OF_UNITS 3
#ARGV[5] ARITH_TYPE 0
#ARGV[6] stride
#$ARGV[7]
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
my $full_path = "../../../$ARGV[7]/";
#######################################################################################
my $i = 0;
my $j = 0;
my $jj = 0;
my $file_name;
my $module_name;
my $adder_name;
my $div_name;
my $odd_flag;
my $dummy_level;
my @levels;
my $levels_number;
my $divided_by;
my $arith_type = "ARITH_TYPE";


  
$module_name = "unitB";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
  my $ceil_NUMBER_OF_FILTERS_over_NUMBER_OF_UNITS = ceil($ARGV[3]/$ARGV[4]);
  
  
 print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$arith_type             = $ARGV[5],
	$data_width 			= $ARGV[0],
	/////////////////////////////////////  
	$ifm_depth              = $ARGV[1],
	$kernal_size            = $ARGV[2],
	$number_of_filters		= $ARGV[3],
	$number_of_units 		= $ARGV[4],
	//////////////////////////////////////
	
	CEIL_FILTERS            = \$rtoi(\$ceil(NUMBER_OF_FILTERS*1.0/NUMBER_OF_UNITS)),
    ADDRESS_SIZE_WM         = $clog2(KERNAL_SIZE*KERNAL_SIZE*IFM_DEPTH*CEIL_FILTERS)
	)
	(
	$i_p 							clk,
	$i_p 							reset,
	
	$i_p 	[$data_width-1:0]		riscv_data,
	$i_p 	[$data_width-1:0]		data_bias,
	$i_p 	[$data_width-1:0]		data_in_from_next,
	
	$i_p 							conv_enable,
	$i_p 							accu_enable,
	$i_p 							relu_enable,
	
	$i_p 							wm_enable_read,
	$i_p 							wm_enable_write,
	$i_p 							wm_fifo_enable,
	
	$i_p 	[ADDRESS_SIZE_WM-1:0]	wm_address,
	
DONATE


for($i = 1; $i <= ($ARGV[2]*$ARGV[2]); $i = $i + 1){
	print $fh "\t$i_p [$data_width-1:0]	signal_if$i,\n";
}

 print $fh <<"DONATE";

	output	[DATA_WIDTH-1:0]		unit_data_out
    );
////////////////////////Signal declaration/////////////////
    wire [DATA_WIDTH-1:0] wm_data_out;   
    

DONATE


for($i = 1; $i <= ($ARGV[2]*$ARGV[2]); $i = $i + 1){
	print $fh "\twire [$data_width-1:0]	signal_w$i;\n";
}

 print $fh <<"DONATE";
	wire [$data_width-1:0] conv_data_out;
	wire [$data_width-1:0] accu_data_out;
	wire [$data_width-1:0] relu_data_out;

single_port_memory #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE ($kernal_size * $kernal_size * IFM_DEPTH * CEIL_FILTERS)) 
	WM 
	(
	 .clk(clk),	
	 .Enable_Write(wm_enable_write), 
	 .Enable_Read(wm_enable_read), 
	 .Address(wm_address), 
	 .Data_Input(riscv_data),	
	 .Data_Output(wm_data_out)
	 );    
    

DONATE



chdir "./Modules";
system("perl fc_fifo.pl  ${\($ARGV[2]*$ARGV[2])} $ARGV[0] $ARGV[7]");


my $fifo_name = "fo_fifo_${\($ARGV[2]*$ARGV[2])}";

 print $fh <<"DONATE";

$fifo_name #(.$data_width($data_width))
	WM_FIFO (
	 .clk(clk),
	 .reset(reset),
	 .fifo_enable(wm_fifo_enable),
	 .fifo_data_in(wm_data_out),
DONATE


for($i = 1; $i < ($ARGV[2]*$ARGV[2]); $i = $i + 1){
	print $fh "\t\t.fifo_data_out_$i(signal_w$i),\n";
}
print $fh "\t\t.fifo_data_out_$i(signal_w$i)\n\t\t);\n\n";


system("perl convolution.pl  ${\($ARGV[2]*$ARGV[2])} $ARGV[5] $ARGV[0] $ARGV[7]");

$fifo_name = "convolution_S${\($ARGV[2]*$ARGV[2])}";

 print $fh <<"DONATE";
$fifo_name #(.$data_width($data_width), .ARITH_TYPE(ARITH_TYPE))
	conv
	(
	 .clk(clk),
	 .reset(reset),
	 .conv_enable(conv_enable),
	 .conv_data_out(conv_data_out),
DONATE

for($i = 1; $i < ($ARGV[2]*$ARGV[2]); $i = $i + 1){
	print $fh "\t\t.w$i(signal_w$i),.if$i(signal_if$i),\n";
}
print $fh "\t\t.w$i(signal_w$i),.if$i(signal_if$i)\n";

 print $fh <<"DONATE";
);

DONATE

 print $fh <<"DONATE";
 accumulator #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))
 accu_B
 (
     .clk(clk),
     .accu_enable(accu_enable),
	 .data_in_from_conv(conv_data_out),
	 .data_bias(data_bias),
     .data_in_from_next(data_in_from_next),
     .accu_data_out(accu_data_out)
 );
 
 
relu #(.DATA_WIDTH(DATA_WIDTH)) Active1 (.in(accu_data_out), .out(relu_data_out), .relu_enable(relu_enable));
	
assign unit_data_out = relu_data_out;


$end_module
DONATE




