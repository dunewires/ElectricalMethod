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
    dwaClk100 : in std_logic;
    dwaClk10  : in std_logic;


    led             : out std_logic_vector(3 downto 0);
    acStimX200_obuf : out std_logic := '0';
    mainsSquare     : in  std_logic := '0';

    DAC_SDI   : out std_logic := '0';
    DAC_CS_B  : out std_logic := '0';
    DAC_LD_B  : out std_logic := '0';
    DAC_CLR_B : out std_logic := '0';
    DAC_CLK   : out std_logic := '0';

    dpotSdi    : out std_logic := '0';
    dpotSdo    : out std_logic := '0';
    dpotPr_b   : out std_logic := '0';
    dpotCs_b   : out std_logic := '0';
    dpotSck    : out std_logic := '0';
    dpotShdn_b : out std_logic := '0';

    CoilDrive : out std_logic_vector(31 downto 0) := (others => '0');

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

  signal auto            : std_logic := '0';
  signal acStimX200      : std_logic := '0';
  signal acStimX200_oddr : std_logic := '0';
  signal acStim_oddr     : std_logic := '0';

  signal adcCnv_nCnv             : unsigned(15 downto 0) := (others => '0');
  signal adcCnv_nPeriod          : unsigned(23 downto 0) := (others => '0');
  signal acStimX200_nHPeriodAuto : unsigned(23 downto 0) := (others => '0');

  signal acStim_mag           : unsigned(11 downto 0) := (others => '0');
  signal acStim_enable        : std_logic             := '0';
  signal acStim_trigger       : std_logic             := '0';
  signal acStim_nHPeriod      : unsigned(23 downto 0) := (others => '0');
  signal acStimX200_periodCnt : unsigned(23 downto 0) := (others => '0');
  signal acStimX200_nHPeriod  : unsigned(23 downto 0) := (others => '0');
  --initial value non zero
  signal freqReq    : std_logic_vector(31 downto 0) := (others => '1');
  signal freqReqAxi : std_logic_vector(31 downto 0) := (others => '1');

  signal fifoAdcData_din    : SLV_VECTOR_TYPE(7 downto 0)(15 downto 0) := (others => (others => '0'));
  signal fifoAdcData_wen    : std_logic                                := '0';
  signal fifoAdcData_ren    : std_logic_vector(7 downto 0)             := (others => '0');
  signal fifoAdcData_dout   : SLV_VECTOR_TYPE(7 downto 0)(31 downto 0) := (others => (others => '0'));
  signal fifoAdcData_ff     : std_logic_vector(7 downto 0)             := (others => '0');
  signal fifoAdcData_rdBusy : std_logic_vector(7 downto 0)             := (others => '0');
  signal fifoAdcData_ef     : std_logic_vector(7 downto 0)             := (others => '0');
  signal fifoAdcData_pf     : std_logic_vector(7 downto 0)             := (others => '0');
  signal adcAutoDc_af      : std_logic_vector(7 downto 0)             := (others => '0');

  signal adcStart : std_logic := '0';

  signal adcBusy : std_logic := '0';
  signal adcDone : std_logic := '0';

  signal mainsSquare_del1, mainsSquare_del2 : std_logic := '0';
  signal mainsTrig                          : std_logic := '0';

  signal mainsTrig_filter : unsigned(17 downto 0);

  signal senseWireData     : SIGNED_VECTOR_TYPE(7 downto 0)(15 downto 0) := (others => (others => '0'));
  signal senseWireDataStrb : std_logic                                   := '0';
  signal senseWireDataSel  : unsigned(2 downto 0)                        := (others => '0');

  signal dpotMag : SLV_VECTOR_TYPE(7 downto 0)(7 downto 0) := (others => (others => '0'));

  signal sendRunHdr : boolean  := false;
  signal sendAdcData :boolean  := false;

begin
  led(1) <= dwaClk100;
  led(0) <= '1' when toDaqReg.ctrlBusy else '0';
  led(3) <= '1';
  led(2) <= acStimX200;

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
    variable acStim_nHPeriod_all : unsigned(47 downto 0 );
    variable adcCnv_nPeriod_all  : unsigned(47 downto 0 );
    variable adcCnv_nCnv_all     : unsigned(39 downto 0 );
  begin
    if rising_edge(dwaClk10) then
      if fromDaqReg.auto then
        acStimX200_nHPeriod <= acStimX200_nHPeriodAuto;
      else
        acStimX200_nHPeriod <= fromDaqReg.stimFreqReq;
      end if;

      -- trim off 8 MSbs because we don't need to go below ~10Hz
      -- acStim_nHPeriod_all := (x"5F5E1000"/unsigned(freqReq));

      -- acStim_nHPeriod     <= acStim_nHPeriod_all(acStim_nHPeriod'range);
      -- use the acStim_nHPeriod as the basis for the other freq to maintain exact sync

      -- this will produce a greater error in the actual freq being measured.
      acStim_nHPeriod_all := acStimX200_nHPeriod * 200;

      adcCnv_nPeriod_all := acStimX200_nHPeriod * 50;
      --  let's start with a fixed conversion from half wave to ADC samples
      -- 100 = 4 samples/period
      -- 400 = 1 samples/period
      -- 50 = 8
      -- 25 = 16
      -- find the number of total canversions for each frequency
      adcCnv_nCnv_all := fromDaqReg.cyclesPerFreq * fromDaqReg.adcSamplesPerCycle;

      acStim_nHPeriod <= acStim_nHPeriod_all(23 downto 0);
      adcCnv_nPeriod  <= adcCnv_nPeriod_all(23 downto 0);
      adcCnv_nCnv     <= adcCnv_nCnv_all(15 downto 0);

    end if;
  end process compute_n_periods;

  make_ac_stimX200 : process (dwaClk100)
  begin
    if rising_edge(dwaClk100) then
      -- Default Increment
      acStimX200_periodCnt <= acStimX200_periodCnt +1;
      -- need the > to catch when the nPeriod decreases at the wrong time

      if acStimX200_periodCnt >= acStimX200_nHPeriod then
        -- dont use the enable here to keep the filter working
        acStimX200           <= not acStimX200;
        acStimX200_periodCnt <= (acStimX200_periodCnt'left downto 1 => '0', 0 => '1'); --x"000001";
      end if;

    end if;
  end process make_ac_stimX200;

  -- gain DPOT
  --  dpotInterface_1 : entity duneDwa.dpotInterface
  --    port map (
  --      mag => dpotMag,
  --
  --      sdi    => dpotSdi,
  --      sdo    => dpotSdo,
  --      pr_b   => dpotPr_b,
  --      cs_b   => dpotCs_b,
  --      sck    => dpotSck,
  --      shdn_b => dpotShdn_b,
  --
  --      sysClk10 => sysClk10
  --    );

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
      acStim_mag      => acStim_mag,
      acStim_nHPeriod => acStim_nHPeriod,
      acStim_enable   => acStim_enable,
      acStim_trigger  => acStim_trigger,

      DAC_SDI   => DAC_SDI,
      DAC_CS_B  => DAC_CS_B,
      DAC_LD_B  => DAC_LD_B,
      DAC_CLR_B => DAC_CLR_B,
      DAC_CLK   => DAC_CLK,

      dwaClk100 => dwaClk100,
      dwaClk10  => dwaClk10
    );

  -- frequency scan and header generator
  -- move to processor 
  wtaController_inst : entity duneDwa.wtaController
    port map (
      fromDaqReg => fromDaqReg,
      toDaqReg   => open, --toDaqReg,

      acStimX200_nHPeriod => acStimX200_nHPeriodAuto,
      acStim_enable       => acStim_enable,

      sendRunHdr  => sendRunHdr,
      sendAdcData => sendAdcData,

      adcAutoDc_af => adcAutoDc_af,

      adcStart => adcStart,
      adcBusy  => adcBusy,
      adcDone  => adcDone,

      dwaClk100 => dwaClk100
    );

  -- on adcStart get all of the samples at the current frequency
  adcReadout_inst : entity duneDwa.adcReadout
    port map (
      adcCnv_nCnv     => adcCnv_nCnv,
      adcCnv_nPeriod  => adcCnv_nPeriod,
      acStim_nHPeriod => acStim_nHPeriod,

      adcStart => adcStart,
      trigger  => acStim_trigger,
      adcBusy  => adcBusy,
      adcDone  => adcDone,

      adcCnv => adcCnv,
      adcSck => adcSck,

      adcDataSerialDwa => adcDataSerial,
      adcSrcSyncClkDwa => adcSrcSyncClk,

      dataParallel     => senseWireData,
      dataParallelStrb => senseWireDataStrb,

      reset     => fromDaqReg.reset,
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
        din    => std_logic_vector(senseWireData(adc_i)),
        wr_en  => senseWireDataStrb,

        rd_en => fifoAdcData_ren(adc_i),
        dout  => fifoAdcData_dout(adc_i),
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
      fromDaqReg         => fromDaqReg,
      toDaqReg           => toDaqReg,
      --internalDwaReg     => open,

      runOdometer        => (others => '0'),
      fpgaSerialNum      => (others => '0'),

      --udpDataRen         => false, --fromDaq
      sendRunHdr         => sendRunHdr,
      sendAdcData        => sendAdcData,
      sendStatusHdr      => false,

      firmwareId_date    => (others => '0'),
      firmwareId_hash    => (others => '0'),
      stimPeriodActive   => (others => '0'),
      stimPeriodCounter  => acStim_nHPeriod(22 downto 0) & '0',

      adcSamplingPeriod  => adcCnv_nPeriod,

      adcDataRdy         => fifoAdcData_ef,
      adcDataRen         => fifoAdcData_ren,
      adcData            => fifoAdcData_dout,

      --udpRequestComplete => open,

      reset              => false,--fromDaq
      dwaClk100          => dwaClk100
    );  

end STRUCT;

