use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0]  LAYERS_NAMES DELIMITED BY COMAS ex: conva1,convb,conva2,fc1,fc2
#ARGV[1]  NUMBER OF UNITS DELIMITED BY COMAS ex: 3,3,3,84,10
#ARGV[2]  KERNAL_SIZE DELIMITED BY COMAS
#ARGV[3]  NUMBER_OF_FILTERS DELIMITED BY COMAS | was OUTPUT CHANNELS | 
#ARGV[4]  IFM_SIZE DELIMITED BY COMAS | was INPUT SIZE | 
#ARGV[5]  IFM_DEPTH DELIMITED BY COMAS | was INPUT CHANNELS | 
#ARGV[6]  DATA_WIDTH
#ARGV[7]  ADDRESS_BUS
#ARGV[8]  ADDRESS_BITS
#ARGV[9]  RGB FLAG
#ARGV[10] STRIDES  DELIMITED BY COMAS 
#ARGV[11] operation_type
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
my $full_path = "../Verilog_files/";
#######################################################################################
my $i = 0;
my $j = 0;
my $k = 0;
my $file_name;
my $module_name;
my $adder_name;
my $mul_name;
my $odd_flag;
my $dummy_level;
my @levels;
my $levels_number;

my $single_port_name = "single_port_memory";
my $unit_name = "unitA";
my $Relu_name = "relu";
my $cu_name;
my $dp_name;
my $accumulator_name = "accumulator"; 
$module_name = "top_module";


 
 if(lc ($ARGV[2]) eq "decimal"){
	$adder_name = "Dec_Adder";
	$mul_name = "Dec_Multiplier";
	}
if(lc ($ARGV[2]) eq "fixed"){
	$adder_name = "Fixed_Adder";
	$mul_name = "Fixed_Multiplier";
	}
if(lc ($ARGV[2]) eq "float"){
	$adder_name = "Float_Adder";
	$mul_name = "Float_Multiplier";
	}



$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
  
  
  
print $fh <<"DONATE";
$module $module_name $parameter
		///////////advanced parameters//////////
		$data_width 				= $ARGV[6],
		ADDRESS_BUS		  		= $ARGV[7],
		ADDRESS_BITS 			= $ARGV[8], 
		/////////////////////////////////////
DONATE

my @layers_names = split(',', $ARGV[0]);
my $layers_count = @layers_names;

my @layer_units  = split(',', $ARGV[1]);

my @kernal_size  = split(',', $ARGV[2]);

my @filter_num  = split(',', $ARGV[3]);

my @ifm_size  = split(',', $ARGV[4]);

my @ifm_depth  = split(',', $ARGV[5]);

my @stride  = split(',', $ARGV[10]);

for($i = 0; $i < $layers_count; $i = $i + 1){
	if($layers_names[$i] =~ /conv/){
		print $fh <<"DONATE";
		// ${\($i+1)}.$layers_names[$i]
		${\(uc $layers_names[$i])}_KERNAL_SIZE			= $kernal_size[$i],
		${\(uc $layers_names[$i])}_NUMBER_OF_FILTERS 	= $filter_num[$i],
		${\(uc $layers_names[$i])}_IFM_SIZE				= $ifm_size[$i],
		${\(uc $layers_names[$i])}_IFM_DEPTH 			= $ifm_depth[$i],
		${\(uc $layers_names[$i])}_NUMBER_OF_UNITS 		= $layer_units[$i],
		${\(uc $layers_names[$i])}_ADDRESS_SIZE_IFM		= $clog2(${\(uc $layers_names[$i])}_IFM_SIZE * ${\(uc $layers_names[$i])}_IFM_SIZE),
		
DONATE
	}
	if($layers_names[$i] =~ /pool/){
		print $fh <<"DONATE";
		// ${\($i+1)}.$layers_names[$i]
		${\(uc $layers_names[$i])}_KERNAL_SIZE			= $kernal_size[$i],
		${\(uc $layers_names[$i])}_IFM_SIZE				= $ifm_size[$i],
		${\(uc $layers_names[$i])}_IFM_DEPTH 			= $ifm_depth[$i],
		${\(uc $layers_names[$i])}_NUMBER_OF_UNITS 		= $layer_units[$i],
		${\(uc $layers_names[$i])}_ADDRESS_SIZE_IFM		= $clog2(${\(uc $layers_names[$i])}_IFM_SIZE * ${\(uc $layers_names[$i])}_IFM_SIZE),
		
DONATE
	}
	if($layers_names[$i] =~ /fc/){
		print $fh <<"DONATE";
		// ${\($i+1)}.$layers_names[$i]
		${\(uc $layers_names[$i])}_IFM_DEPTH 		= $ifm_depth[$i],
		
DONATE
	}
}

print $fh <<"DONATE";


		ENABLE_BITS  			= ADDRESS_BUS - ADDRESS_BITS
	)(
	input clk,
	input reset,
	input [DATA_WIDTH-1:0] riscv_data_bus,
	input [ADDRESS_BUS-1:0]riscv_address_bus,
	input initialization_done,
	
DONATE

for($i = 1; $i <= $filter_num[$layers_count-1]; $i = $i + 1){
	print $fh <<"DONATE";
	output [DATA_WIDTH-1:0] Data_out_${\($i)}_final,
DONATE

}

print $fh <<"DONATE";
	output ready,
    output Get_final_value
    );
	
	wire memControl_conva1_start;
DONATE

if($ARGV[9] == 0){
	print $fh <<"DONATE";
	//1 indicates the input img is grayscale
	wire [1-1:0] memControl_conva1_ifm_enable_write;
	
DONATE
}
else{
	print $fh <<"DONATE";
	//3 indicates the input img is RGB
	wire [3-1:0] memControl_conva1_ifm_enable_write;
	
DONATE
}

for($i = 0; $i <$layers_count; $i = $i + 1){
	if (index($layers_names[$i], "pool") == -1) {
		print $fh <<"DONATE";
	wire [$layer_units[$i]-1:0] memControl_$layers_names[$i]_wm_enable_write;
DONATE
	}
}

print $fh <<"DONATE";

	wire [DATA_WIDTH-1:0] memControl_riscv_data;
    wire [ADDRESS_BITS-1:0] memControl_riscv_address;
	
DONATE

for($i = 0; $i <$layers_count; $i = $i + 1){
	if (index($layers_names[$i], "pool") == -1) {
		if (index($layers_names[$i], "convb") == -1) {
			print $fh <<"DONATE";
	wire memControl_$layers_names[$i]_bm_enable_write;
DONATE
		}
		else{
			print $fh <<"DONATE";
	wire [$layer_units[$i]-1:0] memControl_$layers_names[$i]_bm_enable_write;
DONATE
		}
	}
}



my $ab_flag = 0;#false, 0 is a/ true, 1 is b
my $is_itConvB = 0;
my $unit_counter;
my $is_itPool = 0;


for($i = 0; $i < $layers_count; $i = $i + 1){
	if($layers_names[$i] =~ /conv/){
		$is_itPool = 0;
		if($i == 0){
			print $fh <<"DONATE";
			
	// Outputs of layer Conv $i
	wire [DATA_WIDTH-1:0]  ${\($layers_names[$i])}_data_out_for_next;
    wire [${\(uc $layers_names[$i])}_ADDRESS_SIZE_IFM-1:0] ${\($layers_names[$i])}_ifm_address_write_next;
    wire ${\($layers_names[$i])}_ifm_enable_write_next;
    wire ${\($layers_names[$i])}_start_to_next;  
    wire ${\($layers_names[$i])}_ifm_sel_next;  
DONATE
			$ab_flag = $ab_flag + 1;
			$is_itConvB = 1;
		}
		else{
			$ab_flag = $ab_flag + 1;
			if($ab_flag % 2){
				print $fh <<"DONATE";
			
	// Outputs of layer Conv $i
	wire ${\($layers_names[$i])}_end_to_previous;
    wire ${\($layers_names[$i])}_ready;
	wire ${\($layers_names[$i])}_ifm_enable_read_A_current;
DONATE
				if($stride[$i] == 2){
					print $fh "\twire ${\($layers_names[$i])}_ifm_enable_read_B_current;\n";
				}
				print $fh "\twire [${\(uc $layers_names[$i])}_ADDRESS_SIZE_IFM-1:0] ${\($layers_names[$i])}_ifm_address_read_A_current;\n";
				if($stride[$i] == 2){
					print $fh "\twire [${\(uc $layers_names[$i])}_ADDRESS_SIZE_IFM-1:0] ${\($layers_names[$i])}_ifm_address_read_B_current;\n";
				}
				print $fh <<"DONATE";
    wire [DATA_WIDTH-1:0] ${\($layers_names[$i])}_data_out_for_next;
	wire ${\($layers_names[$i])}_ifm_enable_write_next;
	wire ${\($layers_names[$i])}_ifm_enable_read_next;
	wire ${\($layers_names[$i])}_start_to_next;
	wire [$clog2(${\(uc $layers_names[$i])}_IFM_DEPTH/${\($layers_names[$i])}_NUMBER_OF_UNITS+1)-1:0] ${\($layers_names[$i])}_ifm_sel_previous;
    wire [$clog2(${\(uc $layers_names[$i+1])}_IFM_DEPTH/${\($layers_names[$i])}_NUMBER_OF_UNITS+1)-1:0] ${\($layers_names[$i])}_ifm_sel_next;	
DONATE
				$is_itConvB = 1;
			}
			else{
				print $fh <<"DONATE";
			
	// Outputs of layer Conv $i
	wire ${\($layers_names[$i])}_end_to_previous;
	wire ${\($layers_names[$i])}_ifm_enable_read_A_current;
	wire ${\($layers_names[$i])}_ifm_enable_read_B_current;
	wire [[${\(uc $layers_names[$i])}_ADDRESS_SIZE_IFM-1:0] ${\($layers_names[$i])}_ifm_address_read_A_current; 
	wire [[${\(uc $layers_names[$i])}_ADDRESS_SIZE_IFM-1:0] ${\($layers_names[$i])}_ifm_address_read_B_current;
	wire ${\($layers_names[$i])}_ifm_enable_read_next;
	wire ${\($layers_names[$i])}_ifm_enable_write_next;
    wire [${\(uc $layers_names[$i+1])}_ADDRESS_SIZE_IFM-1:0] ${\($layers_names[$i])}_ifm_address_read_next; 
	wire [${\(uc $layers_names[$i+1])}_ADDRESS_SIZE_IFM-1:0] ${\($layers_names[$i])}_ifm_address_write_next; 
DONATE
				for($j = 1; $j <= $layer_units[$i]; $j = $j + 1){
					print $fh "\twire [DATA_WIDTH-1:0] ${\($layers_names[$i])}_data_out_for_next$j;\n";
				}
				print $fh <<"DONATE";
	wire ${\($layers_names[$i])}_start_to_next;//all
	wire [$clog2(${\($layers_names[$i+1])}_IFM_DEPTH/${\($layers_names[$i])}_NUMBER_OF_UNITS+1)-1:0] ${\($layers_names[$i])}_ifm_sel_next;// all
				
DONATE
				$is_itConvB = 0;
			}
		}
	}
	if($layers_names[$i] =~ /pool/){
		$is_itPool = 1;
		if($ab_flag % 2){
			print $fh <<"DONATE";

	// Outputs of layer Pool $i
	wire ${\($layers_names[$i])}_ifm_enable_read_A_current; 
    wire [${\(uc $layers_names[$i])}_ADDRESS_SIZE_IFM-1:0] ${\($layers_names[$i])}_ifm_address_read_A_current;
DONATE
			if($stride[$i] == 2){
				print $fh <<"DONATE";
	wire ${\($layers_names[$i])}_ifm_enable_read_B_current; 
    wire [${\(uc $layers_names[$i])}_ADDRESS_SIZE_IFM-1:0] ${\($layers_names[$i])}_ifm_address_read_B_current;
DONATE
			}
			for($j = 1; $j <= $unit_counter; $j = $j + 1){
				print $fh "\twire [DATA_WIDTH-1 : 0] ${\($layers_names[$i])}_data_out_$j;\n";
			}
			print $fh <<"DONATE";
    wire ${\($layers_names[$i])}_end_to_previous;
    wire [DATA_WIDTH-1:0] ${\($layers_names[$i])}_data_out;
    wire [${\(uc $layers_names[$i+1])}_ADDRESS_SIZE_IFM-1:0] ${\($layers_names[$i])}_ifm_address_write_next;
    wire ${\($layers_names[$i])}_ifm_enable_write_next;
    wire ${\($layers_names[$i])}_start_to_next;
    wire ${\($layers_names[$i])}_ifm_sel_next;  		
DONATE
		}
		else{
			print $fh <<"DONATE";
			
	// Outputs of layer Pool $i		
	wire ${\($layers_names[$i])}_ifm_enable_read_A_current; 
    wire [${\(uc $layers_names[$i])}_ADDRESS_SIZE_IFM-1:0] ${\($layers_names[$i])}_ifm_address_read_A_current;
DONATE
			if($stride[$i] == 2){
				print $fh <<"DONATE";
	wire ${\($layers_names[$i])}_ifm_enable_read_B_current; 
    wire [${\(uc $layers_names[$i])}_ADDRESS_SIZE_IFM-1:0] ${\($layers_names[$i])}_ifm_address_read_B_current;
DONATE
			}

			print $fh <<"DONATE";
    wire ${\($layers_names[$i])}_end_to_previous;
    wire [${\(uc $layers_names[$i+1])}_ADDRESS_SIZE_IFM-1:0] ${\($layers_names[$i])}_ifm_address_write_next;
    wire ${\($layers_names[$i])}_ifm_enable_write_next;
    wire ${\($layers_names[$i])}_start_to_next;
    wire ${\($layers_names[$i])}_ifm_sel_next;  		
DONATE
		}
		#system("perl conva1.pl  $layer_name $kernal_size $stride $ifm_size $ifm_depth $number_of_filters");
	}
	if($layers_names[$i] =~ /fc/){
		$is_itPool = 0;
		$ab_flag = $ab_flag + 1;
		if($ab_flag % 2){
			say "my name is fca.pl";
		}
		else{
			say "my name is fcb.pl";
		}
		#system("perl conva1.pl  $layer_name $kernal_size $stride $ifm_size $ifm_depth $number_of_filters");
	}
	###########################################
	#this part for mem_arr wire between layers#
	###########################################
	
	if($i != ($layers_count-1)){
		if ($is_itConvB){
			$unit_counter = 1;
		}
		else{
			$unit_counter = $layer_units[$i];
		}
		print $fh "\n\t// Outputs of Mem_Array ${\($i+1)} $layers_names[$i] - $layers_names[$i+1]\n";
		if(!$is_itPool){
			for($j = 1; $j <= $unit_counter; $j = $j + 1){
				print $fh "\twire [DATA_WIDTH-1:0] mem_arr${\($i+1)}_data_A_out_for_previous$j;\n";
				if($stride[$i] == 2){
					print $fh "\twire [DATA_WIDTH-1:0] mem_arr${\($i+1)}_data_B_out_for_previous$j;\n";
				}
			}
		}
		if ($is_itConvB){
			$unit_counter = 1;
		}
		else{
			$unit_counter = $layer_units[$i+1];
		}
		for($j = 1; $j <= $unit_counter; $j = $j + 1){
			print $fh "\twire [DATA_WIDTH-1:0] mem_arr${\($i+1)}_data_A_out_for_next$j;\n";
			if($stride[$i+1] == 2){
				print $fh "\twire [DATA_WIDTH-1:0] mem_arr${\($i+1)}_data_B_out_for_next$j;\n";
			}
		}
	}
}


system("perl memory_control.pl $ARGV[0]  $ARGV[1] $ARGV[6] $ARGV[7] $ARGV[8] ${\($ARGV[7] - $ARGV[8])} $ARGV[9]"); 

print $fh <<"DONATE";
	Memory_Control 
    MEM_Control
    (.clk (clk),
     .riscv_data_bus(riscv_data_bus),
     .riscv_address_bus(riscv_address_bus),
     .initialization_done(initialization_done), 
	
	
	
DONATE


chdir "./Layer";
my $top_name;
$ab_flag = 0;#false, 0 is a/ true, 1 is b
for($i = 0; $i < $layers_count; $i = $i + 1){
	if($layers_names[$i] =~ /conv/){
		if($i == 0){
			$ab_flag = $ab_flag + 1;
			#system("perl conva_first_gen.pl $ARGV[0]  $ARGV[1] $ARGV[6] $ARGV[7] $ARGV[8] ${\($ARGV[7] - $ARGV[8])} $ARGV[9]"); 
			#$module_name = "top_conva$ARGV[0]";
			$top_name = "top_conva${\($ab_flag)}";
			say $top_name;
			print $fh <<"DONATE";
	
    MEM_Control
    (.clk (clk),
     .riscv_data_bus(riscv_data_bus),
     .riscv_address_bus(riscv_address_bus),
     .initialization_done(initialization_done), 
	
	
	
DONATE
		}
		else{
			$ab_flag = $ab_flag + 1;
			if($ab_flag % 2){
				
			system("perl conva_gen.pl ${\($ab_flag)}  ${\($kernal_size[$i]*$kernal_size[$i])} $ARGV[11] $ARGV[6] $ARGV[8] $ifm_size[$i] $ifm_depth[$i] $kernal_size[$i] $filter_num[$i] $layer_units[$i]"); 
				$top_name = "top_conva${\($ab_flag)}";
				say $top_name;
				print $fh <<"DONATE";
	/////////////////$i - $top_name////////////////		
	$top_name #(.IFM_SIZE(${\(uc $layers_names[$i])}_IFM_SIZE), 
                .IFM_DEPTH(${\(uc $layers_names[$i])}_IFM_DEPTH), 
                .KERNAL_SIZE(${\(uc $layers_names[$i])}_KERNAL_SIZE), 
                .NUMBER_OF_FILTERS(${\(uc $layers_names[$i])}_NUMBER_OF_FILTERS))
    ${\($top_name)}_inst
    (
     .clk(clk),
	 .reset(reset),
	 ///////////////////////////////////////////////////////////////
	 /////////el 7ta de bta3et karim////////////////////////////////
	 .riscv_data(memControl_riscv_data),						////	
	 .riscv_address(memControl_riscv_address),					////	
	 .wm_enable_write(memControl_conva2_wm_enable_write),		////
	 .bm_enable_write(memControl_conva2_bm_enable_write), 		////
	 ///////////////////////////////////////////////////////////////
	 .ifm_sel_previous(${\($layers_names[$i])}_ifm_sel_previous),	
	 .ifm_sel_next(${\($layers_names[$i])}_ifm_sel_next),	
	 .ifm_enable_read_A_current(${\($layers_names[$i])}_ifm_enable_read_A_current),
	 .ifm_address_read_A_current(${\($layers_names[$i])}_ifm_address_read_A_current),
DONATE
				if($stride[$i] == 2){
					print $fh <<"DONATE";
	 .ifm_enable_read_B_current(${\($layers_names[$i])}_ifm_enable_read_B_current),
	 .ifm_address_read_B_current(${\($layers_names[$i])}_ifm_address_read_B_current),
				
DONATE
				}
				else{
					print $fh <<"DONATE";
	 .ifm_enable_read_B_current(),
	 .ifm_address_read_B_current(),
DONATE
				}
				for($j = 1; $j <= $layer_units[$i]; $j = $j + 1){
					print $fh "\t .data_in_A_from_previous$j(mem_arr${\($i)}_data_A_out_for_next$j),\n";
					if($stride[$i] == 2){
						print $fh "\t .data_in_B_from_previous$j(mem_arr${\($i)}_data_B_out_for_next$j),\n";
				}
			}
				print $fh <<"DONATE";
	 
	 .start_from_previous(${\($layers_names[$i-1])}_start_to_next),
	 .end_to_previous(${\($layers_names[$i])}_end_to_previous), 
	 .ready(${\($layers_names[$i])}_ready),          
	 .end_from_next(${\($layers_names[$i+1])}_end_to_previous),
	 .data_in_from_next(${\($layers_names[$i+1])}_data_out_for_previous),
	 .data_out_for_next(${\($layers_names[$i])}_data_out_for_next),
	 .ifm_enable_read_next(${\($layers_names[$i])}_ifm_enable_read_next),
	 .ifm_enable_write_next(${\($layers_names[$i])}_ifm_enable_write_next),
	 .start_to_next(${\($layers_names[$i])}_start_to_next)
    );
	
DONATE
			}
			else{
				$top_name = "top_convb${\($ab_flag)}";
				say $top_name;
				#system("perl convb_gen.pl $ARGV[0]  $ARGV[1] $ARGV[6] $ARGV[7] $ARGV[8] ${\($ARGV[7] - $ARGV[8])} $ARGV[9]"); 

			}
		}
	}
	if($layers_names[$i] =~ /pool/){
		if($ab_flag % 2){
			#system("perl top_poola.pl $ARGV[0]  $ARGV[1] $ARGV[6] $ARGV[7] $ARGV[8] ${\($ARGV[7] - $ARGV[8])} $ARGV[9]"); 
			$top_name = "top_poola${\($ab_flag)}";
				say $top_name;
		}
		else{
			#system("perl top_poolb.pl $ARGV[0]  $ARGV[1] $ARGV[6] $ARGV[7] $ARGV[8] ${\($ARGV[7] - $ARGV[8])} $ARGV[9]"); 
			$top_name = "top_poolb${\($ab_flag)}";
				say $top_name;
		}
	}
	if($layers_names[$i] =~ /fc/){
		$ab_flag = $ab_flag + 1;
		if($ab_flag % 2){
			#system("perl fca_gen.pl $ARGV[0]  $ARGV[1] $ARGV[6] $ARGV[7] $ARGV[8] ${\($ARGV[7] - $ARGV[8])} $ARGV[9]"); 

		}
		else{
			#system("perl fcb_gen.pl $ARGV[0]  $ARGV[1] $ARGV[6] $ARGV[7] $ARGV[8] ${\($ARGV[7] - $ARGV[8])} $ARGV[9]"); 

		}
	}

}




close $fh or die "Couldn't Close File : $!";
