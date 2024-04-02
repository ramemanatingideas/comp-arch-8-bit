{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red249\green134\blue137;\red38\green38\blue38;\red255\green255\blue255;
\red250\green181\blue122;\red117\green117\blue117;\red199\green76\blue81;\red159\green223\blue251;\red255\green255\blue154;
\red149\green255\blue145;}
{\*\expandedcolortbl;;\cssrgb\c98824\c60784\c60784;\cssrgb\c20000\c20000\c20000;\cssrgb\c100000\c100000\c100000;
\cssrgb\c98824\c76078\c54902;\cssrgb\c53333\c53333\c53333;\cssrgb\c82745\c38824\c38824;\cssrgb\c67843\c89804\c98824;\cssrgb\c100000\c100000\c66667;
\cssrgb\c63529\c98824\c63529;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 `timescale 1ns / 1ps\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 module\cf4 \strokec4  register_file_tb;\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf6 \strokec6 // Parameters\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf5 \strokec5 parameter\cf4 \strokec4  CLK_PERIOD = \cf7 \strokec7 10\cf4 \strokec4 ; \cf6 \strokec6 // Clock period in ns\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf6 \strokec6 // Signals\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf5 \strokec5 reg\cf4 \strokec4  clk;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf5 \strokec5 reg\cf4 \strokec4  reset;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf5 \strokec5 reg\cf4 \strokec4  [\cf7 \strokec7 1\cf4 \strokec4 :\cf7 \strokec7 0\cf4 \strokec4 ] rs1_addr;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf5 \strokec5 reg\cf4 \strokec4  [\cf7 \strokec7 1\cf4 \strokec4 :\cf7 \strokec7 0\cf4 \strokec4 ] rs2_addr;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf5 \strokec5 reg\cf4 \strokec4  [\cf7 \strokec7 1\cf4 \strokec4 :\cf7 \strokec7 0\cf4 \strokec4 ] wr_addr;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf5 \strokec5 reg\cf4 \strokec4  [\cf7 \strokec7 7\cf4 \strokec4 :\cf7 \strokec7 0\cf4 \strokec4 ] wr_data;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf5 \strokec5 reg\cf4 \strokec4  reg_wr_en;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf5 \strokec5 wire\cf4 \strokec4  [\cf7 \strokec7 7\cf4 \strokec4 :\cf7 \strokec7 0\cf4 \strokec4 ] rs1_data;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf5 \strokec5 wire\cf4 \strokec4  [\cf7 \strokec7 7\cf4 \strokec4 :\cf7 \strokec7 0\cf4 \strokec4 ] rs2_data;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf6 \strokec6 // Instantiate the register file module\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 register_file dut (\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .clk\cf4 \strokec4 (clk),\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .reset\cf4 \strokec4 (reset),\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .rs1_addr\cf4 \strokec4 (rs1_addr),\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .rs2_addr\cf4 \strokec4 (rs2_addr),\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .wr_addr\cf4 \strokec4 (wr_addr),\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .wr_data\cf4 \strokec4 (wr_data),\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .reg_wr_en\cf4 \strokec4 (reg_wr_en),\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .rs1_data\cf4 \strokec4 (rs1_data),\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf8 \strokec8 .rs2_data\cf4 \strokec4 (rs2_data)\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 );\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf6 \strokec6 // Clock generation\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf5 \strokec5 always\cf4 \strokec4  \cf8 \strokec8 #((CLK_PERIOD)/2)\cf4 \strokec4  clk = ~clk;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf6 \strokec6 // Initial stimulus\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf5 \strokec5 initial\cf4 \strokec4  \cf5 \strokec5 begin\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Initialize inputs\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 clk = \cf7 \strokec7 0\cf4 \strokec4 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 reset = \cf7 \strokec7 1\cf4 \strokec4 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 rs1_addr = \cf7 \strokec7 2'b00\cf4 \strokec4 ; \cf6 \strokec6 // Testing register 0\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 rs2_addr = \cf7 \strokec7 2'b01\cf4 \strokec4 ; \cf6 \strokec6 // Testing register 1\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 wr_addr = \cf7 \strokec7 2'b10\cf4 \strokec4 ;\'a0 \cf6 \strokec6 // Writing to register 2\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 wr_data = \cf7 \strokec7 8'b10101010\cf4 \strokec4 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 reg_wr_en = \cf7 \strokec7 1\cf4 \strokec4 ;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Wait for a few clock cycles\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 #\cf7 \strokec7 20\cf4 \strokec4 ;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Release reset\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 reset = \cf7 \strokec7 0\cf4 \strokec4 ;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Wait for a few clock cycles\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 #\cf7 \strokec7 20\cf4 \strokec4 ;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Disable write enable\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 reg_wr_en = \cf7 \strokec7 0\cf4 \strokec4 ;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Display initial values\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf9 \strokec9 $display\cf4 \strokec4 (\cf10 \strokec10 "Initial state:"\cf4 \strokec4 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf9 \strokec9 $display\cf4 \strokec4 (\cf10 \strokec10 "rs1_data: %b, rs2_data: %b"\cf4 \strokec4 , rs1_data, rs2_data);\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Perform some operations (you can modify this section for more tests)\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // For example, you can toggle inputs, change addresses, etc.\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // Wait for simulation to finish\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 #\cf7 \strokec7 100\cf4 \strokec4 ;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 // End simulation\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \'a0 \'a0 \cf9 \strokec9 $finish\cf4 \strokec4 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4 \'a0 \'a0 \cf5 \strokec5 end\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 endmodule\cf4 \cb1 \strokec4 \
}