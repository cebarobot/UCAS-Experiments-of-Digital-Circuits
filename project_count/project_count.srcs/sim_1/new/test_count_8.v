`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/24 10:31:45
// Design Name: 
// Module Name: test_count_8
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


module test_count_8();
    reg clk;
    reg resetn;
    wire [2:0] count;
    wire c_out;

    count_8 inside_count_8(
        .clk(clk),
        .resetn(resetn),
        .count(count),
        .c(c_out)
    );

    initial begin
        clk = 1'b0;
        resetn = 1'b0;
    end

    always begin
        #1 clk = ~clk;
    end

    always begin
        #2;
        resetn = $random() % 2;
    end

endmodule
