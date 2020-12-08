`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 01:36:54 PM
// Design Name: 
// Module Name: display_test
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


module clock_divider(
    input clock_100Mhz, //input clock from board
    input reset, //reset input from switch
    output slow_clock //output clock 380 Hz
);


    reg [17:0] divider_counter; //counter up to 262000, roughly 380 hz clock
    
    always @(posedge clock_100Mhz or posedge reset)
    begin
        if (reset == 1)
            divider_counter = 0;
        else
            divider_counter = divider_counter + 1;
    end

    assign slow_clock = divider_counter[17]; //Output clock is based on the 18th bit of the counter, which completes one cycle for every 262000 cycles of the 100Mhz clock
    
    
endmodule