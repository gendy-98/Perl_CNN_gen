use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] DATA_WIDTH
#ARGV[1] ADDRESS_BITS
#ARGV[2] IFM_SIZE
#ARGV[3] IFM_DEPTH
#ARGV[4] KERNAL_SIZE
#ARGV[5] NUMBER_OF_FILTERS 
#ARGV[6] NUMBER_OF_UNITS
#ARGV[7] Stride

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
my $adder_name;
my $div_name;
my $odd_flag;
my $dummy_level;
my @levels;
my $levels_number;
my $divided_by;

 
$module_name = "unitA";
my $single_port_name = "single_port_memory";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
 print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 			  = $ARGV[0],
	$address_bits			= $ARGV[1],
	/////////////////////////////////////
	$ifm_size              = $ARGV[2],                                                
	$ifm_depth             = $ARGV[3],
	$kernal_size           = $ARGV[4],
	$number_of_filters		= $ARGV[5],
	$number_of_units 		= $ARGV[6],
	//////////////////////////////////////
	NUMBER_OF_IFM           = IFM_DEPTH,
	IFM_SIZE_NEXT           = IFM_SIZE - KERNAL_SIZE + 1,
	ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
	ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT),
	FIFO_SIZE               = (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE)
	(
	$i_p 							clk,
	$i_p 							reset,
	
	$i_p 	[$data_width-1:0]		riscv_data,
	$i_p 	[$data_width-1:0]		unit_data_in,
	
	$i_p 							fifo_enable,
	$i_p 							conv_enable,
	
	$i_p 							wm_enable_read,
	$i_p 							wm_enable_write,
	$i_p 							wm_fifo_enable,
	
	$i_p 	[$address_bits-1:0]		wm_address,
	$o_p 	[$data_width-1:0]		unit_data_out
	);
////////////////////////Signal declaration/////////////////
	wire [$data_width-1:0] wm_data_out;
	
DONATE


for($i = 1; $i <= ($ARGV[4]*$ARGV[4]); $i = $i + 1){
	print $fh "\twire [$data_width-1:0]	signal_if$i,\tsignal_w$i;\n";
}


 print $fh <<"DONATE";

$single_port_name #(.MEM_SIZE ($kernal_size * $kernal_size * $number_of_filters * ($ifm_depth/$number_of_units+1))) 
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
system("perl fifo.pl  $ARGV[7] $ARGV[0] $ARGV[1] $ARGV[4] $ARGV[3] $ARGV[4] $ARGV[5]");

my $num_outputs = $ARGV[4]*$ARGV[4];
my $fifo_regs = (($ARGV[4] - 1)*$ARGV[4] + $ARGV[4]);
my $fifo_name = "FIFO_$num_outputs$under_Score$ARGV[7]$under_Score$fifo_regs";

 print $fh <<"DONATE";

$fifo_name #(.$data_width($data_width), .$kernal_size($kernal_size))
	WM_FIFO (
	 .clk(clk),
	 .reset(reset),
	 .fifo_enable(wm_fifo_enable),
	 .fifo_data_in(wm_data_out),
DONATE

for($i = 1; $i < ($ARGV[4]*$ARGV[4]); $i = $i + 1){
	print $fh "\t\t.fifo_data_out_$i(signal_w$i),\n";
}
print $fh "\t\t.fifo_data_out_$i(signal_w$i)\n";


system("perl fifo.pl  $ARGV[7] $ARGV[0] $ARGV[1] $ARGV[2] $ARGV[3] $ARGV[4] $ARGV[5]");

$num_outputs = $ARGV[4]*$ARGV[4];
$fifo_regs = (($ARGV[4] - 1)*$ARGV[2] + $ARGV[4]);
$fifo_name = "FIFO_$num_outputs$under_Score$ARGV[7]$under_Score$fifo_regs";


 print $fh <<"DONATE";
);
$fifo_name #(.$data_width($data_width), .$kernal_size($kernal_size))
	FIFO1 (
	 .clk(clk),
	 .reset(reset),
	 .fifo_enable(fifo_enable),
	 .fifo_data_in(unit_data_in),	
DONATE

for($i = 1; $i < ($ARGV[4]*$ARGV[4]); $i = $i + 1){
	print $fh "\t\t.fifo_data_out_$i(signal_if$i),\n";
}
print $fh "\t\t.fifo_data_out_$i(signal_if$i)\n";



 print $fh <<"DONATE";
);
convolution #(.$data_width($data_width), .IFM_SIZE(IFM_SIZE), .IFM_DEPTH(IFM_DEPTH), .KERNAL_SIZE(KERNAL_SIZE), .NUMBER_OF_FILTERS(NUMBER_OF_FILTERS))
	conv
	(
	 .clk(clk),
	 .reset(reset),
	 .conv_enable(conv_enable),
	 .conv_data_out(conv_data_out),
DONATE

for($i = 1; $i < ($ARGV[4]*$ARGV[4]); $i = $i + 1){
	print $fh "\t\t.w$i(signal_w$i),.if$i(signal_if$i),\n";
}
print $fh "\t\t.w$i(signal_w$i),.if$i(signal_if$i)\n";


 print $fh <<"DONATE";
);


$end_module
DONATE

















