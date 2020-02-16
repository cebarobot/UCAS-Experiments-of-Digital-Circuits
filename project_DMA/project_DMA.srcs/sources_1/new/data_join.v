`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/16 20:05:05
// Design Name: 
// Module Name: data_join
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


module data_join #(
    parameter INPUT_WIDTH = 4,
    parameter OUTPUT_WIDTH = 8,
    parameter CNT_WIDTH = 1
) (
    input   clk,
    input   rstn,
    input   input_valid,
    output  input_enable, 
    output  output_valid, 
    input   output_enable,
    input  [INPUT_WIDTH - 1 : 0]    data_in,
    output [OUTPUT_WIDTH - 1 : 0]   data_out
);
    // whether input is enabled depends on whether output is enabled.
    assign input_enable = output_enable;

    // counter
    parameter MAX_CNT = OUTPUT_WIDTH / INPUT_WIDTH;
    reg [CNT_WIDTH - 1 : 0] cnt;

    // buffer
    reg [OUTPUT_WIDTH - 1 : 0] buffer;
    assign data_out = buffer;

    // data_ready
    reg data_ready;
    assign output_valid = data_ready;

    // check whether data is ready
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            data_ready <= 1'b0;
        end else if (data_ready && output_enable) begin
            data_ready <= 1'b0;
        end else if (!data_ready && input_valid && input_enable && cnt == MAX_CNT - 1) begin
            data_ready <= 1'b1;
        end
    end
    
    // cnt increment
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            cnt <= 0;
        end else if (input_valid && input_enable) begin
            if (cnt == MAX_CNT - 1) begin
                cnt <= 0;
            end else begin
                cnt <= cnt + 1;
            end
        end
    end

    // save into buffer
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            buffer <= 0;
        end else if (input_valid && input_enable) begin
            buffer[cnt * INPUT_WIDTH +: INPUT_WIDTH] <= data_in;
        end
    end

endmodule
