`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/24 10:50:53
// Design Name: 
// Module Name: add_1
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


module add_1(
    input in_0,
    input in_1,
    input cin,
    output out,
    input cout
);
    assign cout = (in_0 & in_1) | (in_0 & cin) | (in_1 & cin);
    assign out = (in_0 ^ in_1) ^ cin;
endmodule
