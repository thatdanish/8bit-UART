<center> 

# Universal Asynchronous Receiver-Transmitter (UART)

</center>

Universal Asynchronous Receiver-Transmitter (UART) is a commonly used serial data transmission protocol.

## Implementation
This repository contains RTL implementation of 8-bit UART, written in system-verilog. Implementation is mainly divided into four major modules or blocks, baud rate generator, transmitted and receiver modules, respectively.

### Exemplar parameters
- Clock freq (f<sub>clk</sub>) = 20 MHz
- Baud Rate (B<sub>d</sub>) = 9600 bits/s
- Oversampling = 16 
  
    Therefore, 
    $$
        Baud Divisor = \frac{20}{16*9600} ≈ 130
    $$