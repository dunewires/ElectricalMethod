--------------------------------------------------------------------------------
-- Title       : <Title Block>
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : wtaController.vhd
-- Author      : User Name <user.email@user.company.com>
-- Company     : User Company Name
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Thu May 14 01:12:32 2020
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

		--Headdata
		adcCnv_nCnv    : in unsigned(15 downto 0) := (others  =>  '0');
		adcCnv_nPeriod : in unsigned(23 downto 0)  := (others  =>  '0');
		acStim_nHPeriod : in unsigned(23 downto 0)  := (others  =>  '0');

		freqMin  : in unsigned(15 downto 0) := (others => '0');
		freqMax  : in unsigned(15 downto 0) := (others => '0');
		freqStep : in unsigned(15 downto 0) := (others => '0');

		stimTime : in unsigned(31 downto 0) := (others => '0');

		ctrlStart : in std_logic := '0';
		ctrlBusy : out std_logic                     := '0';

		freqSet       : out unsigned(31 downto 0) := (others => '1');
		acStim_enable : out std_logic             := '0';

		adcAutoDc_af       : in  std_logic_vector(7 downto 0) := (others => '0');
		headData : out std_logic_vector(15 downto 0)        := (others => '0');
		headDataStrb : out std_logic := '0';

		adcStart : out std_logic := '0';
		adcBusy  : in  std_logic := '0';
		adcDone  : in  std_logic := '0';

		reset    : in  std_logic                     := '0';
		status   : in  std_logic_vector(11 downto 0) := x"000";
		dwaClk100 : in std_logic := '0'
	);
end entity wtaController;
architecture rtl of wtaController is

	type ctrlState_type is (idle_s, stimPrep_s, sendHeadBegin_s, sendHeadAdc_s, stimRun_s, adcReadout_s);
	signal ctrlState        : ctrlState_type                      := idle_s;
	signal ctrlStart_del    : std_logic                           := '0';
	signal scanDone         : boolean                             := false;
	signal timerCnt         : unsigned(31 downto 0)               := (others => '0');
	signal headDataBeginCnt : unsigned(11 downto 0)               := (others => '0');
	signal headDataAdcCnt   : unsigned(11 downto 0)               := (others => '0');
	signal headDataBegin: slv_vector_type(7 downto 0)(15 downto 0) := (others => (others => '0'));
	signal headDataAdc: slv_vector_type(3 downto 0)(15 downto 0)   := (others => (others => '0'));

begin
	--header data sent at start of test
	headDataBegin(0) <= "1000" & std_logic_vector(headDataBeginCnt);
	headDataBegin(1) <= std_logic_vector(adcCnv_nCnv(15 downto 0));
	headDataBegin(2) <= std_logic_vector(freqMin);
	headDataBegin(3) <= std_logic_vector(freqMax);
	headDataBegin(4) <= std_logic_vector(freqStep);
	headDataBegin(5) <= std_logic_vector(stimTime(31 downto 16));
	headDataBegin(6) <= std_logic_vector(stimTime(15 downto 0));
	headDataBegin(7) <= "1001" & status;

	--header data sent at start of each freq setting
	headDataAdc(0) <= "1010" & std_logic_vector(headDataAdcCnt);
	headDataAdc(1) <= x"00" & std_logic_vector(adcCnv_nPeriod(23 downto 16));
	headDataAdc(2) <= std_logic_vector(adcCnv_nPeriod(15 downto 0));
	headDataAdc(3) <= "1011" & status;


	ctrlState_seq : process (dwaClk100)
	begin
		if rising_edge(dwaClk100) then
			scanDone               <= freqSet > (freqMax & x"0");
			headDataStrb <= '0';
			ctrlBusy               <= '1';
			ctrlStart_del          <= ctrlStart;
			adcStart               <= '0';
			if reset then
				ctrlState <= idle_s;
			else

				case (ctrlState) is

					when idle_s => --test is done and set freq to the beginning
						ctrlBusy <= '0';
						freqSet  <= x"000"& freqMin & x"0";
						timerCnt <= x"00000000";
						--turn off stimulus 
						acStim_enable <= '0';
						if ctrlStart = '1' and ctrlStart_del = '0' then
							ctrlState <= sendHeadBegin_s;
						end if;

					when sendHeadBegin_s =>  
						headDataStrb <= '1';                                                  -- write header info
						headData <= headDataBegin(to_integer(timerCnt(3 downto 0))); --limit header to 16 words
						timerCnt           <= timerCnt +1;                                     -- only count 
						if timerCnt >= headDataBegin'left then
							headDataBeginCnt <= headDataBeginCnt+1; -- count the number of scans
							timerCnt         <= x"00000000";
							ctrlState        <= stimPrep_s;
						end if;

					when stimPrep_s =>                                      --wait a bit for the divison to update and check FIFOs are not almost full
						if timerCnt <= x"00000020" then                     --give at least 32 clocks for division to happen
							timerCnt <= timerCnt +1;                        -- only count 
						elsif (adcAutoDc_af = x"00") and adcBusy = '0' then -- check fifos and adc is not in a readout
							timerCnt       <= x"00000000";
							ctrlState <= sendHeadAdc_s;
						end if;

					when sendHeadAdc_s =>                                                    -- write header info
						headDataStrb <= '1';                                                  -- write header info
						headData <= headDataAdc(to_integer(timerCnt(3 downto 0))); --limit header to 16 words
						timerCnt           <= timerCnt +1;                                   -- only count 
						if timerCnt >= headDataAdc'left then
							headDataAdcCnt <= headDataAdcCnt+1; -- count the number of scans
							timerCnt       <= x"00000000";
							ctrlState      <= stimRun_s;
						end if;

					when stimRun_s => -- count the number of clock cycles we stim before ADC readout
						timerCnt      <= timerCnt+1;
						acStim_enable <= '1';
						if timerCnt >= stimTime then
							timerCnt       <= x"00000000";
							ctrlState <= adcReadout_s;
							adcStart  <=  '1';
						end if;

					when adcReadout_s =>
						if adcDone then
							if scanDone then
								ctrlState <= idle_s;
							else
								freqSet   <= freqSet+freqStep;
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