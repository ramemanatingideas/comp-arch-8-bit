`timescale 1ns / 1ps

module tb_zero_extension;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg [7:0] input_data;       // Input data to be zero-extended
    wire [7:0] output_data;     // Zero-extended output data

    // Instantiate the Zero Extension module
    zero_extension dut (
        .input_data(input_data),
        .output_data(output_data)
    );

    // Initial stimulus
    initial begin
        // Initialize input data
        input_data = 7'b01001100; // Example input data

        // Wait for some time
        #10;

        // Display initial values
        $display("Input data: %b", input_data);
        $display("Output data: %b", output_data);

        // End simulation
        $finish;
    end

endmodule
