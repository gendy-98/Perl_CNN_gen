use strict;
use warnings;
use diagnostics;
use POSIX;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

#argumets 
#ARGV[0] IFM_SIZE 14
#ARGV[1] IFM_DEPTH 3
#ARGV[2] KERNAL_SIZE 2
#ARGV[3] NUMBER_OF_UNITS 3
#ARGV[4] STRIDE 2


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
my $full_path = "../../../Verilog_files/";
#######################################################################################
my $i = 0;
my $j = 0;
my $jj = 0;
my $file_name;
my $module_name;
my $pool_unit_name = "poolb_unit";



$module_name = "poolb_cu_U$ARGV[3]";

$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
  print $fh <<"DONATE";
$module $module_name $parameter

	$ifm_size              = $ARGV[0],                                                
	$ifm_depth             = $ARGV[1],
	$kernal_size           = $ARGV[2],
	$number_of_units       = $ARGV[3],
	//////////////////////////////////////
	NUMBER_OF_IFM_NEXT      = IFM_DEPTH,
	IFM_SIZE_NEXT           = (IFM_SIZE - KERNAL_SIZE)/2 + 1,
    ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
    ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT),    
    FIFO_SIZE               = (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE
)(
	$i_p 							clk,
	$i_p 							reset,
	input start_from_previous,
    input conv_ready,
    input end_from_next,
    output reg end_to_previous,      
    output reg ifm_enable_read_A_current,
	output reg [ADDRESS_SIZE_IFM-1:0] ifm_address_read_A_current,
DONATE

if($ARGV[4] == 2){
	print $fh <<"DONATE";
	output     ifm_enable_read_B_current,
	output     [ADDRESS_SIZE_IFM-1:0] ifm_address_read_B_current,
DONATE
	
}


print $fh <<"DONATE";
	output reg fifo_enable,
    output pool_enable,
    output ifm_enable_write_next,
	output reg [ADDRESS_SIZE_NEXT_IFM-1:0] ifm_address_write_next,
	output reg start_to_next,
	output reg [$clog2(NUMBER_OF_IFM_NEXT/NUMBER_OF_UNITS+1)-1:0] ifm_sel_next
    );
       
    reg  start_ifm_address_read_current;
    wire ifm_address_read_current_tick;
    reg fifo_enable_sig1;
    wire signal_hold;
    reg mem_empty;
       
    localparam [1:0]   IDLE   = 2'b00,
                       READ   = 2'b01,
                       FINISH = 2'b10,
                       HOLD   = 2'b11;

    reg [1:0] state_reg, state_next;
              
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            state_reg <= IDLE;     
        else
            state_reg <= state_next;
    end
    
    
    always @*
    begin 
        state_next = state_reg;
        
        case(state_reg)
         
        IDLE : 
        begin
        
            ifm_enable_read_A_current      = 1'b0;
            end_to_previous                = 1'b1; 
            fifo_enable_sig1               = 1'b0;    
            start_ifm_address_read_current = 1'b0; 
                              
            if(start_from_previous)
                state_next = READ;         
        end

        READ : 
        begin 
            ifm_enable_read_A_current      = 1'b1;
            end_to_previous                = 1'b0; 
            fifo_enable_sig1               = 1'b1;    
            start_ifm_address_read_current = 1'b1;  
            
            if (signal_hold & ( ~mem_empty | ~conv_ready) )
                state_next = HOLD;
            
            if (ifm_address_read_current_tick)
                state_next = FINISH;
        end
        
        FINISH : 
        begin 
            ifm_enable_read_A_current      = 1'b0;
            end_to_previous                = 1'b1; 
            fifo_enable_sig1               = 1'b0;    
            start_ifm_address_read_current = 1'b0; 
             
            if (start_from_previous)  
                state_next = READ;                              
        end
        
        HOLD : 
        begin
            ifm_enable_read_A_current      = 1'b0;
            end_to_previous                = 1'b0; 
            fifo_enable_sig1               = 1'b0;    
            start_ifm_address_read_current = 1'b0;
            state_next                     = state_reg;
            
            if ( mem_empty & conv_ready )
                state_next = READ;
		
        end

        endcase
    end
	
	always @(posedge clk, posedge reset)
    begin
        if(reset)
            ifm_sel_next <= 0;
DONATE

#else if(ifm_sel_next == (NUMBER_OF_IFM_NEXT/NUMBER_OF_UNITS+1)-1 & start_to_next)

my $ifm_sel_next_calc = ceil($ARGV[1]/$ARGV[3]);

print $fh <<"DONATE";

		else if(ifm_sel_next == $ifm_sel_next_calc-1 & start_to_next) //$ifm_sel_next_calc = ceil((NUMBER_OF_IFM_NEXT/NUMBER_OF_UNITS))
		    ifm_sel_next <= 0;
        else if(start_to_next)
            ifm_sel_next <= ifm_sel_next + 1'b1;      
    end 
    
    always @(posedge clk)
    begin
        fifo_enable <= fifo_enable_sig1;
    end
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            ifm_address_read_A_current <= 0;
        else if(ifm_address_read_A_current == IFM_SIZE*IFM_SIZE-2)
            ifm_address_read_A_current <= 0;
        else if(start_ifm_address_read_current)
            ifm_address_read_A_current <= ifm_address_read_A_current + 2'b10;      
    end
 
	assign ifm_address_read_current_tick = (ifm_address_read_A_current == IFM_SIZE*IFM_SIZE-2);
	assign signal_hold = ( ifm_address_read_A_current == FIFO_SIZE-6 );
DONATE


if($ARGV[4] == 2){
	print $fh <<"DONATE";
	assign ifm_address_read_B_current = ifm_address_read_A_current + 1'b1;
    assign ifm_enable_read_B_current = ifm_enable_read_A_current; 
DONATE
	
}


print $fh <<"DONATE";

    
    ///////////////////////////////
    ///// FIFO control unit///////
    //////////////////////////////
    reg [$clog2(FIFO_SIZE/2):0] counter_fifo;
	reg start_counter_fifo;
    wire counter_fifo_tick;
    reg [$clog2(IFM_SIZE/2):0] counter_ready;
    reg start_counter_ready;
    wire counter_ready_tick;
    reg [$clog2((IFM_SIZE/2)+(KERNAL_SIZE/2-1)):0] counter_not_ready;
    reg start_counter_not_ready;
    wire counter_not_ready_tick;
    
    localparam [1:0] FIFO_IDLE      = 2'b00,
                     FIFO_READY     = 2'b01,
                     FIFO_NOT_READY = 2'b10;
                     
    
    reg [1:0] fifo_state_reg, fifo_state_next;
    reg fifo_output_ready;
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            fifo_state_reg <= FIFO_IDLE;       
        else
            fifo_state_reg <= fifo_state_next;
    end
    
    always @*
    begin 
        fifo_state_next = fifo_state_reg;

        case(fifo_state_reg)
         
        FIFO_IDLE : 
        begin
            fifo_output_ready       = 1'b0;
            start_counter_fifo      = 1'b1;
            start_counter_ready     = 1'b0; 
            start_counter_not_ready = 1'b0;                  
            if(counter_fifo_tick)
                fifo_state_next = FIFO_READY;      
        end
        
        FIFO_READY : 
        begin // Output FIFO_READY
            fifo_output_ready       = 1'b1;
            start_counter_fifo      = 1'b0;
            start_counter_ready     = 1'b1; 
            start_counter_not_ready = 1'b0;
            if(~fifo_enable)
                fifo_state_next = FIFO_IDLE;
            else if (counter_ready_tick)
                fifo_state_next = FIFO_NOT_READY;          
        end
        
        FIFO_NOT_READY : 
        begin // Output Not FIFO_READY 
            fifo_output_ready       = 1'b0;
            start_counter_fifo      = 1'b0;
            start_counter_ready     = 1'b0; 
            start_counter_not_ready = 1'b1; 
            if(~fifo_enable)
                fifo_state_next = FIFO_IDLE;
            else if (counter_not_ready_tick)  
                fifo_state_next = FIFO_READY;      
        end
		
		default :
		begin
			fifo_output_ready       = 1'b0;
			start_counter_fifo      = 1'b0;
            start_counter_ready     = 1'b0; 
            start_counter_not_ready = 1'b0; 
            fifo_state_next         = fifo_state_reg;
		end
        
        endcase
    end
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            counter_fifo <= 0;
        else if(counter_fifo == (FIFO_SIZE/2)-1)
	        counter_fifo <= 0;       
        else if(fifo_enable & start_counter_fifo)
            counter_fifo <= counter_fifo + 1'b1;
        
    end
    assign  counter_fifo_tick = (counter_fifo == (FIFO_SIZE/2)-1);
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            counter_ready <= 0;       
        else if(start_counter_ready)
            counter_ready <= counter_ready + 1'b1;
        else
            counter_ready <= 0;
    end
    assign  counter_ready_tick = (counter_ready == IFM_SIZE/2-1);
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            counter_not_ready <= 0;       
        else if(start_counter_not_ready)
            counter_not_ready <= counter_not_ready + 1'b1;
        else
            counter_not_ready <= 0;
    end
    assign  counter_not_ready_tick = (counter_not_ready == (IFM_SIZE/2)+(KERNAL_SIZE/2-1)-1);
    
    assign pool_enable = fifo_output_ready;
    
    ////////////////////////////////
    /////// address write next//////
    ////////////////////////////////

DONATE


print $fh <<"DONATE";
	assign ifm_address_read_B_current = ifm_address_read_A_current + 1'b1;
    assign ifm_enable_read_B_current = ifm_enable_read_A_current; 
DONATE

my $delay_cycles = log($ARGV[2]*$ARGV[2])/log(2) + 1;
my $signal_bits = 1;
chdir "./Modules";
system("perl delay.pl $delay_cycles $signal_bits");

my $delay_name = "delay_$delay_cycles$under_Score$signal_bits";
 
 
print $fh <<"DONATE";   
$delay_name #(.DATA_WIDTH($signal_bits), .delay_cycles($delay_cycles))
	DBlock_$delay_cycles$under_Score$signal_bits (.clk(clk), .reset(reset), .Data_In(pool_enable), 
		.Data_Out(ifm_enable_write_next)
		);
		
DONATE


print $fh <<"DONATE";
	always @(posedge clk, posedge reset)
    begin
        if(reset)
            ifm_address_write_next <= 0; 
        else if(ifm_address_write_next == IFM_SIZE_NEXT*IFM_SIZE_NEXT-1)
            ifm_address_write_next <= 0;      
        else if(ifm_enable_write_next)
            ifm_address_write_next <= ifm_address_write_next + 1'b1;
    end 
	
    assign ifm_address_write_next_tick = (ifm_address_write_next == IFM_SIZE_NEXT*IFM_SIZE_NEXT-1);

	////////////////////////////////
    ///////// start to next ///////
    ///////////////////////////////   
	
	localparam  s0   = 1'b0,
                s1   = 2'b1;	  
							  
    reg state_reg2, state_next2; 
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            state_reg2 <= s0;       
        else
            state_reg2 <= state_next2;
    end

    always @*
    begin     
        state_next2 = state_reg2;
        		
        case(state_reg2)
        
        s0 : 
        begin
            start_to_next = 1'b0;
            mem_empty     = 1'b1;
            if(ifm_address_write_next_tick)
                state_next2 = s1;          
        end
        
        s1 : 
        begin 

            if ( end_from_next )
            begin
                start_to_next = 1'b1;
                mem_empty     = 1'b1;
                state_next2   = s0;
            end
            
            else 
            begin
                start_to_next = 1'b0;
                mem_empty     = 1'b0;
                state_next2   = s1;  
            end      
        end
        
        endcase
    end
    
endmodule

DONATE






