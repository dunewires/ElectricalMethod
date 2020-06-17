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

	-- set the number of header words here
	constant nHeadA    : integer                      := 4;
	--constant tempA     : std_logic_vector(7 downto 0) := "11001101";
        -- number of bits needed for headACnt
	constant nHeadALog : integer                      := integer(log2(real(nHeadA +1)));

	signal headACnt      : unsigned(nHeadALog-1 downto 0)                  := (others => '0');
	signal headAPktCnt   : unsigned(23 downto 0)                           := (others => '0');
	signal headADataList : slv_vector_type(nHeadA-1 downto 0)(31 downto 0) := (others => (others => '0'));

        --------------------------
	-- Setup for Header F
	constant nHeadF    : integer                      := 7; -- # of headerwords
	constant nHeadFLog : integer                      := integer(log2(real(nHeadF +1)));

	signal headFCnt      : unsigned(nHeadFLog-1 downto 0)                  := (others => '0');
	signal headFPktCnt   : unsigned(23 downto 0)                           := (others => '0');
	signal headFDataList : slv_vector_type(nHeadF-1 downto 0)(31 downto 0) := (others => (others => '0'));

        --------------------------
	-- Setup for Header C
	constant nHeadC    : integer                      := 3; -- # of headerwords
	constant nHeadCLog : integer                      := integer(log2(real(nHeadC +1)));

	signal headCCnt      : unsigned(nHeadCLog-1 downto 0)                  := (others => '0');
	signal headCPktCnt   : unsigned(23 downto 0)                           := (others => '0');
	signal headCDataList : slv_vector_type(nHeadC-1 downto 0)(31 downto 0) := (others => (others => '0'));

        -- FIXME:
        -- currently headAPktCnt is not used in the "Type A" header...

        
begin
 
	--header data indexed list with 0 at bottom of list
	headADataList <= (
          x"AAAA" & std_logic_vector(to_unsigned(nHeadA-2, 16)), -- header delimiter (start)
          x"10" & x"00" & std_logic_vector(fromDaqReg.udpPacketCounter),   -- UDP pkt counter
          x"11" & x"0000" & internalDwaReg.dataRegister, -- Register ID
          x"AAAAAAAA" -- header delimiter (end)
	);

        headFDataList <= (
          x"FFFF" & std_logic_vector(to_unsigned(nHeadF-2, 16)), -- header delimiter (start)
          --x"20" & [[[dwaCtrl]]], 
          --x"21" & [[[fixedPeriod]]], 
          x"22" & std_logic_vector(internalDwaReg.freqMin),  -- fixme: is this really period?
          x"23" & std_logic_vector(internalDwaReg.freqMax),
          x"24" & std_logic_vector(internalDwaReg.freqStep),
          --x"25 & ???? & [[[adcAutoDc_chSel]]],
          --x"26" & [[[number of cycles per frequency]]],
          --x"27" & [[[ADC samples per cycle]]],
          x"28" & std_logic_vector(internalDwaReg.acStim_mag),  -- fixme: verify!!!
          --x"2A" & x"00"  & client_IP (16 MSb)
          --x"2B" & x"00"  & client_IP (16 LSb)
          x"2C" & std_logic_vector(internalDwaReg.stimTime),
          --x"2D" & std_logic_vector(internalDwaReg.activeChannels), --fixme: active
                                                               --channel mask
          --x"2E" & x"00" & std_logic_vector(relayMask(xxx downto yyy)), 
          --x"2F" & x"00" & std_logic_vector(relayMask(xxx downto yyy)),
          x"FFFFFFFF" -- header delimiter (end)
        );    

        headCDataList <= ( -- Frequency Data Frame
          x"CCCC" & std_logic_vector(to_unsigned(nHeadC-2, 16)),
          x"11" & x"0000" & internalDwaReg.dataRegister, -- Register ID (same as in "A" frame)
          --x"40" & x"00" & Counter, this register, this run. 16bit
          --x"41" & x"00" &  total # of ADC samples for this frequency. 16bit (not samples per cycle)
          --x"42" & Stimulus frequency period in units of 10 ns. 24bit
          --x"43" & Sampling period in units of 10 ns. 24bit
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
