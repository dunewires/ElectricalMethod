----------------------------------------------------------------------------------
-- Company: Harvard Univ
-- Engineer: Shion 
-- 
-- Create Date: 04/29/2020 11:29:19 AM
-- Design Name: 
-- Module Name: REF_detector - Behavioral
-- Project Name: DWA
-- Target Devices: MicroZ, electrical nodes
-- Tool Versions: V1
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity REF_detector is
    port(
    VCLK 			: in std_logic; --clock time input handed from GPIO demo
    VSW         : in std_logic_vector(7 downto 0); --Switch information, need to be CLEANED
    VGAR        : out std_logic_vector(3 downto 0); --not used, need to be CLEANED
    FOURTIME        : out std_logic_vector(3 downto 0); -- time difference in 4 digits need to be CLEANED
    --DETECT        : in std_logic_vector(3 downto 0);
    DETECT        : in std_logic; --input from detector pin 
    HS          : out std_logic; --high siganl, (sent from FPGA JA1 pin)
    TIMETAKEN   : out std_logic_vector(26 downto 0) -- time difference 
    --VS          : out std_logic;
    );
end REF_detector;

--behavioral
architecture Behavioral of REF_detector is
      constant windowMax: std_logic_vector(26 downto 0) := "111011100110101100101000000"; --max window time 
      
      
      constant timeZero: std_logic_vector(26 downto 0) := (others => '0'); --zero in 26 dig
      signal windowCount: std_logic_vector(26 downto 0) := (others => '0'); --window counter
      --signal windowcountG: std_logic_vector(26 downto 0) := (others => '0');
      --signal windowcountB: std_logic_vector(26 downto 0) := (others => '0');
      
      signal tSent: std_logic_vector(26 downto 0); --time when the sent signal was detected 
      signal tReceived: std_logic_vector(26 downto 0) ; --time when the received signal was detected 
      signal tDelta: std_logic_vector(26 downto 0) := (others=>'0'); --time difference
      
      signal hlTrack: std_logic := '0'; --high-low track, the value for the JA(1) output
    
      signal fourdigTime        :  std_logic_vector(3 downto 0); --need to be CLEANED
      
      signal pulseLength: std_logic_vector(26 downto 0); --pulse length 

      signal phaseCount: std_logic_vector(2 down to 0):= (others=>'0');
      -- 0: nothing detected yet at JA(1)
      -- 1: the sent signal detected at JA(1)
      -- 2: the JA(1) finished detecting the sent signal 
begin --end of the architecture



-- send the pulse, and increment to the time 
pulse_sender:process(VCLK) 
begin
	--if the clock is moving (which shouls be true all the time!!)
  if(rising_edge(VCLK)) then 
	pulseLength <= "000000000000000000000001000"; --determine the length of the pulseLength 	

    -- if the windowCount is 0 < count < pulseLength
    if windowCount < (pulseLength) then 
    windowCount <= windowCount + 1; --then increment the windowCount 
		hlTrack <= '1'; --and set the output to be high 
		tSent <=  (others => '0');

	  -- if the windowCount is equal to pulseLength
    elsif windowCount = pulseLength then
    windowCount <= windowCount + 1; --then increment the windowCount 
    hlTrack <= '0'; --and set the output to be low 

		-- if pulseLength =< count < windowMax then
    elsif windowCount <= windowMax then 
		windowCount <= windowCount + 1; --then increment the windowCount 
    hlTrack <= '0'; --and set the output to be low

		-- if the windowCount has reached to the maximum value
    else
		windowCount <= (others => '0'); -- reset the windowCount to 0
		hlTrack <= '0'; --and set the output to be high 
		tSent <= (others => '0'); -- reset the tSent too 
    tReceived <= (others => '0'); -- reste the tReceived too
		end if;

  end if;
end process;



signal_reciever:process(DETECT, VCLK) -- JA(1) and clock 
begin
-- triple nesting of the if 
-- phase Count >> (pulseLength ? windowCount) >> JA(0) value  
--if clock is still moving, which should be moving right now
if (rising_edge(VCLK)) then 

  -- if the phaseCount is 0 (nothins is detected yet),
  if phaseCount = '0000' then
    -- if the windowCount is less than pulse width, 
    if windowCount < pulseLength then
      -- if the JA(0) has not detected anything,(CLEAN THIS IF)
        -- the window count will be incremented, and JA(1) turned to 1 (CLEAN THIS IF)

      -- if the JA(0) has detected the signal,
      if DETECT =/ '0' then -- the window count will be incremented, and JA(1) turned to 1 (doen in pulse_sender)
        phaseCount <= '001';  --AND phaseCount is 1, 
        tSent <= windowCount; -- record the windowCount to tSent
      end if;
    -- if the windowCount is more than pulse width, 
    else 
      -- if the JA(0) has not detected anything,
        -- the window count will be incremented, and JA(1) turned to 0 (CLEAN THIS IF)
      -- if the JA(0) has detected the signal,
      if DETECT =/ '0' then -- the window count will be incremented, and JA(1) turned to 0 (doen in pulse_sender)
        phaseCount <= '001';-- AND phaseCount is 1, 
        tSent <= windowCount; -- record the windowCount to tSent
      end if;
    end if;
  end if;


  -- if the count is 1 (the sent signal detected coming directly from JA(0))
  if phaseCount = '0001' then
    -- if the windowCount is less than pulse width, 
      -- if the JA(0) has not detected anything,
        -- this shouldn't happen!!
      -- if the JA(0) has detected the signal,
        -- the window count will be incremented, and JA(1) turned to 1 (done in pulse-sender)
    -- if the windowCount is more than pulseLength,
    if windowCount >= pulseLength then
      -- if the JA(0) has not detected anything,
      if DETECT = '0' then -- the window count will be incremented, and JA(1) turned to 0 (doen in pulse_sender)
        phaseCount <= '010'; -- AND phaseCount is 2,
      -- if the JA(0) has detected the signal,
        -- the window count will be incremented, and JA(1) turned to 0 (doen in pulse_sender)
      end if;
    end if;
  end if;

  -- if the count is 2 (the JA(0) stopped detecting the reflection signal)
  if phaseCount = '010' then
    -- if the windowCount is less than pulse width, (should not be happening)
      -- if the JA(0) has not detected anything,
        -- this shouldn't happen!!
      -- if the JA(0) has detected the signal,
        -- this shouldn't happen!!
    -- if the windowCount is more than pulse width,
    if windowCount >= pulseLength then
      -- if the JA(0) has not detected anything,
        -- the window count will be incremented, and JA(1) turned to 0
      -- if the JA(0) has detected the signal,
      if DETECT =/ '0' then
        tReceived <= windowCount; -- record windowCount to the tReceived, 
        -- JA(1) turned to 0 (doen in pulse_sender)
        phaseCount <= '000'; -- phaseCount to 0, 
        tDelta <= (tReceived - tSent); -- and calculate the tDelta
      end if;
    end if;
  end if;
end if;
end process;


HS <= hlTrack;
-- vFOURTIME <= fourdigTime;
TIMETAKEN <= tDelta;

end Behavioral;