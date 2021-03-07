`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2018 07:38:23 PM
// Design Name: 
// Module Name: VerticalGaps
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


module VerticalGaps(
    input [9:0] Hcount,
    input [9:0] Vcount,
    input btnC,
    input clk,
    input [6:4] sw,
    input frame,
    input sec,
    input btnUDLR,
    input reset,
    input [3:0] Green,
    input [3:0] RedIn,
    output [3:0] RedOut
    );
    
    wire [3:0] Red1, Red2, Red3, Red4, Red5, Red6, Red7;
    wire GreenOut1;
    
    VertGap1 VertGap1(.Hcount(Hcount), .Vcount(Vcount), .btnC(btnC), .clk(clk), .sw(sw), .frame(frame), .sec(sec), .btnUDLR(btnUDLR),
                      .reset(reset), .Green(Green), .RedIn(RedIn), .RedOut(Red1));
    VertGap2 VertGap2(.Hcount(Hcount), .Vcount(Vcount), .btnC(btnC), .clk(clk), .sw(sw), .frame(frame), .sec(sec), .btnUDLR(btnUDLR),
                      .reset(reset), .Green(Green), .RedIn(RedIn), .RedOut(Red2));
    VertGap3 VertGap3(.Hcount(Hcount), .Vcount(Vcount), .btnC(btnC), .clk(clk), .sw(sw), .frame(frame), .sec(sec), .btnUDLR(btnUDLR),
                       .reset(reset), .Green(Green), .RedIn(RedIn), .RedOut(Red3));  
    VertGap4 VertGap4(.Hcount(Hcount), .Vcount(Vcount), .btnC(btnC), .clk(clk), .sw(sw), .frame(frame), .sec(sec), .btnUDLR(btnUDLR),
                      .reset(reset), .Green(Green), .RedIn(RedIn), .RedOut(Red4));  
    VertGap5 VertGap5(.Hcount(Hcount), .Vcount(Vcount), .btnC(btnC), .clk(clk), .sw(sw), .frame(frame), .sec(sec), .btnUDLR(btnUDLR),
                      .reset(reset), .Green(Green), .RedIn(RedIn), .RedOut(Red5));
    VertGap6 VertGap6(.Hcount(Hcount), .Vcount(Vcount), .btnC(btnC), .clk(clk), .sw(sw), .frame(frame), .sec(sec), .btnUDLR(btnUDLR),
                      .reset(reset), .Green(Green), .RedIn(RedIn), .RedOut(Red6)); 
    VertGap7 VertGap7(.Hcount(Hcount), .Vcount(Vcount), .btnC(btnC), .clk(clk), .sw(sw), .frame(frame), .sec(sec), .btnUDLR(btnUDLR),
                      .reset(reset), .Green(Green), .RedIn(RedIn), .RedOut(Red7));  
                                                                                                                           
        assign RedOut[3] = Red1[3] & Red2[3] & Red3[3] & Red4[3] & Red5[3] & Red6[3] & Red7[3];
        assign RedOut[2] = Red1[2] & Red2[2] & Red3[2] & Red4[2] & Red5[2] & Red6[2] & Red7[2];
        assign RedOut[1] = Red1[1] & Red2[1] & Red3[1] & Red4[1] & Red5[1] & Red6[1] & Red7[1];
        assign RedOut[0] = Red1[0] & Red2[0] & Red3[0] & Red4[0] & Red5[0] & Red6[0] & Red7[0];             
        
endmodule
