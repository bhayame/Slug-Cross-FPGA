`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2018 01:51:04 PM
// Design Name: 
// Module Name: GapStateMachineLogic
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


module GapStateMachineLogic(
    input btnUDLR,
    input btnC,
    input GapWallDetect,
    input SlugRedDetect,
    input [3:0] Q,
    
    output load,
    output reset,
    output dir1,
    output dir2,
    output flash,
    output [3:0] D 
    );
    
    assign D[0] = (btnC) | (Q[0] & ~btnUDLR & ~btnC) | (Q[0] & btnUDLR & ~btnC  & SlugRedDetect);
    assign D[1] = (Q[0] & btnUDLR & ~btnC & ~SlugRedDetect) | (Q[1] & ~btnC & ~GapWallDetect & ~SlugRedDetect) | (Q[2] & ~btnC & GapWallDetect & ~SlugRedDetect);
    assign D[2] = (Q[1] & ~btnC & GapWallDetect & ~SlugRedDetect) | (Q[2] & ~btnC & ~GapWallDetect & ~SlugRedDetect);
    assign D[3] = ((Q[1] | Q[2]) & ~btnUDLR & ~btnC & SlugRedDetect) | ((Q[1] | Q[2]) & btnUDLR & ~btnC & SlugRedDetect) |   
                  (Q[3] & ~btnC);
        
    assign reset = btnC;
    assign load = (Q[0] & btnUDLR);
    assign dir1 = Q[1] & ~Q[3];
    assign dir2 = Q[2] & ~Q[3];
    assign flash = Q[3];
    
    
endmodule
