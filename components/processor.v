module processor(
    input wire clk,
    input wire reset,
    // Inputs to processor
    input wire [7:0] pc_addr,
    // Outputs from processor
    output reg[7:0] pc_out_addr,
    output wire [7:0] inst,
    output reg [7:0] result,
    output reg [7:0] readData1,
    output reg [7:0] readData2,
    output reg [7:0] dataOut
);

// Declare a wire to hold the program counter value
wire [7:0] pc_counter_value;

program_counter PC(
   clk,
   reset,
   enable,
   .pc(pc_addr),
   .pc_out_addr(pc_counter_value)
);


always @* begin
    pc_out_addr = pc_counter_value;
end

wire [7:0] instruction;
// Instantiate Instruction Memory
ins_mem InstructionMemory (
    .pc_addr(pc_addr),
    .inst(instruction)
);

assign inst = instruction;

assign rs1_addr = instruction[3:2];
assign rs2_addr = instruction[5:4];

wire op_code;
assign op_code = instruction[7:6];

wire RegWrite;              // Output RegWrite signal
wire MemWrite;              // Output MemWrite signal
wire MemRead;               // Output MemRead signal
wire ALUSrc;                // Output ALUSrc signal

control_unit CU(
    .opcode(op_code),
    .RegWrite(RegWrite),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .ALUSrc(ALUSrc)
);


// Instantiate Register File
register_file RF (
    .clk(clk),
    .reset(reset),
    .rs1_addr(rs1_addr),
    .rs2_addr(rs2_addr),
    .wr_addr(wr_addr),
    .wr_data(mux1Output),
    .rs1_data(readData1),
    .rs2_data(readData2)
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

endmodule
