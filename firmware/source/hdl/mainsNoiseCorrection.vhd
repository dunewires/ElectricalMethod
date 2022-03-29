--------------------------------------------------------------------------------
-- Title       : main
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : mainsNoiseCorrection.vhd
-- Author      : User Name <user.email@user.company.com>
-- Company     : User Company Name
-- Created     : Thu Sep 24 17:35:18 2020
-- Last update : Tue Mar 29 14:48:28 2022
-- Platform    : Default Part Number
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2020 User Company Name
-------------------------------------------------------------------------------
-- Description: Using peoiodic samples of mains noiseCorrSamp, interpolate to generate 
-- as needed for the mains noiseCorrSamp subtraction
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
            clka  : IN  STD_LOGIC;
            wea   : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
            dina  : IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
        );
    END COMPONENT;


    COMPONENT ila_4x32
        PORT (
            clk : IN STD_LOGIC;

            probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            probe2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            probe3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT ;

    COMPONENT vio_ctrl
        PORT (
            clk         : IN  STD_LOGIC;
            probe_in0   : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
            probe_in1   : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
            probe_in2   : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe_out0  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            probe_out1  : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe_out2  : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe_out3  : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe_out4  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            probe_out5  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            probe_out6  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            probe_out7  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            probe_out8  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            probe_out9  : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe_out10 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            probe_out11 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
        );
    END COMPONENT;

    type mnsState_type is (idle_s, mnsActive_s, initMem_s, accumMem_s, updateMemDout_s, getNoiseInitial_s, getNoise_s);
    signal mnsState : mnsState_type := idle_s;

    signal cnvCnt      : unsigned(6 downto 0) := (others => '0');
    signal freqInRange : boolean              := false;

    signal memWea       : std_logic := '0';
    signal memDin       : SIGNED_VECTOR_TYPE(7 downto 0)(17 downto 0);
    signal freqPtr      : unsigned(5 downto 0); -- 64 different frequencies 
    signal mnsStatePos  : unsigned(3 downto 0); -- debug FSM
    signal noiseAvg8    : signed_vector_type(7 downto 0)(14 downto 0);
    signal noiseAccum   : signed_vector_type(7 downto 0)(17 downto 0);
    signal vioProbeOut0 : std_logic_vector(31 downto 0) := (others => '0');

    signal senseWireDataTsel : signed_vector_type(7 downto 0)(14 downto 0);

    signal noiseCorrSamp     : SIGNED_VEC_OF_VEC_TYPE(1 downto 0)(7 downto 0)(14 downto 0);
    signal noiseCorrSampDiff : SIGNED_VECTOR_TYPE(7 downto 0)(14 downto 0);
    signal noiseCorrMult     : SIGNED_VECTOR_TYPE(7 downto 0)(23 downto 0);
    signal noiseCorr         : SIGNED_VECTOR_TYPE(7 downto 0)(14 downto 0);

begin

    -- just for testing have a VIO select data input that is a known constant
    dataTestMux : process (all)
    begin
        for chan_i in 7 downto 0 loop
            senseWireDataTsel(chan_i)  <= "0" & signed(freqPtr) & signed(cnvCnt(3 downto 0)) & to_signed(chan_i,4) when vioProbeOut0(7 downto 4) = x"1" else senseWireData(chan_i) ;
        end loop ;
    end process;

    mnsState_seq : process (dwaClk100)
    begin
        if rising_edge(dwaClk100) then
            --default
            freqInRange          <= (freqSet >= fromDaqReg.noiseFreqMin) and (freqSet < fromDaqReg.noiseFreqMax) and
                                        (fromDaqReg.mnsDisable = '0'); -- if not enabled, treat as out of range
            senseWireMNSDataStrb <= '0';
            memWea               <= '0';
            -- shifting freqSet by 7 will give a x128 interpolation, 6 bits for 64 individual frequencies
            -- keep track of the samples within a single frequency "cnvCnt"
            -- the default address is set to follow the frequency and conversion number.
            -- This is only overridden when getting the second noiseCorrSamp sample used for interpolation
            --(changed noise step)
            --freqPtr <= freqSet(12 downto 7);
            freqPtr <= freqSet(13 downto 8); -- changed to 1 Hz,  probably don't need this freq range? use for oversampling?
            case (mnsState) is

                -- all data is passed through
                when idle_s =>
                    -- just pass the data through when inactive
                    senseWireMNSData     <= senseWireDataTsel;
                    senseWireMNSDataStrb <= senseWireDataStrb;

                    if noiseReadoutBusy then -- we are gathering noiseCorrSamp samples
                        if adcStart then
                            cnvCnt   <= (others => '0');
                            mnsState <= initMem_s;
                        end if;
                    elsif freqInRange then -- we have entered the noise region, activate correction
                        mnsState <= mnsActive_s;
                    end if;

                -- initialize memory with noise samples before scan starts
                when initMem_s => -- this is the first time at this frequency's sample
                    for chan_i in 7 downto 0 loop
                        memDin(chan_i) <= resize(senseWireDataTsel(chan_i),18); -- no accumulation
                    end loop;
                    memWea <= senseWireDataStrb;

                    if not noiseReadoutBusy then -- path back to the ready state eg in the case of no averaging or an abort
                        mnsState <= idle_s;
                    elsif adcStart then -- this is the start of the second set of samples. let's accumulate
                        cnvCnt   <= (others => '0');
                        mnsState <= accumMem_s;
                    elsif memWea then
                        cnvCnt <= cnvCnt+1; --update address after write
                    end if;

                when accumMem_s =>
                    for chan_i in 7 downto 0 loop
                        memDin(chan_i) <= resize(senseWireDataTsel(chan_i),18) + noiseAccum(chan_i);
                    end loop;
                    memWea <= senseWireDataStrb;

                    if not noiseReadoutBusy then -- path back to the ready state eg we are donw with this frequency or an abort
                        mnsState <= idle_s;
                    elsif adcStart then -- this is the start of the second set of samples. let's accumulate
                        cnvCnt   <= (others => '0');
                        mnsState <= accumMem_s;
                    elsif memWea then
                        cnvCnt <= cnvCnt+1; --update address after write
                    end if;

                -- frequency scan n noise range
                when mnsActive_s =>
                    senseWireMNSDataStrb <= senseWireDataStrb;
                    case (vioProbeOut0(3 downto 0)) is
                        when x"0" =>
                            for chan_i in 7 downto 0 loop
                                senseWireMNSData(chan_i) <= senseWireDataTsel(chan_i) - noiseCorr(chan_i);
                            end loop;
                        when x"1" =>
                            senseWireMNSData <= senseWireDataTsel;
                        when x"2" =>
                            for chan_i in 7 downto 0 loop
                                senseWireMNSData(chan_i) <= noiseAvg8(chan_i);
                            end loop;
                        when x"3" =>
                            for chan_i in 7 downto 0 loop
                                senseWireMNSData(chan_i)(14 downto 13) <= "00";
                                senseWireMNSData(chan_i)(12 downto 7)  <= signed(freqPtr);
                                senseWireMNSData(chan_i)(6 downto 0)   <= signed(cnvCnt);
                            end loop;
                        when x"4" =>
                            for chan_i in 7 downto 0 loop
                                senseWireMNSData(chan_i) <= senseWireDataTsel(chan_i) - noiseAvg8(chan_i);
                            end loop;
                        when x"5" =>
                            for chan_i in 7 downto 0 loop
                                senseWireMNSData(chan_i) <= senseWireDataTsel(chan_i) - noiseCorrSamp(1)(chan_i);
                            end loop;
                        when others =>
                            null;
                    end case;

                    if not freqInRange or noiseReadoutBusy then -- path back to the ready state eg we are donw with this frequency or an abort
                        mnsState <= idle_s;
                    elsif adcStart then -- this is the start of the second set of samples. let's accumulate
                        cnvCnt   <= (others => '0');
                        mnsState <= updateMemDout_s;
                    elsif senseWireDataStrb then
                        cnvCnt   <= cnvCnt+1; --update address after write
                        mnsState <= updateMemDout_s;
                    end if;

                -- get noise samples and interpolate before the corresponding sense wire ADC conversion arrives
                when updateMemDout_s => --wait 1 clock for the noise RAM dout data
                    mnsState <= getNoiseInitial_s;
                    freqPtr  <= freqPtr+1; -- look ahead to the next frequency, dout will update in 2 clock cycles

                when getNoiseInitial_s =>                          -- get the first interpolation sample
                    noiseCorrSamp <= noiseAvg8 & noiseCorrSamp(1); -- first sample read is LS, shift right
                    mnsState      <= getNoise_s;

                when getNoise_s =>
                    noiseCorrSamp <= noiseAvg8 & noiseCorrSamp(1); -- first sample read is LS, shift right
                    mnsState      <= mnsActive_s;

                when others =>
                    mnsState <= idle_s;
            end case;
        end if;
    end process mnsState_seq;

    genChMem : for chan_i in 7 downto 0 generate
        bram_sdp_18x8k_inst : bram_sdp_18x8k
            PORT MAP (
                clka               => dwaClk100,
                wea(0)             => memWea,
                addra(12 downto 7) => std_logic_vector(freqPtr), -- 64 frequencies 
                addra(6 downto 0)  => std_logic_vector(cnvCnt),  -- 128 samples / frequency
                dina               => std_logic_vector(memDin(chan_i)),
                signed(douta)      => noiseAccum(chan_i)
            );

        noiseAvg8(chan_i) <= noiseAccum(chan_i)(17 downto 3); -- take the accumulated samples and divide by 8

        linearInterp : process (dwaClk100)
        begin
            if rising_edge(dwaClk100) then
                noiseCorrSampDiff(chan_i) <= noiseCorrSamp(1)(chan_i) - noiseCorrSamp(0)(chan_i);
                --(changed noise step)
                --noiseCorrMult(chan_i)     <= noiseCorrSampDiff(chan_i) * signed ('0' & freqSet(6 downto 0)); -- inferred mult requires both be signed, This is the correction between frequency samples
                --noiseCorr(chan_i)         <= noiseCorrSamp(0)(chan_i) + noiseCorrMult(chan_i)(21 downto 7);  -- divide by 128 -- 1/2 Hz freq noise step size.  does this need to be parameterized?
                noiseCorrMult(chan_i)     <= noiseCorrSampDiff(chan_i) * signed ('0' & freqSet(7 downto 0)); -- inferred mult requires both be signed, This is the correction between frequency samples
                noiseCorr(chan_i)         <= noiseCorrSamp(0)(chan_i) + noiseCorrMult(chan_i)(22 downto 8);  -- divide by 256 -- 1Hz freq noise step size.  does this need to be parameterized?
            end if;
        end process;

    end generate;

    mnsStatePos <= to_unsigned(mnsState_type'POS(mnsState),mnsStatePos'length);

    ila_4x32_inst : ila_4x32
        PORT MAP (
            clk                  => dwaClk100,
            probe0(31 downto 4)  => (others => '0'),
            probe0(3 downto 0)   => std_logic_vector(mnsStatePos),
            probe1(31 downto 18) => (others => '0'),
            probe1(17 downto 0)  => std_logic_vector(memDin(1)),
            probe2(31 downto 18) => (others => '0'),
            probe2(17 downto 0)  => std_logic_vector(noiseAccum(1)),
            probe3(31 downto 30) => (others => '0'),
            probe3(29 downto 15) => std_logic_vector(senseWireDataTsel(1)),
            probe3(14 downto 0)  => std_logic_vector(senseWireMNSData(1))
        );

    vio_ctrl_inst : vio_ctrl
        PORT MAP (
            clk => dwaClk100,

            probe_in0   => (others => '0'),
            probe_in1   => (others => '0'),
            probe_in2   => (others => '0'),
            probe_out0  => vioProbeOut0,
            probe_out1  => open,
            probe_out2  => open,
            probe_out3  => open,
            probe_out4  => open,
            probe_out5  => open,
            probe_out6  => open,
            probe_out7  => open,
            probe_out8  => open,
            probe_out9  => open,
            probe_out10 => open,
            probe_out11 => open
        );

end architecture struct;
