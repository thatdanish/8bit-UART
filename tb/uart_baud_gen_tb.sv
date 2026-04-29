`timescale 1ns/1ns

module uart_baud_gen_tb ();

localparam ClOCKPERIOD = 50; // 20 MHz clock
logic rst_i, tick_o;
logic clk_i =1'b0;
logic [10:0] baud_div_i = 11'd130;

always #(ClOCKPERIOD/2) clk_i = !clk_i; 

initial begin
    rst_i = 1'b0;
    #(20*ClOCKPERIOD);
    rst_i = 1'b1;
end

uart_baud_gen uart_baud_gen_i (
    .clk_i,
    .rst_i,
    .baud_div_i,
    .tick_o
);

initial begin
    #(1000*ClOCKPERIOD);
    $finish;
end

initial begin
    $dumpfile("./temp/uart_baud_gen.vcd");
    $dumpvars(0, uart_baud_gen_tb);

end

endmodule