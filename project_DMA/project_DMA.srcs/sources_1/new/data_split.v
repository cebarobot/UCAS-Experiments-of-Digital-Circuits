`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/16 20:03:47
// Design Name: 
// Module Name: data_split
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


module data_split#(
    parameter INPUT_WIDTH = 8,
    parameter OUTPUT_WIDTH = 4,
    parameter CNT_WIDTH = 1
) (
    input   clk,
    input   rstn,
    output  input_enable,
    input   input_valid,
    input   output_enable,
    output  output_valid, 
    input  [INPUT_WIDTH - 1 : 0]    data_in,
    output [OUTPUT_WIDTH - 1 : 0]   data_out
);
    // whether output is valid depends on whether input is valid
    assign output_valid = input_valid;

    // counter
    parameter MAX_CNT =  INPUT_WIDTH / OUTPUT_WIDTH;
    reg [CNT_WIDTH - 1 : 0] cnt;
    
    // enable input
    assign input_enable = output_enable && output_valid && cnt == MAX_CNT - 1;

    // cnt increment
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            cnt <= 0;
        end else if (output_enable && output_valid) begin
            if (cnt == MAX_CNT - 1) begin
                cnt <= 0;
            end else begin
                cnt <= cnt + 1;
            end
        end
    end

    // read 
    assign data_out = data_in[cnt * OUTPUT_WIDTH +: OUTPUT_WIDTH];

endmodule
