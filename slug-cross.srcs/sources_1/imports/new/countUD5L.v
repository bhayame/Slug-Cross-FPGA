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


module countUD5L(
    input clkin,
    input Up,
    input Dw,
    input LD,
    input [4:0] D,
    input reset,
    output [4:0] Q,
    output UTC,
    output DTC
    );
    
    wire d0, d1, d2, d3, d4;
    
    FDRE #(.INIT(1'b0) ) ff0 (.C(clkin), .R(reset), .CE(Up | Dw | LD), .D(d0), .Q(Q[0]));
    FDRE #(.INIT(1'b0) ) ff1 (.C(clkin), .R(reset), .CE((Up & Q[0]) | (Dw & ~Q[0]) | LD), .D(d1), .Q(Q[1]));
    FDRE #(.INIT(1'b0) ) ff2 (.C(clkin), .R(reset), .CE((Up & Q[0] & Q[1]) | (Dw & ~Q[0] & ~Q[1]) | LD), .D(d2), .Q(Q[2]));
    FDRE #(.INIT(1'b0) ) ff3 (.C(clkin), .R(reset), .CE((Up & Q[0] & Q[1] & Q[2]) | (Dw & ~Q[0] & ~Q[1] * ~Q[2]) | LD), .D(d3), .Q(Q[3]));
    FDRE #(.INIT(1'b0) ) ff4 (.C(clkin), .R(reset), .CE((Up & Q[0] & Q[1] & Q[2] & Q[3]) | (Dw & ~Q[0] & ~Q[1] & ~Q[2] & ~Q[3]) | LD), .D(d4), .Q(Q[4]));
    
    mux2to1 mux0 (.in0(~Q[0]), .in1(D[0]), .selector(LD), .out(d0));
    mux2to1 mux1 (.in0(~Q[1]), .in1(D[1]), .selector(LD), .out(d1));
    mux2to1 mux2 (.in0(~Q[2]), .in1(D[2]), .selector(LD), .out(d2));
    mux2to1 mux3 (.in0(~Q[3]), .in1(D[3]), .selector(LD), .out(d3));
    mux2to1 mux4 (.in0(~Q[4]), .in1(D[4]), .selector(LD), .out(d4));
    
    assign UTC = Q[0] & Q[1] & Q[2] & Q[3] & Q[4];
    assign DTC = ~Q[0] & ~Q[1] & ~Q[2] & ~Q[3] & ~Q[4];
endmodule
