`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 11:19:47 AM
// Design Name: 
// Module Name: cathode_driver
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


module cathode_driver(
    input [1:0] anode_driver,
    input negative,
    input [11:0] BCD_in,
    output reg [3:0] LED_BCD
    );
    
    
    always @(*)
    begin
        case(anode_driver)  //sets the output to the seven segment display to be one of three decimal digits from the BCD conversion.
            2'b00: LED_BCD = BCD_in[3:0];
            2'b01: LED_BCD = BCD_in[7:4];
            2'b10: 
            begin
                if (negative == 1) //set the third seven segment display to a negative sign if the result of the calculation is negative
                    LED_BCD = 4'b1010;
                else if (BCD_in[11:8] == 0)
                    LED_BCD = 4'b1011;
                else
                    LED_BCD = BCD_in[11:8];
            end
            2'b11: LED_BCD = 4'b1011; //The largest possible result is 961, so only three digits are needed. The fourth will always be off.

        endcase
    end
    
    
    
endmodule
