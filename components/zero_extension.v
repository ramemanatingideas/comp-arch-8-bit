{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red250\green181\blue122;\red38\green38\blue38;\red255\green255\blue255;
\red199\green76\blue81;\red117\green117\blue117;}
{\*\expandedcolortbl;;\cssrgb\c98824\c76078\c54902;\cssrgb\c20000\c20000\c20000;\cssrgb\c100000\c100000\c100000;
\cssrgb\c82745\c38824\c38824;\cssrgb\c53333\c53333\c53333;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 module\cf4 \strokec4  zero_extension (\cb1 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \'a0 \'a0 \cf2 \strokec2 input\cf4 \strokec4  [\cf5 \strokec5 7\cf4 \strokec4 :\cf5 \strokec5 0\cf4 \strokec4 ] input_data, \'a0 \'a0 \'a0 \cf6 \strokec6 // Input data to be zero-extended\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf2 \strokec2 output\cf4 \strokec4  \cf2 \strokec2 reg\cf4 \strokec4  [\cf5 \strokec5 7\cf4 \strokec4 :\cf5 \strokec5 0\cf4 \strokec4 ] output_data\'a0 \cf6 \strokec6 // Zero-extended output data\cf4 \cb1 \strokec4 \
\cb3 );\cb1 \
\
\cb3 \'a0 \'a0 \cf6 \strokec6 // Zero extension operation\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf2 \strokec2 always\cf4 \strokec4  @* \cf2 \strokec2 begin\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \'a0 \'a0 output_data = input_data;\'a0 \cf6 \strokec6 // Output data is same as input data for zero extension\cf4 \cb1 \strokec4 \
\cb3 \'a0 \'a0 \cf2 \strokec2 end\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 endmodule}