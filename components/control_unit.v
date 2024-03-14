module control_unit(input [1:0] opcode,
                    output reg ALUop,
                    output reg RegWrite,
                    output reg MemWrite,
                    output reg MemRead,
                    output reg ALUSrc);
    always @* begin
        begin
            case (opcode)
                2'b00: begin
                    ALUop = 2'b00
                    RegWrite = 0
                    MemWrite = 0
                    MemRead = 0
                    ALUSrc = 0
                end
                2'b01: begin
                    ALUop = 2'b00
                    RegWrite = 1
                    MemWrite = 0
                    MemRead = 1
                    ALUSrc = 0
                end
                2'b10: begin
                    ALUop = 2'b00
                    RegWrite = 0
                    MemWrite = 1
                    MemRead = 0
                    ALUSrc = 0
                end
                2'b11: begin
                    ALUop = 2'b00
                    RegWrite = 0
                    MemWrite = 0
                    MemRead = 0
                    ALUSrc = 0
                end

                default: begin
                    ALUop = 2'b00
                    RegWrite = 0
                    MemWrite = 0
                    MemRead = 0
                    ALUSrc = 0
                end
            endcase
        end
    end