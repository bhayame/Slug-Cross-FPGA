`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2018 06:53:02 PM
// Design Name: 
// Module Name: FlashModule
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


module FlashModule(
    input flash,
    input sec,
    output flashOut
    );
    
    assign flashOut = sec & flash;
    
endmodule
