`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 10:25:06 AM
// Design Name: 
// Module Name: alu_core_tb
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


module alu_core_tb();

reg reset;
reg [4:0] A, B;
reg slow_clock;
reg [1:0] mode;
wire [9:0] out;
integer i;
wire [1:0] state;


alu_core uut (
    .A(A),
    .B(B),
    .reset(reset),
    .slow_clock(slow_clock),
    .mode(mode),
    .out(out),
    .state(state)
);

always
begin
    slow_clock = 0; #10;
    slow_clock = 1; #10;
end


always
begin
    reset = 0; #5;
    reset = 1; #50;
    reset = 0; #10000000;
end

initial begin
    for (i = 0; i < 4; i = i + 1)
    begin
        mode = i;
        A = 10;
        B = 10;
        #25;
    end
    for (i = 0; i < 4; i = i + 1)
    begin
        mode = i;
        A = 15; 
        B = 5;
        #25;
    end
    $finish;
end




endmodule
