`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2018 01:44:01 PM
// Design Name: 
// Module Name: TopLevel
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


module TopLevel(
    input clkin,
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    input btnC,
    input [15:0] sw,
    output Hsync,
    output Vsync,
    output [3:0] vgaRed,
    output [3:0] vgaBlue,
    output [3:0] vgaGreen,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
    
    wire clk, digsel, frame, qsec;
    wire secEdge, flashOutSlug, flashOutBorder;
    wire btnCenable, btnUDLRenable, TimerEnable, resetTimer, LossDetect, WinDetect, flashSlug, flashBorder;
    wire [9:0] Hcount, Vcount;
    wire [3:0] BlueIn, GreenIn, RedIn, selInput, segInput, HorizRedOut, VertRedOut, HorizRedIn, VertRedIn, secOut;
    wire [15:0] timerOut;
    wire [9:0] SecOutSlug;
    
    TopStateMachine TopStateMachine (.clk(clk), .btnUDLR(btnU | btnR | btnD | btnL), .btnC(btnC), .WinDetect(WinDetect), .LossDetect(LossDetect), .reset(resetTimer),
                                     .btnCenable(btnCenable), .btnUDLRenable(btnUDLRenable), .TimerEnable(TimerEnable), .flashSlug(flashSlug), .flashBorder(flashBorder));                                               
    
    LossDetector LossDetector (.Green(GreenIn), .Red(HorizRedOut | VertRedOut), .LossDetect(LossDetect));
    WinDetector WinDetector (.Green(GreenIn), .Hcount(Hcount), .Vcount(Vcount), .WinDetect(WinDetect));
    
    lab7_clks not_so_slow (.clkin(clkin), .greset(sw[0]), .clk(clk), .digsel(digsel));
    
    VGAController VGAController(.clk(clk), .RedIn(HorizRedOut | VertRedOut), .BlueIn({(BlueIn[3] & ~flashOutBorder),(BlueIn[2] & ~flashOutBorder), (BlueIn[1] & ~flashOutBorder), (BlueIn[0] & ~flashOutBorder)}), .GreenIn({(GreenIn[3] & ~flashOutSlug),(GreenIn[2] & ~flashOutSlug), (GreenIn[1] & ~flashOutSlug), (GreenIn[0] & ~flashOutSlug)}), .Hsync(Hsync), .Vsync(Vsync),
                   .vgaRed(vgaRed), .vgaBlue(vgaBlue), .vgaGreen(vgaGreen), .Hcount(Hcount), .Vcount(Vcount), .frame(frame));
                   
    BorderGenerator BorderGenerator (.Hcount(Hcount), .Vcount(Vcount), .Blue({BlueIn[3:0]}), .flash(flashBorder), .sec(~qsec));
    
    SlugGenerator SlugGenerator (.btnU(btnU & btnUDLRenable), .btnD(btnD & btnUDLRenable), .btnL(btnL & btnUDLRenable) , .btnR(btnR & btnUDLRenable), .reset(btnC & btnCenable), .frame(frame), .clk(clk), 
                                 .Hcount(Hcount[9:0]), .Vcount(Vcount[9:0]), .Green({GreenIn[3:0]}), .flash(flashSlug), .sec(~qsec));
                                 
    VerticalObstacles VerticalObstacles (.Hcount(Hcount[9:0]), .Vcount(Vcount[9:0]), .Red(VertRedIn));
    VerticalGaps VerticalGaps (.Hcount(Hcount), .Vcount(Vcount), .clk(clk), .frame(frame), .btnC(btnC & btnCenable), .btnUDLR((btnU | btnR | btnD | btnL) & btnUDLRenable), 
                               .sw({sw[6], sw[5], sw[4]}), .RedIn(VertRedIn), .RedOut(VertRedOut), .Green(GreenIn), .sec(qsec));

    HorizontalObstacles HorizontalObstacles (.Hcount(Hcount[9:0]), .Vcount(Vcount[9:0]), .Red(HorizRedIn));
    HorizontalGaps HorizontalGaps (.Hcount(Hcount), .Vcount(Vcount), .clk(clk), .frame(frame), .btnC(btnC & btnCenable), .btnUDLR((btnU | btnR | btnD | btnL) & btnUDLRenable), 
                               .sw({sw[6], sw[5], sw[4]}), .RedIn(HorizRedIn), .RedOut(HorizRedOut), .Green(GreenIn), .sec(qsec));
    
    qsecTicker qsecTicker (.clk(clk), .frame(frame), .reset(1'b0), .qsec(qsec));                               

    Timer Timer (.clk(clk), .frame(frame), .CE(TimerEnable), .reset(resetTimer), .Q(timerOut[15:0]));
    
    RingCounter RingCounter(.advance(digsel), .clkin(clk), .Q(selInput));
    Selector Selector(.sel(selInput), .N(timerOut[15:0]), .H(segInput));
    hex7seg hex7seg(.n(segInput), .e(1'b1), .seg(seg));                         
 
 
    EdgeDetector SecEdge (.btn(~qsec), .clkin(clk), .out(secEdge));
    countU10 secGenerator(.clk(clk), .Up(secEdge), .Q(SecOutSlug));
    FlashModule SlugFlasher (.flash(flashSlug), .sec(SecOutSlug[0]), .flashOut(flashOutSlug)); 
    FlashModule BorderFlasher (.flash(flashBorder), .sec(SecOutSlug[0]), .flashOut(flashOutBorder)); 
 

 
 
 assign an[3] =(~selInput[3]) ;
 assign an[2] =(~selInput[2]) ;
 assign an[1] =(~selInput[1]) ;
 assign an[0] =(~selInput[0]) ;
 assign dp =  (~selInput[2]);
                   
endmodule
