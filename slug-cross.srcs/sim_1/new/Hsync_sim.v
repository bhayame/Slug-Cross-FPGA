`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 04:30:42 PM
// Design Name: 
// Module Name: Hsync_sim
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


module VGAController_sim();

reg clk;
reg [3:0] RedIn, BlueIn, GreenIn;
wire Hsync, Vsync;
wire [3:0] vgaGreen, vgaBlue, vgaRed;
wire [9:0] Hcount, Vcount;

VGAController UUT (.clk(clk), .Hsync(Hsync), .Vsync(Vsync), .RedIn(RedIn), .BlueIn(BlueIn), .GreenIn(GreenIn), .vgaGreen(vgaGreen),
                   .vgaBlue(vgaBlue), .vgaRed(vgaRed));

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
   RedIn = 1'b0;
   BlueIn = 1'b0;
   GreenIn = 1'b0;
	end
endmodule
