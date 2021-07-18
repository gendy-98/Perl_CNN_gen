use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#No arguments needed 
#They get passed from higher layer
#ARGV[0] $relative_path
#mal7oza lazem tekteb el rakam ely howa 28*28 for example

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
my $mem_size = "MEM_SIZE";
my $full_path = "../../$ARGV[0]/";

#######################################################################################

my $file_name;
my $module_name;

$module_name = "true_dual_port_memory";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 				= 32,
	$mem_size 				= 512
)(
	$i_p clk,
	
	$i_p [$data_width-1:0] Data_Input_A,
    $i_p [$clog2($mem_size)-1:0] Address_A,
    $i_p Enable_Write_A,
    $i_p Enable_Read_A, 
  
    $i_p [$data_width-1:0] Data_Input_B,
    $i_p [$clog2($mem_size)-1:0] Address_B,
    $i_p Enable_Write_B,
    $i_p Enable_Read_B, 
  
    $o_p reg [$data_width-1:0] Data_Output_A,
    $o_p reg [$data_width-1:0] Data_Output_B
    );
    
    reg [$data_width-1:0] IFM_Memory [$mem_size-1:0];

    always @(posedge clk)
    begin
        if(Enable_Write_A)
            IFM_Memory[Address_A] <= Data_Input_A;
        if(Enable_Read_A)    
            Data_Output_A <= IFM_Memory[Address_A];
    end
 
    always @(posedge clk)
    begin
        if(Enable_Write_B)
            IFM_Memory[Address_B] <= Data_Input_B;
        if(Enable_Read_B)    
            Data_Output_B <= IFM_Memory[Address_B];
    end

endmodule
DONATE

close $fh or die "Couldn't Close File : $!";