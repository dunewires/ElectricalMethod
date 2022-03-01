--------------------------------------------------------------------------------
-- Title       : ledCheck
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : ledCheck.vhd
-- Author      : Nathan Felt felt@fas.harvard.edu
-- Company     : Harvard University LPPC
-- Created     : Thu Sep  2 17:08:18 2021
-- Last update : Fri Feb 18 11:54:47 2022
-- Platform    : Dune DWA MicroZed
-- Standard    : VHDL-2008
--------------------------------------------------------------------------------
-- Description: twinkle the LEDs at startup or on command to check they're happy
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;
-- Custom libraries and packages:
library duneDwa;
use duneDwa.global_def.all;
use duneDwa.trigPhaseCorr.all;

entity ledCheck is
  port (
    fromDaqReg : in fromDaqRegType;

    ledDwa : in  std_logic_vector(3 downto 0) := (others => '0');
    led    : out std_logic_vector(3 downto 0) := (others => '0');

    dwaClk100 : in std_logic
  );
end entity ledCheck;

architecture behav of ledCheck is

  signal twinkleReg         : std_logic_vector(15 downto 0) := (others => '0') ;
  signal beatCnt            : unsigned(28 downto 0)         := (others => '1'); --29 bits is ~5sec,  initial all '1'
  signal waitCnt            : unsigned(23 downto 0)         := (others => '0');
  signal taps               : std_logic_vector(3 downto 0)  := (others => '0');
  signal ledParty, ledFlash : std_logic_vector(3 downto 0)  := (others => '0');
  
begin

  -- max length tap locations from chart https://www.eetimes.com/tutorial-linear-feedback-shift-registers-lfsrs-part-1/#
  taps <= (twinkleReg(1), twinkleReg(2), twinkleReg(4), twinkleReg(15));

  danceBeat : process (dwaClk100)
  begin
    if rising_edge(dwaClk100) then
      if waitCnt /= x"FFFFFF" then
        waitCnt <= waitCnt + 1;     -- after power up wait for a bit
        if waitCnt = x"FFFFFE" then -- if we are almost done update the seed and let the party begin
          twinkleReg <= std_logic_vector(fromDaqReg.serNum(15 downto 0));
          beatCnt    <= (beatCnt'range => '0');
        end if;
      end if;

      if beatCnt /= (beatCnt'range => '1') then
        -- get out the refreshments and warm up the dance shoes
        if beatCnt(23 downto 0) < x"000004" then -- shift 4 bits every ~0.1 sec
          twinkleReg <= twinkleReg(14 downto 0) & xor(taps);
        else
          ledParty <= twinkleReg(15 downto 12);
        end if;
        beatCnt <= beatCnt+1;

      else
        ledParty <= ledDwa;
      end if;

      -- use the beat cnt to generate a simple flash, it's time to get back to work
      if beatCnt < (28 downto 27 => '1', 26 downto 0 => '0') then
        ledFlash <= (3 downto 0 => beatCnt(26)); --drive low then high 
      else
        ledFlash <= ledDwa;
      end if;

    end if;
  end process;

  led <= ledParty when fromDaqReg.danceParty else ledFlash;

end architecture behav;