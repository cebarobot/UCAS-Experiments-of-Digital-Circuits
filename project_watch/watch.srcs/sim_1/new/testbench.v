`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/12 09:41:04
// Design Name: 
// Module Name: testbench
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


module testbench(

    );
   reg clk;
   reg resetn;

    watch u_watch(
        .clk     (clk   ), 
        .resetn  (resetn), 
        .set     (1'b0  ), 
        .key_col1(),
        .key_col2(), 
        .key_row2(1'b0  ), 
        .key_row3(1'b0  ), 
        .key_row4(1'b0  ),
        .num0_scan_select(), 
        .num0_seg7()
    );;

   initial
   begin
       clk = 1'b0;
       resetn = 1'b0;
       #200;
       resetn = 1'b1;
       #300;
    //    force u_watch.one_second = 1'b1;
   end 
   always #5 clk <= ~clk;

endmodule
