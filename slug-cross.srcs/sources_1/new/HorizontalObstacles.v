`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2018 09:06:32 PM
// Design Name: 
// Module Name: VerticalObstacles
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


module HorizontalObstacles(
    input [9:0] Hcount,
    input [9:0] Vcount,
    output[3:0] Red
    );
    
    wire [3:0] Red1, Red2, Red3, Red4, Red5, Red6, Red7;
    
    H1 H1 (.Hcount(Hcount), .Vcount(Vcount), .Red({Red1[3:0]}));    
    H2 H2 (.Hcount(Hcount), .Vcount(Vcount), .Red({Red2[3:0]}));
    H3 H3 (.Hcount(Hcount), .Vcount(Vcount), .Red({Red3[3:0]}));    
    H4 H4 (.Hcount(Hcount), .Vcount(Vcount), .Red({Red4[3:0]}));
    H5 H5 (.Hcount(Hcount), .Vcount(Vcount), .Red({Red5[3:0]}));    
    H6 H6 (.Hcount(Hcount), .Vcount(Vcount), .Red({Red6[3:0]}));
    H7 H7 (.Hcount(Hcount), .Vcount(Vcount), .Red({Red7[3:0]}));    

            
    assign Red[3] = Red3[3] | Red1[3] | Red2[3] | Red4[3]| Red5[3] | Red6[3:0] | Red7[3:0];
    assign Red[2] = Red3[2] | Red1[2] | Red2[2] | Red4[2]| Red5[2] | Red6[3:0] | Red7[3:0]; 
    assign Red[1] = Red3[1] | Red1[1] | Red2[1] | Red4[1]| Red5[1] | Red6[3:0] | Red7[3:0]; 
    assign Red[0] = Red3[0] | Red1[0] | Red2[0] | Red4[0]| Red5[0] | Red6[3:0] | Red7[3:0];
     
endmodule
