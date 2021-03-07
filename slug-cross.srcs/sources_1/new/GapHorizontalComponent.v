`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 02:02:09 PM
// Design Name: 
// Module Name: GapHorizontalComponent
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


module GapHorizontalComponent(
    input [9:0] Hcount,
    input [3:0] RedIn,
    input [9:0] LeftStartingPosition,
    input [9:0] RightStartingPosition,
    output[3:0] RedOut
    );
    

    
    assign RedOut[3] = ((~((LeftStartingPosition <= Hcount) & (Hcount <= RightStartingPosition))) & RedIn[3]);
    assign RedOut[2] = ((~((LeftStartingPosition <= Hcount) & (Hcount <= RightStartingPosition))) & RedIn[2]);
    assign RedOut[1] = ((~((LeftStartingPosition <= Hcount) & (Hcount <= RightStartingPosition))) & RedIn[1]);
    assign RedOut[0] = ((~((LeftStartingPosition <= Hcount) & (Hcount <= RightStartingPosition))) & RedIn[0]);
endmodule
