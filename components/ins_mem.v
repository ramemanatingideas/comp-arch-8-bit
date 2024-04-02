module ins_mem(inst,pc_addr);   
    input [7:0] pc_addr;
    output [7:0] inst;
    reg [7:0] inst;
    reg [7:0] ins_mem[255:0];
    initial begin		          
          $readmemb("InsMem.mem",ins_mem);                         
    end   
    always @(pc_addr)
        begin
            inst <= ins_mem[pc_addr];
        end
endmodule