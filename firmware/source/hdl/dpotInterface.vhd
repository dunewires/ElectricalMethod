
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

	COMPONENT ila_4x32
		PORT (
			clk : IN STD_LOGIC;

			probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			probe2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			probe3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT ;

	type dpotState_type is (idle_s, shiftBitsIn_s, loadDpotReg_s, shiftBitsOut_s, loadDaqReg_s);
	signal dpotState : dpotState_type := idle_s;

	signal shiftReg     : std_logic_vector(35 downto 0);
	signal serialString : SLV_VECTOR_TYPE(1 downto 0)(35 downto 0) := (
			'1' & x"80" & '1' & x"80" & '1' & x"80" & '1' & x"80",
			'0' & x"80" & '0' & x"80" & '0' & x"80" & '0' & x"80"
	);
	signal shiftCnt        : unsigned(7 downto 0)         := (others => '0');
	signal clkEn,clkEn_del : std_logic                    := '0';
	signal writeReg        : std_logic                    := '0';
	signal update          : std_logic_vector(1 downto 0) := (others => '0');
	signal dwaClk2         : std_logic                    := '0';
begin

	BUFR_inst : BUFR
		generic map (
			BUFR_DIVIDE => "5",      -- Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8"
			SIM_DEVICE  => "7SERIES" -- Must be set to "7SERIES"
		)
		port map (
			O   => dwaClk2, -- 1-bit output: Clock output port
			CE  => '1',     -- 1-bit input: Active high, clock enable (Divided modes only)
			CLR => '0',     -- 1-bit input: Active high, asynchronous clear (Divided modes only)
			I   => dwaClk10 -- 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
		);

	ODDR_SCK : ODDR
		generic map(
			DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
			INIT         => '0',             -- Initial value for Q port ('1' or '0')
			SRTYPE       => "SYNC")          -- Reset Type ("ASYNC" or "SYNC")
		port map (
			Q  => sck,     -- 1-bit DDR output
			C  => dwaClk2, -- 1-bit clock input
			CE => '1',     -- 1-bit clock enable input
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

	dpotState_seq : process (dwaClk2)
	begin
		if rising_edge(dwaClk2) then
			--default 
			cs_b  <= '0';
			clkEn <= '0';
			-- make registers for address 1 a priority
			shiftReg <= shiftReg(shiftReg'left-1 downto 0) & sdi when clkEn else shiftReg;
			case (dpotState) is

				when idle_s =>
					shiftCnt <= x"23"; --number of bits to  shift
					if update /= "00" then
						-- dpot registers 1 are priority
						shiftReg  <= serialString(1) when update(1) else serialString(0);
						dpotState <= shiftBitsIn_s;
					end if;

				when shiftBitsIn_s =>
					clkEn    <= '1';
					shiftCnt <= shiftCnt -1;
					if shiftCnt = 0 then --busy shifting, come back later if you want to update
						dpotState <= loadDpotReg_s;
					end if;

				when loadDpotReg_s =>
					cs_b      <= '1';   -- load after 36 bits are shifted
					shiftCnt  <= x"23"; --number of bits to  shift
					dpotState <= shiftBitsOut_s;

				when shiftBitsOut_s =>
					clkEn    <= '1';
					shiftCnt <= shiftCnt -1;
					if shiftCnt = 0 then --busy shifting, come back later if you want to update
						dpotState <= loadDaqReg_s;
					end if;

				when loadDaqReg_s =>
					if clkEn = '0' then            -- wait for last bit to be shifted in
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
					end if;

				when others =>
					dpotState <= idle_s;
			end case;
		end if;
	end process dpotState_seq;

	ila_4x32_inst : ila_4x32
		PORT MAP (
			clk => dwaClk2,

			probe0              => (others => '0'),
			probe1(31 downto 6) => (others => '0'),
			probe1(5)           => update(1),
			probe1(4)           => Sdi,
			probe1(3)           => Sdo,
			probe1(2)           => Cs_b,
			probe1(1)           => update(0),
			probe1(0)           => clkEn,
			probe2              => (others => '0'),
			probe3              => (others => '0')
		);

end architecture STRUCT;
