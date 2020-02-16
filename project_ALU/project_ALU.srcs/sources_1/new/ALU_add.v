`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/05 10:50:32
// Design Name: 
// Module Name: ALU_add
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


module ALU_add #(
    parameter DATA_WIDTH = 4
)(
    input  [DATA_WIDTH -1 : 0] operand1,
    input  [DATA_WIDTH -1 : 0] operand2,
    output signed_overflow,
    output unsigned_overflow,
    output [DATA_WIDTH -1 : 0] result
);
    // overflow and result
    wire carry;
    assign {carry, result[DATA_WIDTH -1 : 0]} = operand1[DATA_WIDTH -1 : 0] + operand2[DATA_WIDTH -1 : 0];

    // unsigned_overflow
    assign unsigned_overflow = carry;
endmodule
