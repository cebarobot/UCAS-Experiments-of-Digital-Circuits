`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/29 10:13:51
// Design Name: 
// Module Name: state_machine
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


module state_machine(
    input clk,
    input rstn,
    input a,
    input b,
    output reg out,
    output reg err
);

    localparam S0 = 3'h0;
    localparam S1 = 3'h1;
    localparam S2 = 3'h2;
    localparam S3 = 3'h3;
    localparam S4 = 3'h4;
    localparam S5 = 3'h5;

    reg [2:0] state;
    reg [2:0] next_state;

    always @(negedge rstn or posedge clk) begin
        if (!rstn) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

    always @(state or a or b) begin
        case (state)
            S0: begin
                if (a == 1 && b == 1) begin
                    next_state = S1;
                    out = 0;
                    err = 0;
                end else if (a == 0 && b == 0) begin
                    next_state = S5;
                    out = 1;
                    err = 0;
                end else begin
                    next_state = S0;
                    out = 0;
                    err = 1;
                end
            end
            S1: begin
                if (a == 1 && b == 0) begin
                    next_state = S4;
                    out = 1;
                    err = 0;
                end else if (a == 0 && b == 1) begin
                    next_state = S3;
                    out = 0;
                    err = 0;
                end else begin
                    next_state = S1;
                    out = 0;
                    err = 1;
                end
            end
            S2: begin
                if (a == 1 && b == 0) begin
                    next_state = S5;
                    out = 0;
                    err = 0;
                end else if (a == 0 && b == 0) begin
                    next_state = S1;
                    out = 1;
                    err = 0;
                end else begin
                    next_state = S2;
                    out = 0;
                    err = 1;
                end
            end
            S3: begin
                if (a == 1 && b == 0) begin
                    next_state = S4;
                    out = 1;
                    err = 0;
                end else if (a == 0 && b == 0) begin
                    next_state = S2;
                    out = 0;
                    err = 0;
                end else begin
                    next_state = S3;
                    out = 0;
                    err = 1;
                end
            end
            S4: begin
                if (a == 1 && b == 0) begin
                    next_state = S3;
                    out = 0;
                    err = 0;
                end else if (a == 0 && b == 1) begin
                    next_state = S5;
                    out = 1;
                    err = 0;
                end else begin
                    next_state = S4;
                    out = 0;
                    err = 1;
                end
            end
            S5: begin
                if (a == 0 && b == 0) begin
                    next_state = S5;
                    out = 0;
                    err = 0;
                end else if (a == 1 && b == 0) begin
                    next_state = S0;
                    out = 1;
                    err = 0;
                end else begin
                    next_state = S5;
                    out = 0;
                    err = 1;
                end
            end
        endcase
    end


endmodule
