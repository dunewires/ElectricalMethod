
-- Title       : DAC dpotInterface
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
		mag : in SLV_VECTOR_TYPE(7 downto 0)(7 downto 0) := (others => (others => '0'));

		sdi  : out std_logic := '0';
		sdo  : out std_logic := '0';
		pr_b : out std_logic := '0';
		cs_b : out std_logic := '0';
		sck  : out std_logic := '0';
		shdn_b  : out std_logic := '0';

		sysClk10 : in std_logic := '0'
	);
end entity dpotInterface;

architecture STRUCT of dpotInterface is

	signal shiftReg                        : std_logic_vector(35 downto 0);
	signal serialString, serialStringLatch : SLV_VECTOR_TYPE(1 downto 0)(35 downto 0);
	signal shiftCnt : unsigned(3 downto 0) := (others => '0');

begin
	ODDR_SCK : ODDR
		generic map(
			DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
			INIT         => '0',         -- Initial value for Q port ('1' or '0')
			SRTYPE       => "SYNC")      -- Reset Type ("ASYNC" or "SYNC")
		port map (
			Q  => sck,      -- 1-bit DDR output
			C  => sysClk10, -- 1-bit clock input
			CE => '1',      -- 1-bit clock enable input
			D1 => clkEn,
			D2 => '0',
			R  => '0', -- 1-bit reset input
			S  => '0'  -- 1-bit set input
		);

	-- Make serial string from registers
	serialString(0) <= '0' & mag(3) &'0' & mag(2) &'0' & mag(1) &'0' & mag(0);
	serialString(1) <= '1' & mag(7) &'1' & mag(6) &'1' & mag(5) &'1' & mag(4);
	update(0) <= '0' when serialString(0) = serialStringLatch(0) else '1';
	update(1) <= '0' when serialString(1) = serialStringLatch(1) else '1';
	sdo <= (shiftReg'left);
	--pr_b,shdn_b not used;
	pr_b <= '1';
 	shdn_b <= '1';

	load_dac : process (sysClk10)
	begin
		if rising_edge(sysClk10) then
			cs_b  <= '1';
			clkEn <= '0';

			if shiftCnt /= 0 then --busy shifting, come back later if you want to update
				-- read back old contents, later route to registers or some kind of error checking
				shiftReg <= (shiftReg'left-1 downto 1) & sdi;
				cs_b     <= '0';
				clkEn    <= '1';
				shiftCnt <= shiftCnt -1;

			elsif or(update) then
				shiftReg <= serialString(to_integer(update(1)));
				--remember what we sent to determine if an update is needed
				serialStringLatch(to_integer(update(1))) <= serialString(to_integer(update(1)));
				shiftCnt                                 <= x"9";
			end if;
		end if;
	end process load_dac;

end architecture STRUCT;