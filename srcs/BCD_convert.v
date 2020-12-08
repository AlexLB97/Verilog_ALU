`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 10:50:09 AM
// Design Name: 
// Module Name: BCD_convert
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BCD_convert(
    input [9:0] bin_in,
    output reg [11:0] BCD_out
    );
    
   
    integer i;
    
    always @(bin_in)
    begin
        BCD_out = 0;
        for (i = 0; i < 10; i = i + 1) //use a loop to shift the binary input the same number of times as it has number of bits. In this case, always 10.
        begin
        //Add 3 to any set representing a decimal output if the binary total is 5 or more to ensure proper carrying
            if (BCD_out[3:0] > 4)
                BCD_out[3:0] = BCD_out[3:0] + 3;
            if (BCD_out[7:4] > 4)
                BCD_out[7:4] = BCD_out[7:4] + 3;
            if (BCD_out[11:8] > 4)
                BCD_out[11:8] = BCD_out[11:8] + 3;
            BCD_out = {BCD_out[10:0], bin_in[9 - i]};
        end
    end
    
endmodule
