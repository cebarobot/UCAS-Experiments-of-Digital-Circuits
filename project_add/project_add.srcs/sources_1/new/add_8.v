`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/16 22:38:22
// Design Name: 
// Module Name: add_8
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


module add_8(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
);
    wire cout_0;
    add_4 add_4_0(
        .in_0(a[3:0]),
        .in_1(b[3:0]),
        .cin(cin),
        .out(sum[3:0]),
        .cout(cout_0)
    );

    add_4 add_4_1(
        .in_0(a[7:4]),
        .in_1(b[7:4]),
        .cin(cout_0),
        .out(sum[7:4]),
        .cout(cout)
    );
endmodule
