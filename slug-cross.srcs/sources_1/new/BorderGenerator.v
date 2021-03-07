`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2018 02:22:58 PM
// Design Name: 
// Module Name: BorderGenerator
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


module BorderGenerator(
    input clk,
    input [9:0] Hcount,
    input [9:0] Vcount,
    input flash, 
    input sec,
    output [3:0] Blue
    );
    
    wire secEdge, flashOut;
    wire [9:0] SecOut;
    
    EdgeDetector SecEdge (.btn(sec), .clkin(clk), .out(secEdge));
    countU10 secGenerator(.clk(clk), .Up(secEdge), .Q(secOut));
    FlashModule FlashModule (.flash(flash), .sec(SecOut[0]), .flashOut(flashOut));  
    
    assign Blue[3] = ((~Hcount[9] & ~Hcount[8] & ~Hcount[7] & ~Hcount[6] & ~Hcount[5] & ~Hcount[4] & ~Hcount[3]) |
                     (Hcount[9] & ~Hcount[8] & ~Hcount[7] & Hcount[6] & Hcount[5] & Hcount[4] & Hcount[3])      | 
                     (~Vcount[9] & ~Vcount[8] & ~Vcount[7] & ~Vcount[6] & ~Vcount[5] & ~Vcount[4] & ~Vcount[3]) |
                     (~Vcount[9] & Vcount[8] & Vcount[7] & Vcount[6] & ~Vcount[5] & Vcount[4] & Vcount[3])) & ~flashOut; 
                     
    assign Blue[2] = ((~Hcount[9] & ~Hcount[8] & ~Hcount[7] & ~Hcount[6] & ~Hcount[5] & ~Hcount[4] & ~Hcount[3]) |
                     (Hcount[9] & ~Hcount[8] & ~Hcount[7] & Hcount[6] & Hcount[5] & Hcount[4] & Hcount[3])      | 
                     (~Vcount[9] & ~Vcount[8] & ~Vcount[7] & ~Vcount[6] & ~Vcount[5] & ~Vcount[4] & ~Vcount[3]) |
                     (~Vcount[9] & Vcount[8] & Vcount[7] & Vcount[6] & ~Vcount[5] & Vcount[4] & Vcount[3])) & ~flashOut; 
                     
    assign Blue[1] = ((~Hcount[9] & ~Hcount[8] & ~Hcount[7] & ~Hcount[6] & ~Hcount[5] & ~Hcount[4] & ~Hcount[3]) |
                     (Hcount[9] & ~Hcount[8] & ~Hcount[7] & Hcount[6] & Hcount[5] & Hcount[4] & Hcount[3])      | 
                     (~Vcount[9] & ~Vcount[8] & ~Vcount[7] & ~Vcount[6] & ~Vcount[5] & ~Vcount[4] & ~Vcount[3]) |
                     (~Vcount[9] & Vcount[8] & Vcount[7] & Vcount[6] & ~Vcount[5] & Vcount[4] & Vcount[3])) & ~flashOut; 
                     
    assign Blue[0] = ((~Hcount[9] & ~Hcount[8] & ~Hcount[7] & ~Hcount[6] & ~Hcount[5] & ~Hcount[4] & ~Hcount[3]) |
                     (Hcount[9] & ~Hcount[8] & ~Hcount[7] & Hcount[6] & Hcount[5] & Hcount[4] & Hcount[3])      | 
                     (~Vcount[9] & ~Vcount[8] & ~Vcount[7] & ~Vcount[6] & ~Vcount[5] & ~Vcount[4] & ~Vcount[3]) |
                     (~Vcount[9] & Vcount[8] & Vcount[7] & Vcount[6] & ~Vcount[5] & Vcount[4] & Vcount[3])) & ~flashOut;                                              
                                                           
                     
    
endmodule
