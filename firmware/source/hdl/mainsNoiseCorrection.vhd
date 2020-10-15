--------------------------------------------------------------------------------
-- Title       : main
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : mainsNoiseCorrection.vhd
-- Author      : User Name <user.email@user.company.com>
-- Company     : User Company Name
-- Created     : Thu Sep 24 17:35:18 2020
-- Last update : Wed Oct  7 19:02:11 2020
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

        noiseReadoutBusy : in  boolean := false;
        resetBusy        : out boolean := false;
        adcStart         : in  boolean := false;

        senseWireDataStrb : in std_logic := '0';
        senseWireData     : in signed_vector_type(7 downto 0)(15 downto 0);

        senseWireMNSDataStrb : out std_logic := '0';
        -- we turned the ADC into 15 bits
        senseWireMNSData     : out signed_vector_type(7 downto 0)(14 downto 0);

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

    signal cnvPeriodCnt                           : unsigned(23 downto 0) := (others => '0');
    signal cnvCnt                : unsigned(7 downto 0)  := (others => '0');
    signal noiseDataEn                            : boolean               := false;
    signal noiseReadoutBusy_del                   : boolean               := false;
    signal resetNoiseData                         : boolean               := false;
    signal doMns                                : boolean               := false;
    signal mem_rstb, mem_rsta_busy, mem_rstb_busy : std_logic             := '0';

    signal senseWireAccDataStrb : std_logic := '0';
    signal senseWireAccData     : signed_vector_type(7 downto 0)(17 downto 0);
    signal noiseData            : slv_vector_type(7 downto 0)(17 downto 0);

    signal mem_resetABusy, mem_resetBBusy : std_logic_vector(7 downto 0);

begin

    recordNoiseSamples : process (dwaClk100)
    begin
        if rising_edge(dwaClk100) then
            noiseReadoutBusy_del <= noiseReadoutBusy;

            if noiseReadoutBusy then
            -- we are collecting noise samples
                if adcStart then
                    cnvCnt <= (others => '0');
                elsif senseWireDataStrb then
                    cnvCnt <= cnvCnt + 1;
                end if;

            else
            -- We are interpolating the noise samples
            -- reset the sampling sequence with the new frequency
                if adcStart then
                    cnvCnt   <= (others => '0');
                    cnvPeriodCnt <= x"000001"; --reset to 1
                    noiseDataEn  <= false;
                else
                    -- wait for first ADC conversion
                    noiseDataEn <= senseWireDataStrb = '1' or noiseDataEn ;
                    if (cnvPeriodCnt >= fromDaqReg.noiseSampPer) then
                        cnvPeriodCnt <= x"000001"; --reset to 1
                        cnvCnt   <= cnvCnt + 1;
                    elsif noiseDataEn then
                        cnvPeriodCnt <= cnvPeriodCnt+1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    genChMem : for chan_i in 7 downto 0 generate

        bram_sdp_18x8k_inst : bram_sdp_18x8k
            PORT MAP (
                clka               => dwaClk100,
                ena                => bool2sl(noiseReadoutBusy),
                wea(0)             => senseWireAccDataStrb,
                addra(12 downto 8) => std_logic_vector(freqSet(8 DOWNTO 4)), -- shifting by 4 will give a x16 interpolation
                addra(7 downto 0)  => std_logic_vector(cnvCnt),
                dina               => std_logic_vector(senseWireAccData(chan_i)),
                clkb               => dwaClk100,
                rstb               => mem_rstb,
                enb                => '1',
                addrb(12 downto 8) => std_logic_vector(freqSet(8 DOWNTO 4)), -- shifting by 4 will give a x16 interpolation
                addrb(7 downto 0)  => std_logic_vector(cnvCnt),
                doutb              => noiseData(chan_i),
                rsta_busy          => mem_resetABusy(chan_i),
                rstb_busy          => mem_resetBBusy(chan_i)
            );


        -- if we need a sequential process we must delay the addra along with the data
        accSubtractNoise : process (all)
        begin
            --  if rising_edge(dwaClk100)  then
            -- we only transmit the ADC data with 15 bit precision, drop the LSB here.
            -- Accumulate the noise samples x8.
            senseWireAccData(chan_i) <= senseWireData(chan_i)(15 downto 1) + signed(noiseData(chan_i));
            senseWireAccDataStrb     <= senseWireDataStrb;



            -- divide the x8 accumulated noise samples by 8 and subtract from sense wire samples.
            -- outside the range just pass along the samples
            -- temp just output the noise data,
            --senseWireMNSData(chan_i) <= signed(noiseData(chan_i)(17 downto 3));
            senseWireMNSDataStrb <= '0' when noiseReadoutBusy else senseWireDataStrb;
            -- don't strobe readout when we are recording noise samples
            --senseWireMNSDataStrb <= senseWireDataStrb;

        end process;
    end generate genChMem;

             senseWireMNSData(0) <= signed(freqSet(14 downto 0));
             senseWireMNSData(1) <= senseWireData(2)(15 downto 1);
             senseWireMNSData(2) <= signed(noiseData(2)(17 downto 3));
             senseWireMNSData(3) <= senseWireData(2)(15 downto 1) - signed(noiseData(2)(17 downto 3));
             senseWireMNSData(4) <= signed(resize(cnvCnt,15));
             senseWireMNSData(5) <= senseWireData(6)(15 downto 1);
             senseWireMNSData(6) <= signed(noiseData(6)(17 downto 3));
             senseWireMNSData(7) <= senseWireData(6)(15 downto 1) - signed(noiseData(6)(17 downto 3));

    -- reset at the beginning of the noise recording.
    mem_rstb  <= bool2sl(noiseReadoutBusy and not noiseReadoutBusy_del);
    resetBusy <= (or(mem_resetABusy) = '1') or (or(mem_resetBBusy) = '1');
    -- when we are in the specified range of existing noise samples and enabled.
    doMns <= ((freqSet >= fromDaqReg.noiseFreqMin) and
            (freqSet < fromDaqReg.noiseFreqMax) and
            fromDaqReg.mnsEna);

end architecture struct;