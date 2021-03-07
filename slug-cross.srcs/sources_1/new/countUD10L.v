`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2018 06:44:30 PM
// Design Name: 
// Module Name: countUD10L
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


module countUD10L(
    input clk,
    input Up,
    input Dw,
    input reset,
    input LD,
    input [9:0] D,
    output [9:0] Q
    );
    
    wire UTC, DTC;
    
    countUD5L counter1 (.clkin(clk), .Up(Up), .Dw(Dw), .reset(reset), .LD(LD), .D(D[4:0]), .Q(Q[4:0]), .UTC(UTC), .DTC(DTC));
    countUD5L counter2 (.clkin(clk), .Up(Up & UTC), .Dw(Dw & DTC), .reset(reset), .LD(LD), .D(D[9:5]), .Q(Q[9:5]));
    
endmodule
