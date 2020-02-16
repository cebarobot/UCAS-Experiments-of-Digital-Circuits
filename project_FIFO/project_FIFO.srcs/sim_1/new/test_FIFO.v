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


module test_FIFO();
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
    end

    initial begin
        input_valid = 1;
        output_enable = 0;
        //0
        data_in = 4'h6;
        #2;
        input_valid = 0;
        #2;
        input_valid = 1;
        data_in = 4'h9;
        //`
        #2 data_in = 4'h1;
        #2 data_in = 4'h2;
        //2
        #2 data_in = 4'h3;
        #2 data_in = 4'h4;
        //3
        #2 data_in = 4'h5;
        #2 data_in = 4'h6;
        //4
        #2 data_in = 4'h7;
        #2 data_in = 4'h8;
        //5
        #2 data_in = 4'h9;
        #2 data_in = 4'ha;
        //6
        #2 data_in = 4'hb;
        #2 data_in = 4'hc;
        // 7
        #2 data_in = 4'hf;
        #2 data_in = 4'he;
        // output
        #2;
        input_valid = 0;
        output_enable = 1;
        #18;
        input_valid = 1;
        output_enable = 0;
        //0
        data_in = 4'h6;
        #2;
        input_valid = 0;
        #2;
        input_valid = 1;
        data_in = 4'h9;
        //`
        #2 data_in = 4'h0;
        #2 data_in = 4'h9;
        //2
        #2 data_in = 4'h8;
        #2 data_in = 4'h7;
        //3
        #2 data_in = 4'h6;
        #2 data_in = 4'h5;
        //4
        #2 data_in = 4'h4;
        #2 data_in = 4'h3;
        //5
        #2 data_in = 4'h2;
        #2 data_in = 4'h1;
        //6
        #2 data_in = 4'h1;
        #2 data_in = 4'h2;
        // 7
        #2 data_in = 4'h2;
        #2 data_in = 4'h3;
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
