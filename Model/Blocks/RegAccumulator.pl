use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] ARITH_TYPE 1
#ARGV[1] DATA_WIDTH 32
#ARGV[2] $relative_path
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
my $arith_type = "ARITH_TYPE";
my $mem_size = "MEM_SIZE";
my $full_path = "../../$ARGV[2]/";

#######################################################################################

my $file_name;
my $module_name;



$module_name = "Reg_Accumulator";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$arith_type = $ARGV[0],
	$data_width = $ARGV[1]
	)(
	input clk,
	input reset, 
	input Enable,
	input bias_sel, 
	input [$data_width-1:0] data_in_from_previous,
	input [$data_width-1:0] data_bias,
	output reg [DATA_WIDTH-1:0] reg_accu_data_out
	);
    
    wire [DATA_WIDTH-1:0] data_out_mux;
    wire [DATA_WIDTH-1:0] adder_data_out;
    
	assign data_out_mux = bias_sel ? data_bias : adder_data_out;
	
DONATE
	
	print $fh <<"DONATE";
	adder #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE)) add ( .in1(data_in_from_previous), .in2(reg_accu_data_out), .out(adder_data_out) );
DONATE
	
	print $fh <<"DONATE";
	
    always @(posedge clk ,posedge reset)
    begin 
        if (reset) 
            reg_accu_data_out <= {DATA_WIDTH{1'b0}}; 
        else if (Enable) 
            reg_accu_data_out <= data_out_mux; 
    end 

endmodule 
DONATE

close $fh or die "Couldn't Close File : $!";