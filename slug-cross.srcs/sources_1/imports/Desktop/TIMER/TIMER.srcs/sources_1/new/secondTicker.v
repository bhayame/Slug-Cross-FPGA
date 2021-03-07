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


module secondTicker(
    input clk,
    input frame,
    input reset,
    output sec
    );
    
    wire [5:0] Q;
    
    FDRE #(.INIT(1'b0) ) ff0 (.C(clk), .R(reset), .CE(frame), .D(~Q[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0) ) ff1 (.C(clk), .R(reset), .CE(frame & Q[0]), .D(~Q[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0) ) ff2 (.C(clk), .R(reset), .CE(frame & Q[0] & Q[1]), .D(~Q[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0) ) ff3 (.C(clk), .R(reset), .CE(frame & Q[0] & Q[1] & Q[2]), .D(~Q[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b0) ) ff4 (.C(clk), .R(reset), .CE(frame & Q[0] & Q[1] & Q[2] & Q[3]), .D(~Q[4]), .Q(Q[4]));
    FDRE #(.INIT(1'b0) ) ff5 (.C(clk), .R(reset), .CE(frame & Q[0] & Q[1] & Q[2] & Q[3] & Q[4]), .D(~Q[5]), .Q(Q[5]));
    
    assign sec = Q[5] & Q[4] & Q[3] & Q[2] & Q[1] & Q[0];
       
endmodule
