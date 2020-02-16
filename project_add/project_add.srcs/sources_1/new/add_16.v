`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/24 10:14:14
// Design Name: 
// Module Name: add_16
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


module add_16(
    input [15:0] in_0,
    input [15:0] in_1,
    input cin,
    output [15:0] out,
    output cout
);

    wire [2:0] in_cout;    

    add_4 in_add_4_0(
        .in_0(in_0[3:0]),
        .in_1(in_1[3:0]),
        .cin(cin),
        .out(out[3:0]),
        .cout(in_cout[0])
    );

    add_4 in_add_4_1(
        .in_0(in_0[7:4]),
        .in_1(in_1[7:4]),
        .cin(in_cout[0]),
        .out(out[7:4]),
        .cout(in_cout[1])
    );

    add_4 in_add_4_2(
        .in_0(in_0[11:8]),
        .in_1(in_1[11:8]),
        .cin(in_cout[1]),
        .out(out[11:8]),
        .cout(in_cout[2])
    );

    add_4 in_add_4_3(
        .in_0(in_0[15:12]),
        .in_1(in_1[15:12]),
        .cin(in_cout[2]),
        .out(out[15:12]),
        .cout(cout)
    );

endmodule
