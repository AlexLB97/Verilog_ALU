`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 03:47:36 PM
// Design Name: 
// Module Name: clock_dividertb
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


module clock_dividertb(
    );
    
    reg clock_100Mhz;
    reg reset;
    wire slow_clock;
    
    clock_divider uut (
        .clock_100Mhz(clock_100Mhz),
        .reset(reset),
        .slow_clock(slow_clock)
    ); 
     
     
    always
    begin
        reset = 0; #5;
        reset = 1; # 50;
        reset = 0; #1000000000;
    end
     
    always begin
        clock_100Mhz = 0; #5;
        clock_100Mhz = 1; #5;
    end
    
    
endmodule
