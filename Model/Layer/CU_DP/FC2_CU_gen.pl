use strict;
use warnings;
use diagnostics;
use POSIX;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";
use POSIX;
#argumets 
#ARGV[0] DATA_WIDTH 32
#ARGV[1] IFM_DEPTH 84
#ARGV[2] FC_number 1
#ARGV[3] Is it the last FC? (1 Yes/0 No) 0
#$ARGV[4]
######################################### CONSTANTS ###################################
my $module = <<"DONATE";
`timescale 1ns / 1ps


module 
DONATE

my $FC_number = $ARGV[2];
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

my $data_width = "SIG_DATA_WIDTH";
my $address_bits = "ADDRESS_BITS";

my $ifm_size = "IFM_SIZE";                                               
my $ifm_depth = "IFM_DEPTH";
my $kernal_size = "KERNAL_SIZE";
my $number_of_filters = "NUMBER_OF_FILTERS";
my $number_of_units = "NUMBER_OF_UNITS";
my $full_path = "../../../$ARGV[4]/";
#######################################################################################
my $i = 0;
my $j = 0;
my $jj = 0;
my $file_name;
my $module_name;

$module_name = "FCB${\($FC_number)}_CU";


$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
my $signal_bits = 1;
my $delay_cycles;

if($ARGV[3] == 0){
$delay_cycles = 2;
}
else{
$delay_cycles = 3;
}

chdir "./Modules";
system("perl delay.pl $delay_cycles $signal_bits $ARGV[4]");

system("perl delay.pl 2 1 $ARGV[4]");

my $delay_name = "delay_$delay_cycles$under_Score$signal_bits";

print $fh <<"DONATE";
$module $module_name $parameter
///////////advanced parameters//////////
	$data_width              = $ARGV[0],                                                
	$ifm_depth             = $ARGV[1],
	//////////////////////////////////////
	ADDRESS_SIZE_WM = $clog2(IFM_DEPTH)
)(
	input clk,
    input reset,
    ///////////////////////////////////
    input start_from_previous,
    input end_from_next,
    output reg  end_to_previous, 
    ///////////////////////////////////
    output reg wm_addr_sel,
    output reg wm_enable_read,
    output reg [ADDRESS_SIZE_WM-1:0] wm_address_read_current,
    ///////////////////////////////////
    output bias_sel,
    output reg enable_read_current,  
    output [ ADDRESS_SIZE_WM-1:0] sel_ifm,
    output fc_output_ready,  
    output enable_write_next, 
	
DONATE
  
  if($ARGV[3] == 0){
  print $fh <<"DONATE";
	output start_to_next
    );
  
  
DONATE
  }
  else{
	print $fh <<"DONATE";
	output output_ready
    );
  
  
DONATE
  }

  print $fh <<"DONATE";
    localparam [1:0]   IDLE     = 2'b00,
                       READ     = 2'b01,
                       FINISH   = 2'b10,
                       HOLD     = 2'b11;
					   
    reg [1:0] state_reg, state_next;
    
    reg  start_wm_counter_read_address;
	wire wm_address_read_current_tick; 
	reg  bias_sel_sig;	
	
    always @(posedge clk, posedge reset)
     begin
        if(reset)
            state_reg <= IDLE;        
        else
            state_reg <= state_next;
     end
    
  always @*
  begin 
        enable_read_current           = 1'b0;  
		bias_sel_sig                  = 1'b0;
		wm_addr_sel                   = 1'b0;
        wm_enable_read                = 1'b0;
		end_to_previous               = 1'b1;        
        start_wm_counter_read_address = 1'b0;
        		
        state_next                    = state_reg;
		
        case(state_reg)
         
        IDLE : 
        begin
			enable_read_current           = 1'b0;  
			bias_sel_sig                  = 1'b1;
			wm_addr_sel                   = 1'b0;
			wm_enable_read                = 1'b0;
			end_to_previous               = 1'b1;        
			start_wm_counter_read_address = 1'b0;
                                
            if(start_from_previous)
                state_next = READ;          
        end
        READ : 
        begin  
			enable_read_current           = 1'b1;  
			bias_sel_sig                  = 1'b0;
			wm_addr_sel                   = 1'b1;
			wm_enable_read                = 1'b1;
			end_to_previous               = 1'b0;        
			start_wm_counter_read_address = 1'b1;
        
            if (wm_address_read_current_tick)
				state_next = HOLD;
        end

        HOLD :
        begin
            end_to_previous               = 1'b0;
            bias_sel_sig                  = 1'b1;
			wm_addr_sel                   = 1'b1;
			wm_enable_read                = 1'b0;
			end_to_previous               = 1'b0;        
			start_wm_counter_read_address = 1'b0;

            if(end_from_next)
                state_next = IDLE;
        end

        endcase
    end
  
  
	Register #(.DATA_WIDTH(1)) 
    R1 
    (.clk(clk),
     .reset(reset), 
     .Enable(1'b1),
     .Data_in(enable_read_current), 
     .Data_out(fc_output_ready)
    );
	
	Register #(.DATA_WIDTH(1)) 
    R2 
    (.clk(clk),
     .reset(reset), 
     .Enable(1'b1),
     .Data_in(fc_output_ready), 
     .Data_out(enable_write_next)
    );

    delay_2_1 #(.$data_width(1), .delay_cycles(2)) 
    d1
    (.clk(clk),
     .reset(reset),
     .Data_In(bias_sel_sig), 
     .Data_Out(bias_sel)
    );

DONATE

#if this is the only fc start_to_next = output_ready, delay changed from 2 to 3

if($ARGV[3] == 0){
	print $fh <<"DONATE";
    $delay_name #(.$data_width(1), .delay_cycles(2)) 
    d2
    (.clk(clk),
     .reset(reset), 
     .Data_In(wm_address_read_current_tick), 
     .Data_Out(start_to_next)
    );
DONATE
}
else{
	print $fh <<"DONATE";
    $delay_name #(.$data_width(1), .delay_cycles(3)) 
    d2
    (.clk(clk),
     .reset(reset), 
     .Data_In(wm_address_read_current_tick), 
     .Data_Out(output_ready)
    );
DONATE
}
    print $fh <<"DONATE";
	always @(posedge clk, posedge reset)
    begin
        if(reset)
            wm_address_read_current <= 0;
        else if (wm_address_read_current == (IFM_DEPTH-1) & start_wm_counter_read_address )
            wm_address_read_current <= 0;
        else if(start_wm_counter_read_address)
            wm_address_read_current <= wm_address_read_current + 1'b1;
        
    end
    assign wm_address_read_current_tick = (wm_address_read_current == (IFM_DEPTH-1) & start_wm_counter_read_address );  
	
	assign sel_ifm = wm_address_read_current;

endmodule
DONATE



close $fh or die "Couldn't Close File : $!";