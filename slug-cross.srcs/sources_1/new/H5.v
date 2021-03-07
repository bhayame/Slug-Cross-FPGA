`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2018 05:22:28 PM
// Design Name: 
// Module Name: VertObstacle
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


module H5(
    input [9:0] Hcount,
    input [9:0] Vcount,
    output[3:0] Red
    );
    
    assign Red[3] = (Vcount >= 10'b0100010110) & (Vcount <= 10'b0100011101) &  
                    ((Hcount[9] | Hcount[8] | Hcount[7] | Hcount[6] | Hcount[5] | Hcount[4] | Hcount[3]) & 
                    (~(Hcount[9] & ~Hcount[8] & ~Hcount[7] & Hcount[6] & Hcount[5] & Hcount[4] & Hcount[3])));
    assign Red[2] = Red[3];  
    assign Red[1] = Red[3];
    assign Red[0] = Red[3];                          
endmodule
