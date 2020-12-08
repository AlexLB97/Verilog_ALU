`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 11:36:51 AM
// Design Name: 
// Module Name: top
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


module top(
    input [4:0] A,
    input [4:0] B,
    input [1:0] mode,
    input clock_100Mhz,
    input reset,
    output [3:0] anode_out,
    output [6:0] BCD_ssd,
    output [9:0] shift_LED
    );
    
    
    wire [9:0] out;
    wire slow_clock;
    wire [11:0] BCD_out;
    wire [1:0] anode_driver;
    wire [3:0] LED_BCD;
    wire negative;

    
    //Instantiate main ALU FSM and bring in the outputs out, Shift_LED, and negative.
    
    alu_core U5 (
        .A(A),
        .B(B),
        .mode(mode),
        .reset(reset),
        .clock_100Mhz(clock_100Mhz),
        .out(out),
        .negative(negative),
        .shift_LED(shift_LED)
    );
    
    //Convert the binary result from ALU to the 12 bit BCD_out decimal representation
    
    BCD_convert U6 (
        .bin_in(out),
        .BCD_out(BCD_out)
    );
    
    //Divide the 100Mhz clock down to 750 Hz
    
    clock_divider U1(
        .clock_100Mhz(clock_100Mhz),
        .reset(reset),
        .slow_clock(slow_clock)
        );
    
    //Use the 750 Hz clock to increment the state variable for the seven segment display
    display_driver U2(
        .slow_clock(slow_clock),
        .anode_driver(anode_driver)
    );
    
    //Multiplex between the four anodes
    anode_mux U3(
        .anode_driver(anode_driver), 
        .anode_out(anode_out)
        );
     
    //Drive the cathodes in sync with anodes    
    cathode_driver U4 (
        .anode_driver(anode_driver),
        .BCD_in(BCD_out),
        .LED_BCD(LED_BCD),
        .negative(negative)
    );
    
    ///Convert the seven segment output to the right format
    ssd_out U7(
        .LED_BCD(LED_BCD),
        .BCD_ssd(BCD_ssd)
    );
    
    
    
endmodule
