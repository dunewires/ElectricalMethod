--------------------------------------------------------------------------------
-- Title       : <Title Block>
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : wtaController.vhd
-- Author      : User Name <user.email@user.company.com>
-- Company     : User Company Name
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Thu Sep 24 17:28:42 2020
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

		sendRunHdr  : out boolean := false;
		sendAdcData : out boolean := false;

		adcAutoDc_af : in std_logic_vector(7 downto 0) := (others => '0');

		adcStart : out std_logic := '0';
		adcBusy  : in  std_logic := '0';
		adcDone  : in  std_logic := '0';

		dwaClk100 : in std_logic := '0'
	);
end entity wtaController;
architecture rtl of wtaController is

	type ctrlState_type is (idle_s, noisePrep_s, noiseReadout_s stimPrep_s, stimRun_s, stimReadout_s);
	signal ctrlState                   : ctrlState_type        := idle_s;
	signal ctrlStart_del,sampNoise_del : boolean               := false;
	signal scanDone                    : boolean               := false;
	signal timerCnt                    : unsigned(31 downto 0) := (others => '0');
	signal adcBusy_del                 : std_logic             := '0';
begin

	ctrlState_seq : process (dwaClk100)
	begin
		if rising_edge(dwaClk100) then
			scanDone          <= (freqSet > fromDaqReg.noiseFreqMax) when noiseReadoutBusy else (freqSet > fromDaqReg.stimFreqMax);
			toDaqReg.ctrlBusy <= true;
			ctrlStart_del     <= fromDaqReg.ctrlStart;
			adcBusy_del       <= adcBusy;
			adcStart          <= '0';
			sendRunHdr        <= false;
			sendAdcData       <= false;

			if fromDaqReg.reset then
				ctrlState <= idle_s;
			else

				case (ctrlState) is

					when idle_s => --test is done and set freq to the beginning
						toDaqReg.ctrlBusy <= false;
						sampNoise_del     <= fromDaqReg.sampNoise;
						noiseReadoutBusy  <= false;
						timerCnt          <= x"00000000";
						--turn off stimulus 
						acStim_enable <= '0';

						if fromDaqReg.ctrlStart and not ctrlStart_del then
							freqSet    <= fromDaqReg.stimFreqMin;
							ctrlState  <= stimPrep_s;
							sendRunHdr <= true; --send run header at start of test.

						elsif fromDaqReg.sampNoise and not sampNoise_del then
							noiseReadoutBusy <= true; -- only count 
							freqSet          <= fromDaqReg.noiseFreqMin;
							ctrlState        <= noisePrep_s;
						end if;

					when noisePrep_s =>                 --wait a bit for the divison to update and check FIFOs are not almost full
						if timerCnt <= x"00000020" then --give at least 32 clocks for division to happen
							timerCnt <= timerCnt +1;    -- only count 
						else
							adcStart  <= '1';
							timerCnt  <= x"00000000";
							ctrlState <= noiseReadout_s;
						end if;

					when noiseReadout_s => --wait a bit for the divison to update and check FIFOs are not almost full
						                   -- wait for falling edge of adcBusy;
						if adcBusy = '0' and adcBusy_del = '1' then
							if scanDone then
								noiseReadoutBusy <= false; -- only count 
								ctrlState        <= idle_s;
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
							adcStart  <= '1';
						end if;

					when stimReadout_s =>
						-- wait for falling edge of adcBusy;
						if adcBusy = '0' and adcBusy_del = '1' then
							sendAdcData <= true;
							if scanDone then
								ctrlState <= idle_s;
							else
								freqSet   <= freqSet+fromDaqReg.stimFreqStep;
								ctrlState <= stimPrep_s;
							end if;
						end if;

					when others =>
						ctrlState <= idle_s;
						null;
				end case;
			end if;
		end if;
	end process ctrlState_seq;
end architecture rtl;