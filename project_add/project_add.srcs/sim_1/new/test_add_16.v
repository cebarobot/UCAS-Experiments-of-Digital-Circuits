`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/24 10:27:27
// Design Name: 
// Module Name: test_add_16
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


module test_add_16();
    
    reg[15:0] tin_0;
    reg[15:0] tin_1;
    reg tcin;

    wire[15:0] tout;
    wire tcout;
    
    add_16 tadd_16(
        .in_0(tin_0),
        .in_1(tin_1),
        .cin(tcin),
        .out(tout),
        .cout(tcout)
    );

    initial begin
        tin_0 = 16'h0000;
        tin_1 = 16'h0000;
        tcin = 1'b0;
    end // initial

    always begin
        #2;
        tin_0 = $random() % (1 << 16);
        tin_1 = $random() % (1 << 16);
        tcin = $random() % 2;
    end // always
endmodule
