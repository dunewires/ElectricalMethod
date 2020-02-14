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
    regFromDwa      : out SLV_VECTOR_TYPE(31 downto 0)(31 downto 0);
    regFromDwa_strb : in  std_logic_vector(31 downto 0);

    regToDwa       : in SLV_VECTOR_TYPE(31 downto 0)(31 downto 0);
    S_AXI_ACLK_100 : in std_logic;
    S_AXI_ACLK_10  : in std_logic;


    led             : out std_logic_vector(3 downto 0);
    acStimX200_obuf : out std_logic := '0';
    mainsSquare     : in  std_logic;

    DAC_SDI   : out std_logic := '0';
    DAC_CS_B  : out std_logic := '0';
    DAC_LD_B  : out std_logic := '0';
    DAC_CLR_B : out std_logic := '0';
    DAC_CLK   : out std_logic := '0';

    dpotSdi  : out std_logic := '0';
    dpotSdo  : out std_logic := '0';
    dpotPr_b : out std_logic := '0';
    dpotCs_b : out std_logic := '0';
    dpotSck  : out std_logic := '0';
    dpotShdn_b  : out std_logic := '0';

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

  ------------------------------------------------------------------------------
  --  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
  --   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
  ------------------------------------------------------------------------------
  -- clk_out1____25.000______0.000______50.0______191.696____114.212
  -- clk_out2____50.000______0.000______50.0______167.017____114.212
  -- clk_out3___100.000______0.000______50.0______144.719____114.212
  -- clk_out4___200.000______0.000______50.0______126.455____114.212
  -- clk_out5___400.000______0.000______50.0______111.164____114.212
  -- clk_out6____12.500______0.000______50.0______219.618____114.212
  component clk_sysclk_mmcm
    port
    ( -- Clock in ports
      -- Clock out ports
      clk_out1 : out std_logic;
      clk_out2 : out std_logic;
      clk_out3 : out std_logic;
      clk_out4 : out std_logic;
      clk_out5 : out std_logic;
      clk_out6 : out std_logic;
      -- Status and control signals
      reset     : in  std_logic;
      locked    : out std_logic;
      clk_in1_P : in  std_logic;
      clk_in1_N : in  std_logic
    );
  end component;

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

  COMPONENT xadc_senseWire
    PORT (
      m_axis_tvalid : OUT STD_LOGIC;
      m_axis_tready : IN  STD_LOGIC;
      m_axis_tdata  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      m_axis_tid    : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      m_axis_aclk   : IN  STD_LOGIC;
      s_axis_aclk   : IN  STD_LOGIC;
      m_axis_resetn : IN  STD_LOGIC;

      vp_in  : IN STD_LOGIC;
      vn_in  : IN STD_LOGIC;
      vauxp0 : IN STD_LOGIC;
      vauxn0 : IN STD_LOGIC;
      vauxp8 : IN STD_LOGIC;
      vauxn8 : IN STD_LOGIC;

      channel_out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      eoc_out     : OUT STD_LOGIC;
      alarm_out   : OUT STD_LOGIC;
      eos_out     : OUT STD_LOGIC;
      busy_out    : OUT STD_LOGIC
    );
  END COMPONENT;

  COMPONENT fifo_adcData
    PORT (
      clk   : IN  STD_LOGIC;
      srst  : IN  STD_LOGIC;
      din   : IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
      wr_en : IN  STD_LOGIC;
      rd_en : IN  STD_LOGIC;
      dout  : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      full  : OUT STD_LOGIC;
      empty : OUT STD_LOGIC
    );
  END COMPONENT;

  COMPONENT ila_xadc

    PORT (
      clk    : IN STD_LOGIC;
      probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      probe2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0)
    );
  END COMPONENT ;

  COMPONENT ila_xadc_big

    PORT (
      clk    : IN STD_LOGIC;
      probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      probe2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0)
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
  END COMPONENT ;

  type chanList_t is array(natural range <>) of std_logic_vector(4 downto 0);
  constant chanList : chanList_t(2 downto 0) := ("11000","10000","00011");

  signal sysclk25  : std_logic := '0';
  signal sysclk50  : std_logic := '0';
  signal sysclk100 : std_logic := '0';
  signal sysclk200 : std_logic := '0';
  signal sysclk400 : std_logic := '0';
  signal sysclk10  : std_logic := '0';

  signal auto            : std_logic := '0';
  signal acStimX200      : std_logic := '0';
  signal acStimX200_oddr : std_logic := '0';
  signal acStim_oddr     : std_logic := '0';

  signal acStim_mag           : unsigned(11 downto 0)         := (others => '0');
  signal acStim_enable        : std_logic                     := '0';
  signal acStim_nPeriod       : unsigned(23 downto 0)         := (others => '0');
  signal acStimX200_periodCnt : unsigned(23 downto 0)         := (others => '0');
  signal acStimX200_nPeriod   : unsigned(23 downto 0)         := (others => '0');
  signal freqReq              : std_logic_vector(31 downto 0) := (others => '0');
  signal freqReq_vio          : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_tvalid : std_logic;
  signal m_axis_tready : std_logic;
  signal m_axis_tdata  : std_logic_vector(15 DOWNTO 0);
  signal m_axis_tid    : std_logic_vector(4 DOWNTO 0);
  signal m_axis_resetn : std_logic;

  signal fifo_adcData_wen : std_logic_vector(chanList'range) := (others => '0');
  signal fifo_adcData_ren : std_logic_vector(chanList'range) := (others => '0');
  signal fifo_adcData_ef  : std_logic_vector(chanList'range) := (others => '0');
  signal fifo_adcData_ff  : std_logic_vector(chanList'range) := (others => '0');
  type slv_vector_t is array(natural range <>) of std_logic_vector;
  signal fifo_adcData_dout   : slv_vector_t(chanList'range)(17 downto 0) := (others => (others => '0'));
  signal fifo_adcData_rdBusy : std_logic_vector(chanList'range)          := (others => '0');

  signal adcAutoDC_data    : std_logic_vector(15 downto 0) := (others => '0');
  signal fifoAutoDC_din    : std_logic_vector(15 downto 0) := (others => '0');
  signal fifoAutoDC_wen    : std_logic                     := '0';
  signal fifoAutoDC_ren    : std_logic                     := '0';
  signal fifoAutoDC_dout   : std_logic_vector(31 downto 0) := (others => '0');
  signal fifoAutoDC_ff     : std_logic                     := '0';
  signal fifoAutoDC_rdBusy : std_logic                     := '0';
  signal fifoAutoDC_ef     : std_logic                     := '0';
  signal adcAutoDc_af      : std_logic                     := '0';

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
  signal adcAutoDc_headData  : unsigned(15 downto 0)         := (others => '0');
  signal adcAutoDc_chSel     : std_logic_vector(3 downto 0)  := (others => '0');
  signal crtl_finish         : std_logic                     := '0';
  signal ctrl_busy           : std_logic                     := '0';
  signal ctrl_busy_del       : std_logic                     := '0';
  signal adcHScale           : unsigned(4 downto 0)          := (others => '0');
  signal adcAutoDC_dValid    : std_logic                     := '0';

  signal mainsSquare_del1, mainsSquare_del2 : std_logic := '0';
  signal mainsTrig                          : std_logic := '0';

  signal mainsMinus_enable : std_logic           := '1';
  signal mainsMinus_data   : signed(15 downto 0) := (others => '0');
  signal mainsMinus_wen    : std_logic           := '0';

  signal mainsTrig_filter : unsigned(17 downto 0);

  signal senseWireData     : UNSIGNED_VECTOR_TYPE(7 downto 0)(15 downto 0) := (others => (others => '0'));
  signal senseWireDataStrb : std_logic                                     := '0';
  signal senseWireDataSel  : unsigned(2 downto 0)                          := (others => '0');

    signal dpotMag :SLV_VECTOR_TYPE(7 downto 0)(7 downto 0) := (others => (others => '0'));
begin
  led(1) <= sysclk100;
  led(0) <= ctrl_busy;
  led(3) <= '1';
  led(2) <= acStimX200;


  clk_sysclk_mmcm_inst : clk_sysclk_mmcm
    port map (
      -- Clock out ports  
      clk_out1 => open,
      clk_out2 => open,
      clk_out3 => sysclk100,
      clk_out4 => sysclk200,
      clk_out5 => open,
      clk_out6 => sysclk10,
      -- Status and control signals                
      reset  => '0',
      locked => open,
      -- Clock in ports
      clk_in1_P => BB_CLK_P,
      clk_in1_N => BB_CLK_N
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


  -- the 32 bit division takes forever
  compute_n_periods : process (sysclk10)
    variable acStim_nPeriod_all : unsigned(31 downto 0 );
  begin
    if rising_edge(sysclk10) then
      if auto ='1' then
        freqReq       <= std_logic_vector(ctrl_freqSet);
        acStim_enable <= ctrl_acStim_enable;
      else
        freqReq       <= freqReq_vio;
        acStim_enable <= '1';
      end if;
      acStimX200_nPeriod <= (x"7A1200"/ unsigned(freqReq(23 downto 0)));
      -- trim off 8 MSbs because we don't need to go below ~10Hz
      acStim_nPeriod_all := (x"5F5E1000"/unsigned(freqReq));
      acStim_nPeriod     <= acStim_nPeriod_all(acStim_nPeriod'range);
    end if;
  end process compute_n_periods;

  make_ac_stimX200 : process (sysclk200)
  begin
    if rising_edge(sysclk200) then
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

      S_AXI_ACLK_100 => S_AXI_ACLK_100,
      sysclk200      => sysclk200
    );

  dpotInterface_1 : entity work.dpotInterface
    port map (
      mag      => dpotMag,

      sdi      => dpotSdi,
      sdo      => dpotSdo,
      pr_b     => dpotPr_b,
      cs_b     => dpotCs_b,
      sck      => dpotSck,
      shdn_b      => dpotShdn_b,

      sysClk10 => sysClk10
    );    

  adcReadout_1 : entity duneDwa.adcReadout
    port map (
      start  => '0',
      enable => '1',

      adcCnv        => adcCnv,
      adcSck        => adcSck,
      adcDataSerial => adcDataSerial,

      dataParallel     => senseWireData,
      dataParallelStrb => senseWireDataStrb,

      busy          => open,
      reset         => '0',
      adcSrcSyncClk => adcSrcSyncClk,
      sysclk100     => sysclk100
    );

  genCh : for i in 2 downto 0 generate

    --  fifo_adcData_ch : fifo_adcData
    --    PORT MAP (
    --      clk   => sysclk100,
    --      srst  => not m_axis_resetn,
    --      din   => "00" & m_axis_tdata,
    --      wr_en => fifo_adcData_wen(i),
    --      rd_en => fifo_adcData_ren(i),
    --      dout  => fifo_adcData_dout(i),
    --      full  => fifo_adcData_ff(i),
    --      empty => fifo_adcData_ef(i)
    --    );

    fifo_adcData_ren(i) <= fifo_adcData_rdBusy(i) and not fifo_adcData_ef(i);
    fifo_adcData_wen(i) <= m_axis_tvalid when m_axis_tid = chanList(i) else '0';

    sortAdcCh : process ( sysclk100)
    begin
      if rising_edge(sysclk100) then
        fifo_adcData_rdBusy(i) <= (fifo_adcData_ff(i) or fifo_adcData_rdBusy(i)) and
          not fifo_adcData_ef(i);
      end if;
    end process sortAdcCh;

    --  ila_xadc_ch : ila_xadc
    --    PORT MAP (
    --      clk       => sysclk100,
    --      probe0(0) => fifo_adcData_ren(i),
    --      probe1    => fifo_adcData_dout(i)(15 downto 0),
    --      probe2    => m_axis_tid
    --    );

  end generate genCh;


  trigGen : process (sysclk100)
  begin
    if rising_edge(sysclk100) then
      mainsSquare_del1 <= mainsSquare;
      mainsSquare_del2 <= mainsSquare_del1;
      mainsTrig        <= '1' when mainsTrig_filter = (mainsTrig_filter'left downto 1 => '0', 0 => '1') else '0';

      if mainsSquare_del2 = '0' then
        mainsTrig_filter <= (others => '1');
      elsif mainsTrig_filter /= (mainsTrig_filter'range => '0') then
        mainsTrig_filter <= mainsTrig_filter-1;
      end if;
    end if;
  end process;
  ----------------------------------------------------------------------------
  -- Auto sweep the stimulus frequency
  ----------------------------------------------------------------------------
  -- vio_ctrl_inst : vio_ctrl
  --   PORT MAP (
  --     clk => sysclk10,
  --     --probe_in0(31 downto 24)  => x"00",
  --     probe_in0(31 downto 0) => std_logic_vector(acStim_nPeriod),
  --     --probe_in1(31 downto 24)  => x"00",
  --     probe_in1(31 downto 0) => std_logic_vector(acStimX200_nPeriod),
  --     --probe_out0(31 downto 24) => open,
  --     probe_in2(0)            => ctrl_busy,
  --     probe_out0(31 downto 0) => freqReq_vio,
  --     probe_out1(0)           => m_axis_resetn,
  --     probe_out2(0)           => m_axis_tready,
  --     probe_out3(0)           => auto,
  --     probe_out4              => ctrl_freqMin,
  --     probe_out5              => ctrl_freqMax,
  --     probe_out6              => ctrl_freqStep,
  --     probe_out7              => ctrl_stimTime,
  --     probe_out8              => ctrl_adc_nSamples,
  --     probe_out9(0)           => ctrl_ctrlStart,
  --     probe_out10             => adcAutoDc_chSel,
  --     unsigned(probe_out11)   => adcHScale
  --   );

  -- Register decoder
  regFromDwa(15)    <= (31 downto 24 => '0', 23 downto 0 => std_logic_vector(acStim_nPeriod));
  regFromDwa(16)    <= (31 downto 24 => '0', 23 downto 0 => std_logic_vector(acStimX200_nPeriod));
  regFromDwa(17)(0) <= ctrl_busy;
  regFromDwa(18)    <= x"CAFEB0B0";

  regFromDwa(30) <= (
      31 downto 2 => '0',
      1           => fifoAutoDC_ff,
      0           => fifoAutoDC_ef
  );

  fifoAutoDC_ren <= regFromDwa_strb(31);

  regFromDwa(31) <= fifoAutoDC_dout;

  freqReq_vio       <= regToDwa(0);
  m_axis_resetn     <= regToDwa(1)(0);
  m_axis_tready     <= regToDwa(2)(0);
  mainsMinus_enable <= regToDwa(2)(1);
  auto              <= regToDwa(2)(2);
  ctrl_freqMin      <= regToDwa(4)(15 DOWNTO 0);
  ctrl_freqMax      <= regToDwa(5)(15 DOWNTO 0);
  ctrl_freqStep     <= regToDwa(6)(15 DOWNTO 0);
  ctrl_stimTime     <= regToDwa(7);
  ctrl_adc_nSamples <= regToDwa(8)(15 DOWNTO 0);
  ctrl_ctrlStart    <= regToDwa(9)(0);
  adcAutoDc_chSel   <= regToDwa(10)(3 DOWNTO 0);
  adcHScale         <= unsigned(regToDwa(11)(4 DOWNTO 0));
  acStim_mag        <= unsigned(regToDwa(12)(11 DOWNTO 0));
  senseWireDataSel  <= unsigned(regToDwa(13)(2 DOWNTO 0));
  CoilDrive         <= regToDwa(14);


  wtaController_inst : entity duneDwa.wtaController
    port map (
      freqMin      => unsigned(ctrl_freqMin),
      freqMax      => unsigned(ctrl_freqMax),
      freqStep     => unsigned(ctrl_freqStep),
      stimTime     => unsigned(ctrl_stimTime),
      adc_nSamples => unsigned(ctrl_adc_nSamples),

      ctrlStart => ctrl_ctrlStart,

      freqSet       => ctrl_freqSet,
      acStim_enable => ctrl_acStim_enable,

      acStim_nPeriod => acStim_nPeriod,
      adcHScale      => adcHScale,

      adcAutoDc_af     => adcAutoDc_af,
      adcAutoDc_wen    => adcAutoDc_wen, -- controller enable the writing
      adcAutoDc_data   => signed(adcAutoDc_data),
      adcAutoDc_dValid => adcAutoDC_dValid, -- feedback  to the controller that the ADC has sampled the selected channel 

      mainsAvg_nAvg      => x"08",
      adcAutoDc_headData => adcAutoDc_headData,

      mainsTrig         => mainsTrig,
      mainsMinus_enable => mainsMinus_enable,
      mainsMinus_data   => mainsMinus_data,
      mainsMinus_wen    => mainsMinus_wen,

      busy  => ctrl_busy,
      reset => not m_axis_resetn,
      clk   => sysclk100
    );

  readoutModeMuxing : process (sysclk100)
  begin
    if rising_edge(sysclk100) then
      -- Write header if MSb is 1,  ADC is 12 bits so there is no real data here
      if adcAutoDc_headData(15) = '1' then
        adcAutoDC_dValid <= '0';
        fifoAutoDC_din   <= std_logic_vector(adcAutoDc_headData);
        fifoAutoDC_wen   <= '1';
      else
        adcAutoDC_dValid <= senseWireDataStrb;
        fifoAutoDC_din   <= std_logic_vector(mainsMinus_data);
        --             fifoAutoDC_wen <= (fifo_adcData_wen(to_integer(unsigned(adcAutoDc_chSel))) and adcAutoDc_wen);
        adcAutoDC_data <= std_logic_vector(senseWireData(to_integer(senseWireDataSel)));
        fifoAutoDC_wen <= mainsMinus_wen;
      end if;

      --fifoAutoDC_wen <= fifo_adcData_wen(to_integer(unsigned(adcAutoDc_chSel)));
      --fifoAutoDC_din <= m_axis_tdata;

      -- start readout process when Programmable Pull
      fifoAutoDC_rdBusy <= (crtl_finish or adcAutoDc_af or fifoAutoDC_rdBusy) and
        not fifoAutoDC_ef;
      --trigger a readout at end of test
      ctrl_busy_del <= ctrl_busy;
      crtl_finish   <= ctrl_busy_del and not ctrl_busy;

    end if;
  end process readoutModeMuxing;

  fifo_autoDatacollection_inst : fifo_autoDatacollection
    PORT MAP (
      rst         => not m_axis_resetn,
      wr_clk      => sysclk100,
      rd_clk      => S_AXI_ACLK_100,
      din         => fifoAutoDC_din,
      wr_en       => fifoAutoDC_wen,
      rd_en       => fifoAutoDC_ren,
      dout        => fifoAutoDC_dout,
      full        => fifoAutoDC_ff,
      empty       => fifoAutoDC_ef,
      prog_full   => adcAutoDc_af,
      wr_rst_busy => open,
      rd_rst_busy => open
    );

  ila_xadc_fifoAuto : ila_xadc
    PORT MAP (
      clk       => sysclk100,
      probe0(0) => fifoAutoDC_wen,
      probe1    => adcAutoDC_data(15 downto 0),
      probe2(0) => ctrl_acStim_enable,
      probe2(1) => fifoAutoDC_ff,
      probe2(2) => fifoAutoDC_ef,
      probe2(3) => adcAutoDc_af,
      probe2(4) => fifoAutoDC_ren
    );

  ila_xadc_controller : ila_xadc
    PORT MAP (
      clk       => sysclk100,
      probe0(0) => mainsTrig,
      probe1    => std_logic_vector(mainsMinus_data),
      probe2(0) => ctrl_acStim_enable,
      probe2(1) => adcAutoDc_wen,
      probe2(2) => fifoAutoDC_wen,
      probe2(3) => mainsMinus_wen,
      probe2(4) => ctrl_busy
    );

end STRUCT;

