`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2018 06:03:50 PM
// Design Name: 
// Module Name: SlugGenerator
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


module SlugGenerator(
    input btnU,
    input btnD, 
    input btnL,
    input btnR,
    input reset,
    input frame,
    input sec,
    input clk,
    input flash,
    input [9:0] Hcount,
    input [9:0] Vcount,
    output [3:0] Green
    );
    
    wire GreenVert, GreenHoriz, btnUchecked, btnDchecked, btnRchecked, btnLchecked, load, flashOut, secEdge;
    wire UpStop, DwStop, LeftStop, RightStop;
    wire [9:0] SecOut;
    
    EdgeDetector SecEdge (.btn(sec), .clkin(clk), .out(secEdge));
    countU10 secGenerator(.clk(clk), .Up(secEdge), .Q(secOut));
    FlashModule FlashModule (.flash(flash), .sec(SecOut[0]), .flashOut(flashOut));    

    SlugPositionSet SlugPositionSet (.Hcount(Hcount[9:0]), .GreenHoriz(GreenHoriz), .load(load));
    
    btnChecker btnChecker (.Uin(btnU), .Din(btnD), .Rin(btnR), .Lin(btnL), .Uout(btnUchecked), .Dout(btnDchecked), .Rout(btnRchecked), .Lout(btnLchecked));
    BGCollisionDetector BGCollisionDetector(.Hcount(Hcount), .Vcount(Vcount), .btnU(btnUchecked), .Green(GreenHoriz & GreenVert), .UpStop(UpStop), .DwStop(DwStop), 
                                            .LeftStop(LeftStop), .RightStop(RightStop));
    
    SlugVerticalComponent SlugVerticalComponent(.Vcount(Vcount[9:0]), .frame(frame), .clk(clk), .btnU(UpStop), 
                                                .btnD(btnDchecked & ~DwStop), .reset(load | reset), .Green(GreenVert));
    SlugHorizontalComponent SlugHorizontalComponent(.Hcount(Hcount[9:0]), .frame(frame), .clk(clk), .btnR(btnRchecked & ~RightStop), 
                                                .btnL(btnLchecked & ~LeftStop), .reset(load | reset), .Green(GreenHoriz));    
    
    assign Green[3] = (GreenVert & GreenHoriz) & ~flashOut;
    assign Green[2] = (GreenVert & GreenHoriz) & ~flashOut;
    assign Green[1] = (GreenVert & GreenHoriz) & ~flashOut;
    assign Green[0] = (GreenVert & GreenHoriz) & ~flashOut;
endmodule
