`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/19 10:46:14
// Design Name: 
// Module Name: add_4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//      add module to add oprands with 4 bits
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module add_4(
    input [3:0] in_0,           // add aprand 1
    input [3:0] in_1,           // add oprand 2
    input cin,                  // 
    output [3:0] out,
    output cout
);
//    wire [4:0] sum;
//    assign sum = in_0 + in_1 + cin;
//    assign cout = sum[4];
//    assign out = sum[3:0;
    assign {cout, out} = in_0 + in_1 + cin;
endmodule
