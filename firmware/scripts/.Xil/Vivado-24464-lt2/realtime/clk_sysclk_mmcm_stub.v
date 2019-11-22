// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_sysclk_mmcm(clk_out1, clk_out2, clk_out3, clk_out4, clk_out5, 
  reset, locked, clk_in1_p, clk_in1_n);
  output clk_out1;
  output clk_out2;
  output clk_out3;
  output clk_out4;
  output clk_out5;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
