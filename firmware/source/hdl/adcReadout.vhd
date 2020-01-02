--------------------------------------------------------------------------------
-- Title       : <Title Block>
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : adcReadout.vhd
-- Author      : User Name <user.email@user.company.com>
-- Company     : User Company Name
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Thu Dec 19 19:40:38 2019
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
use UNISIM.all; 
use UNISIM.vcomponents.all; 

entity adcReadout is
	port (
		start  : in std_logic := '0';
		enable : in std_logic := '0';

		adcCnv        : out std_logic := '0';
		adcSck        : out std_logic := '0';
		adcDataSerial : in  STD_LOGIC_VECTOR(3 downto 0);

		dataParallel     : out UNSIGNED_VECTOR_TYPE(7 downto 0)(15 downto 0);
		dataParallelStrb : out std_logic := '0';

		busy          : out std_logic := '0';
		reset         : in  std_logic := '0';
		adcSrcSyncClk : in  std_logic := '0';
		sysclk100     : in  std_logic := '0'
	);
end entity adcReadout;
architecture rtl of adcReadout is

	type ctrlState_type is (idle_s, adcCnvStart_s, adcCnvWait_s, adcReadout_s,readoutDone_s, samplePeriod_s);
	signal ctrlState, ctrlState_next : ctrlState_type               := idle_s;
	signal adcDataSerial_reg         : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal sampleCnt                 : unsigned(7 downto 0)         := (others => '0');
	signal timerCnt                  : unsigned(11 downto 0)         := (others => '0');
	signal start_del                 : std_logic                    := '0';
	signal adcSckEnable              : std_logic                    := '0';
	signal readoutDone               : std_logic                    := '0';
	signal dataParallelSsclk         : UNSIGNED_VECTOR_TYPE(3 downto 0)(31 downto 0);

begin

	ODDR_acStim : ODDR
		generic map(
			DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
			INIT         => '0',         -- Initial value for Q port ('1' or '0')
			SRTYPE       => "SYNC")      -- Reset Type ("ASYNC" or "SYNC")
		port map (
			Q  => adcSck,    -- 1-bit DDR output
			C  => sysclk100, -- 1-bit clock input
			CE => '1',       -- 1-bit clock enable input
			D1 => adcSckEnable,
			D2 => '0',
			R  => '0', -- 1-bit reset input
			S  => '0'  -- 1-bit set input
		);
	deserial_gen : for adcSer_indx in 3 downto 0 generate

		IDDR_a : IDDR
			generic map (
				DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE", "SAME_EDGE"
				                                 -- or "SAME_EDGE_PIPELINED"
				INIT_Q1 => '0',                  -- Initial value of Q1      :       '0' or '1'
				INIT_Q2 => '0',                  -- Initial value of Q2      :       '0' or '1'
				SRTYPE  => "SYNC"
			) -- Set/Reset type         :       "SYNC" or "ASYNC"
			port map (
				Q1 => dataParallelSsclk(adcSer_indx)(0), -- 1-bit output for positive edge of clock
				Q2 => open,                              -- 1-bit output for negative edge of clock
				C  => adcSrcSyncClk,                     -- 1-bit clock input
				CE => '1',                               -- 1-bit clock enable input
				D  => adcDataSerial(adcSer_indx),        -- 1-bit DDR data input
				R  => '0',                               -- 1-bit reset
				S  => '0'                                -- 1-bit set
			);

		paraReg : process (adcSrcSyncClk)
		begin
			if rising_edge(adcSrcSyncClk) then
				dataParallelSsclk(adcSer_indx)(31 downto 1) <= dataParallelSsclk(adcSer_indx)(30 downto 0);
			end if;
		end process paraReg;

		cdc : process (sysclk100)
		begin
			if rising_edge(sysclk100) then
				dataParallelStrb                     <= readoutDone;
				if readoutDone then
					-- also compatible with 16 bit ADC
					dataParallel(adcSer_indx * 2)        <= dataParallelSsclk(adcSer_indx)(31 downto 16);
					dataParallel((adcSer_indx * 2) + 1 ) <= dataParallelSsclk(adcSer_indx)(15 downto 0);
				end if;
			end if;
		end process cdc;

	end generate deserial_gen;

	ctrlState_seq : process (sysclk100)
	begin
		if rising_edge(sysclk100) then
			--default 
			start_del    <= start;
			adcSckEnable <= '0';
			adcCnv       <= '0';
			busy         <= '1';
			readoutDone  <= '0';

			case (ctrlState) is

				when idle_s =>
					busy <= '0';
					--if start and not start_del then
					-- for now just freerun when enabled
					if enable then
						sampleCnt <= x"00";
						timerCnt  <= x"001";
						ctrlState <= adcCnvStart_s;
					end if;

				when adcCnvStart_s =>
					adcCnv <= '1';
					-- adcCnv high time 30 ns min
					if timerCnt = x"3" then
						timerCnt  <= x"001";
						ctrlState <= adcCnvWait_s;
					else
						timerCnt <= timerCnt+1;
					end if;

				when adcCnvWait_s =>
					--conversion time 450ns max
					if timerCnt = x"030" then
						timerCnt  <= x"001";
						ctrlState <= adcReadout_s;
					else
						timerCnt <= timerCnt+1;
					end if;

				when adcReadout_s =>
					--readout 12 bits
					adcSckEnable <= '1';
					if timerCnt = x"020" then
						timerCnt  <= x"001";
						ctrlState <= readoutDone_s;
						sampleCnt <= sampleCnt + 1;
					else
						timerCnt <= timerCnt+1;
					end if;

				when readoutDone_s =>
					readoutDone <= '1';
					ctrlState   <= samplePeriod_s;

				when samplePeriod_s =>
					--time between conversions 667ns min
					--007 is min, bd0 is like 33ks/s ??
					if timerCnt = x"bd0" then
						timerCnt <= x"001";
						--for now don't count the samples
						--if sampleCnt <= x"40" then
						ctrlState <= idle_s;
					--else
					--	ctrlState <= adcCnvStart_s;
					--end if;
					else
						timerCnt <= timerCnt+1;
					end if;

				when others =>
					ctrlState <= idle_s;
			end case;
		end if;
	end process ctrlState_seq;



end architecture rtl;