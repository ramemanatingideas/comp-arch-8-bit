module program_counter(
    input wire clk,       
    input wire reset,   
    input wire enable,  
    output [7:0] pc
);

 // Register to hold the program counter value
reg [7:0] pc_reg;

initial begin 
    pc_reg <= 8'b00000000;
end

always @(posedge clk  or posedge reset ) begin
    if(reset) begin
        pc_reg <= 8'b00000000;
    end
    else if (enable) begin
            // Increment the program counter
            pc_reg <= pc_reg + 1;
    end 
end

assign pc = pc_reg;

    
endmodule
