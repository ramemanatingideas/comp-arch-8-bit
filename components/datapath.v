module datapath(
    input clk,
    input  reset,
    input  enable,
    // Outputs from processor
    output wire [7:0] pc_out_addr,
    output wire [7:0] inst,
    output [7:0] result,
    
    output [7:0] readData1,
    output [7:0] readData2
);

// Write back result from Mux (Mem to Reg)
wire [7:0] mux_wb_out;
reg [7:0] mux_wb_out_reg;


//assign mux_wb_out = mux_wb_out_reg;

program_counter PC(
   .clk(clk),
   .reset(reset),
   .enable(enable),
   .pc(pc_out_addr)
);


//always @* begin
//    pc_out_addr = pc_counter_value;
//end

wire [7:0] instruction;
wire [1:0] rs1_addr, rs2_addr;
// Instantiate Instruction Memory
ins_mem InstructionMemory (
    .pc_addr(pc_out_addr),
    .inst(instruction)
);

assign inst = instruction;

assign rs2_addr = instruction[3:2]; // rt/d reg
assign rs1_addr = instruction[5:4]; // rs reg

wire [1:0] op_code; // opcode
assign op_code = instruction[7:6];

wire reg_write;              // Output RegWrite signal
wire mem_write;              // Output MemWrite signal
wire mem_read;               // Output MemRead signal
wire alu_src;                // Output ALUSrc signal
wire reg_write_src;                // Output ALUSrc signal

control_unit CU(
    .opcode(op_code),
    .RegWrite(RegWrite),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .ALUSrc(ALUSrc),
    .RegWriteSrc(RegWriteSrc)
);

assign reg_write = RegWrite;
assign mem_write = MemWrite;
assign mem_read = MemRead;
assign alu_src = ALUSrc;
assign reg_write_src = RegWriteSrc;

wire [7:0] read_data1, read_data2;
// Instantiate Register File
register_file RF (
    .clk(clk),
    .reset(reset),
    .rs1_addr(rs1_addr),
    .rs2_addr(rs2_addr),
    .wr_addr(rs1_addr),
    .wr_data(mux_wb_out),
    .reg_wr_en(reg_write),
    .rs1_data(readData1),
    .rs2_data(readData2)
);

assign read_data1 = readData1;
assign read_data2 = readData2;

wire[1:0] imm;
assign imm = inst[1:0];
wire [7:0] imm_res, zero_ext_value;

zero_extension ZEX(
  .input_data(imm),
  .output_data(zero_ext_value)
);

assign imm_res = zero_ext_value;

wire[7:0] mux_alu_out, mux_out;
mux2 #(8) MUX_ALU(
    .input1(read_data2), // ALU result
    .input2(imm_res), // Extended value
    .select(alu_src), // ALU Src to determine if Itype or Rtype
    .out(mux_out)
);

assign mux_alu_out = mux_out;

wire [1:0] alu_op;
assign alu_op = inst[1:0];

wire [7:0] alu_result;

alu ALU (
    .clk(clk),
    .rs_data1(read_data1),
    .rs_data2(mux_alu_out),
    .alu_op(alu_op),
    .alu_src(alu_src),
    .result(result)
);

assign alu_result = result;

wire [7:0] mem_data, data_out;
// Instantiate Data Memory
data_memory DM (
    .clk(clk),
    .data_in(read_data2),
    .wr(mem_write),
    .rd(mem_read),
    .addr(alu_result),
    .data_out(data_out)
);

assign mem_data = data_out;

// Instantiate MUX_WB
mux2 #(8) MUX_WB (
    .input1(alu_result),
    .input2(mem_data),
    .select(reg_write_src),
    .out(mux_wb_out)
);


endmodule
