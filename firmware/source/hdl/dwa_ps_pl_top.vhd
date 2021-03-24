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
    generic (
        dateCode : std_logic_vector(31 downto 0);
        hashCode : std_logic_vector(31 downto 0)
    );

    port (
        --DWA
        led     : out std_logic_vector(3 downto 0);
        pButton : in  std_logic_vector(3 downto 0);

        acStimX200_obuf : out std_logic := '0';

        mainsSquare : in std_logic;

        DAC_SDI   : out std_logic := '0';
        DAC_CS_B  : out std_logic := '0';
        DAC_LD_B  : out std_logic := '0';
        DAC_CLR_B : out std_logic := '0';
        DAC_CLK   : out std_logic := '0';

        dpotSdi    : out std_logic := '0';
        dpotSdo    : in  std_logic := '0';
        dpotPr_b   : out std_logic := '0';
        dpotCs_b   : out std_logic := '0';
        dpotSck    : out std_logic := '0';
        dpotShdn_b : out std_logic := '0';

        CD_Din    : out std_logic                    := '0';
        CD_Dout   : in  std_logic_vector(3 downto 0) := (others => '0');
        CD_SCLR_b : out std_logic_vector(3 downto 0) := (others => '0');
        CD_SCK    : out std_logic_vector(3 downto 0) := (others => '0');
        CD_RCK    : out std_logic_vector(3 downto 0) := (others => '0');
        CD_G_b    : out std_logic_vector(3 downto 0) := (others => '0');

        SNUM_SDA : inout std_logic                    := '0';
        SNUM_SCL : out   std_logic                    := '0';
        SNUM_A   : out   std_logic_vector(2 downto 0) := (others => '0');

        adcCnv          : out std_logic                    := '0';
        adcSck_p        : out std_logic                    := '0';
        adcSck_n        : out std_logic                    := '0';
        adcDataSerial_p : in  std_logic_vector(3 downto 0) := (others => '0');
        adcDataSerial_n : in  std_logic_vector(3 downto 0) := (others => '0');
        adcSrcSyncClk_p : in  std_logic                    := '0';
        adcSrcSyncClk_n : in  std_logic                    := '0';

        BB_CLK_P : in std_logic;
        BB_CLK_N : in std_logic;

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
            aclk                 : out   STD_LOGIC;
            FCLK_CLK1_0          : out   STD_LOGIC

        );
    end component dwa_ps_bd;

    component dwa_registers_v1_0_S00_AXI is
        generic (
            C_S_AXI_DATA_WIDTH : integer := 32;
            C_S_AXI_ADDR_WIDTH : integer := 8
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

    component clk_dwa_pl
        port
        (   -- Clock in ports
            -- Clock out ports
            clk_out1 : out std_logic;
            clk_out2 : out std_logic;
            clk_out3 : out std_logic;
            clk_out4 : out std_logic;
            -- Status and control signals
            reset   : in  std_logic;
            locked  : out std_logic;
            clk_in1 : in  std_logic
        );
    end component;

    signal M00_AXI_0_awaddr                         : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M00_AXI_0_awprot                         : STD_LOGIC_VECTOR ( 2 downto 0 );
    signal M00_AXI_0_awvalid                        : STD_LOGIC;
    signal M00_AXI_0_awready                        : STD_LOGIC;
    signal M00_AXI_0_wdata                          : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M00_AXI_0_wstrb                          : STD_LOGIC_VECTOR ( 3 downto 0 );
    signal M00_AXI_0_wvalid                         : STD_LOGIC;
    signal M00_AXI_0_wready                         : STD_LOGIC;
    signal M00_AXI_0_bresp                          : STD_LOGIC_VECTOR ( 1 downto 0 );
    signal M00_AXI_0_bvalid                         : STD_LOGIC;
    signal M00_AXI_0_bready                         : STD_LOGIC;
    signal M00_AXI_0_araddr                         : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M00_AXI_0_arprot                         : STD_LOGIC_VECTOR ( 2 downto 0 );
    signal M00_AXI_0_arvalid                        : STD_LOGIC;
    signal M00_AXI_0_arready                        : STD_LOGIC;
    signal M00_AXI_0_rdata                          : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M00_AXI_0_rresp                          : STD_LOGIC_VECTOR ( 1 downto 0 );
    signal M00_AXI_0_rvalid                         : STD_LOGIC;
    signal M00_AXI_0_rready                         : STD_LOGIC;
    signal peripheral_aresetn_0                     : STD_LOGIC_VECTOR ( 0 to 0 );
    signal S_AXI_ACLK_100                           : STD_LOGIC;
    signal S_AXI_ACLK_10                            : STD_LOGIC;
    signal plClk_400, plClk_200, plClk_100,plClk_10 : STD_LOGIC;

    signal fromDaqReg : fromDaqRegType;
    signal toDaqReg   : toDaqRegType;

    signal adcDataSerial : std_logic_vector(3 downto 0) := (others => '0');
    signal adcSrcSyncClk : std_logic                    := '0';
    signal adcSck        : std_logic                    := '0';

begin

    adcSerialInbuf_gen : for adcSerial_indx in 3 downto 0 generate
        IBUFDS_ADCSDIN : IBUFDS
            generic map (
                DIFF_TERM    => true,
                IBUF_LOW_PWR => false,-- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
                IOSTANDARD   => "LVDS"
            )
            port map (
                O  => adcDataSerial(adcSerial_indx),
                I  => adcDataSerial_p(adcSerial_indx),
                IB => adcDataSerial_n(adcSerial_indx)
            );

    end generate adcSerialInbuf_gen;

    OBUFDS_ADCSCK : OBUFDS
        port map (
            O  => adcSck_p, -- Diff_p output (connect directly to top-level port)
            OB => adcSck_n, -- Diff_n output (connect directly to top-level port)
            I  => adcSck    -- Buffer input
        );

    IBUFDS_ADCSSIN : IBUFDS
        generic map (
            DIFF_TERM    => true,
            IBUF_LOW_PWR => false,-- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD   => "LVDS"
        )
        port map (
            O  => adcSrcSyncClk,
            I  => adcSrcSyncClk_p,
            IB => adcSrcSyncClk_n
        );

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
            aclk                          => S_AXI_ACLK_100,
            FCLK_CLK1_0                   => S_AXI_ACLK_10,
            peripheral_aresetn_0(0)       => peripheral_aresetn_0(0)
        );


    dwa_registers_v1_0_S00_AXI_1 : entity duneDwa.dwa_registers_v1_0_S00_AXI
        generic map (
            dateCode => dateCode,
            hashCode => hashCode
        )
        port map (
            S_AXI_ACLK    => S_AXI_ACLK_100,
            S_AXI_ARESETN => peripheral_aresetn_0(0),
            S_AXI_AWADDR  => M00_AXI_0_AWADDR(7 downto 0),
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
            S_AXI_ARADDR  => M00_AXI_0_ARADDR(7 downto 0),
            S_AXI_ARPROT  => M00_AXI_0_ARPROT,
            S_AXI_ARVALID => M00_AXI_0_ARVALID,
            S_AXI_ARREADY => M00_AXI_0_ARREADY,
            S_AXI_RDATA   => M00_AXI_0_RDATA,
            S_AXI_RRESP   => M00_AXI_0_RRESP,
            S_AXI_RVALID  => M00_AXI_0_RVALID,
            S_AXI_RREADY  => M00_AXI_0_RREADY,

            fromDaqReg => fromDaqReg,
            toDaqReg   => toDaqReg

        );

    clk_dwa_pl_inst : clk_dwa_pl
        port map (
            -- Clock out ports  
            clk_out1 => plClk_400,
            clk_out2 => plClk_200,
            clk_out3 => plClk_100,
            clk_out4 => plClk_10,
            -- Status and control signals                
            reset  => '0',
            locked => open,
            -- Clock in ports
            clk_in1 => S_AXI_ACLK_100
        );

    top_tension_analyzer_1 : entity duneDwa.top_tension_analyzer

        port map (
            fromDaqReg => fromDaqReg,
            toDaqReg   => toDaqReg,


            --dwaClk100 => S_AXI_ACLK_100,
            dwaClk400 => plClk_400,
            dwaClk200 => plClk_200,
            dwaClk100 => plClk_100,
            --dwaClk10  => S_AXI_ACLK_10,
            dwaClk10 => plClk_10,


            led     => led,
            pButton => pButton,

            acStimX200_obuf => acStimX200_obuf,
            mainsSquare     => mainsSquare,

            DAC_SDI   => DAC_SDI,
            DAC_CS_B  => DAC_CS_B,
            DAC_LD_B  => DAC_LD_B,
            DAC_CLR_B => DAC_CLR_B,
            DAC_CLK   => DAC_CLK,

            dpotSdi    => dpotSdi,
            dpotSdo    => dpotSdo,
            dpotPr_b   => dpotPr_b,
            dpotCs_b   => dpotCs_b,
            dpotSck    => dpotSck,
            dpotShdn_b => dpotShdn_b,

            CD_Din    => CD_Din,
            CD_Dout   => CD_Dout,
            CD_SCLR_b => CD_SCLR_b,
            CD_SCK    => CD_SCK,
            CD_RCK    => CD_RCK,
            CD_G_b    => CD_G_b,

            SNUM_SDA => SNUM_SDA,
            SNUM_SCL => SNUM_SCL,
            SNUM_A   => SNUM_A,

            adcCnv        => adcCnv,
            adcSck        => adcSck,
            adcDataSerial => adcDataSerial,
            adcSrcSyncClk => adcSrcSyncClk

        );

end STRUCTURE;
