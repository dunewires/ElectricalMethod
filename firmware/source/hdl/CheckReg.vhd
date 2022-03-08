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

	
library duneDwa;
use duneDwa.global_def.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity Check_Range is
port (
      fromDaqReg    		  : in  fromDaqRegType;
      dwaClk10                    : in  std_logic;
      checkBound_error            : out std_logic;     
      toDaqReg                    : out toDaqRegType
     );

end Check_Range;
architecture Behavioral of Check_Range is
signal res_0             : std_logic_vector (31 downto 0); -- Output 1st part
signal res_1             : std_logic_vector (31 downto 0); -- Output 2nd part

signal res_bin           : std_logic;                     -- Output limited

signal s_values          : fromDaqRegType;

begin
process_check : process(dwaClk10)
begin
if rising_edge(dwaClk10) then

s_values   <= fromDaqReg;


res_0 <= ( 31 downto 0 => '1');
res_1 <= ( 31 downto 0 => '1');

res_0(3)  <= '1' when ((s_values.stimFreqReq <="000000000000001111101000" ) and (s_values.stimFreqReq >="000000000000000000001010" ) ) else '0' ;
res_0(4)  <= '1' when ((s_values.stimFreqMin < s_values.stimFreqMax) and (s_values.stimFreqMin >= "000000000000000000001010")) else '0' ;
res_0(5)  <= '1' when ( (s_values.stimFreqMax <= "000000000000001111101000") and (s_values.stimFreqMax > s_values.stimFreqMin)) else '0' ;
res_0(6)  <= '1' when ( (s_values.stimFreqStep >= 1) and (s_values.stimFreqStep <= (s_values.stimFreqMax-s_values.stimFreqMin) )  ) else '0' ;
res_0(10) <= '1' when (s_values.cyclesPerFreq*s_values.adcSamplesPerCycle < 128)  else '0' ;
res_0(11) <= '1' when (s_values.cyclesPerFreq*s_values.adcSamplesPerCycle < 128)  else '0' ;

if (s_values.mnsEna) then                                                                          
res_0(25) <= '1' when ( (s_values.noiseFreqMin <= s_values.noiseFreqMax) and (s_values.noiseFreqMin >= s_values.stimFreqMin)  ) else '0' ;
res_0(26) <= '1' when ( (s_values.noiseFreqMax <= s_values.stimFreqMax)  and (s_values.noiseFreqMax >= s_values.noiseFreqMin) )  else '0' ;
res_0(27) <= '1' when  (s_values.noiseFreqStep <= (s_values.noiseFreqMax -s_values.NoiseFreqMin))  else '0' ;

if ( ( (s_values.noiseFreqMax-s_values.noiseFreqMin)/s_values.noiseFreqStep) > 32 ) then 
res_0(25)<='0';
res_0(26)<='0';
res_0(27)<='0';
end if;


end if;

end if;

end process;

toDaqReg.checkRegA <= res_0;
toDaqReg.checkRegB <= res_1;

checkBound_error <= '0' when (and(res_0) and  and(res_1) ) else '1' ;


end Behavioral;


