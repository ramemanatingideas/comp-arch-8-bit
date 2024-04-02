{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red117\green117\blue117;\red38\green38\blue38;\red255\green255\blue255;
\red250\green181\blue122;\red199\green76\blue81;}
{\*\expandedcolortbl;;\cssrgb\c53333\c53333\c53333;\cssrgb\c20000\c20000\c20000;\cssrgb\c100000\c100000\c100000;
\cssrgb\c98824\c76078\c54902;\cssrgb\c82745\c38824\c38824;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 // Register File Module\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 module\cf4 \strokec4  register_file (\cb1 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \'a0 \'a0 \cf5 \strokec5 input\cf4 \strokec4  \cf5 \strokec5 wire\cf4 \strokec4  clk,\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf2 \strokec2 // Clock signal\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 input\cf4 \strokec4  \cf5 \strokec5 wire\cf4 \strokec4  reset,\'a0 \'a0 \'a0 \'a0 \'a0 \cf2 \strokec2 // Reset signal\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 input\cf4 \strokec4  [\cf6 \strokec6 1\cf4 \strokec4 :\cf6 \strokec6 0\cf4 \strokec4 ] rs1_addr,\'a0 \'a0 \'a0 \cf2 \strokec2 // Address for the first source register\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 input\cf4 \strokec4  [\cf6 \strokec6 1\cf4 \strokec4 :\cf6 \strokec6 0\cf4 \strokec4 ] rs2_addr,\'a0 \'a0 \'a0 \cf2 \strokec2 // Address for the second source register\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 input\cf4 \strokec4  [\cf6 \strokec6 1\cf4 \strokec4 :\cf6 \strokec6 0\cf4 \strokec4 ] wr_addr, \'a0 \'a0 \'a0 \cf2 \strokec2 // Address where data is to be written\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 input\cf4 \strokec4  [\cf6 \strokec6 7\cf4 \strokec4 :\cf6 \strokec6 0\cf4 \strokec4 ] wr_data, \'a0 \'a0 \'a0 \cf2 \strokec2 // Data to be written into the register file\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 input\cf4 \strokec4  reg_wr_en, \'a0 \'a0 \'a0 \'a0 \'a0 \cf2 \strokec2 // Write enable signal\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 output\cf4 \strokec4  \cf5 \strokec5 reg\cf4 \strokec4  [\cf6 \strokec6 7\cf4 \strokec4 :\cf6 \strokec6 0\cf4 \strokec4 ] rs1_data, \cf2 \strokec2 // Data from the first source register\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 output\cf4 \strokec4  \cf5 \strokec5 reg\cf4 \strokec4  [\cf6 \strokec6 7\cf4 \strokec4 :\cf6 \strokec6 0\cf4 \strokec4 ] rs2_data\'a0 \cf2 \strokec2 // Data from the second source register\cf4 \cb1 \strokec4 \
\cb3 );\cb1 \
\
\cb3 \'a0 \'a0 \cf5 \strokec5 reg\cf4 \strokec4  [\cf6 \strokec6 7\cf4 \strokec4 :\cf6 \strokec6 0\cf4 \strokec4 ] registers [\cf6 \strokec6 0\cf4 \strokec4 :\cf6 \strokec6 3\cf4 \strokec4 ]; \cf2 \strokec2 // Define an array of registers with 4 8-bit registers\cf4 \cb1 \strokec4 \
\
\cb3 \'a0 \'a0 \cf2 \strokec2 // Write data into the register file when reg_wr_en is high\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 always\cf4 \strokec4  @(\cf5 \strokec5 posedge\cf4 \strokec4  clk \cf5 \strokec5 or\cf4 \strokec4  \cf5 \strokec5 posedge\cf4 \strokec4  reset) \cf5 \strokec5 begin\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 if\cf4 \strokec4  (reset) \cf5 \strokec5 begin\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf2 \strokec2 // Initialize registers to 0 during reset\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 for\cf4 \strokec4  (\cf5 \strokec5 int\cf4 \strokec4  i = \cf6 \strokec6 0\cf4 \strokec4 ; i < \cf6 \strokec6 4\cf4 \strokec4 ; i = i + \cf6 \strokec6 1\cf4 \strokec4 ) \cf5 \strokec5 begin\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 registers[i] <= \cf6 \strokec6 8'b0\cf4 \strokec4 ;\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 end\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 end\cf4 \strokec4  \cf5 \strokec5 else\cf4 \strokec4  \cf5 \strokec5 if\cf4 \strokec4  (reg_wr_en) \cf5 \strokec5 begin\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf2 \strokec2 // Write data into the register specified by wr_addr\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 registers[wr_addr] <= wr_data;\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 end\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 end\cf4 \cb1 \strokec4 \
\
\cb3 \'a0 \'a0 \cf2 \strokec2 // Assign data to the output ports based on the addresses provided\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 always\cf4 \strokec4  @* \cf5 \strokec5 begin\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf2 \strokec2 // Extract data from the register file based on the rs1_addr\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 case\cf4 \strokec4  (rs1_addr)\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 2'b00\cf4 \strokec4 : rs1_data = registers[\cf6 \strokec6 0\cf4 \strokec4 ]; \cf2 \strokec2 // Register $s0\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 2'b01\cf4 \strokec4 : rs1_data = registers[\cf6 \strokec6 1\cf4 \strokec4 ]; \cf2 \strokec2 // Register $s1\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 2'b10\cf4 \strokec4 : rs1_data = registers[\cf6 \strokec6 2\cf4 \strokec4 ]; \cf2 \strokec2 // Register $s2\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 2'b11\cf4 \strokec4 : rs1_data = registers[\cf6 \strokec6 3\cf4 \strokec4 ]; \cf2 \strokec2 // Register $s3\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 default\cf4 \strokec4 : rs1_data = \cf6 \strokec6 8'b0\cf4 \strokec4 ; \cf2 \strokec2 // Default value\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 endcase\cf4 \cb1 \strokec4 \
\
\cb3 \'a0 \'a0 \'a0 \'a0 \cf2 \strokec2 // Extract data from the register file based on the rs2_addr\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 case\cf4 \strokec4  (rs2_addr)\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 2'b00\cf4 \strokec4 : rs2_data = registers[\cf6 \strokec6 0\cf4 \strokec4 ]; \cf2 \strokec2 // Register $s0\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 2'b01\cf4 \strokec4 : rs2_data = registers[\cf6 \strokec6 1\cf4 \strokec4 ]; \cf2 \strokec2 // Register $s1\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 2'b10\cf4 \strokec4 : rs2_data = registers[\cf6 \strokec6 2\cf4 \strokec4 ]; \cf2 \strokec2 // Register $s2\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 2'b11\cf4 \strokec4 : rs2_data = registers[\cf6 \strokec6 3\cf4 \strokec4 ]; \cf2 \strokec2 // Register $s3\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 default\cf4 \strokec4 : rs2_data = \cf6 \strokec6 8'b0\cf4 \strokec4 ; \cf2 \strokec2 // Default value\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 endcase\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 end\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 endmodule\cf4 \cb1 \strokec4 \
}