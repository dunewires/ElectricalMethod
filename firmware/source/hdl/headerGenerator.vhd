--------------------------------------------------------------------------------
-- Title       : DWA Header Generator
-- Project     : DUNE DWA
--------------------------------------------------------------------------------
-- File        : headerGenerator.vhd
-- Author      : James Battat jbattat@wellesley.edu
-- Company     : Wellesley College, Physics
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Thu Oct  7 17:40:17 2021
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
-- * adcSamplesPerFrequency  can overflow (it's the product of adcSamplesPerCycle
--   and cyclesPerFreq
-- * currently the "DDDD" delimiter is a kluge as it is put in as part of the C
--   header... Should happen instead in the genDFrame_s state

entity headerGenerator is
    port (
        ---------------------------
        -- records
        fromDaqReg : in  fromDaqRegType;
        toDaqReg   : out toDaqRegType;

        pButton : in std_logic_vector(3 downto 0);

        ---------------------------
        -- this will come from PS
        -- total number of runs with this board (non-volatile)
        runOdometer : in unsigned(23 downto 0);
        -- 24 LSb of the 64-bit FPGA serial number
        --fpgaSerialNum      : in unsigned(23 downto 0);             

        -----------------------
        -- PL
        --udpDataRen         : in boolean;
        sendRunHdr  : in boolean;
        sendAdcData : in boolean;

        pktBuildBusy : out boolean;
        freqScanBusy : in  boolean;

        stimPeriodActive  : in unsigned(30 downto 0); -- current period (10ns)
        stimPeriodCounter : in unsigned(23 downto 0); -- track how many freqs
                                                      -- have been done in
                                                      -- this run.   FIXME: bits???
        adcSamplingPeriod : in unsigned(23 downto 0);

        -- For ADC data access
        adcDataRdy : in  std_logic_vector(7 downto 0);
        adcDataRen : out std_logic_vector(7 downto 0) := (others => '0');
        adcData    : in  slv_vector_type(7 downto 0)(31 downto 0);

        dwaClk100 : in std_logic -- := '0'
    );

end entity headerGenerator;

architecture rtl of headerGenerator is

    type state_type is (idle_s, udpPldEnd_s, genAFrame_s, genCFrame_s, genDFrame_s, genEFrame_s, genFFrame_s);
    signal state_reg  : state_type := idle_s;
    signal state_next : state_type := idle_s;

    type rqstType_type is (RQST_NULL, RQST_RUN, RQST_STATUS, RQST_ADC);
    signal rqstType, rqstType_next : rqstType_type := RQST_NULL;

    constant REG_RUN    : std_logic_vector(7 downto 0) := x"FF";
    constant REG_STATUS : std_logic_vector(7 downto 0) := x"FE";

    -- 0x0 to 0x7 for ADC data.  0xFF for run header. 0xFE for status header
    signal registerId : std_logic_vector(7 downto 0) := (others => '0');

    --signal udpHdrRen     : boolean := false;
    signal adcIdx      : integer := 7;
    signal adcIdx_next : integer := 7;

    ----------------- below this line is old -- do not use
    constant nHeadA      : integer                                         := 4; -- # of header words (incl. 2 delimiters)
    constant nHeadALog   : integer                                         := integer(log2(real(nHeadA +1)));
    signal headADataList : slv_vector_type(nHeadA-1 downto 0)(31 downto 0) := (others => (others => '0'));

    ----------------------------
    ---- Setup for Header F
    constant nHeadF      : integer                                         := 44; -- # of header words (incl. 2 delimiters)
    constant nHeadFLog   : integer                                         := integer(log2(real(nHeadF +1)));
    signal headFDataList : slv_vector_type(nHeadF-1 downto 0)(31 downto 0) := (others => (others => '0'));

    ----------------------------
    ---- Setup for Header C
    constant nHeadC      : integer                                         := 9; -- # of header words (incl. 2 delimiters)
    constant nHeadCLog   : integer                                         := integer(log2(real(nHeadC +1)));
    signal headCDataList : slv_vector_type(nHeadC-1 downto 0)(31 downto 0) := (others => (others => '0'));

    ----------------------------
    ---- Setup for Header E
    constant nHeadE      : integer                                         := 6; -- # of header words (incl. 2 delimiters)
    constant nHeadElog   : integer                                         := integer(log2(real(nHeadE +1)));
    signal headEDataList : slv_vector_type(nHeadE-1 downto 0)(31 downto 0) := (others => (others => '0'));

    -- FIXME: headCnt_reg and _next should use the largest of nHeadA, nHeadC, nHeadE, nHeadF
    constant nHeadLog : integer := integer(ceil(log2(real(nHeadF))));
    -- bits to encode the number 21... (10101)
    signal headCnt_reg  : unsigned(nHeadLog downto 0) := (others => '0');
    signal headCnt_next : unsigned(nHeadLog downto 0) := (others => '0');

    signal udpDataRdy_reg  : boolean := false;
    signal udpDataRdy_next : boolean := false;

    signal watchdogReset    : boolean               := false;
    signal watchdogSleep    : boolean               := false;
    signal watchdogTimerCnt : unsigned(31 downto 0) := (others => '0');

    type statusData_type is record
        errors   : std_logic_vector(23 downto 0);
        pButton  : std_logic_vector(3 downto 0);
        ctrlBusy : boolean;
    end record;

    signal statusDataSticky,statusDataLatch : statusData_type := (
            errors   => (others => '0'),
            pButton   => (others => '0'),
            ctrlBusy => false);
    signal sendStatus                                       : boolean               := false;
    signal statusBusy, statusBusy_del                       : boolean               := false;
    signal statusDataTrig,statusTimeout, statusTimeoutLatch : boolean               := false;
    signal statusTimerCnt                                   : unsigned(31 downto 0) := (others => '0');

    signal adcRegNum         : unsigned(3 downto 0)  := (others => '0');
    signal adcSamplesPerFreq : unsigned(39 downto 0) := (others => '0');

    signal udpCnt_reg  : unsigned(15 downto 0) := (others => '0');
    signal udpCnt_next : unsigned(15 downto 0) := (others => '0');
    signal udpPktCnt   : unsigned(15 downto 0) := (others => '0');

    signal stimPeriodActive_reg  : unsigned(30 downto 0) := (others => '0');
    signal adcSamplingPeriod_reg : unsigned(23 downto 0) := (others => '0');

begin

    dataLatch : process (dwaClk100) -- latch the packet data validated by the sendData strobe
    begin
        if rising_edge(dwaClk100) then
            if sendAdcData then
                stimPeriodActive_reg  <= stimPeriodActive;
                adcSamplingPeriod_reg <= adcSamplingPeriod;
            end if;

        end if;
    end process;

    --header data indexed list with 0 at bottom of list
    -- UDP Header
    headADataList <= (
            x"AAAA" & std_logic_vector(to_unsigned(nHeadA-2, 16)), -- header delimiter (start)
            x"10" & x"00" & std_logic_vector(udpPktCnt),           -- UDP pkt counter
            x"11" & x"0000" & registerId,                          -- Register ID --
            x"AAAAAAAA"                                            -- header delimiter (end)
    );

    --RUN Header
    headFDataList <= (
            x"FFFF" & std_logic_vector(to_unsigned(nHeadF-2, 16)), -- header delimiter (start)
            x"77" & x"00000" & "000" & BOOL2SL(freqScanBusy),
            x"00" & std_logic_vector(runOdometer),
            x"01" & std_logic_vector(fromDaqReg.serNum),
            x"02" & std_logic_vector(fromDaqReg.dateCode(47 downto 24)),         --24MSb
            x"03" & std_logic_vector(fromDaqReg.dateCode(23 downto 0)),          --24LSb
            x"04" & x"00" & std_logic_vector(fromDaqReg.hashCode(31 downto 16)), --16MSb
            x"05" & x"00" & std_logic_vector(fromDaqReg.hashCode(15 downto 0)),  --16LSb
                                                                                 --x"20" & std_logic_vector(fromDaqReg.dwaCtrl),
            x"21" & std_logic_vector(fromDaqReg.fixedPeriod),
            -- fixme: should be period...
            x"22" & std_logic_vector(fromDaqReg.stimFreqMin),
            x"23" & std_logic_vector(fromDaqReg.stimFreqMax),
            x"24" & std_logic_vector(fromDaqReg.stimFreqStep),
            --x"25" & x"00" & std_logic_vector(fromDaqReg.adcAutoDc_chSel),
            x"26" & std_logic_vector(fromDaqReg.cyclesPerFreq),
            x"27" & x"00" & std_logic_vector(fromDaqReg.adcSamplesPerCycle),
            x"28" & x"000" & std_logic_vector(fromDaqReg.stimMag),
            -- 29 not used?
            x"2A" & x"00" & std_logic_vector(fromDaqReg.clientIp(31 downto 16)), --16MSb
            x"2B" & x"00" & std_logic_vector(fromDaqReg.clientIp(15 downto 0)),  --16LSb
            x"2C" & std_logic_vector(fromDaqReg.stimTime),
            x"2D" & x"0000" & fromDaqReg.activeChannels,
            x"2E" & x"00" & fromDaqReg.relayMask(31 downto 16),
            x"2F" & x"00" & fromDaqReg.relayMask(15 downto 0),
            x"30" & x"00" & fromDaqReg.senseWireGain(0) & fromDaqReg.senseWireGain(1),
            x"31" & x"00" & fromDaqReg.senseWireGain(2) & fromDaqReg.senseWireGain(3),
            x"32" & x"00" & fromDaqReg.senseWireGain(4) & fromDaqReg.senseWireGain(5),
            x"33" & x"00" & fromDaqReg.senseWireGain(6) & fromDaqReg.senseWireGain(7),
            x"34" & std_logic_vector(fromDaqReg.noiseFreqMin),
            x"35" & std_logic_vector(fromDaqReg.noiseFreqMax),
            x"36" & std_logic_vector(fromDaqReg.noiseFreqStep),
            x"37" & std_logic_vector(fromDaqReg.noiseSampPer),
            x"38" & std_logic_vector(fromDaqReg.noiseNCnv),
            x"39" & std_logic_vector(fromDaqReg.noiseBPFSetTime),
            --# v3 relays: 192 bits (64+32)*2 (12 lines of 16bits)
            x"40" & x"00" & fromDaqReg.relayBusTop(0),
            x"41" & x"00" & fromDaqReg.relayBusTop(1),
            x"42" & x"00" & fromDaqReg.relayBusBot(0),
            x"43" & x"00" & fromDaqReg.relayBusBot(1),
            x"44" & x"00" & fromDaqReg.relayWireTop(0),
            x"45" & x"00" & fromDaqReg.relayWireTop(1),
            x"46" & x"00" & fromDaqReg.relayWireTop(2),
            x"47" & x"00" & fromDaqReg.relayWireTop(3),
            x"48" & x"00" & fromDaqReg.relayWireBot(0),
            x"49" & x"00" & fromDaqReg.relayWireBot(1),
            x"4A" & x"00" & fromDaqReg.relayWireBot(2),
            x"4B" & x"00" & fromDaqReg.relayWireBot(3),
            x"FFFFFFFF" -- header delimiter (end)
    );

    headCDataList <= ( -- Frequency Data Frame
            x"CCCC" & std_logic_vector(to_unsigned(nHeadC-3, 16)),
            x"11" & x"0000" & registerId, -- Register ID (same as in "A" frame)
            x"40" & std_logic_vector(stimPeriodCounter),
            --FIXME: the following product can overflow...
            x"41" & std_logic_vector(adcSamplesPerFreq(23 downto 0)),
            x"43" & std_logic_vector(adcSamplingPeriod_reg),
            x"52" & x"00" & "0" & std_logic_vector(stimPeriodActive_reg(30 downto 16)),
            x"53" & x"00" & std_logic_vector(stimPeriodActive_reg(15 downto 0)),
            x"CCCCCCCC",
            x"DDDD" & x"5151" -- FIXME: this shoould be in the genDFrame_s...
    );

    --STATUS Header
    headEDataList <= ( -- Status frame
            x"EEEE" & std_logic_vector(to_unsigned(nHeadE-2, 16)),
            x"61" & x"00000" & "000" & BOOL2SL(statusTimeoutLatch),
            x"62" & x"00000" & std_logic_vector(fromDaqReg.ctrlStateDbg),
            x"63" & statusDataSticky.errors,
            x"64" & x"00000" & statusDataSticky.pButton,
            x"EEEEEEEE"
    );

    -- combinatorial logic of other signals
    adcSamplesPerFreq <= fromDaqReg.adcSamplesPerCycle * fromDaqReg.cyclesPerFreq;

    registerId <= REG_RUN when rqstType = RQST_RUN else
        REG_STATUS                                               when rqstType = RQST_STATUS else
        std_logic_vector(to_unsigned(adcIdx, registerId'length)) when rqstType = RQST_ADC else
        x"00"; -- FIXME: what should default be???

    toDaqReg.udpDataRdy <= udpDataRdy_reg;
    udpPktCnt           <= udpCnt_reg;

    -- state machine
    state_seq : process (dwaClk100)
    begin
        if rising_edge(dwaClk100) then
            if fromDaqReg.reset or watchdogReset then
                state_reg <= idle_s;
                --headCnt_reg    <= (others   =>  '0');
                udpDataRdy_reg <= false;
                udpCnt_reg     <= (others => '0');
                adcIdx         <= 7;
                rqstType       <= RQST_NULL;

            else
                state_reg      <= state_next;
                headCnt_reg    <= headCnt_next;
                udpDataRdy_reg <= udpDataRdy_next;
                udpCnt_reg     <= udpCnt_next;
                adcIdx         <= adcIdx_next;
                rqstType       <= rqstType_next;
                pktBuildBusy   <= state_reg /= idle_s;

            end if;
        end if;
    end process state_seq;

    --- next-state logic and header/ADC indexing
    --process (state_reg, sendRunHdr, sendAdcData, sendStatusHdr, dwaClk100)
    process (all)
    begin
        -- set defaults
        state_next      <= state_reg;
        udpDataRdy_next <= udpDataRdy_reg;
        rqstType_next   <= rqstType;
        headCnt_next    <= headCnt_reg;
        udpCnt_next     <= udpCnt_reg;
        adcIdx_next     <= adcIdx;
        adcDataRen      <= (others => '0');
        statusBusy      <= false;
        watchdogSleep   <= false;
        case (state_reg) is

            when idle_s =>
                watchdogSleep   <= true;
                udpDataRdy_next <= false;
                if sendRunHdr then
                    udpDataRdy_next <= true;
                    state_next      <= genAFrame_s;
                    headCnt_next    <= to_unsigned(nHeadA-1, headCnt_next'length);
                    rqstType_next   <= RQST_RUN;
                    --registerId      <= REG_RUN;

                elsif sendAdcData then
                    udpDataRdy_next <= true;
                    state_next      <= genAFrame_s;
                    headCnt_next    <= to_unsigned(nHeadA-1, headCnt_next'length);
                    rqstType_next   <= RQST_ADC;
                    --registerId      <= std_logic_vector(to_unsigned(adcIdx, registerId'length));

                elsif sendStatus then
                    udpDataRdy_next <= true;
                    state_next      <= genAFrame_s;
                    headCnt_next    <= to_unsigned(nHeadA-1, headCnt_next'length);
                    rqstType_next   <= RQST_STATUS;
                    --registerId      <= REG_STATUS;

                else
                    -- FIXME: RAISE EXCEPTION? (should never get here...)
                    state_next <= idle_s;
                end if;

            when genAFrame_s =>
                -- clock out the A header
                toDaqReg.udpDataWord <= headADataList(to_integer(headCnt_reg));

                if fromDaqReg.udpDataRen then
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
                toDaqReg.udpDataWord <= headEDataList(to_integer(headCnt_reg));
                statusBusy           <= true;
                if fromDaqReg.udpDataRen then
                    if headCnt_reg > 0 then
                        headCnt_next <= headCnt_reg - 1;
                    else
                        state_next      <= udpPldEnd_s; -- next, close out the payload
                        udpDataRdy_next <= false;       -- UDP payload all done
                    end if;
                end if;

            when genFFrame_s =>
                -- clock out the F header
                toDaqReg.udpDataWord <= headFDataList(to_integer(headCnt_reg));
                if fromDaqReg.udpDataRen then
                    if headCnt_reg > 0 then
                        headCnt_next <= headCnt_reg -1;
                    else
                        state_next      <= udpPldEnd_s; -- wrap up payload
                        udpDataRdy_next <= false;       -- UDP payload all done
                    end if;
                end if;

            when genCFrame_s =>
                -- clock out the C header (frequency header)
                toDaqReg.udpDataWord <= headCDataList(to_integer(headCnt_reg));

                if fromDaqReg.udpDataRen then
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
                if adcDataRdy(adcIdx) = '1' then
                    --dmux read enable
                    adcDataRen(adcIdx) <= BOOL2SL(fromDaqReg.udpDataRen);
                    -- mux adcIdx channels to udpDataWord
                    toDaqReg.udpDataWord <= adcData(adcIdx);
                else
                    toDaqReg.udpDataWord <= x"DDDDDDDD";
                    if fromDaqReg.udpDataRen then
                        state_next      <= udpPldEnd_s;
                        udpDataRdy_next <= false;
                    end if;
                end if;

            when udpPldEnd_s =>
                -- if request type is ADC data and adcIdx is still > 0
                -- then do the next adc

                if fromDaqReg.udpDataDone then     -- confirm that PS received payload
                    udpCnt_next <= udpCnt_reg + 1; -- increment UDP counter
                    if (rqstType = RQST_ADC) and (adcIdx > 0) then
                        adcIdx_next     <= adcIdx - 1;
                        state_next      <= genAFrame_s;
                        headCnt_next    <= to_unsigned(nHeadA-1, headCnt_next'length);
                        udpDataRdy_next <= true;
                    else
                        adcIdx_next   <= 7; -- fromDaqReg.reset adcIdx
                        rqstType_next <= RQST_NULL;
                        state_next    <= idle_s; -- return to idle
                    end if;
                end if;

            when others =>
                state_next <= idle_s;

        end case;
    end process;

    statusTiming : process (dwaClk100) -- latch the packet data validated by the sendData strobe
    begin
        if rising_edge(dwaClk100) then
            statusBusy_del <= statusBusy;
            statusDataTrig <= statusDataSticky /= statusDataLatch;
            statusTimeout  <= statusTimerCnt(31 downto 8) >= fromDaqReg.statusPeriod;

            if (statusDataTrig or statusTimeout) and not sendStatus then -- latch data and set senStatus flag, Don't re latch on subsequent triggers, keep sticky for next pkt.
                sendStatus      <= fromDaqReg.statusPeriod > x"0000000"; --when period is 0, turn off
                statusDataLatch <= statusDataSticky;

                statusTimeoutLatch    <= not statusDataTrig; -- if not data triggered signal it was timeout triggered, timeout is not priority
                statusDataSticky.errors   <= fromDaqReg.errors;
                statusDataSticky.pButton  <= pButton;
                statusDataSticky.ctrlBusy <= fromDaqReg.ctrlStateDbg /= x"0";

                statusTimerCnt <= x"00000001";
            else
                -- triggers are stickey so we don't miss one if busy sending a packet
                statusDataSticky.errors   <= fromDaqReg.errors or statusDataSticky.errors;
                statusDataSticky.pButton  <= pButton or statusDataSticky.pButton;
                statusDataSticky.ctrlBusy <= fromDaqReg.ctrlStateDbg /= x"0";
                if not statusTimeout then -- keep from overflowing counter while we wait to send packet.
                    statusTimerCnt <= statusTimerCnt+1;
                end if;
                -- latch status until statusBusy is done
                sendStatus <= sendStatus and (not statusBusy_del or statusBusy); --clear request
            end if;

        end if;
    end process;


    watchdogTiming : process (dwaClk100) -- latch the packet data validated by the sendData strobe
    begin
        if rising_edge(dwaClk100) then
            -- default
            watchdogReset <= false; --clear request

            if watchdogSleep then
                watchdogTimerCnt <= x"00000001";

            elsif watchdogTimerCnt(31 downto 8) >= fromDaqReg.pktGenWatchdogPeriod then
                watchdogTimerCnt <= x"00000001";
                watchdogReset    <= true;

            else
                watchdogTimerCnt <= watchdogTimerCnt+1;
            end if;
        end if;
    end process;

    toDaqReg.pktGenStateDbg <= to_unsigned(state_type'POS(state_reg),toDaqReg.pktGenStateDbg'length);
end architecture rtl;

