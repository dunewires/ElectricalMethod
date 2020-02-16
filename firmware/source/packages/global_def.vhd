--
-- VHDL Package Header nova_feb.register_address_map
--
-- Created:
--          by - nate.nate (heplpc2)
--          at - 14:48:24 06/29/10
--
-- using Mentor Graphics HDL Designer(TM) 2009.1 (Build 12)
--
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;

library duneDwa;

package global_def is
	-- ADC AXI offset address
	constant adcRegOfst  : integer := 24;
	constant adcStatAddr : integer := 23;


	type TARGET_TYPE is (COSMIC_TS,TEST_BEAM,V_SLICE,BENCHTOP);
	type SLV_VECTOR_TYPE is array (natural range <>) of std_logic_vector;
	type UNSIGNED_VECTOR_TYPE is array (natural range <>) of unsigned;
	type SIGNED_VECTOR_TYPE is array (natural range <>) of signed;
	type INTEGER_VECTOR_TYPE is array (natural range <>) of integer;
end global_def;
