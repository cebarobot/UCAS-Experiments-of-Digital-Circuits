`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/31 10:52:31
// Design Name: 
// Module Name: test_FIFO
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


module test_FIFO_random();
    reg clk;
    reg rstn;
    reg input_valid;
    wire input_enable;
    wire output_valid; 
    reg output_enable;
    reg [3:0] data_in;
    wire [7:0] data_out;

    FIFO obj_FIFO(
        .clk(clk),
        .rstn(rstn),
        .input_valid(input_valid),
        .input_enable(input_enable),
        .output_enable(output_enable),
        .output_valid(output_valid),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        clk = 1'b0;
        rstn = 1'b1;
        #0.1 rstn = 1'b0;
        #0.2 rstn = 1'b1;
        input_valid = 0;
        output_enable = 0;
        data_in = 4'h0;
    end

    always begin
        #1 clk = ~clk;
    end

    always begin
        #2;
        input_valid = $random() %2;
        output_enable = $random() %2;
        data_in = $random() % 16;
    end
endmodule
