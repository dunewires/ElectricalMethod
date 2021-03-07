--------------------------------------------------------------------------------
-- Title       : <Title Block>
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : wtaController.vhd
-- Author      : User Name <user.email@user.company.com>
-- Company     : User Company Name
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Thu Mar  4 10:00:44 2021
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
		noiseFirstReadout : out boolean := false;
		noiseResetBusy   : in  boolean := false;

		sendRunHdr  : out boolean := false;
		sendAdcData : out boolean := false;

        pktBuildBusy : out boolean;
        freqScanBusy : in boolean;


		adcAutoDc_af : in std_logic_vector(7 downto 0) := (others => '0');

		adcStart : out boolean   := false;
		adcBusy  : in  std_logic := '0';

		dwaClk100 : in std_logic := '0'
	);
end entity wtaController;
architecture rtl of wtaController is

	type ctrlState_type is (idle_s, noisePrep_s, noiseReadout_s, stimPrep_s, stimRun_s, stimReadout_s, freqScanFinish_s);
	signal ctrlState       : ctrlState_type        := idle_s;
	signal ctrlStart_del   : boolean               := false;
	signal scanDone        : boolean               := false;
	signal timerCnt        : unsigned(31 downto 0) := (others => '0');
	signal noiseReadoutCnt : unsigned(3 downto 0)  := (others => '0');
	signal adcBusy_del     : std_logic             := '0';
	signal pktBuildBusy_del   : boolean               := false;
	signal pktBuildDone   : boolean               := false;
begin

	ctrlState_seq : process (dwaClk100)
	begin
		if rising_edge(dwaClk100) then
			scanDone          <= (freqSet >= fromDaqReg.noiseFreqMax) when noiseReadoutBusy else (freqSet >= fromDaqReg.stimFreqMax);
			toDaqReg.ctrlBusy <= true;
			ctrlStart_del     <= fromDaqReg.ctrlStart;
			adcBusy_del       <= adcBusy;
			adcStart          <= false;
			sendRunHdr        <= false;
			sendAdcData       <= false;
						noiseFirstReadout <= noiseReadoutCnt = x"1";

						                --generate pulse when we finish a task
                pktBuildDone <= pktBuildBusy and pktBuildBusy_del;

			if fromDaqReg.reset then
				ctrlState <= idle_s;
			else

				case (ctrlState) is

					when idle_s => --test is done and set freq to the beginning
						toDaqReg.ctrlBusy <= false;
						noiseReadoutCnt   <= x"1";
						noiseReadoutBusy  <= false;
						timerCnt          <= x"00000000";
						--turn off stimulus 
						acStim_enable <= '0';

						if fromDaqReg.ctrlStart and not ctrlStart_del then
							sendRunHdr       <= true; --send run header at start of test.
							noiseReadoutBusy <= true; -- only count 
							freqSet          <= fromDaqReg.noiseFreqMin;
							ctrlState        <= noisePrep_s;
							freqScanBusy <= true;
						end if;

					when noisePrep_s =>                 
					--wait a bit for the divison to update and BPF to respond to the new setting
						if timerCnt(31 downto 8) <= fromDaqReg.noiseBPFSetTime then 
							timerCnt <= timerCnt +1;    -- only count 
					-- check FIFOs are not almost full
						elsif not noiseResetBusy then   -- wait for the noise memory to be reset
							adcStart  <= true;
							timerCnt  <= x"00000000";
							ctrlState <= noiseReadout_s;
						end if;

					when noiseReadout_s => --wait a bit for the division to update and check FIFOs are not almost full
						                   -- wait for falling edge of adcBusy;
						if adcBusy = '0' and adcBusy_del = '1' then
							if scanDone then
								if noiseReadoutCnt = x"8" then --we are done with the noise
									freqSet          <= fromDaqReg.stimFreqMin;
									noiseReadoutBusy <= false; -- only count 
									ctrlState        <= stimPrep_s;
								else -- accumulate more noise samples to average 
									freqSet <= fromDaqReg.noiseFreqMin;
									noiseReadoutCnt <= noiseReadoutCnt +1;
									ctrlState       <= noisePrep_s;
								end if;
							else
								freqSet   <= freqSet+fromDaqReg.noiseFreqStep;
								ctrlState <= noisePrep_s;
							end if;
						end if;

					when stimPrep_s =>                                      --wait a bit for the divison to update and check FIFOs are not almost full
						if timerCnt <= x"00000020" then                     --give at least 32 clocks for division to happen
							timerCnt <= timerCnt +1;                        -- only count 
						elsif (adcAutoDc_af = x"00") and adcBusy = '0' then -- check fifos and adc is not in a readout
							timerCnt  <= x"00000000";
							ctrlState <= stimRun_s;
						end if;

					when stimRun_s => -- count the number of clock cycles we stim before ADC readout
						timerCnt      <= timerCnt+1;
						acStim_enable <= '1'; -- Turn on stimulus 
						if timerCnt(31 downto 8) >= fromDaqReg.stimTime then
							timerCnt  <= x"00000000";
							ctrlState <= stimReadout_s;
							adcStart  <= true;
						end if;

					when stimReadout_s =>
						-- wait for falling edge of adcBusy;
						if adcBusy = '0' and adcBusy_del = '1' then
							sendAdcData <= true;
							if scanDone then
								ctrlState <= freqScanFinish_s;
								freqScanBusy <= false;
							else
								freqSet   <= freqSet+fromDaqReg.stimFreqStep;
								ctrlState <= stimPrep_s;
							end if;
						end if;

						when freqScanFinish_s  => 
						if pktBuildDone then
							sendRunHdr       <= true; --send run header at end of test.
							ctrlState <= idle_s;
						else


					when others =>
						ctrlState <= idle_s;
						null;
				end case;
			end if;
		end if;
	end process ctrlState_seq;
end architecture rtl;