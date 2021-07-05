

use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


my $number_of_parameters = 6*2;
my $config_file = 'Book1.csv';
my @config_info;
my @dummy_info;

my $info;
open my $fh, '<', $config_file
  or die "Can't open file : $!";

while($info = <$fh>){
	# Delete newline
	chomp($info);
	@dummy_info = split /,,/, $info;
	push@config_info , split /,/, $dummy_info[0];
  
}

# Close the file
close $fh or die "Couldn't Close File : $!";


my @layers;
@layers = grep(/^layer name/i, @config_info); 



my $layers_len = @layers;
my $i;


my $layer_name;
my $kernal_size;
my $stride;
my $input_size;
my $input_channels;
my $output_channels;

for($i = 0; $i < $layers_len * $number_of_parameters; $i = $i + $number_of_parameters){
	$layer_name = $config_info[$i + 1];
	$kernal_size = $config_info[$i + 3];
	$stride = $config_info[$i + 5];
	$input_size = $config_info[$i + 7];
	$input_channels = $config_info[$i + 9];
	$output_channels = $config_info[$i + 11];
	

	if($layer_name eq 'conva1'){
		say "my name";
		#system("perl conva1.pl  $layer_name $kernal_size $stride $input_size $input_channels $output_channels");
	}
	if($layer_name eq 'pool1'){
		#system("perl conva1.pl  $layer_name $kernal_size $stride $input_size $input_channels $output_channels");
	}
	if($layer_name eq 'convb'){
		#system("perl conva1.pl  $layer_name $kernal_size $stride $input_size $input_channels $output_channels");
	}

}














my $test_file = 'habal_txt/test.txt';

open $fh, '>', $test_file
  or die "Can't open file : $!";
 

print $fh join ("\n",@config_info);
# Close the file
close $fh or die "Couldn't Close File : $!";
