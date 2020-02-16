`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/16 16:10:22
// Design Name: 
// Module Name: test_FIFO_new
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


module test_FIFO_new();
    reg clk;
    reg rstn;
    reg input_valid;
    wire input_enable;
    wire output_valid; 
    reg output_enable;
    reg [7:0] data_in;
    wire [7:0] data_out;

    FIFO_new obj_FIFO(
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
    end

    initial begin
        input_valid = 1;
        output_enable = 0;
        //0
        data_in = 8'h6;
        #2;
        input_valid = 0;
        #2;
        input_valid = 1;
        data_in = 8'h9;
        //`
        #2 data_in = 8'h1;
        #2 data_in = 8'h2;
        //2
        #2 data_in = 8'h3;
        #2 data_in = 8'h4;
        //3
        #2 data_in = 8'h5;
        #2 data_in = 8'h6;
        //4
        #2 data_in = 8'h7;
        #2 data_in = 8'h8;
        //5
        #2 data_in = 8'h9;
        #2 data_in = 8'ha;
        //6
        #2 data_in = 8'hb;
        #2 data_in = 8'hc;
        // 7
        #2 data_in = 8'hf;
        #2 data_in = 8'he;
        // output
        #2;
        input_valid = 0;
        output_enable = 1;
        #18;
        input_valid = 1;
        output_enable = 0;
        //0
        data_in = 8'h6;
        #2;
        input_valid = 0;
        #2;
        input_valid = 1;
        data_in = 8'h9;
        //`
        #2 data_in = 8'h0;
        #2 data_in = 8'h9;
        //2
        #2 data_in = 8'h8;
        #2 data_in = 8'h7;
        //3
        #2 data_in = 8'h6;
        #2 data_in = 8'h5;
        //4
        #2 data_in = 8'h4;
        #2 data_in = 8'h3;
        //5
        #2 data_in = 8'h2;
        #2 data_in = 8'h1;
        //6
        #2 data_in = 8'h1;
        #2 data_in = 8'h2;
        // 7
        #2 data_in = 8'h2;
        #2 data_in = 8'h3;
        // output
        #2;
        input_valid = 0;
        output_enable = 1;
        #18;
        input_valid = 1;
    end

    always begin
        #1 clk = ~clk;
    end
endmodule

