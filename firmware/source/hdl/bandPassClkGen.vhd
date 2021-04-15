--------------------------------------------------------------------------------
-- Title       : Bandpass filter clock generator
-- Project     : ATLAS, New Small Wheel, Micromegas Trigger Processor
--------------------------------------------------------------------------------
-- File        : bandPassClkGen.vhd
-- Author      : Nathan Felt felt@fas.harvard.edu
-- Company     : Harvard University LPPC
-- Created     : Thu Apr  8 16:50:15 2021
-- Last update : Wed Apr 14 21:37:39 2021
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
		fromDaqReg      : in  fromDaqRegType;
		toDaqReg        : out toDaqRegType;
		bPClk_nHPeriod : in  unsigned(31 downto 0) := (others => '0');

		bPClk : out std_logic;
		--regToDwa       : in SLV_VECTOR_TYPE_32(31 downto 0);
		dwaClk200 : in std_logic
	);
end bandPassClkGen;

architecture STRUCT of bandPassClkGen is
-- With the odelay and DDR we have 32 X 2 = 64 phases.
	alias phaseStep : unsigned(5 downto 0) is bPClk_nHPeriod(6 downto 1); 
	-- the portion after the point is done
	alias clk200Step : unsigned(30 downto 7) is bPClk_nHPeriod(30 downto 7); 
	signal bPClkOddr2,bPClkOddr1,bPClkOddr : std_logic             := '0';
	signal oddrFEdge : std_logic             := '0';
	signal odlyLd,odlyTap        : std_logic             := '0';
	signal phaseOF,phaseOFDone   : std_logic             := '0';
	signal bPClkPeriodCnt        : unsigned(23 downto 0) := (others => '0');
	signal fineCount             : unsigned(6 downto 0)  := (others => '0');

begin

	ODELAYE2_inst : ODELAYE2
		generic map (
			CINVCTRL_SEL          => "FALSE",    -- Enable dynamic clock inversion (FALSE, TRUE)
			DELAY_SRC             => "ODATAIN",  -- Delay input (ODATAIN, CLKIN)
			HIGH_PERFORMANCE_MODE => "FALSE",    -- Reduced jitter ("TRUE"), Reduced power ("FALSE")
			ODELAY_TYPE           => "VAR_LOAD", -- FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
			ODELAY_VALUE          => 0,          -- Output delay tap setting (0-31)
			PIPE_SEL              => "FALSE",    -- Select pipelined mode, FALSE, TRUE
			REFCLK_FREQUENCY      => 200.0,      -- IDELAYCTRL clock input frequency in MHz (190.0-210.0).
			SIGNAL_PATTERN        => "DATA"      -- DATA, CLOCK input signal
		)
		port map (
			CNTVALUEOUT => open,      -- 5-bit output: Counter value output
			DATAOUT     => bPClk,     -- 1-bit output: Delayed data/clock output
			C           => dwaClk200, -- 1-bit input: Clock input
			CE          => '0',       -- 1-bit input: Active high enable increment/decrement input
			CINVCTRL    => '0',       -- 1-bit input: Dynamic clock inversion input
			CLKIN       => '0',       -- 1-bit input: Clock delay input
			CNTVALUEIN  => odlyTap,   -- 5-bit input: Counter value input
			INC         => '0',       -- 1-bit input: Increment / Decrement tap delay input
			LD          => odlyLd,    -- 1-bit input: Loads ODELAY_VALUE tap delay in VARIABLE mode, in VAR_LOAD or
			                          -- VAR_LOAD_PIPE mode, loads the value of CNTVALUEIN
			LDPIPEEN => '0',          -- 1-bit input: Enables the pipeline register to load data
			ODATAIN  => bPClkOddr,    -- 1-bit input: Output delay data input
			REGRST   => '0'           -- 1-bit input: Active-high reset tap-delay input
		);

	ODDR_inst : ODDR
		generic map(
			DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
			INIT         => '0',         -- Initial value for Q port ('1' or '0')
			SRTYPE       => "SYNC")      -- Reset Type ("ASYNC" or "SYNC")
		port map (
			Q  => bPClkOddr,  -- 1-bit DDR output
			C  => dwaClk200,  -- 1-bit clock input
			CE => '1',        -- 1-bit clock enable input
			D1 => bPClkOddr1, -- 1-bit data input (positive edge)
			D2 => bPClkOddr2, -- 1-bit data input (negative edge)
			R  => '0',        -- 1-bit reset input
			S  => '0'         -- 1-bit set input
		);

	-- End of ODDR_inst instantiation  
	make_ac_stimX200 : process (dwaClk200)
		alias phaseOF : std_logic is fineCount(6);
	begin
		if rising_edge(dwaClk200) then
			--default
			odlyLd <= '0';
			-- need the > to catch when the nPeriod decreases at the wrong time
			if bPClkPeriodCnt >= clk200Step then
				-- dont use the enable here to keep the filter working
				bPClkOddr2 <= not bPClkOddr2;
				-- when bPClkOddr1 is inverted, the ODDR will send signal on the falling edge.
				bPClkOddr1                                   <= not bPClkOddr2 xor oddrFEdge;
				bPClkPeriodCnt(bPClkPeriodCnt'left downto 1) <= (others => '0');
				-- reset counter to 1 except during fine phase overflow reset to 0 for 1 extra clock cycle
				bPClkPeriodCnt(0) <= not phaseOF or phaseOFDone;
				phaseOFDone       <= phaseOF;
			else
				-- Default Increment
				bPClkPeriodCnt <= bPClkPeriodCnt +1;
			end if;
			-- update the fine delay settings in between transitions of the bPClk signal
			if bPClkPeriodCnt = x"0000005" then
				fineCount <= fineCount + phaseStep;
				odlyTap   <= fineCount(4 downto 0);
				oddrFEdge <= fineCount(5);
				odlyLd    <= '1';
			end if;

		end if;
	end process make_ac_stimX200;

end STRUCT;
