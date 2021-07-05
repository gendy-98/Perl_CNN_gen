

use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


my $number_of_parameters = 7*2;# param -layer_name -stride ... etc *2 -> two fields 
my $Architecture_file = 'Architecture.csv';
my $AdvancedParameters_file = 'AdvancedParameters.csv';
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
my $operation_type = $AdvancedParameters_info[$i]; ##float or fixed
$i = $i + 2;
my $M_Mantissa = $AdvancedParameters_info[$i];
$i = $i + 2;
my $E_Exponent = $AdvancedParameters_info[$i];
$i = $i + 2;
my $muls_convolution = $AdvancedParameters_info[$i];
######Special####



#layer extraction part
my @layers;
@layers = grep(/^layer name/i, @Architecture_info); 
#to get the number of layers
my $layers_len = @layers;
my $layer_name;
my $kernal_size;
my $stride;
my $input_size;
my $input_channels;
my $output_channels;
my $units_number;

my $ab_flag = 0;#false, 0 is a true, 1 is b

#loop to know each layer
for($i = 0; $i < $layers_len * $number_of_parameters; $i = $i + $number_of_parameters){
	$layer_name = $Architecture_info[$i + 1];
	$kernal_size = $Architecture_info[$i + 3];
	$stride = $Architecture_info[$i + 5];
	$input_size = $Architecture_info[$i + 7];
	$input_channels = $Architecture_info[$i + 9];
	$output_channels = $Architecture_info[$i + 11];
	$units_number = $Architecture_info[$i + 13];

	if($layer_name =~ /conv/){
		
		if($i == 0){
			say "my name is conva_first.pl";
			$ab_flag = $ab_flag + 1;
		}
		else{
			$ab_flag = $ab_flag + 1;
			if($ab_flag % 2){
				say "my name is conva.pl";
			}
			else{
				say "my name is convb.pl";
			}
			
		}
		#system("perl conva1.pl  $layer_name $kernal_size $stride $input_size $input_channels $output_channels");
	}
	if($layer_name =~ /pool/){
		if($ab_flag % 2){
			say "my name is poola.pl";
		}
		else{
			say "my name is poolb.pl";
		}
		#system("perl conva1.pl  $layer_name $kernal_size $stride $input_size $input_channels $output_channels");
	}
	if($layer_name =~ /fc/){
		$ab_flag = $ab_flag + 1;
		if($ab_flag % 2){
			say "my name is fca.pl";
		}
		else{
			say "my name is fcb.pl";
		}
		#system("perl conva1.pl  $layer_name $kernal_size $stride $input_size $input_channels $output_channels");
	}

}

#chdir ".."
chdir "./Model/Layer/CU_DP/Modules";
system("perl convolution.pl $N_A $muls_convolution  $operation_type $data_width $address_bits $input_size $input_channels $kernal_size $output_channels $units_number");

chdir "./operations";
system("perl adder.pl $operation_type $data_width $M_Mantissa $E_Exponent");

