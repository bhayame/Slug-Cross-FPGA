`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 04:16:03 PM
// Design Name: 
// Module Name: BGCollisionDetector
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


module BGCollisionDetector(
    input btnU,
    input [9:0] Hcount,
    input [9:0] Vcount,
    input Green,
    output UpStop,
    output DwStop,
    output LeftStop,
    output RightStop
    );
    
    assign UpStop = (~(Vcount == 10'b0000001000) & btnU & ~Green) | 
                    (~(Vcount == 10'b0000001000) & btnU & Green) | 
                    ((Vcount == 10'b0000001000) & btnU & Green); 
endmodule
