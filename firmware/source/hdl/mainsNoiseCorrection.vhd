--------------------------------------------------------------------------------
-- Title       : main
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : mainsNoiseCorrection.vhd
-- Author      : User Name <user.email@user.company.com>
-- Company     : User Company Name
-- Created     : Thu Sep 24 17:35:18 2020
-- Last update : Tue Sep 21 21:41:53 2021
-- Platform    : Default Part Number
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2020 User Company Name
-------------------------------------------------------------------------------
-- Description: Using peoiodic samples of mains noise, interpolate to generate 
-- as needed for the mains noise subtraction
--------------------------------------------------------------------------------
-- Revisions:  Revisions and documentation are controlled by
-- the revision control system (RCS).  The RCS should be consulted
-- on revision history.
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;
-- Custom libraries and packages:
library duneDwa;
use duneDwa.global_def.all;

entity mainsNoiseCorrection is
    port (
        ---------------------------
        -- records
        fromDaqReg : in  fromDaqRegType;
        toDaqReg   : out toDaqRegType;
        freqSet    : in  unsigned(23 downto 0);

        noiseReadoutBusy : in boolean := false;

        dataSel : in std_logic_vector(1 downto 0) := (others => '0');

        adcStart : in boolean := false;

        senseWireData     : in signed_vector_type(7 downto 0)(14 downto 0);
        senseWireDataStrb : in std_logic := '0';

        -- we turned the ADC into 15 bits
        senseWireMNSData     : out signed_vector_type(7 downto 0)(14 downto 0);
        senseWireMNSDataStrb : out std_logic := '0';

        dwaClk100 : in std_logic -- := '0'
    );
end entity mainsNoiseCorrection;

architecture struct of mainsNoiseCorrection is
    COMPONENT bram_sdp_18x8k
        PORT (
            clka      : IN  STD_LOGIC;
            ena       : IN  STD_LOGIC;
            wea       : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra     : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
            dina      : IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
            clkb      : IN  STD_LOGIC;
            rstb      : IN  STD_LOGIC;
            enb       : IN  STD_LOGIC;
            addrb     : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
            doutb     : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            rsta_busy : OUT STD_LOGIC;
            rstb_busy : OUT STD_LOGIC
        );
    END COMPONENT;
    type mnsState_type is (idle_s, );
    signal mnsState : mnsState_type := idle_s, mnsReady_s, initMem_s, accumMem_s, getNoiseInitial_s, getNoise_s;

    signal cnvCnt      : unsigned(7 downto 0) := (others => '0');
    signal noiseDataEn : boolean              := false;
    signal freqInRange : boolean              := false;

    signal memWea  : std_logic := '0';
    signal memDin  : signed_vector_type(7 downto 0)(17 downto 0);
    signal memDout : slv_vector_type(7 downto 0)(17 downto 0);
    signal freqPtr : unsigned(5 downto 0);

begin
    cntConversions : process (dwaClk100)
    begin
        if rising_edge(dwaClk100) then
            if adcStart then -- we initiated a new frequency
                cnvCnt <= (others => '0');
            elsif senseWireDataStrb or mnsState = getNoiseInitial_s then -- point to the next sample
                cnvCnt <= cnvCnt+1;
            end if;
        end if;
    end process;

    memAddr <= freqSet(12 downto 7) std_logic_vector(freqSet(6 downto 0));

    mnsState_seq : process (dwaClk100)
    begin
        if rising_edge(dwaClk100) then
            --default
            senseWireMNSDataStrb <= '0' ;
            memWea               <= '0';
            freqPtr              <= freqSet(12 downto 7);
            -- keep track of the samples within a single frequency "cnvCnt"
            -- the default address is set to follow the frequency and conversion number.
            -- This is only overridden when getting the second noise sample used for interpolation
            freqInRange <= (freqSet >= fromDaqReg.noiseFreqMin) and
                (freqSet < fromDaqReg.noiseFreqMax);

            if fromDaqReg.reset then
                mnsState <= idle_s;
            else

                case (mnsState) is
                    when idle_s =>
                        -- just pass the data through when inactive
                        senseWireMNSData     <= senseWireData;
                        senseWireMNSDataStrb <= senseWireMNSDataStrb;

                        if noiseReadoutBusy then -- we are gathering noise samples
                            if adcStart then
                                mnsState <= getNoiseInitial_s;
                            end if;
                        elsif freqInRange then
                            mnsState <= mnsReady_s;
                        end if;

                    when getNoiseInitial_s => -- get the first interpolation sample
                        noise(0)(chan_i) <= signed(memDout(chan_i)(17 downto 3));
                        freqPtr          <= freqPtr+1; -- look ahead to the next frequency
                                                       -- cnfCnt is incremented in this state to point to next sample. Fill the initial noise filter value
                        mnsState <= getNoise_s;

                    when getNoise_s =>
                        noise(chan_i) <= noise(0)(chan_i) & signed(memDout(chan_i)(17 downto 3));
                        mnsState      <= mnsReady_s;

                    when mnsReady_s =>
                        case (dataSel) is
                            when "00" =>
                                senseWireMNSData <= senseWireData;
                            when "01" =>
                                for chan_i in 7 downto 0 loop
                                    senseWireMNSData(chan_i) <= senseWireData(chan_i)(15 downto 1) - signed(memDout(chan_i)(17 downto 3));
                                end loop;
                            when "10" =>
                                for chan_i in 7 downto 0 loop
                                    senseWireMNSData(chan_i) <= signed(memDout(chan_i)(17 downto 3));
                                end loop;
                            when "11" =>
                                for chan_i in 7 downto 0 loop
                                    senseWireMNSData(7 downto 0)(14 downto 0) <= (others => (14 downto 0 => "00" & signed(freqSetOffset(8 DOWNTO 4)) & signed(cnvCnt)));
                                    senseWireMNSData(chan_i)(14 downto 13)    <= "00";
                                    senseWireMNSData(chan_i)(12 downto 8)     <= signed(freqSetOffset(8 DOWNTO 4));
                                    senseWireMNSData(chan_i)(7 downto 0)      <= signed(cnvCnt);
                                end loop;
                            when others =>
                                null;
                        end case;

                        if not freqInRange or noiseReadoutBusy then -- disable mains subtraction
                            mnsState <= idle_s;
                        else -- mains subtraction is active
                            if adcStart then
                                mnsState <= initMem_s when noiseReadoutBusy else getNoiseInitial_s;
                            elsif senseWireDataStrb then
                                mnsState <= getNoise_s;
                            end if;
                        end if;

                    when initMem_s => -- this is the first time at this frequency's sample
                        for chan_i in 7 downto 0 loop
                            memDin(chan_i) <= resize(senseWireData(chan_i)(15 downto 1),18); -- no accumulation
                        end loop;
                        memWea <= senseWireDataStrb;

                        if not noiseReadoutBusy then -- path back to the ready state eg in the case of no averaging or an abort
                            mnsState <= idle_s;
                        elsif adcStart then -- this is the start of the second set of samples. let's accumulate
                            mnsState <= accumMem_s;
                        end if;

                    when accumMem_s =>
                        for chan_i in 7 downto 0 loop
                            memDin(chan_i) <= resize(senseWireData(chan_i)(15 downto 1),18) + signed(memDout(chan_i));
                        end loop;
                        memWea <= senseWireDataStrb;

                        if not noiseReadoutBusy then -- path back to the ready state eg we are donw with this frequency or an abort
                            mnsState <= idle_s;
                        end if;

                    when others =>
                        mnsState <= idle_s;
                end case;
            end if;
        end if;
    end process mnsState_seq;


    genChMem : for chan_i in 7 downto 0 generate

        bram_sdp_18x8k_inst : bram_sdp_18x8k
            PORT MAP (
                clk               => dwaClk100,
                ena                => '1',
                wea(0)             => memWea,
                addra(12 downto 7) => std_logic_vector(freqSet(12 DOWNTO 7)), -- shifting by 7 will give a x128 interpolation
                addra(6 downto 0)  => std_logic_vector(cnvCnt),
                dina               => std_logic_vector(memDin(chan_i)),
                dout              => memDout(chan_i),
            );
    end generate;
end architecture struct;
