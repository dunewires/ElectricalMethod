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


-- FIXME:
-- * UDP counter should be done here (no other source of UDP data).  no
--   reliance on fromDaqReg anymore.
-- * register ID should also be tracked by this code block (not an input)
-- * adcSamplesPerFrequency  can overflow (it's the product of adcSamplesPerCycle
--   and cyclesPerFreq
-- * 

entity headerGenerator is
	port (
            ---------------------------
            -- records
            fromDaqReg      : in fromDaqRegType;
            toDaqReg        : out toDaqRegType;
            internalDwaReg  : in internalDwaRegType;

            ---------------------------
            -- this will come from PS
            -- total number of runs with this board (non-volatile)
            runOdometer        : in unsigned(23 downto 0);
            -- 24 LSb of the 64-bit FPGA serial number
            fpgaSerialNum      : in unsigned(23 downto 0);             

            -----------------------
            -- PL
            udpDataRen         : in boolean;
            sendRunHdr         : in boolean;
            sendAdcData        : in boolean;
            sendStatusHdr      : in boolean;
            
            firmwareId_date    : in unsigned(47 downto 0); -- Firmware identifier (date) YYMMDDHHMMSS (in hex)
            firmwareId_hash    : in unsigned(31 downto 0); -- Firmware identifier (git hash) use 32 bits
            stimPeriodActive   : in unsigned(23 downto 0); -- current period (10ns)
            stimPeriodCounter  : in unsigned(23 downto 0); -- track how many freqs
                                                        -- have been done in
                                                        -- this run.   FIXME: bits???
            adcSamplingPeriod  : in unsigned(23 downto 0);
            
            -- For ADC data access
            adcDataRdy   : in  std_logic_vector(7 downto 0);
            adcDataRen   : out std_logic_vector(7 downto 0);
            adcData      : in slv_vector_type(7 downto 0)(31 downto 0);

            udpRequestComplete : out boolean := false;
            --udpDataRdy         : out boolean := false;
            
            reset     : in boolean   := false;
            dwaClk100 : in std_logic := '0'
        );
        
end entity headerGenerator;

architecture rtl of headerGenerator is

        type ctrlState_type is (idle_s, udpPldEnd_s, genAFrame_s, genCFrame_s, genDFrame_s, genEFrame_s, genFFrame_s);
        signal ctrlState : ctrlState_type := idle_s;

        type requestType_type is (RQST_NULL, RQST_RUN, RQST_STATUS, RQST_ADC);
        signal requestType : requestType_type := RQST_NULL;

        constant REG_RUN     : std_logic_vector(7 downto 0) := x"FF";
        constant REG_STATUS  : std_logic_vector(7 downto 0) := x"FE";
        
        signal udpPktCnt : unsigned(15 downto 0) := (others => '0');
        
        -- 0x0 to 0x7 for ADC data.  0xFF for run header. 0xFE for status header
        signal registerId    : std_logic_vector(7 downto 0) := (others => '0');
        
        signal udpHdrRen     : boolean := false;
        signal adcIdx        : unsigned(2 downto 0);
        
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

        signal adcRegNum : unsigned(3 downto 0) := (others =>'0'); 
        signal adcSamplesPerFreq : unsigned(39 downto 0) := (others => '0');
        
begin

    --header data indexed list with 0 at bottom of list
    headADataList <= (
        x"AAAA" & std_logic_vector(to_unsigned(nHeadA-2, 16)), -- header delimiter (start)
        x"10" & x"00" & std_logic_vector(udpPktCnt),   -- UDP pkt counter
        -- LOCAL (handle masks if needed)
        x"11" & x"0000" & registerId, -- Register ID --
        x"AAAAAAAA" -- header delimiter (end)
    );

    headFDataList <= (
        x"FFFF" & std_logic_vector(to_unsigned(nHeadF-2, 16)), -- header delimiter (start)
        x"00" & std_logic_vector(runOdometer),
        x"01" & std_logic_vector(fpgaSerialNum),
        x"02" & std_logic_vector(firmwareId_date(47 downto 24)), --24MSb
        x"03" & std_logic_vector(firmwareId_date(23 downto  0)),  --24LSb
        x"04" & x"00" & std_logic_vector(firmwareId_hash(31 downto 16)), --16MSb
        x"05" & x"00" & std_logic_vector(firmwareId_hash(15 downto  0)),  --16LSb
        x"20" & std_logic_vector(fromDaqReg.dwaCtrl),
        x"21" & std_logic_vector(fromDaqReg.fixedPeriod), 
        x"22" & std_logic_vector(fromDaqReg.stimPeriodMin),  -- fixme: is this really period?
        x"23" & std_logic_vector(fromDaqReg.stimPeriodMax),
        x"24" & std_logic_vector(fromDaqReg.stimPeriodStep),
        x"25" & x"00" & std_logic_vector(fromDaqReg.adcAutoDc_chSel),
        x"26" & std_logic_vector(fromDaqReg.cyclesPerFreq),
        x"27" & x"00" & std_logic_vector(fromDaqReg.adcSamplesPerCycle),
        x"28" & x"000" & std_logic_vector(fromDaqReg.acStim_mag), 
        -- 29 not used?
        x"2A" & x"00" & std_logic_vector(fromDaqReg.clientIp(31 downto 16)), --16MSb
        x"2B" & x"00" & std_logic_vector(fromDaqReg.clientIp(15 downto  0)), --16LSb
        x"2C" & std_logic_vector(fromDaqReg.ctrl_stimTime),
        x"2D" & x"0000" & fromDaqReg.activeChannels,
        x"2E" & x"00" & fromDaqReg.relayMask(31 downto 16), 
        x"2F" & x"00" & fromDaqReg.relayMask(15 downto  0),
        --# relay mask in v3 has 192 bits (64+32)*2 (8 lines of 24 bits) !!!
        x"FFFFFFFF" -- header delimiter (end)
    );    
    
    headCDataList <= ( -- Frequency Data Frame
        x"CCCC" & std_logic_vector(to_unsigned(nHeadC-2, 16)),
        -- LOCAL
        x"11" & x"0000" & registerId, -- Register ID (same as in "A" frame)
        x"40" & std_logic_vector(stimPeriodCounter),
        --FIXME: the following product can overflow...
        x"41" & std_logic_vector(adcSamplesPerFreq(23 downto 0)), 
        x"42" & std_logic_vector(stimPeriodActive),
        x"43" & std_logic_vector(adcSamplingPeriod),
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


    -- combinatorial logic of other signals
    adcSamplesPerFreq <= fromDaqReg.adcSamplesPerCycle * fromDaqReg.cyclesPerFreq;

    -- handle the udpDataRen signal from PS since it must be use dfor ADC dta
    -- and header data
    --udpHdrRen <= false when (requestType = RQST_ADC)  else udpDataRen;
    --adcDataRen 
    udpHdrRen <= udpDataRen;
    
    --- Data generator state machine
    ctrlState_seq : process (dwaClk100)
        variable udpCnt : natural range 0 to 1023;
    begin
        if rising_edge(dwaClk100) then
            -- set defaults

            case (ctrlState) is
                    
                when idle_s =>
                    if sendRunHdr then
                        ctrlState   <= genAFrame_s;
                        requestType <= RQST_RUN;
                        registerId  <= REG_RUN;
                            
                    elsif sendAdcData then
                        ctrlState   <= genAFrame_s;
                        requestType <= RQST_ADC;
                        registerId  <= x"07";
                        
                    elsif sendStatusHdr then
                        ctrlState   <= genAFrame_s;
                        requestType <= RQST_STATUS;
                        registerId  <= REG_STATUS;

                    else
                        -- FIXME: RAISE EXCEPTION...
                        -- should never get here...
                        ctrlState <= idle_s; -- default
                    end if;

                when genAFrame_s =>
                    -- clock out the A header
                    if toDaqReg.udpDataRdy then 
                        if udpHdrRen then
                            if headCnt > 0 then
                                headCnt <= headCnt - 1;
                                toDaqReg.udpDataWord <= headADataList(to_integer(headCnt-1));
                            else
                                --- A header is done...
                                -- choose next state
                                case requestType is
                                    when RQST_ADC =>
                                        ctrlState <= genCFrame_s;
                                        headCnt <= to_unsigned(nHeadC, headCnt'length);

                                    when RQST_RUN =>
                                        ctrlState <= genFFrame_s;
                                        headCnt <= to_unsigned(nHeadF, headCnt'length);

                                    when RQST_STATUS =>
                                        ctrlState <= genEFrame_s;
                                        headCnt <= to_unsigned(nHeadE, headCnt'length);

                                    when others =>
                                        -- should never reach here...
                                        ctrlState <= idle_s;
                                end case;

                            end if;
                        end if;
                    else
                        toDaqReg.udpDataRdy <= true; -- indiates udp payload line available
                        headCnt   <= to_unsigned(nHeadA, headCnt'length);
                    end if;
                    
                when genEFrame_s =>
                    -- clock out the E header
                    if udpHdrRen then
                        if headCnt > 0 then
                            headCnt <= headCnt - 1;
                            toDaqReg.udpDataWord <= headEDataList(to_integer(headCnt-1));
                        else
                            ctrlState <= udpPldEnd_s; -- next, close out the payload
                        end if;
                    end if;

                when genFFrame_s =>
                    -- clock out the F header
                    if udpHdrRen then
                        if headCnt > 0 then
                            headCnt <= headCnt - 1;
                            toDaqReg.udpDataWord <= headFDataList(to_integer(headCnt-1));
                        else
                            ctrlState <= udpPldEnd_s; -- wrap up payload
                        end if;
                    end if;

                when genCFrame_s =>
                    -- clock out the C header (frequency header)
                    if udpHdrRen then
                        if headCnt > 0 then
                            headCnt <= headCnt - 1;
                            toDaqReg.udpDataWord <= headCDataList(to_integer(headCnt-1));
                        else
                            -- C header is finished
                            ctrlState <= genDFrame_s; -- ADC data is next
                        -- can't know the number of ADC data lines...
                        -- FIXME: kluge for now!
                        --headCnt   <= to_unsigned(nHeadD, headCnt'length);
                        end if;
                    end if;

                when genDFrame_s =>
                    -- send out the ADC data
                    -- FIXME: how to do this?
                    -- loop over all 8 channels (0-7)
                    -- toDaqReg.chanIndex <= (udpDataWordT)

                    -- do the following when done sending data
                    ctrlState <= udpPldEnd_s; -- all done -- return to idle

                when udpPldEnd_s =>
                    toDaqReg.udpDataRdy <= false;  -- UDP payload all done
                    udpCnt := udpCnt + 1; -- increment UDP counter
                    ctrlState <= idle_s;  -- head to idle
                    
                when others =>
                    -- should never get here...
                    ctrlState <= idle_s;

            end case;
        end if;
        udpPktCnt <= to_unsigned(udpCnt, udpPktCnt'length);
    end process ctrlState_seq;

end architecture rtl;

