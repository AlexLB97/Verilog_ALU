`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 10:03:30 AM
// Design Name: 
// Module Name: display_driver
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


module display_driver(
    input slow_clock,
    output reg [1:0] anode_driver // driver to cycle through 4 states
    );
    
    always @(posedge slow_clock)
    begin
    //increment the anode driver on each edge of slow clock
        anode_driver = anode_driver + 1;
    end
    
endmodule
