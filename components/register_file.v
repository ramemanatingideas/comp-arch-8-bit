// Register File Module
module register_file (
    input wire clk,            // Clock signal
    input wire reset,          // Reset signal
    input [1:0] rs1_addr,      // Address for the first source register
    input [1:0] rs2_addr,      // Address for the second source register
    input [1:0] wr_addr,       // Address where data is to be written
    input [7:0] wr_data,       // Data to be written into the register file
    input reg_wr_en,           // Write enable signal
    output reg [7:0] rs1_data, // Data from the first source register
    output reg [7:0] rs2_data  // Data from the second source register
);

    reg [7:0] registers [0:3]; // Define an array of registers with 4 8-bit registers

    // Write data into the register file when reg_wr_en is high
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Initialize registers to 0 during reset
            for (int i = 0; i < 4; i = i + 1) begin
                registers[i] <= 8'b0;
            end
        end else if (reg_wr_en) begin
            // Write data into the register specified by wr_addr
            registers[wr_addr] <= wr_data;
        end
    end

    // Assign data to the output ports based on the addresses provided
    always @* begin
        // Extract data from the register file based on the rs1_addr
        case (rs1_addr)
            2'b00: rs1_data = registers[0]; // Register $s0
            2'b01: rs1_data = registers[1]; // Register $s1
            2'b10: rs1_data = registers[2]; // Register $s2
            2'b11: rs1_data = registers[3]; // Register $s3
            default: rs1_data = 8'b0; // Default value
        endcase

        // Extract data from the register file based on the rs2_addr
        case (rs2_addr)
            2'b00: rs2_data = registers[0]; // Register $s0
            2'b01: rs2_data = registers[1]; // Register $s1
            2'b10: rs2_data = registers[2]; // Register $s2
            2'b11: rs2_data = registers[3]; // Register $s3
            default: rs2_data = 8'b0; // Default value
        endcase
    end

endmodule
