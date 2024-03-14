`timescale 1ns / 1ps
`include "program_counter.v"

module ProgramCounter_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk;       // Clock signal
    reg reset;     // Reset signal
    reg enable;    // Enable signal
    wire [7:0] pc; // Program counter output

    // Instantiate the module under test
    ProgramCounter uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .pc(pc)
    );

    // Clock generation
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Initializations
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        enable = 0;

        // Wait for a few clock cycles
        #10;

        // De-assert reset
        reset = 0;
        // Enable the counter
        enable = 1;

        // Apply some clock cycles to observe the output
        #100;
        // Disable the counter
        enable = 0;

        // End simulation
        $finish;
    end

    // Display PC output
    always @(posedge clk) begin
        $display("Program Counter: %d", pc);
    end

endmodule
