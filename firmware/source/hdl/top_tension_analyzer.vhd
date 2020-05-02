library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;
-- Custom libraries and packages:
library duneDwa;
use duneDwa.global_def.all;

entity top_tension_analyzer is
  generic (
    DATE_CODE : std_logic_vector(31 downto 0);
    HASH_CODE : std_logic_vector(31 downto 0)
  );
  port (
    regFromDwa : out SLV_VECTOR_TYPE(31 downto 0)(31 downto 0);
    --regFromDwa      : out SLV_VECTOR_TYPE_32(31 downto 0);
    regFromDwa_strb : in std_logic_vector(31 downto 0);

    regToDwa : in SLV_VECTOR_TYPE(31 downto 0)(31 downto 0);
    --regToDwa       : in SLV_VECTOR_TYPE_32(31 downto 0);
    dwaClk100 : in std_logic;
    dwaClk10  : in std_logic;


    led             : out std_logic_vector(3 downto 0);
    acStimX200_obuf : out std_logic := '0';
    mainsSquare     : in  std_logic;

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

    CoilDrive : out std_logic_vector(31 downto 0);

    adcCnv        : out std_logic                    := '0';
    adcSck        : out std_logic                    := '0';
    adcDataSerial : in  std_logic_vector(3 downto 0) := (others => '0');
    adcSrcSyncClk : in  std_logic                    := '0';

    BB_CLK_P : in std_logic;
    BB_CLK_N : in std_logic
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

  signal acStim_mag           : unsigned(11 downto 0)         := (others => '0');
  signal acStim_enable        : std_logic                     := '0';
  signal acStim_nPeriod       : unsigned(23 downto 0)         := (others => '0');
  signal acStimX200_periodCnt : unsigned(23 downto 0)         := (others => '0');
  signal acStimX200_nPeriod   : unsigned(23 downto 0)         := (others => '0');
  signal freqReq              : std_logic_vector(31 downto 0) := (others => '1');
  signal freqReq_vio          : std_logic_vector(31 downto 0) := (others => '1');

  signal m_axis_tvalid : std_logic;
  signal m_axis_tready : std_logic;
  signal m_axis_tdata  : std_logic_vector(15 DOWNTO 0);
  signal m_axis_tid    : std_logic_vector(4 DOWNTO 0);
  signal m_axis_resetn : std_logic;

  signal adcAutoDC_data    : SIGNED_VECTOR_TYPE(7 downto 0)(15 downto 0) := (others => (others => '0'));
  signal fifoAutoDC_din    : SLV_VECTOR_TYPE(7 downto 0)(15 downto 0)    := (others => (others => '0'));
  signal fifoAutoDC_wen    : std_logic                                   := '0';
  signal fifoAutoDC_ren    : std_logic_vector(7 downto 0)                := (others => '0');
  signal fifoAutoDC_dout   : SLV_VECTOR_TYPE(7 downto 0)(15 downto 0)    := (others => (others => '0'));
  signal fifoAutoDC_ff     : std_logic_vector(7 downto 0)                := (others => '0');
  signal fifoAutoDC_rdBusy : std_logic_vector(7 downto 0)                := (others => '0');
  signal fifoAutoDC_ef     : std_logic_vector(7 downto 0)                := (others => '0');
  signal adcAutoDc_af      : std_logic_vector(7 downto 0)                := (others => '0');

  signal ctrl_freqMin        : std_logic_vector(15 downto 0) := (others => '0');
  signal ctrl_freqMax        : std_logic_vector(15 downto 0) := (others => '0');
  signal ctrl_freqStep       : std_logic_vector(15 downto 0) := (others => '0');
  signal ctrl_stimTime       : std_logic_vector(31 downto 0) := (others => '0');
  signal ctrl_adc_nSamples   : std_logic_vector(15 downto 0) := (others => '0');
  signal ctrl_ctrlStart      : std_logic                     := '0';
  signal ctrl_freqSet        : unsigned(31 downto 0)         := (others => '0');
  signal ctrl_acStim_enable  : std_logic                     := '0';
  signal ctrl_acStim_nPeriod : unsigned(31 downto 0)         := (others => '0');
  signal ctrl_adcFifo_af     : std_logic                     := '0';
  signal adcAutoDc_wen       : std_logic                     := '0';
  signal headData            : unsigned(15 downto 0)         := (others => '0');
  signal headDataStrb        : std_logic                     := '0';
  signal adcAutoDc_chSel     : std_logic_vector(3 downto 0)  := (others => '0');
  signal crtl_finish         : std_logic                     := '0';
  signal ctrl_busy           : std_logic                     := '0';
  signal ctrl_busy_del       : std_logic                     := '0';
  signal adcHScale           : unsigned(4 downto 0)          := (others => '0');
  signal adcAutoDC_dValid    : std_logic                     := '0';

  signal adcStart : std_logic := '0';
  signal adcBusy  : std_logic := '0';
  signal adcDone  : std_logic := '0';

  signal mainsSquare_del1, mainsSquare_del2 : std_logic := '0';
  signal mainsTrig                          : std_logic := '0';

  signal mainsMinus_enable : std_logic                         := '1';
  signal mainsMinus_data   : SIGNED_VECTOR_TYPE_16(7 downto 0) := (others => (others => '0'));
  signal mainsMinus_wen    : std_logic                         := '0';

  signal mainsTrig_filter : unsigned(17 downto 0);

  signal senseWireData     : SIGNED_VECTOR_TYPE(7 downto 0)(15 downto 0) := (others => (others => '0'));
  signal senseWireDataStrb : std_logic                                   := '0';
  signal senseWireDataSel  : unsigned(2 downto 0)                        := (others => '0');

  signal dpotMag : SLV_VECTOR_TYPE_08(7 downto 0) := (others => (others => '0'));

begin
  led(1) <= dwaClk100;
  led(0) <= ctrl_busy;
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

  -- Register decoder
  regFromDwa(15)    <= (31 downto 24 => '0', 23 downto 0 => std_logic_vector(acStim_nPeriod));
  regFromDwa(16)    <= (31 downto 24 => '0', 23 downto 0 => std_logic_vector(acStimX200_nPeriod));
  regFromDwa(17)(0) <= ctrl_busy;
  regFromDwa(18)    <= x"CAFEB0B0";
  regFromDwa(19)    <= DATE_CODE;
  regFromDwa(20)    <= HASH_CODE;

  freqReq_vio       <= regToDwa(0);
  m_axis_resetn     <= regToDwa(1)(0);
  m_axis_tready     <= regToDwa(2)(0);
  mainsMinus_enable <= regToDwa(2)(1);
  auto              <= regToDwa(2)(2);
  ctrl_freqMin      <= regToDwa(4)(15 DOWNTO 0);
  ctrl_freqMax      <= regToDwa(5)(15 DOWNTO 0);
  ctrl_freqStep     <= regToDwa(6)(15 DOWNTO 0);
  ctrl_stimTime     <= regToDwa(7);
  adcCnv_nCnv       <= regToDwa(8)(15 DOWNTO 0);
  ctrl_ctrlStart    <= regToDwa(9)(0);
  adcAutoDc_chSel   <= regToDwa(10)(3 DOWNTO 0);
  adcHScale         <= unsigned(regToDwa(11)(4 DOWNTO 0));
  acStim_mag        <= unsigned(regToDwa(12)(11 DOWNTO 0));
  senseWireDataSel  <= unsigned(regToDwa(13)(2 DOWNTO 0));
  CoilDrive         <= regToDwa(14);

  -- convert requested stim frequency to number of 100Mhz clocks
  -- move this to the processor!
  compute_n_periods : process (dwaClk10)
    variable acStim_nPeriod_all : unsigned(31 downto 0 );
  begin
    if rising_edge(dwaClk10) then
      if auto ='1' then
        freqReq       <= std_logic_vector(ctrl_freqSet);
        acStim_enable <= ctrl_acStim_enable;
      else
        freqReq       <= freqReq_vio;
        acStim_enable <= '1';
      end if;

      acStimX200_nPeriod <= (x"7A1200"/ unsigned(freqReq(23 downto 0)));
      -- trim off 8 MSbs because we don't need to go below ~10Hz
      -- acStim_nPeriod_all := (x"5F5E1000"/unsigned(freqReq));
      -- acStim_nPeriod     <= acStim_nPeriod_all(acStim_nPeriod'range);
      -- use the acStim_nPeriod as the basis for the other freq to maintain exact sync
      -- this will produce a greater error in the actual freq being measured.
      acStim_nPeriod <= acStimX200_nPeriod * 200;
      adcCnv_nPeriod <= acStimX200_nPeriod * 10; --  let's start with a fixed 20 samples/period
    end if;
  end process compute_n_periods;

  make_ac_stimX200 : process (dwaClk100)
  begin
    if rising_edge(dwaClk100) then
      -- Default Increment
      acStimX200_periodCnt <= acStimX200_periodCnt +1;
      -- need the > to catch when the nPeriod decreases at the wrong time

      if acStimX200_periodCnt >= acStimX200_nPeriod then
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
      acStim_mag     => acStim_mag,
      acStim_nPeriod => acStim_nPeriod,
      acStim_enable  => acStim_enable,

      DAC_SDI   => DAC_SDI,
      DAC_CS_B  => DAC_CS_B,
      DAC_LD_B  => DAC_LD_B,
      DAC_CLR_B => DAC_CLR_B,
      DAC_CLK   => DAC_CLK,

      dwaClk100 => dwaClk100
    );

  -- frequency scan and header generator
  -- move to processor 
  wtaController_inst : entity duneDwa.wtaController
    port map (
      adcCnv_nCnv    => unsigned(adcCnv_nCnv),
      adcCnv_nPeriod => adcCnv_nPeriod,
      acStim_nPeriod => acStim_nPeriod,

      freqMin  => unsigned(ctrl_freqMin),
      freqMax  => unsigned(ctrl_freqMax),
      freqStep => unsigned(ctrl_freqStep),

      stimTime => unsigned(ctrl_stimTime),

      ctrlStart => ctrl_ctrlStart,
      ctrlBusy  => ctrl_busy,

      freqSet       => ctrl_freqSet,
      acStim_enable => ctrl_acStim_enable,

      adcAutoDc_af => adcAutoDc_af,
      headData     => headData,
      headDataStrb => headDataStrb,

      adcStart => adcStart,
      adcBusy  => adcBusy,
      adcDone  => adcDone,

      reset     => not m_axis_resetn,
      status    => x"abc",
      dwaClk100 => dwaClk100
    );

  -- on adcStart get all of the samples at the current frequency
  adcReadout_inst : entity duneDwa.adcReadout
    port map (
      adcCnv_nCnv    => unsigned(adcCnv_nCnv),
      adcCnv_nPeriod => adcCnv_nPeriod,
      acStim_nPeriod => acStim_nPeriod,

      adcStart => adcStart,
      trigger  => not DAC_LD_B,
      adcBusy  => adcBusy,
      adcDone  => adcDone,

      adcCnv => adcCnv,
      adcSck => adcSck,

      adcDataSerialDwa => adcDataSerial,
      adcSrcSyncClkDwa => adcSrcSyncClk,

      dataParallel     => senseWireData,
      dataParallelStrb => senseWireDataStrb,

      reset     => not m_axis_resetn,
      dwaClk100 => dwaClk100
    );

  --for each of the 8 channels
  adcMemFifoGen : for adc_i in 7 downto 0 generate

    -- mux between header data and adc data
    readoutModeMuxing : process (dwaClk100)
    begin
      if rising_edge(dwaClk100) then
        if headDataStrb then
          fifoAutoDC_din(adc_i) <= std_logic_vector(headData);
          fifoAutoDC_wen        <= '1';
        else
          fifoAutoDC_din(adc_i) <= std_logic_vector(senseWireData(adc_i)) ;
          fifoAutoDC_wen        <= senseWireDataStrb;
        end if;
      end if;
    end process readoutModeMuxing;

    -- store data for AXI read
    fifo_autoDatacollection_ch : fifo_autoDatacollection
      PORT MAP (
        rst    => not m_axis_resetn,
        wr_clk => dwaClk100,
        rd_clk => dwaClk100,
        din    => fifoAutoDC_din(adc_i),
        wr_en  => fifoAutoDC_wen,

        rd_en => regFromDwa_strb(adc_i + adcRegOfst),
        dout  => regFromDwa(adc_i + adcRegOfst),
        -- ADC full bits are the second set of 8 bits
        full        => regFromDwa(adcStatAddr)(adc_i + 8),
        empty       => regFromDwa(adcStatAddr)(adc_i),
        prog_full   => adcAutoDc_af(adc_i),
        wr_rst_busy => open,
        rd_rst_busy => open
      );
  end generate adcMemFifoGen;

end STRUCT;

