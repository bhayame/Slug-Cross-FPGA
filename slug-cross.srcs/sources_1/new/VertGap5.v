`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 02:00:42 PM
// Design Name: 
// Module Name: VertGap1
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


module VertGap5(
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
    
    wire [3:0] RedHoriz, RedVert;
    wire loadOut, resetOut, dir1Out, dir2Out, WallDetect, WallEdgeDetect, RedDetect, flash, flashOut, secEdge;
    wire [9:0] UpOut, DwOut, secOut;
    
    GapStateMachine GapStateMachine(.clk(clk), .btnUDLR(btnUDLR), .btnC(btnC), .GapWallDetect(WallEdgeDetect), .SlugRedDetect(RedDetect), 
                                    .load(loadOut), .reset(resetOut), .dir1(dir1Out), .dir2(dir2Out), .flash(flash));
                             
                                    
    GapWallDetect GapWallDetect (.DwStartingPosition(DwOut), .UpStartingPosition(UpOut), .Upper(10'b0000001000), 
                                 .Lower(10'b0111010111), .GapWallDetect(WallDetect));
    EdgeDetector EdgeDetector (.btn(WallDetect), .clkin(clk), .out(WallEdgeDetect));                             
                               
    SlugRedDetect SlugRedDetect (.Green(Green), .Red(RedOut), .Hcount(Hcount), .LowerRange(10'b0101100110), .UpperRange(10'b0101101101), .SlugRedDetect(RedDetect));
    
    EdgeDetector SecEdge (.btn(sec), .clkin(clk), .out(secEdge));
    countU10 secGenerator(.clk(clk), .Up(secEdge), .Q(secOut));
    FlashModule FlashModule (.flash(flash), .sec(secOut[0]), .flashOut(flashOut));                           
    
    GapHorizontalComponent GapHorizontalComponent (.Hcount(Hcount), .RedIn(RedIn), .RedOut(RedHoriz),
                                                   .LeftStartingPosition(10'b0101100110), 
                                                   .RightStartingPosition(10'b0101101101));
    GapVerticalComponent GapVerticalComponent (.Vcount(Vcount), .RedIn(RedIn), .clk(clk), .sw({sw[6], sw[5], sw[4]}), .Up(dir1Out), .Dw(dir2Out), .frame(frame), 
                                               .reset(resetOut), .load(loadOut), .UpStartingPosition(10'b0000111010), .RedOut(RedVert), .UpOut(UpOut), .DwOut(DwOut));
    
    assign RedOut[3] = (RedHoriz[3] | (RedVert[3] & ~flashOut));
    assign RedOut[2] = (RedHoriz[2] | (RedVert[2] & ~flashOut));
    assign RedOut[1] = (RedHoriz[1] | (RedVert[1] & ~flashOut));
    assign RedOut[0] = (RedHoriz[0] | (RedVert[0] & ~flashOut));
        
endmodule
