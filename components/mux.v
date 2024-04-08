module mux2 #(parameter BIT_LEN=8) 
         (     input [BIT_LEN-1:0] input1,
               input [BIT_LEN-1:0] input2,
               input  select,
               output [BIT_LEN-1:0] out );
    assign out = select == 0 ? input1 : input2;
endmodule 
