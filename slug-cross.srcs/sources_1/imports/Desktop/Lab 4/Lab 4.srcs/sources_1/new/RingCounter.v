`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2018 05:56:37 PM
// Design Name: 
// Module Name: RingCounter
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


module RingCounter(
    input advance,
    input clkin,
    output [3:0] Q
    );
    
     FDRE #(.INIT(1'b1) ) ff0 (.C(clkin), .R(reset), .CE(advance), .D(Q[3]), .Q(Q[0]));
     FDRE #(.INIT(1'b0) ) ff1 (.C(clkin), .R(reset), .CE(advance), .D(Q[0]), .Q(Q[1]));
     FDRE #(.INIT(1'b0) ) ff2 (.C(clkin), .R(reset), .CE(advance), .D(Q[1]), .Q(Q[2]));
     FDRE #(.INIT(1'b0) ) ff3 (.C(clkin), .R(reset), .CE(advance), .D(Q[2]), .Q(Q[3]));
    
endmodule
