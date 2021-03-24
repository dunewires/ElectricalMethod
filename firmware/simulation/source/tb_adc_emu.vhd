library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library duneDwa;
use duneDwa.global_def.all;

entity tb_adc_emu is
end tb_adc_emu;

architecture tb of tb_adc_emu is

  -----------------------------------------------------------------------
  -- Timing constants
  -----------------------------------------------------------------------
  constant BB_CLK_period    : time := 50 ns;
  constant dwaClk100_period : time := 10 ns;
  constant dwaClk10_period  : time := 100 ns;
  constant T_HOLD           : time := 10 ns;
  constant T_STROBE         : time := BB_CLK_period - (1 ns);


  signal end_of_simulation : boolean := false;

  signal fromDaqReg      : fromDaqRegType;
  signal toDaqReg        : toDaqRegType;
  signal dwaClk100       : std_logic;
  signal dwaClk10        : std_logic;
  signal led             : std_logic_vector(3 downto 0);
  signal acStimX200_obuf : std_logic := '0';
  signal mainsSquare     : std_logic;
  signal DAC_SDI         : std_logic := '0';
  signal DAC_CS_B        : std_logic := '0';
  signal DAC_LD_B        : std_logic := '0';
  signal DAC_CLR_B       : std_logic := '0';
  signal DAC_CLK         : std_logic := '0';
  signal dpotSdi         : std_logic := '0';
  signal dpotSdo         : std_logic := '0';
  signal dpotPr_b        : std_logic := '0';
  signal dpotCs_b        : std_logic := '0';
  signal dpotSck         : std_logic := '0';
  signal dpotShdn_b      : std_logic := '0';
  signal adcCnv          : std_logic                     := '0';
  signal adcSck          : std_logic                     := '0';
  signal adcDataSerial   : std_logic_vector(3 downto 0)  := (others => '0');
  signal adcSrcSyncClk   : std_logic                     := '0';
  signal emuDSR          : std_logic_vector(35 downto 0) := (others => '0');
  signal daqReadCnt      : unsigned(4 downto 0)          := (others => '0');
  signal plClk_400, plClk_200, plClk_100,plClk_10 : STD_LOGIC;

  --signal udpDataRdyDel  : std_logic := '0';
  signal udpDataRdyDel : boolean := false;

begin

  process (dwaClk100)
  begin
    if rising_edge(dwaClk100) then
      daqReadCnt             <= daqReadCnt+1;
      fromDaqReg.udpDataRen  <= toDaqReg.udpDataRdy when (daqReadCnt = "00000") else false;
      udpDataRdyDel          <= toDaqReg.udpDataRdy;
      fromDaqReg.udpDataDone <= udpDataRdyDel and not toDaqReg.udpDataRdy;
    end if;

  end process;

  process (dpotSck)
  begin
    if rising_edge(dpotSck) then
      emuDSR <= emuDSR(34 downto 0) & dpotSdi;
    --emuDSR(31)                 <= dpotSdo;
    end if;
    if falling_edge(dpotSck) then
      dpotSdo <= emuDSR(35);
    --emuDSR(31)                 <= dpotSdo;
    end if;
  end process;


    clk_dwa_pl_inst : entity duneDwa.clk_dwa_pl
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
            clk_in1 => dwaClk100
        );


  top_tension_analyzer_1 : entity duneDwa.top_tension_analyzer
    port map (
      fromDaqReg      => fromDaqReg,
      toDaqReg        => toDaqReg,

            dwaClk400 => plClk_400,
            dwaClk200 => plClk_200,
            dwaClk100 => plClk_100,
            dwaClk10 => plClk_10,

      led             => led,
      pButton => (others => '0'),
      acStimX200_obuf => acStimX200_obuf,
      mainsSquare     => mainsSquare,
      DAC_SDI         => DAC_SDI,
      DAC_CS_B        => DAC_CS_B,
      DAC_LD_B        => DAC_LD_B,
      DAC_CLR_B       => DAC_CLR_B,
      DAC_CLK         => DAC_CLK,
      dpotSdi         => dpotSdi,
      dpotSdo         => dpotSdo,
      dpotPr_b        => dpotPr_b,
      dpotCs_b        => dpotCs_b,
      dpotSck         => dpotSck,
      dpotShdn_b      => dpotShdn_b,
      adcCnv          => adcCnv,
      adcSck          => adcSck,
      adcDataSerial   => adcDataSerial,
      adcSrcSyncClk   => adcSrcSyncClk
    );


  adc_dds_io_1 : entity work.adc_dds_io
    port map (
      adcCnv => adcCnv,
      adcSck => adcSck,

      adcDataSerial => adcDataSerial,
      adcSrcSyncClk => adcSrcSyncClk,

      dwaClk100 => dwaClk100
    );

end tb;

