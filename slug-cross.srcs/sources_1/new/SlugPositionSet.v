`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 01:31:30 PM
// Design Name: 
// Module Name: SlugPositionSet
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


module SlugPositionSet(
    input [9:0] Hcount,
    input GreenHoriz,
    output load
    );
    
    assign load = (~Hcount[9] & ~Hcount[8] & ~Hcount[7] & ~Hcount[6] & ~Hcount[5] & ~Hcount[4] & ~Hcount[3] & ~Hcount[2] & ~Hcount[1]) &
                  (GreenHoriz);
                  
endmodule
