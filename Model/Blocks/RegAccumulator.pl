use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] which adder (decimal, fixed, float) 
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
my $mem_size = "MEM_SIZE";
my $full_path = "../../Verilog_files/";

#######################################################################################

my $reg_name = "Register"
my $adder_name;
my $file_name;
my $module_name;


 if(lc ($ARGV[0]) eq "decimal"){
	$adder_name = "Dec_Adder";
	}
if(lc ($ARGV[0]) eq "fixed"){
	$adder_name = "Fixed_Adder";
	}
if(lc ($ARGV[0]) eq "float"){
	$adder_name = "Float_Adder";
	}
	
$module_name = "Reg_Accumulator";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width = 32
	)(
	input clk,
	input reset, 
	input [Data_Width-1:0] Data_in,
	input [Data_Width-1:0] data_bias,
	input Enable,
	input bias_sel, 
	output  [Data_Width-1:0] Data_out
	);

	reg [Data_Width-1:0] Data;
	wire [Data_Width-1:0] Data_out_FP;
	wire [Data_Width-1:0] data_out_mux;
	wire bias_sel_reg;
	
	$reg_name r1(.clk(clk), .reset(reset), .Data_in(bias_sel), .Enable(1), .Data_out(bias_sel_reg));
	
	always @(posedge clk ,posedge reset)
    begin 
		if (reset) 
			Data <= 32'b0; 
		else if (Enable) 
			Data <= data_out_mux; 
    end 
	
	assign Data_out = Data; 
	
	
	$adder_name add ( .in1(Data_in), .in2(Data_out), .out(Data_out_FP));
 
	assign data_out_mux = bias_sel_reg ? Data_out_FP : data_bias;

endmodule 
DONATE

close $fh or die "Couldn't Close File : $!";