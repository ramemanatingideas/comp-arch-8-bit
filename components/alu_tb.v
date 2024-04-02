{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red249\green134\blue137;\red38\green38\blue38;\red255\green255\blue255;
\red250\green181\blue122;\red117\green117\blue117;\red199\green76\blue81;\red159\green223\blue251;\red255\green255\blue154;
}
{\*\expandedcolortbl;;\cssrgb\c98824\c60784\c60784;\cssrgb\c20000\c20000\c20000;\cssrgb\c100000\c100000\c100000;
\cssrgb\c98824\c76078\c54902;\cssrgb\c53333\c53333\c53333;\cssrgb\c82745\c38824\c38824;\cssrgb\c67843\c89804\c98824;\cssrgb\c100000\c100000\c66667;
}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 `timescale 1ns / 1ps\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 module\cf4 \strokec4  alu_tb;\cb1 \
\cb3 \'a0 \'a0 \cf6 \strokec6 // Parameters\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 parameter\cf4 \strokec4  PERIOD = \cf7 \strokec7 10\cf4 \strokec4 ;\cb1 \
\cb3 \'a0 \'a0 \cf6 \strokec6 // Inputs\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 reg\cf4 \strokec4  [\cf7 \strokec7 7\cf4 \strokec4 :\cf7 \strokec7 0\cf4 \strokec4 ] rs_data1_tb;\cb1 \
\cb3 \'a0 \'a0 \cf5 \strokec5 reg\cf4 \strokec4  [\cf7 \strokec7 7\cf4 \strokec4 :\cf7 \strokec7 0\cf4 \strokec4 ] rs_data2_tb;\cb1 \
\cb3 \'a0 \'a0 \cf5 \strokec5 reg\cf4 \strokec4  [\cf7 \strokec7 1\cf4 \strokec4 :\cf7 \strokec7 0\cf4 \strokec4 ] immediate_tb;\cb1 \
\cb3 \'a0 \'a0 \cf5 \strokec5 reg\cf4 \strokec4  [\cf7 \strokec7 1\cf4 \strokec4 :\cf7 \strokec7 0\cf4 \strokec4 ] alu_op_tb;\cb1 \
\cb3 \'a0 \'a0 \cf6 \strokec6 // Outputs\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 wire\cf4 \strokec4  [\cf7 \strokec7 7\cf4 \strokec4 :\cf7 \strokec7 0\cf4 \strokec4 ] result_tb;\cb1 \
\cb3 \'a0 \'a0 \cf6 \strokec6 // Instantiate the ALU module\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 alu uut (\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .rs_data1\cf4 \strokec4 (rs_data1_tb),\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .rs_data2\cf4 \strokec4 (rs_data2_tb),\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .immediate\cf4 \strokec4 (immediate_tb),\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .alu_op\cf4 \strokec4 (alu_op_tb),\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .result\cf4 \strokec4 (result_tb)\cb1 \
\cb3 \'a0 \'a0 );\cb1 \
\cb3 \'a0 \'a0 \cf6 \strokec6 // Clock generation\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 reg\cf4 \strokec4  clk;\cb1 \
\cb3 \'a0 \'a0 \cf5 \strokec5 always\cf4 \strokec4  \cf5 \strokec5 begin\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 #PERIOD/\cf7 \strokec7 2\cf4 \strokec4  clk = ~clk;\cb1 \
\cb3 \'a0 \'a0 \cf5 \strokec5 end\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf6 \strokec6 // Test cases\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 initial\cf4 \strokec4  \cf5 \strokec5 begin\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Test case 1: Addition\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 rs_data1_tb = \cf7 \strokec7 8'd10\cf4 \strokec4 ;\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 rs_data2_tb = \cf7 \strokec7 8'd5\cf4 \strokec4 ;\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 alu_op_tb = \cf7 \strokec7 2'b00\cf4 \strokec4 ; \cf6 \strokec6 // ADD\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 #\cf7 \strokec7 100\cf4 \strokec4 ;\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Test case 2: Subtraction\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 rs_data1_tb = \cf7 \strokec7 8'd20\cf4 \strokec4 ;\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 rs_data2_tb = \cf7 \strokec7 8'd8\cf4 \strokec4 ;\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 alu_op_tb = \cf7 \strokec7 2'b01\cf4 \strokec4 ; \cf6 \strokec6 // SUB\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 #\cf7 \strokec7 100\cf4 \strokec4 ;\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Test case 3: Left logical shift\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 rs_data1_tb = \cf7 \strokec7 8'd8\cf4 \strokec4 ;\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 rs_data2_tb = \cf7 \strokec7 8'd2\cf4 \strokec4 ;\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 alu_op_tb = \cf7 \strokec7 2'b10\cf4 \strokec4 ; \cf6 \strokec6 // SLL\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 #\cf7 \strokec7 100\cf4 \strokec4 ;\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Test case 4: Bitwise AND\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // rs_data1_tb = 8'd15;\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // rs_data2_tb = 8'd10;\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // alu_op_tb = 2'b11; // AND\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // #100;\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Test case 5: SW operation\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // rs_data1_tb = 8'd32;\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // immediate_tb = 2'b10;\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // alu_op_tb = 2'b10; // SW\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // #100;\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Test case 6: LW operation\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // rs_data1_tb = 8'd0;\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // immediate_tb = 2'b11;\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // alu_op_tb = 2'b11; // LW\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // #100;\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf9 \strokec9 $stop\cf4 \strokec4 ;\cb1 \
\cb3 \'a0 \'a0 \cf5 \strokec5 end\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf6 \strokec6 // Clock driver\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 always\cf4 \strokec4  #PERIOD/\cf7 \strokec7 2\cf4 \strokec4  clk = ~clk;\cb1 \
\cf5 \cb3 \strokec5 endmodule\cf4 \cb1 \strokec4 \
}