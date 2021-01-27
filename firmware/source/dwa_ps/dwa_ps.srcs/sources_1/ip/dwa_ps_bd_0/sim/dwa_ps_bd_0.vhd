-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: harvard.edu:dwa:dwa_ps_bd:1.0
-- IP Revision: 2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY dwa_ps_bd_0 IS
  PORT (
    DDR_addr : INOUT STD_LOGIC_VECTOR(14 DOWNTO 0);
    DDR_ba : INOUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DDR_cas_n : INOUT STD_LOGIC;
    DDR_ck_n : INOUT STD_LOGIC;
    DDR_ck_p : INOUT STD_LOGIC;
    DDR_cke : INOUT STD_LOGIC;
    DDR_cs_n : INOUT STD_LOGIC;
    DDR_dm : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DDR_dq : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DDR_dqs_n : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DDR_dqs_p : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DDR_odt : INOUT STD_LOGIC;
    DDR_ras_n : INOUT STD_LOGIC;
    DDR_reset_n : INOUT STD_LOGIC;
    DDR_we_n : INOUT STD_LOGIC;
    FIXED_IO_ddr_vrn : INOUT STD_LOGIC;
    FIXED_IO_ddr_vrp : INOUT STD_LOGIC;
    FIXED_IO_mio : INOUT STD_LOGIC_VECTOR(53 DOWNTO 0);
    FIXED_IO_ps_clk : INOUT STD_LOGIC;
    FIXED_IO_ps_porb : INOUT STD_LOGIC;
    FIXED_IO_ps_srstb : INOUT STD_LOGIC
  );
END dwa_ps_bd_0;

ARCHITECTURE dwa_ps_bd_0_arch OF dwa_ps_bd_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF dwa_ps_bd_0_arch: ARCHITECTURE IS "yes";
  COMPONENT dwa_ps_bd IS
    PORT (
      DDR_addr : INOUT STD_LOGIC_VECTOR(14 DOWNTO 0);
      DDR_ba : INOUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DDR_cas_n : INOUT STD_LOGIC;
      DDR_ck_n : INOUT STD_LOGIC;
      DDR_ck_p : INOUT STD_LOGIC;
      DDR_cke : INOUT STD_LOGIC;
      DDR_cs_n : INOUT STD_LOGIC;
      DDR_dm : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DDR_dq : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DDR_dqs_n : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DDR_dqs_p : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DDR_odt : INOUT STD_LOGIC;
      DDR_ras_n : INOUT STD_LOGIC;
      DDR_reset_n : INOUT STD_LOGIC;
      DDR_we_n : INOUT STD_LOGIC;
      FIXED_IO_ddr_vrn : INOUT STD_LOGIC;
      FIXED_IO_ddr_vrp : INOUT STD_LOGIC;
      FIXED_IO_mio : INOUT STD_LOGIC_VECTOR(53 DOWNTO 0);
      FIXED_IO_ps_clk : INOUT STD_LOGIC;
      FIXED_IO_ps_porb : INOUT STD_LOGIC;
      FIXED_IO_ps_srstb : INOUT STD_LOGIC
    );
  END COMPONENT dwa_ps_bd;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF dwa_ps_bd_0_arch: ARCHITECTURE IS "IPI";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF FIXED_IO_ps_srstb: SIGNAL IS "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB";
  ATTRIBUTE X_INTERFACE_INFO OF FIXED_IO_ps_porb: SIGNAL IS "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB";
  ATTRIBUTE X_INTERFACE_INFO OF FIXED_IO_ps_clk: SIGNAL IS "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK";
  ATTRIBUTE X_INTERFACE_INFO OF FIXED_IO_mio: SIGNAL IS "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO";
  ATTRIBUTE X_INTERFACE_INFO OF FIXED_IO_ddr_vrp: SIGNAL IS "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP";
  ATTRIBUTE X_INTERFACE_PARAMETER OF FIXED_IO_ddr_vrn: SIGNAL IS "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false";
  ATTRIBUTE X_INTERFACE_INFO OF FIXED_IO_ddr_vrn: SIGNAL IS "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_we_n: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR WE_N";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_reset_n: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR RESET_N";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_ras_n: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR RAS_N";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_odt: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR ODT";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_dqs_p: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR DQS_P";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_dqs_n: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR DQS_N";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_dq: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR DQ";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_dm: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR DM";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_cs_n: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR CS_N";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_cke: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR CKE";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_ck_p: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR CK_P";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_ck_n: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR CK_N";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_cas_n: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR CAS_N";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_ba: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR BA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF DDR_addr: SIGNAL IS "XIL_INTERFACENAME DDR, TIMEPERIOD_PS 1250, MEMORY_TYPE COMPONENTS, DATA_WIDTH 8, CS_ENABLED true, DATA_MASK_ENABLED true, SLOT Single, MEM_ADDR_MAP ROW_COLUMN_BANK, BURST_LENGTH 8, AXI_ARBITRATION_SCHEME TDM, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CAN_DEBUG false";
  ATTRIBUTE X_INTERFACE_INFO OF DDR_addr: SIGNAL IS "xilinx.com:interface:ddrx:1.0 DDR ADDR";
BEGIN
  U0 : dwa_ps_bd
    PORT MAP (
      DDR_addr => DDR_addr,
      DDR_ba => DDR_ba,
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm => DDR_dm,
      DDR_dq => DDR_dq,
      DDR_dqs_n => DDR_dqs_n,
      DDR_dqs_p => DDR_dqs_p,
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio => FIXED_IO_mio,
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb
    );
END dwa_ps_bd_0_arch;
