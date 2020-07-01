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
	type internalDwaRegType is record
		freqReqAxi       : unsigned(23 downto 0);
		reset_b          : boolean;
		auto             : unsigned(23 downto 0);
		--freqMin          : unsigned(23 downto 0); 
		--freqMax          : unsigned(23 downto 0); 
		--freqStep         : unsigned(23 downto 0); 
		--stimTime         : unsigned(23 downto 0);
		ctrlStart        : boolean;
		senseWireDataSel : unsigned(23 downto 0);
		CoilDrive        : std_logic_vector(23 downto 0);
		ctrl_busy        : boolean;
		--DATE_CODE        : unsigned(23 downto 0);
		--HASH_CODE        : unsigned(23 downto 0);
        end record; -- internalDwaRegType
        
	type toDaqRegType is record
            udpDataRdy         : boolean;
            udpDataWord        : std_logic_vector(31 downto 0);
	end record; -- toDaqRegType

	type fromDaqRegType is record
		freqReqAxi       : unsigned(23 downto 0);
		reset_b          : boolean;
		auto             : unsigned(23 downto 0);

		--stimTime         : unsigned(23 downto 0);
		ctrlStart        : boolean;
		senseWireDataSel : unsigned(23 downto 0);
		CoilDrive        : std_logic_vector(23 downto 0);
		ctrl_busy        : boolean;

                -- start james' additions

                --- which register is this data coming from? (A, F, C, D, E, 0-7)
                --dataRegister       : std_logic_vector(7 downto 0);
                --- dwaCtrl (still used?  how many bits?)
                dwaCtrl          : unsigned(23 downto 0); --bits???
                fixedPeriod      : unsigned(23 downto 0); -- 10ns
                stimPeriodMin    : unsigned(23 downto 0); -- 10ns
                stimPeriodMax    : unsigned(23 downto 0); -- 10ns
                stimPeriodStep   : unsigned(23 downto 0); -- 10ns
                --stimPeriodActive   : unsigned(23 downto 0);
                --stimPeriodCounter  : unsigned(23 downto 0); -- bits???
                --- is this still relevant for v3???
                adcAutoDc_chSel    : unsigned(15 downto 0); -- bits???
                --- Number of stimulus cycles per frequency (unitless)
                cyclesPerFreq      : unsigned(23 downto 0);  -- bits???
                --- Number of ADC samples per simulus cycle (unitless)
                adcSamplesPerCycle : unsigned(15 downto 0); -- bits???
                --- AC Stimulus magnitude (12bit DAC value)
                acStim_mag         : unsigned(11 downto 0);
                -- Client IP address (where UDP data is sent)
                clientIp           : unsigned(31 downto 0);
                --- After switching to a new frequency, how long to wait before
                --- acquiring data (24bits, units=1.28 microseconds)
                ctrl_stimTime      : unsigned(23 downto 0);
                --- Channel mask indicating which sense channels are active (8bit)
                activeChannels     : std_logic_vector(7 downto 0);
                --- Mask indicating which relays are active
                --- in v2 this is 32 bits.  In v3 will be 192 bits!!!
                relayMask          : std_logic_vector(31 downto 0);
                --adcSamplingPeriod  : unsigned(23 downto 0);
                -- James' entries end

--		headARen         : boolean;
--		headFRen         : boolean;
--		headCRen         : boolean;
--		headERen         : boolean;
	end record; -- fromDaqRegType


end global_def;
