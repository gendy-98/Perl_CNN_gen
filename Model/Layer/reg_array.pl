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
#ARGV[1]
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
my $full_path = "../../$ARGV[1]/";
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

$module_name = "reg_array";




$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 					= $ARGV[0])
(
  input clk ,reset ,
  /////////////////////////////////////////////////
  input  [DATA_WIDTH-1 : 0] data_in_from_previous,
  output [DATA_WIDTH-1 : 0] data_out_for_previous,
  input  enable_write_previous,
  input  enable_read_previous,
  
  ////////////////////////////////////////////////
  input   ifm_sel,
  output  [DATA_WIDTH-1 : 0]  data_out_for_next,
  input   enable_read_next
  );
  
  
    wire	[DATA_WIDTH - 1 : 0]	Data_Read_Reg1, Data_Read_Reg2;
		
	wire Write_En_Reg1, Write_En_Reg2;

	reg [DATA_WIDTH - 1 : 0] data_out_for_next_sig ,data_out_for_previous_sig;
	
	// Demux For Enable Write 
    assign Write_En_Reg1 = enable_write_previous & ~ifm_sel ;
    assign Write_En_Reg2 = enable_write_previous &  ifm_sel ;
    
	
	always @*
	begin
        if(ifm_sel)
        begin
            data_out_for_next_sig     = Data_Read_Reg1; 	   
	        data_out_for_previous_sig = Data_Read_Reg2; 
        end
    
        else
        begin
            data_out_for_next_sig     = Data_Read_Reg2;   
            data_out_for_previous_sig = Data_Read_Reg1; 	        
        end
    end
	
	
   Register #(.DATA_WIDTH(DATA_WIDTH)) R1 (.clk(clk),.reset(reset),.Data_in(data_in_from_previous),.Enable(Write_En_Reg1),.Data_out(Data_Read_Reg1)); 
   Register #(.DATA_WIDTH(DATA_WIDTH)) R2 (.clk(clk),.reset(reset),.Data_in(data_in_from_previous),.Enable(Write_En_Reg2),.Data_out(Data_Read_Reg2));  
   
   Register #(.DATA_WIDTH(DATA_WIDTH)) R3 (.clk(clk),.reset(reset),.Data_in(data_out_for_next_sig),.Enable(enable_read_next),.Data_out(data_out_for_next)); 
   Register #(.DATA_WIDTH(DATA_WIDTH)) R4 (.clk(clk),.reset(reset),.Data_in(data_out_for_previous_sig),.Enable(enable_read_previous),.Data_out(data_out_for_previous));
   
   endmodule


DONATE


close $fh or die "Couldn't Close File : $!";
