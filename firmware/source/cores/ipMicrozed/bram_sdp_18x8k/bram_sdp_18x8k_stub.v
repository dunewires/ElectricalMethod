// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Wed Sep 22 08:31:26 2021
// Host        : pc0 running 64-bit CentOS Linux release 8.4.2105
// Command     : write_verilog -force -mode synth_stub
//               /home/nate/projects/duneWireTension/ElectricalMethod/firmware/source/cores/ipMicrozed/bram_sdp_18x8k/bram_sdp_18x8k_stub.v
// Design      : bram_sdp_18x8k
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *)
module bram_sdp_18x8k(clka, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[12:0],dina[17:0],douta[17:0]" */;
  input clka;
  input [0:0]wea;
  input [12:0]addra;
  input [17:0]dina;
  output [17:0]douta;
endmodule
