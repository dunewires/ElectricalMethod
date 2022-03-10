// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Mon Mar  7 09:26:53 2022
// Host        : pc2 running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/saidbounasser/projects/DUNE/ElectricalMethod/firmware/source/dwa_ps/dwa_ps.srcs/sources_1/ip/fifo_autoDatacollection/fifo_autoDatacollection_stub.v
// Design      : fifo_autoDatacollection
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.2" *)
module fifo_autoDatacollection(clk, srst, din, wr_en, rd_en, dout, full, empty, 
  wr_data_count, prog_full)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[15:0],wr_en,rd_en,dout[31:0],full,empty,wr_data_count[12:0],prog_full" */;
  input clk;
  input srst;
  input [15:0]din;
  input wr_en;
  input rd_en;
  output [31:0]dout;
  output full;
  output empty;
  output [12:0]wr_data_count;
  output prog_full;
endmodule
