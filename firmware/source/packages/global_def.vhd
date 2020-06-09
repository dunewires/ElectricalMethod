--------------------------------------------------------------------------------
-- Title       : DWA Global Definitions
-- Project     : DUNE DWA
--------------------------------------------------------------------------------
-- File        : headerGenerator.vhd
-- Author      : Nathan Felt felt@fas.harvard.edu
-- Company     : Harvard University LPPC
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Tue Jun  9 00:35:51 2020
-- Platform    : DWA microZed
-- Standard    : VHDL-2008
-------------------------------------------------------------------------------
-- Description: Definitions of a parameterized system
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;

library duneDwa;


package global_def is
	-- ADC AXI offset address
	constant adcRegOfst  : integer := 24;
	constant adcStatAddr : integer := 23;
	constant useAdcEmu   : boolean := true;

	type TARGET_TYPE is (COSMIC_TS,TEST_BEAM,V_SLICE,BENCHTOP);

	type SLV_VECTOR_TYPE is array (natural range <>) of std_logic_vector;

	type UNSIGNED_VECTOR_TYPE is array (natural range <>) of unsigned;
	type SIGNED_VECTOR_TYPE is array (natural range <>) of signed;
	--type INTEGER_VECTOR_TYPE is array (natural range <>) of integer;

	-- put all Processing System AXI registers here
	type fromDwaRegType is record
		freqReqAxi       : unsigned(23 downto 0);
		reset_b          : boolean;
		auto             : unsigned(23 downto 0);
		freqMin          : unsigned(23 downto 0);
		freqMax          : unsigned(23 downto 0);
		freqStep         : unsigned(23 downto 0);
		stimTime         : unsigned(23 downto 0);
		ctrlStart        : boolean;
		acStim_mag       : unsigned(23 downto 0);
		senseWireDataSel : unsigned(23 downto 0);
		CoilDrive        : std_logic_vector(23 downto 0);
		ctrl_busy        : boolean;
		DATE_CODE        : unsigned(23 downto 0);
		HASH_CODE        : unsigned(23 downto 0);
		headARdy         : boolean;
		headAData        : std_logic_vector(31 downto 0);
	end record;

	type fromDaqRegType is record
		freqReqAxi       : unsigned(23 downto 0);
		reset_b          : boolean;
		auto             : unsigned(23 downto 0);
		freqMin          : unsigned(23 downto 0);
		freqMax          : unsigned(23 downto 0);
		freqStep         : unsigned(23 downto 0);
		stimTime         : unsigned(23 downto 0);
		ctrlStart        : boolean;
		acStim_mag       : unsigned(23 downto 0);
		senseWireDataSel : unsigned(23 downto 0);
		CoilDrive        : std_logic_vector(23 downto 0);
		ctrl_busy        : boolean;

		headARen : boolean;
	end record;


end global_def;
