`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/31 10:00:00
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


module FIFO(
    input clk,
    input rstn,
    input input_valid,
    output reg input_enable, 
    output output_valid, 
    input output_enable,
    input [3:0] data_in,
    output reg [7:0] data_out
);
    // buffer, 8 bits * 8 lines
    reg [7:0] buff [7:0];
    reg is_full;
    
    assign output_valid = ~input_enable;
    
    reg [2:0] addr;
    reg part;

    always @(posedge clk or negedge rstn) begin
        if (~rstn) begin
            addr <= 3'h0;
            part <= 1'b0;
            input_enable <= 1'b1;
        end else begin
            if (input_valid && input_enable) begin
                if (~part) begin
                    buff[addr][3:0] <= data_in[3:0];
                end else begin
                    buff[addr][7:4] <= data_in[3:0];
                end
                if (part) begin                
                    if (addr == 3'h7) begin 
                        input_enable <= 1'b0;
                        addr = 0;
                    end else begin
                        addr <= addr + 1;
                    end
                end
                part <= ~part;
            end else if (output_valid && output_enable) begin
                data_out[7:0] = buff[addr][7:0];
                if (addr == 3'h7) begin 
                    input_enable <= 1'b1;
                    addr = 0;
                end else begin
                    addr <= addr + 1;
                end
            end
        end
    end

endmodule
