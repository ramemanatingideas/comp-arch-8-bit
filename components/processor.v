module processor(
    input wire clk,
    input wire reset,
    // Inputs to processor
    input wire [7:0] pc_addr, // Input for Program Counter address
    input wire [7:0] rs_data1, // Input data from Register File read data 1
    input wire [7:0] rs_data2, // Input data from Register File read data 2
    input wire [1:0] immediate, // Immediate value for ALU operations
    input wire [1:0] alu_op, // ALU operation code
    input wire reg_wr_en, // Register File write enable
    input wire [1:0] rs1_addr, // Address for the first source register
    input wire [1:0] rs2_addr, // Address for the second source register
    input wire [1:0] wr_addr, // Address for data to be written to Register File
    input wire [7:0] wr_data, // Data to be written into the Register File
    input wire wr, // Memory write enable
    input wire rd, // Memory read enable
    input wire [7:0] add, // Address for Data Memory
    input wire [1:0] regWriteSrc, // Register Write Source
    // Outputs from processor
    output reg [7:0] instruction, // Output instruction fetched from memory
    output reg [7:0] result, // Output result of ALU operation
    output reg [7:0] readData1, // Output data from Register File read data 1
    output reg [7:0] readData2, // Output data from Register File read data 2
    output reg [7:0] dataOut // Output data from Data Memory
);

// Instantiate Instruction Memory
ins_mem InstructionMemory (
    .pc_addr(pc_addr),
    .inst(instruction)
);

// Instantiate ALU
alu ALU (
    .rs_data1(rs_data1),
    .rs_data2(rs_data2),
    .immediate(immediate),
    .alu_op(alu_op),
    .result(result)
);

// Instantiate MUX2
mux2 MUX2 (
    .input1(result), // ALU result
    .input2(dataOut), // Data Memory read data
    .input3(regWriteSrc), // Register Write Source
    .output(mux2Output)
);

// Instantiate MUX1
mux1 MUX1 (
    .input1(mux2Output),
    .input2(wr_data), // Write data to Register File
    .output(mux1Output)
);

// Instantiate Register File
register_file RF (
    .clk(clk),
    .reset(reset),
    .rs1_addr(rs1_addr),
    .rs2_addr(rs2_addr),
    .wr_addr(wr_addr),
    .wr_data(mux1Output), // Write data from MUX1
    .reg_wr_en(reg_wr_en),
    .rs1_data(readData1),
    .rs2_data(readData2)
);

// Instantiate Zero Extension
zero_extension ZE (
    .input_data(immediate),
    .output_data()
);

// Instantiate Data Memory
data_memory DM (
    .clk(clk),
    .data_in(wr_data),
    .wr(wr),
    .rd(rd),
    .add(add),
    .data_out(dataOut)
);

// Instantiate Control Unit
control_unit CU (
    .opcode(instruction[7:6]), // Extract opcode from instruction
    .RegWrite(result), // Output result of ALU operation
    .MemWrite(result), // Output result of ALU operation
    .MemRead(result), // Output result of ALU operation
    .ALUSrc(result) // Output result of ALU operation
);

endmodule
