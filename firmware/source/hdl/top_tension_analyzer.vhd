library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;
-- Custom libraries and packages:
library duneDwa;
use duneDwa.global_def.all;

entity top_tension_analyzer is
  port (
    fromDaqReg : in  fromDaqRegType;
    toDaqReg   : out toDaqRegType;

    --regToDwa       : in SLV_VECTOR_TYPE_32(31 downto 0);
    dwaClk400 : in std_logic;
    dwaClk333 : in std_logic;
    dwaClk200 : in std_logic;
    dwaClk100 : in std_logic;
    dwaClk10  : in std_logic;

    led     : out std_logic_vector(3 downto 0) := (others  =>  '0');
    pButton : in  std_logic_vector(3 downto 0);

    acStimX200_obuf : out std_logic := '0';
    mainsSquare     : in  std_logic := '0';

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

    adcCnv        : out std_logic                    := '0';
    adcSck        : out std_logic                    := '0';
    adcDataSerial : in  std_logic_vector(3 downto 0) := (others => '0');
    adcSrcSyncClk : in  std_logic                    := '0'
  );

end top_tension_analyzer;

architecture STRUCT of top_tension_analyzer is

  COMPONENT fifo_autoDatacollection
    PORT (
      rst         : IN  STD_LOGIC;
      wr_clk      : IN  STD_LOGIC;
      rd_clk      : IN  STD_LOGIC;
      din         : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
      wr_en       : IN  STD_LOGIC;
      rd_en       : IN  STD_LOGIC;
      dout        : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      full        : OUT STD_LOGIC;
      empty       : OUT STD_LOGIC;
      prog_full   : OUT STD_LOGIC;
      wr_rst_busy : OUT STD_LOGIC;
      rd_rst_busy : OUT STD_LOGIC
    );
  END COMPONENT;

  COMPONENT ila_4x32
    PORT (
      clk : IN STD_LOGIC;

      probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      probe2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      probe3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT ;

  COMPONENT vio_ctrl
    PORT (
      clk         : IN  STD_LOGIC;
      probe_in0   : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
      probe_in1   : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
      probe_in2   : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe_out0  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      probe_out1  : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe_out2  : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe_out3  : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe_out4  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      probe_out5  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      probe_out6  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      probe_out7  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      probe_out8  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      probe_out9  : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe_out10 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      probe_out11 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
    );
  END COMPONENT;

  signal auto       : std_logic := '0';
  signal acStimX200 : std_logic := '0';

  signal adcCnv_nCnv             : unsigned(15 downto 0) := (others => '0');
  signal adcCnv_nPeriod          : unsigned(23 downto 0) := (others => '0');
  signal acStimX200_nHPeriodAuto : unsigned(23 downto 0) := (others => '0');

  signal acStim_mag              : unsigned(11 downto 0) := (others => '0');
  signal acStim_enable           : std_logic             := '0';
  signal ctrl_acStim_enable      : std_logic             := '0';
  signal acStim_trigger          : std_logic             := '0';
  signal acStim_nPeriod_fp6      : unsigned(30 downto 0) := (others => '0');
  signal acStimX200_nPeriod_fxp8 : unsigned(32 downto 0) := (others => '0'); -- floating point at 8
                                                                             --initial value non zero
  signal stimFreqReq : unsigned(23 downto 0) := (others => '1');
  signal ctrlFreqSet : unsigned(23 downto 0) := (others => '1');

  signal fifoAdcData_ren    : std_logic_vector(7 downto 0)             := (others => '0');
  signal adcData            : SLV_VECTOR_TYPE(7 downto 0)(31 downto 0) := (others => (others => '0'));
  signal fifoAdcData_ff     : std_logic_vector(7 downto 0)             := (others => '0');
  signal fifoAdcData_rdBusy : std_logic_vector(7 downto 0)             := (others => '0');
  signal fifoAdcData_ef     : std_logic_vector(7 downto 0)             := (others => '0');
  signal fifoAdcData_pf     : std_logic_vector(7 downto 0)             := (others => '0');
  signal adcAutoDc_af       : std_logic_vector(7 downto 0)             := (others => '0');

  signal adcStart : boolean := true;

  signal adcBusy : std_logic := '0';

  signal mainsSquare_del1, mainsSquare_del2 : std_logic := '0';
  signal mainsTrig ,adcReadoutTrig          : std_logic := '0';

  signal mainsTrig_filter : unsigned(17 downto 0);

  signal senseWireData     : SIGNED_VECTOR_TYPE(7 downto 0)(15 downto 0) := (others => (others => '0'));
  signal senseWireDataStrb : std_logic                                   := '0';

  signal senseWireMNSData     : SIGNED_VECTOR_TYPE(7 downto 0)(14 downto 0) := (others => (others => '0'));
  signal senseWireMNSDataStrb : std_logic                                   := '0';

  signal senseWireDataSel : unsigned(2 downto 0) := (others => '0');

  signal dpotMag : SLV_VECTOR_TYPE(7 downto 0)(7 downto 0) := (others => (others => '0'));

  signal sendRunHdr  : boolean := false;
  signal sendAdcData : boolean := false;

  signal noiseReadoutBusy  : boolean := false;
  signal noiseResetBusy    : boolean := false;
  signal noiseFirstReadout : boolean := false;

  signal noiseCorrDataSel : std_logic_vector(1 downto 0) := (others => '0');
  signal msimDumy         : std_logic_vector(2 downto 0) := (others => '0');
  signal dwaClk2          : std_logic                    := '0';
  signal vioUpdate        : std_logic                    := '0';

  signal pktBuildBusy : boolean := false;
  signal freqScanBusy : boolean := false;

  signal pButton_del : SLV_VECTOR_TYPE(1 downto 0)(3 downto 0)       := (others => (others => '0'));
  signal pBHoldOff   : UNSIGNED_VECTOR_TYPE(3 downto 0)(19 downto 0) := (others => (others => '0'));

  signal pBAbort : std_logic := '0';

  signal scanStatusCnt : unsigned(28 downto 0) := (others => '0');
  signal netStatusCnt : unsigned(23 downto 0) := (others => '0');

  signal
  toDaqReg_headerGenerator,
  toDaqReg_dpotInterface,
  toDaqReg_wtaController,
  toDaqReg_wireRelayInterface,
  toDaqReg_serialPromInterface,
  toDaqReg_mainsNoiseCorrection : toDaqRegType;

begin
  lightsAndButtons : process (dwaClk100)
  begin
    if rising_edge(dwaClk100) then
      led(0) <= or(toDaqReg.errors);
      led(3) <= '0'; -- 0 is off ?

      --metastability 
      pButton_del <= pButton_del(0) & pButton;

      --debounce
      for pB_i in 3 downto 0 loop
        -- reset holdoff counter while button is pressed or there is signal bouncing 
        if pButton_del(1)(pB_i) then
          pBHoldOff(pB_i) <= (others => '0');
        -- count until MSb is 1 after button if released, waiting for bounces to settle 
        elsif pBHoldOff(pB_i)(pBHoldOff(pB_i)'left) = '0' then
          pBHoldOff(pB_i) <= pBHoldOff(pB_i)+1;
        end if;
      end loop;

      -- single pulse for each button press cycle
      pBAbort <= pButton_del(1)(0) and pBHoldOff(0)(pBHoldOff(0)'left);

    end if;
  end process;


  genLedScanStatus : process (dwaClk100)
  begin
    if rising_edge(dwaClk100) then
      if scanStatusCnt(28 downto 23) = "100110" then
        -- we are finished with the current frequency's blink, wait here for the next frequency
        led(1) <= '1' when freqScanBusy else '0'; -- display scan status
                                                  -- pulse once each time the ADC sequenced is activated
        if adcStart then
          -- scale requested frequency to a time range we can actually see ~ 1.5 sec to 150 ms
          scanStatusCnt <= (28 => '0', 27 downto 10 => stimFreqReq(17 downto 0), 9 downto 0 => '0');
        end if;

      else
        -- when counting, pulse 0 for ~150 ms at the end of each count
        led(1)        <= bool2sl(freqScanBusy) when (scanStatusCnt(28 downto 23) < "100011") else '0';
        scanStatusCnt <= scanStatusCnt + 1;
      end if;
    end if;
  end process;

  genLedNetStatus : process (dwaClk100)
  begin
    if rising_edge(dwaClk100) then

          led(2)        <='1' when and(netStatusCnt) else '0';
        if not fromDaqReg.netStatus(0) then -- blink on transaction
          netStatusCnt <= (others => '0');
        elsif netStatusCnt  /=  (netStatusCnt'range  =>  '1') then -- extend pulse ~150ms
            netStatusCnt <= netStatusCnt + 1;
        end if;
    end if;
  end process genLedNetStatus;

  BUFR_inst : BUFR
    generic map (
      BUFR_DIVIDE => "5",      -- Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8"
      SIM_DEVICE  => "7SERIES" -- Must be set to "7SERIES"
    )
    port map (
      O   => dwaClk2, -- 1-bit output: Clock output port
      CE  => '1',     -- 1-bit input: Active high, clock enable (Divided modes only)
      CLR => '0',     -- 1-bit input: Active high, asynchronous clear (Divided modes only)
      I   => dwaClk10 -- 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
    );

  --  ODDR_acStim : ODDR
  --    generic map(
  --      DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
  --      INIT         => '0',         -- Initial value for Q port ('1' or '0')
  --      SRTYPE       => "SYNC")      -- Reset Type ("ASYNC" or "SYNC")
  --    port map (
  --      Q  => acStim_oddr,   -- 1-bit DDR output
  --      C  => sysclk200,     -- 1-bit clock input
  --      CE => acStim_enable, -- 1-bit clock enable input
  --      D1 => acStim,
  --      D2 => '0',
  --      R  => '0', -- 1-bit reset input
  --      S  => '0'  -- 1-bit set input
  --    );
  --
  --
  --  ODDR_acStimx200 : ODDR
  --    generic map(
  --      DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
  --      INIT         => '0',         -- Initial value for Q port ('1' or '0')
  --      SRTYPE       => "SYNC")      -- Reset Type ("ASYNC" or "SYNC")
  --    port map (
  --      Q  => acStimX200_oddr, -- 1-bit DDR output
  --      C  => sysclk200,       -- 1-bit clock input
  --      CE => acStim_enable,   -- 1-bit clock enable input
  --      D1 => acStimX200,
  --      D2 => '0',
  --      R  => '0', -- 1-bit reset input
  --      S  => '0'  -- 1-bit set input
  --    );


  -- OBUF_acStimX200_inst : OBUF
  --   generic map (
  --     DRIVE      => 16,
  --     IOSTANDARD => "LVCMOS18",
  --     SLEW       => "SLOW")
  --   port map (
  --     O => acStimX200_obuf, -- Buffer output (connect directly to top-level port)
  --     I => acStimX200       -- Buffer input
  --   );

  acStimX200_obuf <= acStimX200;
  --
  --  OBUF_acStim_inst : OBUF
  --    generic map (
  --      DRIVE      => 16,
  --      IOSTANDARD => "LVCMOS18",
  --      SLEW       => "SLOW")
  --    port map (
  --      O => acStim_obuf, -- Buffer output (connect directly to top-level port)
  --      I => acStim       -- Buffer input
  --    );

  -- convert requested stim frequency to number of 100Mhz clocks
  -- move this to the processor!
  compute_n_periods : process (dwaClk10)
    variable acStim_nPeriod_fp6_all : unsigned(43 downto 0 );
    variable adcCnv_nCnv_all        : unsigned(39 downto 0 );

  begin
    if rising_edge(dwaClk10) then
      if fromDaqReg.auto then
        stimFreqReq   <= ctrlFreqSet;
        acStim_enable <= ctrl_acStim_enable;
      else
        stimFreqReq   <= fromDaqReg.stimFreqReq;
        acStim_enable <= '1';
      end if;

      -- nPeriod has units of 5ns with specified fixed point
      --acStim_nPeriod_fp6_all  := (x"17d7840000"/ stimFreqReq);
      acStim_nPeriod_fp6_all  := (x"2FAF0800000"/ stimFreqReq);
      acStim_nPeriod_fp6      <= acStim_nPeriod_fp6_all(30 downto 0); -- only take what is needed for min 10 HZ stim freq
      acStimX200_nPeriod_fxp8 <= (acStim_nPeriod_fp6 & "00") / x"C8"; -- add 8 bits for fixed point and calculate BP freq based on exact stim freq

      --  let's start with a fixed conversion 
      -- temp shift left ~8 samples per cycle
      -- nPeriod of ADC is still 10 ns. shift additional 1 
      -- fp1 - 1 , 200 to 100 - 1 ,8 samples per cycle -3 (5 total)
      adcCnv_nPeriod <= "000" & acStim_nPeriod_fp6(30 downto 10);
      -- find the number of total canversions for each frequency
      adcCnv_nCnv_all := fromDaqReg.cyclesPerFreq * fromDaqReg.adcSamplesPerCycle;
      adcCnv_nCnv     <= adcCnv_nCnv_all(15 downto 0);
    end if;
  end process compute_n_periods;

  bandPassClkGen_inst : entity work.bandPassClkGen
    port map (
      bPClk_nPeriod_fp8 => acStimX200_nPeriod_fxp8(25 downto 0),
      bPClk             => acStimX200,
      dwaClk400         => dwaClk400,
      dwaClk200         => dwaClk200
    );


  serialPromInterface_inst : entity work.serialPromInterface
    port map (
      fromDaqReg => fromDaqReg,
      toDaqReg   => toDaqReg_serialPromInterface,
      --sim toDaqReg => open,

      sda       => SNUM_SDA,
      scl       => SNUM_SCL,
      vioUpdate => vioUpdate,
      dwaClk100 => dwaClk100,
      dwaClk10  => dwaClk10
    );

  wireRelayInterface_inst : entity duneDwa.wireRelayInterface
    port map (
      fromDaqReg => fromDaqReg,
      toDaqReg   => toDaqReg_wireRelayInterface,
      --sim toDaqReg => open,

      g_b     => CD_G_b,
      srclr_b => CD_SCLR_b,

      sdi => CD_Dout,
      sdo => CD_Din,
      rck => CD_RCK,

      sck => CD_SCK,

      dwaClk100 => dwaClk100,
      dwaClk2   => dwaClk2
    );
  --gain DPOT
  dpotInterface_inst : entity duneDwa.dpotInterface
    port map (
      fromDaqReg => fromDaqReg,
      toDaqReg   => toDaqReg_dpotInterface,
      --sim toDaqReg => open, --toDaqReg,

      sdi    => dpotSdo,
      sdo    => dpotSdi,
      pr_b   => dpotPr_b,
      cs_b   => dpotCs_b,
      sck    => dpotSck,
      shdn_b => dpotShdn_b,

      dwaClk2 => dwaClk2
    );

  -- mains trigger noise filter
  trigGen : process (dwaClk100)
  begin
    if rising_edge(dwaClk100) then
      mainsSquare_del1 <= mainsSquare;
      mainsSquare_del2 <= mainsSquare_del1;
      -- not yet supported by xilinx simulation 
      -- mainsTrig        <= '1' when mainsTrig_filter = (mainsTrig_filter'left downto 1 => '0', 0 => '1') else '0';
      if mainsTrig_filter = "00" & x"0001" then
        mainsTrig <= '1';
      else
        mainsTrig <= '0' ;
      end if;

      if mainsSquare_del2 = '0' then
        mainsTrig_filter <= (others => '1');
      elsif mainsTrig_filter /= (mainsTrig_filter'range => '0') then
        mainsTrig_filter <= mainsTrig_filter-1;
      end if;
    end if;
  end process;

  -- stimulus frequency generation via DAC
  dacInterface_inst : entity work.dacInterface
    port map (
      acStim_mag         => fromDaqReg.stimMag,
      acStim_nPeriod_fp6 => acStim_nPeriod_fp6,
      acStim_enable      => acStim_enable,
      acStim_trigger     => acStim_trigger,

      DAC_SDI   => DAC_SDI,
      DAC_CS_B  => DAC_CS_B,
      DAC_LD_B  => DAC_LD_B,
      DAC_CLR_B => DAC_CLR_B,
      DAC_CLK   => DAC_CLK,

      dwaClk400 => dwaClk400,
      dwaClk200 => dwaClk200,
      dwaClk100 => dwaClk100,
      dwaClk10  => dwaClk10
    );

  -- frequency scan and header generator
  -- move to processor 
  wtaController_inst : entity duneDwa.wtaController
    port map (
      fromDaqReg => fromDaqReg,
      toDaqReg   => toDaqReg_wtaController,
      --sim toDaqReg => open, --toDaqReg,

      freqSet       => ctrlFreqSet,
      acStim_enable => ctrl_acStim_enable,

      noiseReadoutBusy  => noiseReadoutBusy,
      noiseFirstReadout => noiseFirstReadout,
      noiseResetBusy    => noiseResetBusy,

      sendRunHdr  => sendRunHdr,
      sendAdcData => sendAdcData,

      pktBuildBusy => pktBuildBusy,
      freqScanBusy => freqScanBusy,

      adcAutoDc_af => adcAutoDc_af,

      adcStart => adcStart,
      adcBusy  => adcBusy,

      pBAbort => pBAbort,

      dwaClk100 => dwaClk100
    );

  adcReadoutTrig <= acStim_trigger when fromDaqReg.useAcStimTrig else mainsTrig;
  -- on adcStart get all of the samples at the current frequency
  adcReadout_inst : entity duneDwa.adcReadout
    port map (
      fromDaqReg => fromDaqReg,

      adcCnv_nCnv      => adcCnv_nCnv,
      adcCnv_nPeriod   => adcCnv_nPeriod,
      noiseReadoutBusy => noiseReadoutBusy,

      adcStart => adcStart,
      trigger  => adcReadoutTrig, -- temp disable untested adcReadoutTrig,
                                  --trigger => mainsTrig,-- temp disable untested adcReadoutTrig,
      adcBusy => adcBusy,

      adcCnv => adcCnv,
      adcSck => adcSck,

      adcDataSerialDwa => adcDataSerial,
      adcSrcSyncClkDwa => adcSrcSyncClk,

      dataParallel     => senseWireData,
      dataParallelStrb => senseWireDataStrb,

      reset     => fromDaqReg.reset,
      dwaClk100 => dwaClk100
    );

  mainsNoiseCorrection_inst : entity duneDwa.mainsNoiseCorrection
    port map (
      fromDaqReg => fromDaqReg,
      toDaqReg   => toDaqReg_mainsNoiseCorrection,
      --sim toDaqReg => open,--toDaqReg,
      freqSet => ctrlFreqSet,

      noiseReadoutBusy  => noiseReadoutBusy,
      noiseFirstReadout => noiseFirstReadout,

      dataSel => noiseCorrDataSel,

      resetBusy => noiseResetBusy,
      adcStart  => adcStart,

      senseWireDataStrb => senseWireDataStrb,
      senseWireData     => senseWireData,

      senseWireMNSDataStrb => senseWireMNSDataStrb,
      senseWireMNSData     => senseWireMNSData,

      dwaClk100 => dwaClk100
    );

  --for each of the 8 channels
  adcFifoGen : for adc_i in 7 downto 0 generate

    -- store data for AXI read
    fifoAdcData_ch : fifo_autoDatacollection
      PORT MAP (
        rst    => bool2Sl(fromDaqReg.reset),
        wr_clk => dwaClk100,
        rd_clk => dwaClk100,
        din    => '0' & std_logic_vector(senseWireMNSData(adc_i)),
        wr_en  => senseWireMNSDataStrb,

        rd_en => fifoAdcData_ren(adc_i),
        -- MNS eval
        --rd_en => bool2sl(not noiseReadoutBusy),
        dout => adcData(adc_i),

        -- ADC full bits are the second set of 8 bits
        full        => fifoAdcData_ff(adc_i),
        empty       => fifoAdcData_ef(adc_i),
        prog_full   => fifoAdcData_pf(adc_i),
        wr_rst_busy => open,
        rd_rst_busy => open
      );

  end generate adcFifoGen;

  headerGenerator_inst : entity duneDwa.headerGenerator
    port map (
      fromDaqReg => fromDaqReg,
      toDaqReg   => toDaqReg_headerGenerator, -- Keep this one for sim

      runOdometer => (others => '0'),

      --udpDataRen         => false, --fromDaq
      sendRunHdr  => sendRunHdr,
      sendAdcData => sendAdcData,

      pktBuildBusy => pktBuildBusy,
      freqScanBusy => freqScanBusy,

      stimPeriodActive  => acStim_nPeriod_fp6,
      stimPeriodCounter => (others => '0'),

      adcSamplingPeriod => adcCnv_nPeriod,

      adcDataRdy => not(fifoAdcData_ef),
      adcDataRen => fifoAdcData_ren,
      adcData    => adcData,

      --udpRequestComplete => open,

      dwaClk100 => dwaClk100
    );

  --ila_4x32_inst : ila_4x32
  --  PORT MAP (
  --    clk                  => dwaClk10,
  --    probe0(31 downto 24) => (others => '0'),
  --    probe0(23 downto 0)  => std_logic_vector(acStim_nHPeriod),
  --    probe1               => std_logic_vector(acStimX200_nPeriod_fxp8),
  --    probe2(31 downto 24) => (others => '0'),
  --    probe2(23 downto 0)  => std_logic_vector(adcCnv_nPeriod),
  --    probe3               => std_logic_vector(acStimX200_nPeriod_fxp8)
  --  );
  --
  vio_ctrl_inst : vio_ctrl
    PORT MAP (
      clk                    => dwaClk100,

      probe_in0(3 downto 0)  => led,
      probe_in0(5 downto 4) => fromDaqReg.netStatus(1 downto 0),
      probe_in0(31 downto 6) => (others => '0'),
      probe_in1              => (others => '0'),
      probe_in2              => (others => '0'),
      probe_out0             => open,
      probe_out1             => open,
      probe_out2          => open,
      probe_out3             => open,
      probe_out4             => open,
      probe_out5             => open,
      probe_out6             => open,
      probe_out7             => open,
      probe_out8             => open,
      probe_out9             => open,
      probe_out10            => open,
      probe_out11            => open
    );

  toDaqReg.ctrlBusy         <= toDaqReg_wtaController.ctrlBusy;
  toDaqReg.ctrlStateDbg     <= toDaqReg_wtaController.ctrlStateDbg;
  toDaqReg.udpDataWord      <= toDaqReg_headerGenerator.udpDataWord;
  toDaqReg.udpDataRdy       <= toDaqReg_headerGenerator.udpDataRdy;
  toDaqReg.pktGenStateDbg   <= toDaqReg_headerGenerator.pktGenStateDbg;
  toDaqReg.senseWireGain    <= toDaqReg_dpotInterface.senseWireGain;
  toDaqReg.relayBusTop      <= toDaqReg_wireRelayInterface.relayBusTop;
  toDaqReg.relayWireTop     <= toDaqReg_wireRelayInterface.relayWireTop;
  toDaqReg.relayBusBot      <= toDaqReg_wireRelayInterface.relayBusBot;
  toDaqReg.relayWireBot     <= toDaqReg_wireRelayInterface.relayWireBot;
  toDaqReg.serNum           <= toDaqReg_serialPromInterface.serNum;
  toDaqReg.serNumMemAddress <= toDaqReg_serialPromInterface.serNumMemAddress;
  toDaqReg.serNumMemData    <= toDaqReg_serialPromInterface.serNumMemData;

end STRUCT;

