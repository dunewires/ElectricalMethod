
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library duneDwa;
use duneDwa.global_def.all;

entity tb_jbtest is
end tb_jbtest;

architecture tb of tb_jbtest is

    signal sendRunHdr  : boolean;
    signal dataWord    : std_logic_vector(31 downto 0);
    signal dataRdy     : boolean;
    signal dwaClk100   : std_logic := '0';

begin

  jbtest_inst : entity duneDwa.jbtest
    port map (
      sendRunHdr => sendRunHdr, 
      dataWord   => dataWord,
      dataRdy    => dataRdy,
      dwaClk100  => dwaClk100
    );

end tb;

