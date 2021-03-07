`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2018 12:12:53 AM
// Design Name: 
// Module Name: qsecTicker_sim
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


module qsecTicker_sim();

reg clk, frame, reset;
wire qsec;

qsecTicker UUT (.clk(clk), .frame(frame), .reset(reset), .qsec(qsec));

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
	end
endmodule
