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
   
        // Scenario 1: Write to register and read from the same register
        wr_addr = 2'b00;  // Writing to register 0
        wr_data = 8'b10101110;
        reg_wr_en = 1;
        #10; // Wait for write operation to complete
        rs1_addr = 2'b00; // Reading from register 0
        rs2_addr = 2'b01; // Reading from register 1
        #10; // Wait for read operation to complete
        $display("Scenario 1 - Write to register 0 and read from both registers:");
        $display("rs1_data: %b, rs2_data: %b", rs1_data, rs2_data);

        // Scenario 2: Simultaneous read and write operations
        wr_addr = 2'b01;  // Writing to register 1
        wr_data = 8'b11001100;
        reg_wr_en = 1;
        #10; // Wait for write operation to complete
        rs1_addr = 2'b10; // Reading from register 2
        rs2_addr = 2'b01; // Reading from register 1
        #10; // Wait for read operation to complete
        $display("Scenario 2 - Simultaneous read from register 2 and register 1 after write to register 1:");
        $display("rs1_data: %b, rs2_data: %b", rs1_data, rs2_data);

        // End simulation
        $finish;
end

endmodule
