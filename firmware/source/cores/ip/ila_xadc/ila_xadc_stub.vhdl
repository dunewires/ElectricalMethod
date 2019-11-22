-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Wed Apr 10 13:13:36 2019
-- Host        : localhost.localdomain running 64-bit Fedora release 29 (Twenty Nine)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/nate/projects/duneWireTension/vivadoProjects/cores/cores.srcs/sources_1/ip/ila_xadc/ila_xadc_stub.vhdl
-- Design      : ila_xadc
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ila_xadc is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );

end ila_xadc;

architecture stub of ila_xadc is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[0:0],probe1[15:0],probe2[4:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ila,Vivado 2018.2";
begin
end;
