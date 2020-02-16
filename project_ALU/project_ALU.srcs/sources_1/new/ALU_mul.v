`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/10 10:42:32
// Design Name: 
// Module Name: ALU_mul
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


module ALU_mul #(
    parameter DATA_WIDTH = 4
)(
    input  clk,
    input  enable,
    output busy,
    input  [DATA_WIDTH - 1 : 0] operand1,
    input  [DATA_WIDTH - 1 : 0] operand2,
    output [DATA_WIDTH - 1 : 0] result
);
    // cnt: counter
    reg [DATA_WIDTH - 1 : 0] cnt;
    always @(posedge clk) begin
        if (!enable) begin
            cnt <= 0;
        end else begin
            if (cnt == operand2) begin
                cnt <= 0;
            end else begin
                cnt <= cnt + 1'b1;
            end
        end
    end

    // result
    reg [DATA_WIDTH - 1 : 0] result_r;
    assign result = result_r;
    always @(posedge clk) begin
        if (!enable) begin
            result_r <= 0;
        end else begin
            if (cnt == operand2) begin
                result_r <= 0;
            end else begin
                result_r <= result_r + operand1;
            end
        end
    end

    // busy
    assign busy = enable & (cnt != operand2);

endmodule
