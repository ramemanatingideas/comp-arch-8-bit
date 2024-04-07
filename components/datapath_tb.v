`timescale 1ns / 1ps

module datapath_tb;

// Parameters
parameter CLK_PERIOD = 10; // Clock period in ns

// Signals
reg clk;
reg reset;
reg enable;

wire [7:0] pc_out_addr;
wire [7:0] instruction;
wire [7:0] result;
wire [7:0] readData1;
wire [7:0] readData2;

 // Outputs from the processor for register contents and control signals
 wire reg0, reg1, reg2, reg3, rs1_addr, rs2_addr, op_code;
 wire ALUSrc, MemRead, MemWrite, RegWrite, ALUOp, reg_write;
 wire [7:0] alu_result, rs1_data, rs2_data, imm, write_data;


// Instantiate the processor module
datapath dut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .pc_out_addr(pc_out_addr),
    .inst(instruction),
    .result(result),
    .readData1(readData1),
    .readData2(readData2)
);

// Assume the processor has outputs for the instruction currently being executed
// and the values of the registers
//assign pc_out_addr = dut.pc_out_addr;
//assign inst = dut.inst;
assign ALUSrc = dut.alu_src;
assign rs1_addr = dut.rs1_addr;
assign rs2_addr = dut.rs2_addr;
assign op_code = dut.op_code;
//assign MemRead = dut.MemRead;
//assign MemWrite = dut.MemWrite;
//assign RegWrite = dut.RegWrite;
assign alu_op = dut.alu_op;
assign reg_write = dut.reg_write;
assign MemRead = dut.mem_read;
assign MemWrite = dut.mem_write;
assign read_data1 = dut.read_data1;
assign read_data2 = dut.read_data2;
assign alu_result = dut.alu_result;
assign imm = dut.imm;
assign write_data = dut.mux_wb_out;

//assign rs2_data = dut.rs2_data;
//assign write_data = dut.write_data;



//generate clock to sequence tests
//always
//begin
//clk <= 1; # 5; clk <= 0; # 5;
//end

// Clock generation
//always #((CLK_PERIOD)/2) clk = ~clk;
initial begin
clk = 0;
forever #5 clk = ~clk;
end



// Stimulus
initial begin
    reset = 1; 
    enable=0;
    # 10;
    reset = 0;
    enable = 1;

    // Wait for some time to observe outputs
    #10;

    // Add more test cases here as needed
    // Display PC output
end

always @(posedge clk) begin
           // $display("PC: %h, Instruction: %h, ALUOp: %b, ALUSrc: %b, ALUResult: %0h, RegWrite: %b, MemRead: %b, MemWrite: %b",
             //    pc_out_addr, inst, ALUOp, ALUSrc, result, RegWrite, MemRead, MemWrite);
       $display("PC: %h, Instruction: %h, ALU Result: %b, ReadData1: %b, ReadData2: %b, rs1_addr: %b, rs2_addr: %b, wb_result: %b, Opcode: %b, ALUSrc: %h, Imm: %h",
        pc_out_addr, instruction, alu_result, read_data1, read_data2, rs1_addr, rs2_addr ,write_data, op_code, ALUSrc, imm);
end

initial begin
 // End simulation
    #100;
    $finish;
end

endmodule
