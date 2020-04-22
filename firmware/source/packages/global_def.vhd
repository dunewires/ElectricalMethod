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
	constant useAdcEmu: boolean := true;

	type TARGET_TYPE is (COSMIC_TS,TEST_BEAM,V_SLICE,BENCHTOP);
	-- Vivado sim does not support unconstrained arrays :(
	-- it's only been 12 years, give them time!
	type SLV_VECTOR_TYPE_32 is array (natural range <>) of std_logic_vector(31 downto 0);
	type SLV_VECTOR_TYPE_18 is array (natural range <>) of std_logic_vector(17 downto 0);
	type SLV_VECTOR_TYPE_16 is array (natural range <>) of std_logic_vector(15 downto 0);
	type SLV_VECTOR_TYPE_08 is array (natural range <>) of std_logic_vector(7 downto 0);
	type SLV_VECTOR_TYPE is array (natural range <>) of std_logic_vector;

	type SLV_VECTOR4_TYPE is array (3 downto 0) of std_logic_vector(31 downto 0);
	type UNSIGNED_VECTOR_TYPE_16 is array (natural range <>) of unsigned(15 downto 0);
	type SIGNED_VECTOR_TYPE_16 is array (natural range <>) of signed(15 downto 0);
	type SIGNED_VECTOR8_TYPE is array  (7 downto 0) of signed(15 downto 0);
	type SIGNED_VECTOR4_TYPE is array  (3 downto 0) of signed(31 downto 0);
	--type INTEGER_VECTOR_TYPE is array (natural range <>) of integer;
end global_def;
