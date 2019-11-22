// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Thu Jun  6 11:15:56 2019
// Host        : lt2 running 64-bit CentOS Linux release 7.6.1810 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/nate/projects/duneWireTension/firmware/source/cores/ipMicrozed/vio_ctrl/vio_ctrl_stub.v
// Design      : vio_ctrl
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2018.3" *)
module vio_ctrl(clk, probe_in0, probe_in1, probe_in2, probe_out0, 
  probe_out1, probe_out2, probe_out3, probe_out4, probe_out5, probe_out6, probe_out7, probe_out8, 
  probe_out9, probe_out10, probe_out11)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[31:0],probe_in1[31:0],probe_in2[0:0],probe_out0[31:0],probe_out1[0:0],probe_out2[0:0],probe_out3[0:0],probe_out4[15:0],probe_out5[15:0],probe_out6[15:0],probe_out7[31:0],probe_out8[15:0],probe_out9[0:0],probe_out10[3:0],probe_out11[4:0]" */;
  input clk;
  input [31:0]probe_in0;
  input [31:0]probe_in1;
  input [0:0]probe_in2;
  output [31:0]probe_out0;
  output [0:0]probe_out1;
  output [0:0]probe_out2;
  output [0:0]probe_out3;
  output [15:0]probe_out4;
  output [15:0]probe_out5;
  output [15:0]probe_out6;
  output [31:0]probe_out7;
  output [15:0]probe_out8;
  output [0:0]probe_out9;
  output [3:0]probe_out10;
  output [4:0]probe_out11;
endmodule
