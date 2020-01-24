
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

entity dpotInterface is
	port (
		dpotMag     : in SLV_VECTOR_TYPE(7 downto 0)(7 downto 0) := (others => (others => '0'));

		sdi   : out std_logic := '0';
		sdo  : out std_logic := '0';
		pr_b  : out std_logic := '0';
		cs_b : out std_logic := '0';
		sck  : out std_logic := '0';

		S_AXI_ACLK : in std_logic := '0';
		sysclk10  : in std_logic := '0'
	);
end entity dpotInterface;

architecture STRUCT of dpotInterface is
  
  signal
  signal shiftReg :std_logic_vector(35 downto 0)

begin
	ODDR_acStim : ODDR
		generic map(
			DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
			INIT         => '0',         -- Initial value for Q port ('1' or '0')
			SRTYPE       => "SYNC")      -- Reset Type ("ASYNC" or "SYNC")
		port map (
			Q  => DAC_CLK,    -- 1-bit DDR output
			C  => S_AXI_ACLK, -- 1-bit clock input
			CE => '1',        -- 1-bit clock enable input
			D1 => DAC_CLK_EN,
			D2 => '0',
			R  => '0', -- 1-bit reset input
			S  => '0'  -- 1-bit set input
		);

	-- load DAC on PS clock
	load_dac : process (S_AXI_ACLK)
	begin
		if rising_edge(S_AXI_ACLK) then
			acStim_mag_del <= acStim_mag;
			-- TEMP ALWAYS ENABLE
			DAC_CS_B   <= '0';
			DAC_CLK_EN <= '0';
			if acStim_mag /= acStim_mag_del then
				shiftCnt <= x"C";
			elsif shiftCnt /= 0 then
				DAC_CS_B   <= '0';
				DAC_CLK_EN <= '1';
				shiftCnt   <= shiftCnt -1;
			end if;
		end if;
	end process load_dac;

	DAC_SDI <= acStim_mag(to_integer(shiftCnt));

	make_ac_stim : process (sysclk200)
	begin
		if rising_edge(sysclk200) then
			acStim_periodCnt <= acStim_periodCnt +1;

			if acStim_periodCnt >= acStim_nPeriod then
				-- dont use the enable here to keep the filter working
				acStim(0)        <= not acStim(0) and acStim_enable;
				acStim_periodCnt <= (acStim_periodCnt'left downto 1 => '0', 0 => '1'); --x"000001";
			end if;
			-- need to add disable during dhift in
			acStim(3 downto 1) <= acStim(2 downto 0);
			DAC_LD_B           <= acStim(3) or not acStim(0);
			DAC_CLR_B          <= not acStim(3) or acStim(0);

		end if;
	end process make_ac_stim;

end architecture STRUCT;