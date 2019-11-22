// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2018.2" *)
module vio_ctrl(clk, probe_in0, probe_in1, probe_out0, 
  probe_out1, probe_out2, probe_out3);
  input clk;
  input [31:0]probe_in0;
  input [31:0]probe_in1;
  output [31:0]probe_out0;
  output [0:0]probe_out1;
  output [0:0]probe_out2;
  output [0:0]probe_out3;
endmodule
