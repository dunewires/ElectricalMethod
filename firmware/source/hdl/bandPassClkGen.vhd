--------------------------------------------------------------------------------
-- Title       : Bandpass filter clock generator
-- Project     : ATLAS, New Small Wheel, Micromegas Trigger Processor
--------------------------------------------------------------------------------
-- File        : bandPassClkGen.vhd
-- Author      : Nathan Felt felt@fas.harvard.edu
-- Company     : Harvard University LPPC
-- Created     : Thu Apr  8 16:50:15 2021
-- Last update : Thu Apr 15 11:44:22 2021
-- Platform    : DWA
-- Standard    : VHDL-2008
--------------------------------------------------------------------------------
-- Description: Generate the clock that sets the bandpass filter frequency. 
--------------------------------------------------------------------------------




library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;
-- Custom libraries and packages:
library duneDwa;
use duneDwa.global_def.all;

entity bandPassClkGen is
	port (
		bPClk_nHPeriod : in unsigned(31 downto 0) := (others => '0');

		bPClk : out std_logic;
		--regToDwa       : in SLV_VECTOR_TYPE_32(31 downto 0);
		dwaClk400 : in std_logic;
		dwaClk200 : in std_logic
	);
end bandPassClkGen;

architecture STRUCT of bandPassClkGen is
	-- With the odelay and DDR we have 32 X 2 = 64 phases.
	alias phaseStep : unsigned(5 downto 0) is bPClk_nHPeriod(6 downto 1);
	-- the portion after the point is done
	alias clk200Step                       : unsigned(30 downto 7) is bPClk_nHPeriod(30 downto 7);
	signal bPClk200,bPClk200Ph180,bPClk400 : std_logic             := '0';
	signal phaseShift180                   : std_logic             := '0';
	signal odlyLd                          : std_logic             := '0';
	signal odlyTap                         : unsigned(4 downto 0)  := (others => '0');
	signal bPClkPeriodCnt                  : unsigned(23 downto 0) := (others => '0');
	signal fineCount                       : unsigned(6 downto 0)  := (others => '0');
	alias phaseOF                          : std_logic is fineCount(6);
	signal phaseOFDone                     : std_logic := '0';

begin
	-- IDELAYE2: Input Fixed or Variable Delay Element
	-- 7 Series
	-- Xilinx HDL Language Template, version 2019.1
	IDELAYE2_inst1 : IDELAYE2
		generic map (
			CINVCTRL_SEL          => "FALSE",    -- Enable dynamic clock inversion (FALSE, TRUE)
			DELAY_SRC             => "DATAIN",   -- Delay input (IDATAIN, DATAIN)
			HIGH_PERFORMANCE_MODE => "FALSE",    -- Reduced jitter ("TRUE"), Reduced power ("FALSE")
			IDELAY_TYPE           => "VAR_LOAD", -- FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
			IDELAY_VALUE          => 0,          -- Input delay tap setting (0-31)
			PIPE_SEL              => "FALSE",    -- Select pipelined mode, FALSE, TRUE
			REFCLK_FREQUENCY      => 200.0,      -- IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
			SIGNAL_PATTERN        => "DATA"      -- DATA, CLOCK input signal
		)
		port map (
			CNTVALUEOUT => open,                      -- 5-bit output: Counter value output
			DATAOUT     => bPClk,                     -- 1-bit output: Delayed data output
			C           => dwaClk200,                 -- 1-bit input: Clock input
			CE          => '0',                       -- 1-bit input: Active high enable increment/decrement input
			CINVCTRL    => '0',                       -- 1-bit input: Dynamic clock inversion input
			CNTVALUEIN  => std_logic_vector(odlyTap), -- 5-bit input: Counter value input
			DATAIN      => bPClk400,                  -- 1-bit input: Internal delay data input
			IDATAIN     => '0',                       -- 1-bit input: Data input from the I/O
			INC         => '0',                       -- 1-bit input: Increment / Decrement tap delay input
			LD          => odlyLd,                    -- 1-bit input: Load IDELAY_VALUE input
			LDPIPEEN    => '0',                       -- 1-bit input: Enable PIPELINE register to load data input
			REGRST      => '0'                        -- 1-bit input: Active-high reset tap-delay input
		);
	-- use the 400 MHz clk to cover the second half of the clk 200 period
	phase180Gen : process (dwaClk400)
	begin
		if rising_edge(dwaClk200) then
			bPClk200Ph180 <= bPClk200;
			-- Keep this register to drive the idelay from a single source
			bPClk400 <= bPClk200Ph180 when phaseShift180 else bPClk200;
		end if;
	end process phase180Gen;

	-- End of ODDR_inst instantiation  
	make_ac_stimX200 : process (dwaClk200)
	begin
		if rising_edge(dwaClk200) then
			--default
			odlyLd <= '0';
			-- need the > to catch when the nPeriod decreases at the wrong time
			if bPClkPeriodCnt >= clk200Step then
				-- dont use the enable here to keep the filter working
				bPClk200 <= not bPClk200;

				bPClkPeriodCnt(bPClkPeriodCnt'left downto 1) <= (others => '0');
				-- reset counter to 1 except during fine phase overflow reset to 0 for 1 extra clock cycle
				bPClkPeriodCnt(0) <= not (phaseOF xor phaseOFDone);
				phaseOFDone       <= phaseOF;
			else
				-- Default Increment
				bPClkPeriodCnt <= bPClkPeriodCnt +1;
			end if;
			-- update the fine delay settings in between transitions of the bPClk signal
			if bPClkPeriodCnt = x"0000005" then
				fineCount     <= fineCount + phaseStep;
				odlyTap       <= fineCount(4 downto 0);
				phaseShift180 <= fineCount(5);
				odlyLd        <= '1';
			end if;

		end if;
	end process make_ac_stimX200;

end STRUCT;