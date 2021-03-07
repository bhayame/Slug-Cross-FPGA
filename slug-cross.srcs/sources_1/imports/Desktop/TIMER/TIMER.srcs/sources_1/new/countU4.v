`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2018 06:09:53 PM
// Design Name: 
// Module Name: secondTicker
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


module countU4(
    input clk,
    input CE,
    input reset,
    output [3:0] Q,
    output UTC
    );
        
    
    FDRE #(.INIT(1'b0)) ff0 (.C(clk), .R(reset), .CE(CE), .D(~Q[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) ff1 (.C(clk), .R(reset), .CE(CE & Q[0]), .D(~Q[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) ff2 (.C(clk), .R(reset), .CE(CE & Q[0] & Q[1]), .D(~Q[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) ff3 (.C(clk), .R(reset), .CE(CE & Q[0] & Q[1] & Q[2]), .D(~Q[3]), .Q(Q[3]));     
    
    assign UTC = Q[3] & ~Q[2] & ~Q[1] & Q[0];
       
endmodule
