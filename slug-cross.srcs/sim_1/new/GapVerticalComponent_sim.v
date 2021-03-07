`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 07:29:54 PM
// Design Name: 
// Module Name: GapVerticalComponent_sim
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


module GapVerticalComponent_sim();

reg[9:0] Vcount, UpStartingPosition;
reg[3:0] RedIn;
reg clk, Up, Dw, frame, reset;
reg[2:0] sw;
wire[3:0] RedOut;

GapVerticalComponent UUT (.Vcount(Vcount), .UpStartingPosition(UpStartingPosition), .RedIn(RedIn), .clk(clk), .Up(Up), 
                          .Dw(Dw), .frame(frame), .reset(reset), .sw(sw), .RedOut(RedOut));
                          
parameter PERIOD = 10;
                              parameter real DUTY_CYCLE = 0.5;
                              parameter OFFSET = 2;
                          
                              initial    // Clock process for clkin
                              begin
                                  #OFFSET
                                    clk = 1'b1;
                                  forever
                                  begin
                                      #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = ~clk;
                                  end
                              end
                              
                             initial
                             begin
                             UpStartingPosition = 10'b0000010000;
                             RedIn = 4'b0000;
                             Up = 1'b0;
                             Dw = 1'b0;
                             frame = 1'b0;
                             reset = 1'b1;
                             sw[0] = 1'b0;
                             sw[1] = 1'b0;
                             sw[2] = 1'b0;
                             
                              end                         
endmodule
