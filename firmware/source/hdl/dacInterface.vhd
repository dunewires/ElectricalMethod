
-- Title       : DAC Interface
-- Project     : 

-- File        : 
-- Author      : 
-- Company     : 
-- Created     : 

-- Platform    : 
-- Standard    : 

-- Description: Set the Stimulus frequency by loading the DAC serial register and toggling the load and clear signals
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;
-- Custom libraries and packages:
library duneDwa;
use duneDwa.global_def.all;

entity dacInterface is
	port (
		acStim_mag         : in  unsigned(11 downto 0) := (others => '0');
		acStim_nPeriod_fp6 : in  unsigned(30 downto 0) := (others => '0');
		acStim_enable      : in  std_logic             := '0';
		acStim_trigger     : out std_logic             := '0';

		DAC_SDI   : out std_logic := '0';
		DAC_CS_B  : out std_logic := '0';
		DAC_LD_B  : out std_logic := '0';
		DAC_CLR_B : out std_logic := '0';
		DAC_CLK   : out std_logic := '0';

		dwaClk400 : in std_logic := '0';
		dwaClk200 : in std_logic := '0';
		dwaClk100 : in std_logic := '0';
		dwaClk10  : in std_logic := '0'
	);
end entity dacInterface;

architecture STRUCT of dacInterface is
	signal acStim_mag_del : unsigned(11 downto 0) := (others => '0');
	signal magShiftReg    : unsigned(11 downto 0) := (others => '0');
	signal shiftCnt       : unsigned(3 downto 0)  := (others => '0');
	signal DAC_CLK_EN     : std_logic             := '0';

	-- There is an extra bit of  precision for the accumulator
	-- This will give a more accurate frequency and allow the rising edge and falling edge to have different 78ps counts
	-- exact frequency not exact 50% duty cycle
	-- acStim_nPeriod_fp6 is shifted to fixed point 7 as we are defining half periods, ie the number of periods before a transition
	alias phaseStep : unsigned(6 downto 0) is acStim_nPeriod_fp6(6 downto 0);
	-- the portion after the point is done
	alias clk200Step                   : unsigned(23 downto 0) is acStim_nPeriod_fp6(30 downto 7); -- need 16 bits for min 10 HZ half period count with an extra bit for good luck :)
	signal stimClk200, stimClk200Ph180 : std_logic             := '0';
	signal stimClk100,stimClk100_del   : std_logic             := '0';
	signal phaseShift180               : std_logic             := '0';
	signal stimClkPeriodCnt            : unsigned(23 downto 0) := (others => '0');
	signal fineCount                   : unsigned(7 downto 0)  := (others => '0');
	alias phaseOF                      : std_logic is fineCount(7);
	signal phaseOFDone                 : std_logic := '0';
	signal DAC_LD_B_400, DAC_CLR_B_400           : std_logic := '0';
	signal odlyLd                          : std_logic             := '0';
	signal odlyTap                         : unsigned(4 downto 0)  := (others => '0');

	--length of stimClk400 vector determines pulse width
	signal stimClk400 : std_logic_vector(12 downto 0) := (others => '0');


begin
	ODDR_stimClk400 : ODDR
		generic map(
			DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
			INIT         => '0',         -- Initial value for Q port ('1' or '0')
			SRTYPE       => "SYNC")      -- Reset Type ("ASYNC" or "SYNC")
		port map (
			Q  => DAC_CLK,  -- 1-bit DDR output
			C  => dwaClk10, -- 1-bit clock input
			CE => '1',      -- 1-bit clock enable input
			D1 => DAC_CLK_EN,
			D2 => '0',
			R  => '0', -- 1-bit reset input
			S  => '0'  -- 1-bit set input
		);
	-- IDELAYE2: Input Fixed or Variable Delay Element
	-- 7 Series
	-- Xilinx HDL Language Template, version 2019.1
	IDELAYE2_DAC_LD_B : IDELAYE2
		generic map (
			CINVCTRL_SEL          => "FALSE",    -- Enable dynamic clock inversion (FALSE, TRUE)
			DELAY_SRC             => "DATAIN",   -- Delay input (IDATAIN, DATAIN)
			IDELAY_TYPE           => "VAR_LOAD", -- FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
			IDELAY_VALUE          => 0,          -- Input delay tap setting (0-31)
			PIPE_SEL              => "FALSE",    -- Select pipelined mode, FALSE, TRUE
			REFCLK_FREQUENCY      => 200.0,      -- IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
			SIGNAL_PATTERN        => "DATA"      -- DATA, CLOCK input signal
		)
		port map (
			CNTVALUEOUT => open,                      -- 5-bit output: Counter value output
			DATAOUT     => DAC_LD_B,                     -- 1-bit output: Delayed data output
			C           => dwaClk200,                 -- 1-bit input: Clock input
			CE          => '0',                       -- 1-bit input: Active high enable increment/decrement input
			CINVCTRL    => '0',                       -- 1-bit input: Dynamic clock inversion input
			CNTVALUEIN  => std_logic_vector(odlyTap), -- 5-bit input: Counter value input
			DATAIN      => DAC_LD_B_400,                  -- 1-bit input: Internal delay data input
			IDATAIN     => '0',                       -- 1-bit input: Data input from the I/O
			INC         => '0',                       -- 1-bit input: Increment / Decrement tap delay input
			LD          => odlyLd,                    -- 1-bit input: Load IDELAY_VALUE input
			LDPIPEEN    => '0',                       -- 1-bit input: Enable PIPELINE register to load data input
			REGRST      => '0'                        -- 1-bit input: Active-high reset tap-delay input
		);

	IDELAYE2_DAC_CLR_B : IDELAYE2
		generic map (
			CINVCTRL_SEL          => "FALSE",    -- Enable dynamic clock inversion (FALSE, TRUE)
			DELAY_SRC             => "DATAIN",   -- Delay input (IDATAIN, DATAIN)
			IDELAY_TYPE           => "VAR_LOAD", -- FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
			IDELAY_VALUE          => 0,          -- Input delay tap setting (0-31)
			PIPE_SEL              => "FALSE",    -- Select pipelined mode, FALSE, TRUE
			REFCLK_FREQUENCY      => 200.0,      -- IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
			SIGNAL_PATTERN        => "DATA"      -- DATA, CLOCK input signal
		)
		port map (
			CNTVALUEOUT => open,                      -- 5-bit output: Counter value output
			DATAOUT     => DAC_CLR_B,                     -- 1-bit output: Delayed data output
			C           => dwaClk200,                 -- 1-bit input: Clock input
			CE          => '0',                       -- 1-bit input: Active high enable increment/decrement input
			CINVCTRL    => '0',                       -- 1-bit input: Dynamic clock inversion input
			CNTVALUEIN  => std_logic_vector(odlyTap), -- 5-bit input: Counter value input
			DATAIN      => DAC_CLR_B_400,                  -- 1-bit input: Internal delay data input
			IDATAIN     => '0',                       -- 1-bit input: Data input from the I/O
			INC         => '0',                       -- 1-bit input: Increment / Decrement tap delay input
			LD          => odlyLd,                    -- 1-bit input: Load IDELAY_VALUE input
			LDPIPEEN    => '0',                       -- 1-bit input: Enable PIPELINE register to load data input
			REGRST      => '0'                        -- 1-bit input: Active-high reset tap-delay input
		);

	-- load DAC on PS slow clock 
	load_dac : process (dwaClk10)
	begin
		if rising_edge(dwaClk10) then
			acStim_mag_del <= acStim_mag;
			-- TEMP ALWAYS ENABLE
			DAC_CS_B   <= '0';
			DAC_CLK_EN <= '0';
			if acStim_mag /= acStim_mag_del then
				shiftCnt    <= x"C";
				magShiftReg <= acStim_mag;
			elsif shiftCnt /= 0 then
				DAC_CS_B    <= '0';
				DAC_CLK_EN  <= '1';
				shiftCnt    <= shiftCnt -1;
				magShiftReg <= magShiftReg(10 downto 0) & '0';
				DAC_SDI     <= magShiftReg(11);
			end if;
		end if;
	end process load_dac;

	-- count the number of clk200s needed between clock edges. 
	-- add one when the fine count overflows
	make_ac_stimX200 : process (dwaClk200)
	begin
		if rising_edge(dwaClk200) then
					--default
			odlyLd <= '0';
			-- need the > to catch when the nPeriod decreases at the wrong time
			if stimClkPeriodCnt >= clk200Step then
				-- previousy dont use the enable here to keep the filter working
				-- enable put back for the noise collection but we should check that it is on throughout the scan
				stimClk200 <= not stimClk200 when acStim_enable else '0';

				stimClkPeriodCnt(stimClkPeriodCnt'left downto 1) <= (others => '0');
				-- reset counter to 1 except during fine phase overflow reset to 0 for 1 extra clock cycle
				stimClkPeriodCnt(0) <= not (phaseOF xor phaseOFDone); -- pulse once every flip 0 to 1 and 1 to 0 
				phaseOFDone         <= phaseOF;
			else
				-- Default Increment
				stimClkPeriodCnt <= stimClkPeriodCnt +1;
			end if;
			-- update the fine delay settings in between transitions of the stimClk signal
			if stimClkPeriodCnt = x"000020" then
				fineCount     <= fineCount + phaseStep;
				phaseShift180 <= fineCount(6);
				-- fineCount 0 will allow duty cycle to be different by 78ps
				odlyTap       <= fineCount(5 downto 1);
				odlyLd        <= '1';
			end if;

		end if;
	end process make_ac_stimX200;

	-- use the 400 MHz clk to cover the second half of the clk 200 period
	phase180Gen : process (dwaClk400)
	begin
		if rising_edge(dwaClk400) then
			stimClk200Ph180 <= stimClk200;
			-- Keep this register to drive the idelay from a single source
			stimClk400(0) <= stimClk200Ph180 when phaseShift180 else stimClk200;
		end if;
	end process phase180Gen;

	-- stretch the 400 pulse to be long enough for the DAC 
	dacPulseGen : process (dwaClk400)
	begin
		if rising_edge(dwaClk400) then
			stimClk400(stimClk400'left downto 1) <= stimClk400(stimClk400'left-1 downto 0);
			--sync For ADC readout
			-- generate pulses with the required length, need > 10 ns pulse for 100 MHz rx
			DAC_LD_B_400  <= stimClk400(stimClk400'left) or not stimClk400(0);
			DAC_CLR_B_400 <= not stimClk400(stimClk400'left) or stimClk400(0);
		end if;
	end process dacPulseGen;

	-- generate a trigger signal that the ADC can use to sync to the stim freq
	-- the ADC has a resolution of 10 ns so this will only work with multiple of 10 ns frequency step size
	-- otherwise there will be aliasing 
	-- this trigger is currently only used for evaluation and not part of the DWA operation.  
	acStimTrig_gen : process (dwaClk100)
	begin
		if rising_edge(dwaClk100) then
			stimClk100     <= stimClk200;
			stimClk100_del <= stimClk100;
			-- pulse once on the rising edge.	
			acStim_trigger <= stimClk100 and not stimClk100_del;
		end if;
	end process acStimTrig_gen;

end architecture STRUCT;
