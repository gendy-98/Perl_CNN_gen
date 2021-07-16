use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

use POSIX; # for ceil and floor 

#argumets 
#ARGV[0] Memories numbers
#ARGV[1] Units number
#ARGV[2] DATA_WIDTH 
#ARGV[3] ADDRESS_BITS
#ARGV[4] IFM_SIZE
#ARGV[5] IFM_DEPTH
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
my $full_path = "../../Verilog_files/";
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

my $dual_port_name = "true_dual_port_memory";

if($ARGV[0] == 1){
	$IFM_number = 2;
	$units = 1;
}
else{
	$IFM_number = $ARGV[5];
	$units = $ARGV[1];
}

$module_name = "mem_array_U${\($units)}_D${\($IFM_number)}_S$ARGV[4]";
#U for units and D for IFM Depth S IFM SIZE



$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width 					= $ARGV[2],
///////////architecture parameters//////
	$ifm_size              = $ARGV[4],                                                
    NUMBER_OF_IFM         = $IFM_number,
    NUMBER_OF_UNITS       = $units,
    ADDRESS_SIZE_IFM      = $clog2($ifm_size*$ifm_size)

	)(
	$i_p clk,
	$i_p [$clog2(${\(ceil($IFM_number/$units))})-1:0] ifm_sel,
	$i_p                        ifm_enable_write_previous,            
	$i_p                        ifm_enable_read_previous, 
	$i_p  [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous,
	$i_p  [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous,	

DONATE

for($i = 1;$i <= $units; $i = $i + 1){
	print $fh <<"DONATE";
	$i_p [$data_width-1:0] data_in_from_previous$i,
DONATE
}

for($i = 1;$i <= $units; $i = $i + 1){
	print $fh <<"DONATE";
	$o_p reg [$data_width-1:0] data_out_for_previous$i,
DONATE
}

print $fh <<"DONATE";
	$i_p                        ifm_enable_read_A_next,
    $i_p                        ifm_enable_read_B_next,
	$i_p [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next,
	$i_p [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next,
DONATE

for($i = 1;$i < $units; $i = $i + 1){
	print $fh <<"DONATE";
	$o_p reg [$data_width-1:0] data_out_A_for_next$i,
	$o_p reg [$data_width-1:0] data_out_B_for_next$i,
DONATE
}

print $fh <<"DONATE";
	$o_p reg [$data_width-1:0] data_out_A_for_next$i,
	$o_p reg [$data_width-1:0] data_out_B_for_next$i
	);
	
DONATE

for($i = 1;$i <= $IFM_number; $i = $i + 1){
	print $fh <<"DONATE";
	wire [$data_width-1:0] Data_Output_A_Mem$i;
	wire [$data_width-1:0] Data_Output_B_Mem$i;
DONATE
}

my $divisionOutput = ceil($IFM_number/$units);



for($i = 1;$i <= $divisionOutput; $i = $i + 1){
	print $fh <<"DONATE";
	
	wire ifm_enable_write_previous_dMuxOut$i;
	wire ifm_enable_read_previous_dMuxOut$i;
	wire ifm_enable_read_A_next_dMuxOut$i;
	wire ifm_enable_read_B_next_dMuxOut$i;
	
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_write_previous_dMuxOut$i;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_previous_dMuxOut$i;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_next_dMuxOut$i;
	wire [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_next_dMuxOut$i;
	
DONATE
}

my $addressbits = ceil(log($ARGV[4]*$ARGV[4]) / log(2));
chdir "./CU_DP/Modules/operations";

system("perl Demux1toN.pl $divisionOutput");

system("perl Demux1toN_Mbit.pl $divisionOutput $addressbits");

my $demux_1bit_name = "demux_1_to_$divisionOutput";

my $demux_Mbit_name = "demux_1_to_$divisionOutput$under_Score$addressbits"."bits";

print $fh <<"DONATE";
	$demux_1bit_name d0(
	.din(ifm_enable_write_previous),
	.sel(ifm_sel),
DONATE
for($i = 1;$i < $divisionOutput; $i = $i + 1){
print $fh "\t.dout_$i(ifm_enable_write_previous_dMuxOut$i),\n";
}
print $fh "\t.dout_$i(ifm_enable_write_previous_dMuxOut$i)\n\t);\n\n";


print $fh <<"DONATE";
	$demux_1bit_name d1(
	.din(ifm_enable_read_previous),
	.sel(ifm_sel),
DONATE
for($i = 1;$i < $divisionOutput; $i = $i + 1){
print $fh "\t.dout_$i(ifm_enable_read_previous_dMuxOut$i),\n";
}
print $fh "\t.dout_$i(ifm_enable_read_previous_dMuxOut$i)\n\t);\n\n";


print $fh <<"DONATE";
	$demux_1bit_name d2(
	.din(ifm_enable_read_B_next),
	.sel(ifm_sel),
DONATE
for($i = 1;$i < $divisionOutput; $i = $i + 1){
print $fh "\t.dout_$i(ifm_enable_read_B_next_dMuxOut$i),\n";
}
print $fh "\t.dout_$i(ifm_enable_read_B_next_dMuxOut$i)\n\t);\n\n";


print $fh <<"DONATE";
	$demux_1bit_name d3(
	.din(ifm_enable_write_previous),
	.sel(ifm_sel),
DONATE
for($i = 1;$i < $divisionOutput; $i = $i + 1){
print $fh "\t.dout_$i(ifm_enable_write_previous_dMuxOut$i),\n";
}
print $fh "\t.dout_$i(ifm_enable_write_previous_dMuxOut$i)\n\t);\n\n";


print $fh <<"DONATE";
	$demux_Mbit_name d4(
	.din(ifm_address_write_previous),
	.sel(ifm_sel),
DONATE
for($i = 1;$i < $divisionOutput; $i = $i + 1){
print $fh "\t.dout_$i(ifm_address_write_previous_dMuxOut$i),\n";
}
print $fh "\t.dout_$i(ifm_address_write_previous_dMuxOut$i)\n\t);\n\n";


print $fh <<"DONATE";
	$demux_Mbit_name d5(
	.din(ifm_address_read_previous),
	.sel(ifm_sel),
DONATE
for($i = 1;$i < $divisionOutput; $i = $i + 1){
print $fh "\t.dout_$i(ifm_address_read_previous_dMuxOut$i),\n";
}
print $fh "\t.dout_$i(ifm_address_read_previous_dMuxOut$i)\n\t);\n\n";



print $fh <<"DONATE";
	$demux_Mbit_name d6(
	.din(ifm_address_read_A_next),
	.sel(ifm_sel),
DONATE
for($i = 1;$i < $divisionOutput; $i = $i + 1){
print $fh "\t.dout_$i(ifm_address_read_A_next_dMuxOut$i),\n";
}
print $fh "\t.dout_$i(ifm_address_read_A_next_dMuxOut$i)\n\t);\n\n";


print $fh <<"DONATE";
	$demux_Mbit_name d7(
	.din(ifm_address_read_B_next),
	.sel(ifm_sel),
DONATE
for($i = 1;$i < $divisionOutput; $i = $i + 1){
print $fh "\t.dout_$i(ifm_address_read_B_next_dMuxOut$i),\n";
}
print $fh "\t.dout_$i(ifm_address_read_B_next_dMuxOut$i)\n\t);\n\n";



print $fh <<"DONATE";
	
    always @*
    begin

        case(ifm_sel)
DONATE
$k = 1;
$h = ($divisionOutput-1)*$units+1;
for($i = 0;$i < $divisionOutput - 1; $i = $i + 1){
	print $fh <<"DONATE";
		${\(ceil(log($divisionOutput) / log(2)))}'d$i:
		begin
DONATE
	for($j = 1;$j <= $units; $j = $j + 1){
	   	if($k <= $IFM_number){
			print $fh "\t\t\tdata_out_for_previous$j = Data_Output_B_Mem$k;\n";
		}
		else{
			print $fh "\t\t\tdata_out_for_previous$j = 0;\n";
		}
		$k = $k + 1;
	}
	for($j = 1;$j <= $units; $j = $j + 1){
		if($h <= $IFM_number){
			print $fh <<"DONATE";
		
			data_out_A_for_next$j = Data_Output_A_Mem$h;
			data_out_B_for_next$j = Data_Output_B_Mem$h;
DONATE
		}
		else{
			print $fh <<"DONATE";
		
			data_out_A_for_next$j = 0;
			data_out_B_for_next$j = 0;
DONATE
			
		}
		$h = $h + 1;
		if($h > $divisionOutput*$units){
				$h = 1;
			}
	}
	print $fh "\t\tend\n";
}
#####################the last iteration############3 
		print $fh <<"DONATE";
		default:
		begin
DONATE
	for($j = 1;$j <= $units; $j = $j + 1){
	   if($k <= $IFM_number){
			print $fh "\t\t\tdata_out_for_previous$j = Data_Output_B_Mem$k;\n";
		}
		else{
			print $fh "\t\t\tdata_out_for_previous$j = 0;\n";
		}
		$k = $k + 1;
	}
	for($j = 1;$j <= $units; $j = $j + 1){
		if($h <= $IFM_number){
			print $fh <<"DONATE";
		
			data_out_A_for_next$j = Data_Output_A_Mem$h;
			data_out_B_for_next$j = Data_Output_B_Mem$h;
DONATE
		}
		else{
			print $fh <<"DONATE";
		
			data_out_A_for_next$j = 0;
			data_out_B_for_next$j = 0;
DONATE
			if($h >= $divisionOutput*$units){
				$h = 0;
			}
		}
		$h = $h + 1;
	}
	print $fh "\t\tend\n";
	
	print $fh <<"DONATE";
		
		endcase
		
	end
DONATE

my $accu_var = 1;

chdir "./../../..";



system("perl mem_unit.pl $units"); 

######################################################big loop
my $loop_condition;

if(($IFM_number/$units)  == ceil($IFM_number/$units)){
	$loop_condition = ceil($IFM_number/$units);
}
else{
	$loop_condition = floor($IFM_number/$units);
}

for($i = 1;$i <= $loop_condition;$i = $i + 1){

	print $fh <<"DONATE";

	
mem_unit_$units #( .DATA_WIDTH(DATA_WIDTH),.IFM_SIZE(IFM_SIZE))
M$i(  .clk(clk),
DONATE

	for($j = 1;$j<=$units;$j = $j + 1){
		print $fh <<"DONATE";
      .Data_Input_A_Mem$j (data_in_from_previous$j),
      .Data_Input_B_Mem$j ('b0),
DONATE
}


		print $fh <<"DONATE";
	
      .Address_A ( ifm_address_write_previous_dMuxOut$i | ifm_address_read_A_next_dMuxOut${\($i+1)} ),
      .Address_B ( ifm_address_read_previous_dMuxOut$i  | ifm_address_read_B_next_dMuxOut${\($i+1)} ),  
DONATE



		print $fh <<"DONATE";
	
      .Enable_Write_A_Mem (ifm_enable_write_previous_dMuxOut$i),
      .Enable_Read_A_Mem  (ifm_enable_read_A_next_dMuxOut${\($i+1)}),
      .Enable_Write_B_Mem (1'b0),
      .Enable_Read_B_Mem  (ifm_enable_read_previous_dMuxOut$i | ifm_enable_read_B_next_dMuxOut${\($i+1)}),
	  
DONATE


	for($m = 1;$m<$units;$m = $m + 1){
		print $fh <<"DONATE";
      .Data_Output_A_Mem$m (Data_Output_A_Mem$accu_var),
      .Data_Output_B_Mem$m (Data_Output_B_Mem$accu_var),
DONATE
	  	$accu_var = $accu_var + 1;
    }

	print $fh <<"DONATE";
      .Data_Output_A_Mem$m (Data_Output_A_Mem$accu_var),
      .Data_Output_B_Mem$m (Data_Output_B_Mem$accu_var)
	  );
DONATE
	$accu_var = $accu_var + 1;

}

my $ifm_init_number = ($IFM_number - floor($IFM_number/$units) * $units); 

for($k = 1;$k <= $ifm_init_number; $k = $k + 1){
	print $fh <<"DONATE";
	$dual_port_name #(.DATA_WIDTH(DATA_WIDTH), .MEM_SIZE(IFM_SIZE*IFM_SIZE)) 
	IFM$accu_var (
    .clk(clk),
	
	.Data_Input_A(data_in_from_previous$k),
	.Data_Input_B('b0),
	
	.Address_A ( ifm_address_write_previous_dMuxOut$i | ifm_address_read_A_next_dMuxOut1 ),
    .Address_B ( ifm_address_read_previous_dMuxOut$i  | ifm_address_read_B_next_dMuxOut1 ),  
	
	.Enable_Write_A (ifm_enable_write_previous_dMuxOut$i),
    .Enable_Read_A  (ifm_enable_read_A_next_dMuxOut1),
    .Enable_Write_B (1'b0),
    .Enable_Read_B  (ifm_enable_read_previous_dMuxOut$i | ifm_enable_read_B_next_dMuxOut1),
	  
	
    .Data_Output_A(Data_Output_A_Mem$accu_var),
    .Data_Output_B(Data_Output_B_Mem$accu_var)
	);
	
DONATE
$accu_var = $accu_var + 1;
}

print $fh "$end_module";

close $fh or die "Couldn't Close File : $!";
