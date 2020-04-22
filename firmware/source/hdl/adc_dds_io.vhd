
library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
library std;
--use std.textio.all;
--use ieee.std_logic_textio.all;
use std.textio.all;

library duneDwa;
use duneDwa.global_def.all;

entity adc_dds_io is
  port (
    --    GBT_ENABLE : out std_logic;
    adcCnv : in std_logic := '0';
    adcSck : in std_logic := '0';

    adcDataSerial    : out STD_LOGIC_VECTOR(3 downto 0);
    adcSrcSyncClk : out std_logic := '0';

    sysclk100 : in std_logic := '0'
  );
end adc_dds_io;

architecture behav of adc_dds_io is

  COMPONENT dds_compiler_1khz
    PORT (
      aclk               : IN  STD_LOGIC;
      m_axis_data_tvalid : OUT STD_LOGIC;
      m_axis_data_tdata  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
  END COMPONENT;

  --  signal ENABLE     : boolean := false;

  signal adcDataPar : SLV_VECTOR4_TYPE := (others => (others => '0'));

  signal sinGenData : SIGNED_VECTOR8_TYPE  := (others => (others => '0'));
  signal sinGenChan : unsigned(2 downto 0) := "000";
  signal tvalid     : std_logic            := '0';
  signal adcCnv_del : std_logic            := '0';
  signal tdata      : std_logic_vector(15 downto 0);

begin

  dds_compiler_1khz_inst : dds_compiler_1khz
    port map (
      aclk               => sysclk100,
      m_axis_data_tvalid => tvalid,
      m_axis_data_tdata  => tdata
    );

  getSinData : process (sysclk100)
  begin
    if rising_edge(sysclk100) then
      -- remember last adcCnv state, used to find cnv edge
      adcCnv_del <= adcCnv;
      -- get the sine date from the generator
      if tvalid = '1' then
        sinGenChan                         <= sinGenChan + 1;
        sinGenData(to_integer(sinGenChan)) <= signed(tdata);
      end if;

    end if;
  end process getSinData;

  adcSerLinkGen : for serLink_i in 3 downto 0 generate

    serSinData : process (adcSck,adcCnv)
    begin
      -- look for first adcCnv edge
      if (adcCnv = '1' and adcCnv_del= '0') then
        -- sample the "analog" data
        adcDataPar(serLink_i) <= (
            std_logic_vector(sinGenData(serLink_i*2)) &
            std_logic_vector(sinGenData((serLink_i*2) +1))
        );
      elsif falling_edge(adcSck) then
        adcDataPar(serLink_i) <= adcDataPar(serLink_i)(30 downto 0) & '0';
      end if;
    end process serSinData;
    adcDataSerial(serLink_i) <= adcDataPar(serLink_i)(31);

  end generate adcSerLinkGen;

adcSrcSyncClk <= adcSck;
end architecture behav;
