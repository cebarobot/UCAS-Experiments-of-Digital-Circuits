`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/26 10:58:17
// Design Name: 
// Module Name: led
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


module led(
    input           clk,
    input           resetn,     // low activie
    output [3:0]    led
);
reg [3:0]       led_r;
// output
assign led = led_r;

// parameter CNT_1S = 26'd49;
parameter CNT_1S = 26'd49_999_999;
reg [25:0]  count;
wire        run_begin;
assign run_begin = count == CNT_1S;

// count
always @(posedge clk) begin
    if (!resetn || run_begin) begin
        count <= 26'd0;
    end else begin
        count <= count + 1'b1;
    end
end

// led_r
always @(posedge clk) begin
    if (!resetn) begin
        led_r <= 4'b0001;
    end else if (run_begin) begin
        led_r <= {led_r[2:0], led_r[3]};
    end
end

endmodule
