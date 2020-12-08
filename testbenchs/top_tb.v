`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 11:40:35 AM
// Design Name: 
// Module Name: top_tb
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


module top_tb();

    reg [4:0] A;
    reg [4:0] B;
    reg [1:0] mode;
    reg clock_100Mhz;
    reg reset;
    integer i;
    wire [3:0] anode_out;
    wire [6:0] BCD_ssd;


top uut (
    .A(A),
    .B(B),
    .mode(mode),
    .clock_100Mhz(clock_100Mhz),
    .reset(reset),
    .anode_out(anode_out),
    .BCD_ssd(BCD_ssd)
);


always begin
    reset = 0; #5;
    reset = 1; #20;
    reset = 0; #1000000000;
end

    
always begin
    clock_100Mhz = 0; #5;
    clock_100Mhz = 1; #5;
end

initial begin
    for (i = 0; i < 4; i = i + 1)
    begin
        mode = i;
        A = 10;
        B = 10;
        #20000000;
    end
    for (i = 0; i < 4; i = i + 1)
    begin
        mode = i;
        A = 15; 
        B = 5;
        #20000000;
    end
    $finish;
end
    
endmodule
