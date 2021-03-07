`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2018 01:21:31 PM
// Design Name: 
// Module Name: GapStateMachine
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


module GapStateMachine(
    input clk,
    input btnUDLR,
    input btnC,
    input GapWallDetect,
    input SlugRedDetect,
    output load,
    output reset,
    output dir1,
    output dir2,
    output flash    
    );
    
    wire [3:0] Q;
    wire [3:0] D;
    
    GapStateMachineLogic GapStateMachineLogic(.btnUDLR(btnUDLR), .btnC(btnC), .GapWallDetect(GapWallDetect), .SlugRedDetect(SlugRedDetect), 
                                              .load(load), .reset(reset), .dir1(dir1), .dir2(dir2), .flash(flash), .Q(Q), .D(D));
    
        FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(1'b1), .D(D[0]), .Q(Q[0]));
        FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(1'b1), .D(D[1]), .Q(Q[1]));
        FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(1'b1), .D(D[2]), .Q(Q[2]));
        FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(1'b1), .D(D[3]), .Q(Q[3]));
endmodule
