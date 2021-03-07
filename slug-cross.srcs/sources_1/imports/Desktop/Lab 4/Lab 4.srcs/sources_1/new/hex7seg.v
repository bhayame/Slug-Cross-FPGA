`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2018 01:49:26 PM
// Design Name: 
// Module Name: hex7seg
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


module hex7seg(
    input [3:0] n,
    input e,
    output [6:0] seg
    );
    
    
    m8_1e mux0 (.in({1'b0, n[0], n[0], 1'b0,1'b00, ~n[0], 1'b0, n[0]}),        .sel({n[3], n[2], n[1]}), .e(e), .o(seg[0]));
    m8_1e mux1 (.in({1'b1, ~n[0], n[0], 1'b0, ~n[0], n[0], 1'b0, 1'b0}),       .sel({n[3], n[2], n[1]}), .e(e), .o(seg[1]));
    m8_1e mux2 (.in({1'b1,  ~n[0], 1'b0, 1'b0, 1'b0, 1'b0, ~n[0], 1'b0}),             .sel({n[3], n[2], n[1]}), .e(e), .o(seg[2]));
    m8_1e mux3 (.in({n[0], 1'b0, ~n[0], n[0], n[0], ~n[0], 1'b0, n[0]}), .sel({n[3], n[2], n[1]}), .e(e), .o(seg[3]));
    m8_1e mux4 (.in({1'b0, 1'b0, 1'b0, n[0], n[0], 1'b1, n[0], n[0]}),         .sel({n[3], n[2], n[1]}), .e(e), .o(seg[4]));
    m8_1e mux5 (.in({1'b0, n[0], 1'b0, 1'b0, n[0], 1'b0, 1'b1, n[0]}),            .sel({n[3], n[2], n[1]}), .e(e), .o(seg[5]));
    m8_1e mux6 (.in({1'b0, ~n[0], 1'b0, 1'b0, n[0], 1'b0, 1'b0, 1'b1}),              .sel({n[3], n[2], n[1]}), .e(e), .o(seg[6]));

    
    
endmodule
