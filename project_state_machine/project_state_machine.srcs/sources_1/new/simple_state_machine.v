`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/29 09:51:05
// Design Name: 
// Module Name: simple_state_machine
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


module simple_state_machine(
    input clk,
    input rstn,
    input a,
    output reg  out
);

    localparam S0 = 2'b00;
    localparam S1 = 2'b01;

    reg [1:0] state;
    reg [1:0] next_state;

    always @ (negedge rstn or posedge clk) begin
        if (!rstn) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

    always @ (state or a) begin
        case (state)
            S0: begin
                if (a == 0) begin
                    next_state = S0;
                end else begin
                    next_state = S1;
                end
            end
            S1: begin
                next_state = a? S1 : S0;
            end
            default: begin
                next_state = S0;
            end
        endcase
    end

    always @ (state) begin
        case (state)
            S0: begin
                out <= 1'b0;
            end
            S1: begin
                out <= 1'b1;
            end
            default: begin
                out <= 1'bx;
            end
        endcase
    end

endmodule
