`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/16 22:12:32
// Design Name: 
// Module Name: test_data_split
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


module test_data_split();
    reg clk;
    reg rstn;
    reg input_valid;
    wire input_enable;
    wire output_valid;
    reg output_enable;
    reg [7 : 0] data_in;
    wire [3 : 0] data_out;

    data_split obj_data_split (
        .clk(clk),
        .rstn(rstn),
        .input_valid(input_valid),
        .input_enable(input_enable),
        .output_valid(output_valid),
        .output_enable(output_enable),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        rstn = 1;
        input_valid = 1;
        output_enable = 1;
        data_in = 0;
        #0.1 rstn = 0;
        #0.2 rstn = 1;
        #100 input_valid = 0;
    end

    always begin
        #1;
        clk = ~ clk;
    end

    always @(posedge clk) begin
        output_enable <= $random() % 2;
        if (input_enable) begin
            data_in <= $random() % 256;
        end
    end

endmodule
