`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2018 05:37:02 PM
// Design Name: 
// Module Name: Selector
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


module Selector(
    input [3:0] sel,
    input [15:0] N,
    output [3:0] H
    );
    
    assign H[0] = (N[0] & sel[0]) | (N[4] & sel[1]) | (N[8] & sel[2]) | (N[12] & sel[3]);
    assign H[1] = (N[1] & sel[0]) | (N[5] & sel[1]) | (N[9] & sel[2]) | (N[13] & sel[3]);
    assign H[2] = (N[2] & sel[0]) | (N[6] & sel[1]) | (N[10] & sel[2]) | (N[14] & sel[3]);
    assign H[3] = (N[3] & sel[0]) | (N[7] & sel[1]) | (N[11] & sel[2]) | (N[15] & sel[3]);
endmodule
