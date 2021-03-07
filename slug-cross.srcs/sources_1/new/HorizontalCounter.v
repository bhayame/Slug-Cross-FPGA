`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 02:38:22 PM
// Design Name: 
// Module Name: HorizontalCounter
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


module HorizontalCounter(
    input clk,
    input enable,
    output zeroDetect,
    output endDetect,
    output InActiveZone,
    output OutActiveZone,
    output reset,
    output [9:0] Q
    );
    
    countU10 counter (.clk(clk), .Up(enable), .reset(reset), .Q(Q));
    
    assign zeroDetect = Q[9] & ~Q[8] & Q[7] & ~Q[6] & ~Q[5] & ~Q[4] & Q[3] & Q[2] & Q[1] & ~Q[0];
    assign endDetect = Q[9] & ~Q[8] & Q[7] & Q[6] & Q[5] & ~Q[4] & Q[3] & Q[2] & Q[1] & ~Q[0];
    assign InActiveZone = Q[9] & Q[8] & ~Q[7] & ~Q[6] & ~Q[5] & Q[4] & Q[3] & Q[2] & Q[1] & Q[0];  
    assign OutActiveZone = Q[9] & ~Q[8] & ~Q[7] & Q[6] & Q[5] & Q[4] & Q[3] & Q[2] & Q[1] & Q[0];
    assign reset = Q[9] & Q[8] & ~Q[7] & ~Q[6] & ~Q[5] & Q[4] & Q[3] & Q[2] & Q[1] & Q[0];
endmodule
