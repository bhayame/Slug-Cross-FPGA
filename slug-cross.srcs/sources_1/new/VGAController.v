`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 03:45:41 PM
// Design Name: 
// Module Name: Hsync
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


module VGAController(
    input clk,
    input [3:0] RedIn,
    input [3:0] BlueIn,
    input [3:0] GreenIn,
    output Hsync,
    output Vsync,
    output frame,
    output [3:0] vgaRed,
    output [3:0] vgaBlue,
    output [3:0] vgaGreen,
    output [9:0] Hcount,
    output [9:0] Vcount
    );
    
    wire HzeroDetect, HendDetect, VzeroDetect, VendDetect, HInActiveZone, HOutActiveZone, VInActiveZone, VOutActiveZone, Q0, Q1, Q2, Q3;
    
    HorizontalCounter HorizontalCounter (.clk(clk), .reset(), .enable(1'b1), .zeroDetect(HzeroDetect), .endDetect(HendDetect),
                                         .InActiveZone(HInActiveZone), .OutActiveZone(HOutActiveZone), .Q(Hcount)); 
    FDRE #(.INIT(1'b0) ) HsyncGen (.C(clk), .R(HendDetect), .CE(HzeroDetect | HendDetect), .D(HzeroDetect), .Q(Q0));
    FDRE #(.INIT(1'b0) ) HActiveZone (.C(clk), .R(HOutActiveZone), .CE(HInActiveZone | HOutActiveZone), .D(HInActiveZone), .Q(Q2));
    
    VerticalCounter VerticalCounter (.clk(clk), .reset(), .enable(HzeroDetect), .zeroDetect(VzeroDetect), .endDetect(VendDetect), 
                                     .InActiveZone(VInActiveZone), .OutActiveZone(VOutActiveZone), .Q(Vcount));
    FDRE #(.INIT(1'b0) ) VsyncGen (.C(clk), .R(VendDetect), .CE(VzeroDetect | VendDetect), .D(VzeroDetect), .Q(Q1));
    FDRE #(.INIT(1'b0) ) VActiveZone (.C(clk), .R(VOutActiveZone), .CE(VInActiveZone | VOutActiveZone), .D(VInActiveZone), .Q(Q3));
    
    
    EdgeDetector EdgeDetector (.btn(~Q1), .clkin(clk), .out(frame));
    
    assign vgaRed[3] = RedIn[3] & Q2 & Q3;
    assign vgaRed[2] = RedIn[2] & Q2 & Q3;
    assign vgaRed[1] = RedIn[1] & Q2 & Q3;
    assign vgaRed[0] = RedIn[0] & Q2 & Q3;
    assign vgaBlue[3] = BlueIn[3] & Q2 & Q3;
    assign vgaBlue[2] = BlueIn[2] & Q2 & Q3;
    assign vgaBlue[1] = BlueIn[1] & Q2 & Q3;
    assign vgaBlue[0] = BlueIn[0] & Q2 & Q3;
    assign vgaGreen[3] = GreenIn[3] & Q2 & Q3;  
    assign vgaGreen[2] = GreenIn[2] & Q2 & Q3;
    assign vgaGreen[1] = GreenIn[1] & Q2 & Q3;  
    assign vgaGreen[0] = GreenIn[0] & Q2 & Q3; 
                  
    assign Hsync = ~Q0;
    assign Vsync = ~Q1;
    
endmodule
