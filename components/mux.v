module mux(input [8:0] a,
               input [8:0] b,
               input  sel,
               output [8:0] out );

    assign out = sel == 0 ? a : b;
endmodule
