`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2018 10:37:10 PM
// Design Name: 
// Module Name: countUD5L
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


module countU5(
    input clk,
    input Up,
    input reset,
    output [4:0] Q,
    output UTC
    );
    
    wire d0, d1, d2, d3, d4;
    
    FDRE #(.INIT(1'b0) ) ff0 (.C(clk), .R(reset), .CE(Up), .D(~Q[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0) ) ff1 (.C(clk), .R(reset), .CE(Up & Q[0]), .D(~Q[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0) ) ff2 (.C(clk), .R(reset), .CE(Up & Q[0] & Q[1]), .D(~Q[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0) ) ff3 (.C(clk), .R(reset), .CE(Up & Q[0] & Q[1] & Q[2]), .D(~Q[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b0) ) ff4 (.C(clk), .R(reset), .CE(Up & Q[0] & Q[1] & Q[2] & Q[3]), .D(~Q[4]), .Q(Q[4]));
      
    assign UTC = Q[0] & Q[1] & Q[2] & Q[3] & Q[4];
endmodule
