`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/08 20:32:29
// Design Name: 
// Module Name: add_4_new
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


module add_4_new(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
);
    wire [4:0] sum;
    assign sum = a + b + cin;
    assign cout = sum[4];
    assign s = sum[3:0];
endmodule
