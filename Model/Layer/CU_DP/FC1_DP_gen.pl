use strict;
use warnings;
use diagnostics;
use POSIX;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";
use POSIX;
#argumets 
#ARGV[0] ARITH_TYPE 1
#ARGV[1] DATA_WIDTH 32
#ARGV[2] ADDRESS_BITS 15
#ARGV[3] IFM_DEPTH 120
#ARGV[4] NUMBER_OF_WM 84
#ARGV[5] FC_number 1
######################################### CONSTANTS ###################################
my $module = <<"DONATE";
`timescale 1ns / 1ps


module 
DONATE

my $FC_number = $ARGV[5];
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
my $mem_size = "MEM_SIZE";
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

$module_name = "FCA${\($FC_number)}_DP";


$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
my $delay_cycles;
  
my $signal_bits = 1;

if($ARGV[5] == 0){
$delay_cycles = 2;
}
else{
$delay_cycles = 3;
}

#chdir "./Modules";
#system("perl delay.pl $delay_cycles $signal_bits");

#system("perl delay.pl 2 1");

#my $delay_name = "delay_$delay_cycles$under_Score$signal_bits";
  

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	ARITH_TYPE             = $ARGV[0],  
	$data_width            = $ARGV[1],
	ADDRESS_BITS           = $ARGV[2],
	IFM_DEPTH              = $ARGV[3],
	ADDRESS_SIZE_WM  = $clog2(IFM_DEPTH),
	NUMBER_OF_WM           = $ARGV[4]
)(
	input clk,
	input reset,
	/////////////////////////////////////////////////////
	input    [DATA_WIDTH-1:0] riscv_data,
	input    [ADDRESS_BITS-1:0] riscv_address,
	/////////////////////////////////////////////////////
    input    wm_addr_sel,
    input    wm_enable_read,
    input    [NUMBER_OF_WM - 1:0]    wm_enable_write,
	input    [ADDRESS_SIZE_WM-1:0]   wm_address_read_current,
    /////////////////////////////////////////////////////
    input bm_enable_write,
	 /////////////////////////////////////////////////////
	input fc_output_ready,
	input [DATA_WIDTH-1:0] data_in_from_previous,
	 /////////////////////////////////////////////////////
DONATE
  
  for($i=1; $i<=$ARGV[4]; $i = $i + 1){
	print $fh <<"DONATE";
	output reg  [DATA_WIDTH-1:0] reg_out_FC_$i,
DONATE
  }
  
    for($i=1; $i<$ARGV[4]; $i = $i + 1){
	print $fh <<"DONATE";
	output      [DATA_WIDTH-1:0] data_bias_$i   ,
DONATE
  }
  
  print $fh <<"DONATE";
	output      [DATA_WIDTH-1:0] data_bias_$i
	);
	
DONATE
  
  for($i=1; $i<=$ARGV[4]; $i = $i + 1){
	print $fh <<"DONATE";
	wire [DATA_WIDTH-1:0] s_Data_out_FC_$i; 
DONATE
  }
  
  for($i=1; $i<=$ARGV[4]; $i = $i + 1){
	print $fh <<"DONATE";
	wire [DATA_WIDTH-1:0] Data_Weight_$i;
DONATE
  }
  
  print $fh <<"DONATE";
  
	wire [ADDRESS_SIZE_WM-1:0] wm_address;
    
    assign wm_address = wm_addr_sel ? wm_address_read_current : riscv_address[ADDRESS_SIZE_WM-1:0];
    
    
DONATE
  
  for($i=1; $i<=$ARGV[4]; $i = $i + 1){
	print $fh <<"DONATE";
	single_port_memory  #(.$data_width($data_width), .$mem_size($ifm_depth))
	W$i
	(
	.clk(clk),
	.Enable_Write(wm_enable_write[${\($i-1)}]),
	.Enable_Read(wm_enable_read),
	.Address(wm_address),
	.Data_Input(riscv_data),
	.Data_Output(Data_Weight_$i)
	);
DONATE
  }
  
  
  chdir "./Modules";
  system("perl fc_fifo.pl $ARGV[4] $ARGV[1]");
  
  my $fifo_name = "fo_fifo_$ARGV[4]";
  
  print $fh <<"DONATE";
  
	$fifo_name #(.DATA_WIDTH(DATA_WIDTH), .REGS_NUM($ARGV[4]))
	FIFO1
	(
		.clk(clk),
		.fifo_data_in(riscv_data), 
		.fifo_enable(bm_enable_write),
DONATE
  
    for($i=1; $i<$ARGV[4]; $i = $i + 1){
	print $fh <<"DONATE";
		.fifo_data_out_$i (data_bias_$i),
DONATE
  }
  
  print $fh <<"DONATE";
		.fifo_data_out_$i (data_bias_$i)
	);
	
DONATE

    chdir "../..";
  system("perl fully_connected_gen.pl $ARGV[1] $ARGV[4] $ARGV[0]");

print $fh <<"DONATE";
	fully_connected_$ARGV[4] #(.$data_width($data_width), .ARITH_TYPE(ARITH_TYPE))
	F1
	(
	.Data_in(data_in_from_previous),
DONATE
  
  for($i=1; $i<=$ARGV[4]; $i = $i + 1){
	print $fh <<"DONATE";
	.Data_Weight_$i(Data_Weight_$i),
DONATE
  }
  
  for($i=1; $i<$ARGV[4]; $i = $i + 1){
	print $fh <<"DONATE";
	.Data_out_FC_$i(s_Data_out_FC_$i),
DONATE
  }
  
  print $fh <<"DONATE";
	.Data_out_FC_$i(s_Data_out_FC_$i)
);

DONATE
  
  print $fh <<"DONATE";
always @ (posedge clk , posedge reset )
    begin 
     if (reset)
      begin
DONATE
  
  for($i=1; $i<=$ARGV[4]; $i = $i + 1){
	print $fh <<"DONATE";
	  reg_out_FC_$i  <= {DATA_WIDTH{1'b0}} ;
DONATE
  }
  
  print $fh <<"DONATE";
	  end
    else if (fc_output_ready )
       begin 
DONATE
  
  for($i=1; $i<=$ARGV[4]; $i = $i + 1){
	print $fh <<"DONATE";
	   reg_out_FC_$i  <=s_Data_out_FC_$i   ;
DONATE
  }
  
  print $fh <<"DONATE";
	  end
   end
		
    
endmodule 
DONATE
 
close $fh or die "Couldn't Close File : $!";