use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


#argumets 
#ARGV[0] data_width 32
#ARGV[1] M - Mantissa, precision
#ARGV[2] E - Exponent, integer bits
#$ARGV[3]
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
my $data_width = "DATA_WIDTH";
my $end = "end";
my $end_module = "endmodule";
my $i_p = "input";
my $o_p = "output";
my $under_Score = "_";
my $full_path = "../../../../../$ARGV[3]/";
#######################################################################################
my $i = 0;

my $file_name;
my $module_name = "floating_point_adder";
my $arith_type = "ARITH_TYPE";



$file_name = $full_path . $module_name . ".v";

open my $fh, '>', $file_name
  or die "Can't open file : $!";


print $fh <<"DONATE";
$module $module_name $parameter
	$data_width = $ARGV[0],
	E = $ARGV[2], 
	M = $ARGV[1] )
    (
    input [DATA_WIDTH-1:0] in1,
    input [DATA_WIDTH-1:0] in2,
    output [DATA_WIDTH-1:0] out
    );
 
    wire sign1,sign2,signOUT;
    wire [E-1:0] Exponent1,Exponent2;
    wire [M-1:0] Mantissa1,Mantissa2; 
    
    wire [M:0] MantissaUnNORMALIZED1;
    wire [M:0] MantissaUnNORMALIZED2;
    
    wire [2*M+1:0] MantissaUnNORMALIZED1SHIFTED;
    wire [2*M+1:0] MantissaUnNORMALIZED2SHIFTED;
    wire [2*M+1:0] MantissaUnNORMALIZEDOut;
    
    wire [E-1:0] Difference;
    wire [E-1:0] LargerExponent;
    wire N1_larger;
    
    assign sign1 = in1[DATA_WIDTH-1];
    assign sign2 = in2[DATA_WIDTH-1];
    assign Exponent1 = in1[DATA_WIDTH-2:DATA_WIDTH-E-1];
    assign Exponent2 = in2[DATA_WIDTH-2:DATA_WIDTH-E-1];
    assign Mantissa1 = in1[M-1:0];
    assign Mantissa2 = in2[M-1:0];
    
    assign MantissaUnNORMALIZED1 = {1'b1 , in1[M-1:0]};
    assign MantissaUnNORMALIZED2 = {1'b1 , in2[M-1:0]};
    
    assign LargerExponent = (Exponent1 > Exponent2) ? Exponent1 : Exponent2;
    
    // Determine which of A, B is larger
    assign N1_larger =    (Exponent1 > Exponent2)        ? 1'b1  :
        ((Exponent1 == Exponent2) && (MantissaUnNORMALIZED1 > MantissaUnNORMALIZED2)) ? 1'b1 : 1'b0;
        
    assign Difference = (Exponent1 < Exponent2) ? (Exponent2 - Exponent1) :  (Exponent1 - Exponent2);
    
    
    //UNPARAMETRIZED
    assign MantissaUnNORMALIZED2SHIFTED = (N1_larger)? {1'b0, MantissaUnNORMALIZED2, 23'b0} >> Difference : {1'b0, MantissaUnNORMALIZED2, 23'b0};
    
    assign MantissaUnNORMALIZED1SHIFTED = (~N1_larger)? {1'b0, MantissaUnNORMALIZED1, 23'b0} >> Difference : {1'b0, MantissaUnNORMALIZED1, 23'b0};
    
    
    assign MantissaUnNORMALIZEDOut = ((sign1^sign2) &  N1_larger) ? MantissaUnNORMALIZED1SHIFTED - MantissaUnNORMALIZED2SHIFTED :
        ((sign1^sign2) & ~N1_larger) ? MantissaUnNORMALIZED2SHIFTED - MantissaUnNORMALIZED1SHIFTED :
        MantissaUnNORMALIZED1SHIFTED + MantissaUnNORMALIZED2SHIFTED;
    
    wire [7:0]  shft_amt;
    assign shft_amt = MantissaUnNORMALIZEDOut[47] ? 8'd0  : MantissaUnNORMALIZEDOut[46] ? 8'd1  :
                      MantissaUnNORMALIZEDOut[45] ? 8'd2  : MantissaUnNORMALIZEDOut[44] ? 8'd3  :
                      MantissaUnNORMALIZEDOut[43] ? 8'd4  : MantissaUnNORMALIZEDOut[42] ? 8'd5  :
                      MantissaUnNORMALIZEDOut[41] ? 8'd6  : MantissaUnNORMALIZEDOut[40] ? 8'd7  :
                      MantissaUnNORMALIZEDOut[39] ? 8'd8  : MantissaUnNORMALIZEDOut[38] ? 8'd9  :
                      MantissaUnNORMALIZEDOut[37] ? 8'd10 : MantissaUnNORMALIZEDOut[36] ? 8'd11 :
                      MantissaUnNORMALIZEDOut[35] ? 8'd12 : MantissaUnNORMALIZEDOut[34] ? 8'd13 :
                      MantissaUnNORMALIZEDOut[33] ? 8'd14 : MantissaUnNORMALIZEDOut[32] ? 8'd15 :
                      MantissaUnNORMALIZEDOut[31] ? 8'd16 : MantissaUnNORMALIZEDOut[30] ? 8'd17 :
                      MantissaUnNORMALIZEDOut[29] ? 8'd18 : MantissaUnNORMALIZEDOut[28] ? 8'd19 :
                      MantissaUnNORMALIZEDOut[27] ? 8'd20 : MantissaUnNORMALIZEDOut[26] ? 8'd21 :
                      MantissaUnNORMALIZEDOut[25] ? 8'd22 : MantissaUnNORMALIZEDOut[24] ? 8'd23 :
                      MantissaUnNORMALIZEDOut[23] ? 8'd24 : MantissaUnNORMALIZEDOut[22] ? 8'd25 :
                      MantissaUnNORMALIZEDOut[21] ? 8'd26 : MantissaUnNORMALIZEDOut[20] ? 8'd27 :
                      MantissaUnNORMALIZEDOut[19] ? 8'd28 : MantissaUnNORMALIZEDOut[18] ? 8'd29 :
                      MantissaUnNORMALIZEDOut[17] ? 8'd30 : MantissaUnNORMALIZEDOut[16] ? 8'd31 :
                      MantissaUnNORMALIZEDOut[15] ? 8'd32 : MantissaUnNORMALIZEDOut[14] ? 8'd33 :
                      MantissaUnNORMALIZEDOut[13] ? 8'd34 : MantissaUnNORMALIZEDOut[12] ? 8'd35 :
                      MantissaUnNORMALIZEDOut[11] ? 8'd36 : MantissaUnNORMALIZEDOut[10] ? 8'd37 :
                      MantissaUnNORMALIZEDOut[9]  ? 8'd38 : MantissaUnNORMALIZEDOut[8]  ? 8'd39 :
                      MantissaUnNORMALIZEDOut[7]  ? 8'd40 : MantissaUnNORMALIZEDOut[6]  ? 8'd41 :
                      MantissaUnNORMALIZEDOut[5]  ? 8'd42 : MantissaUnNORMALIZEDOut[4]  ? 8'd43 :
                      MantissaUnNORMALIZEDOut[3]  ? 8'd44 : MantissaUnNORMALIZEDOut[2]  ? 8'd45 :
                      MantissaUnNORMALIZEDOut[1]  ? 8'd46 : MantissaUnNORMALIZEDOut[0]  ? 8'd47 :
                                                    8'd48;
                                                
                                                
    wire [3*M+1:0] OutShifted;
    wire [M-1:0] LastOut;
    assign OutShifted = {MantissaUnNORMALIZEDOut, 23'b0} << (shft_amt+1);
    assign LastOut = OutShifted [3*M+1:2*M+2];
    wire [E-1:0] LastExpOut;
    assign LastExpOut = LargerExponent - shft_amt + 8'b1;
    assign signOUT = (N1_larger)? sign1 : sign2;
    
    
    assign out = {signOUT, LastExpOut, LastOut};
    
endmodule

DONATE


close $fh or die "Couldn't Close File : $!";
