--------------------------------------------------------------------------------
-- Title       : DWA Header Generator
-- Project     : DUNE DWA
--------------------------------------------------------------------------------
-- File        : headerGenerator.vhd
-- Author      : James Battat jbattat@wellesley.edu
-- Company     : Wellesley College, Physics
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Thu Jul  2 01:02:52 2020
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

entity headerGenerator is
	port (
            ---------------------------
            -- records
            fromDaqReg      : in fromDaqRegType;
            toDaqReg        : out toDaqRegType;

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
            adcDataRen   : out std_logic_vector(7 downto 0) := (others => '0');
            adcData      : in slv_vector_type(7 downto 0)(31 downto 0);

            reset     : in boolean;  --   := false;
            dwaClk100 : in std_logic -- := '0'
        );
        
end entity headerGenerator;

architecture rtl of headerGenerator is

        type state_type is (idle_s, udpPldEnd_s, genAFrame_s, genCFrame_s, genDFrame_s, genEFrame_s, genFFrame_s);
        signal state_reg  : state_type := idle_s;
        signal state_next : state_type := idle_s;

        type rqstType_type is (RQST_NULL, RQST_RUN, RQST_STATUS, RQST_ADC);
        signal rqstType  : rqstType_type := RQST_NULL;

        constant REG_RUN     : std_logic_vector(7 downto 0) := x"FF";
        constant REG_STATUS  : std_logic_vector(7 downto 0) := x"FE";
        
        -- 0x0 to 0x7 for ADC data.  0xFF for run header. 0xFE for status header
        signal registerId    : std_logic_vector(7 downto 0) := (others => '0');
        
        signal udpHdrRen     : boolean := false;
        signal adcIdx        : integer := 7;
        
        ----------------- below this line is old -- do not use
	constant nHeadA      : integer  := 4; -- # of header words (incl. 2 delimiters)
	constant nHeadALog   : integer  := integer(log2(real(nHeadA +1)));
	signal headADataList : slv_vector_type(nHeadA-1 downto 0)(31 downto 0) := (others => (others => '0'));

        ----------------------------
	---- Setup for Header F
	constant nHeadF      : integer  := 21; -- # of header words (incl. 2 delimiters)
	constant nHeadFLog   : integer  := integer(log2(real(nHeadF +1)));
	signal headFDataList : slv_vector_type(nHeadF-1 downto 0)(31 downto 0) := (others => (others => '0'));

        ----------------------------
	---- Setup for Header C
	constant nHeadC      : integer  := 7; -- # of header words (incl. 2 delimiters)
	constant nHeadCLog   : integer  := integer(log2(real(nHeadC +1)));
	signal headCDataList : slv_vector_type(nHeadC-1 downto 0)(31 downto 0) := (others => (others => '0'));

        ----------------------------
	---- Setup for Header E
	constant nHeadE      : integer  := 3; -- # of header words (incl. 2 delimiters)
	constant nHeadElog   : integer  := integer(log2(real(nHeadE +1)));
	signal headEDataList : slv_vector_type(nHeadE-1 downto 0)(31 downto 0) := (others => (others => '0'));

        -- FIXME: headCnt_reg and _next should use the largest of nHeadA, nHeadC, nHeadE, nHeadF
        constant nHeadLog  : integer               := integer(log2(real(nHeadF + 1)));
        -- FIXME: this doesn't work right ...
        -- let nHeadF = 21.  Then int(log2(22)) = int(4.46) = 4.  But we need 5
        -- bits to encode the number 21... (10101)
        signal   headCnt_reg  : unsigned(nHeadLog downto 0) := (others => '0');
        signal   headCnt_next : unsigned(nHeadLog downto 0) := (others => '0');

        signal   udpDataRdy_reg  : boolean := false;
        signal   udpDataRdy_next : boolean := false;

        signal   adcRegNum         : unsigned(3 downto 0) := (others =>'0'); 
        signal   adcSamplesPerFreq : unsigned(39 downto 0) := (others => '0');
                  
        signal   udpCnt_reg   : unsigned(15 downto 0) := (others => '0');
        signal   udpCnt_next  : unsigned(15 downto 0) := (others => '0');
        signal   udpPktCnt    : unsigned(15 downto 0) := (others => '0');
        
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
        --x"20" & std_logic_vector(fromDaqReg.dwaCtrl),
        x"21" & std_logic_vector(fromDaqReg.fixedPeriod), 
        -- fixme: should be period...
        x"22" & std_logic_vector(fromDaqReg.stimFreqMin),  
        x"23" & std_logic_vector(fromDaqReg.stimFreqMax),
        x"24" & std_logic_vector(fromDaqReg.stimFreqStep),
        --x"25" & x"00" & std_logic_vector(fromDaqReg.adcAutoDc_chSel),
        x"26" & std_logic_vector(fromDaqReg.cyclesPerFreq),
        x"27" & x"00" & std_logic_vector(fromDaqReg.adcSamplesPerCycle),
        x"28" & x"000" & std_logic_vector(fromDaqReg.acStim_mag), 
        -- 29 not used?
        x"2A" & x"00" & std_logic_vector(fromDaqReg.clientIp(31 downto 16)), --16MSb
        x"2B" & x"00" & std_logic_vector(fromDaqReg.clientIp(15 downto  0)), --16LSb
        x"2C" & std_logic_vector(fromDaqReg.stimTime),
        x"2D" & x"0000" & fromDaqReg.activeChannels,
        x"2E" & x"00" & fromDaqReg.relayMask(31 downto 16), 
        x"2F" & x"00" & fromDaqReg.relayMask(15 downto  0),
        --# relay mask. v3 has 192 bits (64+32)*2 (8 lines of 24 bits) !!!
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

    -- the PS udpDataRen signal is used for ADC and header data
    udpHdrRen     <= false when (state_reg = genDFrame_s) else udpDataRen;
    -- for loop (inside a combinatorial process) or generate (outside of process)
    adcDataRen(0) <= BOOL2SL(udpDataRen) when ( (adcIdx = 0) and (state_reg = genDFrame_s) ) else '0';
    adcDataRen(1) <= BOOL2SL(udpDataRen) when ( (adcIdx = 1) and (state_reg = genDFrame_s) ) else '0';
    adcDataRen(2) <= BOOL2SL(udpDataRen) when ( (adcIdx = 2) and (state_reg = genDFrame_s) ) else '0';
    adcDataRen(3) <= BOOL2SL(udpDataRen) when ( (adcIdx = 3) and (state_reg = genDFrame_s) ) else '0';
    adcDataRen(4) <= BOOL2SL(udpDataRen) when ( (adcIdx = 4) and (state_reg = genDFrame_s) ) else '0';
    adcDataRen(5) <= BOOL2SL(udpDataRen) when ( (adcIdx = 5) and (state_reg = genDFrame_s) ) else '0';
    adcDataRen(6) <= BOOL2SL(udpDataRen) when ( (adcIdx = 6) and (state_reg = genDFrame_s) ) else '0';
    adcDataRen(7) <= BOOL2SL(udpDataRen) when ( (adcIdx = 7) and (state_reg = genDFrame_s) ) else '0';

    -- MUX header and ADC data onto the output data word
    toDaqReg.udpDataWord <= headADataList(to_integer(headCnt_reg)) when state_reg = genAFrame_s else
                            headCDataList(to_integer(headCnt_reg)) when state_reg = genCFrame_s else
                            headEDataList(to_integer(headCnt_reg)) when state_reg = genEFrame_s else
                            headFDataList(to_integer(headCnt_reg)) when state_reg = genFFrame_s else
                            x"00000000";  -- FIXME: do we need an else???
--        type state_type is (idle_s, udpPldEnd_s, genAFrame_s, genCFrame_s, genDFrame_s, genEFrame_s, genFFrame_s);

    registerId <=  REG_RUN     when rqstType = RQST_RUN else
                   REG_STATUS  when rqstType = RQST_STATUS else       
                   std_logic_vector(to_unsigned(adcIdx, registerId'length)) when rqstType = RQST_ADC else
               x"00"; -- FIXME: what should default be???

                   
    toDaqReg.udpDataRdy <= udpDataRdy_reg;
    udpPktCnt <= udpCnt_reg;

    -- state machine
    state_seq : process (dwaClk100, reset)
    begin
        if reset then
            -- handle the reset signal
            -- FIXME: what else goes here?
            --udpDataRdy_next <= false;
        elsif rising_edge(dwaClk100) then
            state_reg       <= state_next;
            headCnt_reg     <= headCnt_next;
            udpDataRdy_reg  <= udpDataRdy_next;
            udpCnt_reg      <= udpCnt_next;
        end if;
    end process state_seq;
    
    --- next-state logic and header/ADC indexing
    process (state_reg, sendRunHdr, sendAdcData, sendStatusHdr, dwaClk100)
    begin
        -- set defaults
        state_next      <= state_reg;
        udpDataRdy_next <= udpDataRdy_reg;

        case (state_reg) is
            
            when idle_s =>
                udpDataRdy_next <= false;
                if sendRunHdr then
                    udpDataRdy_next <= true;
                    state_next      <= genAFrame_s;
                    headCnt_next   <= to_unsigned(nHeadA-1, headCnt_next'length); 
                    rqstType        <= RQST_RUN;
                    --registerId      <= REG_RUN;

                elsif sendAdcData then
                    udpDataRdy_next <= true;
                    state_next      <= genAFrame_s;
                    headCnt_next    <= to_unsigned(nHeadA-1, headCnt_next'length);
                    rqstType        <= RQST_ADC;
                    --registerId      <= std_logic_vector(to_unsigned(adcIdx, registerId'length));
                    
                elsif sendStatusHdr then
                    udpDataRdy_next <= true;
                    state_next      <= genAFrame_s;
                    headCnt_next    <= to_unsigned(nHeadA-1, headCnt_next'length);
                    rqstType        <= RQST_STATUS;
                    --registerId      <= REG_STATUS;

                else
                    -- FIXME: RAISE EXCEPTION? (should never get here...)
                    state_next <= idle_s;
                end if;

            when genAFrame_s =>
                -- clock out the A header
                if udpHdrRen then
                    if headCnt_reg > 0 then
                        headCnt_next <= headCnt_reg - 1;
                    else
                        -- "A" header is done...
                        -- choose next state
                        case rqstType is
                            when RQST_ADC =>
                                state_next   <= genCFrame_s;
                                headCnt_next <= to_unsigned(nHeadC-1, headCnt_next'length);
                                
                            when RQST_RUN =>
                                state_next   <= genFFrame_s;
                                headCnt_next <= to_unsigned(nHeadF-1, headCnt_next'length);
                                
                            when RQST_STATUS =>
                                state_next   <= genEFrame_s;
                                headCnt_next <= to_unsigned(nHeadE-1, headCnt_next'length);
                                
                            when others =>
                                state_next <= idle_s;
                        end case;
                    end if;
                end if;

            when genEFrame_s =>
                -- clock out the E header
                if udpHdrRen then
                    if headCnt_reg > 0 then
                        headCnt_next <= headCnt_reg - 1;
                    else
                        state_next      <= udpPldEnd_s; -- next, close out the payload
                        udpDataRdy_next <= false;       -- UDP payload all done
                    end if;
                end if;

            when genFFrame_s =>
                -- clock out the F header
                if udpHdrRen then
                    if headCnt_reg > 0 then
                        headCnt_next <= headCnt_reg -1;
                    else
                        state_next      <= udpPldEnd_s; -- wrap up payload
                        udpDataRdy_next <= false;       -- UDP payload all done
                    end if;
                end if;

            when genCFrame_s =>
                -- clock out the C header (frequency header)
                if udpHdrRen then
                    if headCnt_reg > 0 then
                        headCnt_next <= headCnt_reg - 1;
                    else
                        -- C header is finished
                        state_next <= genDFrame_s; -- ADC data is next
                    -- could compute number of ADC data lines from nCycles and
                    -- samples per cycle (and 2 samples per line)
                    -- plus 2 delimiter lines
                    -- but since we are not indexing into a data list, maybe there
                    -- is no need to set headCnt_next here...
                    -- FIXME: set correct number of lines
                    --headCnt_next <= to_unsigned(20-1, headCnt_next'length);
                    end if;
                end if;

            when genDFrame_s =>
                -- send out the ADC data for a single ADC channel
                -- toDaqReg.chanIndex <= (udpDataWord)
                adcDataRen         <= (others => '0');
                adcDataRen(adcIdx) <= '1';
                --if adcDataRdy(adcIdx) then
                --    toDaqReg.udpDataWord <= adcData(adcIdx)(31 downto 0);
                --else -- no more data to get
                --    state_next <= udpPldEnd_s; -- all done with this ADC channel
                --end if;

            when udpPldEnd_s =>
                -- if request type is ADC data and adcIdx is still > 0
                -- then do the next adc
                if fromDaqReg.udpDataDone then -- confirm that PS received payload
                    udpCnt_next <= udpCnt_reg + 1; -- increment UDP counter
                    if (rqstType = RQST_ADC) and (adcIdx > 0) then
                        adcIdx     <= adcIdx - 1;
                        state_next <= genAFrame_s;
                    else
                        adcIdx     <= 7;      -- reset adcIdx
                        rqstType   <= RQST_NULL;
                        state_next <= idle_s; -- return to idle
                    end if;
                end if;

            when others =>
                -- should never get here...
                state_next <= idle_s;

        end case;
    end process;

end architecture rtl;
