
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

		dwaClk100 : in std_logic := '0';
		dwaClk2   : in std_logic := '0'
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

	type relayCfgState_type is (idle_s, updateSerialOut_s, shiftBitsIn_s, loadParallelReg_s, shiftBitsOut_s, waitToEnable_s, waitToShiftOut_s);
	signal relayCfgState                                 : relayCfgState_type := idle_s;
	signal updateLatch,updateLatch_cdc1,updateLatch_cdc2 : boolean            := false;
	signal updateBusy,updateBusy_cdc1,updateBusy_cdc2    : boolean            := false;

	signal serialStringOut : std_logic_vector(191 downto 0);
	signal shiftRegOut     : std_logic_vector(191 downto 0);
	signal shiftRegIn      : SLV_VECTOR_TYPE(3 downto 0)(63 downto 0);

	signal shiftCnt  : unsigned(7 downto 0)  := (others => '0');
	signal stringCnt : unsigned(1 downto 0)  := (others => '0');
	signal waitCnt   : unsigned(15 downto 0) := (others => '0');

	signal clkEn : std_logic_vector(3 downto 0) := (others => '0');

	constant stringLength : UNSIGNED_VECTOR_TYPE(3 downto 0)(7 downto 0) := (
			x"3F",
			x"1F",
			x"3F",
			x"1F"
		);

	attribute ASYNC_REG                     : string;
	attribute ASYNC_REG of updateBusy_cdc1  : signal is "TRUE";
	attribute ASYNC_REG of updateBusy_cdc2  : signal is "TRUE";
	attribute ASYNC_REG of updateLatch_cdc1 : signal is "TRUE";
	attribute ASYNC_REG of updateLatch_cdc2 : signal is "TRUE";

begin

	serStreamGen : for str_i in 3 downto 0 generate

		ODDR_SCK : ODDR
			generic map(
				DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
				INIT         => '0',             -- Initial value for Q port ('1' or '0')
				SRTYPE       => "SYNC")          -- Reset Type ("ASYNC" or "SYNC")
			port map (
				Q  => sck(str_i), -- 1-bit DDR output
				C  => dwaClk2,    -- 1-bit clock input
				CE => '1',        -- 1-bit clock enable input
				D1 => '0',
				D2 => clkEn(str_i),
				R  => '0', -- 1-bit reset input
				S  => '0'  -- 1-bit set input
			);

	end generate serStreamGen;

	--srclr_b, g_bnot used;
	srclr_b <= (others => '1');
	-- Make serial string from registers
	-- Since Din is shared between all strings, make one long string

	sdo <= shiftRegOut(shiftRegOut'left);

	updateCdcDC100 : process (dwaClk100)
	begin
		if rising_edge(dwaClk100) then
			updateBusy_cdc1 <= updateBusy;
			updateBusy_cdc2 <= updateBusy_cdc1;

			-- only enable CDC data transfer when the update is not busy
			if not updateBusy_cdc2 then
				serialStringOut <= fromDaqReg.relayBusBot(1) & fromDaqReg.relayBusBot(0) & --
					fromDaqReg.relayWireBot(3) & fromDaqReg.relayWireBot(2) & fromDaqReg.relayWireBot(1) & fromDaqReg.relayWireBot(0) &
					fromDaqReg.relayBusTop(1) & fromDaqReg.relayBusTop(0) &
					fromDaqReg.relayWireTop(3) & fromDaqReg.relayWireTop(2) & fromDaqReg.relayWireTop(1) & fromDaqReg.relayWireTop(0);

				shiftBusToDaq : for srb_i in 1 downto 0 loop
					toDaqReg.relayBusTop(srb_i) <= shiftRegIn(2)((16 * srb_i)+47 downto (16 * srb_i)+32);
					toDaqReg.relayBusBot(srb_i) <= shiftRegIn(0)((16 * srb_i)+47 downto (16 * srb_i)+32);
				end loop shiftBusToDaq;

				shiftWireToDaq : for srw_i in 3 downto 0 loop
					toDaqReg.relayWireTop(srw_i) <= shiftRegIn(3)((16 * srw_i)+15 downto (16 * srw_i));
					toDaqReg.relayWireBot(srw_i) <= shiftRegIn(1)((16 * srw_i)+15 downto (16 * srw_i));
				end loop shiftWireToDaq;

				-- catch relayUpdate pulse
				updateLatch <= (fromDaqReg.relayUpdate or updateLatch);
			else
				--clear updateLatch when busy
				updateLatch <= false;
			end if;
		end if;
	end process updateCdcDC100;

	updateCdcDC2 : process (dwaClk2)
	begin
		if rising_edge(dwaClk2) then
			updateLatch_cdc1 <= updateLatch;
			updateLatch_cdc2 <= updateLatch_cdc1;
		end if;
	end process updateCdcDC2;

	relayCfgState_seq : process (dwaClk2)
	begin
		if rising_edge(dwaClk2) then
			--default 
			rck   <= (others => '0');
			clkEn <= (others => '0');

			shiftRegOut <= shiftRegOut(shiftRegOut'left-1 downto 0) & '0' when clkEn /= "0000" else shiftRegOut;

			shiftInLoop : for sr_i in 3 downto 0 loop
				shiftRegIn(sr_i) <= shiftRegIn(sr_i)(shiftRegIn(sr_i)'left-1 downto 0) & sdi(sr_i) when clkEn(sr_i) else shiftRegIn(sr_i);
			end loop shiftInLoop;

			case (relayCfgState) is

				when idle_s =>
						waitCnt       <= (others => '0'); -- reset for next time
					updateBusy <= false;
					shiftCnt   <= (others => '0'); --number of bits to  shift
					stringCnt  <= (others => '0');
					if updateLatch_cdc1 then
						updateBusy    <= true; --turn on update busy
						relayCfgState <= updateSerialOut_s;
						--turn off all relays when updating when enabled
						g_b <= (others => fromDaqReg.relayAutoBreakEna);
					end if;

				when updateSerialOut_s => --allow 1 dwaclk2 to disable any updating of serislStringOut
					shiftRegOut   <= serialStringOut;
					relayCfgState <= shiftBitsIn_s;

				when shiftBitsIn_s =>
					clkEn(to_integer(stringCnt)) <= '1';
					shiftCnt                     <= shiftCnt + 1;
					if shiftCnt = stringLength(to_integer(stringCnt)) then -- done with current string
						stringCnt <= stringCnt + 1;
						if stringCnt = 3 then -- we have finished last string
							relayCfgState <= loadParallelReg_s;
						else
							shiftCnt <= (others => '0');
						end if;

					end if;

				when loadParallelReg_s =>
					rck           <= (others => '1'); -- load after all bits are shifted
					shiftCnt      <= (others => '0'); --number of bits to  shift
					--relayCfgState <= shiftBitsOut_s;
					relayCfgState <= waitToShiftOut_s;

				when waitToShiftOut_s => -- Wait for 16ms before enabling relays,  break before make
					waitCnt <= waitCnt +1;
					--if waitCnt = x"7D00" then
					if waitCnt = x"0007" then -- do not wait for noise before reading, the x"0007" is just bc it's lucky
						waitCnt       <= (others => '0'); -- reset for next time
						relayCfgState <= shiftBitsOut_s;
					end if;

				when shiftBitsOut_s =>
					clkEn    <= (others => '1'); -- shift all four serial streams in at once
					shiftCnt <= shiftCnt + 1;
					if shiftCnt = 63 then -- longest serial register chain, we have everyone
						relayCfgState <= waitToEnable_s;
					end if;

				when waitToEnable_s => -- Wait for 16ms before enabling relays,  break before make
					waitCnt <= waitCnt +1;
					if waitCnt = x"7D00" then
						waitCnt       <= (others => '0'); -- reset for next time
						g_b           <= (others => '0');
						relayCfgState <= idle_s;
					end if;

				when others =>
					relayCfgState <= idle_s;

			end case;
		end if;
	end process relayCfgState_seq;

	ila_4x32_inst : ila_4x32
		PORT MAP (
			clk => dwaClk2,

			probe0               => (others => '0'),
			probe1(31 downto 14) => (others => '0'),
			probe1(13 downto 10) => sdi,
			probe1(9 downto 6)   => rck,
			probe1(5 downto 2)   => clkEn,
			probe1(1)            => sdo,
			probe1(0)            => bool2sl(fromDaqReg.relayUpdate),
			probe2               => (others => '0'),
			probe3               => (others => '0')
		);

end architecture STRUCT;
