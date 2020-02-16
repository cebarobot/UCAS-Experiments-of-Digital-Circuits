`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/24 10:56:18
// Design Name: 
// Module Name: test_add_1
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


module test_add_1();
    reg in_0;
    reg in_1;
    reg cin;

    add_1 tadd_1(
        .in_0(in_0),
        .in_1(in_1),
        .cin(cin),
        .out(out),
        .cout(cout)
    );

    initial begin
        in_0 = 1'b0;
        in_1 = 1'b0;
        cin = 1'b0;
    end

    always begin
        #2;
        in_0 = $random() % 2;
        in_1 = $random() % 2;
        cin = $random() % 2;
    end
endmodule
