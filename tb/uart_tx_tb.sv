`timescale 1ns/1ns

module uart_tx_tb ();

localparam ClOCKPERIOD = 50; // 20 MHz clock

logic rst_i, tick_i, ready_o, data_bit_o;
logic data_valid_i = 1'b0;
logic clk_i = 1'b0;
logic [7:0] data_i;
logic [4:0] baud_div_counter = 5'd0;

always #(ClOCKPERIOD/2) clk_i = !clk_i; 

initial begin
    rst_i = 1'b0;
    #(21*ClOCKPERIOD);
    rst_i = 1'b1;
end

// Test Cases

always_ff @( posedge clk_i ) begin 
    baud_div_counter <= baud_div_counter + 'd1;
end
assign tick_i = (baud_div_counter == 'd30);

initial begin
    wait(ready_o == 1'b1);
    @(posedge clk_i);
    data_valid_i = 1'b1;
    data_i = 8'd4;
    wait(ready_o ==  1'b0);
    @(posedge clk_i);
    data_valid_i = 1'b0;

    wait(ready_o == 1'b1);
    @(posedge clk_i);
    data_valid_i = 1'b1;
    data_i = 8'd16;
    wait(ready_o ==  1'b0);
    @(posedge clk_i);
    data_valid_i = 1'b0;
end

// DUT

uart_tx uart_tx_i (
    .clk_i,
    .rst_i,
    .data_i,
    .tick_i,
    .data_valid_i,
    .ready_o,
    .data_bit_o
);

initial begin
    #(10000*ClOCKPERIOD);
    $finish;
end

initial begin
    $dumpfile("./temp/uart_tx.vcd");
    $dumpvars(0, uart_tx_tb);
end

endmodule