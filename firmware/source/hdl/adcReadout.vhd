--------------------------------------------------------------------------------
-- Title       : <Title Block>
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : adcReadout.vhd
-- Author      : User Name <user.email@user.company.com>
-- Company     : User Company Name
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Tue Apr 21 17:59:50 2020
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

Library UNISIM;
use UNISIM.vcomponents.all;

entity adcReadout is
	port (
		start  : in std_logic := '0';
		enable : in std_logic := '0';

		adcCnv : out std_logic := '0';
		adcSck : out std_logic := '0';

		adcDataSerialDwa : in STD_LOGIC_VECTOR(3 downto 0);
		adcSrcSyncClkDwa : in std_logic := '0';

		dataParallel     : out SIGNED_VECTOR_TYPE_16(7 downto 0);
		dataParallelStrb : out std_logic := '0';

		busy      : out std_logic := '0';
		reset     : in  std_logic := '0';
		sysclk100 : in  std_logic := '0'
	);
end entity adcReadout;
architecture rtl of adcReadout is

	type ctrlState_type is (idle_s, adcCnvStart_s, adcCnvWait_s, adcReadout_s,readoutDone_s, samplePeriod_s);
	signal ctrlState, ctrlState_next : ctrlState_type        := idle_s;
	signal sampleCnt                 : unsigned(7 downto 0)  := (others => '0');
	signal timerCnt                  : unsigned(11 downto 0) := (others => '0');
	signal start_del                 : std_logic             := '0';
	signal adcSckEnable              : std_logic             := '0';
	signal adcSckEnableEmu           : std_logic             := '0';
	signal readoutDone               : std_logic             := '0';
	signal dataParallelSsclk         : SIGNED_VECTOR4_TYPE;
	signal dataParallelSsclkEmu      : SIGNED_VECTOR4_TYPE;
	signal dataParallelSsclkDwa      : SIGNED_VECTOR4_TYPE;
	signal adcSrcSyncClkEmu          : std_logic := '0';
	signal adcSrcSyncClk             : std_logic := '0';
	signal adcSckEmu                 : std_logic := '0';
	signal adcDataSerialEmu          : STD_LOGIC_VECTOR(3 downto 0);

begin

	--ADC emulator
	adc_dds_io_inst : entity work.adc_dds_io
		port map (
			adcCnv => adcCnv,
			adcSck => adcSckEmu,

			adcDataSerial => adcDataSerialEmu,
			adcSrcSyncClk => adcSrcSyncClkEmu,

			sysclk100 => sysclk100
		);

	-- choose real DWA ADC or Emulator
	dataParallelSsclk <= dataParallelSsclkEmu when useAdcEmu else dataParallelSsclkDwa;
	adcSrcSyncClk     <= adcSrcSyncClkEmu     when useAdcEmu else adcSrcSyncClkDwa;

	--since the sclk can't be used internally we need to generate a version that can
	--delay the enable signal so it transitions after the falling sysclk100 edge
	--check the hold time to confirm glitch free operation. Wonder if Vivado will do this for me??
	--consider just using an enable signal instead of making the clock.
	shift_sclkEmu_enable : process (sysclk100)
	begin
		if falling_edge(sysclk100) then
			adcSckEnableEmu <= adcSckEnable;
		end if;
	end process shift_sclkEmu_enable;

	BUFGCE_sclkEmu : BUFGCE
		port map (
			O  => adcSckEmu,       -- 1-bit output: Clock output
			CE => adcSckEnableEmu, -- 1-bit input: Clock enable input for I0
			I  => sysclk100        -- 1-bit input: Primary clock
		);


		------------------------------------------------------------------------
	--nicely timed sclk signal for ADC
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
		-- latch data using selectIO
		IDDR_a : IDDR
			generic map (
				DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE", "SAME_EDGE"
				                                 -- or "SAME_EDGE_PIPELINED"
				INIT_Q1 => '0',                  -- Initial value of Q1      :       '0' or '1'
				INIT_Q2 => '0',                  -- Initial value of Q2      :       '0' or '1'
				SRTYPE  => "SYNC"
			) -- Set/Reset type         :       "SYNC" or "ASYNC"
			port map (
				Q1 => dataParallelSsclkDwa(adcSer_indx)(0), -- 1-bit output for positive edge of clock
				Q2 => open,                                 -- 1-bit output for negative edge of clock
				C  => adcSrcSyncClkDwa,                     -- 1-bit clock input
				CE => '1',                                  -- 1-bit clock enable input
				D  => adcDataSerialDwa(adcSer_indx),        -- 1-bit DDR data input
				R  => '0',                                  -- 1-bit reset
				S  => '0'                                   -- 1-bit set
			);
		-- shift in serial ADC data
		paraReg : process (adcSrcSyncClk)
		begin
			if rising_edge(adcSrcSyncClk) then
				dataParallelSsclkEmu(adcSer_indx) <= dataParallelSsclkEmu(adcSer_indx)(30 downto 0) & adcDataSerialEmu(adcSer_indx);
				--the LSB is clocked in by DDR
				dataParallelSsclkDwa(adcSer_indx)(31 downto 1) <= dataParallelSsclkDwa(adcSer_indx)(30 downto 0);
			end if;
		end process paraReg;

		-- clock domain crossing from source synchronous clock to FPGA system clock
		cdc : process (sysclk100)
		begin
			if rising_edge(sysclk100) then
				dataParallelStrb <= readoutDone;
				if readoutDone = '1' then
					-- also compatible with 16 bit ADC
					dataParallel(adcSer_indx * 2)        <= dataParallelSsclk(adcSer_indx)(31 downto 16);
					dataParallel((adcSer_indx * 2) + 1 ) <= dataParallelSsclk(adcSer_indx)(15 downto 0);
				end if;
			end if;
		end process cdc;

	end generate deserial_gen;

	-- ADC readout state machine
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
					if enable = '1' then
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