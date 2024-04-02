`timescale 1ns / 1ps

module data_memory(

  input clk,                
  input [7:0] data_in,       
  input wr,                  
  input rd,                  
  input [7:0] add,          
  output reg [7:0] data_out 
);

 reg [7:0] memory [0:255];  
  always @(posedge clk) begin
    if (wr) begin
      memory[add] <= data_in;
    end
  end

  always @(*) begin
    if (rd) begin
      data_out = memory[add]; 
    end
    else begin
      data_out = 8'bzzzzzzzz;
    end
  end

endmodule
