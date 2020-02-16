`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/10 10:24:05
// Design Name: 
// Module Name: test_ALU
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


module test_ALU();
    reg clk;
    reg rstn;
    reg [5:0] opcode;
    reg [3:0] operand1;
    reg [3:0] operand2;
    wire ALU_busy;
    wire [3:0] result;

    initial begin
        clk = 0;
        rstn = 1;
        opcode = 0;
        operand1 = 0;
        operand2 = 0;
    end

    always begin
        #2;
        clk = ~clk;
    end

    ALU ALU_obj(
        .clk(clk),
        .rstn(rstn),
        .operand1(operand1),
        .operand2(operand2),
        .result(result),
        .opcode(opcode),
        .ALU_busy(ALU_busy)
    );

    always @(posedge clk) begin
        if (!ALU_busy) begin
            opcode <= $random() % 6'd4;
            // opcode <= $random() % 6'd2 + 6'd4;
            operand1 <= $random() % (1'b1 << 4);
            operand2 <= $random() % (1'b1 << 4);
        end
    end
endmodule
