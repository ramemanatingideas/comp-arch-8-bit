`timescale 1ns / 1ps


module processor(input clk,
                    output [15:0] out);

parameter CLK_PERIOD = 10; // Clock period in ns

//// Instantiate the clock generator module
clock_generator clk_gen (
   .clk(clk)
);

//// Instantiate the IBUF module to buffer the clock signal, if necessary
//IBUF ibuf_inst (
//    .I(clk_gen/clk0),  // Connect the clock signal from the clock generator
//    .O(clk)  // Connect the buffered clock signal to the rest of the design
//);

// Instantiate the processor module
datapath dut (
    .clk(clk),
    .out(out)
);

endmodule
