--------------------------------------------------------------------------------
-- Title       : DWA Header Generator
-- Project     : DUNE DWA
--------------------------------------------------------------------------------
-- File        : headerGenerator.vhd
-- Author      : James Battat jbattat@wellesley.edu
-- Company     : Wellesley College, Physics
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Sun Jun  28 15:41:00 2020
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
		fromDaqReg      : in fromDaqRegType;
		--toDaqReg        : inout toDaqRegType;
		internalDwaReg  : in internalDwaRegType;

                dataWord        : out std_logic_vector(31 downto 0)  := (others => '0');
                requestComplete : out boolean := false;
                dataAvail       : out boolean := false;

		reset     : in boolean   := false;
		dwaClk100 : in std_logic := '0'
	);

end entity headerGenerator;

architecture rtl of headerGenerator is

        type ctrlState_type is (idle_s, genAFrame_s, genCFrame_s, genDFrame_s, genEFrame_s, genFFrame_s);
        signal ctrlState   : ctrlState_type := idle_s;

        signal requestType : std_logic_vector(3 downto 0);
        
        ----------------- below this line is old -- do not use
	constant nHeadA      : integer  := 4; -- # of header words (incl. 2 delimiters)
	constant nHeadALog   : integer  := integer(log2(real(nHeadA +1)));
	signal headACnt      : unsigned(nHeadALog-1 downto 0)                  := (others => '0');
	signal headADataList : slv_vector_type(nHeadA-1 downto 0)(31 downto 0) := (others => (others => '0'));

        ----------------------------
	---- Setup for Header F
	constant nHeadF      : integer  := 23; -- # of header words (incl. 2 delimiters)
	constant nHeadFLog   : integer  := integer(log2(real(nHeadF +1)));
	signal headFCnt      : unsigned(nHeadFLog-1 downto 0)                  := (others => '0');
	signal headFDataList : slv_vector_type(nHeadF-1 downto 0)(31 downto 0) := (others => (others => '0'));

        ----------------------------
	---- Setup for Header C
	constant nHeadC      : integer  := 7; -- # of header words (incl. 2 delimiters)
	constant nHeadCLog   : integer  := integer(log2(real(nHeadC +1)));
	signal headCCnt      : unsigned(nHeadCLog-1 downto 0)                  := (others => '0');
	signal headCDataList : slv_vector_type(nHeadC-1 downto 0)(31 downto 0) := (others => (others => '0'));

        ----------------------------
	---- Setup for Header E
	constant nHeadE      : integer  := 3; -- # of header words (incl. 2 delimiters)
	constant nHeadElog   : integer  := integer(log2(real(nHeadE +1)));
	signal headECnt      : unsigned(nHeadELog-1 downto 0)                  := (others => '0');
	signal headEDataList : slv_vector_type(nHeadE-1 downto 0)(31 downto 0) := (others => (others => '0'));

        -- FIXME: headCnt should use the largest of nHeadA, nHeadC, nHeadE, nHeadF
        constant nHeadLog  : integer               := integer(log2(real(nHeadF + 1)));
        signal   headCnt   : unsigned(nHeadLog-1 downto 0) := (others => '0');

        
        signal adcSamplesPerFreq : unsigned(39 downto 0) := (others => '0');
        
begin

        adcSamplesPerFreq <= internalDwaReg.adcSamplesPerCycle * internalDwaReg.cyclesPerFreq;

        -- FIXME: should the construction of the header data lists happen in a
        -- process??? so that the headers get updated regularly as e.g.
        -- counters evolve?
        
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
          x"40" & std_logic_vector(internalDwaReg.stimPeriodCounter),
          --FIXME: the following product can overflow...
          x"41" & std_logic_vector(adcSamplesPerFreq(23 downto 0)), 
          x"42" & std_logic_vector(internalDwaReg.stimPeriodActive),
          x"43" & std_logic_vector(internalDwaReg.adcSamplingPeriod),
          x"CCCCCCCC"
        ); 

        headEDataList <= ( -- Status frame
          x"EEEE" & std_logic_vector(to_unsigned(nHeadE-2, 16)),
          x"61" & x"0000" & x"55",
          x"EEEEEEEE"
          ); 

         -- Examples of ways to construct data lines
         --x"AB" & std_logic_vector(headAPktCnt),
         --tempA & std_logic_vector(fromDaqReg.freqMax),
         --"0100101" & '1' & std_logic_vector(fromDaqReg.freqStep(23 downto 4)) & "0100",
         --"01001101010000111110101010101010"

        --- Data generator state machine
        ctrlState_seq : process (dwaClk100)
        begin
            if rising_edge(dwaClk100) then
                -- set defaults

                case (ctrlState) is
                    
                    when idle_s =>

                        if internalDwaReg.sendRunHdr then
                            requestType <= x"F";
                            ctrlState <= genAFrame_s;

                        elsif internalDwaReg.sendAdcData then
                            requestType <= x"D";
                            ctrlState <= genAFrame_s;

                        elsif internalDwaReg.sendStatusHdr then
                            requestType <= x"E";
                            ctrlState <= genAFrame_s;

                        else
                            requestType <= x"0";
                            ctrlState <= idle_s; -- default
                        end if;

                    when genAFrame_s =>
                        -- clock out the A header
                        if dataAvail then 
                            if internalDwaReg.udpRen then
                                if headCnt > 0 then
                                    headCnt <= headCnt - 1;
                                    dataWord <= headADataList(to_integer(headCnt-1));
                                else
                                    dataAvail <= false; -- A header is finished
                                    -- choose next state
                                    case requestType is
                                        when x"D"   => ctrlState <= genCFrame_s;
                                        when x"F"   => ctrlState <= genFFrame_s;
                                        when x"E"   => ctrlState <= genEFrame_s;
                                        when others => ctrlState <= idle_s;
                                    end case;
                                end if;
                            end if;
                        else
                            dataAvail <= true;
                            headCnt   <= to_unsigned(nHeadA, headCnt'length);
                        end if;
                        
                    when genEFrame_s =>
                        -- clock out the E header
                        if dataAvail then 
                            if internalDwaReg.udpRen then
                                if headCnt > 0 then
                                    headCnt <= headCnt - 1;
                                    dataWord <= headEDataList(to_integer(headCnt-1));
                                else
                                    dataAvail <= false;  -- E header is finished
                                    ctrlState <= idle_s; -- return to idle
                                end if;
                            end if;
                        else
                            dataAvail <= true;
                            headCnt   <= to_unsigned(nHeadE, headCnt'length);
                        end if;

                    when genFFrame_s =>
                        -- clock out the F header
                        if dataAvail then 
                            if internalDwaReg.udpRen then
                                if headCnt > 0 then
                                    headCnt <= headCnt - 1;
                                    dataWord <= headFDataList(to_integer(headCnt-1));
                                else
                                    dataAvail <= false;  -- F header is finished
                                    ctrlState <= idle_s; -- return to idle
                                end if;
                            end if;
                        else
                            dataAvail <= true;
                            headCnt   <= to_unsigned(nHeadF, headCnt'length);
                        end if;
                       
                    when genCFrame_s =>
                        -- clock out the C header (frequency header)
                        if dataAvail then 
                            if internalDwaReg.udpRen then
                                if headCnt > 0 then
                                    headCnt <= headCnt - 1;
                                    dataWord <= headCDataList(to_integer(headCnt-1));
                                else
                                    dataAvail <= false;  -- F header is finished
                                    ctrlState <= genDFrame_s; -- ADC data is next
                                end if;
                            end if;
                        else
                            dataAvail <= true;
                            headCnt   <= to_unsigned(nHeadC, headCnt'length);
                        end if;

                    when genDFrame_s =>
                        -- send out the ADC data
                        -- FIXME: how to do this?

                        ctrlState <= idle_s; -- all done -- return to idle

                    when others =>
                        ctrlState <= idle_s;

                end case;
            end if;
        end process ctrlState_seq;

end architecture rtl;

