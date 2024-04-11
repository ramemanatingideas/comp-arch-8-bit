`timescale 1ns / 1ps

module datapath_tb(input clk, input reset, input enable,
                    output [7:0] rs, output [7:0] rt);


// Instantiate the processor module
datapath dut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .readData1(rs),
    .readData2(rt)
);

endmodule
