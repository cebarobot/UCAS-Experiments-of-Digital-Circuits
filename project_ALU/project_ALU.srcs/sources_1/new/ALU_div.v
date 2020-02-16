`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/10 10:42:32
// Design Name: 
// Module Name: ALU_div
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


module ALU_div #(
    parameter DATA_WIDTH = 4
)(
    input  clk,
    input  enable,
    output busy,
    output divide_by_zero,
    input  [DATA_WIDTH - 1 : 0] operand1,
    input  [DATA_WIDTH - 1 : 0] operand2,
    output [DATA_WIDTH - 1 : 0] result_div,
    output [DATA_WIDTH - 1 : 0] result_mod
);
    // divide by zero
    assign divide_by_zero = enable & (operand2 == 0);

    // remainder
    reg [DATA_WIDTH - 1 : 0] remainder;
    assign result_mod = remainder;
    always @(posedge clk) begin
        if (!enable || divide_by_zero) begin
            remainder <= operand1;
        end else begin
            if (remainder >= operand2) begin
                remainder <= remainder - operand2;
            end else begin
                remainder <= operand1;
            end
        end
    end

    // sum
    // reg [DATA_WIDTH - 1 : 0] sum;
    // assign result_mod = operand1 + operand2 - sum;
    // always @(posedge clk) begin
    //     if (!enable || divide_by_zero) begin
    //         sum <= 0;
    //     end else begin
    //         if (sum < operand1) begin
    //             sum <= sum + operand2;
    //         end else begin
    //             sum <= 0;
    //         end
    //     end
    // end

    // quotient 
    reg [DATA_WIDTH - 1 : 0] quotient;
    assign result_div = quotient;
    always @(posedge clk) begin
        if (!enable || divide_by_zero) begin
            quotient <= 0;
        end else begin
            if (remainder >= operand2) begin
                quotient <= quotient + 1'b1;
            end else begin
                quotient <= 0;
            end
        end
    end

    wire something;
    assign something = remainder >= operand2;
    // busy
    assign busy = enable & (remainder >= operand2) & ~divide_by_zero;
endmodule
