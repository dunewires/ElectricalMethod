
-- Title       : DAC serialPromInterface
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

entity serialPromInterface is
	port (
		fromDaqReg : in  fromDaqRegType;
		toDaqReg   : out toDaqRegType;

		sda : inout std_logic := 'Z';

		scl : out std_logic := '1';

		vioUpdate : in std_logic := '0';

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

	signal serialCmd          : std_logic_vector(7 downto 0)  := x"B1";
	signal serialAddress      : std_logic_vector(23 downto 0) := x"B00800";
	signal shiftReg,serString : std_logic_vector(56 downto 0);

	signal bitCnt   : unsigned(3 downto 0) := (others => '0');
	signal wordCnt  : unsigned(7 downto 0) := (others => '0');
	signal nWord    : unsigned(7 downto 0) := (others => '0');
	signal nRxWord  : unsigned(7 downto 0) := (others => '0');
	signal waitCnt  : unsigned(7 downto 0) := (others => '0');
	signal stateDbg : unsigned(7 downto 0) := (others => '0');

	signal clkCnt           : unsigned(4 downto 0) := (others => '0');
	signal dwaClkSer        : std_logic            := '0';
	signal sdoEn, sdoEn_del : std_logic            := '0';
	signal sclHold          : std_logic            := '1';
	signal sNDone           : std_logic            := '0';
	signal sendStop         : std_logic            := '0';
	signal sdo,sdo_del      : std_logic            := '0';

	signal memRead, memRead_c1,memRead_c2    : std_logic := '0';
	signal memWrite, memWrite_c1,memWrite_c2 : std_logic := '0';

	signal cmdBusy, cmdBusy_c1,cmdBusy_c2    : std_logic := '0';
	signal memWriteDone, memWriteDone_c1,memWriteDone_c2 : std_logic := '0';

	signal updateLatch,updateLatch_cdc1,updateLatch_cdc2 : boolean := false;
	signal updateBusy,updateBusy_cdc1,updateBusy_cdc2    : boolean := false;

	attribute ASYNC_REG                    : string;
	attribute ASYNC_REG of memRead_c1      : signal is "TRUE";
	attribute ASYNC_REG of memRead_c2      : signal is "TRUE";
	attribute ASYNC_REG of memWrite_c1     : signal is "TRUE";
	attribute ASYNC_REG of memWrite_c2     : signal is "TRUE";
	attribute ASYNC_REG of cmdBusy_c1  : signal is "TRUE";
	attribute ASYNC_REG of cmdBusy_c2  : signal is "TRUE";

	signal vioUpdate_del1,vioUpdate_del2 : std_logic := '0';
	signal forceUpdate                   : std_logic := '0';
begin

	ODDR_SCK : ODDR
		generic map(
			DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
			INIT         => '0',             -- Initial value for Q port ('1' or '0')
			SRTYPE       => "SYNC")          -- Reset Type ("ASYNC" or "SYNC")
		port map (
			Q  => scl,       -- 1-bit DDR output
			C  => dwaClkSer, -- 1-bit clock input
			CE => '1',       -- 1-bit clock enable input
			D1 => sclHold,
			D2 => '1',
			R  => '0', -- 1-bit reset input
			S  => '0'  -- 1-bit set input
		);

	sdo <= shiftReg(shiftReg'left);
	sda <= '0' when sdoEn_del and not sdo_del else 'Z';

	commTiming : process (dwaClk10)
	begin
		if rising_edge(dwaClk10) then
			clkCnt <= clkcnt+1;
			if clkCnt = "10100" then --delay for scl falling edge hold time
				sdo_del   <= sdo;
				sdoEn_del <= sdoEn;
			end if;
		end if;
	end process commTiming;

		bufg_txfrm_bis : BUFG port map (
			I => clkCnt(4),
			O => dwaClkSer );


	updateCdcDC100 : process (dwaClk100)
	begin
		if rising_edge(dwaClk100) then
			cmdBusy_c1  <= cmdBusy;
			cmdBusy_c2  <= cmdBusy_c1;

			-- Spec minimum time between commands
			memRead  <= (fromDaqReg.serNummemRead or memRead) and not cmdBusy_c2;
			memWrite <= (fromDaqReg.serNummemWrite or memWrite)and not cmdBusy_c2;
		end if;
	end process updateCdcDC100;

	updateCdcDC2 : process (dwaClkSer)
	begin
		if rising_edge(dwaClkSer) then
			memRead_c1  <= memRead;
			memRead_c2  <= memRead_c1;
			memWrite_c1 <= memWrite;
			memWrite_c2 <= memWrite_c1;

			vioUpdate_del1 <= vioUpdate;
			vioUpdate_del2 <= vioUpdate_del1;

			if not sNDone then
				if waitCnt = (waitCnt'range => '1') then
					forceUpdate <= '1'; --  get serial number at power up, after some wait time 
					sNDone      <= '1';
				else
					waitCnt <= waitCnt + 1; -- after power up wait for a bit
				end if;
			else
				forceUpdate <= vioUpdate_del1 and not vioUpdate_del2;
			end if;
		end if;
	end process updateCdcDC2;

	sedrialCmState_seq : process (dwaClkSer)
	begin
		if rising_edge(dwaClkSer) then
			--default 
			sclHold <= '0';
			sdoEn   <= '0';


			case (sdaState) is

				when sdaIdle_s =>             --allow 1 dwaclkSer to disable any updating of serislStringOut
					sclHold  <= '1';          -- disable clock during idle
					sdoEn    <= sendStop;     -- turn off output
					sendStop <= '0';          --Turn off send stop request;
					cmdState <= cmdStateNext; -- update to next command when not busy
					                          -- if the next state is a communication command go to the start state 
					                          -- need to use the "next" to allow comm state to update
					sdaState <= sdaIdle_s when cmdStateNext = cmdIdle_s else sdaStart_s;

				when sdaStart_s =>    --allow 1 dwaclkSer to disable any updating of serislStringOut
					bitCnt   <= x"9"; --9 clks /word with ack
					sdoEn    <= '1';  -- needed for start signal
					shiftReg <= serString;
					wordCnt  <= nWord; -- 7 words
					sendStop <= '1' when (cmdState = cmdRead_s) or (cmdState = cmdWrite_s) else '0';
					sdaState <= sdaTxRx_s;

				when sdaTxRx_s =>
					if bitCnt /= x"1" then -- shift bits out
						bitCnt   <= bitCnt - 1;
						sdoEn    <= bool2sl(wordCnt > nRxWord); --first bite is device address
						shiftReg <= shiftReg(shiftReg'left-1 downto 0) & sda;
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
	end process sedrialCmState_seq;

	commandSequence : process (all)
	begin
		--default 
		cmdBusy <= '1'; -- disable any register updates while we are busy
		                    --sequence of operations for command
		case (cmdState) is
			when cmdIdle_s =>
				cmdBusy <= '0';
				if forceUpdate then
					cmdStateNext <= cmdAddress_s; --automatic followed by read
					elsif memRead then
					cmdStateNext <= cmdRead_s;
					elsif memWrite then
					cmdStateNext <= cmdWrite_s;
				end if;

			when cmdAddress_s =>
				serString(shiftReg'left downto (shiftReg'left - serialAddress'length)) <= '0' & serialAddress;
				nWord                                                                  <= x"03"; -- 3 words
				nRxWord                                                                <= x"00"; -- write only
				cmdStateNext                                                           <= cmdRead_s;

			when cmdRead_s =>
				serString(shiftReg'left downto (shiftReg'left - serialCmd'length )) <= '0' & serialCmd;  
				serString(31 downto 0)                                              <= (others => '0');
				nWord                                                               <= x"05"; -- 1 word
				nRxWord                                                             <= x"04"; -- 4 words are read
				cmdStateNext                                                        <= cmdIdle_s;

			when cmdWrite_s =>
				serString(shiftReg'left downto (shiftReg'left - serialCmd'length )) <= '0' & serialCmd;
				serString(31 downto 0)                                              <= (others => '0');
				nWord                                                               <= x"07"; -- 7 words
				nRxWord                                                             <= x"00"; -- 0 words are read
				cmdStateNext                                                        <= cmdIdle_s;

			when others =>
				null;
		end case;

	end process commandSequence;

	stateDbg <= to_unsigned(sdaState_t'POS(sdaState),stateDbg'length);
	ila_4x32_inst : ila_4x32
		PORT MAP (
			clk                  => dwaClk10,
			probe0               => (others => '0'),
			probe1(31 downto 12) => (others => '0'),
			probe1(11)           => forceUpdate,
			probe1(10 downto 3)  => std_logic_vector(stateDbg),
			probe1(2)            => sda,
			probe1(1)            => sclHold,
			probe1(0)            => sdo,
			probe2               => shiftReg(31 downto 0),
			probe3               => serString(31 downto 0)
		);

memWriteDone <= '0';
end architecture STRUCT;
