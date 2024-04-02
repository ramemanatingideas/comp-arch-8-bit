module zero_extension (
    input [7:0] input_data,       // Input data to be zero-extended
    output reg [7:0] output_data  // Zero-extended output data
);

    // Zero extension operation
    always @* begin
        output_data = input_data;  // Output data is same as input data for zero extension
    end

endmodule
