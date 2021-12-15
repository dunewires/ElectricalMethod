----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2021 11:28:57 PM
-- Design Name: 
-- Module Name: Check_Range - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.std_logic_unsigned.all;

library UNISIM;
use UNISIM.VCOMPONENTS.all;

library STD, WORK; 
use STD.STANDARD.all;
   
-- Custom libraries and packages:

	
--library duneDwa;
use work.global_def.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity Check_Range is
port (
      fromDaqRegType_values       : in  fromDaqRegType;
      fromDaqRegType_Bound_Min    : in  fromDaqRegType;
      fromDaqRegType_Bound_Max    : in  fromDaqRegType;
      dwaClk10                    : in  std_logic;
            
      results_0   : out STD_LOGIC_VECTOR(31 DOWNTO 0); -- 1st part of the results
      results_1   : out STD_LOGIC_VECTOR(31 DOWNTO 0); -- 2nd part of the results
      result_bin  : out std_logic -- Results limited to a single bit pass/fail

     );
end Check_Range;


architecture Behavioral of Check_Range is
signal res_0             : std_logic_vector (31 downto 0); -- Output 1st part
signal res_1             : std_logic_vector (31 downto 0); -- Output 2nd part

signal res_bin           : std_logic;                     -- Output limited

signal s_values          : fromDaqRegType;
signal s_min             : fromDaqRegType;
signal s_max             : fromDaqRegType;

begin

process_check : process(dwaClk10)
begin
if rising_edge(dwaClk10) then

    s_values   <= fromDaqRegType_values;
    s_Min      <= fromDaqRegType_Bound_Min;
    s_Max      <= fromDaqRegType_Bound_Max;

    res_0 <= ( 31 downto 0 => '1');
    res_1 <= ( 22 downto 0 => '1');

-- Only change register which have boundaries
--stimFreqReq     unsigned(23 downto 0) //10 Hz  , 1000 Hz
if ( (s_values.stimFreqReq <= s_Max.stimFreqReq) and (s_values.stimFreqReq >= s_Min.stimFreqReq) ) then
res_0(3)<='1';
else 
res_0(3)<='0';
end if;

--                                                     -- x"3E8"                                      x"A"
----stimFreqMin     unsigned(23 downto 0) //10 Hz  , max
--    res_0(4)   <= '1' when ( (s_values.stimFreqMin <= s_Max.stimFreqMin) and (s_values.stimFreqMin >= s_Min.stimFreqMin) ) else '0' ;
if (  (s_values.stimFreqMin <= s_Max.stimFreqMin) and (s_values.stimFreqMin >= s_Min.stimFreqMin) ) then
res_0(4)<='1';
else 
res_0(4)<='0';
end if;
----stimFreqMax     unsigned(23 downto 0) // min , 1000 Hz
----    res_0(5)   <= '1' when ( (s_values.stimFreqMax <= s_Max.stimFreqMax) and (s_values.stimFreqMax >= s_Min.stimFreqMax) ) else '0' ;
if (  (s_values.stimFreqMax <= s_Max.stimFreqMax) and (s_values.stimFreqMax >= s_Min.stimFreqMax) ) then
res_0(5)<='1';
else 
res_0(5)<='0';
end if;

----stimFreqStep    unsigned(23 downto 0) 1  ,  (freqMax - freqMin)
--    res_0(6)   <= '1' when ( (s_values.stimFreqStep <= s_Max.stimFreqStep) and (s_values.stimFreqStep >= s_Min.stimFreqStep) ) else '0' ;
if ((s_values.stimFreqStep <= s_Max.stimFreqStep) and (s_values.stimFreqStep >= s_Min.stimFreqStep)  ) then
res_0(6)<='1';
else 
res_0(6)<='0';
end if;

------26 cyclesPerFreq      unsigned(23 downto 0) fromDaqReg.cyclesPerFreq * fromDaqReg.adcSamplesPerCycle < 4096 
----    res_0(10)  <= '1' when ( (s_values.cyclesPerFreq*s_values.adcSamplesPerCycle < 4096 )) else '0' ;
if ((s_values.cyclesPerFreq*s_values.adcSamplesPerCycle < 4096 )  ) then
res_0(26)<='1';
else 
res_0(26)<='0';
end if;

------27 adcSamplesPerCycle unsigned(15 downto 0) fromDaqReg.cyclesPerFreq * fromDaqReg.adcSamplesPerCycle < 4096
----    res_0(11)  <= '1' when ( (s_values.cyclesPerFreq*s_values.adcSamplesPerCycle < 4096 )) else '0' ;
if ((s_values.cyclesPerFreq*s_values.adcSamplesPerCycle < 4096 )  ) then
res_0(11)<='1';
else 
res_0(11)<='0';
end if;



---- if MNS enabled 
if s_values.mnsEna then 
----noiseFreqMin   {stimFreqMin , noiseFreMax}
--if ((s_values.noiseFreqMin <= s_values.noiseFreqMax) and (s_values.noiseFreqMin >= s_values.stimFreqMin)   ) then
--res_0(25)<='1';
--else 
--res_0(25)<='0';
--end if;

----noiseFreqMax     ( (noiseFreqMin - stimFreqMax)/step <= 32) , (noiseFreqMin - stimFreqMax) 
--if (
--(s_values.noiseFreqMin <= ( s_values.noiseFreqMin - s_values.stimFreqMax) ) and 
--( (s_values.noiseFreqMin - s_values.stimFreqMax)/s_values.noiseFreqStep <= 32) 
--) then
--res_0(26)<='1';
--else 
--res_0(26)<='0';
--end if;

----noiseFreqStep   unsigned(23 downto 0) TBD - noiseFreqMax - NoiseFreqMin, 
--if ((s_values.noiseFreqStep <= s_Max.noiseFreqStep) and (s_values.noiseFreqStep >= s_Min.noiseFreqStep)   ) then
--res_0(27)<='1';
--else 
--res_0(27)<='0';
--end if;

end if;



end if;




end process;

results_0<= res_0;
results_1<= res_1;


result_bin <= (and(res_0) and  and(res_1) );

end Behavioral;

