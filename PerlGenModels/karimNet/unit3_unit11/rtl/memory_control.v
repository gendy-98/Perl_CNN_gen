`timescale 1ns / 1ps


module 
 memory_control #(parameter
///////////advanced parameters//////////
	DATA_WIDTH 		       = 32,
///////////architecture parameters//////
	ADDRESS_BUS            = 25,                                                
    ADDRESS_BITS           = 17,
    ENABLE_BITS            = 8)

	(

    input [DATA_WIDTH-1:0] riscv_data_bus,
    input [ADDRESS_BUS-1:0] riscv_address_bus,
    input initialization_done, 
	output conva1_start,

	//1 indicates the input img is grayscale
	output [1-1:0] conva1_ifm_enable_write, 
	
	output [1-1:0] conva1_wm_enable_write,
	output [3-1:0] convb2_wm_enable_write,
	output [3-1:0] conva3_wm_enable_write,
	output [11-1:0] convb4_wm_enable_write,
	output [11-1:0] conva5_wm_enable_write,
	output [100-1:0] fc1_wm_enable_write,
	output [10-1:0] fc2_wm_enable_write,
	output conva1_bm_enable_write,
	output [3-1:0] convb2_bm_enable_write,
	output conva3_bm_enable_write,
	output [11-1:0] convb4_bm_enable_write,
	output conva5_bm_enable_write,
	output fc1_bm_enable_write,
	output fc2_bm_enable_write,
	
	output [DATA_WIDTH-1:0] riscv_data,
    output [ADDRESS_BITS-1:0] riscv_address
	);
	
	reg [159-1:0] enable_write;
    wire [ENABLE_BITS-1:0] address_enable_bits;
	
    assign riscv_data          = riscv_data_bus;
    assign riscv_address       = riscv_address_bus[ADDRESS_BITS-1:0];
    
    assign address_enable_bits = riscv_address_bus[ADDRESS_BUS-1 : ADDRESS_BUS-ENABLE_BITS];
	
	assign    conva1_start = initialization_done;
	
	
	    always @*
		begin
        case(address_enable_bits)
			8'd1  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;end
			8'd2  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010;end
			8'd3  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100;end
			8'd4  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000;end
			8'd5  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000;end
			8'd6  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000;end
			8'd7  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000;end
			8'd8  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000;end
			8'd9  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000;end
			8'd10  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000;end
			8'd11  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000;end
			8'd12  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000;end
			8'd13  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000;end
			8'd14  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000;end
			8'd15  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000;end
			8'd16  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000;end
			8'd17  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000;end
			8'd18  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000;end
			8'd19  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000;end
			8'd20  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000;end
			8'd21  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000;end
			8'd22  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000;end
			8'd23  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000;end
			8'd24  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000;end
			8'd25  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000;end
			8'd26  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000;end
			8'd27  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000;end
			8'd28  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000;end
			8'd29  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000;end
			8'd30  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000;end
			8'd31  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000;end
			8'd32  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000;end
			8'd33  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000;end
			8'd34  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000;end
			8'd35  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000;end
			8'd36  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000;end
			8'd37  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000;end
			8'd38  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000;end
			8'd39  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000;end
			8'd40  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000;end
			8'd41  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000;end
			8'd42  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000;end
			8'd43  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000;end
			8'd44  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000;end
			8'd45  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000;end
			8'd46  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000;end
			8'd47  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000;end
			8'd48  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000;end
			8'd49  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000;end
			8'd50  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000;end
			8'd51  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000;end
			8'd52  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000;end
			8'd53  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000;end
			8'd54  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000;end
			8'd55  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000;end
			8'd56  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000;end
			8'd57  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000;end
			8'd58  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000;end
			8'd59  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000;end
			8'd60  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000;end
			8'd61  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000;end
			8'd62  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000;end
			8'd63  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000;end
			8'd64  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000;end
			8'd65  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000;end
			8'd66  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000;end
			8'd67  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000;end
			8'd68  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000;end
			8'd69  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000;end
			8'd70  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd71  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd72  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd73  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd74  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd75  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd76  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd77  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd78  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd79  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd80  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd81  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd82  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd83  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd84  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd85  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd86  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd87  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd88  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd89  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd90  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd91  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd92  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd93  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd94  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd95  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd96  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd97  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd98  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd99  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd100  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd101  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd102  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd103  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd104  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd105  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd106  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd107  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd108  : begin enable_write = 159'b000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd109  : begin enable_write = 159'b000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd110  : begin enable_write = 159'b000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd111  : begin enable_write = 159'b000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd112  : begin enable_write = 159'b000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd113  : begin enable_write = 159'b000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd114  : begin enable_write = 159'b000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd115  : begin enable_write = 159'b000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd116  : begin enable_write = 159'b000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd117  : begin enable_write = 159'b000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd118  : begin enable_write = 159'b000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd119  : begin enable_write = 159'b000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd120  : begin enable_write = 159'b000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd121  : begin enable_write = 159'b000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd122  : begin enable_write = 159'b000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd123  : begin enable_write = 159'b000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd124  : begin enable_write = 159'b000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd125  : begin enable_write = 159'b000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd126  : begin enable_write = 159'b000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd127  : begin enable_write = 159'b000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd128  : begin enable_write = 159'b000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd129  : begin enable_write = 159'b000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd130  : begin enable_write = 159'b000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd131  : begin enable_write = 159'b000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd132  : begin enable_write = 159'b000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd133  : begin enable_write = 159'b000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd134  : begin enable_write = 159'b000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd135  : begin enable_write = 159'b000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd136  : begin enable_write = 159'b000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd137  : begin enable_write = 159'b000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd138  : begin enable_write = 159'b000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd139  : begin enable_write = 159'b000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd140  : begin enable_write = 159'b000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd141  : begin enable_write = 159'b000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd142  : begin enable_write = 159'b000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd143  : begin enable_write = 159'b000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd144  : begin enable_write = 159'b000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd145  : begin enable_write = 159'b000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd146  : begin enable_write = 159'b000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd147  : begin enable_write = 159'b000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd148  : begin enable_write = 159'b000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd149  : begin enable_write = 159'b000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd150  : begin enable_write = 159'b000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd151  : begin enable_write = 159'b000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd152  : begin enable_write = 159'b000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd153  : begin enable_write = 159'b000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd154  : begin enable_write = 159'b000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd155  : begin enable_write = 159'b000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd156  : begin enable_write = 159'b000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd157  : begin enable_write = 159'b001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd158  : begin enable_write = 159'b010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end
			8'd159  : begin enable_write = 159'b100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end

			default : begin enable_write = 159'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;end

		endcase
	end



assign conva1_ifm_enable_write = enable_write[158:158];

	assign conva1_wm_enable_write = enable_write[0:0];
	assign convb2_wm_enable_write = enable_write[3:1];
	assign conva3_wm_enable_write = enable_write[6:4];
	assign convb4_wm_enable_write = enable_write[17:7];
	assign conva5_wm_enable_write = enable_write[28:18];
	assign fc1_wm_enable_write = enable_write[128:29];
	assign fc2_wm_enable_write = enable_write[138:129];

	assign conva1_bm_enable_write = enable_write[139];
	assign convb2_bm_enable_write = enable_write[142:140];
	assign conva3_bm_enable_write = enable_write[143];
	assign convb4_bm_enable_write = enable_write[154:144];
	assign conva5_bm_enable_write = enable_write[155];
	assign fc1_bm_enable_write = enable_write[156];
	assign fc2_bm_enable_write = enable_write[157];
endmodule