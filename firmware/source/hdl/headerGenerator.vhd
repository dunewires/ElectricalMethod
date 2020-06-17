--------------------------------------------------------------------------------
-- Title       : DWA Header Generator
-- Project     : DUNE DWA
--------------------------------------------------------------------------------
-- File        : headerGenerator.vhd
-- Author      : Nathan Felt felt@fas.harvard.edu
-- Company     : Harvard University LPPC
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Tue Jun  9 00:20:49 2020
-- Platform    : DWA microZed
-- Standard    : VHDL-2008
-------------------------------------------------------------------------------
-- Description: Construct a standard header
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.all;

library duneDwa;
use duneDwa.global_def.all;

entity headerGenerator is
	port (
		fromDaqReg     : in fromDaqRegType;
		toDaqReg       : inout toDaqRegType;
		internalDwaReg : in internalDwaRegType;

		headAStart : in boolean ; -- UDP Frame 
		headFStart : in boolean ; -- Run Frame
		headCStart : in boolean ; -- Frequency Frame
		--headDStart : in boolean ; -- ADC Data Frame
		--headEStart : in boolean ; -- Status Frame

		reset     : in boolean   := false;
		dwaClk100 : in std_logic := '0'
	);

end entity headerGenerator;

architecture rtl of headerGenerator is

	constant nHeadA      : integer  := 4; -- # of header words (incl. 2 delimiters)
	constant nHeadALog   : integer  := integer(log2(real(nHeadA +1)));
	signal headACnt      : unsigned(nHeadALog-1 downto 0)                  := (others => '0');
	signal headAPktCnt   : unsigned(23 downto 0)                           := (others => '0');
	signal headADataList : slv_vector_type(nHeadA-1 downto 0)(31 downto 0) := (others => (others => '0'));

        --------------------------
	-- Setup for Header F
	constant nHeadF      : integer  := 23; -- # of header words (incl. 2 delimiters)
	constant nHeadFLog   : integer  := integer(log2(real(nHeadF +1)));
	signal headFCnt      : unsigned(nHeadFLog-1 downto 0)                  := (others => '0');
	signal headFPktCnt   : unsigned(23 downto 0)                           := (others => '0');
	signal headFDataList : slv_vector_type(nHeadF-1 downto 0)(31 downto 0) := (others => (others => '0'));

        --------------------------
	-- Setup for Header C
	constant nHeadC      : integer  := 6; -- # of header words (incl. 2 delimiters)
	constant nHeadCLog   : integer  := integer(log2(real(nHeadC +1)));
	signal headCCnt      : unsigned(nHeadCLog-1 downto 0)                  := (others => '0');
	signal headCPktCnt   : unsigned(23 downto 0)                           := (others => '0');
	signal headCDataList : slv_vector_type(nHeadC-1 downto 0)(31 downto 0) := (others => (others => '0'));

        signal adcSamplesPerFreq : unsigned(39 downto 0) := (others => '0');
        
begin

        adcSamplesPerFreq <= internalDwaReg.adcSamplesPerCycle * internalDwaReg.cyclesPerFreq;
  
	--header data indexed list with 0 at bottom of list
	headADataList <= (
          x"AAAA" & std_logic_vector(to_unsigned(nHeadA-2, 16)), -- header delimiter (start)
          x"10" & x"00" & std_logic_vector(fromDaqReg.udpPacketCounter),   -- UDP pkt counter
          x"11" & x"0000" & internalDwaReg.dataRegister, -- Register ID
          x"AAAAAAAA" -- header delimiter (end)
	);

        headFDataList <= (
          x"FFFF" & std_logic_vector(to_unsigned(nHeadF-2, 16)), -- header delimiter (start)
          x"00" & std_logic_vector(internalDwaReg.runOdometer),
          x"01" & std_logic_vector(internalDwaReg.fpgaSerialNum),
          x"02" & std_logic_vector(internalDwaReg.firmwareId_date(47 downto 24)), --24MSb
          x"03" & std_logic_vector(internalDwaReg.firmwareId_date(23 downto  0)),  --24LSb
          x"04" & x"00" & std_logic_vector(internalDwaReg.firmwareId_hash(31 downto 16)), --16MSb
          x"05" & x"00" & std_logic_vector(internalDwaReg.firmwareId_hash(15 downto  0)),  --16LSb
          --
          x"20" & std_logic_vector(internalDwaReg.dwaCtrl),
          x"21" & std_logic_vector(internalDwaReg.fixedPeriod), 
          x"22" & std_logic_vector(internalDwaReg.stimPeriodMin),  -- fixme: is this really period?
          x"23" & std_logic_vector(internalDwaReg.stimPeriodMax),
          x"24" & std_logic_vector(internalDwaReg.stimPeriodStep),
          x"25" & x"00" & std_logic_vector(internalDwaReg.adcAutoDc_chSel),
          x"26" & std_logic_vector(internalDwaReg.cyclesPerFreq),
          x"27" & x"00" & std_logic_vector(internalDwaReg.adcSamplesPerCycle),
          x"28" & x"000" & std_logic_vector(internalDwaReg.acStim_mag), 
          -- 29 not used?
          x"2A" & x"00" & std_logic_vector(internalDwaReg.clientIp(31 downto 16)), --16MSb
          x"2B" & x"00" & std_logic_vector(internalDwaReg.clientIp(15 downto  0)), --16LSb
          x"2C" & std_logic_vector(internalDwaReg.ctrl_stimTime),
          x"2D" & x"0000" & internalDwaReg.activeChannels,
          x"2E" & x"00" & internalDwaReg.relayMask(31 downto 16), 
          x"2F" & x"00" & internalDwaReg.relayMask(15 downto  0),
          --# relay mask in v3 has 192 bits (64+32)*2 (8 lines of 24 bits) !!!
          x"FFFFFFFF" -- header delimiter (end)
        );    
        
        headCDataList <= ( -- Frequency Data Frame
          x"CCCC" & std_logic_vector(to_unsigned(nHeadC-2, 16)),
          x"11" & x"0000" & internalDwaReg.dataRegister, -- Register ID (same as in "A" frame)
          --x"40" & x"00" & internalDwaReg.freqCounter, -- FIXME: how to
                                                      -- implement for per-register, per-run. 16bit
          --FIXME: the following product can overflow...
          x"41" & std_logic_vector(adcSamplesPerFreq(23 downto 0)),
          x"42" & std_logic_vector(internalDwaReg.stimPeriodActive),
          x"43" & std_logic_vector(internalDwaReg.adcSamplingPeriod),
          x"CCCCCCCC"
        ); 
        
         -- Examples of ways to construct data lines
         --x"AB" & std_logic_vector(headAPktCnt),
         --tempA & std_logic_vector(fromDaqReg.freqMax),
         --"0100101" & '1' & std_logic_vector(fromDaqReg.freqStep(23 downto 4)) & "0100",
         --"01001101010000111110101010101010"


        
	sendHeader : process (dwaClk100)
	begin
		if rising_edge(dwaClk100) then
			if reset then-- reset takes priority
				toDaqReg.headARdy <= false;
				headACnt            <= (others => '0');
				toDaqReg.headFRdy <= false;
				headFCnt            <= (others => '0');
			else

                                -- Handle Header A
				if toDaqReg.headARdy then --currently sending header data
					if fromDaqReg.headARen then
						if headACnt /= 0 then --prevent simulation index error on underflow.
							headACnt <= headACnt-1; --get the next header word
						else
							toDaqReg.headARdy <= false; -- the header is finished
						end if;
					end if;

				elsif headAStart then -- not busy so wait for signal to begin
					toDaqReg.headARdy <= true;
					headACnt            <= to_unsigned(nHeadA-1,headACnt'length); -- resetting counter will initiate readout
					headAPktCnt         <= headAPktCnt+1;
				end if;

                                -- Handle Header F
				if toDaqReg.headFRdy then --currently sending header data
					if fromDaqReg.headFRen then
						if headFCnt /= 0 then --prevent simulation index error on underflow.
							headFCnt <= headFCnt-1; --get the next header word
						else
							toDaqReg.headFRdy <= false; -- the header is finished
						end if;
					end if;

				elsif headFStart then -- not busy so wait for signal to begin
					toDaqReg.headFRdy <= true;
					headFCnt            <= to_unsigned(nHeadF-1,headFCnt'length); -- resetting counter will initiate readout
					headFPktCnt         <= headFPktCnt+1;
				end if;

                                -- Handle Header C
				if toDaqReg.headCRdy then --currently sending header data
					if fromDaqReg.headCRen then
						if headCCnt /= 0 then --prevent simulation index error on underflow.
							headCCnt <= headCCnt-1; --get the next header word
						else
							toDaqReg.headCRdy <= false; -- the header is finished
						end if;
					end if;

				elsif headCStart then -- not busy so wait for signal to begin
					toDaqReg.headCRdy <= true;
					headCCnt            <= to_unsigned(nHeadC-1,headCCnt'length); -- resetting counter will initiate readout
					headCPktCnt         <= headCPktCnt+1;
				end if;

                                

			end if;
		end if;
	end process sendHeader;

	toDaqReg.headAData <= headADataList(to_integer(headACnt)); --mux selected header word
        toDaqReg.headFData <= headFDataList(to_integer(headFCnt)); 
        toDaqReg.headCData <= headCDataList(to_integer(headCCnt)); 
        
end architecture rtl;
