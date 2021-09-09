--------------------------------------------------------------------------------
-- Title       : <Title Block>
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : wtaController.vhd
-- Author      : User Name <user.email@user.company.com>
-- Company     : User Company Name
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Thu Sep  9 16:25:15 2021
-- Platform    : Default Part Number
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2019 User Company Name
-------------------------------------------------------------------------------
-- Description: 
--------------------------------------------------------------------------------
-- Revisions:  Revisions and documentation are controlled by
-- the revision control system (RCS).  The RCS should be consulted
-- on revision history.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library duneDwa;
use duneDwa.global_def.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;

entity wtaController is
	port (
		fromDaqReg : in  fromDaqRegType;
		toDaqReg   : out toDaqRegType;

		-- internal signals
		freqSet       : out unsigned(23 downto 0) := (others => '1');
		acStim_enable : out std_logic             := '0';

		noiseReadoutBusy : out boolean := false;
		noiseResetBusy   : in  boolean := false;

		sendRunHdr  : out boolean := false;
		sendAdcData : out boolean := false;

		pktBuildBusy : in  boolean;
		freqScanBusy : out boolean;


		adcAutoDc_af : in std_logic_vector(7 downto 0) := (others => '0');

		adcStart : out boolean   := false;
		adcBusy  : in  std_logic := '0';

		dwaClk100 : in std_logic := '0'
	);
end entity wtaController;
architecture rtl of wtaController is

	type ctrlState_type is (idle_s, noisePrep_s, noiseReadout_s,stimEnable_s, stimPrep_s, stimRun_s, stimReadout_s, freqScanFinish_s, pktBuildFinish_s);
	signal ctrlState        : ctrlState_type        := idle_s;
	signal ctrlStart_del    : boolean               := false;
	signal scanDone         : boolean               := false;
	signal scanAbort        : boolean               := false;
	signal timerCnt         : unsigned(31 downto 0) := (others => '0');
	signal noiseReadoutCnt  : unsigned(3 downto 0)  := (others => '0');
	signal adcBusy_del      : std_logic             := '0';
	signal pktBuildBusy_del : boolean               := false;
	signal pktBuildDone     : boolean               := false;
begin

	ctrlState_seq : process (dwaClk100)
	begin
		if rising_edge(dwaClk100) then
			scanAbort <= (scanAbort or fromDaqReg.scanAbort) and freqScanBusy;
			--the noise scan will 
			scanDone <= (freqSet >= fromDaqReg.noiseFreqMax) when noiseReadoutBusy else (freqSet >= (fromDaqReg.stimFreqMax + fromDaqReg.noiseFreqStep);
					toDaqReg.ctrlBusy <= true;
					ctrlStart_del     <= fromDaqReg.ctrlStart;
					adcBusy_del       <= adcBusy;
					adcStart          <= false;
					sendRunHdr        <= false;
					sendAdcData       <= false;
					pktBuildBusy_del  <= pktBuildBusy;
					--generate pulse when we finish a task
					pktBuildDone <= not pktBuildBusy and pktBuildBusy_del;

					if fromDaqReg.reset then
						ctrlState <= idle_s;
					else

						case (ctrlState) is

							when idle_s => --test is done and set freq to the beginning
								toDaqReg.ctrlBusy <= false;
								noiseReadoutCnt   <= x"1";
								noiseReadoutBusy  <= false;
								freqScanBusy      <= false;
								timerCnt          <= x"00000000";
								--turn off stimulus 
								acStim_enable <= '0';

								if fromDaqReg.ctrlStart and not ctrlStart_del then
									sendRunHdr   <= true; --send run header at start of test.
									freqScanBusy <= true;
									-- if we are triggering on the stimulus, the noise subtraction won't work
									-- !! change this to mains noise disable and fix in MNS instance. 
									if fromDaqReg.useAcStimTrig then
										freqSet   <= fromDaqReg.stimFreqMin;
										ctrlState <= stimEnable_s;
									else
										freqSet   <= fromDaqReg.noiseFreqMin;
										ctrlState <= noisePrep_s;
								end if;
							end if;

							when noisePrep_s =>
								if scanAbort then --abort readout and send end of run header
									noiseReadoutBusy <= false;
									freqScanBusy     <= false;
									timerCnt         <= x"00000000";
									ctrlState        <= freqScanFinish_s;
								else
									noiseReadoutBusy <= true; -- tell the mainsNoiseCorrection that we care collecting noise samples
									                          --wait a bit for the division to update and BPF to respond to the new setting
									if timerCnt(31 downto 8) <= fromDaqReg.noiseBPFSetTime then
										timerCnt <= timerCnt +1;  -- only count 
									                              -- check FIFOs are not almost full
									elsif not noiseResetBusy then -- wait for the noise memory to be reset
										adcStart  <= true;
										timerCnt  <= x"00000000";
										ctrlState <= noiseReadout_s;
								end if;
							end if;

							when noiseReadout_s =>
								if adcBusy = '0' and adcBusy_del = '1' then -- wait for falling edge of adcBusy;
									if noiseReadoutCnt < x"8" then
										-- for each frequency, sample noise 8 times
										-- As soon as the ADC is finished with a series of samples
										-- adcStart will initiate the trigger on mains frequency
										adcStart        <= true;
										noiseReadoutCnt <= noiseReadoutCnt +1;
									else                           -- we are done averaging samples for the current freq
										noiseReadoutBusy <= false; -- tell the mainsNoise Correction we are finished collecting noise samples for current frequency
										noiseReadoutCnt  <= x"1";
										if not scanDone then -- we have collected all samples in range +1
											freqSet   <= freqSet+fromDaqReg.noiseFreqStep; -- on to the next frequency's noise samples
											ctrlState <= noisePrep_s;
										else
											freqSet   <= fromDaqReg.stimFreqMin;
											ctrlState <= stimEnable_s; -- start stimulus 
									end if;
								end if;
							end if;

							when stimEnable_s =>      -- when the stim is first enabled, wait a bit
								acStim_enable <= '1'; -- Turn on stimulus 
								timerCnt      <= timerCnt+1;
								if timerCnt(31 downto 8) >= fromDaqReg.stimTimeInitial then
									timerCnt  <= x"00000000";
									ctrlState <= stimPrep_s;
							end if;

							when stimPrep_s =>    --wait a bit for the divison to update and check FIFOs are not almost full
								if scanAbort then --abort readout and send end of run header
									freqScanBusy <= false;
									timerCnt     <= x"00000000";
									ctrlState    <= freqScanFinish_s;
								else
									if timerCnt <= x"00000020" then                     --give at least 32 clocks for division to happen
										timerCnt <= timerCnt +1;                        -- only count 
									elsif (adcAutoDc_af = x"00") and adcBusy = '0' then -- check fifos and adc is not in a readout
										timerCnt  <= x"00000000";
										ctrlState <= stimRun_s;
								end if;
							end if;

							when stimRun_s => -- count the number of clock cycles we stim before ADC readout
								if timerCnt(31 downto 8) >= fromDaqReg.stimTime then
									if not pktBuildBusy then -- don't start collecting new data until pktBuilder is finished 
										timerCnt  <= x"00000000";
										ctrlState <= stimReadout_s;
										adcStart  <= true;
								end if;
								else
									timerCnt <= timerCnt+1;
							end if;

							when stimReadout_s => --sending of ADC data packet
								                  -- wait for falling edge of adcBusy;
								if adcBusy = '0' and adcBusy_del = '1' then
									sendAdcData <= true;
									if scanDone then
										ctrlState    <= freqScanFinish_s;
										freqScanBusy <= false;
									else
										freqSet   <= freqSet+fromDaqReg.stimFreqStep;
										ctrlState <= stimPrep_s;
								end if;
							end if;

							-- the packet builder may or may not have just received a start command when we get the abort command
							when freqScanFinish_s => --wait for packet builder busy to respond then wait 'till its done
								if timerCnt >= x"00000008" then
									if not pktBuildBusy then
										sendRunHdr <= true; --send run header at end of test.
										timerCnt   <= x"00000000";
										ctrlState  <= pktBuildFinish_s;
								end if;
								else
									timerCnt <= timerCnt+1;
							end if;

							when pktBuildFinish_s => --wait for packet to be sent before allowing another test 
								if pktBuildDone then -- We will always see the packet builder finish in this case
									ctrlState <= idle_s;
							end if;

							when others =>
								ctrlState <= idle_s;
								null;
					end case;
				end if;
					end if;
					end process ctrlState_seq;

					toDaqReg.ctrlStateDbg <= to_unsigned(ctrlState_type'POS(ctrlState),toDaqReg.ctrlStateDbg'length);

					end architecture rtl;