`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 10:12:34 AM
// Design Name: 
// Module Name: alu_core
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


module alu_core(
    input [4:0] A,
    input clock_100Mhz,
    input reset,
    input [4:0] B,
    input [1:0] mode,
    output reg [9:0] out,
    output reg negative,
    output reg [9:0] shift_LED
    );
    
    
    reg [9:0] sum, product, diff, shift;
    
    reg [1:0] state;
    wire [1:0] nextstate;
    
    parameter S0 = 2'b00; //define states
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;
     
     
    always @(A or B)  //sequential block for setting each of the potential outputs
    begin
    sum = A + B;
    product = A * B;
    if (A < B && state == S2)
    begin
        diff = B - A;
        negative = 1;
    end
    else
    begin
        diff = A - B;
        negative = 0;
    end
    shift  = {2'b00, A[4:0], 2'b00};
    end
    
 
    //update the state based on the input from the switches on every clock cycle
    always @(posedge clock_100Mhz) //next state logic
    begin
        if (reset == 1)
            state = S0;
        else
            state = nextstate;
    end
    
    //next state is always based on the switch input
    assign nextstate = mode;
    
    
    always @(A or B or state) //4-1 mux to set output based on state
    begin   
        case(state)
            S0: 
            begin
                out = sum;
                shift_LED = 0;
            end
            S1: 
            begin
                out = product;
                shift_LED = 0;
            end
            S2: 
            begin
                out = diff;
                shift_LED = 0;
            end
            S3:
            begin
                out = A;
                shift_LED = shift;
            end
            default: out = 9'b000000000;
        endcase
    end
    
endmodule
