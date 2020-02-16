`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/29 10:04:47
// Design Name: 
// Module Name: test_simple_state_machine
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


module test_simple_state_machine();
    reg clk;
    reg rstn;
    reg a;
    wire out;

    simple_state_machine inside_ssm(
        .clk(clk),
        .rstn(rstn),
        .a(a),
        .out(out)
    );

    initial begin
        clk = 0;
        rstn = 1;
        #0.1 rstn = 0;
        #1.1 rstn = 1;
    end

    initial begin
        a = 0;
        #4 a = 1;
        #4 a = 0;
    end

    always begin
        #1 clk = ~clk;
    end
endmodule
