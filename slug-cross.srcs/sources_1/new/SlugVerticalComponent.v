`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2018 06:20:21 PM
// Design Name: 
// Module Name: SlugHorizontalComponent
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


module SlugVerticalComponent(
    input [9:0] Vcount,
    input clk,
    input btnU,
    input btnD,
    input frame,
    input reset, 
    output Green
    );
    
    wire [9:0] pixel0, pixel1, pixel2, pixel3, pixel4, pixel5, pixel6, pixel7, pixel8, pixel9, pixelA, pixelB, pixelC, pixelD, pixelE, pixelF;
    
    countUD10L counter0 (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0}), .Q(pixel0));
    countUD10L counter1 (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1}), .Q(pixel1[9:0]));
    countUD10L counter2 (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0}), .Q(pixel2[9:0]));
    countUD10L counter3 (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1}), .Q(pixel3[9:0]));
    countUD10L counter4 (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0}), .Q(pixel4[9:0]));                
    countUD10L counter5 (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1}), .Q(pixel5[9:0]));
    countUD10L counter6 (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0}), .Q(pixel6[9:0]));
    countUD10L counter7 (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1}), .Q(pixel7[9:0]));
    countUD10L counter8 (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0}), .Q(pixel8[9:0]));
    countUD10L counter9 (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1}), .Q(pixel9[9:0]));     
    countUD10L counterA (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0}), .Q(pixelA[9:0]));
    countUD10L counterB (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1}), .Q(pixelB[9:0]));
    countUD10L counterC (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0}), .Q(pixelC[9:0]));
    countUD10L counterD (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1, 1'b1}), .Q(pixelD[9:0]));
    countUD10L counterE (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0}), .Q(pixelE[9:0]));   
    countUD10L counterF (.clk(clk), .Up(btnD & frame), .Dw(btnU & frame), .LD(reset), .D({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1}), .Q(pixelF[9:0]));
    
    assign Green = (~|(Vcount ^ pixel0)) | (~|(Vcount ^ pixel1)) | (~|(Vcount ^ pixel2)) | (~|(Vcount ^ pixel3)) | 
                   (~|(Vcount ^ pixel4)) | (~|(Vcount ^ pixel5)) | (~|(Vcount ^ pixel6)) | (~|(Vcount ^ pixel7)) |  
                   (~|(Vcount ^ pixel8)) | (~|(Vcount ^ pixel9)) | (~|(Vcount ^ pixelA)) | (~|(Vcount ^ pixelB)) |
                   (~|(Vcount ^ pixelC)) | (~|(Vcount ^ pixelD)) | (~|(Vcount ^ pixelE)) | (~|(Vcount ^ pixelF));
                                            
endmodule
