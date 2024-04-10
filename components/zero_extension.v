`timescale 1ns / 1ps

module zero_extension(
    input [1:0] input_data,       // Input data to be zero-extended
    output reg [7:0] output_data  // Zero-extended output data
);
    // Zero extension operation
    always @* begin
//        output_data = {{6{input_data[1]}}, input_data};
        output_data = {6'b0, input_data};
    end
endmodule
