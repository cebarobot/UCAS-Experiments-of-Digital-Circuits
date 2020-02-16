`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/08 20:33:44
// Design Name: 
// Module Name: test_add_4_new
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


module test_add_4_new();
    reg [3:0] ina;
    reg [3:0] inb;
    reg cin;
    wire [3:0] sum;
    wire cout;

    add_4_new inside_add_4_new(
        .a(ina),
        .b(inb),
        .s(sum)
    );
    assign inside_add_4_new.cin = cin;
    assign cout = inside_add_4_new.cout;

    initial begin
        ina = 4'h0;
        inb = 4'b0000;
        cin = 1'b0;
    end

    always begin
        #2;
        ina = $random() % 16;
        inb = $random() % 16;
        cin = $random() % 2;
    end
endmodule
