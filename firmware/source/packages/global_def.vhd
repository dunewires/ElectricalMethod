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

                -- james' entries start
                --- which register is this data coming from? (A, F, C, D, E, 0-7)
                dataRegister     : std_logic_vector(7 downto 0);
                --- total number of runs with this board (non-volatile)
                runOdometer      : unsigned(23 downto 0);
                --- 24 LSb of the 64-bit FPGA serial number
                fpgaSerialNum    : unsigned(23 downto 0);
                --- dwaCtrl (still used?  how many bits?)
                dwaCtrl          : unsigned(23 downto 0); --bits???
                --- fixedPeriod 24bit in units of 10ns
                fixedPeriod      : unsigned(23 downto 0);

                --- Are these the same as freqMin, freqMax, freqStep????
                --22 # stimPeriodMin 24bit in units of 10 ns
                --23 # stimPeriodMax 24bit in units of 10 ns
                --24 # stimPeriodStep (??-bit in units of ??)
                --25 # adcAutoDc_chSel
                adcAutoDc_chSel  : unsigned(16 downto 0); -- bits???
                --26 # number of cycles per frequency (???-bits, unitless)
                nCycPerFreq : unsigned(23 downto 0);  -- bits???
                --27 # ADC samples per cycle (???-bits, unitless)
                adcSampPerCycle : unsigned(16 downto 0); -- bits???
                --28 # stimMag (12bit DAC value)
                --2A # clientIp_16MSb 16 MSb of client_IP  16bit
                --2B # clientIp_16LSb 16 LSb of client_IP  16bit
                --2C # ctrl_stimTime (24bits, units=??) (coarser than 10ns)
                --2D # activeChannels (channel mask for the active channels (8bit)
                --2E # relayMask_16MSb (which relays are active). Valid for v2 only
                --2F # relayMask_16LSb (which relays are active). Valid for v2 only
                --?? # v3 has 192 bits (64+32)*2 (8 lines of 24 bits)
                                                               

                
                -- james' entries end

        end record;
        
	type toDaqRegType is record
		headARdy         : boolean;
		headFRdy         : boolean;
		headCRdy         : boolean;
		headERdy         : boolean;

		headAData        : std_logic_vector(31 downto 0);
		headFData        : std_logic_vector(31 downto 0);
		headCData        : std_logic_vector(31 downto 0);
		headEData        : std_logic_vector(31 downto 0);
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
                -- start james' additions
                --- overall UDP packet count this run (not per register)
                udpPacketCounter : unsigned(15 downto 0); 
                
                -- end james' additions
                
		headARen         : boolean;
		headFRen         : boolean;
		headCRen         : boolean;
		headERen         : boolean;
	end record;


end global_def;
