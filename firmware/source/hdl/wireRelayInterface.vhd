
-- Title       : DAC wireRelayInterface
-- Project     : 

-- File        : 
-- Author      : 
-- Company     : 
-- Created     : 

-- Platform    : 
-- Standard    : 

-- Description: Interface the wire relay  DAQ registers to the serial shift / Parallel converter.

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;
-- Custom libraries and packages:
library duneDwa;
use duneDwa.global_def.all;

entity wireRelayInterface is
	port (
		fromDaqReg : in  fromDaqRegType;
		toDaqReg   : out toDaqRegType;

		sdi : in  std_logic_vector(3 downto 0) := (others => '0');
		sdo : out std_logic                    := '0';

		rck     : out std_logic_vector(3 downto 0) := (others => '0');
		g_b     : out std_logic_vector(3 downto 0) := (others => '0');
		sck     : out std_logic_vector(3 downto 0) := (others => '0');
		srclr_b : out std_logic_vector(3 downto 0) := (others => '0');

		dwaClk10 : in std_logic := '0'
	);
end entity wireRelayInterface;

architecture STRUCT of wireRelayInterface is

	COMPONENT ila_4x32
		PORT (
			clk : IN STD_LOGIC;

			probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			probe2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			probe3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT ;

	type relayCfgState_type is (idle_s, shiftBitsIn_s, loadParallelReg_s, shiftBitsOut_s, loadDaqReg_s);
	signal relayCfgState : relayCfgState_type := idle_s;

	signal shiftReg     : std_logic_vector(31 downto 0);
	signal serialString : SLV_VECTOR_TYPE(3 downto 0)(31 downto 0) := (others => (others => '0')
	);
	signal shiftCnt : unsigned(7 downto 0)         := (others => '0');
	signal clkEn    : std_logic                    := '0';
	signal update   : std_logic_vector(1 downto 0) := (others => '0');
begin

	serStreamGen : for stream_i in 3 downto 0 generate

		ODDR_SCK : ODDR
			generic map(
				DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
				INIT         => '0',             -- Initial value for Q port ('1' or '0')
				SRTYPE       => "SYNC")          -- Reset Type ("ASYNC" or "SYNC")
			port map (
				Q  => sck(stream_i), -- 1-bit DDR output
				C  => dwaClk10,      -- 1-bit clock input
				CE => '1',           -- 1-bit clock enable input
				D1 => '0',
				D2 => clkEn,
				R  => '0', -- 1-bit reset input
				S  => '0'  -- 1-bit set input
			);

	end generate serStreamGen;

	--srclr_b, g_bnot used;
	srclr_b <= (others => '1');
	g_b     <= (others => '0');
	-- Make serial string from registers
	serialString(0) <= fromDaqReg.coildrive;
	update(0)       <= '0' when fromDaqReg.coildrive = toDaqReg.coildrive else '1';
	sdo             <= shiftReg(shiftReg'left);

	relayCfgState_seq : process (dwaClk10)
	begin
		if rising_edge(dwaClk10) then
			--default 
			rck           <= (others => '0');
			clkEn         <= '0';
			-- make registers for address 1 a priority
			shiftReg <= shiftReg(shiftReg'left-1 downto 0) & sdi(0) when clkEn else shiftReg;
			case (relayCfgState) is

				when idle_s =>
					shiftCnt <= x"1F"; --number of bits to  shift
					if update(0) /= '0' then
						shiftReg <= serialString(0);
						relayCfgState <= shiftBitsIn_s;
					end if;

				when shiftBitsIn_s =>
					clkEn    <= '1';
					shiftCnt <= shiftCnt -1;
					if shiftCnt = 0 then --busy shifting, come back later if you want to update
						relayCfgState <= loadParallelReg_s;
					end if;

				when loadParallelReg_s =>
					rck           <= (others => '1'); -- load after 36 bits are shifted
					shiftCnt      <= x"1F";           --number of bits to  shift
					relayCfgState <= shiftBitsOut_s;

				when shiftBitsOut_s =>
					clkEn    <= '1';
					shiftCnt <= shiftCnt -1;
					if shiftCnt = 0 then
						relayCfgState <= loadDaqReg_s;
					end if;

				when loadDaqReg_s =>
					if clkEn = '0' then -- wait for last bit to be shifted in
						toDaqReg.coildrive <= shiftReg(31 downto 0);
						relayCfgState      <= idle_s;
					-- added explicit default state instead
					-- else
					-- 	relayCfgState <= loadDaqReg_s; -- Xilinx is adding the iSTATE?? after the loaddaqreg_s??
					end if;

				when others =>
					relayCfgState <= idle_s;
			end case;
		end if;
	end process relayCfgState_seq;

	ila_4x32_inst : ila_4x32
		PORT MAP (
			clk => dwaClk10,

			probe0              => (others => '0'),
			probe1(31 downto 6) => (others => '0'),
			probe1(5)           => update(0),
			probe1(4)           => Sdi(0),
			probe1(3)           => Sdo,
			probe1(2)           => rck(0),
			probe1(1)           => update(0),
			probe1(0)           => clkEn,
			probe2              => (others => '0'),
			probe3              => (others => '0')
		);

end architecture STRUCT;
