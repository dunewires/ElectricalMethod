--------------------------------------------------------------------------------
-- Title       : triggerMains
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : triggerMains.vhd
-- Author      : Nathan Felt felt@fas.harvard.edu
-- Company     : Harvard University LPPC
-- Created     : Thu Sep  2 17:08:18 2021
-- Last update : Wed Sep 22 15:58:04 2021
-- Platform    : Dune DWA MicroZed
-- Standard    : VHDL-2008
--------------------------------------------------------------------------------
-- Description: Trigger on rising edge of power supply mains
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

entity triggerMains is
  port (
    mainsSquare : in std_logic             := '0';
    stimFreqReq : in unsigned(23 downto 0) := (others => '1');

    mainsTrig : out std_logic;

    dwaClk100 : in std_logic

  );
end entity triggerMains;

architecture behav of triggerMains is

  signal mainsSquare_del1, mainsSquare_del2 : std_logic := '0';
  signal mainsTrig_filter                   : unsigned(17 downto 0);
  signal trigPhaseCnt                       : unsigned(19 downto 0);
  signal stimFreqReqOffset                  : unsigned(6 downto 0);
  signal mainsTrigStart : std_logic := '0';

begin

  trigGen : process (dwaClk100)
  begin
    if rising_edge(dwaClk100) then
      mainsSquare_del1 <= mainsSquare;
      mainsSquare_del2 <= mainsSquare_del1;
      -- not yet supported by xilinx simulation 
      -- mainsTrig        <= '1' when mainsTrig_filter = (mainsTrig_filter'left downto 1 => '0', 0 => '1') else '0';
      if mainsTrig_filter = "00" & x"0001" then
        mainsTrigStart <= '1';
      else
        mainsTrigStart <= '0' ;
      end if;

      if mainsSquare_del2 = '0' then
        mainsTrig_filter <= (others => '1');
      elsif mainsTrig_filter /= (mainsTrig_filter'range => '0') then
        mainsTrig_filter <= mainsTrig_filter-1;
      end if;
    end if;
  end process;

  phaseDelay : process (dwaClk100)
  begin
    if rising_edge(dwaClk100) then

      -- offset frequencyReq so first value in LUT is 25 Hz 
      -- lower frequencies wont use the noise subtraction
      stimFreqReqOffset <= stimFreqReq(6 downto 0) - "0011001";

      if trigPhaseCnt = "00" & x"0001" then
        mainsTrig <= '1';
      else
        mainsTrig <= '0' ;
      end if;

      if mainsTrigStart then
        -- limit the LUT index to 64 entries 
        trigPhaseCnt <= trigPhaseDel(to_integer(stimFreqReqOffset(5 downto 0)));
      elsif trigPhaseCnt /= (trigPhaseCnt'range => '0') then
        trigPhaseCnt <= trigPhaseCnt-1;
      end if;
    end if;
  end process;
end architecture behav;