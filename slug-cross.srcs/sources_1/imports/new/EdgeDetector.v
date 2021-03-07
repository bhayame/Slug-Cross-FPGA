`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2018 06:17:39 PM
// Design Name: 
// Module Name: EdgeDetector
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


module EdgeDetector(
    input btn,
    input clkin,
    output out
    );
    
    wire t0;
    
     FDRE #(.INIT(1'b0) ) ff (.C(clkin), .R(1'b0), .CE(1), .D(btn), .Q(t0));
     
     assign out = ~t0 & btn;
     
     
     
endmodule
