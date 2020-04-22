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
  constant BB_CLK_period : time := 50 ns;
  constant sysclk100_period: time := 100 ns;
  constant T_HOLD       : time := 10 ns;
  constant T_STROBE     : time := BB_CLK_period - (1 ns);


  signal end_of_simulation : boolean := false;

--signal    regFromDwa      : SLV_VECTOR_TYPE_32(31 downto 0)(31 downto 0);
signal    regFromDwa      : SLV_VECTOR_TYPE_32(31 downto 0);
signal    regFromDwa_strb :  std_logic_vector(31 downto 0);
--signal    regToDwa       : SLV_VECTOR_TYPE_32(31 downto 0)(31 downto 0);
signal    regToDwa       : SLV_VECTOR_TYPE_32(31 downto 0);
signal    S_AXI_ACLK_100 : std_logic;
signal    S_AXI_ACLK_10  : std_logic;
signal    led             : std_logic_vector(3 downto 0);
signal    acStimX200_obuf : std_logic := '0';
signal    mainsSquare     :  std_logic;
signal    DAC_SDI   : std_logic := '0';
signal    DAC_CS_B  : std_logic := '0';
signal    DAC_LD_B  : std_logic := '0';
signal    DAC_CLR_B : std_logic := '0';
signal    DAC_CLK   : std_logic := '0';
signal    dpotSdi    : std_logic := '0';
signal    dpotSdo    : std_logic := '0';
signal    dpotPr_b   : std_logic := '0';
signal    dpotCs_b   : std_logic := '0';
signal    dpotSck    : std_logic := '0';
signal    dpotShdn_b : std_logic := '0';
signal    CoilDrive : std_logic_vector(31 downto 0);
signal    adcCnv        : std_logic                    := '0';
signal    adcSck        : std_logic                    := '0';
signal    adcDataSerial :  std_logic_vector(3 downto 0) := (others => '0');
signal    adcSrcSyncClk :  std_logic                    := '0';
signal    BB_CLK_P : std_logic;
signal    BB_CLK_N : std_logic;
signal    sysclk100 : std_logic;

begin

  top_tension_analyzer_1 : entity duneDwa.top_tension_analyzer
    generic map (
      DATE_CODE => x"abcd1234",
      HASH_CODE => x"cafe1234"
    )
    port map (
      regFromDwa      => regFromDwa,
      regFromDwa_strb => regFromDwa_strb,
      regToDwa        => regToDwa,
      S_AXI_ACLK_100  => S_AXI_ACLK_100,
      S_AXI_ACLK_10   => S_AXI_ACLK_10,
      led             => led,
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
      CoilDrive       => CoilDrive,
      adcCnv          => adcCnv,
      adcSck          => adcSck,
      adcDataSerial   => adcDataSerial,
      adcSrcSyncClk   => adcSrcSyncClk,
      BB_CLK_P        => BB_CLK_P,
      BB_CLK_N        => BB_CLK_N
    );


  adc_dds_io_1 : entity work.adc_dds_io
    port map (
      adcCnv           => adcCnv,
      adcSck           => adcSck,

      adcDataSerial    => adcDataSerial,
      adcSrcSyncClk => adcSrcSyncClk,

      sysclk100        => sysclk100
    );


  -----------------------------------------------------------------------
  -- Generate clock
  -----------------------------------------------------------------------
  BB_clock_gen : process
  begin
    BB_CLK_P <= '0';
    if (end_of_simulation) then
      wait;
    else
      wait for BB_CLK_period;
      loop
        BB_CLK_P <= '0';
        BB_CLK_N <= '1';
        wait for BB_CLK_period/2;
        BB_CLK_P <= '1';
        BB_CLK_N <= '0';
        wait for BB_CLK_period/2;
      end loop;
    end if;
  end process bb_clock_gen;

  sysClk_gen : process
  begin
    sysclk100 <= '0';
    if (end_of_simulation) then
      wait;
    else
      wait for sysclk100_period;
      loop
        sysclk100 <= '0';
        wait for sysclk100_period/2;
        sysclk100 <= '1';
        wait for sysclk100_period/2;
      end loop;
    end if;
  end process sysClk_gen;

  stimuli : process
  begin
    -- Drive inputs T_HOLD time after rising edge of clock
    wait until rising_edge(BB_CLK_P);
    wait for T_HOLD;

    -- Run for long enough to produce 5 periods of outputs
    wait for BB_CLK_period * 5008126;

    -- End of test
    end_of_simulation <= true;
    report "Not a real failure. Simulation finished successfully. Test completed successfully" severity failure;
    wait;
  end process stimuli;

end tb;

