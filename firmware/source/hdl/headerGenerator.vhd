--------------------------------------------------------------------------------
-- Title       : DWA Header Generator
-- Project     : DUNE DWA
--------------------------------------------------------------------------------
-- File        : headerGenerator.vhd
-- Author      : Nathan Felt felt@fas.harvard.edu
-- Company     : Harvard University LPPC
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Tue Jun  9 00:20:49 2020
-- Platform    : DWA microZed
-- Standard    : VHDL-2008
-------------------------------------------------------------------------------
-- Description: Construct a standard header
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.all;

library duneDwa;
use duneDwa.global_def.all;

entity headerGenerator is
	port (
		fromDaqReg : in  fromDaqRegType;
		fromDwaReg : out fromDwaRegType;

		headAStart : in boolean ;

		reset     : in boolean   := false;
		dwaClk100 : in std_logic := '0'
	);

end entity headerGenerator;

architecture rtl of headerGenerator is

	-- set the number of header words here
	constant nHeadA    : integer                      := 6;
	constant tempA     : std_logic_vector(7 downto 0) := "11001101";
	constant nHeadALog : integer                      := integer(log2(real(nHeadA +1)));

	signal headACnt      : unsigned(nHeadALog-1 downto 0)                  := (others => '0');
	signal headAPktCnt   : unsigned(23 downto 0)                           := (others => '0');
	signal headADataList : slv_vector_type(nHeadA-1 downto 0)(31 downto 0) := (others => (others => '0'));

        --fixme: this should come from elsewhere... perhaps global_def.vhd
        constant dataRegister : std_logic_vector(7 downto 0) := x"FF";
        
begin
	--header data indexed list with 0 at bottom of list
	headADataList <= (
			x"AAAAAAAA",
                        x"10" & x"0000" & dataRegister,
			x"AB" & std_logic_vector(headAPktCnt),
			tempA & std_logic_vector(fromDaqReg.freqMax),
			"0100101" & '1' & std_logic_vector(fromDaqReg.freqStep(23 downto 4)) & "0100",
			"01001101010000111110101010101010"
	);

	sendHeader : process (dwaClk100)
	begin
		if rising_edge(dwaClk100) then
			if reset then-- reset takes priority
				fromDwaReg.headARdy <= false;
				headACnt            <= (others => '0');
			else

				if fromDwaReg.headARdy then --currently sending header data
					if fromDaqReg.headARen then
						if headACnt /= 0 then --prevent simulation index error on underflow.
							headACnt <= headACnt-1; --get the next header word
						else
							fromDwaReg.headARdy <= false; -- the header is finished
						end if;
					end if;

				elsif headAStart then -- not busy so wait for signal to begin
					fromDwaReg.headARdy <= true;
					headACnt            <= to_unsigned(nHeadA-1,headACnt'length); -- resetting counter will initiate readout
					headAPktCnt         <= headAPktCnt+1;
				end if;

			end if;
		end if;
	end process sendHeader;

	fromDwaReg.headAData <= headADataList(to_integer(headACnt)); --mux selected header word

end architecture rtl;
