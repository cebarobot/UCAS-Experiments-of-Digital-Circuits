`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/17 01:10:41
// Design Name: 
// Module Name: test_DMA
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


module test_DMA();
    // input and output ports of DMA module
    reg clk;
    reg rstn;
    reg direction_control;

    reg  mem_to_dma_enable;       // control data from dma to mem
    wire dma_to_mem_valid;
    reg  mem_to_dma_valid;        // control data from mem to dma
    wire dma_to_mem_enable;
    reg  cpu_to_dma_valid;        // control data from cpu to dma
    wire dma_to_cpu_enable;
    reg  cpu_to_dma_enable;       // control data from dma to cpu
    wire dma_to_cpu_valid;

    wire [3 : 0] mem_data_in;
    reg  [3 : 0] mem_data_out;
    wire [7 : 0] cpu_data_in;
    reg  [7 : 0] cpu_data_out;

    // instantiate DMA module
    DMA obj_DMA(
        .clk(clk),
        .rstn(rstn),
        .direction_control(direction_control),
        .mem_to_dma_enable(mem_to_dma_enable),
        .dma_to_mem_valid(dma_to_mem_valid),
        .mem_to_dma_valid(mem_to_dma_valid),
        .dma_to_mem_enable(dma_to_mem_enable),
        .cpu_to_dma_valid(cpu_to_dma_valid),
        .dma_to_cpu_enable(dma_to_cpu_enable),
        .cpu_to_dma_enable(cpu_to_dma_enable),
        .dma_to_cpu_valid(dma_to_cpu_valid),
        .mem_data_in(mem_data_in),
        .mem_data_out(mem_data_out),
        .cpu_data_in(cpu_data_in),
        .cpu_data_out(cpu_data_out)
    );

    // initialize log files
    integer mem_in_queue_file, mem_out_queue_file;
    integer cpu_in_queue_file, cpu_out_queue_file;
    integer counter;

    initial begin
        mem_in_queue_file = $fopen("mem_in_queue.log", "w");
        mem_out_queue_file = $fopen("mem_out_queue.log", "w");
        cpu_in_queue_file = $fopen("cpu_in_queue.log", "w");
        cpu_out_queue_file = $fopen("cpu_out_queue.log", "w");

        #2000;
        $fclose(mem_in_queue_file);
        $fclose(mem_out_queue_file);
        $fclose(cpu_in_queue_file);
        $fclose(cpu_out_queue_file);
    end

    // generate clk signal
    initial begin
        clk = 1'b0;
        rstn = 1'b1;
        direction_control = 1'b0;       // test MEM_TO_CPU
        #0.1 rstn = 1'b0;               // reset
        #0.1 rstn = 1'b1;
        #999.8;
        direction_control = 1'b1;       // test CPU_TO_MEM
        #0.1 rstn = 1'b0;               // reset
        #0.1 rstn = 1'b1;
    end
    always begin
        #1 clk = ~clk;
    end

    // use a counter to count clock cycle
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

    // initialize enable and valid signal
    initial begin
        mem_to_dma_enable = 1'b0;
        mem_to_dma_valid = 1'b0;
        cpu_to_dma_enable = 1'b0;
        cpu_to_dma_valid = 1'b0;
        mem_data_out = 4'h0;
        cpu_data_out = 8'h00;
    end

    always @(posedge clk) begin
        // generate random enable and valid signal
        mem_to_dma_enable <= $random() % 2;
        mem_to_dma_valid <= $random() % 2;
        cpu_to_dma_enable <= $random() % 2;
        cpu_to_dma_valid <= $random() % 2;
        // generate random cpu and mem signal
        mem_data_out <= $random() % 16;
        cpu_data_out <= $random() % 256;
    end

    // mem_data_in
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            $fwrite(mem_in_queue_file, "---!!!---rstn\n");
        end else begin
            if (dma_to_mem_valid && mem_to_dma_enable)
                $fwrite(mem_in_queue_file, "%d--%h\n", counter, mem_data_in);
        end
    end

    // mem_data_out
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            $fwrite(mem_out_queue_file, "---!!!---rstn\n");
        end else begin
            if (dma_to_mem_enable && mem_to_dma_valid)
                $fwrite(mem_out_queue_file, "%d--%h\n", counter, mem_data_out);
        end
    end
    
    // cpu_data_in
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            $fwrite(cpu_in_queue_file, "---!!!---rstn\n");
        end else begin
            if (dma_to_cpu_valid && cpu_to_dma_enable)
                $fwrite(cpu_in_queue_file, "%d--%h\n", counter, cpu_data_in);
        end
    end

    // cpu_data_out
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            $fwrite(cpu_out_queue_file, "---!!!---rstn\n");
        end else begin
            if (dma_to_cpu_enable && cpu_to_dma_valid)
                $fwrite(cpu_out_queue_file, "%d--%h\n", counter, cpu_data_out);
        end
    end
    
endmodule
