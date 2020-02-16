`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/16 22:14:35
// Design Name: 
// Module Name: test_add_4_2
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


module test_add_4_2();
    reg[3:0] a, b;
    reg cin;
    wire[3:0] sum;
    wire cout;
    integer i, j;

    add_4 adder(a, b, cin, sum, cout);

    always #5 cin = ~cin;

    initial begin
        a = 0;
        b = 0;
        cin = 0;
        for(i = 0; i < 16; i = i + 1)
            #10 a=i;
    end
endmodule
