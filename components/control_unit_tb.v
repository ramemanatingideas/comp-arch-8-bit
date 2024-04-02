`timescale 1ns / 1ps

module control_unit_tb;

    // Parameters
    parameter CLK_PERIOD = 10;

    // Signals
    reg [1:0] opcode;           
    wire RegWrite;              
    wire MemWrite;              
    wire MemRead;               
    wire ALUSrc;                

    // Instantiate the control_unit module
    control_unit cu (
        .opcode(opcode),
        .RegWrite(RegWrite),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .ALUSrc(ALUSrc)
    );

    // Initial stimulus
    initial begin
        // Apply opcode values
        opcode = 2'b00;  // Opcode 00
        #10;
        $display("Opcode: %b, RegWrite: %b, MemWrite: %b, MemRead: %b, ALUSrc: %b", opcode, RegWrite, MemWrite, MemRead, ALUSrc);

        opcode = 2'b01;  // Opcode 01
        #10;
        $display("Opcode: %b, RegWrite: %b, MemWrite: %b, MemRead: %b, ALUSrc: %b", opcode, RegWrite, MemWrite, MemRead, ALUSrc);

        opcode = 2'b10;  // Opcode 10
        #10;
        $display("Opcode: %b, RegWrite: %b, MemWrite: %b, MemRead: %b, ALUSrc: %b", opcode, RegWrite, MemWrite, MemRead, ALUSrc);

        opcode = 2'b11;  // Opcode 11
        #10;
        $display("Opcode: %b, RegWrite: %b, MemWrite: %b, MemRead: %b, ALUSrc: %b", opcode, RegWrite, MemWrite, MemRead, ALUSrc);

        opcode = 2'b01;  // Another Opcode 01
        #10;
        $display("Opcode: %b, RegWrite: %b, MemWrite: %b, MemRead: %b, ALUSrc: %b", opcode, RegWrite, MemWrite, MemRead, ALUSrc);

        // Finish simulation
        $finish;
    end

endmodule
