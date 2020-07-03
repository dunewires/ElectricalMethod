

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.all;

library duneDwa;
use duneDwa.global_def.all;

entity jbtest is
    port (
        sendRunHdr  : in boolean;
        dataWord    : out std_logic_vector(31 downto 0);
        dataRdy     : out boolean := false;
        dwaClk100   : in std_logic := '0'
        );
        
end entity jbtest;

architecture rtl of jbtest is

    type     state_type is (idle_s, stateA_s, state_s);
    signal   state_reg    : state_type := idle_s;
    signal   state_next   : state_type := idle_s;
    
    constant nHead        : integer  := 4; -- # of header words (incl. 2 delimiters)
    constant nHeadLog     : integer  := integer(log2(real(nHead +1)));
    signal   headDataList : slv_vector_type(nHead-1 downto 0)(31 downto 0) := (others => (others => '0'));
    
    signal   headCnt_reg   : unsigned(nHeadLog downto 0) := (others => '0');
    signal   headCnt_next  : unsigned(nHeadLog downto 0) := (others => '0');
    signal   onEnter       : boolean := true;
    signal   dataWord_reg  : std_logic_vector(31 downto 0);
    signal   dataWord_next : std_logic_vector(31 downto 0);

    signal   dataRdy_reg   : boolean := false;
    signal   dataRdy_next  : boolean := false;
    
begin

    --header data indexed list with 0 at bottom of list
    headDataList <= (
        x"AAAAAAAA",
        x"BBBBBBBB",
        x"CCCCCCCC",
        x"DDDDDDDD"
    );

    -- fsmd state and data registers
    state_seq : process (dwaClk100)
    begin
        if rising_edge(dwaClk100) then
            state_reg    <= state_next;
            headCnt_reg  <= headCnt_next;
            dataRdy_reg  <= dataRdy_next;
            dataWord_reg <= dataWord_next;
        end if;
    end process state_seq;

    -- fsmd next-state logic
    process (state_reg, sendRunHdr, headCnt_reg)
    begin
        -- set defaults
        state_next    <= state_reg;
        dataWord_next <= dataWord_reg;
        dataRdy_next  <= dataRdy_reg;
        
        case state_reg is
            when idle_s =>
                dataRdy_next <= false;
                if sendRunHdr then
                    dataRdy_next <= true;
                    headCnt_next <= to_unsigned(nHead-1, headCnt_next'length);
                    state_next <= stateA_s;
                end if;

            when stateA_s =>
                dataWord_next <= headDataList(to_integer(headCnt_reg));
                if headCnt_reg=0 then
                    state_next <= idle_s; -- choose next state
                else
                    headCnt_next  <= headCnt_reg - 1;
                end if;

            when others =>
                state_next <= idle_s;
                
        end case;
    end process;
    
    -- output
    dataRdy  <= dataRdy_reg;
    dataWord <= dataWord_reg;
    
end architecture rtl;

