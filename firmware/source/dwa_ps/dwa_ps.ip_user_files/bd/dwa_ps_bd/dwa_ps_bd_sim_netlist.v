// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Thu Jan 28 14:46:05 2021
// Host        : pc0 running 64-bit CentOS Linux release 8.3.2011
// Command     : write_verilog -force -mode funcsim
//               /home/nate/projects/duneWireTension/ElectricalMethod/firmware/source/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/dwa_ps_bd_sim_netlist.v
// Design      : dwa_ps_bd
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* hw_handoff = "dwa_ps_bd.hwdef" *) 
(* NotValidForBitStream *)
module dwa_ps_bd
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FCLK_CLK1_0,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    M00_AXI_0_araddr,
    M00_AXI_0_arprot,
    M00_AXI_0_arready,
    M00_AXI_0_arvalid,
    M00_AXI_0_awaddr,
    M00_AXI_0_awprot,
    M00_AXI_0_awready,
    M00_AXI_0_awvalid,
    M00_AXI_0_bready,
    M00_AXI_0_bresp,
    M00_AXI_0_bvalid,
    M00_AXI_0_rdata,
    M00_AXI_0_rready,
    M00_AXI_0_rresp,
    M00_AXI_0_rvalid,
    M00_AXI_0_wdata,
    M00_AXI_0_wready,
    M00_AXI_0_wstrb,
    M00_AXI_0_wvalid,
    aclk,
    peripheral_aresetn_0);
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK.FCLK_CLK1_0 CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK.FCLK_CLK1_0, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK1, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) output FCLK_CLK1_0;
  (* x_interface_info = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* x_interface_parameter = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* x_interface_info = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* x_interface_info = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* x_interface_info = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* x_interface_info = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* x_interface_info = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME M00_AXI_0, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 4, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 4, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [31:0]M00_AXI_0_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARPROT" *) output [2:0]M00_AXI_0_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARREADY" *) input M00_AXI_0_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARVALID" *) output M00_AXI_0_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWADDR" *) output [31:0]M00_AXI_0_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWPROT" *) output [2:0]M00_AXI_0_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWREADY" *) input M00_AXI_0_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWVALID" *) output M00_AXI_0_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 BREADY" *) output M00_AXI_0_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 BRESP" *) input [1:0]M00_AXI_0_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 BVALID" *) input M00_AXI_0_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 RDATA" *) input [31:0]M00_AXI_0_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 RREADY" *) output M00_AXI_0_rready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 RRESP" *) input [1:0]M00_AXI_0_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 RVALID" *) input M00_AXI_0_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 WDATA" *) output [31:0]M00_AXI_0_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 WREADY" *) input M00_AXI_0_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 WSTRB" *) output [3:0]M00_AXI_0_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 WVALID" *) output M00_AXI_0_wvalid;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK.ACLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK.ACLK, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) output aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RST.PERIPHERAL_ARESETN_0 RST" *) (* x_interface_parameter = "XIL_INTERFACENAME RST.PERIPHERAL_ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) output [0:0]peripheral_aresetn_0;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FCLK_CLK1_0;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [31:0]M00_AXI_0_araddr;
  wire [2:0]M00_AXI_0_arprot;
  wire M00_AXI_0_arready;
  wire M00_AXI_0_arvalid;
  wire [31:0]M00_AXI_0_awaddr;
  wire [2:0]M00_AXI_0_awprot;
  wire M00_AXI_0_awready;
  wire M00_AXI_0_awvalid;
  wire M00_AXI_0_bready;
  wire [1:0]M00_AXI_0_bresp;
  wire M00_AXI_0_bvalid;
  wire [31:0]M00_AXI_0_rdata;
  wire M00_AXI_0_rready;
  wire [1:0]M00_AXI_0_rresp;
  wire M00_AXI_0_rvalid;
  wire [31:0]M00_AXI_0_wdata;
  wire M00_AXI_0_wready;
  wire [3:0]M00_AXI_0_wstrb;
  wire M00_AXI_0_wvalid;
  wire aclk;
  wire [0:0]peripheral_aresetn_0;
  wire processing_system7_0_FCLK_RESET0_N;
  wire [31:0]processing_system7_0_M_AXI_GP0_ARADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARBURST;
  wire [11:0]processing_system7_0_M_AXI_GP0_ARID;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARLEN;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARPROT;
  wire processing_system7_0_M_AXI_GP0_ARREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARSIZE;
  wire processing_system7_0_M_AXI_GP0_ARVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_AWADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWBURST;
  wire [11:0]processing_system7_0_M_AXI_GP0_AWID;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWLEN;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWPROT;
  wire processing_system7_0_M_AXI_GP0_AWREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWSIZE;
  wire processing_system7_0_M_AXI_GP0_AWVALID;
  wire [11:0]processing_system7_0_M_AXI_GP0_BID;
  wire processing_system7_0_M_AXI_GP0_BREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_BRESP;
  wire processing_system7_0_M_AXI_GP0_BVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_RDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_RID;
  wire processing_system7_0_M_AXI_GP0_RLAST;
  wire processing_system7_0_M_AXI_GP0_RREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_RRESP;
  wire processing_system7_0_M_AXI_GP0_RVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_WDATA;
  wire processing_system7_0_M_AXI_GP0_WREADY;
  wire [3:0]processing_system7_0_M_AXI_GP0_WSTRB;
  wire processing_system7_0_M_AXI_GP0_WVALID;
  wire rst_ps7_0_100M_interconnect_aresetn_0;
  wire NLW_processing_system7_0_M_AXI_GP0_WLAST_UNCONNECTED;
  wire NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED;
  wire NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED;
  wire NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED;
  wire NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED;
  wire [3:0]NLW_processing_system7_0_M_AXI_GP0_ARCACHE_UNCONNECTED;
  wire [1:0]NLW_processing_system7_0_M_AXI_GP0_ARLOCK_UNCONNECTED;
  wire [3:0]NLW_processing_system7_0_M_AXI_GP0_ARQOS_UNCONNECTED;
  wire [2:2]NLW_processing_system7_0_M_AXI_GP0_ARSIZE_UNCONNECTED;
  wire [3:0]NLW_processing_system7_0_M_AXI_GP0_AWCACHE_UNCONNECTED;
  wire [1:0]NLW_processing_system7_0_M_AXI_GP0_AWLOCK_UNCONNECTED;
  wire [3:0]NLW_processing_system7_0_M_AXI_GP0_AWQOS_UNCONNECTED;
  wire [2:2]NLW_processing_system7_0_M_AXI_GP0_AWSIZE_UNCONNECTED;
  wire [11:0]NLW_processing_system7_0_M_AXI_GP0_WID_UNCONNECTED;
  wire [1:0]NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED;
  wire NLW_rst_ps7_0_100M_mb_reset_UNCONNECTED;
  wire [0:0]NLW_rst_ps7_0_100M_bus_struct_reset_UNCONNECTED;
  wire [0:0]NLW_rst_ps7_0_100M_peripheral_reset_UNCONNECTED;

  (* CHECK_LICENSE_TYPE = "dwa_ps_bd_processing_system7_0_0,processing_system7_v5_5_processing_system7,{}" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* X_CORE_INFO = "processing_system7_v5_5_processing_system7,Vivado 2020.2" *) 
  dwa_ps_bd_dwa_ps_bd_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr),
        .DDR_BankAddr(DDR_ba),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm),
        .DDR_DQ(DDR_dq),
        .DDR_DQS(DDR_dqs_p),
        .DDR_DQS_n(DDR_dqs_n),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(aclk),
        .FCLK_CLK1(FCLK_CLK1_0),
        .FCLK_RESET0_N(processing_system7_0_FCLK_RESET0_N),
        .MIO(FIXED_IO_mio),
        .M_AXI_GP0_ACLK(1'b0),
        .M_AXI_GP0_ARADDR(processing_system7_0_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(processing_system7_0_M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(NLW_processing_system7_0_M_AXI_GP0_ARCACHE_UNCONNECTED[3:0]),
        .M_AXI_GP0_ARID(processing_system7_0_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(processing_system7_0_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(NLW_processing_system7_0_M_AXI_GP0_ARLOCK_UNCONNECTED[1:0]),
        .M_AXI_GP0_ARPROT(processing_system7_0_M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(NLW_processing_system7_0_M_AXI_GP0_ARQOS_UNCONNECTED[3:0]),
        .M_AXI_GP0_ARREADY(processing_system7_0_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE({NLW_processing_system7_0_M_AXI_GP0_ARSIZE_UNCONNECTED[2],processing_system7_0_M_AXI_GP0_ARSIZE}),
        .M_AXI_GP0_ARVALID(processing_system7_0_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(processing_system7_0_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(processing_system7_0_M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(NLW_processing_system7_0_M_AXI_GP0_AWCACHE_UNCONNECTED[3:0]),
        .M_AXI_GP0_AWID(processing_system7_0_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(processing_system7_0_M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(NLW_processing_system7_0_M_AXI_GP0_AWLOCK_UNCONNECTED[1:0]),
        .M_AXI_GP0_AWPROT(processing_system7_0_M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(NLW_processing_system7_0_M_AXI_GP0_AWQOS_UNCONNECTED[3:0]),
        .M_AXI_GP0_AWREADY(processing_system7_0_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE({NLW_processing_system7_0_M_AXI_GP0_AWSIZE_UNCONNECTED[2],processing_system7_0_M_AXI_GP0_AWSIZE}),
        .M_AXI_GP0_AWVALID(processing_system7_0_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(processing_system7_0_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(processing_system7_0_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(processing_system7_0_M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(processing_system7_0_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(processing_system7_0_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(processing_system7_0_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(processing_system7_0_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(processing_system7_0_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(processing_system7_0_M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(processing_system7_0_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(processing_system7_0_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(NLW_processing_system7_0_M_AXI_GP0_WID_UNCONNECTED[11:0]),
        .M_AXI_GP0_WLAST(NLW_processing_system7_0_M_AXI_GP0_WLAST_UNCONNECTED),
        .M_AXI_GP0_WREADY(processing_system7_0_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(processing_system7_0_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(processing_system7_0_M_AXI_GP0_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .TTC0_WAVE0_OUT(NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED),
        .TTC0_WAVE1_OUT(NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED),
        .TTC0_WAVE2_OUT(NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED),
        .USB0_PORT_INDCTL(NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED[1:0]),
        .USB0_VBUS_PWRFAULT(1'b0),
        .USB0_VBUS_PWRSELECT(NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED));
  dwa_ps_bd_dwa_ps_bd_ps7_0_axi_periph_0 ps7_0_axi_periph
       (.ACLK(1'b0),
        .ARESETN(1'b0),
        .M00_ACLK(1'b0),
        .M00_ARESETN(1'b0),
        .M00_AXI_araddr(M00_AXI_0_araddr),
        .M00_AXI_arprot(M00_AXI_0_arprot),
        .M00_AXI_arready(M00_AXI_0_arready),
        .M00_AXI_arvalid(M00_AXI_0_arvalid),
        .M00_AXI_awaddr(M00_AXI_0_awaddr),
        .M00_AXI_awprot(M00_AXI_0_awprot),
        .M00_AXI_awready(M00_AXI_0_awready),
        .M00_AXI_awvalid(M00_AXI_0_awvalid),
        .M00_AXI_bready(M00_AXI_0_bready),
        .M00_AXI_bresp(M00_AXI_0_bresp),
        .M00_AXI_bvalid(M00_AXI_0_bvalid),
        .M00_AXI_rdata(M00_AXI_0_rdata),
        .M00_AXI_rready(M00_AXI_0_rready),
        .M00_AXI_rresp(M00_AXI_0_rresp),
        .M00_AXI_rvalid(M00_AXI_0_rvalid),
        .M00_AXI_wdata(M00_AXI_0_wdata),
        .M00_AXI_wready(M00_AXI_0_wready),
        .M00_AXI_wstrb(M00_AXI_0_wstrb),
        .M00_AXI_wvalid(M00_AXI_0_wvalid),
        .S00_ACLK(aclk),
        .S00_ARESETN(rst_ps7_0_100M_interconnect_aresetn_0),
        .S00_AXI_araddr(processing_system7_0_M_AXI_GP0_ARADDR),
        .S00_AXI_arburst(processing_system7_0_M_AXI_GP0_ARBURST),
        .S00_AXI_arcache({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arid(processing_system7_0_M_AXI_GP0_ARID),
        .S00_AXI_arlen(processing_system7_0_M_AXI_GP0_ARLEN),
        .S00_AXI_arlock({1'b0,1'b0}),
        .S00_AXI_arprot(processing_system7_0_M_AXI_GP0_ARPROT),
        .S00_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arready(processing_system7_0_M_AXI_GP0_ARREADY),
        .S00_AXI_arsize({1'b0,processing_system7_0_M_AXI_GP0_ARSIZE}),
        .S00_AXI_arvalid(processing_system7_0_M_AXI_GP0_ARVALID),
        .S00_AXI_awaddr(processing_system7_0_M_AXI_GP0_AWADDR),
        .S00_AXI_awburst(processing_system7_0_M_AXI_GP0_AWBURST),
        .S00_AXI_awcache({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_awid(processing_system7_0_M_AXI_GP0_AWID),
        .S00_AXI_awlen(processing_system7_0_M_AXI_GP0_AWLEN),
        .S00_AXI_awlock({1'b0,1'b0}),
        .S00_AXI_awprot(processing_system7_0_M_AXI_GP0_AWPROT),
        .S00_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_awready(processing_system7_0_M_AXI_GP0_AWREADY),
        .S00_AXI_awsize({1'b0,processing_system7_0_M_AXI_GP0_AWSIZE}),
        .S00_AXI_awvalid(processing_system7_0_M_AXI_GP0_AWVALID),
        .S00_AXI_bid(processing_system7_0_M_AXI_GP0_BID),
        .S00_AXI_bready(processing_system7_0_M_AXI_GP0_BREADY),
        .S00_AXI_bresp(processing_system7_0_M_AXI_GP0_BRESP),
        .S00_AXI_bvalid(processing_system7_0_M_AXI_GP0_BVALID),
        .S00_AXI_rdata(processing_system7_0_M_AXI_GP0_RDATA),
        .S00_AXI_rid(processing_system7_0_M_AXI_GP0_RID),
        .S00_AXI_rlast(processing_system7_0_M_AXI_GP0_RLAST),
        .S00_AXI_rready(processing_system7_0_M_AXI_GP0_RREADY),
        .S00_AXI_rresp(processing_system7_0_M_AXI_GP0_RRESP),
        .S00_AXI_rvalid(processing_system7_0_M_AXI_GP0_RVALID),
        .S00_AXI_wdata(processing_system7_0_M_AXI_GP0_WDATA),
        .S00_AXI_wid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_wlast(1'b0),
        .S00_AXI_wready(processing_system7_0_M_AXI_GP0_WREADY),
        .S00_AXI_wstrb(processing_system7_0_M_AXI_GP0_WSTRB),
        .S00_AXI_wvalid(processing_system7_0_M_AXI_GP0_WVALID));
  (* CHECK_LICENSE_TYPE = "dwa_ps_bd_rst_ps7_0_100M_1,proc_sys_reset,{}" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* X_CORE_INFO = "proc_sys_reset,Vivado 2020.2" *) 
  dwa_ps_bd_dwa_ps_bd_rst_ps7_0_100M_1 rst_ps7_0_100M
       (.aux_reset_in(1'b1),
        .bus_struct_reset(NLW_rst_ps7_0_100M_bus_struct_reset_UNCONNECTED[0]),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .interconnect_aresetn(rst_ps7_0_100M_interconnect_aresetn_0),
        .mb_debug_sys_rst(1'b0),
        .mb_reset(NLW_rst_ps7_0_100M_mb_reset_UNCONNECTED),
        .peripheral_aresetn(peripheral_aresetn_0),
        .peripheral_reset(NLW_rst_ps7_0_100M_peripheral_reset_UNCONNECTED[0]),
        .slowest_sync_clk(aclk));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_axi_protocol_converter" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_axi_protocol_converter
   (s_axi_rvalid,
    s_axi_awready,
    Q,
    s_axi_arready,
    \m_payload_i_reg[34] ,
    s_axi_bvalid,
    \m_payload_i_reg[13] ,
    \m_payload_i_reg[46] ,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_arvalid,
    m_axi_rready,
    m_axi_awaddr,
    m_axi_araddr,
    m_axi_arready,
    s_axi_rready,
    s_axi_awvalid,
    aclk,
    in,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awsize,
    s_axi_awprot,
    s_axi_awaddr,
    m_axi_bresp,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arsize,
    s_axi_arprot,
    s_axi_araddr,
    m_axi_awready,
    m_axi_bvalid,
    m_axi_rvalid,
    s_axi_arvalid,
    s_axi_bready,
    aresetn);
  output s_axi_rvalid;
  output s_axi_awready;
  output [22:0]Q;
  output s_axi_arready;
  output [22:0]\m_payload_i_reg[34] ;
  output s_axi_bvalid;
  output [13:0]\m_payload_i_reg[13] ;
  output [46:0]\m_payload_i_reg[46] ;
  output m_axi_awvalid;
  output m_axi_bready;
  output m_axi_arvalid;
  output m_axi_rready;
  output [11:0]m_axi_awaddr;
  output [11:0]m_axi_araddr;
  input m_axi_arready;
  input s_axi_rready;
  input s_axi_awvalid;
  input aclk;
  input [33:0]in;
  input [11:0]s_axi_awid;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awsize;
  input [2:0]s_axi_awprot;
  input [31:0]s_axi_awaddr;
  input [1:0]m_axi_bresp;
  input [11:0]s_axi_arid;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arsize;
  input [2:0]s_axi_arprot;
  input [31:0]s_axi_araddr;
  input m_axi_awready;
  input m_axi_bvalid;
  input m_axi_rvalid;
  input s_axi_arvalid;
  input s_axi_bready;
  input aresetn;

  wire [22:0]Q;
  wire aclk;
  wire aresetn;
  wire [33:0]in;
  wire [11:0]m_axi_araddr;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire [11:0]m_axi_awaddr;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire [13:0]\m_payload_i_reg[13] ;
  wire [22:0]\m_payload_i_reg[34] ;
  wire [46:0]\m_payload_i_reg[46] ;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [11:0]s_axi_arid;
  wire [3:0]s_axi_arlen;
  wire [2:0]s_axi_arprot;
  wire s_axi_arready;
  wire [1:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [11:0]s_axi_awid;
  wire [3:0]s_axi_awlen;
  wire [2:0]s_axi_awprot;
  wire s_axi_awready;
  wire [1:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire s_axi_rready;
  wire s_axi_rvalid;

  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s \gen_axilite.gen_b2s_conv.axilite_b2s 
       (.Q(Q),
        .aclk(aclk),
        .aresetn(aresetn),
        .in(in),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .\m_payload_i_reg[13] (\m_payload_i_reg[13] ),
        .\m_payload_i_reg[34] (\m_payload_i_reg[34] ),
        .\m_payload_i_reg[46] (\m_payload_i_reg[46] ),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s
   (s_axi_rvalid,
    s_axi_awready,
    Q,
    s_axi_arready,
    \m_payload_i_reg[34] ,
    s_axi_bvalid,
    \m_payload_i_reg[13] ,
    \m_payload_i_reg[46] ,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_arvalid,
    m_axi_rready,
    m_axi_awaddr,
    m_axi_araddr,
    m_axi_arready,
    s_axi_rready,
    s_axi_awvalid,
    aclk,
    in,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awsize,
    s_axi_awprot,
    s_axi_awaddr,
    m_axi_bresp,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arsize,
    s_axi_arprot,
    s_axi_araddr,
    m_axi_awready,
    m_axi_bvalid,
    m_axi_rvalid,
    s_axi_arvalid,
    s_axi_bready,
    aresetn);
  output s_axi_rvalid;
  output s_axi_awready;
  output [22:0]Q;
  output s_axi_arready;
  output [22:0]\m_payload_i_reg[34] ;
  output s_axi_bvalid;
  output [13:0]\m_payload_i_reg[13] ;
  output [46:0]\m_payload_i_reg[46] ;
  output m_axi_awvalid;
  output m_axi_bready;
  output m_axi_arvalid;
  output m_axi_rready;
  output [11:0]m_axi_awaddr;
  output [11:0]m_axi_araddr;
  input m_axi_arready;
  input s_axi_rready;
  input s_axi_awvalid;
  input aclk;
  input [33:0]in;
  input [11:0]s_axi_awid;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awsize;
  input [2:0]s_axi_awprot;
  input [31:0]s_axi_awaddr;
  input [1:0]m_axi_bresp;
  input [11:0]s_axi_arid;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arsize;
  input [2:0]s_axi_arprot;
  input [31:0]s_axi_araddr;
  input m_axi_awready;
  input m_axi_bvalid;
  input m_axi_rvalid;
  input s_axi_arvalid;
  input s_axi_bready;
  input aresetn;

  wire [22:0]Q;
  wire \RD.ar_channel_0_n_1 ;
  wire \RD.ar_channel_0_n_10 ;
  wire \RD.ar_channel_0_n_11 ;
  wire \RD.ar_channel_0_n_12 ;
  wire \RD.ar_channel_0_n_13 ;
  wire \RD.ar_channel_0_n_14 ;
  wire \RD.ar_channel_0_n_15 ;
  wire \RD.ar_channel_0_n_16 ;
  wire \RD.ar_channel_0_n_17 ;
  wire \RD.ar_channel_0_n_18 ;
  wire \RD.ar_channel_0_n_19 ;
  wire \RD.ar_channel_0_n_20 ;
  wire \RD.ar_channel_0_n_21 ;
  wire \RD.ar_channel_0_n_22 ;
  wire \RD.ar_channel_0_n_23 ;
  wire \RD.ar_channel_0_n_24 ;
  wire \RD.ar_channel_0_n_25 ;
  wire \RD.ar_channel_0_n_26 ;
  wire \RD.ar_channel_0_n_27 ;
  wire \RD.ar_channel_0_n_28 ;
  wire \RD.ar_channel_0_n_4 ;
  wire \RD.ar_channel_0_n_47 ;
  wire \RD.ar_channel_0_n_48 ;
  wire \RD.ar_channel_0_n_49 ;
  wire \RD.ar_channel_0_n_5 ;
  wire \RD.ar_channel_0_n_50 ;
  wire \RD.ar_channel_0_n_6 ;
  wire \RD.ar_channel_0_n_7 ;
  wire \RD.ar_channel_0_n_8 ;
  wire \RD.ar_channel_0_n_9 ;
  wire \RD.r_channel_0_n_0 ;
  wire \RD.r_channel_0_n_1 ;
  wire SI_REG_n_10;
  wire SI_REG_n_11;
  wire SI_REG_n_128;
  wire SI_REG_n_129;
  wire SI_REG_n_130;
  wire SI_REG_n_131;
  wire SI_REG_n_144;
  wire SI_REG_n_145;
  wire SI_REG_n_146;
  wire SI_REG_n_147;
  wire SI_REG_n_148;
  wire SI_REG_n_149;
  wire SI_REG_n_150;
  wire SI_REG_n_151;
  wire SI_REG_n_152;
  wire SI_REG_n_153;
  wire SI_REG_n_154;
  wire SI_REG_n_155;
  wire SI_REG_n_156;
  wire SI_REG_n_157;
  wire SI_REG_n_158;
  wire SI_REG_n_161;
  wire SI_REG_n_162;
  wire SI_REG_n_163;
  wire SI_REG_n_164;
  wire SI_REG_n_165;
  wire SI_REG_n_166;
  wire SI_REG_n_167;
  wire SI_REG_n_168;
  wire SI_REG_n_169;
  wire SI_REG_n_170;
  wire SI_REG_n_171;
  wire SI_REG_n_172;
  wire SI_REG_n_173;
  wire SI_REG_n_174;
  wire SI_REG_n_175;
  wire SI_REG_n_176;
  wire SI_REG_n_177;
  wire SI_REG_n_178;
  wire SI_REG_n_179;
  wire SI_REG_n_180;
  wire SI_REG_n_181;
  wire SI_REG_n_182;
  wire SI_REG_n_183;
  wire SI_REG_n_184;
  wire SI_REG_n_185;
  wire SI_REG_n_186;
  wire SI_REG_n_29;
  wire SI_REG_n_30;
  wire SI_REG_n_66;
  wire SI_REG_n_67;
  wire SI_REG_n_68;
  wire SI_REG_n_69;
  wire SI_REG_n_70;
  wire SI_REG_n_71;
  wire SI_REG_n_72;
  wire SI_REG_n_73;
  wire SI_REG_n_8;
  wire SI_REG_n_9;
  wire \WR.aw_channel_0_n_19 ;
  wire \WR.aw_channel_0_n_20 ;
  wire \WR.aw_channel_0_n_21 ;
  wire \WR.aw_channel_0_n_22 ;
  wire \WR.aw_channel_0_n_23 ;
  wire \WR.aw_channel_0_n_24 ;
  wire \WR.aw_channel_0_n_25 ;
  wire \WR.aw_channel_0_n_26 ;
  wire \WR.aw_channel_0_n_27 ;
  wire \WR.aw_channel_0_n_28 ;
  wire \WR.aw_channel_0_n_29 ;
  wire \WR.aw_channel_0_n_30 ;
  wire \WR.aw_channel_0_n_4 ;
  wire \WR.aw_channel_0_n_49 ;
  wire \WR.aw_channel_0_n_5 ;
  wire \WR.aw_channel_0_n_50 ;
  wire \WR.aw_channel_0_n_51 ;
  wire \WR.aw_channel_0_n_52 ;
  wire aclk;
  wire \ar.ar_pipe/m_valid_i0 ;
  wire \ar.ar_pipe/p_1_in ;
  wire \ar.ar_pipe/s_ready_i0 ;
  wire [1:0]\ar_cmd_fsm_0/state ;
  wire areset_d1;
  wire areset_d1_i_1_n_0;
  wire aresetn;
  wire [1:0]\aw_cmd_fsm_0/state ;
  wire [11:0]axaddr_incr;
  wire [11:0]axaddr_wrap;
  wire [1:0]axsize;
  wire [11:0]b_awid;
  wire [3:0]b_awlen;
  wire b_push;
  wire [1:0]\bid_fifo_0/cnt_read ;
  wire \cmd_translator_0/incr_cmd_0/sel_first ;
  wire \cmd_translator_0/incr_cmd_0/sel_first_0 ;
  wire [2:2]\cmd_translator_0/wrap_cmd_0/axaddr_offset ;
  wire [2:2]\cmd_translator_0/wrap_cmd_0/axaddr_offset_r ;
  wire [33:0]in;
  wire [11:0]m_axi_araddr;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire [11:0]m_axi_awaddr;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire [13:0]\m_payload_i_reg[13] ;
  wire [22:0]\m_payload_i_reg[34] ;
  wire [46:0]\m_payload_i_reg[46] ;
  wire r_push;
  wire r_rlast;
  wire [11:0]s_arid;
  wire [11:0]s_arid_r;
  wire [11:0]s_awid;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [11:0]s_axi_arid;
  wire [3:0]s_axi_arlen;
  wire [2:0]s_axi_arprot;
  wire s_axi_arready;
  wire [1:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [11:0]s_axi_awid;
  wire [3:0]s_axi_awlen;
  wire [2:0]s_axi_awprot;
  wire s_axi_awready;
  wire [1:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire sel_first;
  wire shandshake;
  wire [11:0]si_rs_araddr;
  wire [1:1]si_rs_arburst;
  wire [3:0]si_rs_arlen;
  wire si_rs_arvalid;
  wire [11:0]si_rs_awaddr;
  wire [1:1]si_rs_awburst;
  wire [3:0]si_rs_awlen;
  wire si_rs_awvalid;
  wire [11:0]si_rs_bid;
  wire si_rs_bready;
  wire [1:0]si_rs_bresp;
  wire si_rs_bvalid;
  wire [31:0]si_rs_rdata;
  wire [11:0]si_rs_rid;
  wire si_rs_rlast;
  wire si_rs_rready;
  wire [1:0]si_rs_rresp;

  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_ar_channel \RD.ar_channel_0 
       (.D({SI_REG_n_165,SI_REG_n_166,SI_REG_n_167,SI_REG_n_168,SI_REG_n_169,SI_REG_n_170,SI_REG_n_171}),
        .E(\ar.ar_pipe/p_1_in ),
        .\FSM_sequential_state_reg[0] (\RD.r_channel_0_n_1 ),
        .\FSM_sequential_state_reg[1] (\RD.ar_channel_0_n_4 ),
        .O({SI_REG_n_152,SI_REG_n_153,SI_REG_n_154,SI_REG_n_155}),
        .Q(\ar_cmd_fsm_0/state ),
        .S({SI_REG_n_66,SI_REG_n_67,SI_REG_n_68,SI_REG_n_69}),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .\axaddr_incr_reg[11] ({\RD.ar_channel_0_n_17 ,\RD.ar_channel_0_n_18 ,\RD.ar_channel_0_n_19 ,\RD.ar_channel_0_n_20 ,\RD.ar_channel_0_n_21 ,\RD.ar_channel_0_n_22 ,\RD.ar_channel_0_n_23 ,\RD.ar_channel_0_n_24 ,\RD.ar_channel_0_n_25 ,\RD.ar_channel_0_n_26 ,\RD.ar_channel_0_n_27 ,\RD.ar_channel_0_n_28 }),
        .\axaddr_incr_reg[3] ({SI_REG_n_8,SI_REG_n_9,SI_REG_n_10,SI_REG_n_11}),
        .\axaddr_incr_reg[3]_0 ({SI_REG_n_144,SI_REG_n_145,SI_REG_n_146,SI_REG_n_147}),
        .\axaddr_incr_reg[7] ({SI_REG_n_148,SI_REG_n_149,SI_REG_n_150,SI_REG_n_151}),
        .\axaddr_offset_r_reg[0] (SI_REG_n_175),
        .\axaddr_offset_r_reg[1] (SI_REG_n_184),
        .\axaddr_offset_r_reg[1]_0 (SI_REG_n_173),
        .\axaddr_offset_r_reg[2] (SI_REG_n_172),
        .\axaddr_offset_r_reg[2]_0 (SI_REG_n_174),
        .\axaddr_offset_r_reg[3] (SI_REG_n_162),
        .\axaddr_wrap_reg[11] ({\RD.ar_channel_0_n_5 ,\RD.ar_channel_0_n_6 ,\RD.ar_channel_0_n_7 ,\RD.ar_channel_0_n_8 ,\RD.ar_channel_0_n_9 ,\RD.ar_channel_0_n_10 ,\RD.ar_channel_0_n_11 ,\RD.ar_channel_0_n_12 ,\RD.ar_channel_0_n_13 ,\RD.ar_channel_0_n_14 ,\RD.ar_channel_0_n_15 ,\RD.ar_channel_0_n_16 }),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .\m_payload_i_reg[3] ({\RD.ar_channel_0_n_47 ,\RD.ar_channel_0_n_48 ,\RD.ar_channel_0_n_49 ,\RD.ar_channel_0_n_50 }),
        .m_valid_i0(\ar.ar_pipe/m_valid_i0 ),
        .next_pending_r_reg(SI_REG_n_163),
        .r_push(r_push),
        .r_rlast(r_rlast),
        .\s_arid_r_reg[11]_0 (s_arid_r),
        .\s_arid_r_reg[11]_1 ({s_arid,si_rs_arlen,si_rs_arburst,SI_REG_n_29,SI_REG_n_30,si_rs_araddr}),
        .s_axi_arvalid(s_axi_arvalid),
        .s_ready_i0(\ar.ar_pipe/s_ready_i0 ),
        .s_ready_i_reg(s_axi_arready),
        .sel_first(\cmd_translator_0/incr_cmd_0/sel_first ),
        .sel_first_reg(\RD.ar_channel_0_n_1 ),
        .si_rs_arvalid(si_rs_arvalid),
        .\wrap_second_len_r_reg[3] (SI_REG_n_161));
  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_r_channel \RD.r_channel_0 
       (.D(s_arid_r),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .\cnt_read_reg[2] (\RD.r_channel_0_n_0 ),
        .\cnt_read_reg[4] (\RD.r_channel_0_n_1 ),
        .\cnt_read_reg[4]_0 (SI_REG_n_164),
        .in(in),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .out({si_rs_rresp,si_rs_rdata}),
        .r_push(r_push),
        .r_push_r_reg_0({si_rs_rid,si_rs_rlast}),
        .r_rlast(r_rlast),
        .si_rs_rready(si_rs_rready));
  dwa_ps_bd_axi_register_slice_v2_1_22_axi_register_slice SI_REG
       (.D({SI_REG_n_165,SI_REG_n_166,SI_REG_n_167,SI_REG_n_168,SI_REG_n_169,SI_REG_n_170,SI_REG_n_171}),
        .E(\WR.aw_channel_0_n_5 ),
        .\FSM_sequential_state_reg[0] (SI_REG_n_157),
        .\FSM_sequential_state_reg[1] (SI_REG_n_161),
        .\M00_AXI_0_araddr[11] ({\RD.ar_channel_0_n_17 ,\RD.ar_channel_0_n_18 ,\RD.ar_channel_0_n_19 ,\RD.ar_channel_0_n_20 ,\RD.ar_channel_0_n_21 ,\RD.ar_channel_0_n_22 ,\RD.ar_channel_0_n_23 ,\RD.ar_channel_0_n_24 ,\RD.ar_channel_0_n_25 ,\RD.ar_channel_0_n_26 ,\RD.ar_channel_0_n_27 ,\RD.ar_channel_0_n_28 }),
        .\M00_AXI_0_araddr[11]_0 ({\RD.ar_channel_0_n_5 ,\RD.ar_channel_0_n_6 ,\RD.ar_channel_0_n_7 ,\RD.ar_channel_0_n_8 ,\RD.ar_channel_0_n_9 ,\RD.ar_channel_0_n_10 ,\RD.ar_channel_0_n_11 ,\RD.ar_channel_0_n_12 ,\RD.ar_channel_0_n_13 ,\RD.ar_channel_0_n_14 ,\RD.ar_channel_0_n_15 ,\RD.ar_channel_0_n_16 }),
        .\M00_AXI_0_araddr[11]_1 (\RD.ar_channel_0_n_1 ),
        .\M00_AXI_0_awaddr[11] ({\WR.aw_channel_0_n_19 ,\WR.aw_channel_0_n_20 ,\WR.aw_channel_0_n_21 ,\WR.aw_channel_0_n_22 ,\WR.aw_channel_0_n_23 ,\WR.aw_channel_0_n_24 ,\WR.aw_channel_0_n_25 ,\WR.aw_channel_0_n_26 ,\WR.aw_channel_0_n_27 ,\WR.aw_channel_0_n_28 ,\WR.aw_channel_0_n_29 ,\WR.aw_channel_0_n_30 }),
        .\M00_AXI_0_awaddr[11]_0 (axaddr_wrap),
        .O({SI_REG_n_152,SI_REG_n_153,SI_REG_n_154,SI_REG_n_155}),
        .Q({s_arid,si_rs_arlen,si_rs_arburst,SI_REG_n_29,SI_REG_n_30,\m_payload_i_reg[34] ,si_rs_araddr}),
        .S({SI_REG_n_66,SI_REG_n_67,SI_REG_n_68,SI_REG_n_69}),
        .aclk(aclk),
        .aresetn(aresetn),
        .axaddr_incr(axaddr_incr),
        .\axaddr_incr_reg[3] ({SI_REG_n_8,SI_REG_n_9,SI_REG_n_10,SI_REG_n_11}),
        .\axaddr_incr_reg[3]_0 ({SI_REG_n_70,SI_REG_n_71,SI_REG_n_72,SI_REG_n_73}),
        .\axaddr_incr_reg[3]_1 ({\WR.aw_channel_0_n_49 ,\WR.aw_channel_0_n_50 ,\WR.aw_channel_0_n_51 ,\WR.aw_channel_0_n_52 }),
        .\axaddr_incr_reg[3]_2 ({\RD.ar_channel_0_n_47 ,\RD.ar_channel_0_n_48 ,\RD.ar_channel_0_n_49 ,\RD.ar_channel_0_n_50 }),
        .axaddr_offset(\cmd_translator_0/wrap_cmd_0/axaddr_offset ),
        .\axaddr_offset_r_reg[2] (\aw_cmd_fsm_0/state ),
        .\axaddr_offset_r_reg[2]_0 (\cmd_translator_0/wrap_cmd_0/axaddr_offset_r ),
        .\axaddr_wrap_reg[3] ({SI_REG_n_128,SI_REG_n_129,SI_REG_n_130,SI_REG_n_131}),
        .b_push(b_push),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_awaddr(m_axi_awaddr),
        .\m_payload_i_reg[0] (\ar.ar_pipe/p_1_in ),
        .\m_payload_i_reg[13] (\m_payload_i_reg[13] ),
        .\m_payload_i_reg[1] (SI_REG_n_173),
        .\m_payload_i_reg[1]_0 (SI_REG_n_175),
        .\m_payload_i_reg[1]_1 (SI_REG_n_183),
        .\m_payload_i_reg[1]_2 (SI_REG_n_185),
        .\m_payload_i_reg[2] (SI_REG_n_174),
        .\m_payload_i_reg[2]_0 (SI_REG_n_184),
        .\m_payload_i_reg[2]_1 (SI_REG_n_186),
        .\m_payload_i_reg[3] ({SI_REG_n_144,SI_REG_n_145,SI_REG_n_146,SI_REG_n_147}),
        .\m_payload_i_reg[45] (SI_REG_n_156),
        .\m_payload_i_reg[45]_0 (SI_REG_n_163),
        .\m_payload_i_reg[46] (\m_payload_i_reg[46] ),
        .\m_payload_i_reg[4] (SI_REG_n_172),
        .\m_payload_i_reg[5] (SI_REG_n_162),
        .\m_payload_i_reg[61] ({s_awid,si_rs_awlen,si_rs_awburst,axsize,Q,si_rs_awaddr}),
        .\m_payload_i_reg[6] (SI_REG_n_158),
        .\m_payload_i_reg[6]_0 ({SI_REG_n_176,SI_REG_n_177,SI_REG_n_178,SI_REG_n_179,SI_REG_n_180,SI_REG_n_181,SI_REG_n_182}),
        .\m_payload_i_reg[7] ({SI_REG_n_148,SI_REG_n_149,SI_REG_n_150,SI_REG_n_151}),
        .m_valid_i0(\ar.ar_pipe/m_valid_i0 ),
        .m_valid_i_reg(s_axi_bvalid),
        .m_valid_i_reg_0(s_axi_rvalid),
        .m_valid_i_reg_1(\RD.r_channel_0_n_0 ),
        .next_pending_r_reg(\WR.aw_channel_0_n_4 ),
        .next_pending_r_reg_0(\RD.ar_channel_0_n_4 ),
        .out(si_rs_bid),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_rready(s_axi_rready),
        .s_ready_i0(\ar.ar_pipe/s_ready_i0 ),
        .s_ready_i_reg(s_axi_awready),
        .s_ready_i_reg_0(s_axi_arready),
        .s_ready_i_reg_1(SI_REG_n_164),
        .sel_first(sel_first),
        .sel_first_0(\cmd_translator_0/incr_cmd_0/sel_first_0 ),
        .sel_first_1(\cmd_translator_0/incr_cmd_0/sel_first ),
        .shandshake(shandshake),
        .si_rs_arvalid(si_rs_arvalid),
        .si_rs_awvalid(si_rs_awvalid),
        .si_rs_bready(si_rs_bready),
        .si_rs_bvalid(si_rs_bvalid),
        .si_rs_rready(si_rs_rready),
        .\skid_buffer_reg[1] (si_rs_bresp),
        .\skid_buffer_reg[33] ({si_rs_rresp,si_rs_rdata}),
        .\skid_buffer_reg[46] ({si_rs_rid,si_rs_rlast}),
        .\wrap_second_len_r_reg[3] (\ar_cmd_fsm_0/state ));
  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_aw_channel \WR.aw_channel_0 
       (.D({SI_REG_n_176,SI_REG_n_177,SI_REG_n_178,SI_REG_n_179,SI_REG_n_180,SI_REG_n_181,SI_REG_n_182}),
        .E(\WR.aw_channel_0_n_5 ),
        .\FSM_sequential_state_reg[0] (\WR.aw_channel_0_n_4 ),
        .Q(\aw_cmd_fsm_0/state ),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .axaddr_incr(axaddr_incr),
        .\axaddr_incr_reg[11] ({\WR.aw_channel_0_n_19 ,\WR.aw_channel_0_n_20 ,\WR.aw_channel_0_n_21 ,\WR.aw_channel_0_n_22 ,\WR.aw_channel_0_n_23 ,\WR.aw_channel_0_n_24 ,\WR.aw_channel_0_n_25 ,\WR.aw_channel_0_n_26 ,\WR.aw_channel_0_n_27 ,\WR.aw_channel_0_n_28 ,\WR.aw_channel_0_n_29 ,\WR.aw_channel_0_n_30 }),
        .\axaddr_incr_reg[3] ({SI_REG_n_70,SI_REG_n_71,SI_REG_n_72,SI_REG_n_73}),
        .\axaddr_offset_r_reg[0] (SI_REG_n_183),
        .\axaddr_offset_r_reg[1] (SI_REG_n_186),
        .\axaddr_offset_r_reg[1]_0 (SI_REG_n_185),
        .\axaddr_offset_r_reg[2] (\cmd_translator_0/wrap_cmd_0/axaddr_offset_r ),
        .\axaddr_offset_r_reg[2]_0 (\cmd_translator_0/wrap_cmd_0/axaddr_offset ),
        .\axaddr_offset_r_reg[3] (SI_REG_n_158),
        .\axaddr_wrap_reg[11] (axaddr_wrap),
        .\axaddr_wrap_reg[3] ({SI_REG_n_128,SI_REG_n_129,SI_REG_n_130,SI_REG_n_131}),
        .b_push(b_push),
        .cnt_read(\bid_fifo_0/cnt_read ),
        .in({b_awid,b_awlen}),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .\m_payload_i_reg[3] ({\WR.aw_channel_0_n_49 ,\WR.aw_channel_0_n_50 ,\WR.aw_channel_0_n_51 ,\WR.aw_channel_0_n_52 }),
        .next_pending_r_reg(SI_REG_n_156),
        .\s_awid_r_reg[11]_0 ({s_awid,si_rs_awlen,si_rs_awburst,axsize,si_rs_awaddr}),
        .sel_first(sel_first),
        .sel_first_0(\cmd_translator_0/incr_cmd_0/sel_first_0 ),
        .si_rs_awvalid(si_rs_awvalid),
        .\wrap_second_len_r_reg[3] (SI_REG_n_157));
  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_b_channel \WR.b_channel_0 
       (.aclk(aclk),
        .areset_d1(areset_d1),
        .b_push(b_push),
        .cnt_read(\bid_fifo_0/cnt_read ),
        .in({b_awid,b_awlen}),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .out(si_rs_bid),
        .\s_bresp_acc_reg[1]_0 (si_rs_bresp),
        .shandshake(shandshake),
        .si_rs_bready(si_rs_bready),
        .si_rs_bvalid(si_rs_bvalid));
  LUT1 #(
    .INIT(2'h1)) 
    areset_d1_i_1
       (.I0(aresetn),
        .O(areset_d1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    areset_d1_reg
       (.C(aclk),
        .CE(1'b1),
        .D(areset_d1_i_1_n_0),
        .Q(areset_d1),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_ar_channel" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_ar_channel
   (sel_first,
    sel_first_reg,
    Q,
    \FSM_sequential_state_reg[1] ,
    \axaddr_wrap_reg[11] ,
    \axaddr_incr_reg[11] ,
    r_push,
    m_axi_arvalid,
    m_valid_i0,
    s_ready_i0,
    E,
    r_rlast,
    \s_arid_r_reg[11]_0 ,
    \m_payload_i_reg[3] ,
    aclk,
    si_rs_arvalid,
    m_axi_arready,
    \s_arid_r_reg[11]_1 ,
    S,
    \axaddr_incr_reg[3] ,
    \wrap_second_len_r_reg[3] ,
    \axaddr_offset_r_reg[0] ,
    \FSM_sequential_state_reg[0] ,
    \axaddr_offset_r_reg[2] ,
    \axaddr_offset_r_reg[2]_0 ,
    next_pending_r_reg,
    \axaddr_offset_r_reg[1] ,
    \axaddr_offset_r_reg[1]_0 ,
    \axaddr_offset_r_reg[3] ,
    areset_d1,
    s_axi_arvalid,
    s_ready_i_reg,
    O,
    \axaddr_incr_reg[7] ,
    \axaddr_incr_reg[3]_0 ,
    D);
  output sel_first;
  output sel_first_reg;
  output [1:0]Q;
  output \FSM_sequential_state_reg[1] ;
  output [11:0]\axaddr_wrap_reg[11] ;
  output [11:0]\axaddr_incr_reg[11] ;
  output r_push;
  output m_axi_arvalid;
  output m_valid_i0;
  output s_ready_i0;
  output [0:0]E;
  output r_rlast;
  output [11:0]\s_arid_r_reg[11]_0 ;
  output [3:0]\m_payload_i_reg[3] ;
  input aclk;
  input si_rs_arvalid;
  input m_axi_arready;
  input [30:0]\s_arid_r_reg[11]_1 ;
  input [3:0]S;
  input [3:0]\axaddr_incr_reg[3] ;
  input \wrap_second_len_r_reg[3] ;
  input \axaddr_offset_r_reg[0] ;
  input \FSM_sequential_state_reg[0] ;
  input \axaddr_offset_r_reg[2] ;
  input \axaddr_offset_r_reg[2]_0 ;
  input next_pending_r_reg;
  input \axaddr_offset_r_reg[1] ;
  input \axaddr_offset_r_reg[1]_0 ;
  input \axaddr_offset_r_reg[3] ;
  input areset_d1;
  input s_axi_arvalid;
  input s_ready_i_reg;
  input [3:0]O;
  input [3:0]\axaddr_incr_reg[7] ;
  input [3:0]\axaddr_incr_reg[3]_0 ;
  input [6:0]D;

  wire [6:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state_reg[0] ;
  wire \FSM_sequential_state_reg[1] ;
  wire [3:0]O;
  wire [1:0]Q;
  wire [3:0]S;
  wire aclk;
  wire ar_cmd_fsm_0_n_0;
  wire ar_cmd_fsm_0_n_1;
  wire ar_cmd_fsm_0_n_10;
  wire ar_cmd_fsm_0_n_16;
  wire ar_cmd_fsm_0_n_17;
  wire ar_cmd_fsm_0_n_19;
  wire ar_cmd_fsm_0_n_2;
  wire ar_cmd_fsm_0_n_20;
  wire ar_cmd_fsm_0_n_21;
  wire ar_cmd_fsm_0_n_22;
  wire ar_cmd_fsm_0_n_23;
  wire ar_cmd_fsm_0_n_24;
  wire ar_cmd_fsm_0_n_25;
  wire ar_cmd_fsm_0_n_26;
  wire ar_cmd_fsm_0_n_27;
  wire ar_cmd_fsm_0_n_28;
  wire ar_cmd_fsm_0_n_29;
  wire ar_cmd_fsm_0_n_3;
  wire ar_cmd_fsm_0_n_30;
  wire ar_cmd_fsm_0_n_31;
  wire ar_cmd_fsm_0_n_32;
  wire ar_cmd_fsm_0_n_33;
  wire areset_d1;
  wire [11:0]\axaddr_incr_reg[11] ;
  wire [3:0]\axaddr_incr_reg[3] ;
  wire [3:0]\axaddr_incr_reg[3]_0 ;
  wire [3:0]\axaddr_incr_reg[7] ;
  wire \axaddr_offset_r_reg[0] ;
  wire \axaddr_offset_r_reg[1] ;
  wire \axaddr_offset_r_reg[1]_0 ;
  wire \axaddr_offset_r_reg[2] ;
  wire \axaddr_offset_r_reg[2]_0 ;
  wire \axaddr_offset_r_reg[3] ;
  wire [11:0]\axaddr_wrap_reg[11] ;
  wire cmd_translator_0_n_0;
  wire cmd_translator_0_n_20;
  wire cmd_translator_0_n_21;
  wire cmd_translator_0_n_22;
  wire cmd_translator_0_n_23;
  wire cmd_translator_0_n_24;
  wire cmd_translator_0_n_25;
  wire cmd_translator_0_n_26;
  wire cmd_translator_0_n_27;
  wire cmd_translator_0_n_3;
  wire cmd_translator_0_n_4;
  wire cmd_translator_0_n_40;
  wire cmd_translator_0_n_42;
  wire cmd_translator_0_n_5;
  wire cmd_translator_0_n_51;
  wire cmd_translator_0_n_52;
  wire cmd_translator_0_n_53;
  wire cmd_translator_0_n_54;
  wire cmd_translator_0_n_55;
  wire cmd_translator_0_n_56;
  wire cmd_translator_0_n_57;
  wire cmd_translator_0_n_58;
  wire cmd_translator_0_n_59;
  wire cmd_translator_0_n_6;
  wire cmd_translator_0_n_60;
  wire cmd_translator_0_n_61;
  wire cmd_translator_0_n_62;
  wire cmd_translator_0_n_7;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire [3:0]\m_payload_i_reg[3] ;
  wire m_valid_i0;
  wire next_pending_r_reg;
  wire r_push;
  wire r_rlast;
  wire [11:0]\s_arid_r_reg[11]_0 ;
  wire [30:0]\s_arid_r_reg[11]_1 ;
  wire s_axi_arvalid;
  wire s_ready_i0;
  wire s_ready_i_reg;
  wire sel_first;
  wire sel_first_i;
  wire sel_first_reg;
  wire si_rs_arvalid;
  wire [3:0]\wrap_cmd_0/axaddr_offset ;
  wire [3:0]\wrap_cmd_0/axaddr_offset_r ;
  wire [3:0]\wrap_cmd_0/wrap_second_len ;
  wire [3:0]\wrap_cmd_0/wrap_second_len_r ;
  wire \wrap_second_len_r_reg[3] ;

  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_rd_cmd_fsm ar_cmd_fsm_0
       (.D({ar_cmd_fsm_0_n_0,ar_cmd_fsm_0_n_1,ar_cmd_fsm_0_n_2,ar_cmd_fsm_0_n_3}),
        .E(ar_cmd_fsm_0_n_20),
        .\FSM_sequential_state_reg[0]_0 (\FSM_sequential_state_reg[0] ),
        .\FSM_sequential_state_reg[1]_0 (ar_cmd_fsm_0_n_10),
        .\FSM_sequential_state_reg[1]_1 (\FSM_sequential_state_reg[1] ),
        .\FSM_sequential_state_reg[1]_2 (r_push),
        .\FSM_sequential_state_reg[1]_3 (cmd_translator_0_n_40),
        .M00_AXI_0_arready(ar_cmd_fsm_0_n_16),
        .M00_AXI_0_arready_0(ar_cmd_fsm_0_n_17),
        .M00_AXI_0_arready_1(ar_cmd_fsm_0_n_19),
        .O({cmd_translator_0_n_24,cmd_translator_0_n_25,cmd_translator_0_n_26,cmd_translator_0_n_27}),
        .Q(Q),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .\axaddr_incr_reg[0] (sel_first),
        .axaddr_offset(\wrap_cmd_0/axaddr_offset ),
        .\axaddr_offset_r_reg[0] (\axaddr_offset_r_reg[0] ),
        .\axaddr_offset_r_reg[1] (\axaddr_offset_r_reg[1] ),
        .\axaddr_offset_r_reg[1]_0 (\axaddr_offset_r_reg[1]_0 ),
        .\axaddr_offset_r_reg[2] (\axaddr_offset_r_reg[2] ),
        .\axaddr_offset_r_reg[2]_0 (\axaddr_offset_r_reg[2]_0 ),
        .\axaddr_offset_r_reg[3] (\wrap_cmd_0/axaddr_offset_r ),
        .\axaddr_offset_r_reg[3]_0 ({\s_arid_r_reg[11]_1 [18],\s_arid_r_reg[11]_1 [15],\s_arid_r_reg[11]_1 [11:0]}),
        .\axaddr_offset_r_reg[3]_1 (\axaddr_offset_r_reg[3] ),
        .\axaddr_wrap_reg[10] (cmd_translator_0_n_42),
        .\axaddr_wrap_reg[11] ({cmd_translator_0_n_51,cmd_translator_0_n_52,cmd_translator_0_n_53,cmd_translator_0_n_54,cmd_translator_0_n_55,cmd_translator_0_n_56,cmd_translator_0_n_57,cmd_translator_0_n_58,cmd_translator_0_n_59,cmd_translator_0_n_60,cmd_translator_0_n_61,cmd_translator_0_n_62}),
        .\axaddr_wrap_reg[3] ({cmd_translator_0_n_4,cmd_translator_0_n_5,cmd_translator_0_n_6,cmd_translator_0_n_7}),
        .\axaddr_wrap_reg[7] ({cmd_translator_0_n_20,cmd_translator_0_n_21,cmd_translator_0_n_22,cmd_translator_0_n_23}),
        .\axlen_cnt_reg[7] (cmd_translator_0_n_3),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .\m_payload_i_reg[11] ({ar_cmd_fsm_0_n_22,ar_cmd_fsm_0_n_23,ar_cmd_fsm_0_n_24,ar_cmd_fsm_0_n_25,ar_cmd_fsm_0_n_26,ar_cmd_fsm_0_n_27,ar_cmd_fsm_0_n_28,ar_cmd_fsm_0_n_29,ar_cmd_fsm_0_n_30,ar_cmd_fsm_0_n_31,ar_cmd_fsm_0_n_32,ar_cmd_fsm_0_n_33}),
        .m_valid_i0(m_valid_i0),
        .m_valid_i_reg(E),
        .s_axi_arvalid(s_axi_arvalid),
        .s_ready_i0(s_ready_i0),
        .s_ready_i_reg(s_ready_i_reg),
        .sel_first_i(sel_first_i),
        .sel_first_reg(ar_cmd_fsm_0_n_21),
        .sel_first_reg_0(sel_first_reg),
        .sel_first_reg_1(cmd_translator_0_n_0),
        .si_rs_arvalid(si_rs_arvalid),
        .\wrap_second_len_r_reg[3] (\wrap_cmd_0/wrap_second_len ),
        .\wrap_second_len_r_reg[3]_0 (\wrap_cmd_0/wrap_second_len_r ),
        .\wrap_second_len_r_reg[3]_1 (\wrap_second_len_r_reg[3] ));
  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator_1 cmd_translator_0
       (.D(\wrap_cmd_0/axaddr_offset ),
        .E(ar_cmd_fsm_0_n_20),
        .M00_AXI_0_arready(cmd_translator_0_n_40),
        .O({cmd_translator_0_n_24,cmd_translator_0_n_25,cmd_translator_0_n_26,cmd_translator_0_n_27}),
        .Q(Q),
        .S(S),
        .aclk(aclk),
        .\axaddr_incr_reg[0] (ar_cmd_fsm_0_n_21),
        .\axaddr_incr_reg[11] (\axaddr_incr_reg[11] ),
        .\axaddr_incr_reg[11]_0 (O),
        .\axaddr_incr_reg[3] (\axaddr_incr_reg[3] ),
        .\axaddr_incr_reg[3]_0 (\axaddr_incr_reg[3]_0 ),
        .\axaddr_incr_reg[7] (\axaddr_incr_reg[7] ),
        .\axaddr_offset_r_reg[3] (\wrap_cmd_0/axaddr_offset_r ),
        .\axaddr_wrap_reg[0] (ar_cmd_fsm_0_n_19),
        .\axaddr_wrap_reg[11] (\axaddr_wrap_reg[11] ),
        .\axaddr_wrap_reg[11]_0 ({ar_cmd_fsm_0_n_22,ar_cmd_fsm_0_n_23,ar_cmd_fsm_0_n_24,ar_cmd_fsm_0_n_25,ar_cmd_fsm_0_n_26,ar_cmd_fsm_0_n_27,ar_cmd_fsm_0_n_28,ar_cmd_fsm_0_n_29,ar_cmd_fsm_0_n_30,ar_cmd_fsm_0_n_31,ar_cmd_fsm_0_n_32,ar_cmd_fsm_0_n_33}),
        .\axaddr_wrap_reg[3] ({cmd_translator_0_n_4,cmd_translator_0_n_5,cmd_translator_0_n_6,cmd_translator_0_n_7}),
        .\axaddr_wrap_reg[7] ({cmd_translator_0_n_20,cmd_translator_0_n_21,cmd_translator_0_n_22,cmd_translator_0_n_23}),
        .\axlen_cnt_reg[0] (cmd_translator_0_n_42),
        .\axlen_cnt_reg[3] (\FSM_sequential_state_reg[1] ),
        .\axlen_cnt_reg[3]_0 ({\s_arid_r_reg[11]_1 [18:7],\s_arid_r_reg[11]_1 [3:0]}),
        .\axlen_cnt_reg[7] (cmd_translator_0_n_3),
        .\axlen_cnt_reg[7]_0 (ar_cmd_fsm_0_n_10),
        .m_axi_arready(m_axi_arready),
        .\m_payload_i_reg[3] (\m_payload_i_reg[3] ),
        .next_pending_r_reg(next_pending_r_reg),
        .r_push(r_push),
        .r_rlast(r_rlast),
        .sel_first_i(sel_first_i),
        .sel_first_reg_0(cmd_translator_0_n_0),
        .sel_first_reg_1(sel_first),
        .sel_first_reg_2(sel_first_reg),
        .sel_first_reg_3(ar_cmd_fsm_0_n_17),
        .sel_first_reg_4(ar_cmd_fsm_0_n_16),
        .si_rs_arvalid(si_rs_arvalid),
        .\wrap_boundary_axaddr_r_reg[11] ({cmd_translator_0_n_51,cmd_translator_0_n_52,cmd_translator_0_n_53,cmd_translator_0_n_54,cmd_translator_0_n_55,cmd_translator_0_n_56,cmd_translator_0_n_57,cmd_translator_0_n_58,cmd_translator_0_n_59,cmd_translator_0_n_60,cmd_translator_0_n_61,cmd_translator_0_n_62}),
        .\wrap_boundary_axaddr_r_reg[6] (D),
        .\wrap_cnt_r_reg[3] ({ar_cmd_fsm_0_n_0,ar_cmd_fsm_0_n_1,ar_cmd_fsm_0_n_2,ar_cmd_fsm_0_n_3}),
        .\wrap_second_len_r_reg[3] (\wrap_cmd_0/wrap_second_len_r ),
        .\wrap_second_len_r_reg[3]_0 (\wrap_cmd_0/wrap_second_len ));
  FDRE \s_arid_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_arid_r_reg[11]_1 [19]),
        .Q(\s_arid_r_reg[11]_0 [0]),
        .R(1'b0));
  FDRE \s_arid_r_reg[10] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_arid_r_reg[11]_1 [29]),
        .Q(\s_arid_r_reg[11]_0 [10]),
        .R(1'b0));
  FDRE \s_arid_r_reg[11] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_arid_r_reg[11]_1 [30]),
        .Q(\s_arid_r_reg[11]_0 [11]),
        .R(1'b0));
  FDRE \s_arid_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_arid_r_reg[11]_1 [20]),
        .Q(\s_arid_r_reg[11]_0 [1]),
        .R(1'b0));
  FDRE \s_arid_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_arid_r_reg[11]_1 [21]),
        .Q(\s_arid_r_reg[11]_0 [2]),
        .R(1'b0));
  FDRE \s_arid_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_arid_r_reg[11]_1 [22]),
        .Q(\s_arid_r_reg[11]_0 [3]),
        .R(1'b0));
  FDRE \s_arid_r_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_arid_r_reg[11]_1 [23]),
        .Q(\s_arid_r_reg[11]_0 [4]),
        .R(1'b0));
  FDRE \s_arid_r_reg[5] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_arid_r_reg[11]_1 [24]),
        .Q(\s_arid_r_reg[11]_0 [5]),
        .R(1'b0));
  FDRE \s_arid_r_reg[6] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_arid_r_reg[11]_1 [25]),
        .Q(\s_arid_r_reg[11]_0 [6]),
        .R(1'b0));
  FDRE \s_arid_r_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_arid_r_reg[11]_1 [26]),
        .Q(\s_arid_r_reg[11]_0 [7]),
        .R(1'b0));
  FDRE \s_arid_r_reg[8] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_arid_r_reg[11]_1 [27]),
        .Q(\s_arid_r_reg[11]_0 [8]),
        .R(1'b0));
  FDRE \s_arid_r_reg[9] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_arid_r_reg[11]_1 [28]),
        .Q(\s_arid_r_reg[11]_0 [9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_aw_channel" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_aw_channel
   (sel_first_0,
    sel_first,
    Q,
    \FSM_sequential_state_reg[0] ,
    E,
    b_push,
    \axaddr_wrap_reg[11] ,
    \axaddr_incr_reg[11] ,
    \axaddr_offset_r_reg[2] ,
    m_axi_awvalid,
    in,
    \m_payload_i_reg[3] ,
    aclk,
    \s_awid_r_reg[11]_0 ,
    si_rs_awvalid,
    \axaddr_offset_r_reg[2]_0 ,
    \axaddr_wrap_reg[3] ,
    \axaddr_incr_reg[3] ,
    \wrap_second_len_r_reg[3] ,
    \axaddr_offset_r_reg[0] ,
    next_pending_r_reg,
    m_axi_awready,
    areset_d1,
    \axaddr_offset_r_reg[3] ,
    \axaddr_offset_r_reg[1] ,
    \axaddr_offset_r_reg[1]_0 ,
    cnt_read,
    axaddr_incr,
    D);
  output sel_first_0;
  output sel_first;
  output [1:0]Q;
  output \FSM_sequential_state_reg[0] ;
  output [0:0]E;
  output b_push;
  output [11:0]\axaddr_wrap_reg[11] ;
  output [11:0]\axaddr_incr_reg[11] ;
  output [0:0]\axaddr_offset_r_reg[2] ;
  output m_axi_awvalid;
  output [15:0]in;
  output [3:0]\m_payload_i_reg[3] ;
  input aclk;
  input [30:0]\s_awid_r_reg[11]_0 ;
  input si_rs_awvalid;
  input [0:0]\axaddr_offset_r_reg[2]_0 ;
  input [3:0]\axaddr_wrap_reg[3] ;
  input [3:0]\axaddr_incr_reg[3] ;
  input \wrap_second_len_r_reg[3] ;
  input \axaddr_offset_r_reg[0] ;
  input next_pending_r_reg;
  input m_axi_awready;
  input areset_d1;
  input \axaddr_offset_r_reg[3] ;
  input \axaddr_offset_r_reg[1] ;
  input \axaddr_offset_r_reg[1]_0 ;
  input [1:0]cnt_read;
  input [11:0]axaddr_incr;
  input [6:0]D;

  wire [6:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state_reg[0] ;
  wire [1:0]Q;
  wire aclk;
  wire areset_d1;
  wire aw_cmd_fsm_0_n_10;
  wire aw_cmd_fsm_0_n_18;
  wire aw_cmd_fsm_0_n_2;
  wire aw_cmd_fsm_0_n_20;
  wire aw_cmd_fsm_0_n_21;
  wire aw_cmd_fsm_0_n_22;
  wire aw_cmd_fsm_0_n_23;
  wire aw_cmd_fsm_0_n_25;
  wire aw_cmd_fsm_0_n_26;
  wire aw_cmd_fsm_0_n_27;
  wire aw_cmd_fsm_0_n_28;
  wire aw_cmd_fsm_0_n_29;
  wire aw_cmd_fsm_0_n_3;
  wire aw_cmd_fsm_0_n_30;
  wire aw_cmd_fsm_0_n_31;
  wire aw_cmd_fsm_0_n_32;
  wire aw_cmd_fsm_0_n_33;
  wire aw_cmd_fsm_0_n_34;
  wire aw_cmd_fsm_0_n_35;
  wire aw_cmd_fsm_0_n_36;
  wire aw_cmd_fsm_0_n_9;
  wire [11:0]axaddr_incr;
  wire [11:0]\axaddr_incr_reg[11] ;
  wire [3:0]\axaddr_incr_reg[3] ;
  wire \axaddr_offset_r_reg[0] ;
  wire \axaddr_offset_r_reg[1] ;
  wire \axaddr_offset_r_reg[1]_0 ;
  wire [0:0]\axaddr_offset_r_reg[2] ;
  wire [0:0]\axaddr_offset_r_reg[2]_0 ;
  wire \axaddr_offset_r_reg[3] ;
  wire [11:0]axaddr_wrap0;
  wire [11:0]\axaddr_wrap_reg[11] ;
  wire [3:0]\axaddr_wrap_reg[3] ;
  wire b_push;
  wire cmd_translator_0_n_2;
  wire cmd_translator_0_n_43;
  wire cmd_translator_0_n_44;
  wire cmd_translator_0_n_5;
  wire cmd_translator_0_n_6;
  wire [1:0]cnt_read;
  wire [15:0]in;
  wire \incr_cmd_0/next_pending_r ;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire [3:0]\m_payload_i_reg[3] ;
  wire next;
  wire next_pending_r_reg;
  wire [30:0]\s_awid_r_reg[11]_0 ;
  wire sel_first;
  wire sel_first_0;
  wire sel_first_i;
  wire si_rs_awvalid;
  wire [11:0]wrap_boundary_axaddr_r;
  wire [3:0]\wrap_cmd_0/axaddr_offset ;
  wire [3:0]\wrap_cmd_0/axaddr_offset_r ;
  wire \wrap_cmd_0/next_pending_r ;
  wire [3:0]\wrap_cmd_0/wrap_second_len ;
  wire [3:0]\wrap_cmd_0/wrap_second_len_r ;
  wire [3:2]wrap_cnt;
  wire \wrap_second_len_r_reg[3] ;

  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wr_cmd_fsm aw_cmd_fsm_0
       (.D({wrap_cnt,aw_cmd_fsm_0_n_2,aw_cmd_fsm_0_n_3}),
        .E(E),
        .\FSM_sequential_state_reg[0]_0 (aw_cmd_fsm_0_n_9),
        .\FSM_sequential_state_reg[0]_1 (aw_cmd_fsm_0_n_10),
        .\FSM_sequential_state_reg[0]_2 (\FSM_sequential_state_reg[0] ),
        .\FSM_sequential_state_reg[1]_0 (cmd_translator_0_n_43),
        .M00_AXI_0_awready(b_push),
        .Q(Q),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .axaddr_offset({\wrap_cmd_0/axaddr_offset [3],\wrap_cmd_0/axaddr_offset [1:0]}),
        .\axaddr_offset_r_reg[0] (\axaddr_offset_r_reg[0] ),
        .\axaddr_offset_r_reg[1] (\axaddr_offset_r_reg[1] ),
        .\axaddr_offset_r_reg[1]_0 (\axaddr_offset_r_reg[1]_0 ),
        .\axaddr_offset_r_reg[3] ({\wrap_cmd_0/axaddr_offset_r [3],\wrap_cmd_0/axaddr_offset_r [1:0]}),
        .\axaddr_offset_r_reg[3]_0 ({\s_awid_r_reg[11]_0 [18],\s_awid_r_reg[11]_0 [15:14],\s_awid_r_reg[11]_0 [11:0]}),
        .\axaddr_offset_r_reg[3]_1 (\axaddr_offset_r_reg[3] ),
        .axaddr_wrap0(axaddr_wrap0),
        .\axaddr_wrap_reg[11] (wrap_boundary_axaddr_r),
        .\axaddr_wrap_reg[11]_0 (cmd_translator_0_n_44),
        .\axlen_cnt_reg[2] (aw_cmd_fsm_0_n_18),
        .\axlen_cnt_reg[2]_0 (aw_cmd_fsm_0_n_20),
        .cnt_read(cnt_read),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .m_valid_i_reg(aw_cmd_fsm_0_n_21),
        .next(next),
        .next_pending_r(\incr_cmd_0/next_pending_r ),
        .next_pending_r_0(\wrap_cmd_0/next_pending_r ),
        .s_axburst_eq0_reg(cmd_translator_0_n_5),
        .s_axburst_eq0_reg_0(cmd_translator_0_n_6),
        .s_axburst_eq1_reg(next_pending_r_reg),
        .sel_first(sel_first),
        .sel_first_i(sel_first_i),
        .sel_first_reg(aw_cmd_fsm_0_n_22),
        .sel_first_reg_0(aw_cmd_fsm_0_n_23),
        .sel_first_reg_1(sel_first_0),
        .sel_first_reg_2(cmd_translator_0_n_2),
        .si_rs_awvalid(si_rs_awvalid),
        .\wrap_boundary_axaddr_r_reg[11] ({aw_cmd_fsm_0_n_25,aw_cmd_fsm_0_n_26,aw_cmd_fsm_0_n_27,aw_cmd_fsm_0_n_28,aw_cmd_fsm_0_n_29,aw_cmd_fsm_0_n_30,aw_cmd_fsm_0_n_31,aw_cmd_fsm_0_n_32,aw_cmd_fsm_0_n_33,aw_cmd_fsm_0_n_34,aw_cmd_fsm_0_n_35,aw_cmd_fsm_0_n_36}),
        .\wrap_second_len_r_reg[0] (\axaddr_offset_r_reg[2]_0 ),
        .\wrap_second_len_r_reg[3] (\wrap_cmd_0/wrap_second_len ),
        .\wrap_second_len_r_reg[3]_0 (\wrap_cmd_0/wrap_second_len_r ),
        .\wrap_second_len_r_reg[3]_1 (\wrap_second_len_r_reg[3] ));
  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator cmd_translator_0
       (.D({\wrap_cmd_0/axaddr_offset [3],\axaddr_offset_r_reg[2]_0 ,\wrap_cmd_0/axaddr_offset [1:0]}),
        .E(aw_cmd_fsm_0_n_21),
        .Q(Q),
        .aclk(aclk),
        .axaddr_incr(axaddr_incr),
        .\axaddr_incr_reg[11] (\axaddr_incr_reg[11] ),
        .\axaddr_incr_reg[3] (\axaddr_incr_reg[3] ),
        .\axaddr_offset_r_reg[3] ({\wrap_cmd_0/axaddr_offset_r [3],\axaddr_offset_r_reg[2] ,\wrap_cmd_0/axaddr_offset_r [1:0]}),
        .axaddr_wrap0(axaddr_wrap0),
        .\axaddr_wrap_reg[0] (aw_cmd_fsm_0_n_10),
        .\axaddr_wrap_reg[11] (\axaddr_wrap_reg[11] ),
        .\axaddr_wrap_reg[11]_0 ({aw_cmd_fsm_0_n_25,aw_cmd_fsm_0_n_26,aw_cmd_fsm_0_n_27,aw_cmd_fsm_0_n_28,aw_cmd_fsm_0_n_29,aw_cmd_fsm_0_n_30,aw_cmd_fsm_0_n_31,aw_cmd_fsm_0_n_32,aw_cmd_fsm_0_n_33,aw_cmd_fsm_0_n_34,aw_cmd_fsm_0_n_35,aw_cmd_fsm_0_n_36}),
        .\axaddr_wrap_reg[3] (\axaddr_wrap_reg[3] ),
        .\axlen_cnt_reg[0] (cmd_translator_0_n_44),
        .\axlen_cnt_reg[2] (cmd_translator_0_n_6),
        .\axlen_cnt_reg[3] ({\s_awid_r_reg[11]_0 [18:7],\s_awid_r_reg[11]_0 [3:0]}),
        .\axlen_cnt_reg[3]_0 (\FSM_sequential_state_reg[0] ),
        .\axlen_cnt_reg[5] (cmd_translator_0_n_5),
        .\axlen_cnt_reg[5]_0 (aw_cmd_fsm_0_n_9),
        .\m_payload_i_reg[3] (\m_payload_i_reg[3] ),
        .next(next),
        .next_pending_r(\incr_cmd_0/next_pending_r ),
        .next_pending_r_0(\wrap_cmd_0/next_pending_r ),
        .next_pending_r_reg(next_pending_r_reg),
        .s_axburst_eq0_reg_0(aw_cmd_fsm_0_n_18),
        .s_axburst_eq1_reg_0(cmd_translator_0_n_43),
        .s_axburst_eq1_reg_1(aw_cmd_fsm_0_n_20),
        .sel_first(sel_first),
        .sel_first_i(sel_first_i),
        .sel_first_reg_0(cmd_translator_0_n_2),
        .sel_first_reg_1(sel_first_0),
        .sel_first_reg_2(aw_cmd_fsm_0_n_23),
        .sel_first_reg_3(aw_cmd_fsm_0_n_22),
        .si_rs_awvalid(si_rs_awvalid),
        .\wrap_boundary_axaddr_r_reg[11] (wrap_boundary_axaddr_r),
        .\wrap_boundary_axaddr_r_reg[6] (D),
        .\wrap_cnt_r_reg[3] ({wrap_cnt,aw_cmd_fsm_0_n_2,aw_cmd_fsm_0_n_3}),
        .\wrap_second_len_r_reg[3] (\wrap_cmd_0/wrap_second_len_r ),
        .\wrap_second_len_r_reg[3]_0 (\wrap_cmd_0/wrap_second_len ));
  FDRE \s_awid_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [19]),
        .Q(in[4]),
        .R(1'b0));
  FDRE \s_awid_r_reg[10] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [29]),
        .Q(in[14]),
        .R(1'b0));
  FDRE \s_awid_r_reg[11] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [30]),
        .Q(in[15]),
        .R(1'b0));
  FDRE \s_awid_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [20]),
        .Q(in[5]),
        .R(1'b0));
  FDRE \s_awid_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [21]),
        .Q(in[6]),
        .R(1'b0));
  FDRE \s_awid_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [22]),
        .Q(in[7]),
        .R(1'b0));
  FDRE \s_awid_r_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [23]),
        .Q(in[8]),
        .R(1'b0));
  FDRE \s_awid_r_reg[5] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [24]),
        .Q(in[9]),
        .R(1'b0));
  FDRE \s_awid_r_reg[6] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [25]),
        .Q(in[10]),
        .R(1'b0));
  FDRE \s_awid_r_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [26]),
        .Q(in[11]),
        .R(1'b0));
  FDRE \s_awid_r_reg[8] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [27]),
        .Q(in[12]),
        .R(1'b0));
  FDRE \s_awid_r_reg[9] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [28]),
        .Q(in[13]),
        .R(1'b0));
  FDRE \s_awlen_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [15]),
        .Q(in[0]),
        .R(1'b0));
  FDRE \s_awlen_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [16]),
        .Q(in[1]),
        .R(1'b0));
  FDRE \s_awlen_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [17]),
        .Q(in[2]),
        .R(1'b0));
  FDRE \s_awlen_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_awid_r_reg[11]_0 [18]),
        .Q(in[3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_b_channel" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_b_channel
   (si_rs_bvalid,
    cnt_read,
    m_axi_bready,
    out,
    \s_bresp_acc_reg[1]_0 ,
    areset_d1,
    shandshake,
    aclk,
    si_rs_bready,
    m_axi_bvalid,
    b_push,
    in,
    m_axi_bresp);
  output si_rs_bvalid;
  output [1:0]cnt_read;
  output m_axi_bready;
  output [11:0]out;
  output [1:0]\s_bresp_acc_reg[1]_0 ;
  input areset_d1;
  input shandshake;
  input aclk;
  input si_rs_bready;
  input m_axi_bvalid;
  input b_push;
  input [15:0]in;
  input [1:0]m_axi_bresp;

  wire aclk;
  wire areset_d1;
  wire b_push;
  wire bid_fifo_0_n_4;
  wire bid_fifo_0_n_5;
  wire \bresp_cnt[7]_i_3_n_0 ;
  wire [7:0]bresp_cnt_reg;
  wire bresp_fifo_0_n_0;
  wire bresp_push;
  wire [1:0]cnt_read;
  wire [15:0]in;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire mhandshake;
  wire mhandshake_r;
  wire [11:0]out;
  wire [7:0]p_0_in;
  wire s_bresp_acc0;
  wire \s_bresp_acc[0]_i_1_n_0 ;
  wire \s_bresp_acc[1]_i_1_n_0 ;
  wire [1:0]\s_bresp_acc_reg[1]_0 ;
  wire \s_bresp_acc_reg_n_0_[0] ;
  wire \s_bresp_acc_reg_n_0_[1] ;
  wire shandshake;
  wire shandshake_r;
  wire si_rs_bready;
  wire si_rs_bvalid;

  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo bid_fifo_0
       (.Q(bresp_cnt_reg),
        .SR(s_bresp_acc0),
        .aclk(aclk),
        .addr(cnt_read),
        .areset_d1(areset_d1),
        .b_push(b_push),
        .\bresp_cnt_reg[1] (bid_fifo_0_n_4),
        .\cnt_read_reg[1]_0 (bid_fifo_0_n_5),
        .in(in),
        .mhandshake_r(mhandshake_r),
        .out(out),
        .sel(bresp_push),
        .shandshake_r(shandshake_r));
  LUT1 #(
    .INIT(2'h1)) 
    \bresp_cnt[0]_i_1 
       (.I0(bresp_cnt_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \bresp_cnt[1]_i_1 
       (.I0(bresp_cnt_reg[1]),
        .I1(bresp_cnt_reg[0]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \bresp_cnt[2]_i_1 
       (.I0(bresp_cnt_reg[2]),
        .I1(bresp_cnt_reg[0]),
        .I2(bresp_cnt_reg[1]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \bresp_cnt[3]_i_1 
       (.I0(bresp_cnt_reg[3]),
        .I1(bresp_cnt_reg[1]),
        .I2(bresp_cnt_reg[0]),
        .I3(bresp_cnt_reg[2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \bresp_cnt[4]_i_1 
       (.I0(bresp_cnt_reg[4]),
        .I1(bresp_cnt_reg[2]),
        .I2(bresp_cnt_reg[0]),
        .I3(bresp_cnt_reg[1]),
        .I4(bresp_cnt_reg[3]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \bresp_cnt[5]_i_1 
       (.I0(bresp_cnt_reg[5]),
        .I1(bresp_cnt_reg[3]),
        .I2(bresp_cnt_reg[1]),
        .I3(bresp_cnt_reg[0]),
        .I4(bresp_cnt_reg[2]),
        .I5(bresp_cnt_reg[4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \bresp_cnt[6]_i_1 
       (.I0(bresp_cnt_reg[6]),
        .I1(\bresp_cnt[7]_i_3_n_0 ),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \bresp_cnt[7]_i_2 
       (.I0(bresp_cnt_reg[7]),
        .I1(\bresp_cnt[7]_i_3_n_0 ),
        .I2(bresp_cnt_reg[6]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \bresp_cnt[7]_i_3 
       (.I0(bresp_cnt_reg[5]),
        .I1(bresp_cnt_reg[3]),
        .I2(bresp_cnt_reg[1]),
        .I3(bresp_cnt_reg[0]),
        .I4(bresp_cnt_reg[2]),
        .I5(bresp_cnt_reg[4]),
        .O(\bresp_cnt[7]_i_3_n_0 ));
  FDRE \bresp_cnt_reg[0] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[0]),
        .Q(bresp_cnt_reg[0]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[1] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[1]),
        .Q(bresp_cnt_reg[1]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[2] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[2]),
        .Q(bresp_cnt_reg[2]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[3] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[3]),
        .Q(bresp_cnt_reg[3]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[4] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[4]),
        .Q(bresp_cnt_reg[4]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[5] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[5]),
        .Q(bresp_cnt_reg[5]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[6] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[6]),
        .Q(bresp_cnt_reg[6]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[7] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[7]),
        .Q(bresp_cnt_reg[7]),
        .R(s_bresp_acc0));
  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized0 bresp_fifo_0
       (.aclk(aclk),
        .areset_d1(areset_d1),
        .areset_d1_reg(bresp_fifo_0_n_0),
        .bvalid_i_reg(bid_fifo_0_n_5),
        .\cnt_read_reg[1]_0 (bid_fifo_0_n_4),
        .in({\s_bresp_acc_reg_n_0_[1] ,\s_bresp_acc_reg_n_0_[0] }),
        .m_axi_bready(m_axi_bready),
        .m_axi_bvalid(m_axi_bvalid),
        .mhandshake(mhandshake),
        .mhandshake_r(mhandshake_r),
        .\s_bresp_acc_reg[1] (\s_bresp_acc_reg[1]_0 ),
        .sel(bresp_push),
        .shandshake_r(shandshake_r),
        .si_rs_bready(si_rs_bready),
        .si_rs_bvalid(si_rs_bvalid));
  FDRE #(
    .INIT(1'b0)) 
    bvalid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(bresp_fifo_0_n_0),
        .Q(si_rs_bvalid),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mhandshake_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(mhandshake),
        .Q(mhandshake_r),
        .R(areset_d1));
  LUT6 #(
    .INIT(64'h00000000EACECCCC)) 
    \s_bresp_acc[0]_i_1 
       (.I0(m_axi_bresp[0]),
        .I1(\s_bresp_acc_reg_n_0_[0] ),
        .I2(\s_bresp_acc_reg_n_0_[1] ),
        .I3(m_axi_bresp[1]),
        .I4(mhandshake),
        .I5(s_bresp_acc0),
        .O(\s_bresp_acc[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00EA)) 
    \s_bresp_acc[1]_i_1 
       (.I0(\s_bresp_acc_reg_n_0_[1] ),
        .I1(m_axi_bresp[1]),
        .I2(mhandshake),
        .I3(s_bresp_acc0),
        .O(\s_bresp_acc[1]_i_1_n_0 ));
  FDRE \s_bresp_acc_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_bresp_acc[0]_i_1_n_0 ),
        .Q(\s_bresp_acc_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \s_bresp_acc_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\s_bresp_acc[1]_i_1_n_0 ),
        .Q(\s_bresp_acc_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    shandshake_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(shandshake),
        .Q(shandshake_r),
        .R(areset_d1));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_cmd_translator" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator
   (next_pending_r,
    next_pending_r_0,
    sel_first_reg_0,
    sel_first_reg_1,
    sel_first,
    \axlen_cnt_reg[5] ,
    \axlen_cnt_reg[2] ,
    axaddr_wrap0,
    \axaddr_wrap_reg[11] ,
    \axaddr_incr_reg[11] ,
    s_axburst_eq1_reg_0,
    \axlen_cnt_reg[0] ,
    \axaddr_offset_r_reg[3] ,
    \wrap_second_len_r_reg[3] ,
    \wrap_boundary_axaddr_r_reg[11] ,
    \m_payload_i_reg[3] ,
    aclk,
    sel_first_i,
    s_axburst_eq0_reg_0,
    s_axburst_eq1_reg_1,
    sel_first_reg_2,
    sel_first_reg_3,
    \axlen_cnt_reg[3] ,
    Q,
    si_rs_awvalid,
    \axlen_cnt_reg[3]_0 ,
    \axaddr_wrap_reg[3] ,
    \axaddr_incr_reg[3] ,
    next,
    \axaddr_wrap_reg[0] ,
    next_pending_r_reg,
    axaddr_incr,
    \axlen_cnt_reg[5]_0 ,
    D,
    \wrap_second_len_r_reg[3]_0 ,
    \wrap_cnt_r_reg[3] ,
    E,
    \wrap_boundary_axaddr_r_reg[6] ,
    \axaddr_wrap_reg[11]_0 );
  output next_pending_r;
  output next_pending_r_0;
  output sel_first_reg_0;
  output sel_first_reg_1;
  output sel_first;
  output \axlen_cnt_reg[5] ;
  output \axlen_cnt_reg[2] ;
  output [11:0]axaddr_wrap0;
  output [11:0]\axaddr_wrap_reg[11] ;
  output [11:0]\axaddr_incr_reg[11] ;
  output s_axburst_eq1_reg_0;
  output \axlen_cnt_reg[0] ;
  output [3:0]\axaddr_offset_r_reg[3] ;
  output [3:0]\wrap_second_len_r_reg[3] ;
  output [11:0]\wrap_boundary_axaddr_r_reg[11] ;
  output [3:0]\m_payload_i_reg[3] ;
  input aclk;
  input sel_first_i;
  input s_axburst_eq0_reg_0;
  input s_axburst_eq1_reg_1;
  input sel_first_reg_2;
  input sel_first_reg_3;
  input [15:0]\axlen_cnt_reg[3] ;
  input [1:0]Q;
  input si_rs_awvalid;
  input \axlen_cnt_reg[3]_0 ;
  input [3:0]\axaddr_wrap_reg[3] ;
  input [3:0]\axaddr_incr_reg[3] ;
  input next;
  input \axaddr_wrap_reg[0] ;
  input next_pending_r_reg;
  input [11:0]axaddr_incr;
  input \axlen_cnt_reg[5]_0 ;
  input [3:0]D;
  input [3:0]\wrap_second_len_r_reg[3]_0 ;
  input [3:0]\wrap_cnt_r_reg[3] ;
  input [0:0]E;
  input [6:0]\wrap_boundary_axaddr_r_reg[6] ;
  input [11:0]\axaddr_wrap_reg[11]_0 ;

  wire [3:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire aclk;
  wire [11:0]axaddr_incr;
  wire [11:0]\axaddr_incr_reg[11] ;
  wire [3:0]\axaddr_incr_reg[3] ;
  wire [3:0]\axaddr_offset_r_reg[3] ;
  wire [11:0]axaddr_wrap0;
  wire \axaddr_wrap_reg[0] ;
  wire [11:0]\axaddr_wrap_reg[11] ;
  wire [11:0]\axaddr_wrap_reg[11]_0 ;
  wire [3:0]\axaddr_wrap_reg[3] ;
  wire \axlen_cnt_reg[0] ;
  wire \axlen_cnt_reg[2] ;
  wire [15:0]\axlen_cnt_reg[3] ;
  wire \axlen_cnt_reg[3]_0 ;
  wire \axlen_cnt_reg[5] ;
  wire \axlen_cnt_reg[5]_0 ;
  wire [3:0]\m_payload_i_reg[3] ;
  wire next;
  wire next_pending_r;
  wire next_pending_r_0;
  wire next_pending_r_reg;
  wire s_axburst_eq0;
  wire s_axburst_eq0_reg_0;
  wire s_axburst_eq1;
  wire s_axburst_eq1_reg_0;
  wire s_axburst_eq1_reg_1;
  wire sel_first;
  wire sel_first_i;
  wire sel_first_reg_0;
  wire sel_first_reg_1;
  wire sel_first_reg_2;
  wire sel_first_reg_3;
  wire si_rs_awvalid;
  wire [11:0]\wrap_boundary_axaddr_r_reg[11] ;
  wire [6:0]\wrap_boundary_axaddr_r_reg[6] ;
  wire [3:0]\wrap_cnt_r_reg[3] ;
  wire [3:0]\wrap_second_len_r_reg[3] ;
  wire [3:0]\wrap_second_len_r_reg[3]_0 ;

  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(s_axburst_eq1),
        .I1(\axlen_cnt_reg[3] [11]),
        .I2(s_axburst_eq0),
        .O(s_axburst_eq1_reg_0));
  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd incr_cmd_0
       (.Q(Q),
        .aclk(aclk),
        .axaddr_incr(axaddr_incr),
        .\axaddr_incr_reg[11]_0 (\axaddr_incr_reg[11] ),
        .\axaddr_incr_reg[3]_0 (\axaddr_incr_reg[3] ),
        .\axlen_cnt_reg[3]_0 ({\axlen_cnt_reg[3] [15:12],\axlen_cnt_reg[3] [10:9],\axlen_cnt_reg[3] [3:0]}),
        .\axlen_cnt_reg[3]_1 (\axlen_cnt_reg[3]_0 ),
        .\axlen_cnt_reg[4]_0 (\axaddr_wrap_reg[0] ),
        .\axlen_cnt_reg[5]_0 (\axlen_cnt_reg[5] ),
        .\axlen_cnt_reg[5]_1 (\axlen_cnt_reg[5]_0 ),
        .\m_payload_i_reg[3] (\m_payload_i_reg[3] ),
        .next(next),
        .next_pending_r(next_pending_r),
        .next_pending_r_reg_0(next_pending_r_reg),
        .sel_first_reg_0(sel_first_reg_1),
        .sel_first_reg_1(sel_first_reg_2),
        .si_rs_awvalid(si_rs_awvalid));
  FDRE s_axburst_eq0_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_axburst_eq0_reg_0),
        .Q(s_axburst_eq0),
        .R(1'b0));
  FDRE s_axburst_eq1_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_axburst_eq1_reg_1),
        .Q(s_axburst_eq1),
        .R(1'b0));
  FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_i),
        .Q(sel_first_reg_0),
        .R(1'b0));
  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd wrap_cmd_0
       (.D(D),
        .E(E),
        .Q(Q),
        .aclk(aclk),
        .\axaddr_offset_r_reg[3]_0 (\axaddr_offset_r_reg[3] ),
        .axaddr_wrap0(axaddr_wrap0),
        .\axaddr_wrap_reg[0]_0 (\axaddr_wrap_reg[0] ),
        .\axaddr_wrap_reg[11]_0 (\axaddr_wrap_reg[11] ),
        .\axaddr_wrap_reg[11]_1 (\axaddr_wrap_reg[11]_0 ),
        .\axaddr_wrap_reg[3]_0 (\axaddr_wrap_reg[3] ),
        .\axlen_cnt_reg[0]_0 (\axlen_cnt_reg[0] ),
        .\axlen_cnt_reg[2]_0 (\axlen_cnt_reg[2] ),
        .\axlen_cnt_reg[3]_0 ({\axlen_cnt_reg[3] [15:12],\axlen_cnt_reg[3] [8:4]}),
        .\axlen_cnt_reg[3]_1 (\axlen_cnt_reg[3]_0 ),
        .next(next),
        .next_pending_r_0(next_pending_r_0),
        .next_pending_r_reg_0(next_pending_r_reg),
        .sel_first(sel_first),
        .sel_first_reg_0(sel_first_reg_3),
        .si_rs_awvalid(si_rs_awvalid),
        .\wrap_boundary_axaddr_r_reg[11]_0 (\wrap_boundary_axaddr_r_reg[11] ),
        .\wrap_boundary_axaddr_r_reg[6]_0 (\wrap_boundary_axaddr_r_reg[6] ),
        .\wrap_cnt_r_reg[3]_0 (\wrap_cnt_r_reg[3] ),
        .\wrap_second_len_r_reg[3]_0 (\wrap_second_len_r_reg[3] ),
        .\wrap_second_len_r_reg[3]_1 (\wrap_second_len_r_reg[3]_0 ));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_cmd_translator" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator_1
   (sel_first_reg_0,
    sel_first_reg_1,
    sel_first_reg_2,
    \axlen_cnt_reg[7] ,
    \axaddr_wrap_reg[3] ,
    \axaddr_wrap_reg[11] ,
    \axaddr_wrap_reg[7] ,
    O,
    \axaddr_incr_reg[11] ,
    M00_AXI_0_arready,
    r_rlast,
    \axlen_cnt_reg[0] ,
    \axaddr_offset_r_reg[3] ,
    \wrap_second_len_r_reg[3] ,
    \wrap_boundary_axaddr_r_reg[11] ,
    \m_payload_i_reg[3] ,
    aclk,
    sel_first_i,
    sel_first_reg_3,
    sel_first_reg_4,
    \axlen_cnt_reg[3] ,
    \axlen_cnt_reg[3]_0 ,
    Q,
    si_rs_arvalid,
    S,
    \axaddr_incr_reg[3] ,
    r_push,
    \axaddr_wrap_reg[0] ,
    next_pending_r_reg,
    m_axi_arready,
    \axaddr_incr_reg[11]_0 ,
    \axaddr_incr_reg[7] ,
    \axaddr_incr_reg[3]_0 ,
    \axlen_cnt_reg[7]_0 ,
    D,
    \wrap_second_len_r_reg[3]_0 ,
    \wrap_cnt_r_reg[3] ,
    E,
    \wrap_boundary_axaddr_r_reg[6] ,
    \axaddr_wrap_reg[11]_0 ,
    \axaddr_incr_reg[0] );
  output sel_first_reg_0;
  output sel_first_reg_1;
  output sel_first_reg_2;
  output \axlen_cnt_reg[7] ;
  output [3:0]\axaddr_wrap_reg[3] ;
  output [11:0]\axaddr_wrap_reg[11] ;
  output [3:0]\axaddr_wrap_reg[7] ;
  output [3:0]O;
  output [11:0]\axaddr_incr_reg[11] ;
  output M00_AXI_0_arready;
  output r_rlast;
  output \axlen_cnt_reg[0] ;
  output [3:0]\axaddr_offset_r_reg[3] ;
  output [3:0]\wrap_second_len_r_reg[3] ;
  output [11:0]\wrap_boundary_axaddr_r_reg[11] ;
  output [3:0]\m_payload_i_reg[3] ;
  input aclk;
  input sel_first_i;
  input sel_first_reg_3;
  input sel_first_reg_4;
  input \axlen_cnt_reg[3] ;
  input [15:0]\axlen_cnt_reg[3]_0 ;
  input [1:0]Q;
  input si_rs_arvalid;
  input [3:0]S;
  input [3:0]\axaddr_incr_reg[3] ;
  input r_push;
  input \axaddr_wrap_reg[0] ;
  input next_pending_r_reg;
  input m_axi_arready;
  input [3:0]\axaddr_incr_reg[11]_0 ;
  input [3:0]\axaddr_incr_reg[7] ;
  input [3:0]\axaddr_incr_reg[3]_0 ;
  input \axlen_cnt_reg[7]_0 ;
  input [3:0]D;
  input [3:0]\wrap_second_len_r_reg[3]_0 ;
  input [3:0]\wrap_cnt_r_reg[3] ;
  input [0:0]E;
  input [6:0]\wrap_boundary_axaddr_r_reg[6] ;
  input [11:0]\axaddr_wrap_reg[11]_0 ;
  input [0:0]\axaddr_incr_reg[0] ;

  wire [3:0]D;
  wire [0:0]E;
  wire M00_AXI_0_arready;
  wire [3:0]O;
  wire [1:0]Q;
  wire [3:0]S;
  wire aclk;
  wire [0:0]\axaddr_incr_reg[0] ;
  wire [11:0]\axaddr_incr_reg[11] ;
  wire [3:0]\axaddr_incr_reg[11]_0 ;
  wire [3:0]\axaddr_incr_reg[3] ;
  wire [3:0]\axaddr_incr_reg[3]_0 ;
  wire [3:0]\axaddr_incr_reg[7] ;
  wire [3:0]\axaddr_offset_r_reg[3] ;
  wire \axaddr_wrap_reg[0] ;
  wire [11:0]\axaddr_wrap_reg[11] ;
  wire [11:0]\axaddr_wrap_reg[11]_0 ;
  wire [3:0]\axaddr_wrap_reg[3] ;
  wire [3:0]\axaddr_wrap_reg[7] ;
  wire \axlen_cnt_reg[0] ;
  wire \axlen_cnt_reg[3] ;
  wire [15:0]\axlen_cnt_reg[3]_0 ;
  wire \axlen_cnt_reg[7] ;
  wire \axlen_cnt_reg[7]_0 ;
  wire incr_next_pending;
  wire m_axi_arready;
  wire [3:0]\m_payload_i_reg[3] ;
  wire next_pending_r_reg;
  wire r_push;
  wire r_rlast;
  wire s_axburst_eq0;
  wire s_axburst_eq1;
  wire sel_first_i;
  wire sel_first_reg_0;
  wire sel_first_reg_1;
  wire sel_first_reg_2;
  wire sel_first_reg_3;
  wire sel_first_reg_4;
  wire si_rs_arvalid;
  wire [11:0]\wrap_boundary_axaddr_r_reg[11] ;
  wire [6:0]\wrap_boundary_axaddr_r_reg[6] ;
  wire wrap_cmd_0_n_25;
  wire wrap_cmd_0_n_26;
  wire [3:0]\wrap_cnt_r_reg[3] ;
  wire [3:0]\wrap_second_len_r_reg[3] ;
  wire [3:0]\wrap_second_len_r_reg[3]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00088808)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(m_axi_arready),
        .I1(Q[0]),
        .I2(s_axburst_eq0),
        .I3(\axlen_cnt_reg[3]_0 [11]),
        .I4(s_axburst_eq1),
        .O(M00_AXI_0_arready));
  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd_2 incr_cmd_0
       (.Q(Q),
        .aclk(aclk),
        .\axaddr_incr_reg[0]_0 (\axaddr_incr_reg[0] ),
        .\axaddr_incr_reg[11]_0 (\axaddr_incr_reg[11] ),
        .\axaddr_incr_reg[11]_1 (\axaddr_incr_reg[11]_0 ),
        .\axaddr_incr_reg[3]_0 (\axaddr_incr_reg[3] ),
        .\axaddr_incr_reg[3]_1 (\axaddr_incr_reg[3]_0 ),
        .\axaddr_incr_reg[7]_0 (\axaddr_incr_reg[7] ),
        .\axlen_cnt_reg[3]_0 (\axlen_cnt_reg[3] ),
        .\axlen_cnt_reg[3]_1 ({\axlen_cnt_reg[3]_0 [15:12],\axlen_cnt_reg[3]_0 [10:9],\axlen_cnt_reg[3]_0 [3:0]}),
        .\axlen_cnt_reg[4]_0 (\axaddr_wrap_reg[0] ),
        .\axlen_cnt_reg[7]_0 (\axlen_cnt_reg[7] ),
        .\axlen_cnt_reg[7]_1 (\axlen_cnt_reg[7]_0 ),
        .incr_next_pending(incr_next_pending),
        .m_axi_arready(m_axi_arready),
        .\m_payload_i_reg[3] (\m_payload_i_reg[3] ),
        .next_pending_r_reg_0(next_pending_r_reg),
        .r_push(r_push),
        .sel_first_reg_0(sel_first_reg_1),
        .sel_first_reg_1(sel_first_reg_3),
        .si_rs_arvalid(si_rs_arvalid));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    r_rlast_r_i_1
       (.I0(s_axburst_eq0),
        .I1(\axlen_cnt_reg[3]_0 [11]),
        .I2(s_axburst_eq1),
        .O(r_rlast));
  FDRE s_axburst_eq0_reg
       (.C(aclk),
        .CE(1'b1),
        .D(wrap_cmd_0_n_25),
        .Q(s_axburst_eq0),
        .R(1'b0));
  FDRE s_axburst_eq1_reg
       (.C(aclk),
        .CE(1'b1),
        .D(wrap_cmd_0_n_26),
        .Q(s_axburst_eq1),
        .R(1'b0));
  FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_i),
        .Q(sel_first_reg_0),
        .R(1'b0));
  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd_3 wrap_cmd_0
       (.D(D),
        .E(E),
        .O(O),
        .Q(Q[1]),
        .S(S),
        .aclk(aclk),
        .\axaddr_offset_r_reg[3]_0 (\axaddr_offset_r_reg[3] ),
        .\axaddr_wrap_reg[0]_0 (\axaddr_wrap_reg[0] ),
        .\axaddr_wrap_reg[11]_0 (\axaddr_wrap_reg[11] ),
        .\axaddr_wrap_reg[11]_1 (\axaddr_wrap_reg[11]_0 ),
        .\axaddr_wrap_reg[3]_0 (\axaddr_wrap_reg[3] ),
        .\axaddr_wrap_reg[7]_0 (\axaddr_wrap_reg[7] ),
        .\axlen_cnt_reg[0]_0 (\axlen_cnt_reg[0] ),
        .\axlen_cnt_reg[3]_0 ({\axlen_cnt_reg[3]_0 [15:11],\axlen_cnt_reg[3]_0 [8:4]}),
        .\axlen_cnt_reg[3]_1 (\axlen_cnt_reg[3] ),
        .incr_next_pending(incr_next_pending),
        .\m_payload_i_reg[39] (wrap_cmd_0_n_25),
        .\m_payload_i_reg[39]_0 (wrap_cmd_0_n_26),
        .next_pending_r_reg_0(next_pending_r_reg),
        .sel_first_i(sel_first_i),
        .sel_first_reg_0(sel_first_reg_2),
        .sel_first_reg_1(sel_first_reg_4),
        .si_rs_arvalid(si_rs_arvalid),
        .\wrap_boundary_axaddr_r_reg[11]_0 (\wrap_boundary_axaddr_r_reg[11] ),
        .\wrap_boundary_axaddr_r_reg[6]_0 (\wrap_boundary_axaddr_r_reg[6] ),
        .\wrap_cnt_r_reg[3]_0 (\wrap_cnt_r_reg[3] ),
        .\wrap_second_len_r_reg[3]_0 (\wrap_second_len_r_reg[3] ),
        .\wrap_second_len_r_reg[3]_1 (\wrap_second_len_r_reg[3]_0 ));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_incr_cmd" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd
   (next_pending_r,
    sel_first_reg_0,
    \axlen_cnt_reg[5]_0 ,
    \axaddr_incr_reg[11]_0 ,
    \m_payload_i_reg[3] ,
    aclk,
    sel_first_reg_1,
    \axlen_cnt_reg[3]_0 ,
    Q,
    si_rs_awvalid,
    \axlen_cnt_reg[3]_1 ,
    \axaddr_incr_reg[3]_0 ,
    next,
    \axlen_cnt_reg[4]_0 ,
    next_pending_r_reg_0,
    axaddr_incr,
    \axlen_cnt_reg[5]_1 );
  output next_pending_r;
  output sel_first_reg_0;
  output \axlen_cnt_reg[5]_0 ;
  output [11:0]\axaddr_incr_reg[11]_0 ;
  output [3:0]\m_payload_i_reg[3] ;
  input aclk;
  input sel_first_reg_1;
  input [9:0]\axlen_cnt_reg[3]_0 ;
  input [1:0]Q;
  input si_rs_awvalid;
  input \axlen_cnt_reg[3]_1 ;
  input [3:0]\axaddr_incr_reg[3]_0 ;
  input next;
  input \axlen_cnt_reg[4]_0 ;
  input next_pending_r_reg_0;
  input [11:0]axaddr_incr;
  input \axlen_cnt_reg[5]_1 ;

  wire [1:0]Q;
  wire aclk;
  wire [11:0]axaddr_incr;
  wire \axaddr_incr[11]_i_1_n_0 ;
  wire [11:0]\axaddr_incr_reg[11]_0 ;
  wire \axaddr_incr_reg[11]_i_4_n_1 ;
  wire \axaddr_incr_reg[11]_i_4_n_2 ;
  wire \axaddr_incr_reg[11]_i_4_n_3 ;
  wire \axaddr_incr_reg[11]_i_4_n_4 ;
  wire \axaddr_incr_reg[11]_i_4_n_5 ;
  wire \axaddr_incr_reg[11]_i_4_n_6 ;
  wire \axaddr_incr_reg[11]_i_4_n_7 ;
  wire [3:0]\axaddr_incr_reg[3]_0 ;
  wire \axaddr_incr_reg[3]_i_3_n_0 ;
  wire \axaddr_incr_reg[3]_i_3_n_1 ;
  wire \axaddr_incr_reg[3]_i_3_n_2 ;
  wire \axaddr_incr_reg[3]_i_3_n_3 ;
  wire \axaddr_incr_reg[3]_i_3_n_4 ;
  wire \axaddr_incr_reg[3]_i_3_n_5 ;
  wire \axaddr_incr_reg[3]_i_3_n_6 ;
  wire \axaddr_incr_reg[3]_i_3_n_7 ;
  wire \axaddr_incr_reg[7]_i_3_n_0 ;
  wire \axaddr_incr_reg[7]_i_3_n_1 ;
  wire \axaddr_incr_reg[7]_i_3_n_2 ;
  wire \axaddr_incr_reg[7]_i_3_n_3 ;
  wire \axaddr_incr_reg[7]_i_3_n_4 ;
  wire \axaddr_incr_reg[7]_i_3_n_5 ;
  wire \axaddr_incr_reg[7]_i_3_n_6 ;
  wire \axaddr_incr_reg[7]_i_3_n_7 ;
  wire [7:0]axlen_cnt;
  wire \axlen_cnt[0]_i_1_n_0 ;
  wire \axlen_cnt[1]_i_1_n_0 ;
  wire \axlen_cnt[2]_i_1_n_0 ;
  wire \axlen_cnt[3]_i_2_n_0 ;
  wire \axlen_cnt[3]_i_4_n_0 ;
  wire \axlen_cnt[4]_i_1__2_n_0 ;
  wire \axlen_cnt[5]_i_2_n_0 ;
  wire \axlen_cnt[6]_i_1__0_n_0 ;
  wire \axlen_cnt[7]_i_1__0_n_0 ;
  wire \axlen_cnt[7]_i_2_n_0 ;
  wire [9:0]\axlen_cnt_reg[3]_0 ;
  wire \axlen_cnt_reg[3]_1 ;
  wire \axlen_cnt_reg[4]_0 ;
  wire \axlen_cnt_reg[5]_0 ;
  wire \axlen_cnt_reg[5]_1 ;
  wire incr_next_pending;
  wire [3:0]\m_payload_i_reg[3] ;
  wire next;
  wire next_pending_r;
  wire next_pending_r_i_5_n_0;
  wire next_pending_r_reg_0;
  wire [11:0]p_1_in;
  wire sel_first_reg_0;
  wire sel_first_reg_1;
  wire si_rs_awvalid;
  wire [3:3]\NLW_axaddr_incr_reg[11]_i_4_CO_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[0]_i_1 
       (.I0(axaddr_incr[0]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[3]_i_3_n_7 ),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[10]_i_1 
       (.I0(axaddr_incr[10]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[11]_i_4_n_5 ),
        .O(p_1_in[10]));
  LUT2 #(
    .INIT(4'hE)) 
    \axaddr_incr[11]_i_1 
       (.I0(sel_first_reg_0),
        .I1(next),
        .O(\axaddr_incr[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[11]_i_2 
       (.I0(axaddr_incr[11]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[11]_i_4_n_4 ),
        .O(p_1_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[1]_i_1 
       (.I0(axaddr_incr[1]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[3]_i_3_n_6 ),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[2]_i_1 
       (.I0(axaddr_incr[2]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[3]_i_3_n_5 ),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[3]_i_1 
       (.I0(axaddr_incr[3]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[3]_i_3_n_4 ),
        .O(p_1_in[3]));
  LUT4 #(
    .INIT(16'h0102)) 
    \axaddr_incr[3]_i_10 
       (.I0(\axlen_cnt_reg[3]_0 [0]),
        .I1(\axlen_cnt_reg[3]_0 [5]),
        .I2(\axlen_cnt_reg[3]_0 [4]),
        .I3(next),
        .O(\m_payload_i_reg[3] [0]));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \axaddr_incr[3]_i_7 
       (.I0(\axlen_cnt_reg[3]_0 [3]),
        .I1(\axlen_cnt_reg[3]_0 [5]),
        .I2(\axlen_cnt_reg[3]_0 [4]),
        .I3(next),
        .O(\m_payload_i_reg[3] [3]));
  LUT4 #(
    .INIT(16'h1A2A)) 
    \axaddr_incr[3]_i_8 
       (.I0(\axlen_cnt_reg[3]_0 [2]),
        .I1(\axlen_cnt_reg[3]_0 [4]),
        .I2(\axlen_cnt_reg[3]_0 [5]),
        .I3(next),
        .O(\m_payload_i_reg[3] [2]));
  LUT4 #(
    .INIT(16'h1222)) 
    \axaddr_incr[3]_i_9 
       (.I0(\axlen_cnt_reg[3]_0 [1]),
        .I1(\axlen_cnt_reg[3]_0 [5]),
        .I2(\axlen_cnt_reg[3]_0 [4]),
        .I3(next),
        .O(\m_payload_i_reg[3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[4]_i_1 
       (.I0(axaddr_incr[4]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[7]_i_3_n_7 ),
        .O(p_1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[5]_i_1 
       (.I0(axaddr_incr[5]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[7]_i_3_n_6 ),
        .O(p_1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[6]_i_1 
       (.I0(axaddr_incr[6]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[7]_i_3_n_5 ),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[7]_i_1 
       (.I0(axaddr_incr[7]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[7]_i_3_n_4 ),
        .O(p_1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[8]_i_1 
       (.I0(axaddr_incr[8]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[11]_i_4_n_7 ),
        .O(p_1_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[9]_i_1 
       (.I0(axaddr_incr[9]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[11]_i_4_n_6 ),
        .O(p_1_in[9]));
  FDRE \axaddr_incr_reg[0] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(\axaddr_incr_reg[11]_0 [0]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[10] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1_n_0 ),
        .D(p_1_in[10]),
        .Q(\axaddr_incr_reg[11]_0 [10]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[11] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1_n_0 ),
        .D(p_1_in[11]),
        .Q(\axaddr_incr_reg[11]_0 [11]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_incr_reg[11]_i_4 
       (.CI(\axaddr_incr_reg[7]_i_3_n_0 ),
        .CO({\NLW_axaddr_incr_reg[11]_i_4_CO_UNCONNECTED [3],\axaddr_incr_reg[11]_i_4_n_1 ,\axaddr_incr_reg[11]_i_4_n_2 ,\axaddr_incr_reg[11]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axaddr_incr_reg[11]_i_4_n_4 ,\axaddr_incr_reg[11]_i_4_n_5 ,\axaddr_incr_reg[11]_i_4_n_6 ,\axaddr_incr_reg[11]_i_4_n_7 }),
        .S(\axaddr_incr_reg[11]_0 [11:8]));
  FDRE \axaddr_incr_reg[1] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(\axaddr_incr_reg[11]_0 [1]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[2] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(\axaddr_incr_reg[11]_0 [2]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[3] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(\axaddr_incr_reg[11]_0 [3]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_incr_reg[3]_i_3 
       (.CI(1'b0),
        .CO({\axaddr_incr_reg[3]_i_3_n_0 ,\axaddr_incr_reg[3]_i_3_n_1 ,\axaddr_incr_reg[3]_i_3_n_2 ,\axaddr_incr_reg[3]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI(\axaddr_incr_reg[11]_0 [3:0]),
        .O({\axaddr_incr_reg[3]_i_3_n_4 ,\axaddr_incr_reg[3]_i_3_n_5 ,\axaddr_incr_reg[3]_i_3_n_6 ,\axaddr_incr_reg[3]_i_3_n_7 }),
        .S(\axaddr_incr_reg[3]_0 ));
  FDRE \axaddr_incr_reg[4] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(\axaddr_incr_reg[11]_0 [4]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[5] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(\axaddr_incr_reg[11]_0 [5]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[6] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(\axaddr_incr_reg[11]_0 [6]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[7] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(\axaddr_incr_reg[11]_0 [7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_incr_reg[7]_i_3 
       (.CI(\axaddr_incr_reg[3]_i_3_n_0 ),
        .CO({\axaddr_incr_reg[7]_i_3_n_0 ,\axaddr_incr_reg[7]_i_3_n_1 ,\axaddr_incr_reg[7]_i_3_n_2 ,\axaddr_incr_reg[7]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axaddr_incr_reg[7]_i_3_n_4 ,\axaddr_incr_reg[7]_i_3_n_5 ,\axaddr_incr_reg[7]_i_3_n_6 ,\axaddr_incr_reg[7]_i_3_n_7 }),
        .S(\axaddr_incr_reg[11]_0 [7:4]));
  FDRE \axaddr_incr_reg[8] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1_n_0 ),
        .D(p_1_in[8]),
        .Q(\axaddr_incr_reg[11]_0 [8]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[9] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1_n_0 ),
        .D(p_1_in[9]),
        .Q(\axaddr_incr_reg[11]_0 [9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h4444F44444444444)) 
    \axlen_cnt[0]_i_1 
       (.I0(axlen_cnt[0]),
        .I1(\axlen_cnt_reg[5]_0 ),
        .I2(\axlen_cnt_reg[3]_0 [6]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(si_rs_awvalid),
        .O(\axlen_cnt[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF44F4444)) 
    \axlen_cnt[1]_i_1 
       (.I0(\axlen_cnt_reg[3]_1 ),
        .I1(\axlen_cnt_reg[3]_0 [7]),
        .I2(axlen_cnt[1]),
        .I3(axlen_cnt[0]),
        .I4(\axlen_cnt_reg[5]_0 ),
        .O(\axlen_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF4F4F44F44444444)) 
    \axlen_cnt[2]_i_1 
       (.I0(\axlen_cnt_reg[3]_1 ),
        .I1(\axlen_cnt_reg[3]_0 [8]),
        .I2(axlen_cnt[2]),
        .I3(axlen_cnt[0]),
        .I4(axlen_cnt[1]),
        .I5(\axlen_cnt_reg[5]_0 ),
        .O(\axlen_cnt[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h4FF44444)) 
    \axlen_cnt[3]_i_2 
       (.I0(\axlen_cnt_reg[3]_1 ),
        .I1(\axlen_cnt_reg[3]_0 [9]),
        .I2(axlen_cnt[3]),
        .I3(\axlen_cnt[3]_i_4_n_0 ),
        .I4(\axlen_cnt_reg[5]_0 ),
        .O(\axlen_cnt[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \axlen_cnt[3]_i_4 
       (.I0(axlen_cnt[0]),
        .I1(axlen_cnt[1]),
        .I2(axlen_cnt[2]),
        .O(\axlen_cnt[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8888888888888882)) 
    \axlen_cnt[4]_i_1__2 
       (.I0(\axlen_cnt_reg[5]_0 ),
        .I1(axlen_cnt[4]),
        .I2(axlen_cnt[3]),
        .I3(axlen_cnt[0]),
        .I4(axlen_cnt[1]),
        .I5(axlen_cnt[2]),
        .O(\axlen_cnt[4]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA9)) 
    \axlen_cnt[5]_i_2 
       (.I0(axlen_cnt[5]),
        .I1(axlen_cnt[0]),
        .I2(axlen_cnt[1]),
        .I3(axlen_cnt[2]),
        .I4(axlen_cnt[4]),
        .I5(axlen_cnt[3]),
        .O(\axlen_cnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT4 #(
    .INIT(16'h8882)) 
    \axlen_cnt[6]_i_1__0 
       (.I0(\axlen_cnt_reg[5]_0 ),
        .I1(axlen_cnt[6]),
        .I2(\axlen_cnt[7]_i_2_n_0 ),
        .I3(axlen_cnt[5]),
        .O(\axlen_cnt[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT5 #(
    .INIT(32'h88888882)) 
    \axlen_cnt[7]_i_1__0 
       (.I0(\axlen_cnt_reg[5]_0 ),
        .I1(axlen_cnt[7]),
        .I2(\axlen_cnt[7]_i_2_n_0 ),
        .I3(axlen_cnt[6]),
        .I4(axlen_cnt[5]),
        .O(\axlen_cnt[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \axlen_cnt[7]_i_2 
       (.I0(axlen_cnt[3]),
        .I1(axlen_cnt[4]),
        .I2(axlen_cnt[2]),
        .I3(axlen_cnt[1]),
        .I4(axlen_cnt[0]),
        .O(\axlen_cnt[7]_i_2_n_0 ));
  FDRE \axlen_cnt_reg[0] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[0]_i_1_n_0 ),
        .Q(axlen_cnt[0]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[1] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[1]_i_1_n_0 ),
        .Q(axlen_cnt[1]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[2] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[2]_i_1_n_0 ),
        .Q(axlen_cnt[2]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[3] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[3]_i_2_n_0 ),
        .Q(axlen_cnt[3]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[4] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[4]_i_1__2_n_0 ),
        .Q(axlen_cnt[4]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[5] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[5]_i_2_n_0 ),
        .Q(axlen_cnt[5]),
        .R(\axlen_cnt_reg[5]_1 ));
  FDRE \axlen_cnt_reg[6] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[6]_i_1__0_n_0 ),
        .Q(axlen_cnt[6]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[7] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[7]_i_1__0_n_0 ),
        .Q(axlen_cnt[7]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFFF88F8)) 
    next_pending_r_i_1
       (.I0(\axlen_cnt_reg[5]_0 ),
        .I1(next),
        .I2(next_pending_r),
        .I3(\axlen_cnt_reg[4]_0 ),
        .I4(next_pending_r_reg_0),
        .O(incr_next_pending));
  LUT5 #(
    .INIT(32'hAAA8AAAA)) 
    next_pending_r_i_2
       (.I0(\axlen_cnt_reg[3]_1 ),
        .I1(axlen_cnt[5]),
        .I2(axlen_cnt[6]),
        .I3(axlen_cnt[7]),
        .I4(next_pending_r_i_5_n_0),
        .O(\axlen_cnt_reg[5]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    next_pending_r_i_5
       (.I0(axlen_cnt[3]),
        .I1(axlen_cnt[4]),
        .I2(axlen_cnt[1]),
        .I3(axlen_cnt[2]),
        .O(next_pending_r_i_5_n_0));
  FDRE next_pending_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(incr_next_pending),
        .Q(next_pending_r),
        .R(1'b0));
  FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_reg_1),
        .Q(sel_first_reg_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_incr_cmd" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd_2
   (incr_next_pending,
    sel_first_reg_0,
    \axlen_cnt_reg[7]_0 ,
    \axaddr_incr_reg[11]_0 ,
    \m_payload_i_reg[3] ,
    aclk,
    sel_first_reg_1,
    \axlen_cnt_reg[3]_0 ,
    \axlen_cnt_reg[3]_1 ,
    Q,
    si_rs_arvalid,
    \axaddr_incr_reg[3]_0 ,
    r_push,
    \axlen_cnt_reg[4]_0 ,
    next_pending_r_reg_0,
    \axaddr_incr_reg[11]_1 ,
    \axaddr_incr_reg[7]_0 ,
    \axaddr_incr_reg[3]_1 ,
    \axlen_cnt_reg[7]_1 ,
    \axaddr_incr_reg[0]_0 ,
    m_axi_arready);
  output incr_next_pending;
  output sel_first_reg_0;
  output \axlen_cnt_reg[7]_0 ;
  output [11:0]\axaddr_incr_reg[11]_0 ;
  output [3:0]\m_payload_i_reg[3] ;
  input aclk;
  input sel_first_reg_1;
  input \axlen_cnt_reg[3]_0 ;
  input [9:0]\axlen_cnt_reg[3]_1 ;
  input [1:0]Q;
  input si_rs_arvalid;
  input [3:0]\axaddr_incr_reg[3]_0 ;
  input r_push;
  input \axlen_cnt_reg[4]_0 ;
  input next_pending_r_reg_0;
  input [3:0]\axaddr_incr_reg[11]_1 ;
  input [3:0]\axaddr_incr_reg[7]_0 ;
  input [3:0]\axaddr_incr_reg[3]_1 ;
  input \axlen_cnt_reg[7]_1 ;
  input [0:0]\axaddr_incr_reg[0]_0 ;
  input m_axi_arready;

  wire [1:0]Q;
  wire aclk;
  wire \axaddr_incr[0]_i_1__0_n_0 ;
  wire \axaddr_incr[10]_i_1__0_n_0 ;
  wire \axaddr_incr[11]_i_2__0_n_0 ;
  wire \axaddr_incr[1]_i_1__0_n_0 ;
  wire \axaddr_incr[2]_i_1__0_n_0 ;
  wire \axaddr_incr[3]_i_1__0_n_0 ;
  wire \axaddr_incr[4]_i_1__0_n_0 ;
  wire \axaddr_incr[5]_i_1__0_n_0 ;
  wire \axaddr_incr[6]_i_1__0_n_0 ;
  wire \axaddr_incr[7]_i_1__0_n_0 ;
  wire \axaddr_incr[8]_i_1__0_n_0 ;
  wire \axaddr_incr[9]_i_1__0_n_0 ;
  wire [0:0]\axaddr_incr_reg[0]_0 ;
  wire [11:0]\axaddr_incr_reg[11]_0 ;
  wire [3:0]\axaddr_incr_reg[11]_1 ;
  wire \axaddr_incr_reg[11]_i_4__0_n_1 ;
  wire \axaddr_incr_reg[11]_i_4__0_n_2 ;
  wire \axaddr_incr_reg[11]_i_4__0_n_3 ;
  wire \axaddr_incr_reg[11]_i_4__0_n_4 ;
  wire \axaddr_incr_reg[11]_i_4__0_n_5 ;
  wire \axaddr_incr_reg[11]_i_4__0_n_6 ;
  wire \axaddr_incr_reg[11]_i_4__0_n_7 ;
  wire [3:0]\axaddr_incr_reg[3]_0 ;
  wire [3:0]\axaddr_incr_reg[3]_1 ;
  wire \axaddr_incr_reg[3]_i_3__0_n_0 ;
  wire \axaddr_incr_reg[3]_i_3__0_n_1 ;
  wire \axaddr_incr_reg[3]_i_3__0_n_2 ;
  wire \axaddr_incr_reg[3]_i_3__0_n_3 ;
  wire \axaddr_incr_reg[3]_i_3__0_n_4 ;
  wire \axaddr_incr_reg[3]_i_3__0_n_5 ;
  wire \axaddr_incr_reg[3]_i_3__0_n_6 ;
  wire \axaddr_incr_reg[3]_i_3__0_n_7 ;
  wire [3:0]\axaddr_incr_reg[7]_0 ;
  wire \axaddr_incr_reg[7]_i_3__0_n_0 ;
  wire \axaddr_incr_reg[7]_i_3__0_n_1 ;
  wire \axaddr_incr_reg[7]_i_3__0_n_2 ;
  wire \axaddr_incr_reg[7]_i_3__0_n_3 ;
  wire \axaddr_incr_reg[7]_i_3__0_n_4 ;
  wire \axaddr_incr_reg[7]_i_3__0_n_5 ;
  wire \axaddr_incr_reg[7]_i_3__0_n_6 ;
  wire \axaddr_incr_reg[7]_i_3__0_n_7 ;
  wire \axlen_cnt[0]_i_1__1_n_0 ;
  wire \axlen_cnt[1]_i_1__1_n_0 ;
  wire \axlen_cnt[2]_i_1__1_n_0 ;
  wire \axlen_cnt[3]_i_2__1_n_0 ;
  wire \axlen_cnt[3]_i_4__0_n_0 ;
  wire \axlen_cnt[4]_i_1__1_n_0 ;
  wire \axlen_cnt[5]_i_1__0_n_0 ;
  wire \axlen_cnt[6]_i_1_n_0 ;
  wire \axlen_cnt[7]_i_2__0_n_0 ;
  wire \axlen_cnt_reg[3]_0 ;
  wire [9:0]\axlen_cnt_reg[3]_1 ;
  wire \axlen_cnt_reg[4]_0 ;
  wire \axlen_cnt_reg[7]_0 ;
  wire \axlen_cnt_reg[7]_1 ;
  wire \axlen_cnt_reg_n_0_[0] ;
  wire \axlen_cnt_reg_n_0_[1] ;
  wire \axlen_cnt_reg_n_0_[2] ;
  wire \axlen_cnt_reg_n_0_[3] ;
  wire \axlen_cnt_reg_n_0_[4] ;
  wire \axlen_cnt_reg_n_0_[5] ;
  wire \axlen_cnt_reg_n_0_[6] ;
  wire \axlen_cnt_reg_n_0_[7] ;
  wire incr_next_pending;
  wire m_axi_arready;
  wire [3:0]\m_payload_i_reg[3] ;
  wire next_pending_r;
  wire next_pending_r_i_4__0_n_0;
  wire next_pending_r_reg_0;
  wire r_push;
  wire sel_first_reg_0;
  wire sel_first_reg_1;
  wire si_rs_arvalid;
  wire [3:3]\NLW_axaddr_incr_reg[11]_i_4__0_CO_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[0]_i_1__0 
       (.I0(\axaddr_incr_reg[3]_1 [0]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[3]_i_3__0_n_7 ),
        .O(\axaddr_incr[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[10]_i_1__0 
       (.I0(\axaddr_incr_reg[11]_1 [2]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[11]_i_4__0_n_5 ),
        .O(\axaddr_incr[10]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[11]_i_2__0 
       (.I0(\axaddr_incr_reg[11]_1 [3]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[11]_i_4__0_n_4 ),
        .O(\axaddr_incr[11]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[1]_i_1__0 
       (.I0(\axaddr_incr_reg[3]_1 [1]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[3]_i_3__0_n_6 ),
        .O(\axaddr_incr[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[2]_i_1__0 
       (.I0(\axaddr_incr_reg[3]_1 [2]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[3]_i_3__0_n_5 ),
        .O(\axaddr_incr[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0102020202020202)) 
    \axaddr_incr[3]_i_10 
       (.I0(\axlen_cnt_reg[3]_1 [0]),
        .I1(\axlen_cnt_reg[3]_1 [5]),
        .I2(\axlen_cnt_reg[3]_1 [4]),
        .I3(Q[1]),
        .I4(m_axi_arready),
        .I5(Q[0]),
        .O(\m_payload_i_reg[3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[3]_i_1__0 
       (.I0(\axaddr_incr_reg[3]_1 [3]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[3]_i_3__0_n_4 ),
        .O(\axaddr_incr[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \axaddr_incr[3]_i_7 
       (.I0(\axlen_cnt_reg[3]_1 [3]),
        .I1(\axlen_cnt_reg[3]_1 [5]),
        .I2(\axlen_cnt_reg[3]_1 [4]),
        .I3(Q[1]),
        .I4(m_axi_arready),
        .I5(Q[0]),
        .O(\m_payload_i_reg[3] [3]));
  LUT6 #(
    .INIT(64'h1A2A2A2A2A2A2A2A)) 
    \axaddr_incr[3]_i_8 
       (.I0(\axlen_cnt_reg[3]_1 [2]),
        .I1(\axlen_cnt_reg[3]_1 [4]),
        .I2(\axlen_cnt_reg[3]_1 [5]),
        .I3(Q[1]),
        .I4(m_axi_arready),
        .I5(Q[0]),
        .O(\m_payload_i_reg[3] [2]));
  LUT6 #(
    .INIT(64'h1222222222222222)) 
    \axaddr_incr[3]_i_9 
       (.I0(\axlen_cnt_reg[3]_1 [1]),
        .I1(\axlen_cnt_reg[3]_1 [5]),
        .I2(\axlen_cnt_reg[3]_1 [4]),
        .I3(Q[1]),
        .I4(m_axi_arready),
        .I5(Q[0]),
        .O(\m_payload_i_reg[3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[4]_i_1__0 
       (.I0(\axaddr_incr_reg[7]_0 [0]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[7]_i_3__0_n_7 ),
        .O(\axaddr_incr[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[5]_i_1__0 
       (.I0(\axaddr_incr_reg[7]_0 [1]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[7]_i_3__0_n_6 ),
        .O(\axaddr_incr[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[6]_i_1__0 
       (.I0(\axaddr_incr_reg[7]_0 [2]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[7]_i_3__0_n_5 ),
        .O(\axaddr_incr[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[7]_i_1__0 
       (.I0(\axaddr_incr_reg[7]_0 [3]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[7]_i_3__0_n_4 ),
        .O(\axaddr_incr[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[8]_i_1__0 
       (.I0(\axaddr_incr_reg[11]_1 [0]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[11]_i_4__0_n_7 ),
        .O(\axaddr_incr[8]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_incr[9]_i_1__0 
       (.I0(\axaddr_incr_reg[11]_1 [1]),
        .I1(sel_first_reg_0),
        .I2(\axaddr_incr_reg[11]_i_4__0_n_6 ),
        .O(\axaddr_incr[9]_i_1__0_n_0 ));
  FDRE \axaddr_incr_reg[0] 
       (.C(aclk),
        .CE(\axaddr_incr_reg[0]_0 ),
        .D(\axaddr_incr[0]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [0]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[10] 
       (.C(aclk),
        .CE(\axaddr_incr_reg[0]_0 ),
        .D(\axaddr_incr[10]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [10]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[11] 
       (.C(aclk),
        .CE(\axaddr_incr_reg[0]_0 ),
        .D(\axaddr_incr[11]_i_2__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [11]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_incr_reg[11]_i_4__0 
       (.CI(\axaddr_incr_reg[7]_i_3__0_n_0 ),
        .CO({\NLW_axaddr_incr_reg[11]_i_4__0_CO_UNCONNECTED [3],\axaddr_incr_reg[11]_i_4__0_n_1 ,\axaddr_incr_reg[11]_i_4__0_n_2 ,\axaddr_incr_reg[11]_i_4__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axaddr_incr_reg[11]_i_4__0_n_4 ,\axaddr_incr_reg[11]_i_4__0_n_5 ,\axaddr_incr_reg[11]_i_4__0_n_6 ,\axaddr_incr_reg[11]_i_4__0_n_7 }),
        .S(\axaddr_incr_reg[11]_0 [11:8]));
  FDRE \axaddr_incr_reg[1] 
       (.C(aclk),
        .CE(\axaddr_incr_reg[0]_0 ),
        .D(\axaddr_incr[1]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [1]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[2] 
       (.C(aclk),
        .CE(\axaddr_incr_reg[0]_0 ),
        .D(\axaddr_incr[2]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [2]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[3] 
       (.C(aclk),
        .CE(\axaddr_incr_reg[0]_0 ),
        .D(\axaddr_incr[3]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [3]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_incr_reg[3]_i_3__0 
       (.CI(1'b0),
        .CO({\axaddr_incr_reg[3]_i_3__0_n_0 ,\axaddr_incr_reg[3]_i_3__0_n_1 ,\axaddr_incr_reg[3]_i_3__0_n_2 ,\axaddr_incr_reg[3]_i_3__0_n_3 }),
        .CYINIT(1'b0),
        .DI(\axaddr_incr_reg[11]_0 [3:0]),
        .O({\axaddr_incr_reg[3]_i_3__0_n_4 ,\axaddr_incr_reg[3]_i_3__0_n_5 ,\axaddr_incr_reg[3]_i_3__0_n_6 ,\axaddr_incr_reg[3]_i_3__0_n_7 }),
        .S(\axaddr_incr_reg[3]_0 ));
  FDRE \axaddr_incr_reg[4] 
       (.C(aclk),
        .CE(\axaddr_incr_reg[0]_0 ),
        .D(\axaddr_incr[4]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [4]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[5] 
       (.C(aclk),
        .CE(\axaddr_incr_reg[0]_0 ),
        .D(\axaddr_incr[5]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [5]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[6] 
       (.C(aclk),
        .CE(\axaddr_incr_reg[0]_0 ),
        .D(\axaddr_incr[6]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [6]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[7] 
       (.C(aclk),
        .CE(\axaddr_incr_reg[0]_0 ),
        .D(\axaddr_incr[7]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_incr_reg[7]_i_3__0 
       (.CI(\axaddr_incr_reg[3]_i_3__0_n_0 ),
        .CO({\axaddr_incr_reg[7]_i_3__0_n_0 ,\axaddr_incr_reg[7]_i_3__0_n_1 ,\axaddr_incr_reg[7]_i_3__0_n_2 ,\axaddr_incr_reg[7]_i_3__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axaddr_incr_reg[7]_i_3__0_n_4 ,\axaddr_incr_reg[7]_i_3__0_n_5 ,\axaddr_incr_reg[7]_i_3__0_n_6 ,\axaddr_incr_reg[7]_i_3__0_n_7 }),
        .S(\axaddr_incr_reg[11]_0 [7:4]));
  FDRE \axaddr_incr_reg[8] 
       (.C(aclk),
        .CE(\axaddr_incr_reg[0]_0 ),
        .D(\axaddr_incr[8]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [8]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[9] 
       (.C(aclk),
        .CE(\axaddr_incr_reg[0]_0 ),
        .D(\axaddr_incr[9]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h44F44444)) 
    \axlen_cnt[0]_i_1__1 
       (.I0(\axlen_cnt_reg_n_0_[0] ),
        .I1(\axlen_cnt_reg[7]_0 ),
        .I2(\axlen_cnt_reg[3]_1 [6]),
        .I3(Q[1]),
        .I4(si_rs_arvalid),
        .O(\axlen_cnt[0]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hF44F4444)) 
    \axlen_cnt[1]_i_1__1 
       (.I0(\axlen_cnt_reg[3]_0 ),
        .I1(\axlen_cnt_reg[3]_1 [7]),
        .I2(\axlen_cnt_reg_n_0_[1] ),
        .I3(\axlen_cnt_reg_n_0_[0] ),
        .I4(\axlen_cnt_reg[7]_0 ),
        .O(\axlen_cnt[1]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hF4F4F44F44444444)) 
    \axlen_cnt[2]_i_1__1 
       (.I0(\axlen_cnt_reg[3]_0 ),
        .I1(\axlen_cnt_reg[3]_1 [8]),
        .I2(\axlen_cnt_reg_n_0_[2] ),
        .I3(\axlen_cnt_reg_n_0_[0] ),
        .I4(\axlen_cnt_reg_n_0_[1] ),
        .I5(\axlen_cnt_reg[7]_0 ),
        .O(\axlen_cnt[2]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h4FF44444)) 
    \axlen_cnt[3]_i_2__1 
       (.I0(\axlen_cnt_reg[3]_0 ),
        .I1(\axlen_cnt_reg[3]_1 [9]),
        .I2(\axlen_cnt_reg_n_0_[3] ),
        .I3(\axlen_cnt[3]_i_4__0_n_0 ),
        .I4(\axlen_cnt_reg[7]_0 ),
        .O(\axlen_cnt[3]_i_2__1_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \axlen_cnt[3]_i_4__0 
       (.I0(\axlen_cnt_reg_n_0_[0] ),
        .I1(\axlen_cnt_reg_n_0_[1] ),
        .I2(\axlen_cnt_reg_n_0_[2] ),
        .O(\axlen_cnt[3]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hAAAAAAA9)) 
    \axlen_cnt[4]_i_1__1 
       (.I0(\axlen_cnt_reg_n_0_[4] ),
        .I1(\axlen_cnt_reg_n_0_[3] ),
        .I2(\axlen_cnt_reg_n_0_[0] ),
        .I3(\axlen_cnt_reg_n_0_[1] ),
        .I4(\axlen_cnt_reg_n_0_[2] ),
        .O(\axlen_cnt[4]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA9)) 
    \axlen_cnt[5]_i_1__0 
       (.I0(\axlen_cnt_reg_n_0_[5] ),
        .I1(\axlen_cnt_reg_n_0_[0] ),
        .I2(\axlen_cnt_reg_n_0_[1] ),
        .I3(\axlen_cnt_reg_n_0_[2] ),
        .I4(\axlen_cnt_reg_n_0_[4] ),
        .I5(\axlen_cnt_reg_n_0_[3] ),
        .O(\axlen_cnt[5]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAA9AA)) 
    \axlen_cnt[6]_i_1 
       (.I0(\axlen_cnt_reg_n_0_[6] ),
        .I1(\axlen_cnt_reg_n_0_[3] ),
        .I2(\axlen_cnt_reg_n_0_[4] ),
        .I3(\axlen_cnt[3]_i_4__0_n_0 ),
        .I4(\axlen_cnt_reg_n_0_[5] ),
        .O(\axlen_cnt[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAA9AA)) 
    \axlen_cnt[7]_i_2__0 
       (.I0(\axlen_cnt_reg_n_0_[7] ),
        .I1(\axlen_cnt_reg_n_0_[6] ),
        .I2(\axlen_cnt_reg_n_0_[5] ),
        .I3(\axlen_cnt[3]_i_4__0_n_0 ),
        .I4(\axlen_cnt_reg_n_0_[4] ),
        .I5(\axlen_cnt_reg_n_0_[3] ),
        .O(\axlen_cnt[7]_i_2__0_n_0 ));
  FDRE \axlen_cnt_reg[0] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[0]_i_1__1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[1] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[1]_i_1__1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[2] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[2]_i_1__1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[3] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[3]_i_2__1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[4] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[4]_i_1__1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[4] ),
        .R(\axlen_cnt_reg[7]_1 ));
  FDRE \axlen_cnt_reg[5] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[5]_i_1__0_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[5] ),
        .R(\axlen_cnt_reg[7]_1 ));
  FDRE \axlen_cnt_reg[6] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[6]_i_1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[6] ),
        .R(\axlen_cnt_reg[7]_1 ));
  FDRE \axlen_cnt_reg[7] 
       (.C(aclk),
        .CE(\axlen_cnt_reg[4]_0 ),
        .D(\axlen_cnt[7]_i_2__0_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[7] ),
        .R(\axlen_cnt_reg[7]_1 ));
  LUT5 #(
    .INIT(32'hFFFF88F8)) 
    next_pending_r_i_1__1
       (.I0(\axlen_cnt_reg[7]_0 ),
        .I1(r_push),
        .I2(next_pending_r),
        .I3(\axlen_cnt_reg[4]_0 ),
        .I4(next_pending_r_reg_0),
        .O(incr_next_pending));
  LUT5 #(
    .INIT(32'hAAA8AAAA)) 
    next_pending_r_i_2__0
       (.I0(\axlen_cnt_reg[3]_0 ),
        .I1(\axlen_cnt_reg_n_0_[7] ),
        .I2(\axlen_cnt_reg_n_0_[5] ),
        .I3(\axlen_cnt_reg_n_0_[6] ),
        .I4(next_pending_r_i_4__0_n_0),
        .O(\axlen_cnt_reg[7]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    next_pending_r_i_4__0
       (.I0(\axlen_cnt_reg_n_0_[3] ),
        .I1(\axlen_cnt_reg_n_0_[4] ),
        .I2(\axlen_cnt_reg_n_0_[1] ),
        .I3(\axlen_cnt_reg_n_0_[2] ),
        .O(next_pending_r_i_4__0_n_0));
  FDRE next_pending_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(incr_next_pending),
        .Q(next_pending_r),
        .R(1'b0));
  FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_reg_1),
        .Q(sel_first_reg_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_r_channel" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_r_channel
   (\cnt_read_reg[2] ,
    \cnt_read_reg[4] ,
    m_axi_rready,
    out,
    r_push_r_reg_0,
    r_push,
    aclk,
    r_rlast,
    \cnt_read_reg[4]_0 ,
    si_rs_rready,
    m_axi_rvalid,
    in,
    D,
    areset_d1);
  output \cnt_read_reg[2] ;
  output \cnt_read_reg[4] ;
  output m_axi_rready;
  output [33:0]out;
  output [12:0]r_push_r_reg_0;
  input r_push;
  input aclk;
  input r_rlast;
  input \cnt_read_reg[4]_0 ;
  input si_rs_rready;
  input m_axi_rvalid;
  input [33:0]in;
  input [11:0]D;
  input areset_d1;

  wire [11:0]D;
  wire aclk;
  wire areset_d1;
  wire \cnt_read_reg[2] ;
  wire \cnt_read_reg[4] ;
  wire \cnt_read_reg[4]_0 ;
  wire [33:0]in;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire [33:0]out;
  wire r_push;
  wire r_push_r;
  wire [12:0]r_push_r_reg_0;
  wire r_rlast;
  wire rd_data_fifo_0_n_0;
  wire rd_data_fifo_0_n_3;
  wire si_rs_rready;
  wire [12:0]trans_in;
  wire transaction_fifo_0_n_1;

  FDRE \r_arid_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[0]),
        .Q(trans_in[1]),
        .R(1'b0));
  FDRE \r_arid_r_reg[10] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[10]),
        .Q(trans_in[11]),
        .R(1'b0));
  FDRE \r_arid_r_reg[11] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[11]),
        .Q(trans_in[12]),
        .R(1'b0));
  FDRE \r_arid_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[1]),
        .Q(trans_in[2]),
        .R(1'b0));
  FDRE \r_arid_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[2]),
        .Q(trans_in[3]),
        .R(1'b0));
  FDRE \r_arid_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[3]),
        .Q(trans_in[4]),
        .R(1'b0));
  FDRE \r_arid_r_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[4]),
        .Q(trans_in[5]),
        .R(1'b0));
  FDRE \r_arid_r_reg[5] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[5]),
        .Q(trans_in[6]),
        .R(1'b0));
  FDRE \r_arid_r_reg[6] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[6]),
        .Q(trans_in[7]),
        .R(1'b0));
  FDRE \r_arid_r_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[7]),
        .Q(trans_in[8]),
        .R(1'b0));
  FDRE \r_arid_r_reg[8] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[8]),
        .Q(trans_in[9]),
        .R(1'b0));
  FDRE \r_arid_r_reg[9] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[9]),
        .Q(trans_in[10]),
        .R(1'b0));
  FDRE r_push_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(r_push),
        .Q(r_push_r),
        .R(1'b0));
  FDRE r_rlast_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(r_rlast),
        .Q(trans_in[0]),
        .R(1'b0));
  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized1 rd_data_fifo_0
       (.aclk(aclk),
        .areset_d1(areset_d1),
        .\cnt_read_reg[2]_0 (\cnt_read_reg[2] ),
        .\cnt_read_reg[4]_0 (rd_data_fifo_0_n_3),
        .\cnt_read_reg[4]_1 (\cnt_read_reg[4]_0 ),
        .in(in),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .m_valid_i_reg(transaction_fifo_0_n_1),
        .out(out),
        .r_push_r(r_push_r),
        .s_ready_i_reg(rd_data_fifo_0_n_0),
        .si_rs_rready(si_rs_rready));
  dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized2 transaction_fifo_0
       (.\FSM_sequential_state_reg[0] (rd_data_fifo_0_n_3),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .\cnt_read_reg[4]_0 (\cnt_read_reg[4] ),
        .\cnt_read_reg[4]_1 (transaction_fifo_0_n_1),
        .\cnt_read_reg[4]_2 (\cnt_read_reg[4]_0 ),
        .\cnt_read_reg[4]_3 (rd_data_fifo_0_n_0),
        .in(trans_in),
        .r_push_r(r_push_r),
        .r_push_r_reg(r_push_r_reg_0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_rd_cmd_fsm" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_rd_cmd_fsm
   (D,
    axaddr_offset,
    Q,
    \FSM_sequential_state_reg[1]_0 ,
    \FSM_sequential_state_reg[1]_1 ,
    \wrap_second_len_r_reg[3] ,
    M00_AXI_0_arready,
    M00_AXI_0_arready_0,
    sel_first_i,
    M00_AXI_0_arready_1,
    E,
    sel_first_reg,
    \m_payload_i_reg[11] ,
    \FSM_sequential_state_reg[1]_2 ,
    m_axi_arvalid,
    m_valid_i0,
    s_ready_i0,
    m_valid_i_reg,
    si_rs_arvalid,
    \wrap_second_len_r_reg[3]_0 ,
    m_axi_arready,
    \axlen_cnt_reg[7] ,
    \wrap_second_len_r_reg[3]_1 ,
    \axaddr_offset_r_reg[3] ,
    \axaddr_offset_r_reg[3]_0 ,
    \axaddr_offset_r_reg[0] ,
    \FSM_sequential_state_reg[0]_0 ,
    \FSM_sequential_state_reg[1]_3 ,
    \axaddr_offset_r_reg[2] ,
    \axaddr_offset_r_reg[2]_0 ,
    \axaddr_offset_r_reg[1] ,
    \axaddr_offset_r_reg[1]_0 ,
    \axaddr_offset_r_reg[3]_1 ,
    sel_first_reg_0,
    areset_d1,
    \axaddr_incr_reg[0] ,
    sel_first_reg_1,
    O,
    \axaddr_wrap_reg[11] ,
    \axaddr_wrap_reg[3] ,
    \axaddr_wrap_reg[7] ,
    \axaddr_wrap_reg[10] ,
    s_axi_arvalid,
    s_ready_i_reg,
    aclk);
  output [3:0]D;
  output [3:0]axaddr_offset;
  output [1:0]Q;
  output \FSM_sequential_state_reg[1]_0 ;
  output \FSM_sequential_state_reg[1]_1 ;
  output [3:0]\wrap_second_len_r_reg[3] ;
  output M00_AXI_0_arready;
  output M00_AXI_0_arready_0;
  output sel_first_i;
  output M00_AXI_0_arready_1;
  output [0:0]E;
  output [0:0]sel_first_reg;
  output [11:0]\m_payload_i_reg[11] ;
  output \FSM_sequential_state_reg[1]_2 ;
  output m_axi_arvalid;
  output m_valid_i0;
  output s_ready_i0;
  output [0:0]m_valid_i_reg;
  input si_rs_arvalid;
  input [3:0]\wrap_second_len_r_reg[3]_0 ;
  input m_axi_arready;
  input \axlen_cnt_reg[7] ;
  input \wrap_second_len_r_reg[3]_1 ;
  input [3:0]\axaddr_offset_r_reg[3] ;
  input [13:0]\axaddr_offset_r_reg[3]_0 ;
  input \axaddr_offset_r_reg[0] ;
  input \FSM_sequential_state_reg[0]_0 ;
  input \FSM_sequential_state_reg[1]_3 ;
  input \axaddr_offset_r_reg[2] ;
  input \axaddr_offset_r_reg[2]_0 ;
  input \axaddr_offset_r_reg[1] ;
  input \axaddr_offset_r_reg[1]_0 ;
  input \axaddr_offset_r_reg[3]_1 ;
  input sel_first_reg_0;
  input areset_d1;
  input \axaddr_incr_reg[0] ;
  input sel_first_reg_1;
  input [3:0]O;
  input [11:0]\axaddr_wrap_reg[11] ;
  input [3:0]\axaddr_wrap_reg[3] ;
  input [3:0]\axaddr_wrap_reg[7] ;
  input \axaddr_wrap_reg[10] ;
  input s_axi_arvalid;
  input s_ready_i_reg;
  input aclk;

  wire [3:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state_reg[0]_0 ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire \FSM_sequential_state_reg[1]_1 ;
  wire \FSM_sequential_state_reg[1]_2 ;
  wire \FSM_sequential_state_reg[1]_3 ;
  wire M00_AXI_0_arready;
  wire M00_AXI_0_arready_0;
  wire M00_AXI_0_arready_1;
  wire [3:0]O;
  wire [1:0]Q;
  wire aclk;
  wire areset_d1;
  wire \axaddr_incr_reg[0] ;
  wire [3:0]axaddr_offset;
  wire \axaddr_offset_r_reg[0] ;
  wire \axaddr_offset_r_reg[1] ;
  wire \axaddr_offset_r_reg[1]_0 ;
  wire \axaddr_offset_r_reg[2] ;
  wire \axaddr_offset_r_reg[2]_0 ;
  wire [3:0]\axaddr_offset_r_reg[3] ;
  wire [13:0]\axaddr_offset_r_reg[3]_0 ;
  wire \axaddr_offset_r_reg[3]_1 ;
  wire \axaddr_wrap[11]_i_2__0_n_0 ;
  wire \axaddr_wrap[11]_i_4__0_n_0 ;
  wire \axaddr_wrap_reg[10] ;
  wire [11:0]\axaddr_wrap_reg[11] ;
  wire [3:0]\axaddr_wrap_reg[3] ;
  wire [3:0]\axaddr_wrap_reg[7] ;
  wire \axlen_cnt_reg[7] ;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire [11:0]\m_payload_i_reg[11] ;
  wire m_valid_i0;
  wire [0:0]m_valid_i_reg;
  wire [1:0]next_state__0;
  wire s_axi_arvalid;
  wire s_ready_i0;
  wire s_ready_i_reg;
  wire sel_first_i;
  wire [0:0]sel_first_reg;
  wire sel_first_reg_0;
  wire sel_first_reg_1;
  wire si_rs_arvalid;
  wire \wrap_cnt_r[2]_i_2__0_n_0 ;
  wire \wrap_cnt_r[3]_i_2__0_n_0 ;
  wire [3:0]\wrap_second_len_r_reg[3] ;
  wire [3:0]\wrap_second_len_r_reg[3]_0 ;
  wire \wrap_second_len_r_reg[3]_1 ;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h555577F7)) 
    \FSM_sequential_state[0]_i_1__0 
       (.I0(Q[1]),
        .I1(\FSM_sequential_state_reg[0]_0 ),
        .I2(Q[0]),
        .I3(m_axi_arready),
        .I4(\FSM_sequential_state_reg[1]_3 ),
        .O(next_state__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00FF4040)) 
    \FSM_sequential_state[1]_i_1__0 
       (.I0(\FSM_sequential_state_reg[0]_0 ),
        .I1(Q[0]),
        .I2(si_rs_arvalid),
        .I3(\FSM_sequential_state_reg[1]_3 ),
        .I4(Q[1]),
        .O(next_state__0[1]));
  (* FSM_ENCODED_STATES = "SM_IDLE:01,SM_DONE:00,SM_CMD_ACCEPTED:10,SM_CMD_EN:11" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_sequential_state_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(next_state__0[0]),
        .Q(Q[0]),
        .S(areset_d1));
  (* FSM_ENCODED_STATES = "SM_IDLE:01,SM_DONE:00,SM_CMD_ACCEPTED:10,SM_CMD_EN:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(next_state__0[1]),
        .Q(Q[1]),
        .R(areset_d1));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hEAAA)) 
    \axaddr_incr[11]_i_1__0 
       (.I0(\axaddr_incr_reg[0] ),
        .I1(Q[0]),
        .I2(m_axi_arready),
        .I3(Q[1]),
        .O(sel_first_reg));
  LUT6 #(
    .INIT(64'hAAEAAA2AAA2AAA2A)) 
    \axaddr_offset_r[0]_i_1__0 
       (.I0(\axaddr_offset_r_reg[3] [0]),
        .I1(si_rs_arvalid),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\axaddr_offset_r_reg[3]_0 [12]),
        .I5(\axaddr_offset_r_reg[0] ),
        .O(axaddr_offset[0]));
  LUT6 #(
    .INIT(64'hBAAABAAABAAA8AAA)) 
    \axaddr_offset_r[1]_i_1__0 
       (.I0(\axaddr_offset_r_reg[3] [1]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(si_rs_arvalid),
        .I4(\axaddr_offset_r_reg[1] ),
        .I5(\axaddr_offset_r_reg[1]_0 ),
        .O(axaddr_offset[1]));
  LUT6 #(
    .INIT(64'hBAAA8AAABAAABAAA)) 
    \axaddr_offset_r[2]_i_1__0 
       (.I0(\axaddr_offset_r_reg[3] [2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(si_rs_arvalid),
        .I4(\axaddr_offset_r_reg[2] ),
        .I5(\axaddr_offset_r_reg[2]_0 ),
        .O(axaddr_offset[2]));
  LUT6 #(
    .INIT(64'hAAAAAAAA30AAAAAA)) 
    \axaddr_offset_r[3]_i_1__0 
       (.I0(\axaddr_offset_r_reg[3] [3]),
        .I1(\axaddr_offset_r_reg[3]_1 ),
        .I2(\axaddr_offset_r_reg[3]_0 [13]),
        .I3(si_rs_arvalid),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(axaddr_offset[3]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[0]_i_1__0 
       (.I0(\axaddr_wrap[11]_i_2__0_n_0 ),
        .I1(\axaddr_wrap_reg[3] [0]),
        .I2(\axaddr_offset_r_reg[3]_0 [0]),
        .I3(\FSM_sequential_state_reg[1]_2 ),
        .I4(\axaddr_wrap_reg[11] [0]),
        .I5(\axaddr_wrap[11]_i_4__0_n_0 ),
        .O(\m_payload_i_reg[11] [0]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[10]_i_1__0 
       (.I0(\axaddr_wrap[11]_i_2__0_n_0 ),
        .I1(O[2]),
        .I2(\axaddr_wrap_reg[11] [10]),
        .I3(\axaddr_wrap[11]_i_4__0_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [10]),
        .I5(\FSM_sequential_state_reg[1]_2 ),
        .O(\m_payload_i_reg[11] [10]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[11]_i_1__0 
       (.I0(\axaddr_wrap[11]_i_2__0_n_0 ),
        .I1(O[3]),
        .I2(\axaddr_offset_r_reg[3]_0 [11]),
        .I3(\FSM_sequential_state_reg[1]_2 ),
        .I4(\axaddr_wrap_reg[11] [11]),
        .I5(\axaddr_wrap[11]_i_4__0_n_0 ),
        .O(\m_payload_i_reg[11] [11]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hBFFF)) 
    \axaddr_wrap[11]_i_2__0 
       (.I0(\axaddr_wrap_reg[10] ),
        .I1(Q[0]),
        .I2(m_axi_arready),
        .I3(Q[1]),
        .O(\axaddr_wrap[11]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \axaddr_wrap[11]_i_4__0 
       (.I0(Q[0]),
        .I1(m_axi_arready),
        .I2(Q[1]),
        .I3(\axaddr_wrap_reg[10] ),
        .O(\axaddr_wrap[11]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[1]_i_1__0 
       (.I0(\axaddr_wrap[11]_i_2__0_n_0 ),
        .I1(\axaddr_wrap_reg[3] [1]),
        .I2(\axaddr_offset_r_reg[3]_0 [1]),
        .I3(\FSM_sequential_state_reg[1]_2 ),
        .I4(\axaddr_wrap_reg[11] [1]),
        .I5(\axaddr_wrap[11]_i_4__0_n_0 ),
        .O(\m_payload_i_reg[11] [1]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[2]_i_1__0 
       (.I0(\axaddr_wrap[11]_i_4__0_n_0 ),
        .I1(\axaddr_wrap_reg[11] [2]),
        .I2(\axaddr_wrap_reg[3] [2]),
        .I3(\axaddr_wrap[11]_i_2__0_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [2]),
        .I5(\FSM_sequential_state_reg[1]_2 ),
        .O(\m_payload_i_reg[11] [2]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[3]_i_1__0 
       (.I0(\axaddr_wrap[11]_i_2__0_n_0 ),
        .I1(\axaddr_wrap_reg[3] [3]),
        .I2(\axaddr_wrap_reg[11] [3]),
        .I3(\axaddr_wrap[11]_i_4__0_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [3]),
        .I5(\FSM_sequential_state_reg[1]_2 ),
        .O(\m_payload_i_reg[11] [3]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[4]_i_1__0 
       (.I0(\axaddr_wrap[11]_i_4__0_n_0 ),
        .I1(\axaddr_wrap_reg[11] [4]),
        .I2(\axaddr_wrap_reg[7] [0]),
        .I3(\axaddr_wrap[11]_i_2__0_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [4]),
        .I5(\FSM_sequential_state_reg[1]_2 ),
        .O(\m_payload_i_reg[11] [4]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[5]_i_1__0 
       (.I0(\axaddr_wrap[11]_i_2__0_n_0 ),
        .I1(\axaddr_wrap_reg[7] [1]),
        .I2(\axaddr_wrap_reg[11] [5]),
        .I3(\axaddr_wrap[11]_i_4__0_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [5]),
        .I5(\FSM_sequential_state_reg[1]_2 ),
        .O(\m_payload_i_reg[11] [5]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[6]_i_1__0 
       (.I0(\axaddr_wrap[11]_i_2__0_n_0 ),
        .I1(\axaddr_wrap_reg[7] [2]),
        .I2(\axaddr_wrap_reg[11] [6]),
        .I3(\axaddr_wrap[11]_i_4__0_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [6]),
        .I5(\FSM_sequential_state_reg[1]_2 ),
        .O(\m_payload_i_reg[11] [6]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[7]_i_1__0 
       (.I0(\axaddr_wrap[11]_i_2__0_n_0 ),
        .I1(\axaddr_wrap_reg[7] [3]),
        .I2(\axaddr_offset_r_reg[3]_0 [7]),
        .I3(\FSM_sequential_state_reg[1]_2 ),
        .I4(\axaddr_wrap_reg[11] [7]),
        .I5(\axaddr_wrap[11]_i_4__0_n_0 ),
        .O(\m_payload_i_reg[11] [7]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[8]_i_1__0 
       (.I0(\axaddr_wrap[11]_i_2__0_n_0 ),
        .I1(O[0]),
        .I2(\axaddr_offset_r_reg[3]_0 [8]),
        .I3(\FSM_sequential_state_reg[1]_2 ),
        .I4(\axaddr_wrap_reg[11] [8]),
        .I5(\axaddr_wrap[11]_i_4__0_n_0 ),
        .O(\m_payload_i_reg[11] [8]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[9]_i_1__0 
       (.I0(\axaddr_wrap[11]_i_4__0_n_0 ),
        .I1(\axaddr_wrap_reg[11] [9]),
        .I2(O[1]),
        .I3(\axaddr_wrap[11]_i_2__0_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [9]),
        .I5(\FSM_sequential_state_reg[1]_2 ),
        .O(\m_payload_i_reg[11] [9]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hA0C0)) 
    \axlen_cnt[3]_i_1__2 
       (.I0(m_axi_arready),
        .I1(si_rs_arvalid),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(M00_AXI_0_arready_1));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \axlen_cnt[3]_i_3 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(si_rs_arvalid),
        .O(\FSM_sequential_state_reg[1]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0000C840)) 
    \axlen_cnt[7]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(si_rs_arvalid),
        .I3(m_axi_arready),
        .I4(\axlen_cnt_reg[7] ),
        .O(\FSM_sequential_state_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    m_axi_arvalid_INST_0
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(m_axi_arvalid));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h57)) 
    \m_payload_i[31]_i_1 
       (.I0(si_rs_arvalid),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(m_valid_i_reg));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFE0FFFF)) 
    m_valid_i_i_1
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(si_rs_arvalid),
        .I3(s_axi_arvalid),
        .I4(s_ready_i_reg),
        .O(m_valid_i0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h80)) 
    r_push_r_i_1
       (.I0(Q[1]),
        .I1(m_axi_arready),
        .I2(Q[0]),
        .O(\FSM_sequential_state_reg[1]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h1FFF1F1F)) 
    s_ready_i_i_1
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(si_rs_arvalid),
        .I3(s_axi_arvalid),
        .I4(s_ready_i_reg),
        .O(s_ready_i0));
  LUT6 #(
    .INIT(64'hFFFFFFFF4FCC4CCC)) 
    sel_first_i_1__2
       (.I0(m_axi_arready),
        .I1(sel_first_reg_0),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(si_rs_arvalid),
        .I5(areset_d1),
        .O(M00_AXI_0_arready));
  LUT6 #(
    .INIT(64'hFFFFFFFF4FCC4CCC)) 
    sel_first_i_1__3
       (.I0(m_axi_arready),
        .I1(\axaddr_incr_reg[0] ),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(si_rs_arvalid),
        .I5(areset_d1),
        .O(M00_AXI_0_arready_0));
  LUT6 #(
    .INIT(64'hCFFFFFFFCECECCCC)) 
    sel_first_i_1__4
       (.I0(si_rs_arvalid),
        .I1(areset_d1),
        .I2(Q[1]),
        .I3(m_axi_arready),
        .I4(Q[0]),
        .I5(sel_first_reg_1),
        .O(sel_first_i));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \wrap_boundary_axaddr_r[11]_i_1__0 
       (.I0(si_rs_arvalid),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(E));
  LUT6 #(
    .INIT(64'h38333333C8CCCCCC)) 
    \wrap_cnt_r[0]_i_1__0 
       (.I0(axaddr_offset[0]),
        .I1(\wrap_cnt_r[2]_i_2__0_n_0 ),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(si_rs_arvalid),
        .I5(\wrap_second_len_r_reg[3]_0 [0]),
        .O(D[0]));
  LUT5 #(
    .INIT(32'h3CCCA0A0)) 
    \wrap_cnt_r[1]_i_1__0 
       (.I0(axaddr_offset[1]),
        .I1(\wrap_second_len_r_reg[3]_0 [1]),
        .I2(\wrap_cnt_r[2]_i_2__0_n_0 ),
        .I3(\wrap_second_len_r_reg[3]_0 [0]),
        .I4(\FSM_sequential_state_reg[1]_1 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h59A9AAAAAAAAAAAA)) 
    \wrap_cnt_r[2]_i_1__0 
       (.I0(\wrap_second_len_r_reg[3] [2]),
        .I1(axaddr_offset[0]),
        .I2(\FSM_sequential_state_reg[1]_1 ),
        .I3(\wrap_second_len_r_reg[3]_0 [0]),
        .I4(\wrap_cnt_r[2]_i_2__0_n_0 ),
        .I5(\wrap_second_len_r_reg[3] [1]),
        .O(D[2]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wrap_cnt_r[2]_i_2__0 
       (.I0(axaddr_offset[1]),
        .I1(axaddr_offset[2]),
        .I2(axaddr_offset[0]),
        .I3(axaddr_offset[3]),
        .O(\wrap_cnt_r[2]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'hA6AA)) 
    \wrap_cnt_r[3]_i_1__0 
       (.I0(\wrap_second_len_r_reg[3] [3]),
        .I1(\wrap_second_len_r_reg[3] [1]),
        .I2(\wrap_cnt_r[3]_i_2__0_n_0 ),
        .I3(\wrap_second_len_r_reg[3] [2]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h772277227722772F)) 
    \wrap_cnt_r[3]_i_2__0 
       (.I0(\FSM_sequential_state_reg[1]_1 ),
        .I1(\wrap_second_len_r_reg[3]_0 [0]),
        .I2(axaddr_offset[3]),
        .I3(axaddr_offset[0]),
        .I4(axaddr_offset[2]),
        .I5(axaddr_offset[1]),
        .O(\wrap_cnt_r[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h88BB88BB88BB88B8)) 
    \wrap_second_len_r[0]_i_1__0 
       (.I0(\wrap_second_len_r_reg[3]_0 [0]),
        .I1(\FSM_sequential_state_reg[1]_1 ),
        .I2(axaddr_offset[3]),
        .I3(axaddr_offset[0]),
        .I4(axaddr_offset[2]),
        .I5(axaddr_offset[1]),
        .O(\wrap_second_len_r_reg[3] [0]));
  LUT6 #(
    .INIT(64'hBB88BB8888BB88B8)) 
    \wrap_second_len_r[1]_i_1__0 
       (.I0(\wrap_second_len_r_reg[3]_0 [1]),
        .I1(\FSM_sequential_state_reg[1]_1 ),
        .I2(axaddr_offset[3]),
        .I3(axaddr_offset[0]),
        .I4(axaddr_offset[2]),
        .I5(axaddr_offset[1]),
        .O(\wrap_second_len_r_reg[3] [1]));
  LUT6 #(
    .INIT(64'hBBBB8888BB8888B8)) 
    \wrap_second_len_r[2]_i_1__0 
       (.I0(\wrap_second_len_r_reg[3]_0 [2]),
        .I1(\FSM_sequential_state_reg[1]_1 ),
        .I2(axaddr_offset[3]),
        .I3(axaddr_offset[0]),
        .I4(axaddr_offset[2]),
        .I5(axaddr_offset[1]),
        .O(\wrap_second_len_r_reg[3] [2]));
  LUT6 #(
    .INIT(64'hFFFFFFF888888888)) 
    \wrap_second_len_r[3]_i_1__0 
       (.I0(\FSM_sequential_state_reg[1]_1 ),
        .I1(\wrap_second_len_r_reg[3]_0 [3]),
        .I2(axaddr_offset[0]),
        .I3(axaddr_offset[1]),
        .I4(axaddr_offset[2]),
        .I5(\wrap_second_len_r_reg[3]_1 ),
        .O(\wrap_second_len_r_reg[3] [3]));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_simple_fifo" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo
   (sel,
    addr,
    SR,
    \bresp_cnt_reg[1] ,
    \cnt_read_reg[1]_0 ,
    out,
    Q,
    mhandshake_r,
    areset_d1,
    b_push,
    in,
    aclk,
    shandshake_r);
  output sel;
  output [1:0]addr;
  output [0:0]SR;
  output \bresp_cnt_reg[1] ;
  output \cnt_read_reg[1]_0 ;
  output [11:0]out;
  input [7:0]Q;
  input mhandshake_r;
  input areset_d1;
  input b_push;
  input [15:0]in;
  input aclk;
  input shandshake_r;

  wire [7:0]Q;
  wire [0:0]SR;
  wire aclk;
  wire [1:0]addr;
  wire areset_d1;
  wire b_push;
  wire \bresp_cnt_reg[1] ;
  wire \cnt_read[0]_i_1_n_0 ;
  wire \cnt_read[1]_i_1_n_0 ;
  wire \cnt_read[1]_i_3_n_0 ;
  wire \cnt_read[1]_i_4_n_0 ;
  wire \cnt_read_reg[1]_0 ;
  wire [15:0]in;
  wire \memory_reg[3][0]_srl4_i_2_n_0 ;
  wire \memory_reg[3][0]_srl4_i_3_n_0 ;
  wire \memory_reg[3][0]_srl4_i_4_n_0 ;
  wire \memory_reg[3][0]_srl4_n_0 ;
  wire \memory_reg[3][1]_srl4_n_0 ;
  wire \memory_reg[3][2]_srl4_n_0 ;
  wire \memory_reg[3][3]_srl4_n_0 ;
  wire mhandshake_r;
  wire [11:0]out;
  wire sel;
  wire shandshake_r;

  LUT2 #(
    .INIT(4'hE)) 
    \bresp_cnt[7]_i_1 
       (.I0(areset_d1),
        .I1(\bresp_cnt_reg[1] ),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT2 #(
    .INIT(4'h8)) 
    bvalid_i_i_3
       (.I0(addr[1]),
        .I1(addr[0]),
        .O(\cnt_read_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \cnt_read[0]_i_1 
       (.I0(b_push),
        .I1(shandshake_r),
        .I2(addr[0]),
        .O(\cnt_read[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT4 #(
    .INIT(16'hDB24)) 
    \cnt_read[1]_i_1 
       (.I0(addr[0]),
        .I1(shandshake_r),
        .I2(b_push),
        .I3(addr[1]),
        .O(\cnt_read[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000041000041)) 
    \cnt_read[1]_i_2 
       (.I0(\cnt_read[1]_i_3_n_0 ),
        .I1(\memory_reg[3][1]_srl4_n_0 ),
        .I2(Q[1]),
        .I3(\memory_reg[3][2]_srl4_n_0 ),
        .I4(Q[2]),
        .I5(\cnt_read[1]_i_4_n_0 ),
        .O(\bresp_cnt_reg[1] ));
  LUT6 #(
    .INIT(64'hEFFEFFFFFFFFEFFE)) 
    \cnt_read[1]_i_3 
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[0]),
        .I3(\memory_reg[3][0]_srl4_n_0 ),
        .I4(Q[3]),
        .I5(\memory_reg[3][3]_srl4_n_0 ),
        .O(\cnt_read[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT5 #(
    .INIT(32'hFFFFF8FF)) 
    \cnt_read[1]_i_4 
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(Q[7]),
        .I3(mhandshake_r),
        .I4(Q[6]),
        .O(\cnt_read[1]_i_4_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[0]_i_1_n_0 ),
        .Q(addr[0]),
        .S(areset_d1));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[1]_i_1_n_0 ),
        .Q(addr[1]),
        .S(areset_d1));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][0]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][0]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[0]),
        .Q(\memory_reg[3][0]_srl4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    \memory_reg[3][0]_srl4_i_1__0 
       (.I0(\memory_reg[3][0]_srl4_i_2_n_0 ),
        .I1(Q[4]),
        .I2(Q[6]),
        .I3(mhandshake_r),
        .I4(\memory_reg[3][0]_srl4_i_3_n_0 ),
        .I5(\memory_reg[3][0]_srl4_i_4_n_0 ),
        .O(sel));
  LUT6 #(
    .INIT(64'hDD0D00000000DD0D)) 
    \memory_reg[3][0]_srl4_i_2 
       (.I0(\memory_reg[3][3]_srl4_n_0 ),
        .I1(Q[3]),
        .I2(\memory_reg[3][2]_srl4_n_0 ),
        .I3(Q[2]),
        .I4(\memory_reg[3][1]_srl4_n_0 ),
        .I5(Q[1]),
        .O(\memory_reg[3][0]_srl4_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFF8)) 
    \memory_reg[3][0]_srl4_i_3 
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(Q[7]),
        .I3(Q[5]),
        .O(\memory_reg[3][0]_srl4_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h2FF22FF2FFFF2FF2)) 
    \memory_reg[3][0]_srl4_i_4 
       (.I0(Q[2]),
        .I1(\memory_reg[3][2]_srl4_n_0 ),
        .I2(\memory_reg[3][0]_srl4_n_0 ),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(\memory_reg[3][3]_srl4_n_0 ),
        .O(\memory_reg[3][0]_srl4_i_4_n_0 ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][10]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][10]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[6]),
        .Q(out[2]));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][11]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][11]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[7]),
        .Q(out[3]));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][12]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][12]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[8]),
        .Q(out[4]));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][13]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][13]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[9]),
        .Q(out[5]));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][14]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][14]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[10]),
        .Q(out[6]));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][15]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][15]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[11]),
        .Q(out[7]));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][16]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][16]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[12]),
        .Q(out[8]));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][17]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][17]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[13]),
        .Q(out[9]));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][18]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][18]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[14]),
        .Q(out[10]));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][19]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][19]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[15]),
        .Q(out[11]));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][1]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][1]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[1]),
        .Q(\memory_reg[3][1]_srl4_n_0 ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][2]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][2]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[2]),
        .Q(\memory_reg[3][2]_srl4_n_0 ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][3]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][3]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[3]),
        .Q(\memory_reg[3][3]_srl4_n_0 ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][8]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][8]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[4]),
        .Q(out[0]));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][9]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][9]_srl4 
       (.A0(addr[0]),
        .A1(addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[5]),
        .Q(out[1]));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_simple_fifo" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized0
   (areset_d1_reg,
    mhandshake,
    m_axi_bready,
    \s_bresp_acc_reg[1] ,
    areset_d1,
    shandshake_r,
    bvalid_i_reg,
    si_rs_bvalid,
    si_rs_bready,
    m_axi_bvalid,
    mhandshake_r,
    sel,
    in,
    aclk,
    \cnt_read_reg[1]_0 );
  output areset_d1_reg;
  output mhandshake;
  output m_axi_bready;
  output [1:0]\s_bresp_acc_reg[1] ;
  input areset_d1;
  input shandshake_r;
  input bvalid_i_reg;
  input si_rs_bvalid;
  input si_rs_bready;
  input m_axi_bvalid;
  input mhandshake_r;
  input sel;
  input [1:0]in;
  input aclk;
  input \cnt_read_reg[1]_0 ;

  wire aclk;
  wire areset_d1;
  wire areset_d1_reg;
  wire bvalid_i_i_2_n_0;
  wire bvalid_i_reg;
  wire [1:0]cnt_read;
  wire \cnt_read[0]_i_1_n_0 ;
  wire \cnt_read[1]_i_1_n_0 ;
  wire \cnt_read_reg[1]_0 ;
  wire [1:0]in;
  wire m_axi_bready;
  wire m_axi_bvalid;
  wire mhandshake;
  wire mhandshake_r;
  wire [1:0]\s_bresp_acc_reg[1] ;
  wire sel;
  wire shandshake_r;
  wire si_rs_bready;
  wire si_rs_bvalid;

  LUT6 #(
    .INIT(64'h0000000155550001)) 
    bvalid_i_i_1
       (.I0(areset_d1),
        .I1(bvalid_i_i_2_n_0),
        .I2(shandshake_r),
        .I3(bvalid_i_reg),
        .I4(si_rs_bvalid),
        .I5(si_rs_bready),
        .O(areset_d1_reg));
  LUT2 #(
    .INIT(4'h8)) 
    bvalid_i_i_2
       (.I0(cnt_read[1]),
        .I1(cnt_read[0]),
        .O(bvalid_i_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \cnt_read[0]_i_1 
       (.I0(\cnt_read_reg[1]_0 ),
        .I1(shandshake_r),
        .I2(cnt_read[0]),
        .O(\cnt_read[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT4 #(
    .INIT(16'hDB24)) 
    \cnt_read[1]_i_1 
       (.I0(cnt_read[0]),
        .I1(shandshake_r),
        .I2(\cnt_read_reg[1]_0 ),
        .I3(cnt_read[1]),
        .O(\cnt_read[1]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[0]_i_1_n_0 ),
        .Q(cnt_read[0]),
        .S(areset_d1));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[1]_i_1_n_0 ),
        .Q(cnt_read[1]),
        .S(areset_d1));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'h08)) 
    m_axi_bready_INST_0
       (.I0(cnt_read[0]),
        .I1(cnt_read[1]),
        .I2(mhandshake_r),
        .O(m_axi_bready));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][0]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][0]_srl4 
       (.A0(cnt_read[0]),
        .A1(cnt_read[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(sel),
        .CLK(aclk),
        .D(in[0]),
        .Q(\s_bresp_acc_reg[1] [0]));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][1]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][1]_srl4 
       (.A0(cnt_read[0]),
        .A1(cnt_read[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(sel),
        .CLK(aclk),
        .D(in[1]),
        .Q(\s_bresp_acc_reg[1] [1]));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    mhandshake_r_i_1
       (.I0(m_axi_bvalid),
        .I1(mhandshake_r),
        .I2(cnt_read[1]),
        .I3(cnt_read[0]),
        .O(mhandshake));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_simple_fifo" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized1
   (s_ready_i_reg,
    \cnt_read_reg[2]_0 ,
    m_axi_rready,
    \cnt_read_reg[4]_0 ,
    out,
    \cnt_read_reg[4]_1 ,
    si_rs_rready,
    r_push_r,
    m_valid_i_reg,
    m_axi_rvalid,
    in,
    aclk,
    areset_d1);
  output s_ready_i_reg;
  output \cnt_read_reg[2]_0 ;
  output m_axi_rready;
  output \cnt_read_reg[4]_0 ;
  output [33:0]out;
  input \cnt_read_reg[4]_1 ;
  input si_rs_rready;
  input r_push_r;
  input m_valid_i_reg;
  input m_axi_rvalid;
  input [33:0]in;
  input aclk;
  input areset_d1;

  wire aclk;
  wire areset_d1;
  wire \cnt_read[0]_i_1_n_0 ;
  wire \cnt_read[1]_i_1__0_n_0 ;
  wire \cnt_read[2]_i_1_n_0 ;
  wire \cnt_read[3]_i_1_n_0 ;
  wire \cnt_read[4]_i_1__0_n_0 ;
  wire \cnt_read[4]_i_2_n_0 ;
  wire \cnt_read[4]_i_4_n_0 ;
  wire [4:0]cnt_read_reg;
  wire \cnt_read_reg[2]_0 ;
  wire \cnt_read_reg[4]_0 ;
  wire \cnt_read_reg[4]_1 ;
  wire [33:0]in;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire m_valid_i_reg;
  wire [33:0]out;
  wire r_push_r;
  wire s_ready_i_reg;
  wire si_rs_rready;
  wire wr_en0;
  wire \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][13]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][14]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][15]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][16]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][17]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][18]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][19]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][20]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][21]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][22]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][23]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][24]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][25]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][26]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][27]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][28]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][29]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][30]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][31]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][32]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][33]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h08888800)) 
    \FSM_sequential_state[1]_i_4 
       (.I0(cnt_read_reg[4]),
        .I1(cnt_read_reg[3]),
        .I2(cnt_read_reg[0]),
        .I3(cnt_read_reg[1]),
        .I4(cnt_read_reg[2]),
        .O(\cnt_read_reg[4]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt_read[0]_i_1 
       (.I0(cnt_read_reg[0]),
        .O(\cnt_read[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hD22D)) 
    \cnt_read[1]_i_1__0 
       (.I0(wr_en0),
        .I1(\cnt_read_reg[4]_1 ),
        .I2(cnt_read_reg[1]),
        .I3(cnt_read_reg[0]),
        .O(\cnt_read[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hA9A96AA9)) 
    \cnt_read[2]_i_1 
       (.I0(cnt_read_reg[2]),
        .I1(cnt_read_reg[1]),
        .I2(cnt_read_reg[0]),
        .I3(wr_en0),
        .I4(\cnt_read_reg[4]_1 ),
        .O(\cnt_read[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFF4000FFF4000B)) 
    \cnt_read[3]_i_1 
       (.I0(\cnt_read_reg[4]_1 ),
        .I1(wr_en0),
        .I2(cnt_read_reg[0]),
        .I3(cnt_read_reg[1]),
        .I4(cnt_read_reg[3]),
        .I5(cnt_read_reg[2]),
        .O(\cnt_read[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_read[4]_i_1__0 
       (.I0(wr_en0),
        .I1(\cnt_read_reg[4]_1 ),
        .O(\cnt_read[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h9AAAAAAAAAAAAAA6)) 
    \cnt_read[4]_i_2 
       (.I0(cnt_read_reg[4]),
        .I1(\cnt_read[4]_i_4_n_0 ),
        .I2(cnt_read_reg[0]),
        .I3(cnt_read_reg[1]),
        .I4(cnt_read_reg[3]),
        .I5(cnt_read_reg[2]),
        .O(\cnt_read[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    \cnt_read[4]_i_3 
       (.I0(\cnt_read_reg[2]_0 ),
        .I1(si_rs_rready),
        .I2(r_push_r),
        .O(s_ready_i_reg));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    \cnt_read[4]_i_4 
       (.I0(\cnt_read_reg[2]_0 ),
        .I1(si_rs_rready),
        .I2(wr_en0),
        .O(\cnt_read[4]_i_4_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[0] 
       (.C(aclk),
        .CE(\cnt_read[4]_i_1__0_n_0 ),
        .D(\cnt_read[0]_i_1_n_0 ),
        .Q(cnt_read_reg[0]),
        .S(areset_d1));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1] 
       (.C(aclk),
        .CE(\cnt_read[4]_i_1__0_n_0 ),
        .D(\cnt_read[1]_i_1__0_n_0 ),
        .Q(cnt_read_reg[1]),
        .S(areset_d1));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[2] 
       (.C(aclk),
        .CE(\cnt_read[4]_i_1__0_n_0 ),
        .D(\cnt_read[2]_i_1_n_0 ),
        .Q(cnt_read_reg[2]),
        .S(areset_d1));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[3] 
       (.C(aclk),
        .CE(\cnt_read[4]_i_1__0_n_0 ),
        .D(\cnt_read[3]_i_1_n_0 ),
        .Q(cnt_read_reg[3]),
        .S(areset_d1));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[4] 
       (.C(aclk),
        .CE(\cnt_read[4]_i_1__0_n_0 ),
        .D(\cnt_read[4]_i_2_n_0 ),
        .Q(cnt_read_reg[4]),
        .S(areset_d1));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h91FFFFFF)) 
    m_axi_rready_INST_0
       (.I0(cnt_read_reg[2]),
        .I1(cnt_read_reg[1]),
        .I2(cnt_read_reg[0]),
        .I3(cnt_read_reg[3]),
        .I4(cnt_read_reg[4]),
        .O(m_axi_rready));
  LUT6 #(
    .INIT(64'hFFFFFFFF80000000)) 
    m_valid_i_i_2
       (.I0(cnt_read_reg[2]),
        .I1(cnt_read_reg[1]),
        .I2(cnt_read_reg[0]),
        .I3(cnt_read_reg[4]),
        .I4(cnt_read_reg[3]),
        .I5(m_valid_i_reg),
        .O(\cnt_read_reg[2]_0 ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][0]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][0]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[0]),
        .Q(out[0]),
        .Q31(\NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED ));
  LUT6 #(
    .INIT(64'h8202AAAAAAAAAAAA)) 
    \memory_reg[31][0]_srl32_i_1 
       (.I0(m_axi_rvalid),
        .I1(cnt_read_reg[2]),
        .I2(cnt_read_reg[1]),
        .I3(cnt_read_reg[0]),
        .I4(cnt_read_reg[3]),
        .I5(cnt_read_reg[4]),
        .O(wr_en0));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][10]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][10]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[10]),
        .Q(out[10]),
        .Q31(\NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][11]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][11]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[11]),
        .Q(out[11]),
        .Q31(\NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][12]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][12]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[12]),
        .Q(out[12]),
        .Q31(\NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][13]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][13]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[13]),
        .Q(out[13]),
        .Q31(\NLW_memory_reg[31][13]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][14]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][14]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[14]),
        .Q(out[14]),
        .Q31(\NLW_memory_reg[31][14]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][15]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][15]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[15]),
        .Q(out[15]),
        .Q31(\NLW_memory_reg[31][15]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][16]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][16]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[16]),
        .Q(out[16]),
        .Q31(\NLW_memory_reg[31][16]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][17]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][17]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[17]),
        .Q(out[17]),
        .Q31(\NLW_memory_reg[31][17]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][18]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][18]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[18]),
        .Q(out[18]),
        .Q31(\NLW_memory_reg[31][18]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][19]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][19]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[19]),
        .Q(out[19]),
        .Q31(\NLW_memory_reg[31][19]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][1]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][1]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[1]),
        .Q(out[1]),
        .Q31(\NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][20]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][20]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[20]),
        .Q(out[20]),
        .Q31(\NLW_memory_reg[31][20]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][21]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][21]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[21]),
        .Q(out[21]),
        .Q31(\NLW_memory_reg[31][21]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][22]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][22]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[22]),
        .Q(out[22]),
        .Q31(\NLW_memory_reg[31][22]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][23]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][23]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[23]),
        .Q(out[23]),
        .Q31(\NLW_memory_reg[31][23]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][24]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][24]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[24]),
        .Q(out[24]),
        .Q31(\NLW_memory_reg[31][24]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][25]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][25]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[25]),
        .Q(out[25]),
        .Q31(\NLW_memory_reg[31][25]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][26]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][26]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[26]),
        .Q(out[26]),
        .Q31(\NLW_memory_reg[31][26]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][27]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][27]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[27]),
        .Q(out[27]),
        .Q31(\NLW_memory_reg[31][27]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][28]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][28]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[28]),
        .Q(out[28]),
        .Q31(\NLW_memory_reg[31][28]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][29]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][29]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[29]),
        .Q(out[29]),
        .Q31(\NLW_memory_reg[31][29]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][2]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][2]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[2]),
        .Q(out[2]),
        .Q31(\NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][30]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][30]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[30]),
        .Q(out[30]),
        .Q31(\NLW_memory_reg[31][30]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][31]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][31]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[31]),
        .Q(out[31]),
        .Q31(\NLW_memory_reg[31][31]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][32]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][32]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[32]),
        .Q(out[32]),
        .Q31(\NLW_memory_reg[31][32]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][33]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][33]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[33]),
        .Q(out[33]),
        .Q31(\NLW_memory_reg[31][33]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][3]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][3]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[3]),
        .Q(out[3]),
        .Q31(\NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][4]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][4]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[4]),
        .Q(out[4]),
        .Q31(\NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][5]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][5]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[5]),
        .Q(out[5]),
        .Q31(\NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][6]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][6]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[6]),
        .Q(out[6]),
        .Q31(\NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][7]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][7]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[7]),
        .Q(out[7]),
        .Q31(\NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][8]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][8]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[8]),
        .Q(out[8]),
        .Q31(\NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][9]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][9]_srl32 
       (.A(cnt_read_reg),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[9]),
        .Q(out[9]),
        .Q31(\NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED ));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_simple_fifo" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized2
   (\cnt_read_reg[4]_0 ,
    \cnt_read_reg[4]_1 ,
    r_push_r_reg,
    r_push_r,
    \cnt_read_reg[4]_2 ,
    \cnt_read_reg[4]_3 ,
    \FSM_sequential_state_reg[0] ,
    in,
    aclk,
    areset_d1);
  output \cnt_read_reg[4]_0 ;
  output \cnt_read_reg[4]_1 ;
  output [12:0]r_push_r_reg;
  input r_push_r;
  input \cnt_read_reg[4]_2 ;
  input \cnt_read_reg[4]_3 ;
  input \FSM_sequential_state_reg[0] ;
  input [12:0]in;
  input aclk;
  input areset_d1;

  wire \FSM_sequential_state_reg[0] ;
  wire aclk;
  wire areset_d1;
  wire \cnt_read[0]_i_1__0_n_0 ;
  wire \cnt_read[1]_i_1_n_0 ;
  wire \cnt_read[2]_i_1__0_n_0 ;
  wire \cnt_read[3]_i_1__0_n_0 ;
  wire \cnt_read[4]_i_1_n_0 ;
  wire \cnt_read[4]_i_2__0_n_0 ;
  wire [4:0]cnt_read_reg;
  wire \cnt_read_reg[4]_0 ;
  wire \cnt_read_reg[4]_1 ;
  wire \cnt_read_reg[4]_2 ;
  wire \cnt_read_reg[4]_3 ;
  wire [12:0]in;
  wire r_push_r;
  wire [12:0]r_push_r_reg;
  wire \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hAAEAEAAAEAEAEAAA)) 
    \FSM_sequential_state[1]_i_2__0 
       (.I0(\FSM_sequential_state_reg[0] ),
        .I1(cnt_read_reg[4]),
        .I2(cnt_read_reg[3]),
        .I3(cnt_read_reg[2]),
        .I4(cnt_read_reg[1]),
        .I5(cnt_read_reg[0]),
        .O(\cnt_read_reg[4]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \cnt_read[0]_i_1__0 
       (.I0(cnt_read_reg[0]),
        .O(\cnt_read[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hD22D)) 
    \cnt_read[1]_i_1 
       (.I0(r_push_r),
        .I1(\cnt_read_reg[4]_2 ),
        .I2(cnt_read_reg[0]),
        .I3(cnt_read_reg[1]),
        .O(\cnt_read[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hA6AAAA59)) 
    \cnt_read[2]_i_1__0 
       (.I0(cnt_read_reg[2]),
        .I1(r_push_r),
        .I2(\cnt_read_reg[4]_2 ),
        .I3(cnt_read_reg[0]),
        .I4(cnt_read_reg[1]),
        .O(\cnt_read[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hF7FFEFEE08001011)) 
    \cnt_read[3]_i_1__0 
       (.I0(cnt_read_reg[1]),
        .I1(cnt_read_reg[0]),
        .I2(\cnt_read_reg[4]_2 ),
        .I3(r_push_r),
        .I4(cnt_read_reg[2]),
        .I5(cnt_read_reg[3]),
        .O(\cnt_read[3]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_read[4]_i_1 
       (.I0(r_push_r),
        .I1(\cnt_read_reg[4]_2 ),
        .O(\cnt_read[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA6AAAAAAAAAA9AA)) 
    \cnt_read[4]_i_2__0 
       (.I0(cnt_read_reg[4]),
        .I1(cnt_read_reg[2]),
        .I2(cnt_read_reg[3]),
        .I3(\cnt_read_reg[4]_3 ),
        .I4(cnt_read_reg[1]),
        .I5(cnt_read_reg[0]),
        .O(\cnt_read[4]_i_2__0_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[0] 
       (.C(aclk),
        .CE(\cnt_read[4]_i_1_n_0 ),
        .D(\cnt_read[0]_i_1__0_n_0 ),
        .Q(cnt_read_reg[0]),
        .S(areset_d1));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1] 
       (.C(aclk),
        .CE(\cnt_read[4]_i_1_n_0 ),
        .D(\cnt_read[1]_i_1_n_0 ),
        .Q(cnt_read_reg[1]),
        .S(areset_d1));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[2] 
       (.C(aclk),
        .CE(\cnt_read[4]_i_1_n_0 ),
        .D(\cnt_read[2]_i_1__0_n_0 ),
        .Q(cnt_read_reg[2]),
        .S(areset_d1));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[3] 
       (.C(aclk),
        .CE(\cnt_read[4]_i_1_n_0 ),
        .D(\cnt_read[3]_i_1__0_n_0 ),
        .Q(cnt_read_reg[3]),
        .S(areset_d1));
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[4] 
       (.C(aclk),
        .CE(\cnt_read[4]_i_1_n_0 ),
        .D(\cnt_read[4]_i_2__0_n_0 ),
        .Q(cnt_read_reg[4]),
        .S(areset_d1));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    m_valid_i_i_3
       (.I0(cnt_read_reg[4]),
        .I1(cnt_read_reg[3]),
        .I2(cnt_read_reg[2]),
        .I3(cnt_read_reg[1]),
        .I4(cnt_read_reg[0]),
        .O(\cnt_read_reg[4]_1 ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][0]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][0]_srl32 
       (.A(cnt_read_reg),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[0]),
        .Q(r_push_r_reg[0]),
        .Q31(\NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][10]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][10]_srl32 
       (.A(cnt_read_reg),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[10]),
        .Q(r_push_r_reg[10]),
        .Q31(\NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][11]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][11]_srl32 
       (.A(cnt_read_reg),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[11]),
        .Q(r_push_r_reg[11]),
        .Q31(\NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][12]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][12]_srl32 
       (.A(cnt_read_reg),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[12]),
        .Q(r_push_r_reg[12]),
        .Q31(\NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][1]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][1]_srl32 
       (.A(cnt_read_reg),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[1]),
        .Q(r_push_r_reg[1]),
        .Q31(\NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][2]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][2]_srl32 
       (.A(cnt_read_reg),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[2]),
        .Q(r_push_r_reg[2]),
        .Q31(\NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][3]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][3]_srl32 
       (.A(cnt_read_reg),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[3]),
        .Q(r_push_r_reg[3]),
        .Q31(\NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][4]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][4]_srl32 
       (.A(cnt_read_reg),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[4]),
        .Q(r_push_r_reg[4]),
        .Q31(\NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][5]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][5]_srl32 
       (.A(cnt_read_reg),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[5]),
        .Q(r_push_r_reg[5]),
        .Q31(\NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][6]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][6]_srl32 
       (.A(cnt_read_reg),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[6]),
        .Q(r_push_r_reg[6]),
        .Q31(\NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][7]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][7]_srl32 
       (.A(cnt_read_reg),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[7]),
        .Q(r_push_r_reg[7]),
        .Q31(\NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][8]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][8]_srl32 
       (.A(cnt_read_reg),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[8]),
        .Q(r_push_r_reg[8]),
        .Q31(\NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][9]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][9]_srl32 
       (.A(cnt_read_reg),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[9]),
        .Q(r_push_r_reg[9]),
        .Q31(\NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED ));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_wr_cmd_fsm" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wr_cmd_fsm
   (D,
    axaddr_offset,
    Q,
    \FSM_sequential_state_reg[0]_0 ,
    \FSM_sequential_state_reg[0]_1 ,
    \FSM_sequential_state_reg[0]_2 ,
    E,
    M00_AXI_0_awready,
    \wrap_second_len_r_reg[3] ,
    \axlen_cnt_reg[2] ,
    next,
    \axlen_cnt_reg[2]_0 ,
    m_valid_i_reg,
    sel_first_reg,
    sel_first_reg_0,
    sel_first_i,
    \wrap_boundary_axaddr_r_reg[11] ,
    m_axi_awvalid,
    si_rs_awvalid,
    \wrap_second_len_r_reg[3]_0 ,
    s_axburst_eq0_reg,
    \wrap_second_len_r_reg[0] ,
    \wrap_second_len_r_reg[3]_1 ,
    \axaddr_offset_r_reg[3] ,
    \axaddr_offset_r_reg[3]_0 ,
    \axaddr_offset_r_reg[0] ,
    s_axburst_eq0_reg_0,
    \FSM_sequential_state_reg[1]_0 ,
    m_axi_awready,
    s_axburst_eq1_reg,
    next_pending_r,
    next_pending_r_0,
    sel_first,
    areset_d1,
    sel_first_reg_1,
    sel_first_reg_2,
    \axaddr_offset_r_reg[3]_1 ,
    \axaddr_offset_r_reg[1] ,
    \axaddr_offset_r_reg[1]_0 ,
    axaddr_wrap0,
    \axaddr_wrap_reg[11] ,
    \axaddr_wrap_reg[11]_0 ,
    cnt_read,
    aclk);
  output [3:0]D;
  output [2:0]axaddr_offset;
  output [1:0]Q;
  output \FSM_sequential_state_reg[0]_0 ;
  output \FSM_sequential_state_reg[0]_1 ;
  output \FSM_sequential_state_reg[0]_2 ;
  output [0:0]E;
  output M00_AXI_0_awready;
  output [3:0]\wrap_second_len_r_reg[3] ;
  output \axlen_cnt_reg[2] ;
  output next;
  output \axlen_cnt_reg[2]_0 ;
  output [0:0]m_valid_i_reg;
  output sel_first_reg;
  output sel_first_reg_0;
  output sel_first_i;
  output [11:0]\wrap_boundary_axaddr_r_reg[11] ;
  output m_axi_awvalid;
  input si_rs_awvalid;
  input [3:0]\wrap_second_len_r_reg[3]_0 ;
  input s_axburst_eq0_reg;
  input [0:0]\wrap_second_len_r_reg[0] ;
  input \wrap_second_len_r_reg[3]_1 ;
  input [2:0]\axaddr_offset_r_reg[3] ;
  input [14:0]\axaddr_offset_r_reg[3]_0 ;
  input \axaddr_offset_r_reg[0] ;
  input s_axburst_eq0_reg_0;
  input \FSM_sequential_state_reg[1]_0 ;
  input m_axi_awready;
  input s_axburst_eq1_reg;
  input next_pending_r;
  input next_pending_r_0;
  input sel_first;
  input areset_d1;
  input sel_first_reg_1;
  input sel_first_reg_2;
  input \axaddr_offset_r_reg[3]_1 ;
  input \axaddr_offset_r_reg[1] ;
  input \axaddr_offset_r_reg[1]_0 ;
  input [11:0]axaddr_wrap0;
  input [11:0]\axaddr_wrap_reg[11] ;
  input \axaddr_wrap_reg[11]_0 ;
  input [1:0]cnt_read;
  input aclk;

  wire [3:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state_reg[0]_0 ;
  wire \FSM_sequential_state_reg[0]_1 ;
  wire \FSM_sequential_state_reg[0]_2 ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire M00_AXI_0_awready;
  wire [1:0]Q;
  wire aclk;
  wire areset_d1;
  wire [2:0]axaddr_offset;
  wire \axaddr_offset_r_reg[0] ;
  wire \axaddr_offset_r_reg[1] ;
  wire \axaddr_offset_r_reg[1]_0 ;
  wire [2:0]\axaddr_offset_r_reg[3] ;
  wire [14:0]\axaddr_offset_r_reg[3]_0 ;
  wire \axaddr_offset_r_reg[3]_1 ;
  wire [11:0]axaddr_wrap0;
  wire \axaddr_wrap[11]_i_2_n_0 ;
  wire \axaddr_wrap[11]_i_4_n_0 ;
  wire [11:0]\axaddr_wrap_reg[11] ;
  wire \axaddr_wrap_reg[11]_0 ;
  wire \axlen_cnt_reg[2] ;
  wire \axlen_cnt_reg[2]_0 ;
  wire [1:0]cnt_read;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire [0:0]m_valid_i_reg;
  wire next;
  wire next_pending_r;
  wire next_pending_r_0;
  wire [1:0]next_state__0;
  wire s_axburst_eq0_i_2_n_0;
  wire s_axburst_eq0_i_3_n_0;
  wire s_axburst_eq0_i_4_n_0;
  wire s_axburst_eq0_i_5_n_0;
  wire s_axburst_eq0_reg;
  wire s_axburst_eq0_reg_0;
  wire s_axburst_eq1_i_2_n_0;
  wire s_axburst_eq1_reg;
  wire sel_first;
  wire sel_first_i;
  wire sel_first_reg;
  wire sel_first_reg_0;
  wire sel_first_reg_1;
  wire sel_first_reg_2;
  wire si_rs_awvalid;
  wire [11:0]\wrap_boundary_axaddr_r_reg[11] ;
  wire \wrap_cnt_r[2]_i_2_n_0 ;
  wire \wrap_cnt_r[3]_i_2_n_0 ;
  wire [0:0]\wrap_second_len_r_reg[0] ;
  wire [3:0]\wrap_second_len_r_reg[3] ;
  wire [3:0]\wrap_second_len_r_reg[3]_0 ;
  wire \wrap_second_len_r_reg[3]_1 ;

  LUT6 #(
    .INIT(64'h7737FFFFFFFFFF0F)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\FSM_sequential_state_reg[1]_0 ),
        .I1(m_axi_awready),
        .I2(cnt_read[1]),
        .I3(cnt_read[0]),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(next_state__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT5 #(
    .INIT(32'hACF0FCF0)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state_reg[1]_0 ),
        .I1(si_rs_awvalid),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(m_axi_awready),
        .O(next_state__0[1]));
  (* FSM_ENCODED_STATES = "SM_CMD_ACCEPTED:10,SM_CMD_EN:11,SM_IDLE:01,SM_DONE_WAIT:00" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_sequential_state_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(next_state__0[0]),
        .Q(Q[0]),
        .S(areset_d1));
  (* FSM_ENCODED_STATES = "SM_CMD_ACCEPTED:10,SM_CMD_EN:11,SM_IDLE:01,SM_DONE_WAIT:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(next_state__0[1]),
        .Q(Q[1]),
        .R(areset_d1));
  LUT6 #(
    .INIT(64'hAEAAA2AAA2AAA2AA)) 
    \axaddr_offset_r[0]_i_1 
       (.I0(\axaddr_offset_r_reg[3] [0]),
        .I1(si_rs_awvalid),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\axaddr_offset_r_reg[3]_0 [13]),
        .I5(\axaddr_offset_r_reg[0] ),
        .O(axaddr_offset[0]));
  LUT6 #(
    .INIT(64'hAEAAAEAAAEAAA2AA)) 
    \axaddr_offset_r[1]_i_1 
       (.I0(\axaddr_offset_r_reg[3] [1]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(si_rs_awvalid),
        .I4(\axaddr_offset_r_reg[1] ),
        .I5(\axaddr_offset_r_reg[1]_0 ),
        .O(axaddr_offset[1]));
  LUT6 #(
    .INIT(64'hAAAA30AAAAAAAAAA)) 
    \axaddr_offset_r[3]_i_1 
       (.I0(\axaddr_offset_r_reg[3] [2]),
        .I1(\axaddr_offset_r_reg[3]_1 ),
        .I2(\axaddr_offset_r_reg[3]_0 [14]),
        .I3(si_rs_awvalid),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(axaddr_offset[2]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[0]_i_1 
       (.I0(\axaddr_wrap[11]_i_4_n_0 ),
        .I1(axaddr_wrap0[0]),
        .I2(\axaddr_wrap_reg[11] [0]),
        .I3(\axaddr_wrap[11]_i_2_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [0]),
        .I5(next),
        .O(\wrap_boundary_axaddr_r_reg[11] [0]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[10]_i_1 
       (.I0(\axaddr_wrap[11]_i_4_n_0 ),
        .I1(axaddr_wrap0[10]),
        .I2(\axaddr_offset_r_reg[3]_0 [10]),
        .I3(next),
        .I4(\axaddr_wrap_reg[11] [10]),
        .I5(\axaddr_wrap[11]_i_2_n_0 ),
        .O(\wrap_boundary_axaddr_r_reg[11] [10]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[11]_i_1 
       (.I0(\axaddr_wrap[11]_i_2_n_0 ),
        .I1(\axaddr_wrap_reg[11] [11]),
        .I2(axaddr_wrap0[11]),
        .I3(\axaddr_wrap[11]_i_4_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [11]),
        .I5(next),
        .O(\wrap_boundary_axaddr_r_reg[11] [11]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT4 #(
    .INIT(16'h51FF)) 
    \axaddr_wrap[11]_i_2 
       (.I0(M00_AXI_0_awready),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\axaddr_wrap_reg[11]_0 ),
        .O(\axaddr_wrap[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT4 #(
    .INIT(16'hBBAB)) 
    \axaddr_wrap[11]_i_4 
       (.I0(\axaddr_wrap_reg[11]_0 ),
        .I1(M00_AXI_0_awready),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(\axaddr_wrap[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[1]_i_1 
       (.I0(\axaddr_wrap[11]_i_4_n_0 ),
        .I1(axaddr_wrap0[1]),
        .I2(\axaddr_wrap_reg[11] [1]),
        .I3(\axaddr_wrap[11]_i_2_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [1]),
        .I5(next),
        .O(\wrap_boundary_axaddr_r_reg[11] [1]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[2]_i_1 
       (.I0(\axaddr_wrap[11]_i_4_n_0 ),
        .I1(axaddr_wrap0[2]),
        .I2(\axaddr_wrap_reg[11] [2]),
        .I3(\axaddr_wrap[11]_i_2_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [2]),
        .I5(next),
        .O(\wrap_boundary_axaddr_r_reg[11] [2]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[3]_i_1 
       (.I0(\axaddr_wrap[11]_i_4_n_0 ),
        .I1(axaddr_wrap0[3]),
        .I2(\axaddr_wrap_reg[11] [3]),
        .I3(\axaddr_wrap[11]_i_2_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [3]),
        .I5(next),
        .O(\wrap_boundary_axaddr_r_reg[11] [3]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[4]_i_1 
       (.I0(\axaddr_wrap[11]_i_4_n_0 ),
        .I1(axaddr_wrap0[4]),
        .I2(\axaddr_wrap_reg[11] [4]),
        .I3(\axaddr_wrap[11]_i_2_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [4]),
        .I5(next),
        .O(\wrap_boundary_axaddr_r_reg[11] [4]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[5]_i_1 
       (.I0(\axaddr_wrap[11]_i_4_n_0 ),
        .I1(axaddr_wrap0[5]),
        .I2(\axaddr_wrap_reg[11] [5]),
        .I3(\axaddr_wrap[11]_i_2_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [5]),
        .I5(next),
        .O(\wrap_boundary_axaddr_r_reg[11] [5]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[6]_i_1 
       (.I0(\axaddr_wrap[11]_i_4_n_0 ),
        .I1(axaddr_wrap0[6]),
        .I2(\axaddr_wrap_reg[11] [6]),
        .I3(\axaddr_wrap[11]_i_2_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [6]),
        .I5(next),
        .O(\wrap_boundary_axaddr_r_reg[11] [6]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[7]_i_1 
       (.I0(\axaddr_wrap[11]_i_2_n_0 ),
        .I1(\axaddr_wrap_reg[11] [7]),
        .I2(axaddr_wrap0[7]),
        .I3(\axaddr_wrap[11]_i_4_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [7]),
        .I5(next),
        .O(\wrap_boundary_axaddr_r_reg[11] [7]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[8]_i_1 
       (.I0(\axaddr_wrap[11]_i_2_n_0 ),
        .I1(\axaddr_wrap_reg[11] [8]),
        .I2(axaddr_wrap0[8]),
        .I3(\axaddr_wrap[11]_i_4_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [8]),
        .I5(next),
        .O(\wrap_boundary_axaddr_r_reg[11] [8]));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    \axaddr_wrap[9]_i_1 
       (.I0(\axaddr_wrap[11]_i_4_n_0 ),
        .I1(axaddr_wrap0[9]),
        .I2(\axaddr_wrap_reg[11] [9]),
        .I3(\axaddr_wrap[11]_i_2_n_0 ),
        .I4(\axaddr_offset_r_reg[3]_0 [9]),
        .I5(next),
        .O(\wrap_boundary_axaddr_r_reg[11] [9]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT4 #(
    .INIT(16'hFF64)) 
    \axlen_cnt[3]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(si_rs_awvalid),
        .I3(M00_AXI_0_awready),
        .O(\FSM_sequential_state_reg[0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \axlen_cnt[3]_i_3__2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(si_rs_awvalid),
        .O(\FSM_sequential_state_reg[0]_2 ));
  LUT2 #(
    .INIT(4'h2)) 
    \axlen_cnt[5]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_1 ),
        .I1(s_axburst_eq0_reg),
        .O(\FSM_sequential_state_reg[0]_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    m_axi_awvalid_INST_0
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(m_axi_awvalid));
  LUT2 #(
    .INIT(4'hB)) 
    \m_payload_i[31]_i_1__1 
       (.I0(M00_AXI_0_awready),
        .I1(si_rs_awvalid),
        .O(E));
  LUT6 #(
    .INIT(64'h0383038300000383)) 
    \memory_reg[3][0]_srl4_i_1 
       (.I0(m_axi_awready),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\FSM_sequential_state_reg[1]_0 ),
        .I4(cnt_read[1]),
        .I5(cnt_read[0]),
        .O(M00_AXI_0_awready));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    next_pending_r_i_3
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(M00_AXI_0_awready),
        .O(next));
  LUT6 #(
    .INIT(64'hEFEFCFCFEFE0C0C0)) 
    s_axburst_eq0_i_1
       (.I0(s_axburst_eq0_reg_0),
        .I1(s_axburst_eq0_i_2_n_0),
        .I2(s_axburst_eq0_i_3_n_0),
        .I3(s_axburst_eq0_reg),
        .I4(next),
        .I5(s_axburst_eq0_i_4_n_0),
        .O(\axlen_cnt_reg[2] ));
  LUT6 #(
    .INIT(64'hAAAAEBEFAAAAAAAA)) 
    s_axburst_eq0_i_2
       (.I0(s_axburst_eq1_reg),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(si_rs_awvalid),
        .I4(M00_AXI_0_awready),
        .I5(next_pending_r_0),
        .O(s_axburst_eq0_i_2_n_0));
  LUT6 #(
    .INIT(64'h00000000A2A2AAA2)) 
    s_axburst_eq0_i_3
       (.I0(\axaddr_offset_r_reg[3]_0 [12]),
        .I1(sel_first_reg_2),
        .I2(M00_AXI_0_awready),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(s_axburst_eq0_i_5_n_0),
        .O(s_axburst_eq0_i_3_n_0));
  LUT6 #(
    .INIT(64'hAAAAEBEFAAAAAAAA)) 
    s_axburst_eq0_i_4
       (.I0(s_axburst_eq1_reg),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(si_rs_awvalid),
        .I4(M00_AXI_0_awready),
        .I5(next_pending_r),
        .O(s_axburst_eq0_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT4 #(
    .INIT(16'hAEAA)) 
    s_axburst_eq0_i_5
       (.I0(areset_d1),
        .I1(si_rs_awvalid),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(s_axburst_eq0_i_5_n_0));
  LUT6 #(
    .INIT(64'hEFEFCFCFEFE0C0C0)) 
    s_axburst_eq1_i_1
       (.I0(s_axburst_eq0_reg_0),
        .I1(s_axburst_eq0_i_2_n_0),
        .I2(s_axburst_eq1_i_2_n_0),
        .I3(s_axburst_eq0_reg),
        .I4(next),
        .I5(s_axburst_eq0_i_4_n_0),
        .O(\axlen_cnt_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAEAEAAAE)) 
    s_axburst_eq1_i_2
       (.I0(\axaddr_offset_r_reg[3]_0 [12]),
        .I1(sel_first_reg_2),
        .I2(M00_AXI_0_awready),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(s_axburst_eq0_i_5_n_0),
        .O(s_axburst_eq1_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF44F44444)) 
    sel_first_i_1
       (.I0(next),
        .I1(sel_first),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(si_rs_awvalid),
        .I5(areset_d1),
        .O(sel_first_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFF44F44444)) 
    sel_first_i_1__0
       (.I0(next),
        .I1(sel_first_reg_1),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(si_rs_awvalid),
        .I5(areset_d1),
        .O(sel_first_reg_0));
  LUT6 #(
    .INIT(64'hCCECFCFFCCECCCEC)) 
    sel_first_i_1__1
       (.I0(si_rs_awvalid),
        .I1(areset_d1),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(M00_AXI_0_awready),
        .I5(sel_first_reg_2),
        .O(sel_first_i));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \wrap_boundary_axaddr_r[11]_i_1 
       (.I0(si_rs_awvalid),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(m_valid_i_reg));
  LUT6 #(
    .INIT(64'h33833333CC8CCCCC)) 
    \wrap_cnt_r[0]_i_1 
       (.I0(axaddr_offset[0]),
        .I1(\wrap_cnt_r[2]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(si_rs_awvalid),
        .I5(\wrap_second_len_r_reg[3]_0 [0]),
        .O(D[0]));
  LUT5 #(
    .INIT(32'h3CCCA0A0)) 
    \wrap_cnt_r[1]_i_1 
       (.I0(axaddr_offset[1]),
        .I1(\wrap_second_len_r_reg[3]_0 [1]),
        .I2(\wrap_cnt_r[2]_i_2_n_0 ),
        .I3(\wrap_second_len_r_reg[3]_0 [0]),
        .I4(\FSM_sequential_state_reg[0]_2 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h59A9AAAAAAAAAAAA)) 
    \wrap_cnt_r[2]_i_1 
       (.I0(\wrap_second_len_r_reg[3] [2]),
        .I1(axaddr_offset[0]),
        .I2(\FSM_sequential_state_reg[0]_2 ),
        .I3(\wrap_second_len_r_reg[3]_0 [0]),
        .I4(\wrap_cnt_r[2]_i_2_n_0 ),
        .I5(\wrap_second_len_r_reg[3] [1]),
        .O(D[2]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wrap_cnt_r[2]_i_2 
       (.I0(axaddr_offset[1]),
        .I1(\wrap_second_len_r_reg[0] ),
        .I2(axaddr_offset[0]),
        .I3(axaddr_offset[2]),
        .O(\wrap_cnt_r[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hA6AA)) 
    \wrap_cnt_r[3]_i_1 
       (.I0(\wrap_second_len_r_reg[3] [3]),
        .I1(\wrap_second_len_r_reg[3] [1]),
        .I2(\wrap_cnt_r[3]_i_2_n_0 ),
        .I3(\wrap_second_len_r_reg[3] [2]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h772277227722772F)) 
    \wrap_cnt_r[3]_i_2 
       (.I0(\FSM_sequential_state_reg[0]_2 ),
        .I1(\wrap_second_len_r_reg[3]_0 [0]),
        .I2(axaddr_offset[2]),
        .I3(axaddr_offset[0]),
        .I4(\wrap_second_len_r_reg[0] ),
        .I5(axaddr_offset[1]),
        .O(\wrap_cnt_r[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88BB88BB88BB88B8)) 
    \wrap_second_len_r[0]_i_1 
       (.I0(\wrap_second_len_r_reg[3]_0 [0]),
        .I1(\FSM_sequential_state_reg[0]_2 ),
        .I2(axaddr_offset[2]),
        .I3(axaddr_offset[0]),
        .I4(\wrap_second_len_r_reg[0] ),
        .I5(axaddr_offset[1]),
        .O(\wrap_second_len_r_reg[3] [0]));
  LUT6 #(
    .INIT(64'hBB88BB8888BB88B8)) 
    \wrap_second_len_r[1]_i_1 
       (.I0(\wrap_second_len_r_reg[3]_0 [1]),
        .I1(\FSM_sequential_state_reg[0]_2 ),
        .I2(axaddr_offset[2]),
        .I3(axaddr_offset[0]),
        .I4(\wrap_second_len_r_reg[0] ),
        .I5(axaddr_offset[1]),
        .O(\wrap_second_len_r_reg[3] [1]));
  LUT6 #(
    .INIT(64'hBBBB8888BB8888B8)) 
    \wrap_second_len_r[2]_i_1 
       (.I0(\wrap_second_len_r_reg[3]_0 [2]),
        .I1(\FSM_sequential_state_reg[0]_2 ),
        .I2(axaddr_offset[2]),
        .I3(axaddr_offset[0]),
        .I4(\wrap_second_len_r_reg[0] ),
        .I5(axaddr_offset[1]),
        .O(\wrap_second_len_r_reg[3] [2]));
  LUT6 #(
    .INIT(64'hFFFFFFF888888888)) 
    \wrap_second_len_r[3]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_2 ),
        .I1(\wrap_second_len_r_reg[3]_0 [3]),
        .I2(axaddr_offset[0]),
        .I3(axaddr_offset[1]),
        .I4(\wrap_second_len_r_reg[0] ),
        .I5(\wrap_second_len_r_reg[3]_1 ),
        .O(\wrap_second_len_r_reg[3] [3]));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_wrap_cmd" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd
   (next_pending_r_0,
    sel_first,
    \axlen_cnt_reg[2]_0 ,
    axaddr_wrap0,
    \axaddr_wrap_reg[11]_0 ,
    \axlen_cnt_reg[0]_0 ,
    \axaddr_offset_r_reg[3]_0 ,
    \wrap_second_len_r_reg[3]_0 ,
    \wrap_boundary_axaddr_r_reg[11]_0 ,
    aclk,
    sel_first_reg_0,
    \axlen_cnt_reg[3]_0 ,
    Q,
    si_rs_awvalid,
    \axaddr_wrap_reg[3]_0 ,
    \axlen_cnt_reg[3]_1 ,
    next,
    \axaddr_wrap_reg[0]_0 ,
    next_pending_r_reg_0,
    D,
    \wrap_second_len_r_reg[3]_1 ,
    \wrap_cnt_r_reg[3]_0 ,
    E,
    \wrap_boundary_axaddr_r_reg[6]_0 ,
    \axaddr_wrap_reg[11]_1 );
  output next_pending_r_0;
  output sel_first;
  output \axlen_cnt_reg[2]_0 ;
  output [11:0]axaddr_wrap0;
  output [11:0]\axaddr_wrap_reg[11]_0 ;
  output \axlen_cnt_reg[0]_0 ;
  output [3:0]\axaddr_offset_r_reg[3]_0 ;
  output [3:0]\wrap_second_len_r_reg[3]_0 ;
  output [11:0]\wrap_boundary_axaddr_r_reg[11]_0 ;
  input aclk;
  input sel_first_reg_0;
  input [8:0]\axlen_cnt_reg[3]_0 ;
  input [1:0]Q;
  input si_rs_awvalid;
  input [3:0]\axaddr_wrap_reg[3]_0 ;
  input \axlen_cnt_reg[3]_1 ;
  input next;
  input \axaddr_wrap_reg[0]_0 ;
  input next_pending_r_reg_0;
  input [3:0]D;
  input [3:0]\wrap_second_len_r_reg[3]_1 ;
  input [3:0]\wrap_cnt_r_reg[3]_0 ;
  input [0:0]E;
  input [6:0]\wrap_boundary_axaddr_r_reg[6]_0 ;
  input [11:0]\axaddr_wrap_reg[11]_1 ;

  wire [3:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire aclk;
  wire [3:0]\axaddr_offset_r_reg[3]_0 ;
  wire [11:0]axaddr_wrap0;
  wire \axaddr_wrap[11]_i_6_n_0 ;
  wire \axaddr_wrap_reg[0]_0 ;
  wire [11:0]\axaddr_wrap_reg[11]_0 ;
  wire [11:0]\axaddr_wrap_reg[11]_1 ;
  wire \axaddr_wrap_reg[11]_i_3_n_1 ;
  wire \axaddr_wrap_reg[11]_i_3_n_2 ;
  wire \axaddr_wrap_reg[11]_i_3_n_3 ;
  wire [3:0]\axaddr_wrap_reg[3]_0 ;
  wire \axaddr_wrap_reg[3]_i_2_n_0 ;
  wire \axaddr_wrap_reg[3]_i_2_n_1 ;
  wire \axaddr_wrap_reg[3]_i_2_n_2 ;
  wire \axaddr_wrap_reg[3]_i_2_n_3 ;
  wire \axaddr_wrap_reg[7]_i_2_n_0 ;
  wire \axaddr_wrap_reg[7]_i_2_n_1 ;
  wire \axaddr_wrap_reg[7]_i_2_n_2 ;
  wire \axaddr_wrap_reg[7]_i_2_n_3 ;
  wire \axlen_cnt[0]_i_1__0_n_0 ;
  wire \axlen_cnt[1]_i_1__0_n_0 ;
  wire \axlen_cnt[2]_i_1__0_n_0 ;
  wire \axlen_cnt[3]_i_1_n_0 ;
  wire \axlen_cnt[3]_i_3__0_n_0 ;
  wire \axlen_cnt[4]_i_1_n_0 ;
  wire \axlen_cnt_reg[0]_0 ;
  wire \axlen_cnt_reg[2]_0 ;
  wire [8:0]\axlen_cnt_reg[3]_0 ;
  wire \axlen_cnt_reg[3]_1 ;
  wire \axlen_cnt_reg_n_0_[0] ;
  wire \axlen_cnt_reg_n_0_[1] ;
  wire \axlen_cnt_reg_n_0_[2] ;
  wire \axlen_cnt_reg_n_0_[3] ;
  wire \axlen_cnt_reg_n_0_[4] ;
  wire next;
  wire next_pending_r_0;
  wire next_pending_r_reg_0;
  wire sel_first;
  wire sel_first_reg_0;
  wire si_rs_awvalid;
  wire [11:0]\wrap_boundary_axaddr_r_reg[11]_0 ;
  wire [6:0]\wrap_boundary_axaddr_r_reg[6]_0 ;
  wire [3:0]wrap_cnt_r;
  wire [3:0]\wrap_cnt_r_reg[3]_0 ;
  wire wrap_next_pending;
  wire [3:0]\wrap_second_len_r_reg[3]_0 ;
  wire [3:0]\wrap_second_len_r_reg[3]_1 ;
  wire [3:3]\NLW_axaddr_wrap_reg[11]_i_3_CO_UNCONNECTED ;

  FDRE \axaddr_offset_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[0]),
        .Q(\axaddr_offset_r_reg[3]_0 [0]),
        .R(1'b0));
  FDRE \axaddr_offset_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[1]),
        .Q(\axaddr_offset_r_reg[3]_0 [1]),
        .R(1'b0));
  FDRE \axaddr_offset_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[2]),
        .Q(\axaddr_offset_r_reg[3]_0 [2]),
        .R(1'b0));
  FDRE \axaddr_offset_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[3]),
        .Q(\axaddr_offset_r_reg[3]_0 [3]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0009)) 
    \axaddr_wrap[11]_i_5 
       (.I0(\axlen_cnt_reg_n_0_[0] ),
        .I1(wrap_cnt_r[0]),
        .I2(\axlen_cnt_reg_n_0_[4] ),
        .I3(\axaddr_wrap[11]_i_6_n_0 ),
        .O(\axlen_cnt_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \axaddr_wrap[11]_i_6 
       (.I0(wrap_cnt_r[1]),
        .I1(\axlen_cnt_reg_n_0_[1] ),
        .I2(\axlen_cnt_reg_n_0_[3] ),
        .I3(wrap_cnt_r[3]),
        .I4(\axlen_cnt_reg_n_0_[2] ),
        .I5(wrap_cnt_r[2]),
        .O(\axaddr_wrap[11]_i_6_n_0 ));
  FDRE \axaddr_wrap_reg[0] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [0]),
        .Q(\axaddr_wrap_reg[11]_0 [0]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[10] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [10]),
        .Q(\axaddr_wrap_reg[11]_0 [10]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[11] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [11]),
        .Q(\axaddr_wrap_reg[11]_0 [11]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_wrap_reg[11]_i_3 
       (.CI(\axaddr_wrap_reg[7]_i_2_n_0 ),
        .CO({\NLW_axaddr_wrap_reg[11]_i_3_CO_UNCONNECTED [3],\axaddr_wrap_reg[11]_i_3_n_1 ,\axaddr_wrap_reg[11]_i_3_n_2 ,\axaddr_wrap_reg[11]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(axaddr_wrap0[11:8]),
        .S(\axaddr_wrap_reg[11]_0 [11:8]));
  FDRE \axaddr_wrap_reg[1] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [1]),
        .Q(\axaddr_wrap_reg[11]_0 [1]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[2] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [2]),
        .Q(\axaddr_wrap_reg[11]_0 [2]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[3] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [3]),
        .Q(\axaddr_wrap_reg[11]_0 [3]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_wrap_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\axaddr_wrap_reg[3]_i_2_n_0 ,\axaddr_wrap_reg[3]_i_2_n_1 ,\axaddr_wrap_reg[3]_i_2_n_2 ,\axaddr_wrap_reg[3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(\axaddr_wrap_reg[11]_0 [3:0]),
        .O(axaddr_wrap0[3:0]),
        .S(\axaddr_wrap_reg[3]_0 ));
  FDRE \axaddr_wrap_reg[4] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [4]),
        .Q(\axaddr_wrap_reg[11]_0 [4]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[5] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [5]),
        .Q(\axaddr_wrap_reg[11]_0 [5]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[6] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [6]),
        .Q(\axaddr_wrap_reg[11]_0 [6]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[7] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [7]),
        .Q(\axaddr_wrap_reg[11]_0 [7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_wrap_reg[7]_i_2 
       (.CI(\axaddr_wrap_reg[3]_i_2_n_0 ),
        .CO({\axaddr_wrap_reg[7]_i_2_n_0 ,\axaddr_wrap_reg[7]_i_2_n_1 ,\axaddr_wrap_reg[7]_i_2_n_2 ,\axaddr_wrap_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(axaddr_wrap0[7:4]),
        .S(\axaddr_wrap_reg[11]_0 [7:4]));
  FDRE \axaddr_wrap_reg[8] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [8]),
        .Q(\axaddr_wrap_reg[11]_0 [8]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[9] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [9]),
        .Q(\axaddr_wrap_reg[11]_0 [9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h4444F44444444444)) 
    \axlen_cnt[0]_i_1__0 
       (.I0(\axlen_cnt_reg_n_0_[0] ),
        .I1(\axlen_cnt_reg[2]_0 ),
        .I2(\axlen_cnt_reg[3]_0 [5]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(si_rs_awvalid),
        .O(\axlen_cnt[0]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hF44F4444)) 
    \axlen_cnt[1]_i_1__0 
       (.I0(\axlen_cnt_reg[3]_1 ),
        .I1(\axlen_cnt_reg[3]_0 [6]),
        .I2(\axlen_cnt_reg_n_0_[1] ),
        .I3(\axlen_cnt_reg_n_0_[0] ),
        .I4(\axlen_cnt_reg[2]_0 ),
        .O(\axlen_cnt[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hF4F4F44F44444444)) 
    \axlen_cnt[2]_i_1__0 
       (.I0(\axlen_cnt_reg[3]_1 ),
        .I1(\axlen_cnt_reg[3]_0 [7]),
        .I2(\axlen_cnt_reg_n_0_[2] ),
        .I3(\axlen_cnt_reg_n_0_[0] ),
        .I4(\axlen_cnt_reg_n_0_[1] ),
        .I5(\axlen_cnt_reg[2]_0 ),
        .O(\axlen_cnt[2]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h0CFCAE0C)) 
    \axlen_cnt[3]_i_1 
       (.I0(\axlen_cnt_reg[2]_0 ),
        .I1(\axlen_cnt_reg[3]_0 [8]),
        .I2(\axlen_cnt_reg[3]_1 ),
        .I3(\axlen_cnt[3]_i_3__0_n_0 ),
        .I4(\axlen_cnt_reg_n_0_[3] ),
        .O(\axlen_cnt[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \axlen_cnt[3]_i_2__0 
       (.I0(\axlen_cnt_reg[3]_1 ),
        .I1(\axlen_cnt_reg_n_0_[2] ),
        .I2(\axlen_cnt_reg_n_0_[3] ),
        .I3(\axlen_cnt_reg_n_0_[1] ),
        .I4(\axlen_cnt_reg_n_0_[4] ),
        .O(\axlen_cnt_reg[2]_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \axlen_cnt[3]_i_3__0 
       (.I0(\axlen_cnt_reg_n_0_[0] ),
        .I1(\axlen_cnt_reg_n_0_[1] ),
        .I2(\axlen_cnt_reg_n_0_[2] ),
        .O(\axlen_cnt[3]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA800000000)) 
    \axlen_cnt[4]_i_1 
       (.I0(\axlen_cnt_reg[3]_1 ),
        .I1(\axlen_cnt_reg_n_0_[2] ),
        .I2(\axlen_cnt_reg_n_0_[1] ),
        .I3(\axlen_cnt_reg_n_0_[0] ),
        .I4(\axlen_cnt_reg_n_0_[3] ),
        .I5(\axlen_cnt_reg_n_0_[4] ),
        .O(\axlen_cnt[4]_i_1_n_0 ));
  FDRE \axlen_cnt_reg[0] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axlen_cnt[0]_i_1__0_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[1] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axlen_cnt[1]_i_1__0_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[2] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axlen_cnt[2]_i_1__0_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[3] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axlen_cnt[3]_i_1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[4] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axlen_cnt[4]_i_1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[4] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFFF88F8)) 
    next_pending_r_i_1__0
       (.I0(\axlen_cnt_reg[2]_0 ),
        .I1(next),
        .I2(next_pending_r_0),
        .I3(\axaddr_wrap_reg[0]_0 ),
        .I4(next_pending_r_reg_0),
        .O(wrap_next_pending));
  FDRE next_pending_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(wrap_next_pending),
        .Q(next_pending_r_0),
        .R(1'b0));
  FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_reg_0),
        .Q(sel_first),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [0]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [0]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt_reg[3]_0 [3]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [10]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt_reg[3]_0 [4]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [11]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [1]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [1]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [2]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [2]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [3]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [3]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [4]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [4]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [5]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [5]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [6]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [6]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt_reg[3]_0 [0]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [7]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt_reg[3]_0 [1]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [8]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt_reg[3]_0 [2]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [9]),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_cnt_r_reg[3]_0 [0]),
        .Q(wrap_cnt_r[0]),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_cnt_r_reg[3]_0 [1]),
        .Q(wrap_cnt_r[1]),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_cnt_r_reg[3]_0 [2]),
        .Q(wrap_cnt_r[2]),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_cnt_r_reg[3]_0 [3]),
        .Q(wrap_cnt_r[3]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [0]),
        .Q(\wrap_second_len_r_reg[3]_0 [0]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [1]),
        .Q(\wrap_second_len_r_reg[3]_0 [1]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [2]),
        .Q(\wrap_second_len_r_reg[3]_0 [2]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [3]),
        .Q(\wrap_second_len_r_reg[3]_0 [3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_22_b2s_wrap_cmd" *) 
module dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd_3
   (sel_first_reg_0,
    \axaddr_wrap_reg[3]_0 ,
    \axaddr_wrap_reg[11]_0 ,
    \axaddr_wrap_reg[7]_0 ,
    O,
    \m_payload_i_reg[39] ,
    \m_payload_i_reg[39]_0 ,
    \axlen_cnt_reg[0]_0 ,
    \axaddr_offset_r_reg[3]_0 ,
    \wrap_second_len_r_reg[3]_0 ,
    \wrap_boundary_axaddr_r_reg[11]_0 ,
    aclk,
    sel_first_reg_1,
    \axlen_cnt_reg[3]_0 ,
    Q,
    si_rs_arvalid,
    S,
    \axlen_cnt_reg[3]_1 ,
    sel_first_i,
    incr_next_pending,
    \axaddr_wrap_reg[0]_0 ,
    next_pending_r_reg_0,
    D,
    \wrap_second_len_r_reg[3]_1 ,
    \wrap_cnt_r_reg[3]_0 ,
    E,
    \wrap_boundary_axaddr_r_reg[6]_0 ,
    \axaddr_wrap_reg[11]_1 );
  output sel_first_reg_0;
  output [3:0]\axaddr_wrap_reg[3]_0 ;
  output [11:0]\axaddr_wrap_reg[11]_0 ;
  output [3:0]\axaddr_wrap_reg[7]_0 ;
  output [3:0]O;
  output \m_payload_i_reg[39] ;
  output \m_payload_i_reg[39]_0 ;
  output \axlen_cnt_reg[0]_0 ;
  output [3:0]\axaddr_offset_r_reg[3]_0 ;
  output [3:0]\wrap_second_len_r_reg[3]_0 ;
  output [11:0]\wrap_boundary_axaddr_r_reg[11]_0 ;
  input aclk;
  input sel_first_reg_1;
  input [9:0]\axlen_cnt_reg[3]_0 ;
  input [0:0]Q;
  input si_rs_arvalid;
  input [3:0]S;
  input \axlen_cnt_reg[3]_1 ;
  input sel_first_i;
  input incr_next_pending;
  input \axaddr_wrap_reg[0]_0 ;
  input next_pending_r_reg_0;
  input [3:0]D;
  input [3:0]\wrap_second_len_r_reg[3]_1 ;
  input [3:0]\wrap_cnt_r_reg[3]_0 ;
  input [0:0]E;
  input [6:0]\wrap_boundary_axaddr_r_reg[6]_0 ;
  input [11:0]\axaddr_wrap_reg[11]_1 ;

  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]O;
  wire [0:0]Q;
  wire [3:0]S;
  wire aclk;
  wire [3:0]\axaddr_offset_r_reg[3]_0 ;
  wire \axaddr_wrap[11]_i_6__0_n_0 ;
  wire \axaddr_wrap_reg[0]_0 ;
  wire [11:0]\axaddr_wrap_reg[11]_0 ;
  wire [11:0]\axaddr_wrap_reg[11]_1 ;
  wire \axaddr_wrap_reg[11]_i_3__0_n_1 ;
  wire \axaddr_wrap_reg[11]_i_3__0_n_2 ;
  wire \axaddr_wrap_reg[11]_i_3__0_n_3 ;
  wire [3:0]\axaddr_wrap_reg[3]_0 ;
  wire \axaddr_wrap_reg[3]_i_2__0_n_0 ;
  wire \axaddr_wrap_reg[3]_i_2__0_n_1 ;
  wire \axaddr_wrap_reg[3]_i_2__0_n_2 ;
  wire \axaddr_wrap_reg[3]_i_2__0_n_3 ;
  wire [3:0]\axaddr_wrap_reg[7]_0 ;
  wire \axaddr_wrap_reg[7]_i_2__0_n_0 ;
  wire \axaddr_wrap_reg[7]_i_2__0_n_1 ;
  wire \axaddr_wrap_reg[7]_i_2__0_n_2 ;
  wire \axaddr_wrap_reg[7]_i_2__0_n_3 ;
  wire \axlen_cnt[0]_i_1__2_n_0 ;
  wire \axlen_cnt[1]_i_1__2_n_0 ;
  wire \axlen_cnt[2]_i_1__2_n_0 ;
  wire \axlen_cnt[3]_i_1__1_n_0 ;
  wire \axlen_cnt[3]_i_2__2_n_0 ;
  wire \axlen_cnt[3]_i_3__1_n_0 ;
  wire \axlen_cnt[4]_i_1__0_n_0 ;
  wire \axlen_cnt_reg[0]_0 ;
  wire [9:0]\axlen_cnt_reg[3]_0 ;
  wire \axlen_cnt_reg[3]_1 ;
  wire \axlen_cnt_reg_n_0_[0] ;
  wire \axlen_cnt_reg_n_0_[1] ;
  wire \axlen_cnt_reg_n_0_[2] ;
  wire \axlen_cnt_reg_n_0_[3] ;
  wire \axlen_cnt_reg_n_0_[4] ;
  wire incr_next_pending;
  wire \m_payload_i_reg[39] ;
  wire \m_payload_i_reg[39]_0 ;
  wire next_pending_r;
  wire next_pending_r_reg_0;
  wire sel_first_i;
  wire sel_first_reg_0;
  wire sel_first_reg_1;
  wire si_rs_arvalid;
  wire [11:0]\wrap_boundary_axaddr_r_reg[11]_0 ;
  wire [6:0]\wrap_boundary_axaddr_r_reg[6]_0 ;
  wire [3:0]\wrap_cnt_r_reg[3]_0 ;
  wire \wrap_cnt_r_reg_n_0_[0] ;
  wire \wrap_cnt_r_reg_n_0_[1] ;
  wire \wrap_cnt_r_reg_n_0_[2] ;
  wire \wrap_cnt_r_reg_n_0_[3] ;
  wire wrap_next_pending;
  wire [3:0]\wrap_second_len_r_reg[3]_0 ;
  wire [3:0]\wrap_second_len_r_reg[3]_1 ;
  wire [3:3]\NLW_axaddr_wrap_reg[11]_i_3__0_CO_UNCONNECTED ;

  FDRE \axaddr_offset_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[0]),
        .Q(\axaddr_offset_r_reg[3]_0 [0]),
        .R(1'b0));
  FDRE \axaddr_offset_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[1]),
        .Q(\axaddr_offset_r_reg[3]_0 [1]),
        .R(1'b0));
  FDRE \axaddr_offset_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[2]),
        .Q(\axaddr_offset_r_reg[3]_0 [2]),
        .R(1'b0));
  FDRE \axaddr_offset_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(D[3]),
        .Q(\axaddr_offset_r_reg[3]_0 [3]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0009)) 
    \axaddr_wrap[11]_i_5__0 
       (.I0(\axlen_cnt_reg_n_0_[0] ),
        .I1(\wrap_cnt_r_reg_n_0_[0] ),
        .I2(\axlen_cnt_reg_n_0_[4] ),
        .I3(\axaddr_wrap[11]_i_6__0_n_0 ),
        .O(\axlen_cnt_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \axaddr_wrap[11]_i_6__0 
       (.I0(\wrap_cnt_r_reg_n_0_[1] ),
        .I1(\axlen_cnt_reg_n_0_[1] ),
        .I2(\axlen_cnt_reg_n_0_[3] ),
        .I3(\wrap_cnt_r_reg_n_0_[3] ),
        .I4(\axlen_cnt_reg_n_0_[2] ),
        .I5(\wrap_cnt_r_reg_n_0_[2] ),
        .O(\axaddr_wrap[11]_i_6__0_n_0 ));
  FDRE \axaddr_wrap_reg[0] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [0]),
        .Q(\axaddr_wrap_reg[11]_0 [0]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[10] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [10]),
        .Q(\axaddr_wrap_reg[11]_0 [10]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[11] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [11]),
        .Q(\axaddr_wrap_reg[11]_0 [11]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_wrap_reg[11]_i_3__0 
       (.CI(\axaddr_wrap_reg[7]_i_2__0_n_0 ),
        .CO({\NLW_axaddr_wrap_reg[11]_i_3__0_CO_UNCONNECTED [3],\axaddr_wrap_reg[11]_i_3__0_n_1 ,\axaddr_wrap_reg[11]_i_3__0_n_2 ,\axaddr_wrap_reg[11]_i_3__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(O),
        .S(\axaddr_wrap_reg[11]_0 [11:8]));
  FDRE \axaddr_wrap_reg[1] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [1]),
        .Q(\axaddr_wrap_reg[11]_0 [1]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[2] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [2]),
        .Q(\axaddr_wrap_reg[11]_0 [2]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[3] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [3]),
        .Q(\axaddr_wrap_reg[11]_0 [3]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_wrap_reg[3]_i_2__0 
       (.CI(1'b0),
        .CO({\axaddr_wrap_reg[3]_i_2__0_n_0 ,\axaddr_wrap_reg[3]_i_2__0_n_1 ,\axaddr_wrap_reg[3]_i_2__0_n_2 ,\axaddr_wrap_reg[3]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI(\axaddr_wrap_reg[11]_0 [3:0]),
        .O(\axaddr_wrap_reg[3]_0 ),
        .S(S));
  FDRE \axaddr_wrap_reg[4] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [4]),
        .Q(\axaddr_wrap_reg[11]_0 [4]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[5] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [5]),
        .Q(\axaddr_wrap_reg[11]_0 [5]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[6] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [6]),
        .Q(\axaddr_wrap_reg[11]_0 [6]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[7] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [7]),
        .Q(\axaddr_wrap_reg[11]_0 [7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_wrap_reg[7]_i_2__0 
       (.CI(\axaddr_wrap_reg[3]_i_2__0_n_0 ),
        .CO({\axaddr_wrap_reg[7]_i_2__0_n_0 ,\axaddr_wrap_reg[7]_i_2__0_n_1 ,\axaddr_wrap_reg[7]_i_2__0_n_2 ,\axaddr_wrap_reg[7]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\axaddr_wrap_reg[7]_0 ),
        .S(\axaddr_wrap_reg[11]_0 [7:4]));
  FDRE \axaddr_wrap_reg[8] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [8]),
        .Q(\axaddr_wrap_reg[11]_0 [8]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[9] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axaddr_wrap_reg[11]_1 [9]),
        .Q(\axaddr_wrap_reg[11]_0 [9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h44F44444)) 
    \axlen_cnt[0]_i_1__2 
       (.I0(\axlen_cnt_reg_n_0_[0] ),
        .I1(\axlen_cnt[3]_i_2__2_n_0 ),
        .I2(\axlen_cnt_reg[3]_0 [6]),
        .I3(Q),
        .I4(si_rs_arvalid),
        .O(\axlen_cnt[0]_i_1__2_n_0 ));
  LUT5 #(
    .INIT(32'hF44F4444)) 
    \axlen_cnt[1]_i_1__2 
       (.I0(\axlen_cnt_reg[3]_1 ),
        .I1(\axlen_cnt_reg[3]_0 [7]),
        .I2(\axlen_cnt_reg_n_0_[1] ),
        .I3(\axlen_cnt_reg_n_0_[0] ),
        .I4(\axlen_cnt[3]_i_2__2_n_0 ),
        .O(\axlen_cnt[1]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'hF4F4F44F44444444)) 
    \axlen_cnt[2]_i_1__2 
       (.I0(\axlen_cnt_reg[3]_1 ),
        .I1(\axlen_cnt_reg[3]_0 [8]),
        .I2(\axlen_cnt_reg_n_0_[2] ),
        .I3(\axlen_cnt_reg_n_0_[0] ),
        .I4(\axlen_cnt_reg_n_0_[1] ),
        .I5(\axlen_cnt[3]_i_2__2_n_0 ),
        .O(\axlen_cnt[2]_i_1__2_n_0 ));
  LUT5 #(
    .INIT(32'h0CFCAE0C)) 
    \axlen_cnt[3]_i_1__1 
       (.I0(\axlen_cnt[3]_i_2__2_n_0 ),
        .I1(\axlen_cnt_reg[3]_0 [9]),
        .I2(\axlen_cnt_reg[3]_1 ),
        .I3(\axlen_cnt[3]_i_3__1_n_0 ),
        .I4(\axlen_cnt_reg_n_0_[3] ),
        .O(\axlen_cnt[3]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \axlen_cnt[3]_i_2__2 
       (.I0(\axlen_cnt_reg[3]_1 ),
        .I1(\axlen_cnt_reg_n_0_[2] ),
        .I2(\axlen_cnt_reg_n_0_[3] ),
        .I3(\axlen_cnt_reg_n_0_[1] ),
        .I4(\axlen_cnt_reg_n_0_[4] ),
        .O(\axlen_cnt[3]_i_2__2_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \axlen_cnt[3]_i_3__1 
       (.I0(\axlen_cnt_reg_n_0_[0] ),
        .I1(\axlen_cnt_reg_n_0_[1] ),
        .I2(\axlen_cnt_reg_n_0_[2] ),
        .O(\axlen_cnt[3]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA800000000)) 
    \axlen_cnt[4]_i_1__0 
       (.I0(\axlen_cnt_reg[3]_1 ),
        .I1(\axlen_cnt_reg_n_0_[2] ),
        .I2(\axlen_cnt_reg_n_0_[1] ),
        .I3(\axlen_cnt_reg_n_0_[0] ),
        .I4(\axlen_cnt_reg_n_0_[3] ),
        .I5(\axlen_cnt_reg_n_0_[4] ),
        .O(\axlen_cnt[4]_i_1__0_n_0 ));
  FDRE \axlen_cnt_reg[0] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axlen_cnt[0]_i_1__2_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[1] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axlen_cnt[1]_i_1__2_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[2] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axlen_cnt[2]_i_1__2_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[3] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axlen_cnt[3]_i_1__1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[4] 
       (.C(aclk),
        .CE(\axaddr_wrap_reg[0]_0 ),
        .D(\axlen_cnt[4]_i_1__0_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[4] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFFAC)) 
    next_pending_r_i_1__2
       (.I0(\axlen_cnt[3]_i_2__2_n_0 ),
        .I1(next_pending_r),
        .I2(\axaddr_wrap_reg[0]_0 ),
        .I3(next_pending_r_reg_0),
        .O(wrap_next_pending));
  FDRE next_pending_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(wrap_next_pending),
        .Q(next_pending_r),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    s_axburst_eq0_i_1__0
       (.I0(wrap_next_pending),
        .I1(\axlen_cnt_reg[3]_0 [5]),
        .I2(sel_first_i),
        .I3(incr_next_pending),
        .O(\m_payload_i_reg[39] ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hABA8)) 
    s_axburst_eq1_i_1__0
       (.I0(wrap_next_pending),
        .I1(\axlen_cnt_reg[3]_0 [5]),
        .I2(sel_first_i),
        .I3(incr_next_pending),
        .O(\m_payload_i_reg[39]_0 ));
  FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_reg_1),
        .Q(sel_first_reg_0),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [0]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [0]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt_reg[3]_0 [3]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [10]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt_reg[3]_0 [4]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [11]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [1]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [1]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [2]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [2]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [3]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [3]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [4]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [4]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [5]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [5]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(\wrap_boundary_axaddr_r_reg[6]_0 [6]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [6]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt_reg[3]_0 [0]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [7]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt_reg[3]_0 [1]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [8]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt_reg[3]_0 [2]),
        .Q(\wrap_boundary_axaddr_r_reg[11]_0 [9]),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_cnt_r_reg[3]_0 [0]),
        .Q(\wrap_cnt_r_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_cnt_r_reg[3]_0 [1]),
        .Q(\wrap_cnt_r_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_cnt_r_reg[3]_0 [2]),
        .Q(\wrap_cnt_r_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_cnt_r_reg[3]_0 [3]),
        .Q(\wrap_cnt_r_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [0]),
        .Q(\wrap_second_len_r_reg[3]_0 [0]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [1]),
        .Q(\wrap_second_len_r_reg[3]_0 [1]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [2]),
        .Q(\wrap_second_len_r_reg[3]_0 [2]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [3]),
        .Q(\wrap_second_len_r_reg[3]_0 [3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_22_axi_register_slice" *) 
module dwa_ps_bd_axi_register_slice_v2_1_22_axi_register_slice
   (s_ready_i_reg,
    s_ready_i_reg_0,
    si_rs_awvalid,
    m_valid_i_reg,
    si_rs_bready,
    si_rs_arvalid,
    m_valid_i_reg_0,
    si_rs_rready,
    \axaddr_incr_reg[3] ,
    Q,
    S,
    \axaddr_incr_reg[3]_0 ,
    \m_payload_i_reg[61] ,
    \axaddr_wrap_reg[3] ,
    axaddr_incr,
    \m_payload_i_reg[3] ,
    \m_payload_i_reg[7] ,
    O,
    \m_payload_i_reg[45] ,
    \FSM_sequential_state_reg[0] ,
    \m_payload_i_reg[6] ,
    axaddr_offset,
    shandshake,
    \FSM_sequential_state_reg[1] ,
    \m_payload_i_reg[5] ,
    \m_payload_i_reg[45]_0 ,
    s_ready_i_reg_1,
    D,
    \m_payload_i_reg[4] ,
    \m_payload_i_reg[1] ,
    \m_payload_i_reg[2] ,
    \m_payload_i_reg[1]_0 ,
    \m_payload_i_reg[6]_0 ,
    \m_payload_i_reg[1]_1 ,
    \m_payload_i_reg[2]_0 ,
    \m_payload_i_reg[1]_2 ,
    \m_payload_i_reg[2]_1 ,
    m_axi_awaddr,
    m_axi_araddr,
    \m_payload_i_reg[13] ,
    \m_payload_i_reg[46] ,
    aclk,
    s_ready_i0,
    m_valid_i0,
    aresetn,
    m_valid_i_reg_1,
    s_axi_rready,
    \M00_AXI_0_araddr[11] ,
    \M00_AXI_0_araddr[11]_0 ,
    \M00_AXI_0_awaddr[11] ,
    \M00_AXI_0_awaddr[11]_0 ,
    b_push,
    s_axi_awvalid,
    \axaddr_incr_reg[3]_1 ,
    \axaddr_incr_reg[3]_2 ,
    next_pending_r_reg,
    \axaddr_offset_r_reg[2] ,
    \axaddr_offset_r_reg[2]_0 ,
    si_rs_bvalid,
    \wrap_second_len_r_reg[3] ,
    next_pending_r_reg_0,
    s_axi_bready,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awsize,
    s_axi_awprot,
    s_axi_awaddr,
    sel_first,
    sel_first_0,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arsize,
    s_axi_arprot,
    s_axi_araddr,
    \M00_AXI_0_araddr[11]_1 ,
    sel_first_1,
    out,
    \skid_buffer_reg[1] ,
    \skid_buffer_reg[46] ,
    \skid_buffer_reg[33] ,
    E,
    \m_payload_i_reg[0] );
  output s_ready_i_reg;
  output s_ready_i_reg_0;
  output si_rs_awvalid;
  output m_valid_i_reg;
  output si_rs_bready;
  output si_rs_arvalid;
  output m_valid_i_reg_0;
  output si_rs_rready;
  output [3:0]\axaddr_incr_reg[3] ;
  output [53:0]Q;
  output [3:0]S;
  output [3:0]\axaddr_incr_reg[3]_0 ;
  output [53:0]\m_payload_i_reg[61] ;
  output [3:0]\axaddr_wrap_reg[3] ;
  output [11:0]axaddr_incr;
  output [3:0]\m_payload_i_reg[3] ;
  output [3:0]\m_payload_i_reg[7] ;
  output [3:0]O;
  output \m_payload_i_reg[45] ;
  output \FSM_sequential_state_reg[0] ;
  output \m_payload_i_reg[6] ;
  output [0:0]axaddr_offset;
  output shandshake;
  output \FSM_sequential_state_reg[1] ;
  output \m_payload_i_reg[5] ;
  output \m_payload_i_reg[45]_0 ;
  output s_ready_i_reg_1;
  output [6:0]D;
  output \m_payload_i_reg[4] ;
  output \m_payload_i_reg[1] ;
  output \m_payload_i_reg[2] ;
  output \m_payload_i_reg[1]_0 ;
  output [6:0]\m_payload_i_reg[6]_0 ;
  output \m_payload_i_reg[1]_1 ;
  output \m_payload_i_reg[2]_0 ;
  output \m_payload_i_reg[1]_2 ;
  output \m_payload_i_reg[2]_1 ;
  output [11:0]m_axi_awaddr;
  output [11:0]m_axi_araddr;
  output [13:0]\m_payload_i_reg[13] ;
  output [46:0]\m_payload_i_reg[46] ;
  input aclk;
  input s_ready_i0;
  input m_valid_i0;
  input aresetn;
  input m_valid_i_reg_1;
  input s_axi_rready;
  input [11:0]\M00_AXI_0_araddr[11] ;
  input [11:0]\M00_AXI_0_araddr[11]_0 ;
  input [11:0]\M00_AXI_0_awaddr[11] ;
  input [11:0]\M00_AXI_0_awaddr[11]_0 ;
  input b_push;
  input s_axi_awvalid;
  input [3:0]\axaddr_incr_reg[3]_1 ;
  input [3:0]\axaddr_incr_reg[3]_2 ;
  input next_pending_r_reg;
  input [1:0]\axaddr_offset_r_reg[2] ;
  input [0:0]\axaddr_offset_r_reg[2]_0 ;
  input si_rs_bvalid;
  input [1:0]\wrap_second_len_r_reg[3] ;
  input next_pending_r_reg_0;
  input s_axi_bready;
  input [11:0]s_axi_awid;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awsize;
  input [2:0]s_axi_awprot;
  input [31:0]s_axi_awaddr;
  input sel_first;
  input sel_first_0;
  input [11:0]s_axi_arid;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arsize;
  input [2:0]s_axi_arprot;
  input [31:0]s_axi_araddr;
  input \M00_AXI_0_araddr[11]_1 ;
  input sel_first_1;
  input [11:0]out;
  input [1:0]\skid_buffer_reg[1] ;
  input [12:0]\skid_buffer_reg[46] ;
  input [33:0]\skid_buffer_reg[33] ;
  input [0:0]E;
  input [0:0]\m_payload_i_reg[0] ;

  wire [6:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state_reg[0] ;
  wire \FSM_sequential_state_reg[1] ;
  wire [11:0]\M00_AXI_0_araddr[11] ;
  wire [11:0]\M00_AXI_0_araddr[11]_0 ;
  wire \M00_AXI_0_araddr[11]_1 ;
  wire [11:0]\M00_AXI_0_awaddr[11] ;
  wire [11:0]\M00_AXI_0_awaddr[11]_0 ;
  wire [3:0]O;
  wire [53:0]Q;
  wire [3:0]S;
  wire aclk;
  wire \ar.ar_pipe_n_1 ;
  wire \ar.ar_pipe_n_104 ;
  wire aresetn;
  wire [11:0]axaddr_incr;
  wire [3:0]\axaddr_incr_reg[3] ;
  wire [3:0]\axaddr_incr_reg[3]_0 ;
  wire [3:0]\axaddr_incr_reg[3]_1 ;
  wire [3:0]\axaddr_incr_reg[3]_2 ;
  wire [0:0]axaddr_offset;
  wire [1:0]\axaddr_offset_r_reg[2] ;
  wire [0:0]\axaddr_offset_r_reg[2]_0 ;
  wire [3:0]\axaddr_wrap_reg[3] ;
  wire b_push;
  wire [11:0]m_axi_araddr;
  wire [11:0]m_axi_awaddr;
  wire [0:0]\m_payload_i_reg[0] ;
  wire [13:0]\m_payload_i_reg[13] ;
  wire \m_payload_i_reg[1] ;
  wire \m_payload_i_reg[1]_0 ;
  wire \m_payload_i_reg[1]_1 ;
  wire \m_payload_i_reg[1]_2 ;
  wire \m_payload_i_reg[2] ;
  wire \m_payload_i_reg[2]_0 ;
  wire \m_payload_i_reg[2]_1 ;
  wire [3:0]\m_payload_i_reg[3] ;
  wire \m_payload_i_reg[45] ;
  wire \m_payload_i_reg[45]_0 ;
  wire [46:0]\m_payload_i_reg[46] ;
  wire \m_payload_i_reg[4] ;
  wire \m_payload_i_reg[5] ;
  wire [53:0]\m_payload_i_reg[61] ;
  wire \m_payload_i_reg[6] ;
  wire [6:0]\m_payload_i_reg[6]_0 ;
  wire [3:0]\m_payload_i_reg[7] ;
  wire m_valid_i0;
  wire m_valid_i_reg;
  wire m_valid_i_reg_0;
  wire m_valid_i_reg_1;
  wire next_pending_r_reg;
  wire next_pending_r_reg_0;
  wire [11:0]out;
  wire \r.r_pipe_n_1 ;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [11:0]s_axi_arid;
  wire [3:0]s_axi_arlen;
  wire [2:0]s_axi_arprot;
  wire [1:0]s_axi_arsize;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [11:0]s_axi_awid;
  wire [3:0]s_axi_awlen;
  wire [2:0]s_axi_awprot;
  wire [1:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_rready;
  wire s_ready_i0;
  wire s_ready_i_reg;
  wire s_ready_i_reg_0;
  wire s_ready_i_reg_1;
  wire sel_first;
  wire sel_first_0;
  wire sel_first_1;
  wire shandshake;
  wire si_rs_arvalid;
  wire si_rs_awvalid;
  wire si_rs_bready;
  wire si_rs_bvalid;
  wire si_rs_rready;
  wire [1:0]\skid_buffer_reg[1] ;
  wire [33:0]\skid_buffer_reg[33] ;
  wire [12:0]\skid_buffer_reg[46] ;
  wire [1:0]\wrap_second_len_r_reg[3] ;

  dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice \ar.ar_pipe 
       (.D(D),
        .\FSM_sequential_state_reg[1] (\FSM_sequential_state_reg[1] ),
        .\M00_AXI_0_araddr[11] (\M00_AXI_0_araddr[11] ),
        .\M00_AXI_0_araddr[11]_0 (\M00_AXI_0_araddr[11]_0 ),
        .\M00_AXI_0_araddr[11]_1 (\M00_AXI_0_araddr[11]_1 ),
        .O(O),
        .Q(Q),
        .S(S),
        .aclk(aclk),
        .aresetn(aresetn),
        .\aresetn_d_reg[0]_0 (\ar.ar_pipe_n_1 ),
        .\aresetn_d_reg[0]_1 (\ar.ar_pipe_n_104 ),
        .\axaddr_incr_reg[3] (\axaddr_incr_reg[3] ),
        .\axaddr_incr_reg[3]_0 (\axaddr_incr_reg[3]_2 ),
        .m_axi_araddr(m_axi_araddr),
        .\m_payload_i_reg[0]_0 (\m_payload_i_reg[0] ),
        .\m_payload_i_reg[1]_0 (\m_payload_i_reg[1] ),
        .\m_payload_i_reg[1]_1 (\m_payload_i_reg[1]_0 ),
        .\m_payload_i_reg[2]_0 (\m_payload_i_reg[2] ),
        .\m_payload_i_reg[2]_1 (\m_payload_i_reg[2]_0 ),
        .\m_payload_i_reg[3]_0 (\m_payload_i_reg[3] ),
        .\m_payload_i_reg[45]_0 (\m_payload_i_reg[45]_0 ),
        .\m_payload_i_reg[4]_0 (\m_payload_i_reg[4] ),
        .\m_payload_i_reg[5]_0 (\m_payload_i_reg[5] ),
        .\m_payload_i_reg[7]_0 (\m_payload_i_reg[7] ),
        .m_valid_i0(m_valid_i0),
        .m_valid_i_reg_0(\r.r_pipe_n_1 ),
        .next_pending_r_reg(next_pending_r_reg_0),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arsize(s_axi_arsize),
        .s_ready_i0(s_ready_i0),
        .s_ready_i_reg_0(s_ready_i_reg_0),
        .sel_first_1(sel_first_1),
        .si_rs_arvalid(si_rs_arvalid),
        .\wrap_second_len_r_reg[3] (\wrap_second_len_r_reg[3] ));
  dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice_0 \aw.aw_pipe 
       (.E(E),
        .\FSM_sequential_state_reg[0] (\FSM_sequential_state_reg[0] ),
        .\M00_AXI_0_awaddr[11] (\M00_AXI_0_awaddr[11] ),
        .\M00_AXI_0_awaddr[11]_0 (\M00_AXI_0_awaddr[11]_0 ),
        .Q(\m_payload_i_reg[61] ),
        .aclk(aclk),
        .axaddr_incr(axaddr_incr),
        .\axaddr_incr_reg[3] (\axaddr_incr_reg[3]_0 ),
        .\axaddr_incr_reg[3]_0 (\axaddr_incr_reg[3]_1 ),
        .axaddr_offset(axaddr_offset),
        .\axaddr_offset_r_reg[2] (\axaddr_offset_r_reg[2] ),
        .\axaddr_offset_r_reg[2]_0 (\axaddr_offset_r_reg[2]_0 ),
        .\axaddr_wrap_reg[3] (\axaddr_wrap_reg[3] ),
        .b_push(b_push),
        .m_axi_awaddr(m_axi_awaddr),
        .\m_payload_i_reg[1]_0 (\m_payload_i_reg[1]_1 ),
        .\m_payload_i_reg[1]_1 (\m_payload_i_reg[1]_2 ),
        .\m_payload_i_reg[2]_0 (\m_payload_i_reg[2]_1 ),
        .\m_payload_i_reg[45]_0 (\m_payload_i_reg[45] ),
        .\m_payload_i_reg[6]_0 (\m_payload_i_reg[6] ),
        .\m_payload_i_reg[6]_1 (\m_payload_i_reg[6]_0 ),
        .m_valid_i_reg_0(si_rs_awvalid),
        .m_valid_i_reg_1(\r.r_pipe_n_1 ),
        .next_pending_r_reg(next_pending_r_reg),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_ready_i_reg_0(s_ready_i_reg),
        .s_ready_i_reg_1(\ar.ar_pipe_n_1 ),
        .sel_first(sel_first),
        .sel_first_0(sel_first_0));
  dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized1 \b.b_pipe 
       (.aclk(aclk),
        .\m_payload_i_reg[13]_0 (\m_payload_i_reg[13] ),
        .m_valid_i_reg_0(m_valid_i_reg),
        .m_valid_i_reg_1(\r.r_pipe_n_1 ),
        .out(out),
        .s_axi_bready(s_axi_bready),
        .s_ready_i_reg_0(si_rs_bready),
        .s_ready_i_reg_1(\ar.ar_pipe_n_1 ),
        .shandshake(shandshake),
        .si_rs_bvalid(si_rs_bvalid),
        .\skid_buffer_reg[1]_0 (\skid_buffer_reg[1] ));
  dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized2 \r.r_pipe 
       (.aclk(aclk),
        .\aresetn_d_reg[1]_inv_0 (\r.r_pipe_n_1 ),
        .\aresetn_d_reg[1]_inv_1 (\ar.ar_pipe_n_104 ),
        .\m_payload_i_reg[46]_0 (\m_payload_i_reg[46] ),
        .m_valid_i_reg_0(m_valid_i_reg_0),
        .m_valid_i_reg_1(m_valid_i_reg_1),
        .s_axi_rready(s_axi_rready),
        .s_ready_i_reg_0(si_rs_rready),
        .s_ready_i_reg_1(s_ready_i_reg_1),
        .s_ready_i_reg_2(\ar.ar_pipe_n_1 ),
        .\skid_buffer_reg[33]_0 (\skid_buffer_reg[33] ),
        .\skid_buffer_reg[46]_0 (\skid_buffer_reg[46] ));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_22_axic_register_slice" *) 
module dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice
   (s_ready_i_reg_0,
    \aresetn_d_reg[0]_0 ,
    si_rs_arvalid,
    \axaddr_incr_reg[3] ,
    Q,
    S,
    \m_payload_i_reg[3]_0 ,
    \m_payload_i_reg[7]_0 ,
    O,
    \FSM_sequential_state_reg[1] ,
    \m_payload_i_reg[5]_0 ,
    \m_payload_i_reg[45]_0 ,
    D,
    \m_payload_i_reg[4]_0 ,
    \m_payload_i_reg[1]_0 ,
    \m_payload_i_reg[2]_0 ,
    \m_payload_i_reg[1]_1 ,
    \m_payload_i_reg[2]_1 ,
    m_axi_araddr,
    \aresetn_d_reg[0]_1 ,
    s_ready_i0,
    aclk,
    m_valid_i_reg_0,
    m_valid_i0,
    aresetn,
    \M00_AXI_0_araddr[11] ,
    \M00_AXI_0_araddr[11]_0 ,
    \axaddr_incr_reg[3]_0 ,
    \wrap_second_len_r_reg[3] ,
    next_pending_r_reg,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arsize,
    s_axi_arprot,
    s_axi_araddr,
    \M00_AXI_0_araddr[11]_1 ,
    sel_first_1,
    \m_payload_i_reg[0]_0 );
  output s_ready_i_reg_0;
  output \aresetn_d_reg[0]_0 ;
  output si_rs_arvalid;
  output [3:0]\axaddr_incr_reg[3] ;
  output [53:0]Q;
  output [3:0]S;
  output [3:0]\m_payload_i_reg[3]_0 ;
  output [3:0]\m_payload_i_reg[7]_0 ;
  output [3:0]O;
  output \FSM_sequential_state_reg[1] ;
  output \m_payload_i_reg[5]_0 ;
  output \m_payload_i_reg[45]_0 ;
  output [6:0]D;
  output \m_payload_i_reg[4]_0 ;
  output \m_payload_i_reg[1]_0 ;
  output \m_payload_i_reg[2]_0 ;
  output \m_payload_i_reg[1]_1 ;
  output \m_payload_i_reg[2]_1 ;
  output [11:0]m_axi_araddr;
  output \aresetn_d_reg[0]_1 ;
  input s_ready_i0;
  input aclk;
  input m_valid_i_reg_0;
  input m_valid_i0;
  input aresetn;
  input [11:0]\M00_AXI_0_araddr[11] ;
  input [11:0]\M00_AXI_0_araddr[11]_0 ;
  input [3:0]\axaddr_incr_reg[3]_0 ;
  input [1:0]\wrap_second_len_r_reg[3] ;
  input next_pending_r_reg;
  input [11:0]s_axi_arid;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arsize;
  input [2:0]s_axi_arprot;
  input [31:0]s_axi_araddr;
  input \M00_AXI_0_araddr[11]_1 ;
  input sel_first_1;
  input [0:0]\m_payload_i_reg[0]_0 ;

  wire [6:0]D;
  wire \FSM_sequential_state_reg[1] ;
  wire [11:0]\M00_AXI_0_araddr[11] ;
  wire [11:0]\M00_AXI_0_araddr[11]_0 ;
  wire \M00_AXI_0_araddr[11]_1 ;
  wire [3:0]O;
  wire [53:0]Q;
  wire [3:0]S;
  wire aclk;
  wire aresetn;
  wire \aresetn_d_reg[0]_0 ;
  wire \aresetn_d_reg[0]_1 ;
  wire \aresetn_d_reg_n_0_[0] ;
  wire \axaddr_incr[3]_i_4_n_0 ;
  wire \axaddr_incr[3]_i_5_n_0 ;
  wire \axaddr_incr[3]_i_6_n_0 ;
  wire \axaddr_incr_reg[11]_i_3__0_n_1 ;
  wire \axaddr_incr_reg[11]_i_3__0_n_2 ;
  wire \axaddr_incr_reg[11]_i_3__0_n_3 ;
  wire [3:0]\axaddr_incr_reg[3] ;
  wire [3:0]\axaddr_incr_reg[3]_0 ;
  wire \axaddr_incr_reg[3]_i_2__0_n_0 ;
  wire \axaddr_incr_reg[3]_i_2__0_n_1 ;
  wire \axaddr_incr_reg[3]_i_2__0_n_2 ;
  wire \axaddr_incr_reg[3]_i_2__0_n_3 ;
  wire \axaddr_incr_reg[7]_i_2__0_n_0 ;
  wire \axaddr_incr_reg[7]_i_2__0_n_1 ;
  wire \axaddr_incr_reg[7]_i_2__0_n_2 ;
  wire \axaddr_incr_reg[7]_i_2__0_n_3 ;
  wire [11:0]m_axi_araddr;
  wire \m_axi_araddr[11]_INST_0_i_1_n_0 ;
  wire \m_payload_i[0]_i_1__0_n_0 ;
  wire \m_payload_i[10]_i_1__0_n_0 ;
  wire \m_payload_i[11]_i_1__0_n_0 ;
  wire \m_payload_i[12]_i_1__0_n_0 ;
  wire \m_payload_i[13]_i_1__1_n_0 ;
  wire \m_payload_i[14]_i_1__0_n_0 ;
  wire \m_payload_i[15]_i_1__0_n_0 ;
  wire \m_payload_i[16]_i_1__0_n_0 ;
  wire \m_payload_i[17]_i_1__0_n_0 ;
  wire \m_payload_i[18]_i_1__0_n_0 ;
  wire \m_payload_i[19]_i_1__0_n_0 ;
  wire \m_payload_i[1]_i_1__0_n_0 ;
  wire \m_payload_i[20]_i_1__0_n_0 ;
  wire \m_payload_i[21]_i_1__0_n_0 ;
  wire \m_payload_i[22]_i_1__0_n_0 ;
  wire \m_payload_i[23]_i_1__0_n_0 ;
  wire \m_payload_i[24]_i_1__0_n_0 ;
  wire \m_payload_i[25]_i_1__0_n_0 ;
  wire \m_payload_i[26]_i_1__0_n_0 ;
  wire \m_payload_i[27]_i_1__0_n_0 ;
  wire \m_payload_i[28]_i_1__0_n_0 ;
  wire \m_payload_i[29]_i_1__0_n_0 ;
  wire \m_payload_i[2]_i_1__0_n_0 ;
  wire \m_payload_i[30]_i_1__0_n_0 ;
  wire \m_payload_i[31]_i_2__0_n_0 ;
  wire \m_payload_i[32]_i_1__0_n_0 ;
  wire \m_payload_i[33]_i_1__0_n_0 ;
  wire \m_payload_i[34]_i_1__0_n_0 ;
  wire \m_payload_i[35]_i_1__0_n_0 ;
  wire \m_payload_i[36]_i_1__0_n_0 ;
  wire \m_payload_i[38]_i_1__0_n_0 ;
  wire \m_payload_i[39]_i_1__0_n_0 ;
  wire \m_payload_i[3]_i_1__0_n_0 ;
  wire \m_payload_i[44]_i_1__0_n_0 ;
  wire \m_payload_i[45]_i_1__0_n_0 ;
  wire \m_payload_i[46]_i_1__1_n_0 ;
  wire \m_payload_i[47]_i_1__0_n_0 ;
  wire \m_payload_i[4]_i_1__0_n_0 ;
  wire \m_payload_i[50]_i_1__0_n_0 ;
  wire \m_payload_i[51]_i_1__0_n_0 ;
  wire \m_payload_i[52]_i_1__0_n_0 ;
  wire \m_payload_i[53]_i_1__0_n_0 ;
  wire \m_payload_i[54]_i_1__0_n_0 ;
  wire \m_payload_i[55]_i_1__0_n_0 ;
  wire \m_payload_i[56]_i_1__0_n_0 ;
  wire \m_payload_i[57]_i_1__0_n_0 ;
  wire \m_payload_i[58]_i_1__0_n_0 ;
  wire \m_payload_i[59]_i_1__0_n_0 ;
  wire \m_payload_i[5]_i_1__0_n_0 ;
  wire \m_payload_i[60]_i_1__0_n_0 ;
  wire \m_payload_i[61]_i_1__0_n_0 ;
  wire \m_payload_i[6]_i_1__0_n_0 ;
  wire \m_payload_i[7]_i_1__0_n_0 ;
  wire \m_payload_i[8]_i_1__0_n_0 ;
  wire \m_payload_i[9]_i_1__0_n_0 ;
  wire [0:0]\m_payload_i_reg[0]_0 ;
  wire \m_payload_i_reg[1]_0 ;
  wire \m_payload_i_reg[1]_1 ;
  wire \m_payload_i_reg[2]_0 ;
  wire \m_payload_i_reg[2]_1 ;
  wire [3:0]\m_payload_i_reg[3]_0 ;
  wire \m_payload_i_reg[45]_0 ;
  wire \m_payload_i_reg[4]_0 ;
  wire \m_payload_i_reg[5]_0 ;
  wire [3:0]\m_payload_i_reg[7]_0 ;
  wire \m_payload_i_reg_n_0_[38] ;
  wire m_valid_i0;
  wire m_valid_i_reg_0;
  wire next_pending_r_reg;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [11:0]s_axi_arid;
  wire [3:0]s_axi_arlen;
  wire [2:0]s_axi_arprot;
  wire [1:0]s_axi_arsize;
  wire s_ready_i0;
  wire s_ready_i_reg_0;
  wire sel_first_1;
  wire si_rs_arvalid;
  wire \skid_buffer_reg_n_0_[0] ;
  wire \skid_buffer_reg_n_0_[10] ;
  wire \skid_buffer_reg_n_0_[11] ;
  wire \skid_buffer_reg_n_0_[12] ;
  wire \skid_buffer_reg_n_0_[13] ;
  wire \skid_buffer_reg_n_0_[14] ;
  wire \skid_buffer_reg_n_0_[15] ;
  wire \skid_buffer_reg_n_0_[16] ;
  wire \skid_buffer_reg_n_0_[17] ;
  wire \skid_buffer_reg_n_0_[18] ;
  wire \skid_buffer_reg_n_0_[19] ;
  wire \skid_buffer_reg_n_0_[1] ;
  wire \skid_buffer_reg_n_0_[20] ;
  wire \skid_buffer_reg_n_0_[21] ;
  wire \skid_buffer_reg_n_0_[22] ;
  wire \skid_buffer_reg_n_0_[23] ;
  wire \skid_buffer_reg_n_0_[24] ;
  wire \skid_buffer_reg_n_0_[25] ;
  wire \skid_buffer_reg_n_0_[26] ;
  wire \skid_buffer_reg_n_0_[27] ;
  wire \skid_buffer_reg_n_0_[28] ;
  wire \skid_buffer_reg_n_0_[29] ;
  wire \skid_buffer_reg_n_0_[2] ;
  wire \skid_buffer_reg_n_0_[30] ;
  wire \skid_buffer_reg_n_0_[31] ;
  wire \skid_buffer_reg_n_0_[32] ;
  wire \skid_buffer_reg_n_0_[33] ;
  wire \skid_buffer_reg_n_0_[34] ;
  wire \skid_buffer_reg_n_0_[35] ;
  wire \skid_buffer_reg_n_0_[36] ;
  wire \skid_buffer_reg_n_0_[38] ;
  wire \skid_buffer_reg_n_0_[39] ;
  wire \skid_buffer_reg_n_0_[3] ;
  wire \skid_buffer_reg_n_0_[44] ;
  wire \skid_buffer_reg_n_0_[45] ;
  wire \skid_buffer_reg_n_0_[46] ;
  wire \skid_buffer_reg_n_0_[47] ;
  wire \skid_buffer_reg_n_0_[4] ;
  wire \skid_buffer_reg_n_0_[50] ;
  wire \skid_buffer_reg_n_0_[51] ;
  wire \skid_buffer_reg_n_0_[52] ;
  wire \skid_buffer_reg_n_0_[53] ;
  wire \skid_buffer_reg_n_0_[54] ;
  wire \skid_buffer_reg_n_0_[55] ;
  wire \skid_buffer_reg_n_0_[56] ;
  wire \skid_buffer_reg_n_0_[57] ;
  wire \skid_buffer_reg_n_0_[58] ;
  wire \skid_buffer_reg_n_0_[59] ;
  wire \skid_buffer_reg_n_0_[5] ;
  wire \skid_buffer_reg_n_0_[60] ;
  wire \skid_buffer_reg_n_0_[61] ;
  wire \skid_buffer_reg_n_0_[6] ;
  wire \skid_buffer_reg_n_0_[7] ;
  wire \skid_buffer_reg_n_0_[8] ;
  wire \skid_buffer_reg_n_0_[9] ;
  wire \wrap_boundary_axaddr_r[3]_i_2_n_0 ;
  wire [1:0]\wrap_second_len_r_reg[3] ;
  wire [3:3]\NLW_axaddr_incr_reg[11]_i_3__0_CO_UNCONNECTED ;

  LUT2 #(
    .INIT(4'h7)) 
    \aresetn_d[1]_inv_i_1 
       (.I0(\aresetn_d_reg_n_0_[0] ),
        .I1(aresetn),
        .O(\aresetn_d_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \aresetn_d_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(aresetn),
        .Q(\aresetn_d_reg_n_0_[0] ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h6A)) 
    \axaddr_incr[3]_i_11 
       (.I0(\M00_AXI_0_araddr[11] [3]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(\axaddr_incr_reg[3] [3]));
  LUT3 #(
    .INIT(8'hA6)) 
    \axaddr_incr[3]_i_12__0 
       (.I0(\M00_AXI_0_araddr[11] [2]),
        .I1(Q[36]),
        .I2(Q[35]),
        .O(\axaddr_incr_reg[3] [2]));
  LUT3 #(
    .INIT(8'hA6)) 
    \axaddr_incr[3]_i_13 
       (.I0(\M00_AXI_0_araddr[11] [1]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(\axaddr_incr_reg[3] [1]));
  LUT3 #(
    .INIT(8'hA9)) 
    \axaddr_incr[3]_i_14 
       (.I0(\M00_AXI_0_araddr[11] [0]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(\axaddr_incr_reg[3] [0]));
  LUT3 #(
    .INIT(8'h2A)) 
    \axaddr_incr[3]_i_4 
       (.I0(Q[2]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(\axaddr_incr[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \axaddr_incr[3]_i_5 
       (.I0(Q[1]),
        .I1(Q[36]),
        .O(\axaddr_incr[3]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \axaddr_incr[3]_i_6 
       (.I0(Q[0]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(\axaddr_incr[3]_i_6_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_incr_reg[11]_i_3__0 
       (.CI(\axaddr_incr_reg[7]_i_2__0_n_0 ),
        .CO({\NLW_axaddr_incr_reg[11]_i_3__0_CO_UNCONNECTED [3],\axaddr_incr_reg[11]_i_3__0_n_1 ,\axaddr_incr_reg[11]_i_3__0_n_2 ,\axaddr_incr_reg[11]_i_3__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(O),
        .S(Q[11:8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_incr_reg[3]_i_2__0 
       (.CI(1'b0),
        .CO({\axaddr_incr_reg[3]_i_2__0_n_0 ,\axaddr_incr_reg[3]_i_2__0_n_1 ,\axaddr_incr_reg[3]_i_2__0_n_2 ,\axaddr_incr_reg[3]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI({Q[3],\axaddr_incr[3]_i_4_n_0 ,\axaddr_incr[3]_i_5_n_0 ,\axaddr_incr[3]_i_6_n_0 }),
        .O(\m_payload_i_reg[3]_0 ),
        .S(\axaddr_incr_reg[3]_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_incr_reg[7]_i_2__0 
       (.CI(\axaddr_incr_reg[3]_i_2__0_n_0 ),
        .CO({\axaddr_incr_reg[7]_i_2__0_n_0 ,\axaddr_incr_reg[7]_i_2__0_n_1 ,\axaddr_incr_reg[7]_i_2__0_n_2 ,\axaddr_incr_reg[7]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\m_payload_i_reg[7]_0 ),
        .S(Q[7:4]));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \axaddr_offset_r[0]_i_2 
       (.I0(Q[1]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[36]),
        .I4(Q[35]),
        .I5(Q[0]),
        .O(\m_payload_i_reg[1]_1 ));
  LUT5 #(
    .INIT(32'h30800080)) 
    \axaddr_offset_r[1]_i_2 
       (.I0(Q[2]),
        .I1(Q[35]),
        .I2(Q[39]),
        .I3(Q[36]),
        .I4(Q[3]),
        .O(\m_payload_i_reg[2]_1 ));
  LUT5 #(
    .INIT(32'hC0000088)) 
    \axaddr_offset_r[1]_i_3 
       (.I0(Q[1]),
        .I1(Q[39]),
        .I2(Q[4]),
        .I3(Q[36]),
        .I4(Q[35]),
        .O(\m_payload_i_reg[1]_0 ));
  LUT5 #(
    .INIT(32'hC0008800)) 
    \axaddr_offset_r[2]_i_2 
       (.I0(Q[4]),
        .I1(Q[40]),
        .I2(Q[5]),
        .I3(Q[36]),
        .I4(Q[35]),
        .O(\m_payload_i_reg[4]_0 ));
  LUT5 #(
    .INIT(32'hFF3FFF77)) 
    \axaddr_offset_r[2]_i_3 
       (.I0(Q[2]),
        .I1(Q[40]),
        .I2(Q[3]),
        .I3(Q[36]),
        .I4(Q[35]),
        .O(\m_payload_i_reg[2]_0 ));
  LUT6 #(
    .INIT(64'h33550F0033550FFF)) 
    \axaddr_offset_r[3]_i_2 
       (.I0(Q[5]),
        .I1(Q[6]),
        .I2(Q[4]),
        .I3(Q[35]),
        .I4(Q[36]),
        .I5(Q[3]),
        .O(\m_payload_i_reg[5]_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \axaddr_wrap[3]_i_3 
       (.I0(\M00_AXI_0_araddr[11]_0 [3]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(S[3]));
  LUT3 #(
    .INIT(8'hA6)) 
    \axaddr_wrap[3]_i_4__0 
       (.I0(\M00_AXI_0_araddr[11]_0 [2]),
        .I1(Q[36]),
        .I2(Q[35]),
        .O(S[2]));
  LUT3 #(
    .INIT(8'hA6)) 
    \axaddr_wrap[3]_i_5 
       (.I0(\M00_AXI_0_araddr[11]_0 [1]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(S[1]));
  LUT3 #(
    .INIT(8'hA9)) 
    \axaddr_wrap[3]_i_6 
       (.I0(\M00_AXI_0_araddr[11]_0 [0]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(S[0]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_araddr[0]_INST_0 
       (.I0(Q[0]),
        .I1(\M00_AXI_0_araddr[11] [0]),
        .I2(\m_axi_araddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_araddr[11]_0 [0]),
        .I4(\M00_AXI_0_araddr[11]_1 ),
        .I5(Q[37]),
        .O(m_axi_araddr[0]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_araddr[10]_INST_0 
       (.I0(Q[10]),
        .I1(\M00_AXI_0_araddr[11] [10]),
        .I2(\m_axi_araddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_araddr[11]_0 [10]),
        .I4(\M00_AXI_0_araddr[11]_1 ),
        .I5(Q[37]),
        .O(m_axi_araddr[10]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_araddr[11]_INST_0 
       (.I0(Q[11]),
        .I1(\M00_AXI_0_araddr[11] [11]),
        .I2(\m_axi_araddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_araddr[11]_0 [11]),
        .I4(\M00_AXI_0_araddr[11]_1 ),
        .I5(Q[37]),
        .O(m_axi_araddr[11]));
  LUT3 #(
    .INIT(8'h04)) 
    \m_axi_araddr[11]_INST_0_i_1 
       (.I0(Q[37]),
        .I1(\m_payload_i_reg_n_0_[38] ),
        .I2(sel_first_1),
        .O(\m_axi_araddr[11]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_araddr[1]_INST_0 
       (.I0(Q[1]),
        .I1(\M00_AXI_0_araddr[11] [1]),
        .I2(\m_axi_araddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_araddr[11]_0 [1]),
        .I4(\M00_AXI_0_araddr[11]_1 ),
        .I5(Q[37]),
        .O(m_axi_araddr[1]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_araddr[2]_INST_0 
       (.I0(Q[2]),
        .I1(\M00_AXI_0_araddr[11] [2]),
        .I2(\m_axi_araddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_araddr[11]_0 [2]),
        .I4(\M00_AXI_0_araddr[11]_1 ),
        .I5(Q[37]),
        .O(m_axi_araddr[2]));
  LUT6 #(
    .INIT(64'hFFFF0C00ACAAACAA)) 
    \m_axi_araddr[3]_INST_0 
       (.I0(Q[3]),
        .I1(\M00_AXI_0_araddr[11]_0 [3]),
        .I2(\M00_AXI_0_araddr[11]_1 ),
        .I3(Q[37]),
        .I4(\M00_AXI_0_araddr[11] [3]),
        .I5(\m_axi_araddr[11]_INST_0_i_1_n_0 ),
        .O(m_axi_araddr[3]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_araddr[4]_INST_0 
       (.I0(Q[4]),
        .I1(\M00_AXI_0_araddr[11] [4]),
        .I2(\m_axi_araddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_araddr[11]_0 [4]),
        .I4(\M00_AXI_0_araddr[11]_1 ),
        .I5(Q[37]),
        .O(m_axi_araddr[4]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_araddr[5]_INST_0 
       (.I0(Q[5]),
        .I1(\M00_AXI_0_araddr[11] [5]),
        .I2(\m_axi_araddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_araddr[11]_0 [5]),
        .I4(\M00_AXI_0_araddr[11]_1 ),
        .I5(Q[37]),
        .O(m_axi_araddr[5]));
  LUT6 #(
    .INIT(64'hFFFF0C00ACAAACAA)) 
    \m_axi_araddr[6]_INST_0 
       (.I0(Q[6]),
        .I1(\M00_AXI_0_araddr[11]_0 [6]),
        .I2(\M00_AXI_0_araddr[11]_1 ),
        .I3(Q[37]),
        .I4(\M00_AXI_0_araddr[11] [6]),
        .I5(\m_axi_araddr[11]_INST_0_i_1_n_0 ),
        .O(m_axi_araddr[6]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_araddr[7]_INST_0 
       (.I0(Q[7]),
        .I1(\M00_AXI_0_araddr[11] [7]),
        .I2(\m_axi_araddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_araddr[11]_0 [7]),
        .I4(\M00_AXI_0_araddr[11]_1 ),
        .I5(Q[37]),
        .O(m_axi_araddr[7]));
  LUT6 #(
    .INIT(64'hFFFF0C00ACAAACAA)) 
    \m_axi_araddr[8]_INST_0 
       (.I0(Q[8]),
        .I1(\M00_AXI_0_araddr[11]_0 [8]),
        .I2(\M00_AXI_0_araddr[11]_1 ),
        .I3(Q[37]),
        .I4(\M00_AXI_0_araddr[11] [8]),
        .I5(\m_axi_araddr[11]_INST_0_i_1_n_0 ),
        .O(m_axi_araddr[8]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_araddr[9]_INST_0 
       (.I0(Q[9]),
        .I1(\M00_AXI_0_araddr[11] [9]),
        .I2(\m_axi_araddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_araddr[11]_0 [9]),
        .I4(\M00_AXI_0_araddr[11]_1 ),
        .I5(Q[37]),
        .O(m_axi_araddr[9]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[0]_i_1__0 
       (.I0(s_axi_araddr[0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[0] ),
        .O(\m_payload_i[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[10]_i_1__0 
       (.I0(s_axi_araddr[10]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[10] ),
        .O(\m_payload_i[10]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[11]_i_1__0 
       (.I0(s_axi_araddr[11]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[11] ),
        .O(\m_payload_i[11]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[12]_i_1__0 
       (.I0(s_axi_araddr[12]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[12] ),
        .O(\m_payload_i[12]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[13]_i_1__1 
       (.I0(s_axi_araddr[13]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[13] ),
        .O(\m_payload_i[13]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[14]_i_1__0 
       (.I0(s_axi_araddr[14]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[14] ),
        .O(\m_payload_i[14]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[15]_i_1__0 
       (.I0(s_axi_araddr[15]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[15] ),
        .O(\m_payload_i[15]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[16]_i_1__0 
       (.I0(s_axi_araddr[16]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[16] ),
        .O(\m_payload_i[16]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[17]_i_1__0 
       (.I0(s_axi_araddr[17]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[17] ),
        .O(\m_payload_i[17]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[18]_i_1__0 
       (.I0(s_axi_araddr[18]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[18] ),
        .O(\m_payload_i[18]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[19]_i_1__0 
       (.I0(s_axi_araddr[19]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[19] ),
        .O(\m_payload_i[19]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[1]_i_1__0 
       (.I0(s_axi_araddr[1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[1] ),
        .O(\m_payload_i[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[20]_i_1__0 
       (.I0(s_axi_araddr[20]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[20] ),
        .O(\m_payload_i[20]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[21]_i_1__0 
       (.I0(s_axi_araddr[21]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[21] ),
        .O(\m_payload_i[21]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[22]_i_1__0 
       (.I0(s_axi_araddr[22]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[22] ),
        .O(\m_payload_i[22]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[23]_i_1__0 
       (.I0(s_axi_araddr[23]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[23] ),
        .O(\m_payload_i[23]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[24]_i_1__0 
       (.I0(s_axi_araddr[24]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[24] ),
        .O(\m_payload_i[24]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[25]_i_1__0 
       (.I0(s_axi_araddr[25]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[25] ),
        .O(\m_payload_i[25]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[26]_i_1__0 
       (.I0(s_axi_araddr[26]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[26] ),
        .O(\m_payload_i[26]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[27]_i_1__0 
       (.I0(s_axi_araddr[27]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[27] ),
        .O(\m_payload_i[27]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[28]_i_1__0 
       (.I0(s_axi_araddr[28]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[28] ),
        .O(\m_payload_i[28]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[29]_i_1__0 
       (.I0(s_axi_araddr[29]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[29] ),
        .O(\m_payload_i[29]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[2]_i_1__0 
       (.I0(s_axi_araddr[2]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[2] ),
        .O(\m_payload_i[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[30]_i_1__0 
       (.I0(s_axi_araddr[30]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[30] ),
        .O(\m_payload_i[30]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[31]_i_2__0 
       (.I0(s_axi_araddr[31]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[31] ),
        .O(\m_payload_i[31]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[32]_i_1__0 
       (.I0(s_axi_arprot[0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[32] ),
        .O(\m_payload_i[32]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[33]_i_1__0 
       (.I0(s_axi_arprot[1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[33] ),
        .O(\m_payload_i[33]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[34]_i_1__0 
       (.I0(s_axi_arprot[2]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[34] ),
        .O(\m_payload_i[34]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[35]_i_1__0 
       (.I0(s_axi_arsize[0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[35] ),
        .O(\m_payload_i[35]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[36]_i_1__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[36] ),
        .O(\m_payload_i[36]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[38]_i_1__0 
       (.I0(s_axi_arburst[0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[38] ),
        .O(\m_payload_i[38]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[39]_i_1__0 
       (.I0(s_axi_arburst[1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[39] ),
        .O(\m_payload_i[39]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[3]_i_1__0 
       (.I0(s_axi_araddr[3]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[3] ),
        .O(\m_payload_i[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[44]_i_1__0 
       (.I0(s_axi_arlen[0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[44] ),
        .O(\m_payload_i[44]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[45]_i_1__0 
       (.I0(s_axi_arlen[1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[45] ),
        .O(\m_payload_i[45]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[46]_i_1__1 
       (.I0(s_axi_arlen[2]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[46] ),
        .O(\m_payload_i[46]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[47]_i_1__0 
       (.I0(s_axi_arlen[3]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[47] ),
        .O(\m_payload_i[47]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[4]_i_1__0 
       (.I0(s_axi_araddr[4]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[4] ),
        .O(\m_payload_i[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[50]_i_1__0 
       (.I0(s_axi_arid[0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[50] ),
        .O(\m_payload_i[50]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[51]_i_1__0 
       (.I0(s_axi_arid[1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[51] ),
        .O(\m_payload_i[51]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[52]_i_1__0 
       (.I0(s_axi_arid[2]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[52] ),
        .O(\m_payload_i[52]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[53]_i_1__0 
       (.I0(s_axi_arid[3]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[53] ),
        .O(\m_payload_i[53]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[54]_i_1__0 
       (.I0(s_axi_arid[4]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[54] ),
        .O(\m_payload_i[54]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[55]_i_1__0 
       (.I0(s_axi_arid[5]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[55] ),
        .O(\m_payload_i[55]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[56]_i_1__0 
       (.I0(s_axi_arid[6]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[56] ),
        .O(\m_payload_i[56]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[57]_i_1__0 
       (.I0(s_axi_arid[7]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[57] ),
        .O(\m_payload_i[57]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[58]_i_1__0 
       (.I0(s_axi_arid[8]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[58] ),
        .O(\m_payload_i[58]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[59]_i_1__0 
       (.I0(s_axi_arid[9]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[59] ),
        .O(\m_payload_i[59]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[5]_i_1__0 
       (.I0(s_axi_araddr[5]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[5] ),
        .O(\m_payload_i[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[60]_i_1__0 
       (.I0(s_axi_arid[10]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[60] ),
        .O(\m_payload_i[60]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[61]_i_1__0 
       (.I0(s_axi_arid[11]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[61] ),
        .O(\m_payload_i[61]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[6]_i_1__0 
       (.I0(s_axi_araddr[6]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[6] ),
        .O(\m_payload_i[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[7]_i_1__0 
       (.I0(s_axi_araddr[7]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[7] ),
        .O(\m_payload_i[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[8]_i_1__0 
       (.I0(s_axi_araddr[8]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[8] ),
        .O(\m_payload_i[8]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[9]_i_1__0 
       (.I0(s_axi_araddr[9]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[9] ),
        .O(\m_payload_i[9]_i_1__0_n_0 ));
  FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[0]_i_1__0_n_0 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \m_payload_i_reg[10] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[10]_i_1__0_n_0 ),
        .Q(Q[10]),
        .R(1'b0));
  FDRE \m_payload_i_reg[11] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[11]_i_1__0_n_0 ),
        .Q(Q[11]),
        .R(1'b0));
  FDRE \m_payload_i_reg[12] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[12]_i_1__0_n_0 ),
        .Q(Q[12]),
        .R(1'b0));
  FDRE \m_payload_i_reg[13] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[13]_i_1__1_n_0 ),
        .Q(Q[13]),
        .R(1'b0));
  FDRE \m_payload_i_reg[14] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[14]_i_1__0_n_0 ),
        .Q(Q[14]),
        .R(1'b0));
  FDRE \m_payload_i_reg[15] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[15]_i_1__0_n_0 ),
        .Q(Q[15]),
        .R(1'b0));
  FDRE \m_payload_i_reg[16] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[16]_i_1__0_n_0 ),
        .Q(Q[16]),
        .R(1'b0));
  FDRE \m_payload_i_reg[17] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[17]_i_1__0_n_0 ),
        .Q(Q[17]),
        .R(1'b0));
  FDRE \m_payload_i_reg[18] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[18]_i_1__0_n_0 ),
        .Q(Q[18]),
        .R(1'b0));
  FDRE \m_payload_i_reg[19] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[19]_i_1__0_n_0 ),
        .Q(Q[19]),
        .R(1'b0));
  FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[1]_i_1__0_n_0 ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \m_payload_i_reg[20] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[20]_i_1__0_n_0 ),
        .Q(Q[20]),
        .R(1'b0));
  FDRE \m_payload_i_reg[21] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[21]_i_1__0_n_0 ),
        .Q(Q[21]),
        .R(1'b0));
  FDRE \m_payload_i_reg[22] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[22]_i_1__0_n_0 ),
        .Q(Q[22]),
        .R(1'b0));
  FDRE \m_payload_i_reg[23] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[23]_i_1__0_n_0 ),
        .Q(Q[23]),
        .R(1'b0));
  FDRE \m_payload_i_reg[24] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[24]_i_1__0_n_0 ),
        .Q(Q[24]),
        .R(1'b0));
  FDRE \m_payload_i_reg[25] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[25]_i_1__0_n_0 ),
        .Q(Q[25]),
        .R(1'b0));
  FDRE \m_payload_i_reg[26] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[26]_i_1__0_n_0 ),
        .Q(Q[26]),
        .R(1'b0));
  FDRE \m_payload_i_reg[27] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[27]_i_1__0_n_0 ),
        .Q(Q[27]),
        .R(1'b0));
  FDRE \m_payload_i_reg[28] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[28]_i_1__0_n_0 ),
        .Q(Q[28]),
        .R(1'b0));
  FDRE \m_payload_i_reg[29] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[29]_i_1__0_n_0 ),
        .Q(Q[29]),
        .R(1'b0));
  FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[2]_i_1__0_n_0 ),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \m_payload_i_reg[30] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[30]_i_1__0_n_0 ),
        .Q(Q[30]),
        .R(1'b0));
  FDRE \m_payload_i_reg[31] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[31]_i_2__0_n_0 ),
        .Q(Q[31]),
        .R(1'b0));
  FDRE \m_payload_i_reg[32] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[32]_i_1__0_n_0 ),
        .Q(Q[32]),
        .R(1'b0));
  FDRE \m_payload_i_reg[33] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[33]_i_1__0_n_0 ),
        .Q(Q[33]),
        .R(1'b0));
  FDRE \m_payload_i_reg[34] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[34]_i_1__0_n_0 ),
        .Q(Q[34]),
        .R(1'b0));
  FDRE \m_payload_i_reg[35] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[35]_i_1__0_n_0 ),
        .Q(Q[35]),
        .R(1'b0));
  FDRE \m_payload_i_reg[36] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[36]_i_1__0_n_0 ),
        .Q(Q[36]),
        .R(1'b0));
  FDRE \m_payload_i_reg[38] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[38]_i_1__0_n_0 ),
        .Q(\m_payload_i_reg_n_0_[38] ),
        .R(1'b0));
  FDRE \m_payload_i_reg[39] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[39]_i_1__0_n_0 ),
        .Q(Q[37]),
        .R(1'b0));
  FDRE \m_payload_i_reg[3] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[3]_i_1__0_n_0 ),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \m_payload_i_reg[44] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[44]_i_1__0_n_0 ),
        .Q(Q[38]),
        .R(1'b0));
  FDRE \m_payload_i_reg[45] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[45]_i_1__0_n_0 ),
        .Q(Q[39]),
        .R(1'b0));
  FDRE \m_payload_i_reg[46] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[46]_i_1__1_n_0 ),
        .Q(Q[40]),
        .R(1'b0));
  FDRE \m_payload_i_reg[47] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[47]_i_1__0_n_0 ),
        .Q(Q[41]),
        .R(1'b0));
  FDRE \m_payload_i_reg[4] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[4]_i_1__0_n_0 ),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \m_payload_i_reg[50] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[50]_i_1__0_n_0 ),
        .Q(Q[42]),
        .R(1'b0));
  FDRE \m_payload_i_reg[51] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[51]_i_1__0_n_0 ),
        .Q(Q[43]),
        .R(1'b0));
  FDRE \m_payload_i_reg[52] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[52]_i_1__0_n_0 ),
        .Q(Q[44]),
        .R(1'b0));
  FDRE \m_payload_i_reg[53] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[53]_i_1__0_n_0 ),
        .Q(Q[45]),
        .R(1'b0));
  FDRE \m_payload_i_reg[54] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[54]_i_1__0_n_0 ),
        .Q(Q[46]),
        .R(1'b0));
  FDRE \m_payload_i_reg[55] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[55]_i_1__0_n_0 ),
        .Q(Q[47]),
        .R(1'b0));
  FDRE \m_payload_i_reg[56] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[56]_i_1__0_n_0 ),
        .Q(Q[48]),
        .R(1'b0));
  FDRE \m_payload_i_reg[57] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[57]_i_1__0_n_0 ),
        .Q(Q[49]),
        .R(1'b0));
  FDRE \m_payload_i_reg[58] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[58]_i_1__0_n_0 ),
        .Q(Q[50]),
        .R(1'b0));
  FDRE \m_payload_i_reg[59] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[59]_i_1__0_n_0 ),
        .Q(Q[51]),
        .R(1'b0));
  FDRE \m_payload_i_reg[5] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[5]_i_1__0_n_0 ),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \m_payload_i_reg[60] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[60]_i_1__0_n_0 ),
        .Q(Q[52]),
        .R(1'b0));
  FDRE \m_payload_i_reg[61] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[61]_i_1__0_n_0 ),
        .Q(Q[53]),
        .R(1'b0));
  FDRE \m_payload_i_reg[6] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[6]_i_1__0_n_0 ),
        .Q(Q[6]),
        .R(1'b0));
  FDRE \m_payload_i_reg[7] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[7]_i_1__0_n_0 ),
        .Q(Q[7]),
        .R(1'b0));
  FDRE \m_payload_i_reg[8] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[8]_i_1__0_n_0 ),
        .Q(Q[8]),
        .R(1'b0));
  FDRE \m_payload_i_reg[9] 
       (.C(aclk),
        .CE(\m_payload_i_reg[0]_0 ),
        .D(\m_payload_i[9]_i_1__0_n_0 ),
        .Q(Q[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    m_valid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(m_valid_i0),
        .Q(si_rs_arvalid),
        .R(m_valid_i_reg_0));
  LUT5 #(
    .INIT(32'h0000FFFE)) 
    next_pending_r_i_3__0
       (.I0(Q[39]),
        .I1(Q[38]),
        .I2(Q[40]),
        .I3(Q[41]),
        .I4(next_pending_r_reg),
        .O(\m_payload_i_reg[45]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    s_ready_i_i_1__1
       (.I0(\aresetn_d_reg_n_0_[0] ),
        .O(\aresetn_d_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_ready_i0),
        .Q(s_ready_i_reg_0),
        .R(\aresetn_d_reg[0]_0 ));
  FDRE \skid_buffer_reg[0] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[0]),
        .Q(\skid_buffer_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[10] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[10]),
        .Q(\skid_buffer_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[11] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[11]),
        .Q(\skid_buffer_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[12] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[12]),
        .Q(\skid_buffer_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[13] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[13]),
        .Q(\skid_buffer_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[14] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[14]),
        .Q(\skid_buffer_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[15] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[15]),
        .Q(\skid_buffer_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[16] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[16]),
        .Q(\skid_buffer_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[17] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[17]),
        .Q(\skid_buffer_reg_n_0_[17] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[18] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[18]),
        .Q(\skid_buffer_reg_n_0_[18] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[19] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[19]),
        .Q(\skid_buffer_reg_n_0_[19] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[1] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[1]),
        .Q(\skid_buffer_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[20] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[20]),
        .Q(\skid_buffer_reg_n_0_[20] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[21] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[21]),
        .Q(\skid_buffer_reg_n_0_[21] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[22] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[22]),
        .Q(\skid_buffer_reg_n_0_[22] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[23] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[23]),
        .Q(\skid_buffer_reg_n_0_[23] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[24] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[24]),
        .Q(\skid_buffer_reg_n_0_[24] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[25] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[25]),
        .Q(\skid_buffer_reg_n_0_[25] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[26] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[26]),
        .Q(\skid_buffer_reg_n_0_[26] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[27] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[27]),
        .Q(\skid_buffer_reg_n_0_[27] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[28] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[28]),
        .Q(\skid_buffer_reg_n_0_[28] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[29] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[29]),
        .Q(\skid_buffer_reg_n_0_[29] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[2] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[2]),
        .Q(\skid_buffer_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[30] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[30]),
        .Q(\skid_buffer_reg_n_0_[30] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[31] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[31]),
        .Q(\skid_buffer_reg_n_0_[31] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[32] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arprot[0]),
        .Q(\skid_buffer_reg_n_0_[32] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[33] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arprot[1]),
        .Q(\skid_buffer_reg_n_0_[33] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[34] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arprot[2]),
        .Q(\skid_buffer_reg_n_0_[34] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[35] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arsize[0]),
        .Q(\skid_buffer_reg_n_0_[35] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[36] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arsize[1]),
        .Q(\skid_buffer_reg_n_0_[36] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[38] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arburst[0]),
        .Q(\skid_buffer_reg_n_0_[38] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[39] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arburst[1]),
        .Q(\skid_buffer_reg_n_0_[39] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[3] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[3]),
        .Q(\skid_buffer_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[44] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arlen[0]),
        .Q(\skid_buffer_reg_n_0_[44] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[45] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arlen[1]),
        .Q(\skid_buffer_reg_n_0_[45] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[46] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arlen[2]),
        .Q(\skid_buffer_reg_n_0_[46] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[47] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arlen[3]),
        .Q(\skid_buffer_reg_n_0_[47] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[4] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[4]),
        .Q(\skid_buffer_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[50] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arid[0]),
        .Q(\skid_buffer_reg_n_0_[50] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[51] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arid[1]),
        .Q(\skid_buffer_reg_n_0_[51] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[52] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arid[2]),
        .Q(\skid_buffer_reg_n_0_[52] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[53] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arid[3]),
        .Q(\skid_buffer_reg_n_0_[53] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[54] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arid[4]),
        .Q(\skid_buffer_reg_n_0_[54] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[55] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arid[5]),
        .Q(\skid_buffer_reg_n_0_[55] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[56] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arid[6]),
        .Q(\skid_buffer_reg_n_0_[56] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[57] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arid[7]),
        .Q(\skid_buffer_reg_n_0_[57] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[58] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arid[8]),
        .Q(\skid_buffer_reg_n_0_[58] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[59] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arid[9]),
        .Q(\skid_buffer_reg_n_0_[59] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[5] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[5]),
        .Q(\skid_buffer_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[60] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arid[10]),
        .Q(\skid_buffer_reg_n_0_[60] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[61] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_arid[11]),
        .Q(\skid_buffer_reg_n_0_[61] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[6] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[6]),
        .Q(\skid_buffer_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[7] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[7]),
        .Q(\skid_buffer_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[8] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[8]),
        .Q(\skid_buffer_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[9] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_araddr[9]),
        .Q(\skid_buffer_reg_n_0_[9] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hA8AA)) 
    \wrap_boundary_axaddr_r[0]_i_1 
       (.I0(Q[0]),
        .I1(Q[36]),
        .I2(Q[35]),
        .I3(Q[38]),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hDDCF0000)) 
    \wrap_boundary_axaddr_r[1]_i_1 
       (.I0(Q[38]),
        .I1(Q[36]),
        .I2(Q[39]),
        .I3(Q[35]),
        .I4(Q[1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hA0A0202AAAAA202A)) 
    \wrap_boundary_axaddr_r[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[38]),
        .I2(Q[36]),
        .I3(Q[40]),
        .I4(Q[35]),
        .I5(Q[39]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFF008020A0)) 
    \wrap_boundary_axaddr_r[3]_i_1 
       (.I0(Q[3]),
        .I1(Q[36]),
        .I2(Q[35]),
        .I3(Q[38]),
        .I4(Q[40]),
        .I5(\wrap_boundary_axaddr_r[3]_i_2_n_0 ),
        .O(D[3]));
  LUT5 #(
    .INIT(32'h00300050)) 
    \wrap_boundary_axaddr_r[3]_i_2 
       (.I0(Q[41]),
        .I1(Q[39]),
        .I2(Q[3]),
        .I3(Q[35]),
        .I4(Q[36]),
        .O(\wrap_boundary_axaddr_r[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000A22AAAA0A22AA)) 
    \wrap_boundary_axaddr_r[4]_i_1 
       (.I0(Q[4]),
        .I1(Q[40]),
        .I2(Q[41]),
        .I3(Q[36]),
        .I4(Q[35]),
        .I5(Q[39]),
        .O(D[4]));
  LUT5 #(
    .INIT(32'h737F0000)) 
    \wrap_boundary_axaddr_r[5]_i_1 
       (.I0(Q[40]),
        .I1(Q[36]),
        .I2(Q[35]),
        .I3(Q[41]),
        .I4(Q[5]),
        .O(D[5]));
  LUT4 #(
    .INIT(16'h2AAA)) 
    \wrap_boundary_axaddr_r[6]_i_1 
       (.I0(Q[6]),
        .I1(Q[41]),
        .I2(Q[36]),
        .I3(Q[35]),
        .O(D[6]));
  LUT5 #(
    .INIT(32'h00004000)) 
    \wrap_second_len_r[3]_i_2__0 
       (.I0(\wrap_second_len_r_reg[3] [1]),
        .I1(\wrap_second_len_r_reg[3] [0]),
        .I2(si_rs_arvalid),
        .I3(Q[41]),
        .I4(\m_payload_i_reg[5]_0 ),
        .O(\FSM_sequential_state_reg[1] ));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_22_axic_register_slice" *) 
module dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice_0
   (s_ready_i_reg_0,
    m_valid_i_reg_0,
    \axaddr_incr_reg[3] ,
    Q,
    \axaddr_wrap_reg[3] ,
    axaddr_incr,
    \m_payload_i_reg[45]_0 ,
    \FSM_sequential_state_reg[0] ,
    \m_payload_i_reg[6]_0 ,
    axaddr_offset,
    \m_payload_i_reg[6]_1 ,
    \m_payload_i_reg[1]_0 ,
    \m_payload_i_reg[1]_1 ,
    \m_payload_i_reg[2]_0 ,
    m_axi_awaddr,
    s_ready_i_reg_1,
    aclk,
    m_valid_i_reg_1,
    \M00_AXI_0_awaddr[11] ,
    \M00_AXI_0_awaddr[11]_0 ,
    b_push,
    s_axi_awvalid,
    \axaddr_incr_reg[3]_0 ,
    next_pending_r_reg,
    \axaddr_offset_r_reg[2] ,
    \axaddr_offset_r_reg[2]_0 ,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awsize,
    s_axi_awprot,
    s_axi_awaddr,
    sel_first,
    sel_first_0,
    E);
  output s_ready_i_reg_0;
  output m_valid_i_reg_0;
  output [3:0]\axaddr_incr_reg[3] ;
  output [53:0]Q;
  output [3:0]\axaddr_wrap_reg[3] ;
  output [11:0]axaddr_incr;
  output \m_payload_i_reg[45]_0 ;
  output \FSM_sequential_state_reg[0] ;
  output \m_payload_i_reg[6]_0 ;
  output [0:0]axaddr_offset;
  output [6:0]\m_payload_i_reg[6]_1 ;
  output \m_payload_i_reg[1]_0 ;
  output \m_payload_i_reg[1]_1 ;
  output \m_payload_i_reg[2]_0 ;
  output [11:0]m_axi_awaddr;
  input s_ready_i_reg_1;
  input aclk;
  input m_valid_i_reg_1;
  input [11:0]\M00_AXI_0_awaddr[11] ;
  input [11:0]\M00_AXI_0_awaddr[11]_0 ;
  input b_push;
  input s_axi_awvalid;
  input [3:0]\axaddr_incr_reg[3]_0 ;
  input next_pending_r_reg;
  input [1:0]\axaddr_offset_r_reg[2] ;
  input [0:0]\axaddr_offset_r_reg[2]_0 ;
  input [11:0]s_axi_awid;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awsize;
  input [2:0]s_axi_awprot;
  input [31:0]s_axi_awaddr;
  input sel_first;
  input sel_first_0;
  input [0:0]E;

  wire [0:0]E;
  wire \FSM_sequential_state_reg[0] ;
  wire [11:0]\M00_AXI_0_awaddr[11] ;
  wire [11:0]\M00_AXI_0_awaddr[11]_0 ;
  wire [53:0]Q;
  wire aclk;
  wire [11:0]axaddr_incr;
  wire \axaddr_incr[3]_i_4__0_n_0 ;
  wire \axaddr_incr[3]_i_5__0_n_0 ;
  wire \axaddr_incr[3]_i_6__0_n_0 ;
  wire \axaddr_incr_reg[11]_i_3_n_1 ;
  wire \axaddr_incr_reg[11]_i_3_n_2 ;
  wire \axaddr_incr_reg[11]_i_3_n_3 ;
  wire [3:0]\axaddr_incr_reg[3] ;
  wire [3:0]\axaddr_incr_reg[3]_0 ;
  wire \axaddr_incr_reg[3]_i_2_n_0 ;
  wire \axaddr_incr_reg[3]_i_2_n_1 ;
  wire \axaddr_incr_reg[3]_i_2_n_2 ;
  wire \axaddr_incr_reg[3]_i_2_n_3 ;
  wire \axaddr_incr_reg[7]_i_2_n_0 ;
  wire \axaddr_incr_reg[7]_i_2_n_1 ;
  wire \axaddr_incr_reg[7]_i_2_n_2 ;
  wire \axaddr_incr_reg[7]_i_2_n_3 ;
  wire [0:0]axaddr_offset;
  wire \axaddr_offset_r[2]_i_2__0_n_0 ;
  wire [1:0]\axaddr_offset_r_reg[2] ;
  wire [0:0]\axaddr_offset_r_reg[2]_0 ;
  wire [3:0]\axaddr_wrap_reg[3] ;
  wire b_push;
  wire [11:0]m_axi_awaddr;
  wire \m_axi_awaddr[11]_INST_0_i_1_n_0 ;
  wire \m_payload_i_reg[1]_0 ;
  wire \m_payload_i_reg[1]_1 ;
  wire \m_payload_i_reg[2]_0 ;
  wire \m_payload_i_reg[45]_0 ;
  wire \m_payload_i_reg[6]_0 ;
  wire [6:0]\m_payload_i_reg[6]_1 ;
  wire \m_payload_i_reg_n_0_[38] ;
  wire m_valid_i0;
  wire m_valid_i_reg_0;
  wire m_valid_i_reg_1;
  wire next_pending_r_reg;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [11:0]s_axi_awid;
  wire [3:0]s_axi_awlen;
  wire [2:0]s_axi_awprot;
  wire [1:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_ready_i0;
  wire s_ready_i_reg_0;
  wire s_ready_i_reg_1;
  wire sel_first;
  wire sel_first_0;
  wire [61:0]skid_buffer;
  wire \skid_buffer_reg_n_0_[0] ;
  wire \skid_buffer_reg_n_0_[10] ;
  wire \skid_buffer_reg_n_0_[11] ;
  wire \skid_buffer_reg_n_0_[12] ;
  wire \skid_buffer_reg_n_0_[13] ;
  wire \skid_buffer_reg_n_0_[14] ;
  wire \skid_buffer_reg_n_0_[15] ;
  wire \skid_buffer_reg_n_0_[16] ;
  wire \skid_buffer_reg_n_0_[17] ;
  wire \skid_buffer_reg_n_0_[18] ;
  wire \skid_buffer_reg_n_0_[19] ;
  wire \skid_buffer_reg_n_0_[1] ;
  wire \skid_buffer_reg_n_0_[20] ;
  wire \skid_buffer_reg_n_0_[21] ;
  wire \skid_buffer_reg_n_0_[22] ;
  wire \skid_buffer_reg_n_0_[23] ;
  wire \skid_buffer_reg_n_0_[24] ;
  wire \skid_buffer_reg_n_0_[25] ;
  wire \skid_buffer_reg_n_0_[26] ;
  wire \skid_buffer_reg_n_0_[27] ;
  wire \skid_buffer_reg_n_0_[28] ;
  wire \skid_buffer_reg_n_0_[29] ;
  wire \skid_buffer_reg_n_0_[2] ;
  wire \skid_buffer_reg_n_0_[30] ;
  wire \skid_buffer_reg_n_0_[31] ;
  wire \skid_buffer_reg_n_0_[32] ;
  wire \skid_buffer_reg_n_0_[33] ;
  wire \skid_buffer_reg_n_0_[34] ;
  wire \skid_buffer_reg_n_0_[35] ;
  wire \skid_buffer_reg_n_0_[36] ;
  wire \skid_buffer_reg_n_0_[38] ;
  wire \skid_buffer_reg_n_0_[39] ;
  wire \skid_buffer_reg_n_0_[3] ;
  wire \skid_buffer_reg_n_0_[44] ;
  wire \skid_buffer_reg_n_0_[45] ;
  wire \skid_buffer_reg_n_0_[46] ;
  wire \skid_buffer_reg_n_0_[47] ;
  wire \skid_buffer_reg_n_0_[4] ;
  wire \skid_buffer_reg_n_0_[50] ;
  wire \skid_buffer_reg_n_0_[51] ;
  wire \skid_buffer_reg_n_0_[52] ;
  wire \skid_buffer_reg_n_0_[53] ;
  wire \skid_buffer_reg_n_0_[54] ;
  wire \skid_buffer_reg_n_0_[55] ;
  wire \skid_buffer_reg_n_0_[56] ;
  wire \skid_buffer_reg_n_0_[57] ;
  wire \skid_buffer_reg_n_0_[58] ;
  wire \skid_buffer_reg_n_0_[59] ;
  wire \skid_buffer_reg_n_0_[5] ;
  wire \skid_buffer_reg_n_0_[60] ;
  wire \skid_buffer_reg_n_0_[61] ;
  wire \skid_buffer_reg_n_0_[6] ;
  wire \skid_buffer_reg_n_0_[7] ;
  wire \skid_buffer_reg_n_0_[8] ;
  wire \skid_buffer_reg_n_0_[9] ;
  wire \wrap_boundary_axaddr_r[3]_i_2__0_n_0 ;
  wire [3:3]\NLW_axaddr_incr_reg[11]_i_3_CO_UNCONNECTED ;

  LUT3 #(
    .INIT(8'h6A)) 
    \axaddr_incr[3]_i_11__0 
       (.I0(\M00_AXI_0_awaddr[11] [3]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(\axaddr_incr_reg[3] [3]));
  LUT3 #(
    .INIT(8'hA6)) 
    \axaddr_incr[3]_i_12 
       (.I0(\M00_AXI_0_awaddr[11] [2]),
        .I1(Q[36]),
        .I2(Q[35]),
        .O(\axaddr_incr_reg[3] [2]));
  LUT3 #(
    .INIT(8'hA6)) 
    \axaddr_incr[3]_i_13__0 
       (.I0(\M00_AXI_0_awaddr[11] [1]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(\axaddr_incr_reg[3] [1]));
  LUT3 #(
    .INIT(8'hA9)) 
    \axaddr_incr[3]_i_14__0 
       (.I0(\M00_AXI_0_awaddr[11] [0]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(\axaddr_incr_reg[3] [0]));
  LUT3 #(
    .INIT(8'h2A)) 
    \axaddr_incr[3]_i_4__0 
       (.I0(Q[2]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(\axaddr_incr[3]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \axaddr_incr[3]_i_5__0 
       (.I0(Q[1]),
        .I1(Q[36]),
        .O(\axaddr_incr[3]_i_5__0_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \axaddr_incr[3]_i_6__0 
       (.I0(Q[0]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(\axaddr_incr[3]_i_6__0_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_incr_reg[11]_i_3 
       (.CI(\axaddr_incr_reg[7]_i_2_n_0 ),
        .CO({\NLW_axaddr_incr_reg[11]_i_3_CO_UNCONNECTED [3],\axaddr_incr_reg[11]_i_3_n_1 ,\axaddr_incr_reg[11]_i_3_n_2 ,\axaddr_incr_reg[11]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(axaddr_incr[11:8]),
        .S(Q[11:8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_incr_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\axaddr_incr_reg[3]_i_2_n_0 ,\axaddr_incr_reg[3]_i_2_n_1 ,\axaddr_incr_reg[3]_i_2_n_2 ,\axaddr_incr_reg[3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({Q[3],\axaddr_incr[3]_i_4__0_n_0 ,\axaddr_incr[3]_i_5__0_n_0 ,\axaddr_incr[3]_i_6__0_n_0 }),
        .O(axaddr_incr[3:0]),
        .S(\axaddr_incr_reg[3]_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \axaddr_incr_reg[7]_i_2 
       (.CI(\axaddr_incr_reg[3]_i_2_n_0 ),
        .CO({\axaddr_incr_reg[7]_i_2_n_0 ,\axaddr_incr_reg[7]_i_2_n_1 ,\axaddr_incr_reg[7]_i_2_n_2 ,\axaddr_incr_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(axaddr_incr[7:4]),
        .S(Q[7:4]));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \axaddr_offset_r[0]_i_2__0 
       (.I0(Q[1]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[36]),
        .I4(Q[35]),
        .I5(Q[0]),
        .O(\m_payload_i_reg[1]_0 ));
  LUT5 #(
    .INIT(32'h30800080)) 
    \axaddr_offset_r[1]_i_2__0 
       (.I0(Q[2]),
        .I1(Q[35]),
        .I2(Q[39]),
        .I3(Q[36]),
        .I4(Q[3]),
        .O(\m_payload_i_reg[2]_0 ));
  LUT5 #(
    .INIT(32'hC0000088)) 
    \axaddr_offset_r[1]_i_3__0 
       (.I0(Q[1]),
        .I1(Q[39]),
        .I2(Q[4]),
        .I3(Q[36]),
        .I4(Q[35]),
        .O(\m_payload_i_reg[1]_1 ));
  LUT6 #(
    .INIT(64'hFF4FFFFF00400000)) 
    \axaddr_offset_r[2]_i_1 
       (.I0(\axaddr_offset_r[2]_i_2__0_n_0 ),
        .I1(Q[40]),
        .I2(\axaddr_offset_r_reg[2] [0]),
        .I3(\axaddr_offset_r_reg[2] [1]),
        .I4(m_valid_i_reg_0),
        .I5(\axaddr_offset_r_reg[2]_0 ),
        .O(axaddr_offset));
  LUT6 #(
    .INIT(64'h00550F33FF550F33)) 
    \axaddr_offset_r[2]_i_2__0 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[35]),
        .I4(Q[36]),
        .I5(Q[5]),
        .O(\axaddr_offset_r[2]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h5533000F5533FF0F)) 
    \axaddr_offset_r[3]_i_2__0 
       (.I0(Q[6]),
        .I1(Q[5]),
        .I2(Q[3]),
        .I3(Q[35]),
        .I4(Q[36]),
        .I5(Q[4]),
        .O(\m_payload_i_reg[6]_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \axaddr_wrap[3]_i_3__0 
       (.I0(\M00_AXI_0_awaddr[11]_0 [3]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(\axaddr_wrap_reg[3] [3]));
  LUT3 #(
    .INIT(8'hA6)) 
    \axaddr_wrap[3]_i_4 
       (.I0(\M00_AXI_0_awaddr[11]_0 [2]),
        .I1(Q[36]),
        .I2(Q[35]),
        .O(\axaddr_wrap_reg[3] [2]));
  LUT3 #(
    .INIT(8'hA6)) 
    \axaddr_wrap[3]_i_5__0 
       (.I0(\M00_AXI_0_awaddr[11]_0 [1]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(\axaddr_wrap_reg[3] [1]));
  LUT3 #(
    .INIT(8'hA9)) 
    \axaddr_wrap[3]_i_6__0 
       (.I0(\M00_AXI_0_awaddr[11]_0 [0]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(\axaddr_wrap_reg[3] [0]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_awaddr[0]_INST_0 
       (.I0(Q[0]),
        .I1(\M00_AXI_0_awaddr[11] [0]),
        .I2(\m_axi_awaddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_awaddr[11]_0 [0]),
        .I4(sel_first),
        .I5(Q[37]),
        .O(m_axi_awaddr[0]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_awaddr[10]_INST_0 
       (.I0(Q[10]),
        .I1(\M00_AXI_0_awaddr[11] [10]),
        .I2(\m_axi_awaddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_awaddr[11]_0 [10]),
        .I4(sel_first),
        .I5(Q[37]),
        .O(m_axi_awaddr[10]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_awaddr[11]_INST_0 
       (.I0(Q[11]),
        .I1(\M00_AXI_0_awaddr[11] [11]),
        .I2(\m_axi_awaddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_awaddr[11]_0 [11]),
        .I4(sel_first),
        .I5(Q[37]),
        .O(m_axi_awaddr[11]));
  LUT3 #(
    .INIT(8'h04)) 
    \m_axi_awaddr[11]_INST_0_i_1 
       (.I0(Q[37]),
        .I1(\m_payload_i_reg_n_0_[38] ),
        .I2(sel_first_0),
        .O(\m_axi_awaddr[11]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_awaddr[1]_INST_0 
       (.I0(Q[1]),
        .I1(\M00_AXI_0_awaddr[11] [1]),
        .I2(\m_axi_awaddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_awaddr[11]_0 [1]),
        .I4(sel_first),
        .I5(Q[37]),
        .O(m_axi_awaddr[1]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_awaddr[2]_INST_0 
       (.I0(Q[2]),
        .I1(\M00_AXI_0_awaddr[11] [2]),
        .I2(\m_axi_awaddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_awaddr[11]_0 [2]),
        .I4(sel_first),
        .I5(Q[37]),
        .O(m_axi_awaddr[2]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_awaddr[3]_INST_0 
       (.I0(Q[3]),
        .I1(\M00_AXI_0_awaddr[11] [3]),
        .I2(\m_axi_awaddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_awaddr[11]_0 [3]),
        .I4(sel_first),
        .I5(Q[37]),
        .O(m_axi_awaddr[3]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_awaddr[4]_INST_0 
       (.I0(Q[4]),
        .I1(\M00_AXI_0_awaddr[11] [4]),
        .I2(\m_axi_awaddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_awaddr[11]_0 [4]),
        .I4(sel_first),
        .I5(Q[37]),
        .O(m_axi_awaddr[4]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_awaddr[5]_INST_0 
       (.I0(Q[5]),
        .I1(\M00_AXI_0_awaddr[11] [5]),
        .I2(\m_axi_awaddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_awaddr[11]_0 [5]),
        .I4(sel_first),
        .I5(Q[37]),
        .O(m_axi_awaddr[5]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_awaddr[6]_INST_0 
       (.I0(Q[6]),
        .I1(\M00_AXI_0_awaddr[11] [6]),
        .I2(\m_axi_awaddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_awaddr[11]_0 [6]),
        .I4(sel_first),
        .I5(Q[37]),
        .O(m_axi_awaddr[6]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_awaddr[7]_INST_0 
       (.I0(Q[7]),
        .I1(\M00_AXI_0_awaddr[11] [7]),
        .I2(\m_axi_awaddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_awaddr[11]_0 [7]),
        .I4(sel_first),
        .I5(Q[37]),
        .O(m_axi_awaddr[7]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_awaddr[8]_INST_0 
       (.I0(Q[8]),
        .I1(\M00_AXI_0_awaddr[11] [8]),
        .I2(\m_axi_awaddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_awaddr[11]_0 [8]),
        .I4(sel_first),
        .I5(Q[37]),
        .O(m_axi_awaddr[8]));
  LUT6 #(
    .INIT(64'hCACAFFC0CACACACA)) 
    \m_axi_awaddr[9]_INST_0 
       (.I0(Q[9]),
        .I1(\M00_AXI_0_awaddr[11] [9]),
        .I2(\m_axi_awaddr[11]_INST_0_i_1_n_0 ),
        .I3(\M00_AXI_0_awaddr[11]_0 [9]),
        .I4(sel_first),
        .I5(Q[37]),
        .O(m_axi_awaddr[9]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[0]_i_1 
       (.I0(s_axi_awaddr[0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[0] ),
        .O(skid_buffer[0]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[10]_i_1 
       (.I0(s_axi_awaddr[10]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[10] ),
        .O(skid_buffer[10]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[11]_i_1 
       (.I0(s_axi_awaddr[11]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[11] ),
        .O(skid_buffer[11]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[12]_i_1 
       (.I0(s_axi_awaddr[12]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[12] ),
        .O(skid_buffer[12]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[13]_i_1__0 
       (.I0(s_axi_awaddr[13]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[13] ),
        .O(skid_buffer[13]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[14]_i_1 
       (.I0(s_axi_awaddr[14]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[14] ),
        .O(skid_buffer[14]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[15]_i_1 
       (.I0(s_axi_awaddr[15]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[15] ),
        .O(skid_buffer[15]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[16]_i_1 
       (.I0(s_axi_awaddr[16]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[16] ),
        .O(skid_buffer[16]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[17]_i_1 
       (.I0(s_axi_awaddr[17]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[17] ),
        .O(skid_buffer[17]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[18]_i_1 
       (.I0(s_axi_awaddr[18]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[18] ),
        .O(skid_buffer[18]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[19]_i_1 
       (.I0(s_axi_awaddr[19]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[19] ),
        .O(skid_buffer[19]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[1]_i_1 
       (.I0(s_axi_awaddr[1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[1] ),
        .O(skid_buffer[1]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[20]_i_1 
       (.I0(s_axi_awaddr[20]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[20] ),
        .O(skid_buffer[20]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[21]_i_1 
       (.I0(s_axi_awaddr[21]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[21] ),
        .O(skid_buffer[21]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[22]_i_1 
       (.I0(s_axi_awaddr[22]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[22] ),
        .O(skid_buffer[22]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[23]_i_1 
       (.I0(s_axi_awaddr[23]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[23] ),
        .O(skid_buffer[23]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[24]_i_1 
       (.I0(s_axi_awaddr[24]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[24] ),
        .O(skid_buffer[24]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[25]_i_1 
       (.I0(s_axi_awaddr[25]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[25] ),
        .O(skid_buffer[25]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[26]_i_1 
       (.I0(s_axi_awaddr[26]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[26] ),
        .O(skid_buffer[26]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[27]_i_1 
       (.I0(s_axi_awaddr[27]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[27] ),
        .O(skid_buffer[27]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[28]_i_1 
       (.I0(s_axi_awaddr[28]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[28] ),
        .O(skid_buffer[28]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[29]_i_1 
       (.I0(s_axi_awaddr[29]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[29] ),
        .O(skid_buffer[29]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[2]_i_1 
       (.I0(s_axi_awaddr[2]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[2] ),
        .O(skid_buffer[2]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[30]_i_1 
       (.I0(s_axi_awaddr[30]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[30] ),
        .O(skid_buffer[30]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[31]_i_2 
       (.I0(s_axi_awaddr[31]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[31] ),
        .O(skid_buffer[31]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[32]_i_1 
       (.I0(s_axi_awprot[0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[32] ),
        .O(skid_buffer[32]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[33]_i_1 
       (.I0(s_axi_awprot[1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[33] ),
        .O(skid_buffer[33]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[34]_i_1 
       (.I0(s_axi_awprot[2]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[34] ),
        .O(skid_buffer[34]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[35]_i_1 
       (.I0(s_axi_awsize[0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[35] ),
        .O(skid_buffer[35]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[36]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[36] ),
        .O(skid_buffer[36]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[38]_i_1 
       (.I0(s_axi_awburst[0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[38] ),
        .O(skid_buffer[38]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[39]_i_1 
       (.I0(s_axi_awburst[1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[39] ),
        .O(skid_buffer[39]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[3]_i_1 
       (.I0(s_axi_awaddr[3]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[3] ),
        .O(skid_buffer[3]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[44]_i_1 
       (.I0(s_axi_awlen[0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[44] ),
        .O(skid_buffer[44]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[45]_i_1 
       (.I0(s_axi_awlen[1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[45] ),
        .O(skid_buffer[45]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[46]_i_1__0 
       (.I0(s_axi_awlen[2]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[46] ),
        .O(skid_buffer[46]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[47]_i_1 
       (.I0(s_axi_awlen[3]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[47] ),
        .O(skid_buffer[47]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[4]_i_1 
       (.I0(s_axi_awaddr[4]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[4] ),
        .O(skid_buffer[4]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[50]_i_1 
       (.I0(s_axi_awid[0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[50] ),
        .O(skid_buffer[50]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[51]_i_1 
       (.I0(s_axi_awid[1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[51] ),
        .O(skid_buffer[51]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[52]_i_1 
       (.I0(s_axi_awid[2]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[52] ),
        .O(skid_buffer[52]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[53]_i_1 
       (.I0(s_axi_awid[3]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[53] ),
        .O(skid_buffer[53]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[54]_i_1 
       (.I0(s_axi_awid[4]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[54] ),
        .O(skid_buffer[54]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[55]_i_1 
       (.I0(s_axi_awid[5]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[55] ),
        .O(skid_buffer[55]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[56]_i_1 
       (.I0(s_axi_awid[6]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[56] ),
        .O(skid_buffer[56]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[57]_i_1 
       (.I0(s_axi_awid[7]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[57] ),
        .O(skid_buffer[57]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[58]_i_1 
       (.I0(s_axi_awid[8]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[58] ),
        .O(skid_buffer[58]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[59]_i_1 
       (.I0(s_axi_awid[9]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[59] ),
        .O(skid_buffer[59]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[5]_i_1 
       (.I0(s_axi_awaddr[5]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[5] ),
        .O(skid_buffer[5]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[60]_i_1 
       (.I0(s_axi_awid[10]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[60] ),
        .O(skid_buffer[60]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[61]_i_1 
       (.I0(s_axi_awid[11]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[61] ),
        .O(skid_buffer[61]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[6]_i_1 
       (.I0(s_axi_awaddr[6]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[6] ),
        .O(skid_buffer[6]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[7]_i_1 
       (.I0(s_axi_awaddr[7]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[7] ),
        .O(skid_buffer[7]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[8]_i_1 
       (.I0(s_axi_awaddr[8]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[8] ),
        .O(skid_buffer[8]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[9]_i_1 
       (.I0(s_axi_awaddr[9]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[9] ),
        .O(skid_buffer[9]));
  FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \m_payload_i_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[10]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE \m_payload_i_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[11]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE \m_payload_i_reg[12] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[12]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE \m_payload_i_reg[13] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[13]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE \m_payload_i_reg[14] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[14]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE \m_payload_i_reg[15] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[15]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE \m_payload_i_reg[16] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[16]),
        .Q(Q[16]),
        .R(1'b0));
  FDRE \m_payload_i_reg[17] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[17]),
        .Q(Q[17]),
        .R(1'b0));
  FDRE \m_payload_i_reg[18] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[18]),
        .Q(Q[18]),
        .R(1'b0));
  FDRE \m_payload_i_reg[19] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[19]),
        .Q(Q[19]),
        .R(1'b0));
  FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \m_payload_i_reg[20] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[20]),
        .Q(Q[20]),
        .R(1'b0));
  FDRE \m_payload_i_reg[21] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[21]),
        .Q(Q[21]),
        .R(1'b0));
  FDRE \m_payload_i_reg[22] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[22]),
        .Q(Q[22]),
        .R(1'b0));
  FDRE \m_payload_i_reg[23] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[23]),
        .Q(Q[23]),
        .R(1'b0));
  FDRE \m_payload_i_reg[24] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[24]),
        .Q(Q[24]),
        .R(1'b0));
  FDRE \m_payload_i_reg[25] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[25]),
        .Q(Q[25]),
        .R(1'b0));
  FDRE \m_payload_i_reg[26] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[26]),
        .Q(Q[26]),
        .R(1'b0));
  FDRE \m_payload_i_reg[27] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[27]),
        .Q(Q[27]),
        .R(1'b0));
  FDRE \m_payload_i_reg[28] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[28]),
        .Q(Q[28]),
        .R(1'b0));
  FDRE \m_payload_i_reg[29] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[29]),
        .Q(Q[29]),
        .R(1'b0));
  FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \m_payload_i_reg[30] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[30]),
        .Q(Q[30]),
        .R(1'b0));
  FDRE \m_payload_i_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[31]),
        .Q(Q[31]),
        .R(1'b0));
  FDRE \m_payload_i_reg[32] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[32]),
        .Q(Q[32]),
        .R(1'b0));
  FDRE \m_payload_i_reg[33] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[33]),
        .Q(Q[33]),
        .R(1'b0));
  FDRE \m_payload_i_reg[34] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[34]),
        .Q(Q[34]),
        .R(1'b0));
  FDRE \m_payload_i_reg[35] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[35]),
        .Q(Q[35]),
        .R(1'b0));
  FDRE \m_payload_i_reg[36] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[36]),
        .Q(Q[36]),
        .R(1'b0));
  FDRE \m_payload_i_reg[38] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[38]),
        .Q(\m_payload_i_reg_n_0_[38] ),
        .R(1'b0));
  FDRE \m_payload_i_reg[39] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[39]),
        .Q(Q[37]),
        .R(1'b0));
  FDRE \m_payload_i_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \m_payload_i_reg[44] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[44]),
        .Q(Q[38]),
        .R(1'b0));
  FDRE \m_payload_i_reg[45] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[45]),
        .Q(Q[39]),
        .R(1'b0));
  FDRE \m_payload_i_reg[46] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[46]),
        .Q(Q[40]),
        .R(1'b0));
  FDRE \m_payload_i_reg[47] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[47]),
        .Q(Q[41]),
        .R(1'b0));
  FDRE \m_payload_i_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \m_payload_i_reg[50] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[50]),
        .Q(Q[42]),
        .R(1'b0));
  FDRE \m_payload_i_reg[51] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[51]),
        .Q(Q[43]),
        .R(1'b0));
  FDRE \m_payload_i_reg[52] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[52]),
        .Q(Q[44]),
        .R(1'b0));
  FDRE \m_payload_i_reg[53] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[53]),
        .Q(Q[45]),
        .R(1'b0));
  FDRE \m_payload_i_reg[54] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[54]),
        .Q(Q[46]),
        .R(1'b0));
  FDRE \m_payload_i_reg[55] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[55]),
        .Q(Q[47]),
        .R(1'b0));
  FDRE \m_payload_i_reg[56] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[56]),
        .Q(Q[48]),
        .R(1'b0));
  FDRE \m_payload_i_reg[57] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[57]),
        .Q(Q[49]),
        .R(1'b0));
  FDRE \m_payload_i_reg[58] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[58]),
        .Q(Q[50]),
        .R(1'b0));
  FDRE \m_payload_i_reg[59] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[59]),
        .Q(Q[51]),
        .R(1'b0));
  FDRE \m_payload_i_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \m_payload_i_reg[60] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[60]),
        .Q(Q[52]),
        .R(1'b0));
  FDRE \m_payload_i_reg[61] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[61]),
        .Q(Q[53]),
        .R(1'b0));
  FDRE \m_payload_i_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE \m_payload_i_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE \m_payload_i_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE \m_payload_i_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[9]),
        .Q(Q[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hF4FF)) 
    m_valid_i_i_1__2
       (.I0(b_push),
        .I1(m_valid_i_reg_0),
        .I2(s_axi_awvalid),
        .I3(s_ready_i_reg_0),
        .O(m_valid_i0));
  FDRE #(
    .INIT(1'b0)) 
    m_valid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(m_valid_i0),
        .Q(m_valid_i_reg_0),
        .R(m_valid_i_reg_1));
  LUT5 #(
    .INIT(32'h0000FFFE)) 
    next_pending_r_i_4
       (.I0(Q[39]),
        .I1(Q[38]),
        .I2(Q[40]),
        .I3(Q[41]),
        .I4(next_pending_r_reg),
        .O(\m_payload_i_reg[45]_0 ));
  LUT4 #(
    .INIT(16'hBFBB)) 
    s_ready_i_i_2
       (.I0(b_push),
        .I1(m_valid_i_reg_0),
        .I2(s_axi_awvalid),
        .I3(s_ready_i_reg_0),
        .O(s_ready_i0));
  FDRE #(
    .INIT(1'b0)) 
    s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_ready_i0),
        .Q(s_ready_i_reg_0),
        .R(s_ready_i_reg_1));
  FDRE \skid_buffer_reg[0] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[0]),
        .Q(\skid_buffer_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[10] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[10]),
        .Q(\skid_buffer_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[11] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[11]),
        .Q(\skid_buffer_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[12] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[12]),
        .Q(\skid_buffer_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[13] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[13]),
        .Q(\skid_buffer_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[14] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[14]),
        .Q(\skid_buffer_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[15] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[15]),
        .Q(\skid_buffer_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[16] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[16]),
        .Q(\skid_buffer_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[17] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[17]),
        .Q(\skid_buffer_reg_n_0_[17] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[18] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[18]),
        .Q(\skid_buffer_reg_n_0_[18] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[19] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[19]),
        .Q(\skid_buffer_reg_n_0_[19] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[1] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[1]),
        .Q(\skid_buffer_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[20] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[20]),
        .Q(\skid_buffer_reg_n_0_[20] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[21] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[21]),
        .Q(\skid_buffer_reg_n_0_[21] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[22] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[22]),
        .Q(\skid_buffer_reg_n_0_[22] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[23] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[23]),
        .Q(\skid_buffer_reg_n_0_[23] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[24] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[24]),
        .Q(\skid_buffer_reg_n_0_[24] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[25] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[25]),
        .Q(\skid_buffer_reg_n_0_[25] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[26] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[26]),
        .Q(\skid_buffer_reg_n_0_[26] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[27] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[27]),
        .Q(\skid_buffer_reg_n_0_[27] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[28] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[28]),
        .Q(\skid_buffer_reg_n_0_[28] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[29] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[29]),
        .Q(\skid_buffer_reg_n_0_[29] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[2] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[2]),
        .Q(\skid_buffer_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[30] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[30]),
        .Q(\skid_buffer_reg_n_0_[30] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[31] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[31]),
        .Q(\skid_buffer_reg_n_0_[31] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[32] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awprot[0]),
        .Q(\skid_buffer_reg_n_0_[32] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[33] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awprot[1]),
        .Q(\skid_buffer_reg_n_0_[33] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[34] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awprot[2]),
        .Q(\skid_buffer_reg_n_0_[34] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[35] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awsize[0]),
        .Q(\skid_buffer_reg_n_0_[35] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[36] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awsize[1]),
        .Q(\skid_buffer_reg_n_0_[36] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[38] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awburst[0]),
        .Q(\skid_buffer_reg_n_0_[38] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[39] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awburst[1]),
        .Q(\skid_buffer_reg_n_0_[39] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[3] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[3]),
        .Q(\skid_buffer_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[44] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awlen[0]),
        .Q(\skid_buffer_reg_n_0_[44] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[45] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awlen[1]),
        .Q(\skid_buffer_reg_n_0_[45] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[46] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awlen[2]),
        .Q(\skid_buffer_reg_n_0_[46] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[47] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awlen[3]),
        .Q(\skid_buffer_reg_n_0_[47] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[4] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[4]),
        .Q(\skid_buffer_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[50] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awid[0]),
        .Q(\skid_buffer_reg_n_0_[50] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[51] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awid[1]),
        .Q(\skid_buffer_reg_n_0_[51] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[52] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awid[2]),
        .Q(\skid_buffer_reg_n_0_[52] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[53] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awid[3]),
        .Q(\skid_buffer_reg_n_0_[53] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[54] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awid[4]),
        .Q(\skid_buffer_reg_n_0_[54] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[55] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awid[5]),
        .Q(\skid_buffer_reg_n_0_[55] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[56] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awid[6]),
        .Q(\skid_buffer_reg_n_0_[56] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[57] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awid[7]),
        .Q(\skid_buffer_reg_n_0_[57] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[58] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awid[8]),
        .Q(\skid_buffer_reg_n_0_[58] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[59] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awid[9]),
        .Q(\skid_buffer_reg_n_0_[59] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[5] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[5]),
        .Q(\skid_buffer_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[60] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awid[10]),
        .Q(\skid_buffer_reg_n_0_[60] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[61] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awid[11]),
        .Q(\skid_buffer_reg_n_0_[61] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[6] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[6]),
        .Q(\skid_buffer_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[7] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[7]),
        .Q(\skid_buffer_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[8] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[8]),
        .Q(\skid_buffer_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[9] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(s_axi_awaddr[9]),
        .Q(\skid_buffer_reg_n_0_[9] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hA8AA)) 
    \wrap_boundary_axaddr_r[0]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[36]),
        .I2(Q[35]),
        .I3(Q[38]),
        .O(\m_payload_i_reg[6]_1 [0]));
  LUT5 #(
    .INIT(32'hDDCF0000)) 
    \wrap_boundary_axaddr_r[1]_i_1__0 
       (.I0(Q[38]),
        .I1(Q[36]),
        .I2(Q[39]),
        .I3(Q[35]),
        .I4(Q[1]),
        .O(\m_payload_i_reg[6]_1 [1]));
  LUT6 #(
    .INIT(64'hA200A20AA2A0A2AA)) 
    \wrap_boundary_axaddr_r[2]_i_1__0 
       (.I0(Q[2]),
        .I1(Q[39]),
        .I2(Q[36]),
        .I3(Q[35]),
        .I4(Q[40]),
        .I5(Q[38]),
        .O(\m_payload_i_reg[6]_1 [2]));
  LUT6 #(
    .INIT(64'hFFFFFFFF0040004C)) 
    \wrap_boundary_axaddr_r[3]_i_1__0 
       (.I0(Q[39]),
        .I1(Q[3]),
        .I2(Q[36]),
        .I3(Q[35]),
        .I4(Q[41]),
        .I5(\wrap_boundary_axaddr_r[3]_i_2__0_n_0 ),
        .O(\m_payload_i_reg[6]_1 [3]));
  LUT5 #(
    .INIT(32'h30500000)) 
    \wrap_boundary_axaddr_r[3]_i_2__0 
       (.I0(Q[40]),
        .I1(Q[38]),
        .I2(Q[35]),
        .I3(Q[36]),
        .I4(Q[3]),
        .O(\wrap_boundary_axaddr_r[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h000A22AAAA0A22AA)) 
    \wrap_boundary_axaddr_r[4]_i_1__0 
       (.I0(Q[4]),
        .I1(Q[40]),
        .I2(Q[41]),
        .I3(Q[36]),
        .I4(Q[35]),
        .I5(Q[39]),
        .O(\m_payload_i_reg[6]_1 [4]));
  LUT5 #(
    .INIT(32'h44CC0CCC)) 
    \wrap_boundary_axaddr_r[5]_i_1__0 
       (.I0(Q[40]),
        .I1(Q[5]),
        .I2(Q[41]),
        .I3(Q[36]),
        .I4(Q[35]),
        .O(\m_payload_i_reg[6]_1 [5]));
  LUT4 #(
    .INIT(16'h2AAA)) 
    \wrap_boundary_axaddr_r[6]_i_1__0 
       (.I0(Q[6]),
        .I1(Q[36]),
        .I2(Q[35]),
        .I3(Q[41]),
        .O(\m_payload_i_reg[6]_1 [6]));
  LUT5 #(
    .INIT(32'h00002000)) 
    \wrap_second_len_r[3]_i_2 
       (.I0(\axaddr_offset_r_reg[2] [0]),
        .I1(\axaddr_offset_r_reg[2] [1]),
        .I2(m_valid_i_reg_0),
        .I3(Q[41]),
        .I4(\m_payload_i_reg[6]_0 ),
        .O(\FSM_sequential_state_reg[0] ));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_22_axic_register_slice" *) 
module dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized1
   (m_valid_i_reg_0,
    s_ready_i_reg_0,
    shandshake,
    \m_payload_i_reg[13]_0 ,
    m_valid_i_reg_1,
    aclk,
    s_ready_i_reg_1,
    si_rs_bvalid,
    s_axi_bready,
    out,
    \skid_buffer_reg[1]_0 );
  output m_valid_i_reg_0;
  output s_ready_i_reg_0;
  output shandshake;
  output [13:0]\m_payload_i_reg[13]_0 ;
  input m_valid_i_reg_1;
  input aclk;
  input s_ready_i_reg_1;
  input si_rs_bvalid;
  input s_axi_bready;
  input [11:0]out;
  input [1:0]\skid_buffer_reg[1]_0 ;

  wire aclk;
  wire \m_payload_i[0]_i_1__1_n_0 ;
  wire \m_payload_i[10]_i_1__1_n_0 ;
  wire \m_payload_i[11]_i_1__1_n_0 ;
  wire \m_payload_i[12]_i_1__1_n_0 ;
  wire \m_payload_i[13]_i_2_n_0 ;
  wire \m_payload_i[1]_i_1__1_n_0 ;
  wire \m_payload_i[2]_i_1__1_n_0 ;
  wire \m_payload_i[3]_i_1__1_n_0 ;
  wire \m_payload_i[4]_i_1__1_n_0 ;
  wire \m_payload_i[5]_i_1__1_n_0 ;
  wire \m_payload_i[6]_i_1__1_n_0 ;
  wire \m_payload_i[7]_i_1__1_n_0 ;
  wire \m_payload_i[8]_i_1__1_n_0 ;
  wire \m_payload_i[9]_i_1__1_n_0 ;
  wire [13:0]\m_payload_i_reg[13]_0 ;
  wire m_valid_i0;
  wire m_valid_i_reg_0;
  wire m_valid_i_reg_1;
  wire [11:0]out;
  wire p_1_in;
  wire s_axi_bready;
  wire s_ready_i0;
  wire s_ready_i_reg_0;
  wire s_ready_i_reg_1;
  wire shandshake;
  wire si_rs_bvalid;
  wire [1:0]\skid_buffer_reg[1]_0 ;
  wire \skid_buffer_reg_n_0_[0] ;
  wire \skid_buffer_reg_n_0_[10] ;
  wire \skid_buffer_reg_n_0_[11] ;
  wire \skid_buffer_reg_n_0_[12] ;
  wire \skid_buffer_reg_n_0_[13] ;
  wire \skid_buffer_reg_n_0_[1] ;
  wire \skid_buffer_reg_n_0_[2] ;
  wire \skid_buffer_reg_n_0_[3] ;
  wire \skid_buffer_reg_n_0_[4] ;
  wire \skid_buffer_reg_n_0_[5] ;
  wire \skid_buffer_reg_n_0_[6] ;
  wire \skid_buffer_reg_n_0_[7] ;
  wire \skid_buffer_reg_n_0_[8] ;
  wire \skid_buffer_reg_n_0_[9] ;

  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[0]_i_1__1 
       (.I0(\skid_buffer_reg[1]_0 [0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[0] ),
        .O(\m_payload_i[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[10]_i_1__1 
       (.I0(out[8]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[10] ),
        .O(\m_payload_i[10]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[11]_i_1__1 
       (.I0(out[9]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[11] ),
        .O(\m_payload_i[11]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[12]_i_1__1 
       (.I0(out[10]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[12] ),
        .O(\m_payload_i[12]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \m_payload_i[13]_i_1 
       (.I0(s_axi_bready),
        .I1(m_valid_i_reg_0),
        .O(p_1_in));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[13]_i_2 
       (.I0(out[11]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[13] ),
        .O(\m_payload_i[13]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[1]_i_1__1 
       (.I0(\skid_buffer_reg[1]_0 [1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[1] ),
        .O(\m_payload_i[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[2]_i_1__1 
       (.I0(out[0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[2] ),
        .O(\m_payload_i[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[3]_i_1__1 
       (.I0(out[1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[3] ),
        .O(\m_payload_i[3]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[4]_i_1__1 
       (.I0(out[2]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[4] ),
        .O(\m_payload_i[4]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[5]_i_1__1 
       (.I0(out[3]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[5] ),
        .O(\m_payload_i[5]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[6]_i_1__1 
       (.I0(out[4]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[6] ),
        .O(\m_payload_i[6]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[7]_i_1__1 
       (.I0(out[5]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[7] ),
        .O(\m_payload_i[7]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[8]_i_1__1 
       (.I0(out[6]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[8] ),
        .O(\m_payload_i[8]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[9]_i_1__1 
       (.I0(out[7]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[9] ),
        .O(\m_payload_i[9]_i_1__1_n_0 ));
  FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[0]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [0]),
        .R(1'b0));
  FDRE \m_payload_i_reg[10] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[10]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [10]),
        .R(1'b0));
  FDRE \m_payload_i_reg[11] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[11]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [11]),
        .R(1'b0));
  FDRE \m_payload_i_reg[12] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[12]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [12]),
        .R(1'b0));
  FDRE \m_payload_i_reg[13] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[13]_i_2_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [13]),
        .R(1'b0));
  FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[1]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [1]),
        .R(1'b0));
  FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[2]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [2]),
        .R(1'b0));
  FDRE \m_payload_i_reg[3] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[3]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [3]),
        .R(1'b0));
  FDRE \m_payload_i_reg[4] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[4]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [4]),
        .R(1'b0));
  FDRE \m_payload_i_reg[5] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[5]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [5]),
        .R(1'b0));
  FDRE \m_payload_i_reg[6] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[6]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [6]),
        .R(1'b0));
  FDRE \m_payload_i_reg[7] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[7]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [7]),
        .R(1'b0));
  FDRE \m_payload_i_reg[8] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[8]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [8]),
        .R(1'b0));
  FDRE \m_payload_i_reg[9] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[9]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[13]_0 [9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hF4FF)) 
    m_valid_i_i_1__0
       (.I0(s_axi_bready),
        .I1(m_valid_i_reg_0),
        .I2(si_rs_bvalid),
        .I3(s_ready_i_reg_0),
        .O(m_valid_i0));
  FDRE #(
    .INIT(1'b0)) 
    m_valid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(m_valid_i0),
        .Q(m_valid_i_reg_0),
        .R(m_valid_i_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'hF4FF)) 
    s_ready_i_i_1__0
       (.I0(si_rs_bvalid),
        .I1(s_ready_i_reg_0),
        .I2(s_axi_bready),
        .I3(m_valid_i_reg_0),
        .O(s_ready_i0));
  FDRE #(
    .INIT(1'b0)) 
    s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_ready_i0),
        .Q(s_ready_i_reg_0),
        .R(s_ready_i_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h8)) 
    shandshake_r_i_1
       (.I0(s_ready_i_reg_0),
        .I1(si_rs_bvalid),
        .O(shandshake));
  FDRE \skid_buffer_reg[0] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[1]_0 [0]),
        .Q(\skid_buffer_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[10] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(out[8]),
        .Q(\skid_buffer_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[11] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(out[9]),
        .Q(\skid_buffer_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[12] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(out[10]),
        .Q(\skid_buffer_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[13] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(out[11]),
        .Q(\skid_buffer_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[1] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[1]_0 [1]),
        .Q(\skid_buffer_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[2] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(out[0]),
        .Q(\skid_buffer_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[3] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(out[1]),
        .Q(\skid_buffer_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[4] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(out[2]),
        .Q(\skid_buffer_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[5] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(out[3]),
        .Q(\skid_buffer_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[6] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(out[4]),
        .Q(\skid_buffer_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[7] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(out[5]),
        .Q(\skid_buffer_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[8] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(out[6]),
        .Q(\skid_buffer_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[9] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(out[7]),
        .Q(\skid_buffer_reg_n_0_[9] ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_22_axic_register_slice" *) 
module dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized2
   (m_valid_i_reg_0,
    \aresetn_d_reg[1]_inv_0 ,
    s_ready_i_reg_0,
    s_ready_i_reg_1,
    \m_payload_i_reg[46]_0 ,
    aclk,
    s_ready_i_reg_2,
    \aresetn_d_reg[1]_inv_1 ,
    m_valid_i_reg_1,
    s_axi_rready,
    \skid_buffer_reg[46]_0 ,
    \skid_buffer_reg[33]_0 );
  output m_valid_i_reg_0;
  output \aresetn_d_reg[1]_inv_0 ;
  output s_ready_i_reg_0;
  output s_ready_i_reg_1;
  output [46:0]\m_payload_i_reg[46]_0 ;
  input aclk;
  input s_ready_i_reg_2;
  input \aresetn_d_reg[1]_inv_1 ;
  input m_valid_i_reg_1;
  input s_axi_rready;
  input [12:0]\skid_buffer_reg[46]_0 ;
  input [33:0]\skid_buffer_reg[33]_0 ;

  wire aclk;
  wire \aresetn_d_reg[1]_inv_0 ;
  wire \aresetn_d_reg[1]_inv_1 ;
  wire \m_payload_i[0]_i_1__2_n_0 ;
  wire \m_payload_i[10]_i_1__2_n_0 ;
  wire \m_payload_i[11]_i_1__2_n_0 ;
  wire \m_payload_i[12]_i_1__2_n_0 ;
  wire \m_payload_i[13]_i_1__2_n_0 ;
  wire \m_payload_i[14]_i_1__1_n_0 ;
  wire \m_payload_i[15]_i_1__1_n_0 ;
  wire \m_payload_i[16]_i_1__1_n_0 ;
  wire \m_payload_i[17]_i_1__1_n_0 ;
  wire \m_payload_i[18]_i_1__1_n_0 ;
  wire \m_payload_i[19]_i_1__1_n_0 ;
  wire \m_payload_i[1]_i_1__2_n_0 ;
  wire \m_payload_i[20]_i_1__1_n_0 ;
  wire \m_payload_i[21]_i_1__1_n_0 ;
  wire \m_payload_i[22]_i_1__1_n_0 ;
  wire \m_payload_i[23]_i_1__1_n_0 ;
  wire \m_payload_i[24]_i_1__1_n_0 ;
  wire \m_payload_i[25]_i_1__1_n_0 ;
  wire \m_payload_i[26]_i_1__1_n_0 ;
  wire \m_payload_i[27]_i_1__1_n_0 ;
  wire \m_payload_i[28]_i_1__1_n_0 ;
  wire \m_payload_i[29]_i_1__1_n_0 ;
  wire \m_payload_i[2]_i_1__2_n_0 ;
  wire \m_payload_i[30]_i_1__1_n_0 ;
  wire \m_payload_i[31]_i_1__0_n_0 ;
  wire \m_payload_i[32]_i_1__1_n_0 ;
  wire \m_payload_i[33]_i_1__1_n_0 ;
  wire \m_payload_i[34]_i_1__1_n_0 ;
  wire \m_payload_i[35]_i_1__1_n_0 ;
  wire \m_payload_i[36]_i_1__1_n_0 ;
  wire \m_payload_i[37]_i_1_n_0 ;
  wire \m_payload_i[38]_i_1__1_n_0 ;
  wire \m_payload_i[39]_i_1__1_n_0 ;
  wire \m_payload_i[3]_i_1__2_n_0 ;
  wire \m_payload_i[40]_i_1_n_0 ;
  wire \m_payload_i[41]_i_1_n_0 ;
  wire \m_payload_i[42]_i_1_n_0 ;
  wire \m_payload_i[43]_i_1_n_0 ;
  wire \m_payload_i[44]_i_1__1_n_0 ;
  wire \m_payload_i[45]_i_1__1_n_0 ;
  wire \m_payload_i[46]_i_2_n_0 ;
  wire \m_payload_i[4]_i_1__2_n_0 ;
  wire \m_payload_i[5]_i_1__2_n_0 ;
  wire \m_payload_i[6]_i_1__2_n_0 ;
  wire \m_payload_i[7]_i_1__2_n_0 ;
  wire \m_payload_i[8]_i_1__2_n_0 ;
  wire \m_payload_i[9]_i_1__2_n_0 ;
  wire [46:0]\m_payload_i_reg[46]_0 ;
  wire m_valid_i_i_1__1_n_0;
  wire m_valid_i_reg_0;
  wire m_valid_i_reg_1;
  wire p_1_in;
  wire s_axi_rready;
  wire s_ready_i_i_1__2_n_0;
  wire s_ready_i_reg_0;
  wire s_ready_i_reg_1;
  wire s_ready_i_reg_2;
  wire [33:0]\skid_buffer_reg[33]_0 ;
  wire [12:0]\skid_buffer_reg[46]_0 ;
  wire \skid_buffer_reg_n_0_[0] ;
  wire \skid_buffer_reg_n_0_[10] ;
  wire \skid_buffer_reg_n_0_[11] ;
  wire \skid_buffer_reg_n_0_[12] ;
  wire \skid_buffer_reg_n_0_[13] ;
  wire \skid_buffer_reg_n_0_[14] ;
  wire \skid_buffer_reg_n_0_[15] ;
  wire \skid_buffer_reg_n_0_[16] ;
  wire \skid_buffer_reg_n_0_[17] ;
  wire \skid_buffer_reg_n_0_[18] ;
  wire \skid_buffer_reg_n_0_[19] ;
  wire \skid_buffer_reg_n_0_[1] ;
  wire \skid_buffer_reg_n_0_[20] ;
  wire \skid_buffer_reg_n_0_[21] ;
  wire \skid_buffer_reg_n_0_[22] ;
  wire \skid_buffer_reg_n_0_[23] ;
  wire \skid_buffer_reg_n_0_[24] ;
  wire \skid_buffer_reg_n_0_[25] ;
  wire \skid_buffer_reg_n_0_[26] ;
  wire \skid_buffer_reg_n_0_[27] ;
  wire \skid_buffer_reg_n_0_[28] ;
  wire \skid_buffer_reg_n_0_[29] ;
  wire \skid_buffer_reg_n_0_[2] ;
  wire \skid_buffer_reg_n_0_[30] ;
  wire \skid_buffer_reg_n_0_[31] ;
  wire \skid_buffer_reg_n_0_[32] ;
  wire \skid_buffer_reg_n_0_[33] ;
  wire \skid_buffer_reg_n_0_[34] ;
  wire \skid_buffer_reg_n_0_[35] ;
  wire \skid_buffer_reg_n_0_[36] ;
  wire \skid_buffer_reg_n_0_[37] ;
  wire \skid_buffer_reg_n_0_[38] ;
  wire \skid_buffer_reg_n_0_[39] ;
  wire \skid_buffer_reg_n_0_[3] ;
  wire \skid_buffer_reg_n_0_[40] ;
  wire \skid_buffer_reg_n_0_[41] ;
  wire \skid_buffer_reg_n_0_[42] ;
  wire \skid_buffer_reg_n_0_[43] ;
  wire \skid_buffer_reg_n_0_[44] ;
  wire \skid_buffer_reg_n_0_[45] ;
  wire \skid_buffer_reg_n_0_[46] ;
  wire \skid_buffer_reg_n_0_[4] ;
  wire \skid_buffer_reg_n_0_[5] ;
  wire \skid_buffer_reg_n_0_[6] ;
  wire \skid_buffer_reg_n_0_[7] ;
  wire \skid_buffer_reg_n_0_[8] ;
  wire \skid_buffer_reg_n_0_[9] ;

  (* inverted = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \aresetn_d_reg[1]_inv 
       (.C(aclk),
        .CE(1'b1),
        .D(\aresetn_d_reg[1]_inv_1 ),
        .Q(\aresetn_d_reg[1]_inv_0 ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_read[4]_i_3__0 
       (.I0(s_ready_i_reg_0),
        .I1(m_valid_i_reg_1),
        .O(s_ready_i_reg_1));
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[0]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[0] ),
        .O(\m_payload_i[0]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[10]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [10]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[10] ),
        .O(\m_payload_i[10]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[11]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [11]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[11] ),
        .O(\m_payload_i[11]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[12]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [12]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[12] ),
        .O(\m_payload_i[12]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[13]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [13]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[13] ),
        .O(\m_payload_i[13]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[14]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [14]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[14] ),
        .O(\m_payload_i[14]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[15]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [15]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[15] ),
        .O(\m_payload_i[15]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[16]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [16]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[16] ),
        .O(\m_payload_i[16]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[17]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [17]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[17] ),
        .O(\m_payload_i[17]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[18]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [18]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[18] ),
        .O(\m_payload_i[18]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[19]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [19]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[19] ),
        .O(\m_payload_i[19]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[1]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[1] ),
        .O(\m_payload_i[1]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[20]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [20]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[20] ),
        .O(\m_payload_i[20]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[21]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [21]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[21] ),
        .O(\m_payload_i[21]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[22]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [22]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[22] ),
        .O(\m_payload_i[22]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[23]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [23]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[23] ),
        .O(\m_payload_i[23]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[24]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [24]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[24] ),
        .O(\m_payload_i[24]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[25]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [25]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[25] ),
        .O(\m_payload_i[25]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[26]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [26]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[26] ),
        .O(\m_payload_i[26]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[27]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [27]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[27] ),
        .O(\m_payload_i[27]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[28]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [28]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[28] ),
        .O(\m_payload_i[28]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[29]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [29]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[29] ),
        .O(\m_payload_i[29]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[2]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [2]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[2] ),
        .O(\m_payload_i[2]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[30]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [30]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[30] ),
        .O(\m_payload_i[30]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[31]_i_1__0 
       (.I0(\skid_buffer_reg[33]_0 [31]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[31] ),
        .O(\m_payload_i[31]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[32]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [32]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[32] ),
        .O(\m_payload_i[32]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[33]_i_1__1 
       (.I0(\skid_buffer_reg[33]_0 [33]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[33] ),
        .O(\m_payload_i[33]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[34]_i_1__1 
       (.I0(\skid_buffer_reg[46]_0 [0]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[34] ),
        .O(\m_payload_i[34]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[35]_i_1__1 
       (.I0(\skid_buffer_reg[46]_0 [1]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[35] ),
        .O(\m_payload_i[35]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[36]_i_1__1 
       (.I0(\skid_buffer_reg[46]_0 [2]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[36] ),
        .O(\m_payload_i[36]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[37]_i_1 
       (.I0(\skid_buffer_reg[46]_0 [3]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[37] ),
        .O(\m_payload_i[37]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[38]_i_1__1 
       (.I0(\skid_buffer_reg[46]_0 [4]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[38] ),
        .O(\m_payload_i[38]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[39]_i_1__1 
       (.I0(\skid_buffer_reg[46]_0 [5]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[39] ),
        .O(\m_payload_i[39]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[3]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [3]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[3] ),
        .O(\m_payload_i[3]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[40]_i_1 
       (.I0(\skid_buffer_reg[46]_0 [6]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[40] ),
        .O(\m_payload_i[40]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[41]_i_1 
       (.I0(\skid_buffer_reg[46]_0 [7]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[41] ),
        .O(\m_payload_i[41]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[42]_i_1 
       (.I0(\skid_buffer_reg[46]_0 [8]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[42] ),
        .O(\m_payload_i[42]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[43]_i_1 
       (.I0(\skid_buffer_reg[46]_0 [9]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[43] ),
        .O(\m_payload_i[43]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[44]_i_1__1 
       (.I0(\skid_buffer_reg[46]_0 [10]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[44] ),
        .O(\m_payload_i[44]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[45]_i_1__1 
       (.I0(\skid_buffer_reg[46]_0 [11]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[45] ),
        .O(\m_payload_i[45]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \m_payload_i[46]_i_1 
       (.I0(s_axi_rready),
        .I1(m_valid_i_reg_0),
        .O(p_1_in));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[46]_i_2 
       (.I0(\skid_buffer_reg[46]_0 [12]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[46] ),
        .O(\m_payload_i[46]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[4]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [4]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[4] ),
        .O(\m_payload_i[4]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[5]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [5]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[5] ),
        .O(\m_payload_i[5]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[6]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [6]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[6] ),
        .O(\m_payload_i[6]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[7]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [7]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[7] ),
        .O(\m_payload_i[7]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[8]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [8]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[8] ),
        .O(\m_payload_i[8]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[9]_i_1__2 
       (.I0(\skid_buffer_reg[33]_0 [9]),
        .I1(s_ready_i_reg_0),
        .I2(\skid_buffer_reg_n_0_[9] ),
        .O(\m_payload_i[9]_i_1__2_n_0 ));
  FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[0]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [0]),
        .R(1'b0));
  FDRE \m_payload_i_reg[10] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[10]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [10]),
        .R(1'b0));
  FDRE \m_payload_i_reg[11] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[11]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [11]),
        .R(1'b0));
  FDRE \m_payload_i_reg[12] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[12]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [12]),
        .R(1'b0));
  FDRE \m_payload_i_reg[13] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[13]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [13]),
        .R(1'b0));
  FDRE \m_payload_i_reg[14] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[14]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [14]),
        .R(1'b0));
  FDRE \m_payload_i_reg[15] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[15]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [15]),
        .R(1'b0));
  FDRE \m_payload_i_reg[16] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[16]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [16]),
        .R(1'b0));
  FDRE \m_payload_i_reg[17] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[17]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [17]),
        .R(1'b0));
  FDRE \m_payload_i_reg[18] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[18]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [18]),
        .R(1'b0));
  FDRE \m_payload_i_reg[19] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[19]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [19]),
        .R(1'b0));
  FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[1]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [1]),
        .R(1'b0));
  FDRE \m_payload_i_reg[20] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[20]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [20]),
        .R(1'b0));
  FDRE \m_payload_i_reg[21] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[21]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [21]),
        .R(1'b0));
  FDRE \m_payload_i_reg[22] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[22]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [22]),
        .R(1'b0));
  FDRE \m_payload_i_reg[23] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[23]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [23]),
        .R(1'b0));
  FDRE \m_payload_i_reg[24] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[24]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [24]),
        .R(1'b0));
  FDRE \m_payload_i_reg[25] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[25]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [25]),
        .R(1'b0));
  FDRE \m_payload_i_reg[26] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[26]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [26]),
        .R(1'b0));
  FDRE \m_payload_i_reg[27] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[27]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [27]),
        .R(1'b0));
  FDRE \m_payload_i_reg[28] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[28]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [28]),
        .R(1'b0));
  FDRE \m_payload_i_reg[29] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[29]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [29]),
        .R(1'b0));
  FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[2]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [2]),
        .R(1'b0));
  FDRE \m_payload_i_reg[30] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[30]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [30]),
        .R(1'b0));
  FDRE \m_payload_i_reg[31] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[31]_i_1__0_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [31]),
        .R(1'b0));
  FDRE \m_payload_i_reg[32] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[32]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [32]),
        .R(1'b0));
  FDRE \m_payload_i_reg[33] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[33]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [33]),
        .R(1'b0));
  FDRE \m_payload_i_reg[34] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[34]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [34]),
        .R(1'b0));
  FDRE \m_payload_i_reg[35] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[35]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [35]),
        .R(1'b0));
  FDRE \m_payload_i_reg[36] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[36]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [36]),
        .R(1'b0));
  FDRE \m_payload_i_reg[37] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[37]_i_1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [37]),
        .R(1'b0));
  FDRE \m_payload_i_reg[38] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[38]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [38]),
        .R(1'b0));
  FDRE \m_payload_i_reg[39] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[39]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [39]),
        .R(1'b0));
  FDRE \m_payload_i_reg[3] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[3]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [3]),
        .R(1'b0));
  FDRE \m_payload_i_reg[40] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[40]_i_1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [40]),
        .R(1'b0));
  FDRE \m_payload_i_reg[41] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[41]_i_1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [41]),
        .R(1'b0));
  FDRE \m_payload_i_reg[42] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[42]_i_1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [42]),
        .R(1'b0));
  FDRE \m_payload_i_reg[43] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[43]_i_1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [43]),
        .R(1'b0));
  FDRE \m_payload_i_reg[44] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[44]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [44]),
        .R(1'b0));
  FDRE \m_payload_i_reg[45] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[45]_i_1__1_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [45]),
        .R(1'b0));
  FDRE \m_payload_i_reg[46] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[46]_i_2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [46]),
        .R(1'b0));
  FDRE \m_payload_i_reg[4] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[4]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [4]),
        .R(1'b0));
  FDRE \m_payload_i_reg[5] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[5]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [5]),
        .R(1'b0));
  FDRE \m_payload_i_reg[6] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[6]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [6]),
        .R(1'b0));
  FDRE \m_payload_i_reg[7] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[7]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [7]),
        .R(1'b0));
  FDRE \m_payload_i_reg[8] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[8]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [8]),
        .R(1'b0));
  FDRE \m_payload_i_reg[9] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[9]_i_1__2_n_0 ),
        .Q(\m_payload_i_reg[46]_0 [9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h4FFF)) 
    m_valid_i_i_1__1
       (.I0(s_axi_rready),
        .I1(m_valid_i_reg_0),
        .I2(m_valid_i_reg_1),
        .I3(s_ready_i_reg_0),
        .O(m_valid_i_i_1__1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    m_valid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(m_valid_i_i_1__1_n_0),
        .Q(m_valid_i_reg_0),
        .R(\aresetn_d_reg[1]_inv_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT4 #(
    .INIT(16'hF8FF)) 
    s_ready_i_i_1__2
       (.I0(m_valid_i_reg_1),
        .I1(s_ready_i_reg_0),
        .I2(s_axi_rready),
        .I3(m_valid_i_reg_0),
        .O(s_ready_i_i_1__2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_ready_i_i_1__2_n_0),
        .Q(s_ready_i_reg_0),
        .R(s_ready_i_reg_2));
  FDRE \skid_buffer_reg[0] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [0]),
        .Q(\skid_buffer_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[10] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [10]),
        .Q(\skid_buffer_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[11] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [11]),
        .Q(\skid_buffer_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[12] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [12]),
        .Q(\skid_buffer_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[13] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [13]),
        .Q(\skid_buffer_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[14] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [14]),
        .Q(\skid_buffer_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[15] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [15]),
        .Q(\skid_buffer_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[16] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [16]),
        .Q(\skid_buffer_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[17] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [17]),
        .Q(\skid_buffer_reg_n_0_[17] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[18] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [18]),
        .Q(\skid_buffer_reg_n_0_[18] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[19] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [19]),
        .Q(\skid_buffer_reg_n_0_[19] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[1] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [1]),
        .Q(\skid_buffer_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[20] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [20]),
        .Q(\skid_buffer_reg_n_0_[20] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[21] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [21]),
        .Q(\skid_buffer_reg_n_0_[21] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[22] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [22]),
        .Q(\skid_buffer_reg_n_0_[22] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[23] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [23]),
        .Q(\skid_buffer_reg_n_0_[23] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[24] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [24]),
        .Q(\skid_buffer_reg_n_0_[24] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[25] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [25]),
        .Q(\skid_buffer_reg_n_0_[25] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[26] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [26]),
        .Q(\skid_buffer_reg_n_0_[26] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[27] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [27]),
        .Q(\skid_buffer_reg_n_0_[27] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[28] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [28]),
        .Q(\skid_buffer_reg_n_0_[28] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[29] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [29]),
        .Q(\skid_buffer_reg_n_0_[29] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[2] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [2]),
        .Q(\skid_buffer_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[30] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [30]),
        .Q(\skid_buffer_reg_n_0_[30] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[31] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [31]),
        .Q(\skid_buffer_reg_n_0_[31] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[32] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [32]),
        .Q(\skid_buffer_reg_n_0_[32] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[33] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [33]),
        .Q(\skid_buffer_reg_n_0_[33] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[34] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[46]_0 [0]),
        .Q(\skid_buffer_reg_n_0_[34] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[35] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[46]_0 [1]),
        .Q(\skid_buffer_reg_n_0_[35] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[36] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[46]_0 [2]),
        .Q(\skid_buffer_reg_n_0_[36] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[37] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[46]_0 [3]),
        .Q(\skid_buffer_reg_n_0_[37] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[38] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[46]_0 [4]),
        .Q(\skid_buffer_reg_n_0_[38] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[39] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[46]_0 [5]),
        .Q(\skid_buffer_reg_n_0_[39] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[3] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [3]),
        .Q(\skid_buffer_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[40] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[46]_0 [6]),
        .Q(\skid_buffer_reg_n_0_[40] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[41] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[46]_0 [7]),
        .Q(\skid_buffer_reg_n_0_[41] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[42] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[46]_0 [8]),
        .Q(\skid_buffer_reg_n_0_[42] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[43] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[46]_0 [9]),
        .Q(\skid_buffer_reg_n_0_[43] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[44] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[46]_0 [10]),
        .Q(\skid_buffer_reg_n_0_[44] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[45] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[46]_0 [11]),
        .Q(\skid_buffer_reg_n_0_[45] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[46] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[46]_0 [12]),
        .Q(\skid_buffer_reg_n_0_[46] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[4] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [4]),
        .Q(\skid_buffer_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[5] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [5]),
        .Q(\skid_buffer_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[6] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [6]),
        .Q(\skid_buffer_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[7] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [7]),
        .Q(\skid_buffer_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[8] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [8]),
        .Q(\skid_buffer_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[9] 
       (.C(aclk),
        .CE(s_ready_i_reg_0),
        .D(\skid_buffer_reg[33]_0 [9]),
        .Q(\skid_buffer_reg_n_0_[9] ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module dwa_ps_bd_cdc_sync
   (lpf_exr_reg,
    scndry_out,
    lpf_exr,
    p_1_in4_in,
    p_2_in3_in,
    exr_lpf,
    ext_reset_in,
    slowest_sync_clk);
  output lpf_exr_reg;
  output scndry_out;
  input lpf_exr;
  input p_1_in4_in;
  input p_2_in3_in;
  input [0:0]exr_lpf;
  input ext_reset_in;
  input slowest_sync_clk;

  wire exr_d1;
  wire [0:0]exr_lpf;
  wire ext_reset_in;
  wire lpf_exr;
  wire lpf_exr_reg;
  wire p_1_in4_in;
  wire p_2_in3_in;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;
  wire scndry_out;
  wire slowest_sync_clk;

  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(exr_d1),
        .Q(s_level_out_d1_cdc_to),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to_i_1 
       (.I0(ext_reset_in),
        .O(exr_d1));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(scndry_out),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hEAAAAAA8)) 
    lpf_exr_i_1
       (.I0(lpf_exr),
        .I1(p_1_in4_in),
        .I2(p_2_in3_in),
        .I3(scndry_out),
        .I4(exr_lpf),
        .O(lpf_exr_reg));
endmodule

(* CHECK_LICENSE_TYPE = "dwa_ps_bd_auto_pc_0,axi_protocol_converter_v2_1_22_axi_protocol_converter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "dwa_ps_bd_auto_pc_0" *) 
(* X_CORE_INFO = "axi_protocol_converter_v2_1_22_axi_protocol_converter,Vivado 2020.2" *) 
module dwa_ps_bd_dwa_ps_bd_auto_pc_0
   (aclk,
    aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awprot,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arprot,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rvalid,
    m_axi_rready);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, ASSOCIATED_BUSIF S_AXI:M_AXI, ASSOCIATED_RESET ARESETN, INSERT_VIP 0" *) input aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RST RST" *) (* x_interface_parameter = "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, INSERT_VIP 0, TYPE INTERCONNECT" *) input aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWID" *) input [11:0]s_axi_awid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) input [31:0]s_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *) input [3:0]s_axi_awlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *) input [2:0]s_axi_awsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *) input [1:0]s_axi_awburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *) input [1:0]s_axi_awlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *) input [3:0]s_axi_awcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]s_axi_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWQOS" *) input [3:0]s_axi_awqos;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WID" *) input [11:0]s_axi_wid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]s_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]s_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *) input s_axi_wlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BID" *) output [11:0]s_axi_bid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARID" *) input [11:0]s_axi_arid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [31:0]s_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *) input [3:0]s_axi_arlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *) input [2:0]s_axi_arsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *) input [1:0]s_axi_arburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *) input [1:0]s_axi_arlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *) input [3:0]s_axi_arcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]s_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARQOS" *) input [3:0]s_axi_arqos;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RID" *) output [11:0]s_axi_rid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]s_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *) output s_axi_rlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI3, FREQ_HZ 100000000, ID_WIDTH 12, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 16, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s_axi_rready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *) output [31:0]m_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *) output [2:0]m_axi_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *) output m_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *) input m_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *) output [31:0]m_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *) output [3:0]m_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *) output m_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *) input m_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *) input [1:0]m_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *) input m_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *) output m_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *) output [31:0]m_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *) output [2:0]m_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *) output m_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *) input m_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *) input [31:0]m_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *) input [1:0]m_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *) input m_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output m_axi_rready;

  wire aclk;
  wire aresetn;
  wire [31:0]m_axi_araddr;
  wire [2:0]m_axi_arprot;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire [31:0]m_axi_awaddr;
  wire [2:0]m_axi_awprot;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [31:0]m_axi_rdata;
  wire m_axi_rready;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire m_axi_wready;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [11:0]s_axi_arid;
  wire [3:0]s_axi_arlen;
  wire [2:0]s_axi_arprot;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [11:0]s_axi_awid;
  wire [3:0]s_axi_awlen;
  wire [2:0]s_axi_awprot;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [11:0]s_axi_bid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire [11:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;

  assign m_axi_wdata[31:0] = s_axi_wdata;
  assign m_axi_wstrb[3:0] = s_axi_wstrb;
  assign m_axi_wvalid = s_axi_wvalid;
  assign s_axi_wready = m_axi_wready;
  dwa_ps_bd_axi_protocol_converter_v2_1_22_axi_protocol_converter inst
       (.Q({m_axi_awprot,m_axi_awaddr[31:12]}),
        .aclk(aclk),
        .aresetn(aresetn),
        .in({m_axi_rresp,m_axi_rdata}),
        .m_axi_araddr(m_axi_araddr[11:0]),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_awaddr(m_axi_awaddr[11:0]),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .\m_payload_i_reg[13] ({s_axi_bid,s_axi_bresp}),
        .\m_payload_i_reg[34] ({m_axi_arprot,m_axi_araddr[31:12]}),
        .\m_payload_i_reg[46] ({s_axi_rid,s_axi_rlast,s_axi_rresp,s_axi_rdata}),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize[1:0]),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize[1:0]),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid));
endmodule

(* CHECK_LICENSE_TYPE = "dwa_ps_bd_processing_system7_0_0,processing_system7_v5_5_processing_system7,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "dwa_ps_bd_processing_system7_0_0" *) 
(* X_CORE_INFO = "processing_system7_v5_5_processing_system7,Vivado 2020.2" *) 
module dwa_ps_bd_dwa_ps_bd_processing_system7_0_0
   (TTC0_WAVE0_OUT,
    TTC0_WAVE1_OUT,
    TTC0_WAVE2_OUT,
    USB0_PORT_INDCTL,
    USB0_VBUS_PWRSELECT,
    USB0_VBUS_PWRFAULT,
    M_AXI_GP0_ARVALID,
    M_AXI_GP0_AWVALID,
    M_AXI_GP0_BREADY,
    M_AXI_GP0_RREADY,
    M_AXI_GP0_WLAST,
    M_AXI_GP0_WVALID,
    M_AXI_GP0_ARID,
    M_AXI_GP0_AWID,
    M_AXI_GP0_WID,
    M_AXI_GP0_ARBURST,
    M_AXI_GP0_ARLOCK,
    M_AXI_GP0_ARSIZE,
    M_AXI_GP0_AWBURST,
    M_AXI_GP0_AWLOCK,
    M_AXI_GP0_AWSIZE,
    M_AXI_GP0_ARPROT,
    M_AXI_GP0_AWPROT,
    M_AXI_GP0_ARADDR,
    M_AXI_GP0_AWADDR,
    M_AXI_GP0_WDATA,
    M_AXI_GP0_ARCACHE,
    M_AXI_GP0_ARLEN,
    M_AXI_GP0_ARQOS,
    M_AXI_GP0_AWCACHE,
    M_AXI_GP0_AWLEN,
    M_AXI_GP0_AWQOS,
    M_AXI_GP0_WSTRB,
    M_AXI_GP0_ACLK,
    M_AXI_GP0_ARREADY,
    M_AXI_GP0_AWREADY,
    M_AXI_GP0_BVALID,
    M_AXI_GP0_RLAST,
    M_AXI_GP0_RVALID,
    M_AXI_GP0_WREADY,
    M_AXI_GP0_BID,
    M_AXI_GP0_RID,
    M_AXI_GP0_BRESP,
    M_AXI_GP0_RRESP,
    M_AXI_GP0_RDATA,
    FCLK_CLK0,
    FCLK_CLK1,
    FCLK_RESET0_N,
    MIO,
    DDR_CAS_n,
    DDR_CKE,
    DDR_Clk_n,
    DDR_Clk,
    DDR_CS_n,
    DDR_DRSTB,
    DDR_ODT,
    DDR_RAS_n,
    DDR_WEB,
    DDR_BankAddr,
    DDR_Addr,
    DDR_VRN,
    DDR_VRP,
    DDR_DM,
    DDR_DQ,
    DDR_DQS_n,
    DDR_DQS,
    PS_SRSTB,
    PS_CLK,
    PS_PORB);
  output TTC0_WAVE0_OUT;
  output TTC0_WAVE1_OUT;
  output TTC0_WAVE2_OUT;
  (* x_interface_info = "xilinx.com:display_processing_system7:usbctrl:1.0 USBIND_0 PORT_INDCTL" *) output [1:0]USB0_PORT_INDCTL;
  (* x_interface_info = "xilinx.com:display_processing_system7:usbctrl:1.0 USBIND_0 VBUS_PWRSELECT" *) output USB0_VBUS_PWRSELECT;
  (* x_interface_info = "xilinx.com:display_processing_system7:usbctrl:1.0 USBIND_0 VBUS_PWRFAULT" *) input USB0_VBUS_PWRFAULT;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARVALID" *) output M_AXI_GP0_ARVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWVALID" *) output M_AXI_GP0_AWVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 BREADY" *) output M_AXI_GP0_BREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RREADY" *) output M_AXI_GP0_RREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WLAST" *) output M_AXI_GP0_WLAST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WVALID" *) output M_AXI_GP0_WVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARID" *) output [11:0]M_AXI_GP0_ARID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWID" *) output [11:0]M_AXI_GP0_AWID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WID" *) output [11:0]M_AXI_GP0_WID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARBURST" *) output [1:0]M_AXI_GP0_ARBURST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARLOCK" *) output [1:0]M_AXI_GP0_ARLOCK;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARSIZE" *) output [2:0]M_AXI_GP0_ARSIZE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWBURST" *) output [1:0]M_AXI_GP0_AWBURST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWLOCK" *) output [1:0]M_AXI_GP0_AWLOCK;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWSIZE" *) output [2:0]M_AXI_GP0_AWSIZE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARPROT" *) output [2:0]M_AXI_GP0_ARPROT;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWPROT" *) output [2:0]M_AXI_GP0_AWPROT;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARADDR" *) output [31:0]M_AXI_GP0_ARADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWADDR" *) output [31:0]M_AXI_GP0_AWADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WDATA" *) output [31:0]M_AXI_GP0_WDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARCACHE" *) output [3:0]M_AXI_GP0_ARCACHE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARLEN" *) output [3:0]M_AXI_GP0_ARLEN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARQOS" *) output [3:0]M_AXI_GP0_ARQOS;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWCACHE" *) output [3:0]M_AXI_GP0_AWCACHE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWLEN" *) output [3:0]M_AXI_GP0_AWLEN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWQOS" *) output [3:0]M_AXI_GP0_AWQOS;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WSTRB" *) output [3:0]M_AXI_GP0_WSTRB;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 M_AXI_GP0_ACLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXI_GP0_ACLK, ASSOCIATED_BUSIF M_AXI_GP0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input M_AXI_GP0_ACLK;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARREADY" *) input M_AXI_GP0_ARREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWREADY" *) input M_AXI_GP0_AWREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 BVALID" *) input M_AXI_GP0_BVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RLAST" *) input M_AXI_GP0_RLAST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RVALID" *) input M_AXI_GP0_RVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WREADY" *) input M_AXI_GP0_WREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 BID" *) input [11:0]M_AXI_GP0_BID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RID" *) input [11:0]M_AXI_GP0_RID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 BRESP" *) input [1:0]M_AXI_GP0_BRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RRESP" *) input [1:0]M_AXI_GP0_RRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RDATA" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXI_GP0, SUPPORTS_NARROW_BURST 0, NUM_WRITE_OUTSTANDING 8, NUM_READ_OUTSTANDING 8, DATA_WIDTH 32, PROTOCOL AXI3, FREQ_HZ 100000000, ID_WIDTH 12, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, MAX_BURST_LENGTH 16, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [31:0]M_AXI_GP0_RDATA;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 FCLK_CLK0 CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME FCLK_CLK0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) output FCLK_CLK0;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 FCLK_CLK1 CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME FCLK_CLK1, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK1, INSERT_VIP 0" *) output FCLK_CLK1;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 FCLK_RESET0_N RST" *) (* x_interface_parameter = "XIL_INTERFACENAME FCLK_RESET0_N, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output FCLK_RESET0_N;
  (* x_interface_info = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]MIO;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_CAS_n;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_CKE;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_Clk_n;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_Clk;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_CS_n;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_DRSTB;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_ODT;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_RAS_n;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_WEB;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_BankAddr;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) inout [14:0]DDR_Addr;
  (* x_interface_info = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) inout DDR_VRN;
  (* x_interface_info = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout DDR_VRP;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_DM;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_DQ;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_DQS_n;
  (* x_interface_info = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) (* x_interface_parameter = "XIL_INTERFACENAME DDR, CAN_DEBUG false, TIMEPERIOD_PS 1250, MEMORY_TYPE COMPONENTS, DATA_WIDTH 8, CS_ENABLED true, DATA_MASK_ENABLED true, SLOT Single, MEM_ADDR_MAP ROW_COLUMN_BANK, BURST_LENGTH 8, AXI_ARBITRATION_SCHEME TDM, CAS_LATENCY 11, CAS_WRITE_LATENCY 11" *) inout [3:0]DDR_DQS;
  (* x_interface_info = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout PS_SRSTB;
  (* x_interface_info = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout PS_CLK;
  (* x_interface_info = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) (* x_interface_parameter = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout PS_PORB;

  wire \<const0> ;
  wire [14:0]DDR_Addr;
  wire [2:0]DDR_BankAddr;
  wire DDR_CAS_n;
  wire DDR_CKE;
  wire DDR_CS_n;
  wire DDR_Clk;
  wire DDR_Clk_n;
  wire [3:0]DDR_DM;
  wire [31:0]DDR_DQ;
  wire [3:0]DDR_DQS;
  wire [3:0]DDR_DQS_n;
  wire DDR_DRSTB;
  wire DDR_ODT;
  wire DDR_RAS_n;
  wire DDR_VRN;
  wire DDR_VRP;
  wire DDR_WEB;
  wire FCLK_CLK0;
  wire FCLK_CLK1;
  wire FCLK_RESET0_N;
  wire [53:0]MIO;
  wire [31:0]M_AXI_GP0_ARADDR;
  wire [1:0]M_AXI_GP0_ARBURST;
  wire [11:0]M_AXI_GP0_ARID;
  wire [3:0]M_AXI_GP0_ARLEN;
  wire [2:0]M_AXI_GP0_ARPROT;
  wire M_AXI_GP0_ARREADY;
  wire [1:0]\^M_AXI_GP0_ARSIZE ;
  wire M_AXI_GP0_ARVALID;
  wire [31:0]M_AXI_GP0_AWADDR;
  wire [1:0]M_AXI_GP0_AWBURST;
  wire [11:0]M_AXI_GP0_AWID;
  wire [3:0]M_AXI_GP0_AWLEN;
  wire [2:0]M_AXI_GP0_AWPROT;
  wire M_AXI_GP0_AWREADY;
  wire [1:0]\^M_AXI_GP0_AWSIZE ;
  wire M_AXI_GP0_AWVALID;
  wire [11:0]M_AXI_GP0_BID;
  wire M_AXI_GP0_BREADY;
  wire [1:0]M_AXI_GP0_BRESP;
  wire M_AXI_GP0_BVALID;
  wire [31:0]M_AXI_GP0_RDATA;
  wire [11:0]M_AXI_GP0_RID;
  wire M_AXI_GP0_RLAST;
  wire M_AXI_GP0_RREADY;
  wire [1:0]M_AXI_GP0_RRESP;
  wire M_AXI_GP0_RVALID;
  wire [31:0]M_AXI_GP0_WDATA;
  wire M_AXI_GP0_WREADY;
  wire [3:0]M_AXI_GP0_WSTRB;
  wire M_AXI_GP0_WVALID;
  wire PS_CLK;
  wire PS_PORB;
  wire PS_SRSTB;
  wire NLW_inst_CAN0_PHY_TX_UNCONNECTED;
  wire NLW_inst_CAN1_PHY_TX_UNCONNECTED;
  wire NLW_inst_DMA0_DAVALID_UNCONNECTED;
  wire NLW_inst_DMA0_DRREADY_UNCONNECTED;
  wire NLW_inst_DMA0_RSTN_UNCONNECTED;
  wire NLW_inst_DMA1_DAVALID_UNCONNECTED;
  wire NLW_inst_DMA1_DRREADY_UNCONNECTED;
  wire NLW_inst_DMA1_RSTN_UNCONNECTED;
  wire NLW_inst_DMA2_DAVALID_UNCONNECTED;
  wire NLW_inst_DMA2_DRREADY_UNCONNECTED;
  wire NLW_inst_DMA2_RSTN_UNCONNECTED;
  wire NLW_inst_DMA3_DAVALID_UNCONNECTED;
  wire NLW_inst_DMA3_DRREADY_UNCONNECTED;
  wire NLW_inst_DMA3_RSTN_UNCONNECTED;
  wire NLW_inst_ENET0_GMII_TX_EN_UNCONNECTED;
  wire NLW_inst_ENET0_GMII_TX_ER_UNCONNECTED;
  wire NLW_inst_ENET0_MDIO_MDC_UNCONNECTED;
  wire NLW_inst_ENET0_MDIO_O_UNCONNECTED;
  wire NLW_inst_ENET0_MDIO_T_UNCONNECTED;
  wire NLW_inst_ENET0_PTP_DELAY_REQ_RX_UNCONNECTED;
  wire NLW_inst_ENET0_PTP_DELAY_REQ_TX_UNCONNECTED;
  wire NLW_inst_ENET0_PTP_PDELAY_REQ_RX_UNCONNECTED;
  wire NLW_inst_ENET0_PTP_PDELAY_REQ_TX_UNCONNECTED;
  wire NLW_inst_ENET0_PTP_PDELAY_RESP_RX_UNCONNECTED;
  wire NLW_inst_ENET0_PTP_PDELAY_RESP_TX_UNCONNECTED;
  wire NLW_inst_ENET0_PTP_SYNC_FRAME_RX_UNCONNECTED;
  wire NLW_inst_ENET0_PTP_SYNC_FRAME_TX_UNCONNECTED;
  wire NLW_inst_ENET0_SOF_RX_UNCONNECTED;
  wire NLW_inst_ENET0_SOF_TX_UNCONNECTED;
  wire NLW_inst_ENET1_GMII_TX_EN_UNCONNECTED;
  wire NLW_inst_ENET1_GMII_TX_ER_UNCONNECTED;
  wire NLW_inst_ENET1_MDIO_MDC_UNCONNECTED;
  wire NLW_inst_ENET1_MDIO_O_UNCONNECTED;
  wire NLW_inst_ENET1_MDIO_T_UNCONNECTED;
  wire NLW_inst_ENET1_PTP_DELAY_REQ_RX_UNCONNECTED;
  wire NLW_inst_ENET1_PTP_DELAY_REQ_TX_UNCONNECTED;
  wire NLW_inst_ENET1_PTP_PDELAY_REQ_RX_UNCONNECTED;
  wire NLW_inst_ENET1_PTP_PDELAY_REQ_TX_UNCONNECTED;
  wire NLW_inst_ENET1_PTP_PDELAY_RESP_RX_UNCONNECTED;
  wire NLW_inst_ENET1_PTP_PDELAY_RESP_TX_UNCONNECTED;
  wire NLW_inst_ENET1_PTP_SYNC_FRAME_RX_UNCONNECTED;
  wire NLW_inst_ENET1_PTP_SYNC_FRAME_TX_UNCONNECTED;
  wire NLW_inst_ENET1_SOF_RX_UNCONNECTED;
  wire NLW_inst_ENET1_SOF_TX_UNCONNECTED;
  wire NLW_inst_EVENT_EVENTO_UNCONNECTED;
  wire NLW_inst_FCLK_CLK2_UNCONNECTED;
  wire NLW_inst_FCLK_CLK3_UNCONNECTED;
  wire NLW_inst_FCLK_RESET1_N_UNCONNECTED;
  wire NLW_inst_FCLK_RESET2_N_UNCONNECTED;
  wire NLW_inst_FCLK_RESET3_N_UNCONNECTED;
  wire NLW_inst_FTMT_F2P_TRIGACK_0_UNCONNECTED;
  wire NLW_inst_FTMT_F2P_TRIGACK_1_UNCONNECTED;
  wire NLW_inst_FTMT_F2P_TRIGACK_2_UNCONNECTED;
  wire NLW_inst_FTMT_F2P_TRIGACK_3_UNCONNECTED;
  wire NLW_inst_FTMT_P2F_TRIG_0_UNCONNECTED;
  wire NLW_inst_FTMT_P2F_TRIG_1_UNCONNECTED;
  wire NLW_inst_FTMT_P2F_TRIG_2_UNCONNECTED;
  wire NLW_inst_FTMT_P2F_TRIG_3_UNCONNECTED;
  wire NLW_inst_I2C0_SCL_O_UNCONNECTED;
  wire NLW_inst_I2C0_SCL_T_UNCONNECTED;
  wire NLW_inst_I2C0_SDA_O_UNCONNECTED;
  wire NLW_inst_I2C0_SDA_T_UNCONNECTED;
  wire NLW_inst_I2C1_SCL_O_UNCONNECTED;
  wire NLW_inst_I2C1_SCL_T_UNCONNECTED;
  wire NLW_inst_I2C1_SDA_O_UNCONNECTED;
  wire NLW_inst_I2C1_SDA_T_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_CAN0_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_CAN1_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_CTI_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_DMAC0_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_DMAC1_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_DMAC2_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_DMAC3_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_DMAC4_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_DMAC5_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_DMAC6_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_DMAC7_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_DMAC_ABORT_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_ENET0_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_ENET1_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_ENET_WAKE0_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_ENET_WAKE1_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_GPIO_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_I2C0_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_I2C1_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_QSPI_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_SDIO0_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_SDIO1_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_SMC_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_SPI0_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_SPI1_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_UART0_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_UART1_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_USB0_UNCONNECTED;
  wire NLW_inst_IRQ_P2F_USB1_UNCONNECTED;
  wire NLW_inst_M_AXI_GP0_ARESETN_UNCONNECTED;
  wire NLW_inst_M_AXI_GP0_WLAST_UNCONNECTED;
  wire NLW_inst_M_AXI_GP1_ARESETN_UNCONNECTED;
  wire NLW_inst_M_AXI_GP1_ARVALID_UNCONNECTED;
  wire NLW_inst_M_AXI_GP1_AWVALID_UNCONNECTED;
  wire NLW_inst_M_AXI_GP1_BREADY_UNCONNECTED;
  wire NLW_inst_M_AXI_GP1_RREADY_UNCONNECTED;
  wire NLW_inst_M_AXI_GP1_WLAST_UNCONNECTED;
  wire NLW_inst_M_AXI_GP1_WVALID_UNCONNECTED;
  wire NLW_inst_PJTAG_TDO_UNCONNECTED;
  wire NLW_inst_SDIO0_BUSPOW_UNCONNECTED;
  wire NLW_inst_SDIO0_CLK_UNCONNECTED;
  wire NLW_inst_SDIO0_CMD_O_UNCONNECTED;
  wire NLW_inst_SDIO0_CMD_T_UNCONNECTED;
  wire NLW_inst_SDIO0_LED_UNCONNECTED;
  wire NLW_inst_SDIO1_BUSPOW_UNCONNECTED;
  wire NLW_inst_SDIO1_CLK_UNCONNECTED;
  wire NLW_inst_SDIO1_CMD_O_UNCONNECTED;
  wire NLW_inst_SDIO1_CMD_T_UNCONNECTED;
  wire NLW_inst_SDIO1_LED_UNCONNECTED;
  wire NLW_inst_SPI0_MISO_O_UNCONNECTED;
  wire NLW_inst_SPI0_MISO_T_UNCONNECTED;
  wire NLW_inst_SPI0_MOSI_O_UNCONNECTED;
  wire NLW_inst_SPI0_MOSI_T_UNCONNECTED;
  wire NLW_inst_SPI0_SCLK_O_UNCONNECTED;
  wire NLW_inst_SPI0_SCLK_T_UNCONNECTED;
  wire NLW_inst_SPI0_SS1_O_UNCONNECTED;
  wire NLW_inst_SPI0_SS2_O_UNCONNECTED;
  wire NLW_inst_SPI0_SS_O_UNCONNECTED;
  wire NLW_inst_SPI0_SS_T_UNCONNECTED;
  wire NLW_inst_SPI1_MISO_O_UNCONNECTED;
  wire NLW_inst_SPI1_MISO_T_UNCONNECTED;
  wire NLW_inst_SPI1_MOSI_O_UNCONNECTED;
  wire NLW_inst_SPI1_MOSI_T_UNCONNECTED;
  wire NLW_inst_SPI1_SCLK_O_UNCONNECTED;
  wire NLW_inst_SPI1_SCLK_T_UNCONNECTED;
  wire NLW_inst_SPI1_SS1_O_UNCONNECTED;
  wire NLW_inst_SPI1_SS2_O_UNCONNECTED;
  wire NLW_inst_SPI1_SS_O_UNCONNECTED;
  wire NLW_inst_SPI1_SS_T_UNCONNECTED;
  wire NLW_inst_S_AXI_ACP_ARESETN_UNCONNECTED;
  wire NLW_inst_S_AXI_ACP_ARREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_ACP_AWREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_ACP_BVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_ACP_RLAST_UNCONNECTED;
  wire NLW_inst_S_AXI_ACP_RVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_ACP_WREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_GP0_ARESETN_UNCONNECTED;
  wire NLW_inst_S_AXI_GP0_ARREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_GP0_AWREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_GP0_BVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_GP0_RLAST_UNCONNECTED;
  wire NLW_inst_S_AXI_GP0_RVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_GP0_WREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_GP1_ARESETN_UNCONNECTED;
  wire NLW_inst_S_AXI_GP1_ARREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_GP1_AWREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_GP1_BVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_GP1_RLAST_UNCONNECTED;
  wire NLW_inst_S_AXI_GP1_RVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_GP1_WREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_HP0_ARESETN_UNCONNECTED;
  wire NLW_inst_S_AXI_HP0_ARREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_HP0_AWREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_HP0_BVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_HP0_RLAST_UNCONNECTED;
  wire NLW_inst_S_AXI_HP0_RVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_HP0_WREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_HP1_ARESETN_UNCONNECTED;
  wire NLW_inst_S_AXI_HP1_ARREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_HP1_AWREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_HP1_BVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_HP1_RLAST_UNCONNECTED;
  wire NLW_inst_S_AXI_HP1_RVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_HP1_WREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_HP2_ARESETN_UNCONNECTED;
  wire NLW_inst_S_AXI_HP2_ARREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_HP2_AWREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_HP2_BVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_HP2_RLAST_UNCONNECTED;
  wire NLW_inst_S_AXI_HP2_RVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_HP2_WREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_HP3_ARESETN_UNCONNECTED;
  wire NLW_inst_S_AXI_HP3_ARREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_HP3_AWREADY_UNCONNECTED;
  wire NLW_inst_S_AXI_HP3_BVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_HP3_RLAST_UNCONNECTED;
  wire NLW_inst_S_AXI_HP3_RVALID_UNCONNECTED;
  wire NLW_inst_S_AXI_HP3_WREADY_UNCONNECTED;
  wire NLW_inst_TRACE_CLK_OUT_UNCONNECTED;
  wire NLW_inst_TRACE_CTL_UNCONNECTED;
  wire NLW_inst_TTC0_WAVE0_OUT_UNCONNECTED;
  wire NLW_inst_TTC0_WAVE1_OUT_UNCONNECTED;
  wire NLW_inst_TTC0_WAVE2_OUT_UNCONNECTED;
  wire NLW_inst_TTC1_WAVE0_OUT_UNCONNECTED;
  wire NLW_inst_TTC1_WAVE1_OUT_UNCONNECTED;
  wire NLW_inst_TTC1_WAVE2_OUT_UNCONNECTED;
  wire NLW_inst_UART0_DTRN_UNCONNECTED;
  wire NLW_inst_UART0_RTSN_UNCONNECTED;
  wire NLW_inst_UART0_TX_UNCONNECTED;
  wire NLW_inst_UART1_DTRN_UNCONNECTED;
  wire NLW_inst_UART1_RTSN_UNCONNECTED;
  wire NLW_inst_UART1_TX_UNCONNECTED;
  wire NLW_inst_USB0_VBUS_PWRSELECT_UNCONNECTED;
  wire NLW_inst_USB1_VBUS_PWRSELECT_UNCONNECTED;
  wire NLW_inst_WDT_RST_OUT_UNCONNECTED;
  wire [1:0]NLW_inst_DMA0_DATYPE_UNCONNECTED;
  wire [1:0]NLW_inst_DMA1_DATYPE_UNCONNECTED;
  wire [1:0]NLW_inst_DMA2_DATYPE_UNCONNECTED;
  wire [1:0]NLW_inst_DMA3_DATYPE_UNCONNECTED;
  wire [7:0]NLW_inst_ENET0_GMII_TXD_UNCONNECTED;
  wire [7:0]NLW_inst_ENET1_GMII_TXD_UNCONNECTED;
  wire [1:0]NLW_inst_EVENT_STANDBYWFE_UNCONNECTED;
  wire [1:0]NLW_inst_EVENT_STANDBYWFI_UNCONNECTED;
  wire [31:0]NLW_inst_FTMT_P2F_DEBUG_UNCONNECTED;
  wire [63:0]NLW_inst_GPIO_O_UNCONNECTED;
  wire [63:0]NLW_inst_GPIO_T_UNCONNECTED;
  wire [3:0]NLW_inst_M_AXI_GP0_ARCACHE_UNCONNECTED;
  wire [1:0]NLW_inst_M_AXI_GP0_ARLOCK_UNCONNECTED;
  wire [3:0]NLW_inst_M_AXI_GP0_ARQOS_UNCONNECTED;
  wire [2:2]NLW_inst_M_AXI_GP0_ARSIZE_UNCONNECTED;
  wire [3:0]NLW_inst_M_AXI_GP0_AWCACHE_UNCONNECTED;
  wire [1:0]NLW_inst_M_AXI_GP0_AWLOCK_UNCONNECTED;
  wire [3:0]NLW_inst_M_AXI_GP0_AWQOS_UNCONNECTED;
  wire [2:2]NLW_inst_M_AXI_GP0_AWSIZE_UNCONNECTED;
  wire [11:0]NLW_inst_M_AXI_GP0_WID_UNCONNECTED;
  wire [31:0]NLW_inst_M_AXI_GP1_ARADDR_UNCONNECTED;
  wire [1:0]NLW_inst_M_AXI_GP1_ARBURST_UNCONNECTED;
  wire [3:0]NLW_inst_M_AXI_GP1_ARCACHE_UNCONNECTED;
  wire [11:0]NLW_inst_M_AXI_GP1_ARID_UNCONNECTED;
  wire [3:0]NLW_inst_M_AXI_GP1_ARLEN_UNCONNECTED;
  wire [1:0]NLW_inst_M_AXI_GP1_ARLOCK_UNCONNECTED;
  wire [2:0]NLW_inst_M_AXI_GP1_ARPROT_UNCONNECTED;
  wire [3:0]NLW_inst_M_AXI_GP1_ARQOS_UNCONNECTED;
  wire [2:0]NLW_inst_M_AXI_GP1_ARSIZE_UNCONNECTED;
  wire [31:0]NLW_inst_M_AXI_GP1_AWADDR_UNCONNECTED;
  wire [1:0]NLW_inst_M_AXI_GP1_AWBURST_UNCONNECTED;
  wire [3:0]NLW_inst_M_AXI_GP1_AWCACHE_UNCONNECTED;
  wire [11:0]NLW_inst_M_AXI_GP1_AWID_UNCONNECTED;
  wire [3:0]NLW_inst_M_AXI_GP1_AWLEN_UNCONNECTED;
  wire [1:0]NLW_inst_M_AXI_GP1_AWLOCK_UNCONNECTED;
  wire [2:0]NLW_inst_M_AXI_GP1_AWPROT_UNCONNECTED;
  wire [3:0]NLW_inst_M_AXI_GP1_AWQOS_UNCONNECTED;
  wire [2:0]NLW_inst_M_AXI_GP1_AWSIZE_UNCONNECTED;
  wire [31:0]NLW_inst_M_AXI_GP1_WDATA_UNCONNECTED;
  wire [11:0]NLW_inst_M_AXI_GP1_WID_UNCONNECTED;
  wire [3:0]NLW_inst_M_AXI_GP1_WSTRB_UNCONNECTED;
  wire [2:0]NLW_inst_SDIO0_BUSVOLT_UNCONNECTED;
  wire [3:0]NLW_inst_SDIO0_DATA_O_UNCONNECTED;
  wire [3:0]NLW_inst_SDIO0_DATA_T_UNCONNECTED;
  wire [2:0]NLW_inst_SDIO1_BUSVOLT_UNCONNECTED;
  wire [3:0]NLW_inst_SDIO1_DATA_O_UNCONNECTED;
  wire [3:0]NLW_inst_SDIO1_DATA_T_UNCONNECTED;
  wire [2:0]NLW_inst_S_AXI_ACP_BID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_ACP_BRESP_UNCONNECTED;
  wire [63:0]NLW_inst_S_AXI_ACP_RDATA_UNCONNECTED;
  wire [2:0]NLW_inst_S_AXI_ACP_RID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_ACP_RRESP_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_GP0_BID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_GP0_BRESP_UNCONNECTED;
  wire [31:0]NLW_inst_S_AXI_GP0_RDATA_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_GP0_RID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_GP0_RRESP_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_GP1_BID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_GP1_BRESP_UNCONNECTED;
  wire [31:0]NLW_inst_S_AXI_GP1_RDATA_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_GP1_RID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_GP1_RRESP_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_HP0_BID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_HP0_BRESP_UNCONNECTED;
  wire [2:0]NLW_inst_S_AXI_HP0_RACOUNT_UNCONNECTED;
  wire [7:0]NLW_inst_S_AXI_HP0_RCOUNT_UNCONNECTED;
  wire [63:0]NLW_inst_S_AXI_HP0_RDATA_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_HP0_RID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_HP0_RRESP_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_HP0_WACOUNT_UNCONNECTED;
  wire [7:0]NLW_inst_S_AXI_HP0_WCOUNT_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_HP1_BID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_HP1_BRESP_UNCONNECTED;
  wire [2:0]NLW_inst_S_AXI_HP1_RACOUNT_UNCONNECTED;
  wire [7:0]NLW_inst_S_AXI_HP1_RCOUNT_UNCONNECTED;
  wire [63:0]NLW_inst_S_AXI_HP1_RDATA_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_HP1_RID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_HP1_RRESP_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_HP1_WACOUNT_UNCONNECTED;
  wire [7:0]NLW_inst_S_AXI_HP1_WCOUNT_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_HP2_BID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_HP2_BRESP_UNCONNECTED;
  wire [2:0]NLW_inst_S_AXI_HP2_RACOUNT_UNCONNECTED;
  wire [7:0]NLW_inst_S_AXI_HP2_RCOUNT_UNCONNECTED;
  wire [63:0]NLW_inst_S_AXI_HP2_RDATA_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_HP2_RID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_HP2_RRESP_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_HP2_WACOUNT_UNCONNECTED;
  wire [7:0]NLW_inst_S_AXI_HP2_WCOUNT_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_HP3_BID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_HP3_BRESP_UNCONNECTED;
  wire [2:0]NLW_inst_S_AXI_HP3_RACOUNT_UNCONNECTED;
  wire [7:0]NLW_inst_S_AXI_HP3_RCOUNT_UNCONNECTED;
  wire [63:0]NLW_inst_S_AXI_HP3_RDATA_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_HP3_RID_UNCONNECTED;
  wire [1:0]NLW_inst_S_AXI_HP3_RRESP_UNCONNECTED;
  wire [5:0]NLW_inst_S_AXI_HP3_WACOUNT_UNCONNECTED;
  wire [7:0]NLW_inst_S_AXI_HP3_WCOUNT_UNCONNECTED;
  wire [1:0]NLW_inst_TRACE_DATA_UNCONNECTED;
  wire [1:0]NLW_inst_USB0_PORT_INDCTL_UNCONNECTED;
  wire [1:0]NLW_inst_USB1_PORT_INDCTL_UNCONNECTED;

  assign M_AXI_GP0_ARCACHE[3] = \<const0> ;
  assign M_AXI_GP0_ARCACHE[2] = \<const0> ;
  assign M_AXI_GP0_ARCACHE[1] = \<const0> ;
  assign M_AXI_GP0_ARCACHE[0] = \<const0> ;
  assign M_AXI_GP0_ARLOCK[1] = \<const0> ;
  assign M_AXI_GP0_ARLOCK[0] = \<const0> ;
  assign M_AXI_GP0_ARQOS[3] = \<const0> ;
  assign M_AXI_GP0_ARQOS[2] = \<const0> ;
  assign M_AXI_GP0_ARQOS[1] = \<const0> ;
  assign M_AXI_GP0_ARQOS[0] = \<const0> ;
  assign M_AXI_GP0_ARSIZE[2] = \<const0> ;
  assign M_AXI_GP0_ARSIZE[1:0] = \^M_AXI_GP0_ARSIZE [1:0];
  assign M_AXI_GP0_AWCACHE[3] = \<const0> ;
  assign M_AXI_GP0_AWCACHE[2] = \<const0> ;
  assign M_AXI_GP0_AWCACHE[1] = \<const0> ;
  assign M_AXI_GP0_AWCACHE[0] = \<const0> ;
  assign M_AXI_GP0_AWLOCK[1] = \<const0> ;
  assign M_AXI_GP0_AWLOCK[0] = \<const0> ;
  assign M_AXI_GP0_AWQOS[3] = \<const0> ;
  assign M_AXI_GP0_AWQOS[2] = \<const0> ;
  assign M_AXI_GP0_AWQOS[1] = \<const0> ;
  assign M_AXI_GP0_AWQOS[0] = \<const0> ;
  assign M_AXI_GP0_AWSIZE[2] = \<const0> ;
  assign M_AXI_GP0_AWSIZE[1:0] = \^M_AXI_GP0_AWSIZE [1:0];
  assign M_AXI_GP0_WID[11] = \<const0> ;
  assign M_AXI_GP0_WID[10] = \<const0> ;
  assign M_AXI_GP0_WID[9] = \<const0> ;
  assign M_AXI_GP0_WID[8] = \<const0> ;
  assign M_AXI_GP0_WID[7] = \<const0> ;
  assign M_AXI_GP0_WID[6] = \<const0> ;
  assign M_AXI_GP0_WID[5] = \<const0> ;
  assign M_AXI_GP0_WID[4] = \<const0> ;
  assign M_AXI_GP0_WID[3] = \<const0> ;
  assign M_AXI_GP0_WID[2] = \<const0> ;
  assign M_AXI_GP0_WID[1] = \<const0> ;
  assign M_AXI_GP0_WID[0] = \<const0> ;
  assign M_AXI_GP0_WLAST = \<const0> ;
  assign TTC0_WAVE0_OUT = \<const0> ;
  assign TTC0_WAVE1_OUT = \<const0> ;
  assign TTC0_WAVE2_OUT = \<const0> ;
  assign USB0_PORT_INDCTL[1] = \<const0> ;
  assign USB0_PORT_INDCTL[0] = \<const0> ;
  assign USB0_VBUS_PWRSELECT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_DM_WIDTH = "4" *) 
  (* C_DQS_WIDTH = "4" *) 
  (* C_DQ_WIDTH = "32" *) 
  (* C_EMIO_GPIO_WIDTH = "64" *) 
  (* C_EN_EMIO_ENET0 = "0" *) 
  (* C_EN_EMIO_ENET1 = "0" *) 
  (* C_EN_EMIO_PJTAG = "0" *) 
  (* C_EN_EMIO_TRACE = "0" *) 
  (* C_FCLK_CLK0_BUF = "TRUE" *) 
  (* C_FCLK_CLK1_BUF = "TRUE" *) 
  (* C_FCLK_CLK2_BUF = "FALSE" *) 
  (* C_FCLK_CLK3_BUF = "FALSE" *) 
  (* C_GP0_EN_MODIFIABLE_TXN = "1" *) 
  (* C_GP1_EN_MODIFIABLE_TXN = "1" *) 
  (* C_INCLUDE_ACP_TRANS_CHECK = "0" *) 
  (* C_INCLUDE_TRACE_BUFFER = "0" *) 
  (* C_IRQ_F2P_MODE = "DIRECT" *) 
  (* C_MIO_PRIMITIVE = "54" *) 
  (* C_M_AXI_GP0_ENABLE_STATIC_REMAP = "0" *) 
  (* C_M_AXI_GP0_ID_WIDTH = "12" *) 
  (* C_M_AXI_GP0_THREAD_ID_WIDTH = "12" *) 
  (* C_M_AXI_GP1_ENABLE_STATIC_REMAP = "0" *) 
  (* C_M_AXI_GP1_ID_WIDTH = "12" *) 
  (* C_M_AXI_GP1_THREAD_ID_WIDTH = "12" *) 
  (* C_NUM_F2P_INTR_INPUTS = "1" *) 
  (* C_PACKAGE_NAME = "clg400" *) 
  (* C_PS7_SI_REV = "PRODUCTION" *) 
  (* C_S_AXI_ACP_ARUSER_VAL = "31" *) 
  (* C_S_AXI_ACP_AWUSER_VAL = "31" *) 
  (* C_S_AXI_ACP_ID_WIDTH = "3" *) 
  (* C_S_AXI_GP0_ID_WIDTH = "6" *) 
  (* C_S_AXI_GP1_ID_WIDTH = "6" *) 
  (* C_S_AXI_HP0_DATA_WIDTH = "64" *) 
  (* C_S_AXI_HP0_ID_WIDTH = "6" *) 
  (* C_S_AXI_HP1_DATA_WIDTH = "64" *) 
  (* C_S_AXI_HP1_ID_WIDTH = "6" *) 
  (* C_S_AXI_HP2_DATA_WIDTH = "64" *) 
  (* C_S_AXI_HP2_ID_WIDTH = "6" *) 
  (* C_S_AXI_HP3_DATA_WIDTH = "64" *) 
  (* C_S_AXI_HP3_ID_WIDTH = "6" *) 
  (* C_TRACE_BUFFER_CLOCK_DELAY = "12" *) 
  (* C_TRACE_BUFFER_FIFO_SIZE = "128" *) 
  (* C_TRACE_INTERNAL_WIDTH = "2" *) 
  (* C_TRACE_PIPELINE_WIDTH = "8" *) 
  (* C_USE_AXI_NONSECURE = "0" *) 
  (* C_USE_DEFAULT_ACP_USER_VAL = "0" *) 
  (* C_USE_M_AXI_GP0 = "1" *) 
  (* C_USE_M_AXI_GP1 = "0" *) 
  (* C_USE_S_AXI_ACP = "0" *) 
  (* C_USE_S_AXI_GP0 = "0" *) 
  (* C_USE_S_AXI_GP1 = "0" *) 
  (* C_USE_S_AXI_HP0 = "0" *) 
  (* C_USE_S_AXI_HP1 = "0" *) 
  (* C_USE_S_AXI_HP2 = "0" *) 
  (* C_USE_S_AXI_HP3 = "0" *) 
  (* HW_HANDOFF = "dwa_ps_bd_processing_system7_0_0.hwdef" *) 
  (* POWER = "<PROCESSOR name={system} numA9Cores={2} clockFreq={667} load={0.5} /><MEMORY name={code} memType={DDR3} dataWidth={32} clockFreq={533.333333} readRate={0.5} writeRate={0.5} /><IO interface={GPIO_Bank_1} ioStandard={LVCMOS18} bidis={2} ioBank={Vcco_p1} clockFreq={1} usageRate={0.5} /><IO interface={GPIO_Bank_0} ioStandard={LVCMOS33} bidis={9} ioBank={Vcco_p0} clockFreq={1} usageRate={0.5} /><IO interface={Timer} ioStandard={} bidis={0} ioBank={} clockFreq={111.111115} usageRate={0.5} /><IO interface={UART} ioStandard={LVCMOS18} bidis={2} ioBank={Vcco_p1} clockFreq={50.000000} usageRate={0.5} /><IO interface={SD} ioStandard={LVCMOS18} bidis={8} ioBank={Vcco_p1} clockFreq={25.000000} usageRate={0.5} /><IO interface={USB} ioStandard={LVCMOS18} bidis={12} ioBank={Vcco_p1} clockFreq={60} usageRate={0.5} /><IO interface={GigE} ioStandard={LVCMOS18} bidis={14} ioBank={Vcco_p1} clockFreq={125.000000} usageRate={0.5} /><IO interface={QSPI} ioStandard={LVCMOS33} bidis={7} ioBank={Vcco_p0} clockFreq={200} usageRate={0.5} /><PLL domain={Processor} vco={1333.333} /><PLL domain={Memory} vco={1066.667} /><PLL domain={IO} vco={1000.000} /><AXI interface={M_AXI_GP0} dataWidth={32} clockFreq={100} usageRate={0.5} />/>" *) 
  (* USE_TRACE_DATA_EDGE_DETECTOR = "0" *) 
  dwa_ps_bd_processing_system7_v5_5_processing_system7 inst
       (.CAN0_PHY_RX(1'b0),
        .CAN0_PHY_TX(NLW_inst_CAN0_PHY_TX_UNCONNECTED),
        .CAN1_PHY_RX(1'b0),
        .CAN1_PHY_TX(NLW_inst_CAN1_PHY_TX_UNCONNECTED),
        .Core0_nFIQ(1'b0),
        .Core0_nIRQ(1'b0),
        .Core1_nFIQ(1'b0),
        .Core1_nIRQ(1'b0),
        .DDR_ARB({1'b0,1'b0,1'b0,1'b0}),
        .DDR_Addr(DDR_Addr),
        .DDR_BankAddr(DDR_BankAddr),
        .DDR_CAS_n(DDR_CAS_n),
        .DDR_CKE(DDR_CKE),
        .DDR_CS_n(DDR_CS_n),
        .DDR_Clk(DDR_Clk),
        .DDR_Clk_n(DDR_Clk_n),
        .DDR_DM(DDR_DM),
        .DDR_DQ(DDR_DQ),
        .DDR_DQS(DDR_DQS),
        .DDR_DQS_n(DDR_DQS_n),
        .DDR_DRSTB(DDR_DRSTB),
        .DDR_ODT(DDR_ODT),
        .DDR_RAS_n(DDR_RAS_n),
        .DDR_VRN(DDR_VRN),
        .DDR_VRP(DDR_VRP),
        .DDR_WEB(DDR_WEB),
        .DMA0_ACLK(1'b0),
        .DMA0_DAREADY(1'b0),
        .DMA0_DATYPE(NLW_inst_DMA0_DATYPE_UNCONNECTED[1:0]),
        .DMA0_DAVALID(NLW_inst_DMA0_DAVALID_UNCONNECTED),
        .DMA0_DRLAST(1'b0),
        .DMA0_DRREADY(NLW_inst_DMA0_DRREADY_UNCONNECTED),
        .DMA0_DRTYPE({1'b0,1'b0}),
        .DMA0_DRVALID(1'b0),
        .DMA0_RSTN(NLW_inst_DMA0_RSTN_UNCONNECTED),
        .DMA1_ACLK(1'b0),
        .DMA1_DAREADY(1'b0),
        .DMA1_DATYPE(NLW_inst_DMA1_DATYPE_UNCONNECTED[1:0]),
        .DMA1_DAVALID(NLW_inst_DMA1_DAVALID_UNCONNECTED),
        .DMA1_DRLAST(1'b0),
        .DMA1_DRREADY(NLW_inst_DMA1_DRREADY_UNCONNECTED),
        .DMA1_DRTYPE({1'b0,1'b0}),
        .DMA1_DRVALID(1'b0),
        .DMA1_RSTN(NLW_inst_DMA1_RSTN_UNCONNECTED),
        .DMA2_ACLK(1'b0),
        .DMA2_DAREADY(1'b0),
        .DMA2_DATYPE(NLW_inst_DMA2_DATYPE_UNCONNECTED[1:0]),
        .DMA2_DAVALID(NLW_inst_DMA2_DAVALID_UNCONNECTED),
        .DMA2_DRLAST(1'b0),
        .DMA2_DRREADY(NLW_inst_DMA2_DRREADY_UNCONNECTED),
        .DMA2_DRTYPE({1'b0,1'b0}),
        .DMA2_DRVALID(1'b0),
        .DMA2_RSTN(NLW_inst_DMA2_RSTN_UNCONNECTED),
        .DMA3_ACLK(1'b0),
        .DMA3_DAREADY(1'b0),
        .DMA3_DATYPE(NLW_inst_DMA3_DATYPE_UNCONNECTED[1:0]),
        .DMA3_DAVALID(NLW_inst_DMA3_DAVALID_UNCONNECTED),
        .DMA3_DRLAST(1'b0),
        .DMA3_DRREADY(NLW_inst_DMA3_DRREADY_UNCONNECTED),
        .DMA3_DRTYPE({1'b0,1'b0}),
        .DMA3_DRVALID(1'b0),
        .DMA3_RSTN(NLW_inst_DMA3_RSTN_UNCONNECTED),
        .ENET0_EXT_INTIN(1'b0),
        .ENET0_GMII_COL(1'b0),
        .ENET0_GMII_CRS(1'b0),
        .ENET0_GMII_RXD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ENET0_GMII_RX_CLK(1'b0),
        .ENET0_GMII_RX_DV(1'b0),
        .ENET0_GMII_RX_ER(1'b0),
        .ENET0_GMII_TXD(NLW_inst_ENET0_GMII_TXD_UNCONNECTED[7:0]),
        .ENET0_GMII_TX_CLK(1'b0),
        .ENET0_GMII_TX_EN(NLW_inst_ENET0_GMII_TX_EN_UNCONNECTED),
        .ENET0_GMII_TX_ER(NLW_inst_ENET0_GMII_TX_ER_UNCONNECTED),
        .ENET0_MDIO_I(1'b0),
        .ENET0_MDIO_MDC(NLW_inst_ENET0_MDIO_MDC_UNCONNECTED),
        .ENET0_MDIO_O(NLW_inst_ENET0_MDIO_O_UNCONNECTED),
        .ENET0_MDIO_T(NLW_inst_ENET0_MDIO_T_UNCONNECTED),
        .ENET0_PTP_DELAY_REQ_RX(NLW_inst_ENET0_PTP_DELAY_REQ_RX_UNCONNECTED),
        .ENET0_PTP_DELAY_REQ_TX(NLW_inst_ENET0_PTP_DELAY_REQ_TX_UNCONNECTED),
        .ENET0_PTP_PDELAY_REQ_RX(NLW_inst_ENET0_PTP_PDELAY_REQ_RX_UNCONNECTED),
        .ENET0_PTP_PDELAY_REQ_TX(NLW_inst_ENET0_PTP_PDELAY_REQ_TX_UNCONNECTED),
        .ENET0_PTP_PDELAY_RESP_RX(NLW_inst_ENET0_PTP_PDELAY_RESP_RX_UNCONNECTED),
        .ENET0_PTP_PDELAY_RESP_TX(NLW_inst_ENET0_PTP_PDELAY_RESP_TX_UNCONNECTED),
        .ENET0_PTP_SYNC_FRAME_RX(NLW_inst_ENET0_PTP_SYNC_FRAME_RX_UNCONNECTED),
        .ENET0_PTP_SYNC_FRAME_TX(NLW_inst_ENET0_PTP_SYNC_FRAME_TX_UNCONNECTED),
        .ENET0_SOF_RX(NLW_inst_ENET0_SOF_RX_UNCONNECTED),
        .ENET0_SOF_TX(NLW_inst_ENET0_SOF_TX_UNCONNECTED),
        .ENET1_EXT_INTIN(1'b0),
        .ENET1_GMII_COL(1'b0),
        .ENET1_GMII_CRS(1'b0),
        .ENET1_GMII_RXD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ENET1_GMII_RX_CLK(1'b0),
        .ENET1_GMII_RX_DV(1'b0),
        .ENET1_GMII_RX_ER(1'b0),
        .ENET1_GMII_TXD(NLW_inst_ENET1_GMII_TXD_UNCONNECTED[7:0]),
        .ENET1_GMII_TX_CLK(1'b0),
        .ENET1_GMII_TX_EN(NLW_inst_ENET1_GMII_TX_EN_UNCONNECTED),
        .ENET1_GMII_TX_ER(NLW_inst_ENET1_GMII_TX_ER_UNCONNECTED),
        .ENET1_MDIO_I(1'b0),
        .ENET1_MDIO_MDC(NLW_inst_ENET1_MDIO_MDC_UNCONNECTED),
        .ENET1_MDIO_O(NLW_inst_ENET1_MDIO_O_UNCONNECTED),
        .ENET1_MDIO_T(NLW_inst_ENET1_MDIO_T_UNCONNECTED),
        .ENET1_PTP_DELAY_REQ_RX(NLW_inst_ENET1_PTP_DELAY_REQ_RX_UNCONNECTED),
        .ENET1_PTP_DELAY_REQ_TX(NLW_inst_ENET1_PTP_DELAY_REQ_TX_UNCONNECTED),
        .ENET1_PTP_PDELAY_REQ_RX(NLW_inst_ENET1_PTP_PDELAY_REQ_RX_UNCONNECTED),
        .ENET1_PTP_PDELAY_REQ_TX(NLW_inst_ENET1_PTP_PDELAY_REQ_TX_UNCONNECTED),
        .ENET1_PTP_PDELAY_RESP_RX(NLW_inst_ENET1_PTP_PDELAY_RESP_RX_UNCONNECTED),
        .ENET1_PTP_PDELAY_RESP_TX(NLW_inst_ENET1_PTP_PDELAY_RESP_TX_UNCONNECTED),
        .ENET1_PTP_SYNC_FRAME_RX(NLW_inst_ENET1_PTP_SYNC_FRAME_RX_UNCONNECTED),
        .ENET1_PTP_SYNC_FRAME_TX(NLW_inst_ENET1_PTP_SYNC_FRAME_TX_UNCONNECTED),
        .ENET1_SOF_RX(NLW_inst_ENET1_SOF_RX_UNCONNECTED),
        .ENET1_SOF_TX(NLW_inst_ENET1_SOF_TX_UNCONNECTED),
        .EVENT_EVENTI(1'b0),
        .EVENT_EVENTO(NLW_inst_EVENT_EVENTO_UNCONNECTED),
        .EVENT_STANDBYWFE(NLW_inst_EVENT_STANDBYWFE_UNCONNECTED[1:0]),
        .EVENT_STANDBYWFI(NLW_inst_EVENT_STANDBYWFI_UNCONNECTED[1:0]),
        .FCLK_CLK0(FCLK_CLK0),
        .FCLK_CLK1(FCLK_CLK1),
        .FCLK_CLK2(NLW_inst_FCLK_CLK2_UNCONNECTED),
        .FCLK_CLK3(NLW_inst_FCLK_CLK3_UNCONNECTED),
        .FCLK_CLKTRIG0_N(1'b0),
        .FCLK_CLKTRIG1_N(1'b0),
        .FCLK_CLKTRIG2_N(1'b0),
        .FCLK_CLKTRIG3_N(1'b0),
        .FCLK_RESET0_N(FCLK_RESET0_N),
        .FCLK_RESET1_N(NLW_inst_FCLK_RESET1_N_UNCONNECTED),
        .FCLK_RESET2_N(NLW_inst_FCLK_RESET2_N_UNCONNECTED),
        .FCLK_RESET3_N(NLW_inst_FCLK_RESET3_N_UNCONNECTED),
        .FPGA_IDLE_N(1'b0),
        .FTMD_TRACEIN_ATID({1'b0,1'b0,1'b0,1'b0}),
        .FTMD_TRACEIN_CLK(1'b0),
        .FTMD_TRACEIN_DATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .FTMD_TRACEIN_VALID(1'b0),
        .FTMT_F2P_DEBUG({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .FTMT_F2P_TRIGACK_0(NLW_inst_FTMT_F2P_TRIGACK_0_UNCONNECTED),
        .FTMT_F2P_TRIGACK_1(NLW_inst_FTMT_F2P_TRIGACK_1_UNCONNECTED),
        .FTMT_F2P_TRIGACK_2(NLW_inst_FTMT_F2P_TRIGACK_2_UNCONNECTED),
        .FTMT_F2P_TRIGACK_3(NLW_inst_FTMT_F2P_TRIGACK_3_UNCONNECTED),
        .FTMT_F2P_TRIG_0(1'b0),
        .FTMT_F2P_TRIG_1(1'b0),
        .FTMT_F2P_TRIG_2(1'b0),
        .FTMT_F2P_TRIG_3(1'b0),
        .FTMT_P2F_DEBUG(NLW_inst_FTMT_P2F_DEBUG_UNCONNECTED[31:0]),
        .FTMT_P2F_TRIGACK_0(1'b0),
        .FTMT_P2F_TRIGACK_1(1'b0),
        .FTMT_P2F_TRIGACK_2(1'b0),
        .FTMT_P2F_TRIGACK_3(1'b0),
        .FTMT_P2F_TRIG_0(NLW_inst_FTMT_P2F_TRIG_0_UNCONNECTED),
        .FTMT_P2F_TRIG_1(NLW_inst_FTMT_P2F_TRIG_1_UNCONNECTED),
        .FTMT_P2F_TRIG_2(NLW_inst_FTMT_P2F_TRIG_2_UNCONNECTED),
        .FTMT_P2F_TRIG_3(NLW_inst_FTMT_P2F_TRIG_3_UNCONNECTED),
        .GPIO_I({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .GPIO_O(NLW_inst_GPIO_O_UNCONNECTED[63:0]),
        .GPIO_T(NLW_inst_GPIO_T_UNCONNECTED[63:0]),
        .I2C0_SCL_I(1'b0),
        .I2C0_SCL_O(NLW_inst_I2C0_SCL_O_UNCONNECTED),
        .I2C0_SCL_T(NLW_inst_I2C0_SCL_T_UNCONNECTED),
        .I2C0_SDA_I(1'b0),
        .I2C0_SDA_O(NLW_inst_I2C0_SDA_O_UNCONNECTED),
        .I2C0_SDA_T(NLW_inst_I2C0_SDA_T_UNCONNECTED),
        .I2C1_SCL_I(1'b0),
        .I2C1_SCL_O(NLW_inst_I2C1_SCL_O_UNCONNECTED),
        .I2C1_SCL_T(NLW_inst_I2C1_SCL_T_UNCONNECTED),
        .I2C1_SDA_I(1'b0),
        .I2C1_SDA_O(NLW_inst_I2C1_SDA_O_UNCONNECTED),
        .I2C1_SDA_T(NLW_inst_I2C1_SDA_T_UNCONNECTED),
        .IRQ_F2P(1'b0),
        .IRQ_P2F_CAN0(NLW_inst_IRQ_P2F_CAN0_UNCONNECTED),
        .IRQ_P2F_CAN1(NLW_inst_IRQ_P2F_CAN1_UNCONNECTED),
        .IRQ_P2F_CTI(NLW_inst_IRQ_P2F_CTI_UNCONNECTED),
        .IRQ_P2F_DMAC0(NLW_inst_IRQ_P2F_DMAC0_UNCONNECTED),
        .IRQ_P2F_DMAC1(NLW_inst_IRQ_P2F_DMAC1_UNCONNECTED),
        .IRQ_P2F_DMAC2(NLW_inst_IRQ_P2F_DMAC2_UNCONNECTED),
        .IRQ_P2F_DMAC3(NLW_inst_IRQ_P2F_DMAC3_UNCONNECTED),
        .IRQ_P2F_DMAC4(NLW_inst_IRQ_P2F_DMAC4_UNCONNECTED),
        .IRQ_P2F_DMAC5(NLW_inst_IRQ_P2F_DMAC5_UNCONNECTED),
        .IRQ_P2F_DMAC6(NLW_inst_IRQ_P2F_DMAC6_UNCONNECTED),
        .IRQ_P2F_DMAC7(NLW_inst_IRQ_P2F_DMAC7_UNCONNECTED),
        .IRQ_P2F_DMAC_ABORT(NLW_inst_IRQ_P2F_DMAC_ABORT_UNCONNECTED),
        .IRQ_P2F_ENET0(NLW_inst_IRQ_P2F_ENET0_UNCONNECTED),
        .IRQ_P2F_ENET1(NLW_inst_IRQ_P2F_ENET1_UNCONNECTED),
        .IRQ_P2F_ENET_WAKE0(NLW_inst_IRQ_P2F_ENET_WAKE0_UNCONNECTED),
        .IRQ_P2F_ENET_WAKE1(NLW_inst_IRQ_P2F_ENET_WAKE1_UNCONNECTED),
        .IRQ_P2F_GPIO(NLW_inst_IRQ_P2F_GPIO_UNCONNECTED),
        .IRQ_P2F_I2C0(NLW_inst_IRQ_P2F_I2C0_UNCONNECTED),
        .IRQ_P2F_I2C1(NLW_inst_IRQ_P2F_I2C1_UNCONNECTED),
        .IRQ_P2F_QSPI(NLW_inst_IRQ_P2F_QSPI_UNCONNECTED),
        .IRQ_P2F_SDIO0(NLW_inst_IRQ_P2F_SDIO0_UNCONNECTED),
        .IRQ_P2F_SDIO1(NLW_inst_IRQ_P2F_SDIO1_UNCONNECTED),
        .IRQ_P2F_SMC(NLW_inst_IRQ_P2F_SMC_UNCONNECTED),
        .IRQ_P2F_SPI0(NLW_inst_IRQ_P2F_SPI0_UNCONNECTED),
        .IRQ_P2F_SPI1(NLW_inst_IRQ_P2F_SPI1_UNCONNECTED),
        .IRQ_P2F_UART0(NLW_inst_IRQ_P2F_UART0_UNCONNECTED),
        .IRQ_P2F_UART1(NLW_inst_IRQ_P2F_UART1_UNCONNECTED),
        .IRQ_P2F_USB0(NLW_inst_IRQ_P2F_USB0_UNCONNECTED),
        .IRQ_P2F_USB1(NLW_inst_IRQ_P2F_USB1_UNCONNECTED),
        .MIO(MIO),
        .M_AXI_GP0_ACLK(1'b0),
        .M_AXI_GP0_ARADDR(M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(NLW_inst_M_AXI_GP0_ARCACHE_UNCONNECTED[3:0]),
        .M_AXI_GP0_ARESETN(NLW_inst_M_AXI_GP0_ARESETN_UNCONNECTED),
        .M_AXI_GP0_ARID(M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(NLW_inst_M_AXI_GP0_ARLOCK_UNCONNECTED[1:0]),
        .M_AXI_GP0_ARPROT(M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(NLW_inst_M_AXI_GP0_ARQOS_UNCONNECTED[3:0]),
        .M_AXI_GP0_ARREADY(M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE({NLW_inst_M_AXI_GP0_ARSIZE_UNCONNECTED[2],\^M_AXI_GP0_ARSIZE }),
        .M_AXI_GP0_ARVALID(M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(NLW_inst_M_AXI_GP0_AWCACHE_UNCONNECTED[3:0]),
        .M_AXI_GP0_AWID(M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(NLW_inst_M_AXI_GP0_AWLOCK_UNCONNECTED[1:0]),
        .M_AXI_GP0_AWPROT(M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(NLW_inst_M_AXI_GP0_AWQOS_UNCONNECTED[3:0]),
        .M_AXI_GP0_AWREADY(M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE({NLW_inst_M_AXI_GP0_AWSIZE_UNCONNECTED[2],\^M_AXI_GP0_AWSIZE }),
        .M_AXI_GP0_AWVALID(M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(NLW_inst_M_AXI_GP0_WID_UNCONNECTED[11:0]),
        .M_AXI_GP0_WLAST(NLW_inst_M_AXI_GP0_WLAST_UNCONNECTED),
        .M_AXI_GP0_WREADY(M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(M_AXI_GP0_WVALID),
        .M_AXI_GP1_ACLK(1'b0),
        .M_AXI_GP1_ARADDR(NLW_inst_M_AXI_GP1_ARADDR_UNCONNECTED[31:0]),
        .M_AXI_GP1_ARBURST(NLW_inst_M_AXI_GP1_ARBURST_UNCONNECTED[1:0]),
        .M_AXI_GP1_ARCACHE(NLW_inst_M_AXI_GP1_ARCACHE_UNCONNECTED[3:0]),
        .M_AXI_GP1_ARESETN(NLW_inst_M_AXI_GP1_ARESETN_UNCONNECTED),
        .M_AXI_GP1_ARID(NLW_inst_M_AXI_GP1_ARID_UNCONNECTED[11:0]),
        .M_AXI_GP1_ARLEN(NLW_inst_M_AXI_GP1_ARLEN_UNCONNECTED[3:0]),
        .M_AXI_GP1_ARLOCK(NLW_inst_M_AXI_GP1_ARLOCK_UNCONNECTED[1:0]),
        .M_AXI_GP1_ARPROT(NLW_inst_M_AXI_GP1_ARPROT_UNCONNECTED[2:0]),
        .M_AXI_GP1_ARQOS(NLW_inst_M_AXI_GP1_ARQOS_UNCONNECTED[3:0]),
        .M_AXI_GP1_ARREADY(1'b0),
        .M_AXI_GP1_ARSIZE(NLW_inst_M_AXI_GP1_ARSIZE_UNCONNECTED[2:0]),
        .M_AXI_GP1_ARVALID(NLW_inst_M_AXI_GP1_ARVALID_UNCONNECTED),
        .M_AXI_GP1_AWADDR(NLW_inst_M_AXI_GP1_AWADDR_UNCONNECTED[31:0]),
        .M_AXI_GP1_AWBURST(NLW_inst_M_AXI_GP1_AWBURST_UNCONNECTED[1:0]),
        .M_AXI_GP1_AWCACHE(NLW_inst_M_AXI_GP1_AWCACHE_UNCONNECTED[3:0]),
        .M_AXI_GP1_AWID(NLW_inst_M_AXI_GP1_AWID_UNCONNECTED[11:0]),
        .M_AXI_GP1_AWLEN(NLW_inst_M_AXI_GP1_AWLEN_UNCONNECTED[3:0]),
        .M_AXI_GP1_AWLOCK(NLW_inst_M_AXI_GP1_AWLOCK_UNCONNECTED[1:0]),
        .M_AXI_GP1_AWPROT(NLW_inst_M_AXI_GP1_AWPROT_UNCONNECTED[2:0]),
        .M_AXI_GP1_AWQOS(NLW_inst_M_AXI_GP1_AWQOS_UNCONNECTED[3:0]),
        .M_AXI_GP1_AWREADY(1'b0),
        .M_AXI_GP1_AWSIZE(NLW_inst_M_AXI_GP1_AWSIZE_UNCONNECTED[2:0]),
        .M_AXI_GP1_AWVALID(NLW_inst_M_AXI_GP1_AWVALID_UNCONNECTED),
        .M_AXI_GP1_BID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_GP1_BREADY(NLW_inst_M_AXI_GP1_BREADY_UNCONNECTED),
        .M_AXI_GP1_BRESP({1'b0,1'b0}),
        .M_AXI_GP1_BVALID(1'b0),
        .M_AXI_GP1_RDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_GP1_RID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_GP1_RLAST(1'b0),
        .M_AXI_GP1_RREADY(NLW_inst_M_AXI_GP1_RREADY_UNCONNECTED),
        .M_AXI_GP1_RRESP({1'b0,1'b0}),
        .M_AXI_GP1_RVALID(1'b0),
        .M_AXI_GP1_WDATA(NLW_inst_M_AXI_GP1_WDATA_UNCONNECTED[31:0]),
        .M_AXI_GP1_WID(NLW_inst_M_AXI_GP1_WID_UNCONNECTED[11:0]),
        .M_AXI_GP1_WLAST(NLW_inst_M_AXI_GP1_WLAST_UNCONNECTED),
        .M_AXI_GP1_WREADY(1'b0),
        .M_AXI_GP1_WSTRB(NLW_inst_M_AXI_GP1_WSTRB_UNCONNECTED[3:0]),
        .M_AXI_GP1_WVALID(NLW_inst_M_AXI_GP1_WVALID_UNCONNECTED),
        .PJTAG_TCK(1'b0),
        .PJTAG_TDI(1'b0),
        .PJTAG_TDO(NLW_inst_PJTAG_TDO_UNCONNECTED),
        .PJTAG_TMS(1'b0),
        .PS_CLK(PS_CLK),
        .PS_PORB(PS_PORB),
        .PS_SRSTB(PS_SRSTB),
        .SDIO0_BUSPOW(NLW_inst_SDIO0_BUSPOW_UNCONNECTED),
        .SDIO0_BUSVOLT(NLW_inst_SDIO0_BUSVOLT_UNCONNECTED[2:0]),
        .SDIO0_CDN(1'b0),
        .SDIO0_CLK(NLW_inst_SDIO0_CLK_UNCONNECTED),
        .SDIO0_CLK_FB(1'b0),
        .SDIO0_CMD_I(1'b0),
        .SDIO0_CMD_O(NLW_inst_SDIO0_CMD_O_UNCONNECTED),
        .SDIO0_CMD_T(NLW_inst_SDIO0_CMD_T_UNCONNECTED),
        .SDIO0_DATA_I({1'b0,1'b0,1'b0,1'b0}),
        .SDIO0_DATA_O(NLW_inst_SDIO0_DATA_O_UNCONNECTED[3:0]),
        .SDIO0_DATA_T(NLW_inst_SDIO0_DATA_T_UNCONNECTED[3:0]),
        .SDIO0_LED(NLW_inst_SDIO0_LED_UNCONNECTED),
        .SDIO0_WP(1'b0),
        .SDIO1_BUSPOW(NLW_inst_SDIO1_BUSPOW_UNCONNECTED),
        .SDIO1_BUSVOLT(NLW_inst_SDIO1_BUSVOLT_UNCONNECTED[2:0]),
        .SDIO1_CDN(1'b0),
        .SDIO1_CLK(NLW_inst_SDIO1_CLK_UNCONNECTED),
        .SDIO1_CLK_FB(1'b0),
        .SDIO1_CMD_I(1'b0),
        .SDIO1_CMD_O(NLW_inst_SDIO1_CMD_O_UNCONNECTED),
        .SDIO1_CMD_T(NLW_inst_SDIO1_CMD_T_UNCONNECTED),
        .SDIO1_DATA_I({1'b0,1'b0,1'b0,1'b0}),
        .SDIO1_DATA_O(NLW_inst_SDIO1_DATA_O_UNCONNECTED[3:0]),
        .SDIO1_DATA_T(NLW_inst_SDIO1_DATA_T_UNCONNECTED[3:0]),
        .SDIO1_LED(NLW_inst_SDIO1_LED_UNCONNECTED),
        .SDIO1_WP(1'b0),
        .SPI0_MISO_I(1'b0),
        .SPI0_MISO_O(NLW_inst_SPI0_MISO_O_UNCONNECTED),
        .SPI0_MISO_T(NLW_inst_SPI0_MISO_T_UNCONNECTED),
        .SPI0_MOSI_I(1'b0),
        .SPI0_MOSI_O(NLW_inst_SPI0_MOSI_O_UNCONNECTED),
        .SPI0_MOSI_T(NLW_inst_SPI0_MOSI_T_UNCONNECTED),
        .SPI0_SCLK_I(1'b0),
        .SPI0_SCLK_O(NLW_inst_SPI0_SCLK_O_UNCONNECTED),
        .SPI0_SCLK_T(NLW_inst_SPI0_SCLK_T_UNCONNECTED),
        .SPI0_SS1_O(NLW_inst_SPI0_SS1_O_UNCONNECTED),
        .SPI0_SS2_O(NLW_inst_SPI0_SS2_O_UNCONNECTED),
        .SPI0_SS_I(1'b0),
        .SPI0_SS_O(NLW_inst_SPI0_SS_O_UNCONNECTED),
        .SPI0_SS_T(NLW_inst_SPI0_SS_T_UNCONNECTED),
        .SPI1_MISO_I(1'b0),
        .SPI1_MISO_O(NLW_inst_SPI1_MISO_O_UNCONNECTED),
        .SPI1_MISO_T(NLW_inst_SPI1_MISO_T_UNCONNECTED),
        .SPI1_MOSI_I(1'b0),
        .SPI1_MOSI_O(NLW_inst_SPI1_MOSI_O_UNCONNECTED),
        .SPI1_MOSI_T(NLW_inst_SPI1_MOSI_T_UNCONNECTED),
        .SPI1_SCLK_I(1'b0),
        .SPI1_SCLK_O(NLW_inst_SPI1_SCLK_O_UNCONNECTED),
        .SPI1_SCLK_T(NLW_inst_SPI1_SCLK_T_UNCONNECTED),
        .SPI1_SS1_O(NLW_inst_SPI1_SS1_O_UNCONNECTED),
        .SPI1_SS2_O(NLW_inst_SPI1_SS2_O_UNCONNECTED),
        .SPI1_SS_I(1'b0),
        .SPI1_SS_O(NLW_inst_SPI1_SS_O_UNCONNECTED),
        .SPI1_SS_T(NLW_inst_SPI1_SS_T_UNCONNECTED),
        .SRAM_INTIN(1'b0),
        .S_AXI_ACP_ACLK(1'b0),
        .S_AXI_ACP_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_ACP_ARBURST({1'b0,1'b0}),
        .S_AXI_ACP_ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_ACP_ARESETN(NLW_inst_S_AXI_ACP_ARESETN_UNCONNECTED),
        .S_AXI_ACP_ARID({1'b0,1'b0,1'b0}),
        .S_AXI_ACP_ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_ACP_ARLOCK({1'b0,1'b0}),
        .S_AXI_ACP_ARPROT({1'b0,1'b0,1'b0}),
        .S_AXI_ACP_ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_ACP_ARREADY(NLW_inst_S_AXI_ACP_ARREADY_UNCONNECTED),
        .S_AXI_ACP_ARSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_ACP_ARUSER({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_ACP_ARVALID(1'b0),
        .S_AXI_ACP_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_ACP_AWBURST({1'b0,1'b0}),
        .S_AXI_ACP_AWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_ACP_AWID({1'b0,1'b0,1'b0}),
        .S_AXI_ACP_AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_ACP_AWLOCK({1'b0,1'b0}),
        .S_AXI_ACP_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_ACP_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_ACP_AWREADY(NLW_inst_S_AXI_ACP_AWREADY_UNCONNECTED),
        .S_AXI_ACP_AWSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_ACP_AWUSER({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_ACP_AWVALID(1'b0),
        .S_AXI_ACP_BID(NLW_inst_S_AXI_ACP_BID_UNCONNECTED[2:0]),
        .S_AXI_ACP_BREADY(1'b0),
        .S_AXI_ACP_BRESP(NLW_inst_S_AXI_ACP_BRESP_UNCONNECTED[1:0]),
        .S_AXI_ACP_BVALID(NLW_inst_S_AXI_ACP_BVALID_UNCONNECTED),
        .S_AXI_ACP_RDATA(NLW_inst_S_AXI_ACP_RDATA_UNCONNECTED[63:0]),
        .S_AXI_ACP_RID(NLW_inst_S_AXI_ACP_RID_UNCONNECTED[2:0]),
        .S_AXI_ACP_RLAST(NLW_inst_S_AXI_ACP_RLAST_UNCONNECTED),
        .S_AXI_ACP_RREADY(1'b0),
        .S_AXI_ACP_RRESP(NLW_inst_S_AXI_ACP_RRESP_UNCONNECTED[1:0]),
        .S_AXI_ACP_RVALID(NLW_inst_S_AXI_ACP_RVALID_UNCONNECTED),
        .S_AXI_ACP_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_ACP_WID({1'b0,1'b0,1'b0}),
        .S_AXI_ACP_WLAST(1'b0),
        .S_AXI_ACP_WREADY(NLW_inst_S_AXI_ACP_WREADY_UNCONNECTED),
        .S_AXI_ACP_WSTRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_ACP_WVALID(1'b0),
        .S_AXI_GP0_ACLK(1'b0),
        .S_AXI_GP0_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_ARBURST({1'b0,1'b0}),
        .S_AXI_GP0_ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_ARESETN(NLW_inst_S_AXI_GP0_ARESETN_UNCONNECTED),
        .S_AXI_GP0_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_ARLOCK({1'b0,1'b0}),
        .S_AXI_GP0_ARPROT({1'b0,1'b0,1'b0}),
        .S_AXI_GP0_ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_ARREADY(NLW_inst_S_AXI_GP0_ARREADY_UNCONNECTED),
        .S_AXI_GP0_ARSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_GP0_ARVALID(1'b0),
        .S_AXI_GP0_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_AWBURST({1'b0,1'b0}),
        .S_AXI_GP0_AWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_AWLOCK({1'b0,1'b0}),
        .S_AXI_GP0_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_GP0_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_AWREADY(NLW_inst_S_AXI_GP0_AWREADY_UNCONNECTED),
        .S_AXI_GP0_AWSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_GP0_AWVALID(1'b0),
        .S_AXI_GP0_BID(NLW_inst_S_AXI_GP0_BID_UNCONNECTED[5:0]),
        .S_AXI_GP0_BREADY(1'b0),
        .S_AXI_GP0_BRESP(NLW_inst_S_AXI_GP0_BRESP_UNCONNECTED[1:0]),
        .S_AXI_GP0_BVALID(NLW_inst_S_AXI_GP0_BVALID_UNCONNECTED),
        .S_AXI_GP0_RDATA(NLW_inst_S_AXI_GP0_RDATA_UNCONNECTED[31:0]),
        .S_AXI_GP0_RID(NLW_inst_S_AXI_GP0_RID_UNCONNECTED[5:0]),
        .S_AXI_GP0_RLAST(NLW_inst_S_AXI_GP0_RLAST_UNCONNECTED),
        .S_AXI_GP0_RREADY(1'b0),
        .S_AXI_GP0_RRESP(NLW_inst_S_AXI_GP0_RRESP_UNCONNECTED[1:0]),
        .S_AXI_GP0_RVALID(NLW_inst_S_AXI_GP0_RVALID_UNCONNECTED),
        .S_AXI_GP0_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_WLAST(1'b0),
        .S_AXI_GP0_WREADY(NLW_inst_S_AXI_GP0_WREADY_UNCONNECTED),
        .S_AXI_GP0_WSTRB({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_WVALID(1'b0),
        .S_AXI_GP1_ACLK(1'b0),
        .S_AXI_GP1_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP1_ARBURST({1'b0,1'b0}),
        .S_AXI_GP1_ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP1_ARESETN(NLW_inst_S_AXI_GP1_ARESETN_UNCONNECTED),
        .S_AXI_GP1_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP1_ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP1_ARLOCK({1'b0,1'b0}),
        .S_AXI_GP1_ARPROT({1'b0,1'b0,1'b0}),
        .S_AXI_GP1_ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP1_ARREADY(NLW_inst_S_AXI_GP1_ARREADY_UNCONNECTED),
        .S_AXI_GP1_ARSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_GP1_ARVALID(1'b0),
        .S_AXI_GP1_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP1_AWBURST({1'b0,1'b0}),
        .S_AXI_GP1_AWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP1_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP1_AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP1_AWLOCK({1'b0,1'b0}),
        .S_AXI_GP1_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_GP1_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP1_AWREADY(NLW_inst_S_AXI_GP1_AWREADY_UNCONNECTED),
        .S_AXI_GP1_AWSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_GP1_AWVALID(1'b0),
        .S_AXI_GP1_BID(NLW_inst_S_AXI_GP1_BID_UNCONNECTED[5:0]),
        .S_AXI_GP1_BREADY(1'b0),
        .S_AXI_GP1_BRESP(NLW_inst_S_AXI_GP1_BRESP_UNCONNECTED[1:0]),
        .S_AXI_GP1_BVALID(NLW_inst_S_AXI_GP1_BVALID_UNCONNECTED),
        .S_AXI_GP1_RDATA(NLW_inst_S_AXI_GP1_RDATA_UNCONNECTED[31:0]),
        .S_AXI_GP1_RID(NLW_inst_S_AXI_GP1_RID_UNCONNECTED[5:0]),
        .S_AXI_GP1_RLAST(NLW_inst_S_AXI_GP1_RLAST_UNCONNECTED),
        .S_AXI_GP1_RREADY(1'b0),
        .S_AXI_GP1_RRESP(NLW_inst_S_AXI_GP1_RRESP_UNCONNECTED[1:0]),
        .S_AXI_GP1_RVALID(NLW_inst_S_AXI_GP1_RVALID_UNCONNECTED),
        .S_AXI_GP1_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP1_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP1_WLAST(1'b0),
        .S_AXI_GP1_WREADY(NLW_inst_S_AXI_GP1_WREADY_UNCONNECTED),
        .S_AXI_GP1_WSTRB({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP1_WVALID(1'b0),
        .S_AXI_HP0_ACLK(1'b0),
        .S_AXI_HP0_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARBURST({1'b0,1'b0}),
        .S_AXI_HP0_ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARESETN(NLW_inst_S_AXI_HP0_ARESETN_UNCONNECTED),
        .S_AXI_HP0_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARLOCK({1'b0,1'b0}),
        .S_AXI_HP0_ARPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARREADY(NLW_inst_S_AXI_HP0_ARREADY_UNCONNECTED),
        .S_AXI_HP0_ARSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARVALID(1'b0),
        .S_AXI_HP0_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWBURST({1'b0,1'b0}),
        .S_AXI_HP0_AWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP0_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWREADY(NLW_inst_S_AXI_HP0_AWREADY_UNCONNECTED),
        .S_AXI_HP0_AWSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWVALID(1'b0),
        .S_AXI_HP0_BID(NLW_inst_S_AXI_HP0_BID_UNCONNECTED[5:0]),
        .S_AXI_HP0_BREADY(1'b0),
        .S_AXI_HP0_BRESP(NLW_inst_S_AXI_HP0_BRESP_UNCONNECTED[1:0]),
        .S_AXI_HP0_BVALID(NLW_inst_S_AXI_HP0_BVALID_UNCONNECTED),
        .S_AXI_HP0_RACOUNT(NLW_inst_S_AXI_HP0_RACOUNT_UNCONNECTED[2:0]),
        .S_AXI_HP0_RCOUNT(NLW_inst_S_AXI_HP0_RCOUNT_UNCONNECTED[7:0]),
        .S_AXI_HP0_RDATA(NLW_inst_S_AXI_HP0_RDATA_UNCONNECTED[63:0]),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RID(NLW_inst_S_AXI_HP0_RID_UNCONNECTED[5:0]),
        .S_AXI_HP0_RLAST(NLW_inst_S_AXI_HP0_RLAST_UNCONNECTED),
        .S_AXI_HP0_RREADY(1'b0),
        .S_AXI_HP0_RRESP(NLW_inst_S_AXI_HP0_RRESP_UNCONNECTED[1:0]),
        .S_AXI_HP0_RVALID(NLW_inst_S_AXI_HP0_RVALID_UNCONNECTED),
        .S_AXI_HP0_WACOUNT(NLW_inst_S_AXI_HP0_WACOUNT_UNCONNECTED[5:0]),
        .S_AXI_HP0_WCOUNT(NLW_inst_S_AXI_HP0_WCOUNT_UNCONNECTED[7:0]),
        .S_AXI_HP0_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_WLAST(1'b0),
        .S_AXI_HP0_WREADY(NLW_inst_S_AXI_HP0_WREADY_UNCONNECTED),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_WVALID(1'b0),
        .S_AXI_HP1_ACLK(1'b0),
        .S_AXI_HP1_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARBURST({1'b0,1'b0}),
        .S_AXI_HP1_ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARESETN(NLW_inst_S_AXI_HP1_ARESETN_UNCONNECTED),
        .S_AXI_HP1_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARLOCK({1'b0,1'b0}),
        .S_AXI_HP1_ARPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARREADY(NLW_inst_S_AXI_HP1_ARREADY_UNCONNECTED),
        .S_AXI_HP1_ARSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARVALID(1'b0),
        .S_AXI_HP1_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWBURST({1'b0,1'b0}),
        .S_AXI_HP1_AWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP1_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWREADY(NLW_inst_S_AXI_HP1_AWREADY_UNCONNECTED),
        .S_AXI_HP1_AWSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWVALID(1'b0),
        .S_AXI_HP1_BID(NLW_inst_S_AXI_HP1_BID_UNCONNECTED[5:0]),
        .S_AXI_HP1_BREADY(1'b0),
        .S_AXI_HP1_BRESP(NLW_inst_S_AXI_HP1_BRESP_UNCONNECTED[1:0]),
        .S_AXI_HP1_BVALID(NLW_inst_S_AXI_HP1_BVALID_UNCONNECTED),
        .S_AXI_HP1_RACOUNT(NLW_inst_S_AXI_HP1_RACOUNT_UNCONNECTED[2:0]),
        .S_AXI_HP1_RCOUNT(NLW_inst_S_AXI_HP1_RCOUNT_UNCONNECTED[7:0]),
        .S_AXI_HP1_RDATA(NLW_inst_S_AXI_HP1_RDATA_UNCONNECTED[63:0]),
        .S_AXI_HP1_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP1_RID(NLW_inst_S_AXI_HP1_RID_UNCONNECTED[5:0]),
        .S_AXI_HP1_RLAST(NLW_inst_S_AXI_HP1_RLAST_UNCONNECTED),
        .S_AXI_HP1_RREADY(1'b0),
        .S_AXI_HP1_RRESP(NLW_inst_S_AXI_HP1_RRESP_UNCONNECTED[1:0]),
        .S_AXI_HP1_RVALID(NLW_inst_S_AXI_HP1_RVALID_UNCONNECTED),
        .S_AXI_HP1_WACOUNT(NLW_inst_S_AXI_HP1_WACOUNT_UNCONNECTED[5:0]),
        .S_AXI_HP1_WCOUNT(NLW_inst_S_AXI_HP1_WCOUNT_UNCONNECTED[7:0]),
        .S_AXI_HP1_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_WLAST(1'b0),
        .S_AXI_HP1_WREADY(NLW_inst_S_AXI_HP1_WREADY_UNCONNECTED),
        .S_AXI_HP1_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP1_WSTRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_WVALID(1'b0),
        .S_AXI_HP2_ACLK(1'b0),
        .S_AXI_HP2_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_ARBURST({1'b0,1'b0}),
        .S_AXI_HP2_ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_ARESETN(NLW_inst_S_AXI_HP2_ARESETN_UNCONNECTED),
        .S_AXI_HP2_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_ARLOCK({1'b0,1'b0}),
        .S_AXI_HP2_ARPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP2_ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_ARREADY(NLW_inst_S_AXI_HP2_ARREADY_UNCONNECTED),
        .S_AXI_HP2_ARSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_HP2_ARVALID(1'b0),
        .S_AXI_HP2_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWBURST({1'b0,1'b0}),
        .S_AXI_HP2_AWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP2_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWREADY(NLW_inst_S_AXI_HP2_AWREADY_UNCONNECTED),
        .S_AXI_HP2_AWSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWVALID(1'b0),
        .S_AXI_HP2_BID(NLW_inst_S_AXI_HP2_BID_UNCONNECTED[5:0]),
        .S_AXI_HP2_BREADY(1'b0),
        .S_AXI_HP2_BRESP(NLW_inst_S_AXI_HP2_BRESP_UNCONNECTED[1:0]),
        .S_AXI_HP2_BVALID(NLW_inst_S_AXI_HP2_BVALID_UNCONNECTED),
        .S_AXI_HP2_RACOUNT(NLW_inst_S_AXI_HP2_RACOUNT_UNCONNECTED[2:0]),
        .S_AXI_HP2_RCOUNT(NLW_inst_S_AXI_HP2_RCOUNT_UNCONNECTED[7:0]),
        .S_AXI_HP2_RDATA(NLW_inst_S_AXI_HP2_RDATA_UNCONNECTED[63:0]),
        .S_AXI_HP2_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP2_RID(NLW_inst_S_AXI_HP2_RID_UNCONNECTED[5:0]),
        .S_AXI_HP2_RLAST(NLW_inst_S_AXI_HP2_RLAST_UNCONNECTED),
        .S_AXI_HP2_RREADY(1'b0),
        .S_AXI_HP2_RRESP(NLW_inst_S_AXI_HP2_RRESP_UNCONNECTED[1:0]),
        .S_AXI_HP2_RVALID(NLW_inst_S_AXI_HP2_RVALID_UNCONNECTED),
        .S_AXI_HP2_WACOUNT(NLW_inst_S_AXI_HP2_WACOUNT_UNCONNECTED[5:0]),
        .S_AXI_HP2_WCOUNT(NLW_inst_S_AXI_HP2_WCOUNT_UNCONNECTED[7:0]),
        .S_AXI_HP2_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_WLAST(1'b0),
        .S_AXI_HP2_WREADY(NLW_inst_S_AXI_HP2_WREADY_UNCONNECTED),
        .S_AXI_HP2_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP2_WSTRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_WVALID(1'b0),
        .S_AXI_HP3_ACLK(1'b0),
        .S_AXI_HP3_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP3_ARBURST({1'b0,1'b0}),
        .S_AXI_HP3_ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP3_ARESETN(NLW_inst_S_AXI_HP3_ARESETN_UNCONNECTED),
        .S_AXI_HP3_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP3_ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP3_ARLOCK({1'b0,1'b0}),
        .S_AXI_HP3_ARPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP3_ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP3_ARREADY(NLW_inst_S_AXI_HP3_ARREADY_UNCONNECTED),
        .S_AXI_HP3_ARSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_HP3_ARVALID(1'b0),
        .S_AXI_HP3_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP3_AWBURST({1'b0,1'b0}),
        .S_AXI_HP3_AWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP3_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP3_AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP3_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP3_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP3_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP3_AWREADY(NLW_inst_S_AXI_HP3_AWREADY_UNCONNECTED),
        .S_AXI_HP3_AWSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_HP3_AWVALID(1'b0),
        .S_AXI_HP3_BID(NLW_inst_S_AXI_HP3_BID_UNCONNECTED[5:0]),
        .S_AXI_HP3_BREADY(1'b0),
        .S_AXI_HP3_BRESP(NLW_inst_S_AXI_HP3_BRESP_UNCONNECTED[1:0]),
        .S_AXI_HP3_BVALID(NLW_inst_S_AXI_HP3_BVALID_UNCONNECTED),
        .S_AXI_HP3_RACOUNT(NLW_inst_S_AXI_HP3_RACOUNT_UNCONNECTED[2:0]),
        .S_AXI_HP3_RCOUNT(NLW_inst_S_AXI_HP3_RCOUNT_UNCONNECTED[7:0]),
        .S_AXI_HP3_RDATA(NLW_inst_S_AXI_HP3_RDATA_UNCONNECTED[63:0]),
        .S_AXI_HP3_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP3_RID(NLW_inst_S_AXI_HP3_RID_UNCONNECTED[5:0]),
        .S_AXI_HP3_RLAST(NLW_inst_S_AXI_HP3_RLAST_UNCONNECTED),
        .S_AXI_HP3_RREADY(1'b0),
        .S_AXI_HP3_RRESP(NLW_inst_S_AXI_HP3_RRESP_UNCONNECTED[1:0]),
        .S_AXI_HP3_RVALID(NLW_inst_S_AXI_HP3_RVALID_UNCONNECTED),
        .S_AXI_HP3_WACOUNT(NLW_inst_S_AXI_HP3_WACOUNT_UNCONNECTED[5:0]),
        .S_AXI_HP3_WCOUNT(NLW_inst_S_AXI_HP3_WCOUNT_UNCONNECTED[7:0]),
        .S_AXI_HP3_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP3_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP3_WLAST(1'b0),
        .S_AXI_HP3_WREADY(NLW_inst_S_AXI_HP3_WREADY_UNCONNECTED),
        .S_AXI_HP3_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP3_WSTRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP3_WVALID(1'b0),
        .TRACE_CLK(1'b0),
        .TRACE_CLK_OUT(NLW_inst_TRACE_CLK_OUT_UNCONNECTED),
        .TRACE_CTL(NLW_inst_TRACE_CTL_UNCONNECTED),
        .TRACE_DATA(NLW_inst_TRACE_DATA_UNCONNECTED[1:0]),
        .TTC0_CLK0_IN(1'b0),
        .TTC0_CLK1_IN(1'b0),
        .TTC0_CLK2_IN(1'b0),
        .TTC0_WAVE0_OUT(NLW_inst_TTC0_WAVE0_OUT_UNCONNECTED),
        .TTC0_WAVE1_OUT(NLW_inst_TTC0_WAVE1_OUT_UNCONNECTED),
        .TTC0_WAVE2_OUT(NLW_inst_TTC0_WAVE2_OUT_UNCONNECTED),
        .TTC1_CLK0_IN(1'b0),
        .TTC1_CLK1_IN(1'b0),
        .TTC1_CLK2_IN(1'b0),
        .TTC1_WAVE0_OUT(NLW_inst_TTC1_WAVE0_OUT_UNCONNECTED),
        .TTC1_WAVE1_OUT(NLW_inst_TTC1_WAVE1_OUT_UNCONNECTED),
        .TTC1_WAVE2_OUT(NLW_inst_TTC1_WAVE2_OUT_UNCONNECTED),
        .UART0_CTSN(1'b0),
        .UART0_DCDN(1'b0),
        .UART0_DSRN(1'b0),
        .UART0_DTRN(NLW_inst_UART0_DTRN_UNCONNECTED),
        .UART0_RIN(1'b0),
        .UART0_RTSN(NLW_inst_UART0_RTSN_UNCONNECTED),
        .UART0_RX(1'b1),
        .UART0_TX(NLW_inst_UART0_TX_UNCONNECTED),
        .UART1_CTSN(1'b0),
        .UART1_DCDN(1'b0),
        .UART1_DSRN(1'b0),
        .UART1_DTRN(NLW_inst_UART1_DTRN_UNCONNECTED),
        .UART1_RIN(1'b0),
        .UART1_RTSN(NLW_inst_UART1_RTSN_UNCONNECTED),
        .UART1_RX(1'b1),
        .UART1_TX(NLW_inst_UART1_TX_UNCONNECTED),
        .USB0_PORT_INDCTL(NLW_inst_USB0_PORT_INDCTL_UNCONNECTED[1:0]),
        .USB0_VBUS_PWRFAULT(1'b0),
        .USB0_VBUS_PWRSELECT(NLW_inst_USB0_VBUS_PWRSELECT_UNCONNECTED),
        .USB1_PORT_INDCTL(NLW_inst_USB1_PORT_INDCTL_UNCONNECTED[1:0]),
        .USB1_VBUS_PWRFAULT(1'b0),
        .USB1_VBUS_PWRSELECT(NLW_inst_USB1_VBUS_PWRSELECT_UNCONNECTED),
        .WDT_CLK_IN(1'b0),
        .WDT_RST_OUT(NLW_inst_WDT_RST_OUT_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "dwa_ps_bd_ps7_0_axi_periph_0" *) 
module dwa_ps_bd_dwa_ps_bd_ps7_0_axi_periph_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [2:0]M00_AXI_awprot;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire [31:0]M00_AXI_araddr;
  wire [2:0]M00_AXI_arprot;
  wire M00_AXI_arready;
  wire M00_AXI_arvalid;
  wire [31:0]M00_AXI_awaddr;
  wire [2:0]M00_AXI_awprot;
  wire M00_AXI_awready;
  wire M00_AXI_awvalid;
  wire M00_AXI_bready;
  wire [1:0]M00_AXI_bresp;
  wire M00_AXI_bvalid;
  wire [31:0]M00_AXI_rdata;
  wire M00_AXI_rready;
  wire [1:0]M00_AXI_rresp;
  wire M00_AXI_rvalid;
  wire [31:0]M00_AXI_wdata;
  wire M00_AXI_wready;
  wire [3:0]M00_AXI_wstrb;
  wire M00_AXI_wvalid;
  wire S00_ACLK;
  wire S00_ARESETN;
  wire [31:0]S00_AXI_araddr;
  wire [1:0]S00_AXI_arburst;
  wire [11:0]S00_AXI_arid;
  wire [3:0]S00_AXI_arlen;
  wire [2:0]S00_AXI_arprot;
  wire S00_AXI_arready;
  wire [2:0]S00_AXI_arsize;
  wire S00_AXI_arvalid;
  wire [31:0]S00_AXI_awaddr;
  wire [1:0]S00_AXI_awburst;
  wire [11:0]S00_AXI_awid;
  wire [3:0]S00_AXI_awlen;
  wire [2:0]S00_AXI_awprot;
  wire S00_AXI_awready;
  wire [2:0]S00_AXI_awsize;
  wire S00_AXI_awvalid;
  wire [11:0]S00_AXI_bid;
  wire S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire S00_AXI_bvalid;
  wire [31:0]S00_AXI_rdata;
  wire [11:0]S00_AXI_rid;
  wire S00_AXI_rlast;
  wire S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire S00_AXI_rvalid;
  wire [31:0]S00_AXI_wdata;
  wire S00_AXI_wready;
  wire [3:0]S00_AXI_wstrb;
  wire S00_AXI_wvalid;

  dwa_ps_bd_s00_couplers_imp_166NYF5 s00_couplers
       (.M00_AXI_araddr(M00_AXI_araddr),
        .M00_AXI_arprot(M00_AXI_arprot),
        .M00_AXI_arready(M00_AXI_arready),
        .M00_AXI_arvalid(M00_AXI_arvalid),
        .M00_AXI_awaddr(M00_AXI_awaddr),
        .M00_AXI_awprot(M00_AXI_awprot),
        .M00_AXI_awready(M00_AXI_awready),
        .M00_AXI_awvalid(M00_AXI_awvalid),
        .M00_AXI_bready(M00_AXI_bready),
        .M00_AXI_bresp(M00_AXI_bresp),
        .M00_AXI_bvalid(M00_AXI_bvalid),
        .M00_AXI_rdata(M00_AXI_rdata),
        .M00_AXI_rready(M00_AXI_rready),
        .M00_AXI_rresp(M00_AXI_rresp),
        .M00_AXI_rvalid(M00_AXI_rvalid),
        .M00_AXI_wdata(M00_AXI_wdata),
        .M00_AXI_wready(M00_AXI_wready),
        .M00_AXI_wstrb(M00_AXI_wstrb),
        .M00_AXI_wvalid(M00_AXI_wvalid),
        .S00_ACLK(S00_ACLK),
        .S00_ARESETN(S00_ARESETN),
        .S00_AXI_araddr(S00_AXI_araddr),
        .S00_AXI_arburst(S00_AXI_arburst),
        .S00_AXI_arid(S00_AXI_arid),
        .S00_AXI_arlen(S00_AXI_arlen),
        .S00_AXI_arprot(S00_AXI_arprot),
        .S00_AXI_arready(S00_AXI_arready),
        .S00_AXI_arsize(S00_AXI_arsize[1:0]),
        .S00_AXI_arvalid(S00_AXI_arvalid),
        .S00_AXI_awaddr(S00_AXI_awaddr),
        .S00_AXI_awburst(S00_AXI_awburst),
        .S00_AXI_awid(S00_AXI_awid),
        .S00_AXI_awlen(S00_AXI_awlen),
        .S00_AXI_awprot(S00_AXI_awprot),
        .S00_AXI_awready(S00_AXI_awready),
        .S00_AXI_awsize(S00_AXI_awsize[1:0]),
        .S00_AXI_awvalid(S00_AXI_awvalid),
        .S00_AXI_bid(S00_AXI_bid),
        .S00_AXI_bready(S00_AXI_bready),
        .S00_AXI_bresp(S00_AXI_bresp),
        .S00_AXI_bvalid(S00_AXI_bvalid),
        .S00_AXI_rdata(S00_AXI_rdata),
        .S00_AXI_rid(S00_AXI_rid),
        .S00_AXI_rlast(S00_AXI_rlast),
        .S00_AXI_rready(S00_AXI_rready),
        .S00_AXI_rresp(S00_AXI_rresp),
        .S00_AXI_rvalid(S00_AXI_rvalid),
        .S00_AXI_wdata(S00_AXI_wdata),
        .S00_AXI_wready(S00_AXI_wready),
        .S00_AXI_wstrb(S00_AXI_wstrb),
        .S00_AXI_wvalid(S00_AXI_wvalid));
endmodule

(* CHECK_LICENSE_TYPE = "dwa_ps_bd_rst_ps7_0_100M_1,proc_sys_reset,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "dwa_ps_bd_rst_ps7_0_100M_1" *) 
(* X_CORE_INFO = "proc_sys_reset,Vivado 2020.2" *) 
module dwa_ps_bd_dwa_ps_bd_rst_ps7_0_100M_1
   (slowest_sync_clk,
    ext_reset_in,
    aux_reset_in,
    mb_debug_sys_rst,
    dcm_locked,
    mb_reset,
    bus_struct_reset,
    peripheral_reset,
    interconnect_aresetn,
    peripheral_aresetn);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clock CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clock, ASSOCIATED_RESET mb_reset:bus_struct_reset:interconnect_aresetn:peripheral_aresetn:peripheral_reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input slowest_sync_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ext_reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME ext_reset, BOARD.ASSOCIATED_PARAM RESET_BOARD_INTERFACE, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ext_reset_in;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 aux_reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME aux_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aux_reset_in;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 dbg_reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME dbg_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input mb_debug_sys_rst;
  input dcm_locked;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 mb_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME mb_rst, POLARITY ACTIVE_HIGH, TYPE PROCESSOR, INSERT_VIP 0" *) output mb_reset;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 bus_struct_reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME bus_struct_reset, POLARITY ACTIVE_HIGH, TYPE INTERCONNECT, INSERT_VIP 0" *) output [0:0]bus_struct_reset;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 peripheral_high_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME peripheral_high_rst, POLARITY ACTIVE_HIGH, TYPE PERIPHERAL, INSERT_VIP 0" *) output [0:0]peripheral_reset;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 interconnect_low_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME interconnect_low_rst, POLARITY ACTIVE_LOW, TYPE INTERCONNECT, INSERT_VIP 0" *) output [0:0]interconnect_aresetn;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 peripheral_low_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME peripheral_low_rst, POLARITY ACTIVE_LOW, TYPE PERIPHERAL, INSERT_VIP 0" *) output [0:0]peripheral_aresetn;

  wire \<const0> ;
  wire ext_reset_in;
  wire [0:0]interconnect_aresetn;
  wire [0:0]peripheral_aresetn;
  wire slowest_sync_clk;
  wire NLW_U0_mb_reset_UNCONNECTED;
  wire [0:0]NLW_U0_bus_struct_reset_UNCONNECTED;
  wire [0:0]NLW_U0_peripheral_reset_UNCONNECTED;

  assign bus_struct_reset[0] = \<const0> ;
  assign mb_reset = \<const0> ;
  assign peripheral_reset[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_AUX_RESET_HIGH = "1'b0" *) 
  (* C_AUX_RST_WIDTH = "4" *) 
  (* C_EXT_RESET_HIGH = "1'b0" *) 
  (* C_EXT_RST_WIDTH = "4" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_NUM_BUS_RST = "1" *) 
  (* C_NUM_INTERCONNECT_ARESETN = "1" *) 
  (* C_NUM_PERP_ARESETN = "1" *) 
  (* C_NUM_PERP_RST = "1" *) 
  dwa_ps_bd_proc_sys_reset U0
       (.aux_reset_in(1'b1),
        .bus_struct_reset(NLW_U0_bus_struct_reset_UNCONNECTED[0]),
        .dcm_locked(1'b1),
        .ext_reset_in(ext_reset_in),
        .interconnect_aresetn(interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .mb_reset(NLW_U0_mb_reset_UNCONNECTED),
        .peripheral_aresetn(peripheral_aresetn),
        .peripheral_reset(NLW_U0_peripheral_reset_UNCONNECTED[0]),
        .slowest_sync_clk(slowest_sync_clk));
endmodule

(* ORIG_REF_NAME = "lpf" *) 
module dwa_ps_bd_lpf
   (lpf_int,
    slowest_sync_clk,
    ext_reset_in);
  output lpf_int;
  input slowest_sync_clk;
  input ext_reset_in;

  wire \ACTIVE_LOW_EXT.ACT_LO_EXT_n_0 ;
  wire Q;
  wire [0:0]exr_lpf;
  wire ext_reset_in;
  wire lpf_exr;
  wire lpf_int;
  wire lpf_int0;
  wire p_1_in4_in;
  wire p_2_in3_in;
  wire p_3_in6_in;
  wire slowest_sync_clk;

  dwa_ps_bd_cdc_sync \ACTIVE_LOW_EXT.ACT_LO_EXT 
       (.exr_lpf(exr_lpf),
        .ext_reset_in(ext_reset_in),
        .lpf_exr(lpf_exr),
        .lpf_exr_reg(\ACTIVE_LOW_EXT.ACT_LO_EXT_n_0 ),
        .p_1_in4_in(p_1_in4_in),
        .p_2_in3_in(p_2_in3_in),
        .scndry_out(p_3_in6_in),
        .slowest_sync_clk(slowest_sync_clk));
  FDRE #(
    .INIT(1'b0)) 
    \EXT_LPF[1].exr_lpf_reg[1] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_3_in6_in),
        .Q(p_2_in3_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \EXT_LPF[2].exr_lpf_reg[2] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_2_in3_in),
        .Q(p_1_in4_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \EXT_LPF[3].exr_lpf_reg[3] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_1_in4_in),
        .Q(exr_lpf),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "SRL16" *) 
  (* srl_name = "rst_ps7_0_100M/U0/\EXT_LPF/POR_SRL_I " *) 
  SRL16E #(
    .INIT(16'hFFFF)) 
    POR_SRL_I
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(slowest_sync_clk),
        .D(1'b0),
        .Q(Q));
  FDRE #(
    .INIT(1'b0)) 
    lpf_exr_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(\ACTIVE_LOW_EXT.ACT_LO_EXT_n_0 ),
        .Q(lpf_exr),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    lpf_int_i_1
       (.I0(lpf_exr),
        .I1(Q),
        .O(lpf_int0));
  FDRE #(
    .INIT(1'b0)) 
    lpf_int_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(lpf_int0),
        .Q(lpf_int),
        .R(1'b0));
endmodule

(* C_AUX_RESET_HIGH = "1'b0" *) (* C_AUX_RST_WIDTH = "4" *) (* C_EXT_RESET_HIGH = "1'b0" *) 
(* C_EXT_RST_WIDTH = "4" *) (* C_FAMILY = "zynq" *) (* C_NUM_BUS_RST = "1" *) 
(* C_NUM_INTERCONNECT_ARESETN = "1" *) (* C_NUM_PERP_ARESETN = "1" *) (* C_NUM_PERP_RST = "1" *) 
(* ORIG_REF_NAME = "proc_sys_reset" *) 
module dwa_ps_bd_proc_sys_reset
   (slowest_sync_clk,
    ext_reset_in,
    aux_reset_in,
    mb_debug_sys_rst,
    dcm_locked,
    mb_reset,
    bus_struct_reset,
    peripheral_reset,
    interconnect_aresetn,
    peripheral_aresetn);
  input slowest_sync_clk;
  input ext_reset_in;
  input aux_reset_in;
  input mb_debug_sys_rst;
  input dcm_locked;
  output mb_reset;
  output [0:0]bus_struct_reset;
  output [0:0]peripheral_reset;
  output [0:0]interconnect_aresetn;
  output [0:0]peripheral_aresetn;

  wire \<const0> ;
  wire SEQ_n_0;
  wire SEQ_n_1;
  wire ext_reset_in;
  wire [0:0]interconnect_aresetn;
  wire lpf_int;
  wire [0:0]peripheral_aresetn;
  wire slowest_sync_clk;

  assign bus_struct_reset[0] = \<const0> ;
  assign mb_reset = \<const0> ;
  assign peripheral_reset[0] = \<const0> ;
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \ACTIVE_LOW_BSR_OUT_DFF[0].FDRE_BSR_N 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(SEQ_n_0),
        .Q(interconnect_aresetn),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(SEQ_n_1),
        .Q(peripheral_aresetn),
        .R(1'b0));
  dwa_ps_bd_lpf EXT_LPF
       (.ext_reset_in(ext_reset_in),
        .lpf_int(lpf_int),
        .slowest_sync_clk(slowest_sync_clk));
  GND GND
       (.G(\<const0> ));
  dwa_ps_bd_sequence_psr SEQ
       (.bsr_reg_0(SEQ_n_0),
        .lpf_int(lpf_int),
        .pr_reg_0(SEQ_n_1),
        .slowest_sync_clk(slowest_sync_clk));
endmodule

(* C_DM_WIDTH = "4" *) (* C_DQS_WIDTH = "4" *) (* C_DQ_WIDTH = "32" *) 
(* C_EMIO_GPIO_WIDTH = "64" *) (* C_EN_EMIO_ENET0 = "0" *) (* C_EN_EMIO_ENET1 = "0" *) 
(* C_EN_EMIO_PJTAG = "0" *) (* C_EN_EMIO_TRACE = "0" *) (* C_FCLK_CLK0_BUF = "TRUE" *) 
(* C_FCLK_CLK1_BUF = "TRUE" *) (* C_FCLK_CLK2_BUF = "FALSE" *) (* C_FCLK_CLK3_BUF = "FALSE" *) 
(* C_GP0_EN_MODIFIABLE_TXN = "1" *) (* C_GP1_EN_MODIFIABLE_TXN = "1" *) (* C_INCLUDE_ACP_TRANS_CHECK = "0" *) 
(* C_INCLUDE_TRACE_BUFFER = "0" *) (* C_IRQ_F2P_MODE = "DIRECT" *) (* C_MIO_PRIMITIVE = "54" *) 
(* C_M_AXI_GP0_ENABLE_STATIC_REMAP = "0" *) (* C_M_AXI_GP0_ID_WIDTH = "12" *) (* C_M_AXI_GP0_THREAD_ID_WIDTH = "12" *) 
(* C_M_AXI_GP1_ENABLE_STATIC_REMAP = "0" *) (* C_M_AXI_GP1_ID_WIDTH = "12" *) (* C_M_AXI_GP1_THREAD_ID_WIDTH = "12" *) 
(* C_NUM_F2P_INTR_INPUTS = "1" *) (* C_PACKAGE_NAME = "clg400" *) (* C_PS7_SI_REV = "PRODUCTION" *) 
(* C_S_AXI_ACP_ARUSER_VAL = "31" *) (* C_S_AXI_ACP_AWUSER_VAL = "31" *) (* C_S_AXI_ACP_ID_WIDTH = "3" *) 
(* C_S_AXI_GP0_ID_WIDTH = "6" *) (* C_S_AXI_GP1_ID_WIDTH = "6" *) (* C_S_AXI_HP0_DATA_WIDTH = "64" *) 
(* C_S_AXI_HP0_ID_WIDTH = "6" *) (* C_S_AXI_HP1_DATA_WIDTH = "64" *) (* C_S_AXI_HP1_ID_WIDTH = "6" *) 
(* C_S_AXI_HP2_DATA_WIDTH = "64" *) (* C_S_AXI_HP2_ID_WIDTH = "6" *) (* C_S_AXI_HP3_DATA_WIDTH = "64" *) 
(* C_S_AXI_HP3_ID_WIDTH = "6" *) (* C_TRACE_BUFFER_CLOCK_DELAY = "12" *) (* C_TRACE_BUFFER_FIFO_SIZE = "128" *) 
(* C_TRACE_INTERNAL_WIDTH = "2" *) (* C_TRACE_PIPELINE_WIDTH = "8" *) (* C_USE_AXI_NONSECURE = "0" *) 
(* C_USE_DEFAULT_ACP_USER_VAL = "0" *) (* C_USE_M_AXI_GP0 = "1" *) (* C_USE_M_AXI_GP1 = "0" *) 
(* C_USE_S_AXI_ACP = "0" *) (* C_USE_S_AXI_GP0 = "0" *) (* C_USE_S_AXI_GP1 = "0" *) 
(* C_USE_S_AXI_HP0 = "0" *) (* C_USE_S_AXI_HP1 = "0" *) (* C_USE_S_AXI_HP2 = "0" *) 
(* C_USE_S_AXI_HP3 = "0" *) (* ORIG_REF_NAME = "processing_system7_v5_5_processing_system7" *) (* POWER = "<PROCESSOR name={system} numA9Cores={2} clockFreq={667} load={0.5} /><MEMORY name={code} memType={DDR3} dataWidth={32} clockFreq={533.333333} readRate={0.5} writeRate={0.5} /><IO interface={GPIO_Bank_1} ioStandard={LVCMOS18} bidis={2} ioBank={Vcco_p1} clockFreq={1} usageRate={0.5} /><IO interface={GPIO_Bank_0} ioStandard={LVCMOS33} bidis={9} ioBank={Vcco_p0} clockFreq={1} usageRate={0.5} /><IO interface={Timer} ioStandard={} bidis={0} ioBank={} clockFreq={111.111115} usageRate={0.5} /><IO interface={UART} ioStandard={LVCMOS18} bidis={2} ioBank={Vcco_p1} clockFreq={50.000000} usageRate={0.5} /><IO interface={SD} ioStandard={LVCMOS18} bidis={8} ioBank={Vcco_p1} clockFreq={25.000000} usageRate={0.5} /><IO interface={USB} ioStandard={LVCMOS18} bidis={12} ioBank={Vcco_p1} clockFreq={60} usageRate={0.5} /><IO interface={GigE} ioStandard={LVCMOS18} bidis={14} ioBank={Vcco_p1} clockFreq={125.000000} usageRate={0.5} /><IO interface={QSPI} ioStandard={LVCMOS33} bidis={7} ioBank={Vcco_p0} clockFreq={200} usageRate={0.5} /><PLL domain={Processor} vco={1333.333} /><PLL domain={Memory} vco={1066.667} /><PLL domain={IO} vco={1000.000} /><AXI interface={M_AXI_GP0} dataWidth={32} clockFreq={100} usageRate={0.5} />/>" *) 
(* USE_TRACE_DATA_EDGE_DETECTOR = "0" *) (* hw_handoff = "dwa_ps_bd_processing_system7_0_0.hwdef" *) 
module dwa_ps_bd_processing_system7_v5_5_processing_system7
   (CAN0_PHY_TX,
    CAN0_PHY_RX,
    CAN1_PHY_TX,
    CAN1_PHY_RX,
    ENET0_GMII_TX_EN,
    ENET0_GMII_TX_ER,
    ENET0_MDIO_MDC,
    ENET0_MDIO_O,
    ENET0_MDIO_T,
    ENET0_PTP_DELAY_REQ_RX,
    ENET0_PTP_DELAY_REQ_TX,
    ENET0_PTP_PDELAY_REQ_RX,
    ENET0_PTP_PDELAY_REQ_TX,
    ENET0_PTP_PDELAY_RESP_RX,
    ENET0_PTP_PDELAY_RESP_TX,
    ENET0_PTP_SYNC_FRAME_RX,
    ENET0_PTP_SYNC_FRAME_TX,
    ENET0_SOF_RX,
    ENET0_SOF_TX,
    ENET0_GMII_TXD,
    ENET0_GMII_COL,
    ENET0_GMII_CRS,
    ENET0_GMII_RX_CLK,
    ENET0_GMII_RX_DV,
    ENET0_GMII_RX_ER,
    ENET0_GMII_TX_CLK,
    ENET0_MDIO_I,
    ENET0_EXT_INTIN,
    ENET0_GMII_RXD,
    ENET1_GMII_TX_EN,
    ENET1_GMII_TX_ER,
    ENET1_MDIO_MDC,
    ENET1_MDIO_O,
    ENET1_MDIO_T,
    ENET1_PTP_DELAY_REQ_RX,
    ENET1_PTP_DELAY_REQ_TX,
    ENET1_PTP_PDELAY_REQ_RX,
    ENET1_PTP_PDELAY_REQ_TX,
    ENET1_PTP_PDELAY_RESP_RX,
    ENET1_PTP_PDELAY_RESP_TX,
    ENET1_PTP_SYNC_FRAME_RX,
    ENET1_PTP_SYNC_FRAME_TX,
    ENET1_SOF_RX,
    ENET1_SOF_TX,
    ENET1_GMII_TXD,
    ENET1_GMII_COL,
    ENET1_GMII_CRS,
    ENET1_GMII_RX_CLK,
    ENET1_GMII_RX_DV,
    ENET1_GMII_RX_ER,
    ENET1_GMII_TX_CLK,
    ENET1_MDIO_I,
    ENET1_EXT_INTIN,
    ENET1_GMII_RXD,
    GPIO_I,
    GPIO_O,
    GPIO_T,
    I2C0_SDA_I,
    I2C0_SDA_O,
    I2C0_SDA_T,
    I2C0_SCL_I,
    I2C0_SCL_O,
    I2C0_SCL_T,
    I2C1_SDA_I,
    I2C1_SDA_O,
    I2C1_SDA_T,
    I2C1_SCL_I,
    I2C1_SCL_O,
    I2C1_SCL_T,
    PJTAG_TCK,
    PJTAG_TMS,
    PJTAG_TDI,
    PJTAG_TDO,
    SDIO0_CLK,
    SDIO0_CLK_FB,
    SDIO0_CMD_O,
    SDIO0_CMD_I,
    SDIO0_CMD_T,
    SDIO0_DATA_I,
    SDIO0_DATA_O,
    SDIO0_DATA_T,
    SDIO0_LED,
    SDIO0_CDN,
    SDIO0_WP,
    SDIO0_BUSPOW,
    SDIO0_BUSVOLT,
    SDIO1_CLK,
    SDIO1_CLK_FB,
    SDIO1_CMD_O,
    SDIO1_CMD_I,
    SDIO1_CMD_T,
    SDIO1_DATA_I,
    SDIO1_DATA_O,
    SDIO1_DATA_T,
    SDIO1_LED,
    SDIO1_CDN,
    SDIO1_WP,
    SDIO1_BUSPOW,
    SDIO1_BUSVOLT,
    SPI0_SCLK_I,
    SPI0_SCLK_O,
    SPI0_SCLK_T,
    SPI0_MOSI_I,
    SPI0_MOSI_O,
    SPI0_MOSI_T,
    SPI0_MISO_I,
    SPI0_MISO_O,
    SPI0_MISO_T,
    SPI0_SS_I,
    SPI0_SS_O,
    SPI0_SS1_O,
    SPI0_SS2_O,
    SPI0_SS_T,
    SPI1_SCLK_I,
    SPI1_SCLK_O,
    SPI1_SCLK_T,
    SPI1_MOSI_I,
    SPI1_MOSI_O,
    SPI1_MOSI_T,
    SPI1_MISO_I,
    SPI1_MISO_O,
    SPI1_MISO_T,
    SPI1_SS_I,
    SPI1_SS_O,
    SPI1_SS1_O,
    SPI1_SS2_O,
    SPI1_SS_T,
    UART0_DTRN,
    UART0_RTSN,
    UART0_TX,
    UART0_CTSN,
    UART0_DCDN,
    UART0_DSRN,
    UART0_RIN,
    UART0_RX,
    UART1_DTRN,
    UART1_RTSN,
    UART1_TX,
    UART1_CTSN,
    UART1_DCDN,
    UART1_DSRN,
    UART1_RIN,
    UART1_RX,
    TTC0_WAVE0_OUT,
    TTC0_WAVE1_OUT,
    TTC0_WAVE2_OUT,
    TTC0_CLK0_IN,
    TTC0_CLK1_IN,
    TTC0_CLK2_IN,
    TTC1_WAVE0_OUT,
    TTC1_WAVE1_OUT,
    TTC1_WAVE2_OUT,
    TTC1_CLK0_IN,
    TTC1_CLK1_IN,
    TTC1_CLK2_IN,
    WDT_CLK_IN,
    WDT_RST_OUT,
    TRACE_CLK,
    TRACE_CTL,
    TRACE_DATA,
    TRACE_CLK_OUT,
    USB0_PORT_INDCTL,
    USB0_VBUS_PWRSELECT,
    USB0_VBUS_PWRFAULT,
    USB1_PORT_INDCTL,
    USB1_VBUS_PWRSELECT,
    USB1_VBUS_PWRFAULT,
    SRAM_INTIN,
    M_AXI_GP0_ARESETN,
    M_AXI_GP0_ARVALID,
    M_AXI_GP0_AWVALID,
    M_AXI_GP0_BREADY,
    M_AXI_GP0_RREADY,
    M_AXI_GP0_WLAST,
    M_AXI_GP0_WVALID,
    M_AXI_GP0_ARID,
    M_AXI_GP0_AWID,
    M_AXI_GP0_WID,
    M_AXI_GP0_ARBURST,
    M_AXI_GP0_ARLOCK,
    M_AXI_GP0_ARSIZE,
    M_AXI_GP0_AWBURST,
    M_AXI_GP0_AWLOCK,
    M_AXI_GP0_AWSIZE,
    M_AXI_GP0_ARPROT,
    M_AXI_GP0_AWPROT,
    M_AXI_GP0_ARADDR,
    M_AXI_GP0_AWADDR,
    M_AXI_GP0_WDATA,
    M_AXI_GP0_ARCACHE,
    M_AXI_GP0_ARLEN,
    M_AXI_GP0_ARQOS,
    M_AXI_GP0_AWCACHE,
    M_AXI_GP0_AWLEN,
    M_AXI_GP0_AWQOS,
    M_AXI_GP0_WSTRB,
    M_AXI_GP0_ACLK,
    M_AXI_GP0_ARREADY,
    M_AXI_GP0_AWREADY,
    M_AXI_GP0_BVALID,
    M_AXI_GP0_RLAST,
    M_AXI_GP0_RVALID,
    M_AXI_GP0_WREADY,
    M_AXI_GP0_BID,
    M_AXI_GP0_RID,
    M_AXI_GP0_BRESP,
    M_AXI_GP0_RRESP,
    M_AXI_GP0_RDATA,
    M_AXI_GP1_ARESETN,
    M_AXI_GP1_ARVALID,
    M_AXI_GP1_AWVALID,
    M_AXI_GP1_BREADY,
    M_AXI_GP1_RREADY,
    M_AXI_GP1_WLAST,
    M_AXI_GP1_WVALID,
    M_AXI_GP1_ARID,
    M_AXI_GP1_AWID,
    M_AXI_GP1_WID,
    M_AXI_GP1_ARBURST,
    M_AXI_GP1_ARLOCK,
    M_AXI_GP1_ARSIZE,
    M_AXI_GP1_AWBURST,
    M_AXI_GP1_AWLOCK,
    M_AXI_GP1_AWSIZE,
    M_AXI_GP1_ARPROT,
    M_AXI_GP1_AWPROT,
    M_AXI_GP1_ARADDR,
    M_AXI_GP1_AWADDR,
    M_AXI_GP1_WDATA,
    M_AXI_GP1_ARCACHE,
    M_AXI_GP1_ARLEN,
    M_AXI_GP1_ARQOS,
    M_AXI_GP1_AWCACHE,
    M_AXI_GP1_AWLEN,
    M_AXI_GP1_AWQOS,
    M_AXI_GP1_WSTRB,
    M_AXI_GP1_ACLK,
    M_AXI_GP1_ARREADY,
    M_AXI_GP1_AWREADY,
    M_AXI_GP1_BVALID,
    M_AXI_GP1_RLAST,
    M_AXI_GP1_RVALID,
    M_AXI_GP1_WREADY,
    M_AXI_GP1_BID,
    M_AXI_GP1_RID,
    M_AXI_GP1_BRESP,
    M_AXI_GP1_RRESP,
    M_AXI_GP1_RDATA,
    S_AXI_GP0_ARESETN,
    S_AXI_GP0_ARREADY,
    S_AXI_GP0_AWREADY,
    S_AXI_GP0_BVALID,
    S_AXI_GP0_RLAST,
    S_AXI_GP0_RVALID,
    S_AXI_GP0_WREADY,
    S_AXI_GP0_BRESP,
    S_AXI_GP0_RRESP,
    S_AXI_GP0_RDATA,
    S_AXI_GP0_BID,
    S_AXI_GP0_RID,
    S_AXI_GP0_ACLK,
    S_AXI_GP0_ARVALID,
    S_AXI_GP0_AWVALID,
    S_AXI_GP0_BREADY,
    S_AXI_GP0_RREADY,
    S_AXI_GP0_WLAST,
    S_AXI_GP0_WVALID,
    S_AXI_GP0_ARBURST,
    S_AXI_GP0_ARLOCK,
    S_AXI_GP0_ARSIZE,
    S_AXI_GP0_AWBURST,
    S_AXI_GP0_AWLOCK,
    S_AXI_GP0_AWSIZE,
    S_AXI_GP0_ARPROT,
    S_AXI_GP0_AWPROT,
    S_AXI_GP0_ARADDR,
    S_AXI_GP0_AWADDR,
    S_AXI_GP0_WDATA,
    S_AXI_GP0_ARCACHE,
    S_AXI_GP0_ARLEN,
    S_AXI_GP0_ARQOS,
    S_AXI_GP0_AWCACHE,
    S_AXI_GP0_AWLEN,
    S_AXI_GP0_AWQOS,
    S_AXI_GP0_WSTRB,
    S_AXI_GP0_ARID,
    S_AXI_GP0_AWID,
    S_AXI_GP0_WID,
    S_AXI_GP1_ARESETN,
    S_AXI_GP1_ARREADY,
    S_AXI_GP1_AWREADY,
    S_AXI_GP1_BVALID,
    S_AXI_GP1_RLAST,
    S_AXI_GP1_RVALID,
    S_AXI_GP1_WREADY,
    S_AXI_GP1_BRESP,
    S_AXI_GP1_RRESP,
    S_AXI_GP1_RDATA,
    S_AXI_GP1_BID,
    S_AXI_GP1_RID,
    S_AXI_GP1_ACLK,
    S_AXI_GP1_ARVALID,
    S_AXI_GP1_AWVALID,
    S_AXI_GP1_BREADY,
    S_AXI_GP1_RREADY,
    S_AXI_GP1_WLAST,
    S_AXI_GP1_WVALID,
    S_AXI_GP1_ARBURST,
    S_AXI_GP1_ARLOCK,
    S_AXI_GP1_ARSIZE,
    S_AXI_GP1_AWBURST,
    S_AXI_GP1_AWLOCK,
    S_AXI_GP1_AWSIZE,
    S_AXI_GP1_ARPROT,
    S_AXI_GP1_AWPROT,
    S_AXI_GP1_ARADDR,
    S_AXI_GP1_AWADDR,
    S_AXI_GP1_WDATA,
    S_AXI_GP1_ARCACHE,
    S_AXI_GP1_ARLEN,
    S_AXI_GP1_ARQOS,
    S_AXI_GP1_AWCACHE,
    S_AXI_GP1_AWLEN,
    S_AXI_GP1_AWQOS,
    S_AXI_GP1_WSTRB,
    S_AXI_GP1_ARID,
    S_AXI_GP1_AWID,
    S_AXI_GP1_WID,
    S_AXI_ACP_ARESETN,
    S_AXI_ACP_ARREADY,
    S_AXI_ACP_AWREADY,
    S_AXI_ACP_BVALID,
    S_AXI_ACP_RLAST,
    S_AXI_ACP_RVALID,
    S_AXI_ACP_WREADY,
    S_AXI_ACP_BRESP,
    S_AXI_ACP_RRESP,
    S_AXI_ACP_BID,
    S_AXI_ACP_RID,
    S_AXI_ACP_RDATA,
    S_AXI_ACP_ACLK,
    S_AXI_ACP_ARVALID,
    S_AXI_ACP_AWVALID,
    S_AXI_ACP_BREADY,
    S_AXI_ACP_RREADY,
    S_AXI_ACP_WLAST,
    S_AXI_ACP_WVALID,
    S_AXI_ACP_ARID,
    S_AXI_ACP_ARPROT,
    S_AXI_ACP_AWID,
    S_AXI_ACP_AWPROT,
    S_AXI_ACP_WID,
    S_AXI_ACP_ARADDR,
    S_AXI_ACP_AWADDR,
    S_AXI_ACP_ARCACHE,
    S_AXI_ACP_ARLEN,
    S_AXI_ACP_ARQOS,
    S_AXI_ACP_AWCACHE,
    S_AXI_ACP_AWLEN,
    S_AXI_ACP_AWQOS,
    S_AXI_ACP_ARBURST,
    S_AXI_ACP_ARLOCK,
    S_AXI_ACP_ARSIZE,
    S_AXI_ACP_AWBURST,
    S_AXI_ACP_AWLOCK,
    S_AXI_ACP_AWSIZE,
    S_AXI_ACP_ARUSER,
    S_AXI_ACP_AWUSER,
    S_AXI_ACP_WDATA,
    S_AXI_ACP_WSTRB,
    S_AXI_HP0_ARESETN,
    S_AXI_HP0_ARREADY,
    S_AXI_HP0_AWREADY,
    S_AXI_HP0_BVALID,
    S_AXI_HP0_RLAST,
    S_AXI_HP0_RVALID,
    S_AXI_HP0_WREADY,
    S_AXI_HP0_BRESP,
    S_AXI_HP0_RRESP,
    S_AXI_HP0_BID,
    S_AXI_HP0_RID,
    S_AXI_HP0_RDATA,
    S_AXI_HP0_RCOUNT,
    S_AXI_HP0_WCOUNT,
    S_AXI_HP0_RACOUNT,
    S_AXI_HP0_WACOUNT,
    S_AXI_HP0_ACLK,
    S_AXI_HP0_ARVALID,
    S_AXI_HP0_AWVALID,
    S_AXI_HP0_BREADY,
    S_AXI_HP0_RDISSUECAP1_EN,
    S_AXI_HP0_RREADY,
    S_AXI_HP0_WLAST,
    S_AXI_HP0_WRISSUECAP1_EN,
    S_AXI_HP0_WVALID,
    S_AXI_HP0_ARBURST,
    S_AXI_HP0_ARLOCK,
    S_AXI_HP0_ARSIZE,
    S_AXI_HP0_AWBURST,
    S_AXI_HP0_AWLOCK,
    S_AXI_HP0_AWSIZE,
    S_AXI_HP0_ARPROT,
    S_AXI_HP0_AWPROT,
    S_AXI_HP0_ARADDR,
    S_AXI_HP0_AWADDR,
    S_AXI_HP0_ARCACHE,
    S_AXI_HP0_ARLEN,
    S_AXI_HP0_ARQOS,
    S_AXI_HP0_AWCACHE,
    S_AXI_HP0_AWLEN,
    S_AXI_HP0_AWQOS,
    S_AXI_HP0_ARID,
    S_AXI_HP0_AWID,
    S_AXI_HP0_WID,
    S_AXI_HP0_WDATA,
    S_AXI_HP0_WSTRB,
    S_AXI_HP1_ARESETN,
    S_AXI_HP1_ARREADY,
    S_AXI_HP1_AWREADY,
    S_AXI_HP1_BVALID,
    S_AXI_HP1_RLAST,
    S_AXI_HP1_RVALID,
    S_AXI_HP1_WREADY,
    S_AXI_HP1_BRESP,
    S_AXI_HP1_RRESP,
    S_AXI_HP1_BID,
    S_AXI_HP1_RID,
    S_AXI_HP1_RDATA,
    S_AXI_HP1_RCOUNT,
    S_AXI_HP1_WCOUNT,
    S_AXI_HP1_RACOUNT,
    S_AXI_HP1_WACOUNT,
    S_AXI_HP1_ACLK,
    S_AXI_HP1_ARVALID,
    S_AXI_HP1_AWVALID,
    S_AXI_HP1_BREADY,
    S_AXI_HP1_RDISSUECAP1_EN,
    S_AXI_HP1_RREADY,
    S_AXI_HP1_WLAST,
    S_AXI_HP1_WRISSUECAP1_EN,
    S_AXI_HP1_WVALID,
    S_AXI_HP1_ARBURST,
    S_AXI_HP1_ARLOCK,
    S_AXI_HP1_ARSIZE,
    S_AXI_HP1_AWBURST,
    S_AXI_HP1_AWLOCK,
    S_AXI_HP1_AWSIZE,
    S_AXI_HP1_ARPROT,
    S_AXI_HP1_AWPROT,
    S_AXI_HP1_ARADDR,
    S_AXI_HP1_AWADDR,
    S_AXI_HP1_ARCACHE,
    S_AXI_HP1_ARLEN,
    S_AXI_HP1_ARQOS,
    S_AXI_HP1_AWCACHE,
    S_AXI_HP1_AWLEN,
    S_AXI_HP1_AWQOS,
    S_AXI_HP1_ARID,
    S_AXI_HP1_AWID,
    S_AXI_HP1_WID,
    S_AXI_HP1_WDATA,
    S_AXI_HP1_WSTRB,
    S_AXI_HP2_ARESETN,
    S_AXI_HP2_ARREADY,
    S_AXI_HP2_AWREADY,
    S_AXI_HP2_BVALID,
    S_AXI_HP2_RLAST,
    S_AXI_HP2_RVALID,
    S_AXI_HP2_WREADY,
    S_AXI_HP2_BRESP,
    S_AXI_HP2_RRESP,
    S_AXI_HP2_BID,
    S_AXI_HP2_RID,
    S_AXI_HP2_RDATA,
    S_AXI_HP2_RCOUNT,
    S_AXI_HP2_WCOUNT,
    S_AXI_HP2_RACOUNT,
    S_AXI_HP2_WACOUNT,
    S_AXI_HP2_ACLK,
    S_AXI_HP2_ARVALID,
    S_AXI_HP2_AWVALID,
    S_AXI_HP2_BREADY,
    S_AXI_HP2_RDISSUECAP1_EN,
    S_AXI_HP2_RREADY,
    S_AXI_HP2_WLAST,
    S_AXI_HP2_WRISSUECAP1_EN,
    S_AXI_HP2_WVALID,
    S_AXI_HP2_ARBURST,
    S_AXI_HP2_ARLOCK,
    S_AXI_HP2_ARSIZE,
    S_AXI_HP2_AWBURST,
    S_AXI_HP2_AWLOCK,
    S_AXI_HP2_AWSIZE,
    S_AXI_HP2_ARPROT,
    S_AXI_HP2_AWPROT,
    S_AXI_HP2_ARADDR,
    S_AXI_HP2_AWADDR,
    S_AXI_HP2_ARCACHE,
    S_AXI_HP2_ARLEN,
    S_AXI_HP2_ARQOS,
    S_AXI_HP2_AWCACHE,
    S_AXI_HP2_AWLEN,
    S_AXI_HP2_AWQOS,
    S_AXI_HP2_ARID,
    S_AXI_HP2_AWID,
    S_AXI_HP2_WID,
    S_AXI_HP2_WDATA,
    S_AXI_HP2_WSTRB,
    S_AXI_HP3_ARESETN,
    S_AXI_HP3_ARREADY,
    S_AXI_HP3_AWREADY,
    S_AXI_HP3_BVALID,
    S_AXI_HP3_RLAST,
    S_AXI_HP3_RVALID,
    S_AXI_HP3_WREADY,
    S_AXI_HP3_BRESP,
    S_AXI_HP3_RRESP,
    S_AXI_HP3_BID,
    S_AXI_HP3_RID,
    S_AXI_HP3_RDATA,
    S_AXI_HP3_RCOUNT,
    S_AXI_HP3_WCOUNT,
    S_AXI_HP3_RACOUNT,
    S_AXI_HP3_WACOUNT,
    S_AXI_HP3_ACLK,
    S_AXI_HP3_ARVALID,
    S_AXI_HP3_AWVALID,
    S_AXI_HP3_BREADY,
    S_AXI_HP3_RDISSUECAP1_EN,
    S_AXI_HP3_RREADY,
    S_AXI_HP3_WLAST,
    S_AXI_HP3_WRISSUECAP1_EN,
    S_AXI_HP3_WVALID,
    S_AXI_HP3_ARBURST,
    S_AXI_HP3_ARLOCK,
    S_AXI_HP3_ARSIZE,
    S_AXI_HP3_AWBURST,
    S_AXI_HP3_AWLOCK,
    S_AXI_HP3_AWSIZE,
    S_AXI_HP3_ARPROT,
    S_AXI_HP3_AWPROT,
    S_AXI_HP3_ARADDR,
    S_AXI_HP3_AWADDR,
    S_AXI_HP3_ARCACHE,
    S_AXI_HP3_ARLEN,
    S_AXI_HP3_ARQOS,
    S_AXI_HP3_AWCACHE,
    S_AXI_HP3_AWLEN,
    S_AXI_HP3_AWQOS,
    S_AXI_HP3_ARID,
    S_AXI_HP3_AWID,
    S_AXI_HP3_WID,
    S_AXI_HP3_WDATA,
    S_AXI_HP3_WSTRB,
    IRQ_P2F_DMAC_ABORT,
    IRQ_P2F_DMAC0,
    IRQ_P2F_DMAC1,
    IRQ_P2F_DMAC2,
    IRQ_P2F_DMAC3,
    IRQ_P2F_DMAC4,
    IRQ_P2F_DMAC5,
    IRQ_P2F_DMAC6,
    IRQ_P2F_DMAC7,
    IRQ_P2F_SMC,
    IRQ_P2F_QSPI,
    IRQ_P2F_CTI,
    IRQ_P2F_GPIO,
    IRQ_P2F_USB0,
    IRQ_P2F_ENET0,
    IRQ_P2F_ENET_WAKE0,
    IRQ_P2F_SDIO0,
    IRQ_P2F_I2C0,
    IRQ_P2F_SPI0,
    IRQ_P2F_UART0,
    IRQ_P2F_CAN0,
    IRQ_P2F_USB1,
    IRQ_P2F_ENET1,
    IRQ_P2F_ENET_WAKE1,
    IRQ_P2F_SDIO1,
    IRQ_P2F_I2C1,
    IRQ_P2F_SPI1,
    IRQ_P2F_UART1,
    IRQ_P2F_CAN1,
    IRQ_F2P,
    Core0_nFIQ,
    Core0_nIRQ,
    Core1_nFIQ,
    Core1_nIRQ,
    DMA0_DATYPE,
    DMA0_DAVALID,
    DMA0_DRREADY,
    DMA0_RSTN,
    DMA1_DATYPE,
    DMA1_DAVALID,
    DMA1_DRREADY,
    DMA1_RSTN,
    DMA2_DATYPE,
    DMA2_DAVALID,
    DMA2_DRREADY,
    DMA2_RSTN,
    DMA3_DATYPE,
    DMA3_DAVALID,
    DMA3_DRREADY,
    DMA3_RSTN,
    DMA0_ACLK,
    DMA0_DAREADY,
    DMA0_DRLAST,
    DMA0_DRVALID,
    DMA1_ACLK,
    DMA1_DAREADY,
    DMA1_DRLAST,
    DMA1_DRVALID,
    DMA2_ACLK,
    DMA2_DAREADY,
    DMA2_DRLAST,
    DMA2_DRVALID,
    DMA3_ACLK,
    DMA3_DAREADY,
    DMA3_DRLAST,
    DMA3_DRVALID,
    DMA0_DRTYPE,
    DMA1_DRTYPE,
    DMA2_DRTYPE,
    DMA3_DRTYPE,
    FCLK_CLK3,
    FCLK_CLK2,
    FCLK_CLK1,
    FCLK_CLK0,
    FCLK_CLKTRIG3_N,
    FCLK_CLKTRIG2_N,
    FCLK_CLKTRIG1_N,
    FCLK_CLKTRIG0_N,
    FCLK_RESET3_N,
    FCLK_RESET2_N,
    FCLK_RESET1_N,
    FCLK_RESET0_N,
    FTMD_TRACEIN_DATA,
    FTMD_TRACEIN_VALID,
    FTMD_TRACEIN_CLK,
    FTMD_TRACEIN_ATID,
    FTMT_F2P_TRIG_0,
    FTMT_F2P_TRIGACK_0,
    FTMT_F2P_TRIG_1,
    FTMT_F2P_TRIGACK_1,
    FTMT_F2P_TRIG_2,
    FTMT_F2P_TRIGACK_2,
    FTMT_F2P_TRIG_3,
    FTMT_F2P_TRIGACK_3,
    FTMT_F2P_DEBUG,
    FTMT_P2F_TRIGACK_0,
    FTMT_P2F_TRIG_0,
    FTMT_P2F_TRIGACK_1,
    FTMT_P2F_TRIG_1,
    FTMT_P2F_TRIGACK_2,
    FTMT_P2F_TRIG_2,
    FTMT_P2F_TRIGACK_3,
    FTMT_P2F_TRIG_3,
    FTMT_P2F_DEBUG,
    FPGA_IDLE_N,
    EVENT_EVENTO,
    EVENT_STANDBYWFE,
    EVENT_STANDBYWFI,
    EVENT_EVENTI,
    DDR_ARB,
    MIO,
    DDR_CAS_n,
    DDR_CKE,
    DDR_Clk_n,
    DDR_Clk,
    DDR_CS_n,
    DDR_DRSTB,
    DDR_ODT,
    DDR_RAS_n,
    DDR_WEB,
    DDR_BankAddr,
    DDR_Addr,
    DDR_VRN,
    DDR_VRP,
    DDR_DM,
    DDR_DQ,
    DDR_DQS_n,
    DDR_DQS,
    PS_SRSTB,
    PS_CLK,
    PS_PORB);
  output CAN0_PHY_TX;
  input CAN0_PHY_RX;
  output CAN1_PHY_TX;
  input CAN1_PHY_RX;
  output ENET0_GMII_TX_EN;
  output ENET0_GMII_TX_ER;
  output ENET0_MDIO_MDC;
  output ENET0_MDIO_O;
  output ENET0_MDIO_T;
  output ENET0_PTP_DELAY_REQ_RX;
  output ENET0_PTP_DELAY_REQ_TX;
  output ENET0_PTP_PDELAY_REQ_RX;
  output ENET0_PTP_PDELAY_REQ_TX;
  output ENET0_PTP_PDELAY_RESP_RX;
  output ENET0_PTP_PDELAY_RESP_TX;
  output ENET0_PTP_SYNC_FRAME_RX;
  output ENET0_PTP_SYNC_FRAME_TX;
  output ENET0_SOF_RX;
  output ENET0_SOF_TX;
  output [7:0]ENET0_GMII_TXD;
  input ENET0_GMII_COL;
  input ENET0_GMII_CRS;
  input ENET0_GMII_RX_CLK;
  input ENET0_GMII_RX_DV;
  input ENET0_GMII_RX_ER;
  input ENET0_GMII_TX_CLK;
  input ENET0_MDIO_I;
  input ENET0_EXT_INTIN;
  input [7:0]ENET0_GMII_RXD;
  output ENET1_GMII_TX_EN;
  output ENET1_GMII_TX_ER;
  output ENET1_MDIO_MDC;
  output ENET1_MDIO_O;
  output ENET1_MDIO_T;
  output ENET1_PTP_DELAY_REQ_RX;
  output ENET1_PTP_DELAY_REQ_TX;
  output ENET1_PTP_PDELAY_REQ_RX;
  output ENET1_PTP_PDELAY_REQ_TX;
  output ENET1_PTP_PDELAY_RESP_RX;
  output ENET1_PTP_PDELAY_RESP_TX;
  output ENET1_PTP_SYNC_FRAME_RX;
  output ENET1_PTP_SYNC_FRAME_TX;
  output ENET1_SOF_RX;
  output ENET1_SOF_TX;
  output [7:0]ENET1_GMII_TXD;
  input ENET1_GMII_COL;
  input ENET1_GMII_CRS;
  input ENET1_GMII_RX_CLK;
  input ENET1_GMII_RX_DV;
  input ENET1_GMII_RX_ER;
  input ENET1_GMII_TX_CLK;
  input ENET1_MDIO_I;
  input ENET1_EXT_INTIN;
  input [7:0]ENET1_GMII_RXD;
  input [63:0]GPIO_I;
  output [63:0]GPIO_O;
  output [63:0]GPIO_T;
  input I2C0_SDA_I;
  output I2C0_SDA_O;
  output I2C0_SDA_T;
  input I2C0_SCL_I;
  output I2C0_SCL_O;
  output I2C0_SCL_T;
  input I2C1_SDA_I;
  output I2C1_SDA_O;
  output I2C1_SDA_T;
  input I2C1_SCL_I;
  output I2C1_SCL_O;
  output I2C1_SCL_T;
  input PJTAG_TCK;
  input PJTAG_TMS;
  input PJTAG_TDI;
  output PJTAG_TDO;
  output SDIO0_CLK;
  input SDIO0_CLK_FB;
  output SDIO0_CMD_O;
  input SDIO0_CMD_I;
  output SDIO0_CMD_T;
  input [3:0]SDIO0_DATA_I;
  output [3:0]SDIO0_DATA_O;
  output [3:0]SDIO0_DATA_T;
  output SDIO0_LED;
  input SDIO0_CDN;
  input SDIO0_WP;
  output SDIO0_BUSPOW;
  output [2:0]SDIO0_BUSVOLT;
  output SDIO1_CLK;
  input SDIO1_CLK_FB;
  output SDIO1_CMD_O;
  input SDIO1_CMD_I;
  output SDIO1_CMD_T;
  input [3:0]SDIO1_DATA_I;
  output [3:0]SDIO1_DATA_O;
  output [3:0]SDIO1_DATA_T;
  output SDIO1_LED;
  input SDIO1_CDN;
  input SDIO1_WP;
  output SDIO1_BUSPOW;
  output [2:0]SDIO1_BUSVOLT;
  input SPI0_SCLK_I;
  output SPI0_SCLK_O;
  output SPI0_SCLK_T;
  input SPI0_MOSI_I;
  output SPI0_MOSI_O;
  output SPI0_MOSI_T;
  input SPI0_MISO_I;
  output SPI0_MISO_O;
  output SPI0_MISO_T;
  input SPI0_SS_I;
  output SPI0_SS_O;
  output SPI0_SS1_O;
  output SPI0_SS2_O;
  output SPI0_SS_T;
  input SPI1_SCLK_I;
  output SPI1_SCLK_O;
  output SPI1_SCLK_T;
  input SPI1_MOSI_I;
  output SPI1_MOSI_O;
  output SPI1_MOSI_T;
  input SPI1_MISO_I;
  output SPI1_MISO_O;
  output SPI1_MISO_T;
  input SPI1_SS_I;
  output SPI1_SS_O;
  output SPI1_SS1_O;
  output SPI1_SS2_O;
  output SPI1_SS_T;
  output UART0_DTRN;
  output UART0_RTSN;
  output UART0_TX;
  input UART0_CTSN;
  input UART0_DCDN;
  input UART0_DSRN;
  input UART0_RIN;
  input UART0_RX;
  output UART1_DTRN;
  output UART1_RTSN;
  output UART1_TX;
  input UART1_CTSN;
  input UART1_DCDN;
  input UART1_DSRN;
  input UART1_RIN;
  input UART1_RX;
  output TTC0_WAVE0_OUT;
  output TTC0_WAVE1_OUT;
  output TTC0_WAVE2_OUT;
  input TTC0_CLK0_IN;
  input TTC0_CLK1_IN;
  input TTC0_CLK2_IN;
  output TTC1_WAVE0_OUT;
  output TTC1_WAVE1_OUT;
  output TTC1_WAVE2_OUT;
  input TTC1_CLK0_IN;
  input TTC1_CLK1_IN;
  input TTC1_CLK2_IN;
  input WDT_CLK_IN;
  output WDT_RST_OUT;
  input TRACE_CLK;
  output TRACE_CTL;
  output [1:0]TRACE_DATA;
  output TRACE_CLK_OUT;
  output [1:0]USB0_PORT_INDCTL;
  output USB0_VBUS_PWRSELECT;
  input USB0_VBUS_PWRFAULT;
  output [1:0]USB1_PORT_INDCTL;
  output USB1_VBUS_PWRSELECT;
  input USB1_VBUS_PWRFAULT;
  input SRAM_INTIN;
  output M_AXI_GP0_ARESETN;
  output M_AXI_GP0_ARVALID;
  output M_AXI_GP0_AWVALID;
  output M_AXI_GP0_BREADY;
  output M_AXI_GP0_RREADY;
  output M_AXI_GP0_WLAST;
  output M_AXI_GP0_WVALID;
  output [11:0]M_AXI_GP0_ARID;
  output [11:0]M_AXI_GP0_AWID;
  output [11:0]M_AXI_GP0_WID;
  output [1:0]M_AXI_GP0_ARBURST;
  output [1:0]M_AXI_GP0_ARLOCK;
  output [2:0]M_AXI_GP0_ARSIZE;
  output [1:0]M_AXI_GP0_AWBURST;
  output [1:0]M_AXI_GP0_AWLOCK;
  output [2:0]M_AXI_GP0_AWSIZE;
  output [2:0]M_AXI_GP0_ARPROT;
  output [2:0]M_AXI_GP0_AWPROT;
  output [31:0]M_AXI_GP0_ARADDR;
  output [31:0]M_AXI_GP0_AWADDR;
  output [31:0]M_AXI_GP0_WDATA;
  output [3:0]M_AXI_GP0_ARCACHE;
  output [3:0]M_AXI_GP0_ARLEN;
  output [3:0]M_AXI_GP0_ARQOS;
  output [3:0]M_AXI_GP0_AWCACHE;
  output [3:0]M_AXI_GP0_AWLEN;
  output [3:0]M_AXI_GP0_AWQOS;
  output [3:0]M_AXI_GP0_WSTRB;
  input M_AXI_GP0_ACLK;
  input M_AXI_GP0_ARREADY;
  input M_AXI_GP0_AWREADY;
  input M_AXI_GP0_BVALID;
  input M_AXI_GP0_RLAST;
  input M_AXI_GP0_RVALID;
  input M_AXI_GP0_WREADY;
  input [11:0]M_AXI_GP0_BID;
  input [11:0]M_AXI_GP0_RID;
  input [1:0]M_AXI_GP0_BRESP;
  input [1:0]M_AXI_GP0_RRESP;
  input [31:0]M_AXI_GP0_RDATA;
  output M_AXI_GP1_ARESETN;
  output M_AXI_GP1_ARVALID;
  output M_AXI_GP1_AWVALID;
  output M_AXI_GP1_BREADY;
  output M_AXI_GP1_RREADY;
  output M_AXI_GP1_WLAST;
  output M_AXI_GP1_WVALID;
  output [11:0]M_AXI_GP1_ARID;
  output [11:0]M_AXI_GP1_AWID;
  output [11:0]M_AXI_GP1_WID;
  output [1:0]M_AXI_GP1_ARBURST;
  output [1:0]M_AXI_GP1_ARLOCK;
  output [2:0]M_AXI_GP1_ARSIZE;
  output [1:0]M_AXI_GP1_AWBURST;
  output [1:0]M_AXI_GP1_AWLOCK;
  output [2:0]M_AXI_GP1_AWSIZE;
  output [2:0]M_AXI_GP1_ARPROT;
  output [2:0]M_AXI_GP1_AWPROT;
  output [31:0]M_AXI_GP1_ARADDR;
  output [31:0]M_AXI_GP1_AWADDR;
  output [31:0]M_AXI_GP1_WDATA;
  output [3:0]M_AXI_GP1_ARCACHE;
  output [3:0]M_AXI_GP1_ARLEN;
  output [3:0]M_AXI_GP1_ARQOS;
  output [3:0]M_AXI_GP1_AWCACHE;
  output [3:0]M_AXI_GP1_AWLEN;
  output [3:0]M_AXI_GP1_AWQOS;
  output [3:0]M_AXI_GP1_WSTRB;
  input M_AXI_GP1_ACLK;
  input M_AXI_GP1_ARREADY;
  input M_AXI_GP1_AWREADY;
  input M_AXI_GP1_BVALID;
  input M_AXI_GP1_RLAST;
  input M_AXI_GP1_RVALID;
  input M_AXI_GP1_WREADY;
  input [11:0]M_AXI_GP1_BID;
  input [11:0]M_AXI_GP1_RID;
  input [1:0]M_AXI_GP1_BRESP;
  input [1:0]M_AXI_GP1_RRESP;
  input [31:0]M_AXI_GP1_RDATA;
  output S_AXI_GP0_ARESETN;
  output S_AXI_GP0_ARREADY;
  output S_AXI_GP0_AWREADY;
  output S_AXI_GP0_BVALID;
  output S_AXI_GP0_RLAST;
  output S_AXI_GP0_RVALID;
  output S_AXI_GP0_WREADY;
  output [1:0]S_AXI_GP0_BRESP;
  output [1:0]S_AXI_GP0_RRESP;
  output [31:0]S_AXI_GP0_RDATA;
  output [5:0]S_AXI_GP0_BID;
  output [5:0]S_AXI_GP0_RID;
  input S_AXI_GP0_ACLK;
  input S_AXI_GP0_ARVALID;
  input S_AXI_GP0_AWVALID;
  input S_AXI_GP0_BREADY;
  input S_AXI_GP0_RREADY;
  input S_AXI_GP0_WLAST;
  input S_AXI_GP0_WVALID;
  input [1:0]S_AXI_GP0_ARBURST;
  input [1:0]S_AXI_GP0_ARLOCK;
  input [2:0]S_AXI_GP0_ARSIZE;
  input [1:0]S_AXI_GP0_AWBURST;
  input [1:0]S_AXI_GP0_AWLOCK;
  input [2:0]S_AXI_GP0_AWSIZE;
  input [2:0]S_AXI_GP0_ARPROT;
  input [2:0]S_AXI_GP0_AWPROT;
  input [31:0]S_AXI_GP0_ARADDR;
  input [31:0]S_AXI_GP0_AWADDR;
  input [31:0]S_AXI_GP0_WDATA;
  input [3:0]S_AXI_GP0_ARCACHE;
  input [3:0]S_AXI_GP0_ARLEN;
  input [3:0]S_AXI_GP0_ARQOS;
  input [3:0]S_AXI_GP0_AWCACHE;
  input [3:0]S_AXI_GP0_AWLEN;
  input [3:0]S_AXI_GP0_AWQOS;
  input [3:0]S_AXI_GP0_WSTRB;
  input [5:0]S_AXI_GP0_ARID;
  input [5:0]S_AXI_GP0_AWID;
  input [5:0]S_AXI_GP0_WID;
  output S_AXI_GP1_ARESETN;
  output S_AXI_GP1_ARREADY;
  output S_AXI_GP1_AWREADY;
  output S_AXI_GP1_BVALID;
  output S_AXI_GP1_RLAST;
  output S_AXI_GP1_RVALID;
  output S_AXI_GP1_WREADY;
  output [1:0]S_AXI_GP1_BRESP;
  output [1:0]S_AXI_GP1_RRESP;
  output [31:0]S_AXI_GP1_RDATA;
  output [5:0]S_AXI_GP1_BID;
  output [5:0]S_AXI_GP1_RID;
  input S_AXI_GP1_ACLK;
  input S_AXI_GP1_ARVALID;
  input S_AXI_GP1_AWVALID;
  input S_AXI_GP1_BREADY;
  input S_AXI_GP1_RREADY;
  input S_AXI_GP1_WLAST;
  input S_AXI_GP1_WVALID;
  input [1:0]S_AXI_GP1_ARBURST;
  input [1:0]S_AXI_GP1_ARLOCK;
  input [2:0]S_AXI_GP1_ARSIZE;
  input [1:0]S_AXI_GP1_AWBURST;
  input [1:0]S_AXI_GP1_AWLOCK;
  input [2:0]S_AXI_GP1_AWSIZE;
  input [2:0]S_AXI_GP1_ARPROT;
  input [2:0]S_AXI_GP1_AWPROT;
  input [31:0]S_AXI_GP1_ARADDR;
  input [31:0]S_AXI_GP1_AWADDR;
  input [31:0]S_AXI_GP1_WDATA;
  input [3:0]S_AXI_GP1_ARCACHE;
  input [3:0]S_AXI_GP1_ARLEN;
  input [3:0]S_AXI_GP1_ARQOS;
  input [3:0]S_AXI_GP1_AWCACHE;
  input [3:0]S_AXI_GP1_AWLEN;
  input [3:0]S_AXI_GP1_AWQOS;
  input [3:0]S_AXI_GP1_WSTRB;
  input [5:0]S_AXI_GP1_ARID;
  input [5:0]S_AXI_GP1_AWID;
  input [5:0]S_AXI_GP1_WID;
  output S_AXI_ACP_ARESETN;
  output S_AXI_ACP_ARREADY;
  output S_AXI_ACP_AWREADY;
  output S_AXI_ACP_BVALID;
  output S_AXI_ACP_RLAST;
  output S_AXI_ACP_RVALID;
  output S_AXI_ACP_WREADY;
  output [1:0]S_AXI_ACP_BRESP;
  output [1:0]S_AXI_ACP_RRESP;
  output [2:0]S_AXI_ACP_BID;
  output [2:0]S_AXI_ACP_RID;
  output [63:0]S_AXI_ACP_RDATA;
  input S_AXI_ACP_ACLK;
  input S_AXI_ACP_ARVALID;
  input S_AXI_ACP_AWVALID;
  input S_AXI_ACP_BREADY;
  input S_AXI_ACP_RREADY;
  input S_AXI_ACP_WLAST;
  input S_AXI_ACP_WVALID;
  input [2:0]S_AXI_ACP_ARID;
  input [2:0]S_AXI_ACP_ARPROT;
  input [2:0]S_AXI_ACP_AWID;
  input [2:0]S_AXI_ACP_AWPROT;
  input [2:0]S_AXI_ACP_WID;
  input [31:0]S_AXI_ACP_ARADDR;
  input [31:0]S_AXI_ACP_AWADDR;
  input [3:0]S_AXI_ACP_ARCACHE;
  input [3:0]S_AXI_ACP_ARLEN;
  input [3:0]S_AXI_ACP_ARQOS;
  input [3:0]S_AXI_ACP_AWCACHE;
  input [3:0]S_AXI_ACP_AWLEN;
  input [3:0]S_AXI_ACP_AWQOS;
  input [1:0]S_AXI_ACP_ARBURST;
  input [1:0]S_AXI_ACP_ARLOCK;
  input [2:0]S_AXI_ACP_ARSIZE;
  input [1:0]S_AXI_ACP_AWBURST;
  input [1:0]S_AXI_ACP_AWLOCK;
  input [2:0]S_AXI_ACP_AWSIZE;
  input [4:0]S_AXI_ACP_ARUSER;
  input [4:0]S_AXI_ACP_AWUSER;
  input [63:0]S_AXI_ACP_WDATA;
  input [7:0]S_AXI_ACP_WSTRB;
  output S_AXI_HP0_ARESETN;
  output S_AXI_HP0_ARREADY;
  output S_AXI_HP0_AWREADY;
  output S_AXI_HP0_BVALID;
  output S_AXI_HP0_RLAST;
  output S_AXI_HP0_RVALID;
  output S_AXI_HP0_WREADY;
  output [1:0]S_AXI_HP0_BRESP;
  output [1:0]S_AXI_HP0_RRESP;
  output [5:0]S_AXI_HP0_BID;
  output [5:0]S_AXI_HP0_RID;
  output [63:0]S_AXI_HP0_RDATA;
  output [7:0]S_AXI_HP0_RCOUNT;
  output [7:0]S_AXI_HP0_WCOUNT;
  output [2:0]S_AXI_HP0_RACOUNT;
  output [5:0]S_AXI_HP0_WACOUNT;
  input S_AXI_HP0_ACLK;
  input S_AXI_HP0_ARVALID;
  input S_AXI_HP0_AWVALID;
  input S_AXI_HP0_BREADY;
  input S_AXI_HP0_RDISSUECAP1_EN;
  input S_AXI_HP0_RREADY;
  input S_AXI_HP0_WLAST;
  input S_AXI_HP0_WRISSUECAP1_EN;
  input S_AXI_HP0_WVALID;
  input [1:0]S_AXI_HP0_ARBURST;
  input [1:0]S_AXI_HP0_ARLOCK;
  input [2:0]S_AXI_HP0_ARSIZE;
  input [1:0]S_AXI_HP0_AWBURST;
  input [1:0]S_AXI_HP0_AWLOCK;
  input [2:0]S_AXI_HP0_AWSIZE;
  input [2:0]S_AXI_HP0_ARPROT;
  input [2:0]S_AXI_HP0_AWPROT;
  input [31:0]S_AXI_HP0_ARADDR;
  input [31:0]S_AXI_HP0_AWADDR;
  input [3:0]S_AXI_HP0_ARCACHE;
  input [3:0]S_AXI_HP0_ARLEN;
  input [3:0]S_AXI_HP0_ARQOS;
  input [3:0]S_AXI_HP0_AWCACHE;
  input [3:0]S_AXI_HP0_AWLEN;
  input [3:0]S_AXI_HP0_AWQOS;
  input [5:0]S_AXI_HP0_ARID;
  input [5:0]S_AXI_HP0_AWID;
  input [5:0]S_AXI_HP0_WID;
  input [63:0]S_AXI_HP0_WDATA;
  input [7:0]S_AXI_HP0_WSTRB;
  output S_AXI_HP1_ARESETN;
  output S_AXI_HP1_ARREADY;
  output S_AXI_HP1_AWREADY;
  output S_AXI_HP1_BVALID;
  output S_AXI_HP1_RLAST;
  output S_AXI_HP1_RVALID;
  output S_AXI_HP1_WREADY;
  output [1:0]S_AXI_HP1_BRESP;
  output [1:0]S_AXI_HP1_RRESP;
  output [5:0]S_AXI_HP1_BID;
  output [5:0]S_AXI_HP1_RID;
  output [63:0]S_AXI_HP1_RDATA;
  output [7:0]S_AXI_HP1_RCOUNT;
  output [7:0]S_AXI_HP1_WCOUNT;
  output [2:0]S_AXI_HP1_RACOUNT;
  output [5:0]S_AXI_HP1_WACOUNT;
  input S_AXI_HP1_ACLK;
  input S_AXI_HP1_ARVALID;
  input S_AXI_HP1_AWVALID;
  input S_AXI_HP1_BREADY;
  input S_AXI_HP1_RDISSUECAP1_EN;
  input S_AXI_HP1_RREADY;
  input S_AXI_HP1_WLAST;
  input S_AXI_HP1_WRISSUECAP1_EN;
  input S_AXI_HP1_WVALID;
  input [1:0]S_AXI_HP1_ARBURST;
  input [1:0]S_AXI_HP1_ARLOCK;
  input [2:0]S_AXI_HP1_ARSIZE;
  input [1:0]S_AXI_HP1_AWBURST;
  input [1:0]S_AXI_HP1_AWLOCK;
  input [2:0]S_AXI_HP1_AWSIZE;
  input [2:0]S_AXI_HP1_ARPROT;
  input [2:0]S_AXI_HP1_AWPROT;
  input [31:0]S_AXI_HP1_ARADDR;
  input [31:0]S_AXI_HP1_AWADDR;
  input [3:0]S_AXI_HP1_ARCACHE;
  input [3:0]S_AXI_HP1_ARLEN;
  input [3:0]S_AXI_HP1_ARQOS;
  input [3:0]S_AXI_HP1_AWCACHE;
  input [3:0]S_AXI_HP1_AWLEN;
  input [3:0]S_AXI_HP1_AWQOS;
  input [5:0]S_AXI_HP1_ARID;
  input [5:0]S_AXI_HP1_AWID;
  input [5:0]S_AXI_HP1_WID;
  input [63:0]S_AXI_HP1_WDATA;
  input [7:0]S_AXI_HP1_WSTRB;
  output S_AXI_HP2_ARESETN;
  output S_AXI_HP2_ARREADY;
  output S_AXI_HP2_AWREADY;
  output S_AXI_HP2_BVALID;
  output S_AXI_HP2_RLAST;
  output S_AXI_HP2_RVALID;
  output S_AXI_HP2_WREADY;
  output [1:0]S_AXI_HP2_BRESP;
  output [1:0]S_AXI_HP2_RRESP;
  output [5:0]S_AXI_HP2_BID;
  output [5:0]S_AXI_HP2_RID;
  output [63:0]S_AXI_HP2_RDATA;
  output [7:0]S_AXI_HP2_RCOUNT;
  output [7:0]S_AXI_HP2_WCOUNT;
  output [2:0]S_AXI_HP2_RACOUNT;
  output [5:0]S_AXI_HP2_WACOUNT;
  input S_AXI_HP2_ACLK;
  input S_AXI_HP2_ARVALID;
  input S_AXI_HP2_AWVALID;
  input S_AXI_HP2_BREADY;
  input S_AXI_HP2_RDISSUECAP1_EN;
  input S_AXI_HP2_RREADY;
  input S_AXI_HP2_WLAST;
  input S_AXI_HP2_WRISSUECAP1_EN;
  input S_AXI_HP2_WVALID;
  input [1:0]S_AXI_HP2_ARBURST;
  input [1:0]S_AXI_HP2_ARLOCK;
  input [2:0]S_AXI_HP2_ARSIZE;
  input [1:0]S_AXI_HP2_AWBURST;
  input [1:0]S_AXI_HP2_AWLOCK;
  input [2:0]S_AXI_HP2_AWSIZE;
  input [2:0]S_AXI_HP2_ARPROT;
  input [2:0]S_AXI_HP2_AWPROT;
  input [31:0]S_AXI_HP2_ARADDR;
  input [31:0]S_AXI_HP2_AWADDR;
  input [3:0]S_AXI_HP2_ARCACHE;
  input [3:0]S_AXI_HP2_ARLEN;
  input [3:0]S_AXI_HP2_ARQOS;
  input [3:0]S_AXI_HP2_AWCACHE;
  input [3:0]S_AXI_HP2_AWLEN;
  input [3:0]S_AXI_HP2_AWQOS;
  input [5:0]S_AXI_HP2_ARID;
  input [5:0]S_AXI_HP2_AWID;
  input [5:0]S_AXI_HP2_WID;
  input [63:0]S_AXI_HP2_WDATA;
  input [7:0]S_AXI_HP2_WSTRB;
  output S_AXI_HP3_ARESETN;
  output S_AXI_HP3_ARREADY;
  output S_AXI_HP3_AWREADY;
  output S_AXI_HP3_BVALID;
  output S_AXI_HP3_RLAST;
  output S_AXI_HP3_RVALID;
  output S_AXI_HP3_WREADY;
  output [1:0]S_AXI_HP3_BRESP;
  output [1:0]S_AXI_HP3_RRESP;
  output [5:0]S_AXI_HP3_BID;
  output [5:0]S_AXI_HP3_RID;
  output [63:0]S_AXI_HP3_RDATA;
  output [7:0]S_AXI_HP3_RCOUNT;
  output [7:0]S_AXI_HP3_WCOUNT;
  output [2:0]S_AXI_HP3_RACOUNT;
  output [5:0]S_AXI_HP3_WACOUNT;
  input S_AXI_HP3_ACLK;
  input S_AXI_HP3_ARVALID;
  input S_AXI_HP3_AWVALID;
  input S_AXI_HP3_BREADY;
  input S_AXI_HP3_RDISSUECAP1_EN;
  input S_AXI_HP3_RREADY;
  input S_AXI_HP3_WLAST;
  input S_AXI_HP3_WRISSUECAP1_EN;
  input S_AXI_HP3_WVALID;
  input [1:0]S_AXI_HP3_ARBURST;
  input [1:0]S_AXI_HP3_ARLOCK;
  input [2:0]S_AXI_HP3_ARSIZE;
  input [1:0]S_AXI_HP3_AWBURST;
  input [1:0]S_AXI_HP3_AWLOCK;
  input [2:0]S_AXI_HP3_AWSIZE;
  input [2:0]S_AXI_HP3_ARPROT;
  input [2:0]S_AXI_HP3_AWPROT;
  input [31:0]S_AXI_HP3_ARADDR;
  input [31:0]S_AXI_HP3_AWADDR;
  input [3:0]S_AXI_HP3_ARCACHE;
  input [3:0]S_AXI_HP3_ARLEN;
  input [3:0]S_AXI_HP3_ARQOS;
  input [3:0]S_AXI_HP3_AWCACHE;
  input [3:0]S_AXI_HP3_AWLEN;
  input [3:0]S_AXI_HP3_AWQOS;
  input [5:0]S_AXI_HP3_ARID;
  input [5:0]S_AXI_HP3_AWID;
  input [5:0]S_AXI_HP3_WID;
  input [63:0]S_AXI_HP3_WDATA;
  input [7:0]S_AXI_HP3_WSTRB;
  output IRQ_P2F_DMAC_ABORT;
  output IRQ_P2F_DMAC0;
  output IRQ_P2F_DMAC1;
  output IRQ_P2F_DMAC2;
  output IRQ_P2F_DMAC3;
  output IRQ_P2F_DMAC4;
  output IRQ_P2F_DMAC5;
  output IRQ_P2F_DMAC6;
  output IRQ_P2F_DMAC7;
  output IRQ_P2F_SMC;
  output IRQ_P2F_QSPI;
  output IRQ_P2F_CTI;
  output IRQ_P2F_GPIO;
  output IRQ_P2F_USB0;
  output IRQ_P2F_ENET0;
  output IRQ_P2F_ENET_WAKE0;
  output IRQ_P2F_SDIO0;
  output IRQ_P2F_I2C0;
  output IRQ_P2F_SPI0;
  output IRQ_P2F_UART0;
  output IRQ_P2F_CAN0;
  output IRQ_P2F_USB1;
  output IRQ_P2F_ENET1;
  output IRQ_P2F_ENET_WAKE1;
  output IRQ_P2F_SDIO1;
  output IRQ_P2F_I2C1;
  output IRQ_P2F_SPI1;
  output IRQ_P2F_UART1;
  output IRQ_P2F_CAN1;
  input [0:0]IRQ_F2P;
  input Core0_nFIQ;
  input Core0_nIRQ;
  input Core1_nFIQ;
  input Core1_nIRQ;
  output [1:0]DMA0_DATYPE;
  output DMA0_DAVALID;
  output DMA0_DRREADY;
  output DMA0_RSTN;
  output [1:0]DMA1_DATYPE;
  output DMA1_DAVALID;
  output DMA1_DRREADY;
  output DMA1_RSTN;
  output [1:0]DMA2_DATYPE;
  output DMA2_DAVALID;
  output DMA2_DRREADY;
  output DMA2_RSTN;
  output [1:0]DMA3_DATYPE;
  output DMA3_DAVALID;
  output DMA3_DRREADY;
  output DMA3_RSTN;
  input DMA0_ACLK;
  input DMA0_DAREADY;
  input DMA0_DRLAST;
  input DMA0_DRVALID;
  input DMA1_ACLK;
  input DMA1_DAREADY;
  input DMA1_DRLAST;
  input DMA1_DRVALID;
  input DMA2_ACLK;
  input DMA2_DAREADY;
  input DMA2_DRLAST;
  input DMA2_DRVALID;
  input DMA3_ACLK;
  input DMA3_DAREADY;
  input DMA3_DRLAST;
  input DMA3_DRVALID;
  input [1:0]DMA0_DRTYPE;
  input [1:0]DMA1_DRTYPE;
  input [1:0]DMA2_DRTYPE;
  input [1:0]DMA3_DRTYPE;
  output FCLK_CLK3;
  output FCLK_CLK2;
  output FCLK_CLK1;
  output FCLK_CLK0;
  input FCLK_CLKTRIG3_N;
  input FCLK_CLKTRIG2_N;
  input FCLK_CLKTRIG1_N;
  input FCLK_CLKTRIG0_N;
  output FCLK_RESET3_N;
  output FCLK_RESET2_N;
  output FCLK_RESET1_N;
  output FCLK_RESET0_N;
  input [31:0]FTMD_TRACEIN_DATA;
  input FTMD_TRACEIN_VALID;
  input FTMD_TRACEIN_CLK;
  input [3:0]FTMD_TRACEIN_ATID;
  input FTMT_F2P_TRIG_0;
  output FTMT_F2P_TRIGACK_0;
  input FTMT_F2P_TRIG_1;
  output FTMT_F2P_TRIGACK_1;
  input FTMT_F2P_TRIG_2;
  output FTMT_F2P_TRIGACK_2;
  input FTMT_F2P_TRIG_3;
  output FTMT_F2P_TRIGACK_3;
  input [31:0]FTMT_F2P_DEBUG;
  input FTMT_P2F_TRIGACK_0;
  output FTMT_P2F_TRIG_0;
  input FTMT_P2F_TRIGACK_1;
  output FTMT_P2F_TRIG_1;
  input FTMT_P2F_TRIGACK_2;
  output FTMT_P2F_TRIG_2;
  input FTMT_P2F_TRIGACK_3;
  output FTMT_P2F_TRIG_3;
  output [31:0]FTMT_P2F_DEBUG;
  input FPGA_IDLE_N;
  output EVENT_EVENTO;
  output [1:0]EVENT_STANDBYWFE;
  output [1:0]EVENT_STANDBYWFI;
  input EVENT_EVENTI;
  input [3:0]DDR_ARB;
  inout [53:0]MIO;
  inout DDR_CAS_n;
  inout DDR_CKE;
  inout DDR_Clk_n;
  inout DDR_Clk;
  inout DDR_CS_n;
  inout DDR_DRSTB;
  inout DDR_ODT;
  inout DDR_RAS_n;
  inout DDR_WEB;
  inout [2:0]DDR_BankAddr;
  inout [14:0]DDR_Addr;
  inout DDR_VRN;
  inout DDR_VRP;
  inout [3:0]DDR_DM;
  inout [31:0]DDR_DQ;
  inout [3:0]DDR_DQS_n;
  inout [3:0]DDR_DQS;
  inout PS_SRSTB;
  inout PS_CLK;
  inout PS_PORB;

  wire \<const0> ;
  wire [14:0]DDR_Addr;
  wire [2:0]DDR_BankAddr;
  wire DDR_CAS_n;
  wire DDR_CKE;
  wire DDR_CS_n;
  wire DDR_Clk;
  wire DDR_Clk_n;
  wire [3:0]DDR_DM;
  wire [31:0]DDR_DQ;
  wire [3:0]DDR_DQS;
  wire [3:0]DDR_DQS_n;
  wire DDR_DRSTB;
  wire DDR_ODT;
  wire DDR_RAS_n;
  wire DDR_VRN;
  wire DDR_VRP;
  wire DDR_WEB;
  wire ENET0_MDIO_T_n;
  wire ENET1_MDIO_T_n;
  wire FCLK_CLK0;
  wire FCLK_CLK1;
  wire [1:0]FCLK_CLK_unbuffered;
  wire FCLK_RESET0_N;
  wire I2C0_SCL_T_n;
  wire I2C0_SDA_T_n;
  wire I2C1_SCL_T_n;
  wire I2C1_SDA_T_n;
  wire [53:0]MIO;
  wire [31:0]M_AXI_GP0_ARADDR;
  wire [1:0]M_AXI_GP0_ARBURST;
  wire [11:0]M_AXI_GP0_ARID;
  wire [3:0]M_AXI_GP0_ARLEN;
  wire [2:0]M_AXI_GP0_ARPROT;
  wire M_AXI_GP0_ARREADY;
  wire [1:0]\^M_AXI_GP0_ARSIZE ;
  wire M_AXI_GP0_ARVALID;
  wire [31:0]M_AXI_GP0_AWADDR;
  wire [1:0]M_AXI_GP0_AWBURST;
  wire [11:0]M_AXI_GP0_AWID;
  wire [3:0]M_AXI_GP0_AWLEN;
  wire [2:0]M_AXI_GP0_AWPROT;
  wire M_AXI_GP0_AWREADY;
  wire [1:0]\^M_AXI_GP0_AWSIZE ;
  wire M_AXI_GP0_AWVALID;
  wire [11:0]M_AXI_GP0_BID;
  wire M_AXI_GP0_BREADY;
  wire [1:0]M_AXI_GP0_BRESP;
  wire M_AXI_GP0_BVALID;
  wire [31:0]M_AXI_GP0_RDATA;
  wire [11:0]M_AXI_GP0_RID;
  wire M_AXI_GP0_RLAST;
  wire M_AXI_GP0_RREADY;
  wire [1:0]M_AXI_GP0_RRESP;
  wire M_AXI_GP0_RVALID;
  wire [31:0]M_AXI_GP0_WDATA;
  wire M_AXI_GP0_WREADY;
  wire [3:0]M_AXI_GP0_WSTRB;
  wire M_AXI_GP0_WVALID;
  wire PS7_i_n_0;
  wire PS7_i_n_1;
  wire PS7_i_n_10;
  wire PS7_i_n_100;
  wire PS7_i_n_1001;
  wire PS7_i_n_1002;
  wire PS7_i_n_1003;
  wire PS7_i_n_1004;
  wire PS7_i_n_1005;
  wire PS7_i_n_1006;
  wire PS7_i_n_1007;
  wire PS7_i_n_1008;
  wire PS7_i_n_1009;
  wire PS7_i_n_101;
  wire PS7_i_n_1010;
  wire PS7_i_n_1011;
  wire PS7_i_n_1012;
  wire PS7_i_n_1013;
  wire PS7_i_n_1014;
  wire PS7_i_n_1015;
  wire PS7_i_n_1016;
  wire PS7_i_n_1017;
  wire PS7_i_n_1018;
  wire PS7_i_n_1019;
  wire PS7_i_n_102;
  wire PS7_i_n_1020;
  wire PS7_i_n_1021;
  wire PS7_i_n_1022;
  wire PS7_i_n_1023;
  wire PS7_i_n_1024;
  wire PS7_i_n_1025;
  wire PS7_i_n_1026;
  wire PS7_i_n_1027;
  wire PS7_i_n_1028;
  wire PS7_i_n_1029;
  wire PS7_i_n_103;
  wire PS7_i_n_1030;
  wire PS7_i_n_1031;
  wire PS7_i_n_1032;
  wire PS7_i_n_1033;
  wire PS7_i_n_1034;
  wire PS7_i_n_1035;
  wire PS7_i_n_1036;
  wire PS7_i_n_1037;
  wire PS7_i_n_1038;
  wire PS7_i_n_1039;
  wire PS7_i_n_104;
  wire PS7_i_n_1040;
  wire PS7_i_n_1041;
  wire PS7_i_n_1042;
  wire PS7_i_n_1043;
  wire PS7_i_n_1044;
  wire PS7_i_n_1045;
  wire PS7_i_n_1046;
  wire PS7_i_n_1047;
  wire PS7_i_n_1048;
  wire PS7_i_n_1049;
  wire PS7_i_n_105;
  wire PS7_i_n_1050;
  wire PS7_i_n_1051;
  wire PS7_i_n_1052;
  wire PS7_i_n_1053;
  wire PS7_i_n_1054;
  wire PS7_i_n_1055;
  wire PS7_i_n_1056;
  wire PS7_i_n_1057;
  wire PS7_i_n_1058;
  wire PS7_i_n_1059;
  wire PS7_i_n_106;
  wire PS7_i_n_1060;
  wire PS7_i_n_1061;
  wire PS7_i_n_1062;
  wire PS7_i_n_1063;
  wire PS7_i_n_1064;
  wire PS7_i_n_1065;
  wire PS7_i_n_1066;
  wire PS7_i_n_1067;
  wire PS7_i_n_1068;
  wire PS7_i_n_1069;
  wire PS7_i_n_107;
  wire PS7_i_n_1070;
  wire PS7_i_n_1071;
  wire PS7_i_n_1072;
  wire PS7_i_n_1073;
  wire PS7_i_n_1074;
  wire PS7_i_n_1075;
  wire PS7_i_n_1076;
  wire PS7_i_n_1077;
  wire PS7_i_n_1078;
  wire PS7_i_n_1079;
  wire PS7_i_n_108;
  wire PS7_i_n_1080;
  wire PS7_i_n_1081;
  wire PS7_i_n_1082;
  wire PS7_i_n_1083;
  wire PS7_i_n_1084;
  wire PS7_i_n_1085;
  wire PS7_i_n_1086;
  wire PS7_i_n_1087;
  wire PS7_i_n_1088;
  wire PS7_i_n_1089;
  wire PS7_i_n_109;
  wire PS7_i_n_1090;
  wire PS7_i_n_1091;
  wire PS7_i_n_1092;
  wire PS7_i_n_1093;
  wire PS7_i_n_1094;
  wire PS7_i_n_1095;
  wire PS7_i_n_1096;
  wire PS7_i_n_1097;
  wire PS7_i_n_1098;
  wire PS7_i_n_1099;
  wire PS7_i_n_11;
  wire PS7_i_n_110;
  wire PS7_i_n_1100;
  wire PS7_i_n_1101;
  wire PS7_i_n_1102;
  wire PS7_i_n_1103;
  wire PS7_i_n_1104;
  wire PS7_i_n_1105;
  wire PS7_i_n_1106;
  wire PS7_i_n_1107;
  wire PS7_i_n_1108;
  wire PS7_i_n_1109;
  wire PS7_i_n_111;
  wire PS7_i_n_1110;
  wire PS7_i_n_1111;
  wire PS7_i_n_1112;
  wire PS7_i_n_1113;
  wire PS7_i_n_1114;
  wire PS7_i_n_1115;
  wire PS7_i_n_1116;
  wire PS7_i_n_1117;
  wire PS7_i_n_1118;
  wire PS7_i_n_1119;
  wire PS7_i_n_112;
  wire PS7_i_n_1120;
  wire PS7_i_n_1121;
  wire PS7_i_n_1122;
  wire PS7_i_n_1123;
  wire PS7_i_n_1124;
  wire PS7_i_n_1125;
  wire PS7_i_n_1126;
  wire PS7_i_n_1127;
  wire PS7_i_n_1128;
  wire PS7_i_n_1129;
  wire PS7_i_n_113;
  wire PS7_i_n_1130;
  wire PS7_i_n_1131;
  wire PS7_i_n_1132;
  wire PS7_i_n_1133;
  wire PS7_i_n_1134;
  wire PS7_i_n_1135;
  wire PS7_i_n_1136;
  wire PS7_i_n_1137;
  wire PS7_i_n_1138;
  wire PS7_i_n_1139;
  wire PS7_i_n_114;
  wire PS7_i_n_1140;
  wire PS7_i_n_1141;
  wire PS7_i_n_1142;
  wire PS7_i_n_1143;
  wire PS7_i_n_1144;
  wire PS7_i_n_1145;
  wire PS7_i_n_1146;
  wire PS7_i_n_1147;
  wire PS7_i_n_1148;
  wire PS7_i_n_1149;
  wire PS7_i_n_115;
  wire PS7_i_n_1150;
  wire PS7_i_n_1151;
  wire PS7_i_n_1152;
  wire PS7_i_n_1153;
  wire PS7_i_n_1154;
  wire PS7_i_n_1155;
  wire PS7_i_n_1156;
  wire PS7_i_n_1157;
  wire PS7_i_n_1158;
  wire PS7_i_n_1159;
  wire PS7_i_n_116;
  wire PS7_i_n_1160;
  wire PS7_i_n_1161;
  wire PS7_i_n_1162;
  wire PS7_i_n_1163;
  wire PS7_i_n_1164;
  wire PS7_i_n_1165;
  wire PS7_i_n_1166;
  wire PS7_i_n_1167;
  wire PS7_i_n_1168;
  wire PS7_i_n_1169;
  wire PS7_i_n_117;
  wire PS7_i_n_1170;
  wire PS7_i_n_1171;
  wire PS7_i_n_1172;
  wire PS7_i_n_1173;
  wire PS7_i_n_1174;
  wire PS7_i_n_1175;
  wire PS7_i_n_1176;
  wire PS7_i_n_1177;
  wire PS7_i_n_1178;
  wire PS7_i_n_1179;
  wire PS7_i_n_118;
  wire PS7_i_n_1180;
  wire PS7_i_n_1181;
  wire PS7_i_n_1182;
  wire PS7_i_n_1183;
  wire PS7_i_n_1184;
  wire PS7_i_n_1185;
  wire PS7_i_n_1186;
  wire PS7_i_n_1187;
  wire PS7_i_n_1188;
  wire PS7_i_n_1189;
  wire PS7_i_n_119;
  wire PS7_i_n_1190;
  wire PS7_i_n_1191;
  wire PS7_i_n_1192;
  wire PS7_i_n_1193;
  wire PS7_i_n_1194;
  wire PS7_i_n_1195;
  wire PS7_i_n_1196;
  wire PS7_i_n_1197;
  wire PS7_i_n_1198;
  wire PS7_i_n_1199;
  wire PS7_i_n_12;
  wire PS7_i_n_120;
  wire PS7_i_n_1200;
  wire PS7_i_n_1201;
  wire PS7_i_n_1202;
  wire PS7_i_n_1203;
  wire PS7_i_n_1204;
  wire PS7_i_n_1205;
  wire PS7_i_n_1206;
  wire PS7_i_n_1207;
  wire PS7_i_n_1208;
  wire PS7_i_n_1209;
  wire PS7_i_n_121;
  wire PS7_i_n_1210;
  wire PS7_i_n_1211;
  wire PS7_i_n_1212;
  wire PS7_i_n_1213;
  wire PS7_i_n_1214;
  wire PS7_i_n_1215;
  wire PS7_i_n_1216;
  wire PS7_i_n_1217;
  wire PS7_i_n_1218;
  wire PS7_i_n_1219;
  wire PS7_i_n_122;
  wire PS7_i_n_1220;
  wire PS7_i_n_1221;
  wire PS7_i_n_1222;
  wire PS7_i_n_1223;
  wire PS7_i_n_1224;
  wire PS7_i_n_1225;
  wire PS7_i_n_1226;
  wire PS7_i_n_1227;
  wire PS7_i_n_1228;
  wire PS7_i_n_1229;
  wire PS7_i_n_123;
  wire PS7_i_n_1230;
  wire PS7_i_n_1231;
  wire PS7_i_n_1232;
  wire PS7_i_n_1233;
  wire PS7_i_n_1234;
  wire PS7_i_n_1235;
  wire PS7_i_n_1236;
  wire PS7_i_n_1237;
  wire PS7_i_n_1238;
  wire PS7_i_n_1239;
  wire PS7_i_n_124;
  wire PS7_i_n_1240;
  wire PS7_i_n_1241;
  wire PS7_i_n_1242;
  wire PS7_i_n_1243;
  wire PS7_i_n_1244;
  wire PS7_i_n_1245;
  wire PS7_i_n_1246;
  wire PS7_i_n_1247;
  wire PS7_i_n_1248;
  wire PS7_i_n_1249;
  wire PS7_i_n_125;
  wire PS7_i_n_1250;
  wire PS7_i_n_1251;
  wire PS7_i_n_1252;
  wire PS7_i_n_1253;
  wire PS7_i_n_1254;
  wire PS7_i_n_1255;
  wire PS7_i_n_1256;
  wire PS7_i_n_1257;
  wire PS7_i_n_1258;
  wire PS7_i_n_1259;
  wire PS7_i_n_126;
  wire PS7_i_n_1260;
  wire PS7_i_n_1261;
  wire PS7_i_n_1262;
  wire PS7_i_n_1263;
  wire PS7_i_n_1264;
  wire PS7_i_n_1265;
  wire PS7_i_n_1266;
  wire PS7_i_n_1267;
  wire PS7_i_n_1268;
  wire PS7_i_n_1269;
  wire PS7_i_n_127;
  wire PS7_i_n_1270;
  wire PS7_i_n_1271;
  wire PS7_i_n_1272;
  wire PS7_i_n_1273;
  wire PS7_i_n_1274;
  wire PS7_i_n_1275;
  wire PS7_i_n_1276;
  wire PS7_i_n_1277;
  wire PS7_i_n_1278;
  wire PS7_i_n_1279;
  wire PS7_i_n_128;
  wire PS7_i_n_1280;
  wire PS7_i_n_1281;
  wire PS7_i_n_1282;
  wire PS7_i_n_1283;
  wire PS7_i_n_1284;
  wire PS7_i_n_1285;
  wire PS7_i_n_1286;
  wire PS7_i_n_1287;
  wire PS7_i_n_1288;
  wire PS7_i_n_1289;
  wire PS7_i_n_129;
  wire PS7_i_n_1290;
  wire PS7_i_n_1291;
  wire PS7_i_n_1292;
  wire PS7_i_n_1293;
  wire PS7_i_n_1294;
  wire PS7_i_n_1295;
  wire PS7_i_n_1296;
  wire PS7_i_n_1297;
  wire PS7_i_n_1298;
  wire PS7_i_n_1299;
  wire PS7_i_n_13;
  wire PS7_i_n_130;
  wire PS7_i_n_1300;
  wire PS7_i_n_1301;
  wire PS7_i_n_1302;
  wire PS7_i_n_1303;
  wire PS7_i_n_1304;
  wire PS7_i_n_1305;
  wire PS7_i_n_1306;
  wire PS7_i_n_1307;
  wire PS7_i_n_1308;
  wire PS7_i_n_1309;
  wire PS7_i_n_131;
  wire PS7_i_n_1310;
  wire PS7_i_n_1311;
  wire PS7_i_n_1312;
  wire PS7_i_n_1313;
  wire PS7_i_n_1314;
  wire PS7_i_n_1315;
  wire PS7_i_n_1316;
  wire PS7_i_n_1317;
  wire PS7_i_n_1318;
  wire PS7_i_n_1319;
  wire PS7_i_n_132;
  wire PS7_i_n_1320;
  wire PS7_i_n_133;
  wire PS7_i_n_1337;
  wire PS7_i_n_1338;
  wire PS7_i_n_1339;
  wire PS7_i_n_134;
  wire PS7_i_n_1340;
  wire PS7_i_n_1341;
  wire PS7_i_n_1342;
  wire PS7_i_n_1343;
  wire PS7_i_n_1344;
  wire PS7_i_n_1345;
  wire PS7_i_n_1346;
  wire PS7_i_n_1347;
  wire PS7_i_n_1348;
  wire PS7_i_n_1349;
  wire PS7_i_n_135;
  wire PS7_i_n_1350;
  wire PS7_i_n_1351;
  wire PS7_i_n_1352;
  wire PS7_i_n_1353;
  wire PS7_i_n_1354;
  wire PS7_i_n_1355;
  wire PS7_i_n_1356;
  wire PS7_i_n_1357;
  wire PS7_i_n_1358;
  wire PS7_i_n_1359;
  wire PS7_i_n_136;
  wire PS7_i_n_1360;
  wire PS7_i_n_1361;
  wire PS7_i_n_1362;
  wire PS7_i_n_1363;
  wire PS7_i_n_1364;
  wire PS7_i_n_1365;
  wire PS7_i_n_1366;
  wire PS7_i_n_1367;
  wire PS7_i_n_1368;
  wire PS7_i_n_1369;
  wire PS7_i_n_137;
  wire PS7_i_n_1370;
  wire PS7_i_n_1371;
  wire PS7_i_n_1372;
  wire PS7_i_n_1373;
  wire PS7_i_n_1374;
  wire PS7_i_n_1375;
  wire PS7_i_n_1376;
  wire PS7_i_n_1377;
  wire PS7_i_n_1378;
  wire PS7_i_n_1379;
  wire PS7_i_n_138;
  wire PS7_i_n_1380;
  wire PS7_i_n_1381;
  wire PS7_i_n_1382;
  wire PS7_i_n_1383;
  wire PS7_i_n_1384;
  wire PS7_i_n_1385;
  wire PS7_i_n_1386;
  wire PS7_i_n_1387;
  wire PS7_i_n_1388;
  wire PS7_i_n_1389;
  wire PS7_i_n_139;
  wire PS7_i_n_1390;
  wire PS7_i_n_1391;
  wire PS7_i_n_1392;
  wire PS7_i_n_1393;
  wire PS7_i_n_1394;
  wire PS7_i_n_1395;
  wire PS7_i_n_1396;
  wire PS7_i_n_1397;
  wire PS7_i_n_1398;
  wire PS7_i_n_1399;
  wire PS7_i_n_140;
  wire PS7_i_n_1400;
  wire PS7_i_n_141;
  wire PS7_i_n_142;
  wire PS7_i_n_143;
  wire PS7_i_n_144;
  wire PS7_i_n_145;
  wire PS7_i_n_146;
  wire PS7_i_n_147;
  wire PS7_i_n_148;
  wire PS7_i_n_149;
  wire PS7_i_n_150;
  wire PS7_i_n_151;
  wire PS7_i_n_16;
  wire PS7_i_n_17;
  wire PS7_i_n_176;
  wire PS7_i_n_177;
  wire PS7_i_n_178;
  wire PS7_i_n_179;
  wire PS7_i_n_180;
  wire PS7_i_n_181;
  wire PS7_i_n_182;
  wire PS7_i_n_183;
  wire PS7_i_n_184;
  wire PS7_i_n_185;
  wire PS7_i_n_186;
  wire PS7_i_n_187;
  wire PS7_i_n_188;
  wire PS7_i_n_189;
  wire PS7_i_n_19;
  wire PS7_i_n_190;
  wire PS7_i_n_191;
  wire PS7_i_n_192;
  wire PS7_i_n_193;
  wire PS7_i_n_194;
  wire PS7_i_n_195;
  wire PS7_i_n_196;
  wire PS7_i_n_197;
  wire PS7_i_n_198;
  wire PS7_i_n_199;
  wire PS7_i_n_2;
  wire PS7_i_n_20;
  wire PS7_i_n_200;
  wire PS7_i_n_201;
  wire PS7_i_n_202;
  wire PS7_i_n_203;
  wire PS7_i_n_204;
  wire PS7_i_n_205;
  wire PS7_i_n_206;
  wire PS7_i_n_207;
  wire PS7_i_n_208;
  wire PS7_i_n_209;
  wire PS7_i_n_21;
  wire PS7_i_n_210;
  wire PS7_i_n_211;
  wire PS7_i_n_212;
  wire PS7_i_n_213;
  wire PS7_i_n_214;
  wire PS7_i_n_215;
  wire PS7_i_n_216;
  wire PS7_i_n_217;
  wire PS7_i_n_218;
  wire PS7_i_n_219;
  wire PS7_i_n_22;
  wire PS7_i_n_220;
  wire PS7_i_n_221;
  wire PS7_i_n_222;
  wire PS7_i_n_223;
  wire PS7_i_n_224;
  wire PS7_i_n_225;
  wire PS7_i_n_226;
  wire PS7_i_n_227;
  wire PS7_i_n_228;
  wire PS7_i_n_229;
  wire PS7_i_n_23;
  wire PS7_i_n_230;
  wire PS7_i_n_231;
  wire PS7_i_n_232;
  wire PS7_i_n_233;
  wire PS7_i_n_234;
  wire PS7_i_n_235;
  wire PS7_i_n_236;
  wire PS7_i_n_237;
  wire PS7_i_n_238;
  wire PS7_i_n_239;
  wire PS7_i_n_24;
  wire PS7_i_n_242;
  wire PS7_i_n_243;
  wire PS7_i_n_248;
  wire PS7_i_n_249;
  wire PS7_i_n_25;
  wire PS7_i_n_252;
  wire PS7_i_n_253;
  wire PS7_i_n_254;
  wire PS7_i_n_255;
  wire PS7_i_n_256;
  wire PS7_i_n_257;
  wire PS7_i_n_258;
  wire PS7_i_n_259;
  wire PS7_i_n_26;
  wire PS7_i_n_260;
  wire PS7_i_n_261;
  wire PS7_i_n_262;
  wire PS7_i_n_263;
  wire PS7_i_n_264;
  wire PS7_i_n_265;
  wire PS7_i_n_266;
  wire PS7_i_n_267;
  wire PS7_i_n_268;
  wire PS7_i_n_269;
  wire PS7_i_n_27;
  wire PS7_i_n_270;
  wire PS7_i_n_271;
  wire PS7_i_n_272;
  wire PS7_i_n_273;
  wire PS7_i_n_274;
  wire PS7_i_n_275;
  wire PS7_i_n_276;
  wire PS7_i_n_277;
  wire PS7_i_n_278;
  wire PS7_i_n_279;
  wire PS7_i_n_28;
  wire PS7_i_n_280;
  wire PS7_i_n_281;
  wire PS7_i_n_282;
  wire PS7_i_n_283;
  wire PS7_i_n_284;
  wire PS7_i_n_285;
  wire PS7_i_n_286;
  wire PS7_i_n_287;
  wire PS7_i_n_288;
  wire PS7_i_n_289;
  wire PS7_i_n_290;
  wire PS7_i_n_291;
  wire PS7_i_n_292;
  wire PS7_i_n_293;
  wire PS7_i_n_294;
  wire PS7_i_n_295;
  wire PS7_i_n_296;
  wire PS7_i_n_297;
  wire PS7_i_n_298;
  wire PS7_i_n_299;
  wire PS7_i_n_3;
  wire PS7_i_n_300;
  wire PS7_i_n_301;
  wire PS7_i_n_302;
  wire PS7_i_n_303;
  wire PS7_i_n_304;
  wire PS7_i_n_305;
  wire PS7_i_n_306;
  wire PS7_i_n_307;
  wire PS7_i_n_308;
  wire PS7_i_n_309;
  wire PS7_i_n_31;
  wire PS7_i_n_310;
  wire PS7_i_n_311;
  wire PS7_i_n_312;
  wire PS7_i_n_313;
  wire PS7_i_n_314;
  wire PS7_i_n_315;
  wire PS7_i_n_316;
  wire PS7_i_n_317;
  wire PS7_i_n_318;
  wire PS7_i_n_319;
  wire PS7_i_n_32;
  wire PS7_i_n_320;
  wire PS7_i_n_321;
  wire PS7_i_n_322;
  wire PS7_i_n_323;
  wire PS7_i_n_324;
  wire PS7_i_n_325;
  wire PS7_i_n_326;
  wire PS7_i_n_327;
  wire PS7_i_n_328;
  wire PS7_i_n_329;
  wire PS7_i_n_330;
  wire PS7_i_n_331;
  wire PS7_i_n_332;
  wire PS7_i_n_333;
  wire PS7_i_n_334;
  wire PS7_i_n_335;
  wire PS7_i_n_336;
  wire PS7_i_n_337;
  wire PS7_i_n_338;
  wire PS7_i_n_34;
  wire PS7_i_n_345;
  wire PS7_i_n_346;
  wire PS7_i_n_347;
  wire PS7_i_n_348;
  wire PS7_i_n_349;
  wire PS7_i_n_35;
  wire PS7_i_n_350;
  wire PS7_i_n_351;
  wire PS7_i_n_352;
  wire PS7_i_n_353;
  wire PS7_i_n_354;
  wire PS7_i_n_355;
  wire PS7_i_n_356;
  wire PS7_i_n_357;
  wire PS7_i_n_358;
  wire PS7_i_n_359;
  wire PS7_i_n_36;
  wire PS7_i_n_360;
  wire PS7_i_n_361;
  wire PS7_i_n_362;
  wire PS7_i_n_363;
  wire PS7_i_n_364;
  wire PS7_i_n_365;
  wire PS7_i_n_366;
  wire PS7_i_n_367;
  wire PS7_i_n_368;
  wire PS7_i_n_37;
  wire PS7_i_n_38;
  wire PS7_i_n_39;
  wire PS7_i_n_4;
  wire PS7_i_n_40;
  wire PS7_i_n_401;
  wire PS7_i_n_402;
  wire PS7_i_n_403;
  wire PS7_i_n_404;
  wire PS7_i_n_405;
  wire PS7_i_n_406;
  wire PS7_i_n_407;
  wire PS7_i_n_408;
  wire PS7_i_n_409;
  wire PS7_i_n_41;
  wire PS7_i_n_410;
  wire PS7_i_n_411;
  wire PS7_i_n_412;
  wire PS7_i_n_413;
  wire PS7_i_n_414;
  wire PS7_i_n_415;
  wire PS7_i_n_416;
  wire PS7_i_n_417;
  wire PS7_i_n_418;
  wire PS7_i_n_419;
  wire PS7_i_n_42;
  wire PS7_i_n_420;
  wire PS7_i_n_421;
  wire PS7_i_n_422;
  wire PS7_i_n_423;
  wire PS7_i_n_424;
  wire PS7_i_n_425;
  wire PS7_i_n_426;
  wire PS7_i_n_427;
  wire PS7_i_n_428;
  wire PS7_i_n_429;
  wire PS7_i_n_43;
  wire PS7_i_n_430;
  wire PS7_i_n_431;
  wire PS7_i_n_432;
  wire PS7_i_n_44;
  wire PS7_i_n_46;
  wire PS7_i_n_48;
  wire PS7_i_n_5;
  wire PS7_i_n_50;
  wire PS7_i_n_529;
  wire PS7_i_n_530;
  wire PS7_i_n_531;
  wire PS7_i_n_532;
  wire PS7_i_n_533;
  wire PS7_i_n_534;
  wire PS7_i_n_535;
  wire PS7_i_n_536;
  wire PS7_i_n_537;
  wire PS7_i_n_538;
  wire PS7_i_n_539;
  wire PS7_i_n_54;
  wire PS7_i_n_540;
  wire PS7_i_n_541;
  wire PS7_i_n_542;
  wire PS7_i_n_543;
  wire PS7_i_n_544;
  wire PS7_i_n_545;
  wire PS7_i_n_546;
  wire PS7_i_n_547;
  wire PS7_i_n_548;
  wire PS7_i_n_549;
  wire PS7_i_n_55;
  wire PS7_i_n_550;
  wire PS7_i_n_551;
  wire PS7_i_n_552;
  wire PS7_i_n_553;
  wire PS7_i_n_554;
  wire PS7_i_n_555;
  wire PS7_i_n_556;
  wire PS7_i_n_557;
  wire PS7_i_n_558;
  wire PS7_i_n_559;
  wire PS7_i_n_56;
  wire PS7_i_n_560;
  wire PS7_i_n_561;
  wire PS7_i_n_562;
  wire PS7_i_n_563;
  wire PS7_i_n_564;
  wire PS7_i_n_565;
  wire PS7_i_n_566;
  wire PS7_i_n_567;
  wire PS7_i_n_568;
  wire PS7_i_n_569;
  wire PS7_i_n_570;
  wire PS7_i_n_571;
  wire PS7_i_n_572;
  wire PS7_i_n_573;
  wire PS7_i_n_574;
  wire PS7_i_n_575;
  wire PS7_i_n_576;
  wire PS7_i_n_577;
  wire PS7_i_n_578;
  wire PS7_i_n_579;
  wire PS7_i_n_58;
  wire PS7_i_n_580;
  wire PS7_i_n_581;
  wire PS7_i_n_582;
  wire PS7_i_n_583;
  wire PS7_i_n_584;
  wire PS7_i_n_585;
  wire PS7_i_n_586;
  wire PS7_i_n_587;
  wire PS7_i_n_588;
  wire PS7_i_n_589;
  wire PS7_i_n_59;
  wire PS7_i_n_590;
  wire PS7_i_n_591;
  wire PS7_i_n_592;
  wire PS7_i_n_593;
  wire PS7_i_n_594;
  wire PS7_i_n_595;
  wire PS7_i_n_596;
  wire PS7_i_n_597;
  wire PS7_i_n_598;
  wire PS7_i_n_599;
  wire PS7_i_n_6;
  wire PS7_i_n_60;
  wire PS7_i_n_600;
  wire PS7_i_n_601;
  wire PS7_i_n_602;
  wire PS7_i_n_603;
  wire PS7_i_n_604;
  wire PS7_i_n_605;
  wire PS7_i_n_606;
  wire PS7_i_n_607;
  wire PS7_i_n_608;
  wire PS7_i_n_609;
  wire PS7_i_n_61;
  wire PS7_i_n_610;
  wire PS7_i_n_611;
  wire PS7_i_n_612;
  wire PS7_i_n_613;
  wire PS7_i_n_614;
  wire PS7_i_n_615;
  wire PS7_i_n_616;
  wire PS7_i_n_617;
  wire PS7_i_n_618;
  wire PS7_i_n_619;
  wire PS7_i_n_620;
  wire PS7_i_n_621;
  wire PS7_i_n_622;
  wire PS7_i_n_623;
  wire PS7_i_n_624;
  wire PS7_i_n_625;
  wire PS7_i_n_626;
  wire PS7_i_n_627;
  wire PS7_i_n_628;
  wire PS7_i_n_629;
  wire PS7_i_n_63;
  wire PS7_i_n_630;
  wire PS7_i_n_631;
  wire PS7_i_n_632;
  wire PS7_i_n_633;
  wire PS7_i_n_634;
  wire PS7_i_n_635;
  wire PS7_i_n_636;
  wire PS7_i_n_637;
  wire PS7_i_n_638;
  wire PS7_i_n_639;
  wire PS7_i_n_64;
  wire PS7_i_n_640;
  wire PS7_i_n_641;
  wire PS7_i_n_642;
  wire PS7_i_n_643;
  wire PS7_i_n_644;
  wire PS7_i_n_645;
  wire PS7_i_n_646;
  wire PS7_i_n_647;
  wire PS7_i_n_648;
  wire PS7_i_n_649;
  wire PS7_i_n_650;
  wire PS7_i_n_651;
  wire PS7_i_n_652;
  wire PS7_i_n_653;
  wire PS7_i_n_654;
  wire PS7_i_n_655;
  wire PS7_i_n_656;
  wire PS7_i_n_657;
  wire PS7_i_n_658;
  wire PS7_i_n_659;
  wire PS7_i_n_66;
  wire PS7_i_n_660;
  wire PS7_i_n_661;
  wire PS7_i_n_662;
  wire PS7_i_n_663;
  wire PS7_i_n_664;
  wire PS7_i_n_665;
  wire PS7_i_n_666;
  wire PS7_i_n_667;
  wire PS7_i_n_668;
  wire PS7_i_n_669;
  wire PS7_i_n_670;
  wire PS7_i_n_671;
  wire PS7_i_n_672;
  wire PS7_i_n_673;
  wire PS7_i_n_674;
  wire PS7_i_n_675;
  wire PS7_i_n_676;
  wire PS7_i_n_677;
  wire PS7_i_n_678;
  wire PS7_i_n_679;
  wire PS7_i_n_68;
  wire PS7_i_n_680;
  wire PS7_i_n_681;
  wire PS7_i_n_682;
  wire PS7_i_n_683;
  wire PS7_i_n_684;
  wire PS7_i_n_685;
  wire PS7_i_n_686;
  wire PS7_i_n_687;
  wire PS7_i_n_688;
  wire PS7_i_n_689;
  wire PS7_i_n_690;
  wire PS7_i_n_691;
  wire PS7_i_n_692;
  wire PS7_i_n_697;
  wire PS7_i_n_698;
  wire PS7_i_n_699;
  wire PS7_i_n_7;
  wire PS7_i_n_700;
  wire PS7_i_n_705;
  wire PS7_i_n_706;
  wire PS7_i_n_709;
  wire PS7_i_n_71;
  wire PS7_i_n_710;
  wire PS7_i_n_711;
  wire PS7_i_n_713;
  wire PS7_i_n_714;
  wire PS7_i_n_715;
  wire PS7_i_n_716;
  wire PS7_i_n_717;
  wire PS7_i_n_718;
  wire PS7_i_n_719;
  wire PS7_i_n_720;
  wire PS7_i_n_721;
  wire PS7_i_n_722;
  wire PS7_i_n_724;
  wire PS7_i_n_729;
  wire PS7_i_n_73;
  wire PS7_i_n_730;
  wire PS7_i_n_731;
  wire PS7_i_n_732;
  wire PS7_i_n_733;
  wire PS7_i_n_734;
  wire PS7_i_n_736;
  wire PS7_i_n_741;
  wire PS7_i_n_742;
  wire PS7_i_n_743;
  wire PS7_i_n_744;
  wire PS7_i_n_749;
  wire PS7_i_n_75;
  wire PS7_i_n_750;
  wire PS7_i_n_752;
  wire PS7_i_n_753;
  wire PS7_i_n_754;
  wire PS7_i_n_755;
  wire PS7_i_n_756;
  wire PS7_i_n_757;
  wire PS7_i_n_758;
  wire PS7_i_n_759;
  wire PS7_i_n_760;
  wire PS7_i_n_761;
  wire PS7_i_n_762;
  wire PS7_i_n_764;
  wire PS7_i_n_765;
  wire PS7_i_n_766;
  wire PS7_i_n_767;
  wire PS7_i_n_768;
  wire PS7_i_n_769;
  wire PS7_i_n_770;
  wire PS7_i_n_771;
  wire PS7_i_n_772;
  wire PS7_i_n_773;
  wire PS7_i_n_774;
  wire PS7_i_n_775;
  wire PS7_i_n_776;
  wire PS7_i_n_777;
  wire PS7_i_n_778;
  wire PS7_i_n_779;
  wire PS7_i_n_780;
  wire PS7_i_n_781;
  wire PS7_i_n_782;
  wire PS7_i_n_783;
  wire PS7_i_n_784;
  wire PS7_i_n_785;
  wire PS7_i_n_786;
  wire PS7_i_n_787;
  wire PS7_i_n_788;
  wire PS7_i_n_789;
  wire PS7_i_n_79;
  wire PS7_i_n_790;
  wire PS7_i_n_791;
  wire PS7_i_n_792;
  wire PS7_i_n_793;
  wire PS7_i_n_794;
  wire PS7_i_n_795;
  wire PS7_i_n_796;
  wire PS7_i_n_797;
  wire PS7_i_n_798;
  wire PS7_i_n_799;
  wire PS7_i_n_8;
  wire PS7_i_n_80;
  wire PS7_i_n_800;
  wire PS7_i_n_801;
  wire PS7_i_n_802;
  wire PS7_i_n_803;
  wire PS7_i_n_804;
  wire PS7_i_n_805;
  wire PS7_i_n_806;
  wire PS7_i_n_807;
  wire PS7_i_n_808;
  wire PS7_i_n_809;
  wire PS7_i_n_81;
  wire PS7_i_n_810;
  wire PS7_i_n_811;
  wire PS7_i_n_812;
  wire PS7_i_n_813;
  wire PS7_i_n_814;
  wire PS7_i_n_815;
  wire PS7_i_n_816;
  wire PS7_i_n_817;
  wire PS7_i_n_818;
  wire PS7_i_n_819;
  wire PS7_i_n_82;
  wire PS7_i_n_820;
  wire PS7_i_n_821;
  wire PS7_i_n_822;
  wire PS7_i_n_823;
  wire PS7_i_n_824;
  wire PS7_i_n_825;
  wire PS7_i_n_826;
  wire PS7_i_n_827;
  wire PS7_i_n_828;
  wire PS7_i_n_829;
  wire PS7_i_n_83;
  wire PS7_i_n_830;
  wire PS7_i_n_831;
  wire PS7_i_n_832;
  wire PS7_i_n_833;
  wire PS7_i_n_834;
  wire PS7_i_n_835;
  wire PS7_i_n_836;
  wire PS7_i_n_837;
  wire PS7_i_n_838;
  wire PS7_i_n_839;
  wire PS7_i_n_84;
  wire PS7_i_n_840;
  wire PS7_i_n_841;
  wire PS7_i_n_842;
  wire PS7_i_n_843;
  wire PS7_i_n_844;
  wire PS7_i_n_845;
  wire PS7_i_n_846;
  wire PS7_i_n_847;
  wire PS7_i_n_848;
  wire PS7_i_n_849;
  wire PS7_i_n_85;
  wire PS7_i_n_850;
  wire PS7_i_n_851;
  wire PS7_i_n_852;
  wire PS7_i_n_853;
  wire PS7_i_n_854;
  wire PS7_i_n_855;
  wire PS7_i_n_856;
  wire PS7_i_n_857;
  wire PS7_i_n_858;
  wire PS7_i_n_859;
  wire PS7_i_n_86;
  wire PS7_i_n_860;
  wire PS7_i_n_861;
  wire PS7_i_n_862;
  wire PS7_i_n_863;
  wire PS7_i_n_864;
  wire PS7_i_n_865;
  wire PS7_i_n_866;
  wire PS7_i_n_867;
  wire PS7_i_n_868;
  wire PS7_i_n_869;
  wire PS7_i_n_87;
  wire PS7_i_n_870;
  wire PS7_i_n_871;
  wire PS7_i_n_872;
  wire PS7_i_n_873;
  wire PS7_i_n_874;
  wire PS7_i_n_875;
  wire PS7_i_n_876;
  wire PS7_i_n_877;
  wire PS7_i_n_878;
  wire PS7_i_n_879;
  wire PS7_i_n_88;
  wire PS7_i_n_880;
  wire PS7_i_n_881;
  wire PS7_i_n_882;
  wire PS7_i_n_883;
  wire PS7_i_n_884;
  wire PS7_i_n_885;
  wire PS7_i_n_886;
  wire PS7_i_n_887;
  wire PS7_i_n_888;
  wire PS7_i_n_889;
  wire PS7_i_n_89;
  wire PS7_i_n_890;
  wire PS7_i_n_891;
  wire PS7_i_n_892;
  wire PS7_i_n_893;
  wire PS7_i_n_894;
  wire PS7_i_n_895;
  wire PS7_i_n_896;
  wire PS7_i_n_897;
  wire PS7_i_n_898;
  wire PS7_i_n_899;
  wire PS7_i_n_9;
  wire PS7_i_n_900;
  wire PS7_i_n_901;
  wire PS7_i_n_902;
  wire PS7_i_n_903;
  wire PS7_i_n_904;
  wire PS7_i_n_905;
  wire PS7_i_n_906;
  wire PS7_i_n_907;
  wire PS7_i_n_908;
  wire PS7_i_n_909;
  wire PS7_i_n_910;
  wire PS7_i_n_911;
  wire PS7_i_n_912;
  wire PS7_i_n_913;
  wire PS7_i_n_914;
  wire PS7_i_n_915;
  wire PS7_i_n_916;
  wire PS7_i_n_917;
  wire PS7_i_n_918;
  wire PS7_i_n_919;
  wire PS7_i_n_920;
  wire PS7_i_n_921;
  wire PS7_i_n_922;
  wire PS7_i_n_923;
  wire PS7_i_n_924;
  wire PS7_i_n_925;
  wire PS7_i_n_926;
  wire PS7_i_n_927;
  wire PS7_i_n_928;
  wire PS7_i_n_929;
  wire PS7_i_n_930;
  wire PS7_i_n_931;
  wire PS7_i_n_932;
  wire PS7_i_n_933;
  wire PS7_i_n_934;
  wire PS7_i_n_935;
  wire PS7_i_n_936;
  wire PS7_i_n_94;
  wire PS7_i_n_96;
  wire PS7_i_n_97;
  wire PS7_i_n_98;
  wire PS7_i_n_99;
  wire PS_CLK;
  wire PS_PORB;
  wire PS_SRSTB;
  wire SDIO0_CMD_T_n;
  wire [3:0]SDIO0_DATA_T_n;
  wire SDIO1_CMD_T_n;
  wire [3:0]SDIO1_DATA_T_n;
  wire SPI0_MISO_T_n;
  wire SPI0_MOSI_T_n;
  wire SPI0_SCLK_T_n;
  wire SPI0_SS_T_n;
  wire SPI1_MISO_T_n;
  wire SPI1_MOSI_T_n;
  wire SPI1_SCLK_T_n;
  wire SPI1_SS_T_n;
  (* RTL_KEEP = "true" *) wire \TRACE_CTL_PIPE[0] ;
  (* RTL_KEEP = "true" *) wire \TRACE_CTL_PIPE[1] ;
  (* RTL_KEEP = "true" *) wire \TRACE_CTL_PIPE[2] ;
  (* RTL_KEEP = "true" *) wire \TRACE_CTL_PIPE[3] ;
  (* RTL_KEEP = "true" *) wire \TRACE_CTL_PIPE[4] ;
  (* RTL_KEEP = "true" *) wire \TRACE_CTL_PIPE[5] ;
  (* RTL_KEEP = "true" *) wire \TRACE_CTL_PIPE[6] ;
  (* RTL_KEEP = "true" *) wire \TRACE_CTL_PIPE[7] ;
  (* RTL_KEEP = "true" *) wire [1:0]\TRACE_DATA_PIPE[0] ;
  (* RTL_KEEP = "true" *) wire [1:0]\TRACE_DATA_PIPE[1] ;
  (* RTL_KEEP = "true" *) wire [1:0]\TRACE_DATA_PIPE[2] ;
  (* RTL_KEEP = "true" *) wire [1:0]\TRACE_DATA_PIPE[3] ;
  (* RTL_KEEP = "true" *) wire [1:0]\TRACE_DATA_PIPE[4] ;
  (* RTL_KEEP = "true" *) wire [1:0]\TRACE_DATA_PIPE[5] ;
  (* RTL_KEEP = "true" *) wire [1:0]\TRACE_DATA_PIPE[6] ;
  (* RTL_KEEP = "true" *) wire [1:0]\TRACE_DATA_PIPE[7] ;
  wire [14:0]buffered_DDR_Addr;
  wire [2:0]buffered_DDR_BankAddr;
  wire buffered_DDR_CAS_n;
  wire buffered_DDR_CKE;
  wire buffered_DDR_CS_n;
  wire buffered_DDR_Clk;
  wire buffered_DDR_Clk_n;
  wire [3:0]buffered_DDR_DM;
  wire [31:0]buffered_DDR_DQ;
  wire [3:0]buffered_DDR_DQS;
  wire [3:0]buffered_DDR_DQS_n;
  wire buffered_DDR_DRSTB;
  wire buffered_DDR_ODT;
  wire buffered_DDR_RAS_n;
  wire buffered_DDR_VRN;
  wire buffered_DDR_VRP;
  wire buffered_DDR_WEB;
  wire [53:0]buffered_MIO;
  wire buffered_PS_CLK;
  wire buffered_PS_PORB;
  wire buffered_PS_SRSTB;
  wire [63:0]gpio_out_t_n;
  wire NLW_PS7_i_EMIOENET0GMIITXEN_UNCONNECTED;
  wire NLW_PS7_i_EMIOENET0GMIITXER_UNCONNECTED;
  wire NLW_PS7_i_EMIOENET1GMIITXEN_UNCONNECTED;
  wire NLW_PS7_i_EMIOENET1GMIITXER_UNCONNECTED;
  wire NLW_PS7_i_EMIOPJTAGTDO_UNCONNECTED;
  wire NLW_PS7_i_EMIOPJTAGTDTN_UNCONNECTED;
  wire NLW_PS7_i_EMIOTRACECTL_UNCONNECTED;
  wire [7:0]NLW_PS7_i_EMIOENET0GMIITXD_UNCONNECTED;
  wire [7:0]NLW_PS7_i_EMIOENET1GMIITXD_UNCONNECTED;
  wire [31:0]NLW_PS7_i_EMIOTRACEDATA_UNCONNECTED;
  wire [1:1]NLW_PS7_i_MAXIGP0ARCACHE_UNCONNECTED;
  wire [1:1]NLW_PS7_i_MAXIGP0AWCACHE_UNCONNECTED;
  wire [1:1]NLW_PS7_i_MAXIGP1ARCACHE_UNCONNECTED;
  wire [1:1]NLW_PS7_i_MAXIGP1AWCACHE_UNCONNECTED;

  assign CAN0_PHY_TX = \<const0> ;
  assign CAN1_PHY_TX = \<const0> ;
  assign DMA0_DATYPE[1] = \<const0> ;
  assign DMA0_DATYPE[0] = \<const0> ;
  assign DMA0_DAVALID = \<const0> ;
  assign DMA0_DRREADY = \<const0> ;
  assign DMA0_RSTN = \<const0> ;
  assign DMA1_DATYPE[1] = \<const0> ;
  assign DMA1_DATYPE[0] = \<const0> ;
  assign DMA1_DAVALID = \<const0> ;
  assign DMA1_DRREADY = \<const0> ;
  assign DMA1_RSTN = \<const0> ;
  assign DMA2_DATYPE[1] = \<const0> ;
  assign DMA2_DATYPE[0] = \<const0> ;
  assign DMA2_DAVALID = \<const0> ;
  assign DMA2_DRREADY = \<const0> ;
  assign DMA2_RSTN = \<const0> ;
  assign DMA3_DATYPE[1] = \<const0> ;
  assign DMA3_DATYPE[0] = \<const0> ;
  assign DMA3_DAVALID = \<const0> ;
  assign DMA3_DRREADY = \<const0> ;
  assign DMA3_RSTN = \<const0> ;
  assign ENET0_GMII_TXD[7] = \<const0> ;
  assign ENET0_GMII_TXD[6] = \<const0> ;
  assign ENET0_GMII_TXD[5] = \<const0> ;
  assign ENET0_GMII_TXD[4] = \<const0> ;
  assign ENET0_GMII_TXD[3] = \<const0> ;
  assign ENET0_GMII_TXD[2] = \<const0> ;
  assign ENET0_GMII_TXD[1] = \<const0> ;
  assign ENET0_GMII_TXD[0] = \<const0> ;
  assign ENET0_GMII_TX_EN = \<const0> ;
  assign ENET0_GMII_TX_ER = \<const0> ;
  assign ENET0_MDIO_MDC = \<const0> ;
  assign ENET0_MDIO_O = \<const0> ;
  assign ENET0_MDIO_T = \<const0> ;
  assign ENET0_PTP_DELAY_REQ_RX = \<const0> ;
  assign ENET0_PTP_DELAY_REQ_TX = \<const0> ;
  assign ENET0_PTP_PDELAY_REQ_RX = \<const0> ;
  assign ENET0_PTP_PDELAY_REQ_TX = \<const0> ;
  assign ENET0_PTP_PDELAY_RESP_RX = \<const0> ;
  assign ENET0_PTP_PDELAY_RESP_TX = \<const0> ;
  assign ENET0_PTP_SYNC_FRAME_RX = \<const0> ;
  assign ENET0_PTP_SYNC_FRAME_TX = \<const0> ;
  assign ENET0_SOF_RX = \<const0> ;
  assign ENET0_SOF_TX = \<const0> ;
  assign ENET1_GMII_TXD[7] = \<const0> ;
  assign ENET1_GMII_TXD[6] = \<const0> ;
  assign ENET1_GMII_TXD[5] = \<const0> ;
  assign ENET1_GMII_TXD[4] = \<const0> ;
  assign ENET1_GMII_TXD[3] = \<const0> ;
  assign ENET1_GMII_TXD[2] = \<const0> ;
  assign ENET1_GMII_TXD[1] = \<const0> ;
  assign ENET1_GMII_TXD[0] = \<const0> ;
  assign ENET1_GMII_TX_EN = \<const0> ;
  assign ENET1_GMII_TX_ER = \<const0> ;
  assign ENET1_MDIO_MDC = \<const0> ;
  assign ENET1_MDIO_O = \<const0> ;
  assign ENET1_MDIO_T = \<const0> ;
  assign ENET1_PTP_DELAY_REQ_RX = \<const0> ;
  assign ENET1_PTP_DELAY_REQ_TX = \<const0> ;
  assign ENET1_PTP_PDELAY_REQ_RX = \<const0> ;
  assign ENET1_PTP_PDELAY_REQ_TX = \<const0> ;
  assign ENET1_PTP_PDELAY_RESP_RX = \<const0> ;
  assign ENET1_PTP_PDELAY_RESP_TX = \<const0> ;
  assign ENET1_PTP_SYNC_FRAME_RX = \<const0> ;
  assign ENET1_PTP_SYNC_FRAME_TX = \<const0> ;
  assign ENET1_SOF_RX = \<const0> ;
  assign ENET1_SOF_TX = \<const0> ;
  assign EVENT_EVENTO = \<const0> ;
  assign EVENT_STANDBYWFE[1] = \<const0> ;
  assign EVENT_STANDBYWFE[0] = \<const0> ;
  assign EVENT_STANDBYWFI[1] = \<const0> ;
  assign EVENT_STANDBYWFI[0] = \<const0> ;
  assign FCLK_CLK2 = \<const0> ;
  assign FCLK_CLK3 = \<const0> ;
  assign FCLK_RESET1_N = \<const0> ;
  assign FCLK_RESET2_N = \<const0> ;
  assign FCLK_RESET3_N = \<const0> ;
  assign FTMT_F2P_TRIGACK_0 = \<const0> ;
  assign FTMT_F2P_TRIGACK_1 = \<const0> ;
  assign FTMT_F2P_TRIGACK_2 = \<const0> ;
  assign FTMT_F2P_TRIGACK_3 = \<const0> ;
  assign FTMT_P2F_DEBUG[31] = \<const0> ;
  assign FTMT_P2F_DEBUG[30] = \<const0> ;
  assign FTMT_P2F_DEBUG[29] = \<const0> ;
  assign FTMT_P2F_DEBUG[28] = \<const0> ;
  assign FTMT_P2F_DEBUG[27] = \<const0> ;
  assign FTMT_P2F_DEBUG[26] = \<const0> ;
  assign FTMT_P2F_DEBUG[25] = \<const0> ;
  assign FTMT_P2F_DEBUG[24] = \<const0> ;
  assign FTMT_P2F_DEBUG[23] = \<const0> ;
  assign FTMT_P2F_DEBUG[22] = \<const0> ;
  assign FTMT_P2F_DEBUG[21] = \<const0> ;
  assign FTMT_P2F_DEBUG[20] = \<const0> ;
  assign FTMT_P2F_DEBUG[19] = \<const0> ;
  assign FTMT_P2F_DEBUG[18] = \<const0> ;
  assign FTMT_P2F_DEBUG[17] = \<const0> ;
  assign FTMT_P2F_DEBUG[16] = \<const0> ;
  assign FTMT_P2F_DEBUG[15] = \<const0> ;
  assign FTMT_P2F_DEBUG[14] = \<const0> ;
  assign FTMT_P2F_DEBUG[13] = \<const0> ;
  assign FTMT_P2F_DEBUG[12] = \<const0> ;
  assign FTMT_P2F_DEBUG[11] = \<const0> ;
  assign FTMT_P2F_DEBUG[10] = \<const0> ;
  assign FTMT_P2F_DEBUG[9] = \<const0> ;
  assign FTMT_P2F_DEBUG[8] = \<const0> ;
  assign FTMT_P2F_DEBUG[7] = \<const0> ;
  assign FTMT_P2F_DEBUG[6] = \<const0> ;
  assign FTMT_P2F_DEBUG[5] = \<const0> ;
  assign FTMT_P2F_DEBUG[4] = \<const0> ;
  assign FTMT_P2F_DEBUG[3] = \<const0> ;
  assign FTMT_P2F_DEBUG[2] = \<const0> ;
  assign FTMT_P2F_DEBUG[1] = \<const0> ;
  assign FTMT_P2F_DEBUG[0] = \<const0> ;
  assign FTMT_P2F_TRIG_0 = \<const0> ;
  assign FTMT_P2F_TRIG_1 = \<const0> ;
  assign FTMT_P2F_TRIG_2 = \<const0> ;
  assign FTMT_P2F_TRIG_3 = \<const0> ;
  assign GPIO_O[63] = \<const0> ;
  assign GPIO_O[62] = \<const0> ;
  assign GPIO_O[61] = \<const0> ;
  assign GPIO_O[60] = \<const0> ;
  assign GPIO_O[59] = \<const0> ;
  assign GPIO_O[58] = \<const0> ;
  assign GPIO_O[57] = \<const0> ;
  assign GPIO_O[56] = \<const0> ;
  assign GPIO_O[55] = \<const0> ;
  assign GPIO_O[54] = \<const0> ;
  assign GPIO_O[53] = \<const0> ;
  assign GPIO_O[52] = \<const0> ;
  assign GPIO_O[51] = \<const0> ;
  assign GPIO_O[50] = \<const0> ;
  assign GPIO_O[49] = \<const0> ;
  assign GPIO_O[48] = \<const0> ;
  assign GPIO_O[47] = \<const0> ;
  assign GPIO_O[46] = \<const0> ;
  assign GPIO_O[45] = \<const0> ;
  assign GPIO_O[44] = \<const0> ;
  assign GPIO_O[43] = \<const0> ;
  assign GPIO_O[42] = \<const0> ;
  assign GPIO_O[41] = \<const0> ;
  assign GPIO_O[40] = \<const0> ;
  assign GPIO_O[39] = \<const0> ;
  assign GPIO_O[38] = \<const0> ;
  assign GPIO_O[37] = \<const0> ;
  assign GPIO_O[36] = \<const0> ;
  assign GPIO_O[35] = \<const0> ;
  assign GPIO_O[34] = \<const0> ;
  assign GPIO_O[33] = \<const0> ;
  assign GPIO_O[32] = \<const0> ;
  assign GPIO_O[31] = \<const0> ;
  assign GPIO_O[30] = \<const0> ;
  assign GPIO_O[29] = \<const0> ;
  assign GPIO_O[28] = \<const0> ;
  assign GPIO_O[27] = \<const0> ;
  assign GPIO_O[26] = \<const0> ;
  assign GPIO_O[25] = \<const0> ;
  assign GPIO_O[24] = \<const0> ;
  assign GPIO_O[23] = \<const0> ;
  assign GPIO_O[22] = \<const0> ;
  assign GPIO_O[21] = \<const0> ;
  assign GPIO_O[20] = \<const0> ;
  assign GPIO_O[19] = \<const0> ;
  assign GPIO_O[18] = \<const0> ;
  assign GPIO_O[17] = \<const0> ;
  assign GPIO_O[16] = \<const0> ;
  assign GPIO_O[15] = \<const0> ;
  assign GPIO_O[14] = \<const0> ;
  assign GPIO_O[13] = \<const0> ;
  assign GPIO_O[12] = \<const0> ;
  assign GPIO_O[11] = \<const0> ;
  assign GPIO_O[10] = \<const0> ;
  assign GPIO_O[9] = \<const0> ;
  assign GPIO_O[8] = \<const0> ;
  assign GPIO_O[7] = \<const0> ;
  assign GPIO_O[6] = \<const0> ;
  assign GPIO_O[5] = \<const0> ;
  assign GPIO_O[4] = \<const0> ;
  assign GPIO_O[3] = \<const0> ;
  assign GPIO_O[2] = \<const0> ;
  assign GPIO_O[1] = \<const0> ;
  assign GPIO_O[0] = \<const0> ;
  assign GPIO_T[63] = \<const0> ;
  assign GPIO_T[62] = \<const0> ;
  assign GPIO_T[61] = \<const0> ;
  assign GPIO_T[60] = \<const0> ;
  assign GPIO_T[59] = \<const0> ;
  assign GPIO_T[58] = \<const0> ;
  assign GPIO_T[57] = \<const0> ;
  assign GPIO_T[56] = \<const0> ;
  assign GPIO_T[55] = \<const0> ;
  assign GPIO_T[54] = \<const0> ;
  assign GPIO_T[53] = \<const0> ;
  assign GPIO_T[52] = \<const0> ;
  assign GPIO_T[51] = \<const0> ;
  assign GPIO_T[50] = \<const0> ;
  assign GPIO_T[49] = \<const0> ;
  assign GPIO_T[48] = \<const0> ;
  assign GPIO_T[47] = \<const0> ;
  assign GPIO_T[46] = \<const0> ;
  assign GPIO_T[45] = \<const0> ;
  assign GPIO_T[44] = \<const0> ;
  assign GPIO_T[43] = \<const0> ;
  assign GPIO_T[42] = \<const0> ;
  assign GPIO_T[41] = \<const0> ;
  assign GPIO_T[40] = \<const0> ;
  assign GPIO_T[39] = \<const0> ;
  assign GPIO_T[38] = \<const0> ;
  assign GPIO_T[37] = \<const0> ;
  assign GPIO_T[36] = \<const0> ;
  assign GPIO_T[35] = \<const0> ;
  assign GPIO_T[34] = \<const0> ;
  assign GPIO_T[33] = \<const0> ;
  assign GPIO_T[32] = \<const0> ;
  assign GPIO_T[31] = \<const0> ;
  assign GPIO_T[30] = \<const0> ;
  assign GPIO_T[29] = \<const0> ;
  assign GPIO_T[28] = \<const0> ;
  assign GPIO_T[27] = \<const0> ;
  assign GPIO_T[26] = \<const0> ;
  assign GPIO_T[25] = \<const0> ;
  assign GPIO_T[24] = \<const0> ;
  assign GPIO_T[23] = \<const0> ;
  assign GPIO_T[22] = \<const0> ;
  assign GPIO_T[21] = \<const0> ;
  assign GPIO_T[20] = \<const0> ;
  assign GPIO_T[19] = \<const0> ;
  assign GPIO_T[18] = \<const0> ;
  assign GPIO_T[17] = \<const0> ;
  assign GPIO_T[16] = \<const0> ;
  assign GPIO_T[15] = \<const0> ;
  assign GPIO_T[14] = \<const0> ;
  assign GPIO_T[13] = \<const0> ;
  assign GPIO_T[12] = \<const0> ;
  assign GPIO_T[11] = \<const0> ;
  assign GPIO_T[10] = \<const0> ;
  assign GPIO_T[9] = \<const0> ;
  assign GPIO_T[8] = \<const0> ;
  assign GPIO_T[7] = \<const0> ;
  assign GPIO_T[6] = \<const0> ;
  assign GPIO_T[5] = \<const0> ;
  assign GPIO_T[4] = \<const0> ;
  assign GPIO_T[3] = \<const0> ;
  assign GPIO_T[2] = \<const0> ;
  assign GPIO_T[1] = \<const0> ;
  assign GPIO_T[0] = \<const0> ;
  assign I2C0_SCL_O = \<const0> ;
  assign I2C0_SCL_T = \<const0> ;
  assign I2C0_SDA_O = \<const0> ;
  assign I2C0_SDA_T = \<const0> ;
  assign I2C1_SCL_O = \<const0> ;
  assign I2C1_SCL_T = \<const0> ;
  assign I2C1_SDA_O = \<const0> ;
  assign I2C1_SDA_T = \<const0> ;
  assign IRQ_P2F_CAN0 = \<const0> ;
  assign IRQ_P2F_CAN1 = \<const0> ;
  assign IRQ_P2F_CTI = \<const0> ;
  assign IRQ_P2F_DMAC0 = \<const0> ;
  assign IRQ_P2F_DMAC1 = \<const0> ;
  assign IRQ_P2F_DMAC2 = \<const0> ;
  assign IRQ_P2F_DMAC3 = \<const0> ;
  assign IRQ_P2F_DMAC4 = \<const0> ;
  assign IRQ_P2F_DMAC5 = \<const0> ;
  assign IRQ_P2F_DMAC6 = \<const0> ;
  assign IRQ_P2F_DMAC7 = \<const0> ;
  assign IRQ_P2F_DMAC_ABORT = \<const0> ;
  assign IRQ_P2F_ENET0 = \<const0> ;
  assign IRQ_P2F_ENET1 = \<const0> ;
  assign IRQ_P2F_ENET_WAKE0 = \<const0> ;
  assign IRQ_P2F_ENET_WAKE1 = \<const0> ;
  assign IRQ_P2F_GPIO = \<const0> ;
  assign IRQ_P2F_I2C0 = \<const0> ;
  assign IRQ_P2F_I2C1 = \<const0> ;
  assign IRQ_P2F_QSPI = \<const0> ;
  assign IRQ_P2F_SDIO0 = \<const0> ;
  assign IRQ_P2F_SDIO1 = \<const0> ;
  assign IRQ_P2F_SMC = \<const0> ;
  assign IRQ_P2F_SPI0 = \<const0> ;
  assign IRQ_P2F_SPI1 = \<const0> ;
  assign IRQ_P2F_UART0 = \<const0> ;
  assign IRQ_P2F_UART1 = \<const0> ;
  assign IRQ_P2F_USB0 = \<const0> ;
  assign IRQ_P2F_USB1 = \<const0> ;
  assign M_AXI_GP0_ARCACHE[3] = \<const0> ;
  assign M_AXI_GP0_ARCACHE[2] = \<const0> ;
  assign M_AXI_GP0_ARCACHE[1] = \<const0> ;
  assign M_AXI_GP0_ARCACHE[0] = \<const0> ;
  assign M_AXI_GP0_ARESETN = \<const0> ;
  assign M_AXI_GP0_ARLOCK[1] = \<const0> ;
  assign M_AXI_GP0_ARLOCK[0] = \<const0> ;
  assign M_AXI_GP0_ARQOS[3] = \<const0> ;
  assign M_AXI_GP0_ARQOS[2] = \<const0> ;
  assign M_AXI_GP0_ARQOS[1] = \<const0> ;
  assign M_AXI_GP0_ARQOS[0] = \<const0> ;
  assign M_AXI_GP0_ARSIZE[2] = \<const0> ;
  assign M_AXI_GP0_ARSIZE[1:0] = \^M_AXI_GP0_ARSIZE [1:0];
  assign M_AXI_GP0_AWCACHE[3] = \<const0> ;
  assign M_AXI_GP0_AWCACHE[2] = \<const0> ;
  assign M_AXI_GP0_AWCACHE[1] = \<const0> ;
  assign M_AXI_GP0_AWCACHE[0] = \<const0> ;
  assign M_AXI_GP0_AWLOCK[1] = \<const0> ;
  assign M_AXI_GP0_AWLOCK[0] = \<const0> ;
  assign M_AXI_GP0_AWQOS[3] = \<const0> ;
  assign M_AXI_GP0_AWQOS[2] = \<const0> ;
  assign M_AXI_GP0_AWQOS[1] = \<const0> ;
  assign M_AXI_GP0_AWQOS[0] = \<const0> ;
  assign M_AXI_GP0_AWSIZE[2] = \<const0> ;
  assign M_AXI_GP0_AWSIZE[1:0] = \^M_AXI_GP0_AWSIZE [1:0];
  assign M_AXI_GP0_WID[11] = \<const0> ;
  assign M_AXI_GP0_WID[10] = \<const0> ;
  assign M_AXI_GP0_WID[9] = \<const0> ;
  assign M_AXI_GP0_WID[8] = \<const0> ;
  assign M_AXI_GP0_WID[7] = \<const0> ;
  assign M_AXI_GP0_WID[6] = \<const0> ;
  assign M_AXI_GP0_WID[5] = \<const0> ;
  assign M_AXI_GP0_WID[4] = \<const0> ;
  assign M_AXI_GP0_WID[3] = \<const0> ;
  assign M_AXI_GP0_WID[2] = \<const0> ;
  assign M_AXI_GP0_WID[1] = \<const0> ;
  assign M_AXI_GP0_WID[0] = \<const0> ;
  assign M_AXI_GP0_WLAST = \<const0> ;
  assign M_AXI_GP1_ARADDR[31] = \<const0> ;
  assign M_AXI_GP1_ARADDR[30] = \<const0> ;
  assign M_AXI_GP1_ARADDR[29] = \<const0> ;
  assign M_AXI_GP1_ARADDR[28] = \<const0> ;
  assign M_AXI_GP1_ARADDR[27] = \<const0> ;
  assign M_AXI_GP1_ARADDR[26] = \<const0> ;
  assign M_AXI_GP1_ARADDR[25] = \<const0> ;
  assign M_AXI_GP1_ARADDR[24] = \<const0> ;
  assign M_AXI_GP1_ARADDR[23] = \<const0> ;
  assign M_AXI_GP1_ARADDR[22] = \<const0> ;
  assign M_AXI_GP1_ARADDR[21] = \<const0> ;
  assign M_AXI_GP1_ARADDR[20] = \<const0> ;
  assign M_AXI_GP1_ARADDR[19] = \<const0> ;
  assign M_AXI_GP1_ARADDR[18] = \<const0> ;
  assign M_AXI_GP1_ARADDR[17] = \<const0> ;
  assign M_AXI_GP1_ARADDR[16] = \<const0> ;
  assign M_AXI_GP1_ARADDR[15] = \<const0> ;
  assign M_AXI_GP1_ARADDR[14] = \<const0> ;
  assign M_AXI_GP1_ARADDR[13] = \<const0> ;
  assign M_AXI_GP1_ARADDR[12] = \<const0> ;
  assign M_AXI_GP1_ARADDR[11] = \<const0> ;
  assign M_AXI_GP1_ARADDR[10] = \<const0> ;
  assign M_AXI_GP1_ARADDR[9] = \<const0> ;
  assign M_AXI_GP1_ARADDR[8] = \<const0> ;
  assign M_AXI_GP1_ARADDR[7] = \<const0> ;
  assign M_AXI_GP1_ARADDR[6] = \<const0> ;
  assign M_AXI_GP1_ARADDR[5] = \<const0> ;
  assign M_AXI_GP1_ARADDR[4] = \<const0> ;
  assign M_AXI_GP1_ARADDR[3] = \<const0> ;
  assign M_AXI_GP1_ARADDR[2] = \<const0> ;
  assign M_AXI_GP1_ARADDR[1] = \<const0> ;
  assign M_AXI_GP1_ARADDR[0] = \<const0> ;
  assign M_AXI_GP1_ARBURST[1] = \<const0> ;
  assign M_AXI_GP1_ARBURST[0] = \<const0> ;
  assign M_AXI_GP1_ARCACHE[3] = \<const0> ;
  assign M_AXI_GP1_ARCACHE[2] = \<const0> ;
  assign M_AXI_GP1_ARCACHE[1] = \<const0> ;
  assign M_AXI_GP1_ARCACHE[0] = \<const0> ;
  assign M_AXI_GP1_ARESETN = \<const0> ;
  assign M_AXI_GP1_ARID[11] = \<const0> ;
  assign M_AXI_GP1_ARID[10] = \<const0> ;
  assign M_AXI_GP1_ARID[9] = \<const0> ;
  assign M_AXI_GP1_ARID[8] = \<const0> ;
  assign M_AXI_GP1_ARID[7] = \<const0> ;
  assign M_AXI_GP1_ARID[6] = \<const0> ;
  assign M_AXI_GP1_ARID[5] = \<const0> ;
  assign M_AXI_GP1_ARID[4] = \<const0> ;
  assign M_AXI_GP1_ARID[3] = \<const0> ;
  assign M_AXI_GP1_ARID[2] = \<const0> ;
  assign M_AXI_GP1_ARID[1] = \<const0> ;
  assign M_AXI_GP1_ARID[0] = \<const0> ;
  assign M_AXI_GP1_ARLEN[3] = \<const0> ;
  assign M_AXI_GP1_ARLEN[2] = \<const0> ;
  assign M_AXI_GP1_ARLEN[1] = \<const0> ;
  assign M_AXI_GP1_ARLEN[0] = \<const0> ;
  assign M_AXI_GP1_ARLOCK[1] = \<const0> ;
  assign M_AXI_GP1_ARLOCK[0] = \<const0> ;
  assign M_AXI_GP1_ARPROT[2] = \<const0> ;
  assign M_AXI_GP1_ARPROT[1] = \<const0> ;
  assign M_AXI_GP1_ARPROT[0] = \<const0> ;
  assign M_AXI_GP1_ARQOS[3] = \<const0> ;
  assign M_AXI_GP1_ARQOS[2] = \<const0> ;
  assign M_AXI_GP1_ARQOS[1] = \<const0> ;
  assign M_AXI_GP1_ARQOS[0] = \<const0> ;
  assign M_AXI_GP1_ARSIZE[2] = \<const0> ;
  assign M_AXI_GP1_ARSIZE[1] = \<const0> ;
  assign M_AXI_GP1_ARSIZE[0] = \<const0> ;
  assign M_AXI_GP1_ARVALID = \<const0> ;
  assign M_AXI_GP1_AWADDR[31] = \<const0> ;
  assign M_AXI_GP1_AWADDR[30] = \<const0> ;
  assign M_AXI_GP1_AWADDR[29] = \<const0> ;
  assign M_AXI_GP1_AWADDR[28] = \<const0> ;
  assign M_AXI_GP1_AWADDR[27] = \<const0> ;
  assign M_AXI_GP1_AWADDR[26] = \<const0> ;
  assign M_AXI_GP1_AWADDR[25] = \<const0> ;
  assign M_AXI_GP1_AWADDR[24] = \<const0> ;
  assign M_AXI_GP1_AWADDR[23] = \<const0> ;
  assign M_AXI_GP1_AWADDR[22] = \<const0> ;
  assign M_AXI_GP1_AWADDR[21] = \<const0> ;
  assign M_AXI_GP1_AWADDR[20] = \<const0> ;
  assign M_AXI_GP1_AWADDR[19] = \<const0> ;
  assign M_AXI_GP1_AWADDR[18] = \<const0> ;
  assign M_AXI_GP1_AWADDR[17] = \<const0> ;
  assign M_AXI_GP1_AWADDR[16] = \<const0> ;
  assign M_AXI_GP1_AWADDR[15] = \<const0> ;
  assign M_AXI_GP1_AWADDR[14] = \<const0> ;
  assign M_AXI_GP1_AWADDR[13] = \<const0> ;
  assign M_AXI_GP1_AWADDR[12] = \<const0> ;
  assign M_AXI_GP1_AWADDR[11] = \<const0> ;
  assign M_AXI_GP1_AWADDR[10] = \<const0> ;
  assign M_AXI_GP1_AWADDR[9] = \<const0> ;
  assign M_AXI_GP1_AWADDR[8] = \<const0> ;
  assign M_AXI_GP1_AWADDR[7] = \<const0> ;
  assign M_AXI_GP1_AWADDR[6] = \<const0> ;
  assign M_AXI_GP1_AWADDR[5] = \<const0> ;
  assign M_AXI_GP1_AWADDR[4] = \<const0> ;
  assign M_AXI_GP1_AWADDR[3] = \<const0> ;
  assign M_AXI_GP1_AWADDR[2] = \<const0> ;
  assign M_AXI_GP1_AWADDR[1] = \<const0> ;
  assign M_AXI_GP1_AWADDR[0] = \<const0> ;
  assign M_AXI_GP1_AWBURST[1] = \<const0> ;
  assign M_AXI_GP1_AWBURST[0] = \<const0> ;
  assign M_AXI_GP1_AWCACHE[3] = \<const0> ;
  assign M_AXI_GP1_AWCACHE[2] = \<const0> ;
  assign M_AXI_GP1_AWCACHE[1] = \<const0> ;
  assign M_AXI_GP1_AWCACHE[0] = \<const0> ;
  assign M_AXI_GP1_AWID[11] = \<const0> ;
  assign M_AXI_GP1_AWID[10] = \<const0> ;
  assign M_AXI_GP1_AWID[9] = \<const0> ;
  assign M_AXI_GP1_AWID[8] = \<const0> ;
  assign M_AXI_GP1_AWID[7] = \<const0> ;
  assign M_AXI_GP1_AWID[6] = \<const0> ;
  assign M_AXI_GP1_AWID[5] = \<const0> ;
  assign M_AXI_GP1_AWID[4] = \<const0> ;
  assign M_AXI_GP1_AWID[3] = \<const0> ;
  assign M_AXI_GP1_AWID[2] = \<const0> ;
  assign M_AXI_GP1_AWID[1] = \<const0> ;
  assign M_AXI_GP1_AWID[0] = \<const0> ;
  assign M_AXI_GP1_AWLEN[3] = \<const0> ;
  assign M_AXI_GP1_AWLEN[2] = \<const0> ;
  assign M_AXI_GP1_AWLEN[1] = \<const0> ;
  assign M_AXI_GP1_AWLEN[0] = \<const0> ;
  assign M_AXI_GP1_AWLOCK[1] = \<const0> ;
  assign M_AXI_GP1_AWLOCK[0] = \<const0> ;
  assign M_AXI_GP1_AWPROT[2] = \<const0> ;
  assign M_AXI_GP1_AWPROT[1] = \<const0> ;
  assign M_AXI_GP1_AWPROT[0] = \<const0> ;
  assign M_AXI_GP1_AWQOS[3] = \<const0> ;
  assign M_AXI_GP1_AWQOS[2] = \<const0> ;
  assign M_AXI_GP1_AWQOS[1] = \<const0> ;
  assign M_AXI_GP1_AWQOS[0] = \<const0> ;
  assign M_AXI_GP1_AWSIZE[2] = \<const0> ;
  assign M_AXI_GP1_AWSIZE[1] = \<const0> ;
  assign M_AXI_GP1_AWSIZE[0] = \<const0> ;
  assign M_AXI_GP1_AWVALID = \<const0> ;
  assign M_AXI_GP1_BREADY = \<const0> ;
  assign M_AXI_GP1_RREADY = \<const0> ;
  assign M_AXI_GP1_WDATA[31] = \<const0> ;
  assign M_AXI_GP1_WDATA[30] = \<const0> ;
  assign M_AXI_GP1_WDATA[29] = \<const0> ;
  assign M_AXI_GP1_WDATA[28] = \<const0> ;
  assign M_AXI_GP1_WDATA[27] = \<const0> ;
  assign M_AXI_GP1_WDATA[26] = \<const0> ;
  assign M_AXI_GP1_WDATA[25] = \<const0> ;
  assign M_AXI_GP1_WDATA[24] = \<const0> ;
  assign M_AXI_GP1_WDATA[23] = \<const0> ;
  assign M_AXI_GP1_WDATA[22] = \<const0> ;
  assign M_AXI_GP1_WDATA[21] = \<const0> ;
  assign M_AXI_GP1_WDATA[20] = \<const0> ;
  assign M_AXI_GP1_WDATA[19] = \<const0> ;
  assign M_AXI_GP1_WDATA[18] = \<const0> ;
  assign M_AXI_GP1_WDATA[17] = \<const0> ;
  assign M_AXI_GP1_WDATA[16] = \<const0> ;
  assign M_AXI_GP1_WDATA[15] = \<const0> ;
  assign M_AXI_GP1_WDATA[14] = \<const0> ;
  assign M_AXI_GP1_WDATA[13] = \<const0> ;
  assign M_AXI_GP1_WDATA[12] = \<const0> ;
  assign M_AXI_GP1_WDATA[11] = \<const0> ;
  assign M_AXI_GP1_WDATA[10] = \<const0> ;
  assign M_AXI_GP1_WDATA[9] = \<const0> ;
  assign M_AXI_GP1_WDATA[8] = \<const0> ;
  assign M_AXI_GP1_WDATA[7] = \<const0> ;
  assign M_AXI_GP1_WDATA[6] = \<const0> ;
  assign M_AXI_GP1_WDATA[5] = \<const0> ;
  assign M_AXI_GP1_WDATA[4] = \<const0> ;
  assign M_AXI_GP1_WDATA[3] = \<const0> ;
  assign M_AXI_GP1_WDATA[2] = \<const0> ;
  assign M_AXI_GP1_WDATA[1] = \<const0> ;
  assign M_AXI_GP1_WDATA[0] = \<const0> ;
  assign M_AXI_GP1_WID[11] = \<const0> ;
  assign M_AXI_GP1_WID[10] = \<const0> ;
  assign M_AXI_GP1_WID[9] = \<const0> ;
  assign M_AXI_GP1_WID[8] = \<const0> ;
  assign M_AXI_GP1_WID[7] = \<const0> ;
  assign M_AXI_GP1_WID[6] = \<const0> ;
  assign M_AXI_GP1_WID[5] = \<const0> ;
  assign M_AXI_GP1_WID[4] = \<const0> ;
  assign M_AXI_GP1_WID[3] = \<const0> ;
  assign M_AXI_GP1_WID[2] = \<const0> ;
  assign M_AXI_GP1_WID[1] = \<const0> ;
  assign M_AXI_GP1_WID[0] = \<const0> ;
  assign M_AXI_GP1_WLAST = \<const0> ;
  assign M_AXI_GP1_WSTRB[3] = \<const0> ;
  assign M_AXI_GP1_WSTRB[2] = \<const0> ;
  assign M_AXI_GP1_WSTRB[1] = \<const0> ;
  assign M_AXI_GP1_WSTRB[0] = \<const0> ;
  assign M_AXI_GP1_WVALID = \<const0> ;
  assign PJTAG_TDO = \<const0> ;
  assign SDIO0_BUSPOW = \<const0> ;
  assign SDIO0_BUSVOLT[2] = \<const0> ;
  assign SDIO0_BUSVOLT[1] = \<const0> ;
  assign SDIO0_BUSVOLT[0] = \<const0> ;
  assign SDIO0_CLK = \<const0> ;
  assign SDIO0_CMD_O = \<const0> ;
  assign SDIO0_CMD_T = \<const0> ;
  assign SDIO0_DATA_O[3] = \<const0> ;
  assign SDIO0_DATA_O[2] = \<const0> ;
  assign SDIO0_DATA_O[1] = \<const0> ;
  assign SDIO0_DATA_O[0] = \<const0> ;
  assign SDIO0_DATA_T[3] = \<const0> ;
  assign SDIO0_DATA_T[2] = \<const0> ;
  assign SDIO0_DATA_T[1] = \<const0> ;
  assign SDIO0_DATA_T[0] = \<const0> ;
  assign SDIO0_LED = \<const0> ;
  assign SDIO1_BUSPOW = \<const0> ;
  assign SDIO1_BUSVOLT[2] = \<const0> ;
  assign SDIO1_BUSVOLT[1] = \<const0> ;
  assign SDIO1_BUSVOLT[0] = \<const0> ;
  assign SDIO1_CLK = \<const0> ;
  assign SDIO1_CMD_O = \<const0> ;
  assign SDIO1_CMD_T = \<const0> ;
  assign SDIO1_DATA_O[3] = \<const0> ;
  assign SDIO1_DATA_O[2] = \<const0> ;
  assign SDIO1_DATA_O[1] = \<const0> ;
  assign SDIO1_DATA_O[0] = \<const0> ;
  assign SDIO1_DATA_T[3] = \<const0> ;
  assign SDIO1_DATA_T[2] = \<const0> ;
  assign SDIO1_DATA_T[1] = \<const0> ;
  assign SDIO1_DATA_T[0] = \<const0> ;
  assign SDIO1_LED = \<const0> ;
  assign SPI0_MISO_O = \<const0> ;
  assign SPI0_MISO_T = \<const0> ;
  assign SPI0_MOSI_O = \<const0> ;
  assign SPI0_MOSI_T = \<const0> ;
  assign SPI0_SCLK_O = \<const0> ;
  assign SPI0_SCLK_T = \<const0> ;
  assign SPI0_SS1_O = \<const0> ;
  assign SPI0_SS2_O = \<const0> ;
  assign SPI0_SS_O = \<const0> ;
  assign SPI0_SS_T = \<const0> ;
  assign SPI1_MISO_O = \<const0> ;
  assign SPI1_MISO_T = \<const0> ;
  assign SPI1_MOSI_O = \<const0> ;
  assign SPI1_MOSI_T = \<const0> ;
  assign SPI1_SCLK_O = \<const0> ;
  assign SPI1_SCLK_T = \<const0> ;
  assign SPI1_SS1_O = \<const0> ;
  assign SPI1_SS2_O = \<const0> ;
  assign SPI1_SS_O = \<const0> ;
  assign SPI1_SS_T = \<const0> ;
  assign S_AXI_ACP_ARESETN = \<const0> ;
  assign S_AXI_ACP_ARREADY = \<const0> ;
  assign S_AXI_ACP_AWREADY = \<const0> ;
  assign S_AXI_ACP_BID[2] = \<const0> ;
  assign S_AXI_ACP_BID[1] = \<const0> ;
  assign S_AXI_ACP_BID[0] = \<const0> ;
  assign S_AXI_ACP_BRESP[1] = \<const0> ;
  assign S_AXI_ACP_BRESP[0] = \<const0> ;
  assign S_AXI_ACP_BVALID = \<const0> ;
  assign S_AXI_ACP_RDATA[63] = \<const0> ;
  assign S_AXI_ACP_RDATA[62] = \<const0> ;
  assign S_AXI_ACP_RDATA[61] = \<const0> ;
  assign S_AXI_ACP_RDATA[60] = \<const0> ;
  assign S_AXI_ACP_RDATA[59] = \<const0> ;
  assign S_AXI_ACP_RDATA[58] = \<const0> ;
  assign S_AXI_ACP_RDATA[57] = \<const0> ;
  assign S_AXI_ACP_RDATA[56] = \<const0> ;
  assign S_AXI_ACP_RDATA[55] = \<const0> ;
  assign S_AXI_ACP_RDATA[54] = \<const0> ;
  assign S_AXI_ACP_RDATA[53] = \<const0> ;
  assign S_AXI_ACP_RDATA[52] = \<const0> ;
  assign S_AXI_ACP_RDATA[51] = \<const0> ;
  assign S_AXI_ACP_RDATA[50] = \<const0> ;
  assign S_AXI_ACP_RDATA[49] = \<const0> ;
  assign S_AXI_ACP_RDATA[48] = \<const0> ;
  assign S_AXI_ACP_RDATA[47] = \<const0> ;
  assign S_AXI_ACP_RDATA[46] = \<const0> ;
  assign S_AXI_ACP_RDATA[45] = \<const0> ;
  assign S_AXI_ACP_RDATA[44] = \<const0> ;
  assign S_AXI_ACP_RDATA[43] = \<const0> ;
  assign S_AXI_ACP_RDATA[42] = \<const0> ;
  assign S_AXI_ACP_RDATA[41] = \<const0> ;
  assign S_AXI_ACP_RDATA[40] = \<const0> ;
  assign S_AXI_ACP_RDATA[39] = \<const0> ;
  assign S_AXI_ACP_RDATA[38] = \<const0> ;
  assign S_AXI_ACP_RDATA[37] = \<const0> ;
  assign S_AXI_ACP_RDATA[36] = \<const0> ;
  assign S_AXI_ACP_RDATA[35] = \<const0> ;
  assign S_AXI_ACP_RDATA[34] = \<const0> ;
  assign S_AXI_ACP_RDATA[33] = \<const0> ;
  assign S_AXI_ACP_RDATA[32] = \<const0> ;
  assign S_AXI_ACP_RDATA[31] = \<const0> ;
  assign S_AXI_ACP_RDATA[30] = \<const0> ;
  assign S_AXI_ACP_RDATA[29] = \<const0> ;
  assign S_AXI_ACP_RDATA[28] = \<const0> ;
  assign S_AXI_ACP_RDATA[27] = \<const0> ;
  assign S_AXI_ACP_RDATA[26] = \<const0> ;
  assign S_AXI_ACP_RDATA[25] = \<const0> ;
  assign S_AXI_ACP_RDATA[24] = \<const0> ;
  assign S_AXI_ACP_RDATA[23] = \<const0> ;
  assign S_AXI_ACP_RDATA[22] = \<const0> ;
  assign S_AXI_ACP_RDATA[21] = \<const0> ;
  assign S_AXI_ACP_RDATA[20] = \<const0> ;
  assign S_AXI_ACP_RDATA[19] = \<const0> ;
  assign S_AXI_ACP_RDATA[18] = \<const0> ;
  assign S_AXI_ACP_RDATA[17] = \<const0> ;
  assign S_AXI_ACP_RDATA[16] = \<const0> ;
  assign S_AXI_ACP_RDATA[15] = \<const0> ;
  assign S_AXI_ACP_RDATA[14] = \<const0> ;
  assign S_AXI_ACP_RDATA[13] = \<const0> ;
  assign S_AXI_ACP_RDATA[12] = \<const0> ;
  assign S_AXI_ACP_RDATA[11] = \<const0> ;
  assign S_AXI_ACP_RDATA[10] = \<const0> ;
  assign S_AXI_ACP_RDATA[9] = \<const0> ;
  assign S_AXI_ACP_RDATA[8] = \<const0> ;
  assign S_AXI_ACP_RDATA[7] = \<const0> ;
  assign S_AXI_ACP_RDATA[6] = \<const0> ;
  assign S_AXI_ACP_RDATA[5] = \<const0> ;
  assign S_AXI_ACP_RDATA[4] = \<const0> ;
  assign S_AXI_ACP_RDATA[3] = \<const0> ;
  assign S_AXI_ACP_RDATA[2] = \<const0> ;
  assign S_AXI_ACP_RDATA[1] = \<const0> ;
  assign S_AXI_ACP_RDATA[0] = \<const0> ;
  assign S_AXI_ACP_RID[2] = \<const0> ;
  assign S_AXI_ACP_RID[1] = \<const0> ;
  assign S_AXI_ACP_RID[0] = \<const0> ;
  assign S_AXI_ACP_RLAST = \<const0> ;
  assign S_AXI_ACP_RRESP[1] = \<const0> ;
  assign S_AXI_ACP_RRESP[0] = \<const0> ;
  assign S_AXI_ACP_RVALID = \<const0> ;
  assign S_AXI_ACP_WREADY = \<const0> ;
  assign S_AXI_GP0_ARESETN = \<const0> ;
  assign S_AXI_GP0_ARREADY = \<const0> ;
  assign S_AXI_GP0_AWREADY = \<const0> ;
  assign S_AXI_GP0_BID[5] = \<const0> ;
  assign S_AXI_GP0_BID[4] = \<const0> ;
  assign S_AXI_GP0_BID[3] = \<const0> ;
  assign S_AXI_GP0_BID[2] = \<const0> ;
  assign S_AXI_GP0_BID[1] = \<const0> ;
  assign S_AXI_GP0_BID[0] = \<const0> ;
  assign S_AXI_GP0_BRESP[1] = \<const0> ;
  assign S_AXI_GP0_BRESP[0] = \<const0> ;
  assign S_AXI_GP0_BVALID = \<const0> ;
  assign S_AXI_GP0_RDATA[31] = \<const0> ;
  assign S_AXI_GP0_RDATA[30] = \<const0> ;
  assign S_AXI_GP0_RDATA[29] = \<const0> ;
  assign S_AXI_GP0_RDATA[28] = \<const0> ;
  assign S_AXI_GP0_RDATA[27] = \<const0> ;
  assign S_AXI_GP0_RDATA[26] = \<const0> ;
  assign S_AXI_GP0_RDATA[25] = \<const0> ;
  assign S_AXI_GP0_RDATA[24] = \<const0> ;
  assign S_AXI_GP0_RDATA[23] = \<const0> ;
  assign S_AXI_GP0_RDATA[22] = \<const0> ;
  assign S_AXI_GP0_RDATA[21] = \<const0> ;
  assign S_AXI_GP0_RDATA[20] = \<const0> ;
  assign S_AXI_GP0_RDATA[19] = \<const0> ;
  assign S_AXI_GP0_RDATA[18] = \<const0> ;
  assign S_AXI_GP0_RDATA[17] = \<const0> ;
  assign S_AXI_GP0_RDATA[16] = \<const0> ;
  assign S_AXI_GP0_RDATA[15] = \<const0> ;
  assign S_AXI_GP0_RDATA[14] = \<const0> ;
  assign S_AXI_GP0_RDATA[13] = \<const0> ;
  assign S_AXI_GP0_RDATA[12] = \<const0> ;
  assign S_AXI_GP0_RDATA[11] = \<const0> ;
  assign S_AXI_GP0_RDATA[10] = \<const0> ;
  assign S_AXI_GP0_RDATA[9] = \<const0> ;
  assign S_AXI_GP0_RDATA[8] = \<const0> ;
  assign S_AXI_GP0_RDATA[7] = \<const0> ;
  assign S_AXI_GP0_RDATA[6] = \<const0> ;
  assign S_AXI_GP0_RDATA[5] = \<const0> ;
  assign S_AXI_GP0_RDATA[4] = \<const0> ;
  assign S_AXI_GP0_RDATA[3] = \<const0> ;
  assign S_AXI_GP0_RDATA[2] = \<const0> ;
  assign S_AXI_GP0_RDATA[1] = \<const0> ;
  assign S_AXI_GP0_RDATA[0] = \<const0> ;
  assign S_AXI_GP0_RID[5] = \<const0> ;
  assign S_AXI_GP0_RID[4] = \<const0> ;
  assign S_AXI_GP0_RID[3] = \<const0> ;
  assign S_AXI_GP0_RID[2] = \<const0> ;
  assign S_AXI_GP0_RID[1] = \<const0> ;
  assign S_AXI_GP0_RID[0] = \<const0> ;
  assign S_AXI_GP0_RLAST = \<const0> ;
  assign S_AXI_GP0_RRESP[1] = \<const0> ;
  assign S_AXI_GP0_RRESP[0] = \<const0> ;
  assign S_AXI_GP0_RVALID = \<const0> ;
  assign S_AXI_GP0_WREADY = \<const0> ;
  assign S_AXI_GP1_ARESETN = \<const0> ;
  assign S_AXI_GP1_ARREADY = \<const0> ;
  assign S_AXI_GP1_AWREADY = \<const0> ;
  assign S_AXI_GP1_BID[5] = \<const0> ;
  assign S_AXI_GP1_BID[4] = \<const0> ;
  assign S_AXI_GP1_BID[3] = \<const0> ;
  assign S_AXI_GP1_BID[2] = \<const0> ;
  assign S_AXI_GP1_BID[1] = \<const0> ;
  assign S_AXI_GP1_BID[0] = \<const0> ;
  assign S_AXI_GP1_BRESP[1] = \<const0> ;
  assign S_AXI_GP1_BRESP[0] = \<const0> ;
  assign S_AXI_GP1_BVALID = \<const0> ;
  assign S_AXI_GP1_RDATA[31] = \<const0> ;
  assign S_AXI_GP1_RDATA[30] = \<const0> ;
  assign S_AXI_GP1_RDATA[29] = \<const0> ;
  assign S_AXI_GP1_RDATA[28] = \<const0> ;
  assign S_AXI_GP1_RDATA[27] = \<const0> ;
  assign S_AXI_GP1_RDATA[26] = \<const0> ;
  assign S_AXI_GP1_RDATA[25] = \<const0> ;
  assign S_AXI_GP1_RDATA[24] = \<const0> ;
  assign S_AXI_GP1_RDATA[23] = \<const0> ;
  assign S_AXI_GP1_RDATA[22] = \<const0> ;
  assign S_AXI_GP1_RDATA[21] = \<const0> ;
  assign S_AXI_GP1_RDATA[20] = \<const0> ;
  assign S_AXI_GP1_RDATA[19] = \<const0> ;
  assign S_AXI_GP1_RDATA[18] = \<const0> ;
  assign S_AXI_GP1_RDATA[17] = \<const0> ;
  assign S_AXI_GP1_RDATA[16] = \<const0> ;
  assign S_AXI_GP1_RDATA[15] = \<const0> ;
  assign S_AXI_GP1_RDATA[14] = \<const0> ;
  assign S_AXI_GP1_RDATA[13] = \<const0> ;
  assign S_AXI_GP1_RDATA[12] = \<const0> ;
  assign S_AXI_GP1_RDATA[11] = \<const0> ;
  assign S_AXI_GP1_RDATA[10] = \<const0> ;
  assign S_AXI_GP1_RDATA[9] = \<const0> ;
  assign S_AXI_GP1_RDATA[8] = \<const0> ;
  assign S_AXI_GP1_RDATA[7] = \<const0> ;
  assign S_AXI_GP1_RDATA[6] = \<const0> ;
  assign S_AXI_GP1_RDATA[5] = \<const0> ;
  assign S_AXI_GP1_RDATA[4] = \<const0> ;
  assign S_AXI_GP1_RDATA[3] = \<const0> ;
  assign S_AXI_GP1_RDATA[2] = \<const0> ;
  assign S_AXI_GP1_RDATA[1] = \<const0> ;
  assign S_AXI_GP1_RDATA[0] = \<const0> ;
  assign S_AXI_GP1_RID[5] = \<const0> ;
  assign S_AXI_GP1_RID[4] = \<const0> ;
  assign S_AXI_GP1_RID[3] = \<const0> ;
  assign S_AXI_GP1_RID[2] = \<const0> ;
  assign S_AXI_GP1_RID[1] = \<const0> ;
  assign S_AXI_GP1_RID[0] = \<const0> ;
  assign S_AXI_GP1_RLAST = \<const0> ;
  assign S_AXI_GP1_RRESP[1] = \<const0> ;
  assign S_AXI_GP1_RRESP[0] = \<const0> ;
  assign S_AXI_GP1_RVALID = \<const0> ;
  assign S_AXI_GP1_WREADY = \<const0> ;
  assign S_AXI_HP0_ARESETN = \<const0> ;
  assign S_AXI_HP0_ARREADY = \<const0> ;
  assign S_AXI_HP0_AWREADY = \<const0> ;
  assign S_AXI_HP0_BID[5] = \<const0> ;
  assign S_AXI_HP0_BID[4] = \<const0> ;
  assign S_AXI_HP0_BID[3] = \<const0> ;
  assign S_AXI_HP0_BID[2] = \<const0> ;
  assign S_AXI_HP0_BID[1] = \<const0> ;
  assign S_AXI_HP0_BID[0] = \<const0> ;
  assign S_AXI_HP0_BRESP[1] = \<const0> ;
  assign S_AXI_HP0_BRESP[0] = \<const0> ;
  assign S_AXI_HP0_BVALID = \<const0> ;
  assign S_AXI_HP0_RACOUNT[2] = \<const0> ;
  assign S_AXI_HP0_RACOUNT[1] = \<const0> ;
  assign S_AXI_HP0_RACOUNT[0] = \<const0> ;
  assign S_AXI_HP0_RCOUNT[7] = \<const0> ;
  assign S_AXI_HP0_RCOUNT[6] = \<const0> ;
  assign S_AXI_HP0_RCOUNT[5] = \<const0> ;
  assign S_AXI_HP0_RCOUNT[4] = \<const0> ;
  assign S_AXI_HP0_RCOUNT[3] = \<const0> ;
  assign S_AXI_HP0_RCOUNT[2] = \<const0> ;
  assign S_AXI_HP0_RCOUNT[1] = \<const0> ;
  assign S_AXI_HP0_RCOUNT[0] = \<const0> ;
  assign S_AXI_HP0_RDATA[63] = \<const0> ;
  assign S_AXI_HP0_RDATA[62] = \<const0> ;
  assign S_AXI_HP0_RDATA[61] = \<const0> ;
  assign S_AXI_HP0_RDATA[60] = \<const0> ;
  assign S_AXI_HP0_RDATA[59] = \<const0> ;
  assign S_AXI_HP0_RDATA[58] = \<const0> ;
  assign S_AXI_HP0_RDATA[57] = \<const0> ;
  assign S_AXI_HP0_RDATA[56] = \<const0> ;
  assign S_AXI_HP0_RDATA[55] = \<const0> ;
  assign S_AXI_HP0_RDATA[54] = \<const0> ;
  assign S_AXI_HP0_RDATA[53] = \<const0> ;
  assign S_AXI_HP0_RDATA[52] = \<const0> ;
  assign S_AXI_HP0_RDATA[51] = \<const0> ;
  assign S_AXI_HP0_RDATA[50] = \<const0> ;
  assign S_AXI_HP0_RDATA[49] = \<const0> ;
  assign S_AXI_HP0_RDATA[48] = \<const0> ;
  assign S_AXI_HP0_RDATA[47] = \<const0> ;
  assign S_AXI_HP0_RDATA[46] = \<const0> ;
  assign S_AXI_HP0_RDATA[45] = \<const0> ;
  assign S_AXI_HP0_RDATA[44] = \<const0> ;
  assign S_AXI_HP0_RDATA[43] = \<const0> ;
  assign S_AXI_HP0_RDATA[42] = \<const0> ;
  assign S_AXI_HP0_RDATA[41] = \<const0> ;
  assign S_AXI_HP0_RDATA[40] = \<const0> ;
  assign S_AXI_HP0_RDATA[39] = \<const0> ;
  assign S_AXI_HP0_RDATA[38] = \<const0> ;
  assign S_AXI_HP0_RDATA[37] = \<const0> ;
  assign S_AXI_HP0_RDATA[36] = \<const0> ;
  assign S_AXI_HP0_RDATA[35] = \<const0> ;
  assign S_AXI_HP0_RDATA[34] = \<const0> ;
  assign S_AXI_HP0_RDATA[33] = \<const0> ;
  assign S_AXI_HP0_RDATA[32] = \<const0> ;
  assign S_AXI_HP0_RDATA[31] = \<const0> ;
  assign S_AXI_HP0_RDATA[30] = \<const0> ;
  assign S_AXI_HP0_RDATA[29] = \<const0> ;
  assign S_AXI_HP0_RDATA[28] = \<const0> ;
  assign S_AXI_HP0_RDATA[27] = \<const0> ;
  assign S_AXI_HP0_RDATA[26] = \<const0> ;
  assign S_AXI_HP0_RDATA[25] = \<const0> ;
  assign S_AXI_HP0_RDATA[24] = \<const0> ;
  assign S_AXI_HP0_RDATA[23] = \<const0> ;
  assign S_AXI_HP0_RDATA[22] = \<const0> ;
  assign S_AXI_HP0_RDATA[21] = \<const0> ;
  assign S_AXI_HP0_RDATA[20] = \<const0> ;
  assign S_AXI_HP0_RDATA[19] = \<const0> ;
  assign S_AXI_HP0_RDATA[18] = \<const0> ;
  assign S_AXI_HP0_RDATA[17] = \<const0> ;
  assign S_AXI_HP0_RDATA[16] = \<const0> ;
  assign S_AXI_HP0_RDATA[15] = \<const0> ;
  assign S_AXI_HP0_RDATA[14] = \<const0> ;
  assign S_AXI_HP0_RDATA[13] = \<const0> ;
  assign S_AXI_HP0_RDATA[12] = \<const0> ;
  assign S_AXI_HP0_RDATA[11] = \<const0> ;
  assign S_AXI_HP0_RDATA[10] = \<const0> ;
  assign S_AXI_HP0_RDATA[9] = \<const0> ;
  assign S_AXI_HP0_RDATA[8] = \<const0> ;
  assign S_AXI_HP0_RDATA[7] = \<const0> ;
  assign S_AXI_HP0_RDATA[6] = \<const0> ;
  assign S_AXI_HP0_RDATA[5] = \<const0> ;
  assign S_AXI_HP0_RDATA[4] = \<const0> ;
  assign S_AXI_HP0_RDATA[3] = \<const0> ;
  assign S_AXI_HP0_RDATA[2] = \<const0> ;
  assign S_AXI_HP0_RDATA[1] = \<const0> ;
  assign S_AXI_HP0_RDATA[0] = \<const0> ;
  assign S_AXI_HP0_RID[5] = \<const0> ;
  assign S_AXI_HP0_RID[4] = \<const0> ;
  assign S_AXI_HP0_RID[3] = \<const0> ;
  assign S_AXI_HP0_RID[2] = \<const0> ;
  assign S_AXI_HP0_RID[1] = \<const0> ;
  assign S_AXI_HP0_RID[0] = \<const0> ;
  assign S_AXI_HP0_RLAST = \<const0> ;
  assign S_AXI_HP0_RRESP[1] = \<const0> ;
  assign S_AXI_HP0_RRESP[0] = \<const0> ;
  assign S_AXI_HP0_RVALID = \<const0> ;
  assign S_AXI_HP0_WACOUNT[5] = \<const0> ;
  assign S_AXI_HP0_WACOUNT[4] = \<const0> ;
  assign S_AXI_HP0_WACOUNT[3] = \<const0> ;
  assign S_AXI_HP0_WACOUNT[2] = \<const0> ;
  assign S_AXI_HP0_WACOUNT[1] = \<const0> ;
  assign S_AXI_HP0_WACOUNT[0] = \<const0> ;
  assign S_AXI_HP0_WCOUNT[7] = \<const0> ;
  assign S_AXI_HP0_WCOUNT[6] = \<const0> ;
  assign S_AXI_HP0_WCOUNT[5] = \<const0> ;
  assign S_AXI_HP0_WCOUNT[4] = \<const0> ;
  assign S_AXI_HP0_WCOUNT[3] = \<const0> ;
  assign S_AXI_HP0_WCOUNT[2] = \<const0> ;
  assign S_AXI_HP0_WCOUNT[1] = \<const0> ;
  assign S_AXI_HP0_WCOUNT[0] = \<const0> ;
  assign S_AXI_HP0_WREADY = \<const0> ;
  assign S_AXI_HP1_ARESETN = \<const0> ;
  assign S_AXI_HP1_ARREADY = \<const0> ;
  assign S_AXI_HP1_AWREADY = \<const0> ;
  assign S_AXI_HP1_BID[5] = \<const0> ;
  assign S_AXI_HP1_BID[4] = \<const0> ;
  assign S_AXI_HP1_BID[3] = \<const0> ;
  assign S_AXI_HP1_BID[2] = \<const0> ;
  assign S_AXI_HP1_BID[1] = \<const0> ;
  assign S_AXI_HP1_BID[0] = \<const0> ;
  assign S_AXI_HP1_BRESP[1] = \<const0> ;
  assign S_AXI_HP1_BRESP[0] = \<const0> ;
  assign S_AXI_HP1_BVALID = \<const0> ;
  assign S_AXI_HP1_RACOUNT[2] = \<const0> ;
  assign S_AXI_HP1_RACOUNT[1] = \<const0> ;
  assign S_AXI_HP1_RACOUNT[0] = \<const0> ;
  assign S_AXI_HP1_RCOUNT[7] = \<const0> ;
  assign S_AXI_HP1_RCOUNT[6] = \<const0> ;
  assign S_AXI_HP1_RCOUNT[5] = \<const0> ;
  assign S_AXI_HP1_RCOUNT[4] = \<const0> ;
  assign S_AXI_HP1_RCOUNT[3] = \<const0> ;
  assign S_AXI_HP1_RCOUNT[2] = \<const0> ;
  assign S_AXI_HP1_RCOUNT[1] = \<const0> ;
  assign S_AXI_HP1_RCOUNT[0] = \<const0> ;
  assign S_AXI_HP1_RDATA[63] = \<const0> ;
  assign S_AXI_HP1_RDATA[62] = \<const0> ;
  assign S_AXI_HP1_RDATA[61] = \<const0> ;
  assign S_AXI_HP1_RDATA[60] = \<const0> ;
  assign S_AXI_HP1_RDATA[59] = \<const0> ;
  assign S_AXI_HP1_RDATA[58] = \<const0> ;
  assign S_AXI_HP1_RDATA[57] = \<const0> ;
  assign S_AXI_HP1_RDATA[56] = \<const0> ;
  assign S_AXI_HP1_RDATA[55] = \<const0> ;
  assign S_AXI_HP1_RDATA[54] = \<const0> ;
  assign S_AXI_HP1_RDATA[53] = \<const0> ;
  assign S_AXI_HP1_RDATA[52] = \<const0> ;
  assign S_AXI_HP1_RDATA[51] = \<const0> ;
  assign S_AXI_HP1_RDATA[50] = \<const0> ;
  assign S_AXI_HP1_RDATA[49] = \<const0> ;
  assign S_AXI_HP1_RDATA[48] = \<const0> ;
  assign S_AXI_HP1_RDATA[47] = \<const0> ;
  assign S_AXI_HP1_RDATA[46] = \<const0> ;
  assign S_AXI_HP1_RDATA[45] = \<const0> ;
  assign S_AXI_HP1_RDATA[44] = \<const0> ;
  assign S_AXI_HP1_RDATA[43] = \<const0> ;
  assign S_AXI_HP1_RDATA[42] = \<const0> ;
  assign S_AXI_HP1_RDATA[41] = \<const0> ;
  assign S_AXI_HP1_RDATA[40] = \<const0> ;
  assign S_AXI_HP1_RDATA[39] = \<const0> ;
  assign S_AXI_HP1_RDATA[38] = \<const0> ;
  assign S_AXI_HP1_RDATA[37] = \<const0> ;
  assign S_AXI_HP1_RDATA[36] = \<const0> ;
  assign S_AXI_HP1_RDATA[35] = \<const0> ;
  assign S_AXI_HP1_RDATA[34] = \<const0> ;
  assign S_AXI_HP1_RDATA[33] = \<const0> ;
  assign S_AXI_HP1_RDATA[32] = \<const0> ;
  assign S_AXI_HP1_RDATA[31] = \<const0> ;
  assign S_AXI_HP1_RDATA[30] = \<const0> ;
  assign S_AXI_HP1_RDATA[29] = \<const0> ;
  assign S_AXI_HP1_RDATA[28] = \<const0> ;
  assign S_AXI_HP1_RDATA[27] = \<const0> ;
  assign S_AXI_HP1_RDATA[26] = \<const0> ;
  assign S_AXI_HP1_RDATA[25] = \<const0> ;
  assign S_AXI_HP1_RDATA[24] = \<const0> ;
  assign S_AXI_HP1_RDATA[23] = \<const0> ;
  assign S_AXI_HP1_RDATA[22] = \<const0> ;
  assign S_AXI_HP1_RDATA[21] = \<const0> ;
  assign S_AXI_HP1_RDATA[20] = \<const0> ;
  assign S_AXI_HP1_RDATA[19] = \<const0> ;
  assign S_AXI_HP1_RDATA[18] = \<const0> ;
  assign S_AXI_HP1_RDATA[17] = \<const0> ;
  assign S_AXI_HP1_RDATA[16] = \<const0> ;
  assign S_AXI_HP1_RDATA[15] = \<const0> ;
  assign S_AXI_HP1_RDATA[14] = \<const0> ;
  assign S_AXI_HP1_RDATA[13] = \<const0> ;
  assign S_AXI_HP1_RDATA[12] = \<const0> ;
  assign S_AXI_HP1_RDATA[11] = \<const0> ;
  assign S_AXI_HP1_RDATA[10] = \<const0> ;
  assign S_AXI_HP1_RDATA[9] = \<const0> ;
  assign S_AXI_HP1_RDATA[8] = \<const0> ;
  assign S_AXI_HP1_RDATA[7] = \<const0> ;
  assign S_AXI_HP1_RDATA[6] = \<const0> ;
  assign S_AXI_HP1_RDATA[5] = \<const0> ;
  assign S_AXI_HP1_RDATA[4] = \<const0> ;
  assign S_AXI_HP1_RDATA[3] = \<const0> ;
  assign S_AXI_HP1_RDATA[2] = \<const0> ;
  assign S_AXI_HP1_RDATA[1] = \<const0> ;
  assign S_AXI_HP1_RDATA[0] = \<const0> ;
  assign S_AXI_HP1_RID[5] = \<const0> ;
  assign S_AXI_HP1_RID[4] = \<const0> ;
  assign S_AXI_HP1_RID[3] = \<const0> ;
  assign S_AXI_HP1_RID[2] = \<const0> ;
  assign S_AXI_HP1_RID[1] = \<const0> ;
  assign S_AXI_HP1_RID[0] = \<const0> ;
  assign S_AXI_HP1_RLAST = \<const0> ;
  assign S_AXI_HP1_RRESP[1] = \<const0> ;
  assign S_AXI_HP1_RRESP[0] = \<const0> ;
  assign S_AXI_HP1_RVALID = \<const0> ;
  assign S_AXI_HP1_WACOUNT[5] = \<const0> ;
  assign S_AXI_HP1_WACOUNT[4] = \<const0> ;
  assign S_AXI_HP1_WACOUNT[3] = \<const0> ;
  assign S_AXI_HP1_WACOUNT[2] = \<const0> ;
  assign S_AXI_HP1_WACOUNT[1] = \<const0> ;
  assign S_AXI_HP1_WACOUNT[0] = \<const0> ;
  assign S_AXI_HP1_WCOUNT[7] = \<const0> ;
  assign S_AXI_HP1_WCOUNT[6] = \<const0> ;
  assign S_AXI_HP1_WCOUNT[5] = \<const0> ;
  assign S_AXI_HP1_WCOUNT[4] = \<const0> ;
  assign S_AXI_HP1_WCOUNT[3] = \<const0> ;
  assign S_AXI_HP1_WCOUNT[2] = \<const0> ;
  assign S_AXI_HP1_WCOUNT[1] = \<const0> ;
  assign S_AXI_HP1_WCOUNT[0] = \<const0> ;
  assign S_AXI_HP1_WREADY = \<const0> ;
  assign S_AXI_HP2_ARESETN = \<const0> ;
  assign S_AXI_HP2_ARREADY = \<const0> ;
  assign S_AXI_HP2_AWREADY = \<const0> ;
  assign S_AXI_HP2_BID[5] = \<const0> ;
  assign S_AXI_HP2_BID[4] = \<const0> ;
  assign S_AXI_HP2_BID[3] = \<const0> ;
  assign S_AXI_HP2_BID[2] = \<const0> ;
  assign S_AXI_HP2_BID[1] = \<const0> ;
  assign S_AXI_HP2_BID[0] = \<const0> ;
  assign S_AXI_HP2_BRESP[1] = \<const0> ;
  assign S_AXI_HP2_BRESP[0] = \<const0> ;
  assign S_AXI_HP2_BVALID = \<const0> ;
  assign S_AXI_HP2_RACOUNT[2] = \<const0> ;
  assign S_AXI_HP2_RACOUNT[1] = \<const0> ;
  assign S_AXI_HP2_RACOUNT[0] = \<const0> ;
  assign S_AXI_HP2_RCOUNT[7] = \<const0> ;
  assign S_AXI_HP2_RCOUNT[6] = \<const0> ;
  assign S_AXI_HP2_RCOUNT[5] = \<const0> ;
  assign S_AXI_HP2_RCOUNT[4] = \<const0> ;
  assign S_AXI_HP2_RCOUNT[3] = \<const0> ;
  assign S_AXI_HP2_RCOUNT[2] = \<const0> ;
  assign S_AXI_HP2_RCOUNT[1] = \<const0> ;
  assign S_AXI_HP2_RCOUNT[0] = \<const0> ;
  assign S_AXI_HP2_RDATA[63] = \<const0> ;
  assign S_AXI_HP2_RDATA[62] = \<const0> ;
  assign S_AXI_HP2_RDATA[61] = \<const0> ;
  assign S_AXI_HP2_RDATA[60] = \<const0> ;
  assign S_AXI_HP2_RDATA[59] = \<const0> ;
  assign S_AXI_HP2_RDATA[58] = \<const0> ;
  assign S_AXI_HP2_RDATA[57] = \<const0> ;
  assign S_AXI_HP2_RDATA[56] = \<const0> ;
  assign S_AXI_HP2_RDATA[55] = \<const0> ;
  assign S_AXI_HP2_RDATA[54] = \<const0> ;
  assign S_AXI_HP2_RDATA[53] = \<const0> ;
  assign S_AXI_HP2_RDATA[52] = \<const0> ;
  assign S_AXI_HP2_RDATA[51] = \<const0> ;
  assign S_AXI_HP2_RDATA[50] = \<const0> ;
  assign S_AXI_HP2_RDATA[49] = \<const0> ;
  assign S_AXI_HP2_RDATA[48] = \<const0> ;
  assign S_AXI_HP2_RDATA[47] = \<const0> ;
  assign S_AXI_HP2_RDATA[46] = \<const0> ;
  assign S_AXI_HP2_RDATA[45] = \<const0> ;
  assign S_AXI_HP2_RDATA[44] = \<const0> ;
  assign S_AXI_HP2_RDATA[43] = \<const0> ;
  assign S_AXI_HP2_RDATA[42] = \<const0> ;
  assign S_AXI_HP2_RDATA[41] = \<const0> ;
  assign S_AXI_HP2_RDATA[40] = \<const0> ;
  assign S_AXI_HP2_RDATA[39] = \<const0> ;
  assign S_AXI_HP2_RDATA[38] = \<const0> ;
  assign S_AXI_HP2_RDATA[37] = \<const0> ;
  assign S_AXI_HP2_RDATA[36] = \<const0> ;
  assign S_AXI_HP2_RDATA[35] = \<const0> ;
  assign S_AXI_HP2_RDATA[34] = \<const0> ;
  assign S_AXI_HP2_RDATA[33] = \<const0> ;
  assign S_AXI_HP2_RDATA[32] = \<const0> ;
  assign S_AXI_HP2_RDATA[31] = \<const0> ;
  assign S_AXI_HP2_RDATA[30] = \<const0> ;
  assign S_AXI_HP2_RDATA[29] = \<const0> ;
  assign S_AXI_HP2_RDATA[28] = \<const0> ;
  assign S_AXI_HP2_RDATA[27] = \<const0> ;
  assign S_AXI_HP2_RDATA[26] = \<const0> ;
  assign S_AXI_HP2_RDATA[25] = \<const0> ;
  assign S_AXI_HP2_RDATA[24] = \<const0> ;
  assign S_AXI_HP2_RDATA[23] = \<const0> ;
  assign S_AXI_HP2_RDATA[22] = \<const0> ;
  assign S_AXI_HP2_RDATA[21] = \<const0> ;
  assign S_AXI_HP2_RDATA[20] = \<const0> ;
  assign S_AXI_HP2_RDATA[19] = \<const0> ;
  assign S_AXI_HP2_RDATA[18] = \<const0> ;
  assign S_AXI_HP2_RDATA[17] = \<const0> ;
  assign S_AXI_HP2_RDATA[16] = \<const0> ;
  assign S_AXI_HP2_RDATA[15] = \<const0> ;
  assign S_AXI_HP2_RDATA[14] = \<const0> ;
  assign S_AXI_HP2_RDATA[13] = \<const0> ;
  assign S_AXI_HP2_RDATA[12] = \<const0> ;
  assign S_AXI_HP2_RDATA[11] = \<const0> ;
  assign S_AXI_HP2_RDATA[10] = \<const0> ;
  assign S_AXI_HP2_RDATA[9] = \<const0> ;
  assign S_AXI_HP2_RDATA[8] = \<const0> ;
  assign S_AXI_HP2_RDATA[7] = \<const0> ;
  assign S_AXI_HP2_RDATA[6] = \<const0> ;
  assign S_AXI_HP2_RDATA[5] = \<const0> ;
  assign S_AXI_HP2_RDATA[4] = \<const0> ;
  assign S_AXI_HP2_RDATA[3] = \<const0> ;
  assign S_AXI_HP2_RDATA[2] = \<const0> ;
  assign S_AXI_HP2_RDATA[1] = \<const0> ;
  assign S_AXI_HP2_RDATA[0] = \<const0> ;
  assign S_AXI_HP2_RID[5] = \<const0> ;
  assign S_AXI_HP2_RID[4] = \<const0> ;
  assign S_AXI_HP2_RID[3] = \<const0> ;
  assign S_AXI_HP2_RID[2] = \<const0> ;
  assign S_AXI_HP2_RID[1] = \<const0> ;
  assign S_AXI_HP2_RID[0] = \<const0> ;
  assign S_AXI_HP2_RLAST = \<const0> ;
  assign S_AXI_HP2_RRESP[1] = \<const0> ;
  assign S_AXI_HP2_RRESP[0] = \<const0> ;
  assign S_AXI_HP2_RVALID = \<const0> ;
  assign S_AXI_HP2_WACOUNT[5] = \<const0> ;
  assign S_AXI_HP2_WACOUNT[4] = \<const0> ;
  assign S_AXI_HP2_WACOUNT[3] = \<const0> ;
  assign S_AXI_HP2_WACOUNT[2] = \<const0> ;
  assign S_AXI_HP2_WACOUNT[1] = \<const0> ;
  assign S_AXI_HP2_WACOUNT[0] = \<const0> ;
  assign S_AXI_HP2_WCOUNT[7] = \<const0> ;
  assign S_AXI_HP2_WCOUNT[6] = \<const0> ;
  assign S_AXI_HP2_WCOUNT[5] = \<const0> ;
  assign S_AXI_HP2_WCOUNT[4] = \<const0> ;
  assign S_AXI_HP2_WCOUNT[3] = \<const0> ;
  assign S_AXI_HP2_WCOUNT[2] = \<const0> ;
  assign S_AXI_HP2_WCOUNT[1] = \<const0> ;
  assign S_AXI_HP2_WCOUNT[0] = \<const0> ;
  assign S_AXI_HP2_WREADY = \<const0> ;
  assign S_AXI_HP3_ARESETN = \<const0> ;
  assign S_AXI_HP3_ARREADY = \<const0> ;
  assign S_AXI_HP3_AWREADY = \<const0> ;
  assign S_AXI_HP3_BID[5] = \<const0> ;
  assign S_AXI_HP3_BID[4] = \<const0> ;
  assign S_AXI_HP3_BID[3] = \<const0> ;
  assign S_AXI_HP3_BID[2] = \<const0> ;
  assign S_AXI_HP3_BID[1] = \<const0> ;
  assign S_AXI_HP3_BID[0] = \<const0> ;
  assign S_AXI_HP3_BRESP[1] = \<const0> ;
  assign S_AXI_HP3_BRESP[0] = \<const0> ;
  assign S_AXI_HP3_BVALID = \<const0> ;
  assign S_AXI_HP3_RACOUNT[2] = \<const0> ;
  assign S_AXI_HP3_RACOUNT[1] = \<const0> ;
  assign S_AXI_HP3_RACOUNT[0] = \<const0> ;
  assign S_AXI_HP3_RCOUNT[7] = \<const0> ;
  assign S_AXI_HP3_RCOUNT[6] = \<const0> ;
  assign S_AXI_HP3_RCOUNT[5] = \<const0> ;
  assign S_AXI_HP3_RCOUNT[4] = \<const0> ;
  assign S_AXI_HP3_RCOUNT[3] = \<const0> ;
  assign S_AXI_HP3_RCOUNT[2] = \<const0> ;
  assign S_AXI_HP3_RCOUNT[1] = \<const0> ;
  assign S_AXI_HP3_RCOUNT[0] = \<const0> ;
  assign S_AXI_HP3_RDATA[63] = \<const0> ;
  assign S_AXI_HP3_RDATA[62] = \<const0> ;
  assign S_AXI_HP3_RDATA[61] = \<const0> ;
  assign S_AXI_HP3_RDATA[60] = \<const0> ;
  assign S_AXI_HP3_RDATA[59] = \<const0> ;
  assign S_AXI_HP3_RDATA[58] = \<const0> ;
  assign S_AXI_HP3_RDATA[57] = \<const0> ;
  assign S_AXI_HP3_RDATA[56] = \<const0> ;
  assign S_AXI_HP3_RDATA[55] = \<const0> ;
  assign S_AXI_HP3_RDATA[54] = \<const0> ;
  assign S_AXI_HP3_RDATA[53] = \<const0> ;
  assign S_AXI_HP3_RDATA[52] = \<const0> ;
  assign S_AXI_HP3_RDATA[51] = \<const0> ;
  assign S_AXI_HP3_RDATA[50] = \<const0> ;
  assign S_AXI_HP3_RDATA[49] = \<const0> ;
  assign S_AXI_HP3_RDATA[48] = \<const0> ;
  assign S_AXI_HP3_RDATA[47] = \<const0> ;
  assign S_AXI_HP3_RDATA[46] = \<const0> ;
  assign S_AXI_HP3_RDATA[45] = \<const0> ;
  assign S_AXI_HP3_RDATA[44] = \<const0> ;
  assign S_AXI_HP3_RDATA[43] = \<const0> ;
  assign S_AXI_HP3_RDATA[42] = \<const0> ;
  assign S_AXI_HP3_RDATA[41] = \<const0> ;
  assign S_AXI_HP3_RDATA[40] = \<const0> ;
  assign S_AXI_HP3_RDATA[39] = \<const0> ;
  assign S_AXI_HP3_RDATA[38] = \<const0> ;
  assign S_AXI_HP3_RDATA[37] = \<const0> ;
  assign S_AXI_HP3_RDATA[36] = \<const0> ;
  assign S_AXI_HP3_RDATA[35] = \<const0> ;
  assign S_AXI_HP3_RDATA[34] = \<const0> ;
  assign S_AXI_HP3_RDATA[33] = \<const0> ;
  assign S_AXI_HP3_RDATA[32] = \<const0> ;
  assign S_AXI_HP3_RDATA[31] = \<const0> ;
  assign S_AXI_HP3_RDATA[30] = \<const0> ;
  assign S_AXI_HP3_RDATA[29] = \<const0> ;
  assign S_AXI_HP3_RDATA[28] = \<const0> ;
  assign S_AXI_HP3_RDATA[27] = \<const0> ;
  assign S_AXI_HP3_RDATA[26] = \<const0> ;
  assign S_AXI_HP3_RDATA[25] = \<const0> ;
  assign S_AXI_HP3_RDATA[24] = \<const0> ;
  assign S_AXI_HP3_RDATA[23] = \<const0> ;
  assign S_AXI_HP3_RDATA[22] = \<const0> ;
  assign S_AXI_HP3_RDATA[21] = \<const0> ;
  assign S_AXI_HP3_RDATA[20] = \<const0> ;
  assign S_AXI_HP3_RDATA[19] = \<const0> ;
  assign S_AXI_HP3_RDATA[18] = \<const0> ;
  assign S_AXI_HP3_RDATA[17] = \<const0> ;
  assign S_AXI_HP3_RDATA[16] = \<const0> ;
  assign S_AXI_HP3_RDATA[15] = \<const0> ;
  assign S_AXI_HP3_RDATA[14] = \<const0> ;
  assign S_AXI_HP3_RDATA[13] = \<const0> ;
  assign S_AXI_HP3_RDATA[12] = \<const0> ;
  assign S_AXI_HP3_RDATA[11] = \<const0> ;
  assign S_AXI_HP3_RDATA[10] = \<const0> ;
  assign S_AXI_HP3_RDATA[9] = \<const0> ;
  assign S_AXI_HP3_RDATA[8] = \<const0> ;
  assign S_AXI_HP3_RDATA[7] = \<const0> ;
  assign S_AXI_HP3_RDATA[6] = \<const0> ;
  assign S_AXI_HP3_RDATA[5] = \<const0> ;
  assign S_AXI_HP3_RDATA[4] = \<const0> ;
  assign S_AXI_HP3_RDATA[3] = \<const0> ;
  assign S_AXI_HP3_RDATA[2] = \<const0> ;
  assign S_AXI_HP3_RDATA[1] = \<const0> ;
  assign S_AXI_HP3_RDATA[0] = \<const0> ;
  assign S_AXI_HP3_RID[5] = \<const0> ;
  assign S_AXI_HP3_RID[4] = \<const0> ;
  assign S_AXI_HP3_RID[3] = \<const0> ;
  assign S_AXI_HP3_RID[2] = \<const0> ;
  assign S_AXI_HP3_RID[1] = \<const0> ;
  assign S_AXI_HP3_RID[0] = \<const0> ;
  assign S_AXI_HP3_RLAST = \<const0> ;
  assign S_AXI_HP3_RRESP[1] = \<const0> ;
  assign S_AXI_HP3_RRESP[0] = \<const0> ;
  assign S_AXI_HP3_RVALID = \<const0> ;
  assign S_AXI_HP3_WACOUNT[5] = \<const0> ;
  assign S_AXI_HP3_WACOUNT[4] = \<const0> ;
  assign S_AXI_HP3_WACOUNT[3] = \<const0> ;
  assign S_AXI_HP3_WACOUNT[2] = \<const0> ;
  assign S_AXI_HP3_WACOUNT[1] = \<const0> ;
  assign S_AXI_HP3_WACOUNT[0] = \<const0> ;
  assign S_AXI_HP3_WCOUNT[7] = \<const0> ;
  assign S_AXI_HP3_WCOUNT[6] = \<const0> ;
  assign S_AXI_HP3_WCOUNT[5] = \<const0> ;
  assign S_AXI_HP3_WCOUNT[4] = \<const0> ;
  assign S_AXI_HP3_WCOUNT[3] = \<const0> ;
  assign S_AXI_HP3_WCOUNT[2] = \<const0> ;
  assign S_AXI_HP3_WCOUNT[1] = \<const0> ;
  assign S_AXI_HP3_WCOUNT[0] = \<const0> ;
  assign S_AXI_HP3_WREADY = \<const0> ;
  assign TRACE_CLK_OUT = \<const0> ;
  assign TRACE_CTL = \TRACE_CTL_PIPE[0] ;
  assign TRACE_DATA[1:0] = \TRACE_DATA_PIPE[0] ;
  assign TTC0_WAVE0_OUT = \<const0> ;
  assign TTC0_WAVE1_OUT = \<const0> ;
  assign TTC0_WAVE2_OUT = \<const0> ;
  assign TTC1_WAVE0_OUT = \<const0> ;
  assign TTC1_WAVE1_OUT = \<const0> ;
  assign TTC1_WAVE2_OUT = \<const0> ;
  assign UART0_DTRN = \<const0> ;
  assign UART0_RTSN = \<const0> ;
  assign UART0_TX = \<const0> ;
  assign UART1_DTRN = \<const0> ;
  assign UART1_RTSN = \<const0> ;
  assign UART1_TX = \<const0> ;
  assign USB0_PORT_INDCTL[1] = \<const0> ;
  assign USB0_PORT_INDCTL[0] = \<const0> ;
  assign USB0_VBUS_PWRSELECT = \<const0> ;
  assign USB1_PORT_INDCTL[1] = \<const0> ;
  assign USB1_PORT_INDCTL[0] = \<const0> ;
  assign USB1_VBUS_PWRSELECT = \<const0> ;
  assign WDT_RST_OUT = \<const0> ;
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF DDR_CAS_n_BIBUF
       (.IO(buffered_DDR_CAS_n),
        .PAD(DDR_CAS_n));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF DDR_CKE_BIBUF
       (.IO(buffered_DDR_CKE),
        .PAD(DDR_CKE));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF DDR_CS_n_BIBUF
       (.IO(buffered_DDR_CS_n),
        .PAD(DDR_CS_n));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF DDR_Clk_BIBUF
       (.IO(buffered_DDR_Clk),
        .PAD(DDR_Clk));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF DDR_Clk_n_BIBUF
       (.IO(buffered_DDR_Clk_n),
        .PAD(DDR_Clk_n));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF DDR_DRSTB_BIBUF
       (.IO(buffered_DDR_DRSTB),
        .PAD(DDR_DRSTB));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF DDR_ODT_BIBUF
       (.IO(buffered_DDR_ODT),
        .PAD(DDR_ODT));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF DDR_RAS_n_BIBUF
       (.IO(buffered_DDR_RAS_n),
        .PAD(DDR_RAS_n));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF DDR_VRN_BIBUF
       (.IO(buffered_DDR_VRN),
        .PAD(DDR_VRN));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF DDR_VRP_BIBUF
       (.IO(buffered_DDR_VRP),
        .PAD(DDR_VRP));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF DDR_WEB_BIBUF
       (.IO(buffered_DDR_WEB),
        .PAD(DDR_WEB));
  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  PS7 PS7_i
       (.DDRA(buffered_DDR_Addr),
        .DDRARB({1'b0,1'b0,1'b0,1'b0}),
        .DDRBA(buffered_DDR_BankAddr),
        .DDRCASB(buffered_DDR_CAS_n),
        .DDRCKE(buffered_DDR_CKE),
        .DDRCKN(buffered_DDR_Clk_n),
        .DDRCKP(buffered_DDR_Clk),
        .DDRCSB(buffered_DDR_CS_n),
        .DDRDM(buffered_DDR_DM),
        .DDRDQ(buffered_DDR_DQ),
        .DDRDQSN(buffered_DDR_DQS_n),
        .DDRDQSP(buffered_DDR_DQS),
        .DDRDRSTB(buffered_DDR_DRSTB),
        .DDRODT(buffered_DDR_ODT),
        .DDRRASB(buffered_DDR_RAS_n),
        .DDRVRN(buffered_DDR_VRN),
        .DDRVRP(buffered_DDR_VRP),
        .DDRWEB(buffered_DDR_WEB),
        .DMA0ACLK(1'b0),
        .DMA0DAREADY(1'b0),
        .DMA0DATYPE({PS7_i_n_224,PS7_i_n_225}),
        .DMA0DAVALID(PS7_i_n_0),
        .DMA0DRLAST(1'b0),
        .DMA0DRREADY(PS7_i_n_1),
        .DMA0DRTYPE({1'b0,1'b0}),
        .DMA0DRVALID(1'b0),
        .DMA0RSTN(PS7_i_n_2),
        .DMA1ACLK(1'b0),
        .DMA1DAREADY(1'b0),
        .DMA1DATYPE({PS7_i_n_226,PS7_i_n_227}),
        .DMA1DAVALID(PS7_i_n_3),
        .DMA1DRLAST(1'b0),
        .DMA1DRREADY(PS7_i_n_4),
        .DMA1DRTYPE({1'b0,1'b0}),
        .DMA1DRVALID(1'b0),
        .DMA1RSTN(PS7_i_n_5),
        .DMA2ACLK(1'b0),
        .DMA2DAREADY(1'b0),
        .DMA2DATYPE({PS7_i_n_228,PS7_i_n_229}),
        .DMA2DAVALID(PS7_i_n_6),
        .DMA2DRLAST(1'b0),
        .DMA2DRREADY(PS7_i_n_7),
        .DMA2DRTYPE({1'b0,1'b0}),
        .DMA2DRVALID(1'b0),
        .DMA2RSTN(PS7_i_n_8),
        .DMA3ACLK(1'b0),
        .DMA3DAREADY(1'b0),
        .DMA3DATYPE({PS7_i_n_230,PS7_i_n_231}),
        .DMA3DAVALID(PS7_i_n_9),
        .DMA3DRLAST(1'b0),
        .DMA3DRREADY(PS7_i_n_10),
        .DMA3DRTYPE({1'b0,1'b0}),
        .DMA3DRVALID(1'b0),
        .DMA3RSTN(PS7_i_n_11),
        .EMIOCAN0PHYRX(1'b0),
        .EMIOCAN0PHYTX(PS7_i_n_12),
        .EMIOCAN1PHYRX(1'b0),
        .EMIOCAN1PHYTX(PS7_i_n_13),
        .EMIOENET0EXTINTIN(1'b0),
        .EMIOENET0GMIICOL(1'b0),
        .EMIOENET0GMIICRS(1'b0),
        .EMIOENET0GMIIRXCLK(1'b0),
        .EMIOENET0GMIIRXD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .EMIOENET0GMIIRXDV(1'b0),
        .EMIOENET0GMIIRXER(1'b0),
        .EMIOENET0GMIITXCLK(1'b0),
        .EMIOENET0GMIITXD(NLW_PS7_i_EMIOENET0GMIITXD_UNCONNECTED[7:0]),
        .EMIOENET0GMIITXEN(NLW_PS7_i_EMIOENET0GMIITXEN_UNCONNECTED),
        .EMIOENET0GMIITXER(NLW_PS7_i_EMIOENET0GMIITXER_UNCONNECTED),
        .EMIOENET0MDIOI(1'b0),
        .EMIOENET0MDIOMDC(PS7_i_n_16),
        .EMIOENET0MDIOO(PS7_i_n_17),
        .EMIOENET0MDIOTN(ENET0_MDIO_T_n),
        .EMIOENET0PTPDELAYREQRX(PS7_i_n_19),
        .EMIOENET0PTPDELAYREQTX(PS7_i_n_20),
        .EMIOENET0PTPPDELAYREQRX(PS7_i_n_21),
        .EMIOENET0PTPPDELAYREQTX(PS7_i_n_22),
        .EMIOENET0PTPPDELAYRESPRX(PS7_i_n_23),
        .EMIOENET0PTPPDELAYRESPTX(PS7_i_n_24),
        .EMIOENET0PTPSYNCFRAMERX(PS7_i_n_25),
        .EMIOENET0PTPSYNCFRAMETX(PS7_i_n_26),
        .EMIOENET0SOFRX(PS7_i_n_27),
        .EMIOENET0SOFTX(PS7_i_n_28),
        .EMIOENET1EXTINTIN(1'b0),
        .EMIOENET1GMIICOL(1'b0),
        .EMIOENET1GMIICRS(1'b0),
        .EMIOENET1GMIIRXCLK(1'b0),
        .EMIOENET1GMIIRXD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .EMIOENET1GMIIRXDV(1'b0),
        .EMIOENET1GMIIRXER(1'b0),
        .EMIOENET1GMIITXCLK(1'b0),
        .EMIOENET1GMIITXD(NLW_PS7_i_EMIOENET1GMIITXD_UNCONNECTED[7:0]),
        .EMIOENET1GMIITXEN(NLW_PS7_i_EMIOENET1GMIITXEN_UNCONNECTED),
        .EMIOENET1GMIITXER(NLW_PS7_i_EMIOENET1GMIITXER_UNCONNECTED),
        .EMIOENET1MDIOI(1'b0),
        .EMIOENET1MDIOMDC(PS7_i_n_31),
        .EMIOENET1MDIOO(PS7_i_n_32),
        .EMIOENET1MDIOTN(ENET1_MDIO_T_n),
        .EMIOENET1PTPDELAYREQRX(PS7_i_n_34),
        .EMIOENET1PTPDELAYREQTX(PS7_i_n_35),
        .EMIOENET1PTPPDELAYREQRX(PS7_i_n_36),
        .EMIOENET1PTPPDELAYREQTX(PS7_i_n_37),
        .EMIOENET1PTPPDELAYRESPRX(PS7_i_n_38),
        .EMIOENET1PTPPDELAYRESPTX(PS7_i_n_39),
        .EMIOENET1PTPSYNCFRAMERX(PS7_i_n_40),
        .EMIOENET1PTPSYNCFRAMETX(PS7_i_n_41),
        .EMIOENET1SOFRX(PS7_i_n_42),
        .EMIOENET1SOFTX(PS7_i_n_43),
        .EMIOGPIOI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .EMIOGPIOO({PS7_i_n_873,PS7_i_n_874,PS7_i_n_875,PS7_i_n_876,PS7_i_n_877,PS7_i_n_878,PS7_i_n_879,PS7_i_n_880,PS7_i_n_881,PS7_i_n_882,PS7_i_n_883,PS7_i_n_884,PS7_i_n_885,PS7_i_n_886,PS7_i_n_887,PS7_i_n_888,PS7_i_n_889,PS7_i_n_890,PS7_i_n_891,PS7_i_n_892,PS7_i_n_893,PS7_i_n_894,PS7_i_n_895,PS7_i_n_896,PS7_i_n_897,PS7_i_n_898,PS7_i_n_899,PS7_i_n_900,PS7_i_n_901,PS7_i_n_902,PS7_i_n_903,PS7_i_n_904,PS7_i_n_905,PS7_i_n_906,PS7_i_n_907,PS7_i_n_908,PS7_i_n_909,PS7_i_n_910,PS7_i_n_911,PS7_i_n_912,PS7_i_n_913,PS7_i_n_914,PS7_i_n_915,PS7_i_n_916,PS7_i_n_917,PS7_i_n_918,PS7_i_n_919,PS7_i_n_920,PS7_i_n_921,PS7_i_n_922,PS7_i_n_923,PS7_i_n_924,PS7_i_n_925,PS7_i_n_926,PS7_i_n_927,PS7_i_n_928,PS7_i_n_929,PS7_i_n_930,PS7_i_n_931,PS7_i_n_932,PS7_i_n_933,PS7_i_n_934,PS7_i_n_935,PS7_i_n_936}),
        .EMIOGPIOTN(gpio_out_t_n),
        .EMIOI2C0SCLI(1'b0),
        .EMIOI2C0SCLO(PS7_i_n_44),
        .EMIOI2C0SCLTN(I2C0_SCL_T_n),
        .EMIOI2C0SDAI(1'b0),
        .EMIOI2C0SDAO(PS7_i_n_46),
        .EMIOI2C0SDATN(I2C0_SDA_T_n),
        .EMIOI2C1SCLI(1'b0),
        .EMIOI2C1SCLO(PS7_i_n_48),
        .EMIOI2C1SCLTN(I2C1_SCL_T_n),
        .EMIOI2C1SDAI(1'b0),
        .EMIOI2C1SDAO(PS7_i_n_50),
        .EMIOI2C1SDATN(I2C1_SDA_T_n),
        .EMIOPJTAGTCK(1'b0),
        .EMIOPJTAGTDI(1'b0),
        .EMIOPJTAGTDO(NLW_PS7_i_EMIOPJTAGTDO_UNCONNECTED),
        .EMIOPJTAGTDTN(NLW_PS7_i_EMIOPJTAGTDTN_UNCONNECTED),
        .EMIOPJTAGTMS(1'b0),
        .EMIOSDIO0BUSPOW(PS7_i_n_54),
        .EMIOSDIO0BUSVOLT({PS7_i_n_321,PS7_i_n_322,PS7_i_n_323}),
        .EMIOSDIO0CDN(1'b0),
        .EMIOSDIO0CLK(PS7_i_n_55),
        .EMIOSDIO0CLKFB(1'b0),
        .EMIOSDIO0CMDI(1'b0),
        .EMIOSDIO0CMDO(PS7_i_n_56),
        .EMIOSDIO0CMDTN(SDIO0_CMD_T_n),
        .EMIOSDIO0DATAI({1'b0,1'b0,1'b0,1'b0}),
        .EMIOSDIO0DATAO({PS7_i_n_689,PS7_i_n_690,PS7_i_n_691,PS7_i_n_692}),
        .EMIOSDIO0DATATN(SDIO0_DATA_T_n),
        .EMIOSDIO0LED(PS7_i_n_58),
        .EMIOSDIO0WP(1'b0),
        .EMIOSDIO1BUSPOW(PS7_i_n_59),
        .EMIOSDIO1BUSVOLT({PS7_i_n_324,PS7_i_n_325,PS7_i_n_326}),
        .EMIOSDIO1CDN(1'b0),
        .EMIOSDIO1CLK(PS7_i_n_60),
        .EMIOSDIO1CLKFB(1'b0),
        .EMIOSDIO1CMDI(1'b0),
        .EMIOSDIO1CMDO(PS7_i_n_61),
        .EMIOSDIO1CMDTN(SDIO1_CMD_T_n),
        .EMIOSDIO1DATAI({1'b0,1'b0,1'b0,1'b0}),
        .EMIOSDIO1DATAO({PS7_i_n_697,PS7_i_n_698,PS7_i_n_699,PS7_i_n_700}),
        .EMIOSDIO1DATATN(SDIO1_DATA_T_n),
        .EMIOSDIO1LED(PS7_i_n_63),
        .EMIOSDIO1WP(1'b0),
        .EMIOSPI0MI(1'b0),
        .EMIOSPI0MO(PS7_i_n_64),
        .EMIOSPI0MOTN(SPI0_MOSI_T_n),
        .EMIOSPI0SCLKI(1'b0),
        .EMIOSPI0SCLKO(PS7_i_n_66),
        .EMIOSPI0SCLKTN(SPI0_SCLK_T_n),
        .EMIOSPI0SI(1'b0),
        .EMIOSPI0SO(PS7_i_n_68),
        .EMIOSPI0SSIN(1'b0),
        .EMIOSPI0SSNTN(SPI0_SS_T_n),
        .EMIOSPI0SSON({PS7_i_n_327,PS7_i_n_328,PS7_i_n_329}),
        .EMIOSPI0STN(SPI0_MISO_T_n),
        .EMIOSPI1MI(1'b0),
        .EMIOSPI1MO(PS7_i_n_71),
        .EMIOSPI1MOTN(SPI1_MOSI_T_n),
        .EMIOSPI1SCLKI(1'b0),
        .EMIOSPI1SCLKO(PS7_i_n_73),
        .EMIOSPI1SCLKTN(SPI1_SCLK_T_n),
        .EMIOSPI1SI(1'b0),
        .EMIOSPI1SO(PS7_i_n_75),
        .EMIOSPI1SSIN(1'b0),
        .EMIOSPI1SSNTN(SPI1_SS_T_n),
        .EMIOSPI1SSON({PS7_i_n_330,PS7_i_n_331,PS7_i_n_332}),
        .EMIOSPI1STN(SPI1_MISO_T_n),
        .EMIOSRAMINTIN(1'b0),
        .EMIOTRACECLK(1'b0),
        .EMIOTRACECTL(NLW_PS7_i_EMIOTRACECTL_UNCONNECTED),
        .EMIOTRACEDATA(NLW_PS7_i_EMIOTRACEDATA_UNCONNECTED[31:0]),
        .EMIOTTC0CLKI({1'b0,1'b0,1'b0}),
        .EMIOTTC0WAVEO({PS7_i_n_333,PS7_i_n_334,PS7_i_n_335}),
        .EMIOTTC1CLKI({1'b0,1'b0,1'b0}),
        .EMIOTTC1WAVEO({PS7_i_n_336,PS7_i_n_337,PS7_i_n_338}),
        .EMIOUART0CTSN(1'b0),
        .EMIOUART0DCDN(1'b0),
        .EMIOUART0DSRN(1'b0),
        .EMIOUART0DTRN(PS7_i_n_79),
        .EMIOUART0RIN(1'b0),
        .EMIOUART0RTSN(PS7_i_n_80),
        .EMIOUART0RX(1'b1),
        .EMIOUART0TX(PS7_i_n_81),
        .EMIOUART1CTSN(1'b0),
        .EMIOUART1DCDN(1'b0),
        .EMIOUART1DSRN(1'b0),
        .EMIOUART1DTRN(PS7_i_n_82),
        .EMIOUART1RIN(1'b0),
        .EMIOUART1RTSN(PS7_i_n_83),
        .EMIOUART1RX(1'b1),
        .EMIOUART1TX(PS7_i_n_84),
        .EMIOUSB0PORTINDCTL({PS7_i_n_232,PS7_i_n_233}),
        .EMIOUSB0VBUSPWRFAULT(1'b0),
        .EMIOUSB0VBUSPWRSELECT(PS7_i_n_85),
        .EMIOUSB1PORTINDCTL({PS7_i_n_234,PS7_i_n_235}),
        .EMIOUSB1VBUSPWRFAULT(1'b0),
        .EMIOUSB1VBUSPWRSELECT(PS7_i_n_86),
        .EMIOWDTCLKI(1'b0),
        .EMIOWDTRSTO(PS7_i_n_87),
        .EVENTEVENTI(1'b0),
        .EVENTEVENTO(PS7_i_n_88),
        .EVENTSTANDBYWFE({PS7_i_n_236,PS7_i_n_237}),
        .EVENTSTANDBYWFI({PS7_i_n_238,PS7_i_n_239}),
        .FCLKCLK({PS7_i_n_705,PS7_i_n_706,FCLK_CLK_unbuffered}),
        .FCLKCLKTRIGN({1'b0,1'b0,1'b0,1'b0}),
        .FCLKRESETN({PS7_i_n_709,PS7_i_n_710,PS7_i_n_711,FCLK_RESET0_N}),
        .FPGAIDLEN(1'b0),
        .FTMDTRACEINATID({1'b0,1'b0,1'b0,1'b0}),
        .FTMDTRACEINCLOCK(1'b0),
        .FTMDTRACEINDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .FTMDTRACEINVALID(1'b0),
        .FTMTF2PDEBUG({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .FTMTF2PTRIG({1'b0,1'b0,1'b0,1'b0}),
        .FTMTF2PTRIGACK({PS7_i_n_713,PS7_i_n_714,PS7_i_n_715,PS7_i_n_716}),
        .FTMTP2FDEBUG({PS7_i_n_401,PS7_i_n_402,PS7_i_n_403,PS7_i_n_404,PS7_i_n_405,PS7_i_n_406,PS7_i_n_407,PS7_i_n_408,PS7_i_n_409,PS7_i_n_410,PS7_i_n_411,PS7_i_n_412,PS7_i_n_413,PS7_i_n_414,PS7_i_n_415,PS7_i_n_416,PS7_i_n_417,PS7_i_n_418,PS7_i_n_419,PS7_i_n_420,PS7_i_n_421,PS7_i_n_422,PS7_i_n_423,PS7_i_n_424,PS7_i_n_425,PS7_i_n_426,PS7_i_n_427,PS7_i_n_428,PS7_i_n_429,PS7_i_n_430,PS7_i_n_431,PS7_i_n_432}),
        .FTMTP2FTRIG({PS7_i_n_717,PS7_i_n_718,PS7_i_n_719,PS7_i_n_720}),
        .FTMTP2FTRIGACK({1'b0,1'b0,1'b0,1'b0}),
        .IRQF2P({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .IRQP2F({PS7_i_n_292,PS7_i_n_293,PS7_i_n_294,PS7_i_n_295,PS7_i_n_296,PS7_i_n_297,PS7_i_n_298,PS7_i_n_299,PS7_i_n_300,PS7_i_n_301,PS7_i_n_302,PS7_i_n_303,PS7_i_n_304,PS7_i_n_305,PS7_i_n_306,PS7_i_n_307,PS7_i_n_308,PS7_i_n_309,PS7_i_n_310,PS7_i_n_311,PS7_i_n_312,PS7_i_n_313,PS7_i_n_314,PS7_i_n_315,PS7_i_n_316,PS7_i_n_317,PS7_i_n_318,PS7_i_n_319,PS7_i_n_320}),
        .MAXIGP0ACLK(FCLK_CLK0),
        .MAXIGP0ARADDR(M_AXI_GP0_ARADDR),
        .MAXIGP0ARBURST(M_AXI_GP0_ARBURST),
        .MAXIGP0ARCACHE({PS7_i_n_721,PS7_i_n_722,NLW_PS7_i_MAXIGP0ARCACHE_UNCONNECTED[1],PS7_i_n_724}),
        .MAXIGP0ARESETN(PS7_i_n_89),
        .MAXIGP0ARID(M_AXI_GP0_ARID),
        .MAXIGP0ARLEN(M_AXI_GP0_ARLEN),
        .MAXIGP0ARLOCK({PS7_i_n_242,PS7_i_n_243}),
        .MAXIGP0ARPROT(M_AXI_GP0_ARPROT),
        .MAXIGP0ARQOS({PS7_i_n_729,PS7_i_n_730,PS7_i_n_731,PS7_i_n_732}),
        .MAXIGP0ARREADY(M_AXI_GP0_ARREADY),
        .MAXIGP0ARSIZE(\^M_AXI_GP0_ARSIZE ),
        .MAXIGP0ARVALID(M_AXI_GP0_ARVALID),
        .MAXIGP0AWADDR(M_AXI_GP0_AWADDR),
        .MAXIGP0AWBURST(M_AXI_GP0_AWBURST),
        .MAXIGP0AWCACHE({PS7_i_n_733,PS7_i_n_734,NLW_PS7_i_MAXIGP0AWCACHE_UNCONNECTED[1],PS7_i_n_736}),
        .MAXIGP0AWID(M_AXI_GP0_AWID),
        .MAXIGP0AWLEN(M_AXI_GP0_AWLEN),
        .MAXIGP0AWLOCK({PS7_i_n_248,PS7_i_n_249}),
        .MAXIGP0AWPROT(M_AXI_GP0_AWPROT),
        .MAXIGP0AWQOS({PS7_i_n_741,PS7_i_n_742,PS7_i_n_743,PS7_i_n_744}),
        .MAXIGP0AWREADY(M_AXI_GP0_AWREADY),
        .MAXIGP0AWSIZE(\^M_AXI_GP0_AWSIZE ),
        .MAXIGP0AWVALID(M_AXI_GP0_AWVALID),
        .MAXIGP0BID(M_AXI_GP0_BID),
        .MAXIGP0BREADY(M_AXI_GP0_BREADY),
        .MAXIGP0BRESP(M_AXI_GP0_BRESP),
        .MAXIGP0BVALID(M_AXI_GP0_BVALID),
        .MAXIGP0RDATA(M_AXI_GP0_RDATA),
        .MAXIGP0RID(M_AXI_GP0_RID),
        .MAXIGP0RLAST(M_AXI_GP0_RLAST),
        .MAXIGP0RREADY(M_AXI_GP0_RREADY),
        .MAXIGP0RRESP(M_AXI_GP0_RRESP),
        .MAXIGP0RVALID(M_AXI_GP0_RVALID),
        .MAXIGP0WDATA(M_AXI_GP0_WDATA),
        .MAXIGP0WID({PS7_i_n_176,PS7_i_n_177,PS7_i_n_178,PS7_i_n_179,PS7_i_n_180,PS7_i_n_181,PS7_i_n_182,PS7_i_n_183,PS7_i_n_184,PS7_i_n_185,PS7_i_n_186,PS7_i_n_187}),
        .MAXIGP0WLAST(PS7_i_n_94),
        .MAXIGP0WREADY(M_AXI_GP0_WREADY),
        .MAXIGP0WSTRB(M_AXI_GP0_WSTRB),
        .MAXIGP0WVALID(M_AXI_GP0_WVALID),
        .MAXIGP1ACLK(1'b0),
        .MAXIGP1ARADDR({PS7_i_n_529,PS7_i_n_530,PS7_i_n_531,PS7_i_n_532,PS7_i_n_533,PS7_i_n_534,PS7_i_n_535,PS7_i_n_536,PS7_i_n_537,PS7_i_n_538,PS7_i_n_539,PS7_i_n_540,PS7_i_n_541,PS7_i_n_542,PS7_i_n_543,PS7_i_n_544,PS7_i_n_545,PS7_i_n_546,PS7_i_n_547,PS7_i_n_548,PS7_i_n_549,PS7_i_n_550,PS7_i_n_551,PS7_i_n_552,PS7_i_n_553,PS7_i_n_554,PS7_i_n_555,PS7_i_n_556,PS7_i_n_557,PS7_i_n_558,PS7_i_n_559,PS7_i_n_560}),
        .MAXIGP1ARBURST({PS7_i_n_252,PS7_i_n_253}),
        .MAXIGP1ARCACHE({PS7_i_n_749,PS7_i_n_750,NLW_PS7_i_MAXIGP1ARCACHE_UNCONNECTED[1],PS7_i_n_752}),
        .MAXIGP1ARESETN(PS7_i_n_96),
        .MAXIGP1ARID({PS7_i_n_188,PS7_i_n_189,PS7_i_n_190,PS7_i_n_191,PS7_i_n_192,PS7_i_n_193,PS7_i_n_194,PS7_i_n_195,PS7_i_n_196,PS7_i_n_197,PS7_i_n_198,PS7_i_n_199}),
        .MAXIGP1ARLEN({PS7_i_n_753,PS7_i_n_754,PS7_i_n_755,PS7_i_n_756}),
        .MAXIGP1ARLOCK({PS7_i_n_254,PS7_i_n_255}),
        .MAXIGP1ARPROT({PS7_i_n_345,PS7_i_n_346,PS7_i_n_347}),
        .MAXIGP1ARQOS({PS7_i_n_757,PS7_i_n_758,PS7_i_n_759,PS7_i_n_760}),
        .MAXIGP1ARREADY(1'b0),
        .MAXIGP1ARSIZE({PS7_i_n_256,PS7_i_n_257}),
        .MAXIGP1ARVALID(PS7_i_n_97),
        .MAXIGP1AWADDR({PS7_i_n_561,PS7_i_n_562,PS7_i_n_563,PS7_i_n_564,PS7_i_n_565,PS7_i_n_566,PS7_i_n_567,PS7_i_n_568,PS7_i_n_569,PS7_i_n_570,PS7_i_n_571,PS7_i_n_572,PS7_i_n_573,PS7_i_n_574,PS7_i_n_575,PS7_i_n_576,PS7_i_n_577,PS7_i_n_578,PS7_i_n_579,PS7_i_n_580,PS7_i_n_581,PS7_i_n_582,PS7_i_n_583,PS7_i_n_584,PS7_i_n_585,PS7_i_n_586,PS7_i_n_587,PS7_i_n_588,PS7_i_n_589,PS7_i_n_590,PS7_i_n_591,PS7_i_n_592}),
        .MAXIGP1AWBURST({PS7_i_n_258,PS7_i_n_259}),
        .MAXIGP1AWCACHE({PS7_i_n_761,PS7_i_n_762,NLW_PS7_i_MAXIGP1AWCACHE_UNCONNECTED[1],PS7_i_n_764}),
        .MAXIGP1AWID({PS7_i_n_200,PS7_i_n_201,PS7_i_n_202,PS7_i_n_203,PS7_i_n_204,PS7_i_n_205,PS7_i_n_206,PS7_i_n_207,PS7_i_n_208,PS7_i_n_209,PS7_i_n_210,PS7_i_n_211}),
        .MAXIGP1AWLEN({PS7_i_n_765,PS7_i_n_766,PS7_i_n_767,PS7_i_n_768}),
        .MAXIGP1AWLOCK({PS7_i_n_260,PS7_i_n_261}),
        .MAXIGP1AWPROT({PS7_i_n_348,PS7_i_n_349,PS7_i_n_350}),
        .MAXIGP1AWQOS({PS7_i_n_769,PS7_i_n_770,PS7_i_n_771,PS7_i_n_772}),
        .MAXIGP1AWREADY(1'b0),
        .MAXIGP1AWSIZE({PS7_i_n_262,PS7_i_n_263}),
        .MAXIGP1AWVALID(PS7_i_n_98),
        .MAXIGP1BID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MAXIGP1BREADY(PS7_i_n_99),
        .MAXIGP1BRESP({1'b0,1'b0}),
        .MAXIGP1BVALID(1'b0),
        .MAXIGP1RDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MAXIGP1RID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MAXIGP1RLAST(1'b0),
        .MAXIGP1RREADY(PS7_i_n_100),
        .MAXIGP1RRESP({1'b0,1'b0}),
        .MAXIGP1RVALID(1'b0),
        .MAXIGP1WDATA({PS7_i_n_593,PS7_i_n_594,PS7_i_n_595,PS7_i_n_596,PS7_i_n_597,PS7_i_n_598,PS7_i_n_599,PS7_i_n_600,PS7_i_n_601,PS7_i_n_602,PS7_i_n_603,PS7_i_n_604,PS7_i_n_605,PS7_i_n_606,PS7_i_n_607,PS7_i_n_608,PS7_i_n_609,PS7_i_n_610,PS7_i_n_611,PS7_i_n_612,PS7_i_n_613,PS7_i_n_614,PS7_i_n_615,PS7_i_n_616,PS7_i_n_617,PS7_i_n_618,PS7_i_n_619,PS7_i_n_620,PS7_i_n_621,PS7_i_n_622,PS7_i_n_623,PS7_i_n_624}),
        .MAXIGP1WID({PS7_i_n_212,PS7_i_n_213,PS7_i_n_214,PS7_i_n_215,PS7_i_n_216,PS7_i_n_217,PS7_i_n_218,PS7_i_n_219,PS7_i_n_220,PS7_i_n_221,PS7_i_n_222,PS7_i_n_223}),
        .MAXIGP1WLAST(PS7_i_n_101),
        .MAXIGP1WREADY(1'b0),
        .MAXIGP1WSTRB({PS7_i_n_773,PS7_i_n_774,PS7_i_n_775,PS7_i_n_776}),
        .MAXIGP1WVALID(PS7_i_n_102),
        .MIO(buffered_MIO),
        .PSCLK(buffered_PS_CLK),
        .PSPORB(buffered_PS_PORB),
        .PSSRSTB(buffered_PS_SRSTB),
        .SAXIACPACLK(1'b0),
        .SAXIACPARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIACPARBURST({1'b0,1'b0}),
        .SAXIACPARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIACPARESETN(PS7_i_n_103),
        .SAXIACPARID({1'b0,1'b0,1'b0}),
        .SAXIACPARLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIACPARLOCK({1'b0,1'b0}),
        .SAXIACPARPROT({1'b0,1'b0,1'b0}),
        .SAXIACPARQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIACPARREADY(PS7_i_n_104),
        .SAXIACPARSIZE({1'b0,1'b0}),
        .SAXIACPARUSER({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIACPARVALID(1'b0),
        .SAXIACPAWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIACPAWBURST({1'b0,1'b0}),
        .SAXIACPAWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIACPAWID({1'b0,1'b0,1'b0}),
        .SAXIACPAWLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIACPAWLOCK({1'b0,1'b0}),
        .SAXIACPAWPROT({1'b0,1'b0,1'b0}),
        .SAXIACPAWQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIACPAWREADY(PS7_i_n_105),
        .SAXIACPAWSIZE({1'b0,1'b0}),
        .SAXIACPAWUSER({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIACPAWVALID(1'b0),
        .SAXIACPBID({PS7_i_n_351,PS7_i_n_352,PS7_i_n_353}),
        .SAXIACPBREADY(1'b0),
        .SAXIACPBRESP({PS7_i_n_264,PS7_i_n_265}),
        .SAXIACPBVALID(PS7_i_n_106),
        .SAXIACPRDATA({PS7_i_n_1001,PS7_i_n_1002,PS7_i_n_1003,PS7_i_n_1004,PS7_i_n_1005,PS7_i_n_1006,PS7_i_n_1007,PS7_i_n_1008,PS7_i_n_1009,PS7_i_n_1010,PS7_i_n_1011,PS7_i_n_1012,PS7_i_n_1013,PS7_i_n_1014,PS7_i_n_1015,PS7_i_n_1016,PS7_i_n_1017,PS7_i_n_1018,PS7_i_n_1019,PS7_i_n_1020,PS7_i_n_1021,PS7_i_n_1022,PS7_i_n_1023,PS7_i_n_1024,PS7_i_n_1025,PS7_i_n_1026,PS7_i_n_1027,PS7_i_n_1028,PS7_i_n_1029,PS7_i_n_1030,PS7_i_n_1031,PS7_i_n_1032,PS7_i_n_1033,PS7_i_n_1034,PS7_i_n_1035,PS7_i_n_1036,PS7_i_n_1037,PS7_i_n_1038,PS7_i_n_1039,PS7_i_n_1040,PS7_i_n_1041,PS7_i_n_1042,PS7_i_n_1043,PS7_i_n_1044,PS7_i_n_1045,PS7_i_n_1046,PS7_i_n_1047,PS7_i_n_1048,PS7_i_n_1049,PS7_i_n_1050,PS7_i_n_1051,PS7_i_n_1052,PS7_i_n_1053,PS7_i_n_1054,PS7_i_n_1055,PS7_i_n_1056,PS7_i_n_1057,PS7_i_n_1058,PS7_i_n_1059,PS7_i_n_1060,PS7_i_n_1061,PS7_i_n_1062,PS7_i_n_1063,PS7_i_n_1064}),
        .SAXIACPRID({PS7_i_n_354,PS7_i_n_355,PS7_i_n_356}),
        .SAXIACPRLAST(PS7_i_n_107),
        .SAXIACPRREADY(1'b0),
        .SAXIACPRRESP({PS7_i_n_266,PS7_i_n_267}),
        .SAXIACPRVALID(PS7_i_n_108),
        .SAXIACPWDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIACPWID({1'b0,1'b0,1'b0}),
        .SAXIACPWLAST(1'b0),
        .SAXIACPWREADY(PS7_i_n_109),
        .SAXIACPWSTRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIACPWVALID(1'b0),
        .SAXIGP0ACLK(1'b0),
        .SAXIGP0ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP0ARBURST({1'b0,1'b0}),
        .SAXIGP0ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP0ARESETN(PS7_i_n_110),
        .SAXIGP0ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP0ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP0ARLOCK({1'b0,1'b0}),
        .SAXIGP0ARPROT({1'b0,1'b0,1'b0}),
        .SAXIGP0ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP0ARREADY(PS7_i_n_111),
        .SAXIGP0ARSIZE({1'b0,1'b0}),
        .SAXIGP0ARVALID(1'b0),
        .SAXIGP0AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP0AWBURST({1'b0,1'b0}),
        .SAXIGP0AWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP0AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP0AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP0AWLOCK({1'b0,1'b0}),
        .SAXIGP0AWPROT({1'b0,1'b0,1'b0}),
        .SAXIGP0AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP0AWREADY(PS7_i_n_112),
        .SAXIGP0AWSIZE({1'b0,1'b0}),
        .SAXIGP0AWVALID(1'b0),
        .SAXIGP0BID({PS7_i_n_777,PS7_i_n_778,PS7_i_n_779,PS7_i_n_780,PS7_i_n_781,PS7_i_n_782}),
        .SAXIGP0BREADY(1'b0),
        .SAXIGP0BRESP({PS7_i_n_268,PS7_i_n_269}),
        .SAXIGP0BVALID(PS7_i_n_113),
        .SAXIGP0RDATA({PS7_i_n_625,PS7_i_n_626,PS7_i_n_627,PS7_i_n_628,PS7_i_n_629,PS7_i_n_630,PS7_i_n_631,PS7_i_n_632,PS7_i_n_633,PS7_i_n_634,PS7_i_n_635,PS7_i_n_636,PS7_i_n_637,PS7_i_n_638,PS7_i_n_639,PS7_i_n_640,PS7_i_n_641,PS7_i_n_642,PS7_i_n_643,PS7_i_n_644,PS7_i_n_645,PS7_i_n_646,PS7_i_n_647,PS7_i_n_648,PS7_i_n_649,PS7_i_n_650,PS7_i_n_651,PS7_i_n_652,PS7_i_n_653,PS7_i_n_654,PS7_i_n_655,PS7_i_n_656}),
        .SAXIGP0RID({PS7_i_n_783,PS7_i_n_784,PS7_i_n_785,PS7_i_n_786,PS7_i_n_787,PS7_i_n_788}),
        .SAXIGP0RLAST(PS7_i_n_114),
        .SAXIGP0RREADY(1'b0),
        .SAXIGP0RRESP({PS7_i_n_270,PS7_i_n_271}),
        .SAXIGP0RVALID(PS7_i_n_115),
        .SAXIGP0WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP0WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP0WLAST(1'b0),
        .SAXIGP0WREADY(PS7_i_n_116),
        .SAXIGP0WSTRB({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP0WVALID(1'b0),
        .SAXIGP1ACLK(1'b0),
        .SAXIGP1ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP1ARBURST({1'b0,1'b0}),
        .SAXIGP1ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP1ARESETN(PS7_i_n_117),
        .SAXIGP1ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP1ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP1ARLOCK({1'b0,1'b0}),
        .SAXIGP1ARPROT({1'b0,1'b0,1'b0}),
        .SAXIGP1ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP1ARREADY(PS7_i_n_118),
        .SAXIGP1ARSIZE({1'b0,1'b0}),
        .SAXIGP1ARVALID(1'b0),
        .SAXIGP1AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP1AWBURST({1'b0,1'b0}),
        .SAXIGP1AWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP1AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP1AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP1AWLOCK({1'b0,1'b0}),
        .SAXIGP1AWPROT({1'b0,1'b0,1'b0}),
        .SAXIGP1AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP1AWREADY(PS7_i_n_119),
        .SAXIGP1AWSIZE({1'b0,1'b0}),
        .SAXIGP1AWVALID(1'b0),
        .SAXIGP1BID({PS7_i_n_789,PS7_i_n_790,PS7_i_n_791,PS7_i_n_792,PS7_i_n_793,PS7_i_n_794}),
        .SAXIGP1BREADY(1'b0),
        .SAXIGP1BRESP({PS7_i_n_272,PS7_i_n_273}),
        .SAXIGP1BVALID(PS7_i_n_120),
        .SAXIGP1RDATA({PS7_i_n_657,PS7_i_n_658,PS7_i_n_659,PS7_i_n_660,PS7_i_n_661,PS7_i_n_662,PS7_i_n_663,PS7_i_n_664,PS7_i_n_665,PS7_i_n_666,PS7_i_n_667,PS7_i_n_668,PS7_i_n_669,PS7_i_n_670,PS7_i_n_671,PS7_i_n_672,PS7_i_n_673,PS7_i_n_674,PS7_i_n_675,PS7_i_n_676,PS7_i_n_677,PS7_i_n_678,PS7_i_n_679,PS7_i_n_680,PS7_i_n_681,PS7_i_n_682,PS7_i_n_683,PS7_i_n_684,PS7_i_n_685,PS7_i_n_686,PS7_i_n_687,PS7_i_n_688}),
        .SAXIGP1RID({PS7_i_n_795,PS7_i_n_796,PS7_i_n_797,PS7_i_n_798,PS7_i_n_799,PS7_i_n_800}),
        .SAXIGP1RLAST(PS7_i_n_121),
        .SAXIGP1RREADY(1'b0),
        .SAXIGP1RRESP({PS7_i_n_274,PS7_i_n_275}),
        .SAXIGP1RVALID(PS7_i_n_122),
        .SAXIGP1WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP1WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP1WLAST(1'b0),
        .SAXIGP1WREADY(PS7_i_n_123),
        .SAXIGP1WSTRB({1'b0,1'b0,1'b0,1'b0}),
        .SAXIGP1WVALID(1'b0),
        .SAXIHP0ACLK(1'b0),
        .SAXIHP0ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP0ARBURST({1'b0,1'b0}),
        .SAXIHP0ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP0ARESETN(PS7_i_n_124),
        .SAXIHP0ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP0ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP0ARLOCK({1'b0,1'b0}),
        .SAXIHP0ARPROT({1'b0,1'b0,1'b0}),
        .SAXIHP0ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP0ARREADY(PS7_i_n_125),
        .SAXIHP0ARSIZE({1'b0,1'b0}),
        .SAXIHP0ARVALID(1'b0),
        .SAXIHP0AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP0AWBURST({1'b0,1'b0}),
        .SAXIHP0AWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP0AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP0AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP0AWLOCK({1'b0,1'b0}),
        .SAXIHP0AWPROT({1'b0,1'b0,1'b0}),
        .SAXIHP0AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP0AWREADY(PS7_i_n_126),
        .SAXIHP0AWSIZE({1'b0,1'b0}),
        .SAXIHP0AWVALID(1'b0),
        .SAXIHP0BID({PS7_i_n_801,PS7_i_n_802,PS7_i_n_803,PS7_i_n_804,PS7_i_n_805,PS7_i_n_806}),
        .SAXIHP0BREADY(1'b0),
        .SAXIHP0BRESP({PS7_i_n_276,PS7_i_n_277}),
        .SAXIHP0BVALID(PS7_i_n_127),
        .SAXIHP0RACOUNT({PS7_i_n_357,PS7_i_n_358,PS7_i_n_359}),
        .SAXIHP0RCOUNT({PS7_i_n_1337,PS7_i_n_1338,PS7_i_n_1339,PS7_i_n_1340,PS7_i_n_1341,PS7_i_n_1342,PS7_i_n_1343,PS7_i_n_1344}),
        .SAXIHP0RDATA({PS7_i_n_1065,PS7_i_n_1066,PS7_i_n_1067,PS7_i_n_1068,PS7_i_n_1069,PS7_i_n_1070,PS7_i_n_1071,PS7_i_n_1072,PS7_i_n_1073,PS7_i_n_1074,PS7_i_n_1075,PS7_i_n_1076,PS7_i_n_1077,PS7_i_n_1078,PS7_i_n_1079,PS7_i_n_1080,PS7_i_n_1081,PS7_i_n_1082,PS7_i_n_1083,PS7_i_n_1084,PS7_i_n_1085,PS7_i_n_1086,PS7_i_n_1087,PS7_i_n_1088,PS7_i_n_1089,PS7_i_n_1090,PS7_i_n_1091,PS7_i_n_1092,PS7_i_n_1093,PS7_i_n_1094,PS7_i_n_1095,PS7_i_n_1096,PS7_i_n_1097,PS7_i_n_1098,PS7_i_n_1099,PS7_i_n_1100,PS7_i_n_1101,PS7_i_n_1102,PS7_i_n_1103,PS7_i_n_1104,PS7_i_n_1105,PS7_i_n_1106,PS7_i_n_1107,PS7_i_n_1108,PS7_i_n_1109,PS7_i_n_1110,PS7_i_n_1111,PS7_i_n_1112,PS7_i_n_1113,PS7_i_n_1114,PS7_i_n_1115,PS7_i_n_1116,PS7_i_n_1117,PS7_i_n_1118,PS7_i_n_1119,PS7_i_n_1120,PS7_i_n_1121,PS7_i_n_1122,PS7_i_n_1123,PS7_i_n_1124,PS7_i_n_1125,PS7_i_n_1126,PS7_i_n_1127,PS7_i_n_1128}),
        .SAXIHP0RDISSUECAP1EN(1'b0),
        .SAXIHP0RID({PS7_i_n_807,PS7_i_n_808,PS7_i_n_809,PS7_i_n_810,PS7_i_n_811,PS7_i_n_812}),
        .SAXIHP0RLAST(PS7_i_n_128),
        .SAXIHP0RREADY(1'b0),
        .SAXIHP0RRESP({PS7_i_n_278,PS7_i_n_279}),
        .SAXIHP0RVALID(PS7_i_n_129),
        .SAXIHP0WACOUNT({PS7_i_n_813,PS7_i_n_814,PS7_i_n_815,PS7_i_n_816,PS7_i_n_817,PS7_i_n_818}),
        .SAXIHP0WCOUNT({PS7_i_n_1345,PS7_i_n_1346,PS7_i_n_1347,PS7_i_n_1348,PS7_i_n_1349,PS7_i_n_1350,PS7_i_n_1351,PS7_i_n_1352}),
        .SAXIHP0WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP0WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP0WLAST(1'b0),
        .SAXIHP0WREADY(PS7_i_n_130),
        .SAXIHP0WRISSUECAP1EN(1'b0),
        .SAXIHP0WSTRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP0WVALID(1'b0),
        .SAXIHP1ACLK(1'b0),
        .SAXIHP1ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP1ARBURST({1'b0,1'b0}),
        .SAXIHP1ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP1ARESETN(PS7_i_n_131),
        .SAXIHP1ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP1ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP1ARLOCK({1'b0,1'b0}),
        .SAXIHP1ARPROT({1'b0,1'b0,1'b0}),
        .SAXIHP1ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP1ARREADY(PS7_i_n_132),
        .SAXIHP1ARSIZE({1'b0,1'b0}),
        .SAXIHP1ARVALID(1'b0),
        .SAXIHP1AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP1AWBURST({1'b0,1'b0}),
        .SAXIHP1AWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP1AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP1AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP1AWLOCK({1'b0,1'b0}),
        .SAXIHP1AWPROT({1'b0,1'b0,1'b0}),
        .SAXIHP1AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP1AWREADY(PS7_i_n_133),
        .SAXIHP1AWSIZE({1'b0,1'b0}),
        .SAXIHP1AWVALID(1'b0),
        .SAXIHP1BID({PS7_i_n_819,PS7_i_n_820,PS7_i_n_821,PS7_i_n_822,PS7_i_n_823,PS7_i_n_824}),
        .SAXIHP1BREADY(1'b0),
        .SAXIHP1BRESP({PS7_i_n_280,PS7_i_n_281}),
        .SAXIHP1BVALID(PS7_i_n_134),
        .SAXIHP1RACOUNT({PS7_i_n_360,PS7_i_n_361,PS7_i_n_362}),
        .SAXIHP1RCOUNT({PS7_i_n_1353,PS7_i_n_1354,PS7_i_n_1355,PS7_i_n_1356,PS7_i_n_1357,PS7_i_n_1358,PS7_i_n_1359,PS7_i_n_1360}),
        .SAXIHP1RDATA({PS7_i_n_1129,PS7_i_n_1130,PS7_i_n_1131,PS7_i_n_1132,PS7_i_n_1133,PS7_i_n_1134,PS7_i_n_1135,PS7_i_n_1136,PS7_i_n_1137,PS7_i_n_1138,PS7_i_n_1139,PS7_i_n_1140,PS7_i_n_1141,PS7_i_n_1142,PS7_i_n_1143,PS7_i_n_1144,PS7_i_n_1145,PS7_i_n_1146,PS7_i_n_1147,PS7_i_n_1148,PS7_i_n_1149,PS7_i_n_1150,PS7_i_n_1151,PS7_i_n_1152,PS7_i_n_1153,PS7_i_n_1154,PS7_i_n_1155,PS7_i_n_1156,PS7_i_n_1157,PS7_i_n_1158,PS7_i_n_1159,PS7_i_n_1160,PS7_i_n_1161,PS7_i_n_1162,PS7_i_n_1163,PS7_i_n_1164,PS7_i_n_1165,PS7_i_n_1166,PS7_i_n_1167,PS7_i_n_1168,PS7_i_n_1169,PS7_i_n_1170,PS7_i_n_1171,PS7_i_n_1172,PS7_i_n_1173,PS7_i_n_1174,PS7_i_n_1175,PS7_i_n_1176,PS7_i_n_1177,PS7_i_n_1178,PS7_i_n_1179,PS7_i_n_1180,PS7_i_n_1181,PS7_i_n_1182,PS7_i_n_1183,PS7_i_n_1184,PS7_i_n_1185,PS7_i_n_1186,PS7_i_n_1187,PS7_i_n_1188,PS7_i_n_1189,PS7_i_n_1190,PS7_i_n_1191,PS7_i_n_1192}),
        .SAXIHP1RDISSUECAP1EN(1'b0),
        .SAXIHP1RID({PS7_i_n_825,PS7_i_n_826,PS7_i_n_827,PS7_i_n_828,PS7_i_n_829,PS7_i_n_830}),
        .SAXIHP1RLAST(PS7_i_n_135),
        .SAXIHP1RREADY(1'b0),
        .SAXIHP1RRESP({PS7_i_n_282,PS7_i_n_283}),
        .SAXIHP1RVALID(PS7_i_n_136),
        .SAXIHP1WACOUNT({PS7_i_n_831,PS7_i_n_832,PS7_i_n_833,PS7_i_n_834,PS7_i_n_835,PS7_i_n_836}),
        .SAXIHP1WCOUNT({PS7_i_n_1361,PS7_i_n_1362,PS7_i_n_1363,PS7_i_n_1364,PS7_i_n_1365,PS7_i_n_1366,PS7_i_n_1367,PS7_i_n_1368}),
        .SAXIHP1WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP1WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP1WLAST(1'b0),
        .SAXIHP1WREADY(PS7_i_n_137),
        .SAXIHP1WRISSUECAP1EN(1'b0),
        .SAXIHP1WSTRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP1WVALID(1'b0),
        .SAXIHP2ACLK(1'b0),
        .SAXIHP2ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP2ARBURST({1'b0,1'b0}),
        .SAXIHP2ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP2ARESETN(PS7_i_n_138),
        .SAXIHP2ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP2ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP2ARLOCK({1'b0,1'b0}),
        .SAXIHP2ARPROT({1'b0,1'b0,1'b0}),
        .SAXIHP2ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP2ARREADY(PS7_i_n_139),
        .SAXIHP2ARSIZE({1'b0,1'b0}),
        .SAXIHP2ARVALID(1'b0),
        .SAXIHP2AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP2AWBURST({1'b0,1'b0}),
        .SAXIHP2AWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP2AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP2AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP2AWLOCK({1'b0,1'b0}),
        .SAXIHP2AWPROT({1'b0,1'b0,1'b0}),
        .SAXIHP2AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP2AWREADY(PS7_i_n_140),
        .SAXIHP2AWSIZE({1'b0,1'b0}),
        .SAXIHP2AWVALID(1'b0),
        .SAXIHP2BID({PS7_i_n_837,PS7_i_n_838,PS7_i_n_839,PS7_i_n_840,PS7_i_n_841,PS7_i_n_842}),
        .SAXIHP2BREADY(1'b0),
        .SAXIHP2BRESP({PS7_i_n_284,PS7_i_n_285}),
        .SAXIHP2BVALID(PS7_i_n_141),
        .SAXIHP2RACOUNT({PS7_i_n_363,PS7_i_n_364,PS7_i_n_365}),
        .SAXIHP2RCOUNT({PS7_i_n_1369,PS7_i_n_1370,PS7_i_n_1371,PS7_i_n_1372,PS7_i_n_1373,PS7_i_n_1374,PS7_i_n_1375,PS7_i_n_1376}),
        .SAXIHP2RDATA({PS7_i_n_1193,PS7_i_n_1194,PS7_i_n_1195,PS7_i_n_1196,PS7_i_n_1197,PS7_i_n_1198,PS7_i_n_1199,PS7_i_n_1200,PS7_i_n_1201,PS7_i_n_1202,PS7_i_n_1203,PS7_i_n_1204,PS7_i_n_1205,PS7_i_n_1206,PS7_i_n_1207,PS7_i_n_1208,PS7_i_n_1209,PS7_i_n_1210,PS7_i_n_1211,PS7_i_n_1212,PS7_i_n_1213,PS7_i_n_1214,PS7_i_n_1215,PS7_i_n_1216,PS7_i_n_1217,PS7_i_n_1218,PS7_i_n_1219,PS7_i_n_1220,PS7_i_n_1221,PS7_i_n_1222,PS7_i_n_1223,PS7_i_n_1224,PS7_i_n_1225,PS7_i_n_1226,PS7_i_n_1227,PS7_i_n_1228,PS7_i_n_1229,PS7_i_n_1230,PS7_i_n_1231,PS7_i_n_1232,PS7_i_n_1233,PS7_i_n_1234,PS7_i_n_1235,PS7_i_n_1236,PS7_i_n_1237,PS7_i_n_1238,PS7_i_n_1239,PS7_i_n_1240,PS7_i_n_1241,PS7_i_n_1242,PS7_i_n_1243,PS7_i_n_1244,PS7_i_n_1245,PS7_i_n_1246,PS7_i_n_1247,PS7_i_n_1248,PS7_i_n_1249,PS7_i_n_1250,PS7_i_n_1251,PS7_i_n_1252,PS7_i_n_1253,PS7_i_n_1254,PS7_i_n_1255,PS7_i_n_1256}),
        .SAXIHP2RDISSUECAP1EN(1'b0),
        .SAXIHP2RID({PS7_i_n_843,PS7_i_n_844,PS7_i_n_845,PS7_i_n_846,PS7_i_n_847,PS7_i_n_848}),
        .SAXIHP2RLAST(PS7_i_n_142),
        .SAXIHP2RREADY(1'b0),
        .SAXIHP2RRESP({PS7_i_n_286,PS7_i_n_287}),
        .SAXIHP2RVALID(PS7_i_n_143),
        .SAXIHP2WACOUNT({PS7_i_n_849,PS7_i_n_850,PS7_i_n_851,PS7_i_n_852,PS7_i_n_853,PS7_i_n_854}),
        .SAXIHP2WCOUNT({PS7_i_n_1377,PS7_i_n_1378,PS7_i_n_1379,PS7_i_n_1380,PS7_i_n_1381,PS7_i_n_1382,PS7_i_n_1383,PS7_i_n_1384}),
        .SAXIHP2WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP2WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP2WLAST(1'b0),
        .SAXIHP2WREADY(PS7_i_n_144),
        .SAXIHP2WRISSUECAP1EN(1'b0),
        .SAXIHP2WSTRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP2WVALID(1'b0),
        .SAXIHP3ACLK(1'b0),
        .SAXIHP3ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP3ARBURST({1'b0,1'b0}),
        .SAXIHP3ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP3ARESETN(PS7_i_n_145),
        .SAXIHP3ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP3ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP3ARLOCK({1'b0,1'b0}),
        .SAXIHP3ARPROT({1'b0,1'b0,1'b0}),
        .SAXIHP3ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP3ARREADY(PS7_i_n_146),
        .SAXIHP3ARSIZE({1'b0,1'b0}),
        .SAXIHP3ARVALID(1'b0),
        .SAXIHP3AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP3AWBURST({1'b0,1'b0}),
        .SAXIHP3AWCACHE({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP3AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP3AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP3AWLOCK({1'b0,1'b0}),
        .SAXIHP3AWPROT({1'b0,1'b0,1'b0}),
        .SAXIHP3AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP3AWREADY(PS7_i_n_147),
        .SAXIHP3AWSIZE({1'b0,1'b0}),
        .SAXIHP3AWVALID(1'b0),
        .SAXIHP3BID({PS7_i_n_855,PS7_i_n_856,PS7_i_n_857,PS7_i_n_858,PS7_i_n_859,PS7_i_n_860}),
        .SAXIHP3BREADY(1'b0),
        .SAXIHP3BRESP({PS7_i_n_288,PS7_i_n_289}),
        .SAXIHP3BVALID(PS7_i_n_148),
        .SAXIHP3RACOUNT({PS7_i_n_366,PS7_i_n_367,PS7_i_n_368}),
        .SAXIHP3RCOUNT({PS7_i_n_1385,PS7_i_n_1386,PS7_i_n_1387,PS7_i_n_1388,PS7_i_n_1389,PS7_i_n_1390,PS7_i_n_1391,PS7_i_n_1392}),
        .SAXIHP3RDATA({PS7_i_n_1257,PS7_i_n_1258,PS7_i_n_1259,PS7_i_n_1260,PS7_i_n_1261,PS7_i_n_1262,PS7_i_n_1263,PS7_i_n_1264,PS7_i_n_1265,PS7_i_n_1266,PS7_i_n_1267,PS7_i_n_1268,PS7_i_n_1269,PS7_i_n_1270,PS7_i_n_1271,PS7_i_n_1272,PS7_i_n_1273,PS7_i_n_1274,PS7_i_n_1275,PS7_i_n_1276,PS7_i_n_1277,PS7_i_n_1278,PS7_i_n_1279,PS7_i_n_1280,PS7_i_n_1281,PS7_i_n_1282,PS7_i_n_1283,PS7_i_n_1284,PS7_i_n_1285,PS7_i_n_1286,PS7_i_n_1287,PS7_i_n_1288,PS7_i_n_1289,PS7_i_n_1290,PS7_i_n_1291,PS7_i_n_1292,PS7_i_n_1293,PS7_i_n_1294,PS7_i_n_1295,PS7_i_n_1296,PS7_i_n_1297,PS7_i_n_1298,PS7_i_n_1299,PS7_i_n_1300,PS7_i_n_1301,PS7_i_n_1302,PS7_i_n_1303,PS7_i_n_1304,PS7_i_n_1305,PS7_i_n_1306,PS7_i_n_1307,PS7_i_n_1308,PS7_i_n_1309,PS7_i_n_1310,PS7_i_n_1311,PS7_i_n_1312,PS7_i_n_1313,PS7_i_n_1314,PS7_i_n_1315,PS7_i_n_1316,PS7_i_n_1317,PS7_i_n_1318,PS7_i_n_1319,PS7_i_n_1320}),
        .SAXIHP3RDISSUECAP1EN(1'b0),
        .SAXIHP3RID({PS7_i_n_861,PS7_i_n_862,PS7_i_n_863,PS7_i_n_864,PS7_i_n_865,PS7_i_n_866}),
        .SAXIHP3RLAST(PS7_i_n_149),
        .SAXIHP3RREADY(1'b0),
        .SAXIHP3RRESP({PS7_i_n_290,PS7_i_n_291}),
        .SAXIHP3RVALID(PS7_i_n_150),
        .SAXIHP3WACOUNT({PS7_i_n_867,PS7_i_n_868,PS7_i_n_869,PS7_i_n_870,PS7_i_n_871,PS7_i_n_872}),
        .SAXIHP3WCOUNT({PS7_i_n_1393,PS7_i_n_1394,PS7_i_n_1395,PS7_i_n_1396,PS7_i_n_1397,PS7_i_n_1398,PS7_i_n_1399,PS7_i_n_1400}),
        .SAXIHP3WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP3WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP3WLAST(1'b0),
        .SAXIHP3WREADY(PS7_i_n_151),
        .SAXIHP3WRISSUECAP1EN(1'b0),
        .SAXIHP3WSTRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SAXIHP3WVALID(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF PS_CLK_BIBUF
       (.IO(buffered_PS_CLK),
        .PAD(PS_CLK));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF PS_PORB_BIBUF
       (.IO(buffered_PS_PORB),
        .PAD(PS_PORB));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF PS_SRSTB_BIBUF
       (.IO(buffered_PS_SRSTB),
        .PAD(PS_SRSTB));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG \buffer_fclk_clk_0.FCLK_CLK_0_BUFG 
       (.I(FCLK_CLK_unbuffered[0]),
        .O(FCLK_CLK0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG \buffer_fclk_clk_1.FCLK_CLK_1_BUFG 
       (.I(FCLK_CLK_unbuffered[1]),
        .O(FCLK_CLK1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[0].MIO_BIBUF 
       (.IO(buffered_MIO[0]),
        .PAD(MIO[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[10].MIO_BIBUF 
       (.IO(buffered_MIO[10]),
        .PAD(MIO[10]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[11].MIO_BIBUF 
       (.IO(buffered_MIO[11]),
        .PAD(MIO[11]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[12].MIO_BIBUF 
       (.IO(buffered_MIO[12]),
        .PAD(MIO[12]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[13].MIO_BIBUF 
       (.IO(buffered_MIO[13]),
        .PAD(MIO[13]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[14].MIO_BIBUF 
       (.IO(buffered_MIO[14]),
        .PAD(MIO[14]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[15].MIO_BIBUF 
       (.IO(buffered_MIO[15]),
        .PAD(MIO[15]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[16].MIO_BIBUF 
       (.IO(buffered_MIO[16]),
        .PAD(MIO[16]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[17].MIO_BIBUF 
       (.IO(buffered_MIO[17]),
        .PAD(MIO[17]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[18].MIO_BIBUF 
       (.IO(buffered_MIO[18]),
        .PAD(MIO[18]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[19].MIO_BIBUF 
       (.IO(buffered_MIO[19]),
        .PAD(MIO[19]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[1].MIO_BIBUF 
       (.IO(buffered_MIO[1]),
        .PAD(MIO[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[20].MIO_BIBUF 
       (.IO(buffered_MIO[20]),
        .PAD(MIO[20]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[21].MIO_BIBUF 
       (.IO(buffered_MIO[21]),
        .PAD(MIO[21]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[22].MIO_BIBUF 
       (.IO(buffered_MIO[22]),
        .PAD(MIO[22]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[23].MIO_BIBUF 
       (.IO(buffered_MIO[23]),
        .PAD(MIO[23]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[24].MIO_BIBUF 
       (.IO(buffered_MIO[24]),
        .PAD(MIO[24]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[25].MIO_BIBUF 
       (.IO(buffered_MIO[25]),
        .PAD(MIO[25]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[26].MIO_BIBUF 
       (.IO(buffered_MIO[26]),
        .PAD(MIO[26]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[27].MIO_BIBUF 
       (.IO(buffered_MIO[27]),
        .PAD(MIO[27]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[28].MIO_BIBUF 
       (.IO(buffered_MIO[28]),
        .PAD(MIO[28]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[29].MIO_BIBUF 
       (.IO(buffered_MIO[29]),
        .PAD(MIO[29]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[2].MIO_BIBUF 
       (.IO(buffered_MIO[2]),
        .PAD(MIO[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[30].MIO_BIBUF 
       (.IO(buffered_MIO[30]),
        .PAD(MIO[30]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[31].MIO_BIBUF 
       (.IO(buffered_MIO[31]),
        .PAD(MIO[31]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[32].MIO_BIBUF 
       (.IO(buffered_MIO[32]),
        .PAD(MIO[32]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[33].MIO_BIBUF 
       (.IO(buffered_MIO[33]),
        .PAD(MIO[33]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[34].MIO_BIBUF 
       (.IO(buffered_MIO[34]),
        .PAD(MIO[34]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[35].MIO_BIBUF 
       (.IO(buffered_MIO[35]),
        .PAD(MIO[35]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[36].MIO_BIBUF 
       (.IO(buffered_MIO[36]),
        .PAD(MIO[36]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[37].MIO_BIBUF 
       (.IO(buffered_MIO[37]),
        .PAD(MIO[37]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[38].MIO_BIBUF 
       (.IO(buffered_MIO[38]),
        .PAD(MIO[38]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[39].MIO_BIBUF 
       (.IO(buffered_MIO[39]),
        .PAD(MIO[39]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[3].MIO_BIBUF 
       (.IO(buffered_MIO[3]),
        .PAD(MIO[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[40].MIO_BIBUF 
       (.IO(buffered_MIO[40]),
        .PAD(MIO[40]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[41].MIO_BIBUF 
       (.IO(buffered_MIO[41]),
        .PAD(MIO[41]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[42].MIO_BIBUF 
       (.IO(buffered_MIO[42]),
        .PAD(MIO[42]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[43].MIO_BIBUF 
       (.IO(buffered_MIO[43]),
        .PAD(MIO[43]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[44].MIO_BIBUF 
       (.IO(buffered_MIO[44]),
        .PAD(MIO[44]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[45].MIO_BIBUF 
       (.IO(buffered_MIO[45]),
        .PAD(MIO[45]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[46].MIO_BIBUF 
       (.IO(buffered_MIO[46]),
        .PAD(MIO[46]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[47].MIO_BIBUF 
       (.IO(buffered_MIO[47]),
        .PAD(MIO[47]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[48].MIO_BIBUF 
       (.IO(buffered_MIO[48]),
        .PAD(MIO[48]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[49].MIO_BIBUF 
       (.IO(buffered_MIO[49]),
        .PAD(MIO[49]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[4].MIO_BIBUF 
       (.IO(buffered_MIO[4]),
        .PAD(MIO[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[50].MIO_BIBUF 
       (.IO(buffered_MIO[50]),
        .PAD(MIO[50]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[51].MIO_BIBUF 
       (.IO(buffered_MIO[51]),
        .PAD(MIO[51]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[52].MIO_BIBUF 
       (.IO(buffered_MIO[52]),
        .PAD(MIO[52]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[53].MIO_BIBUF 
       (.IO(buffered_MIO[53]),
        .PAD(MIO[53]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[5].MIO_BIBUF 
       (.IO(buffered_MIO[5]),
        .PAD(MIO[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[6].MIO_BIBUF 
       (.IO(buffered_MIO[6]),
        .PAD(MIO[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[7].MIO_BIBUF 
       (.IO(buffered_MIO[7]),
        .PAD(MIO[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[8].MIO_BIBUF 
       (.IO(buffered_MIO[8]),
        .PAD(MIO[8]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk13[9].MIO_BIBUF 
       (.IO(buffered_MIO[9]),
        .PAD(MIO[9]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk14[0].DDR_BankAddr_BIBUF 
       (.IO(buffered_DDR_BankAddr[0]),
        .PAD(DDR_BankAddr[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk14[1].DDR_BankAddr_BIBUF 
       (.IO(buffered_DDR_BankAddr[1]),
        .PAD(DDR_BankAddr[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk14[2].DDR_BankAddr_BIBUF 
       (.IO(buffered_DDR_BankAddr[2]),
        .PAD(DDR_BankAddr[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[0].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[0]),
        .PAD(DDR_Addr[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[10].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[10]),
        .PAD(DDR_Addr[10]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[11].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[11]),
        .PAD(DDR_Addr[11]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[12].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[12]),
        .PAD(DDR_Addr[12]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[13].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[13]),
        .PAD(DDR_Addr[13]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[14].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[14]),
        .PAD(DDR_Addr[14]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[1].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[1]),
        .PAD(DDR_Addr[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[2].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[2]),
        .PAD(DDR_Addr[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[3].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[3]),
        .PAD(DDR_Addr[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[4].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[4]),
        .PAD(DDR_Addr[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[5].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[5]),
        .PAD(DDR_Addr[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[6].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[6]),
        .PAD(DDR_Addr[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[7].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[7]),
        .PAD(DDR_Addr[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[8].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[8]),
        .PAD(DDR_Addr[8]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk15[9].DDR_Addr_BIBUF 
       (.IO(buffered_DDR_Addr[9]),
        .PAD(DDR_Addr[9]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk16[0].DDR_DM_BIBUF 
       (.IO(buffered_DDR_DM[0]),
        .PAD(DDR_DM[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk16[1].DDR_DM_BIBUF 
       (.IO(buffered_DDR_DM[1]),
        .PAD(DDR_DM[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk16[2].DDR_DM_BIBUF 
       (.IO(buffered_DDR_DM[2]),
        .PAD(DDR_DM[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk16[3].DDR_DM_BIBUF 
       (.IO(buffered_DDR_DM[3]),
        .PAD(DDR_DM[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[0].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[0]),
        .PAD(DDR_DQ[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[10].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[10]),
        .PAD(DDR_DQ[10]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[11].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[11]),
        .PAD(DDR_DQ[11]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[12].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[12]),
        .PAD(DDR_DQ[12]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[13].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[13]),
        .PAD(DDR_DQ[13]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[14].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[14]),
        .PAD(DDR_DQ[14]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[15].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[15]),
        .PAD(DDR_DQ[15]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[16].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[16]),
        .PAD(DDR_DQ[16]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[17].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[17]),
        .PAD(DDR_DQ[17]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[18].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[18]),
        .PAD(DDR_DQ[18]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[19].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[19]),
        .PAD(DDR_DQ[19]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[1].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[1]),
        .PAD(DDR_DQ[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[20].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[20]),
        .PAD(DDR_DQ[20]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[21].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[21]),
        .PAD(DDR_DQ[21]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[22].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[22]),
        .PAD(DDR_DQ[22]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[23].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[23]),
        .PAD(DDR_DQ[23]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[24].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[24]),
        .PAD(DDR_DQ[24]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[25].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[25]),
        .PAD(DDR_DQ[25]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[26].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[26]),
        .PAD(DDR_DQ[26]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[27].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[27]),
        .PAD(DDR_DQ[27]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[28].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[28]),
        .PAD(DDR_DQ[28]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[29].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[29]),
        .PAD(DDR_DQ[29]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[2].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[2]),
        .PAD(DDR_DQ[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[30].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[30]),
        .PAD(DDR_DQ[30]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[31].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[31]),
        .PAD(DDR_DQ[31]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[3].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[3]),
        .PAD(DDR_DQ[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[4].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[4]),
        .PAD(DDR_DQ[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[5].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[5]),
        .PAD(DDR_DQ[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[6].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[6]),
        .PAD(DDR_DQ[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[7].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[7]),
        .PAD(DDR_DQ[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[8].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[8]),
        .PAD(DDR_DQ[8]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk17[9].DDR_DQ_BIBUF 
       (.IO(buffered_DDR_DQ[9]),
        .PAD(DDR_DQ[9]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk18[0].DDR_DQS_n_BIBUF 
       (.IO(buffered_DDR_DQS_n[0]),
        .PAD(DDR_DQS_n[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk18[1].DDR_DQS_n_BIBUF 
       (.IO(buffered_DDR_DQS_n[1]),
        .PAD(DDR_DQS_n[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk18[2].DDR_DQS_n_BIBUF 
       (.IO(buffered_DDR_DQS_n[2]),
        .PAD(DDR_DQS_n[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk18[3].DDR_DQS_n_BIBUF 
       (.IO(buffered_DDR_DQS_n[3]),
        .PAD(DDR_DQS_n[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk19[0].DDR_DQS_BIBUF 
       (.IO(buffered_DDR_DQS[0]),
        .PAD(DDR_DQS[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk19[1].DDR_DQS_BIBUF 
       (.IO(buffered_DDR_DQS[1]),
        .PAD(DDR_DQS[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk19[2].DDR_DQS_BIBUF 
       (.IO(buffered_DDR_DQS[2]),
        .PAD(DDR_DQS[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BIBUF \genblk19[3].DDR_DQS_BIBUF 
       (.IO(buffered_DDR_DQS[3]),
        .PAD(DDR_DQS[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(\TRACE_CTL_PIPE[0] ));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[0] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[7] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[7] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[6] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[6] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[5] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[5] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[4] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[4] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[3] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[3] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[0] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_20
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[2] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_21
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[2] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_22
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[1] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_23
       (.I0(1'b0),
        .O(\TRACE_DATA_PIPE[1] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(\TRACE_CTL_PIPE[7] ));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(\TRACE_CTL_PIPE[6] ));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(\TRACE_CTL_PIPE[5] ));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(\TRACE_CTL_PIPE[4] ));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(\TRACE_CTL_PIPE[3] ));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(\TRACE_CTL_PIPE[2] ));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(\TRACE_CTL_PIPE[1] ));
endmodule

(* ORIG_REF_NAME = "s00_couplers_imp_166NYF5" *) 
module dwa_ps_bd_s00_couplers_imp_166NYF5
   (S00_AXI_awready,
    S00_AXI_wready,
    S00_AXI_bid,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_arready,
    S00_AXI_rid,
    S00_AXI_rdata,
    S00_AXI_rresp,
    S00_AXI_rlast,
    S00_AXI_rvalid,
    M00_AXI_awaddr,
    M00_AXI_awprot,
    M00_AXI_awvalid,
    M00_AXI_wdata,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M00_AXI_bready,
    M00_AXI_araddr,
    M00_AXI_arprot,
    M00_AXI_arvalid,
    M00_AXI_rready,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_awid,
    S00_AXI_awaddr,
    S00_AXI_awlen,
    S00_AXI_awsize,
    S00_AXI_awburst,
    S00_AXI_awprot,
    S00_AXI_awvalid,
    S00_AXI_wdata,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    S00_AXI_bready,
    S00_AXI_arid,
    S00_AXI_araddr,
    S00_AXI_arlen,
    S00_AXI_arsize,
    S00_AXI_arburst,
    S00_AXI_arprot,
    S00_AXI_arvalid,
    S00_AXI_rready,
    M00_AXI_awready,
    M00_AXI_wready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_arready,
    M00_AXI_rdata,
    M00_AXI_rresp,
    M00_AXI_rvalid);
  output S00_AXI_awready;
  output S00_AXI_wready;
  output [11:0]S00_AXI_bid;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output S00_AXI_arready;
  output [11:0]S00_AXI_rid;
  output [31:0]S00_AXI_rdata;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rlast;
  output S00_AXI_rvalid;
  output [31:0]M00_AXI_awaddr;
  output [2:0]M00_AXI_awprot;
  output M00_AXI_awvalid;
  output [31:0]M00_AXI_wdata;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  output M00_AXI_bready;
  output [31:0]M00_AXI_araddr;
  output [2:0]M00_AXI_arprot;
  output M00_AXI_arvalid;
  output M00_AXI_rready;
  input S00_ACLK;
  input S00_ARESETN;
  input [11:0]S00_AXI_awid;
  input [31:0]S00_AXI_awaddr;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awsize;
  input [1:0]S00_AXI_awburst;
  input [2:0]S00_AXI_awprot;
  input S00_AXI_awvalid;
  input [31:0]S00_AXI_wdata;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;
  input S00_AXI_bready;
  input [11:0]S00_AXI_arid;
  input [31:0]S00_AXI_araddr;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arsize;
  input [1:0]S00_AXI_arburst;
  input [2:0]S00_AXI_arprot;
  input S00_AXI_arvalid;
  input S00_AXI_rready;
  input M00_AXI_awready;
  input M00_AXI_wready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input M00_AXI_arready;
  input [31:0]M00_AXI_rdata;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;

  wire [31:0]M00_AXI_araddr;
  wire [2:0]M00_AXI_arprot;
  wire M00_AXI_arready;
  wire M00_AXI_arvalid;
  wire [31:0]M00_AXI_awaddr;
  wire [2:0]M00_AXI_awprot;
  wire M00_AXI_awready;
  wire M00_AXI_awvalid;
  wire M00_AXI_bready;
  wire [1:0]M00_AXI_bresp;
  wire M00_AXI_bvalid;
  wire [31:0]M00_AXI_rdata;
  wire M00_AXI_rready;
  wire [1:0]M00_AXI_rresp;
  wire M00_AXI_rvalid;
  wire [31:0]M00_AXI_wdata;
  wire M00_AXI_wready;
  wire [3:0]M00_AXI_wstrb;
  wire M00_AXI_wvalid;
  wire S00_ACLK;
  wire S00_ARESETN;
  wire [31:0]S00_AXI_araddr;
  wire [1:0]S00_AXI_arburst;
  wire [11:0]S00_AXI_arid;
  wire [3:0]S00_AXI_arlen;
  wire [2:0]S00_AXI_arprot;
  wire S00_AXI_arready;
  wire [1:0]S00_AXI_arsize;
  wire S00_AXI_arvalid;
  wire [31:0]S00_AXI_awaddr;
  wire [1:0]S00_AXI_awburst;
  wire [11:0]S00_AXI_awid;
  wire [3:0]S00_AXI_awlen;
  wire [2:0]S00_AXI_awprot;
  wire S00_AXI_awready;
  wire [1:0]S00_AXI_awsize;
  wire S00_AXI_awvalid;
  wire [11:0]S00_AXI_bid;
  wire S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire S00_AXI_bvalid;
  wire [31:0]S00_AXI_rdata;
  wire [11:0]S00_AXI_rid;
  wire S00_AXI_rlast;
  wire S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire S00_AXI_rvalid;
  wire [31:0]S00_AXI_wdata;
  wire S00_AXI_wready;
  wire [3:0]S00_AXI_wstrb;
  wire S00_AXI_wvalid;

  (* CHECK_LICENSE_TYPE = "dwa_ps_bd_auto_pc_0,axi_protocol_converter_v2_1_22_axi_protocol_converter,{}" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* X_CORE_INFO = "axi_protocol_converter_v2_1_22_axi_protocol_converter,Vivado 2020.2" *) 
  dwa_ps_bd_dwa_ps_bd_auto_pc_0 auto_pc
       (.aclk(S00_ACLK),
        .aresetn(S00_ARESETN),
        .m_axi_araddr(M00_AXI_araddr),
        .m_axi_arprot(M00_AXI_arprot),
        .m_axi_arready(M00_AXI_arready),
        .m_axi_arvalid(M00_AXI_arvalid),
        .m_axi_awaddr(M00_AXI_awaddr),
        .m_axi_awprot(M00_AXI_awprot),
        .m_axi_awready(M00_AXI_awready),
        .m_axi_awvalid(M00_AXI_awvalid),
        .m_axi_bready(M00_AXI_bready),
        .m_axi_bresp(M00_AXI_bresp),
        .m_axi_bvalid(M00_AXI_bvalid),
        .m_axi_rdata(M00_AXI_rdata),
        .m_axi_rready(M00_AXI_rready),
        .m_axi_rresp(M00_AXI_rresp),
        .m_axi_rvalid(M00_AXI_rvalid),
        .m_axi_wdata(M00_AXI_wdata),
        .m_axi_wready(M00_AXI_wready),
        .m_axi_wstrb(M00_AXI_wstrb),
        .m_axi_wvalid(M00_AXI_wvalid),
        .s_axi_araddr(S00_AXI_araddr),
        .s_axi_arburst(S00_AXI_arburst),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(S00_AXI_arid),
        .s_axi_arlen(S00_AXI_arlen),
        .s_axi_arlock({1'b0,1'b0}),
        .s_axi_arprot(S00_AXI_arprot),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(S00_AXI_arready),
        .s_axi_arsize({1'b0,S00_AXI_arsize}),
        .s_axi_arvalid(S00_AXI_arvalid),
        .s_axi_awaddr(S00_AXI_awaddr),
        .s_axi_awburst(S00_AXI_awburst),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(S00_AXI_awid),
        .s_axi_awlen(S00_AXI_awlen),
        .s_axi_awlock({1'b0,1'b0}),
        .s_axi_awprot(S00_AXI_awprot),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(S00_AXI_awready),
        .s_axi_awsize({1'b0,S00_AXI_awsize}),
        .s_axi_awvalid(S00_AXI_awvalid),
        .s_axi_bid(S00_AXI_bid),
        .s_axi_bready(S00_AXI_bready),
        .s_axi_bresp(S00_AXI_bresp),
        .s_axi_bvalid(S00_AXI_bvalid),
        .s_axi_rdata(S00_AXI_rdata),
        .s_axi_rid(S00_AXI_rid),
        .s_axi_rlast(S00_AXI_rlast),
        .s_axi_rready(S00_AXI_rready),
        .s_axi_rresp(S00_AXI_rresp),
        .s_axi_rvalid(S00_AXI_rvalid),
        .s_axi_wdata(S00_AXI_wdata),
        .s_axi_wid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(S00_AXI_wready),
        .s_axi_wstrb(S00_AXI_wstrb),
        .s_axi_wvalid(S00_AXI_wvalid));
endmodule

(* ORIG_REF_NAME = "sequence_psr" *) 
module dwa_ps_bd_sequence_psr
   (bsr_reg_0,
    pr_reg_0,
    lpf_int,
    slowest_sync_clk);
  output bsr_reg_0;
  output pr_reg_0;
  input lpf_int;
  input slowest_sync_clk;

  wire Bsr_out;
  wire Core_i_1_n_0;
  wire MB_out;
  wire Pr_out;
  wire \bsr_dec_reg_n_0_[0] ;
  wire \bsr_dec_reg_n_0_[2] ;
  wire bsr_i_1_n_0;
  wire bsr_reg_0;
  wire \core_dec[0]_i_1_n_0 ;
  wire \core_dec[2]_i_1_n_0 ;
  wire \core_dec_reg_n_0_[0] ;
  wire from_sys_i_1_n_0;
  wire lpf_int;
  wire p_0_in;
  wire [2:0]p_3_out;
  wire [2:0]p_5_out;
  wire pr_dec0__0;
  wire \pr_dec_reg_n_0_[0] ;
  wire \pr_dec_reg_n_0_[1] ;
  wire \pr_dec_reg_n_0_[2] ;
  wire pr_i_1_n_0;
  wire pr_reg_0;
  wire seq_clr;
  wire [5:0]seq_cnt;
  wire seq_cnt_en;
  wire slowest_sync_clk;

  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \ACTIVE_LOW_BSR_OUT_DFF[0].FDRE_BSR_N_i_1 
       (.I0(Bsr_out),
        .O(bsr_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N_i_1 
       (.I0(Pr_out),
        .O(pr_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT2 #(
    .INIT(4'h2)) 
    Core_i_1
       (.I0(MB_out),
        .I1(p_0_in),
        .O(Core_i_1_n_0));
  FDSE #(
    .INIT(1'b1)) 
    Core_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(Core_i_1_n_0),
        .Q(MB_out),
        .S(lpf_int));
  dwa_ps_bd_upcnt_n SEQ_COUNTER
       (.Q(seq_cnt),
        .seq_clr(seq_clr),
        .seq_cnt_en(seq_cnt_en),
        .slowest_sync_clk(slowest_sync_clk));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT4 #(
    .INIT(16'h0090)) 
    \bsr_dec[0]_i_1 
       (.I0(seq_cnt_en),
        .I1(seq_cnt[4]),
        .I2(seq_cnt[3]),
        .I3(seq_cnt[5]),
        .O(p_5_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bsr_dec[2]_i_1 
       (.I0(\pr_dec_reg_n_0_[1] ),
        .I1(\bsr_dec_reg_n_0_[0] ),
        .O(p_5_out[2]));
  FDRE #(
    .INIT(1'b0)) 
    \bsr_dec_reg[0] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_5_out[0]),
        .Q(\bsr_dec_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bsr_dec_reg[2] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_5_out[2]),
        .Q(\bsr_dec_reg_n_0_[2] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT2 #(
    .INIT(4'h2)) 
    bsr_i_1
       (.I0(Bsr_out),
        .I1(\bsr_dec_reg_n_0_[2] ),
        .O(bsr_i_1_n_0));
  FDSE #(
    .INIT(1'b1)) 
    bsr_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(bsr_i_1_n_0),
        .Q(Bsr_out),
        .S(lpf_int));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT4 #(
    .INIT(16'h9000)) 
    \core_dec[0]_i_1 
       (.I0(seq_cnt_en),
        .I1(seq_cnt[4]),
        .I2(seq_cnt[5]),
        .I3(seq_cnt[3]),
        .O(\core_dec[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \core_dec[2]_i_1 
       (.I0(\pr_dec_reg_n_0_[1] ),
        .I1(\core_dec_reg_n_0_[0] ),
        .O(\core_dec[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \core_dec_reg[0] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(\core_dec[0]_i_1_n_0 ),
        .Q(\core_dec_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \core_dec_reg[2] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(\core_dec[2]_i_1_n_0 ),
        .Q(p_0_in),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT2 #(
    .INIT(4'h8)) 
    from_sys_i_1
       (.I0(MB_out),
        .I1(seq_cnt_en),
        .O(from_sys_i_1_n_0));
  FDSE #(
    .INIT(1'b0)) 
    from_sys_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(from_sys_i_1_n_0),
        .Q(seq_cnt_en),
        .S(lpf_int));
  LUT4 #(
    .INIT(16'h0018)) 
    pr_dec0
       (.I0(seq_cnt_en),
        .I1(seq_cnt[0]),
        .I2(seq_cnt[2]),
        .I3(seq_cnt[1]),
        .O(pr_dec0__0));
  LUT4 #(
    .INIT(16'h1080)) 
    \pr_dec[0]_i_1 
       (.I0(seq_cnt_en),
        .I1(seq_cnt[5]),
        .I2(seq_cnt[3]),
        .I3(seq_cnt[4]),
        .O(p_3_out[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \pr_dec[2]_i_1 
       (.I0(\pr_dec_reg_n_0_[1] ),
        .I1(\pr_dec_reg_n_0_[0] ),
        .O(p_3_out[2]));
  FDRE #(
    .INIT(1'b0)) 
    \pr_dec_reg[0] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_3_out[0]),
        .Q(\pr_dec_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pr_dec_reg[1] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(pr_dec0__0),
        .Q(\pr_dec_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pr_dec_reg[2] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_3_out[2]),
        .Q(\pr_dec_reg_n_0_[2] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT2 #(
    .INIT(4'h2)) 
    pr_i_1
       (.I0(Pr_out),
        .I1(\pr_dec_reg_n_0_[2] ),
        .O(pr_i_1_n_0));
  FDSE #(
    .INIT(1'b1)) 
    pr_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(pr_i_1_n_0),
        .Q(Pr_out),
        .S(lpf_int));
  FDRE #(
    .INIT(1'b0)) 
    seq_clr_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(1'b1),
        .Q(seq_clr),
        .R(lpf_int));
endmodule

(* ORIG_REF_NAME = "upcnt_n" *) 
module dwa_ps_bd_upcnt_n
   (Q,
    seq_clr,
    seq_cnt_en,
    slowest_sync_clk);
  output [5:0]Q;
  input seq_clr;
  input seq_cnt_en;
  input slowest_sync_clk;

  wire [5:0]Q;
  wire clear;
  wire [5:0]q_int0;
  wire seq_clr;
  wire seq_cnt_en;
  wire slowest_sync_clk;

  LUT1 #(
    .INIT(2'h1)) 
    \q_int[0]_i_1 
       (.I0(Q[0]),
        .O(q_int0[0]));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \q_int[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(q_int0[1]));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \q_int[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(q_int0[2]));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \q_int[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(q_int0[3]));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \q_int[4]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(q_int0[4]));
  LUT1 #(
    .INIT(2'h1)) 
    \q_int[5]_i_1 
       (.I0(seq_clr),
        .O(clear));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \q_int[5]_i_2 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(q_int0[5]));
  FDRE #(
    .INIT(1'b1)) 
    \q_int_reg[0] 
       (.C(slowest_sync_clk),
        .CE(seq_cnt_en),
        .D(q_int0[0]),
        .Q(Q[0]),
        .R(clear));
  FDRE #(
    .INIT(1'b1)) 
    \q_int_reg[1] 
       (.C(slowest_sync_clk),
        .CE(seq_cnt_en),
        .D(q_int0[1]),
        .Q(Q[1]),
        .R(clear));
  FDRE #(
    .INIT(1'b1)) 
    \q_int_reg[2] 
       (.C(slowest_sync_clk),
        .CE(seq_cnt_en),
        .D(q_int0[2]),
        .Q(Q[2]),
        .R(clear));
  FDRE #(
    .INIT(1'b1)) 
    \q_int_reg[3] 
       (.C(slowest_sync_clk),
        .CE(seq_cnt_en),
        .D(q_int0[3]),
        .Q(Q[3]),
        .R(clear));
  FDRE #(
    .INIT(1'b1)) 
    \q_int_reg[4] 
       (.C(slowest_sync_clk),
        .CE(seq_cnt_en),
        .D(q_int0[4]),
        .Q(Q[4]),
        .R(clear));
  FDRE #(
    .INIT(1'b1)) 
    \q_int_reg[5] 
       (.C(slowest_sync_clk),
        .CE(seq_cnt_en),
        .D(q_int0[5]),
        .Q(Q[5]),
        .R(clear));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
