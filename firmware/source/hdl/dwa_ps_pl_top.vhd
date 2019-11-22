--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
--Date        : Fri Sep 27 10:42:39 2019
--Host        : lt2 running 64-bit CentOS Linux release 7.6.1810 (Core)
--Command     : generate_target dwa_ps_bd_wrapper.bd
--Design      : dwa_ps_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
library duneDwa;
use duneDwa.global_def.all;

entity dwa_ps_pl_top is

    port (
        --DWA
        led : out std_logic_vector(3 downto 0);

        acStimX200_obuf : out std_logic := '0';
        acStim_obuf     : out std_logic := '0';

        V_p     : in std_logic;
        V_n     : in std_logic;
        Vaux0_n : in std_logic;
        Vaux0_p : in std_logic;
        Vaux8_n : in std_logic;
        Vaux8_p : in std_logic;

        mainsSquare : in std_logic;

        BB_CLK    : in  std_logic;
        BB_CLK_EN : out std_logic := '1';

        --processing system 
        DDR_addr          : inout STD_LOGIC_VECTOR ( 14 downto 0 );
        DDR_ba            : inout STD_LOGIC_VECTOR ( 2 downto 0 );
        DDR_cas_n         : inout STD_LOGIC;
        DDR_ck_n          : inout STD_LOGIC;
        DDR_ck_p          : inout STD_LOGIC;
        DDR_cke           : inout STD_LOGIC;
        DDR_cs_n          : inout STD_LOGIC;
        DDR_dm            : inout STD_LOGIC_VECTOR ( 3 downto 0 );
        DDR_dq            : inout STD_LOGIC_VECTOR ( 31 downto 0 );
        DDR_dqs_n         : inout STD_LOGIC_VECTOR ( 3 downto 0 );
        DDR_dqs_p         : inout STD_LOGIC_VECTOR ( 3 downto 0 );
        DDR_odt           : inout STD_LOGIC;
        DDR_ras_n         : inout STD_LOGIC;
        DDR_reset_n       : inout STD_LOGIC;
        DDR_we_n          : inout STD_LOGIC;
        FIXED_IO_ddr_vrn  : inout STD_LOGIC;
        FIXED_IO_ddr_vrp  : inout STD_LOGIC;
        FIXED_IO_mio      : inout STD_LOGIC_VECTOR ( 53 downto 0 );
        FIXED_IO_ps_clk   : inout STD_LOGIC;
        FIXED_IO_ps_porb  : inout STD_LOGIC;
        FIXED_IO_ps_srstb : inout STD_LOGIC
    );
end dwa_ps_pl_top;

architecture STRUCTURE of dwa_ps_pl_top is

    component dwa_ps_bd is
        port (
            FIXED_IO_mio         : inout STD_LOGIC_VECTOR ( 53 downto 0 );
            FIXED_IO_ddr_vrn     : inout STD_LOGIC;
            FIXED_IO_ddr_vrp     : inout STD_LOGIC;
            FIXED_IO_ps_srstb    : inout STD_LOGIC;
            FIXED_IO_ps_clk      : inout STD_LOGIC;
            FIXED_IO_ps_porb     : inout STD_LOGIC;
            DDR_cas_n            : inout STD_LOGIC;
            DDR_cke              : inout STD_LOGIC;
            DDR_ck_n             : inout STD_LOGIC;
            DDR_ck_p             : inout STD_LOGIC;
            DDR_cs_n             : inout STD_LOGIC;
            DDR_reset_n          : inout STD_LOGIC;
            DDR_odt              : inout STD_LOGIC;
            DDR_ras_n            : inout STD_LOGIC;
            DDR_we_n             : inout STD_LOGIC;
            DDR_ba               : inout STD_LOGIC_VECTOR ( 2 downto 0 );
            DDR_addr             : inout STD_LOGIC_VECTOR ( 14 downto 0 );
            DDR_dm               : inout STD_LOGIC_VECTOR ( 3 downto 0 );
            DDR_dq               : inout STD_LOGIC_VECTOR ( 31 downto 0 );
            DDR_dqs_n            : inout STD_LOGIC_VECTOR ( 3 downto 0 );
            DDR_dqs_p            : inout STD_LOGIC_VECTOR ( 3 downto 0 );
            M00_AXI_0_awaddr     : out   STD_LOGIC_VECTOR ( 31 downto 0 );
            M00_AXI_0_awprot     : out   STD_LOGIC_VECTOR ( 2 downto 0 );
            M00_AXI_0_awvalid    : out   STD_LOGIC;
            M00_AXI_0_awready    : in    STD_LOGIC;
            M00_AXI_0_wdata      : out   STD_LOGIC_VECTOR ( 31 downto 0 );
            M00_AXI_0_wstrb      : out   STD_LOGIC_VECTOR ( 3 downto 0 );
            M00_AXI_0_wvalid     : out   STD_LOGIC;
            M00_AXI_0_wready     : in    STD_LOGIC;
            M00_AXI_0_bresp      : in    STD_LOGIC_VECTOR ( 1 downto 0 );
            M00_AXI_0_bvalid     : in    STD_LOGIC;
            M00_AXI_0_bready     : out   STD_LOGIC;
            M00_AXI_0_araddr     : out   STD_LOGIC_VECTOR ( 31 downto 0 );
            M00_AXI_0_arprot     : out   STD_LOGIC_VECTOR ( 2 downto 0 );
            M00_AXI_0_arvalid    : out   STD_LOGIC;
            M00_AXI_0_arready    : in    STD_LOGIC;
            M00_AXI_0_rdata      : in    STD_LOGIC_VECTOR ( 31 downto 0 );
            M00_AXI_0_rresp      : in    STD_LOGIC_VECTOR ( 1 downto 0 );
            M00_AXI_0_rvalid     : in    STD_LOGIC;
            M00_AXI_0_rready     : out   STD_LOGIC;
            peripheral_aresetn_0 : out   STD_LOGIC_VECTOR ( 0 to 0 );
            aclk                 : out   STD_LOGIC
        );
    end component dwa_ps_bd;

    component dwa_registers_v1_0_S00_AXI is
        generic (
            C_S_AXI_DATA_WIDTH : integer := 32;
            C_S_AXI_ADDR_WIDTH : integer := 7
        );
        port (
            S_AXI_ACLK    : in  std_logic;
            S_AXI_ARESETN : in  std_logic;
            S_AXI_AWADDR  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_AWPROT  : in  std_logic_vector(2 downto 0);
            S_AXI_AWVALID : in  std_logic;
            S_AXI_AWREADY : out std_logic;
            S_AXI_WDATA   : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_WSTRB   : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
            S_AXI_WVALID  : in  std_logic;
            S_AXI_WREADY  : out std_logic;
            S_AXI_BRESP   : out std_logic_vector(1 downto 0);
            S_AXI_BVALID  : out std_logic;
            S_AXI_BREADY  : in  std_logic;
            S_AXI_ARADDR  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_ARPROT  : in  std_logic_vector(2 downto 0);
            S_AXI_ARVALID : in  std_logic;
            S_AXI_ARREADY : out std_logic;
            S_AXI_RDATA   : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_RRESP   : out std_logic_vector(1 downto 0);
            S_AXI_RVALID  : out std_logic;
            S_AXI_RREADY  : in  std_logic
        );
    end component dwa_registers_v1_0_S00_AXI;

    signal M00_AXI_0_awaddr     : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M00_AXI_0_awprot     : STD_LOGIC_VECTOR ( 2 downto 0 );
    signal M00_AXI_0_awvalid    : STD_LOGIC;
    signal M00_AXI_0_awready    : STD_LOGIC;
    signal M00_AXI_0_wdata      : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M00_AXI_0_wstrb      : STD_LOGIC_VECTOR ( 3 downto 0 );
    signal M00_AXI_0_wvalid     : STD_LOGIC;
    signal M00_AXI_0_wready     : STD_LOGIC;
    signal M00_AXI_0_bresp      : STD_LOGIC_VECTOR ( 1 downto 0 );
    signal M00_AXI_0_bvalid     : STD_LOGIC;
    signal M00_AXI_0_bready     : STD_LOGIC;
    signal M00_AXI_0_araddr     : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M00_AXI_0_arprot     : STD_LOGIC_VECTOR ( 2 downto 0 );
    signal M00_AXI_0_arvalid    : STD_LOGIC;
    signal M00_AXI_0_arready    : STD_LOGIC;
    signal M00_AXI_0_rdata      : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M00_AXI_0_rresp      : STD_LOGIC_VECTOR ( 1 downto 0 );
    signal M00_AXI_0_rvalid     : STD_LOGIC;
    signal M00_AXI_0_rready     : STD_LOGIC;
    signal peripheral_aresetn_0 : STD_LOGIC_VECTOR ( 0 to 0 );
    signal aclk                 : STD_LOGIC;

    signal regFromDwa : SLV_VECTOR_TYPE(31 downto 0)(31 downto 0);
      signal  regFromDwa_strb :   std_logic_vector(31 downto 0);


    signal regToDwa   : SLV_VECTOR_TYPE(31 downto 0)(31 downto 0);
begin

    dwa_ps_bd_i : component dwa_ps_bd
        port map (
            DDR_addr(14 downto 0)         => DDR_addr(14 downto 0),
            DDR_ba(2 downto 0)            => DDR_ba(2 downto 0),
            DDR_cas_n                     => DDR_cas_n,
            DDR_ck_n                      => DDR_ck_n,
            DDR_ck_p                      => DDR_ck_p,
            DDR_cke                       => DDR_cke,
            DDR_cs_n                      => DDR_cs_n,
            DDR_dm(3 downto 0)            => DDR_dm(3 downto 0),
            DDR_dq(31 downto 0)           => DDR_dq(31 downto 0),
            DDR_dqs_n(3 downto 0)         => DDR_dqs_n(3 downto 0),
            DDR_dqs_p(3 downto 0)         => DDR_dqs_p(3 downto 0),
            DDR_odt                       => DDR_odt,
            DDR_ras_n                     => DDR_ras_n,
            DDR_reset_n                   => DDR_reset_n,
            DDR_we_n                      => DDR_we_n,
            FIXED_IO_ddr_vrn              => FIXED_IO_ddr_vrn,
            FIXED_IO_ddr_vrp              => FIXED_IO_ddr_vrp,
            FIXED_IO_mio(53 downto 0)     => FIXED_IO_mio(53 downto 0),
            FIXED_IO_ps_clk               => FIXED_IO_ps_clk,
            FIXED_IO_ps_porb              => FIXED_IO_ps_porb,
            FIXED_IO_ps_srstb             => FIXED_IO_ps_srstb,
            M00_AXI_0_araddr(31 downto 0) => M00_AXI_0_araddr(31 downto 0),
            M00_AXI_0_arprot(2 downto 0)  => M00_AXI_0_arprot(2 downto 0),
            M00_AXI_0_arready             => M00_AXI_0_arready,
            M00_AXI_0_arvalid             => M00_AXI_0_arvalid,
            M00_AXI_0_awaddr(31 downto 0) => M00_AXI_0_awaddr(31 downto 0),
            M00_AXI_0_awprot(2 downto 0)  => M00_AXI_0_awprot(2 downto 0),
            M00_AXI_0_awready             => M00_AXI_0_awready,
            M00_AXI_0_awvalid             => M00_AXI_0_awvalid,
            M00_AXI_0_bready              => M00_AXI_0_bready,
            M00_AXI_0_bresp(1 downto 0)   => M00_AXI_0_bresp(1 downto 0),
            M00_AXI_0_bvalid              => M00_AXI_0_bvalid,
            M00_AXI_0_rdata(31 downto 0)  => M00_AXI_0_rdata(31 downto 0),
            M00_AXI_0_rready              => M00_AXI_0_rready,
            M00_AXI_0_rresp(1 downto 0)   => M00_AXI_0_rresp(1 downto 0),
            M00_AXI_0_rvalid              => M00_AXI_0_rvalid,
            M00_AXI_0_wdata(31 downto 0)  => M00_AXI_0_wdata(31 downto 0),
            M00_AXI_0_wready              => M00_AXI_0_wready,
            M00_AXI_0_wstrb(3 downto 0)   => M00_AXI_0_wstrb(3 downto 0),
            M00_AXI_0_wvalid              => M00_AXI_0_wvalid,
            aclk                          => aclk,
            peripheral_aresetn_0(0)       => peripheral_aresetn_0(0)
        );


    dwa_registers_v1_0_S00_AXI_1 : entity duneDwa.dwa_registers_v1_0_S00_AXI
        port map (
            S_AXI_ACLK    => aclk,
            S_AXI_ARESETN => peripheral_aresetn_0(0),
            S_AXI_AWADDR  => M00_AXI_0_AWADDR(6 downto 0),
            S_AXI_AWPROT  => M00_AXI_0_AWPROT,
            S_AXI_AWVALID => M00_AXI_0_AWVALID,
            S_AXI_AWREADY => M00_AXI_0_AWREADY,
            S_AXI_WDATA   => M00_AXI_0_WDATA,
            S_AXI_WSTRB   => M00_AXI_0_WSTRB,
            S_AXI_WVALID  => M00_AXI_0_WVALID,
            S_AXI_WREADY  => M00_AXI_0_WREADY,
            S_AXI_BRESP   => M00_AXI_0_BRESP,
            S_AXI_BVALID  => M00_AXI_0_BVALID,
            S_AXI_BREADY  => M00_AXI_0_BREADY,
            S_AXI_ARADDR  => M00_AXI_0_ARADDR(6 downto 0),
            S_AXI_ARPROT  => M00_AXI_0_ARPROT,
            S_AXI_ARVALID => M00_AXI_0_ARVALID,
            S_AXI_ARREADY => M00_AXI_0_ARREADY,
            S_AXI_RDATA   => M00_AXI_0_RDATA,
            S_AXI_RRESP   => M00_AXI_0_RRESP,
            S_AXI_RVALID  => M00_AXI_0_RVALID,
            S_AXI_RREADY  => M00_AXI_0_RREADY,

            regFromDwa => regFromDwa,
regFromDwa_strb => regFromDwa_strb,

            regToDwa   => regToDwa
        );

    top_tension_analyzer_1 : entity work.top_tension_analyzer
        port map (
            regFromDwa => regFromDwa,
regFromDwa_strb => regFromDwa_strb,

            regToDwa   => regToDwa,
            S_AXI_ACLK    => aclk,


            led             => led,
            acStimX200_obuf => acStimX200_obuf,
            acStim_obuf     => acStim_obuf,
            V_p             => V_p,
            V_n             => V_n,
            Vaux0_n         => Vaux0_n,
            Vaux0_p         => Vaux0_p,
            Vaux8_n         => Vaux8_n,
            Vaux8_p         => Vaux8_p,
            mainsSquare     => mainsSquare,
            BB_CLK          => BB_CLK,
            BB_CLK_EN       => BB_CLK_EN


        );

end STRUCTURE;
