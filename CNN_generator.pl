

use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


my $number_of_parameters = 7*2;# param -layer_name -stride ... etc *2 -> two fields 
my $Architecture_file = 'Architecture_2.csv';
my $AdvancedParameters_file = 'AdvancedParameters_2.csv';
my @Architecture_info;
my @AdvancedParameters_info;
my @dummy_info;
my $fh;
my $i;


my $info;
open $fh, '<', $Architecture_file
  or die "Can't open file : $!";
#####################extracting the layers#########################
while($info = <$fh>){
	# Delete newline
	chomp($info);
	@dummy_info = split /,,/, $info;
	push@Architecture_info , split /,/, $dummy_info[0];
}

# Close the file
close $fh or die "Couldn't Close File : $!";
#####################extracting parameters#########################
open $fh, '<', $AdvancedParameters_file
  or die "Can't open file : $!";
#extracting the layers
while($info = <$fh>){
	# Delete newline
	chomp($info);
	@dummy_info = split /,,/, $info;
	push@AdvancedParameters_info , split /,/, $dummy_info[0];
}

# Close the file
close $fh or die "Couldn't Close File : $!";
my  $N_A = 55555;
$i = 1;
######Generic######
my $data_width = $AdvancedParameters_info[$i];
$i = $i + 2;
my $riscv_address_bus = $AdvancedParameters_info[$i];
$i = $i + 2;
my $address_bits = $AdvancedParameters_info[$i];
$i = $i + 2;
my $arith_type = $AdvancedParameters_info[$i]; ##float or fixed //ghyart di kanet $operation_type
$i = $i + 2;
my $M_Mantissa = $AdvancedParameters_info[$i];
$i = $i + 2;
my $E_Exponent = $AdvancedParameters_info[$i];
$i = $i + 2;
my $muls_convolution = $AdvancedParameters_info[$i];
$i = $i + 2;
my $divided_by = $AdvancedParameters_info[$i];
$i = $i + 2;
my $pool_size = $AdvancedParameters_info[$i];
$i = $i + 2;
my $rgb = $AdvancedParameters_info[$i];
$i = $i + 2;
my $relative_path = $AdvancedParameters_info[$i];
say $relative_path;
my $float_oldver = "float";
###################################################
####       FILES THAT WOULD RUN ONLY ONCE      ####
###################################################
chdir "./Model/Blocks";
system("perl accumulator.pl $arith_type $data_width $relative_path");
system("perl duelportmemory.pl $relative_path");
system("perl RegAccumulator.pl $data_width $arith_type $relative_path");
system("perl Register.pl $relative_path");
system("perl Relu.pl $relative_path");
system("perl singleportmemory.pl $relative_path");
chdir "../Layer/CU_DP/Modules";
system("perl convolution.pl $muls_convolution $arith_type $data_width $relative_path");
system("perl pool.pl  $pool_size  $arith_type $data_width $relative_path");
chdir "./operations";
system("perl adder.pl $arith_type $data_width $M_Mantissa $E_Exponent $relative_path");
system("perl divider.pl $arith_type $data_width $M_Mantissa $E_Exponent $divided_by $relative_path");
system("perl multiplier.pl $arith_type $data_width $M_Mantissa $E_Exponent $relative_path");
chdir "../../../..";
###################################################
#layer extraction part
my @layers;
@layers = grep(/^layer name/i, @Architecture_info); 
#to get the number of layers
my $layers_len = @layers;
my $layer_name;
my $kernal_size;
my $stride;
my $ifm_size;
my $ifm_depth;
my $number_of_filters;
my $units_number;


my @units_num_r;
my @layer_name_r;
my @kernal_size_r;
my @ifm_size_r;
my @ifm_depth_r;
my @number_of_filters_r;
my @stride_r;

my $ab_flag = 0;#false, 0 is a/ true, 1 is b

#loop to know each layer
for($i = 0; $i < $layers_len * $number_of_parameters; $i = $i + $number_of_parameters){
	$layer_name = $Architecture_info[$i + 1];
	push @layer_name_r , $layer_name;
	
	$kernal_size = $Architecture_info[$i + 3];
	push @kernal_size_r , $kernal_size;
	
	$stride = $Architecture_info[$i + 5];
	push @stride_r , $stride; 
	
	$ifm_size = $Architecture_info[$i + 7];
	push @ifm_size_r , $ifm_size;
	
	$ifm_depth = $Architecture_info[$i + 9];
	push @ifm_depth_r , $ifm_depth;
	
	$number_of_filters = $Architecture_info[$i + 11];
	push @number_of_filters_r , $number_of_filters;
	$units_number = $Architecture_info[$i + 13];
	push @units_num_r , $units_number;
	
}

$units_number = join(",", @units_num_r);
$layer_name = join(",", @layer_name_r);
$kernal_size = join(",", @kernal_size_r);
$ifm_size = join(",", @ifm_size_r);
$ifm_depth = join(",", @ifm_depth_r);
$number_of_filters = join(",", @number_of_filters_r);
$stride = join(",", @stride_r);

chdir "./Model";
system("perl top_model_generator.pl $layer_name $units_number $kernal_size $number_of_filters $ifm_size $ifm_depth $data_width $riscv_address_bus $address_bits $rgb $stride $arith_type $relative_path");

