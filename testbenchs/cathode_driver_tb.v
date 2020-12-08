`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 11:23:57 AM
// Design Name: 
// Module Name: cathode_driver_tb
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


module cathode_driver_tb();


reg [1:0] anode_driver;
reg [11:0] BCD_in;
wire [3:0] LED_BCD;


cathode_driver uut (
    .anode_driver(anode_driver),
    .BCD_in(BCD_in),
    .LED_BCD(LED_BCD)
);


always begin
    anode_driver = 0; #20;
    anode_driver = 1; #20;
    anode_driver = 2; #20;
    anode_driver = 3; #20;
end


initial begin
    BCD_in = 12'b000110010101;
end

endmodule
