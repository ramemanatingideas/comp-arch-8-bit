`timescale 1ns / 1ps

module mux_tb;

    // Inputs
    reg [8:0] a;
    reg [8:0] b;
    reg sel;

    // Output
    wire [8:0] out;

    // Instantiate the mux module
    mux uut(
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    // Stimulus
    initial begin
        // Initialize inputs
        a = 9'b000000001;
        b = 9'b000000010;
        sel = 1'b0;

        // Apply stimulus
        #10 sel = 1'b1;

        // Add additional test cases here

        // End simulation
        #10 $finish;
    end

    // Output display
    always @(out) begin
        $display("Output: %b", out);
    end

endmodule
