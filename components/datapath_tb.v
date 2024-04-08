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
 wire rs1_addr, rs2_addr, op_code;
 wire ALUSrc, MemRead, MemWrite, RegWrite, ALUOp, reg_write;
 wire [7:0] alu_result, imm, write_data;


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

assign ALUSrc = dut.ALUSrc;
assign rs1_addr = dut.rs1_addr;
assign rs2_addr = dut.rs2_addr;
assign op_code = dut.op_code;
assign alu_op = dut.alu_op;
assign reg_write = dut.RegWrite;
assign MemRead = dut.MemRead;
assign MemWrite = dut.MemWrite;
assign read_data1 = dut.readData1;
assign read_data2 = dut.readData2;
assign alu_result = dut.alu_result;
assign imm = dut.imm;
assign write_data = dut.mux_wb_out;

// Clock generation
initial begin
clk = 0;
forever #5 clk = ~clk;
end

integer file;
    
// Monitor changes and write them to the file
initial begin
        file = $fopen("D:\\processor8bit_output.txt", "w");
        if (file == 0) begin
            $display("Error: could not open output file.");
            $finish;
        end

        // Write the headers to the file
        $fwrite(file, "Time\tPC\tInstruction\tReadData1:\tReadData2\tALU_Result\tALU_Src\t$ALU_OP\tWrite_Data\tRegWrite\tMemRead\tMemWrite\tImm\n");
        //Reset processor and set it to 1 and enable all components
//        reset = 1;
//        enable=0;
        #10;
        reset = 0;
        enable = 1;
end

always @(posedge clk) begin
       $display("PC: %h, Instruction: %h, ALU Result: %b, ReadData1: %h, ReadData2: %h, rs1_addr: %b, rs2_addr: %b, wb_result: %b, Opcode: %b, ALUSrc: %h, Imm: %h",
        pc_out_addr, instruction, alu_result, read_data1, read_data2, rs1_addr, rs2_addr ,write_data, op_code, ALUSrc, imm);
        
      $fwrite(file, "%0t\t%0h\t%0b\t%0b\t%0b\t%0b\t%0b\t%0b\t%0b\t%0b\t%0b\t%0b\t%0b\n",
                $time, pc_out_addr, instruction, read_data1, read_data2 ,alu_result, ALUSrc, alu_op, write_data, RegWrite, MemRead, MemWrite, imm);
end

initial begin
 // End simulation
    #200;
    $fclose(file);
    $finish;
end

endmodule
