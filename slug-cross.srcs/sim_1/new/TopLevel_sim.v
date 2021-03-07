`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2018 01:38:01 PM
// Design Name: 
// Module Name: TopLevel_sim
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


module TopLevel_sim();

reg clkin, btnU, btnD, btnL, btnR;
reg [15:0] sw;
wire Hsync, Vsync;
wire [3:0] vgaRed, vgaBlue, vgaGreen;

TopLevel UUT (.clkin(clkin), .btnU(btnU), .btnD(btnD), .btnL(btnL), .btnR(btnR), .sw(sw),
              .Hsync(Hsync), .Vsync(Vsync), .vgaRed(vgaRed), .vgaBlue(vgaBlue), .vgaGreen(vgaGreen));


parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 2;

    initial    // Clock process for clkin
    begin
        #OFFSET
		  clkin = 1'b1;
        forever
        begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clkin = ~clkin;
        end
	end
	
   initial
   begin
   btnU = 1'b0;
   btnD = 1'b0;
   btnR = 1'b0;
   btnL = 1'b0;
   sw[15:0] = 1'b0;
   #1000;
   sw[1] = 1'b1;
   #100;
   sw[1] = 1'b0;
   #100;
   
	end
endmodule
