
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
		acStim_mag     : in  unsigned(11 downto 0) := (others => '0');
		acStim_nPeriod : in  unsigned(24 downto 0) := (others => '0');
		acStim_enable  : in  std_logic             := '0';
		acStim_trigger : out std_logic             := '0';

		DAC_SDI   : out std_logic := '0';
		DAC_CS_B  : out std_logic := '0';
		DAC_LD_B  : out std_logic := '0';
		DAC_CLR_B : out std_logic := '0';
		DAC_CLK   : out std_logic := '0';

		dwaClk200 : in std_logic := '0';
		dwaClk10 : in std_logic := '0'
	);
end entity dacInterface;

architecture STRUCT of dacInterface is

	signal acStim_mag_del    : unsigned(11 downto 0)        := (others => '0');
	signal magShiftReg       : unsigned(11 downto 0)        := (others => '0');
	signal shiftCnt          : unsigned(3 downto 0)         := (others => '0');
	signal DAC_CLK_EN        : std_logic                    := '0';
	signal acStim_periodCnt  : unsigned(23 downto 0)        := (others => '0');
	--length of acStim vector determines pulse width
	signal acStim : std_logic_vector(12 downto 0) := (others => '0');


begin
	ODDR_acStim : ODDR
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

	make_ac_stim : process (dwaClk200)
	begin
		if rising_edge(dwaClk200) then
			acStim_periodCnt <= acStim_periodCnt +1;
			if acStim_periodCnt >= acStim_nPeriod(acStim_nPeriod'left downto 1) then  -- clock edge at half the period
				if not DAC_CLK_EN and acStim_enable then --also disable when updating magnitude
					acStim(0) <= not acStim(0);          -- flip
				end if;
				-- we are counting the exact number
				-- when LSb is 1 reset to 0 every other acStim 'flip'
				-- not exactly 50% duty cycle but 2x the resolution in frequency
				acStim_periodCnt <= (
				acStim_periodCnt'left downto 1 => '0', 
				0 => not (acStim_nPeriod(0) and acStim(0))
				); --
			end if;
			acStim(acStim'left downto 1) <= acStim(acStim'left-1 downto 0);
			--sync For ADC readout
			-- generate pulses with the required length, need > 10 ns pulse for 100 MHz rx
			acStim_trigger <= acStim(0) and not acStim(4); 
			DAC_LD_B       <= acStim(acStim'left) or not acStim(0);
			DAC_CLR_B      <= not acStim(acStim'left) or acStim(0);

		end if;
	end process make_ac_stim;

end architecture STRUCT;
