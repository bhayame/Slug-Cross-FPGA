`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2018 03:40:57 PM
// Design Name: 
// Module Name: SlugRedDetect
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


module SlugRedDetect(
    input [3:0] Red,
    input [9:0] LowerRange,
    input [9:0] UpperRange,
    input [9:0] Hcount,
    input [3:0] Green,
    output SlugRedDetect
    );
    
    assign SlugRedDetect = (LowerRange <= Hcount) & (Hcount <= UpperRange) & (Green[3] & Red[3]) & (Green[2] & Red[2]) & (Green[1] & Red[1]) & (Green[0] & Red[0]);
    
endmodule
