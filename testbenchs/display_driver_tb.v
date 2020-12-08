`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 10:05:16 AM
// Design Name: 
// Module Name: display_driver_tb
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


module display_driver_tb();

reg slow_clock;
wire [1:0] anode_driver;


display_driver uut (
    .slow_clock(slow_clock),
    .anode_driver(anode_driver)
);

    always
    begin
        slow_clock = 0; #100000;
        slow_clock = 1; #100000;
    end


endmodule
