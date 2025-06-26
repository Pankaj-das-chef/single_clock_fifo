`timescale 1ns / 1ps

module single_clock_fifo_tb;

// Inputs
reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [7:0] buf_in;

// Outputs
wire [7:0] buf_out;
wire buf_empty;
wire buf_full;
wire [7:0] fifo_counter;


single_clock_fifo uut (
    .clk(clk), 
    .rst(rst), 
    .buf_in(buf_in), 
    .buf_out(buf_out), 
    .wr_en(wr_en), 
    .rd_en(rd_en), 
    .buf_empty(buf_empty), 
    .buf_full(buf_full), 
    .fifo_counter(fifo_counter)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end


initial begin
    // Initial conditions
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    buf_in = 8'd0;

    // Apply reset
    #10 rst = 0;

    // WRITE Phase: Write 4 values
    repeat(4) begin
        @(posedge clk);
        wr_en = 1;
        rd_en = 0;
        buf_in = buf_in + 8'd10;  // Write 10, 20, 30, 40
    end
    @(posedge clk);
    wr_en = 0;  // Stop writing

    // IDLE Phase
    @(posedge clk);

    // READ Phase: Read 4 values
    repeat(4) begin
        @(posedge clk);
        rd_en = 1;
        wr_en = 0;
    end
    @(posedge clk);
    rd_en = 0;

    // Observe buf_out
    @(posedge clk);

    // Finish simulation
    #20 $finish;
end


endmodule
