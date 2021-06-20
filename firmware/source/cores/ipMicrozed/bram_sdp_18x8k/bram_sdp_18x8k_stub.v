// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Thu Oct  1 09:34:47 2020
// Host        : lt2 running 64-bit CentOS Linux release 7.6.1810 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/nate/projects/duneWireTension/vivadoProjects/project_2/project_2.srcs/sources_1/ip/bram_sdp_18x8k/bram_sdp_18x8k_stub.v
// Design      : bram_sdp_18x8k
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *)
module bram_sdp_18x8k(clka, ena, wea, addra, dina, clkb, rstb, enb, addrb, doutb, 
  rsta_busy, rstb_busy)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[12:0],dina[17:0],clkb,rstb,enb,addrb[12:0],doutb[17:0],rsta_busy,rstb_busy" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [12:0]addra;
  input [17:0]dina;
  input clkb;
  input rstb;
  input enb;
  input [12:0]addrb;
  output [17:0]doutb;
  output rsta_busy;
  output rstb_busy;
endmodule
