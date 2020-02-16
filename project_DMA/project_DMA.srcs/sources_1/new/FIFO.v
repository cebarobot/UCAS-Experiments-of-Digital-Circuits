`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/15 01:11:33
// Design Name: 
// Module Name: FIFO
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


module FIFO #(
    parameter WIDTH = 8,
    parameter DEEPTH = 8,
    parameter ADDR_WIDTH = 3
) (
    input   clk,
    input   rstn,
    input   input_valid,
    output  input_enable, 
    output  output_valid, 
    input   output_enable,
    input  [WIDTH - 1 : 0]  data_in,
    output [WIDTH - 1 : 0]  data_out
);
    // FIFO state
    parameter READ = 1'b0;
    parameter WRITE = 1'b1;
    reg state;
    assign input_enable = (state == WRITE);
    assign output_valid = (state == READ);
    
    // BUFF
    reg [WIDTH - 1 : 0] memory [DEEPTH - 1 : 0];

    // pointer
    reg [ADDR_WIDTH - 1 : 0] read_p;
    reg [ADDR_WIDTH - 1 : 0] write_p;

    // memory write pointer increment;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            write_p <= 0;
        end else if (input_valid && input_enable) begin
            if (write_p == (DEEPTH - 1)) begin
                write_p <= 0;
            end else begin
                write_p <= write_p + 1;
            end
        end
    end

    // memory write
    always @(posedge clk) begin
        if (input_valid && input_enable) begin
            memory[write_p] <= data_in;
        end
    end
    
    // memory read pointer increment;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            read_p <= 0;
        end else if (output_valid && output_enable) begin
            if (read_p == (DEEPTH - 1)) begin
                read_p <= 0;
            end else begin
                read_p <= read_p + 1;
            end
        end
    end

    // memory read
    assign data_out = memory[read_p];
    
    // state change
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= WRITE;
        end else begin
            if (input_valid && input_enable && write_p == (DEEPTH - 1)) begin
                state <= READ;                
            end else if (output_valid && output_enable && read_p == (DEEPTH - 1)) begin
                state <= WRITE;
            end
        end
    end

endmodule