`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2018 06:45:09 PM
// Design Name: 
// Module Name: WinDetector
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


module WinDetector(
    input [9:0] Hcount,
    input [9:0] Vcount,
    input [3:0] Green,
    output WinDetect
    );
    
    assign WinDetect = (Hcount >= 10'b1001110010) & (Hcount <= 10'b1001110111) & (Vcount >= 10'b0111010010) & 
                       (Vcount <= 10'b0111010111) & (Green[3] & Green[2] & Green[1] & Green[0]);
    
endmodule
