`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/07 10:40:18
// Design Name: 
// Module Name: DMA
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


module DMA(
    input  clk,
    input  rstn,
    input  direction_control,

    input  mem_to_dma_enable,       // control data from dma to mem
    output dma_to_mem_valid,
    input  mem_to_dma_valid,        // control data from mem to dma
    output dma_to_mem_enable,
    input  cpu_to_dma_valid,        // control data from cpu to dma
    output reg dma_to_cpu_enable,
    input  cpu_to_dma_enable,       // control data from dma to cpu
    output reg dma_to_cpu_valid,

    output [3 : 0] mem_data_in,
    input  [3 : 0] mem_data_out,
    output reg [7 : 0] cpu_data_in,
    input  [7 : 0] cpu_data_out
);
    // transmission direction
    parameter MEM_TO_CPU = 1'b0;
    parameter CPU_TO_MEM = 1'b1;
    reg direction;

    // set direction when reset
    always @(negedge rstn) begin
        direction <= direction_control;
    end

    // state
    parameter BUF1_READ_BUF2_WRITE = 1'b0;
    parameter BUF1_WRITE_BUF2_READ = 1'b1;
    reg state;

    // change state
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            state <= BUF1_READ_BUF2_WRITE;
        end else begin
            if (!dma_to_cpu_valid && !dma_to_cpu_enable
             && !dma_to_mem_enable && !dma_to_mem_valid) begin
                state = ~state;
            end
        end
    end

    // two buffer: BUF1, BUF2
    reg  buf1_input_valid, buf1_output_enable;
    wire buf1_input_enable, buf1_output_valid;
    reg  [7 : 0] buf1_data_in;
    wire [7 : 0] buf1_data_out;
    FIFO BUF1 (
        .clk            (clk),
        .rstn           (rstn),
        .input_enable   (buf1_input_enable),
        .input_valid    (buf1_input_valid),
        .output_enable  (buf1_output_enable),
        .output_valid   (buf1_output_valid),
        .data_in        (buf1_data_in),
        .data_out       (buf1_data_out)
    );

    reg  buf2_input_valid, buf2_output_enable;
    wire buf2_input_enable, buf2_output_valid;
    reg  [7 : 0] buf2_data_in;
    wire [7 : 0] buf2_data_out;
    FIFO BUF2 (
        .clk            (clk),
        .rstn           (rstn),
        .input_enable   (buf2_input_enable),
        .input_valid    (buf2_input_valid),
        .output_enable  (buf2_output_enable),
        .output_valid   (buf2_output_valid),
        .data_in        (buf2_data_in),
        .data_out       (buf2_data_out)
    );

    // data_join
    reg  buf_to_join_enable;    // join_output_enable
    wire join_to_buf_valid;     // join_output_valid
    wire [7 : 0] join_data_out;
    data_join obj_data_join (
        .clk(clk),
        .rstn(rstn),
        .input_valid(mem_to_dma_valid),
        .input_enable(dma_to_mem_enable),
        .data_in(mem_data_out),
        .output_valid(join_to_buf_valid),
        .output_enable(buf_to_join_enable),
        .data_out(join_data_out)
    );

    // data_split
    reg  buf_to_split_valid;    // split_input_valid
    wire split_to_buf_enable;   // split_input_enable
    reg  [7 : 0] split_data_in;
    data_split obj_data_split (
        .clk(clk),
        .rstn(rstn),
        .input_valid(buf_to_split_valid),
        .input_enable(split_to_buf_enable),
        .data_in(split_data_in),
        .output_valid(dma_to_mem_valid),
        .output_enable(mem_to_dma_enable),
        .data_out(mem_data_in)
    );

    // select BUFs and ports
    // buf_to_split_valid: ready to write into split(mem), connected to buf's output_valid
    // valid when direction is CPU_TO_MEM
    always @(*) begin
        case ({direction, state})
            {CPU_TO_MEM, BUF1_READ_BUF2_WRITE}:
                buf_to_split_valid = buf1_output_valid;
            {CPU_TO_MEM, BUF1_WRITE_BUF2_READ}:
                buf_to_split_valid = buf2_output_valid;
            default: 
                buf_to_split_valid = 1'b0;
        endcase
    end

    // dma_to_cpu_enable: allow cpu to write, connected to buf's input_enable
    // valid when direction is CPU_TO_MEM
    always @(*) begin
        case ({direction, state})
            {CPU_TO_MEM, BUF1_WRITE_BUF2_READ}:
                dma_to_cpu_enable = buf1_input_enable;
            {CPU_TO_MEM, BUF1_READ_BUF2_WRITE}:
                dma_to_cpu_enable = buf2_input_enable;
            default:
                dma_to_cpu_enable = 1'b0;
        endcase
    end

    
    // dma_to_cpu_valid: ready to write into cpu, connected to buf's output_valid
    // valid when direction is MEM_TO_CPU
    always @(*) begin
        case ({direction, state})
            {MEM_TO_CPU, BUF1_READ_BUF2_WRITE}:
                dma_to_cpu_valid = buf1_output_valid;
            {MEM_TO_CPU, BUF1_WRITE_BUF2_READ}:
                dma_to_cpu_valid = buf2_output_valid;
            default:
                dma_to_cpu_valid = 1'b0;
        endcase
    end

    // buf_to_join_enable: allow join(mem) to write, connected to buf's input_enable
    // valid when direction is MEM_TO_CPU
    always @(*) begin
        case ({direction, state})
            {MEM_TO_CPU, BUF1_WRITE_BUF2_READ}:
                buf_to_join_enable = buf1_input_enable;
            {MEM_TO_CPU, BUF1_READ_BUF2_WRITE}:
                buf_to_join_enable = buf2_input_enable;
            default:
                buf_to_join_enable = 1'b0;
        endcase
    end

    // buf1_input_valid: whether ready to write into buf1
    // valid when BUF1_WRITE
    always @(*) begin
        case ({state, direction})
            {BUF1_WRITE_BUF2_READ, CPU_TO_MEM}:
                buf1_input_valid = cpu_to_dma_valid;
            {BUF1_WRITE_BUF2_READ, MEM_TO_CPU}:
                buf1_input_valid = join_to_buf_valid;
            default:
                buf1_input_valid = 1'b0;
        endcase
    end

    // buf1_output_enable: whether allow buf1 to read 
    // valid when BUF1_READ
    always @(*) begin
        case ({state, direction})
            {BUF1_READ_BUF2_WRITE, CPU_TO_MEM}:
                buf1_output_enable = split_to_buf_enable;
            {BUF1_READ_BUF2_WRITE, MEM_TO_CPU}:
                buf1_output_enable = cpu_to_dma_enable;
            default:
                buf1_output_enable = 1'b0;
        endcase
    end

    // buf2_input_valid: whether ready to write into buf2
    // valid when BUF2_WRITE
    always @(*) begin
        case ({state, direction})
            {BUF1_READ_BUF2_WRITE, CPU_TO_MEM}:
                buf2_input_valid = cpu_to_dma_valid;
            {BUF1_READ_BUF2_WRITE, MEM_TO_CPU}:
                buf2_input_valid = join_to_buf_valid;
            default:
                buf2_input_valid = 1'b0;
        endcase
    end

    // buf2_output_enable: whether allow buf2 to read 
    // valid when BUF2_READ
    always @(*) begin
        case ({state, direction})
            {BUF1_WRITE_BUF2_READ, CPU_TO_MEM}:
                buf2_output_enable = split_to_buf_enable;
            {BUF1_WRITE_BUF2_READ, MEM_TO_CPU}:
                buf2_output_enable = cpu_to_dma_enable;
            default:
                buf2_output_enable = 1'b0;
        endcase
    end

    // buf1_data_in
    // valid when BUF1_WRITE
    always @(*) begin
        case ({state, direction})
            {BUF1_WRITE_BUF2_READ, CPU_TO_MEM}:
                buf1_data_in = cpu_data_out;
            {BUF1_WRITE_BUF2_READ, MEM_TO_CPU}:
                buf1_data_in = join_data_out;
            default:
                buf1_data_in = 8'h00;
        endcase
    end

    // buf2_data_in
    // valid when BUF2_WRITE
    always @(*) begin
        case ({state, direction})
            {BUF1_READ_BUF2_WRITE, CPU_TO_MEM}:
                buf2_data_in = cpu_data_out;
            {BUF1_READ_BUF2_WRITE, MEM_TO_CPU}:
                buf2_data_in = join_data_out;
            default:
                buf2_data_in = 8'h00;
        endcase
    end

    // split_data_in
    // valid when CPU_TO_MEM
    always @(*) begin
        case ({direction, state})
            {CPU_TO_MEM, BUF1_READ_BUF2_WRITE}:
                split_data_in = buf1_data_out;
            {CPU_TO_MEM, BUF1_WRITE_BUF2_READ}:
                split_data_in = buf2_data_out;
            default:
                split_data_in = 8'h00;
        endcase
    end

    // cpu_data_in
    // valid when MEM_TO_CPU
    always @(*) begin
        case ({direction, state})
            {MEM_TO_CPU, BUF1_READ_BUF2_WRITE}:
                cpu_data_in = buf1_data_out;
            {MEM_TO_CPU, BUF1_WRITE_BUF2_READ}:
                cpu_data_in = buf2_data_out;
            default:
                cpu_data_in = 8'h00;
        endcase
    end
 
endmodule
