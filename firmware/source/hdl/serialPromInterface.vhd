
-- Title       : DAC serialPromInterface
-- Project     : 

-- File        : 
-- Author      : 
-- Company     : 
-- Created     : 

-- Platform    : 
-- Standard    : 

-- Description: Interface the setial number and NV mem 
-- datasheet http://ww1.microchip.com/downloads/en/devicedoc/atmel-8870-seeprom-at24cs64-datasheet.pdf

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;
-- Custom libraries and packages:
library duneDwa;
use duneDwa.global_def.all;

entity serialPromInterface is
	port (
		fromDaqReg : in  fromDaqRegType;
		toDaqReg   : out toDaqRegType;

		snMemConfigWP : in std_logic := '1';
		snMemWPError  : out std_logic := '0';

		sda : inout std_logic := 'Z';

		scl : out std_logic := '1';

		dwaClk100 : in std_logic := '0';
		dwaClk10  : in std_logic := '0'
	);
end entity serialPromInterface;

architecture STRUCT of serialPromInterface is

	COMPONENT ila_4x32
		PORT (
			clk : IN STD_LOGIC;

			probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			probe2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			probe3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT ;

	type sdaState_t is (sdaIdle_s, sdaStart_s, sdaTxRx_s, sdaEnd_s);
	signal sdaState : sdaState_t := sdaIdle_s;

	type cmdState_t is (cmdIdle_s,cmdRead_s,cmdAddress_s,cmdWrite_s);
	signal cmdState,cmdStateNext : cmdState_t := cmdIdle_s;

	signal deviceAddr            : unsigned(6 downto 0)  := "1011000";
	signal serialAddress         : unsigned(12 downto 0) := '0' & x"800";
	signal shiftRegOut,serString : std_logic_vector(56 downto 0);
	signal shiftRegIn            : std_logic_vector(31 downto 0);

	signal bitCnt      : unsigned(3 downto 0) := (others => '0');
	signal wordCnt     : unsigned(7 downto 0) := (others => '0');
	signal nWord       : unsigned(7 downto 0) := (others => '0');
	signal nRxWord     : unsigned(7 downto 0) := (others => '0');
	signal waitCnt     : unsigned(7 downto 0) := (others => '0');
	signal stateDbg    : unsigned(7 downto 0) := (others => '0');
	signal startupSeq  : unsigned(3 downto 0) := (others => '0');
	signal stateDbgCmd : unsigned(1 downto 0) := (others => '0');

	signal clkCnt           : unsigned(4 downto 0) := (others => '0');
	signal serialCmdEnable  : std_logic            := '0';
	signal sdoEn, sdoEn_del : std_logic            := '0';
	signal shiftRegInEn     : std_logic            := '0';
	signal sclHold          : std_logic            := '1';
	signal sendStop         : std_logic            := '0';
	signal sdoStop          : std_logic            := '0';
	signal sdo,sdo_del      : std_logic            := '0';

	signal memAddr  : std_logic := '0';
	signal memRead  : std_logic := '0';
	signal memWrite : std_logic := '0';

	signal readBusy,readBusy_d, readStart,readDone      : std_logic := '0';
	signal writeBusy,writeBusy_d, writeStart ,writeDone : std_logic := '0';
	signal enaWrite : std_logic := '0';

	signal vioUpdate_del1,vioUpdate_del2 : std_logic := '0';
	signal initAddrStrb                  : std_logic := '0';
	signal initReadStrb                  : std_logic := '0';

	signal dummyWrite  : std_logic := '0';
	signal startupDone : std_logic := '0';
begin

	-- the strobe signals from the DAQ are dwaClk100, so we need to latch them
	updateCdcDC100 : process (dwaClk100)
	begin
		if rising_edge(dwaClk100) then

			if waitCnt /= (waitCnt'range => '1') then
				waitCnt <= waitCnt + 1; -- after power up wait for a bit
			end if;
			-- default
			initAddrStrb <= '1' when (waitCnt = (waitCnt'left downto 1 => '1', 0 => '0')) else '0'; --  get inital NV mem config at power up
			initReadStrb <= '0';

			-- dwaClk10 to dwaClk100 pulse generation
			writeBusy_d <= writeBusy;
			writeStart  <= writeBusy and not writeBusy_d;
			writeDone   <= writeBusy_d and not writeBusy;
			readBusy_d  <= readBusy;
			readStart   <= readBusy and not readBusy_d;
			readDone    <= readBusy_d and not readBusy;

			--track auto increment of address
			toDaqReg.serNumMemAddress <= serialAddress;

			if readDone then

				if not startupDone then --  read operation was initiated as part ofstartup sequence, let's set the configuraiton
					case (startupSeq) is
						when x"0" => -- first read is hard coded serial number
							toDaqReg.serNum <= unsigned(shiftRegIn(23 downto 0));
							deviceAddr      <= "1010000";       --after we are here once switch device address to memory;
							serialAddress   <= (others => '0'); -- set to first init address
							initAddrStrb    <= '1';             -- update mem address pointer to 0
							startupSeq      <= startupSeq +1;

						when x"1" =>
							toDaqReg.serNumLocal <= shiftRegIn; --use for NW
							startupSeq           <= startupSeq +1;
							initReadStrb         <= '1';

						when x"2" =>
							toDaqReg.ipLocal <= shiftRegIn; --use for NW
							startupSeq       <= startupSeq +1;
							initReadStrb     <= '1';

						when x"3" =>
							toDaqReg.macUword <= shiftRegIn; --use for NW
							startupSeq        <= startupSeq +1;
							initReadStrb      <= '1';

						when x"4" =>
							toDaqReg.macLword <= shiftRegIn; --use for NW
							startupDone       <= '1';        -- do it once
						when others =>
							null;
					end case;


				else
					-- setting the address will read the data and update the data register
					-- the mem address pointer will be incremented but the serialAddress will
					-- only increment on reads and writes
					-- serialAddress is only used for write operations and contents accessible via DAQ
					-- don't allow rollover to protected mem address to avoid potential corruption risk
					serialAddress          <= serialAddress + 4 when (dummyWrite = '0' and serialAddress < '1' & x"FFC") else serialAddress;
					toDaqReg.serNumMemData <= unsigned(shiftRegIn(31 downto 0)); -- tell the DWA
				end if;

			elsif writeDone then
				-- don't allow rollover to protected mem address to avoid potential corruption risk
				serialAddress <= serialAddress + 4 when (serialAddress < '1' & x"FFC") else serialAddress;

			elsif fromDaqReg.serNumMemAddrStrb then -- DAQ updated address
				serialAddress <= fromDaqReg.serNumMemAddress;
			end if;

			-- with a single read/write feedback, we can only have one read and write command request at a time
			-- Spec minimum time between commands

			memAddr <= (fromDaqReg.serNumMemAddrStrb or initAddrStrb or memAddr) and not readStart;
			-- latch memAddr dummy write operation until read is done
			dummyWrite <= (memAddr or dummyWrite) and not readDone;
			-- latch mem read and write daq strobes for slow FSM
			memRead      <= (fromDaqReg.serNumMemRead or initReadStrb or memRead) and not readStart;
			memWrite     <= (fromDaqReg.serNumMemWrite or memWrite) and (not writeStart or enaWrite);
			enaWrite     <= '1' when snMemConfigWP = '0' or serialAddress > '0' & x"03F" else '0'; -- first 64 bytes can be protected
			snMemWPError <= enaWrite and fromDaqReg.serNumMemWrite;      -- send error if we try to write to protected mem location

		end if;
	end process updateCdcDC100;

	commandSequence : process (all)
	begin
		--sequence of operations for command
		case (cmdState) is
			when cmdIdle_s       =>
				serString <= (others => '0');

				if memAddr then
					cmdStateNext <= cmdAddress_s; --automatic followed by read
				elsif memRead then
					cmdStateNext <= cmdRead_s;
				elsif memWrite then
					cmdStateNext <= cmdWrite_s;
				end if;

			when cmdAddress_s => --set address pointer and read register, address will be auto incremented
				                 -- serial string starts with 0 to generate start condition.
				                 -- device address is followed by r/w bit, set address uses a dummy write
				serString(56 downto 32) <= '0' & std_logic_vector(deviceAddr) & "0000" & std_logic_vector(serialAddress);
				serString(31 downto 0)  <= std_logic_vector(fromDaqReg.serNumMemData);
				nWord                   <= x"03"; -- 3 words
				nRxWord                 <= x"00"; -- write only
				cmdStateNext            <= cmdRead_s;

			when cmdRead_s => -- read auto incremented  register and so on
				serString(56 downto 48) <= '0' & std_logic_vector(deviceAddr) & '1';
				serString(47 downto 0)  <= (others => '0');
				nWord                   <= x"05"; -- 5 words
				nRxWord                 <= x"04"; -- 4 words are read
				cmdStateNext            <= cmdIdle_s;

			when cmdWrite_s =>
				serString(56 downto 32) <= '0' & std_logic_vector(deviceAddr) & "0000" & std_logic_vector(serialAddress);
				serString(31 downto 0)  <= std_logic_vector(fromDaqReg.serNumMemData);
				nWord                   <= x"07"; -- 7 words
				nRxWord                 <= x"00"; -- 0 words are read
				cmdStateNext            <= cmdIdle_s;

			when others =>
				-- go back to safety 
				serString    <= (others => '0');
				cmdStateNext <= cmdIdle_s;

		end case;

	end process commandSequence;

	serialCmdEnable <= '1' when clkCnt = "11111" else '0'; -- comb signal that can be use in two seq processes

	regulateClock : process (dwaClk10)
	begin
		if rising_edge(dwaClk10) then
			clkCnt <= clkcnt+1;

			if serialCmdEnable then -- on falling edge of serial clock (MSB of clkCnt)
				scl <= sclHold;     -- only clock low when enabled

			elsif clkCnt = "00100" then --delay for scl falling edge hold time
				                        -- use the sdoStop signal to create stop command
				sdo_del   <= sdo and not sdoStop;
				sdoEn_del <= sdoEn or sdoStop;

			elsif clkCnt = "01111" then -- rising edge of serial clock
				scl <= '1';

			end if;
		end if;
	end process;

	sedrialCmState_seq : process (dwaClk10)
	begin
		if rising_edge(dwaClk10) then
			if serialCmdEnable then -- process serial bits on serial clock 
				                    --default 
				sclHold   <= '0';
				sdoEn     <= '0';
				readBusy  <= '1' when cmdState = cmdRead_s else '0';  --single bit for cdc
				writeBusy <= '1' when cmdState = cmdWrite_s else '0'; --single bit for cdc

				shiftRegInEn <= '0';

				shiftRegIn <= shiftRegIn(shiftRegIn'left-1 downto 0) & sda when shiftRegInEn else shiftRegIn;

				case (sdaState) is

					when sdaIdle_s =>             --allow 1 dwaclkSer to disable any updating of serislStringOut
						sclHold  <= '1';          -- disable clock during idle
						sdoStop  <= sendStop;     -- when return to Idle state, send requested stop signal
						sendStop <= '0';          --Turn off send stop request;
						cmdState <= cmdStateNext; -- update to next command when not busy
						                          -- if the next state is a communication command go to the start state 
						                          -- need to use the "next" to allow comm state to update
						sdaState <= sdaIdle_s when cmdStateNext = cmdIdle_s else sdaStart_s;

					when sdaStart_s =>       --allow 1 dwaclkSer to disable any updating of serislStringOut
						bitCnt      <= x"9"; --9 clks /word with ack
						sdoEn       <= '1';  -- needed for start signal
						shiftRegOut <= serString;
						wordCnt     <= nWord; -- 7 words
						sendStop    <= '1' when (cmdState = cmdRead_s) or (cmdState = cmdWrite_s) else '0';
						sdaState    <= sdaTxRx_s;

					when sdaTxRx_s =>
						if bitCnt /= x"1" then -- shift bits out
							bitCnt       <= bitCnt - 1;
							sdoEn        <= bool2sl(wordCnt > nRxWord); --first bite is device address
							shiftRegOut  <= shiftRegOut(shiftRegOut'left-1 downto 0) & sda;
							shiftRegInEn <= readBusy; -- shift in lags shift out by 1 clock, use enable to offset
						else
							wordCnt <= wordCnt - 1;
							bitCnt  <= x"9";
							sdoEn   <= bool2sl(wordCnt <= nRxWord) and -- send ack during rx and receive during tx
								bool2sl(wordCnt /=x"01") and sendStop; --last word after read does not ack
							sdaState <= sdaIdle_s when wordCnt = x"01" else sdaState;

						end if;

					when others =>
						null;
				end case;
			end if;
		end if;
	end process sedrialCmState_seq;

	sdo <= shiftRegOut(shiftRegOut'left);
	sda <= '0' when sdoEn_del and not sdo_del else 'Z';

	stateDbgCmd <= to_unsigned(cmdState_t'POS(cmdState),stateDbgCmd'length);
	stateDbg    <= to_unsigned(sdaState_t'POS(sdaState),stateDbg'length);
	ila_4x32_inst10 : ila_4x32
		PORT MAP (
			clk                  => dwaClk10,
			probe0(31 downto 24) => std_logic_vector(serialAddress(7 downto 0)),
			probe0(23 downto 0)  => std_logic_vector(toDaqReg.serNum),
			probe1(31 downto 30) => std_logic_vector(stateDbgCmd),
			probe1(29)           => '0',
			probe1(28 downto 21) => std_logic_vector(wordCnt),
			probe1(20 downto 17) => std_logic_vector(bitCnt),
			probe1(16)           => memAddr,
			probe1(15)           => memRead,
			probe1(14)           => memRead,
			probe1(13)           => memWrite,
			probe1(12)           => dummyWrite,
			probe1(11)           => scl,
			probe1(10 downto 3)  => std_logic_vector(stateDbg),
			probe1(2)            => sda,
			probe1(1)            => sdoStop,
			probe1(0)            => sdo,
			probe2               => shiftRegOut(31 downto 0),
			probe3               => serString(31 downto 0)
		);

	ila_4x32_inst100 : ila_4x32
		PORT MAP (
			clk                  => dwaClk100,
			probe0(31 downto 17) => (others => '0'),
			probe0(16)           => enaWrite,
			probe0(15)           => snMemWPError,
			probe0(14 downto 11) => std_logic_vector(startupSeq),
			probe0(10)           => fromDaqReg.serNumMemRead,
			probe0(9)            => fromDaqReg.serNumMemAddrStrb,
			probe0(8)            => fromDaqReg.serNumMemWrite,
			probe0(7)            => writeDone,
			probe0(6)            => initReadStrb,
			probe0(5)            => initAddrStrb,
			probe0(4)            => startupDone,
			probe0(3)            => readDone,
			probe0(2)            => readStart,
			probe0(1)            => writeStart,
			probe0(0)            => writeDone,
			probe1               => (others => '0'),
			probe2               => (others => '0'),
			probe3               => (others => '0')
		);
end architecture STRUCT;
