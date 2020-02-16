`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/16 21:51:17
// Design Name: 
// Module Name: test_data_join
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


module test_data_join();
    reg clk;
    reg rstn;
    reg input_valid;
    wire input_enable;
    wire output_valid;
    reg output_enable;
    reg [3 : 0] data_in;
    wire [7 : 0] data_out;
    reg [7 : 0] joined_data;

    data_join obj_data_join (
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
    end

    always begin
        #1;
        clk = ~ clk;
    end

    always begin
        #2;
        output_enable = $random() % 2;
        input_valid = $random() % 2;
        data_in = $random() % 16;
    end

    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            joined_data <= 0;
        end else if (output_valid) begin
            joined_data <= data_out;
        end
    end

endmodule
