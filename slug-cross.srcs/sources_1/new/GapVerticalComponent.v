`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 02:02:09 PM
// Design Name: 
// Module Name: GapHorizontalComponent
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


module GapVerticalComponent(
    input [9:0] Vcount,
    input [3:0] RedIn,
    input clk,
    input [6:4] sw,
    input Up,
    input Dw,
    input frame,
    input load,
    input reset,
    input [9:0] UpStartingPosition,
    output[3:0] RedOut,
    output[9:0] UpOut,
    output [9:0] DwOut
    );
    
    wire [9:0] topPixel, bottomPixel0, bottomPixel1, bottomPixel2, bottomPixel3, bottomPixel4, bottomPixel5, bottomPixel6, bottomPixel7, DwStartingPosition;
    
    countUD10L counter0 (.clk(clk), .Up(Up & frame), .Dw(Dw & frame), .reset(reset), .LD(load), .D(UpStartingPosition), .Q(topPixel));
    countUD10L counter1 (.clk(clk), .Up(Up & frame), .Dw(Dw & frame), .reset(reset), .LD(load), .D(UpStartingPosition + 10'b0000010000), .Q(bottomPixel0));    
    countUD10L counter2 (.clk(clk), .Up(Up & frame), .Dw(Dw & frame), .reset(reset), .LD(load), .D(UpStartingPosition + 10'b0000110000), .Q(bottomPixel1));
    countUD10L counter3 (.clk(clk), .Up(Up & frame), .Dw(Dw & frame), .reset(reset), .LD(load), .D(UpStartingPosition + 10'b0001010000), .Q(bottomPixel2));
    countUD10L counter4 (.clk(clk), .Up(Up & frame), .Dw(Dw & frame), .reset(reset), .LD(load), .D(UpStartingPosition + 10'b0001110000), .Q(bottomPixel3));
    countUD10L counter5 (.clk(clk), .Up(Up & frame), .Dw(Dw & frame), .reset(reset), .LD(load), .D(UpStartingPosition + 10'b0010010000), .Q(bottomPixel4));
    countUD10L counter6 (.clk(clk), .Up(Up & frame), .Dw(Dw & frame), .reset(reset), .LD(load), .D(UpStartingPosition + 10'b0010110000), .Q(bottomPixel5));    
    countUD10L counter7 (.clk(clk), .Up(Up & frame), .Dw(Dw & frame), .reset(reset), .LD(load), .D(UpStartingPosition + 10'b0011010000), .Q(bottomPixel6));            
    countUD10L counter8 (.clk(clk), .Up(Up & frame), .Dw(Dw & frame), .reset(reset), .LD(load), .D(UpStartingPosition + 10'b0011110000), .Q(bottomPixel7));    
    
    GapSize GapSize (.b0(bottomPixel0), .b1(bottomPixel1), .b2(bottomPixel2), .b3(bottomPixel3), 
                     .b4(bottomPixel4), .b5(bottomPixel5), .b6(bottomPixel6), .b7(bottomPixel7),
                     .sw({sw[6], sw[5], sw[4]}), .DwStartingPosition(DwStartingPosition)); 
                     
    assign UpOut = topPixel;
    assign DwOut = DwStartingPosition;                  
    
    assign RedOut[3] =  ((~((topPixel <= Vcount) & (Vcount <= DwStartingPosition))) & RedIn[3]);
    assign RedOut[2] =  ((~((topPixel <= Vcount) & (Vcount <= DwStartingPosition))) & RedIn[2]);
    assign RedOut[1] =  ((~((topPixel <= Vcount) & (Vcount <= DwStartingPosition))) & RedIn[1]);
    assign RedOut[0] =  ((~((topPixel <= Vcount) & (Vcount <= DwStartingPosition))) & RedIn[0]);                                                                    
endmodule
