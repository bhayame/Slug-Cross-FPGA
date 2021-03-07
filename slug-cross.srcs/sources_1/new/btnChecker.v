`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2018 04:39:07 PM
// Design Name: 
// Module Name: btnChecker
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


module btnChecker(
    input Uin,
    input Din,
    input Lin,
    input Rin,
    output Uout,
    output Dout,
    output Lout,
    output Rout
    );
    
    assign Uout = Uin & ~Din;
    assign Dout = ~Uin & Din;
    assign Lout = Lin & ~Rin;
    assign Rout = ~Lin & Rin;
endmodule
