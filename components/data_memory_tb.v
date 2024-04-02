
`timescale 1ns / 1ps

module data_memory_tb;

  // Clock period
  parameter integer CLK_PERIOD = 10; // Clock period in simulation time units

  // Signals
  reg clk;                // Clock signal
  reg [7:0] data_in;      // Data input to RAM
  reg wr, rd;             // Write and read control signals
  reg [7:0] add;          // Address input
  wire [7:0] data_out;    // Data output from RAM

  // Instantiate the RAM module
  data_memory mem (
    .clk(clk),
    .data_in(data_in),
    .wr(wr),
    .rd(rd),
    .add(add),
    .data_out(data_out)
  );

  // Clock generation
  initial begin
    clk = 0;              // Initialize clock to 0
    repeat (CLK_PERIOD/2) #1 clk = ~clk; // Toggle the clock with half the period
  end

  // Stimulus
  initial begin
    wr = 0;               // Initialize write control signal to 0
    rd = 0;               // Initialize read control signal to 0
    add = 8'b00000000;    // Initialize address to 0
    data_in = 8'b00000000;// Initialize data_in to 0

    #20; // Wait a bit before starting

    // Write to memory location 5
    wr = 1;               // Set write control signal to 1
    add = 8'b00000101;    // Set address to 5
    data_in = 8'b10101010;// Set data_in to 10101010
    #20; // Wait a bit

    // Read from memory location 5
    wr = 0;               // Set write control signal to 0
    rd = 1;               // Set read control signal to 1
    add = 8'b00000101;    // Set address to 5
    #20; // Wait a bit

    // End simulation
    $finish;              // Finish simulation
  end

  // Display results
  always @(posedge clk) begin
    $display("Time: %0t, Read Data: %h", $time, data_out); // Display read data and simulation time
  end

endmodule

