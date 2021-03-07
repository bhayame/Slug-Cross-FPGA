`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2018 06:24:58 PM
// Design Name: 
// Module Name: TopStateMachineLogic
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


module TopStateMachineLogic(
    input clk,
    input btnUDLR,
    input btnC,
    input WinDetect,
    input LossDetect,
    input [3:0] Q,
    
    output reset,
    output btnCenable,
    output btnUDLRenable,
    output TimerEnable,
    output flashSlug,
    output flashBorder,
    output [3:0] D
    );
    
    assign D[0] = (Q[0] & ~WinDetect & ~LossDetect & ~btnC & ~btnUDLR) | (Q[0] & ~WinDetect & ~LossDetect & btnC) | (Q[2] & btnC) |
                  (Q[3] &  btnC) | (Q[0] & ~WinDetect & LossDetect) | (Q[0] & WinDetect & LossDetect) | (Q[0] & WinDetect & ~LossDetect);
    assign D[1] = (Q[0] & ~WinDetect & ~LossDetect & ~btnC & btnUDLR) | (Q[1] & ~WinDetect & ~LossDetect);
    assign D[2] = (Q[1] & ~WinDetect & LossDetect) | (Q[2] & ~btnC);
    assign D[3] = (Q[1] & WinDetect & ~LossDetect) | (Q[3] & ~btnC);
    
    assign reset = Q[0];
    assign btnCenable = ~Q[1];
    assign btnUDLRenable = Q[0] | Q[1];
    assign TimerEnable = Q[1];
    assign flashSlug = Q[2];
    assign flashBorder = Q[3];
    
    
endmodule
