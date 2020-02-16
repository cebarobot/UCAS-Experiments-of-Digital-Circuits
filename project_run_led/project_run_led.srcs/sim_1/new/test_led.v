`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/26 11:00:10
// Design Name: 
// Module Name: test_led
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


module test_led();

reg     clk;
reg     resetn;

led u_led(
    .clk    (clk),  // input
    .resetn (resetn),
    .led    ()      // output
);

initial begin
    clk = 1'b0;
    resetn = 1'b0;
    #1000;
    resetn = 1'b1;
end
always #5 clk = ~clk;

endmodule
