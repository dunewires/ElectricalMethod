--------------------------------------------------------------------------------
-- Title       : main
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : mainsNoiseCorrection.vhd
-- Author      : User Name <user.email@user.company.com>
-- Company     : User Company Name
-- Created     : Thu Sep 24 17:35:18 2020
-- Last update : Thu Sep  9 07:12:21 2021
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
        freqSet    : in  unsigned(23 downto 0); -- current period (10ns)

        noiseReadoutBusy  : in boolean := false;
        noiseFirstReadout : in boolean := false;

        dataSel : in std_logic_vector(1 downto 0) := (others => '0');

        resetBusy : out boolean := false;
        adcStart  : in  boolean := false;

        senseWireData     : in signed_vector_type(7 downto 0)(15 downto 0);
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
    signal mnsState : mnsState_type := idle_s, mnsReady_s, initMem_s, accumMem_s, getNoise0_s, getNoise1_s;

    signal cnvPeriodCnt                           : unsigned(23 downto 0) := (others => '0');
    signal cnvCnt                                 : unsigned(7 downto 0)  := (others => '0');
    signal noiseDataEn                            : boolean               := false;
    signal noiseReadoutBusy_del                   : boolean               := false;
    signal resetNoiseData                         : boolean               := false;
    signal freqInRange                            : boolean               := false;
    signal mem_rstb, mem_rsta_busy, mem_rstb_busy : std_logic             := '0';

    signal senseWireAccDataStrb : std_logic := '0';
    signal senseWireAccData     : signed_vector_type(7 downto 0)(17 downto 0);
    signal noiseData            : slv_vector_type(7 downto 0)(17 downto 0);

    signal mem_resetABusy, mem_resetBBusy : std_logic_vector(7 downto 0);

    signal freqSetOffset : unsigned(23 downto 0); -- current period (10ns)

begin
    cntConversions : process (dwaClk100)
    begin
        if rising_edge(dwaClk100) then
            if adcStart then
            elsif senseWireAccDataStrb then --memory write enable
            end if;
        end if;
    end process;

    mnsState_seq : process (dwaClk100)
    begin
        if rising_edge(dwaClk100) then
                        senseWireMNSDataStrb <= '0' ;

            freqInRange <= (freqSetOffset >= fromDaqReg.noiseFreqMin) and
                (freqSetOffset < fromDaqReg.noiseFreqMax);

            if fromDaqReg.reset then
                mnsState <= idle_s;
            else
                case (mnsState) is
                    when idle_s =>
                        senseWireMNSData(chan_i) <= senseWireData(chan_i)(15 downto 1);
                        mnsState <= mnsReady_s when freqInRange else idle_s;

                    when mnsReady_s =>
                        case (dataSel) is
                            when "00" =>
                                senseWireMNSData(chan_i) <= senseWireData(chan_i)(15 downto 1);
                            when "01" =>
                                senseWireMNSData(chan_i) <= senseWireData(chan_i)(15 downto 1) - signed(noiseData(chan_i)(17 downto 3));
                            when "10" =>
                                senseWireMNSData(chan_i) <= signed(noiseData(chan_i)(17 downto 3));
                            when "11" =>
                                senseWireMNSData(chan_i)(14 downto 13) <= "00";
                                senseWireMNSData(chan_i)(12 downto 8)  <= signed(freqSetOffset(8 DOWNTO 4));
                                senseWireMNSData(chan_i)(7 downto 0)   <= signed(cnvCnt);
                            when others =>
                                null;
                        end case;
                        if not freqInRange then
                            mnsState <= idle_s;
                        else
                            if adcStart then
                                cnvCnt   <= (others => '0');
                                mnsState <= initMem_s when noiseReadoutBusy else getNoise0_s;
                            elsif senseWireDataStrb then
                                cnvCnt   <= cnvCnt+1;
                                mnsState <= initMem_s;
                            end if;
                        end if;

                    when initMem_s =>
                        senseWireAccData(chan_i) <= resize(senseWireData(chan_i)(15 downto 1),18);
                         senseWireAccDataStrb <= senseWireDataStrb;
                        if senseWireDataStrb then
                            cnvCnt <= cnvCnt + 1;
                        end if;
                        if adcStart then
                            mnsState <= accumMem_s;
                        elsif not noiseResetBusy then
                            mnsState <= idle_s;
                        end if;

                        senseWireAccData(chan_i) <= resize(senseWireData(chan_i)(15 downto 1),18) + signed(noiseData(chan_i));
                    when getNoise0_s =>
                        mnsState <= getNoise1_s;

                    when getNoise1_s =>
                        mnsState <= mnsReady_s;

                    when others =>
                        mnsState <= idle_s;
                        null;
                end case;
            end if;
        end if;
    end process mnsState_seq;


    genChMem : for chan_i in 7 downto 0 generate

        bram_sdp_18x8k_inst : bram_sdp_18x8k
            PORT MAP (
                clka               => dwaClk100,
                ena                => '1',
                wea(0)             => senseWireAccDataStrb,
                addra(12 downto 8) => std_logic_vector(freqSet(8 DOWNTO 4)), -- shifting by 4 will give a x16 interpolation
                addra(7 downto 0)  => std_logic_vector(cnvCnt),
                dina               => std_logic_vector(senseWireAccData(chan_i)),
                clkb               => dwaClk100,
                rstb               => mem_rstb,
                enb                => '1',
                addrb(12 downto 8) => std_logic_vector(freqSetOffset(8 DOWNTO 4)), -- shifting by 4 will give a x16 interpolation
                addrb(7 downto 0)  => std_logic_vector(cnvCnt),
                doutb              => noiseData(chan_i),
                rsta_busy          => mem_resetABusy(chan_i),
                rstb_busy          => mem_resetBBusy(chan_i)
            );


        accSubtractNoise : process (dwaClk100)
        begin
            if rising_edge(dwaClk100) then
                -- add a half step to go to the closest measured value when reading the nose
                freqSetOffset <= freqSet + fromDaqReg.noiseFreqStep(23 downto 1); -- offset set frequency by 1/2 step
                                                                                  -- we only transmit the ADC data with 15 bit precision, drop the LSB here.
                                                                                  -- Accumulate the noise samples x8.
                if noiseFirstReadout then
                else
                end if;

                if noiseReadoutBusy then
                else
                    senseWireMNSDataStrb <= senseWireDataStrb;
                    senseWireAccDataStrb <= '0' ;
                end if;
                -- divide the x8 accumulated noise samples by 8 and subtract from sense wire samples.
                -- outside the range just pass along the samples
                if freqInRange then
                else
                end if;

            -- don't strobe readout when we are recording noise samples
            --senseWireMNSDataStrb <= senseWireDataStrb;
            end if;
        end process;
    end generate genChMem;

    --   senseWireMNSData(0) <= senseWireData(0)(15 downto 1);
    --   senseWireMNSData(1) <= signed(noiseData(0)(17 downto 3));
    --   senseWireMNSData(2) <= senseWireData(1)(15 downto 1);
    --   senseWireMNSData(3) <= signed(noiseData(1)(17 downto 3));
    --   senseWireMNSData(4) <= senseWireData(2)(15 downto 1);
    --   senseWireMNSData(5) <= signed(noiseData(2)(17 downto 3));
    --   senseWireMNSData(6) <= senseWireData(3)(15 downto 1);
    --   senseWireMNSData(7) <= signed(noiseData(3)(17 downto 3));

    -- reset at the beginning of the noise recording.
    mem_rstb  <= '0';   --bool2sl(noiseReadoutBusy and not noiseReadoutBusy_del);
    resetBusy <= false; --(or(mem_resetABusy) = '1') or (or(mem_resetBBusy) = '1');
                        -- when we are in the specified range of existing noise samples and enabled.

end architecture struct;