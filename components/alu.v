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
\outl0\strokewidth0 \strokec2 // Arithmetic Logic Unit (ALU) Module\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 module\cf4 \strokec4  alu (\cb1 \
\cb3 \'a0 \'a0 \cf5 \strokec5 input\cf4 \strokec4  [\cf6 \strokec6 7\cf4 \strokec4 :\cf6 \strokec6 0\cf4 \strokec4 ] rs_data1, \'a0 \'a0 \cf2 \strokec2 // Input data from the first source register\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 input\cf4 \strokec4  [\cf6 \strokec6 7\cf4 \strokec4 :\cf6 \strokec6 0\cf4 \strokec4 ] rs_data2, \'a0 \'a0 \cf2 \strokec2 // Input data from the second source register\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 input\cf4 \strokec4  [\cf6 \strokec6 1\cf4 \strokec4 :\cf6 \strokec6 0\cf4 \strokec4 ] immediate,\'a0 \'a0 \cf2 \strokec2 // Immediate value for SW and LW instructions\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 input\cf4 \strokec4  [\cf6 \strokec6 1\cf4 \strokec4 :\cf6 \strokec6 0\cf4 \strokec4 ] alu_op, \'a0 \'a0 \'a0 \cf2 \strokec2 // ALU operation code\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 output\cf4 \strokec4  \cf5 \strokec5 reg\cf4 \strokec4  [\cf6 \strokec6 7\cf4 \strokec4 :\cf6 \strokec6 0\cf4 \strokec4 ] result \'a0 \cf2 \strokec2 // Output result of ALU operation\cf4 \cb1 \strokec4 \
\cb3 );\cb1 \
\
\cb3 \'a0 \'a0 \cf2 \strokec2 // Define parameters for ALU operation codes\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 parameter\cf4 \strokec4  ADD = \cf6 \strokec6 2'b00\cf4 \strokec4 ; \'a0 \'a0 \cf2 \strokec2 // Addition\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 parameter\cf4 \strokec4  SUB = \cf6 \strokec6 2'b01\cf4 \strokec4 ; \'a0 \'a0 \cf2 \strokec2 // Subtraction\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 parameter\cf4 \strokec4  SLL = \cf6 \strokec6 2'b10\cf4 \strokec4 ; \'a0 \'a0 \cf2 \strokec2 // Shift Left Logical\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 parameter\cf4 \strokec4  AND = \cf6 \strokec6 2'b11\cf4 \strokec4 ; \'a0 \'a0 \cf2 \strokec2 // Bitwise AND\cf4 \cb1 \strokec4 \
\
\cb3 \'a0 \'a0 \cf2 \strokec2 // Perform ALU operation based on alu_op\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 always\cf4 \strokec4  @* \cf5 \strokec5 begin\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 case\cf4 \strokec4  (alu_op)\cb1 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 ADD: result = rs_data1 + rs_data2;\'a0 \'a0 \cf2 \strokec2 // Perform addition\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 SUB: result = rs_data1 - rs_data2;\'a0 \'a0 \cf2 \strokec2 // Perform subtraction\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 SLL: result = rs_data1 << rs_data2;\'a0 \cf2 \strokec2 // Perform left logical shift\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 AND: result = rs_data1 & rs_data2; \'a0 \cf2 \strokec2 // Perform bitwise AND\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 2'b10\cf4 \strokec4 : result = \{rs_data1[\cf6 \strokec6 7\cf4 \strokec4 :immediate], rs_data1[\cf6 \strokec6 6\cf4 \strokec4 :\cf6 \strokec6 0\cf4 \strokec4 ]\}; \cf2 \strokec2 // SW: Store the 8-bit value from rs_data1 to memory\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf6 \strokec6 2'b11\cf4 \strokec4 : result = \{\cf6 \strokec6 8'b0\cf4 \strokec4 , rs_data1[\cf6 \strokec6 7\cf4 \strokec4 :immediate]\};\'a0 \'a0 \'a0 \'a0 \'a0 \cf2 \strokec2 // LW: Load a word from memory to register\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 default\cf4 \strokec4 : result = \cf6 \strokec6 8'b0\cf4 \strokec4 ;\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \cf2 \strokec2 // Default value\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 \cf5 \strokec5 endcase\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf5 \strokec5 end\cf4 \cb1 \strokec4 \
\
\cf5 \cb3 \strokec5 endmodule}