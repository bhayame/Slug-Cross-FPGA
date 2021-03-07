`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2018 03:05:12 PM
// Design Name: 
// Module Name: m8_le
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


module m8_1e(
    input [7:0] in,
    input [2:0] sel,
    input e,
    output o
    );
    
    assign o = e & ((in[0] & (~sel[2] & ~sel[1] & ~sel[0])) | 
                    (in[1] & (~sel[2] & ~sel[1] &  sel[0])) |
                    (in[2] & (~sel[2] &  sel[1] & ~sel[0])) | 
                    (in[3] & (~sel[2] &  sel[1] &  sel[0])) |
                    (in[4] & ( sel[2] & ~sel[1] & ~sel[0])) |
                    (in[5] & ( sel[2] & ~sel[1] &  sel[0])) |
                    (in[6] & ( sel[2] &  sel[1] & ~sel[0])) | 
                    (in[7] & ( sel[2] &  sel[1] &  sel[0])));
                    
endmodule
