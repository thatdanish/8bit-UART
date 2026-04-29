`default_nettype none

module uart_baud_gen(
    input logic clk_i,
    input logic rst_i,
    input logic[10:0] baud_div_i,
    output logic tick_o
);


/*
    Clock freq (f) = 125 Mhz
    Baud Rate (Bd) = 9600 bit/s
    Oversampling = 16

    Baud Div = _____f_____
                16 * Bd
*/

logic [10:0] counter;

always_ff @( posedge clk_i ) begin 
    if (~rst_i) counter <= '0;
    else begin
       counter <= (counter== baud_div_i-1) ? '0 : counter+1; 
    end    
end

assign tick_o = (counter == baud_div_i-1) ? 1'b1 : 1'b0;

endmodule