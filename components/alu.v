// Arithmetic Logic Unit (ALU) Module
module alu (
    input [7:0] rs_data1,     // Input data from the first source register
    input [7:0] rs_data2,     // Input data from the second source register
    input [1:0] immediate,    // Immediate value for SW and LW instructions
    input [1:0] alu_op,       // ALU operation code
    output reg [7:0] result   // Output result of ALU operation
);

    // Define parameters for ALU operation codes
    parameter ADD = 2'b00;     // Addition
    parameter SUB = 2'b01;     // Subtraction
    parameter SLL = 2'b10;     // Shift Left Logical
    parameter AND = 2'b11;     // Bitwise AND

    // Perform ALU operation based on alu_op
    always @* begin
        case (alu_op)
            ADD: result = rs_data1 + rs_data2;    // Perform addition
            SUB: result = rs_data1 - rs_data2;    // Perform subtraction
            SLL: result = rs_data1 << rs_data2;  // Perform left logical shift
            AND: result = rs_data1 & rs_data2;   // Perform bitwise AND
            2'b10: result = {rs_data1[7:immediate], rs_data1[6:0]}; // SW: Store the 8-bit value from rs_data1 to memory
            2'b11: result = {8'b0, rs_data1[7:immediate]};          // LW: Load a word from memory to register
            default: result = 8'b0;                                  // Default value
        endcase
    end

endmodule
