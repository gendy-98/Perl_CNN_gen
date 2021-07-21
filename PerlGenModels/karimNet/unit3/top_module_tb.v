`timescale 1ns / 1ps

module top_module_tb #(parameter DATA_WIDTH      = 32,
                                 ARITH_TYPE      = 0,  
                                 ADDRESS_BUS     = 25,  
                                 ADDRESS_BITS    = 17,  
                                 ENABLE_BITS     = 8   
                                 );
    localparam MEM_SIZE = 783;
	
    reg [DATA_WIDTH-1:0] input_image2 [1156-1:0];
    reg [DATA_WIDTH-1:0] input_image5 [1156-1:0];
    reg [DATA_WIDTH-1:0] input_image7 [1156-1:0];
    reg [DATA_WIDTH-1:0] input_image9 [1156-1:0];
	
	reg [DATA_WIDTH-1:0] convA1_WM1 [200-1:0];
	
    reg [DATA_WIDTH-1:0] convB2_WM1 [1200-1:0];
    reg [DATA_WIDTH-1:0] convB2_WM2 [1200-1:0];
    reg [DATA_WIDTH-1:0] convB2_WM3 [1200-1:0];
   
    reg [DATA_WIDTH-1:0] convA3_WM1 [4200-1:0];
    reg [DATA_WIDTH-1:0] convA3_WM2 [4200-1:0];
    reg [DATA_WIDTH-1:0] convA3_WM3 [4200-1:0];
	
    reg [DATA_WIDTH-1:0] convB4_WM1 [21000-1:0];
    reg [DATA_WIDTH-1:0] convB4_WM2 [21000-1:0];
    reg [DATA_WIDTH-1:0] convB4_WM3 [21000-1:0];
	
	reg [DATA_WIDTH-1:0] convA5_WM1 [120000-1:0];
    reg [DATA_WIDTH-1:0] convA5_WM2 [120000-1:0];
    reg [DATA_WIDTH-1:0] convA5_WM3 [120000-1:0];
	
    reg [DATA_WIDTH-1:0] FC1_WM [100-1:0][160-1:0];  
    reg [DATA_WIDTH-1:0] FC2_WM [10-1 :0][100-1:0];
    
    
    reg [DATA_WIDTH-1:0] convA1_BM [8-1:0];
	
    reg [DATA_WIDTH-1:0] convB2_BM [3-1:0][6-1:0];
	
    reg [DATA_WIDTH-1:0] convA3_BM [28-1:0];
	
	reg [DATA_WIDTH-1:0] convB4_BM [3-1:0][30-1:0];
	
	reg [DATA_WIDTH-1:0] convA5_BM [160-1:0];
	
    reg [DATA_WIDTH-1:0] FC1_BM [100-1:0];
    reg [DATA_WIDTH-1:0] FC2_BM [10-1:0];
    
    // Inputs
	reg clk;
	reg reset;
	reg [DATA_WIDTH-1:0] riscv_data_bus;
	reg [ADDRESS_BUS-1:0] riscv_address_bus;
	reg initialization_done;
    
	// Outputs
	wire [DATA_WIDTH-1:0] Data_out_1_final; 
    wire [DATA_WIDTH-1:0] Data_out_2_final; 
    wire [DATA_WIDTH-1:0] Data_out_3_final; 
    wire [DATA_WIDTH-1:0] Data_out_4_final; 
    wire [DATA_WIDTH-1:0] Data_out_5_final; 
    wire [DATA_WIDTH-1:0] Data_out_6_final; 
    wire [DATA_WIDTH-1:0] Data_out_7_final; 
    wire [DATA_WIDTH-1:0] Data_out_8_final; 
    wire [DATA_WIDTH-1:0] Data_out_9_final; 
    wire [DATA_WIDTH-1:0] Data_out_10_final;
    wire ready;
    wire output_ready;                   

    ///////////////////////////////////////////
	///Instantiate the Unit Under Test (UUT)///
	///////////////////////////////////////////
	top_module  #(.DATA_WIDTH(DATA_WIDTH), .ARITH_TYPE(ARITH_TYPE))
        uut
        (
		.clk(clk), 
		.reset(reset), 
		.riscv_data_bus(riscv_data_bus), 
		.riscv_address_bus(riscv_address_bus),
		.initialization_done(initialization_done),
		.Data_out_1_final(Data_out_1_final), 
        .Data_out_2_final(Data_out_2_final), 
        .Data_out_3_final(Data_out_3_final), 
        .Data_out_4_final(Data_out_4_final), 
        .Data_out_5_final(Data_out_5_final), 
        .Data_out_6_final(Data_out_6_final), 
        .Data_out_7_final(Data_out_7_final), 
        .Data_out_8_final(Data_out_8_final), 
        .Data_out_9_final(Data_out_9_final), 
        .Data_out_10_final(Data_out_10_final),
        .ready(ready),
        .output_ready(output_ready)                    
	);
	
	always #5 clk = ~clk;

    integer i,j;
    localparam output_file = "files/output/hard/dec/output_file_dec.txt";
    integer output_file_id;
    
    
	initial 
	begin
	
	   output_file_id = $fopen(output_file,"w");
	   
	   if(~output_file_id)
	          $display("failed1");
       if (ARITH_TYPE )
       begin
       $readmemb("extraction/input/image_4979_fixed.txt",input_image2);
	   $readmemb("extraction/input/image_img_151_fixed.txt",input_image5);
	   $readmemb("extraction/input/image_5273_fixed.txt",input_image7);
	   $readmemb("extraction/input/image_4977_fixed.txt",input_image9);
	   
	   $readmemb("extraction/memory/memory_fixed/layer_1_mem_0.txt",convA1_WM1);
	            
	   $readmemb("extraction/memory/memory_fixed/layer_2_mem_0.txt",convB2_WM1);
	   $readmemb("extraction/memory/memory_fixed/layer_2_mem_1.txt",convB2_WM2);
	   $readmemb("extraction/memory/memory_fixed/layer_2_mem_2.txt",convB2_WM3);
	             
	   $readmemb("extraction/memory/memory_fixed/layer_3_mem_0.txt",convA3_WM1);
	   $readmemb("extraction/memory/memory_fixed/layer_3_mem_1.txt",convA3_WM2);
       $readmemb("extraction/memory/memory_fixed/layer_3_mem_2.txt",convA3_WM3);
       
       $readmemb("extraction/memory/memory_fixed/layer_4_mem_0.txt",convB4_WM1);
       $readmemb("extraction/memory/memory_fixed/layer_4_mem_1.txt",convB4_WM2);
	   $readmemb("extraction/memory/memory_fixed/layer_4_mem_2.txt",convB4_WM3);
	   
	   $readmemb("extraction/memory/memory_fixed/layer_5_mem_0.txt",convA5_WM1);
	   $readmemb("extraction/memory/memory_fixed/layer_5_mem_1.txt",convA5_WM2);
       $readmemb("extraction/memory/memory_fixed/layer_5_mem_2.txt",convA5_WM3);
	   
	   $readmemb("extraction/memory/memory_fixed/layer_6_mem.txt",FC1_WM);
	   $readmemb("extraction/memory/memory_fixed/layer_7_mem.txt",FC2_WM);
                  
	   $readmemb("extraction/memory/memory_fixed/layer_1_mem_bias.txt",convA1_BM);
	   $readmemb("extraction/memory/memory_fixed/layer_2_mem_bias.txt",convB2_BM);
	   $readmemb("extraction/memory/memory_fixed/layer_3_mem_bias.txt",convA3_BM);
	   $readmemb("extraction/memory/memory_fixed/layer_4_mem_bias.txt",convB4_BM);
	   $readmemb("extraction/memory/memory_fixed/layer_5_mem_bias.txt",convA5_BM);
	   $readmemb("extraction/memory/memory_fixed/layer_6_mem_bias.txt",FC1_BM);
	   $readmemb("extraction/memory/memory_fixed/layer_7_mem_bias.txt",FC2_BM);
	   
	  end
	  
	  else 
	  begin 
	   
	   $readmemb("extraction/input/image_4979_float.txt",input_image2);
	   $readmemb("extraction/input/image_img_151_float.txt",input_image5);
	   $readmemb("extraction/input/image_5273_float.txt",input_image7);
	   $readmemb("extraction/input/image_4977_float.txt",input_image9);

       $readmemb("extraction/memory/memory_float/layer_1_mem_0.txt",convA1_WM1);
	            
	   $readmemb("extraction/memory/memory_float/layer_2_mem_0.txt",convB2_WM1);
	   $readmemb("extraction/memory/memory_float/layer_2_mem_1.txt",convB2_WM2);
	   $readmemb("extraction/memory/memory_float/layer_2_mem_2.txt",convB2_WM3);
	             
	   $readmemb("extraction/memory/memory_float/layer_3_mem_0.txt",convA3_WM1);
	   $readmemb("extraction/memory/memory_float/layer_3_mem_1.txt",convA3_WM2);
       $readmemb("extraction/memory/memory_float/layer_3_mem_2.txt",convA3_WM3);
       
       $readmemb("extraction/memory/memory_float/layer_4_mem_0.txt",convB4_WM1);
       $readmemb("extraction/memory/memory_float/layer_4_mem_1.txt",convB4_WM2);
	   $readmemb("extraction/memory/memory_float/layer_4_mem_2.txt",convB4_WM3);
	   
	   $readmemb("extraction/memory/memory_float/layer_5_mem_0.txt",convA5_WM1);
	   $readmemb("extraction/memory/memory_float/layer_5_mem_1.txt",convA5_WM2);
       $readmemb("extraction/memory/memory_float/layer_5_mem_2.txt",convA5_WM3);
	   
	   $readmemb("extraction/memory/memory_float/layer_6_mem.txt",FC1_WM);
	   $readmemb("extraction/memory/memory_float/layer_7_mem.txt",FC2_WM);
                  
	   $readmemb("extraction/memory/memory_float/layer_1_mem_bias.txt",convA1_BM);
	   $readmemb("extraction/memory/memory_float/layer_2_mem_bias.txt",convB2_BM);
	   $readmemb("extraction/memory/memory_float/layer_3_mem_bias.txt",convA3_BM);
	   $readmemb("extraction/memory/memory_float/layer_4_mem_bias.txt",convB4_BM);
	   $readmemb("extraction/memory/memory_float/layer_5_mem_bias.txt",convA5_BM);
	   $readmemb("extraction/memory/memory_float/layer_6_mem_bias.txt",FC1_BM);
	   $readmemb("extraction/memory/memory_float/layer_7_mem_bias.txt",FC2_BM);
	   
	   end
	// Initialize Inputs
	
	clk = 0;
	reset = 1;
	riscv_data_bus = 0;
	initialization_done = 0;
	riscv_address_bus = 25'b00000001_00000000000000000;

    @(negedge clk);
    reset = 0;

////////////////////////////////////////////////////////////////////////////////   
////////////////////////////// ConvA1 WM ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////   
    
    // convA1_WM1
    for(j = 0; j < 200 ; j = j + 1)
    begin
        riscv_data_bus=convA1_WM1[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;
            
    end           
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000;          

   
    
////////////////////////////////////////////////////////////////////////////////   
/////////////////////////////// ConvB2 WM //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
       
    // convB_WM1
    for(j = 0; j < 1200 ; j = j + 1)
    begin   
        riscv_data_bus    = convB2_WM1[j];
       @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000;   
    
    // convB_WM2
    for(j = 0; j < 1200 ; j = j + 1)
    begin   
        riscv_data_bus    = convB2_WM2[j];
       @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000;
    
    // convB_WM3
    for(j = 0; j < 1200 ; j = j + 1)
    begin   
        riscv_data_bus    = convB2_WM3[j];
       @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000;    

		
////////////////////////////////////////////////////////////////////////////////   
////////////////////////////// ConvA3 WM ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

    // convA3_WM1
    for(j = 0; j < 4200 ; j = j + 1)
    begin
         riscv_data_bus   = convA3_WM1[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;      
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000; 
        
    // convA3_WM2
    for(j = 0; j < 4200 ; j = j + 1)
    begin
         riscv_data_bus   = convA3_WM2[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;      
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000; 
              
	// convA3_WM3
    for(j = 0; j < 4200 ; j = j + 1)
    begin
         riscv_data_bus   = convA3_WM1[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;      
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000; 
        
////////////////////////////////////////////////////////////////////////////////   
////////////////////////////// ConvB4 WM ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

    // convB4_WM1
    for(j = 0; j < 21000 ; j = j + 1)
    begin
         riscv_data_bus   = convB4_WM1[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;      
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000; 
        
    // convB4_WM2
    for(j = 0; j < 21000 ; j = j + 1)
    begin
         riscv_data_bus   = convB4_WM2[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;      
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000; 
              
	// convB4_WM3
    for(j = 0; j < 21000 ; j = j + 1)
    begin
         riscv_data_bus   = convB4_WM1[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;      
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000; 
        
////////////////////////////////////////////////////////////////////////////////   
////////////////////////////// ConvA5 WM ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

    // convA5_WM1
    for(j = 0; j < 120000 ; j = j + 1)
    begin
         riscv_data_bus   = convA5_WM1[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;      
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000; 
        
    // convA5_WM2
    for(j = 0; j < 120000 ; j = j + 1)
    begin
         riscv_data_bus   = convA5_WM2[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;      
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000; 
              
	// convA5_WM3
    for(j = 0; j < 120000 ; j = j + 1)
    begin
         riscv_data_bus   = convA5_WM1[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;      
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000; 
        		  
////////////////////////////////////////////////////////////////////////////////   
//////////////////////////////// FC 1 WM ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
    for(i = 0; i < 100 ; i = i + 1)
    begin
        for(j = 0; j < 160 ; j = j + 1)
        begin
            riscv_data_bus    = FC1_WM[i][j];
            @(negedge clk);
            riscv_address_bus = riscv_address_bus + 1;  
        end        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000;            
    end  
   
////////////////////////////////////////////////////////////////////////////////   
//////////////////////////////// FC 2 WM ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
    for(i = 0; i < 10 ; i = i + 1)
    begin
        for(j = 0; j < 100 ; j = j + 1)
        begin
            riscv_data_bus    = FC2_WM[i][j];
            @(negedge clk);
            riscv_address_bus = riscv_address_bus + 1;        
        end 
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000;            
    end  
   
////////////////////////////////////////////////////////////////////////////////   
////////////////////////////// ConvA1 BM ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
   
    for(j = 0; j < 8 ; j = j + 1)
    begin
        riscv_data_bus    = convA1_BM[j];
        @(negedge clk);        
        riscv_address_bus = riscv_address_bus + 1;
    end
                   
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000;            

////////////////////////////////////////////////////////////////////////////////   
////////////////////////////// ConvB2 BM ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
            
    for(i = 0; i < 3 ; i = i + 1)
    begin   
        for(j = 0; j < 6 ; j = j + 1)
        begin     
            riscv_data_bus    = convB2_BM[i][j];
            @(negedge clk);
            riscv_address_bus = riscv_address_bus + 1;
        end 
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000;        
    end

////////////////////////////////////////////////////////////////////////////////   
////////////////////////////// ConvA3 BM ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
     
    for(j = 0; j < 28 ; j = j + 1)
    begin
        riscv_data_bus    = convA3_BM[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;           
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000;

////////////////////////////////////////////////////////////////////////////////   
////////////////////////////// ConvB4 BM ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
      
    for(i = 0; i < 3 ; i = i + 1)
    begin   
        for(j = 0; j < 30 ; j = j + 1)
        begin     
            riscv_data_bus    = convB4_BM[i][j];
            @(negedge clk);
            riscv_address_bus = riscv_address_bus + 1;
        end 
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000;        
    end

////////////////////////////////////////////////////////////////////////////////   
////////////////////////////// ConvA5 BM ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
     
    for(j = 0; j < 160 ; j = j + 1)
    begin
        riscv_data_bus    = convA5_BM[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;           
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000;          
      
////////////////////////////////////////////////////////////////////////////////   
///////////////////////////////// FC1 BM ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
      
    for(j = 0; j < 100 ; j = j + 1)
    begin
       
        riscv_data_bus    = FC1_BM[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;   
    end 
        
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000;        
    
////////////////////////////////////////////////////////////////////////////////   
///////////////////////////////// FC2 BM ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
  
    for(j = 0; j < 10 ; j = j + 1)
    begin       
        riscv_data_bus    = FC2_BM[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;       
    end 
       
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
        riscv_address_bus = riscv_address_bus + 25'b00000001_00000000000000000;   


////////////////////////////////////////
//////////////// IFM ///////////////////
////////////////////////////////////////      
         
    for(j = 0; j < 1156 ; j = j + 1)
    begin
        riscv_data_bus    = input_image2[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;       
    end 
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
    
    initialization_done = 1'b1;
    
    @(negedge clk)
    initialization_done = 1'b0;

////////////////////////////////////////
//////////////// IFM ///////////////////
////////////////////////////////////////      
   
    @(posedge ready)
        
    for(j = 0; j < 1156 ; j = j + 1)
    begin
        riscv_data_bus    = input_image9[j];
        @(negedge clk);
        riscv_address_bus = riscv_address_bus + 1;       
    end 
        riscv_address_bus = riscv_address_bus & 25'b11111111_00000000000000000;
    
    initialization_done = 1'b1;
    
    @(negedge clk)
    initialization_done = 1'b0;      

end


initial begin  
///////////////////////////////////////////////////////////////
////////////////// Output File ////////////////////////////////
///////////////////////////////////////////////////////////////
    @(negedge reset)
    
    @(negedge output_ready)
    
  /*  $fwrite(output_file_id, "%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n\n" , $bitstoshortreal(Data_out_1_final)
                                                                     , $bitstoshortreal(Data_out_2_final)
                                                                     , $bitstoshortreal(Data_out_3_final)
                                                                     , $bitstoshortreal(Data_out_4_final)
                                                                     , $bitstoshortreal(Data_out_5_final)
                                                                     , $bitstoshortreal(Data_out_6_final)
                                                                     , $bitstoshortreal(Data_out_7_final)
                                                                     , $bitstoshortreal(Data_out_8_final)
                                                                     , $bitstoshortreal(Data_out_9_final)
                                                                     , $bitstoshortreal(Data_out_10_final)
                                                                     );*/
   @(negedge output_ready);
    
  /*  $fwrite(output_file_id, "%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n\n" , $bitstoshortreal(Data_out_1_final)
                                                                     , $bitstoshortreal(Data_out_2_final)
                                                                     , $bitstoshortreal(Data_out_3_final)
                                                                     , $bitstoshortreal(Data_out_4_final)
                                                                     , $bitstoshortreal(Data_out_5_final)
                                                                     , $bitstoshortreal(Data_out_6_final)
                                                                     , $bitstoshortreal(Data_out_7_final)
                                                                     , $bitstoshortreal(Data_out_8_final)
                                                                     , $bitstoshortreal(Data_out_9_final)
                                                                     , $bitstoshortreal(Data_out_10_final)
                                                                     ); */
$fclose(output_file_id);
$finish;
           
end       
 
 
endmodule