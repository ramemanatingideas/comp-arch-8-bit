`timescale 1ns / 1ps
module alu_tb;
    // Parameters
    parameter CLK_PERIOD = 10;
    // Inputs
    reg [7:0] rs_data1_tb;
    reg [7:0] rs_data2_tb;
    reg [1:0] alu_op_tb;
    // Outputs
    wire [7:0] result_tb;
    // Instantiate the ALU module
    alu uut (
        .rs_data1(rs_data1_tb),
        .rs_data2(rs_data2_tb),
        .alu_op(alu_op_tb),
        .result(result_tb)
    );
    // Clock generation
    reg clk;
  // Clock generation
  initial begin
    clk = 0;              // Initialize clock to 0
    repeat (CLK_PERIOD/2) #1 clk = ~clk; // Toggle the clock with half the period
  end
    // Test cases
    initial begin
        // Test case 1: Addition
        rs_data1_tb = 8'd10;
        rs_data2_tb = 8'd5;
        alu_op_tb = 2'b00; // ADD
        #100;
        // Test case 2: Subtraction
        rs_data1_tb = 8'd20;
        rs_data2_tb = 8'd8;
        alu_op_tb = 2'b01; // SUB
        #100;
        // Test case 3: Left logical shift
        rs_data1_tb = 8'd8;
        rs_data2_tb = 8'd2;
        alu_op_tb = 2'b10; // SLL
        #100;
        // Test case 4: Bitwise AND
         rs_data1_tb = 8'd15;
         rs_data2_tb = 8'd10;
         alu_op_tb = 2'b11; // AND
         #100;
        $finish;
    end
    
    always @(negedge clk) begin
        $display("Result: %h", result_tb);
    end
    
    // Clock driver
//    always #PERIOD/2 clk = ~clk;
endmodule
