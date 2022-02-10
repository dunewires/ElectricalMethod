--------------------------------------------------------------------------------
-- Title       : ledCheck
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : ledCheck.vhd
-- Author      : Nathan Felt felt@fas.harvard.edu
-- Company     : Harvard University LPPC
-- Created     : Thu Sep  2 17:08:18 2021
-- Last update : Tue Feb  8 15:27:36 2022
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
    fromDaqReg : in  fromDaqRegType;

    ledDwa :std_logic_vector(3 downto 0) := (others  => '0');
    led :std_logic_vector(3 downto 0) := (others  => '0');

    dwaClk100 : in std_logic
  );
end entity ledCheck;

architecture behav of ledCheck is

signal twinkleReg : std_logic_vector(15 downto 0) := (others => '0') ;
signal bitCnt : unsigned(3 downto 0)  := (others   => '0');

begin
  taps  <= (twinkleReg(1) twinkleReg(2) twinkleReg(1) twinkleReg(15))
  trigGen : process (dwaClk100)
  begin
    if rising_edge(dwaClk100) then
    if bitCnt < "100" then
        twinkleReg <= twinkleReg(14 downto 0) & xor(taps);
        bitCnt  <= bitCnt+1;
      elsif rateCnt = (rateCnt'range = '0');
    end if;
  end process;
