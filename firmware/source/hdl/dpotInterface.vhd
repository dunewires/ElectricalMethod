
-- Title       : DAC dpotInterface
-- Project     : 

-- File        : 
-- Author      : 
-- Company     : 
-- Created     : 

-- Platform    : 
-- Standard    : 

-- Description: set the digital pot and shift the setting back for conformation.
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

		sdi    : in  std_logic := '0';
		sdo    : out std_logic := '0';
		pr_b   : out std_logic := '1';
		cs_b   : out std_logic := '0';
		sck    : out std_logic := '0';
		shdn_b : out std_logic := '0';

		dwaClk10 : in std_logic := '0'
	);
end entity dpotInterface;

architecture STRUCT of dpotInterface is
	type dpotState_type is (idle_s, shiftBits_s, loadDaqReg_s);
	signal dpotState : dpotState_type := idle_s;

	signal shiftReg                        : std_logic_vector(35 downto 0);
	signal serialString, serialStringLatch : SLV_VECTOR_TYPE(1 downto 0)(35 downto 0) := (
			'1' & x"80" & '1' & x"80" & '1' & x"80" & '1' & x"80",
			'0' & x"80" & '0' & x"80" & '0' & x"80" & '0' & x"80"
	);
	signal shiftCnt        : unsigned(7 downto 0)         := (others => '0');
	signal clkEn,clkEn_del : std_logic                    := '0';
	signal writeReg        : std_logic                    := '0';
	signal update          : std_logic_vector(1 downto 0) := (others => '0');
begin
	ODDR_SCK : ODDR
		generic map(
			DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
			INIT         => '0',             -- Initial value for Q port ('1' or '0')
			SRTYPE       => "SYNC")          -- Reset Type ("ASYNC" or "SYNC")
		port map (
			Q  => sck,      -- 1-bit DDR output
			C  => dwaClk10, -- 1-bit clock input
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

	update(0) <= '0' when fromDaqReg.senseWireGain(3 downto 0) = toDaqReg.senseWireGain(3 downto 0) else '1';
	update(1) <= '0' when fromDaqReg.senseWireGain(7 downto 4) = toDaqReg.senseWireGain(7 downto 4) else '1';
	--pr_b,shdn_b not used;
	pr_b   <= '1';
	shdn_b <= '1';
	sdo    <= shiftReg(shiftReg'left);

	dpotState_seq : process (dwaClk10)
	begin
		if rising_edge(dwaClk10) then
			--default 
			cs_b  <= '0';
			clkEn <= '0';
			-- make registers for address 1 a priority
			shiftReg <= shiftReg(shiftReg'left-1 downto 0) & sdi when clkEn else shiftReg;
			case (dpotState) is

				when idle_s =>
					shiftCnt <= x"47"; --number of bits to  shift
					if update /= "00" then
						-- dpot registers 1 are priority
						shiftReg  <= serialString(1) when update(1) else serialString(0);
						dpotState <= shiftBits_s;
					end if;

				when shiftBits_s =>
					cs_b     <= '1' when shiftCnt = 34; -- load after 36 bits are shifted
					clkEn    <= '1';
					shiftCnt <= shiftCnt -1;
					if shiftCnt = 0 then --busy shifting, come back later if you want to update
						dpotState <= loadDaqReg_s;
					end if;

				when loadDaqReg_s =>
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
					dpotState <= idle_s;

				when others =>
					dpotState <= idle_s;
			end case;
		end if;
	end process dpotState_seq;

end architecture STRUCT;
