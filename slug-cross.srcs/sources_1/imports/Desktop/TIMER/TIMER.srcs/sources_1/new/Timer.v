`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2018 07:02:00 PM
// Design Name: 
// Module Name: Timer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// // Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
   module Timer(
        input clk,
        input frame,
        input CE,
        input reset,
        output [15:0] Q
    );
    
    wire sec, secEdge;    
    wire UTC1, UTC2, UTC3, UTC4;
    
    secondTicker secondTicker (.clk(clk),.frame(frame),.reset(reset), .sec(sec));
    EdgeDetector EdgeDetector (.btn(sec), .clkin(clk), .out(secEdge));
    
    countU4 seconds     (.clk(clk), .CE(CE & secEdge), .reset(reset | (UTC1 & secEdge)), .UTC(UTC1), .Q(Q[3:0]));
    countU3 tenSeconds  (.clk(clk), .CE(CE & secEdge & UTC1), .reset(reset | (UTC1 & UTC2 & secEdge)), .UTC(UTC2), .Q(Q[7:4]));
    countU4 minutes     (.clk(clk), .CE(CE & secEdge & UTC1 & UTC2), .reset(reset | (UTC1 & UTC2 & UTC3 & secEdge)), .UTC(UTC3), .Q(Q[11:8]));
    countU3 tenMinutes  (.clk(clk), .CE(CE & secEdge & UTC1 & UTC2 & UTC3), .reset(reset | (UTC1 & UTC2 & UTC3 & UTC4 & secEdge)), .Q(Q[15:12]), .UTC(UTC4));

    
endmodule
