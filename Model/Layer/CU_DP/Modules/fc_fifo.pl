use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


#argumets 
#ARGV[0] REGS_NUM
#ARGV[1] Data_Width
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
my $num_filters = "NUMBER_OF_FILTERS";
my $full_path = "../../../../Verilog_files/";
#######################################################################################
my $i = 0;
my $j = 0;
my $file_name;
my $module_name;
my $multi_name;





$module_name = "fo_fifo_$ARGV[0]";








$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
	$data_width = $ARGV[1],
	REGS_NUM = $ARGV[0]
	)(
	$i_p clk,
	$i_p reset,
DONATE

for($i = 1;$i <= $ARGV[0];$i = $i + 1){
	print $fh "\t$o_p [$data_width-1:0] fifo_data_out_$i,\n";
}


	print $fh <<"DONATE";
	$i_p [$data_width-1:0] fifo_data_in,
	$i_p fifo_enable
	);
DONATE


print $fh <<"DONATE";

	reg	[$data_width-1:0] FIFO  [REGS_NUM-1:0] ;
	always @ (posedge clk or posedge reset)
    begin
		if(reset)
		begin

DONATE

for($i = 0;$i < $ARGV[0];$i = $i + 1){
	print $fh "\t\t\tFIFO[${\($i)}] <= {DATA_WIDTH{1'b0}};\n";
}

print $fh <<"DONATE";
		end
        else if(fifo_enable)
		begin
DONATE



print $fh "\t\t\tFIFO[0] <= fifo_data_in;\n";
for($i = 0;$i < $ARGV[0]-1;$i = $i + 1){
	print $fh "\t\t\tFIFO[${\($i+1)}] <= FIFO[$i];\n";
}
	
print $fh <<"DONATE";
		end
	end

DONATE


for($i = 1;$i <= $ARGV[0];$i = $i + 1){
	print $fh "\tassign    fifo_data_out_$i = FIFO[${\($ARGV[0] - $i)}];\n";
}




print $fh "$end_module";

close $fh or die "Couldn't Close File : $!";