`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2018 06:21:50 PM
// Design Name: 
// Module Name: TopStateMachine
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


module TopStateMachine(
    input clk,
    input btnUDLR,
    input btnC,
    input WinDetect,
    input LossDetect,
    output reset,
    output btnCenable,
    output btnUDLRenable,
    output TimerEnable,
    output flashSlug,
    output flashBorder,
    output [3:0] state
    );
    
    wire [3:0] Q;
    wire [3:0] D;
    
    TopStateMachineLogic TopStateMachineLogic (.clk(clk), .btnUDLR(btnUDLR), .btnC(btnC), .WinDetect(WinDetect), .LossDetect(LossDetect), .Q(Q), .reset(reset),
                                               .btnCenable(btnCenable), .btnUDLRenable(btnUDLRenable), .TimerEnable(TimerEnable), .flashSlug(flashSlug),
                                               .flashBorder(flashBorder), .D(D));
    
        FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(1'b1), .D(D[0]), .Q(Q[0]));
        FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(1'b1), .D(D[1]), .Q(Q[1]));
        FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(1'b1), .D(D[2]), .Q(Q[2]));
        FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(1'b1), .D(D[3]), .Q(Q[3]));
        
        assign state[0] = Q[0];
        assign state[1] = Q[1];
        assign state[2] = Q[2];
        assign state[3] = Q[3];
        
endmodule
