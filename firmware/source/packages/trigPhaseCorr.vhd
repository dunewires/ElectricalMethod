--------------------------------------------------------------------------------
-- Title       : DWA Global Definitions
-- Project     : DUNE DWA
--------------------------------------------------------------------------------
-- File        : headerGenerator.vhd
-- Author      : Nathan Felt felt@fas.harvard.edu
-- Company     : Harvard University LPPC
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Wed Sep 22 15:51:36 2021
-- Platform    : DWA microZed
-- Standard    : VHDL-2008
-------------------------------------------------------------------------------
-- Description: Definitions of a parameterized system
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

-- Custom libraries and packages:
library duneDwa;
use duneDwa.global_def.all;

package trigPhaseCorr is
    constant trigPhaseDel : UNSIGNED_VECTOR_TYPE(63 downto 0)(19 downto 0) := (
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE",
            x"0CAFE"
        );
    
end trigPhaseCorr;

package body trigPhaseCorr is

end trigPhaseCorr;
