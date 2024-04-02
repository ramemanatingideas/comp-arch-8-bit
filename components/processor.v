module processor(
    input wire clk,
    input wire reset,
    // Inputs to processor
    input wire [1:0] opcode,
    input wire [7:0] rs_data1,
    input wire [7:0] rs_data2,
    input wire [1:0] immediate,
    input wire [1:0] alu_op,
    input wire reg_wr_en,
    input wire [1:0] rs1_addr,
    input wire [1:0] rs2_addr,
    input wire [1:0] wr_addr,
    input wire [7:0] wr_data,
    input wire wr,
    input wire rd,
    input wire [7:0] add,
    // Outputs from processor
    output reg [7:0] result,
    output reg [7:0] readData1,
    output reg [7:0] readData2,
    output reg [7:0] dataOut
);

// Instantiate modules
ProgramCounter PC (
    .clk(clk),
    .reset(reset),
    .enable(1), // Assuming PC is always enabled
    .pc()
);

alu ALU (
    .rs_data1(rs_data1),
    .rs_data2(rs_data2),
    .immediate(immediate),
    .alu_op(alu_op),
    .result(result)
);

control_unit CU (
    .opcode(opcode),
    .RegWrite(RegWrite),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .ALUSrc(ALUSrc)
);

register_file RF (
    .clk(clk),
    .reset(reset),
    .rs1_addr(rs1_addr),
    .rs2_addr(rs2_addr),
    .wr_addr(wr_addr),
    .wr_data(wr_data),
    .reg_wr_en(reg_wr_en),
    .rs1_data(readData1),
    .rs2_data(readData2)
);

zero_extension ZE (
    .input_data(immediate),
    .output_data()
);

data_memory DM (
    .clk(clk),
    .data_in(wr_data),
    .wr(wr),
    .rd(rd),
    .add(add),
    .data_out(dataOut)
);

// Connect zero extension module
assign ZE.output_data = immediate;

// Connect ALU output to data memory address
always @* begin
    if (ALUSrc)
        DM.add = result;
    else
        DM.add = add;
end

// Connect ALU output to register file write data
assign wr_data = result;

endmodule
