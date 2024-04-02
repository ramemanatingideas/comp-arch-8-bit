`timescale 1ns / 1ps

module tb_register_file;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk;
    reg reset;
    reg [1:0] rs1_addr;
    reg [1:0] rs2_addr;
    reg [1:0] wr_addr;
    reg [7:0] wr_data;
    reg reg_wr_en;
    wire [7:0] rs1_data;
    wire [7:0] rs2_data;

    // Instantiate the register file module
    register_file dut (
        .clk(clk),
        .reset(reset),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .wr_addr(wr_addr),
        .wr_data(wr_data),
        .reg_wr_en(reg_wr_en),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Initial stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        rs1_addr = 2'b00; // Testing register 0
        rs2_addr = 2'b01; // Testing register 1
        wr_addr = 2'b10;  // Writing to register 2
        wr_data = 8'b10101010;
        reg_wr_en = 1;

        // Wait for a few clock cycles
        #20;

        // Release reset
        reset = 0;

        // Wait for a few clock cycles
        #20;

        // Disable write enable
        reg_wr_en = 0;

        // Display initial values
        $display("Initial state:");
        $display("rs1_data: %b, rs2_data: %b", rs1_data, rs2_data);

        // Perform some operations (you can modify this section for more tests)
        // For example, you can toggle inputs, change addresses, etc.

        // Wait for simulation to finish
        #100;

        // End simulation
        $finish;
    end

endmodule
