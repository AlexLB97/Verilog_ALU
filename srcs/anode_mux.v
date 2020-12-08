`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 11:11:48 AM
// Design Name: 
// Module Name: anode_mux
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


module anode_mux(
    input [1:0] anode_driver,
    output reg [3:0] anode_out
    );
    
    always @(*) //4-1 mux to  increment to drive each anode one quarter of the time. 
    begin
        case(anode_driver)
            2'b00: anode_out = 4'b1110;
            2'b01: anode_out = 4'b1101;
            2'b10: anode_out = 4'b1011;
            2'b11: anode_out = 4'b0111;
        endcase
    end
    
    
endmodule
