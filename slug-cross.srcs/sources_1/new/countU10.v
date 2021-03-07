`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 03:07:44 PM
// Design Name: 
// Module Name: countU10
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


module countU10(
    input clk,
    input Up,
    input reset,
    output [9:0] Q
    );
    
    wire UTC;
    
    countU5 counter1 (.clk(clk), .Up(Up), .reset(reset), .Q(Q[4:0]), .UTC(UTC));
    countU5 counter2 (.clk(clk), .Up(Up & UTC), .reset(reset), .Q(Q[9:5]), .UTC());
    
endmodule
