`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2024 21:30:50
// Design Name: 
// Module Name: zero_extension
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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
