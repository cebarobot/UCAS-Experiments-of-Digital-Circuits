`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/24 10:27:31
// Design Name: 
// Module Name: count_8
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


module count_8(
    input clk,
    input resetn,
    output reg [2:0] count,
    output c
);
    // assign c = & (count & 3'h7);
    assign c = (count == 3'h7);
    always @ (posedge clk) begin
        if (count == 3'h7) begin
            count <= 3'h0;
        end else begin
            count <= (count + 1) & {3{resetn}};
        end
    end

    always @ (resetn) begin
        count <= count & {3{resetn}};
    end

endmodule
