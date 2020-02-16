`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/29 10:56:26
// Design Name: 
// Module Name: test_state_machine
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


module test_state_machine();
    reg rstn;
    reg clk;
    reg a;
    reg b;
    wire out;
    wire err;

    state_machine inside_state_machine(
        .rstn(rstn),
        .clk(clk),
        .a(a),
        .b(b),
        .out(out),
        .err(err)
    );

    initial begin
        clk = 1;
        rstn = 1;
        a = 0;
        b = 0;
        #0.1;
        rstn = 0;
        #0.9;
        rstn = 1;
        a = 1; b = 1; // s1
        #2 a = 0; b = 1; // s3
        #2 a = 0; b = 0; // s2
        #2 a = 0; b = 0; // s1
        #2 a = 1; b = 0; // s4
        #2 a = 1; b = 0; // s3
        #2 a = 1; b = 0; // s4
        #2 a = 1; b = 1; //error at s4
        #2 a = 0; b = 1; // s5
        #2 a = 0; b = 0; // s5
        #2 a = 1; b = 1; // error at s5
        #2 a = 1; b = 0; // s0
        #2 a = 0; b = 0; // s5
    end

    always begin
        #1 clk = ~clk;
    end

endmodule
