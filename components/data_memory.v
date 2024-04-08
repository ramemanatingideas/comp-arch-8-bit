`timescale 1ns / 1ps
module data_memory(
  input clk,                 // Clock input
  input [7:0] data_in,       // Data input to be written to memory
  input wr,                  // Write control signal
  input rd,                  // Read control signal
  input [7:0] addr,           // Address input
  output reg [7:0] data_out  // Data output read from memory
);

 reg [7:0] memory [0:255];  // Declaration of 256x8-bit RAM array

  always @(negedge clk) begin
//    $display("write control signal: wr: %b, Address: %b", wr, addr);
//    $display("data_in: %b", data_in);
    if (wr) begin
      memory[addr] <= data_in; 
    end
  end
 
  always @(addr or rd) begin
//   $display("read control signal (only reading): rd: %b with addr %b", rd, addr);
    if (rd) begin
      data_out = memory[addr];  
    end
    else begin
      data_out = 8'bzzzzzzzz;      // If rd is low, output high-impedance ("don't care" state)
    end
  end

endmodule
