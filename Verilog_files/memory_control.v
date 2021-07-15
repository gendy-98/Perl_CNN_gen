`timescale 1ns / 1ps


module 
 memory_control #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 		       = 32,
///////////architecture parameters//////
	ADDRESS_BUS            = 22,                                                
    ADDRESS_BITS           = 15,
    ENABLE_BITS            = 7)

	(
	input clk,
    input [DATA_WIDTH-1:0] riscv_data_bus,
    input [ADDRESS_BUS-1:0] riscv_address_bus,
    input initialization_done, 
	output conva1_start,

	//3 indicates the input img is RGB
	output [3-1:0] conva1_ifm_enable_write,
	
	output [1-1:0] conva1_wm_enable_write,
	output [3-1:0] convb2_wm_enable_write,
	output [3-1:0] conva3_wm_enable_write,
	output [1-1:0] fc1_wm_enable_write,
	output [1-1:0] fc2_wm_enable_write,
	output conva1_bm_enable_write,
	output [3-1:0] convb2_bm_enable_write,
	output conva3_bm_enable_write,
	output fc1_bm_enable_write,
	output fc2_bm_enable_write,
	
	output [DATA_WIDTH-1:0] riscv_data,
    output [ADDRESS_BITS-1:0] riscv_address
	);
	
	reg [25-1:0] enable_write;
    wire [ENABLE_BITS-1:0] address_enable_bits;
	
    assign riscv_data          = riscv_data_bus;
    assign riscv_address       = riscv_address_bus[ADDRESS_BITS-1:0];
    
    assign address_enable_bits = riscv_address_bus[ADDRESS_BUS-1 : ADDRESS_BUS-ENABLE_BITS];
	
	assign    conva1_start = initialization_done;
	
	
	    always @*
		begin
        case(address_enable_bits)
			7'd1  : begin enable_write = 25'b0000000000000000000000001;end
			7'd2  : begin enable_write = 25'b0000000000000000000000010;end
			7'd3  : begin enable_write = 25'b0000000000000000000000100;end
			7'd4  : begin enable_write = 25'b0000000000000000000001000;end
			7'd5  : begin enable_write = 25'b0000000000000000000010000;end
			7'd6  : begin enable_write = 25'b0000000000000000000100000;end
			7'd7  : begin enable_write = 25'b0000000000000000001000000;end
			7'd8  : begin enable_write = 25'b0000000000000000010000000;end
			7'd9  : begin enable_write = 25'b0000000000000000100000000;end
			7'd10  : begin enable_write = 25'b0000000000000001000000000;end
			7'd11  : begin enable_write = 25'b0000000000000010000000000;end
			7'd12  : begin enable_write = 25'b0000000000000100000000000;end
			7'd13  : begin enable_write = 25'b0000000000001000000000000;end
			7'd14  : begin enable_write = 25'b0000000000010000000000000;end
			7'd15  : begin enable_write = 25'b0000000000100000000000000;end
			7'd16  : begin enable_write = 25'b0000000001000000000000000;end
			7'd17  : begin enable_write = 25'b0000000010000000000000000;end
			7'd18  : begin enable_write = 25'b0000000100000000000000000;end
			7'd19  : begin enable_write = 25'b0000001000000000000000000;end
			7'd20  : begin enable_write = 25'b0000010000000000000000000;end
			7'd21  : begin enable_write = 25'b0000100000000000000000000;end
			7'd22  : begin enable_write = 25'b0001000000000000000000000;end
			7'd23  : begin enable_write = 25'b0010000000000000000000000;end
			7'd24  : begin enable_write = 25'b0100000000000000000000000;end
			7'd25  : begin enable_write = 25'b1000000000000000000000000;end

			default : begin enable_write = 25'b0000000000000000000000000;end

		endcase
	end



assign conva1_ifm_enable_write = enable_write[24:22];

	assign conva1_wm_enable_write = enable_write[0:0];
	assign pool1_wm_enable_write = enable_write[1:1];
	assign convb2_wm_enable_write = enable_write[4:2];
	assign pool2_wm_enable_write = enable_write[7:5];
	assign conva3_wm_enable_write = enable_write[10:8];
	assign fc1_wm_enable_write = enable_write[11:11];
	assign fc2_wm_enable_write = enable_write[12:12];

	assign conva1_bm_enable_write = enable_write[13];
	assign pool1_bm_enable_write = enable_write[14];
	assign convb2_bm_enable_write = enable_write[17:15];
	assign pool2_bm_enable_write = enable_write[18];
	assign conva3_bm_enable_write = enable_write[19];
	assign fc1_bm_enable_write = enable_write[20];
	assign fc2_bm_enable_write = enable_write[21];
endmodule