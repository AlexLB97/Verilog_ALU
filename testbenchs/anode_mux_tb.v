`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 11:14:25 AM
// Design Name: 
// Module Name: anode_mux_tb
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


module anode_mux_tb();



    reg [1:0] anode_driver;
    wire [3:0] anode_out;
    integer i;
    
    
    anode_mux uut (
        .anode_driver(anode_driver),
        .anode_out(anode_out)
    );
    
    
    initial begin
        for (i = 0; i < 100; i = i + 1)
        begin
            anode_driver = i;
            #20;
        end
    end

endmodule
