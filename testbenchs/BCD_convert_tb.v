`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 10:56:32 AM
// Design Name: 
// Module Name: BCD_convert_tb
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


module BCD_convert_tb();


    reg [9:0] bin_in;
    wire [3:0] hun, ten, one;
    
    
    BCD_convert uut (
        .bin_in(bin_in),
        .hun(hun),
        .ten(ten),
        .one(one)
    );
    
    
    initial begin
        bin_in = 45; #100;
        bin_in = 5; #100
        bin_in = 125; #100;
    end
endmodule
