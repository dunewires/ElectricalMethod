--------------------------------------------------------------------------------
-- Title       : DWA Header Generator Test Bench
-- Project     : DUNE DWA
--------------------------------------------------------------------------------
-- File        : headerGenerator.vhd
-- Author      : Nathan Felt felt@fas.harvard.edu
-- Company     : Harvard University LPPC
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Tue Jun  9 00:35:52 2020
-- Platform    : DWA microZed
-- Standard    : VHDL-2008
-------------------------------------------------------------------------------
-- Description: Test bench for the Header Generator
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library duneDwa;
use duneDwa.global_def.all;

entity tb_headerGenerator is
end tb_headerGenerator;

architecture tb of tb_headerGenerator is

  -----------------------------------------------------------------------
  -- Timing constants
  -----------------------------------------------------------------------
  signal fromDaqReg     : fromDaqRegType;
--  signal toDaqReg       : toDaqRegType;
  signal internalDwaReg : internalDwaRegType;

  signal reset     : boolean   := false;
  signal dwaClk100 : std_logic := '0';

begin

  headerGenerator_inst : entity duneDwa.headerGenerator
    port map (
      fromDaqReg     => fromDaqReg,
--      toDaqReg       => toDaqReg,
      internalDwaReg => internalDwaReg,

      reset     => reset,
      dwaClk100 => dwaClk100
    );

end tb;

