// Arithmetic Logic Unit (ALU) Module
module alu (
    input [7:0] rs_data1,     // Input data from the first source register
    input [7:0] rs_data2,     // Input data from the second source register
    input [1:0] alu_op,       // ALU operation code
    input alu_src,            // Determine if its immediate or Rtype
    output reg [7:0] result   // Output result of ALU operation
);
    initial begin
     result = 8'b00000000;
    end 
    // Define parameters for ALU operation codes
    parameter ADD = 2'b00;     // Addition
    parameter SUB = 2'b01;     // Subtraction
    parameter SLL = 2'b10;     // Shift Left Logical
    parameter AND = 2'b11;     // Bitwise AND

    // Perform ALU operation based on alu_op
    always @(*) begin
        if(alu_src) begin
            result = rs_data1 + rs_data2;
        end else begin
            case (alu_op)
                ADD: result = rs_data1 + rs_data2;    // Perform addition
                SUB: result = rs_data1 - rs_data2;    // Perform subtraction
                SLL: result = rs_data1 << rs_data2;  // Perform left logical shift
                AND: result = rs_data1 & rs_data2;   // Perform bitwise AND
                default: result = 8'b0 ;// Default value is no op
            endcase
        end
    end

endmodule
