// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module dwa_ps_bd(DDR_addr, DDR_ba, DDR_cas_n, DDR_ck_n, DDR_ck_p, 
  DDR_cke, DDR_cs_n, DDR_dm, DDR_dq, DDR_dqs_n, DDR_dqs_p, DDR_odt, DDR_ras_n, DDR_reset_n, DDR_we_n, 
  FIXED_IO_ddr_vrn, FIXED_IO_ddr_vrp, FIXED_IO_mio, FIXED_IO_ps_clk, FIXED_IO_ps_porb, 
  FIXED_IO_ps_srstb, M00_AXI_0_araddr, M00_AXI_0_arprot, M00_AXI_0_arready, 
  M00_AXI_0_arvalid, M00_AXI_0_awaddr, M00_AXI_0_awprot, M00_AXI_0_awready, 
  M00_AXI_0_awvalid, M00_AXI_0_bready, M00_AXI_0_bresp, M00_AXI_0_bvalid, M00_AXI_0_rdata, 
  M00_AXI_0_rready, M00_AXI_0_rresp, M00_AXI_0_rvalid, M00_AXI_0_wdata, M00_AXI_0_wready, 
  M00_AXI_0_wstrb, M00_AXI_0_wvalid, aclk, peripheral_aresetn_0);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output [31:0]M00_AXI_0_araddr;
  output [2:0]M00_AXI_0_arprot;
  input M00_AXI_0_arready;
  output M00_AXI_0_arvalid;
  output [31:0]M00_AXI_0_awaddr;
  output [2:0]M00_AXI_0_awprot;
  input M00_AXI_0_awready;
  output M00_AXI_0_awvalid;
  output M00_AXI_0_bready;
  input [1:0]M00_AXI_0_bresp;
  input M00_AXI_0_bvalid;
  input [31:0]M00_AXI_0_rdata;
  output M00_AXI_0_rready;
  input [1:0]M00_AXI_0_rresp;
  input M00_AXI_0_rvalid;
  output [31:0]M00_AXI_0_wdata;
  input M00_AXI_0_wready;
  output [3:0]M00_AXI_0_wstrb;
  output M00_AXI_0_wvalid;
  output aclk;
  output [0:0]peripheral_aresetn_0;
endmodule
