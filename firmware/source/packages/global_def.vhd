--------------------------------------------------------------------------------
-- Title       : DWA Global Definitions
-- Project     : DUNE DWA
--------------------------------------------------------------------------------
-- File        : headerGenerator.vhd
-- Author      : Nathan Felt felt@fas.harvard.edu
-- Company     : Harvard University LPPC
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Mon Dec 21 17:48:25 2020
-- Platform    : DWA microZed
-- Standard    : VHDL-2008
-------------------------------------------------------------------------------
-- Description: Definitions of a parameterized system
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;

library duneDwa;

package global_def is
    function bool2Sl(BOOL_IN : boolean) return std_logic;
    -- ADC AXI offset address
    constant adcRegOfst  : integer := 24;
    constant adcStatAddr : integer := 23;
    --set emulated data
    --constant useAdcEmu : boolean := true;
    constant useAdcEmu   : boolean := true;


    type SLV_VECTOR_TYPE is array (natural range <>) of std_logic_vector;
    type UNSIGNED_VECTOR_TYPE is array (natural range <>) of unsigned;
    type SIGNED_VECTOR_TYPE is array (natural range <>) of signed;
    type INTEGER_VECTOR_TYPE is array (natural range <>) of integer;

    type toDaqRegType is record
        ctrlBusy         : boolean; --nf
        udpDataWord      : std_logic_vector(31 downto 0);
        udpDataRdy       : boolean;
        senseWireGain    : SLV_VECTOR_TYPE(7 downto 0)(7 downto 0);
        coilDrive        : std_logic_vector(31 downto 0);
        relayBusTop      : SLV_VECTOR_TYPE(1 downto 0)(15 downto 0);
        relayWireTop     : SLV_VECTOR_TYPE(3 downto 0)(15 downto 0);
        relayBusBot      : SLV_VECTOR_TYPE(1 downto 0)(15 downto 0);
        relayWireBot     : SLV_VECTOR_TYPE(3 downto 0)(15 downto 0);

        serNum           : unsigned(23 downto 0);
        serNumMemAddress : unsigned(12 downto 0);
        serNumMemData    : unsigned(31 downto 0);

    end record; -- toDaqRegType

    type fromDaqRegType is record
        ctrlStart : boolean;
        reset     : boolean;

        auto        : boolean;
        mnsEna      : boolean;
        udpDataDone : boolean;
        udpDataRen  : boolean;
        coilDrive   : std_logic_vector(31 downto 0);

        -- start james' additions
        --- dwaCtrl (still used?  how many bits?)
        fixedPeriod     : unsigned(23 downto 0); -- 10ns
        stimFreqReq     : unsigned(23 downto 0); --nf
        stimFreqMin     : unsigned(23 downto 0); -- 10ns
        stimFreqMax     : unsigned(23 downto 0); -- 10ns
        stimFreqStep    : unsigned(23 downto 0); -- 10ns
        noiseFreqMin    : unsigned(23 downto 0); -- 40 Hz
        noiseFreqMax    : unsigned(23 downto 0); -- 70 Hz
        noiseFreqStep   : unsigned(23 downto 0); -- 1 Hz
        noiseSampPer    : unsigned(23 downto 0); -- 32 samp / cycle @ 60 Hz
        noiseNCnv       : unsigned(23 downto 0);
        noiseBPFSetTime : unsigned(23 downto 0);

        serNum           : unsigned(23 downto 0);
        serNumMemAddress : unsigned(12 downto 0);
        serNumMemData    : unsigned(31 downto 0);
        
        serNumMemRead    : std_logic;
        serNumMemAddrStrb    : std_logic;
        serNumMemWrite   : std_logic;
        --stimPeriodActive   : unsigned(23 downto 0);
        --stimPeriodCounter  : unsigned(23 downto 0); -- bits???
        --- Number of stimulus cycles per frequency (unitless)
        cyclesPerFreq : unsigned(23 downto 0);      -- bits???
                                                    --- Number of ADC samples per simulus cycle (unitless)
        adcSamplesPerCycle : unsigned(15 downto 0); -- bits???
                                                    --- AC Stimulus magnitude (12bit DAC value)
        stimMag       : unsigned(11 downto 0);
        senseWireGain : SLV_VECTOR_TYPE(7 downto 0)(7 downto 0);
        -- Client IP address (where UDP data is sent)
        clientIp : unsigned(31 downto 0);
        --- After switching to a new frequency, how long to wait before
        --- acquiring data (24bits, units=1.28 microseconds)
        stimTime : unsigned(23 downto 0);
        --- Channel mask indicating which sense channels are active (8bit)
        activeChannels : std_logic_vector(7 downto 0);
        --- Mask indicating which relays are active
        --- in v2 this is 32 bits.  In v3 will be 192 bits!!!
        relayMask : std_logic_vector(31 downto 0);
        --adcSamplingPeriod  : unsigned(23 downto 0);
        relayBusTop       : SLV_VECTOR_TYPE(1 downto 0)(15 downto 0);
        relayWireTop      : SLV_VECTOR_TYPE(3 downto 0)(15 downto 0);
        relayBusBot       : SLV_VECTOR_TYPE(1 downto 0)(15 downto 0);
        relayWireBot      : SLV_VECTOR_TYPE(3 downto 0)(15 downto 0);
        relayUpdate       : boolean;
        relayAutoBreakEna : std_logic;
    end record; -- fromDaqRegType

end global_def;


package body global_def is

    function bool2Sl (BOOL_IN : boolean) return std_logic is
        variable SL_OUT : std_logic;
    begin
        if BOOL_IN then
            SL_OUT := '1';
        else
            SL_OUT := '0';
        end if;
        return SL_OUT;
    end function BOOL2SL;

end global_def;
