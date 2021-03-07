`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2018 02:14:59 PM
// Design Name: 
// Module Name: GapWallDetect
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


module GapWallDetect(
    input [9:0] DwStartingPosition,
    input [9:0] UpStartingPosition,
    input [9:0] Upper,
    input [9:0] Lower,
    output GapWallDetect    
    );
    
    assign GapWallDetect = (DwStartingPosition == Lower) | (UpStartingPosition == Upper);  
    
    

endmodule
