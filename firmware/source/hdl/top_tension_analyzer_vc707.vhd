library IEEE;
library duneWta;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;
-- Custom libraries and packages:
--use duneWta.global_def.all;
--use duneWta.LPPC_CUSTOM_FN_PKG.all;

entity top_tension_analyzer_vc707 is
  port (
    acStimX200_obuf : out std_logic := '0';
    acStim_obuf     : out std_logic := '0';
    V_p             : in  std_logic;
    V_n             : in  std_logic;
    Vaux0_n         : in  std_logic;
    Vaux0_p         : in  std_logic;
    Vaux8_n         : in  std_logic;
    Vaux8_p         : in  std_logic;
    sysclk_p        : in  std_logic;
    sysclk_n        : in  std_logic
  );

end top_tension_analyzer_vc707;

architecture STRUCT of top_tension_analyzer_vc707 is

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
      clk_in1_p : in  std_logic;
      clk_in1_n : in  std_logic
    );
  end component;

  COMPONENT fifo_autoDatacollection
    PORT (
      clk       : IN  STD_LOGIC;
      srst      : IN  STD_LOGIC;
      din       : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
      wr_en     : IN  STD_LOGIC;
      rd_en     : IN  STD_LOGIC;
      dout      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      full      : OUT STD_LOGIC;
      empty     : OUT STD_LOGIC;
      prog_full : OUT STD_LOGIC
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

  signal sysclk25   : std_logic := '0';
  signal sysclk50   : std_logic := '0';
  signal sysclk100  : std_logic := '0';
  signal sysclk200  : std_logic := '0';
  signal sysclk400  : std_logic := '0';
  signal sysclk12_5 : std_logic := '0';

  signal auto            : std_logic := '0';
  signal acStimX200      : std_logic := '0';
  signal acStimX200_oddr : std_logic := '0';
  signal acStim          : std_logic := '0';
  signal acStim_oddr     : std_logic := '0';

  signal acStim_enable        : std_logic                     := '0';
  signal acStim_periodCnt     : unsigned(31 downto 0)         := (others => '0');
  signal acStim_nPeriod       : unsigned(31 downto 0)         := (others => '0');
  signal acStimX200_periodCnt : unsigned(31 downto 0)         := (others => '0');
  signal acStimX200_nPeriod   : unsigned(31 downto 0)         := (others => '0');
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

  signal fifoAutoDC_din    : std_logic_vector(15 downto 0) := (others => '0');
  signal fifoAutoDC_wen    : std_logic                     := '0';
  signal fifoAutoDC_ren    : std_logic                     := '0';
  signal fifoAutoDC_dout   : std_logic_vector(15 downto 0) := (others => '0');
  signal fifoAutoDC_ff     : std_logic                     := '0';
  signal fifoAutoDC_rdBusy : std_logic                     := '0';
  signal fifoAutoDC_ef     : std_logic                     := '0';
  signal fifoAutoDC_pf     : std_logic                     := '0';

  signal ctrl_freqMin          : std_logic_vector(15 downto 0) := (others => '0');
  signal ctrl_freqMax          : std_logic_vector(15 downto 0) := (others => '0');
  signal ctrl_freqStep         : std_logic_vector(15 downto 0) := (others => '0');
  signal ctrl_stimTime         : std_logic_vector(31 downto 0) := (others => '0');
  signal ctrl_adcFifo_nSamples : std_logic_vector(15 downto 0) := (others => '0');
  signal ctrl_ctrlStart        : std_logic                     := '0';
  signal ctrl_freqSet          : unsigned(31 downto 0)         := (others => '0');
  signal ctrl_acStim_enable    : std_logic                     := '0';
  signal ctrl_acStim_nPeriod   : unsigned(31 downto 0)         := (others => '0');
  signal ctrl_adcFifo_af       : std_logic                     := '0';
  signal ctrl_adcFifo_wen      : std_logic                     := '0';
  signal ctrl_adcFifo_headData : unsigned(15 downto 0)         := (others => '0');
  signal ctrl_adcChSel         : std_logic_vector(3 downto 0)  := (others => '0');
  signal crtl_finish        : std_logic                     := '0';
  signal ctrl_busy        : std_logic                     := '0';
  signal ctrl_busy_del        : std_logic                     := '0';
  signal adcHScale          : unsigned(4 downto 0)         := (others => '0');
  signal adcAutoDC_strb    : std_logic                     := '0';

begin
  clk_sysclk_mmcm_inst : clk_sysclk_mmcm
    port map (
      -- Clock out ports  
      clk_out1 => sysclk25,
      clk_out2 => sysclk50,
      clk_out3 => sysclk100,
      clk_out4 => sysclk200,
      clk_out5 => sysclk400,
      clk_out6 => sysclk12_5,
      -- Status and control signals                
      reset  => '0',
      locked => open,
      -- Clock in ports
      clk_in1_p => sysclk_p,
      clk_in1_n => sysclk_n
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


  OBUF_acStimX200_inst : OBUF
    generic map (
      DRIVE      => 16,
      IOSTANDARD => "LVCMOS18",
      SLEW       => "SLOW")
    port map (
      O => acStimX200_obuf, -- Buffer output (connect directly to top-level port)
      I => acStimX200       -- Buffer input
    );

  OBUF_acStim_inst : OBUF
    generic map (
      DRIVE      => 16,
      IOSTANDARD => "LVCMOS18",
      SLEW       => "SLOW")
    port map (
      O => acStim_obuf, -- Buffer output (connect directly to top-level port)
      I => acStim       -- Buffer input
    );

  -- the 32 bit division takes forever
  compute_n_periods : process (sysclk12_5)
  begin
    if rising_edge(sysclk12_5) then
      if auto ='1' then
        freqReq       <= std_logic_vector(ctrl_freqSet);
        acStim_enable <= ctrl_acStim_enable;
      else
        freqReq       <= freqReq_vio;
        acStim_enable <= '1';
      end if;
      acStimX200_nPeriod <= (x"007A1200"/ unsigned(freqReq));
      acStim_nPeriod     <= (x"5F5E1000"/unsigned(freqReq));
    end if;
  end process compute_n_periods;

  make_ac_stim : process (sysclk200)
  begin
    if rising_edge(sysclk200) then
      -- Default Increment
      acStim_periodCnt     <= acStim_periodCnt +1;
      acStimX200_periodCnt <= acStimX200_periodCnt +1;
      -- need the > to catch when the nPeriod decreases at the wrong time
      if acStim_periodCnt >= acStim_nPeriod then
        acStim           <= not acStim;
        acStim_periodCnt <= (acStim_periodCnt'left downto 1 => '0', 0 => '1'); --x"000001";
      end if;

      if acStimX200_periodCnt >= acStimX200_nPeriod then
        acStimX200           <= not acStimX200;
        acStimX200_periodCnt <= (acStimX200_periodCnt'left downto 1 => '0', 0 => '1'); --x"000001";
      end if;

    end if;
  end process make_ac_stim;

  xadc_senseWire_inst : xadc_senseWire
    PORT MAP (
      m_axis_tvalid => m_axis_tvalid,
      m_axis_tready => m_axis_tready,
      m_axis_tdata  => m_axis_tdata,
      m_axis_tid    => m_axis_tid,
      m_axis_aclk   => sysclk100,
      s_axis_aclk   => sysclk100,
      m_axis_resetn => m_axis_resetn,

      vp_in  => V_p,
      vn_in  => V_n,
      vauxp0 => Vaux0_p,
      vauxn0 => Vaux0_n,
      vauxp8 => Vaux8_p,
      vauxn8 => Vaux8_n,

      channel_out => open,
      eoc_out     => open,
      alarm_out   => open,
      eos_out     => open,
      busy_out    => open
    );

  genCh : for i in 2 downto 0 generate

    fifo_adcData_ch : fifo_adcData
      PORT MAP (
        clk   => sysclk100,
        srst  => not m_axis_resetn,
        din   => "00" & m_axis_tdata,
        wr_en => fifo_adcData_wen(i),
        rd_en => fifo_adcData_ren(i),
        dout  => fifo_adcData_dout(i),
        full  => fifo_adcData_ff(i),
        empty => fifo_adcData_ef(i)
      );

    fifo_adcData_ren(i) <= fifo_adcData_rdBusy(i) and not fifo_adcData_ef(i);
    fifo_adcData_wen(i) <= m_axis_tvalid when m_axis_tid = chanList(i) else '0';

    sortAdcCh : process ( sysclk100)
    begin
      if rising_edge(sysclk100) then
        fifo_adcData_rdBusy(i) <= (fifo_adcData_ff(i) or fifo_adcData_rdBusy(i)) and
          not fifo_adcData_ef(i);
      end if;
    end process sortAdcCh;

    ila_xadc_ch : ila_xadc
      PORT MAP (
        clk       => sysclk100,
        probe0(0) => fifo_adcData_ren(i),
        probe1    => fifo_adcData_dout(i)(15 downto 0),
        probe2    => m_axis_tid
      );

  end generate genCh;

  ila_xadc_all : ila_xadc
    PORT MAP (
      clk       => sysclk100,
      probe0(0) => m_axis_tvalid,
      probe1    => m_axis_tdata,
      probe2    => m_axis_tid
    );
  ----------------------------------------------------------------------------
  -- Auto sweep the stimulus frequency
  ----------------------------------------------------------------------------
  vio_ctrl_inst : vio_ctrl
    PORT MAP (
      clk => sysclk12_5,
      --probe_in0(31 downto 24)  => x"00",
      probe_in0(31 downto 0) => std_logic_vector(acStim_nPeriod),
      --probe_in1(31 downto 24)  => x"00",
      probe_in1(31 downto 0) => std_logic_vector(acStimX200_nPeriod),
      --probe_out0(31 downto 24) => open,
      probe_in2(0) => ctrl_busy,
      probe_out0(31 downto 0) => freqReq_vio,
      probe_out1(0)           => m_axis_resetn,
      probe_out2(0)           => m_axis_tready,
      probe_out3(0)           => auto,
      probe_out4              => ctrl_freqMin,
      probe_out5              => ctrl_freqMax,
      probe_out6              => ctrl_freqStep,
      probe_out7              => ctrl_stimTime,
      probe_out8              => ctrl_adcFifo_nSamples,
      probe_out9(0)           => ctrl_ctrlStart,
      probe_out10             => ctrl_adcChSel,
      unsigned(probe_out11)             => adcHScale
    );

  wtaController_inst : entity duneWta.wtaController
    port map (
      freqMin          => unsigned(ctrl_freqMin),
      freqMax          => unsigned(ctrl_freqMax),
      freqStep         => unsigned(ctrl_freqStep),
      stimTime         => unsigned(ctrl_stimTime),
      adcFifo_nSamples => unsigned(ctrl_adcFifo_nSamples),

      ctrlStart => ctrl_ctrlStart,

      freqSet       => ctrl_freqSet,
      acStim_enable => ctrl_acStim_enable,

      acStim_nPeriod => acStim_nPeriod,
      adcHScale => adcHScale,

      adcFifo_af    => fifoAutoDC_pf,
      adcFifo_wen   => ctrl_adcFifo_wen, -- controller enable the writing
      adcFifo_wstrb => adcAutoDC_strb,   -- feedback  to the controller that the ADC has sampled the selected channel 

      adcFifo_headData => ctrl_adcFifo_headData,

      busy   => ctrl_busy,
      reset => not m_axis_resetn,
      clk   => sysclk100
    );

  readoutModeMuxing : process (sysclk100)
  begin
    if rising_edge(sysclk100) then
      -- Write header if MSb is 1,  ADC is 12 bits so there is no real data here
      if ctrl_adcFifo_headData(15) = '1' then
        fifoAutoDC_wen <= '1';
        fifoAutoDC_din <= std_logic_vector(ctrl_adcFifo_headData);
      else
        adcAutoDC_strb <= fifo_adcData_wen(to_integer(unsigned(ctrl_adcChSel)));
        fifoAutoDC_wen <= (fifo_adcData_wen(to_integer(unsigned(ctrl_adcChSel))) and ctrl_adcFifo_wen);
        fifoAutoDC_din <= m_axis_tdata;
      end if;

      -- start readout process when Programmable Pull
      fifoAutoDC_rdBusy <= (crtl_finish or fifoAutoDC_pf or fifoAutoDC_rdBusy) and
        not fifoAutoDC_ef;
        --trigger a readout at end of test
        ctrl_busy_del <= ctrl_busy;
        crtl_finish <=  ctrl_busy_del and not ctrl_busy;

    end if;
  end process readoutModeMuxing;

  fifo_autoDatacollection_inst : fifo_autoDatacollection
    PORT MAP (
      clk       => sysclk100,
      srst      => not m_axis_resetn,
      din       => fifoAutoDC_din,
      wr_en     => fifoAutoDC_wen,
      rd_en     => fifoAutoDC_ren,
      dout      => fifoAutoDC_dout,
      full      => fifoAutoDC_ff,
      empty     => fifoAutoDC_ef,
      prog_full => fifoAutoDC_pf
    );

  fifoAutoDC_ren <= fifoAutoDC_rdBusy and not fifoAutoDC_ef;

  ila_xadc_fifoAutoSparse : ila_xadc_big
    PORT MAP (
      clk       => sysclk100,
      probe0(0) => fifoAutoDC_ren,
      probe1    => fifoAutoDC_dout(15 downto 0),
      probe2    => m_axis_tid
    );

  ila_xadc_fifoAuto : ila_xadc
    PORT MAP (
      clk       => sysclk100,
      probe0(0) => fifoAutoDC_wen,
      probe1    => fifoAutoDC_din(15 downto 0),
      probe2(0) => ctrl_acStim_enable,
      probe2(1) => fifoAutoDC_ff,
      probe2(2) => fifoAutoDC_ef,
      probe2(3) => fifoAutoDC_pf,
      probe2(4) => fifoAutoDC_ren
    );

  ila_xadc_controller : ila_xadc
    PORT MAP (
      clk       => sysclk100,
      probe0(0) => '0',
      probe1    => std_logic_vector(ctrl_freqSet(15 downto 0)),
      probe2(0) => ctrl_acStim_enable,
      probe2(1) => ctrl_adcFifo_wen,
      probe2(2) => fifoAutoDC_wen,
      probe2(3) => '1',
      probe2(4) => '1'
    );

end STRUCT;

