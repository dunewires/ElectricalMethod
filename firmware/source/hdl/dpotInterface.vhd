
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
		fromDaqReg : in  fromDaqRegType;
		toDaqReg   : out toDaqRegType;

		sdi    : out std_logic := '0';
		sdo    : out std_logic := '0';
		pr_b   : out std_logic := '1';
		cs_b   : out std_logic := '1';
		sck    : out std_logic := '0';
		shdn_b : out std_logic := '0';

		sysClk10 : in std_logic := '0'
	);
end entity dpotInterface;

architecture STRUCT of dpotInterface is

	signal shiftReg                        : std_logic_vector(35 downto 0);
	signal serialString, serialStringLatch : SLV_VECTOR_TYPE(1 downto 0)(35 downto 0) := (
			'1' & x"80" & '1' & x"80" & '1' & x"80" & '1' & x"80",
			'0' & x"80" & '0' & x"80" & '0' & x"80" & '0' & x"80"
	);
	signal shiftCnt : unsigned(5 downto 0)         := (others => '0');
	signal clkEn,clkEn_del    : std_logic                    := '0';
	signal update   : std_logic_vector(1 downto 0) := (others => '0');
begin
	ODDR_SCK : ODDR
		generic map(
			DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
			INIT         => '0',             -- Initial value for Q port ('1' or '0')
			SRTYPE       => "SYNC")          -- Reset Type ("ASYNC" or "SYNC")
		port map (
			Q  => sck,      -- 1-bit DDR output
			C  => sysClk10, -- 1-bit clock input
			CE => '1',      -- 1-bit clock enable input
			D1 => '0',
			D2 => clkEn,
			R  => '0', -- 1-bit reset input
			S  => '0'  -- 1-bit set input
		);

	-- Make serial string from registers
	serialString(0) <= '0' & fromDaqReg.senseWireGain(3)
		&'0' & fromDaqReg.senseWireGain(2)
		&'0' & fromDaqReg.senseWireGain(1)
		&'0' & fromDaqReg.senseWireGain(0)
	;
	serialString(1) <= '1' & fromDaqReg.senseWireGain(7)
		&'1' & fromDaqReg.senseWireGain(6)
		&'1' & fromDaqReg.senseWireGain(5)
		&'1' & fromDaqReg.senseWireGain(4)
	;

	update(0) <= '0' when serialString(0) = serialStringLatch(0) else '1';
	update(1) <= '0' when serialString(1) = serialStringLatch(1) else '1';
	--pr_b,shdn_b not used;
	pr_b   <= '1';
	shdn_b <= '1';
	sdo    <= shiftReg(shiftReg'left);

	load_dac : process (sysClk10)
	begin
		if rising_edge(sysClk10) then
			clkEn_del <= clkEn;
			cs_b      <= '1';
			clkEn     <= '0';
			--shift only when enabled
			if clkEn then --in a shifting process
				shiftReg <= shiftReg(shiftReg'left-1 downto 0) & sdi;
			elsif clkEn_del then           --single clock when done , only do this once at end
				if shiftReg(35) = '1' then -- data is from address 1
					toDaqReg.senseWireGain(7) <= shiftReg(34 downto 27);
					toDaqReg.senseWireGain(6) <= shiftReg(25 downto 18);
					toDaqReg.senseWireGain(5) <= shiftReg(16 downto 9);
					toDaqReg.senseWireGain(4) <= shiftReg(7 downto 0);
				else
					toDaqReg.senseWireGain(3) <= shiftReg(34 downto 27);
					toDaqReg.senseWireGain(2) <= shiftReg(25 downto 18);
					toDaqReg.senseWireGain(1) <= shiftReg(16 downto 9);
					toDaqReg.senseWireGain(0) <= shiftReg(7 downto 0);
				end if;

			end if;

			if shiftCnt /= 0 then --busy shifting, come back later if you want to update
				cs_b     <= '0';
				clkEn    <= '1';
				shiftCnt <= shiftCnt -1;
			else
				-- if address 0 and 1 then 0 takes priority.
				if update(0) then
					shiftReg <= serialString(0);
					--remember what we sent to determine if an update is needed
					serialStringLatch(0) <= serialString(0);
					shiftCnt             <= to_unsigned(serialString(0)'length, shiftCnt'length); --number of bits to  shift
					address              <= '0';
				elsif update(1) then
					shiftReg <= serialString(1);
					--remember what we sent to determine if an update is needed
					serialStringLatch(1) <= serialString(1);
					shiftCnt             <= to_unsigned(serialString(1)'length, shiftCnt'length); --number of bits to  shift
					address              <= '1';
				end if;

			end if;
		end if;
	end process load_dac;

end architecture STRUCT;