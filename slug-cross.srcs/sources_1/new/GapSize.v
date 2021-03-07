`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 07:37:40 PM
// Design Name: 
// Module Name: GapSize
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


module GapSize(
    input[9:0] b0,
    input[9:0] b1,
    input[9:0] b2,
    input[9:0] b3,
    input[9:0] b4,
    input[9:0] b5,
    input[9:0] b6,
    input[9:0] b7,
    input[6:4] sw,
    output[9:0] DwStartingPosition

    );
    
 assign DwStartingPosition[9] = (b0[9] & ~sw[6] & ~sw[5] & ~sw[4]) |
                                (b1[9] & ~sw[6] & ~sw[5] & sw[4]) |
                                (b2[9] & ~sw[6] & sw[5] & ~sw[4]) |
                                (b3[9] & ~sw[6] & sw[5] & sw[4]) |
                                (b4[9] & sw[6] & ~sw[5] & ~sw[4]) |
                                (b5[9] & sw[6] & ~sw[5] & sw[4]) |
                                (b6[9] & sw[6] & sw[5] & ~sw[4]) |
                                (b7[9] & sw[6] & sw[5] & sw[4]);
                                
 assign DwStartingPosition[8] = (b0[8] & ~sw[6] & ~sw[5] & ~sw[4]) |
                                (b1[8] & ~sw[6] & ~sw[5] & sw[4]) |
                                (b2[8] & ~sw[6] & sw[5] & ~sw[4]) |
                                (b3[8] & ~sw[6] & sw[5] & sw[4]) |
                                (b4[8] & sw[6] & ~sw[5] & ~sw[4]) |
                                (b5[8] & sw[6] & ~sw[5] & sw[4]) |
                                (b6[8] & sw[6] & sw[5] & ~sw[4]) |
                                (b7[8] & sw[6] & sw[5] & sw[4]);   
                                
 assign DwStartingPosition[7] = (b0[7] & ~sw[6] & ~sw[5] & ~sw[4]) |
                                (b1[7] & ~sw[6] & ~sw[5] & sw[4]) |
                                (b2[7] & ~sw[6] & sw[5] & ~sw[4]) |
                                (b3[7] & ~sw[6] & sw[5] & sw[4]) |
                                (b4[7] & sw[6] & ~sw[5] & ~sw[4]) |
                                (b5[7] & sw[6] & ~sw[5] & sw[4]) |
                                (b6[7] & sw[6] & sw[5] & ~sw[4]) |
                                (b7[7] & sw[6] & sw[5] & sw[4]);  
                                
 assign DwStartingPosition[6] = (b0[6] & ~sw[6] & ~sw[5] & ~sw[4]) |
                                (b1[6] & ~sw[6] & ~sw[5] & sw[4]) |
                                (b2[6] & ~sw[6] & sw[5] & ~sw[4]) |
                                (b3[6] & ~sw[6] & sw[5] & sw[4]) |
                                (b4[6] & sw[6] & ~sw[5] & ~sw[4]) |
                                (b5[6] & sw[6] & ~sw[5] & sw[4]) |
                                (b6[6] & sw[6] & sw[5] & ~sw[4]) |
                                (b7[6] & sw[6] & sw[5] & sw[4]);   
                                                               
 assign DwStartingPosition[5] = (b0[5] & ~sw[6] & ~sw[5] & ~sw[4]) |
                                (b1[5] & ~sw[6] & ~sw[5] & sw[4]) |
                                (b2[5] & ~sw[6] & sw[5] & ~sw[4]) |
                                (b3[5] & ~sw[6] & sw[5] & sw[4]) |
                                (b4[5] & sw[6] & ~sw[5] & ~sw[4]) |
                                (b5[5] & sw[6] & ~sw[5] & sw[4]) |
                                (b6[5] & sw[6] & sw[5] & ~sw[4]) |
                                (b7[5] & sw[6] & sw[5] & sw[4]);
                                                               
assign DwStartingPosition[4] = (b0[4] & ~sw[6] & ~sw[5] & ~sw[4]) |
                               (b1[4] & ~sw[6] & ~sw[5] & sw[4]) |
                               (b2[4] & ~sw[6] & sw[5] & ~sw[4]) |
                               (b3[4] & ~sw[6] & sw[5] & sw[4]) |
                               (b4[4] & sw[6] & ~sw[5] & ~sw[4]) |
                               (b5[4] & sw[6] & ~sw[5] & sw[4]) |
                               (b6[4] & sw[6] & sw[5] & ~sw[4]) |
                               (b7[4] & sw[6] & sw[5] & sw[4]);   
                                                               
assign DwStartingPosition[3] = (b0[3] & ~sw[6] & ~sw[5] & ~sw[4]) |
                               (b1[3] & ~sw[6] & ~sw[5] & sw[4]) |
                               (b2[3] & ~sw[6] & sw[5] & ~sw[4]) |
                               (b3[3] & ~sw[6] & sw[5] & sw[4]) |
                               (b4[3] & sw[6] & ~sw[5] & ~sw[4]) |
                               (b5[3] & sw[6] & ~sw[5] & sw[4]) |
                               (b6[3] & sw[6] & sw[5] & ~sw[4]) |
                               (b7[3] & sw[6] & sw[5] & sw[4]);  
                                                               
assign DwStartingPosition[2] = (b0[2] & ~sw[6] & ~sw[5] & ~sw[4]) |
                               (b1[2] & ~sw[6] & ~sw[5] & sw[4]) |
                               (b2[2] & ~sw[6] & sw[5] & ~sw[4]) |
                               (b3[2] & ~sw[6] & sw[5] & sw[4]) |
                               (b4[2] & sw[6] & ~sw[5] & ~sw[4]) |
                               (b5[2] & sw[6] & ~sw[5] & sw[4]) |
                               (b6[2] & sw[6] & sw[5] & ~sw[4]) |
                               (b7[2] & sw[6] & sw[5] & sw[4]);                                                                                                  
                                                               
assign DwStartingPosition[1] = (b0[1] & ~sw[6] & ~sw[5] & ~sw[4]) |
                               (b1[1] & ~sw[6] & ~sw[5] & sw[4]) |
                               (b2[1] & ~sw[6] & sw[5] & ~sw[4]) |
                               (b3[1] & ~sw[6] & sw[5] & sw[4]) |
                               (b4[1] & sw[6] & ~sw[5] & ~sw[4]) |
                               (b5[1] & sw[6] & ~sw[5] & sw[4]) |
                               (b6[1] & sw[6] & sw[5] & ~sw[4]) |
                               (b7[1] & sw[6] & sw[5] & sw[4]);  
                                                                                                                              
assign DwStartingPosition[0] = (b0[0] & ~sw[6] & ~sw[5] & ~sw[4]) |
                               (b1[0] & ~sw[6] & ~sw[5] & sw[4]) |
                               (b2[0] & ~sw[6] & sw[5] & ~sw[4]) |
                               (b3[0] & ~sw[6] & sw[5] & sw[4]) |
                               (b4[0] & sw[6] & ~sw[5] & ~sw[4]) |
                               (b5[0] & sw[6] & ~sw[5] & sw[4]) |
                               (b6[0] & sw[6] & sw[5] & ~sw[4]) |
                               (b7[0] & sw[6] & sw[5] & sw[4]);                                                                                               
                                
endmodule 