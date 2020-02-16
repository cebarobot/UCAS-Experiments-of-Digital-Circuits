`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/19 10:57:55
// Design Name: 
// Module Name: test_add_4
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


module test_add_4;

    reg [3:0] a0;           // add oprand
    reg [3:0] a1;
    reg carry_in;
    wire [3:0] sum;         // the sum of a0 and a1
    wire carry_out;
    
    add_4 instance_add_4(
        .in_0(a0),
        .in_1(a1),
        .cin(carry_in),
        .out(sum),
        .cout(carry_out)
    );
    
    initial begin
        a0 = 4'b0000;
        a1 = 4'b0000;
        carry_in = 1'b0;
    end
    
    always begin
        #1;
        a0 = $random() % 16;
        a1 = $random() % 16;
        carry_in = $random() %2;
    end
endmodule
