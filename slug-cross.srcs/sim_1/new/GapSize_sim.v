`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 08:20:15 PM
// Design Name: 
// Module Name: GapSize_sim
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


module GapSize_sim();

reg[9:0] bottomPixel0, bottomPixel1, bottomPixel2, bottomPixel3, bottomPixel4, bottomPixel5, bottomPixel6, bottomPixel7;
reg[2:0] sw;
wire[9:0] DwStartingPosition;

GapSize UUT(.b0(bottomPixel0), .b1(bottomPixel1), .b2(bottomPixel2), .b3(bottomPixel3), .b4(bottomPixel4), 
           .b5(bottomPixel5), .b6(bottomPixel6), .b7(bottomPixel7),
           .sw(sw), .DwStartingPosition(DwStartingPosition));

    initial
    begin
    #1000;
    bottomPixel0 = 10'b0000000000;
    bottomPixel1 = 10'b0000000001;
    bottomPixel2 = 10'b0000000010;
    bottomPixel3 = 10'b0000000011;
    bottomPixel4 = 10'b0000000100;
    bottomPixel5 = 10'b0000000101;
    bottomPixel6 = 10'b0000000110;
    bottomPixel7 = 10'b0000000111;
    sw[2] = 1'b0;
    sw[1] = 1'b0;
    sw[0] = 1'b0;
    #100;
    sw[0] = 1'b1;
    #100;
    sw[0] = 1'b0;
    sw[1] = 1'b1;
    #100;
    sw[0] = 1'b1;
    #100;
    sw[0] = 1'b0;
    sw[1] = 1'b0;
    sw[2] = 1'b1;
    #100;
    sw[0] = 1'b1;
    #100;
    sw[0] = 1'b0;
    sw[1] = 1'b1;
    #100;
    sw[0] = 1'b1;
          
    end

endmodule
