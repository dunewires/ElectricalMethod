----------------------------------------------------------------------------
--	GPIO_Demo.vhd -- Nexys4 GPIO/UART Demonstration Project
----------------------------------------------------------------------------
-- Author:  Marshall Wingerson Adapted from Sam Bobrowicz
--          Copyright 2013 Digilent, Inc.
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
--	The GPIO/UART Demo project demonstrates a simple usage of the Nexys4's 
--  GPIO and UART. The behavior is as follows:
--
--	      *The 16 User LEDs are tied to the 16 User Switches. While the center
--			 User button is pressed, the LEDs are instead tied to GND
--	      *The 7-Segment display counts from 0 to 9 on each of its 8
--        digits. This count is reset when the center button is pressed.
--        Also, single anodes of the 7-Segment display are blanked by
--	       holding BTNU, BTNL, BTND, or BTNR. Holding the center button 
--        blanks all the 7-Segment anodes.
--       *An introduction message is sent across the UART when the device
--        is finished being configured, and after the center User button
--        is pressed.
--       *A message is sent over UART whenever BTNU, BTNL, BTND, or BTNR is
--        pressed.
--       *The Tri-Color LEDs cycle through several colors in a ~4 second loop
--       *Data from the microphone is collected and transmitted over the mono
--        audio out port.
--       *Note that the center user button behaves as a user reset button
--        and is referred to as such in the code comments below
--        
--	All UART communication can be captured by attaching the UART port to a
-- computer running a Terminal program with 9600 Baud Rate, 8 data bits, no 
-- parity, and 1 stop bit.																
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
-- Revision History:
--  08/08/2011(SamB): Created using Xilinx Tools 13.2
--  08/27/2013(MarshallW): Modified for the Nexys4 with Xilinx ISE 14.4\
--  		--added RGB and microphone
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--The IEEE.std_logic_unsigned contains definitions that allow 
--std_logic_vector types to be used with the + operator to instantiate a 
--counter.
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity GPIO_demo is
    Port ( SW 			: in  STD_LOGIC_VECTOR (15 downto 0); --switch
           BTN 			: in  STD_LOGIC_VECTOR (4 downto 0);
           CLK 			: in  STD_LOGIC;
           --CLK2         : inout  STD_LOGIC;
           LED 			: out  STD_LOGIC_VECTOR (15 downto 0); --LED corresponding to each switch
           SSEG_CA 		: out  STD_LOGIC_VECTOR (7 downto 0);
           SSEG_AN 		: out  STD_LOGIC_VECTOR (7 downto 0);
           UART_TXD 	: out  STD_LOGIC;
           RGB1_Red		: out  STD_LOGIC;
           RGB1_Green	: out  STD_LOGIC;
           RGB1_Blue	: out  STD_LOGIC;	
           RGB2_Red		: out  STD_LOGIC;
           RGB2_Green	: out  STD_LOGIC;
           RGB2_Blue	: out  STD_LOGIC;
           vgaDetect      : in  STD_LOGIC_VECTOR (3 downto 0);
           vgaRed      : inout  STD_LOGIC_VECTOR (3 downto 0);
           vgaTime      : inout  STD_LOGIC_VECTOR (3 downto 0);
           Hsync        : inout STD_LOGIC;
           --Vsync        : out STD_LOGIC;
           micClk       : out STD_LOGIC;
           micLRSel     : out STD_LOGIC;
           micData      : in STD_LOGIC;
           ampPWM       : out STD_LOGIC;
           ampSD        : out STD_LOGIC;
           JA           : inout STD_LOGIC_VECTOR (1 downto 0) 		
           --reset        : inout STD_LOGIC;
           --locked        : inout STD_LOGIC	  
			  );
end GPIO_demo;

architecture Behavioral of GPIO_demo is

component UART_TX_CTRL
Port(
	SEND : in std_logic;
	DATA : in std_logic_vector(7 downto 0);
	CLK : in std_logic;          
	READY : out std_logic;
	UART_TX : out std_logic
	);
end component;

component debouncer
Generic(
        DEBNC_CLOCKS : integer;
        PORT_WIDTH : integer);
Port(
		SIGNAL_I : in std_logic_vector(4 downto 0);
		CLK_I : in std_logic;          
		SIGNAL_O : out std_logic_vector(4 downto 0)
		);
end component;

component RGB_controller 
Port(
	GCLK 			: in std_logic;
	GSW         : in std_logic_vector(7 downto 0);
	RGB_LED_1_O	: out std_logic_vector(2 downto 0);
	RGB_LED_2_O	: out std_logic_vector(2 downto 0)
	);
end component;


component VGA_controller
Port(
    VCLK        :in std_logic;
    VSW         :in std_logic_vector(7 downto 0);
    VGAR        :out std_logic_vector(3 downto 0);
    FOURTIME        :out std_logic_vector(3 downto 0);
    --DETECT        :in std_logic_vector(3 downto 0);
    DETECT        :in std_logic;
    HS          :out std_logic;
    --VS          :out std_logic
    TIMETAKEN   :out std_logic_vector(26 downto 0)
    );
end component;


COMPONENT ila_0

PORT (
	clk : IN STD_LOGIC;



	--probe0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	--probe1 : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
	--probe2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	probe0 : IN STD_LOGIC;
	probe1 : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
	probe2 : IN STD_LOGIC
);
END COMPONENT  ;


COMPONENT clk_wiz_0
PORT
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : OUT    STD_LOGIC;
  clk_out2          : out STD_LOGIC;
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic;
  clk_in1           : IN     STD_LOGIC
 );
end component;
--The type definition for the UART state machine type. Here is a description of what
--occurs during each state:
-- RST_REG     -- Do Nothing. This state is entered after configuration or a user reset.
--                The state is set to LD_INIT_STR.
-- LD_INIT_STR -- The Welcome String is loaded into the sendStr variable and the strIndex
--                variable is set to zero. The welcome string length is stored in the StrEnd
--                variable. The state is set to SEND_CHAR.
-- SEND_CHAR   -- uartSend is set high for a single clock cycle, signaling the character
--                data at sendStr(strIndex) to be registered by the UART_TX_CTRL at the next
--                cycle. Also, strIndex is incremented (behaves as if it were post 
--                incremented after reading the sendStr data). The state is set to RDY_LOW.
-- RDY_LOW     -- Do nothing. Wait for the READY signal from the UART_TX_CTRL to go low, 
--                indicating a send operation has begun. State is set to WAIT_RDY.
-- WAIT_RDY    -- Do nothing. Wait for the READY signal from the UART_TX_CTRL to go high, 
--                indicating a send operation has finished. If READY is high and strEnd = 
--                StrIndex then state is set to WAIT_BTN, else if READY is high and strEnd /=
--                StrIndex then state is set to SEND_CHAR.
-- WAIT_BTN    -- Do nothing. Wait for a button press on BTNU, BTNL, BTND, or BTNR. If a 
--                button press is detected, set the state to LD_BTN_STR.
-- LD_BTN_STR  -- The Button String is loaded into the sendStr variable and the strIndex
--                variable is set to zero. The button string length is stored in the StrEnd
--                variable. The state is set to SEND_CHAR.
type UART_STATE_TYPE is (RST_REG, LD_INIT_STR, SEND_CHAR, RDY_LOW, WAIT_RDY, WAIT_BTN, LD_BTN_STR);

--The CHAR_ARRAY type is a variable length array of 8 bit std_logic_vectors. 
--Each std_logic_vector contains an ASCII value and represents a character in
--a string. The character at index 0 is meant to represent the first
--character of the string, the character at index 1 is meant to represent the
--second character of the string, and so on.
type CHAR_ARRAY is array (integer range<>) of std_logic_vector(7 downto 0);

constant TMR_CNTR_MAX : std_logic_vector(26 downto 0) := "111011100110101100101000000"; --10,000,000,000 = clk cycles per second
constant TMR_VAL_MAX : std_logic_vector(3 downto 0) := "1111"; --9

constant RESET_CNTR_MAX : std_logic_vector(18 downto 0) := "0111101000010010000";-- 10,000,000,000 * 0.002 = 20,000,000 = clk cycles per 2 ms

constant MAX_STR_LEN : integer := 27;

constant WELCOME_STR_LEN : natural := 27;
constant BTN_STR_LEN : natural := 24;

--Welcome string definition. Note that the values stored at each index
--are the ASCII values of the indicated character.
constant WELCOME_STR : CHAR_ARRAY(0 to 26) := (X"0A",  --\n
															  X"0D",  --\r
															  X"4E",  --N
															  X"45",  --E
															  X"58",  --X
															  X"59",  --Y
															  X"53",  --S
															  X"34",  --4
															  X"20",  -- 
															  X"47",  --G
															  X"50",  --P
															  X"49",  --I
															  X"4F",  --O
															  X"2F",  --/
															  X"55",  --U
															  X"41",  --A
															  X"52",  --R
															  X"54",  --T
															  X"20",  -- 
															  X"44",  --D
															  X"45",  --E
															  X"4D",  --M
															  X"4F",  --O
															  X"21",  --!
															  X"0A",  --\n
															  X"0A",  --\n
															  X"0D"); --\r
															  
--Button press string definition.
constant BTN_STR : CHAR_ARRAY(0 to 23) :=     (X"42",  --B
															  X"75",  --u
															  X"74",  --t
															  X"74",  --t
															  X"6F",  --o
															  X"6E",  --n
															  X"20",  -- 
															  X"70",  --p
															  X"72",  --r
															  X"65",  --e
															  X"73",  --s
															  X"73",  --s
															  X"20",  --
															  X"64",  --d
															  X"65",  --e
															  X"74",  --t
															  X"65",  --e
															  X"63",  --c
															  X"74",  --t
															  X"65",  --e
															  X"64",  --d
															  X"21",  --!
															  X"0A",  --\n
															  X"0D"); --\r

--This is used to determine when the 7-segment display should be
--incremented
signal tmrCntr : std_logic_vector(26 downto 0) := (others => '0');

--This counter keeps track of which number is currently being displayed
--on the 7-segment.
signal tmrVal : std_logic_vector(3 downto 0) := (others => '0');

--Contains the current string being sent over uart.
signal sendStr : CHAR_ARRAY(0 to (MAX_STR_LEN - 1));

--Contains the length of the current string being sent over uart.
signal strEnd : natural;

--Contains the index of the next character to be sent over uart
--within the sendStr variable.
signal strIndex : natural;

--Used to determine when a button press has occured
signal btnReg : std_logic_vector (3 downto 0) := "0000";
signal btnDetect : std_logic;

--UART_TX_CTRL control signals
signal uartRdy : std_logic;
signal uartSend : std_logic := '0';
signal uartData : std_logic_vector (7 downto 0):= "00000000";
signal uartTX : std_logic;

--Current uart state signal
signal uartState : UART_STATE_TYPE := RST_REG;

--Debounced btn signals used to prevent single button presses
--from being interpreted as multiple button presses.
signal btnDeBnc : std_logic_vector(4 downto 0);

signal clk_cntr_reg : std_logic_vector (4 downto 0) := (others=>'0'); 

signal pwm_val_reg : std_logic := '0';
signal CLK2 : std_logic := '0';
signal CLK3 : std_logic := '0';
--this counter counts the amount of time paused in the UART reset state
signal reset_cntr : std_logic_vector (18 downto 0) := (others=>'0');

signal time_delta : std_logic_vector(26 downto 0):= (others=>'0');

begin

----------------------------------------------------------
------                LED Control                  -------
----------------------------------------------------------

with BTN(4) select
	LED <= SW 			when '0', --when thge cneter button is not pushed corrensponding LEDs to the switch light up  
			 "1010101010101010" when others; --when center button is pushed, LED still on
			 --"1111111111111111" is off for all the LED
	 --LED <= SW  when others;
	 
	 
	 -- LED and SW are off when 1, on when 0
----------------------------------------------------------
------           7-Seg Display Control             -------
----------------------------------------------------------
--Digits are incremented every second, and are blanked in
--response to button presses.

--Individual and reset blanking of Anodes

    

with BTN(4) select 
	SSEG_AN(3 downto 0) <= btnDeBnc(3 downto 0)	when '0', --SSEG(first four degitis) is btnDeBnc when BTN(4) is 0
				  "1111" 			when others;	  --SSEG(first four degitis) is 1111 when BTN(4) is anuthing but 0
with BTN(4) select
	SSEG_AN(7 downto 4) <= btnDeBnc(3 downto 0)	when '0', --SSEG(last four degitis) is btnDeBnc when BTN(4) is 0
				  "1111" 			when others; --SSEG(last four degitis) is 1111 when BTN(4) is anything but 0			  

--with btnDeBnc(4) select
    --Hsync <= '1' when '1',
    --'0' when others;

--This process controls the counter that triggers the 7-segment
--to be incremented. It counts 100,000,000 and then resets.		  
timer_counter_process : process (CLK)
begin
	if (rising_edge(CLK2)) then -- if the CLK value is increasing
		if ((tmrCntr >= TMR_CNTR_MAX) or (BTN(4) = '1')) then -- tmrCntr(valriable) TMR_CNTR_MAX(100,000,000)
	       -- meaning if the counter has reached to max, counted to 100.000.000,, or BTN(4) is zero, then, 
	       --tmrCntr is reset to 0
			tmrCntr <= (others => '0');
		else
		    --tmrCntr is keeping the count for the timing/clock 
			tmrCntr <= tmrCntr + to_integer(unsigned(SW(7 downto 0))); --speed SHOULD depend on the switch 
			--tmrCntr <= tmrCntr + SW(1); --speed SHOULD depend on the switch 
		end if;
            
	end if;
	

        
end process;

wave_viewer : ila_0
PORT MAP (
	clk => CLK2,



	--probe0 => SW,
	--probe1 => tmrCntr,
	--probe2 => vgaRed,
	probe0 => JA(0),
	probe1 => time_delta,
	probe2 => JA(1)
);

clock_doubling : clk_wiz_0
   PORT MAP ( 
  -- Clock out ports  
   clk_out1 => CLK2,
   clk_out2 => CLK3,
  -- Status and control signals                
   reset => '0',
   locked => open,
   -- Clock in ports
   clk_in1 => CLK
 );

--This process increments the digit being displayed on the 
--7-segment display every second.
timer_inc_process : process (CLK2)
begin
	if (rising_edge(CLK2)) then --if the CLK value is risimg/increasing
	    vgaTime <= "0000" + SW(0);
	    
		if (BTN(4) = '1') then -- if middle button is pushed
			tmrVal <= (others => '0'); --tmrVal is reset to 0 
			
		elsif (tmrCntr >= TMR_CNTR_MAX) then -- if counter is reaching the maximum
			if (tmrVal >= TMR_VAL_MAX) then -- and if tmrVal is maximum
				tmrVal <= (others => '0'); --then the tmrVal (the value shown on the 7-segment will be reset to be 0)
				
		elsif ( ((BTN(1)='1') or (BTN(3) = '1'))) then --if the counter is not reaching, but button is pushed
			    if(tmrVal = 0) then --if tmrVal is 0
			         tmrVal <= TMR_VAL_MAX; --the value is back to maximum
			    else
			         tmrVal <= tmrVal -1; --if the value is not max yet, reqind by one
			    end if;	    
			    
		else
			    if((BTN(0)='1')or (BTN(2)='1')) then --if the counter is not max yet but if the button is pushed
			         tmrVal <= tmrVal + 1; -- increment by 1
			     end if;
			     
				tmrVal <= tmrVal + 1; -- if not, increase the number of the screen by one
			end if;
		end if;
	end if;
end process;

--This select statement encodes the value of tmrVal to the necessary
--cathode signals to display it on the 7-segment
with tmrVal select
	--SSEG_CA <= "11000000" when "0000", -- when tmrVal is 0
				 -- "11111001" when "0001", --when 1
				 -- "10100100" when "0010", --when 2 
				--  "10110000" when "0011", --when 3 
				--  "10011001" when "0100", --when 4
				-- "10010010" when "0101", --when 5
				 -- "10000010" when "0110", --when 6
				--  "11111000" when "0111", --when 7
				--  "10000000" when "1000", --when 8
				--  "10010000" when "1001", --when 9
				--  "11111111" when others; --other values
				  
				  	SSEG_CA <= "10100000" when "0000", -- when tmrVal is 0 a
                                "10000011" when "0001", --when 1 b
                                "11000110" when "0010", --when 2  c
                                "10100001" when "0011", --when 3  d
                                "10000110" when "0100", --when 4 e
                                "10001110" when "0101", --when 5 f
                                "10010000" when "0110", --when 6 g
                                "10001011" when "0111", --when 7 h
                                "11111001" when "1000", --when 8 i
                                "11100001" when "1001", --when 9 j
                                "11000000" when "1010", --when 10 0
                                "11111001" when "1011", --when 11 1
                                "10100100" when "1100", --when 12 2
                                "10110000" when "1101", --when 13 3
                                "10011001" when "1110", --when 14 4
                                "10010010" when "1111", --when 15 5
                                "11111111" when others; --other values


----------------------------------------------------------
------              Button Control                 -------
----------------------------------------------------------
--Buttons are debounced and their rising edges are detected
--to trigger UART messages


--Debounces btn signals
Inst_btn_debounce: debouncer 
    generic map(
        DEBNC_CLOCKS => (2**16),
        PORT_WIDTH => 5)
    port map(
		SIGNAL_I => BTN,
		CLK_I => CLK2,
		SIGNAL_O => btnDeBnc
	);

--Registers the debounced button signals, for edge detection.
btn_reg_process : process (CLK)
begin
	if (rising_edge(CLK2)) then
		btnReg <= btnDeBnc(3 downto 0);
	end if;
end process;

--btnDetect goes high for a single clock cycle when a btn press is
--detected. This triggers a UART message to begin being sent.
btnDetect <= '1' when ((btnReg(0)='0' and btnDeBnc(0)='1') or
								(btnReg(1)='0' and btnDeBnc(1)='1') or
								(btnReg(2)='0' and btnDeBnc(2)='1') or
								(btnReg(3)='0' and btnDeBnc(3)='1')  ) else
				  '0';
				  



----------------------------------------------------------
------              UART Control                   -------
----------------------------------------------------------
--Messages are sent on reset and when a button is pressed.

--This counter holds the UART state machine in reset for ~2 milliseconds. This
--will complete transmission of any byte that may have been initiated during 
--FPGA configuration due to the UART_TX line being pulled low, preventing a 
--frame shift error from occuring during the first message.
process(CLK)
begin
  if (rising_edge(CLK2)) then -- if CLK is increasing 
    if ((reset_cntr = RESET_CNTR_MAX) or (uartState /= RST_REG)) then
    -- and if the reset_cntr 's state is set to be RESET_CNTR_MAX
    -- or uartState is NOT REST_REG them 
      reset_cntr <= (others=>'0'); -- reset_cntr is set to be 0 
    else
      reset_cntr <= reset_cntr + 1; 
      -- if reset_cntr hasn't reached maximum AND uartState is set to be RST_REG, them increment the counter 
    end if;
  end if;
end process;



--Next Uart state logic (states described above)
next_uartState_process : process (CLK2)
begin
	if (rising_edge(CLK2)) then -- if the CLK is increasing over time 
		if (btnDeBnc(4) = '1') then -- and if btnDeBnc(4) is 1
			uartState <= RST_REG; -- uartState is set to be RST_REG
		else	
			case uartState is  -- if uartState is RST_REG
			when RST_REG =>
        if (reset_cntr = RESET_CNTR_MAX) then -- if reset_cntr is already hitting the maximum
          uartState <= LD_INIT_STR; -- then uartState is set to be LD_INIT_STR
        end if;
			when LD_INIT_STR => -- if uartSTate is set to be LD_INIT_STR
				uartState <= SEND_CHAR; -- then uartState is set to be SEND_CHAR
			when SEND_CHAR => --if uartStatus is set to be SEND_CHAR
				uartState <= RDY_LOW; -- then uartState is set to be RDY_LOW
			when RDY_LOW => -- if uartStatus is set to be RDY_LOW
				uartState <= WAIT_RDY; --then uartState is set to be WAIT_RDY
			when WAIT_RDY => --if uartsStatus is set to be WAIT_RDY
				if (uartRdy = '1') then -- and  if uartRdy is 0
					if (strEnd = strIndex) then --and if strEnd = strIndex
						uartState <= WAIT_BTN; -- then uartStatus is set to be WAIT_BTN
					else
						uartState <= SEND_CHAR; --if strEnd is not strIndex, then uartState is SEND_CHAR
					end if;
				end if;
			when WAIT_BTN => --when uartState is WAIT_BIN 
				if (btnDetect = '1') then --and if btnDetect is 1
					uartState <= LD_BTN_STR; -- them uartState is set to be LD_BTN_STR
				end if;
			when LD_BTN_STR => --when uartState is LD_BTN_STR
				uartState <= SEND_CHAR; --then uartState is SEND_CHAR
			when others=> --should never be reached
				uartState <= RST_REG;
			end case;
		end if ;
	end if;
end process;

--Loads the sendStr and strEnd signals when a LD state is
--is reached.
string_load_process : process (CLK2)
begin
	if (rising_edge(CLK2)) then -- if CLS is increasing
		if (uartState = LD_INIT_STR) then -- and if uartState is LD_INIT_STR
			sendStr <= WELCOME_STR; -- then sendStr is WELCOM_STR
			strEnd <= WELCOME_STR_LEN; --and strEND is WELCOM_STR_LEN
		elsif (uartState = LD_BTN_STR) then --or, if uartState is LD_BTN_STR
			sendStr(0 to 23) <= BTN_STR; -- then the first 24 cells of the sendStr will be the same as BTN_STR
			strEnd <= BTN_STR_LEN; -- and strEnd is BTN_STR_LEN
		end if;
	end if;
end process;

--Controls the strIndex signal so that it contains the index
--of the next character that needs to be sent over uart
char_count_process : process (CLK2)
begin
	if (rising_edge(CLK2)) then --if the CLK is increasing 
		if (uartState = LD_INIT_STR or uartState = LD_BTN_STR) then -- and if uartState is wither LD_INIT+STR or LD_BTN_STR
			strIndex <= 0; -- then strIndex is 0
		elsif (uartState = SEND_CHAR) then -- or if uartState is SEND_CHAR
			strIndex <= strIndex + 1; -- increment the strIndex
		end if;
	end if;
end process;

--Controls the UART_TX_CTRL signals
char_load_process : process (CLK2)
begin
	if (rising_edge(CLK2)) then --if the CLK is increasing 
		if (uartState = SEND_CHAR) then -- if uartState is SEND_CHAR
			uartSend <= '1'; -- then uartState is 1
			uartData <= sendStr(strIndex); -- and uartData is sendStr(strIndex)....????
		else
			uartSend <= '0'; --if uartState is other state, them uartSend is 0
		end if;
	end if;
end process;

--Component used to send a byte of data over a UART line.
Inst_UART_TX_CTRL: UART_TX_CTRL port map(
		SEND => uartSend,
		DATA => uartData,
		CLK => CLK2,
		READY => uartRdy,
		UART_TX => uartTX 
	);

UART_TXD <= uartTX;

----------------------------------------------------------
------            RGB LED Control                  -------
----------------------------------------------------------

RGB_Core: RGB_controller port map(
	GCLK => CLK, 			
	RGB_LED_1_O(0) => RGB1_Green, 
	RGB_LED_1_O(1) => RGB1_Blue,
	RGB_LED_1_O(2) => RGB1_Red,
	RGB_LED_2_O(0) => RGB2_Green, 
	RGB_LED_2_O(1) => RGB2_Blue,
	RGB_LED_2_O(2) => RGB2_Red,
	GSW => SW(15 downto 8)
	);
	

----------------------------------------------------------
------            VGA Control                  -------
----------------------------------------------------------

VGA_Core: VGA_controller port map(
    VCLK => CLK2,
    VSW => SW(7 downto 0),
    DETECT => JA(0), 
    HS => JA(1),
    TIMETAKEN => time_delta 
    --VS => Vsync
    );

----------------------------------------------------------
------              MIC Control                    -------
----------------------------------------------------------
--PDM data from the microphone is registered on the rising 
--edge of every micClk, converting it to PWM. The PWM data
--is then connected to the mono audio out circuit, causing 
--the sound captured by the microphone to be played over 
--the audio out port.

process(CLK2)
begin
  if (rising_edge(CLK2)) then --if CLK is increasing 
    clk_cntr_reg <= clk_cntr_reg + 1; -- increment the value of clk_cntr_reg 
  end if;
end process;

--micClk = 100MHz / 32 = 3.125 MHz
micClk <= clk_cntr_reg(4); --.....????

process(CLK2)
begin
  if (rising_edge(CLK2)) then -- if CLK is increasing 
    if (clk_cntr_reg = "01111") then -- if the clk_cntr_reg value is 01111
      pwm_val_reg <= micData; -- then pwm_val_rag is set to be micData
    end if;
  end if;
end process;

micLRSel <= '0';
ampPWM <= pwm_val_reg;
ampSD <= '1';

end Behavioral;
