`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2018 08:22:21 PM
// Design Name: 
// Module Name: Timer_sim
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


module Timer_sim();

reg clk, frame, reset, CE;
wire [15:0] Q;

Timer UUT(.clk(clk), .frame(frame), .reset(reset), .CE(CE), .Q(Q));

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
    frame = 1'b1;
    reset = 1'b0;
    CE = 1'b1;
    #100;
	end
endmodule

