
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

Library xpm;
use xpm.vcomponents.all;

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

		relayConfigError  : out std_logic := '0';
		relayLockoutError : out std_logic := '0';
		regClk            : in  std_logic := '0';
		dwaClk2           : in  std_logic := '0'
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

	type daqRegState_type is (idle_s, validateConfig_s, startSerTxRx_s, waitForDone_s, verifyTxRx_s, shiftBitsOut_s);
	type relayCfgState_type is (idle_s, configCheck_s, updateSerialOut_s, shiftBitsIn_s, loadParallelReg_s, shiftBitsOut_s, waitToEnable_s, waitToShiftOut_s);
	signal daqRegState                                : daqRegState_type   := idle_s;
	signal relayCfgState                              : relayCfgState_type := idle_s;
	signal updateRequest_regClk,updateRequest_dwaClk2 : std_logic          := '0';
	signal updateBusy_regClk,updateBusy_dwaClk2       : std_logic          := '0';

	signal serialStringOut : std_logic_vector(191 downto 0);
	signal shiftRegOut     : std_logic_vector(191 downto 0);
	signal shiftRegIn      : SLV_VECTOR_TYPE(3 downto 0)(63 downto 0);

	signal shiftCnt  : unsigned(7 downto 0)  := (others => '0');
	signal stringCnt : unsigned(1 downto 0)  := (others => '0');
	signal waitCnt   : unsigned(15 downto 0) := (others => '0');

	signal regDiff        : std_logic_vector(11 downto 0)                := (others => '0');
	signal clkEn          : std_logic_vector(3 downto 0)                 := (others => '0');
	signal checkRegEq     : boolean                                      := false;
	constant stringLength : UNSIGNED_VECTOR_TYPE(3 downto 0)(7 downto 0) := (
			x"3F",
			x"1F",
			x"3F",
			x"1F"
		);

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

	-- Coordinate the relay configuration and error checking process.
	relayConfigCtrl : process (regClk)
		variable relayBusAll : std_logic_vector(63 downto 0);
	begin
		if rising_edge(regClk) then
			-- default
			updateRequest_regClk <= '0';
			-- pick out relay bus coil bits in order, use latched serial string data
			relayBusAll := (serialStringOut(191 downto 160) & (serialStringOut(95 downto 64)));
			-- boil down all register difference bits into one error bit
			relayConfigError <= or(regDiff);

			-- interface to the DAQ registers that are used to configure the wire relays
			case(daqRegState) is
				when idle_s =>
					if fromDaqReg.relayUpdate then                                                 -- latch configuration values, assign to serial string
						serialStringOut <= fromDaqReg.relayBusBot(1) & fromDaqReg.relayBusBot(0) & --
							fromDaqReg.relayWireBot(3) & fromDaqReg.relayWireBot(2) & fromDaqReg.relayWireBot(1) & fromDaqReg.relayWireBot(0) &
							fromDaqReg.relayBusTop(1) & fromDaqReg.relayBusTop(0) &
							fromDaqReg.relayWireTop(3) & fromDaqReg.relayWireTop(2) & fromDaqReg.relayWireTop(1) & fromDaqReg.relayWireTop(0);
						daqRegState <= validateConfig_s;
					end if;

				when validateConfig_s =>
					-- Lock out configurations that have two consecutive 1's in the bus relay coil drive
					if or(relayBusAll and (relayBusAll sll 1)) then -- invalid configuration, set relayLockout and go back to idle
						relayLockoutError <= '1';
						daqRegState       <= idle_s;
					else -- clear any existing lockout and initiate TxRx
						relayLockoutError <= '0';
						daqRegState       <= startSerTxRx_s;
					end if;

				when startSerTxRx_s =>
					updateRequest_regClk <= '1';
					if updateBusy_regClk then
						daqRegState <= waitForDone_s;
					end if;

				when waitForDone_s =>
					if not updateBusy_regClk then -- Update is finished, latch Rx serial string 
						shiftBusToDaq : for srb_i in 1 downto 0 loop
							toDaqReg.relayBusTop(srb_i) <= shiftRegIn(2)((16 * srb_i)+47 downto (16 * srb_i)+32);
							toDaqReg.relayBusBot(srb_i) <= shiftRegIn(0)((16 * srb_i)+47 downto (16 * srb_i)+32);
						end loop shiftBusToDaq;

						shiftWireToDaq : for srw_i in 3 downto 0 loop
							toDaqReg.relayWireTop(srw_i) <= shiftRegIn(3)((16 * srw_i)+15 downto (16 * srw_i));
							toDaqReg.relayWireBot(srw_i) <= shiftRegIn(1)((16 * srw_i)+15 downto (16 * srw_i));
						end loop shiftWireToDaq;

						daqRegState <= verifyTxRx_s;
					end if;

				when verifyTxRx_s => --  set register difference flags, this is used to report a configuration error
					checkBus : for srb_i in 1 downto 0 loop
						regDiff(srb_i)     <= '0' when toDaqReg.relayBusTop(srb_i) = fromDaqReg.relayBusTop(srb_i) else '1' ;
						regDiff(srb_i + 2) <= '0' when toDaqReg.relayBusBot(srb_i) = fromDaqReg.relayBusBot(srb_i) else '1' ;
					end loop checkBus;

					checkWire : for srw_i in 3 downto 0 loop
						regDiff(srw_i + 4) <= '0' when toDaqReg.relayWireTop(srw_i) = fromDaqReg.relayWireTop(srw_i) else '1' ;
						regDiff(srw_i + 8) <= '0' when toDaqReg.relayWireBot(srw_i) = fromDaqReg.relayWireBot(srw_i) else '1' ;
					end loop checkWire;

					daqRegState <= idle_s;
				when others =>
					daqRegState <= idle_s;
			end case;

		end if;
	end process relayConfigCtrl;

	-- clock domain crossing between 100 MHz register clock and 2MHz serial shift registers
	xpm_cdc_single_inst : xpm_cdc_single
		generic map (
			DEST_SYNC_FF   => 4, -- DECIMAL; range: 2-10
			INIT_SYNC_FF   => 0, -- DECIMAL; 0=disable simulation init values, 1=enable simulation init values
			SIM_ASSERT_CHK => 0, -- DECIMAL; 0=disable simulation messages, 1=enable simulation messages
			SRC_INPUT_REG  => 1  -- DECIMAL; 0=do not register input, 1=register input
		)
		port map (
			src_in  => updateRequest_regClk, -- 1-bit input: Input signal to be synchronized to dest_clk domain.
			src_clk => regClk,               -- 1-bit input: optional; required when SRC_INPUT_REG = 1

			dest_out => updateRequest_dwaClk2, -- 1-bit output: src_in synchronized to the destination clock domain. This output is registered.
			dest_clk => dwaClk2,               -- 1-bit input: Clock signal for the destination clock domain.
		);

	xpm_cdc_single_inst : xpm_cdc_single
		generic map (
			DEST_SYNC_FF   => 4, -- DECIMAL; range: 2-10
			INIT_SYNC_FF   => 0, -- DECIMAL; 0=disable simulation init values, 1=enable simulation init values
			SIM_ASSERT_CHK => 0, -- DECIMAL; 0=disable simulation messages, 1=enable simulation messages
			SRC_INPUT_REG  => 1  -- DECIMAL; 0=do not register input, 1=register input
		)
		port map (
			src_in  => updateBusy_dwaClk2, -- 1-bit input: Input signal to be synchronized to dest_clk domain.
			src_clk => dwaClk2,            -- 1-bit input: optional; required when SRC_INPUT_REG = 1

			dest_out => updateBusy_regClk, -- 1-bit output: src_in synchronized to the destination clock domain. This output is registered.
			dest_clk => regClk,            -- 1-bit input: Clock signal for the destination clock domain.
		);


	-- Serial data transfer between FPGA and external shift registers
	relayCfgState_seq : process (dwaClk2)
	begin
		if rising_edge(dwaClk2) then
			--default 
			rck                <= (others => '0');
			clkEn              <= (others => '0');
			updateBusy_dwaClk2 <= '1'; --  busy everywhere except idle state

			shiftRegOut <= shiftRegOut(shiftRegOut'left-1 downto 0) & '0' when clkEn /= "0000" else shiftRegOut;

			shiftInLoop : for sr_i in 3 downto 0 loop
				shiftRegIn(sr_i) <= shiftRegIn(sr_i)(shiftRegIn(sr_i)'left-1 downto 0) & sdi(sr_i) when clkEn(sr_i) else shiftRegIn(sr_i);
			end loop shiftInLoop;

			case (relayCfgState) is

				when idle_s =>
					waitCnt            <= (others => '0'); -- reset for next time
					updateBusy_dwaClk2 <= '0';
					shiftCnt           <= (others => '0'); --number of bits to  shift
					stringCnt          <= (others => '0');
					if updateRequest_dwaClk2 then
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
					rck      <= (others => '1'); -- load after all bits are shifted
					shiftCnt <= (others => '0'); --number of bits to  shift
					                             --relayCfgState <= shiftBitsOut_s;
					relayCfgState <= waitToShiftOut_s;

				when waitToShiftOut_s => -- Wait for 16ms before enabling relays,  break before make
					waitCnt <= waitCnt +1;
					if waitCnt = x"7D00" then             -- wait for any HV corruption to happen before readback
						                                  --if waitCnt = x"0007" then -- do not wait for noise before reading, the x"0007" is just bc it's lucky
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
