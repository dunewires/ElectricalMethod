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


begin
process_check : process(dwaClk10)
begin
if rising_edge(dwaClk10) then

	res_0 <= ( 31 downto 0 => '1');
	res_1 <= ( 31 downto 0 => '1');
		                                             
	res_0(3)  <= '1' when ((fromDaqReg.stimFreqReq <=  x"0003E800") and (fromDaqReg.stimFreqReq >=x"00000A00" ) ) else '0' ;
	res_0(4)  <= '1' when ((fromDaqReg.stimFreqMin < fromDaqReg.stimFreqMax) and (fromDaqReg.stimFreqMin >= x"00000A00")) else '0' ;
	res_0(5)  <= '1' when ( (fromDaqReg.stimFreqMax <= x"0003E800") and (fromDaqReg.stimFreqMax > fromDaqReg.stimFreqMin)) else '0' ;
	res_0(6)  <= '1' when ( (fromDaqReg.stimFreqStep >= 1) and (fromDaqReg.stimFreqStep <= (fromDaqReg.stimFreqMax-fromDaqReg.stimFreqMin) )  ) else '0' ;

	-- (fromDaqReg.cyclesPerFreq*fromDaqReg.adcSamplesPerCycle must be greater than 0 and lower or equal 128 and be a mutliple of 2)
	if  ( (fromDaqReg.cyclesPerFreq*fromDaqReg.adcSamplesPerCycle < 128)  and (fromDaqReg.cyclesPerFreq*fromDaqReg.adcSamplesPerCycle > 0) ) then 
	 
		if  ( ( (fromDaqReg.cyclesPerFreq*fromDaqReg.adcSamplesPerCycle) rem 2) =0) then

		res_0(10) <= '1';
		res_0(11) <= '1';

		else 

		res_0(10) <= '0';
		res_0(11) <= '0';
		end if;

	else 
	res_0(10) <= '0';
	res_0(11) <= '0';

	end if; -- <128 and >0 

	if not fromDaqReg.mnsDisable then
                                                                                                                                                
	res_0(25) <= '1' when ( (fromDaqReg.noiseFreqMin <= fromDaqReg.noiseFreqMax) and (fromDaqReg.noiseFreqMin >= x"002800")             )  else '0' ;
	res_0(26) <= '1' when ( (fromDaqReg.noiseFreqMax <= x"005000")             and (fromDaqReg.noiseFreqMax >= fromDaqReg.noiseFreqMin) )  else '0' ;
	res_0(27) <= '1' when (  fromDaqReg.noiseFreqStep =  x"000100"   )                                                                 else '0' ;
		                                                          
		if ( not ( ( (fromDaqReg.noiseFreqMax-fromDaqReg.noiseFreqMin)/fromDaqReg.noiseFreqStep) < 64 ) ) then -- should be lower than 64 to remain within good range 
		res_0(25)<='0';
		res_0(26)<='0';
		res_0(27)<='0';
		end if;

	end if;

	if fromDaqReg.ctrlStart then
	toDaqReg.checkRegA <= res_0;
	toDaqReg.checkRegB <= res_1;

	checkBound_error <= '0' when (and(res_0) and  and(res_1) ) else '1' ;
	end if ;

end if;

end process;



end Behavioral;


