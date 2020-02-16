`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/05 09:54:26
// Design Name: 
// Module Name: ALU
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

`include "opcode_define.v"

module ALU #(
    parameter OPCODE_WIDTH = 6,
    parameter DATA_WIDTH = 4
)(
    input   clk,
    input   rstn,
    output  ALU_busy,
    output  error,
    output  dividing_by_zero,
    output  overflow,
    input  [OPCODE_WIDTH - 1 : 0]   opcode,
    input  [DATA_WIDTH - 1 : 0]     operand1,
    input  [DATA_WIDTH - 1 : 0]     operand2,
    output [DATA_WIDTH - 1 : 0]     result
);
    // add module
    wire [DATA_WIDTH - 1 : 0] unsigned_add_result;
    wire unsigned_add_overflow;
    ALU_add ALU_unsigned_add_obj(
        .operand1(operand1),
        .operand2(operand2),
        .result(unsigned_add_result),
        .unsigned_overflow(unsigned_overflow)
    );

    // sub module
    wire [DATA_WIDTH - 1 : 0] unsigned_sub_operand2;
    assign unsigned_sub_operand2 = ~operand2 + 1'b1;
    wire [DATA_WIDTH - 1 : 0] unsigned_sub_result;
    wire unsigned_sub_overflow;
    ALU_add ALU_unsigned_sub_obj(
        .operand1(operand1),
        .operand2(unsigned_sub_operand2),
        .result(unsigned_sub_result),
        .unsigned_overflow(unsigned_sub_overflow)
    );

    // mul module
    wire unsigned_mul_enable;
    assign unsigned_mul_enable = (opcode == `UMUL);
    wire unsigned_mul_busy;
    wire [DATA_WIDTH - 1 : 0] unsigned_mul_result;
    ALU_mul ALU_unsigned_mul_obj(
        .clk(clk),
        .operand1(operand1),
        .operand2(operand2),
        .result(unsigned_mul_result),
        .enable(unsigned_mul_enable),
        .busy(unsigned_mul_busy)
    );

    // div & mod module
    wire unsigned_div_enable;
    assign unsigned_div_enable = (opcode == `UDIV) | (opcode == `UMOD);
    wire unsigned_div_busy;
    wire [DATA_WIDTH - 1 : 0] unsigned_div_result;
    wire [DATA_WIDTH - 1 : 0] unsigned_mod_result;
    ALU_div ALU_unsigned_div_obj(
        .clk(clk),
        .operand1(operand1),
        .operand2(operand2),
        .result_div(unsigned_div_result),
        .result_mod(unsigned_mod_result),
        .enable(unsigned_div_enable),
        .busy(unsigned_div_busy)
    );
    
    // choose result
    assign result[DATA_WIDTH - 1 : 0] = 
        (opcode == `UADD)? unsigned_add_result :
        (opcode == `USUB)? unsigned_sub_result :
        (opcode == `UMUL)? unsigned_mul_result :
        (opcode == `UDIV)? unsigned_div_result :
        (opcode == `UMOD)? unsigned_mod_result :
        0;
    
    // choose ALU_busy
    assign ALU_busy = 
        (opcode == `UMUL)? unsigned_mul_busy :
        (opcode == `UDIV)? unsigned_div_busy :
        (opcode == `UMOD)? unsigned_div_busy :
        0;

endmodule

`include "opcode_undefine.v"