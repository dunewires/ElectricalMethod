--------------------------------------------------------------------------------
-- Title       : DWA Global Definitions
-- Project     : DUNE DWA
--------------------------------------------------------------------------------
-- File        : headerGenerator.vhd
-- Author      : Nathan Felt felt@fas.harvard.edu
-- Company     : Harvard University LPPC
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Fri Feb 18 11:33:11 2022
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
    constant useAdcEmu : boolean := false;
    --constant useAdcEmu   : boolean := true;
    constant ipLocalDefault : std_logic_vector(31 downto 0) := x"C0AB0107"; --192.168.1.7
    constant macDefault     : std_logic_vector(47 downto 0) := x"842B2B97DA03";

    type SLV_VECTOR_TYPE is array (natural range <>) of std_logic_vector;
    type SLV_VEC_OF_VEC_TYPE is array (natural range <>) of SLV_VECTOR_TYPE;
    type UNSIGNED_VECTOR_TYPE is array (natural range <>) of unsigned;
    type SIGNED_VECTOR_TYPE is array (natural range <>) of signed;
    type SIGNED_VEC_OF_VEC_TYPE is array (natural range <>) of SIGNED_VECTOR_TYPE;
    type INTEGER_VECTOR_TYPE is array (natural range <>) of integer;

    type toDaqRegType is record
        ctrlBusy      : boolean; --nf
        udpDataWord   : std_logic_vector(31 downto 0);
        udpDataRdy    : boolean;
        senseWireGain : SLV_VECTOR_TYPE(7 downto 0)(7 downto 0);
        coilDrive     : std_logic_vector(31 downto 0);
        relayBusTop   : SLV_VECTOR_TYPE(1 downto 0)(15 downto 0);
        relayWireTop  : SLV_VECTOR_TYPE(3 downto 0)(15 downto 0);
        relayBusBot   : SLV_VECTOR_TYPE(1 downto 0)(15 downto 0);
        relayWireBot  : SLV_VECTOR_TYPE(3 downto 0)(15 downto 0);

        serNum           : unsigned(23 downto 0);
        serNumLocal      : std_logic_vector(23 downto 0);
        ipLocal          : std_logic_vector(31 downto 0);
        macUword         : std_logic_vector(23 downto 0);
        macLword         : std_logic_vector(23 downto 0);
        serNumMemAddress : unsigned(10 downto 0);
        serNumMemData    : unsigned(31 downto 0);

        ctrlStateDbg   : unsigned(3 downto 0);
        errors         : std_logic_vector(23 downto 0);
        pktGenStateDbg : unsigned(3 downto 0);
        pButton        : std_logic_vector(3 downto 0);
                                       
        checkRegA     : std_logic_vector(31 downto 0);	
        checkRegB     : std_logic_vector(31 downto 0);	
                                       
        gpioState      : std_logic_vector(3 downto 0);
    end record; -- toDaqRegType

    type fromDaqRegType is record
        ctrlStart : boolean;
        reset     : boolean;
        scanAbort : boolean;


        auto        : boolean;
        mnsEna      : boolean;
        udpDataDone : boolean;
        udpDataRen  : boolean;
        coilDrive   : std_logic_vector(31 downto 0);

        -- start james' additions
        --- dwaCtrl (still used?  how many bits?)
        fixedPeriod     : unsigned(23 downto 0);
        stimFreqReq     : unsigned(23 downto 0); --10 Hz  , 1000 Hz
        stimFreqMin     : unsigned(23 downto 0); --10 Hz  , max
        stimFreqMax     : unsigned(23 downto 0); -- min , 1000 Hz
        stimFreqStep    : unsigned(23 downto 0); -- 1  ,  (freqMax - freqMin)
        noiseFreqMin    : unsigned(23 downto 0); -- stimFreqMin , noiseFreMax when MNS enabled
        noiseFreqMax    : unsigned(23 downto 0); -- ((noiseFreqMin - stimFreqMax)/step <= 32) , (noiseFreqMin - stimFreqMax) when MNS enabled
        noiseFreqStep   : unsigned(23 downto 0); -- TBD - noiseFreqMax - NoiseFreqMin, when MNS enabled
        noiseSampPer    : unsigned(23 downto 0); -- -- unused !!remove from firmware / Daq
        noiseNCnv       : unsigned(23 downto 0); -- unused !!remove from firmware / Daq
        noiseBPFSetTime : unsigned(23 downto 0); -- anything

        serNum           : unsigned(23 downto 0); -- not from register
        serNumLocal      : std_logic_vector(23 downto 0);
        ipLocal          : std_logic_vector(31 downto 0);
        macUword         : std_logic_vector(23 downto 0);
        macLword         : std_logic_vector(23 downto 0);
        serNumMemAddress : unsigned(10 downto 0); -- anything
        serNumMemData    : unsigned(31 downto 0); -- anything

        serNumMemRead     : std_logic;                           -- anything
        serNumMemAddrStrb : std_logic;                           -- anything
        serNumMemWrite    : std_logic;                           -- anything
                                                                 --stimPeriodActive   : unsigned(23 downto 0);
                                                                 --stimPeriodCounter  : unsigned(23 downto 0); -- bits???
                                                                 --- Number of stimulus cycles per frequency (unitless)
        cyclesPerFreq : unsigned(23 downto 0);                   -- fromDaqReg.cyclesPerFreq * fromDaqReg.adcSamplesPerCycle < 4096 
                                                                 --- Number of ADC samples per simulus cycle (unitless)
        adcSamplesPerCycle : unsigned(15 downto 0);              -- fromDaqReg.cyclesPerFreq * fromDaqReg.adcSamplesPerCycle < 4096
                                                                 --- AC Stimulus magnitude (12bit DAC value)
        stimMag       : unsigned(11 downto 0);                   -- any value
        senseWireGain : SLV_VECTOR_TYPE(7 downto 0)(7 downto 0); -- anyvalue
        dateCode      : std_logic_vector(47 downto 0);
        hashCode      : std_logic_vector(31 downto 0);
        -- Client IP address (where UDP data is sent)
        clientIp : unsigned(31 downto 0);        -- anyvalue
                                                 --- After switching to a new frequency, how long to wait before
                                                 --- acquiring data (24bits, units=1.28 microseconds)
        stimTime : unsigned(23 downto 0);        -- anyvalue
                                                 -- extra time to wait after initially enabling the stimulus frequency at the start of a run
        stimTimeInitial : unsigned(23 downto 0); -- anyvalue

        ctrlStateDbg         : unsigned(3 downto 0);
        errors               : std_logic_vector(23 downto 0);
        statusPeriod         : unsigned(23 downto 0);  --anyvalue
        pktGenWatchdogPeriod : unsigned(23 downto 0);  --anyvalue
                                                       --- Channel mask indicating which sense channels are active (8bit)
        activeChannels : std_logic_vector(7 downto 0); -- !! unused, remove from firmware.
                                                       --- Mask indicating which relays are active
                                                       --- in v2 this is 32 bits.  In v3 will be 192 bits!!!
        relayMask : std_logic_vector(31 downto 0);     --!! unused remove from firmware.
                                                       --adcSamplingPeriod  : unsigned(23 downto 0);
        netStatus         : std_logic_vector(7 downto 0);
        relayBusTop       : SLV_VECTOR_TYPE(1 downto 0)(15 downto 0); --TBD
        relayWireTop      : SLV_VECTOR_TYPE(3 downto 0)(15 downto 0); --TBD
        relayBusBot       : SLV_VECTOR_TYPE(1 downto 0)(15 downto 0); --TBD
        relayWireBot      : SLV_VECTOR_TYPE(3 downto 0)(15 downto 0); --TBD
        relayUpdate       : boolean;                                  --!! mask when realy registers are not correctly comfigured.
        relayAutoBreakEna : std_logic;                                --anything
        useAcStimTrig     : std_logic;                                -- anything
        danceParty        : std_logic;                                -- anything
        disableHV         : std_logic;                                -- anything
    end record;                                                       -- fromDaqRegType

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
