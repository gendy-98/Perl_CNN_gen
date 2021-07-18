use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";

use POSIX;

#argumets 
#ARGV[0] no of the conv 
#ARGV[1] Mul number
#ARGV[2] DATA_WIDTH
#ARGV[3] ADDRESS_BITS
#ARGV[4] IFM_SIZE  
#ARGV[5] IFM_DEPTH 
#ARGV[6] KERNAL_SIZE  
#ARGV[7] NUMBER_OF_FILTERS
#ARGV[8] RGB
#ARGV[9]
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
my $full_path = "../../../$ARGV[9]/";
#######################################################################################
my $i = 0;
my $j = 0;
my $jj = 0;
my $file_name;
my $module_name;
my $adder_name = "adder";
my $mul_name = "multiplier";
my $odd_flag;
my $dummy_level;
my @levels;
my $levels_number;
my $dual_port_name = "true_dual_port_memory";
my $single_port_name = "single_port_memory";
my $unit_name = "unitA";
my $Relu_name = "relu";
my $accumulator_name = "accumulator"; 
$module_name = "conva$ARGV[0]_CU";

 
if($ARGV[8] == 1){#rgb
    $dummy_level = 3; 
}
else{#gray
    $dummy_level = 1; 
}


$file_name = $full_path . $module_name . ".v";
open my $fh, '>', $file_name
  or die "Can't open file : $!";
  
  print $fh <<"DONATE";
$module $module_name $parameter
    ///////////advanced parameters//////////
	$data_width 			  = $ARGV[2],
	/////////////////////////////////////
	$ifm_size               = $ARGV[4],                                                
	$ifm_depth              = $ARGV[5],
	$kernal_size            = $ARGV[6],
	$number_of_filters      = $ARGV[7],
	$number_of_units        = $dummy_level,
    ARITH_TYPE              = $ARGV[2],
	//////////////////////////////////////
	IFM_SIZE_NEXT           = IFM_SIZE - KERNAL_SIZE + 1,
	ADDRESS_SIZE_IFM        = $clog2(IFM_SIZE*IFM_SIZE),
	ADDRESS_SIZE_NEXT_IFM   = $clog2(IFM_SIZE_NEXT*IFM_SIZE_NEXT),
	ADDRESS_SIZE_WM         = $clog2( KERNAL_SIZE*KERNAL_SIZE*NUMBER_OF_FILTERS*(${\(ceil($ARGV[5]/$dummy_level))}) ),    
	ADDRESS_SIZE_BM         = $clog2(NUMBER_OF_FILTERS),												 
	FIFO_SIZE               = (KERNAL_SIZE-1)*IFM_SIZE + KERNAL_SIZE,
	NUMBER_OF_IFM           = IFM_DEPTH
)(
	input  clk,
    input  reset,
   
    input  end_from_next,
    input  start_from_previous,
    
    output reg ifm_enable_read_current,
    output reg [ADDRESS_SIZE_IFM-1:0] ifm_address_read_current,
    
    output reg wm_addr_sel,
    output reg wm_enable_read,
    output reg [ADDRESS_SIZE_WM-1:0] wm_address_read_current,
    output reg wm_fifo_enable,
    
    output reg bm_addr_sel,
    output reg bm_enable_read,
    output reg [ADDRESS_SIZE_BM-1:0] bm_address_read_current,
      
    output reg fifo_enable,
    output conv_enable,
    output ifm_enable_write_next,
    output reg [ADDRESS_SIZE_NEXT_IFM-1:0] ifm_address_write_next,
    output reg start_to_next,
    output reg ifm_sel_next,
    output ready
    
    );
	
////////////////////////Signal declaration/////////////////

 
    reg  ifm_start_counter_read_address;
    wire ifm_address_read_current_tick;
            
    reg  fifo_enable_sig1;
    reg  [$clog2(NUMBER_OF_FILTERS) - 1 : 0] filters_counter;
    wire filters_counter_tick;
    reg start_internal;
    wire start;

    
    reg mem_empty; 
    wire signal_hold;
    
    wire ifm_address_write_next_tick;
    
    
    assign start = start_from_previous | start_internal;
    
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
        state_next                     = state_reg;
        
        case(state_reg)
         
        IDLE : 
        begin
        
            ifm_enable_read_current        = 1'b0;
            ifm_start_counter_read_address = 1'b0;
    
            wm_addr_sel                    = 1'b0;
            
            bm_addr_sel                    = 1'b0;
            bm_enable_read                 = 1'b0;
      
            fifo_enable_sig1               = 1'b0;
              
            if(start_from_previous)
                state_next = READ;
      
        end                    
 
        READ : 
        begin // Read From Memory 
            ifm_enable_read_current        = 1'b1;
            ifm_start_counter_read_address = 1'b1;
    
            wm_addr_sel                    = 1'b1;
            
            bm_addr_sel                    = 1'b1;
            bm_enable_read                 = 1'b1;
            
            fifo_enable_sig1               = 1'b1;
            
            if( (signal_hold) & (~mem_empty) )
                state_next = HOLD;
            
            else if(filters_counter_tick)
                state_next = IDLE;
                    
	        else if(ifm_address_read_current_tick)
                state_next = FINISH;
            
        end
                
        FINISH : 
        begin 
            ifm_enable_read_current        = 1'b0;
            ifm_start_counter_read_address = 1'b0;
    
            wm_addr_sel                    = 1'b1;
      
            bm_addr_sel                    = 1'b1;
            bm_enable_read                 = 1'b0;
            
            fifo_enable_sig1               = 1'b0;
            
               
	        if(start)
               state_next = READ;
        end
        
        HOLD :
        begin
            ifm_enable_read_current        = 1'b0;
            ifm_start_counter_read_address = 1'b0;
    
            wm_addr_sel                    = 1'b1;
            
            bm_addr_sel                    = 1'b1;
            bm_enable_read                 = 1'b0;
            
            fifo_enable_sig1               = 1'b0;
            
            if(mem_empty)  
                state_next = READ;
        end                 
        
        endcase
    end  

    assign ready = (state_reg == IDLE);
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            ifm_sel_next <= 1'b0;
        else if(start_to_next)
            ifm_sel_next <= ~ifm_sel_next;
    end
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            ifm_address_read_current <= {ADDRESS_SIZE_IFM{1'b0}};
        else if(ifm_address_read_current == IFM_SIZE*IFM_SIZE-1)
            ifm_address_read_current <= {ADDRESS_SIZE_IFM{1'b0}};
        else if(ifm_start_counter_read_address)
            ifm_address_read_current <= (ifm_address_read_current + 1'b1);      
    end
  
    assign ifm_address_read_current_tick = (ifm_address_read_current == IFM_SIZE*IFM_SIZE-1);
    assign signal_hold = ( ifm_address_read_current == FIFO_SIZE-3 );
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            wm_enable_read <= 1'b0;
        else if(start)
            wm_enable_read <= 1'b1;
        else if( (ifm_address_read_current == KERNAL_SIZE*KERNAL_SIZE-1) | (state_reg==IDLE) )
            wm_enable_read <= 1'b0;
    end
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            wm_address_read_current <= {ADDRESS_SIZE_WM{1'b0}};
        else if(wm_enable_read)
            wm_address_read_current <= wm_address_read_current + 1'b1;
        else if(state_reg==IDLE) 
            wm_address_read_current <= {ADDRESS_SIZE_WM{1'b0}};      
    end 
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            bm_address_read_current <= {ADDRESS_SIZE_BM{1'b0}};
        else if(bm_address_read_current == (NUMBER_OF_FILTERS-1) & ifm_address_write_next_tick)
            bm_address_read_current <= {ADDRESS_SIZE_BM{1'b0}};
        else if(ifm_address_write_next_tick)
            bm_address_read_current <= bm_address_read_current + 1'b1;      
    end
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            filters_counter <= 0;
        else if( (filters_counter == (NUMBER_OF_FILTERS-1) & ifm_address_read_current_tick) )
            filters_counter <= 0;
        else if(ifm_address_read_current_tick)
            filters_counter <= filters_counter + 1'b1;
    end
    
    assign filters_counter_tick = ( filters_counter == (NUMBER_OF_FILTERS-1) & ifm_address_read_current_tick );
        
    always @(posedge clk)
    begin
        fifo_enable    <= fifo_enable_sig1;
        start_internal <= ifm_address_read_current_tick;
        wm_fifo_enable <= wm_enable_read;
    end 
    
    ///////////////////////
    // FIFO Control Unit //
    ///////////////////////
    localparam COUNTER_FIFO_SIZE      = $clog2(FIFO_SIZE);
	localparam COUNTER_READY_SIZE     = $clog2(IFM_SIZE-(KERNAL_SIZE-1));
	localparam COUNTER_NOT_READY_SIZE = $clog2(KERNAL_SIZE-1);
	
    reg start_counter_fifo;
    reg [COUNTER_FIFO_SIZE-1:0] counter_fifo;
    wire counter_fifo_tick;
    reg start_counter_ready;
    reg [COUNTER_READY_SIZE-1:0] counter_ready;
    wire counter_ready_tick;
    reg start_counter_not_ready;
    reg [COUNTER_NOT_READY_SIZE-1:0] counter_not_ready;
    wire counter_not_ready_tick;
    reg fifo_output_ready;
    
    localparam [1:0] FIFO_IDLE      = 2'b00,
                     FIFO_READY     = 2'b01,
                     FIFO_NOT_READY = 2'b10;
                     
    
    reg [1:0] fifo_state_reg, fifo_state_next;
     
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
        begin // Output READY
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
        begin // Output Not READY 
      
            fifo_output_ready       = 1'b0;
            start_counter_fifo      = 1'b0;
            start_counter_ready     = 1'b0; 
            start_counter_not_ready = 1'b1; 
            if(~fifo_enable)
                fifo_state_next = FIFO_IDLE;
            if (counter_not_ready_tick)  
                fifo_state_next = FIFO_READY;     
        end
        
        default :
        begin
            fifo_output_ready       = 1'b0;
            start_counter_fifo      = 1'b0;
            start_counter_ready     = 1'b0;
            start_counter_not_ready = 1'b0;
            fifo_state_next         = FIFO_IDLE;
        end
        
        endcase
    end
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            counter_fifo <= {COUNTER_FIFO_SIZE{1'b0}};    
        else if(counter_fifo == FIFO_SIZE-1)
            counter_fifo <= {COUNTER_FIFO_SIZE{1'b0}}; 
        else if(fifo_enable & start_counter_fifo)
            counter_fifo <= counter_fifo + 1'b1;
    end
    assign  counter_fifo_tick = (counter_fifo == FIFO_SIZE-1);
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            counter_ready <= {COUNTER_READY_SIZE{1'b0}};        
        else if(start_counter_ready)
            counter_ready <= counter_ready + 1'b1;
        else
            counter_ready <= {COUNTER_READY_SIZE{1'b0}}; 
    end
    assign  counter_ready_tick = (counter_ready == IFM_SIZE-(KERNAL_SIZE-1)-1);
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            counter_not_ready <= {COUNTER_NOT_READY_SIZE{1'b0}};

        else if(start_counter_not_ready)
            counter_not_ready <= counter_not_ready + 1'b1;
        else
            counter_not_ready <= {COUNTER_NOT_READY_SIZE{1'b0}};
    end
    assign  counter_not_ready_tick = (counter_not_ready == (KERNAL_SIZE-1)-1);
    
    assign conv_enable = fifo_output_ready;
    
    
    ////////////////////////
    // address write next //
    ////////////////////////
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            ifm_address_write_next <= {ADDRESS_SIZE_NEXT_IFM{1'b0}}; 
        else if(ifm_address_write_next == IFM_SIZE_NEXT*IFM_SIZE_NEXT-1)
            ifm_address_write_next <= {ADDRESS_SIZE_NEXT_IFM{1'b0}};      
        else if(ifm_enable_write_next)
            ifm_address_write_next <= ifm_address_write_next + 1'b1;
    end

    assign ifm_address_write_next_tick = (ifm_address_write_next == IFM_SIZE_NEXT*IFM_SIZE_NEXT-1);
        
DONATE

$dummy_level = $ARGV[1]; 



$levels_number = ceil(log($dummy_level)/log(2))  + 1;

my $delay_cycles = $levels_number;


if($ARGV[8] == 1){#rgb
    $dummy_level = 3; 
}
else{#gray
    $dummy_level = 1; 
}


$levels_number = ceil(log($dummy_level+1)/log(2));



$delay_cycles = $delay_cycles + $levels_number ;



my $signal_bits = 1;
chdir "./Modules";
system("perl delay.pl $delay_cycles $signal_bits $ARGV[9]");

my $delay_name = "delay_$delay_cycles$under_Score$signal_bits";
 
 
print $fh <<"DONATE";   

$delay_name #(.SIG_DATA_WIDTH($signal_bits), .delay_cycles($delay_cycles))
	DBlock_$delay_cycles$under_Score$signal_bits (.clk(clk), .reset(reset), 
        .Data_In(conv_enable), 
		.Data_Out(ifm_enable_write_next)
		);
		
DONATE

print $fh <<"DONATE";   
	//////////////////////////
    ////// start to next /////
    //////////////////////////

    localparam  s0   = 1'b0,
                s1   = 1'b1;	  
							  
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
                state_next2    = s0;
            end
            
            else 
            begin
                start_to_next = 1'b0;
                mem_empty     = 1'b0;
                state_next2    = s1;  
            end      
        end
        
        endcase
    end
    
endmodule
DONATE

close $fh or die "Couldn't Close File : $!";
