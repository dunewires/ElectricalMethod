-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Fri Feb  5 10:50:56 2021
-- Host        : pc0 running 64-bit CentOS Linux release 8.3.2011
-- Command     : write_vhdl -force -mode funcsim
--               /home/nate/projects/duneWireTension/ElectricalMethod/firmware/source/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/dwa_ps_bd_sim_netlist.vhdl
-- Design      : dwa_ps_bd
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd is
  port (
    next_pending_r : out STD_LOGIC;
    sel_first_reg_0 : out STD_LOGIC;
    \axlen_cnt_reg[5]_0\ : out STD_LOGIC;
    \axaddr_incr_reg[11]_0\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \m_payload_i_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    aclk : in STD_LOGIC;
    sel_first_reg_1 : in STD_LOGIC;
    \axlen_cnt_reg[3]_0\ : in STD_LOGIC_VECTOR ( 9 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    si_rs_awvalid : in STD_LOGIC;
    \axlen_cnt_reg[3]_1\ : in STD_LOGIC;
    \axaddr_incr_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \next\ : in STD_LOGIC;
    \axlen_cnt_reg[4]_0\ : in STD_LOGIC;
    next_pending_r_reg_0 : in STD_LOGIC;
    axaddr_incr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \axlen_cnt_reg[5]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd : entity is "axi_protocol_converter_v2_1_22_b2s_incr_cmd";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd is
  signal \axaddr_incr[11]_i_1_n_0\ : STD_LOGIC;
  signal \^axaddr_incr_reg[11]_0\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \axaddr_incr_reg[11]_i_4_n_1\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_4_n_2\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_4_n_3\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_4_n_4\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_4_n_5\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_4_n_6\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_4_n_7\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3_n_1\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3_n_2\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3_n_3\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3_n_4\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3_n_5\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3_n_6\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3_n_7\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3_n_0\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3_n_1\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3_n_2\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3_n_3\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3_n_4\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3_n_5\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3_n_6\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3_n_7\ : STD_LOGIC;
  signal axlen_cnt : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \axlen_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \axlen_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \axlen_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \axlen_cnt[3]_i_2_n_0\ : STD_LOGIC;
  signal \axlen_cnt[3]_i_4_n_0\ : STD_LOGIC;
  signal \axlen_cnt[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \axlen_cnt[5]_i_2_n_0\ : STD_LOGIC;
  signal \axlen_cnt[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \axlen_cnt[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \axlen_cnt[7]_i_2_n_0\ : STD_LOGIC;
  signal \^axlen_cnt_reg[5]_0\ : STD_LOGIC;
  signal incr_next_pending : STD_LOGIC;
  signal \^next_pending_r\ : STD_LOGIC;
  signal next_pending_r_i_5_n_0 : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \^sel_first_reg_0\ : STD_LOGIC;
  signal \NLW_axaddr_incr_reg[11]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axaddr_incr[0]_i_1\ : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of \axaddr_incr[10]_i_1\ : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of \axaddr_incr[11]_i_2\ : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of \axaddr_incr[1]_i_1\ : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of \axaddr_incr[2]_i_1\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of \axaddr_incr[3]_i_1\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of \axaddr_incr[4]_i_1\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \axaddr_incr[5]_i_1\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of \axaddr_incr[6]_i_1\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \axaddr_incr[7]_i_1\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of \axaddr_incr[8]_i_1\ : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of \axaddr_incr[9]_i_1\ : label is "soft_lutpair113";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \axaddr_incr_reg[11]_i_4\ : label is 35;
  attribute ADDER_THRESHOLD of \axaddr_incr_reg[3]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \axaddr_incr_reg[7]_i_3\ : label is 35;
  attribute SOFT_HLUTNM of \axlen_cnt[6]_i_1__0\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \axlen_cnt[7]_i_1__0\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \axlen_cnt[7]_i_2\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of next_pending_r_i_5 : label is "soft_lutpair112";
begin
  \axaddr_incr_reg[11]_0\(11 downto 0) <= \^axaddr_incr_reg[11]_0\(11 downto 0);
  \axlen_cnt_reg[5]_0\ <= \^axlen_cnt_reg[5]_0\;
  next_pending_r <= \^next_pending_r\;
  sel_first_reg_0 <= \^sel_first_reg_0\;
\axaddr_incr[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axaddr_incr(0),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[3]_i_3_n_7\,
      O => p_1_in(0)
    );
\axaddr_incr[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axaddr_incr(10),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[11]_i_4_n_5\,
      O => p_1_in(10)
    );
\axaddr_incr[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sel_first_reg_0\,
      I1 => \next\,
      O => \axaddr_incr[11]_i_1_n_0\
    );
\axaddr_incr[11]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axaddr_incr(11),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[11]_i_4_n_4\,
      O => p_1_in(11)
    );
\axaddr_incr[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axaddr_incr(1),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[3]_i_3_n_6\,
      O => p_1_in(1)
    );
\axaddr_incr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axaddr_incr(2),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[3]_i_3_n_5\,
      O => p_1_in(2)
    );
\axaddr_incr[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axaddr_incr(3),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[3]_i_3_n_4\,
      O => p_1_in(3)
    );
\axaddr_incr[3]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0102"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_0\(0),
      I1 => \axlen_cnt_reg[3]_0\(5),
      I2 => \axlen_cnt_reg[3]_0\(4),
      I3 => \next\,
      O => \m_payload_i_reg[3]\(0)
    );
\axaddr_incr[3]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_0\(3),
      I1 => \axlen_cnt_reg[3]_0\(5),
      I2 => \axlen_cnt_reg[3]_0\(4),
      I3 => \next\,
      O => \m_payload_i_reg[3]\(3)
    );
\axaddr_incr[3]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1A2A"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_0\(2),
      I1 => \axlen_cnt_reg[3]_0\(4),
      I2 => \axlen_cnt_reg[3]_0\(5),
      I3 => \next\,
      O => \m_payload_i_reg[3]\(2)
    );
\axaddr_incr[3]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1222"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_0\(1),
      I1 => \axlen_cnt_reg[3]_0\(5),
      I2 => \axlen_cnt_reg[3]_0\(4),
      I3 => \next\,
      O => \m_payload_i_reg[3]\(1)
    );
\axaddr_incr[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axaddr_incr(4),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[7]_i_3_n_7\,
      O => p_1_in(4)
    );
\axaddr_incr[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axaddr_incr(5),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[7]_i_3_n_6\,
      O => p_1_in(5)
    );
\axaddr_incr[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axaddr_incr(6),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[7]_i_3_n_5\,
      O => p_1_in(6)
    );
\axaddr_incr[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axaddr_incr(7),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[7]_i_3_n_4\,
      O => p_1_in(7)
    );
\axaddr_incr[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axaddr_incr(8),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[11]_i_4_n_7\,
      O => p_1_in(8)
    );
\axaddr_incr[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => axaddr_incr(9),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[11]_i_4_n_6\,
      O => p_1_in(9)
    );
\axaddr_incr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr[11]_i_1_n_0\,
      D => p_1_in(0),
      Q => \^axaddr_incr_reg[11]_0\(0),
      R => '0'
    );
\axaddr_incr_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr[11]_i_1_n_0\,
      D => p_1_in(10),
      Q => \^axaddr_incr_reg[11]_0\(10),
      R => '0'
    );
\axaddr_incr_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr[11]_i_1_n_0\,
      D => p_1_in(11),
      Q => \^axaddr_incr_reg[11]_0\(11),
      R => '0'
    );
\axaddr_incr_reg[11]_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \axaddr_incr_reg[7]_i_3_n_0\,
      CO(3) => \NLW_axaddr_incr_reg[11]_i_4_CO_UNCONNECTED\(3),
      CO(2) => \axaddr_incr_reg[11]_i_4_n_1\,
      CO(1) => \axaddr_incr_reg[11]_i_4_n_2\,
      CO(0) => \axaddr_incr_reg[11]_i_4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \axaddr_incr_reg[11]_i_4_n_4\,
      O(2) => \axaddr_incr_reg[11]_i_4_n_5\,
      O(1) => \axaddr_incr_reg[11]_i_4_n_6\,
      O(0) => \axaddr_incr_reg[11]_i_4_n_7\,
      S(3 downto 0) => \^axaddr_incr_reg[11]_0\(11 downto 8)
    );
\axaddr_incr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr[11]_i_1_n_0\,
      D => p_1_in(1),
      Q => \^axaddr_incr_reg[11]_0\(1),
      R => '0'
    );
\axaddr_incr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr[11]_i_1_n_0\,
      D => p_1_in(2),
      Q => \^axaddr_incr_reg[11]_0\(2),
      R => '0'
    );
\axaddr_incr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr[11]_i_1_n_0\,
      D => p_1_in(3),
      Q => \^axaddr_incr_reg[11]_0\(3),
      R => '0'
    );
\axaddr_incr_reg[3]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \axaddr_incr_reg[3]_i_3_n_0\,
      CO(2) => \axaddr_incr_reg[3]_i_3_n_1\,
      CO(1) => \axaddr_incr_reg[3]_i_3_n_2\,
      CO(0) => \axaddr_incr_reg[3]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^axaddr_incr_reg[11]_0\(3 downto 0),
      O(3) => \axaddr_incr_reg[3]_i_3_n_4\,
      O(2) => \axaddr_incr_reg[3]_i_3_n_5\,
      O(1) => \axaddr_incr_reg[3]_i_3_n_6\,
      O(0) => \axaddr_incr_reg[3]_i_3_n_7\,
      S(3 downto 0) => \axaddr_incr_reg[3]_0\(3 downto 0)
    );
\axaddr_incr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr[11]_i_1_n_0\,
      D => p_1_in(4),
      Q => \^axaddr_incr_reg[11]_0\(4),
      R => '0'
    );
\axaddr_incr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr[11]_i_1_n_0\,
      D => p_1_in(5),
      Q => \^axaddr_incr_reg[11]_0\(5),
      R => '0'
    );
\axaddr_incr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr[11]_i_1_n_0\,
      D => p_1_in(6),
      Q => \^axaddr_incr_reg[11]_0\(6),
      R => '0'
    );
\axaddr_incr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr[11]_i_1_n_0\,
      D => p_1_in(7),
      Q => \^axaddr_incr_reg[11]_0\(7),
      R => '0'
    );
\axaddr_incr_reg[7]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \axaddr_incr_reg[3]_i_3_n_0\,
      CO(3) => \axaddr_incr_reg[7]_i_3_n_0\,
      CO(2) => \axaddr_incr_reg[7]_i_3_n_1\,
      CO(1) => \axaddr_incr_reg[7]_i_3_n_2\,
      CO(0) => \axaddr_incr_reg[7]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \axaddr_incr_reg[7]_i_3_n_4\,
      O(2) => \axaddr_incr_reg[7]_i_3_n_5\,
      O(1) => \axaddr_incr_reg[7]_i_3_n_6\,
      O(0) => \axaddr_incr_reg[7]_i_3_n_7\,
      S(3 downto 0) => \^axaddr_incr_reg[11]_0\(7 downto 4)
    );
\axaddr_incr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr[11]_i_1_n_0\,
      D => p_1_in(8),
      Q => \^axaddr_incr_reg[11]_0\(8),
      R => '0'
    );
\axaddr_incr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr[11]_i_1_n_0\,
      D => p_1_in(9),
      Q => \^axaddr_incr_reg[11]_0\(9),
      R => '0'
    );
\axlen_cnt[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444F44444444444"
    )
        port map (
      I0 => axlen_cnt(0),
      I1 => \^axlen_cnt_reg[5]_0\,
      I2 => \axlen_cnt_reg[3]_0\(6),
      I3 => Q(0),
      I4 => Q(1),
      I5 => si_rs_awvalid,
      O => \axlen_cnt[0]_i_1_n_0\
    );
\axlen_cnt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F44F4444"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\,
      I1 => \axlen_cnt_reg[3]_0\(7),
      I2 => axlen_cnt(1),
      I3 => axlen_cnt(0),
      I4 => \^axlen_cnt_reg[5]_0\,
      O => \axlen_cnt[1]_i_1_n_0\
    );
\axlen_cnt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4F4F44F44444444"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\,
      I1 => \axlen_cnt_reg[3]_0\(8),
      I2 => axlen_cnt(2),
      I3 => axlen_cnt(0),
      I4 => axlen_cnt(1),
      I5 => \^axlen_cnt_reg[5]_0\,
      O => \axlen_cnt[2]_i_1_n_0\
    );
\axlen_cnt[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4FF44444"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\,
      I1 => \axlen_cnt_reg[3]_0\(9),
      I2 => axlen_cnt(3),
      I3 => \axlen_cnt[3]_i_4_n_0\,
      I4 => \^axlen_cnt_reg[5]_0\,
      O => \axlen_cnt[3]_i_2_n_0\
    );
\axlen_cnt[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => axlen_cnt(0),
      I1 => axlen_cnt(1),
      I2 => axlen_cnt(2),
      O => \axlen_cnt[3]_i_4_n_0\
    );
\axlen_cnt[4]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888888888882"
    )
        port map (
      I0 => \^axlen_cnt_reg[5]_0\,
      I1 => axlen_cnt(4),
      I2 => axlen_cnt(3),
      I3 => axlen_cnt(0),
      I4 => axlen_cnt(1),
      I5 => axlen_cnt(2),
      O => \axlen_cnt[4]_i_1__2_n_0\
    );
\axlen_cnt[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA9"
    )
        port map (
      I0 => axlen_cnt(5),
      I1 => axlen_cnt(0),
      I2 => axlen_cnt(1),
      I3 => axlen_cnt(2),
      I4 => axlen_cnt(4),
      I5 => axlen_cnt(3),
      O => \axlen_cnt[5]_i_2_n_0\
    );
\axlen_cnt[6]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8882"
    )
        port map (
      I0 => \^axlen_cnt_reg[5]_0\,
      I1 => axlen_cnt(6),
      I2 => \axlen_cnt[7]_i_2_n_0\,
      I3 => axlen_cnt(5),
      O => \axlen_cnt[6]_i_1__0_n_0\
    );
\axlen_cnt[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888882"
    )
        port map (
      I0 => \^axlen_cnt_reg[5]_0\,
      I1 => axlen_cnt(7),
      I2 => \axlen_cnt[7]_i_2_n_0\,
      I3 => axlen_cnt(6),
      I4 => axlen_cnt(5),
      O => \axlen_cnt[7]_i_1__0_n_0\
    );
\axlen_cnt[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => axlen_cnt(3),
      I1 => axlen_cnt(4),
      I2 => axlen_cnt(2),
      I3 => axlen_cnt(1),
      I4 => axlen_cnt(0),
      O => \axlen_cnt[7]_i_2_n_0\
    );
\axlen_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[0]_i_1_n_0\,
      Q => axlen_cnt(0),
      R => '0'
    );
\axlen_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[1]_i_1_n_0\,
      Q => axlen_cnt(1),
      R => '0'
    );
\axlen_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[2]_i_1_n_0\,
      Q => axlen_cnt(2),
      R => '0'
    );
\axlen_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[3]_i_2_n_0\,
      Q => axlen_cnt(3),
      R => '0'
    );
\axlen_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[4]_i_1__2_n_0\,
      Q => axlen_cnt(4),
      R => '0'
    );
\axlen_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[5]_i_2_n_0\,
      Q => axlen_cnt(5),
      R => \axlen_cnt_reg[5]_1\
    );
\axlen_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[6]_i_1__0_n_0\,
      Q => axlen_cnt(6),
      R => '0'
    );
\axlen_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[7]_i_1__0_n_0\,
      Q => axlen_cnt(7),
      R => '0'
    );
next_pending_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF88F8"
    )
        port map (
      I0 => \^axlen_cnt_reg[5]_0\,
      I1 => \next\,
      I2 => \^next_pending_r\,
      I3 => \axlen_cnt_reg[4]_0\,
      I4 => next_pending_r_reg_0,
      O => incr_next_pending
    );
next_pending_r_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA8AAAA"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\,
      I1 => axlen_cnt(5),
      I2 => axlen_cnt(6),
      I3 => axlen_cnt(7),
      I4 => next_pending_r_i_5_n_0,
      O => \^axlen_cnt_reg[5]_0\
    );
next_pending_r_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => axlen_cnt(3),
      I1 => axlen_cnt(4),
      I2 => axlen_cnt(1),
      I3 => axlen_cnt(2),
      O => next_pending_r_i_5_n_0
    );
next_pending_r_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => incr_next_pending,
      Q => \^next_pending_r\,
      R => '0'
    );
sel_first_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => sel_first_reg_1,
      Q => \^sel_first_reg_0\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd_2 is
  port (
    incr_next_pending : out STD_LOGIC;
    sel_first_reg_0 : out STD_LOGIC;
    \axlen_cnt_reg[7]_0\ : out STD_LOGIC;
    \axaddr_incr_reg[11]_0\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \m_payload_i_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    aclk : in STD_LOGIC;
    sel_first_reg_1 : in STD_LOGIC;
    \axlen_cnt_reg[3]_0\ : in STD_LOGIC;
    \axlen_cnt_reg[3]_1\ : in STD_LOGIC_VECTOR ( 9 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    si_rs_arvalid : in STD_LOGIC;
    \axaddr_incr_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    r_push : in STD_LOGIC;
    \axlen_cnt_reg[4]_0\ : in STD_LOGIC;
    next_pending_r_reg_0 : in STD_LOGIC;
    \axaddr_incr_reg[11]_1\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_incr_reg[7]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_incr_reg[3]_1\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axlen_cnt_reg[7]_1\ : in STD_LOGIC;
    \axaddr_incr_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd_2 : entity is "axi_protocol_converter_v2_1_22_b2s_incr_cmd";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd_2;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd_2 is
  signal \axaddr_incr[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr[10]_i_1__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr[11]_i_2__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr[9]_i_1__0_n_0\ : STD_LOGIC;
  signal \^axaddr_incr_reg[11]_0\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \axaddr_incr_reg[11]_i_4__0_n_1\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_4__0_n_2\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_4__0_n_3\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_4__0_n_4\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_4__0_n_5\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_4__0_n_6\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_4__0_n_7\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3__0_n_1\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3__0_n_2\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3__0_n_3\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3__0_n_4\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3__0_n_5\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3__0_n_6\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_3__0_n_7\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3__0_n_1\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3__0_n_2\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3__0_n_3\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3__0_n_4\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3__0_n_5\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3__0_n_6\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_3__0_n_7\ : STD_LOGIC;
  signal \axlen_cnt[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \axlen_cnt[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \axlen_cnt[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \axlen_cnt[3]_i_2__1_n_0\ : STD_LOGIC;
  signal \axlen_cnt[3]_i_4__0_n_0\ : STD_LOGIC;
  signal \axlen_cnt[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \axlen_cnt[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \axlen_cnt[6]_i_1_n_0\ : STD_LOGIC;
  signal \axlen_cnt[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \^axlen_cnt_reg[7]_0\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[5]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[6]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[7]\ : STD_LOGIC;
  signal \^incr_next_pending\ : STD_LOGIC;
  signal next_pending_r : STD_LOGIC;
  signal \next_pending_r_i_4__0_n_0\ : STD_LOGIC;
  signal \^sel_first_reg_0\ : STD_LOGIC;
  signal \NLW_axaddr_incr_reg[11]_i_4__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axaddr_incr[0]_i_1__0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \axaddr_incr[10]_i_1__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \axaddr_incr[11]_i_2__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \axaddr_incr[1]_i_1__0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \axaddr_incr[2]_i_1__0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \axaddr_incr[3]_i_1__0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \axaddr_incr[4]_i_1__0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \axaddr_incr[5]_i_1__0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \axaddr_incr[6]_i_1__0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \axaddr_incr[7]_i_1__0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \axaddr_incr[8]_i_1__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \axaddr_incr[9]_i_1__0\ : label is "soft_lutpair8";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \axaddr_incr_reg[11]_i_4__0\ : label is 35;
  attribute ADDER_THRESHOLD of \axaddr_incr_reg[3]_i_3__0\ : label is 35;
  attribute ADDER_THRESHOLD of \axaddr_incr_reg[7]_i_3__0\ : label is 35;
  attribute SOFT_HLUTNM of \axlen_cnt[4]_i_1__1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \next_pending_r_i_4__0\ : label is "soft_lutpair7";
begin
  \axaddr_incr_reg[11]_0\(11 downto 0) <= \^axaddr_incr_reg[11]_0\(11 downto 0);
  \axlen_cnt_reg[7]_0\ <= \^axlen_cnt_reg[7]_0\;
  incr_next_pending <= \^incr_next_pending\;
  sel_first_reg_0 <= \^sel_first_reg_0\;
\axaddr_incr[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axaddr_incr_reg[3]_1\(0),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[3]_i_3__0_n_7\,
      O => \axaddr_incr[0]_i_1__0_n_0\
    );
\axaddr_incr[10]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axaddr_incr_reg[11]_1\(2),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[11]_i_4__0_n_5\,
      O => \axaddr_incr[10]_i_1__0_n_0\
    );
\axaddr_incr[11]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axaddr_incr_reg[11]_1\(3),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[11]_i_4__0_n_4\,
      O => \axaddr_incr[11]_i_2__0_n_0\
    );
\axaddr_incr[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axaddr_incr_reg[3]_1\(1),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[3]_i_3__0_n_6\,
      O => \axaddr_incr[1]_i_1__0_n_0\
    );
\axaddr_incr[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axaddr_incr_reg[3]_1\(2),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[3]_i_3__0_n_5\,
      O => \axaddr_incr[2]_i_1__0_n_0\
    );
\axaddr_incr[3]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0102020202020202"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\(0),
      I1 => \axlen_cnt_reg[3]_1\(5),
      I2 => \axlen_cnt_reg[3]_1\(4),
      I3 => Q(1),
      I4 => m_axi_arready,
      I5 => Q(0),
      O => \m_payload_i_reg[3]\(0)
    );
\axaddr_incr[3]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axaddr_incr_reg[3]_1\(3),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[3]_i_3__0_n_4\,
      O => \axaddr_incr[3]_i_1__0_n_0\
    );
\axaddr_incr[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\(3),
      I1 => \axlen_cnt_reg[3]_1\(5),
      I2 => \axlen_cnt_reg[3]_1\(4),
      I3 => Q(1),
      I4 => m_axi_arready,
      I5 => Q(0),
      O => \m_payload_i_reg[3]\(3)
    );
\axaddr_incr[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1A2A2A2A2A2A2A2A"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\(2),
      I1 => \axlen_cnt_reg[3]_1\(4),
      I2 => \axlen_cnt_reg[3]_1\(5),
      I3 => Q(1),
      I4 => m_axi_arready,
      I5 => Q(0),
      O => \m_payload_i_reg[3]\(2)
    );
\axaddr_incr[3]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1222222222222222"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\(1),
      I1 => \axlen_cnt_reg[3]_1\(5),
      I2 => \axlen_cnt_reg[3]_1\(4),
      I3 => Q(1),
      I4 => m_axi_arready,
      I5 => Q(0),
      O => \m_payload_i_reg[3]\(1)
    );
\axaddr_incr[4]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axaddr_incr_reg[7]_0\(0),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[7]_i_3__0_n_7\,
      O => \axaddr_incr[4]_i_1__0_n_0\
    );
\axaddr_incr[5]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axaddr_incr_reg[7]_0\(1),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[7]_i_3__0_n_6\,
      O => \axaddr_incr[5]_i_1__0_n_0\
    );
\axaddr_incr[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axaddr_incr_reg[7]_0\(2),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[7]_i_3__0_n_5\,
      O => \axaddr_incr[6]_i_1__0_n_0\
    );
\axaddr_incr[7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axaddr_incr_reg[7]_0\(3),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[7]_i_3__0_n_4\,
      O => \axaddr_incr[7]_i_1__0_n_0\
    );
\axaddr_incr[8]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axaddr_incr_reg[11]_1\(0),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[11]_i_4__0_n_7\,
      O => \axaddr_incr[8]_i_1__0_n_0\
    );
\axaddr_incr[9]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axaddr_incr_reg[11]_1\(1),
      I1 => \^sel_first_reg_0\,
      I2 => \axaddr_incr_reg[11]_i_4__0_n_6\,
      O => \axaddr_incr[9]_i_1__0_n_0\
    );
\axaddr_incr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr_reg[0]_0\(0),
      D => \axaddr_incr[0]_i_1__0_n_0\,
      Q => \^axaddr_incr_reg[11]_0\(0),
      R => '0'
    );
\axaddr_incr_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr_reg[0]_0\(0),
      D => \axaddr_incr[10]_i_1__0_n_0\,
      Q => \^axaddr_incr_reg[11]_0\(10),
      R => '0'
    );
\axaddr_incr_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr_reg[0]_0\(0),
      D => \axaddr_incr[11]_i_2__0_n_0\,
      Q => \^axaddr_incr_reg[11]_0\(11),
      R => '0'
    );
\axaddr_incr_reg[11]_i_4__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \axaddr_incr_reg[7]_i_3__0_n_0\,
      CO(3) => \NLW_axaddr_incr_reg[11]_i_4__0_CO_UNCONNECTED\(3),
      CO(2) => \axaddr_incr_reg[11]_i_4__0_n_1\,
      CO(1) => \axaddr_incr_reg[11]_i_4__0_n_2\,
      CO(0) => \axaddr_incr_reg[11]_i_4__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \axaddr_incr_reg[11]_i_4__0_n_4\,
      O(2) => \axaddr_incr_reg[11]_i_4__0_n_5\,
      O(1) => \axaddr_incr_reg[11]_i_4__0_n_6\,
      O(0) => \axaddr_incr_reg[11]_i_4__0_n_7\,
      S(3 downto 0) => \^axaddr_incr_reg[11]_0\(11 downto 8)
    );
\axaddr_incr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr_reg[0]_0\(0),
      D => \axaddr_incr[1]_i_1__0_n_0\,
      Q => \^axaddr_incr_reg[11]_0\(1),
      R => '0'
    );
\axaddr_incr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr_reg[0]_0\(0),
      D => \axaddr_incr[2]_i_1__0_n_0\,
      Q => \^axaddr_incr_reg[11]_0\(2),
      R => '0'
    );
\axaddr_incr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr_reg[0]_0\(0),
      D => \axaddr_incr[3]_i_1__0_n_0\,
      Q => \^axaddr_incr_reg[11]_0\(3),
      R => '0'
    );
\axaddr_incr_reg[3]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \axaddr_incr_reg[3]_i_3__0_n_0\,
      CO(2) => \axaddr_incr_reg[3]_i_3__0_n_1\,
      CO(1) => \axaddr_incr_reg[3]_i_3__0_n_2\,
      CO(0) => \axaddr_incr_reg[3]_i_3__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^axaddr_incr_reg[11]_0\(3 downto 0),
      O(3) => \axaddr_incr_reg[3]_i_3__0_n_4\,
      O(2) => \axaddr_incr_reg[3]_i_3__0_n_5\,
      O(1) => \axaddr_incr_reg[3]_i_3__0_n_6\,
      O(0) => \axaddr_incr_reg[3]_i_3__0_n_7\,
      S(3 downto 0) => \axaddr_incr_reg[3]_0\(3 downto 0)
    );
\axaddr_incr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr_reg[0]_0\(0),
      D => \axaddr_incr[4]_i_1__0_n_0\,
      Q => \^axaddr_incr_reg[11]_0\(4),
      R => '0'
    );
\axaddr_incr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr_reg[0]_0\(0),
      D => \axaddr_incr[5]_i_1__0_n_0\,
      Q => \^axaddr_incr_reg[11]_0\(5),
      R => '0'
    );
\axaddr_incr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr_reg[0]_0\(0),
      D => \axaddr_incr[6]_i_1__0_n_0\,
      Q => \^axaddr_incr_reg[11]_0\(6),
      R => '0'
    );
\axaddr_incr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr_reg[0]_0\(0),
      D => \axaddr_incr[7]_i_1__0_n_0\,
      Q => \^axaddr_incr_reg[11]_0\(7),
      R => '0'
    );
\axaddr_incr_reg[7]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \axaddr_incr_reg[3]_i_3__0_n_0\,
      CO(3) => \axaddr_incr_reg[7]_i_3__0_n_0\,
      CO(2) => \axaddr_incr_reg[7]_i_3__0_n_1\,
      CO(1) => \axaddr_incr_reg[7]_i_3__0_n_2\,
      CO(0) => \axaddr_incr_reg[7]_i_3__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \axaddr_incr_reg[7]_i_3__0_n_4\,
      O(2) => \axaddr_incr_reg[7]_i_3__0_n_5\,
      O(1) => \axaddr_incr_reg[7]_i_3__0_n_6\,
      O(0) => \axaddr_incr_reg[7]_i_3__0_n_7\,
      S(3 downto 0) => \^axaddr_incr_reg[11]_0\(7 downto 4)
    );
\axaddr_incr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr_reg[0]_0\(0),
      D => \axaddr_incr[8]_i_1__0_n_0\,
      Q => \^axaddr_incr_reg[11]_0\(8),
      R => '0'
    );
\axaddr_incr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_incr_reg[0]_0\(0),
      D => \axaddr_incr[9]_i_1__0_n_0\,
      Q => \^axaddr_incr_reg[11]_0\(9),
      R => '0'
    );
\axlen_cnt[0]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44F44444"
    )
        port map (
      I0 => \axlen_cnt_reg_n_0_[0]\,
      I1 => \^axlen_cnt_reg[7]_0\,
      I2 => \axlen_cnt_reg[3]_1\(6),
      I3 => Q(1),
      I4 => si_rs_arvalid,
      O => \axlen_cnt[0]_i_1__1_n_0\
    );
\axlen_cnt[1]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F44F4444"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_0\,
      I1 => \axlen_cnt_reg[3]_1\(7),
      I2 => \axlen_cnt_reg_n_0_[1]\,
      I3 => \axlen_cnt_reg_n_0_[0]\,
      I4 => \^axlen_cnt_reg[7]_0\,
      O => \axlen_cnt[1]_i_1__1_n_0\
    );
\axlen_cnt[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4F4F44F44444444"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_0\,
      I1 => \axlen_cnt_reg[3]_1\(8),
      I2 => \axlen_cnt_reg_n_0_[2]\,
      I3 => \axlen_cnt_reg_n_0_[0]\,
      I4 => \axlen_cnt_reg_n_0_[1]\,
      I5 => \^axlen_cnt_reg[7]_0\,
      O => \axlen_cnt[2]_i_1__1_n_0\
    );
\axlen_cnt[3]_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4FF44444"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_0\,
      I1 => \axlen_cnt_reg[3]_1\(9),
      I2 => \axlen_cnt_reg_n_0_[3]\,
      I3 => \axlen_cnt[3]_i_4__0_n_0\,
      I4 => \^axlen_cnt_reg[7]_0\,
      O => \axlen_cnt[3]_i_2__1_n_0\
    );
\axlen_cnt[3]_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \axlen_cnt_reg_n_0_[0]\,
      I1 => \axlen_cnt_reg_n_0_[1]\,
      I2 => \axlen_cnt_reg_n_0_[2]\,
      O => \axlen_cnt[3]_i_4__0_n_0\
    );
\axlen_cnt[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
        port map (
      I0 => \axlen_cnt_reg_n_0_[4]\,
      I1 => \axlen_cnt_reg_n_0_[3]\,
      I2 => \axlen_cnt_reg_n_0_[0]\,
      I3 => \axlen_cnt_reg_n_0_[1]\,
      I4 => \axlen_cnt_reg_n_0_[2]\,
      O => \axlen_cnt[4]_i_1__1_n_0\
    );
\axlen_cnt[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA9"
    )
        port map (
      I0 => \axlen_cnt_reg_n_0_[5]\,
      I1 => \axlen_cnt_reg_n_0_[0]\,
      I2 => \axlen_cnt_reg_n_0_[1]\,
      I3 => \axlen_cnt_reg_n_0_[2]\,
      I4 => \axlen_cnt_reg_n_0_[4]\,
      I5 => \axlen_cnt_reg_n_0_[3]\,
      O => \axlen_cnt[5]_i_1__0_n_0\
    );
\axlen_cnt[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA9AA"
    )
        port map (
      I0 => \axlen_cnt_reg_n_0_[6]\,
      I1 => \axlen_cnt_reg_n_0_[3]\,
      I2 => \axlen_cnt_reg_n_0_[4]\,
      I3 => \axlen_cnt[3]_i_4__0_n_0\,
      I4 => \axlen_cnt_reg_n_0_[5]\,
      O => \axlen_cnt[6]_i_1_n_0\
    );
\axlen_cnt[7]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA9AA"
    )
        port map (
      I0 => \axlen_cnt_reg_n_0_[7]\,
      I1 => \axlen_cnt_reg_n_0_[6]\,
      I2 => \axlen_cnt_reg_n_0_[5]\,
      I3 => \axlen_cnt[3]_i_4__0_n_0\,
      I4 => \axlen_cnt_reg_n_0_[4]\,
      I5 => \axlen_cnt_reg_n_0_[3]\,
      O => \axlen_cnt[7]_i_2__0_n_0\
    );
\axlen_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[0]_i_1__1_n_0\,
      Q => \axlen_cnt_reg_n_0_[0]\,
      R => '0'
    );
\axlen_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[1]_i_1__1_n_0\,
      Q => \axlen_cnt_reg_n_0_[1]\,
      R => '0'
    );
\axlen_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[2]_i_1__1_n_0\,
      Q => \axlen_cnt_reg_n_0_[2]\,
      R => '0'
    );
\axlen_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[3]_i_2__1_n_0\,
      Q => \axlen_cnt_reg_n_0_[3]\,
      R => '0'
    );
\axlen_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[4]_i_1__1_n_0\,
      Q => \axlen_cnt_reg_n_0_[4]\,
      R => \axlen_cnt_reg[7]_1\
    );
\axlen_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[5]_i_1__0_n_0\,
      Q => \axlen_cnt_reg_n_0_[5]\,
      R => \axlen_cnt_reg[7]_1\
    );
\axlen_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[6]_i_1_n_0\,
      Q => \axlen_cnt_reg_n_0_[6]\,
      R => \axlen_cnt_reg[7]_1\
    );
\axlen_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axlen_cnt_reg[4]_0\,
      D => \axlen_cnt[7]_i_2__0_n_0\,
      Q => \axlen_cnt_reg_n_0_[7]\,
      R => \axlen_cnt_reg[7]_1\
    );
\next_pending_r_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF88F8"
    )
        port map (
      I0 => \^axlen_cnt_reg[7]_0\,
      I1 => r_push,
      I2 => next_pending_r,
      I3 => \axlen_cnt_reg[4]_0\,
      I4 => next_pending_r_reg_0,
      O => \^incr_next_pending\
    );
\next_pending_r_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA8AAAA"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_0\,
      I1 => \axlen_cnt_reg_n_0_[7]\,
      I2 => \axlen_cnt_reg_n_0_[5]\,
      I3 => \axlen_cnt_reg_n_0_[6]\,
      I4 => \next_pending_r_i_4__0_n_0\,
      O => \^axlen_cnt_reg[7]_0\
    );
\next_pending_r_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \axlen_cnt_reg_n_0_[3]\,
      I1 => \axlen_cnt_reg_n_0_[4]\,
      I2 => \axlen_cnt_reg_n_0_[1]\,
      I3 => \axlen_cnt_reg_n_0_[2]\,
      O => \next_pending_r_i_4__0_n_0\
    );
next_pending_r_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \^incr_next_pending\,
      Q => next_pending_r,
      R => '0'
    );
sel_first_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => sel_first_reg_1,
      Q => \^sel_first_reg_0\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_rd_cmd_fsm is
  port (
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axaddr_offset : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \FSM_sequential_state_reg[1]_0\ : out STD_LOGIC;
    \FSM_sequential_state_reg[1]_1\ : out STD_LOGIC;
    \wrap_second_len_r_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_0_arready : out STD_LOGIC;
    M00_AXI_0_arready_0 : out STD_LOGIC;
    sel_first_i : out STD_LOGIC;
    M00_AXI_0_arready_1 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    sel_first_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    \m_payload_i_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \FSM_sequential_state_reg[1]_2\ : out STD_LOGIC;
    m_axi_arvalid : out STD_LOGIC;
    m_valid_i0 : out STD_LOGIC;
    s_ready_i0 : out STD_LOGIC;
    m_valid_i_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    si_rs_arvalid : in STD_LOGIC;
    \wrap_second_len_r_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arready : in STD_LOGIC;
    \axlen_cnt_reg[7]\ : in STD_LOGIC;
    \wrap_second_len_r_reg[3]_1\ : in STD_LOGIC;
    \axaddr_offset_r_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_offset_r_reg[3]_0\ : in STD_LOGIC_VECTOR ( 13 downto 0 );
    \axaddr_offset_r_reg[0]\ : in STD_LOGIC;
    \FSM_sequential_state_reg[0]_0\ : in STD_LOGIC;
    \FSM_sequential_state_reg[1]_3\ : in STD_LOGIC;
    \axaddr_offset_r_reg[2]\ : in STD_LOGIC;
    \axaddr_offset_r_reg[2]_0\ : in STD_LOGIC;
    \axaddr_offset_r_reg[1]\ : in STD_LOGIC;
    \axaddr_offset_r_reg[1]_0\ : in STD_LOGIC;
    \axaddr_offset_r_reg[3]_1\ : in STD_LOGIC;
    sel_first_reg_0 : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    \axaddr_incr_reg[0]\ : in STD_LOGIC;
    sel_first_reg_1 : in STD_LOGIC;
    O : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_wrap_reg[11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \axaddr_wrap_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_wrap_reg[7]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_wrap_reg[10]\ : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_ready_i_reg : in STD_LOGIC;
    aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_rd_cmd_fsm : entity is "axi_protocol_converter_v2_1_22_b2s_rd_cmd_fsm";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_rd_cmd_fsm;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_rd_cmd_fsm is
  signal \^fsm_sequential_state_reg[1]_1\ : STD_LOGIC;
  signal \^fsm_sequential_state_reg[1]_2\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^axaddr_offset\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \axaddr_wrap[11]_i_2__0_n_0\ : STD_LOGIC;
  signal \axaddr_wrap[11]_i_4__0_n_0\ : STD_LOGIC;
  signal \next_state__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \wrap_cnt_r[2]_i_2__0_n_0\ : STD_LOGIC;
  signal \wrap_cnt_r[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \^wrap_second_len_r_reg[3]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_1__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_1__0\ : label is "soft_lutpair2";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "SM_IDLE:01,SM_DONE:00,SM_CMD_ACCEPTED:10,SM_CMD_EN:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "SM_IDLE:01,SM_DONE:00,SM_CMD_ACCEPTED:10,SM_CMD_EN:11";
  attribute SOFT_HLUTNM of \axaddr_incr[11]_i_1__0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \axaddr_wrap[11]_i_2__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \axaddr_wrap[11]_i_4__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \axlen_cnt[3]_i_1__2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \axlen_cnt[3]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \axlen_cnt[7]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of m_axi_arvalid_INST_0 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \m_payload_i[31]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of m_valid_i_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of r_push_r_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of s_ready_i_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wrap_boundary_axaddr_r[11]_i_1__0\ : label is "soft_lutpair5";
begin
  \FSM_sequential_state_reg[1]_1\ <= \^fsm_sequential_state_reg[1]_1\;
  \FSM_sequential_state_reg[1]_2\ <= \^fsm_sequential_state_reg[1]_2\;
  Q(1 downto 0) <= \^q\(1 downto 0);
  axaddr_offset(3 downto 0) <= \^axaddr_offset\(3 downto 0);
  \wrap_second_len_r_reg[3]\(3 downto 0) <= \^wrap_second_len_r_reg[3]\(3 downto 0);
\FSM_sequential_state[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555577F7"
    )
        port map (
      I0 => \^q\(1),
      I1 => \FSM_sequential_state_reg[0]_0\,
      I2 => \^q\(0),
      I3 => m_axi_arready,
      I4 => \FSM_sequential_state_reg[1]_3\,
      O => \next_state__0\(0)
    );
\FSM_sequential_state[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF4040"
    )
        port map (
      I0 => \FSM_sequential_state_reg[0]_0\,
      I1 => \^q\(0),
      I2 => si_rs_arvalid,
      I3 => \FSM_sequential_state_reg[1]_3\,
      I4 => \^q\(1),
      O => \next_state__0\(1)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \next_state__0\(0),
      Q => \^q\(0),
      S => areset_d1
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \next_state__0\(1),
      Q => \^q\(1),
      R => areset_d1
    );
\axaddr_incr[11]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EAAA"
    )
        port map (
      I0 => \axaddr_incr_reg[0]\,
      I1 => \^q\(0),
      I2 => m_axi_arready,
      I3 => \^q\(1),
      O => sel_first_reg(0)
    );
\axaddr_offset_r[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEAAA2AAA2AAA2A"
    )
        port map (
      I0 => \axaddr_offset_r_reg[3]\(0),
      I1 => si_rs_arvalid,
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \axaddr_offset_r_reg[3]_0\(12),
      I5 => \axaddr_offset_r_reg[0]\,
      O => \^axaddr_offset\(0)
    );
\axaddr_offset_r[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAABAAABAAA8AAA"
    )
        port map (
      I0 => \axaddr_offset_r_reg[3]\(1),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => si_rs_arvalid,
      I4 => \axaddr_offset_r_reg[1]\,
      I5 => \axaddr_offset_r_reg[1]_0\,
      O => \^axaddr_offset\(1)
    );
\axaddr_offset_r[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAA8AAABAAABAAA"
    )
        port map (
      I0 => \axaddr_offset_r_reg[3]\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => si_rs_arvalid,
      I4 => \axaddr_offset_r_reg[2]\,
      I5 => \axaddr_offset_r_reg[2]_0\,
      O => \^axaddr_offset\(2)
    );
\axaddr_offset_r[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA30AAAAAA"
    )
        port map (
      I0 => \axaddr_offset_r_reg[3]\(3),
      I1 => \axaddr_offset_r_reg[3]_1\,
      I2 => \axaddr_offset_r_reg[3]_0\(13),
      I3 => si_rs_arvalid,
      I4 => \^q\(0),
      I5 => \^q\(1),
      O => \^axaddr_offset\(3)
    );
\axaddr_wrap[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_2__0_n_0\,
      I1 => \axaddr_wrap_reg[3]\(0),
      I2 => \axaddr_offset_r_reg[3]_0\(0),
      I3 => \^fsm_sequential_state_reg[1]_2\,
      I4 => \axaddr_wrap_reg[11]\(0),
      I5 => \axaddr_wrap[11]_i_4__0_n_0\,
      O => \m_payload_i_reg[11]\(0)
    );
\axaddr_wrap[10]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_2__0_n_0\,
      I1 => O(2),
      I2 => \axaddr_wrap_reg[11]\(10),
      I3 => \axaddr_wrap[11]_i_4__0_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(10),
      I5 => \^fsm_sequential_state_reg[1]_2\,
      O => \m_payload_i_reg[11]\(10)
    );
\axaddr_wrap[11]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_2__0_n_0\,
      I1 => O(3),
      I2 => \axaddr_offset_r_reg[3]_0\(11),
      I3 => \^fsm_sequential_state_reg[1]_2\,
      I4 => \axaddr_wrap_reg[11]\(11),
      I5 => \axaddr_wrap[11]_i_4__0_n_0\,
      O => \m_payload_i_reg[11]\(11)
    );
\axaddr_wrap[11]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFFF"
    )
        port map (
      I0 => \axaddr_wrap_reg[10]\,
      I1 => \^q\(0),
      I2 => m_axi_arready,
      I3 => \^q\(1),
      O => \axaddr_wrap[11]_i_2__0_n_0\
    );
\axaddr_wrap[11]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \^q\(0),
      I1 => m_axi_arready,
      I2 => \^q\(1),
      I3 => \axaddr_wrap_reg[10]\,
      O => \axaddr_wrap[11]_i_4__0_n_0\
    );
\axaddr_wrap[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_2__0_n_0\,
      I1 => \axaddr_wrap_reg[3]\(1),
      I2 => \axaddr_offset_r_reg[3]_0\(1),
      I3 => \^fsm_sequential_state_reg[1]_2\,
      I4 => \axaddr_wrap_reg[11]\(1),
      I5 => \axaddr_wrap[11]_i_4__0_n_0\,
      O => \m_payload_i_reg[11]\(1)
    );
\axaddr_wrap[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_4__0_n_0\,
      I1 => \axaddr_wrap_reg[11]\(2),
      I2 => \axaddr_wrap_reg[3]\(2),
      I3 => \axaddr_wrap[11]_i_2__0_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(2),
      I5 => \^fsm_sequential_state_reg[1]_2\,
      O => \m_payload_i_reg[11]\(2)
    );
\axaddr_wrap[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_2__0_n_0\,
      I1 => \axaddr_wrap_reg[3]\(3),
      I2 => \axaddr_wrap_reg[11]\(3),
      I3 => \axaddr_wrap[11]_i_4__0_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(3),
      I5 => \^fsm_sequential_state_reg[1]_2\,
      O => \m_payload_i_reg[11]\(3)
    );
\axaddr_wrap[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_4__0_n_0\,
      I1 => \axaddr_wrap_reg[11]\(4),
      I2 => \axaddr_wrap_reg[7]\(0),
      I3 => \axaddr_wrap[11]_i_2__0_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(4),
      I5 => \^fsm_sequential_state_reg[1]_2\,
      O => \m_payload_i_reg[11]\(4)
    );
\axaddr_wrap[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_2__0_n_0\,
      I1 => \axaddr_wrap_reg[7]\(1),
      I2 => \axaddr_wrap_reg[11]\(5),
      I3 => \axaddr_wrap[11]_i_4__0_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(5),
      I5 => \^fsm_sequential_state_reg[1]_2\,
      O => \m_payload_i_reg[11]\(5)
    );
\axaddr_wrap[6]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_2__0_n_0\,
      I1 => \axaddr_wrap_reg[7]\(2),
      I2 => \axaddr_wrap_reg[11]\(6),
      I3 => \axaddr_wrap[11]_i_4__0_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(6),
      I5 => \^fsm_sequential_state_reg[1]_2\,
      O => \m_payload_i_reg[11]\(6)
    );
\axaddr_wrap[7]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_2__0_n_0\,
      I1 => \axaddr_wrap_reg[7]\(3),
      I2 => \axaddr_offset_r_reg[3]_0\(7),
      I3 => \^fsm_sequential_state_reg[1]_2\,
      I4 => \axaddr_wrap_reg[11]\(7),
      I5 => \axaddr_wrap[11]_i_4__0_n_0\,
      O => \m_payload_i_reg[11]\(7)
    );
\axaddr_wrap[8]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_2__0_n_0\,
      I1 => O(0),
      I2 => \axaddr_offset_r_reg[3]_0\(8),
      I3 => \^fsm_sequential_state_reg[1]_2\,
      I4 => \axaddr_wrap_reg[11]\(8),
      I5 => \axaddr_wrap[11]_i_4__0_n_0\,
      O => \m_payload_i_reg[11]\(8)
    );
\axaddr_wrap[9]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_4__0_n_0\,
      I1 => \axaddr_wrap_reg[11]\(9),
      I2 => O(1),
      I3 => \axaddr_wrap[11]_i_2__0_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(9),
      I5 => \^fsm_sequential_state_reg[1]_2\,
      O => \m_payload_i_reg[11]\(9)
    );
\axlen_cnt[3]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A0C0"
    )
        port map (
      I0 => m_axi_arready,
      I1 => si_rs_arvalid,
      I2 => \^q\(0),
      I3 => \^q\(1),
      O => M00_AXI_0_arready_1
    );
\axlen_cnt[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => si_rs_arvalid,
      O => \^fsm_sequential_state_reg[1]_1\
    );
\axlen_cnt[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000C840"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => si_rs_arvalid,
      I3 => m_axi_arready,
      I4 => \axlen_cnt_reg[7]\,
      O => \FSM_sequential_state_reg[1]_0\
    );
m_axi_arvalid_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      O => m_axi_arvalid
    );
\m_payload_i[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"57"
    )
        port map (
      I0 => si_rs_arvalid,
      I1 => \^q\(0),
      I2 => \^q\(1),
      O => m_valid_i_reg(0)
    );
m_valid_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE0FFFF"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => si_rs_arvalid,
      I3 => s_axi_arvalid,
      I4 => s_ready_i_reg,
      O => m_valid_i0
    );
r_push_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^q\(1),
      I1 => m_axi_arready,
      I2 => \^q\(0),
      O => \^fsm_sequential_state_reg[1]_2\
    );
s_ready_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1FFF1F1F"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => si_rs_arvalid,
      I3 => s_axi_arvalid,
      I4 => s_ready_i_reg,
      O => s_ready_i0
    );
\sel_first_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF4FCC4CCC"
    )
        port map (
      I0 => m_axi_arready,
      I1 => sel_first_reg_0,
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => si_rs_arvalid,
      I5 => areset_d1,
      O => M00_AXI_0_arready
    );
\sel_first_i_1__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF4FCC4CCC"
    )
        port map (
      I0 => m_axi_arready,
      I1 => \axaddr_incr_reg[0]\,
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => si_rs_arvalid,
      I5 => areset_d1,
      O => M00_AXI_0_arready_0
    );
\sel_first_i_1__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFFFFFFFCECECCCC"
    )
        port map (
      I0 => si_rs_arvalid,
      I1 => areset_d1,
      I2 => \^q\(1),
      I3 => m_axi_arready,
      I4 => \^q\(0),
      I5 => sel_first_reg_1,
      O => sel_first_i
    );
\wrap_boundary_axaddr_r[11]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => si_rs_arvalid,
      I1 => \^q\(0),
      I2 => \^q\(1),
      O => E(0)
    );
\wrap_cnt_r[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"38333333C8CCCCCC"
    )
        port map (
      I0 => \^axaddr_offset\(0),
      I1 => \wrap_cnt_r[2]_i_2__0_n_0\,
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => si_rs_arvalid,
      I5 => \wrap_second_len_r_reg[3]_0\(0),
      O => D(0)
    );
\wrap_cnt_r[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3CCCA0A0"
    )
        port map (
      I0 => \^axaddr_offset\(1),
      I1 => \wrap_second_len_r_reg[3]_0\(1),
      I2 => \wrap_cnt_r[2]_i_2__0_n_0\,
      I3 => \wrap_second_len_r_reg[3]_0\(0),
      I4 => \^fsm_sequential_state_reg[1]_1\,
      O => D(1)
    );
\wrap_cnt_r[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"59A9AAAAAAAAAAAA"
    )
        port map (
      I0 => \^wrap_second_len_r_reg[3]\(2),
      I1 => \^axaddr_offset\(0),
      I2 => \^fsm_sequential_state_reg[1]_1\,
      I3 => \wrap_second_len_r_reg[3]_0\(0),
      I4 => \wrap_cnt_r[2]_i_2__0_n_0\,
      I5 => \^wrap_second_len_r_reg[3]\(1),
      O => D(2)
    );
\wrap_cnt_r[2]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^axaddr_offset\(1),
      I1 => \^axaddr_offset\(2),
      I2 => \^axaddr_offset\(0),
      I3 => \^axaddr_offset\(3),
      O => \wrap_cnt_r[2]_i_2__0_n_0\
    );
\wrap_cnt_r[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A6AA"
    )
        port map (
      I0 => \^wrap_second_len_r_reg[3]\(3),
      I1 => \^wrap_second_len_r_reg[3]\(1),
      I2 => \wrap_cnt_r[3]_i_2__0_n_0\,
      I3 => \^wrap_second_len_r_reg[3]\(2),
      O => D(3)
    );
\wrap_cnt_r[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"772277227722772F"
    )
        port map (
      I0 => \^fsm_sequential_state_reg[1]_1\,
      I1 => \wrap_second_len_r_reg[3]_0\(0),
      I2 => \^axaddr_offset\(3),
      I3 => \^axaddr_offset\(0),
      I4 => \^axaddr_offset\(2),
      I5 => \^axaddr_offset\(1),
      O => \wrap_cnt_r[3]_i_2__0_n_0\
    );
\wrap_second_len_r[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88BB88BB88BB88B8"
    )
        port map (
      I0 => \wrap_second_len_r_reg[3]_0\(0),
      I1 => \^fsm_sequential_state_reg[1]_1\,
      I2 => \^axaddr_offset\(3),
      I3 => \^axaddr_offset\(0),
      I4 => \^axaddr_offset\(2),
      I5 => \^axaddr_offset\(1),
      O => \^wrap_second_len_r_reg[3]\(0)
    );
\wrap_second_len_r[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB88BB8888BB88B8"
    )
        port map (
      I0 => \wrap_second_len_r_reg[3]_0\(1),
      I1 => \^fsm_sequential_state_reg[1]_1\,
      I2 => \^axaddr_offset\(3),
      I3 => \^axaddr_offset\(0),
      I4 => \^axaddr_offset\(2),
      I5 => \^axaddr_offset\(1),
      O => \^wrap_second_len_r_reg[3]\(1)
    );
\wrap_second_len_r[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBB8888BB8888B8"
    )
        port map (
      I0 => \wrap_second_len_r_reg[3]_0\(2),
      I1 => \^fsm_sequential_state_reg[1]_1\,
      I2 => \^axaddr_offset\(3),
      I3 => \^axaddr_offset\(0),
      I4 => \^axaddr_offset\(2),
      I5 => \^axaddr_offset\(1),
      O => \^wrap_second_len_r_reg[3]\(2)
    );
\wrap_second_len_r[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF888888888"
    )
        port map (
      I0 => \^fsm_sequential_state_reg[1]_1\,
      I1 => \wrap_second_len_r_reg[3]_0\(3),
      I2 => \^axaddr_offset\(0),
      I3 => \^axaddr_offset\(1),
      I4 => \^axaddr_offset\(2),
      I5 => \wrap_second_len_r_reg[3]_1\,
      O => \^wrap_second_len_r_reg[3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo is
  port (
    sel : out STD_LOGIC;
    addr : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \bresp_cnt_reg[1]\ : out STD_LOGIC;
    \cnt_read_reg[1]_0\ : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    mhandshake_r : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    b_push : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    aclk : in STD_LOGIC;
    shandshake_r : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo : entity is "axi_protocol_converter_v2_1_22_b2s_simple_fifo";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo is
  signal \^addr\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^bresp_cnt_reg[1]\ : STD_LOGIC;
  signal \cnt_read[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_read[1]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_read[1]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_read[1]_i_4_n_0\ : STD_LOGIC;
  signal \memory_reg[3][0]_srl4_i_2_n_0\ : STD_LOGIC;
  signal \memory_reg[3][0]_srl4_i_3_n_0\ : STD_LOGIC;
  signal \memory_reg[3][0]_srl4_i_4_n_0\ : STD_LOGIC;
  signal \memory_reg[3][0]_srl4_n_0\ : STD_LOGIC;
  signal \memory_reg[3][1]_srl4_n_0\ : STD_LOGIC;
  signal \memory_reg[3][2]_srl4_n_0\ : STD_LOGIC;
  signal \memory_reg[3][3]_srl4_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of bvalid_i_i_3 : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of \cnt_read[0]_i_1\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of \cnt_read[1]_i_1\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of \cnt_read[1]_i_4\ : label is "soft_lutpair119";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \memory_reg[3][0]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name : string;
  attribute srl_name of \memory_reg[3][0]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][0]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][10]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][10]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][10]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][11]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][11]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][11]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][12]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][12]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][12]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][13]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][13]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][13]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][14]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][14]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][14]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][15]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][15]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][15]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][16]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][16]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][16]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][17]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][17]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][17]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][18]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][18]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][18]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][19]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][19]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][19]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][1]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][1]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][1]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][2]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][2]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][2]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][3]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][3]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][3]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][8]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][8]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][8]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][9]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][9]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][9]_srl4 ";
begin
  addr(1 downto 0) <= \^addr\(1 downto 0);
  \bresp_cnt_reg[1]\ <= \^bresp_cnt_reg[1]\;
\bresp_cnt[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => areset_d1,
      I1 => \^bresp_cnt_reg[1]\,
      O => SR(0)
    );
bvalid_i_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^addr\(1),
      I1 => \^addr\(0),
      O => \cnt_read_reg[1]_0\
    );
\cnt_read[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => b_push,
      I1 => shandshake_r,
      I2 => \^addr\(0),
      O => \cnt_read[0]_i_1_n_0\
    );
\cnt_read[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DB24"
    )
        port map (
      I0 => \^addr\(0),
      I1 => shandshake_r,
      I2 => b_push,
      I3 => \^addr\(1),
      O => \cnt_read[1]_i_1_n_0\
    );
\cnt_read[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000041000041"
    )
        port map (
      I0 => \cnt_read[1]_i_3_n_0\,
      I1 => \memory_reg[3][1]_srl4_n_0\,
      I2 => Q(1),
      I3 => \memory_reg[3][2]_srl4_n_0\,
      I4 => Q(2),
      I5 => \cnt_read[1]_i_4_n_0\,
      O => \^bresp_cnt_reg[1]\
    );
\cnt_read[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFEFFFFFFFFEFFE"
    )
        port map (
      I0 => Q(5),
      I1 => Q(4),
      I2 => Q(0),
      I3 => \memory_reg[3][0]_srl4_n_0\,
      I4 => Q(3),
      I5 => \memory_reg[3][3]_srl4_n_0\,
      O => \cnt_read[1]_i_3_n_0\
    );
\cnt_read[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF8FF"
    )
        port map (
      I0 => \^addr\(0),
      I1 => \^addr\(1),
      I2 => Q(7),
      I3 => mhandshake_r,
      I4 => Q(6),
      O => \cnt_read[1]_i_4_n_0\
    );
\cnt_read_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \cnt_read[0]_i_1_n_0\,
      Q => \^addr\(0),
      S => areset_d1
    );
\cnt_read_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \cnt_read[1]_i_1_n_0\,
      Q => \^addr\(1),
      S => areset_d1
    );
\memory_reg[3][0]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(0),
      Q => \memory_reg[3][0]_srl4_n_0\
    );
\memory_reg[3][0]_srl4_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000200"
    )
        port map (
      I0 => \memory_reg[3][0]_srl4_i_2_n_0\,
      I1 => Q(4),
      I2 => Q(6),
      I3 => mhandshake_r,
      I4 => \memory_reg[3][0]_srl4_i_3_n_0\,
      I5 => \memory_reg[3][0]_srl4_i_4_n_0\,
      O => sel
    );
\memory_reg[3][0]_srl4_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD0D00000000DD0D"
    )
        port map (
      I0 => \memory_reg[3][3]_srl4_n_0\,
      I1 => Q(3),
      I2 => \memory_reg[3][2]_srl4_n_0\,
      I3 => Q(2),
      I4 => \memory_reg[3][1]_srl4_n_0\,
      I5 => Q(1),
      O => \memory_reg[3][0]_srl4_i_2_n_0\
    );
\memory_reg[3][0]_srl4_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF8"
    )
        port map (
      I0 => \^addr\(0),
      I1 => \^addr\(1),
      I2 => Q(7),
      I3 => Q(5),
      O => \memory_reg[3][0]_srl4_i_3_n_0\
    );
\memory_reg[3][0]_srl4_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2FF22FF2FFFF2FF2"
    )
        port map (
      I0 => Q(2),
      I1 => \memory_reg[3][2]_srl4_n_0\,
      I2 => \memory_reg[3][0]_srl4_n_0\,
      I3 => Q(0),
      I4 => Q(3),
      I5 => \memory_reg[3][3]_srl4_n_0\,
      O => \memory_reg[3][0]_srl4_i_4_n_0\
    );
\memory_reg[3][10]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(6),
      Q => \out\(2)
    );
\memory_reg[3][11]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(7),
      Q => \out\(3)
    );
\memory_reg[3][12]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(8),
      Q => \out\(4)
    );
\memory_reg[3][13]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(9),
      Q => \out\(5)
    );
\memory_reg[3][14]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(10),
      Q => \out\(6)
    );
\memory_reg[3][15]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(11),
      Q => \out\(7)
    );
\memory_reg[3][16]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(12),
      Q => \out\(8)
    );
\memory_reg[3][17]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(13),
      Q => \out\(9)
    );
\memory_reg[3][18]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(14),
      Q => \out\(10)
    );
\memory_reg[3][19]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(15),
      Q => \out\(11)
    );
\memory_reg[3][1]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(1),
      Q => \memory_reg[3][1]_srl4_n_0\
    );
\memory_reg[3][2]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(2),
      Q => \memory_reg[3][2]_srl4_n_0\
    );
\memory_reg[3][3]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(3),
      Q => \memory_reg[3][3]_srl4_n_0\
    );
\memory_reg[3][8]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(4),
      Q => \out\(0)
    );
\memory_reg[3][9]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => \^addr\(0),
      A1 => \^addr\(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(5),
      Q => \out\(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized0\ is
  port (
    areset_d1_reg : out STD_LOGIC;
    mhandshake : out STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    \s_bresp_acc_reg[1]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    areset_d1 : in STD_LOGIC;
    shandshake_r : in STD_LOGIC;
    bvalid_i_reg : in STD_LOGIC;
    si_rs_bvalid : in STD_LOGIC;
    si_rs_bready : in STD_LOGIC;
    m_axi_bvalid : in STD_LOGIC;
    mhandshake_r : in STD_LOGIC;
    sel : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    aclk : in STD_LOGIC;
    \cnt_read_reg[1]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized0\ : entity is "axi_protocol_converter_v2_1_22_b2s_simple_fifo";
end \dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized0\;

architecture STRUCTURE of \dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized0\ is
  signal bvalid_i_i_2_n_0 : STD_LOGIC;
  signal cnt_read : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \cnt_read[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_read[1]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_read[0]_i_1\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of \cnt_read[1]_i_1\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of m_axi_bready_INST_0 : label is "soft_lutpair122";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \memory_reg[3][0]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3] ";
  attribute srl_name : string;
  attribute srl_name of \memory_reg[3][0]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][0]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][1]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][1]_srl4\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][1]_srl4 ";
  attribute SOFT_HLUTNM of mhandshake_r_i_1 : label is "soft_lutpair122";
begin
bvalid_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000155550001"
    )
        port map (
      I0 => areset_d1,
      I1 => bvalid_i_i_2_n_0,
      I2 => shandshake_r,
      I3 => bvalid_i_reg,
      I4 => si_rs_bvalid,
      I5 => si_rs_bready,
      O => areset_d1_reg
    );
bvalid_i_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => cnt_read(1),
      I1 => cnt_read(0),
      O => bvalid_i_i_2_n_0
    );
\cnt_read[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \cnt_read_reg[1]_0\,
      I1 => shandshake_r,
      I2 => cnt_read(0),
      O => \cnt_read[0]_i_1_n_0\
    );
\cnt_read[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DB24"
    )
        port map (
      I0 => cnt_read(0),
      I1 => shandshake_r,
      I2 => \cnt_read_reg[1]_0\,
      I3 => cnt_read(1),
      O => \cnt_read[1]_i_1_n_0\
    );
\cnt_read_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \cnt_read[0]_i_1_n_0\,
      Q => cnt_read(0),
      S => areset_d1
    );
\cnt_read_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \cnt_read[1]_i_1_n_0\,
      Q => cnt_read(1),
      S => areset_d1
    );
m_axi_bready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => cnt_read(0),
      I1 => cnt_read(1),
      I2 => mhandshake_r,
      O => m_axi_bready
    );
\memory_reg[3][0]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => cnt_read(0),
      A1 => cnt_read(1),
      A2 => '0',
      A3 => '0',
      CE => sel,
      CLK => aclk,
      D => \in\(0),
      Q => \s_bresp_acc_reg[1]\(0)
    );
\memory_reg[3][1]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => cnt_read(0),
      A1 => cnt_read(1),
      A2 => '0',
      A3 => '0',
      CE => sel,
      CLK => aclk,
      D => \in\(1),
      Q => \s_bresp_acc_reg[1]\(1)
    );
mhandshake_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => m_axi_bvalid,
      I1 => mhandshake_r,
      I2 => cnt_read(1),
      I3 => cnt_read(0),
      O => mhandshake
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized1\ is
  port (
    s_ready_i_reg : out STD_LOGIC;
    \cnt_read_reg[2]_0\ : out STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    \cnt_read_reg[4]_0\ : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 33 downto 0 );
    \cnt_read_reg[4]_1\ : in STD_LOGIC;
    si_rs_rready : in STD_LOGIC;
    r_push_r : in STD_LOGIC;
    m_valid_i_reg : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 33 downto 0 );
    aclk : in STD_LOGIC;
    areset_d1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized1\ : entity is "axi_protocol_converter_v2_1_22_b2s_simple_fifo";
end \dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized1\;

architecture STRUCTURE of \dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized1\ is
  signal \cnt_read[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_read[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \cnt_read[2]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_read[3]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_read[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \cnt_read[4]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_read[4]_i_4_n_0\ : STD_LOGIC;
  signal cnt_read_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^cnt_read_reg[2]_0\ : STD_LOGIC;
  signal wr_en0 : STD_LOGIC;
  signal \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][13]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][14]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][15]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][16]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][17]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][18]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][19]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][20]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][21]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][22]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][23]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][24]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][25]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][26]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][27]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][28]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][29]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][30]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][31]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][32]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][33]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_4\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \cnt_read[1]_i_1__0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \cnt_read[2]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \cnt_read[4]_i_3\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \cnt_read[4]_i_4\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of m_axi_rready_INST_0 : label is "soft_lutpair17";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \memory_reg[31][0]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name : string;
  attribute srl_name of \memory_reg[31][0]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][0]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][10]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][10]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][10]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][11]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][11]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][11]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][12]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][12]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][12]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][13]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][13]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][13]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][14]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][14]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][14]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][15]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][15]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][15]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][16]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][16]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][16]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][17]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][17]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][17]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][18]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][18]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][18]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][19]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][19]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][19]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][1]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][1]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][1]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][20]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][20]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][20]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][21]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][21]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][21]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][22]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][22]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][22]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][23]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][23]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][23]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][24]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][24]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][24]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][25]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][25]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][25]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][26]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][26]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][26]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][27]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][27]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][27]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][28]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][28]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][28]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][29]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][29]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][29]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][2]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][2]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][2]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][30]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][30]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][30]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][31]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][31]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][31]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][32]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][32]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][32]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][33]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][33]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][33]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][3]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][3]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][3]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][4]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][4]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][4]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][5]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][5]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][5]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][6]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][6]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][6]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][7]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][7]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][7]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][8]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][8]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][8]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][9]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][9]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][9]_srl32 ";
begin
  \cnt_read_reg[2]_0\ <= \^cnt_read_reg[2]_0\;
\FSM_sequential_state[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08888800"
    )
        port map (
      I0 => cnt_read_reg(4),
      I1 => cnt_read_reg(3),
      I2 => cnt_read_reg(0),
      I3 => cnt_read_reg(1),
      I4 => cnt_read_reg(2),
      O => \cnt_read_reg[4]_0\
    );
\cnt_read[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt_read_reg(0),
      O => \cnt_read[0]_i_1_n_0\
    );
\cnt_read[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D22D"
    )
        port map (
      I0 => wr_en0,
      I1 => \cnt_read_reg[4]_1\,
      I2 => cnt_read_reg(1),
      I3 => cnt_read_reg(0),
      O => \cnt_read[1]_i_1__0_n_0\
    );
\cnt_read[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A9A96AA9"
    )
        port map (
      I0 => cnt_read_reg(2),
      I1 => cnt_read_reg(1),
      I2 => cnt_read_reg(0),
      I3 => wr_en0,
      I4 => \cnt_read_reg[4]_1\,
      O => \cnt_read[2]_i_1_n_0\
    );
\cnt_read[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFF4000FFF4000B"
    )
        port map (
      I0 => \cnt_read_reg[4]_1\,
      I1 => wr_en0,
      I2 => cnt_read_reg(0),
      I3 => cnt_read_reg(1),
      I4 => cnt_read_reg(3),
      I5 => cnt_read_reg(2),
      O => \cnt_read[3]_i_1_n_0\
    );
\cnt_read[4]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => wr_en0,
      I1 => \cnt_read_reg[4]_1\,
      O => \cnt_read[4]_i_1__0_n_0\
    );
\cnt_read[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9AAAAAAAAAAAAAA6"
    )
        port map (
      I0 => cnt_read_reg(4),
      I1 => \cnt_read[4]_i_4_n_0\,
      I2 => cnt_read_reg(0),
      I3 => cnt_read_reg(1),
      I4 => cnt_read_reg(3),
      I5 => cnt_read_reg(2),
      O => \cnt_read[4]_i_2_n_0\
    );
\cnt_read[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4F"
    )
        port map (
      I0 => \^cnt_read_reg[2]_0\,
      I1 => si_rs_rready,
      I2 => r_push_r,
      O => s_ready_i_reg
    );
\cnt_read[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4F"
    )
        port map (
      I0 => \^cnt_read_reg[2]_0\,
      I1 => si_rs_rready,
      I2 => wr_en0,
      O => \cnt_read[4]_i_4_n_0\
    );
\cnt_read_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => \cnt_read[4]_i_1__0_n_0\,
      D => \cnt_read[0]_i_1_n_0\,
      Q => cnt_read_reg(0),
      S => areset_d1
    );
\cnt_read_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => \cnt_read[4]_i_1__0_n_0\,
      D => \cnt_read[1]_i_1__0_n_0\,
      Q => cnt_read_reg(1),
      S => areset_d1
    );
\cnt_read_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => \cnt_read[4]_i_1__0_n_0\,
      D => \cnt_read[2]_i_1_n_0\,
      Q => cnt_read_reg(2),
      S => areset_d1
    );
\cnt_read_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => \cnt_read[4]_i_1__0_n_0\,
      D => \cnt_read[3]_i_1_n_0\,
      Q => cnt_read_reg(3),
      S => areset_d1
    );
\cnt_read_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => \cnt_read[4]_i_1__0_n_0\,
      D => \cnt_read[4]_i_2_n_0\,
      Q => cnt_read_reg(4),
      S => areset_d1
    );
m_axi_rready_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"91FFFFFF"
    )
        port map (
      I0 => cnt_read_reg(2),
      I1 => cnt_read_reg(1),
      I2 => cnt_read_reg(0),
      I3 => cnt_read_reg(3),
      I4 => cnt_read_reg(4),
      O => m_axi_rready
    );
m_valid_i_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF80000000"
    )
        port map (
      I0 => cnt_read_reg(2),
      I1 => cnt_read_reg(1),
      I2 => cnt_read_reg(0),
      I3 => cnt_read_reg(4),
      I4 => cnt_read_reg(3),
      I5 => m_valid_i_reg,
      O => \^cnt_read_reg[2]_0\
    );
\memory_reg[31][0]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(0),
      Q => \out\(0),
      Q31 => \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][0]_srl32_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8202AAAAAAAAAAAA"
    )
        port map (
      I0 => m_axi_rvalid,
      I1 => cnt_read_reg(2),
      I2 => cnt_read_reg(1),
      I3 => cnt_read_reg(0),
      I4 => cnt_read_reg(3),
      I5 => cnt_read_reg(4),
      O => wr_en0
    );
\memory_reg[31][10]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(10),
      Q => \out\(10),
      Q31 => \NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][11]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(11),
      Q => \out\(11),
      Q31 => \NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][12]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(12),
      Q => \out\(12),
      Q31 => \NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][13]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(13),
      Q => \out\(13),
      Q31 => \NLW_memory_reg[31][13]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][14]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(14),
      Q => \out\(14),
      Q31 => \NLW_memory_reg[31][14]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][15]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(15),
      Q => \out\(15),
      Q31 => \NLW_memory_reg[31][15]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][16]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(16),
      Q => \out\(16),
      Q31 => \NLW_memory_reg[31][16]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][17]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(17),
      Q => \out\(17),
      Q31 => \NLW_memory_reg[31][17]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][18]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(18),
      Q => \out\(18),
      Q31 => \NLW_memory_reg[31][18]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][19]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(19),
      Q => \out\(19),
      Q31 => \NLW_memory_reg[31][19]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][1]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(1),
      Q => \out\(1),
      Q31 => \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][20]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(20),
      Q => \out\(20),
      Q31 => \NLW_memory_reg[31][20]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][21]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(21),
      Q => \out\(21),
      Q31 => \NLW_memory_reg[31][21]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][22]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(22),
      Q => \out\(22),
      Q31 => \NLW_memory_reg[31][22]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][23]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(23),
      Q => \out\(23),
      Q31 => \NLW_memory_reg[31][23]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][24]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(24),
      Q => \out\(24),
      Q31 => \NLW_memory_reg[31][24]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][25]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(25),
      Q => \out\(25),
      Q31 => \NLW_memory_reg[31][25]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][26]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(26),
      Q => \out\(26),
      Q31 => \NLW_memory_reg[31][26]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][27]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(27),
      Q => \out\(27),
      Q31 => \NLW_memory_reg[31][27]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][28]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(28),
      Q => \out\(28),
      Q31 => \NLW_memory_reg[31][28]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][29]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(29),
      Q => \out\(29),
      Q31 => \NLW_memory_reg[31][29]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][2]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(2),
      Q => \out\(2),
      Q31 => \NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][30]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(30),
      Q => \out\(30),
      Q31 => \NLW_memory_reg[31][30]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][31]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(31),
      Q => \out\(31),
      Q31 => \NLW_memory_reg[31][31]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][32]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(32),
      Q => \out\(32),
      Q31 => \NLW_memory_reg[31][32]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][33]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(33),
      Q => \out\(33),
      Q31 => \NLW_memory_reg[31][33]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][3]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(3),
      Q => \out\(3),
      Q31 => \NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][4]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(4),
      Q => \out\(4),
      Q31 => \NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][5]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(5),
      Q => \out\(5),
      Q31 => \NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][6]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(6),
      Q => \out\(6),
      Q31 => \NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][7]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(7),
      Q => \out\(7),
      Q31 => \NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][8]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(8),
      Q => \out\(8),
      Q31 => \NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][9]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(9),
      Q => \out\(9),
      Q31 => \NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized2\ is
  port (
    \cnt_read_reg[4]_0\ : out STD_LOGIC;
    \cnt_read_reg[4]_1\ : out STD_LOGIC;
    r_push_r_reg : out STD_LOGIC_VECTOR ( 12 downto 0 );
    r_push_r : in STD_LOGIC;
    \cnt_read_reg[4]_2\ : in STD_LOGIC;
    \cnt_read_reg[4]_3\ : in STD_LOGIC;
    \FSM_sequential_state_reg[0]\ : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 12 downto 0 );
    aclk : in STD_LOGIC;
    areset_d1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized2\ : entity is "axi_protocol_converter_v2_1_22_b2s_simple_fifo";
end \dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized2\;

architecture STRUCTURE of \dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized2\ is
  signal \cnt_read[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \cnt_read[1]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_read[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \cnt_read[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \cnt_read[4]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_read[4]_i_2__0_n_0\ : STD_LOGIC;
  signal cnt_read_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_read[0]_i_1__0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \cnt_read[1]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \cnt_read[2]_i_1__0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of m_valid_i_i_3 : label is "soft_lutpair19";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \memory_reg[31][0]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name : string;
  attribute srl_name of \memory_reg[31][0]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][0]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][10]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][10]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][10]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][11]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][11]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][11]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][12]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][12]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][12]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][1]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][1]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][1]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][2]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][2]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][2]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][3]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][3]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][3]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][4]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][4]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][4]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][5]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][5]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][5]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][6]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][6]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][6]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][7]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][7]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][7]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][8]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][8]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][8]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][9]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][9]_srl32\ : label is "ps7_0_axi_periph/\s00_couplers/auto_pc /\inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][9]_srl32 ";
begin
\FSM_sequential_state[1]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEAEAAAEAEAEAAA"
    )
        port map (
      I0 => \FSM_sequential_state_reg[0]\,
      I1 => cnt_read_reg(4),
      I2 => cnt_read_reg(3),
      I3 => cnt_read_reg(2),
      I4 => cnt_read_reg(1),
      I5 => cnt_read_reg(0),
      O => \cnt_read_reg[4]_0\
    );
\cnt_read[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt_read_reg(0),
      O => \cnt_read[0]_i_1__0_n_0\
    );
\cnt_read[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D22D"
    )
        port map (
      I0 => r_push_r,
      I1 => \cnt_read_reg[4]_2\,
      I2 => cnt_read_reg(0),
      I3 => cnt_read_reg(1),
      O => \cnt_read[1]_i_1_n_0\
    );
\cnt_read[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A6AAAA59"
    )
        port map (
      I0 => cnt_read_reg(2),
      I1 => r_push_r,
      I2 => \cnt_read_reg[4]_2\,
      I3 => cnt_read_reg(0),
      I4 => cnt_read_reg(1),
      O => \cnt_read[2]_i_1__0_n_0\
    );
\cnt_read[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFEFEE08001011"
    )
        port map (
      I0 => cnt_read_reg(1),
      I1 => cnt_read_reg(0),
      I2 => \cnt_read_reg[4]_2\,
      I3 => r_push_r,
      I4 => cnt_read_reg(2),
      I5 => cnt_read_reg(3),
      O => \cnt_read[3]_i_1__0_n_0\
    );
\cnt_read[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_push_r,
      I1 => \cnt_read_reg[4]_2\,
      O => \cnt_read[4]_i_1_n_0\
    );
\cnt_read[4]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAAAAAAA9AA"
    )
        port map (
      I0 => cnt_read_reg(4),
      I1 => cnt_read_reg(2),
      I2 => cnt_read_reg(3),
      I3 => \cnt_read_reg[4]_3\,
      I4 => cnt_read_reg(1),
      I5 => cnt_read_reg(0),
      O => \cnt_read[4]_i_2__0_n_0\
    );
\cnt_read_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => \cnt_read[4]_i_1_n_0\,
      D => \cnt_read[0]_i_1__0_n_0\,
      Q => cnt_read_reg(0),
      S => areset_d1
    );
\cnt_read_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => \cnt_read[4]_i_1_n_0\,
      D => \cnt_read[1]_i_1_n_0\,
      Q => cnt_read_reg(1),
      S => areset_d1
    );
\cnt_read_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => \cnt_read[4]_i_1_n_0\,
      D => \cnt_read[2]_i_1__0_n_0\,
      Q => cnt_read_reg(2),
      S => areset_d1
    );
\cnt_read_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => \cnt_read[4]_i_1_n_0\,
      D => \cnt_read[3]_i_1__0_n_0\,
      Q => cnt_read_reg(3),
      S => areset_d1
    );
\cnt_read_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => \cnt_read[4]_i_1_n_0\,
      D => \cnt_read[4]_i_2__0_n_0\,
      Q => cnt_read_reg(4),
      S => areset_d1
    );
m_valid_i_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => cnt_read_reg(4),
      I1 => cnt_read_reg(3),
      I2 => cnt_read_reg(2),
      I3 => cnt_read_reg(1),
      I4 => cnt_read_reg(0),
      O => \cnt_read_reg[4]_1\
    );
\memory_reg[31][0]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(0),
      Q => r_push_r_reg(0),
      Q31 => \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][10]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(10),
      Q => r_push_r_reg(10),
      Q31 => \NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][11]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(11),
      Q => r_push_r_reg(11),
      Q31 => \NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][12]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(12),
      Q => r_push_r_reg(12),
      Q31 => \NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][1]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(1),
      Q => r_push_r_reg(1),
      Q31 => \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][2]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(2),
      Q => r_push_r_reg(2),
      Q31 => \NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][3]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(3),
      Q => r_push_r_reg(3),
      Q31 => \NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][4]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(4),
      Q => r_push_r_reg(4),
      Q31 => \NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][5]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(5),
      Q => r_push_r_reg(5),
      Q31 => \NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][6]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(6),
      Q => r_push_r_reg(6),
      Q31 => \NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][7]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(7),
      Q => r_push_r_reg(7),
      Q31 => \NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][8]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(8),
      Q => r_push_r_reg(8),
      Q31 => \NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][9]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => cnt_read_reg(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(9),
      Q => r_push_r_reg(9),
      Q31 => \NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wr_cmd_fsm is
  port (
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axaddr_offset : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \FSM_sequential_state_reg[0]_0\ : out STD_LOGIC;
    \FSM_sequential_state_reg[0]_1\ : out STD_LOGIC;
    \FSM_sequential_state_reg[0]_2\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_awready : out STD_LOGIC;
    \wrap_second_len_r_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \axlen_cnt_reg[2]\ : out STD_LOGIC;
    \next\ : out STD_LOGIC;
    \axlen_cnt_reg[2]_0\ : out STD_LOGIC;
    m_valid_i_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    sel_first_reg : out STD_LOGIC;
    sel_first_reg_0 : out STD_LOGIC;
    sel_first_i : out STD_LOGIC;
    \wrap_boundary_axaddr_r_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    si_rs_awvalid : in STD_LOGIC;
    \wrap_second_len_r_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axburst_eq0_reg : in STD_LOGIC;
    \wrap_second_len_r_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \wrap_second_len_r_reg[3]_1\ : in STD_LOGIC;
    \axaddr_offset_r_reg[3]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \axaddr_offset_r_reg[3]_0\ : in STD_LOGIC_VECTOR ( 14 downto 0 );
    \axaddr_offset_r_reg[0]\ : in STD_LOGIC;
    s_axburst_eq0_reg_0 : in STD_LOGIC;
    \FSM_sequential_state_reg[1]_0\ : in STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    s_axburst_eq1_reg : in STD_LOGIC;
    next_pending_r : in STD_LOGIC;
    next_pending_r_0 : in STD_LOGIC;
    sel_first : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    sel_first_reg_1 : in STD_LOGIC;
    sel_first_reg_2 : in STD_LOGIC;
    \axaddr_offset_r_reg[3]_1\ : in STD_LOGIC;
    \axaddr_offset_r_reg[1]\ : in STD_LOGIC;
    \axaddr_offset_r_reg[1]_0\ : in STD_LOGIC;
    axaddr_wrap0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \axaddr_wrap_reg[11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \axaddr_wrap_reg[11]_0\ : in STD_LOGIC;
    cnt_read : in STD_LOGIC_VECTOR ( 1 downto 0 );
    aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wr_cmd_fsm : entity is "axi_protocol_converter_v2_1_22_b2s_wr_cmd_fsm";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wr_cmd_fsm;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wr_cmd_fsm is
  signal \^fsm_sequential_state_reg[0]_1\ : STD_LOGIC;
  signal \^fsm_sequential_state_reg[0]_2\ : STD_LOGIC;
  signal \^m00_axi_0_awready\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^axaddr_offset\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \axaddr_wrap[11]_i_2_n_0\ : STD_LOGIC;
  signal \axaddr_wrap[11]_i_4_n_0\ : STD_LOGIC;
  signal \^next\ : STD_LOGIC;
  signal \next_state__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s_axburst_eq0_i_2_n_0 : STD_LOGIC;
  signal s_axburst_eq0_i_3_n_0 : STD_LOGIC;
  signal s_axburst_eq0_i_4_n_0 : STD_LOGIC;
  signal s_axburst_eq0_i_5_n_0 : STD_LOGIC;
  signal s_axburst_eq1_i_2_n_0 : STD_LOGIC;
  signal \wrap_cnt_r[2]_i_2_n_0\ : STD_LOGIC;
  signal \wrap_cnt_r[3]_i_2_n_0\ : STD_LOGIC;
  signal \^wrap_second_len_r_reg[3]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_1\ : label is "soft_lutpair107";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "SM_CMD_ACCEPTED:10,SM_CMD_EN:11,SM_IDLE:01,SM_DONE_WAIT:00";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "SM_CMD_ACCEPTED:10,SM_CMD_EN:11,SM_IDLE:01,SM_DONE_WAIT:00";
  attribute SOFT_HLUTNM of \axaddr_wrap[11]_i_2\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \axaddr_wrap[11]_i_4\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \axlen_cnt[3]_i_1__0\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \axlen_cnt[3]_i_3__2\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of next_pending_r_i_3 : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of s_axburst_eq0_i_5 : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \wrap_boundary_axaddr_r[11]_i_1\ : label is "soft_lutpair108";
begin
  \FSM_sequential_state_reg[0]_1\ <= \^fsm_sequential_state_reg[0]_1\;
  \FSM_sequential_state_reg[0]_2\ <= \^fsm_sequential_state_reg[0]_2\;
  M00_AXI_0_awready <= \^m00_axi_0_awready\;
  Q(1 downto 0) <= \^q\(1 downto 0);
  axaddr_offset(2 downto 0) <= \^axaddr_offset\(2 downto 0);
  \next\ <= \^next\;
  \wrap_second_len_r_reg[3]\(3 downto 0) <= \^wrap_second_len_r_reg[3]\(3 downto 0);
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7737FFFFFFFFFF0F"
    )
        port map (
      I0 => \FSM_sequential_state_reg[1]_0\,
      I1 => m_axi_awready,
      I2 => cnt_read(1),
      I3 => cnt_read(0),
      I4 => \^q\(1),
      I5 => \^q\(0),
      O => \next_state__0\(0)
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACF0FCF0"
    )
        port map (
      I0 => \FSM_sequential_state_reg[1]_0\,
      I1 => si_rs_awvalid,
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => m_axi_awready,
      O => \next_state__0\(1)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \next_state__0\(0),
      Q => \^q\(0),
      S => areset_d1
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \next_state__0\(1),
      Q => \^q\(1),
      R => areset_d1
    );
\axaddr_offset_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEAAA2AAA2AAA2AA"
    )
        port map (
      I0 => \axaddr_offset_r_reg[3]\(0),
      I1 => si_rs_awvalid,
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \axaddr_offset_r_reg[3]_0\(13),
      I5 => \axaddr_offset_r_reg[0]\,
      O => \^axaddr_offset\(0)
    );
\axaddr_offset_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEAAAEAAAEAAA2AA"
    )
        port map (
      I0 => \axaddr_offset_r_reg[3]\(1),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => si_rs_awvalid,
      I4 => \axaddr_offset_r_reg[1]\,
      I5 => \axaddr_offset_r_reg[1]_0\,
      O => \^axaddr_offset\(1)
    );
\axaddr_offset_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA30AAAAAAAAAA"
    )
        port map (
      I0 => \axaddr_offset_r_reg[3]\(2),
      I1 => \axaddr_offset_r_reg[3]_1\,
      I2 => \axaddr_offset_r_reg[3]_0\(14),
      I3 => si_rs_awvalid,
      I4 => \^q\(1),
      I5 => \^q\(0),
      O => \^axaddr_offset\(2)
    );
\axaddr_wrap[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_4_n_0\,
      I1 => axaddr_wrap0(0),
      I2 => \axaddr_wrap_reg[11]\(0),
      I3 => \axaddr_wrap[11]_i_2_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(0),
      I5 => \^next\,
      O => \wrap_boundary_axaddr_r_reg[11]\(0)
    );
\axaddr_wrap[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_4_n_0\,
      I1 => axaddr_wrap0(10),
      I2 => \axaddr_offset_r_reg[3]_0\(10),
      I3 => \^next\,
      I4 => \axaddr_wrap_reg[11]\(10),
      I5 => \axaddr_wrap[11]_i_2_n_0\,
      O => \wrap_boundary_axaddr_r_reg[11]\(10)
    );
\axaddr_wrap[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_2_n_0\,
      I1 => \axaddr_wrap_reg[11]\(11),
      I2 => axaddr_wrap0(11),
      I3 => \axaddr_wrap[11]_i_4_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(11),
      I5 => \^next\,
      O => \wrap_boundary_axaddr_r_reg[11]\(11)
    );
\axaddr_wrap[11]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"51FF"
    )
        port map (
      I0 => \^m00_axi_0_awready\,
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \axaddr_wrap_reg[11]_0\,
      O => \axaddr_wrap[11]_i_2_n_0\
    );
\axaddr_wrap[11]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBAB"
    )
        port map (
      I0 => \axaddr_wrap_reg[11]_0\,
      I1 => \^m00_axi_0_awready\,
      I2 => \^q\(1),
      I3 => \^q\(0),
      O => \axaddr_wrap[11]_i_4_n_0\
    );
\axaddr_wrap[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_4_n_0\,
      I1 => axaddr_wrap0(1),
      I2 => \axaddr_wrap_reg[11]\(1),
      I3 => \axaddr_wrap[11]_i_2_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(1),
      I5 => \^next\,
      O => \wrap_boundary_axaddr_r_reg[11]\(1)
    );
\axaddr_wrap[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_4_n_0\,
      I1 => axaddr_wrap0(2),
      I2 => \axaddr_wrap_reg[11]\(2),
      I3 => \axaddr_wrap[11]_i_2_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(2),
      I5 => \^next\,
      O => \wrap_boundary_axaddr_r_reg[11]\(2)
    );
\axaddr_wrap[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_4_n_0\,
      I1 => axaddr_wrap0(3),
      I2 => \axaddr_wrap_reg[11]\(3),
      I3 => \axaddr_wrap[11]_i_2_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(3),
      I5 => \^next\,
      O => \wrap_boundary_axaddr_r_reg[11]\(3)
    );
\axaddr_wrap[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_4_n_0\,
      I1 => axaddr_wrap0(4),
      I2 => \axaddr_wrap_reg[11]\(4),
      I3 => \axaddr_wrap[11]_i_2_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(4),
      I5 => \^next\,
      O => \wrap_boundary_axaddr_r_reg[11]\(4)
    );
\axaddr_wrap[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_4_n_0\,
      I1 => axaddr_wrap0(5),
      I2 => \axaddr_wrap_reg[11]\(5),
      I3 => \axaddr_wrap[11]_i_2_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(5),
      I5 => \^next\,
      O => \wrap_boundary_axaddr_r_reg[11]\(5)
    );
\axaddr_wrap[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_4_n_0\,
      I1 => axaddr_wrap0(6),
      I2 => \axaddr_wrap_reg[11]\(6),
      I3 => \axaddr_wrap[11]_i_2_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(6),
      I5 => \^next\,
      O => \wrap_boundary_axaddr_r_reg[11]\(6)
    );
\axaddr_wrap[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_2_n_0\,
      I1 => \axaddr_wrap_reg[11]\(7),
      I2 => axaddr_wrap0(7),
      I3 => \axaddr_wrap[11]_i_4_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(7),
      I5 => \^next\,
      O => \wrap_boundary_axaddr_r_reg[11]\(7)
    );
\axaddr_wrap[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_2_n_0\,
      I1 => \axaddr_wrap_reg[11]\(8),
      I2 => axaddr_wrap0(8),
      I3 => \axaddr_wrap[11]_i_4_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(8),
      I5 => \^next\,
      O => \wrap_boundary_axaddr_r_reg[11]\(8)
    );
\axaddr_wrap[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F444F4FFFF44F4"
    )
        port map (
      I0 => \axaddr_wrap[11]_i_4_n_0\,
      I1 => axaddr_wrap0(9),
      I2 => \axaddr_wrap_reg[11]\(9),
      I3 => \axaddr_wrap[11]_i_2_n_0\,
      I4 => \axaddr_offset_r_reg[3]_0\(9),
      I5 => \^next\,
      O => \wrap_boundary_axaddr_r_reg[11]\(9)
    );
\axlen_cnt[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF64"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => si_rs_awvalid,
      I3 => \^m00_axi_0_awready\,
      O => \^fsm_sequential_state_reg[0]_1\
    );
\axlen_cnt[3]_i_3__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => si_rs_awvalid,
      O => \^fsm_sequential_state_reg[0]_2\
    );
\axlen_cnt[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^fsm_sequential_state_reg[0]_1\,
      I1 => s_axburst_eq0_reg,
      O => \FSM_sequential_state_reg[0]_0\
    );
m_axi_awvalid_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      O => m_axi_awvalid
    );
\m_payload_i[31]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^m00_axi_0_awready\,
      I1 => si_rs_awvalid,
      O => E(0)
    );
\memory_reg[3][0]_srl4_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0383038300000383"
    )
        port map (
      I0 => m_axi_awready,
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \FSM_sequential_state_reg[1]_0\,
      I4 => cnt_read(1),
      I5 => cnt_read(0),
      O => \^m00_axi_0_awready\
    );
next_pending_r_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^m00_axi_0_awready\,
      O => \^next\
    );
s_axburst_eq0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEFCFCFEFE0C0C0"
    )
        port map (
      I0 => s_axburst_eq0_reg_0,
      I1 => s_axburst_eq0_i_2_n_0,
      I2 => s_axburst_eq0_i_3_n_0,
      I3 => s_axburst_eq0_reg,
      I4 => \^next\,
      I5 => s_axburst_eq0_i_4_n_0,
      O => \axlen_cnt_reg[2]\
    );
s_axburst_eq0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAEBEFAAAAAAAA"
    )
        port map (
      I0 => s_axburst_eq1_reg,
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => si_rs_awvalid,
      I4 => \^m00_axi_0_awready\,
      I5 => next_pending_r_0,
      O => s_axburst_eq0_i_2_n_0
    );
s_axburst_eq0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000A2A2AAA2"
    )
        port map (
      I0 => \axaddr_offset_r_reg[3]_0\(12),
      I1 => sel_first_reg_2,
      I2 => \^m00_axi_0_awready\,
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => s_axburst_eq0_i_5_n_0,
      O => s_axburst_eq0_i_3_n_0
    );
s_axburst_eq0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAEBEFAAAAAAAA"
    )
        port map (
      I0 => s_axburst_eq1_reg,
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => si_rs_awvalid,
      I4 => \^m00_axi_0_awready\,
      I5 => next_pending_r,
      O => s_axburst_eq0_i_4_n_0
    );
s_axburst_eq0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AEAA"
    )
        port map (
      I0 => areset_d1,
      I1 => si_rs_awvalid,
      I2 => \^q\(1),
      I3 => \^q\(0),
      O => s_axburst_eq0_i_5_n_0
    );
s_axburst_eq1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEFCFCFEFE0C0C0"
    )
        port map (
      I0 => s_axburst_eq0_reg_0,
      I1 => s_axburst_eq0_i_2_n_0,
      I2 => s_axburst_eq1_i_2_n_0,
      I3 => s_axburst_eq0_reg,
      I4 => \^next\,
      I5 => s_axburst_eq0_i_4_n_0,
      O => \axlen_cnt_reg[2]_0\
    );
s_axburst_eq1_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAEAEAAAE"
    )
        port map (
      I0 => \axaddr_offset_r_reg[3]_0\(12),
      I1 => sel_first_reg_2,
      I2 => \^m00_axi_0_awready\,
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => s_axburst_eq0_i_5_n_0,
      O => s_axburst_eq1_i_2_n_0
    );
sel_first_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF44F44444"
    )
        port map (
      I0 => \^next\,
      I1 => sel_first,
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => si_rs_awvalid,
      I5 => areset_d1,
      O => sel_first_reg
    );
\sel_first_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF44F44444"
    )
        port map (
      I0 => \^next\,
      I1 => sel_first_reg_1,
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => si_rs_awvalid,
      I5 => areset_d1,
      O => sel_first_reg_0
    );
\sel_first_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCECFCFFCCECCCEC"
    )
        port map (
      I0 => si_rs_awvalid,
      I1 => areset_d1,
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^m00_axi_0_awready\,
      I5 => sel_first_reg_2,
      O => sel_first_i
    );
\wrap_boundary_axaddr_r[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => si_rs_awvalid,
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => m_valid_i_reg(0)
    );
\wrap_cnt_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33833333CC8CCCCC"
    )
        port map (
      I0 => \^axaddr_offset\(0),
      I1 => \wrap_cnt_r[2]_i_2_n_0\,
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => si_rs_awvalid,
      I5 => \wrap_second_len_r_reg[3]_0\(0),
      O => D(0)
    );
\wrap_cnt_r[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3CCCA0A0"
    )
        port map (
      I0 => \^axaddr_offset\(1),
      I1 => \wrap_second_len_r_reg[3]_0\(1),
      I2 => \wrap_cnt_r[2]_i_2_n_0\,
      I3 => \wrap_second_len_r_reg[3]_0\(0),
      I4 => \^fsm_sequential_state_reg[0]_2\,
      O => D(1)
    );
\wrap_cnt_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"59A9AAAAAAAAAAAA"
    )
        port map (
      I0 => \^wrap_second_len_r_reg[3]\(2),
      I1 => \^axaddr_offset\(0),
      I2 => \^fsm_sequential_state_reg[0]_2\,
      I3 => \wrap_second_len_r_reg[3]_0\(0),
      I4 => \wrap_cnt_r[2]_i_2_n_0\,
      I5 => \^wrap_second_len_r_reg[3]\(1),
      O => D(2)
    );
\wrap_cnt_r[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^axaddr_offset\(1),
      I1 => \wrap_second_len_r_reg[0]\(0),
      I2 => \^axaddr_offset\(0),
      I3 => \^axaddr_offset\(2),
      O => \wrap_cnt_r[2]_i_2_n_0\
    );
\wrap_cnt_r[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A6AA"
    )
        port map (
      I0 => \^wrap_second_len_r_reg[3]\(3),
      I1 => \^wrap_second_len_r_reg[3]\(1),
      I2 => \wrap_cnt_r[3]_i_2_n_0\,
      I3 => \^wrap_second_len_r_reg[3]\(2),
      O => D(3)
    );
\wrap_cnt_r[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"772277227722772F"
    )
        port map (
      I0 => \^fsm_sequential_state_reg[0]_2\,
      I1 => \wrap_second_len_r_reg[3]_0\(0),
      I2 => \^axaddr_offset\(2),
      I3 => \^axaddr_offset\(0),
      I4 => \wrap_second_len_r_reg[0]\(0),
      I5 => \^axaddr_offset\(1),
      O => \wrap_cnt_r[3]_i_2_n_0\
    );
\wrap_second_len_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88BB88BB88BB88B8"
    )
        port map (
      I0 => \wrap_second_len_r_reg[3]_0\(0),
      I1 => \^fsm_sequential_state_reg[0]_2\,
      I2 => \^axaddr_offset\(2),
      I3 => \^axaddr_offset\(0),
      I4 => \wrap_second_len_r_reg[0]\(0),
      I5 => \^axaddr_offset\(1),
      O => \^wrap_second_len_r_reg[3]\(0)
    );
\wrap_second_len_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB88BB8888BB88B8"
    )
        port map (
      I0 => \wrap_second_len_r_reg[3]_0\(1),
      I1 => \^fsm_sequential_state_reg[0]_2\,
      I2 => \^axaddr_offset\(2),
      I3 => \^axaddr_offset\(0),
      I4 => \wrap_second_len_r_reg[0]\(0),
      I5 => \^axaddr_offset\(1),
      O => \^wrap_second_len_r_reg[3]\(1)
    );
\wrap_second_len_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBB8888BB8888B8"
    )
        port map (
      I0 => \wrap_second_len_r_reg[3]_0\(2),
      I1 => \^fsm_sequential_state_reg[0]_2\,
      I2 => \^axaddr_offset\(2),
      I3 => \^axaddr_offset\(0),
      I4 => \wrap_second_len_r_reg[0]\(0),
      I5 => \^axaddr_offset\(1),
      O => \^wrap_second_len_r_reg[3]\(2)
    );
\wrap_second_len_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF888888888"
    )
        port map (
      I0 => \^fsm_sequential_state_reg[0]_2\,
      I1 => \wrap_second_len_r_reg[3]_0\(3),
      I2 => \^axaddr_offset\(0),
      I3 => \^axaddr_offset\(1),
      I4 => \wrap_second_len_r_reg[0]\(0),
      I5 => \wrap_second_len_r_reg[3]_1\,
      O => \^wrap_second_len_r_reg[3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd is
  port (
    next_pending_r_0 : out STD_LOGIC;
    sel_first : out STD_LOGIC;
    \axlen_cnt_reg[2]_0\ : out STD_LOGIC;
    axaddr_wrap0 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \axaddr_wrap_reg[11]_0\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \axlen_cnt_reg[0]_0\ : out STD_LOGIC;
    \axaddr_offset_r_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_second_len_r_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_boundary_axaddr_r_reg[11]_0\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    aclk : in STD_LOGIC;
    sel_first_reg_0 : in STD_LOGIC;
    \axlen_cnt_reg[3]_0\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    si_rs_awvalid : in STD_LOGIC;
    \axaddr_wrap_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axlen_cnt_reg[3]_1\ : in STD_LOGIC;
    \next\ : in STD_LOGIC;
    \axaddr_wrap_reg[0]_0\ : in STD_LOGIC;
    next_pending_r_reg_0 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_second_len_r_reg[3]_1\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_cnt_r_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    \wrap_boundary_axaddr_r_reg[6]_0\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \axaddr_wrap_reg[11]_1\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd : entity is "axi_protocol_converter_v2_1_22_b2s_wrap_cmd";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd is
  signal \axaddr_wrap[11]_i_6_n_0\ : STD_LOGIC;
  signal \^axaddr_wrap_reg[11]_0\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \axaddr_wrap_reg[11]_i_3_n_1\ : STD_LOGIC;
  signal \axaddr_wrap_reg[11]_i_3_n_2\ : STD_LOGIC;
  signal \axaddr_wrap_reg[11]_i_3_n_3\ : STD_LOGIC;
  signal \axaddr_wrap_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \axaddr_wrap_reg[3]_i_2_n_1\ : STD_LOGIC;
  signal \axaddr_wrap_reg[3]_i_2_n_2\ : STD_LOGIC;
  signal \axaddr_wrap_reg[3]_i_2_n_3\ : STD_LOGIC;
  signal \axaddr_wrap_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \axaddr_wrap_reg[7]_i_2_n_1\ : STD_LOGIC;
  signal \axaddr_wrap_reg[7]_i_2_n_2\ : STD_LOGIC;
  signal \axaddr_wrap_reg[7]_i_2_n_3\ : STD_LOGIC;
  signal \axlen_cnt[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \axlen_cnt[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \axlen_cnt[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \axlen_cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \axlen_cnt[3]_i_3__0_n_0\ : STD_LOGIC;
  signal \axlen_cnt[4]_i_1_n_0\ : STD_LOGIC;
  signal \^axlen_cnt_reg[2]_0\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \^next_pending_r_0\ : STD_LOGIC;
  signal wrap_cnt_r : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal wrap_next_pending : STD_LOGIC;
  signal \NLW_axaddr_wrap_reg[11]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \axaddr_wrap_reg[11]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \axaddr_wrap_reg[3]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \axaddr_wrap_reg[7]_i_2\ : label is 35;
begin
  \axaddr_wrap_reg[11]_0\(11 downto 0) <= \^axaddr_wrap_reg[11]_0\(11 downto 0);
  \axlen_cnt_reg[2]_0\ <= \^axlen_cnt_reg[2]_0\;
  next_pending_r_0 <= \^next_pending_r_0\;
\axaddr_offset_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(0),
      Q => \axaddr_offset_r_reg[3]_0\(0),
      R => '0'
    );
\axaddr_offset_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(1),
      Q => \axaddr_offset_r_reg[3]_0\(1),
      R => '0'
    );
\axaddr_offset_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(2),
      Q => \axaddr_offset_r_reg[3]_0\(2),
      R => '0'
    );
\axaddr_offset_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(3),
      Q => \axaddr_offset_r_reg[3]_0\(3),
      R => '0'
    );
\axaddr_wrap[11]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => \axlen_cnt_reg_n_0_[0]\,
      I1 => wrap_cnt_r(0),
      I2 => \axlen_cnt_reg_n_0_[4]\,
      I3 => \axaddr_wrap[11]_i_6_n_0\,
      O => \axlen_cnt_reg[0]_0\
    );
\axaddr_wrap[11]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => wrap_cnt_r(1),
      I1 => \axlen_cnt_reg_n_0_[1]\,
      I2 => \axlen_cnt_reg_n_0_[3]\,
      I3 => wrap_cnt_r(3),
      I4 => \axlen_cnt_reg_n_0_[2]\,
      I5 => wrap_cnt_r(2),
      O => \axaddr_wrap[11]_i_6_n_0\
    );
\axaddr_wrap_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(0),
      Q => \^axaddr_wrap_reg[11]_0\(0),
      R => '0'
    );
\axaddr_wrap_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(10),
      Q => \^axaddr_wrap_reg[11]_0\(10),
      R => '0'
    );
\axaddr_wrap_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(11),
      Q => \^axaddr_wrap_reg[11]_0\(11),
      R => '0'
    );
\axaddr_wrap_reg[11]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \axaddr_wrap_reg[7]_i_2_n_0\,
      CO(3) => \NLW_axaddr_wrap_reg[11]_i_3_CO_UNCONNECTED\(3),
      CO(2) => \axaddr_wrap_reg[11]_i_3_n_1\,
      CO(1) => \axaddr_wrap_reg[11]_i_3_n_2\,
      CO(0) => \axaddr_wrap_reg[11]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => axaddr_wrap0(11 downto 8),
      S(3 downto 0) => \^axaddr_wrap_reg[11]_0\(11 downto 8)
    );
\axaddr_wrap_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(1),
      Q => \^axaddr_wrap_reg[11]_0\(1),
      R => '0'
    );
\axaddr_wrap_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(2),
      Q => \^axaddr_wrap_reg[11]_0\(2),
      R => '0'
    );
\axaddr_wrap_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(3),
      Q => \^axaddr_wrap_reg[11]_0\(3),
      R => '0'
    );
\axaddr_wrap_reg[3]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \axaddr_wrap_reg[3]_i_2_n_0\,
      CO(2) => \axaddr_wrap_reg[3]_i_2_n_1\,
      CO(1) => \axaddr_wrap_reg[3]_i_2_n_2\,
      CO(0) => \axaddr_wrap_reg[3]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^axaddr_wrap_reg[11]_0\(3 downto 0),
      O(3 downto 0) => axaddr_wrap0(3 downto 0),
      S(3 downto 0) => \axaddr_wrap_reg[3]_0\(3 downto 0)
    );
\axaddr_wrap_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(4),
      Q => \^axaddr_wrap_reg[11]_0\(4),
      R => '0'
    );
\axaddr_wrap_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(5),
      Q => \^axaddr_wrap_reg[11]_0\(5),
      R => '0'
    );
\axaddr_wrap_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(6),
      Q => \^axaddr_wrap_reg[11]_0\(6),
      R => '0'
    );
\axaddr_wrap_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(7),
      Q => \^axaddr_wrap_reg[11]_0\(7),
      R => '0'
    );
\axaddr_wrap_reg[7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \axaddr_wrap_reg[3]_i_2_n_0\,
      CO(3) => \axaddr_wrap_reg[7]_i_2_n_0\,
      CO(2) => \axaddr_wrap_reg[7]_i_2_n_1\,
      CO(1) => \axaddr_wrap_reg[7]_i_2_n_2\,
      CO(0) => \axaddr_wrap_reg[7]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => axaddr_wrap0(7 downto 4),
      S(3 downto 0) => \^axaddr_wrap_reg[11]_0\(7 downto 4)
    );
\axaddr_wrap_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(8),
      Q => \^axaddr_wrap_reg[11]_0\(8),
      R => '0'
    );
\axaddr_wrap_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(9),
      Q => \^axaddr_wrap_reg[11]_0\(9),
      R => '0'
    );
\axlen_cnt[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444F44444444444"
    )
        port map (
      I0 => \axlen_cnt_reg_n_0_[0]\,
      I1 => \^axlen_cnt_reg[2]_0\,
      I2 => \axlen_cnt_reg[3]_0\(5),
      I3 => Q(0),
      I4 => Q(1),
      I5 => si_rs_awvalid,
      O => \axlen_cnt[0]_i_1__0_n_0\
    );
\axlen_cnt[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F44F4444"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\,
      I1 => \axlen_cnt_reg[3]_0\(6),
      I2 => \axlen_cnt_reg_n_0_[1]\,
      I3 => \axlen_cnt_reg_n_0_[0]\,
      I4 => \^axlen_cnt_reg[2]_0\,
      O => \axlen_cnt[1]_i_1__0_n_0\
    );
\axlen_cnt[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4F4F44F44444444"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\,
      I1 => \axlen_cnt_reg[3]_0\(7),
      I2 => \axlen_cnt_reg_n_0_[2]\,
      I3 => \axlen_cnt_reg_n_0_[0]\,
      I4 => \axlen_cnt_reg_n_0_[1]\,
      I5 => \^axlen_cnt_reg[2]_0\,
      O => \axlen_cnt[2]_i_1__0_n_0\
    );
\axlen_cnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0CFCAE0C"
    )
        port map (
      I0 => \^axlen_cnt_reg[2]_0\,
      I1 => \axlen_cnt_reg[3]_0\(8),
      I2 => \axlen_cnt_reg[3]_1\,
      I3 => \axlen_cnt[3]_i_3__0_n_0\,
      I4 => \axlen_cnt_reg_n_0_[3]\,
      O => \axlen_cnt[3]_i_1_n_0\
    );
\axlen_cnt[3]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\,
      I1 => \axlen_cnt_reg_n_0_[2]\,
      I2 => \axlen_cnt_reg_n_0_[3]\,
      I3 => \axlen_cnt_reg_n_0_[1]\,
      I4 => \axlen_cnt_reg_n_0_[4]\,
      O => \^axlen_cnt_reg[2]_0\
    );
\axlen_cnt[3]_i_3__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \axlen_cnt_reg_n_0_[0]\,
      I1 => \axlen_cnt_reg_n_0_[1]\,
      I2 => \axlen_cnt_reg_n_0_[2]\,
      O => \axlen_cnt[3]_i_3__0_n_0\
    );
\axlen_cnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\,
      I1 => \axlen_cnt_reg_n_0_[2]\,
      I2 => \axlen_cnt_reg_n_0_[1]\,
      I3 => \axlen_cnt_reg_n_0_[0]\,
      I4 => \axlen_cnt_reg_n_0_[3]\,
      I5 => \axlen_cnt_reg_n_0_[4]\,
      O => \axlen_cnt[4]_i_1_n_0\
    );
\axlen_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axlen_cnt[0]_i_1__0_n_0\,
      Q => \axlen_cnt_reg_n_0_[0]\,
      R => '0'
    );
\axlen_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axlen_cnt[1]_i_1__0_n_0\,
      Q => \axlen_cnt_reg_n_0_[1]\,
      R => '0'
    );
\axlen_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axlen_cnt[2]_i_1__0_n_0\,
      Q => \axlen_cnt_reg_n_0_[2]\,
      R => '0'
    );
\axlen_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axlen_cnt[3]_i_1_n_0\,
      Q => \axlen_cnt_reg_n_0_[3]\,
      R => '0'
    );
\axlen_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axlen_cnt[4]_i_1_n_0\,
      Q => \axlen_cnt_reg_n_0_[4]\,
      R => '0'
    );
\next_pending_r_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF88F8"
    )
        port map (
      I0 => \^axlen_cnt_reg[2]_0\,
      I1 => \next\,
      I2 => \^next_pending_r_0\,
      I3 => \axaddr_wrap_reg[0]_0\,
      I4 => next_pending_r_reg_0,
      O => wrap_next_pending
    );
next_pending_r_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => wrap_next_pending,
      Q => \^next_pending_r_0\,
      R => '0'
    );
sel_first_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => sel_first_reg_0,
      Q => sel_first,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(0),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(0),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \axlen_cnt_reg[3]_0\(3),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(10),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \axlen_cnt_reg[3]_0\(4),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(11),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(1),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(1),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(2),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(2),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(3),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(3),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(4),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(4),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(5),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(5),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(6),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(6),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \axlen_cnt_reg[3]_0\(0),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(7),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \axlen_cnt_reg[3]_0\(1),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(8),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \axlen_cnt_reg[3]_0\(2),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(9),
      R => '0'
    );
\wrap_cnt_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_cnt_r_reg[3]_0\(0),
      Q => wrap_cnt_r(0),
      R => '0'
    );
\wrap_cnt_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_cnt_r_reg[3]_0\(1),
      Q => wrap_cnt_r(1),
      R => '0'
    );
\wrap_cnt_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_cnt_r_reg[3]_0\(2),
      Q => wrap_cnt_r(2),
      R => '0'
    );
\wrap_cnt_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_cnt_r_reg[3]_0\(3),
      Q => wrap_cnt_r(3),
      R => '0'
    );
\wrap_second_len_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_second_len_r_reg[3]_1\(0),
      Q => \wrap_second_len_r_reg[3]_0\(0),
      R => '0'
    );
\wrap_second_len_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_second_len_r_reg[3]_1\(1),
      Q => \wrap_second_len_r_reg[3]_0\(1),
      R => '0'
    );
\wrap_second_len_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_second_len_r_reg[3]_1\(2),
      Q => \wrap_second_len_r_reg[3]_0\(2),
      R => '0'
    );
\wrap_second_len_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_second_len_r_reg[3]_1\(3),
      Q => \wrap_second_len_r_reg[3]_0\(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd_3 is
  port (
    sel_first_reg_0 : out STD_LOGIC;
    \axaddr_wrap_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_wrap_reg[11]_0\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \axaddr_wrap_reg[7]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \m_payload_i_reg[39]\ : out STD_LOGIC;
    \m_payload_i_reg[39]_0\ : out STD_LOGIC;
    \axlen_cnt_reg[0]_0\ : out STD_LOGIC;
    \axaddr_offset_r_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_second_len_r_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_boundary_axaddr_r_reg[11]_0\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    aclk : in STD_LOGIC;
    sel_first_reg_1 : in STD_LOGIC;
    \axlen_cnt_reg[3]_0\ : in STD_LOGIC_VECTOR ( 9 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    si_rs_arvalid : in STD_LOGIC;
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axlen_cnt_reg[3]_1\ : in STD_LOGIC;
    sel_first_i : in STD_LOGIC;
    incr_next_pending : in STD_LOGIC;
    \axaddr_wrap_reg[0]_0\ : in STD_LOGIC;
    next_pending_r_reg_0 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_second_len_r_reg[3]_1\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_cnt_r_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    \wrap_boundary_axaddr_r_reg[6]_0\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \axaddr_wrap_reg[11]_1\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd_3 : entity is "axi_protocol_converter_v2_1_22_b2s_wrap_cmd";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd_3;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd_3 is
  signal \axaddr_wrap[11]_i_6__0_n_0\ : STD_LOGIC;
  signal \^axaddr_wrap_reg[11]_0\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \axaddr_wrap_reg[11]_i_3__0_n_1\ : STD_LOGIC;
  signal \axaddr_wrap_reg[11]_i_3__0_n_2\ : STD_LOGIC;
  signal \axaddr_wrap_reg[11]_i_3__0_n_3\ : STD_LOGIC;
  signal \axaddr_wrap_reg[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \axaddr_wrap_reg[3]_i_2__0_n_1\ : STD_LOGIC;
  signal \axaddr_wrap_reg[3]_i_2__0_n_2\ : STD_LOGIC;
  signal \axaddr_wrap_reg[3]_i_2__0_n_3\ : STD_LOGIC;
  signal \axaddr_wrap_reg[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \axaddr_wrap_reg[7]_i_2__0_n_1\ : STD_LOGIC;
  signal \axaddr_wrap_reg[7]_i_2__0_n_2\ : STD_LOGIC;
  signal \axaddr_wrap_reg[7]_i_2__0_n_3\ : STD_LOGIC;
  signal \axlen_cnt[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \axlen_cnt[1]_i_1__2_n_0\ : STD_LOGIC;
  signal \axlen_cnt[2]_i_1__2_n_0\ : STD_LOGIC;
  signal \axlen_cnt[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \axlen_cnt[3]_i_2__2_n_0\ : STD_LOGIC;
  signal \axlen_cnt[3]_i_3__1_n_0\ : STD_LOGIC;
  signal \axlen_cnt[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \axlen_cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal next_pending_r : STD_LOGIC;
  signal \wrap_cnt_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \wrap_cnt_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \wrap_cnt_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \wrap_cnt_r_reg_n_0_[3]\ : STD_LOGIC;
  signal wrap_next_pending : STD_LOGIC;
  signal \NLW_axaddr_wrap_reg[11]_i_3__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \axaddr_wrap_reg[11]_i_3__0\ : label is 35;
  attribute ADDER_THRESHOLD of \axaddr_wrap_reg[3]_i_2__0\ : label is 35;
  attribute ADDER_THRESHOLD of \axaddr_wrap_reg[7]_i_2__0\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \s_axburst_eq0_i_1__0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \s_axburst_eq1_i_1__0\ : label is "soft_lutpair14";
begin
  \axaddr_wrap_reg[11]_0\(11 downto 0) <= \^axaddr_wrap_reg[11]_0\(11 downto 0);
\axaddr_offset_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(0),
      Q => \axaddr_offset_r_reg[3]_0\(0),
      R => '0'
    );
\axaddr_offset_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(1),
      Q => \axaddr_offset_r_reg[3]_0\(1),
      R => '0'
    );
\axaddr_offset_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(2),
      Q => \axaddr_offset_r_reg[3]_0\(2),
      R => '0'
    );
\axaddr_offset_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(3),
      Q => \axaddr_offset_r_reg[3]_0\(3),
      R => '0'
    );
\axaddr_wrap[11]_i_5__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => \axlen_cnt_reg_n_0_[0]\,
      I1 => \wrap_cnt_r_reg_n_0_[0]\,
      I2 => \axlen_cnt_reg_n_0_[4]\,
      I3 => \axaddr_wrap[11]_i_6__0_n_0\,
      O => \axlen_cnt_reg[0]_0\
    );
\axaddr_wrap[11]_i_6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \wrap_cnt_r_reg_n_0_[1]\,
      I1 => \axlen_cnt_reg_n_0_[1]\,
      I2 => \axlen_cnt_reg_n_0_[3]\,
      I3 => \wrap_cnt_r_reg_n_0_[3]\,
      I4 => \axlen_cnt_reg_n_0_[2]\,
      I5 => \wrap_cnt_r_reg_n_0_[2]\,
      O => \axaddr_wrap[11]_i_6__0_n_0\
    );
\axaddr_wrap_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(0),
      Q => \^axaddr_wrap_reg[11]_0\(0),
      R => '0'
    );
\axaddr_wrap_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(10),
      Q => \^axaddr_wrap_reg[11]_0\(10),
      R => '0'
    );
\axaddr_wrap_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(11),
      Q => \^axaddr_wrap_reg[11]_0\(11),
      R => '0'
    );
\axaddr_wrap_reg[11]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \axaddr_wrap_reg[7]_i_2__0_n_0\,
      CO(3) => \NLW_axaddr_wrap_reg[11]_i_3__0_CO_UNCONNECTED\(3),
      CO(2) => \axaddr_wrap_reg[11]_i_3__0_n_1\,
      CO(1) => \axaddr_wrap_reg[11]_i_3__0_n_2\,
      CO(0) => \axaddr_wrap_reg[11]_i_3__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => O(3 downto 0),
      S(3 downto 0) => \^axaddr_wrap_reg[11]_0\(11 downto 8)
    );
\axaddr_wrap_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(1),
      Q => \^axaddr_wrap_reg[11]_0\(1),
      R => '0'
    );
\axaddr_wrap_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(2),
      Q => \^axaddr_wrap_reg[11]_0\(2),
      R => '0'
    );
\axaddr_wrap_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(3),
      Q => \^axaddr_wrap_reg[11]_0\(3),
      R => '0'
    );
\axaddr_wrap_reg[3]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \axaddr_wrap_reg[3]_i_2__0_n_0\,
      CO(2) => \axaddr_wrap_reg[3]_i_2__0_n_1\,
      CO(1) => \axaddr_wrap_reg[3]_i_2__0_n_2\,
      CO(0) => \axaddr_wrap_reg[3]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^axaddr_wrap_reg[11]_0\(3 downto 0),
      O(3 downto 0) => \axaddr_wrap_reg[3]_0\(3 downto 0),
      S(3 downto 0) => S(3 downto 0)
    );
\axaddr_wrap_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(4),
      Q => \^axaddr_wrap_reg[11]_0\(4),
      R => '0'
    );
\axaddr_wrap_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(5),
      Q => \^axaddr_wrap_reg[11]_0\(5),
      R => '0'
    );
\axaddr_wrap_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(6),
      Q => \^axaddr_wrap_reg[11]_0\(6),
      R => '0'
    );
\axaddr_wrap_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(7),
      Q => \^axaddr_wrap_reg[11]_0\(7),
      R => '0'
    );
\axaddr_wrap_reg[7]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \axaddr_wrap_reg[3]_i_2__0_n_0\,
      CO(3) => \axaddr_wrap_reg[7]_i_2__0_n_0\,
      CO(2) => \axaddr_wrap_reg[7]_i_2__0_n_1\,
      CO(1) => \axaddr_wrap_reg[7]_i_2__0_n_2\,
      CO(0) => \axaddr_wrap_reg[7]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \axaddr_wrap_reg[7]_0\(3 downto 0),
      S(3 downto 0) => \^axaddr_wrap_reg[11]_0\(7 downto 4)
    );
\axaddr_wrap_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(8),
      Q => \^axaddr_wrap_reg[11]_0\(8),
      R => '0'
    );
\axaddr_wrap_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axaddr_wrap_reg[11]_1\(9),
      Q => \^axaddr_wrap_reg[11]_0\(9),
      R => '0'
    );
\axlen_cnt[0]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44F44444"
    )
        port map (
      I0 => \axlen_cnt_reg_n_0_[0]\,
      I1 => \axlen_cnt[3]_i_2__2_n_0\,
      I2 => \axlen_cnt_reg[3]_0\(6),
      I3 => Q(0),
      I4 => si_rs_arvalid,
      O => \axlen_cnt[0]_i_1__2_n_0\
    );
\axlen_cnt[1]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F44F4444"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\,
      I1 => \axlen_cnt_reg[3]_0\(7),
      I2 => \axlen_cnt_reg_n_0_[1]\,
      I3 => \axlen_cnt_reg_n_0_[0]\,
      I4 => \axlen_cnt[3]_i_2__2_n_0\,
      O => \axlen_cnt[1]_i_1__2_n_0\
    );
\axlen_cnt[2]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4F4F44F44444444"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\,
      I1 => \axlen_cnt_reg[3]_0\(8),
      I2 => \axlen_cnt_reg_n_0_[2]\,
      I3 => \axlen_cnt_reg_n_0_[0]\,
      I4 => \axlen_cnt_reg_n_0_[1]\,
      I5 => \axlen_cnt[3]_i_2__2_n_0\,
      O => \axlen_cnt[2]_i_1__2_n_0\
    );
\axlen_cnt[3]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0CFCAE0C"
    )
        port map (
      I0 => \axlen_cnt[3]_i_2__2_n_0\,
      I1 => \axlen_cnt_reg[3]_0\(9),
      I2 => \axlen_cnt_reg[3]_1\,
      I3 => \axlen_cnt[3]_i_3__1_n_0\,
      I4 => \axlen_cnt_reg_n_0_[3]\,
      O => \axlen_cnt[3]_i_1__1_n_0\
    );
\axlen_cnt[3]_i_2__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\,
      I1 => \axlen_cnt_reg_n_0_[2]\,
      I2 => \axlen_cnt_reg_n_0_[3]\,
      I3 => \axlen_cnt_reg_n_0_[1]\,
      I4 => \axlen_cnt_reg_n_0_[4]\,
      O => \axlen_cnt[3]_i_2__2_n_0\
    );
\axlen_cnt[3]_i_3__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \axlen_cnt_reg_n_0_[0]\,
      I1 => \axlen_cnt_reg_n_0_[1]\,
      I2 => \axlen_cnt_reg_n_0_[2]\,
      O => \axlen_cnt[3]_i_3__1_n_0\
    );
\axlen_cnt[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \axlen_cnt_reg[3]_1\,
      I1 => \axlen_cnt_reg_n_0_[2]\,
      I2 => \axlen_cnt_reg_n_0_[1]\,
      I3 => \axlen_cnt_reg_n_0_[0]\,
      I4 => \axlen_cnt_reg_n_0_[3]\,
      I5 => \axlen_cnt_reg_n_0_[4]\,
      O => \axlen_cnt[4]_i_1__0_n_0\
    );
\axlen_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axlen_cnt[0]_i_1__2_n_0\,
      Q => \axlen_cnt_reg_n_0_[0]\,
      R => '0'
    );
\axlen_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axlen_cnt[1]_i_1__2_n_0\,
      Q => \axlen_cnt_reg_n_0_[1]\,
      R => '0'
    );
\axlen_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axlen_cnt[2]_i_1__2_n_0\,
      Q => \axlen_cnt_reg_n_0_[2]\,
      R => '0'
    );
\axlen_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axlen_cnt[3]_i_1__1_n_0\,
      Q => \axlen_cnt_reg_n_0_[3]\,
      R => '0'
    );
\axlen_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \axaddr_wrap_reg[0]_0\,
      D => \axlen_cnt[4]_i_1__0_n_0\,
      Q => \axlen_cnt_reg_n_0_[4]\,
      R => '0'
    );
\next_pending_r_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAC"
    )
        port map (
      I0 => \axlen_cnt[3]_i_2__2_n_0\,
      I1 => next_pending_r,
      I2 => \axaddr_wrap_reg[0]_0\,
      I3 => next_pending_r_reg_0,
      O => wrap_next_pending
    );
next_pending_r_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => wrap_next_pending,
      Q => next_pending_r,
      R => '0'
    );
\s_axburst_eq0_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => wrap_next_pending,
      I1 => \axlen_cnt_reg[3]_0\(5),
      I2 => sel_first_i,
      I3 => incr_next_pending,
      O => \m_payload_i_reg[39]\
    );
\s_axburst_eq1_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => wrap_next_pending,
      I1 => \axlen_cnt_reg[3]_0\(5),
      I2 => sel_first_i,
      I3 => incr_next_pending,
      O => \m_payload_i_reg[39]_0\
    );
sel_first_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => sel_first_reg_1,
      Q => sel_first_reg_0,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(0),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(0),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \axlen_cnt_reg[3]_0\(3),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(10),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \axlen_cnt_reg[3]_0\(4),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(11),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(1),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(1),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(2),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(2),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(3),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(3),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(4),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(4),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(5),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(5),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \wrap_boundary_axaddr_r_reg[6]_0\(6),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(6),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \axlen_cnt_reg[3]_0\(0),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(7),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \axlen_cnt_reg[3]_0\(1),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(8),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => \axlen_cnt_reg[3]_0\(2),
      Q => \wrap_boundary_axaddr_r_reg[11]_0\(9),
      R => '0'
    );
\wrap_cnt_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_cnt_r_reg[3]_0\(0),
      Q => \wrap_cnt_r_reg_n_0_[0]\,
      R => '0'
    );
\wrap_cnt_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_cnt_r_reg[3]_0\(1),
      Q => \wrap_cnt_r_reg_n_0_[1]\,
      R => '0'
    );
\wrap_cnt_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_cnt_r_reg[3]_0\(2),
      Q => \wrap_cnt_r_reg_n_0_[2]\,
      R => '0'
    );
\wrap_cnt_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_cnt_r_reg[3]_0\(3),
      Q => \wrap_cnt_r_reg_n_0_[3]\,
      R => '0'
    );
\wrap_second_len_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_second_len_r_reg[3]_1\(0),
      Q => \wrap_second_len_r_reg[3]_0\(0),
      R => '0'
    );
\wrap_second_len_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_second_len_r_reg[3]_1\(1),
      Q => \wrap_second_len_r_reg[3]_0\(1),
      R => '0'
    );
\wrap_second_len_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_second_len_r_reg[3]_1\(2),
      Q => \wrap_second_len_r_reg[3]_0\(2),
      R => '0'
    );
\wrap_second_len_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \wrap_second_len_r_reg[3]_1\(3),
      Q => \wrap_second_len_r_reg[3]_0\(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice is
  port (
    s_ready_i_reg_0 : out STD_LOGIC;
    \aresetn_d_reg[0]_0\ : out STD_LOGIC;
    si_rs_arvalid : out STD_LOGIC;
    \axaddr_incr_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 53 downto 0 );
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \m_payload_i_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \m_payload_i_reg[7]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \FSM_sequential_state_reg[1]\ : out STD_LOGIC;
    \m_payload_i_reg[5]_0\ : out STD_LOGIC;
    \m_payload_i_reg[45]_0\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \m_payload_i_reg[4]_0\ : out STD_LOGIC;
    \m_payload_i_reg[1]_0\ : out STD_LOGIC;
    \m_payload_i_reg[2]_0\ : out STD_LOGIC;
    \m_payload_i_reg[1]_1\ : out STD_LOGIC;
    \m_payload_i_reg[2]_1\ : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \aresetn_d_reg[0]_1\ : out STD_LOGIC;
    s_ready_i0 : in STD_LOGIC;
    aclk : in STD_LOGIC;
    m_valid_i_reg_0 : in STD_LOGIC;
    m_valid_i0 : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    \M00_AXI_0_araddr[11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \M00_AXI_0_araddr[11]_0\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \axaddr_incr_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_second_len_r_reg[3]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    next_pending_r_reg : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \M00_AXI_0_araddr[11]_1\ : in STD_LOGIC;
    sel_first_1 : in STD_LOGIC;
    \m_payload_i_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice : entity is "axi_register_slice_v2_1_22_axic_register_slice";
end dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice;

architecture STRUCTURE of dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice is
  signal \^q\ : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal \^aresetn_d_reg[0]_0\ : STD_LOGIC;
  signal \aresetn_d_reg_n_0_[0]\ : STD_LOGIC;
  signal \axaddr_incr[3]_i_4_n_0\ : STD_LOGIC;
  signal \axaddr_incr[3]_i_5_n_0\ : STD_LOGIC;
  signal \axaddr_incr[3]_i_6_n_0\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_3__0_n_1\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_3__0_n_2\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_3__0_n_3\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_2__0_n_1\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_2__0_n_2\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_2__0_n_3\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_2__0_n_1\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_2__0_n_2\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_2__0_n_3\ : STD_LOGIC;
  signal \m_axi_araddr[11]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \m_payload_i[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[10]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[11]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[13]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[14]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[15]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[16]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[17]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[18]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[19]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[20]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[21]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[22]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[23]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[24]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[25]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[26]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[27]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[28]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[29]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[30]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[31]_i_2__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[32]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[33]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[34]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[35]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[36]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[38]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[39]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[44]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[45]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[46]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[47]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[50]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[51]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[52]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[53]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[54]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[55]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[56]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[57]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[58]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[59]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[60]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[61]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[9]_i_1__0_n_0\ : STD_LOGIC;
  signal \^m_payload_i_reg[5]_0\ : STD_LOGIC;
  signal \m_payload_i_reg_n_0_[38]\ : STD_LOGIC;
  signal \^s_ready_i_reg_0\ : STD_LOGIC;
  signal \^si_rs_arvalid\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[0]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[10]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[11]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[12]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[13]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[14]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[15]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[16]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[17]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[18]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[19]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[1]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[20]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[21]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[22]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[23]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[24]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[25]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[26]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[27]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[28]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[29]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[2]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[30]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[31]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[32]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[33]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[34]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[35]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[36]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[38]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[39]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[3]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[44]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[45]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[46]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[47]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[4]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[50]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[51]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[52]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[53]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[54]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[55]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[56]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[57]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[58]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[59]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[5]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[60]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[61]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[6]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[7]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[8]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[9]\ : STD_LOGIC;
  signal \wrap_boundary_axaddr_r[3]_i_2_n_0\ : STD_LOGIC;
  signal \NLW_axaddr_incr_reg[11]_i_3__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \axaddr_incr_reg[11]_i_3__0\ : label is 35;
  attribute ADDER_THRESHOLD of \axaddr_incr_reg[3]_i_2__0\ : label is 35;
  attribute ADDER_THRESHOLD of \axaddr_incr_reg[7]_i_2__0\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \m_payload_i[0]_i_1__0\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \m_payload_i[10]_i_1__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \m_payload_i[11]_i_1__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \m_payload_i[12]_i_1__0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \m_payload_i[13]_i_1__1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \m_payload_i[14]_i_1__0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \m_payload_i[15]_i_1__0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \m_payload_i[16]_i_1__0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \m_payload_i[17]_i_1__0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \m_payload_i[18]_i_1__0\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \m_payload_i[19]_i_1__0\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \m_payload_i[1]_i_1__0\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \m_payload_i[20]_i_1__0\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \m_payload_i[21]_i_1__0\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \m_payload_i[22]_i_1__0\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \m_payload_i[23]_i_1__0\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \m_payload_i[24]_i_1__0\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \m_payload_i[25]_i_1__0\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \m_payload_i[26]_i_1__0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \m_payload_i[27]_i_1__0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \m_payload_i[28]_i_1__0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \m_payload_i[29]_i_1__0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \m_payload_i[2]_i_1__0\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \m_payload_i[30]_i_1__0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \m_payload_i[31]_i_2__0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \m_payload_i[32]_i_1__0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \m_payload_i[33]_i_1__0\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \m_payload_i[34]_i_1__0\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \m_payload_i[36]_i_1__0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \m_payload_i[38]_i_1__0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \m_payload_i[39]_i_1__0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \m_payload_i[3]_i_1__0\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \m_payload_i[44]_i_1__0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \m_payload_i[45]_i_1__0\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \m_payload_i[46]_i_1__1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \m_payload_i[47]_i_1__0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \m_payload_i[4]_i_1__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \m_payload_i[50]_i_1__0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \m_payload_i[51]_i_1__0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \m_payload_i[52]_i_1__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \m_payload_i[53]_i_1__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \m_payload_i[54]_i_1__0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \m_payload_i[55]_i_1__0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \m_payload_i[56]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \m_payload_i[57]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \m_payload_i[58]_i_1__0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \m_payload_i[59]_i_1__0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \m_payload_i[5]_i_1__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \m_payload_i[60]_i_1__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \m_payload_i[61]_i_1__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \m_payload_i[6]_i_1__0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \m_payload_i[7]_i_1__0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \m_payload_i[8]_i_1__0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \m_payload_i[9]_i_1__0\ : label is "soft_lutpair39";
begin
  Q(53 downto 0) <= \^q\(53 downto 0);
  \aresetn_d_reg[0]_0\ <= \^aresetn_d_reg[0]_0\;
  \m_payload_i_reg[5]_0\ <= \^m_payload_i_reg[5]_0\;
  s_ready_i_reg_0 <= \^s_ready_i_reg_0\;
  si_rs_arvalid <= \^si_rs_arvalid\;
\aresetn_d[1]_inv_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \aresetn_d_reg_n_0_[0]\,
      I1 => aresetn,
      O => \aresetn_d_reg[0]_1\
    );
\aresetn_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => aresetn,
      Q => \aresetn_d_reg_n_0_[0]\,
      R => '0'
    );
\axaddr_incr[3]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \M00_AXI_0_araddr[11]\(3),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => \axaddr_incr_reg[3]\(3)
    );
\axaddr_incr[3]_i_12__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => \M00_AXI_0_araddr[11]\(2),
      I1 => \^q\(36),
      I2 => \^q\(35),
      O => \axaddr_incr_reg[3]\(2)
    );
\axaddr_incr[3]_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => \M00_AXI_0_araddr[11]\(1),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => \axaddr_incr_reg[3]\(1)
    );
\axaddr_incr[3]_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \M00_AXI_0_araddr[11]\(0),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => \axaddr_incr_reg[3]\(0)
    );
\axaddr_incr[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => \axaddr_incr[3]_i_4_n_0\
    );
\axaddr_incr[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(36),
      O => \axaddr_incr[3]_i_5_n_0\
    );
\axaddr_incr[3]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => \axaddr_incr[3]_i_6_n_0\
    );
\axaddr_incr_reg[11]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \axaddr_incr_reg[7]_i_2__0_n_0\,
      CO(3) => \NLW_axaddr_incr_reg[11]_i_3__0_CO_UNCONNECTED\(3),
      CO(2) => \axaddr_incr_reg[11]_i_3__0_n_1\,
      CO(1) => \axaddr_incr_reg[11]_i_3__0_n_2\,
      CO(0) => \axaddr_incr_reg[11]_i_3__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => O(3 downto 0),
      S(3 downto 0) => \^q\(11 downto 8)
    );
\axaddr_incr_reg[3]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \axaddr_incr_reg[3]_i_2__0_n_0\,
      CO(2) => \axaddr_incr_reg[3]_i_2__0_n_1\,
      CO(1) => \axaddr_incr_reg[3]_i_2__0_n_2\,
      CO(0) => \axaddr_incr_reg[3]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3) => \^q\(3),
      DI(2) => \axaddr_incr[3]_i_4_n_0\,
      DI(1) => \axaddr_incr[3]_i_5_n_0\,
      DI(0) => \axaddr_incr[3]_i_6_n_0\,
      O(3 downto 0) => \m_payload_i_reg[3]_0\(3 downto 0),
      S(3 downto 0) => \axaddr_incr_reg[3]_0\(3 downto 0)
    );
\axaddr_incr_reg[7]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \axaddr_incr_reg[3]_i_2__0_n_0\,
      CO(3) => \axaddr_incr_reg[7]_i_2__0_n_0\,
      CO(2) => \axaddr_incr_reg[7]_i_2__0_n_1\,
      CO(1) => \axaddr_incr_reg[7]_i_2__0_n_2\,
      CO(0) => \axaddr_incr_reg[7]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \m_payload_i_reg[7]_0\(3 downto 0),
      S(3 downto 0) => \^q\(7 downto 4)
    );
\axaddr_offset_r[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \^q\(36),
      I4 => \^q\(35),
      I5 => \^q\(0),
      O => \m_payload_i_reg[1]_1\
    );
\axaddr_offset_r[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30800080"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(35),
      I2 => \^q\(39),
      I3 => \^q\(36),
      I4 => \^q\(3),
      O => \m_payload_i_reg[2]_1\
    );
\axaddr_offset_r[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0000088"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(39),
      I2 => \^q\(4),
      I3 => \^q\(36),
      I4 => \^q\(35),
      O => \m_payload_i_reg[1]_0\
    );
\axaddr_offset_r[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0008800"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(40),
      I2 => \^q\(5),
      I3 => \^q\(36),
      I4 => \^q\(35),
      O => \m_payload_i_reg[4]_0\
    );
\axaddr_offset_r[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FFF77"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(40),
      I2 => \^q\(3),
      I3 => \^q\(36),
      I4 => \^q\(35),
      O => \m_payload_i_reg[2]_0\
    );
\axaddr_offset_r[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33550F0033550FFF"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(6),
      I2 => \^q\(4),
      I3 => \^q\(35),
      I4 => \^q\(36),
      I5 => \^q\(3),
      O => \^m_payload_i_reg[5]_0\
    );
\axaddr_wrap[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \M00_AXI_0_araddr[11]_0\(3),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => S(3)
    );
\axaddr_wrap[3]_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => \M00_AXI_0_araddr[11]_0\(2),
      I1 => \^q\(36),
      I2 => \^q\(35),
      O => S(2)
    );
\axaddr_wrap[3]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => \M00_AXI_0_araddr[11]_0\(1),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => S(1)
    );
\axaddr_wrap[3]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \M00_AXI_0_araddr[11]_0\(0),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => S(0)
    );
\m_axi_araddr[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(0),
      I1 => \M00_AXI_0_araddr[11]\(0),
      I2 => \m_axi_araddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_araddr[11]_0\(0),
      I4 => \M00_AXI_0_araddr[11]_1\,
      I5 => \^q\(37),
      O => m_axi_araddr(0)
    );
\m_axi_araddr[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(10),
      I1 => \M00_AXI_0_araddr[11]\(10),
      I2 => \m_axi_araddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_araddr[11]_0\(10),
      I4 => \M00_AXI_0_araddr[11]_1\,
      I5 => \^q\(37),
      O => m_axi_araddr(10)
    );
\m_axi_araddr[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(11),
      I1 => \M00_AXI_0_araddr[11]\(11),
      I2 => \m_axi_araddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_araddr[11]_0\(11),
      I4 => \M00_AXI_0_araddr[11]_1\,
      I5 => \^q\(37),
      O => m_axi_araddr(11)
    );
\m_axi_araddr[11]_INST_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^q\(37),
      I1 => \m_payload_i_reg_n_0_[38]\,
      I2 => sel_first_1,
      O => \m_axi_araddr[11]_INST_0_i_1_n_0\
    );
\m_axi_araddr[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(1),
      I1 => \M00_AXI_0_araddr[11]\(1),
      I2 => \m_axi_araddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_araddr[11]_0\(1),
      I4 => \M00_AXI_0_araddr[11]_1\,
      I5 => \^q\(37),
      O => m_axi_araddr(1)
    );
\m_axi_araddr[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(2),
      I1 => \M00_AXI_0_araddr[11]\(2),
      I2 => \m_axi_araddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_araddr[11]_0\(2),
      I4 => \M00_AXI_0_araddr[11]_1\,
      I5 => \^q\(37),
      O => m_axi_araddr(2)
    );
\m_axi_araddr[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0C00ACAAACAA"
    )
        port map (
      I0 => \^q\(3),
      I1 => \M00_AXI_0_araddr[11]_0\(3),
      I2 => \M00_AXI_0_araddr[11]_1\,
      I3 => \^q\(37),
      I4 => \M00_AXI_0_araddr[11]\(3),
      I5 => \m_axi_araddr[11]_INST_0_i_1_n_0\,
      O => m_axi_araddr(3)
    );
\m_axi_araddr[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(4),
      I1 => \M00_AXI_0_araddr[11]\(4),
      I2 => \m_axi_araddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_araddr[11]_0\(4),
      I4 => \M00_AXI_0_araddr[11]_1\,
      I5 => \^q\(37),
      O => m_axi_araddr(4)
    );
\m_axi_araddr[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(5),
      I1 => \M00_AXI_0_araddr[11]\(5),
      I2 => \m_axi_araddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_araddr[11]_0\(5),
      I4 => \M00_AXI_0_araddr[11]_1\,
      I5 => \^q\(37),
      O => m_axi_araddr(5)
    );
\m_axi_araddr[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0C00ACAAACAA"
    )
        port map (
      I0 => \^q\(6),
      I1 => \M00_AXI_0_araddr[11]_0\(6),
      I2 => \M00_AXI_0_araddr[11]_1\,
      I3 => \^q\(37),
      I4 => \M00_AXI_0_araddr[11]\(6),
      I5 => \m_axi_araddr[11]_INST_0_i_1_n_0\,
      O => m_axi_araddr(6)
    );
\m_axi_araddr[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(7),
      I1 => \M00_AXI_0_araddr[11]\(7),
      I2 => \m_axi_araddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_araddr[11]_0\(7),
      I4 => \M00_AXI_0_araddr[11]_1\,
      I5 => \^q\(37),
      O => m_axi_araddr(7)
    );
\m_axi_araddr[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0C00ACAAACAA"
    )
        port map (
      I0 => \^q\(8),
      I1 => \M00_AXI_0_araddr[11]_0\(8),
      I2 => \M00_AXI_0_araddr[11]_1\,
      I3 => \^q\(37),
      I4 => \M00_AXI_0_araddr[11]\(8),
      I5 => \m_axi_araddr[11]_INST_0_i_1_n_0\,
      O => m_axi_araddr(8)
    );
\m_axi_araddr[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(9),
      I1 => \M00_AXI_0_araddr[11]\(9),
      I2 => \m_axi_araddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_araddr[11]_0\(9),
      I4 => \M00_AXI_0_araddr[11]_1\,
      I5 => \^q\(37),
      O => m_axi_araddr(9)
    );
\m_payload_i[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[0]\,
      O => \m_payload_i[0]_i_1__0_n_0\
    );
\m_payload_i[10]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(10),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[10]\,
      O => \m_payload_i[10]_i_1__0_n_0\
    );
\m_payload_i[11]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(11),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[11]\,
      O => \m_payload_i[11]_i_1__0_n_0\
    );
\m_payload_i[12]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(12),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[12]\,
      O => \m_payload_i[12]_i_1__0_n_0\
    );
\m_payload_i[13]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(13),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[13]\,
      O => \m_payload_i[13]_i_1__1_n_0\
    );
\m_payload_i[14]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(14),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[14]\,
      O => \m_payload_i[14]_i_1__0_n_0\
    );
\m_payload_i[15]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(15),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[15]\,
      O => \m_payload_i[15]_i_1__0_n_0\
    );
\m_payload_i[16]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(16),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[16]\,
      O => \m_payload_i[16]_i_1__0_n_0\
    );
\m_payload_i[17]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(17),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[17]\,
      O => \m_payload_i[17]_i_1__0_n_0\
    );
\m_payload_i[18]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(18),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[18]\,
      O => \m_payload_i[18]_i_1__0_n_0\
    );
\m_payload_i[19]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(19),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[19]\,
      O => \m_payload_i[19]_i_1__0_n_0\
    );
\m_payload_i[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[1]\,
      O => \m_payload_i[1]_i_1__0_n_0\
    );
\m_payload_i[20]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(20),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[20]\,
      O => \m_payload_i[20]_i_1__0_n_0\
    );
\m_payload_i[21]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(21),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[21]\,
      O => \m_payload_i[21]_i_1__0_n_0\
    );
\m_payload_i[22]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(22),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[22]\,
      O => \m_payload_i[22]_i_1__0_n_0\
    );
\m_payload_i[23]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(23),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[23]\,
      O => \m_payload_i[23]_i_1__0_n_0\
    );
\m_payload_i[24]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(24),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[24]\,
      O => \m_payload_i[24]_i_1__0_n_0\
    );
\m_payload_i[25]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(25),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[25]\,
      O => \m_payload_i[25]_i_1__0_n_0\
    );
\m_payload_i[26]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(26),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[26]\,
      O => \m_payload_i[26]_i_1__0_n_0\
    );
\m_payload_i[27]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(27),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[27]\,
      O => \m_payload_i[27]_i_1__0_n_0\
    );
\m_payload_i[28]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(28),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[28]\,
      O => \m_payload_i[28]_i_1__0_n_0\
    );
\m_payload_i[29]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(29),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[29]\,
      O => \m_payload_i[29]_i_1__0_n_0\
    );
\m_payload_i[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[2]\,
      O => \m_payload_i[2]_i_1__0_n_0\
    );
\m_payload_i[30]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(30),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[30]\,
      O => \m_payload_i[30]_i_1__0_n_0\
    );
\m_payload_i[31]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(31),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[31]\,
      O => \m_payload_i[31]_i_2__0_n_0\
    );
\m_payload_i[32]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arprot(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[32]\,
      O => \m_payload_i[32]_i_1__0_n_0\
    );
\m_payload_i[33]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arprot(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[33]\,
      O => \m_payload_i[33]_i_1__0_n_0\
    );
\m_payload_i[34]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arprot(2),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[34]\,
      O => \m_payload_i[34]_i_1__0_n_0\
    );
\m_payload_i[35]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arsize(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[35]\,
      O => \m_payload_i[35]_i_1__0_n_0\
    );
\m_payload_i[36]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[36]\,
      O => \m_payload_i[36]_i_1__0_n_0\
    );
\m_payload_i[38]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arburst(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[38]\,
      O => \m_payload_i[38]_i_1__0_n_0\
    );
\m_payload_i[39]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arburst(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[39]\,
      O => \m_payload_i[39]_i_1__0_n_0\
    );
\m_payload_i[3]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[3]\,
      O => \m_payload_i[3]_i_1__0_n_0\
    );
\m_payload_i[44]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arlen(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[44]\,
      O => \m_payload_i[44]_i_1__0_n_0\
    );
\m_payload_i[45]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arlen(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[45]\,
      O => \m_payload_i[45]_i_1__0_n_0\
    );
\m_payload_i[46]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arlen(2),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[46]\,
      O => \m_payload_i[46]_i_1__1_n_0\
    );
\m_payload_i[47]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arlen(3),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[47]\,
      O => \m_payload_i[47]_i_1__0_n_0\
    );
\m_payload_i[4]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(4),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[4]\,
      O => \m_payload_i[4]_i_1__0_n_0\
    );
\m_payload_i[50]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arid(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[50]\,
      O => \m_payload_i[50]_i_1__0_n_0\
    );
\m_payload_i[51]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arid(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[51]\,
      O => \m_payload_i[51]_i_1__0_n_0\
    );
\m_payload_i[52]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arid(2),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[52]\,
      O => \m_payload_i[52]_i_1__0_n_0\
    );
\m_payload_i[53]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arid(3),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[53]\,
      O => \m_payload_i[53]_i_1__0_n_0\
    );
\m_payload_i[54]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arid(4),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[54]\,
      O => \m_payload_i[54]_i_1__0_n_0\
    );
\m_payload_i[55]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arid(5),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[55]\,
      O => \m_payload_i[55]_i_1__0_n_0\
    );
\m_payload_i[56]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arid(6),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[56]\,
      O => \m_payload_i[56]_i_1__0_n_0\
    );
\m_payload_i[57]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arid(7),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[57]\,
      O => \m_payload_i[57]_i_1__0_n_0\
    );
\m_payload_i[58]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arid(8),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[58]\,
      O => \m_payload_i[58]_i_1__0_n_0\
    );
\m_payload_i[59]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arid(9),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[59]\,
      O => \m_payload_i[59]_i_1__0_n_0\
    );
\m_payload_i[5]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(5),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[5]\,
      O => \m_payload_i[5]_i_1__0_n_0\
    );
\m_payload_i[60]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arid(10),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[60]\,
      O => \m_payload_i[60]_i_1__0_n_0\
    );
\m_payload_i[61]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_arid(11),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[61]\,
      O => \m_payload_i[61]_i_1__0_n_0\
    );
\m_payload_i[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(6),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[6]\,
      O => \m_payload_i[6]_i_1__0_n_0\
    );
\m_payload_i[7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(7),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[7]\,
      O => \m_payload_i[7]_i_1__0_n_0\
    );
\m_payload_i[8]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(8),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[8]\,
      O => \m_payload_i[8]_i_1__0_n_0\
    );
\m_payload_i[9]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(9),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[9]\,
      O => \m_payload_i[9]_i_1__0_n_0\
    );
\m_payload_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[0]_i_1__0_n_0\,
      Q => \^q\(0),
      R => '0'
    );
\m_payload_i_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[10]_i_1__0_n_0\,
      Q => \^q\(10),
      R => '0'
    );
\m_payload_i_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[11]_i_1__0_n_0\,
      Q => \^q\(11),
      R => '0'
    );
\m_payload_i_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[12]_i_1__0_n_0\,
      Q => \^q\(12),
      R => '0'
    );
\m_payload_i_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[13]_i_1__1_n_0\,
      Q => \^q\(13),
      R => '0'
    );
\m_payload_i_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[14]_i_1__0_n_0\,
      Q => \^q\(14),
      R => '0'
    );
\m_payload_i_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[15]_i_1__0_n_0\,
      Q => \^q\(15),
      R => '0'
    );
\m_payload_i_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[16]_i_1__0_n_0\,
      Q => \^q\(16),
      R => '0'
    );
\m_payload_i_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[17]_i_1__0_n_0\,
      Q => \^q\(17),
      R => '0'
    );
\m_payload_i_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[18]_i_1__0_n_0\,
      Q => \^q\(18),
      R => '0'
    );
\m_payload_i_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[19]_i_1__0_n_0\,
      Q => \^q\(19),
      R => '0'
    );
\m_payload_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[1]_i_1__0_n_0\,
      Q => \^q\(1),
      R => '0'
    );
\m_payload_i_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[20]_i_1__0_n_0\,
      Q => \^q\(20),
      R => '0'
    );
\m_payload_i_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[21]_i_1__0_n_0\,
      Q => \^q\(21),
      R => '0'
    );
\m_payload_i_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[22]_i_1__0_n_0\,
      Q => \^q\(22),
      R => '0'
    );
\m_payload_i_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[23]_i_1__0_n_0\,
      Q => \^q\(23),
      R => '0'
    );
\m_payload_i_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[24]_i_1__0_n_0\,
      Q => \^q\(24),
      R => '0'
    );
\m_payload_i_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[25]_i_1__0_n_0\,
      Q => \^q\(25),
      R => '0'
    );
\m_payload_i_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[26]_i_1__0_n_0\,
      Q => \^q\(26),
      R => '0'
    );
\m_payload_i_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[27]_i_1__0_n_0\,
      Q => \^q\(27),
      R => '0'
    );
\m_payload_i_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[28]_i_1__0_n_0\,
      Q => \^q\(28),
      R => '0'
    );
\m_payload_i_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[29]_i_1__0_n_0\,
      Q => \^q\(29),
      R => '0'
    );
\m_payload_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[2]_i_1__0_n_0\,
      Q => \^q\(2),
      R => '0'
    );
\m_payload_i_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[30]_i_1__0_n_0\,
      Q => \^q\(30),
      R => '0'
    );
\m_payload_i_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[31]_i_2__0_n_0\,
      Q => \^q\(31),
      R => '0'
    );
\m_payload_i_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[32]_i_1__0_n_0\,
      Q => \^q\(32),
      R => '0'
    );
\m_payload_i_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[33]_i_1__0_n_0\,
      Q => \^q\(33),
      R => '0'
    );
\m_payload_i_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[34]_i_1__0_n_0\,
      Q => \^q\(34),
      R => '0'
    );
\m_payload_i_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[35]_i_1__0_n_0\,
      Q => \^q\(35),
      R => '0'
    );
\m_payload_i_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[36]_i_1__0_n_0\,
      Q => \^q\(36),
      R => '0'
    );
\m_payload_i_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[38]_i_1__0_n_0\,
      Q => \m_payload_i_reg_n_0_[38]\,
      R => '0'
    );
\m_payload_i_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[39]_i_1__0_n_0\,
      Q => \^q\(37),
      R => '0'
    );
\m_payload_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[3]_i_1__0_n_0\,
      Q => \^q\(3),
      R => '0'
    );
\m_payload_i_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[44]_i_1__0_n_0\,
      Q => \^q\(38),
      R => '0'
    );
\m_payload_i_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[45]_i_1__0_n_0\,
      Q => \^q\(39),
      R => '0'
    );
\m_payload_i_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[46]_i_1__1_n_0\,
      Q => \^q\(40),
      R => '0'
    );
\m_payload_i_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[47]_i_1__0_n_0\,
      Q => \^q\(41),
      R => '0'
    );
\m_payload_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[4]_i_1__0_n_0\,
      Q => \^q\(4),
      R => '0'
    );
\m_payload_i_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[50]_i_1__0_n_0\,
      Q => \^q\(42),
      R => '0'
    );
\m_payload_i_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[51]_i_1__0_n_0\,
      Q => \^q\(43),
      R => '0'
    );
\m_payload_i_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[52]_i_1__0_n_0\,
      Q => \^q\(44),
      R => '0'
    );
\m_payload_i_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[53]_i_1__0_n_0\,
      Q => \^q\(45),
      R => '0'
    );
\m_payload_i_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[54]_i_1__0_n_0\,
      Q => \^q\(46),
      R => '0'
    );
\m_payload_i_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[55]_i_1__0_n_0\,
      Q => \^q\(47),
      R => '0'
    );
\m_payload_i_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[56]_i_1__0_n_0\,
      Q => \^q\(48),
      R => '0'
    );
\m_payload_i_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[57]_i_1__0_n_0\,
      Q => \^q\(49),
      R => '0'
    );
\m_payload_i_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[58]_i_1__0_n_0\,
      Q => \^q\(50),
      R => '0'
    );
\m_payload_i_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[59]_i_1__0_n_0\,
      Q => \^q\(51),
      R => '0'
    );
\m_payload_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[5]_i_1__0_n_0\,
      Q => \^q\(5),
      R => '0'
    );
\m_payload_i_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[60]_i_1__0_n_0\,
      Q => \^q\(52),
      R => '0'
    );
\m_payload_i_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[61]_i_1__0_n_0\,
      Q => \^q\(53),
      R => '0'
    );
\m_payload_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[6]_i_1__0_n_0\,
      Q => \^q\(6),
      R => '0'
    );
\m_payload_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[7]_i_1__0_n_0\,
      Q => \^q\(7),
      R => '0'
    );
\m_payload_i_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[8]_i_1__0_n_0\,
      Q => \^q\(8),
      R => '0'
    );
\m_payload_i_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_payload_i_reg[0]_0\(0),
      D => \m_payload_i[9]_i_1__0_n_0\,
      Q => \^q\(9),
      R => '0'
    );
m_valid_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => m_valid_i0,
      Q => \^si_rs_arvalid\,
      R => m_valid_i_reg_0
    );
\next_pending_r_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => \^q\(39),
      I1 => \^q\(38),
      I2 => \^q\(40),
      I3 => \^q\(41),
      I4 => next_pending_r_reg,
      O => \m_payload_i_reg[45]_0\
    );
\s_ready_i_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \aresetn_d_reg_n_0_[0]\,
      O => \^aresetn_d_reg[0]_0\
    );
s_ready_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => s_ready_i0,
      Q => \^s_ready_i_reg_0\,
      R => \^aresetn_d_reg[0]_0\
    );
\skid_buffer_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(0),
      Q => \skid_buffer_reg_n_0_[0]\,
      R => '0'
    );
\skid_buffer_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(10),
      Q => \skid_buffer_reg_n_0_[10]\,
      R => '0'
    );
\skid_buffer_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(11),
      Q => \skid_buffer_reg_n_0_[11]\,
      R => '0'
    );
\skid_buffer_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(12),
      Q => \skid_buffer_reg_n_0_[12]\,
      R => '0'
    );
\skid_buffer_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(13),
      Q => \skid_buffer_reg_n_0_[13]\,
      R => '0'
    );
\skid_buffer_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(14),
      Q => \skid_buffer_reg_n_0_[14]\,
      R => '0'
    );
\skid_buffer_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(15),
      Q => \skid_buffer_reg_n_0_[15]\,
      R => '0'
    );
\skid_buffer_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(16),
      Q => \skid_buffer_reg_n_0_[16]\,
      R => '0'
    );
\skid_buffer_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(17),
      Q => \skid_buffer_reg_n_0_[17]\,
      R => '0'
    );
\skid_buffer_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(18),
      Q => \skid_buffer_reg_n_0_[18]\,
      R => '0'
    );
\skid_buffer_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(19),
      Q => \skid_buffer_reg_n_0_[19]\,
      R => '0'
    );
\skid_buffer_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(1),
      Q => \skid_buffer_reg_n_0_[1]\,
      R => '0'
    );
\skid_buffer_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(20),
      Q => \skid_buffer_reg_n_0_[20]\,
      R => '0'
    );
\skid_buffer_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(21),
      Q => \skid_buffer_reg_n_0_[21]\,
      R => '0'
    );
\skid_buffer_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(22),
      Q => \skid_buffer_reg_n_0_[22]\,
      R => '0'
    );
\skid_buffer_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(23),
      Q => \skid_buffer_reg_n_0_[23]\,
      R => '0'
    );
\skid_buffer_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(24),
      Q => \skid_buffer_reg_n_0_[24]\,
      R => '0'
    );
\skid_buffer_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(25),
      Q => \skid_buffer_reg_n_0_[25]\,
      R => '0'
    );
\skid_buffer_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(26),
      Q => \skid_buffer_reg_n_0_[26]\,
      R => '0'
    );
\skid_buffer_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(27),
      Q => \skid_buffer_reg_n_0_[27]\,
      R => '0'
    );
\skid_buffer_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(28),
      Q => \skid_buffer_reg_n_0_[28]\,
      R => '0'
    );
\skid_buffer_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(29),
      Q => \skid_buffer_reg_n_0_[29]\,
      R => '0'
    );
\skid_buffer_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(2),
      Q => \skid_buffer_reg_n_0_[2]\,
      R => '0'
    );
\skid_buffer_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(30),
      Q => \skid_buffer_reg_n_0_[30]\,
      R => '0'
    );
\skid_buffer_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(31),
      Q => \skid_buffer_reg_n_0_[31]\,
      R => '0'
    );
\skid_buffer_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arprot(0),
      Q => \skid_buffer_reg_n_0_[32]\,
      R => '0'
    );
\skid_buffer_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arprot(1),
      Q => \skid_buffer_reg_n_0_[33]\,
      R => '0'
    );
\skid_buffer_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arprot(2),
      Q => \skid_buffer_reg_n_0_[34]\,
      R => '0'
    );
\skid_buffer_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arsize(0),
      Q => \skid_buffer_reg_n_0_[35]\,
      R => '0'
    );
\skid_buffer_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arsize(1),
      Q => \skid_buffer_reg_n_0_[36]\,
      R => '0'
    );
\skid_buffer_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arburst(0),
      Q => \skid_buffer_reg_n_0_[38]\,
      R => '0'
    );
\skid_buffer_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arburst(1),
      Q => \skid_buffer_reg_n_0_[39]\,
      R => '0'
    );
\skid_buffer_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(3),
      Q => \skid_buffer_reg_n_0_[3]\,
      R => '0'
    );
\skid_buffer_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arlen(0),
      Q => \skid_buffer_reg_n_0_[44]\,
      R => '0'
    );
\skid_buffer_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arlen(1),
      Q => \skid_buffer_reg_n_0_[45]\,
      R => '0'
    );
\skid_buffer_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arlen(2),
      Q => \skid_buffer_reg_n_0_[46]\,
      R => '0'
    );
\skid_buffer_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arlen(3),
      Q => \skid_buffer_reg_n_0_[47]\,
      R => '0'
    );
\skid_buffer_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(4),
      Q => \skid_buffer_reg_n_0_[4]\,
      R => '0'
    );
\skid_buffer_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arid(0),
      Q => \skid_buffer_reg_n_0_[50]\,
      R => '0'
    );
\skid_buffer_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arid(1),
      Q => \skid_buffer_reg_n_0_[51]\,
      R => '0'
    );
\skid_buffer_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arid(2),
      Q => \skid_buffer_reg_n_0_[52]\,
      R => '0'
    );
\skid_buffer_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arid(3),
      Q => \skid_buffer_reg_n_0_[53]\,
      R => '0'
    );
\skid_buffer_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arid(4),
      Q => \skid_buffer_reg_n_0_[54]\,
      R => '0'
    );
\skid_buffer_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arid(5),
      Q => \skid_buffer_reg_n_0_[55]\,
      R => '0'
    );
\skid_buffer_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arid(6),
      Q => \skid_buffer_reg_n_0_[56]\,
      R => '0'
    );
\skid_buffer_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arid(7),
      Q => \skid_buffer_reg_n_0_[57]\,
      R => '0'
    );
\skid_buffer_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arid(8),
      Q => \skid_buffer_reg_n_0_[58]\,
      R => '0'
    );
\skid_buffer_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arid(9),
      Q => \skid_buffer_reg_n_0_[59]\,
      R => '0'
    );
\skid_buffer_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(5),
      Q => \skid_buffer_reg_n_0_[5]\,
      R => '0'
    );
\skid_buffer_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arid(10),
      Q => \skid_buffer_reg_n_0_[60]\,
      R => '0'
    );
\skid_buffer_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_arid(11),
      Q => \skid_buffer_reg_n_0_[61]\,
      R => '0'
    );
\skid_buffer_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(6),
      Q => \skid_buffer_reg_n_0_[6]\,
      R => '0'
    );
\skid_buffer_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(7),
      Q => \skid_buffer_reg_n_0_[7]\,
      R => '0'
    );
\skid_buffer_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(8),
      Q => \skid_buffer_reg_n_0_[8]\,
      R => '0'
    );
\skid_buffer_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_araddr(9),
      Q => \skid_buffer_reg_n_0_[9]\,
      R => '0'
    );
\wrap_boundary_axaddr_r[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(36),
      I2 => \^q\(35),
      I3 => \^q\(38),
      O => D(0)
    );
\wrap_boundary_axaddr_r[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDCF0000"
    )
        port map (
      I0 => \^q\(38),
      I1 => \^q\(36),
      I2 => \^q\(39),
      I3 => \^q\(35),
      I4 => \^q\(1),
      O => D(1)
    );
\wrap_boundary_axaddr_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0A0202AAAAA202A"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(38),
      I2 => \^q\(36),
      I3 => \^q\(40),
      I4 => \^q\(35),
      I5 => \^q\(39),
      O => D(2)
    );
\wrap_boundary_axaddr_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF008020A0"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(36),
      I2 => \^q\(35),
      I3 => \^q\(38),
      I4 => \^q\(40),
      I5 => \wrap_boundary_axaddr_r[3]_i_2_n_0\,
      O => D(3)
    );
\wrap_boundary_axaddr_r[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00300050"
    )
        port map (
      I0 => \^q\(41),
      I1 => \^q\(39),
      I2 => \^q\(3),
      I3 => \^q\(35),
      I4 => \^q\(36),
      O => \wrap_boundary_axaddr_r[3]_i_2_n_0\
    );
\wrap_boundary_axaddr_r[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000A22AAAA0A22AA"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(40),
      I2 => \^q\(41),
      I3 => \^q\(36),
      I4 => \^q\(35),
      I5 => \^q\(39),
      O => D(4)
    );
\wrap_boundary_axaddr_r[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"737F0000"
    )
        port map (
      I0 => \^q\(40),
      I1 => \^q\(36),
      I2 => \^q\(35),
      I3 => \^q\(41),
      I4 => \^q\(5),
      O => D(5)
    );
\wrap_boundary_axaddr_r[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2AAA"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(41),
      I2 => \^q\(36),
      I3 => \^q\(35),
      O => D(6)
    );
\wrap_second_len_r[3]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => \wrap_second_len_r_reg[3]\(1),
      I1 => \wrap_second_len_r_reg[3]\(0),
      I2 => \^si_rs_arvalid\,
      I3 => \^q\(41),
      I4 => \^m_payload_i_reg[5]_0\,
      O => \FSM_sequential_state_reg[1]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice_0 is
  port (
    s_ready_i_reg_0 : out STD_LOGIC;
    m_valid_i_reg_0 : out STD_LOGIC;
    \axaddr_incr_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 53 downto 0 );
    \axaddr_wrap_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axaddr_incr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \m_payload_i_reg[45]_0\ : out STD_LOGIC;
    \FSM_sequential_state_reg[0]\ : out STD_LOGIC;
    \m_payload_i_reg[6]_0\ : out STD_LOGIC;
    axaddr_offset : out STD_LOGIC_VECTOR ( 0 to 0 );
    \m_payload_i_reg[6]_1\ : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \m_payload_i_reg[1]_0\ : out STD_LOGIC;
    \m_payload_i_reg[1]_1\ : out STD_LOGIC;
    \m_payload_i_reg[2]_0\ : out STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_ready_i_reg_1 : in STD_LOGIC;
    aclk : in STD_LOGIC;
    m_valid_i_reg_1 : in STD_LOGIC;
    \M00_AXI_0_awaddr[11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \M00_AXI_0_awaddr[11]_0\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    b_push : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    \axaddr_incr_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    next_pending_r_reg : in STD_LOGIC;
    \axaddr_offset_r_reg[2]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \axaddr_offset_r_reg[2]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sel_first : in STD_LOGIC;
    sel_first_0 : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice_0 : entity is "axi_register_slice_v2_1_22_axic_register_slice";
end dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice_0;

architecture STRUCTURE of dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice_0 is
  signal \^q\ : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal \axaddr_incr[3]_i_4__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr[3]_i_5__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr[3]_i_6__0_n_0\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_3_n_1\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_3_n_2\ : STD_LOGIC;
  signal \axaddr_incr_reg[11]_i_3_n_3\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_2_n_1\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_2_n_2\ : STD_LOGIC;
  signal \axaddr_incr_reg[3]_i_2_n_3\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_2_n_1\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_2_n_2\ : STD_LOGIC;
  signal \axaddr_incr_reg[7]_i_2_n_3\ : STD_LOGIC;
  signal \axaddr_offset_r[2]_i_2__0_n_0\ : STD_LOGIC;
  signal \m_axi_awaddr[11]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \^m_payload_i_reg[6]_0\ : STD_LOGIC;
  signal \m_payload_i_reg_n_0_[38]\ : STD_LOGIC;
  signal m_valid_i0 : STD_LOGIC;
  signal \^m_valid_i_reg_0\ : STD_LOGIC;
  signal s_ready_i0 : STD_LOGIC;
  signal \^s_ready_i_reg_0\ : STD_LOGIC;
  signal skid_buffer : STD_LOGIC_VECTOR ( 61 downto 0 );
  signal \skid_buffer_reg_n_0_[0]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[10]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[11]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[12]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[13]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[14]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[15]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[16]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[17]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[18]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[19]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[1]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[20]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[21]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[22]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[23]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[24]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[25]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[26]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[27]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[28]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[29]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[2]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[30]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[31]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[32]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[33]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[34]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[35]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[36]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[38]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[39]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[3]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[44]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[45]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[46]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[47]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[4]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[50]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[51]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[52]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[53]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[54]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[55]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[56]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[57]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[58]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[59]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[5]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[60]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[61]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[6]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[7]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[8]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[9]\ : STD_LOGIC;
  signal \wrap_boundary_axaddr_r[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \NLW_axaddr_incr_reg[11]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \axaddr_incr_reg[11]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \axaddr_incr_reg[3]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \axaddr_incr_reg[7]_i_2\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \m_payload_i[0]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \m_payload_i[10]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \m_payload_i[11]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \m_payload_i[12]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \m_payload_i[13]_i_1__0\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \m_payload_i[14]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \m_payload_i[15]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \m_payload_i[16]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \m_payload_i[17]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \m_payload_i[18]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \m_payload_i[19]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \m_payload_i[1]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \m_payload_i[20]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \m_payload_i[21]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \m_payload_i[22]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \m_payload_i[23]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \m_payload_i[24]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \m_payload_i[25]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \m_payload_i[26]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \m_payload_i[27]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \m_payload_i[28]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \m_payload_i[29]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \m_payload_i[2]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \m_payload_i[30]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \m_payload_i[31]_i_2\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \m_payload_i[33]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \m_payload_i[34]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \m_payload_i[35]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \m_payload_i[36]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \m_payload_i[38]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \m_payload_i[39]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \m_payload_i[3]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \m_payload_i[44]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \m_payload_i[45]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \m_payload_i[46]_i_1__0\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \m_payload_i[47]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \m_payload_i[4]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \m_payload_i[50]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \m_payload_i[51]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \m_payload_i[52]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \m_payload_i[53]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \m_payload_i[54]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \m_payload_i[55]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \m_payload_i[56]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \m_payload_i[57]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \m_payload_i[58]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \m_payload_i[59]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \m_payload_i[5]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \m_payload_i[60]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \m_payload_i[61]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \m_payload_i[6]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \m_payload_i[7]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \m_payload_i[8]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \m_payload_i[9]_i_1\ : label is "soft_lutpair65";
begin
  Q(53 downto 0) <= \^q\(53 downto 0);
  \m_payload_i_reg[6]_0\ <= \^m_payload_i_reg[6]_0\;
  m_valid_i_reg_0 <= \^m_valid_i_reg_0\;
  s_ready_i_reg_0 <= \^s_ready_i_reg_0\;
\axaddr_incr[3]_i_11__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \M00_AXI_0_awaddr[11]\(3),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => \axaddr_incr_reg[3]\(3)
    );
\axaddr_incr[3]_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => \M00_AXI_0_awaddr[11]\(2),
      I1 => \^q\(36),
      I2 => \^q\(35),
      O => \axaddr_incr_reg[3]\(2)
    );
\axaddr_incr[3]_i_13__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => \M00_AXI_0_awaddr[11]\(1),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => \axaddr_incr_reg[3]\(1)
    );
\axaddr_incr[3]_i_14__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \M00_AXI_0_awaddr[11]\(0),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => \axaddr_incr_reg[3]\(0)
    );
\axaddr_incr[3]_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => \axaddr_incr[3]_i_4__0_n_0\
    );
\axaddr_incr[3]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(36),
      O => \axaddr_incr[3]_i_5__0_n_0\
    );
\axaddr_incr[3]_i_6__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => \axaddr_incr[3]_i_6__0_n_0\
    );
\axaddr_incr_reg[11]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \axaddr_incr_reg[7]_i_2_n_0\,
      CO(3) => \NLW_axaddr_incr_reg[11]_i_3_CO_UNCONNECTED\(3),
      CO(2) => \axaddr_incr_reg[11]_i_3_n_1\,
      CO(1) => \axaddr_incr_reg[11]_i_3_n_2\,
      CO(0) => \axaddr_incr_reg[11]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => axaddr_incr(11 downto 8),
      S(3 downto 0) => \^q\(11 downto 8)
    );
\axaddr_incr_reg[3]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \axaddr_incr_reg[3]_i_2_n_0\,
      CO(2) => \axaddr_incr_reg[3]_i_2_n_1\,
      CO(1) => \axaddr_incr_reg[3]_i_2_n_2\,
      CO(0) => \axaddr_incr_reg[3]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => \^q\(3),
      DI(2) => \axaddr_incr[3]_i_4__0_n_0\,
      DI(1) => \axaddr_incr[3]_i_5__0_n_0\,
      DI(0) => \axaddr_incr[3]_i_6__0_n_0\,
      O(3 downto 0) => axaddr_incr(3 downto 0),
      S(3 downto 0) => \axaddr_incr_reg[3]_0\(3 downto 0)
    );
\axaddr_incr_reg[7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \axaddr_incr_reg[3]_i_2_n_0\,
      CO(3) => \axaddr_incr_reg[7]_i_2_n_0\,
      CO(2) => \axaddr_incr_reg[7]_i_2_n_1\,
      CO(1) => \axaddr_incr_reg[7]_i_2_n_2\,
      CO(0) => \axaddr_incr_reg[7]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => axaddr_incr(7 downto 4),
      S(3 downto 0) => \^q\(7 downto 4)
    );
\axaddr_offset_r[0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \^q\(36),
      I4 => \^q\(35),
      I5 => \^q\(0),
      O => \m_payload_i_reg[1]_0\
    );
\axaddr_offset_r[1]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30800080"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(35),
      I2 => \^q\(39),
      I3 => \^q\(36),
      I4 => \^q\(3),
      O => \m_payload_i_reg[2]_0\
    );
\axaddr_offset_r[1]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0000088"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(39),
      I2 => \^q\(4),
      I3 => \^q\(36),
      I4 => \^q\(35),
      O => \m_payload_i_reg[1]_1\
    );
\axaddr_offset_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF4FFFFF00400000"
    )
        port map (
      I0 => \axaddr_offset_r[2]_i_2__0_n_0\,
      I1 => \^q\(40),
      I2 => \axaddr_offset_r_reg[2]\(0),
      I3 => \axaddr_offset_r_reg[2]\(1),
      I4 => \^m_valid_i_reg_0\,
      I5 => \axaddr_offset_r_reg[2]_0\(0),
      O => axaddr_offset(0)
    );
\axaddr_offset_r[2]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00550F33FF550F33"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(3),
      I3 => \^q\(35),
      I4 => \^q\(36),
      I5 => \^q\(5),
      O => \axaddr_offset_r[2]_i_2__0_n_0\
    );
\axaddr_offset_r[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5533000F5533FF0F"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(5),
      I2 => \^q\(3),
      I3 => \^q\(35),
      I4 => \^q\(36),
      I5 => \^q\(4),
      O => \^m_payload_i_reg[6]_0\
    );
\axaddr_wrap[3]_i_3__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \M00_AXI_0_awaddr[11]_0\(3),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => \axaddr_wrap_reg[3]\(3)
    );
\axaddr_wrap[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => \M00_AXI_0_awaddr[11]_0\(2),
      I1 => \^q\(36),
      I2 => \^q\(35),
      O => \axaddr_wrap_reg[3]\(2)
    );
\axaddr_wrap[3]_i_5__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => \M00_AXI_0_awaddr[11]_0\(1),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => \axaddr_wrap_reg[3]\(1)
    );
\axaddr_wrap[3]_i_6__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \M00_AXI_0_awaddr[11]_0\(0),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => \axaddr_wrap_reg[3]\(0)
    );
\m_axi_awaddr[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(0),
      I1 => \M00_AXI_0_awaddr[11]\(0),
      I2 => \m_axi_awaddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_awaddr[11]_0\(0),
      I4 => sel_first,
      I5 => \^q\(37),
      O => m_axi_awaddr(0)
    );
\m_axi_awaddr[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(10),
      I1 => \M00_AXI_0_awaddr[11]\(10),
      I2 => \m_axi_awaddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_awaddr[11]_0\(10),
      I4 => sel_first,
      I5 => \^q\(37),
      O => m_axi_awaddr(10)
    );
\m_axi_awaddr[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(11),
      I1 => \M00_AXI_0_awaddr[11]\(11),
      I2 => \m_axi_awaddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_awaddr[11]_0\(11),
      I4 => sel_first,
      I5 => \^q\(37),
      O => m_axi_awaddr(11)
    );
\m_axi_awaddr[11]_INST_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^q\(37),
      I1 => \m_payload_i_reg_n_0_[38]\,
      I2 => sel_first_0,
      O => \m_axi_awaddr[11]_INST_0_i_1_n_0\
    );
\m_axi_awaddr[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(1),
      I1 => \M00_AXI_0_awaddr[11]\(1),
      I2 => \m_axi_awaddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_awaddr[11]_0\(1),
      I4 => sel_first,
      I5 => \^q\(37),
      O => m_axi_awaddr(1)
    );
\m_axi_awaddr[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(2),
      I1 => \M00_AXI_0_awaddr[11]\(2),
      I2 => \m_axi_awaddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_awaddr[11]_0\(2),
      I4 => sel_first,
      I5 => \^q\(37),
      O => m_axi_awaddr(2)
    );
\m_axi_awaddr[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(3),
      I1 => \M00_AXI_0_awaddr[11]\(3),
      I2 => \m_axi_awaddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_awaddr[11]_0\(3),
      I4 => sel_first,
      I5 => \^q\(37),
      O => m_axi_awaddr(3)
    );
\m_axi_awaddr[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(4),
      I1 => \M00_AXI_0_awaddr[11]\(4),
      I2 => \m_axi_awaddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_awaddr[11]_0\(4),
      I4 => sel_first,
      I5 => \^q\(37),
      O => m_axi_awaddr(4)
    );
\m_axi_awaddr[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(5),
      I1 => \M00_AXI_0_awaddr[11]\(5),
      I2 => \m_axi_awaddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_awaddr[11]_0\(5),
      I4 => sel_first,
      I5 => \^q\(37),
      O => m_axi_awaddr(5)
    );
\m_axi_awaddr[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(6),
      I1 => \M00_AXI_0_awaddr[11]\(6),
      I2 => \m_axi_awaddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_awaddr[11]_0\(6),
      I4 => sel_first,
      I5 => \^q\(37),
      O => m_axi_awaddr(6)
    );
\m_axi_awaddr[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(7),
      I1 => \M00_AXI_0_awaddr[11]\(7),
      I2 => \m_axi_awaddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_awaddr[11]_0\(7),
      I4 => sel_first,
      I5 => \^q\(37),
      O => m_axi_awaddr(7)
    );
\m_axi_awaddr[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(8),
      I1 => \M00_AXI_0_awaddr[11]\(8),
      I2 => \m_axi_awaddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_awaddr[11]_0\(8),
      I4 => sel_first,
      I5 => \^q\(37),
      O => m_axi_awaddr(8)
    );
\m_axi_awaddr[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CACAFFC0CACACACA"
    )
        port map (
      I0 => \^q\(9),
      I1 => \M00_AXI_0_awaddr[11]\(9),
      I2 => \m_axi_awaddr[11]_INST_0_i_1_n_0\,
      I3 => \M00_AXI_0_awaddr[11]_0\(9),
      I4 => sel_first,
      I5 => \^q\(37),
      O => m_axi_awaddr(9)
    );
\m_payload_i[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[0]\,
      O => skid_buffer(0)
    );
\m_payload_i[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(10),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[10]\,
      O => skid_buffer(10)
    );
\m_payload_i[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(11),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[11]\,
      O => skid_buffer(11)
    );
\m_payload_i[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(12),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[12]\,
      O => skid_buffer(12)
    );
\m_payload_i[13]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(13),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[13]\,
      O => skid_buffer(13)
    );
\m_payload_i[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(14),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[14]\,
      O => skid_buffer(14)
    );
\m_payload_i[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(15),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[15]\,
      O => skid_buffer(15)
    );
\m_payload_i[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(16),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[16]\,
      O => skid_buffer(16)
    );
\m_payload_i[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(17),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[17]\,
      O => skid_buffer(17)
    );
\m_payload_i[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(18),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[18]\,
      O => skid_buffer(18)
    );
\m_payload_i[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(19),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[19]\,
      O => skid_buffer(19)
    );
\m_payload_i[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[1]\,
      O => skid_buffer(1)
    );
\m_payload_i[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(20),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[20]\,
      O => skid_buffer(20)
    );
\m_payload_i[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(21),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[21]\,
      O => skid_buffer(21)
    );
\m_payload_i[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(22),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[22]\,
      O => skid_buffer(22)
    );
\m_payload_i[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(23),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[23]\,
      O => skid_buffer(23)
    );
\m_payload_i[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(24),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[24]\,
      O => skid_buffer(24)
    );
\m_payload_i[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(25),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[25]\,
      O => skid_buffer(25)
    );
\m_payload_i[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(26),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[26]\,
      O => skid_buffer(26)
    );
\m_payload_i[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(27),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[27]\,
      O => skid_buffer(27)
    );
\m_payload_i[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(28),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[28]\,
      O => skid_buffer(28)
    );
\m_payload_i[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(29),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[29]\,
      O => skid_buffer(29)
    );
\m_payload_i[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(2),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[2]\,
      O => skid_buffer(2)
    );
\m_payload_i[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(30),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[30]\,
      O => skid_buffer(30)
    );
\m_payload_i[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(31),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[31]\,
      O => skid_buffer(31)
    );
\m_payload_i[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awprot(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[32]\,
      O => skid_buffer(32)
    );
\m_payload_i[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awprot(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[33]\,
      O => skid_buffer(33)
    );
\m_payload_i[34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awprot(2),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[34]\,
      O => skid_buffer(34)
    );
\m_payload_i[35]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awsize(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[35]\,
      O => skid_buffer(35)
    );
\m_payload_i[36]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[36]\,
      O => skid_buffer(36)
    );
\m_payload_i[38]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awburst(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[38]\,
      O => skid_buffer(38)
    );
\m_payload_i[39]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awburst(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[39]\,
      O => skid_buffer(39)
    );
\m_payload_i[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(3),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[3]\,
      O => skid_buffer(3)
    );
\m_payload_i[44]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awlen(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[44]\,
      O => skid_buffer(44)
    );
\m_payload_i[45]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awlen(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[45]\,
      O => skid_buffer(45)
    );
\m_payload_i[46]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awlen(2),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[46]\,
      O => skid_buffer(46)
    );
\m_payload_i[47]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awlen(3),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[47]\,
      O => skid_buffer(47)
    );
\m_payload_i[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(4),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[4]\,
      O => skid_buffer(4)
    );
\m_payload_i[50]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awid(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[50]\,
      O => skid_buffer(50)
    );
\m_payload_i[51]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awid(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[51]\,
      O => skid_buffer(51)
    );
\m_payload_i[52]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awid(2),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[52]\,
      O => skid_buffer(52)
    );
\m_payload_i[53]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awid(3),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[53]\,
      O => skid_buffer(53)
    );
\m_payload_i[54]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awid(4),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[54]\,
      O => skid_buffer(54)
    );
\m_payload_i[55]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awid(5),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[55]\,
      O => skid_buffer(55)
    );
\m_payload_i[56]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awid(6),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[56]\,
      O => skid_buffer(56)
    );
\m_payload_i[57]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awid(7),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[57]\,
      O => skid_buffer(57)
    );
\m_payload_i[58]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awid(8),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[58]\,
      O => skid_buffer(58)
    );
\m_payload_i[59]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awid(9),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[59]\,
      O => skid_buffer(59)
    );
\m_payload_i[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(5),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[5]\,
      O => skid_buffer(5)
    );
\m_payload_i[60]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awid(10),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[60]\,
      O => skid_buffer(60)
    );
\m_payload_i[61]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awid(11),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[61]\,
      O => skid_buffer(61)
    );
\m_payload_i[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(6),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[6]\,
      O => skid_buffer(6)
    );
\m_payload_i[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(7),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[7]\,
      O => skid_buffer(7)
    );
\m_payload_i[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(8),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[8]\,
      O => skid_buffer(8)
    );
\m_payload_i[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_awaddr(9),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[9]\,
      O => skid_buffer(9)
    );
\m_payload_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(0),
      Q => \^q\(0),
      R => '0'
    );
\m_payload_i_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(10),
      Q => \^q\(10),
      R => '0'
    );
\m_payload_i_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(11),
      Q => \^q\(11),
      R => '0'
    );
\m_payload_i_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(12),
      Q => \^q\(12),
      R => '0'
    );
\m_payload_i_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(13),
      Q => \^q\(13),
      R => '0'
    );
\m_payload_i_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(14),
      Q => \^q\(14),
      R => '0'
    );
\m_payload_i_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(15),
      Q => \^q\(15),
      R => '0'
    );
\m_payload_i_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(16),
      Q => \^q\(16),
      R => '0'
    );
\m_payload_i_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(17),
      Q => \^q\(17),
      R => '0'
    );
\m_payload_i_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(18),
      Q => \^q\(18),
      R => '0'
    );
\m_payload_i_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(19),
      Q => \^q\(19),
      R => '0'
    );
\m_payload_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(1),
      Q => \^q\(1),
      R => '0'
    );
\m_payload_i_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(20),
      Q => \^q\(20),
      R => '0'
    );
\m_payload_i_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(21),
      Q => \^q\(21),
      R => '0'
    );
\m_payload_i_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(22),
      Q => \^q\(22),
      R => '0'
    );
\m_payload_i_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(23),
      Q => \^q\(23),
      R => '0'
    );
\m_payload_i_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(24),
      Q => \^q\(24),
      R => '0'
    );
\m_payload_i_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(25),
      Q => \^q\(25),
      R => '0'
    );
\m_payload_i_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(26),
      Q => \^q\(26),
      R => '0'
    );
\m_payload_i_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(27),
      Q => \^q\(27),
      R => '0'
    );
\m_payload_i_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(28),
      Q => \^q\(28),
      R => '0'
    );
\m_payload_i_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(29),
      Q => \^q\(29),
      R => '0'
    );
\m_payload_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(2),
      Q => \^q\(2),
      R => '0'
    );
\m_payload_i_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(30),
      Q => \^q\(30),
      R => '0'
    );
\m_payload_i_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(31),
      Q => \^q\(31),
      R => '0'
    );
\m_payload_i_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(32),
      Q => \^q\(32),
      R => '0'
    );
\m_payload_i_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(33),
      Q => \^q\(33),
      R => '0'
    );
\m_payload_i_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(34),
      Q => \^q\(34),
      R => '0'
    );
\m_payload_i_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(35),
      Q => \^q\(35),
      R => '0'
    );
\m_payload_i_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(36),
      Q => \^q\(36),
      R => '0'
    );
\m_payload_i_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(38),
      Q => \m_payload_i_reg_n_0_[38]\,
      R => '0'
    );
\m_payload_i_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(39),
      Q => \^q\(37),
      R => '0'
    );
\m_payload_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(3),
      Q => \^q\(3),
      R => '0'
    );
\m_payload_i_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(44),
      Q => \^q\(38),
      R => '0'
    );
\m_payload_i_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(45),
      Q => \^q\(39),
      R => '0'
    );
\m_payload_i_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(46),
      Q => \^q\(40),
      R => '0'
    );
\m_payload_i_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(47),
      Q => \^q\(41),
      R => '0'
    );
\m_payload_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(4),
      Q => \^q\(4),
      R => '0'
    );
\m_payload_i_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(50),
      Q => \^q\(42),
      R => '0'
    );
\m_payload_i_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(51),
      Q => \^q\(43),
      R => '0'
    );
\m_payload_i_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(52),
      Q => \^q\(44),
      R => '0'
    );
\m_payload_i_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(53),
      Q => \^q\(45),
      R => '0'
    );
\m_payload_i_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(54),
      Q => \^q\(46),
      R => '0'
    );
\m_payload_i_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(55),
      Q => \^q\(47),
      R => '0'
    );
\m_payload_i_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(56),
      Q => \^q\(48),
      R => '0'
    );
\m_payload_i_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(57),
      Q => \^q\(49),
      R => '0'
    );
\m_payload_i_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(58),
      Q => \^q\(50),
      R => '0'
    );
\m_payload_i_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(59),
      Q => \^q\(51),
      R => '0'
    );
\m_payload_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(5),
      Q => \^q\(5),
      R => '0'
    );
\m_payload_i_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(60),
      Q => \^q\(52),
      R => '0'
    );
\m_payload_i_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(61),
      Q => \^q\(53),
      R => '0'
    );
\m_payload_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(6),
      Q => \^q\(6),
      R => '0'
    );
\m_payload_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(7),
      Q => \^q\(7),
      R => '0'
    );
\m_payload_i_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(8),
      Q => \^q\(8),
      R => '0'
    );
\m_payload_i_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(9),
      Q => \^q\(9),
      R => '0'
    );
\m_valid_i_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F4FF"
    )
        port map (
      I0 => b_push,
      I1 => \^m_valid_i_reg_0\,
      I2 => s_axi_awvalid,
      I3 => \^s_ready_i_reg_0\,
      O => m_valid_i0
    );
m_valid_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => m_valid_i0,
      Q => \^m_valid_i_reg_0\,
      R => m_valid_i_reg_1
    );
next_pending_r_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => \^q\(39),
      I1 => \^q\(38),
      I2 => \^q\(40),
      I3 => \^q\(41),
      I4 => next_pending_r_reg,
      O => \m_payload_i_reg[45]_0\
    );
s_ready_i_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFBB"
    )
        port map (
      I0 => b_push,
      I1 => \^m_valid_i_reg_0\,
      I2 => s_axi_awvalid,
      I3 => \^s_ready_i_reg_0\,
      O => s_ready_i0
    );
s_ready_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => s_ready_i0,
      Q => \^s_ready_i_reg_0\,
      R => s_ready_i_reg_1
    );
\skid_buffer_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(0),
      Q => \skid_buffer_reg_n_0_[0]\,
      R => '0'
    );
\skid_buffer_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(10),
      Q => \skid_buffer_reg_n_0_[10]\,
      R => '0'
    );
\skid_buffer_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(11),
      Q => \skid_buffer_reg_n_0_[11]\,
      R => '0'
    );
\skid_buffer_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(12),
      Q => \skid_buffer_reg_n_0_[12]\,
      R => '0'
    );
\skid_buffer_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(13),
      Q => \skid_buffer_reg_n_0_[13]\,
      R => '0'
    );
\skid_buffer_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(14),
      Q => \skid_buffer_reg_n_0_[14]\,
      R => '0'
    );
\skid_buffer_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(15),
      Q => \skid_buffer_reg_n_0_[15]\,
      R => '0'
    );
\skid_buffer_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(16),
      Q => \skid_buffer_reg_n_0_[16]\,
      R => '0'
    );
\skid_buffer_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(17),
      Q => \skid_buffer_reg_n_0_[17]\,
      R => '0'
    );
\skid_buffer_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(18),
      Q => \skid_buffer_reg_n_0_[18]\,
      R => '0'
    );
\skid_buffer_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(19),
      Q => \skid_buffer_reg_n_0_[19]\,
      R => '0'
    );
\skid_buffer_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(1),
      Q => \skid_buffer_reg_n_0_[1]\,
      R => '0'
    );
\skid_buffer_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(20),
      Q => \skid_buffer_reg_n_0_[20]\,
      R => '0'
    );
\skid_buffer_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(21),
      Q => \skid_buffer_reg_n_0_[21]\,
      R => '0'
    );
\skid_buffer_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(22),
      Q => \skid_buffer_reg_n_0_[22]\,
      R => '0'
    );
\skid_buffer_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(23),
      Q => \skid_buffer_reg_n_0_[23]\,
      R => '0'
    );
\skid_buffer_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(24),
      Q => \skid_buffer_reg_n_0_[24]\,
      R => '0'
    );
\skid_buffer_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(25),
      Q => \skid_buffer_reg_n_0_[25]\,
      R => '0'
    );
\skid_buffer_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(26),
      Q => \skid_buffer_reg_n_0_[26]\,
      R => '0'
    );
\skid_buffer_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(27),
      Q => \skid_buffer_reg_n_0_[27]\,
      R => '0'
    );
\skid_buffer_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(28),
      Q => \skid_buffer_reg_n_0_[28]\,
      R => '0'
    );
\skid_buffer_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(29),
      Q => \skid_buffer_reg_n_0_[29]\,
      R => '0'
    );
\skid_buffer_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(2),
      Q => \skid_buffer_reg_n_0_[2]\,
      R => '0'
    );
\skid_buffer_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(30),
      Q => \skid_buffer_reg_n_0_[30]\,
      R => '0'
    );
\skid_buffer_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(31),
      Q => \skid_buffer_reg_n_0_[31]\,
      R => '0'
    );
\skid_buffer_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awprot(0),
      Q => \skid_buffer_reg_n_0_[32]\,
      R => '0'
    );
\skid_buffer_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awprot(1),
      Q => \skid_buffer_reg_n_0_[33]\,
      R => '0'
    );
\skid_buffer_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awprot(2),
      Q => \skid_buffer_reg_n_0_[34]\,
      R => '0'
    );
\skid_buffer_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awsize(0),
      Q => \skid_buffer_reg_n_0_[35]\,
      R => '0'
    );
\skid_buffer_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awsize(1),
      Q => \skid_buffer_reg_n_0_[36]\,
      R => '0'
    );
\skid_buffer_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awburst(0),
      Q => \skid_buffer_reg_n_0_[38]\,
      R => '0'
    );
\skid_buffer_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awburst(1),
      Q => \skid_buffer_reg_n_0_[39]\,
      R => '0'
    );
\skid_buffer_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(3),
      Q => \skid_buffer_reg_n_0_[3]\,
      R => '0'
    );
\skid_buffer_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awlen(0),
      Q => \skid_buffer_reg_n_0_[44]\,
      R => '0'
    );
\skid_buffer_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awlen(1),
      Q => \skid_buffer_reg_n_0_[45]\,
      R => '0'
    );
\skid_buffer_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awlen(2),
      Q => \skid_buffer_reg_n_0_[46]\,
      R => '0'
    );
\skid_buffer_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awlen(3),
      Q => \skid_buffer_reg_n_0_[47]\,
      R => '0'
    );
\skid_buffer_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(4),
      Q => \skid_buffer_reg_n_0_[4]\,
      R => '0'
    );
\skid_buffer_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awid(0),
      Q => \skid_buffer_reg_n_0_[50]\,
      R => '0'
    );
\skid_buffer_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awid(1),
      Q => \skid_buffer_reg_n_0_[51]\,
      R => '0'
    );
\skid_buffer_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awid(2),
      Q => \skid_buffer_reg_n_0_[52]\,
      R => '0'
    );
\skid_buffer_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awid(3),
      Q => \skid_buffer_reg_n_0_[53]\,
      R => '0'
    );
\skid_buffer_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awid(4),
      Q => \skid_buffer_reg_n_0_[54]\,
      R => '0'
    );
\skid_buffer_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awid(5),
      Q => \skid_buffer_reg_n_0_[55]\,
      R => '0'
    );
\skid_buffer_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awid(6),
      Q => \skid_buffer_reg_n_0_[56]\,
      R => '0'
    );
\skid_buffer_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awid(7),
      Q => \skid_buffer_reg_n_0_[57]\,
      R => '0'
    );
\skid_buffer_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awid(8),
      Q => \skid_buffer_reg_n_0_[58]\,
      R => '0'
    );
\skid_buffer_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awid(9),
      Q => \skid_buffer_reg_n_0_[59]\,
      R => '0'
    );
\skid_buffer_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(5),
      Q => \skid_buffer_reg_n_0_[5]\,
      R => '0'
    );
\skid_buffer_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awid(10),
      Q => \skid_buffer_reg_n_0_[60]\,
      R => '0'
    );
\skid_buffer_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awid(11),
      Q => \skid_buffer_reg_n_0_[61]\,
      R => '0'
    );
\skid_buffer_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(6),
      Q => \skid_buffer_reg_n_0_[6]\,
      R => '0'
    );
\skid_buffer_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(7),
      Q => \skid_buffer_reg_n_0_[7]\,
      R => '0'
    );
\skid_buffer_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(8),
      Q => \skid_buffer_reg_n_0_[8]\,
      R => '0'
    );
\skid_buffer_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => s_axi_awaddr(9),
      Q => \skid_buffer_reg_n_0_[9]\,
      R => '0'
    );
\wrap_boundary_axaddr_r[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(36),
      I2 => \^q\(35),
      I3 => \^q\(38),
      O => \m_payload_i_reg[6]_1\(0)
    );
\wrap_boundary_axaddr_r[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDCF0000"
    )
        port map (
      I0 => \^q\(38),
      I1 => \^q\(36),
      I2 => \^q\(39),
      I3 => \^q\(35),
      I4 => \^q\(1),
      O => \m_payload_i_reg[6]_1\(1)
    );
\wrap_boundary_axaddr_r[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A200A20AA2A0A2AA"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(39),
      I2 => \^q\(36),
      I3 => \^q\(35),
      I4 => \^q\(40),
      I5 => \^q\(38),
      O => \m_payload_i_reg[6]_1\(2)
    );
\wrap_boundary_axaddr_r[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0040004C"
    )
        port map (
      I0 => \^q\(39),
      I1 => \^q\(3),
      I2 => \^q\(36),
      I3 => \^q\(35),
      I4 => \^q\(41),
      I5 => \wrap_boundary_axaddr_r[3]_i_2__0_n_0\,
      O => \m_payload_i_reg[6]_1\(3)
    );
\wrap_boundary_axaddr_r[3]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30500000"
    )
        port map (
      I0 => \^q\(40),
      I1 => \^q\(38),
      I2 => \^q\(35),
      I3 => \^q\(36),
      I4 => \^q\(3),
      O => \wrap_boundary_axaddr_r[3]_i_2__0_n_0\
    );
\wrap_boundary_axaddr_r[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000A22AAAA0A22AA"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(40),
      I2 => \^q\(41),
      I3 => \^q\(36),
      I4 => \^q\(35),
      I5 => \^q\(39),
      O => \m_payload_i_reg[6]_1\(4)
    );
\wrap_boundary_axaddr_r[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44CC0CCC"
    )
        port map (
      I0 => \^q\(40),
      I1 => \^q\(5),
      I2 => \^q\(41),
      I3 => \^q\(36),
      I4 => \^q\(35),
      O => \m_payload_i_reg[6]_1\(5)
    );
\wrap_boundary_axaddr_r[6]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2AAA"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(36),
      I2 => \^q\(35),
      I3 => \^q\(41),
      O => \m_payload_i_reg[6]_1\(6)
    );
\wrap_second_len_r[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \axaddr_offset_r_reg[2]\(0),
      I1 => \axaddr_offset_r_reg[2]\(1),
      I2 => \^m_valid_i_reg_0\,
      I3 => \^q\(41),
      I4 => \^m_payload_i_reg[6]_0\,
      O => \FSM_sequential_state_reg[0]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized1\ is
  port (
    m_valid_i_reg_0 : out STD_LOGIC;
    s_ready_i_reg_0 : out STD_LOGIC;
    shandshake : out STD_LOGIC;
    \m_payload_i_reg[13]_0\ : out STD_LOGIC_VECTOR ( 13 downto 0 );
    m_valid_i_reg_1 : in STD_LOGIC;
    aclk : in STD_LOGIC;
    s_ready_i_reg_1 : in STD_LOGIC;
    si_rs_bvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \skid_buffer_reg[1]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized1\ : entity is "axi_register_slice_v2_1_22_axic_register_slice";
end \dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized1\;

architecture STRUCTURE of \dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized1\ is
  signal \m_payload_i[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[10]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[11]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[12]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[13]_i_2_n_0\ : STD_LOGIC;
  signal \m_payload_i[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[5]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[6]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[9]_i_1__1_n_0\ : STD_LOGIC;
  signal m_valid_i0 : STD_LOGIC;
  signal \^m_valid_i_reg_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal s_ready_i0 : STD_LOGIC;
  signal \^s_ready_i_reg_0\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[0]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[10]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[11]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[12]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[13]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[1]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[2]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[3]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[4]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[5]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[6]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[7]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[8]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[9]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \m_payload_i[0]_i_1__1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \m_payload_i[10]_i_1__1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \m_payload_i[11]_i_1__1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \m_payload_i[12]_i_1__1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \m_payload_i[13]_i_2\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \m_payload_i[1]_i_1__1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \m_payload_i[2]_i_1__1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \m_payload_i[3]_i_1__1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \m_payload_i[4]_i_1__1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \m_payload_i[5]_i_1__1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \m_payload_i[6]_i_1__1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \m_payload_i[7]_i_1__1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \m_payload_i[8]_i_1__1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \m_payload_i[9]_i_1__1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \s_ready_i_i_1__0\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of shandshake_r_i_1 : label is "soft_lutpair75";
begin
  m_valid_i_reg_0 <= \^m_valid_i_reg_0\;
  s_ready_i_reg_0 <= \^s_ready_i_reg_0\;
\m_payload_i[0]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[1]_0\(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[0]\,
      O => \m_payload_i[0]_i_1__1_n_0\
    );
\m_payload_i[10]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \out\(8),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[10]\,
      O => \m_payload_i[10]_i_1__1_n_0\
    );
\m_payload_i[11]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \out\(9),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[11]\,
      O => \m_payload_i[11]_i_1__1_n_0\
    );
\m_payload_i[12]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \out\(10),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[12]\,
      O => \m_payload_i[12]_i_1__1_n_0\
    );
\m_payload_i[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => s_axi_bready,
      I1 => \^m_valid_i_reg_0\,
      O => p_1_in
    );
\m_payload_i[13]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \out\(11),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[13]\,
      O => \m_payload_i[13]_i_2_n_0\
    );
\m_payload_i[1]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[1]_0\(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[1]\,
      O => \m_payload_i[1]_i_1__1_n_0\
    );
\m_payload_i[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \out\(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[2]\,
      O => \m_payload_i[2]_i_1__1_n_0\
    );
\m_payload_i[3]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \out\(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[3]\,
      O => \m_payload_i[3]_i_1__1_n_0\
    );
\m_payload_i[4]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \out\(2),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[4]\,
      O => \m_payload_i[4]_i_1__1_n_0\
    );
\m_payload_i[5]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \out\(3),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[5]\,
      O => \m_payload_i[5]_i_1__1_n_0\
    );
\m_payload_i[6]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \out\(4),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[6]\,
      O => \m_payload_i[6]_i_1__1_n_0\
    );
\m_payload_i[7]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \out\(5),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[7]\,
      O => \m_payload_i[7]_i_1__1_n_0\
    );
\m_payload_i[8]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \out\(6),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[8]\,
      O => \m_payload_i[8]_i_1__1_n_0\
    );
\m_payload_i[9]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \out\(7),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[9]\,
      O => \m_payload_i[9]_i_1__1_n_0\
    );
\m_payload_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[0]_i_1__1_n_0\,
      Q => \m_payload_i_reg[13]_0\(0),
      R => '0'
    );
\m_payload_i_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[10]_i_1__1_n_0\,
      Q => \m_payload_i_reg[13]_0\(10),
      R => '0'
    );
\m_payload_i_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[11]_i_1__1_n_0\,
      Q => \m_payload_i_reg[13]_0\(11),
      R => '0'
    );
\m_payload_i_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[12]_i_1__1_n_0\,
      Q => \m_payload_i_reg[13]_0\(12),
      R => '0'
    );
\m_payload_i_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[13]_i_2_n_0\,
      Q => \m_payload_i_reg[13]_0\(13),
      R => '0'
    );
\m_payload_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[1]_i_1__1_n_0\,
      Q => \m_payload_i_reg[13]_0\(1),
      R => '0'
    );
\m_payload_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[2]_i_1__1_n_0\,
      Q => \m_payload_i_reg[13]_0\(2),
      R => '0'
    );
\m_payload_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[3]_i_1__1_n_0\,
      Q => \m_payload_i_reg[13]_0\(3),
      R => '0'
    );
\m_payload_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[4]_i_1__1_n_0\,
      Q => \m_payload_i_reg[13]_0\(4),
      R => '0'
    );
\m_payload_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[5]_i_1__1_n_0\,
      Q => \m_payload_i_reg[13]_0\(5),
      R => '0'
    );
\m_payload_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[6]_i_1__1_n_0\,
      Q => \m_payload_i_reg[13]_0\(6),
      R => '0'
    );
\m_payload_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[7]_i_1__1_n_0\,
      Q => \m_payload_i_reg[13]_0\(7),
      R => '0'
    );
\m_payload_i_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[8]_i_1__1_n_0\,
      Q => \m_payload_i_reg[13]_0\(8),
      R => '0'
    );
\m_payload_i_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[9]_i_1__1_n_0\,
      Q => \m_payload_i_reg[13]_0\(9),
      R => '0'
    );
\m_valid_i_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F4FF"
    )
        port map (
      I0 => s_axi_bready,
      I1 => \^m_valid_i_reg_0\,
      I2 => si_rs_bvalid,
      I3 => \^s_ready_i_reg_0\,
      O => m_valid_i0
    );
m_valid_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => m_valid_i0,
      Q => \^m_valid_i_reg_0\,
      R => m_valid_i_reg_1
    );
\s_ready_i_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F4FF"
    )
        port map (
      I0 => si_rs_bvalid,
      I1 => \^s_ready_i_reg_0\,
      I2 => s_axi_bready,
      I3 => \^m_valid_i_reg_0\,
      O => s_ready_i0
    );
s_ready_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => s_ready_i0,
      Q => \^s_ready_i_reg_0\,
      R => s_ready_i_reg_1
    );
shandshake_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^s_ready_i_reg_0\,
      I1 => si_rs_bvalid,
      O => shandshake
    );
\skid_buffer_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[1]_0\(0),
      Q => \skid_buffer_reg_n_0_[0]\,
      R => '0'
    );
\skid_buffer_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \out\(8),
      Q => \skid_buffer_reg_n_0_[10]\,
      R => '0'
    );
\skid_buffer_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \out\(9),
      Q => \skid_buffer_reg_n_0_[11]\,
      R => '0'
    );
\skid_buffer_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \out\(10),
      Q => \skid_buffer_reg_n_0_[12]\,
      R => '0'
    );
\skid_buffer_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \out\(11),
      Q => \skid_buffer_reg_n_0_[13]\,
      R => '0'
    );
\skid_buffer_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[1]_0\(1),
      Q => \skid_buffer_reg_n_0_[1]\,
      R => '0'
    );
\skid_buffer_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \out\(0),
      Q => \skid_buffer_reg_n_0_[2]\,
      R => '0'
    );
\skid_buffer_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \out\(1),
      Q => \skid_buffer_reg_n_0_[3]\,
      R => '0'
    );
\skid_buffer_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \out\(2),
      Q => \skid_buffer_reg_n_0_[4]\,
      R => '0'
    );
\skid_buffer_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \out\(3),
      Q => \skid_buffer_reg_n_0_[5]\,
      R => '0'
    );
\skid_buffer_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \out\(4),
      Q => \skid_buffer_reg_n_0_[6]\,
      R => '0'
    );
\skid_buffer_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \out\(5),
      Q => \skid_buffer_reg_n_0_[7]\,
      R => '0'
    );
\skid_buffer_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \out\(6),
      Q => \skid_buffer_reg_n_0_[8]\,
      R => '0'
    );
\skid_buffer_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \out\(7),
      Q => \skid_buffer_reg_n_0_[9]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized2\ is
  port (
    m_valid_i_reg_0 : out STD_LOGIC;
    \aresetn_d_reg[1]_inv_0\ : out STD_LOGIC;
    s_ready_i_reg_0 : out STD_LOGIC;
    s_ready_i_reg_1 : out STD_LOGIC;
    \m_payload_i_reg[46]_0\ : out STD_LOGIC_VECTOR ( 46 downto 0 );
    aclk : in STD_LOGIC;
    s_ready_i_reg_2 : in STD_LOGIC;
    \aresetn_d_reg[1]_inv_1\ : in STD_LOGIC;
    m_valid_i_reg_1 : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    \skid_buffer_reg[46]_0\ : in STD_LOGIC_VECTOR ( 12 downto 0 );
    \skid_buffer_reg[33]_0\ : in STD_LOGIC_VECTOR ( 33 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized2\ : entity is "axi_register_slice_v2_1_22_axic_register_slice";
end \dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized2\;

architecture STRUCTURE of \dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized2\ is
  signal \^aresetn_d_reg[1]_inv_0\ : STD_LOGIC;
  signal \m_payload_i[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_payload_i[10]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_payload_i[11]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_payload_i[12]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_payload_i[13]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_payload_i[14]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[15]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[16]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[17]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[18]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[19]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[1]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_payload_i[20]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[21]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[22]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[23]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[24]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[25]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[26]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[27]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[28]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[29]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[2]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_payload_i[30]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[31]_i_1__0_n_0\ : STD_LOGIC;
  signal \m_payload_i[32]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[33]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[34]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[35]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[36]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[37]_i_1_n_0\ : STD_LOGIC;
  signal \m_payload_i[38]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[39]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[3]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_payload_i[40]_i_1_n_0\ : STD_LOGIC;
  signal \m_payload_i[41]_i_1_n_0\ : STD_LOGIC;
  signal \m_payload_i[42]_i_1_n_0\ : STD_LOGIC;
  signal \m_payload_i[43]_i_1_n_0\ : STD_LOGIC;
  signal \m_payload_i[44]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[45]_i_1__1_n_0\ : STD_LOGIC;
  signal \m_payload_i[46]_i_2_n_0\ : STD_LOGIC;
  signal \m_payload_i[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_payload_i[5]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_payload_i[6]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_payload_i[7]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_payload_i[8]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_payload_i[9]_i_1__2_n_0\ : STD_LOGIC;
  signal \m_valid_i_i_1__1_n_0\ : STD_LOGIC;
  signal \^m_valid_i_reg_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal \s_ready_i_i_1__2_n_0\ : STD_LOGIC;
  signal \^s_ready_i_reg_0\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[0]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[10]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[11]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[12]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[13]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[14]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[15]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[16]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[17]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[18]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[19]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[1]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[20]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[21]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[22]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[23]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[24]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[25]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[26]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[27]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[28]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[29]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[2]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[30]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[31]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[32]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[33]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[34]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[35]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[36]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[37]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[38]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[39]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[3]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[40]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[41]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[42]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[43]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[44]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[45]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[46]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[4]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[5]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[6]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[7]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[8]\ : STD_LOGIC;
  signal \skid_buffer_reg_n_0_[9]\ : STD_LOGIC;
  attribute inverted : string;
  attribute inverted of \aresetn_d_reg[1]_inv\ : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_read[4]_i_3__0\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \m_payload_i[10]_i_1__2\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \m_payload_i[11]_i_1__2\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \m_payload_i[12]_i_1__2\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \m_payload_i[13]_i_1__2\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \m_payload_i[14]_i_1__1\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \m_payload_i[15]_i_1__1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \m_payload_i[16]_i_1__1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \m_payload_i[17]_i_1__1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \m_payload_i[18]_i_1__1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \m_payload_i[19]_i_1__1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \m_payload_i[1]_i_1__2\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \m_payload_i[20]_i_1__1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \m_payload_i[21]_i_1__1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \m_payload_i[22]_i_1__1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \m_payload_i[23]_i_1__1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \m_payload_i[24]_i_1__1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \m_payload_i[25]_i_1__1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \m_payload_i[26]_i_1__1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \m_payload_i[27]_i_1__1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \m_payload_i[28]_i_1__1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \m_payload_i[29]_i_1__1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \m_payload_i[2]_i_1__2\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \m_payload_i[30]_i_1__1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \m_payload_i[31]_i_1__0\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \m_payload_i[32]_i_1__1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \m_payload_i[33]_i_1__1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \m_payload_i[34]_i_1__1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \m_payload_i[35]_i_1__1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \m_payload_i[36]_i_1__1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \m_payload_i[37]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \m_payload_i[38]_i_1__1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \m_payload_i[39]_i_1__1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \m_payload_i[3]_i_1__2\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \m_payload_i[40]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \m_payload_i[41]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \m_payload_i[42]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \m_payload_i[43]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \m_payload_i[44]_i_1__1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \m_payload_i[45]_i_1__1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \m_payload_i[46]_i_2\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \m_payload_i[4]_i_1__2\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \m_payload_i[5]_i_1__2\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \m_payload_i[6]_i_1__2\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \m_payload_i[7]_i_1__2\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \m_payload_i[8]_i_1__2\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \m_payload_i[9]_i_1__2\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \s_ready_i_i_1__2\ : label is "soft_lutpair83";
begin
  \aresetn_d_reg[1]_inv_0\ <= \^aresetn_d_reg[1]_inv_0\;
  m_valid_i_reg_0 <= \^m_valid_i_reg_0\;
  s_ready_i_reg_0 <= \^s_ready_i_reg_0\;
\aresetn_d_reg[1]_inv\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \aresetn_d_reg[1]_inv_1\,
      Q => \^aresetn_d_reg[1]_inv_0\,
      R => '0'
    );
\cnt_read[4]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^s_ready_i_reg_0\,
      I1 => m_valid_i_reg_1,
      O => s_ready_i_reg_1
    );
\m_payload_i[0]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[0]\,
      O => \m_payload_i[0]_i_1__2_n_0\
    );
\m_payload_i[10]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(10),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[10]\,
      O => \m_payload_i[10]_i_1__2_n_0\
    );
\m_payload_i[11]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(11),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[11]\,
      O => \m_payload_i[11]_i_1__2_n_0\
    );
\m_payload_i[12]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(12),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[12]\,
      O => \m_payload_i[12]_i_1__2_n_0\
    );
\m_payload_i[13]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(13),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[13]\,
      O => \m_payload_i[13]_i_1__2_n_0\
    );
\m_payload_i[14]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(14),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[14]\,
      O => \m_payload_i[14]_i_1__1_n_0\
    );
\m_payload_i[15]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(15),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[15]\,
      O => \m_payload_i[15]_i_1__1_n_0\
    );
\m_payload_i[16]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(16),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[16]\,
      O => \m_payload_i[16]_i_1__1_n_0\
    );
\m_payload_i[17]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(17),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[17]\,
      O => \m_payload_i[17]_i_1__1_n_0\
    );
\m_payload_i[18]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(18),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[18]\,
      O => \m_payload_i[18]_i_1__1_n_0\
    );
\m_payload_i[19]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(19),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[19]\,
      O => \m_payload_i[19]_i_1__1_n_0\
    );
\m_payload_i[1]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[1]\,
      O => \m_payload_i[1]_i_1__2_n_0\
    );
\m_payload_i[20]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(20),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[20]\,
      O => \m_payload_i[20]_i_1__1_n_0\
    );
\m_payload_i[21]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(21),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[21]\,
      O => \m_payload_i[21]_i_1__1_n_0\
    );
\m_payload_i[22]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(22),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[22]\,
      O => \m_payload_i[22]_i_1__1_n_0\
    );
\m_payload_i[23]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(23),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[23]\,
      O => \m_payload_i[23]_i_1__1_n_0\
    );
\m_payload_i[24]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(24),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[24]\,
      O => \m_payload_i[24]_i_1__1_n_0\
    );
\m_payload_i[25]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(25),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[25]\,
      O => \m_payload_i[25]_i_1__1_n_0\
    );
\m_payload_i[26]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(26),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[26]\,
      O => \m_payload_i[26]_i_1__1_n_0\
    );
\m_payload_i[27]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(27),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[27]\,
      O => \m_payload_i[27]_i_1__1_n_0\
    );
\m_payload_i[28]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(28),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[28]\,
      O => \m_payload_i[28]_i_1__1_n_0\
    );
\m_payload_i[29]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(29),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[29]\,
      O => \m_payload_i[29]_i_1__1_n_0\
    );
\m_payload_i[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(2),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[2]\,
      O => \m_payload_i[2]_i_1__2_n_0\
    );
\m_payload_i[30]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(30),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[30]\,
      O => \m_payload_i[30]_i_1__1_n_0\
    );
\m_payload_i[31]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(31),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[31]\,
      O => \m_payload_i[31]_i_1__0_n_0\
    );
\m_payload_i[32]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(32),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[32]\,
      O => \m_payload_i[32]_i_1__1_n_0\
    );
\m_payload_i[33]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(33),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[33]\,
      O => \m_payload_i[33]_i_1__1_n_0\
    );
\m_payload_i[34]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[46]_0\(0),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[34]\,
      O => \m_payload_i[34]_i_1__1_n_0\
    );
\m_payload_i[35]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[46]_0\(1),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[35]\,
      O => \m_payload_i[35]_i_1__1_n_0\
    );
\m_payload_i[36]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[46]_0\(2),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[36]\,
      O => \m_payload_i[36]_i_1__1_n_0\
    );
\m_payload_i[37]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[46]_0\(3),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[37]\,
      O => \m_payload_i[37]_i_1_n_0\
    );
\m_payload_i[38]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[46]_0\(4),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[38]\,
      O => \m_payload_i[38]_i_1__1_n_0\
    );
\m_payload_i[39]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[46]_0\(5),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[39]\,
      O => \m_payload_i[39]_i_1__1_n_0\
    );
\m_payload_i[3]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(3),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[3]\,
      O => \m_payload_i[3]_i_1__2_n_0\
    );
\m_payload_i[40]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[46]_0\(6),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[40]\,
      O => \m_payload_i[40]_i_1_n_0\
    );
\m_payload_i[41]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[46]_0\(7),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[41]\,
      O => \m_payload_i[41]_i_1_n_0\
    );
\m_payload_i[42]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[46]_0\(8),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[42]\,
      O => \m_payload_i[42]_i_1_n_0\
    );
\m_payload_i[43]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[46]_0\(9),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[43]\,
      O => \m_payload_i[43]_i_1_n_0\
    );
\m_payload_i[44]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[46]_0\(10),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[44]\,
      O => \m_payload_i[44]_i_1__1_n_0\
    );
\m_payload_i[45]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[46]_0\(11),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[45]\,
      O => \m_payload_i[45]_i_1__1_n_0\
    );
\m_payload_i[46]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => s_axi_rready,
      I1 => \^m_valid_i_reg_0\,
      O => p_1_in
    );
\m_payload_i[46]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[46]_0\(12),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[46]\,
      O => \m_payload_i[46]_i_2_n_0\
    );
\m_payload_i[4]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(4),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[4]\,
      O => \m_payload_i[4]_i_1__2_n_0\
    );
\m_payload_i[5]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(5),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[5]\,
      O => \m_payload_i[5]_i_1__2_n_0\
    );
\m_payload_i[6]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(6),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[6]\,
      O => \m_payload_i[6]_i_1__2_n_0\
    );
\m_payload_i[7]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(7),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[7]\,
      O => \m_payload_i[7]_i_1__2_n_0\
    );
\m_payload_i[8]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(8),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[8]\,
      O => \m_payload_i[8]_i_1__2_n_0\
    );
\m_payload_i[9]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \skid_buffer_reg[33]_0\(9),
      I1 => \^s_ready_i_reg_0\,
      I2 => \skid_buffer_reg_n_0_[9]\,
      O => \m_payload_i[9]_i_1__2_n_0\
    );
\m_payload_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[0]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(0),
      R => '0'
    );
\m_payload_i_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[10]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(10),
      R => '0'
    );
\m_payload_i_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[11]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(11),
      R => '0'
    );
\m_payload_i_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[12]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(12),
      R => '0'
    );
\m_payload_i_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[13]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(13),
      R => '0'
    );
\m_payload_i_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[14]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(14),
      R => '0'
    );
\m_payload_i_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[15]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(15),
      R => '0'
    );
\m_payload_i_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[16]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(16),
      R => '0'
    );
\m_payload_i_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[17]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(17),
      R => '0'
    );
\m_payload_i_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[18]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(18),
      R => '0'
    );
\m_payload_i_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[19]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(19),
      R => '0'
    );
\m_payload_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[1]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(1),
      R => '0'
    );
\m_payload_i_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[20]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(20),
      R => '0'
    );
\m_payload_i_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[21]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(21),
      R => '0'
    );
\m_payload_i_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[22]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(22),
      R => '0'
    );
\m_payload_i_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[23]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(23),
      R => '0'
    );
\m_payload_i_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[24]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(24),
      R => '0'
    );
\m_payload_i_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[25]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(25),
      R => '0'
    );
\m_payload_i_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[26]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(26),
      R => '0'
    );
\m_payload_i_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[27]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(27),
      R => '0'
    );
\m_payload_i_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[28]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(28),
      R => '0'
    );
\m_payload_i_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[29]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(29),
      R => '0'
    );
\m_payload_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[2]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(2),
      R => '0'
    );
\m_payload_i_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[30]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(30),
      R => '0'
    );
\m_payload_i_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[31]_i_1__0_n_0\,
      Q => \m_payload_i_reg[46]_0\(31),
      R => '0'
    );
\m_payload_i_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[32]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(32),
      R => '0'
    );
\m_payload_i_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[33]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(33),
      R => '0'
    );
\m_payload_i_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[34]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(34),
      R => '0'
    );
\m_payload_i_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[35]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(35),
      R => '0'
    );
\m_payload_i_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[36]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(36),
      R => '0'
    );
\m_payload_i_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[37]_i_1_n_0\,
      Q => \m_payload_i_reg[46]_0\(37),
      R => '0'
    );
\m_payload_i_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[38]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(38),
      R => '0'
    );
\m_payload_i_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[39]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(39),
      R => '0'
    );
\m_payload_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[3]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(3),
      R => '0'
    );
\m_payload_i_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[40]_i_1_n_0\,
      Q => \m_payload_i_reg[46]_0\(40),
      R => '0'
    );
\m_payload_i_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[41]_i_1_n_0\,
      Q => \m_payload_i_reg[46]_0\(41),
      R => '0'
    );
\m_payload_i_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[42]_i_1_n_0\,
      Q => \m_payload_i_reg[46]_0\(42),
      R => '0'
    );
\m_payload_i_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[43]_i_1_n_0\,
      Q => \m_payload_i_reg[46]_0\(43),
      R => '0'
    );
\m_payload_i_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[44]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(44),
      R => '0'
    );
\m_payload_i_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[45]_i_1__1_n_0\,
      Q => \m_payload_i_reg[46]_0\(45),
      R => '0'
    );
\m_payload_i_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[46]_i_2_n_0\,
      Q => \m_payload_i_reg[46]_0\(46),
      R => '0'
    );
\m_payload_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[4]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(4),
      R => '0'
    );
\m_payload_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[5]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(5),
      R => '0'
    );
\m_payload_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[6]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(6),
      R => '0'
    );
\m_payload_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[7]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(7),
      R => '0'
    );
\m_payload_i_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[8]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(8),
      R => '0'
    );
\m_payload_i_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in,
      D => \m_payload_i[9]_i_1__2_n_0\,
      Q => \m_payload_i_reg[46]_0\(9),
      R => '0'
    );
\m_valid_i_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4FFF"
    )
        port map (
      I0 => s_axi_rready,
      I1 => \^m_valid_i_reg_0\,
      I2 => m_valid_i_reg_1,
      I3 => \^s_ready_i_reg_0\,
      O => \m_valid_i_i_1__1_n_0\
    );
m_valid_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \m_valid_i_i_1__1_n_0\,
      Q => \^m_valid_i_reg_0\,
      R => \^aresetn_d_reg[1]_inv_0\
    );
\s_ready_i_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F8FF"
    )
        port map (
      I0 => m_valid_i_reg_1,
      I1 => \^s_ready_i_reg_0\,
      I2 => s_axi_rready,
      I3 => \^m_valid_i_reg_0\,
      O => \s_ready_i_i_1__2_n_0\
    );
s_ready_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \s_ready_i_i_1__2_n_0\,
      Q => \^s_ready_i_reg_0\,
      R => s_ready_i_reg_2
    );
\skid_buffer_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(0),
      Q => \skid_buffer_reg_n_0_[0]\,
      R => '0'
    );
\skid_buffer_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(10),
      Q => \skid_buffer_reg_n_0_[10]\,
      R => '0'
    );
\skid_buffer_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(11),
      Q => \skid_buffer_reg_n_0_[11]\,
      R => '0'
    );
\skid_buffer_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(12),
      Q => \skid_buffer_reg_n_0_[12]\,
      R => '0'
    );
\skid_buffer_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(13),
      Q => \skid_buffer_reg_n_0_[13]\,
      R => '0'
    );
\skid_buffer_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(14),
      Q => \skid_buffer_reg_n_0_[14]\,
      R => '0'
    );
\skid_buffer_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(15),
      Q => \skid_buffer_reg_n_0_[15]\,
      R => '0'
    );
\skid_buffer_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(16),
      Q => \skid_buffer_reg_n_0_[16]\,
      R => '0'
    );
\skid_buffer_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(17),
      Q => \skid_buffer_reg_n_0_[17]\,
      R => '0'
    );
\skid_buffer_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(18),
      Q => \skid_buffer_reg_n_0_[18]\,
      R => '0'
    );
\skid_buffer_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(19),
      Q => \skid_buffer_reg_n_0_[19]\,
      R => '0'
    );
\skid_buffer_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(1),
      Q => \skid_buffer_reg_n_0_[1]\,
      R => '0'
    );
\skid_buffer_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(20),
      Q => \skid_buffer_reg_n_0_[20]\,
      R => '0'
    );
\skid_buffer_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(21),
      Q => \skid_buffer_reg_n_0_[21]\,
      R => '0'
    );
\skid_buffer_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(22),
      Q => \skid_buffer_reg_n_0_[22]\,
      R => '0'
    );
\skid_buffer_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(23),
      Q => \skid_buffer_reg_n_0_[23]\,
      R => '0'
    );
\skid_buffer_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(24),
      Q => \skid_buffer_reg_n_0_[24]\,
      R => '0'
    );
\skid_buffer_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(25),
      Q => \skid_buffer_reg_n_0_[25]\,
      R => '0'
    );
\skid_buffer_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(26),
      Q => \skid_buffer_reg_n_0_[26]\,
      R => '0'
    );
\skid_buffer_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(27),
      Q => \skid_buffer_reg_n_0_[27]\,
      R => '0'
    );
\skid_buffer_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(28),
      Q => \skid_buffer_reg_n_0_[28]\,
      R => '0'
    );
\skid_buffer_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(29),
      Q => \skid_buffer_reg_n_0_[29]\,
      R => '0'
    );
\skid_buffer_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(2),
      Q => \skid_buffer_reg_n_0_[2]\,
      R => '0'
    );
\skid_buffer_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(30),
      Q => \skid_buffer_reg_n_0_[30]\,
      R => '0'
    );
\skid_buffer_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(31),
      Q => \skid_buffer_reg_n_0_[31]\,
      R => '0'
    );
\skid_buffer_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(32),
      Q => \skid_buffer_reg_n_0_[32]\,
      R => '0'
    );
\skid_buffer_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(33),
      Q => \skid_buffer_reg_n_0_[33]\,
      R => '0'
    );
\skid_buffer_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[46]_0\(0),
      Q => \skid_buffer_reg_n_0_[34]\,
      R => '0'
    );
\skid_buffer_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[46]_0\(1),
      Q => \skid_buffer_reg_n_0_[35]\,
      R => '0'
    );
\skid_buffer_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[46]_0\(2),
      Q => \skid_buffer_reg_n_0_[36]\,
      R => '0'
    );
\skid_buffer_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[46]_0\(3),
      Q => \skid_buffer_reg_n_0_[37]\,
      R => '0'
    );
\skid_buffer_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[46]_0\(4),
      Q => \skid_buffer_reg_n_0_[38]\,
      R => '0'
    );
\skid_buffer_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[46]_0\(5),
      Q => \skid_buffer_reg_n_0_[39]\,
      R => '0'
    );
\skid_buffer_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(3),
      Q => \skid_buffer_reg_n_0_[3]\,
      R => '0'
    );
\skid_buffer_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[46]_0\(6),
      Q => \skid_buffer_reg_n_0_[40]\,
      R => '0'
    );
\skid_buffer_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[46]_0\(7),
      Q => \skid_buffer_reg_n_0_[41]\,
      R => '0'
    );
\skid_buffer_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[46]_0\(8),
      Q => \skid_buffer_reg_n_0_[42]\,
      R => '0'
    );
\skid_buffer_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[46]_0\(9),
      Q => \skid_buffer_reg_n_0_[43]\,
      R => '0'
    );
\skid_buffer_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[46]_0\(10),
      Q => \skid_buffer_reg_n_0_[44]\,
      R => '0'
    );
\skid_buffer_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[46]_0\(11),
      Q => \skid_buffer_reg_n_0_[45]\,
      R => '0'
    );
\skid_buffer_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[46]_0\(12),
      Q => \skid_buffer_reg_n_0_[46]\,
      R => '0'
    );
\skid_buffer_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(4),
      Q => \skid_buffer_reg_n_0_[4]\,
      R => '0'
    );
\skid_buffer_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(5),
      Q => \skid_buffer_reg_n_0_[5]\,
      R => '0'
    );
\skid_buffer_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(6),
      Q => \skid_buffer_reg_n_0_[6]\,
      R => '0'
    );
\skid_buffer_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(7),
      Q => \skid_buffer_reg_n_0_[7]\,
      R => '0'
    );
\skid_buffer_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(8),
      Q => \skid_buffer_reg_n_0_[8]\,
      R => '0'
    );
\skid_buffer_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^s_ready_i_reg_0\,
      D => \skid_buffer_reg[33]_0\(9),
      Q => \skid_buffer_reg_n_0_[9]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_cdc_sync is
  port (
    lpf_exr_reg : out STD_LOGIC;
    scndry_out : out STD_LOGIC;
    lpf_exr : in STD_LOGIC;
    p_1_in4_in : in STD_LOGIC;
    p_2_in3_in : in STD_LOGIC;
    exr_lpf : in STD_LOGIC_VECTOR ( 0 to 0 );
    ext_reset_in : in STD_LOGIC;
    slowest_sync_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_cdc_sync : entity is "cdc_sync";
end dwa_ps_bd_cdc_sync;

architecture STRUCTURE of dwa_ps_bd_cdc_sync is
  signal exr_d1 : STD_LOGIC;
  signal s_level_out_d1_cdc_to : STD_LOGIC;
  signal s_level_out_d2 : STD_LOGIC;
  signal s_level_out_d3 : STD_LOGIC;
  signal \^scndry_out\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to\ : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to\ : label is "FDR";
  attribute ASYNC_REG of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2\ : label is std.standard.true;
  attribute BOX_TYPE of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2\ : label is "FDR";
  attribute ASYNC_REG of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3\ : label is std.standard.true;
  attribute BOX_TYPE of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3\ : label is "FDR";
  attribute ASYNC_REG of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4\ : label is std.standard.true;
  attribute BOX_TYPE of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4\ : label is "FDR";
begin
  scndry_out <= \^scndry_out\;
\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => exr_d1,
      Q => s_level_out_d1_cdc_to,
      R => '0'
    );
\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ext_reset_in,
      O => exr_d1
    );
\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => s_level_out_d1_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => s_level_out_d3,
      Q => \^scndry_out\,
      R => '0'
    );
lpf_exr_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAAAAAA8"
    )
        port map (
      I0 => lpf_exr,
      I1 => p_1_in4_in,
      I2 => p_2_in3_in,
      I3 => \^scndry_out\,
      I4 => exr_lpf(0),
      O => lpf_exr_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_processing_system7_v5_5_processing_system7 is
  port (
    CAN0_PHY_TX : out STD_LOGIC;
    CAN0_PHY_RX : in STD_LOGIC;
    CAN1_PHY_TX : out STD_LOGIC;
    CAN1_PHY_RX : in STD_LOGIC;
    ENET0_GMII_TX_EN : out STD_LOGIC;
    ENET0_GMII_TX_ER : out STD_LOGIC;
    ENET0_MDIO_MDC : out STD_LOGIC;
    ENET0_MDIO_O : out STD_LOGIC;
    ENET0_MDIO_T : out STD_LOGIC;
    ENET0_PTP_DELAY_REQ_RX : out STD_LOGIC;
    ENET0_PTP_DELAY_REQ_TX : out STD_LOGIC;
    ENET0_PTP_PDELAY_REQ_RX : out STD_LOGIC;
    ENET0_PTP_PDELAY_REQ_TX : out STD_LOGIC;
    ENET0_PTP_PDELAY_RESP_RX : out STD_LOGIC;
    ENET0_PTP_PDELAY_RESP_TX : out STD_LOGIC;
    ENET0_PTP_SYNC_FRAME_RX : out STD_LOGIC;
    ENET0_PTP_SYNC_FRAME_TX : out STD_LOGIC;
    ENET0_SOF_RX : out STD_LOGIC;
    ENET0_SOF_TX : out STD_LOGIC;
    ENET0_GMII_TXD : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ENET0_GMII_COL : in STD_LOGIC;
    ENET0_GMII_CRS : in STD_LOGIC;
    ENET0_GMII_RX_CLK : in STD_LOGIC;
    ENET0_GMII_RX_DV : in STD_LOGIC;
    ENET0_GMII_RX_ER : in STD_LOGIC;
    ENET0_GMII_TX_CLK : in STD_LOGIC;
    ENET0_MDIO_I : in STD_LOGIC;
    ENET0_EXT_INTIN : in STD_LOGIC;
    ENET0_GMII_RXD : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ENET1_GMII_TX_EN : out STD_LOGIC;
    ENET1_GMII_TX_ER : out STD_LOGIC;
    ENET1_MDIO_MDC : out STD_LOGIC;
    ENET1_MDIO_O : out STD_LOGIC;
    ENET1_MDIO_T : out STD_LOGIC;
    ENET1_PTP_DELAY_REQ_RX : out STD_LOGIC;
    ENET1_PTP_DELAY_REQ_TX : out STD_LOGIC;
    ENET1_PTP_PDELAY_REQ_RX : out STD_LOGIC;
    ENET1_PTP_PDELAY_REQ_TX : out STD_LOGIC;
    ENET1_PTP_PDELAY_RESP_RX : out STD_LOGIC;
    ENET1_PTP_PDELAY_RESP_TX : out STD_LOGIC;
    ENET1_PTP_SYNC_FRAME_RX : out STD_LOGIC;
    ENET1_PTP_SYNC_FRAME_TX : out STD_LOGIC;
    ENET1_SOF_RX : out STD_LOGIC;
    ENET1_SOF_TX : out STD_LOGIC;
    ENET1_GMII_TXD : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ENET1_GMII_COL : in STD_LOGIC;
    ENET1_GMII_CRS : in STD_LOGIC;
    ENET1_GMII_RX_CLK : in STD_LOGIC;
    ENET1_GMII_RX_DV : in STD_LOGIC;
    ENET1_GMII_RX_ER : in STD_LOGIC;
    ENET1_GMII_TX_CLK : in STD_LOGIC;
    ENET1_MDIO_I : in STD_LOGIC;
    ENET1_EXT_INTIN : in STD_LOGIC;
    ENET1_GMII_RXD : in STD_LOGIC_VECTOR ( 7 downto 0 );
    GPIO_I : in STD_LOGIC_VECTOR ( 63 downto 0 );
    GPIO_O : out STD_LOGIC_VECTOR ( 63 downto 0 );
    GPIO_T : out STD_LOGIC_VECTOR ( 63 downto 0 );
    I2C0_SDA_I : in STD_LOGIC;
    I2C0_SDA_O : out STD_LOGIC;
    I2C0_SDA_T : out STD_LOGIC;
    I2C0_SCL_I : in STD_LOGIC;
    I2C0_SCL_O : out STD_LOGIC;
    I2C0_SCL_T : out STD_LOGIC;
    I2C1_SDA_I : in STD_LOGIC;
    I2C1_SDA_O : out STD_LOGIC;
    I2C1_SDA_T : out STD_LOGIC;
    I2C1_SCL_I : in STD_LOGIC;
    I2C1_SCL_O : out STD_LOGIC;
    I2C1_SCL_T : out STD_LOGIC;
    PJTAG_TCK : in STD_LOGIC;
    PJTAG_TMS : in STD_LOGIC;
    PJTAG_TDI : in STD_LOGIC;
    PJTAG_TDO : out STD_LOGIC;
    SDIO0_CLK : out STD_LOGIC;
    SDIO0_CLK_FB : in STD_LOGIC;
    SDIO0_CMD_O : out STD_LOGIC;
    SDIO0_CMD_I : in STD_LOGIC;
    SDIO0_CMD_T : out STD_LOGIC;
    SDIO0_DATA_I : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SDIO0_DATA_O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    SDIO0_DATA_T : out STD_LOGIC_VECTOR ( 3 downto 0 );
    SDIO0_LED : out STD_LOGIC;
    SDIO0_CDN : in STD_LOGIC;
    SDIO0_WP : in STD_LOGIC;
    SDIO0_BUSPOW : out STD_LOGIC;
    SDIO0_BUSVOLT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    SDIO1_CLK : out STD_LOGIC;
    SDIO1_CLK_FB : in STD_LOGIC;
    SDIO1_CMD_O : out STD_LOGIC;
    SDIO1_CMD_I : in STD_LOGIC;
    SDIO1_CMD_T : out STD_LOGIC;
    SDIO1_DATA_I : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SDIO1_DATA_O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    SDIO1_DATA_T : out STD_LOGIC_VECTOR ( 3 downto 0 );
    SDIO1_LED : out STD_LOGIC;
    SDIO1_CDN : in STD_LOGIC;
    SDIO1_WP : in STD_LOGIC;
    SDIO1_BUSPOW : out STD_LOGIC;
    SDIO1_BUSVOLT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    SPI0_SCLK_I : in STD_LOGIC;
    SPI0_SCLK_O : out STD_LOGIC;
    SPI0_SCLK_T : out STD_LOGIC;
    SPI0_MOSI_I : in STD_LOGIC;
    SPI0_MOSI_O : out STD_LOGIC;
    SPI0_MOSI_T : out STD_LOGIC;
    SPI0_MISO_I : in STD_LOGIC;
    SPI0_MISO_O : out STD_LOGIC;
    SPI0_MISO_T : out STD_LOGIC;
    SPI0_SS_I : in STD_LOGIC;
    SPI0_SS_O : out STD_LOGIC;
    SPI0_SS1_O : out STD_LOGIC;
    SPI0_SS2_O : out STD_LOGIC;
    SPI0_SS_T : out STD_LOGIC;
    SPI1_SCLK_I : in STD_LOGIC;
    SPI1_SCLK_O : out STD_LOGIC;
    SPI1_SCLK_T : out STD_LOGIC;
    SPI1_MOSI_I : in STD_LOGIC;
    SPI1_MOSI_O : out STD_LOGIC;
    SPI1_MOSI_T : out STD_LOGIC;
    SPI1_MISO_I : in STD_LOGIC;
    SPI1_MISO_O : out STD_LOGIC;
    SPI1_MISO_T : out STD_LOGIC;
    SPI1_SS_I : in STD_LOGIC;
    SPI1_SS_O : out STD_LOGIC;
    SPI1_SS1_O : out STD_LOGIC;
    SPI1_SS2_O : out STD_LOGIC;
    SPI1_SS_T : out STD_LOGIC;
    UART0_DTRN : out STD_LOGIC;
    UART0_RTSN : out STD_LOGIC;
    UART0_TX : out STD_LOGIC;
    UART0_CTSN : in STD_LOGIC;
    UART0_DCDN : in STD_LOGIC;
    UART0_DSRN : in STD_LOGIC;
    UART0_RIN : in STD_LOGIC;
    UART0_RX : in STD_LOGIC;
    UART1_DTRN : out STD_LOGIC;
    UART1_RTSN : out STD_LOGIC;
    UART1_TX : out STD_LOGIC;
    UART1_CTSN : in STD_LOGIC;
    UART1_DCDN : in STD_LOGIC;
    UART1_DSRN : in STD_LOGIC;
    UART1_RIN : in STD_LOGIC;
    UART1_RX : in STD_LOGIC;
    TTC0_WAVE0_OUT : out STD_LOGIC;
    TTC0_WAVE1_OUT : out STD_LOGIC;
    TTC0_WAVE2_OUT : out STD_LOGIC;
    TTC0_CLK0_IN : in STD_LOGIC;
    TTC0_CLK1_IN : in STD_LOGIC;
    TTC0_CLK2_IN : in STD_LOGIC;
    TTC1_WAVE0_OUT : out STD_LOGIC;
    TTC1_WAVE1_OUT : out STD_LOGIC;
    TTC1_WAVE2_OUT : out STD_LOGIC;
    TTC1_CLK0_IN : in STD_LOGIC;
    TTC1_CLK1_IN : in STD_LOGIC;
    TTC1_CLK2_IN : in STD_LOGIC;
    WDT_CLK_IN : in STD_LOGIC;
    WDT_RST_OUT : out STD_LOGIC;
    TRACE_CLK : in STD_LOGIC;
    TRACE_CTL : out STD_LOGIC;
    TRACE_DATA : out STD_LOGIC_VECTOR ( 1 downto 0 );
    TRACE_CLK_OUT : out STD_LOGIC;
    USB0_PORT_INDCTL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    USB0_VBUS_PWRSELECT : out STD_LOGIC;
    USB0_VBUS_PWRFAULT : in STD_LOGIC;
    USB1_PORT_INDCTL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    USB1_VBUS_PWRSELECT : out STD_LOGIC;
    USB1_VBUS_PWRFAULT : in STD_LOGIC;
    SRAM_INTIN : in STD_LOGIC;
    M_AXI_GP0_ARESETN : out STD_LOGIC;
    M_AXI_GP0_ARVALID : out STD_LOGIC;
    M_AXI_GP0_AWVALID : out STD_LOGIC;
    M_AXI_GP0_BREADY : out STD_LOGIC;
    M_AXI_GP0_RREADY : out STD_LOGIC;
    M_AXI_GP0_WLAST : out STD_LOGIC;
    M_AXI_GP0_WVALID : out STD_LOGIC;
    M_AXI_GP0_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ACLK : in STD_LOGIC;
    M_AXI_GP0_ARREADY : in STD_LOGIC;
    M_AXI_GP0_AWREADY : in STD_LOGIC;
    M_AXI_GP0_BVALID : in STD_LOGIC;
    M_AXI_GP0_RLAST : in STD_LOGIC;
    M_AXI_GP0_RVALID : in STD_LOGIC;
    M_AXI_GP0_WREADY : in STD_LOGIC;
    M_AXI_GP0_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP1_ARESETN : out STD_LOGIC;
    M_AXI_GP1_ARVALID : out STD_LOGIC;
    M_AXI_GP1_AWVALID : out STD_LOGIC;
    M_AXI_GP1_BREADY : out STD_LOGIC;
    M_AXI_GP1_RREADY : out STD_LOGIC;
    M_AXI_GP1_WLAST : out STD_LOGIC;
    M_AXI_GP1_WVALID : out STD_LOGIC;
    M_AXI_GP1_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP1_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP1_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP1_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP1_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP1_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP1_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP1_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP1_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP1_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP1_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP1_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP1_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP1_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP1_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_ACLK : in STD_LOGIC;
    M_AXI_GP1_ARREADY : in STD_LOGIC;
    M_AXI_GP1_AWREADY : in STD_LOGIC;
    M_AXI_GP1_BVALID : in STD_LOGIC;
    M_AXI_GP1_RLAST : in STD_LOGIC;
    M_AXI_GP1_RVALID : in STD_LOGIC;
    M_AXI_GP1_WREADY : in STD_LOGIC;
    M_AXI_GP1_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP1_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP1_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP1_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP1_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP0_ARESETN : out STD_LOGIC;
    S_AXI_GP0_ARREADY : out STD_LOGIC;
    S_AXI_GP0_AWREADY : out STD_LOGIC;
    S_AXI_GP0_BVALID : out STD_LOGIC;
    S_AXI_GP0_RLAST : out STD_LOGIC;
    S_AXI_GP0_RVALID : out STD_LOGIC;
    S_AXI_GP0_WREADY : out STD_LOGIC;
    S_AXI_GP0_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP0_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP0_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP0_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_GP0_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_GP0_ACLK : in STD_LOGIC;
    S_AXI_GP0_ARVALID : in STD_LOGIC;
    S_AXI_GP0_AWVALID : in STD_LOGIC;
    S_AXI_GP0_BREADY : in STD_LOGIC;
    S_AXI_GP0_RREADY : in STD_LOGIC;
    S_AXI_GP0_WLAST : in STD_LOGIC;
    S_AXI_GP0_WVALID : in STD_LOGIC;
    S_AXI_GP0_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP0_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP0_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_GP0_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP0_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP0_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_GP0_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_GP0_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_GP0_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP0_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP0_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP0_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_GP0_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_GP0_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_GP1_ARESETN : out STD_LOGIC;
    S_AXI_GP1_ARREADY : out STD_LOGIC;
    S_AXI_GP1_AWREADY : out STD_LOGIC;
    S_AXI_GP1_BVALID : out STD_LOGIC;
    S_AXI_GP1_RLAST : out STD_LOGIC;
    S_AXI_GP1_RVALID : out STD_LOGIC;
    S_AXI_GP1_WREADY : out STD_LOGIC;
    S_AXI_GP1_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP1_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP1_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP1_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_GP1_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_GP1_ACLK : in STD_LOGIC;
    S_AXI_GP1_ARVALID : in STD_LOGIC;
    S_AXI_GP1_AWVALID : in STD_LOGIC;
    S_AXI_GP1_BREADY : in STD_LOGIC;
    S_AXI_GP1_RREADY : in STD_LOGIC;
    S_AXI_GP1_WLAST : in STD_LOGIC;
    S_AXI_GP1_WVALID : in STD_LOGIC;
    S_AXI_GP1_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP1_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP1_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_GP1_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP1_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP1_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_GP1_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_GP1_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_GP1_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP1_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP1_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP1_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP1_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP1_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP1_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP1_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP1_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP1_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP1_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_GP1_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_GP1_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_ACP_ARESETN : out STD_LOGIC;
    S_AXI_ACP_ARREADY : out STD_LOGIC;
    S_AXI_ACP_AWREADY : out STD_LOGIC;
    S_AXI_ACP_BVALID : out STD_LOGIC;
    S_AXI_ACP_RLAST : out STD_LOGIC;
    S_AXI_ACP_RVALID : out STD_LOGIC;
    S_AXI_ACP_WREADY : out STD_LOGIC;
    S_AXI_ACP_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_ACP_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_ACP_BID : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ACP_RID : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ACP_RDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_ACP_ACLK : in STD_LOGIC;
    S_AXI_ACP_ARVALID : in STD_LOGIC;
    S_AXI_ACP_AWVALID : in STD_LOGIC;
    S_AXI_ACP_BREADY : in STD_LOGIC;
    S_AXI_ACP_RREADY : in STD_LOGIC;
    S_AXI_ACP_WLAST : in STD_LOGIC;
    S_AXI_ACP_WVALID : in STD_LOGIC;
    S_AXI_ACP_ARID : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ACP_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ACP_AWID : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ACP_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ACP_WID : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ACP_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_ACP_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_ACP_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ACP_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ACP_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ACP_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ACP_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ACP_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ACP_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_ACP_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_ACP_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ACP_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_ACP_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_ACP_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ACP_ARUSER : in STD_LOGIC_VECTOR ( 4 downto 0 );
    S_AXI_ACP_AWUSER : in STD_LOGIC_VECTOR ( 4 downto 0 );
    S_AXI_ACP_WDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_ACP_WSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_ARESETN : out STD_LOGIC;
    S_AXI_HP0_ARREADY : out STD_LOGIC;
    S_AXI_HP0_AWREADY : out STD_LOGIC;
    S_AXI_HP0_BVALID : out STD_LOGIC;
    S_AXI_HP0_RLAST : out STD_LOGIC;
    S_AXI_HP0_RVALID : out STD_LOGIC;
    S_AXI_HP0_WREADY : out STD_LOGIC;
    S_AXI_HP0_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP0_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_ACLK : in STD_LOGIC;
    S_AXI_HP0_ARVALID : in STD_LOGIC;
    S_AXI_HP0_AWVALID : in STD_LOGIC;
    S_AXI_HP0_BREADY : in STD_LOGIC;
    S_AXI_HP0_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_RREADY : in STD_LOGIC;
    S_AXI_HP0_WLAST : in STD_LOGIC;
    S_AXI_HP0_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_WVALID : in STD_LOGIC;
    S_AXI_HP0_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP0_WSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP1_ARESETN : out STD_LOGIC;
    S_AXI_HP1_ARREADY : out STD_LOGIC;
    S_AXI_HP1_AWREADY : out STD_LOGIC;
    S_AXI_HP1_BVALID : out STD_LOGIC;
    S_AXI_HP1_RLAST : out STD_LOGIC;
    S_AXI_HP1_RVALID : out STD_LOGIC;
    S_AXI_HP1_WREADY : out STD_LOGIC;
    S_AXI_HP1_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_RDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP1_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP1_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP1_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_ACLK : in STD_LOGIC;
    S_AXI_HP1_ARVALID : in STD_LOGIC;
    S_AXI_HP1_AWVALID : in STD_LOGIC;
    S_AXI_HP1_BREADY : in STD_LOGIC;
    S_AXI_HP1_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP1_RREADY : in STD_LOGIC;
    S_AXI_HP1_WLAST : in STD_LOGIC;
    S_AXI_HP1_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP1_WVALID : in STD_LOGIC;
    S_AXI_HP1_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP1_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP1_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_WDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP1_WSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP2_ARESETN : out STD_LOGIC;
    S_AXI_HP2_ARREADY : out STD_LOGIC;
    S_AXI_HP2_AWREADY : out STD_LOGIC;
    S_AXI_HP2_BVALID : out STD_LOGIC;
    S_AXI_HP2_RLAST : out STD_LOGIC;
    S_AXI_HP2_RVALID : out STD_LOGIC;
    S_AXI_HP2_WREADY : out STD_LOGIC;
    S_AXI_HP2_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP2_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP2_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP2_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP2_RDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP2_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP2_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP2_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP2_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP2_ACLK : in STD_LOGIC;
    S_AXI_HP2_ARVALID : in STD_LOGIC;
    S_AXI_HP2_AWVALID : in STD_LOGIC;
    S_AXI_HP2_BREADY : in STD_LOGIC;
    S_AXI_HP2_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP2_RREADY : in STD_LOGIC;
    S_AXI_HP2_WLAST : in STD_LOGIC;
    S_AXI_HP2_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP2_WVALID : in STD_LOGIC;
    S_AXI_HP2_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP2_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP2_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP2_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP2_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP2_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP2_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP2_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP2_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP2_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP2_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP2_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP2_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP2_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP2_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP2_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP2_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP2_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP2_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP2_WDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP2_WSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP3_ARESETN : out STD_LOGIC;
    S_AXI_HP3_ARREADY : out STD_LOGIC;
    S_AXI_HP3_AWREADY : out STD_LOGIC;
    S_AXI_HP3_BVALID : out STD_LOGIC;
    S_AXI_HP3_RLAST : out STD_LOGIC;
    S_AXI_HP3_RVALID : out STD_LOGIC;
    S_AXI_HP3_WREADY : out STD_LOGIC;
    S_AXI_HP3_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP3_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP3_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP3_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP3_RDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP3_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP3_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP3_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP3_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP3_ACLK : in STD_LOGIC;
    S_AXI_HP3_ARVALID : in STD_LOGIC;
    S_AXI_HP3_AWVALID : in STD_LOGIC;
    S_AXI_HP3_BREADY : in STD_LOGIC;
    S_AXI_HP3_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP3_RREADY : in STD_LOGIC;
    S_AXI_HP3_WLAST : in STD_LOGIC;
    S_AXI_HP3_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP3_WVALID : in STD_LOGIC;
    S_AXI_HP3_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP3_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP3_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP3_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP3_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP3_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP3_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP3_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP3_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP3_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP3_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP3_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP3_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP3_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP3_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP3_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP3_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP3_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP3_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP3_WDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP3_WSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    IRQ_P2F_DMAC_ABORT : out STD_LOGIC;
    IRQ_P2F_DMAC0 : out STD_LOGIC;
    IRQ_P2F_DMAC1 : out STD_LOGIC;
    IRQ_P2F_DMAC2 : out STD_LOGIC;
    IRQ_P2F_DMAC3 : out STD_LOGIC;
    IRQ_P2F_DMAC4 : out STD_LOGIC;
    IRQ_P2F_DMAC5 : out STD_LOGIC;
    IRQ_P2F_DMAC6 : out STD_LOGIC;
    IRQ_P2F_DMAC7 : out STD_LOGIC;
    IRQ_P2F_SMC : out STD_LOGIC;
    IRQ_P2F_QSPI : out STD_LOGIC;
    IRQ_P2F_CTI : out STD_LOGIC;
    IRQ_P2F_GPIO : out STD_LOGIC;
    IRQ_P2F_USB0 : out STD_LOGIC;
    IRQ_P2F_ENET0 : out STD_LOGIC;
    IRQ_P2F_ENET_WAKE0 : out STD_LOGIC;
    IRQ_P2F_SDIO0 : out STD_LOGIC;
    IRQ_P2F_I2C0 : out STD_LOGIC;
    IRQ_P2F_SPI0 : out STD_LOGIC;
    IRQ_P2F_UART0 : out STD_LOGIC;
    IRQ_P2F_CAN0 : out STD_LOGIC;
    IRQ_P2F_USB1 : out STD_LOGIC;
    IRQ_P2F_ENET1 : out STD_LOGIC;
    IRQ_P2F_ENET_WAKE1 : out STD_LOGIC;
    IRQ_P2F_SDIO1 : out STD_LOGIC;
    IRQ_P2F_I2C1 : out STD_LOGIC;
    IRQ_P2F_SPI1 : out STD_LOGIC;
    IRQ_P2F_UART1 : out STD_LOGIC;
    IRQ_P2F_CAN1 : out STD_LOGIC;
    IRQ_F2P : in STD_LOGIC_VECTOR ( 0 to 0 );
    Core0_nFIQ : in STD_LOGIC;
    Core0_nIRQ : in STD_LOGIC;
    Core1_nFIQ : in STD_LOGIC;
    Core1_nIRQ : in STD_LOGIC;
    DMA0_DATYPE : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DMA0_DAVALID : out STD_LOGIC;
    DMA0_DRREADY : out STD_LOGIC;
    DMA0_RSTN : out STD_LOGIC;
    DMA1_DATYPE : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DMA1_DAVALID : out STD_LOGIC;
    DMA1_DRREADY : out STD_LOGIC;
    DMA1_RSTN : out STD_LOGIC;
    DMA2_DATYPE : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DMA2_DAVALID : out STD_LOGIC;
    DMA2_DRREADY : out STD_LOGIC;
    DMA2_RSTN : out STD_LOGIC;
    DMA3_DATYPE : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DMA3_DAVALID : out STD_LOGIC;
    DMA3_DRREADY : out STD_LOGIC;
    DMA3_RSTN : out STD_LOGIC;
    DMA0_ACLK : in STD_LOGIC;
    DMA0_DAREADY : in STD_LOGIC;
    DMA0_DRLAST : in STD_LOGIC;
    DMA0_DRVALID : in STD_LOGIC;
    DMA1_ACLK : in STD_LOGIC;
    DMA1_DAREADY : in STD_LOGIC;
    DMA1_DRLAST : in STD_LOGIC;
    DMA1_DRVALID : in STD_LOGIC;
    DMA2_ACLK : in STD_LOGIC;
    DMA2_DAREADY : in STD_LOGIC;
    DMA2_DRLAST : in STD_LOGIC;
    DMA2_DRVALID : in STD_LOGIC;
    DMA3_ACLK : in STD_LOGIC;
    DMA3_DAREADY : in STD_LOGIC;
    DMA3_DRLAST : in STD_LOGIC;
    DMA3_DRVALID : in STD_LOGIC;
    DMA0_DRTYPE : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DMA1_DRTYPE : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DMA2_DRTYPE : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DMA3_DRTYPE : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FCLK_CLK3 : out STD_LOGIC;
    FCLK_CLK2 : out STD_LOGIC;
    FCLK_CLK1 : out STD_LOGIC;
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_CLKTRIG3_N : in STD_LOGIC;
    FCLK_CLKTRIG2_N : in STD_LOGIC;
    FCLK_CLKTRIG1_N : in STD_LOGIC;
    FCLK_CLKTRIG0_N : in STD_LOGIC;
    FCLK_RESET3_N : out STD_LOGIC;
    FCLK_RESET2_N : out STD_LOGIC;
    FCLK_RESET1_N : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC;
    FTMD_TRACEIN_DATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FTMD_TRACEIN_VALID : in STD_LOGIC;
    FTMD_TRACEIN_CLK : in STD_LOGIC;
    FTMD_TRACEIN_ATID : in STD_LOGIC_VECTOR ( 3 downto 0 );
    FTMT_F2P_TRIG_0 : in STD_LOGIC;
    FTMT_F2P_TRIGACK_0 : out STD_LOGIC;
    FTMT_F2P_TRIG_1 : in STD_LOGIC;
    FTMT_F2P_TRIGACK_1 : out STD_LOGIC;
    FTMT_F2P_TRIG_2 : in STD_LOGIC;
    FTMT_F2P_TRIGACK_2 : out STD_LOGIC;
    FTMT_F2P_TRIG_3 : in STD_LOGIC;
    FTMT_F2P_TRIGACK_3 : out STD_LOGIC;
    FTMT_F2P_DEBUG : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FTMT_P2F_TRIGACK_0 : in STD_LOGIC;
    FTMT_P2F_TRIG_0 : out STD_LOGIC;
    FTMT_P2F_TRIGACK_1 : in STD_LOGIC;
    FTMT_P2F_TRIG_1 : out STD_LOGIC;
    FTMT_P2F_TRIGACK_2 : in STD_LOGIC;
    FTMT_P2F_TRIG_2 : out STD_LOGIC;
    FTMT_P2F_TRIGACK_3 : in STD_LOGIC;
    FTMT_P2F_TRIG_3 : out STD_LOGIC;
    FTMT_P2F_DEBUG : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPGA_IDLE_N : in STD_LOGIC;
    EVENT_EVENTO : out STD_LOGIC;
    EVENT_STANDBYWFE : out STD_LOGIC_VECTOR ( 1 downto 0 );
    EVENT_STANDBYWFI : out STD_LOGIC_VECTOR ( 1 downto 0 );
    EVENT_EVENTI : in STD_LOGIC;
    DDR_ARB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );
  attribute C_DM_WIDTH : integer;
  attribute C_DM_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 4;
  attribute C_DQS_WIDTH : integer;
  attribute C_DQS_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 4;
  attribute C_DQ_WIDTH : integer;
  attribute C_DQ_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 32;
  attribute C_EMIO_GPIO_WIDTH : integer;
  attribute C_EMIO_GPIO_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 64;
  attribute C_EN_EMIO_ENET0 : integer;
  attribute C_EN_EMIO_ENET0 of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_EN_EMIO_ENET1 : integer;
  attribute C_EN_EMIO_ENET1 of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_EN_EMIO_PJTAG : integer;
  attribute C_EN_EMIO_PJTAG of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_EN_EMIO_TRACE : integer;
  attribute C_EN_EMIO_TRACE of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_FCLK_CLK0_BUF : string;
  attribute C_FCLK_CLK0_BUF of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is "TRUE";
  attribute C_FCLK_CLK1_BUF : string;
  attribute C_FCLK_CLK1_BUF of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is "TRUE";
  attribute C_FCLK_CLK2_BUF : string;
  attribute C_FCLK_CLK2_BUF of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is "FALSE";
  attribute C_FCLK_CLK3_BUF : string;
  attribute C_FCLK_CLK3_BUF of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is "FALSE";
  attribute C_GP0_EN_MODIFIABLE_TXN : integer;
  attribute C_GP0_EN_MODIFIABLE_TXN of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 1;
  attribute C_GP1_EN_MODIFIABLE_TXN : integer;
  attribute C_GP1_EN_MODIFIABLE_TXN of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 1;
  attribute C_INCLUDE_ACP_TRANS_CHECK : integer;
  attribute C_INCLUDE_ACP_TRANS_CHECK of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_INCLUDE_TRACE_BUFFER : integer;
  attribute C_INCLUDE_TRACE_BUFFER of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_IRQ_F2P_MODE : string;
  attribute C_IRQ_F2P_MODE of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is "DIRECT";
  attribute C_MIO_PRIMITIVE : integer;
  attribute C_MIO_PRIMITIVE of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 54;
  attribute C_M_AXI_GP0_ENABLE_STATIC_REMAP : integer;
  attribute C_M_AXI_GP0_ENABLE_STATIC_REMAP of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_M_AXI_GP0_ID_WIDTH : integer;
  attribute C_M_AXI_GP0_ID_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 12;
  attribute C_M_AXI_GP0_THREAD_ID_WIDTH : integer;
  attribute C_M_AXI_GP0_THREAD_ID_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 12;
  attribute C_M_AXI_GP1_ENABLE_STATIC_REMAP : integer;
  attribute C_M_AXI_GP1_ENABLE_STATIC_REMAP of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_M_AXI_GP1_ID_WIDTH : integer;
  attribute C_M_AXI_GP1_ID_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 12;
  attribute C_M_AXI_GP1_THREAD_ID_WIDTH : integer;
  attribute C_M_AXI_GP1_THREAD_ID_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 12;
  attribute C_NUM_F2P_INTR_INPUTS : integer;
  attribute C_NUM_F2P_INTR_INPUTS of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 1;
  attribute C_PACKAGE_NAME : string;
  attribute C_PACKAGE_NAME of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is "clg400";
  attribute C_PS7_SI_REV : string;
  attribute C_PS7_SI_REV of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is "PRODUCTION";
  attribute C_S_AXI_ACP_ARUSER_VAL : integer;
  attribute C_S_AXI_ACP_ARUSER_VAL of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 31;
  attribute C_S_AXI_ACP_AWUSER_VAL : integer;
  attribute C_S_AXI_ACP_AWUSER_VAL of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 31;
  attribute C_S_AXI_ACP_ID_WIDTH : integer;
  attribute C_S_AXI_ACP_ID_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 3;
  attribute C_S_AXI_GP0_ID_WIDTH : integer;
  attribute C_S_AXI_GP0_ID_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 6;
  attribute C_S_AXI_GP1_ID_WIDTH : integer;
  attribute C_S_AXI_GP1_ID_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 6;
  attribute C_S_AXI_HP0_DATA_WIDTH : integer;
  attribute C_S_AXI_HP0_DATA_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 64;
  attribute C_S_AXI_HP0_ID_WIDTH : integer;
  attribute C_S_AXI_HP0_ID_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 6;
  attribute C_S_AXI_HP1_DATA_WIDTH : integer;
  attribute C_S_AXI_HP1_DATA_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 64;
  attribute C_S_AXI_HP1_ID_WIDTH : integer;
  attribute C_S_AXI_HP1_ID_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 6;
  attribute C_S_AXI_HP2_DATA_WIDTH : integer;
  attribute C_S_AXI_HP2_DATA_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 64;
  attribute C_S_AXI_HP2_ID_WIDTH : integer;
  attribute C_S_AXI_HP2_ID_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 6;
  attribute C_S_AXI_HP3_DATA_WIDTH : integer;
  attribute C_S_AXI_HP3_DATA_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 64;
  attribute C_S_AXI_HP3_ID_WIDTH : integer;
  attribute C_S_AXI_HP3_ID_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 6;
  attribute C_TRACE_BUFFER_CLOCK_DELAY : integer;
  attribute C_TRACE_BUFFER_CLOCK_DELAY of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 12;
  attribute C_TRACE_BUFFER_FIFO_SIZE : integer;
  attribute C_TRACE_BUFFER_FIFO_SIZE of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 128;
  attribute C_TRACE_INTERNAL_WIDTH : integer;
  attribute C_TRACE_INTERNAL_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 2;
  attribute C_TRACE_PIPELINE_WIDTH : integer;
  attribute C_TRACE_PIPELINE_WIDTH of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 8;
  attribute C_USE_AXI_NONSECURE : integer;
  attribute C_USE_AXI_NONSECURE of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_USE_DEFAULT_ACP_USER_VAL : integer;
  attribute C_USE_DEFAULT_ACP_USER_VAL of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_USE_M_AXI_GP0 : integer;
  attribute C_USE_M_AXI_GP0 of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 1;
  attribute C_USE_M_AXI_GP1 : integer;
  attribute C_USE_M_AXI_GP1 of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_USE_S_AXI_ACP : integer;
  attribute C_USE_S_AXI_ACP of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_USE_S_AXI_GP0 : integer;
  attribute C_USE_S_AXI_GP0 of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_USE_S_AXI_GP1 : integer;
  attribute C_USE_S_AXI_GP1 of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_USE_S_AXI_HP0 : integer;
  attribute C_USE_S_AXI_HP0 of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_USE_S_AXI_HP1 : integer;
  attribute C_USE_S_AXI_HP1 of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_USE_S_AXI_HP2 : integer;
  attribute C_USE_S_AXI_HP2 of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute C_USE_S_AXI_HP3 : integer;
  attribute C_USE_S_AXI_HP3 of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is "processing_system7_v5_5_processing_system7";
  attribute POWER : string;
  attribute POWER of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is "<PROCESSOR name={system} numA9Cores={2} clockFreq={667} load={0.5} /><MEMORY name={code} memType={DDR3} dataWidth={32} clockFreq={533.333333} readRate={0.5} writeRate={0.5} /><IO interface={GPIO_Bank_1} ioStandard={LVCMOS18} bidis={2} ioBank={Vcco_p1} clockFreq={1} usageRate={0.5} /><IO interface={GPIO_Bank_0} ioStandard={LVCMOS33} bidis={9} ioBank={Vcco_p0} clockFreq={1} usageRate={0.5} /><IO interface={Timer} ioStandard={} bidis={0} ioBank={} clockFreq={111.111115} usageRate={0.5} /><IO interface={UART} ioStandard={LVCMOS18} bidis={2} ioBank={Vcco_p1} clockFreq={50.000000} usageRate={0.5} /><IO interface={SD} ioStandard={LVCMOS18} bidis={8} ioBank={Vcco_p1} clockFreq={25.000000} usageRate={0.5} /><IO interface={USB} ioStandard={LVCMOS18} bidis={12} ioBank={Vcco_p1} clockFreq={60} usageRate={0.5} /><IO interface={GigE} ioStandard={LVCMOS18} bidis={14} ioBank={Vcco_p1} clockFreq={125.000000} usageRate={0.5} /><IO interface={QSPI} ioStandard={LVCMOS33} bidis={7} ioBank={Vcco_p0} clockFreq={200} usageRate={0.5} /><PLL domain={Processor} vco={1333.333} /><PLL domain={Memory} vco={1066.667} /><PLL domain={IO} vco={1000.000} /><AXI interface={M_AXI_GP0} dataWidth={32} clockFreq={100} usageRate={0.5} />/>";
  attribute USE_TRACE_DATA_EDGE_DETECTOR : integer;
  attribute USE_TRACE_DATA_EDGE_DETECTOR of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is 0;
  attribute hw_handoff : string;
  attribute hw_handoff of dwa_ps_bd_processing_system7_v5_5_processing_system7 : entity is "dwa_ps_bd_processing_system7_0_0.hwdef";
end dwa_ps_bd_processing_system7_v5_5_processing_system7;

architecture STRUCTURE of dwa_ps_bd_processing_system7_v5_5_processing_system7 is
  signal \<const0>\ : STD_LOGIC;
  signal ENET0_MDIO_T_n : STD_LOGIC;
  signal ENET1_MDIO_T_n : STD_LOGIC;
  signal \^fclk_clk0\ : STD_LOGIC;
  signal FCLK_CLK_unbuffered : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal I2C0_SCL_T_n : STD_LOGIC;
  signal I2C0_SDA_T_n : STD_LOGIC;
  signal I2C1_SCL_T_n : STD_LOGIC;
  signal I2C1_SDA_T_n : STD_LOGIC;
  signal \^m_axi_gp0_arsize\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^m_axi_gp0_awsize\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_i_n_0 : STD_LOGIC;
  signal PS7_i_n_1 : STD_LOGIC;
  signal PS7_i_n_10 : STD_LOGIC;
  signal PS7_i_n_100 : STD_LOGIC;
  signal PS7_i_n_1001 : STD_LOGIC;
  signal PS7_i_n_1002 : STD_LOGIC;
  signal PS7_i_n_1003 : STD_LOGIC;
  signal PS7_i_n_1004 : STD_LOGIC;
  signal PS7_i_n_1005 : STD_LOGIC;
  signal PS7_i_n_1006 : STD_LOGIC;
  signal PS7_i_n_1007 : STD_LOGIC;
  signal PS7_i_n_1008 : STD_LOGIC;
  signal PS7_i_n_1009 : STD_LOGIC;
  signal PS7_i_n_101 : STD_LOGIC;
  signal PS7_i_n_1010 : STD_LOGIC;
  signal PS7_i_n_1011 : STD_LOGIC;
  signal PS7_i_n_1012 : STD_LOGIC;
  signal PS7_i_n_1013 : STD_LOGIC;
  signal PS7_i_n_1014 : STD_LOGIC;
  signal PS7_i_n_1015 : STD_LOGIC;
  signal PS7_i_n_1016 : STD_LOGIC;
  signal PS7_i_n_1017 : STD_LOGIC;
  signal PS7_i_n_1018 : STD_LOGIC;
  signal PS7_i_n_1019 : STD_LOGIC;
  signal PS7_i_n_102 : STD_LOGIC;
  signal PS7_i_n_1020 : STD_LOGIC;
  signal PS7_i_n_1021 : STD_LOGIC;
  signal PS7_i_n_1022 : STD_LOGIC;
  signal PS7_i_n_1023 : STD_LOGIC;
  signal PS7_i_n_1024 : STD_LOGIC;
  signal PS7_i_n_1025 : STD_LOGIC;
  signal PS7_i_n_1026 : STD_LOGIC;
  signal PS7_i_n_1027 : STD_LOGIC;
  signal PS7_i_n_1028 : STD_LOGIC;
  signal PS7_i_n_1029 : STD_LOGIC;
  signal PS7_i_n_103 : STD_LOGIC;
  signal PS7_i_n_1030 : STD_LOGIC;
  signal PS7_i_n_1031 : STD_LOGIC;
  signal PS7_i_n_1032 : STD_LOGIC;
  signal PS7_i_n_1033 : STD_LOGIC;
  signal PS7_i_n_1034 : STD_LOGIC;
  signal PS7_i_n_1035 : STD_LOGIC;
  signal PS7_i_n_1036 : STD_LOGIC;
  signal PS7_i_n_1037 : STD_LOGIC;
  signal PS7_i_n_1038 : STD_LOGIC;
  signal PS7_i_n_1039 : STD_LOGIC;
  signal PS7_i_n_104 : STD_LOGIC;
  signal PS7_i_n_1040 : STD_LOGIC;
  signal PS7_i_n_1041 : STD_LOGIC;
  signal PS7_i_n_1042 : STD_LOGIC;
  signal PS7_i_n_1043 : STD_LOGIC;
  signal PS7_i_n_1044 : STD_LOGIC;
  signal PS7_i_n_1045 : STD_LOGIC;
  signal PS7_i_n_1046 : STD_LOGIC;
  signal PS7_i_n_1047 : STD_LOGIC;
  signal PS7_i_n_1048 : STD_LOGIC;
  signal PS7_i_n_1049 : STD_LOGIC;
  signal PS7_i_n_105 : STD_LOGIC;
  signal PS7_i_n_1050 : STD_LOGIC;
  signal PS7_i_n_1051 : STD_LOGIC;
  signal PS7_i_n_1052 : STD_LOGIC;
  signal PS7_i_n_1053 : STD_LOGIC;
  signal PS7_i_n_1054 : STD_LOGIC;
  signal PS7_i_n_1055 : STD_LOGIC;
  signal PS7_i_n_1056 : STD_LOGIC;
  signal PS7_i_n_1057 : STD_LOGIC;
  signal PS7_i_n_1058 : STD_LOGIC;
  signal PS7_i_n_1059 : STD_LOGIC;
  signal PS7_i_n_106 : STD_LOGIC;
  signal PS7_i_n_1060 : STD_LOGIC;
  signal PS7_i_n_1061 : STD_LOGIC;
  signal PS7_i_n_1062 : STD_LOGIC;
  signal PS7_i_n_1063 : STD_LOGIC;
  signal PS7_i_n_1064 : STD_LOGIC;
  signal PS7_i_n_1065 : STD_LOGIC;
  signal PS7_i_n_1066 : STD_LOGIC;
  signal PS7_i_n_1067 : STD_LOGIC;
  signal PS7_i_n_1068 : STD_LOGIC;
  signal PS7_i_n_1069 : STD_LOGIC;
  signal PS7_i_n_107 : STD_LOGIC;
  signal PS7_i_n_1070 : STD_LOGIC;
  signal PS7_i_n_1071 : STD_LOGIC;
  signal PS7_i_n_1072 : STD_LOGIC;
  signal PS7_i_n_1073 : STD_LOGIC;
  signal PS7_i_n_1074 : STD_LOGIC;
  signal PS7_i_n_1075 : STD_LOGIC;
  signal PS7_i_n_1076 : STD_LOGIC;
  signal PS7_i_n_1077 : STD_LOGIC;
  signal PS7_i_n_1078 : STD_LOGIC;
  signal PS7_i_n_1079 : STD_LOGIC;
  signal PS7_i_n_108 : STD_LOGIC;
  signal PS7_i_n_1080 : STD_LOGIC;
  signal PS7_i_n_1081 : STD_LOGIC;
  signal PS7_i_n_1082 : STD_LOGIC;
  signal PS7_i_n_1083 : STD_LOGIC;
  signal PS7_i_n_1084 : STD_LOGIC;
  signal PS7_i_n_1085 : STD_LOGIC;
  signal PS7_i_n_1086 : STD_LOGIC;
  signal PS7_i_n_1087 : STD_LOGIC;
  signal PS7_i_n_1088 : STD_LOGIC;
  signal PS7_i_n_1089 : STD_LOGIC;
  signal PS7_i_n_109 : STD_LOGIC;
  signal PS7_i_n_1090 : STD_LOGIC;
  signal PS7_i_n_1091 : STD_LOGIC;
  signal PS7_i_n_1092 : STD_LOGIC;
  signal PS7_i_n_1093 : STD_LOGIC;
  signal PS7_i_n_1094 : STD_LOGIC;
  signal PS7_i_n_1095 : STD_LOGIC;
  signal PS7_i_n_1096 : STD_LOGIC;
  signal PS7_i_n_1097 : STD_LOGIC;
  signal PS7_i_n_1098 : STD_LOGIC;
  signal PS7_i_n_1099 : STD_LOGIC;
  signal PS7_i_n_11 : STD_LOGIC;
  signal PS7_i_n_110 : STD_LOGIC;
  signal PS7_i_n_1100 : STD_LOGIC;
  signal PS7_i_n_1101 : STD_LOGIC;
  signal PS7_i_n_1102 : STD_LOGIC;
  signal PS7_i_n_1103 : STD_LOGIC;
  signal PS7_i_n_1104 : STD_LOGIC;
  signal PS7_i_n_1105 : STD_LOGIC;
  signal PS7_i_n_1106 : STD_LOGIC;
  signal PS7_i_n_1107 : STD_LOGIC;
  signal PS7_i_n_1108 : STD_LOGIC;
  signal PS7_i_n_1109 : STD_LOGIC;
  signal PS7_i_n_111 : STD_LOGIC;
  signal PS7_i_n_1110 : STD_LOGIC;
  signal PS7_i_n_1111 : STD_LOGIC;
  signal PS7_i_n_1112 : STD_LOGIC;
  signal PS7_i_n_1113 : STD_LOGIC;
  signal PS7_i_n_1114 : STD_LOGIC;
  signal PS7_i_n_1115 : STD_LOGIC;
  signal PS7_i_n_1116 : STD_LOGIC;
  signal PS7_i_n_1117 : STD_LOGIC;
  signal PS7_i_n_1118 : STD_LOGIC;
  signal PS7_i_n_1119 : STD_LOGIC;
  signal PS7_i_n_112 : STD_LOGIC;
  signal PS7_i_n_1120 : STD_LOGIC;
  signal PS7_i_n_1121 : STD_LOGIC;
  signal PS7_i_n_1122 : STD_LOGIC;
  signal PS7_i_n_1123 : STD_LOGIC;
  signal PS7_i_n_1124 : STD_LOGIC;
  signal PS7_i_n_1125 : STD_LOGIC;
  signal PS7_i_n_1126 : STD_LOGIC;
  signal PS7_i_n_1127 : STD_LOGIC;
  signal PS7_i_n_1128 : STD_LOGIC;
  signal PS7_i_n_1129 : STD_LOGIC;
  signal PS7_i_n_113 : STD_LOGIC;
  signal PS7_i_n_1130 : STD_LOGIC;
  signal PS7_i_n_1131 : STD_LOGIC;
  signal PS7_i_n_1132 : STD_LOGIC;
  signal PS7_i_n_1133 : STD_LOGIC;
  signal PS7_i_n_1134 : STD_LOGIC;
  signal PS7_i_n_1135 : STD_LOGIC;
  signal PS7_i_n_1136 : STD_LOGIC;
  signal PS7_i_n_1137 : STD_LOGIC;
  signal PS7_i_n_1138 : STD_LOGIC;
  signal PS7_i_n_1139 : STD_LOGIC;
  signal PS7_i_n_114 : STD_LOGIC;
  signal PS7_i_n_1140 : STD_LOGIC;
  signal PS7_i_n_1141 : STD_LOGIC;
  signal PS7_i_n_1142 : STD_LOGIC;
  signal PS7_i_n_1143 : STD_LOGIC;
  signal PS7_i_n_1144 : STD_LOGIC;
  signal PS7_i_n_1145 : STD_LOGIC;
  signal PS7_i_n_1146 : STD_LOGIC;
  signal PS7_i_n_1147 : STD_LOGIC;
  signal PS7_i_n_1148 : STD_LOGIC;
  signal PS7_i_n_1149 : STD_LOGIC;
  signal PS7_i_n_115 : STD_LOGIC;
  signal PS7_i_n_1150 : STD_LOGIC;
  signal PS7_i_n_1151 : STD_LOGIC;
  signal PS7_i_n_1152 : STD_LOGIC;
  signal PS7_i_n_1153 : STD_LOGIC;
  signal PS7_i_n_1154 : STD_LOGIC;
  signal PS7_i_n_1155 : STD_LOGIC;
  signal PS7_i_n_1156 : STD_LOGIC;
  signal PS7_i_n_1157 : STD_LOGIC;
  signal PS7_i_n_1158 : STD_LOGIC;
  signal PS7_i_n_1159 : STD_LOGIC;
  signal PS7_i_n_116 : STD_LOGIC;
  signal PS7_i_n_1160 : STD_LOGIC;
  signal PS7_i_n_1161 : STD_LOGIC;
  signal PS7_i_n_1162 : STD_LOGIC;
  signal PS7_i_n_1163 : STD_LOGIC;
  signal PS7_i_n_1164 : STD_LOGIC;
  signal PS7_i_n_1165 : STD_LOGIC;
  signal PS7_i_n_1166 : STD_LOGIC;
  signal PS7_i_n_1167 : STD_LOGIC;
  signal PS7_i_n_1168 : STD_LOGIC;
  signal PS7_i_n_1169 : STD_LOGIC;
  signal PS7_i_n_117 : STD_LOGIC;
  signal PS7_i_n_1170 : STD_LOGIC;
  signal PS7_i_n_1171 : STD_LOGIC;
  signal PS7_i_n_1172 : STD_LOGIC;
  signal PS7_i_n_1173 : STD_LOGIC;
  signal PS7_i_n_1174 : STD_LOGIC;
  signal PS7_i_n_1175 : STD_LOGIC;
  signal PS7_i_n_1176 : STD_LOGIC;
  signal PS7_i_n_1177 : STD_LOGIC;
  signal PS7_i_n_1178 : STD_LOGIC;
  signal PS7_i_n_1179 : STD_LOGIC;
  signal PS7_i_n_118 : STD_LOGIC;
  signal PS7_i_n_1180 : STD_LOGIC;
  signal PS7_i_n_1181 : STD_LOGIC;
  signal PS7_i_n_1182 : STD_LOGIC;
  signal PS7_i_n_1183 : STD_LOGIC;
  signal PS7_i_n_1184 : STD_LOGIC;
  signal PS7_i_n_1185 : STD_LOGIC;
  signal PS7_i_n_1186 : STD_LOGIC;
  signal PS7_i_n_1187 : STD_LOGIC;
  signal PS7_i_n_1188 : STD_LOGIC;
  signal PS7_i_n_1189 : STD_LOGIC;
  signal PS7_i_n_119 : STD_LOGIC;
  signal PS7_i_n_1190 : STD_LOGIC;
  signal PS7_i_n_1191 : STD_LOGIC;
  signal PS7_i_n_1192 : STD_LOGIC;
  signal PS7_i_n_1193 : STD_LOGIC;
  signal PS7_i_n_1194 : STD_LOGIC;
  signal PS7_i_n_1195 : STD_LOGIC;
  signal PS7_i_n_1196 : STD_LOGIC;
  signal PS7_i_n_1197 : STD_LOGIC;
  signal PS7_i_n_1198 : STD_LOGIC;
  signal PS7_i_n_1199 : STD_LOGIC;
  signal PS7_i_n_12 : STD_LOGIC;
  signal PS7_i_n_120 : STD_LOGIC;
  signal PS7_i_n_1200 : STD_LOGIC;
  signal PS7_i_n_1201 : STD_LOGIC;
  signal PS7_i_n_1202 : STD_LOGIC;
  signal PS7_i_n_1203 : STD_LOGIC;
  signal PS7_i_n_1204 : STD_LOGIC;
  signal PS7_i_n_1205 : STD_LOGIC;
  signal PS7_i_n_1206 : STD_LOGIC;
  signal PS7_i_n_1207 : STD_LOGIC;
  signal PS7_i_n_1208 : STD_LOGIC;
  signal PS7_i_n_1209 : STD_LOGIC;
  signal PS7_i_n_121 : STD_LOGIC;
  signal PS7_i_n_1210 : STD_LOGIC;
  signal PS7_i_n_1211 : STD_LOGIC;
  signal PS7_i_n_1212 : STD_LOGIC;
  signal PS7_i_n_1213 : STD_LOGIC;
  signal PS7_i_n_1214 : STD_LOGIC;
  signal PS7_i_n_1215 : STD_LOGIC;
  signal PS7_i_n_1216 : STD_LOGIC;
  signal PS7_i_n_1217 : STD_LOGIC;
  signal PS7_i_n_1218 : STD_LOGIC;
  signal PS7_i_n_1219 : STD_LOGIC;
  signal PS7_i_n_122 : STD_LOGIC;
  signal PS7_i_n_1220 : STD_LOGIC;
  signal PS7_i_n_1221 : STD_LOGIC;
  signal PS7_i_n_1222 : STD_LOGIC;
  signal PS7_i_n_1223 : STD_LOGIC;
  signal PS7_i_n_1224 : STD_LOGIC;
  signal PS7_i_n_1225 : STD_LOGIC;
  signal PS7_i_n_1226 : STD_LOGIC;
  signal PS7_i_n_1227 : STD_LOGIC;
  signal PS7_i_n_1228 : STD_LOGIC;
  signal PS7_i_n_1229 : STD_LOGIC;
  signal PS7_i_n_123 : STD_LOGIC;
  signal PS7_i_n_1230 : STD_LOGIC;
  signal PS7_i_n_1231 : STD_LOGIC;
  signal PS7_i_n_1232 : STD_LOGIC;
  signal PS7_i_n_1233 : STD_LOGIC;
  signal PS7_i_n_1234 : STD_LOGIC;
  signal PS7_i_n_1235 : STD_LOGIC;
  signal PS7_i_n_1236 : STD_LOGIC;
  signal PS7_i_n_1237 : STD_LOGIC;
  signal PS7_i_n_1238 : STD_LOGIC;
  signal PS7_i_n_1239 : STD_LOGIC;
  signal PS7_i_n_124 : STD_LOGIC;
  signal PS7_i_n_1240 : STD_LOGIC;
  signal PS7_i_n_1241 : STD_LOGIC;
  signal PS7_i_n_1242 : STD_LOGIC;
  signal PS7_i_n_1243 : STD_LOGIC;
  signal PS7_i_n_1244 : STD_LOGIC;
  signal PS7_i_n_1245 : STD_LOGIC;
  signal PS7_i_n_1246 : STD_LOGIC;
  signal PS7_i_n_1247 : STD_LOGIC;
  signal PS7_i_n_1248 : STD_LOGIC;
  signal PS7_i_n_1249 : STD_LOGIC;
  signal PS7_i_n_125 : STD_LOGIC;
  signal PS7_i_n_1250 : STD_LOGIC;
  signal PS7_i_n_1251 : STD_LOGIC;
  signal PS7_i_n_1252 : STD_LOGIC;
  signal PS7_i_n_1253 : STD_LOGIC;
  signal PS7_i_n_1254 : STD_LOGIC;
  signal PS7_i_n_1255 : STD_LOGIC;
  signal PS7_i_n_1256 : STD_LOGIC;
  signal PS7_i_n_1257 : STD_LOGIC;
  signal PS7_i_n_1258 : STD_LOGIC;
  signal PS7_i_n_1259 : STD_LOGIC;
  signal PS7_i_n_126 : STD_LOGIC;
  signal PS7_i_n_1260 : STD_LOGIC;
  signal PS7_i_n_1261 : STD_LOGIC;
  signal PS7_i_n_1262 : STD_LOGIC;
  signal PS7_i_n_1263 : STD_LOGIC;
  signal PS7_i_n_1264 : STD_LOGIC;
  signal PS7_i_n_1265 : STD_LOGIC;
  signal PS7_i_n_1266 : STD_LOGIC;
  signal PS7_i_n_1267 : STD_LOGIC;
  signal PS7_i_n_1268 : STD_LOGIC;
  signal PS7_i_n_1269 : STD_LOGIC;
  signal PS7_i_n_127 : STD_LOGIC;
  signal PS7_i_n_1270 : STD_LOGIC;
  signal PS7_i_n_1271 : STD_LOGIC;
  signal PS7_i_n_1272 : STD_LOGIC;
  signal PS7_i_n_1273 : STD_LOGIC;
  signal PS7_i_n_1274 : STD_LOGIC;
  signal PS7_i_n_1275 : STD_LOGIC;
  signal PS7_i_n_1276 : STD_LOGIC;
  signal PS7_i_n_1277 : STD_LOGIC;
  signal PS7_i_n_1278 : STD_LOGIC;
  signal PS7_i_n_1279 : STD_LOGIC;
  signal PS7_i_n_128 : STD_LOGIC;
  signal PS7_i_n_1280 : STD_LOGIC;
  signal PS7_i_n_1281 : STD_LOGIC;
  signal PS7_i_n_1282 : STD_LOGIC;
  signal PS7_i_n_1283 : STD_LOGIC;
  signal PS7_i_n_1284 : STD_LOGIC;
  signal PS7_i_n_1285 : STD_LOGIC;
  signal PS7_i_n_1286 : STD_LOGIC;
  signal PS7_i_n_1287 : STD_LOGIC;
  signal PS7_i_n_1288 : STD_LOGIC;
  signal PS7_i_n_1289 : STD_LOGIC;
  signal PS7_i_n_129 : STD_LOGIC;
  signal PS7_i_n_1290 : STD_LOGIC;
  signal PS7_i_n_1291 : STD_LOGIC;
  signal PS7_i_n_1292 : STD_LOGIC;
  signal PS7_i_n_1293 : STD_LOGIC;
  signal PS7_i_n_1294 : STD_LOGIC;
  signal PS7_i_n_1295 : STD_LOGIC;
  signal PS7_i_n_1296 : STD_LOGIC;
  signal PS7_i_n_1297 : STD_LOGIC;
  signal PS7_i_n_1298 : STD_LOGIC;
  signal PS7_i_n_1299 : STD_LOGIC;
  signal PS7_i_n_13 : STD_LOGIC;
  signal PS7_i_n_130 : STD_LOGIC;
  signal PS7_i_n_1300 : STD_LOGIC;
  signal PS7_i_n_1301 : STD_LOGIC;
  signal PS7_i_n_1302 : STD_LOGIC;
  signal PS7_i_n_1303 : STD_LOGIC;
  signal PS7_i_n_1304 : STD_LOGIC;
  signal PS7_i_n_1305 : STD_LOGIC;
  signal PS7_i_n_1306 : STD_LOGIC;
  signal PS7_i_n_1307 : STD_LOGIC;
  signal PS7_i_n_1308 : STD_LOGIC;
  signal PS7_i_n_1309 : STD_LOGIC;
  signal PS7_i_n_131 : STD_LOGIC;
  signal PS7_i_n_1310 : STD_LOGIC;
  signal PS7_i_n_1311 : STD_LOGIC;
  signal PS7_i_n_1312 : STD_LOGIC;
  signal PS7_i_n_1313 : STD_LOGIC;
  signal PS7_i_n_1314 : STD_LOGIC;
  signal PS7_i_n_1315 : STD_LOGIC;
  signal PS7_i_n_1316 : STD_LOGIC;
  signal PS7_i_n_1317 : STD_LOGIC;
  signal PS7_i_n_1318 : STD_LOGIC;
  signal PS7_i_n_1319 : STD_LOGIC;
  signal PS7_i_n_132 : STD_LOGIC;
  signal PS7_i_n_1320 : STD_LOGIC;
  signal PS7_i_n_133 : STD_LOGIC;
  signal PS7_i_n_1337 : STD_LOGIC;
  signal PS7_i_n_1338 : STD_LOGIC;
  signal PS7_i_n_1339 : STD_LOGIC;
  signal PS7_i_n_134 : STD_LOGIC;
  signal PS7_i_n_1340 : STD_LOGIC;
  signal PS7_i_n_1341 : STD_LOGIC;
  signal PS7_i_n_1342 : STD_LOGIC;
  signal PS7_i_n_1343 : STD_LOGIC;
  signal PS7_i_n_1344 : STD_LOGIC;
  signal PS7_i_n_1345 : STD_LOGIC;
  signal PS7_i_n_1346 : STD_LOGIC;
  signal PS7_i_n_1347 : STD_LOGIC;
  signal PS7_i_n_1348 : STD_LOGIC;
  signal PS7_i_n_1349 : STD_LOGIC;
  signal PS7_i_n_135 : STD_LOGIC;
  signal PS7_i_n_1350 : STD_LOGIC;
  signal PS7_i_n_1351 : STD_LOGIC;
  signal PS7_i_n_1352 : STD_LOGIC;
  signal PS7_i_n_1353 : STD_LOGIC;
  signal PS7_i_n_1354 : STD_LOGIC;
  signal PS7_i_n_1355 : STD_LOGIC;
  signal PS7_i_n_1356 : STD_LOGIC;
  signal PS7_i_n_1357 : STD_LOGIC;
  signal PS7_i_n_1358 : STD_LOGIC;
  signal PS7_i_n_1359 : STD_LOGIC;
  signal PS7_i_n_136 : STD_LOGIC;
  signal PS7_i_n_1360 : STD_LOGIC;
  signal PS7_i_n_1361 : STD_LOGIC;
  signal PS7_i_n_1362 : STD_LOGIC;
  signal PS7_i_n_1363 : STD_LOGIC;
  signal PS7_i_n_1364 : STD_LOGIC;
  signal PS7_i_n_1365 : STD_LOGIC;
  signal PS7_i_n_1366 : STD_LOGIC;
  signal PS7_i_n_1367 : STD_LOGIC;
  signal PS7_i_n_1368 : STD_LOGIC;
  signal PS7_i_n_1369 : STD_LOGIC;
  signal PS7_i_n_137 : STD_LOGIC;
  signal PS7_i_n_1370 : STD_LOGIC;
  signal PS7_i_n_1371 : STD_LOGIC;
  signal PS7_i_n_1372 : STD_LOGIC;
  signal PS7_i_n_1373 : STD_LOGIC;
  signal PS7_i_n_1374 : STD_LOGIC;
  signal PS7_i_n_1375 : STD_LOGIC;
  signal PS7_i_n_1376 : STD_LOGIC;
  signal PS7_i_n_1377 : STD_LOGIC;
  signal PS7_i_n_1378 : STD_LOGIC;
  signal PS7_i_n_1379 : STD_LOGIC;
  signal PS7_i_n_138 : STD_LOGIC;
  signal PS7_i_n_1380 : STD_LOGIC;
  signal PS7_i_n_1381 : STD_LOGIC;
  signal PS7_i_n_1382 : STD_LOGIC;
  signal PS7_i_n_1383 : STD_LOGIC;
  signal PS7_i_n_1384 : STD_LOGIC;
  signal PS7_i_n_1385 : STD_LOGIC;
  signal PS7_i_n_1386 : STD_LOGIC;
  signal PS7_i_n_1387 : STD_LOGIC;
  signal PS7_i_n_1388 : STD_LOGIC;
  signal PS7_i_n_1389 : STD_LOGIC;
  signal PS7_i_n_139 : STD_LOGIC;
  signal PS7_i_n_1390 : STD_LOGIC;
  signal PS7_i_n_1391 : STD_LOGIC;
  signal PS7_i_n_1392 : STD_LOGIC;
  signal PS7_i_n_1393 : STD_LOGIC;
  signal PS7_i_n_1394 : STD_LOGIC;
  signal PS7_i_n_1395 : STD_LOGIC;
  signal PS7_i_n_1396 : STD_LOGIC;
  signal PS7_i_n_1397 : STD_LOGIC;
  signal PS7_i_n_1398 : STD_LOGIC;
  signal PS7_i_n_1399 : STD_LOGIC;
  signal PS7_i_n_140 : STD_LOGIC;
  signal PS7_i_n_1400 : STD_LOGIC;
  signal PS7_i_n_141 : STD_LOGIC;
  signal PS7_i_n_142 : STD_LOGIC;
  signal PS7_i_n_143 : STD_LOGIC;
  signal PS7_i_n_144 : STD_LOGIC;
  signal PS7_i_n_145 : STD_LOGIC;
  signal PS7_i_n_146 : STD_LOGIC;
  signal PS7_i_n_147 : STD_LOGIC;
  signal PS7_i_n_148 : STD_LOGIC;
  signal PS7_i_n_149 : STD_LOGIC;
  signal PS7_i_n_150 : STD_LOGIC;
  signal PS7_i_n_151 : STD_LOGIC;
  signal PS7_i_n_16 : STD_LOGIC;
  signal PS7_i_n_17 : STD_LOGIC;
  signal PS7_i_n_176 : STD_LOGIC;
  signal PS7_i_n_177 : STD_LOGIC;
  signal PS7_i_n_178 : STD_LOGIC;
  signal PS7_i_n_179 : STD_LOGIC;
  signal PS7_i_n_180 : STD_LOGIC;
  signal PS7_i_n_181 : STD_LOGIC;
  signal PS7_i_n_182 : STD_LOGIC;
  signal PS7_i_n_183 : STD_LOGIC;
  signal PS7_i_n_184 : STD_LOGIC;
  signal PS7_i_n_185 : STD_LOGIC;
  signal PS7_i_n_186 : STD_LOGIC;
  signal PS7_i_n_187 : STD_LOGIC;
  signal PS7_i_n_188 : STD_LOGIC;
  signal PS7_i_n_189 : STD_LOGIC;
  signal PS7_i_n_19 : STD_LOGIC;
  signal PS7_i_n_190 : STD_LOGIC;
  signal PS7_i_n_191 : STD_LOGIC;
  signal PS7_i_n_192 : STD_LOGIC;
  signal PS7_i_n_193 : STD_LOGIC;
  signal PS7_i_n_194 : STD_LOGIC;
  signal PS7_i_n_195 : STD_LOGIC;
  signal PS7_i_n_196 : STD_LOGIC;
  signal PS7_i_n_197 : STD_LOGIC;
  signal PS7_i_n_198 : STD_LOGIC;
  signal PS7_i_n_199 : STD_LOGIC;
  signal PS7_i_n_2 : STD_LOGIC;
  signal PS7_i_n_20 : STD_LOGIC;
  signal PS7_i_n_200 : STD_LOGIC;
  signal PS7_i_n_201 : STD_LOGIC;
  signal PS7_i_n_202 : STD_LOGIC;
  signal PS7_i_n_203 : STD_LOGIC;
  signal PS7_i_n_204 : STD_LOGIC;
  signal PS7_i_n_205 : STD_LOGIC;
  signal PS7_i_n_206 : STD_LOGIC;
  signal PS7_i_n_207 : STD_LOGIC;
  signal PS7_i_n_208 : STD_LOGIC;
  signal PS7_i_n_209 : STD_LOGIC;
  signal PS7_i_n_21 : STD_LOGIC;
  signal PS7_i_n_210 : STD_LOGIC;
  signal PS7_i_n_211 : STD_LOGIC;
  signal PS7_i_n_212 : STD_LOGIC;
  signal PS7_i_n_213 : STD_LOGIC;
  signal PS7_i_n_214 : STD_LOGIC;
  signal PS7_i_n_215 : STD_LOGIC;
  signal PS7_i_n_216 : STD_LOGIC;
  signal PS7_i_n_217 : STD_LOGIC;
  signal PS7_i_n_218 : STD_LOGIC;
  signal PS7_i_n_219 : STD_LOGIC;
  signal PS7_i_n_22 : STD_LOGIC;
  signal PS7_i_n_220 : STD_LOGIC;
  signal PS7_i_n_221 : STD_LOGIC;
  signal PS7_i_n_222 : STD_LOGIC;
  signal PS7_i_n_223 : STD_LOGIC;
  signal PS7_i_n_224 : STD_LOGIC;
  signal PS7_i_n_225 : STD_LOGIC;
  signal PS7_i_n_226 : STD_LOGIC;
  signal PS7_i_n_227 : STD_LOGIC;
  signal PS7_i_n_228 : STD_LOGIC;
  signal PS7_i_n_229 : STD_LOGIC;
  signal PS7_i_n_23 : STD_LOGIC;
  signal PS7_i_n_230 : STD_LOGIC;
  signal PS7_i_n_231 : STD_LOGIC;
  signal PS7_i_n_232 : STD_LOGIC;
  signal PS7_i_n_233 : STD_LOGIC;
  signal PS7_i_n_234 : STD_LOGIC;
  signal PS7_i_n_235 : STD_LOGIC;
  signal PS7_i_n_236 : STD_LOGIC;
  signal PS7_i_n_237 : STD_LOGIC;
  signal PS7_i_n_238 : STD_LOGIC;
  signal PS7_i_n_239 : STD_LOGIC;
  signal PS7_i_n_24 : STD_LOGIC;
  signal PS7_i_n_242 : STD_LOGIC;
  signal PS7_i_n_243 : STD_LOGIC;
  signal PS7_i_n_248 : STD_LOGIC;
  signal PS7_i_n_249 : STD_LOGIC;
  signal PS7_i_n_25 : STD_LOGIC;
  signal PS7_i_n_252 : STD_LOGIC;
  signal PS7_i_n_253 : STD_LOGIC;
  signal PS7_i_n_254 : STD_LOGIC;
  signal PS7_i_n_255 : STD_LOGIC;
  signal PS7_i_n_256 : STD_LOGIC;
  signal PS7_i_n_257 : STD_LOGIC;
  signal PS7_i_n_258 : STD_LOGIC;
  signal PS7_i_n_259 : STD_LOGIC;
  signal PS7_i_n_26 : STD_LOGIC;
  signal PS7_i_n_260 : STD_LOGIC;
  signal PS7_i_n_261 : STD_LOGIC;
  signal PS7_i_n_262 : STD_LOGIC;
  signal PS7_i_n_263 : STD_LOGIC;
  signal PS7_i_n_264 : STD_LOGIC;
  signal PS7_i_n_265 : STD_LOGIC;
  signal PS7_i_n_266 : STD_LOGIC;
  signal PS7_i_n_267 : STD_LOGIC;
  signal PS7_i_n_268 : STD_LOGIC;
  signal PS7_i_n_269 : STD_LOGIC;
  signal PS7_i_n_27 : STD_LOGIC;
  signal PS7_i_n_270 : STD_LOGIC;
  signal PS7_i_n_271 : STD_LOGIC;
  signal PS7_i_n_272 : STD_LOGIC;
  signal PS7_i_n_273 : STD_LOGIC;
  signal PS7_i_n_274 : STD_LOGIC;
  signal PS7_i_n_275 : STD_LOGIC;
  signal PS7_i_n_276 : STD_LOGIC;
  signal PS7_i_n_277 : STD_LOGIC;
  signal PS7_i_n_278 : STD_LOGIC;
  signal PS7_i_n_279 : STD_LOGIC;
  signal PS7_i_n_28 : STD_LOGIC;
  signal PS7_i_n_280 : STD_LOGIC;
  signal PS7_i_n_281 : STD_LOGIC;
  signal PS7_i_n_282 : STD_LOGIC;
  signal PS7_i_n_283 : STD_LOGIC;
  signal PS7_i_n_284 : STD_LOGIC;
  signal PS7_i_n_285 : STD_LOGIC;
  signal PS7_i_n_286 : STD_LOGIC;
  signal PS7_i_n_287 : STD_LOGIC;
  signal PS7_i_n_288 : STD_LOGIC;
  signal PS7_i_n_289 : STD_LOGIC;
  signal PS7_i_n_290 : STD_LOGIC;
  signal PS7_i_n_291 : STD_LOGIC;
  signal PS7_i_n_292 : STD_LOGIC;
  signal PS7_i_n_293 : STD_LOGIC;
  signal PS7_i_n_294 : STD_LOGIC;
  signal PS7_i_n_295 : STD_LOGIC;
  signal PS7_i_n_296 : STD_LOGIC;
  signal PS7_i_n_297 : STD_LOGIC;
  signal PS7_i_n_298 : STD_LOGIC;
  signal PS7_i_n_299 : STD_LOGIC;
  signal PS7_i_n_3 : STD_LOGIC;
  signal PS7_i_n_300 : STD_LOGIC;
  signal PS7_i_n_301 : STD_LOGIC;
  signal PS7_i_n_302 : STD_LOGIC;
  signal PS7_i_n_303 : STD_LOGIC;
  signal PS7_i_n_304 : STD_LOGIC;
  signal PS7_i_n_305 : STD_LOGIC;
  signal PS7_i_n_306 : STD_LOGIC;
  signal PS7_i_n_307 : STD_LOGIC;
  signal PS7_i_n_308 : STD_LOGIC;
  signal PS7_i_n_309 : STD_LOGIC;
  signal PS7_i_n_31 : STD_LOGIC;
  signal PS7_i_n_310 : STD_LOGIC;
  signal PS7_i_n_311 : STD_LOGIC;
  signal PS7_i_n_312 : STD_LOGIC;
  signal PS7_i_n_313 : STD_LOGIC;
  signal PS7_i_n_314 : STD_LOGIC;
  signal PS7_i_n_315 : STD_LOGIC;
  signal PS7_i_n_316 : STD_LOGIC;
  signal PS7_i_n_317 : STD_LOGIC;
  signal PS7_i_n_318 : STD_LOGIC;
  signal PS7_i_n_319 : STD_LOGIC;
  signal PS7_i_n_32 : STD_LOGIC;
  signal PS7_i_n_320 : STD_LOGIC;
  signal PS7_i_n_321 : STD_LOGIC;
  signal PS7_i_n_322 : STD_LOGIC;
  signal PS7_i_n_323 : STD_LOGIC;
  signal PS7_i_n_324 : STD_LOGIC;
  signal PS7_i_n_325 : STD_LOGIC;
  signal PS7_i_n_326 : STD_LOGIC;
  signal PS7_i_n_327 : STD_LOGIC;
  signal PS7_i_n_328 : STD_LOGIC;
  signal PS7_i_n_329 : STD_LOGIC;
  signal PS7_i_n_330 : STD_LOGIC;
  signal PS7_i_n_331 : STD_LOGIC;
  signal PS7_i_n_332 : STD_LOGIC;
  signal PS7_i_n_333 : STD_LOGIC;
  signal PS7_i_n_334 : STD_LOGIC;
  signal PS7_i_n_335 : STD_LOGIC;
  signal PS7_i_n_336 : STD_LOGIC;
  signal PS7_i_n_337 : STD_LOGIC;
  signal PS7_i_n_338 : STD_LOGIC;
  signal PS7_i_n_34 : STD_LOGIC;
  signal PS7_i_n_345 : STD_LOGIC;
  signal PS7_i_n_346 : STD_LOGIC;
  signal PS7_i_n_347 : STD_LOGIC;
  signal PS7_i_n_348 : STD_LOGIC;
  signal PS7_i_n_349 : STD_LOGIC;
  signal PS7_i_n_35 : STD_LOGIC;
  signal PS7_i_n_350 : STD_LOGIC;
  signal PS7_i_n_351 : STD_LOGIC;
  signal PS7_i_n_352 : STD_LOGIC;
  signal PS7_i_n_353 : STD_LOGIC;
  signal PS7_i_n_354 : STD_LOGIC;
  signal PS7_i_n_355 : STD_LOGIC;
  signal PS7_i_n_356 : STD_LOGIC;
  signal PS7_i_n_357 : STD_LOGIC;
  signal PS7_i_n_358 : STD_LOGIC;
  signal PS7_i_n_359 : STD_LOGIC;
  signal PS7_i_n_36 : STD_LOGIC;
  signal PS7_i_n_360 : STD_LOGIC;
  signal PS7_i_n_361 : STD_LOGIC;
  signal PS7_i_n_362 : STD_LOGIC;
  signal PS7_i_n_363 : STD_LOGIC;
  signal PS7_i_n_364 : STD_LOGIC;
  signal PS7_i_n_365 : STD_LOGIC;
  signal PS7_i_n_366 : STD_LOGIC;
  signal PS7_i_n_367 : STD_LOGIC;
  signal PS7_i_n_368 : STD_LOGIC;
  signal PS7_i_n_37 : STD_LOGIC;
  signal PS7_i_n_38 : STD_LOGIC;
  signal PS7_i_n_39 : STD_LOGIC;
  signal PS7_i_n_4 : STD_LOGIC;
  signal PS7_i_n_40 : STD_LOGIC;
  signal PS7_i_n_401 : STD_LOGIC;
  signal PS7_i_n_402 : STD_LOGIC;
  signal PS7_i_n_403 : STD_LOGIC;
  signal PS7_i_n_404 : STD_LOGIC;
  signal PS7_i_n_405 : STD_LOGIC;
  signal PS7_i_n_406 : STD_LOGIC;
  signal PS7_i_n_407 : STD_LOGIC;
  signal PS7_i_n_408 : STD_LOGIC;
  signal PS7_i_n_409 : STD_LOGIC;
  signal PS7_i_n_41 : STD_LOGIC;
  signal PS7_i_n_410 : STD_LOGIC;
  signal PS7_i_n_411 : STD_LOGIC;
  signal PS7_i_n_412 : STD_LOGIC;
  signal PS7_i_n_413 : STD_LOGIC;
  signal PS7_i_n_414 : STD_LOGIC;
  signal PS7_i_n_415 : STD_LOGIC;
  signal PS7_i_n_416 : STD_LOGIC;
  signal PS7_i_n_417 : STD_LOGIC;
  signal PS7_i_n_418 : STD_LOGIC;
  signal PS7_i_n_419 : STD_LOGIC;
  signal PS7_i_n_42 : STD_LOGIC;
  signal PS7_i_n_420 : STD_LOGIC;
  signal PS7_i_n_421 : STD_LOGIC;
  signal PS7_i_n_422 : STD_LOGIC;
  signal PS7_i_n_423 : STD_LOGIC;
  signal PS7_i_n_424 : STD_LOGIC;
  signal PS7_i_n_425 : STD_LOGIC;
  signal PS7_i_n_426 : STD_LOGIC;
  signal PS7_i_n_427 : STD_LOGIC;
  signal PS7_i_n_428 : STD_LOGIC;
  signal PS7_i_n_429 : STD_LOGIC;
  signal PS7_i_n_43 : STD_LOGIC;
  signal PS7_i_n_430 : STD_LOGIC;
  signal PS7_i_n_431 : STD_LOGIC;
  signal PS7_i_n_432 : STD_LOGIC;
  signal PS7_i_n_44 : STD_LOGIC;
  signal PS7_i_n_46 : STD_LOGIC;
  signal PS7_i_n_48 : STD_LOGIC;
  signal PS7_i_n_5 : STD_LOGIC;
  signal PS7_i_n_50 : STD_LOGIC;
  signal PS7_i_n_529 : STD_LOGIC;
  signal PS7_i_n_530 : STD_LOGIC;
  signal PS7_i_n_531 : STD_LOGIC;
  signal PS7_i_n_532 : STD_LOGIC;
  signal PS7_i_n_533 : STD_LOGIC;
  signal PS7_i_n_534 : STD_LOGIC;
  signal PS7_i_n_535 : STD_LOGIC;
  signal PS7_i_n_536 : STD_LOGIC;
  signal PS7_i_n_537 : STD_LOGIC;
  signal PS7_i_n_538 : STD_LOGIC;
  signal PS7_i_n_539 : STD_LOGIC;
  signal PS7_i_n_54 : STD_LOGIC;
  signal PS7_i_n_540 : STD_LOGIC;
  signal PS7_i_n_541 : STD_LOGIC;
  signal PS7_i_n_542 : STD_LOGIC;
  signal PS7_i_n_543 : STD_LOGIC;
  signal PS7_i_n_544 : STD_LOGIC;
  signal PS7_i_n_545 : STD_LOGIC;
  signal PS7_i_n_546 : STD_LOGIC;
  signal PS7_i_n_547 : STD_LOGIC;
  signal PS7_i_n_548 : STD_LOGIC;
  signal PS7_i_n_549 : STD_LOGIC;
  signal PS7_i_n_55 : STD_LOGIC;
  signal PS7_i_n_550 : STD_LOGIC;
  signal PS7_i_n_551 : STD_LOGIC;
  signal PS7_i_n_552 : STD_LOGIC;
  signal PS7_i_n_553 : STD_LOGIC;
  signal PS7_i_n_554 : STD_LOGIC;
  signal PS7_i_n_555 : STD_LOGIC;
  signal PS7_i_n_556 : STD_LOGIC;
  signal PS7_i_n_557 : STD_LOGIC;
  signal PS7_i_n_558 : STD_LOGIC;
  signal PS7_i_n_559 : STD_LOGIC;
  signal PS7_i_n_56 : STD_LOGIC;
  signal PS7_i_n_560 : STD_LOGIC;
  signal PS7_i_n_561 : STD_LOGIC;
  signal PS7_i_n_562 : STD_LOGIC;
  signal PS7_i_n_563 : STD_LOGIC;
  signal PS7_i_n_564 : STD_LOGIC;
  signal PS7_i_n_565 : STD_LOGIC;
  signal PS7_i_n_566 : STD_LOGIC;
  signal PS7_i_n_567 : STD_LOGIC;
  signal PS7_i_n_568 : STD_LOGIC;
  signal PS7_i_n_569 : STD_LOGIC;
  signal PS7_i_n_570 : STD_LOGIC;
  signal PS7_i_n_571 : STD_LOGIC;
  signal PS7_i_n_572 : STD_LOGIC;
  signal PS7_i_n_573 : STD_LOGIC;
  signal PS7_i_n_574 : STD_LOGIC;
  signal PS7_i_n_575 : STD_LOGIC;
  signal PS7_i_n_576 : STD_LOGIC;
  signal PS7_i_n_577 : STD_LOGIC;
  signal PS7_i_n_578 : STD_LOGIC;
  signal PS7_i_n_579 : STD_LOGIC;
  signal PS7_i_n_58 : STD_LOGIC;
  signal PS7_i_n_580 : STD_LOGIC;
  signal PS7_i_n_581 : STD_LOGIC;
  signal PS7_i_n_582 : STD_LOGIC;
  signal PS7_i_n_583 : STD_LOGIC;
  signal PS7_i_n_584 : STD_LOGIC;
  signal PS7_i_n_585 : STD_LOGIC;
  signal PS7_i_n_586 : STD_LOGIC;
  signal PS7_i_n_587 : STD_LOGIC;
  signal PS7_i_n_588 : STD_LOGIC;
  signal PS7_i_n_589 : STD_LOGIC;
  signal PS7_i_n_59 : STD_LOGIC;
  signal PS7_i_n_590 : STD_LOGIC;
  signal PS7_i_n_591 : STD_LOGIC;
  signal PS7_i_n_592 : STD_LOGIC;
  signal PS7_i_n_593 : STD_LOGIC;
  signal PS7_i_n_594 : STD_LOGIC;
  signal PS7_i_n_595 : STD_LOGIC;
  signal PS7_i_n_596 : STD_LOGIC;
  signal PS7_i_n_597 : STD_LOGIC;
  signal PS7_i_n_598 : STD_LOGIC;
  signal PS7_i_n_599 : STD_LOGIC;
  signal PS7_i_n_6 : STD_LOGIC;
  signal PS7_i_n_60 : STD_LOGIC;
  signal PS7_i_n_600 : STD_LOGIC;
  signal PS7_i_n_601 : STD_LOGIC;
  signal PS7_i_n_602 : STD_LOGIC;
  signal PS7_i_n_603 : STD_LOGIC;
  signal PS7_i_n_604 : STD_LOGIC;
  signal PS7_i_n_605 : STD_LOGIC;
  signal PS7_i_n_606 : STD_LOGIC;
  signal PS7_i_n_607 : STD_LOGIC;
  signal PS7_i_n_608 : STD_LOGIC;
  signal PS7_i_n_609 : STD_LOGIC;
  signal PS7_i_n_61 : STD_LOGIC;
  signal PS7_i_n_610 : STD_LOGIC;
  signal PS7_i_n_611 : STD_LOGIC;
  signal PS7_i_n_612 : STD_LOGIC;
  signal PS7_i_n_613 : STD_LOGIC;
  signal PS7_i_n_614 : STD_LOGIC;
  signal PS7_i_n_615 : STD_LOGIC;
  signal PS7_i_n_616 : STD_LOGIC;
  signal PS7_i_n_617 : STD_LOGIC;
  signal PS7_i_n_618 : STD_LOGIC;
  signal PS7_i_n_619 : STD_LOGIC;
  signal PS7_i_n_620 : STD_LOGIC;
  signal PS7_i_n_621 : STD_LOGIC;
  signal PS7_i_n_622 : STD_LOGIC;
  signal PS7_i_n_623 : STD_LOGIC;
  signal PS7_i_n_624 : STD_LOGIC;
  signal PS7_i_n_625 : STD_LOGIC;
  signal PS7_i_n_626 : STD_LOGIC;
  signal PS7_i_n_627 : STD_LOGIC;
  signal PS7_i_n_628 : STD_LOGIC;
  signal PS7_i_n_629 : STD_LOGIC;
  signal PS7_i_n_63 : STD_LOGIC;
  signal PS7_i_n_630 : STD_LOGIC;
  signal PS7_i_n_631 : STD_LOGIC;
  signal PS7_i_n_632 : STD_LOGIC;
  signal PS7_i_n_633 : STD_LOGIC;
  signal PS7_i_n_634 : STD_LOGIC;
  signal PS7_i_n_635 : STD_LOGIC;
  signal PS7_i_n_636 : STD_LOGIC;
  signal PS7_i_n_637 : STD_LOGIC;
  signal PS7_i_n_638 : STD_LOGIC;
  signal PS7_i_n_639 : STD_LOGIC;
  signal PS7_i_n_64 : STD_LOGIC;
  signal PS7_i_n_640 : STD_LOGIC;
  signal PS7_i_n_641 : STD_LOGIC;
  signal PS7_i_n_642 : STD_LOGIC;
  signal PS7_i_n_643 : STD_LOGIC;
  signal PS7_i_n_644 : STD_LOGIC;
  signal PS7_i_n_645 : STD_LOGIC;
  signal PS7_i_n_646 : STD_LOGIC;
  signal PS7_i_n_647 : STD_LOGIC;
  signal PS7_i_n_648 : STD_LOGIC;
  signal PS7_i_n_649 : STD_LOGIC;
  signal PS7_i_n_650 : STD_LOGIC;
  signal PS7_i_n_651 : STD_LOGIC;
  signal PS7_i_n_652 : STD_LOGIC;
  signal PS7_i_n_653 : STD_LOGIC;
  signal PS7_i_n_654 : STD_LOGIC;
  signal PS7_i_n_655 : STD_LOGIC;
  signal PS7_i_n_656 : STD_LOGIC;
  signal PS7_i_n_657 : STD_LOGIC;
  signal PS7_i_n_658 : STD_LOGIC;
  signal PS7_i_n_659 : STD_LOGIC;
  signal PS7_i_n_66 : STD_LOGIC;
  signal PS7_i_n_660 : STD_LOGIC;
  signal PS7_i_n_661 : STD_LOGIC;
  signal PS7_i_n_662 : STD_LOGIC;
  signal PS7_i_n_663 : STD_LOGIC;
  signal PS7_i_n_664 : STD_LOGIC;
  signal PS7_i_n_665 : STD_LOGIC;
  signal PS7_i_n_666 : STD_LOGIC;
  signal PS7_i_n_667 : STD_LOGIC;
  signal PS7_i_n_668 : STD_LOGIC;
  signal PS7_i_n_669 : STD_LOGIC;
  signal PS7_i_n_670 : STD_LOGIC;
  signal PS7_i_n_671 : STD_LOGIC;
  signal PS7_i_n_672 : STD_LOGIC;
  signal PS7_i_n_673 : STD_LOGIC;
  signal PS7_i_n_674 : STD_LOGIC;
  signal PS7_i_n_675 : STD_LOGIC;
  signal PS7_i_n_676 : STD_LOGIC;
  signal PS7_i_n_677 : STD_LOGIC;
  signal PS7_i_n_678 : STD_LOGIC;
  signal PS7_i_n_679 : STD_LOGIC;
  signal PS7_i_n_68 : STD_LOGIC;
  signal PS7_i_n_680 : STD_LOGIC;
  signal PS7_i_n_681 : STD_LOGIC;
  signal PS7_i_n_682 : STD_LOGIC;
  signal PS7_i_n_683 : STD_LOGIC;
  signal PS7_i_n_684 : STD_LOGIC;
  signal PS7_i_n_685 : STD_LOGIC;
  signal PS7_i_n_686 : STD_LOGIC;
  signal PS7_i_n_687 : STD_LOGIC;
  signal PS7_i_n_688 : STD_LOGIC;
  signal PS7_i_n_689 : STD_LOGIC;
  signal PS7_i_n_690 : STD_LOGIC;
  signal PS7_i_n_691 : STD_LOGIC;
  signal PS7_i_n_692 : STD_LOGIC;
  signal PS7_i_n_697 : STD_LOGIC;
  signal PS7_i_n_698 : STD_LOGIC;
  signal PS7_i_n_699 : STD_LOGIC;
  signal PS7_i_n_7 : STD_LOGIC;
  signal PS7_i_n_700 : STD_LOGIC;
  signal PS7_i_n_705 : STD_LOGIC;
  signal PS7_i_n_706 : STD_LOGIC;
  signal PS7_i_n_709 : STD_LOGIC;
  signal PS7_i_n_71 : STD_LOGIC;
  signal PS7_i_n_710 : STD_LOGIC;
  signal PS7_i_n_711 : STD_LOGIC;
  signal PS7_i_n_713 : STD_LOGIC;
  signal PS7_i_n_714 : STD_LOGIC;
  signal PS7_i_n_715 : STD_LOGIC;
  signal PS7_i_n_716 : STD_LOGIC;
  signal PS7_i_n_717 : STD_LOGIC;
  signal PS7_i_n_718 : STD_LOGIC;
  signal PS7_i_n_719 : STD_LOGIC;
  signal PS7_i_n_720 : STD_LOGIC;
  signal PS7_i_n_721 : STD_LOGIC;
  signal PS7_i_n_722 : STD_LOGIC;
  signal PS7_i_n_724 : STD_LOGIC;
  signal PS7_i_n_729 : STD_LOGIC;
  signal PS7_i_n_73 : STD_LOGIC;
  signal PS7_i_n_730 : STD_LOGIC;
  signal PS7_i_n_731 : STD_LOGIC;
  signal PS7_i_n_732 : STD_LOGIC;
  signal PS7_i_n_733 : STD_LOGIC;
  signal PS7_i_n_734 : STD_LOGIC;
  signal PS7_i_n_736 : STD_LOGIC;
  signal PS7_i_n_741 : STD_LOGIC;
  signal PS7_i_n_742 : STD_LOGIC;
  signal PS7_i_n_743 : STD_LOGIC;
  signal PS7_i_n_744 : STD_LOGIC;
  signal PS7_i_n_749 : STD_LOGIC;
  signal PS7_i_n_75 : STD_LOGIC;
  signal PS7_i_n_750 : STD_LOGIC;
  signal PS7_i_n_752 : STD_LOGIC;
  signal PS7_i_n_753 : STD_LOGIC;
  signal PS7_i_n_754 : STD_LOGIC;
  signal PS7_i_n_755 : STD_LOGIC;
  signal PS7_i_n_756 : STD_LOGIC;
  signal PS7_i_n_757 : STD_LOGIC;
  signal PS7_i_n_758 : STD_LOGIC;
  signal PS7_i_n_759 : STD_LOGIC;
  signal PS7_i_n_760 : STD_LOGIC;
  signal PS7_i_n_761 : STD_LOGIC;
  signal PS7_i_n_762 : STD_LOGIC;
  signal PS7_i_n_764 : STD_LOGIC;
  signal PS7_i_n_765 : STD_LOGIC;
  signal PS7_i_n_766 : STD_LOGIC;
  signal PS7_i_n_767 : STD_LOGIC;
  signal PS7_i_n_768 : STD_LOGIC;
  signal PS7_i_n_769 : STD_LOGIC;
  signal PS7_i_n_770 : STD_LOGIC;
  signal PS7_i_n_771 : STD_LOGIC;
  signal PS7_i_n_772 : STD_LOGIC;
  signal PS7_i_n_773 : STD_LOGIC;
  signal PS7_i_n_774 : STD_LOGIC;
  signal PS7_i_n_775 : STD_LOGIC;
  signal PS7_i_n_776 : STD_LOGIC;
  signal PS7_i_n_777 : STD_LOGIC;
  signal PS7_i_n_778 : STD_LOGIC;
  signal PS7_i_n_779 : STD_LOGIC;
  signal PS7_i_n_780 : STD_LOGIC;
  signal PS7_i_n_781 : STD_LOGIC;
  signal PS7_i_n_782 : STD_LOGIC;
  signal PS7_i_n_783 : STD_LOGIC;
  signal PS7_i_n_784 : STD_LOGIC;
  signal PS7_i_n_785 : STD_LOGIC;
  signal PS7_i_n_786 : STD_LOGIC;
  signal PS7_i_n_787 : STD_LOGIC;
  signal PS7_i_n_788 : STD_LOGIC;
  signal PS7_i_n_789 : STD_LOGIC;
  signal PS7_i_n_79 : STD_LOGIC;
  signal PS7_i_n_790 : STD_LOGIC;
  signal PS7_i_n_791 : STD_LOGIC;
  signal PS7_i_n_792 : STD_LOGIC;
  signal PS7_i_n_793 : STD_LOGIC;
  signal PS7_i_n_794 : STD_LOGIC;
  signal PS7_i_n_795 : STD_LOGIC;
  signal PS7_i_n_796 : STD_LOGIC;
  signal PS7_i_n_797 : STD_LOGIC;
  signal PS7_i_n_798 : STD_LOGIC;
  signal PS7_i_n_799 : STD_LOGIC;
  signal PS7_i_n_8 : STD_LOGIC;
  signal PS7_i_n_80 : STD_LOGIC;
  signal PS7_i_n_800 : STD_LOGIC;
  signal PS7_i_n_801 : STD_LOGIC;
  signal PS7_i_n_802 : STD_LOGIC;
  signal PS7_i_n_803 : STD_LOGIC;
  signal PS7_i_n_804 : STD_LOGIC;
  signal PS7_i_n_805 : STD_LOGIC;
  signal PS7_i_n_806 : STD_LOGIC;
  signal PS7_i_n_807 : STD_LOGIC;
  signal PS7_i_n_808 : STD_LOGIC;
  signal PS7_i_n_809 : STD_LOGIC;
  signal PS7_i_n_81 : STD_LOGIC;
  signal PS7_i_n_810 : STD_LOGIC;
  signal PS7_i_n_811 : STD_LOGIC;
  signal PS7_i_n_812 : STD_LOGIC;
  signal PS7_i_n_813 : STD_LOGIC;
  signal PS7_i_n_814 : STD_LOGIC;
  signal PS7_i_n_815 : STD_LOGIC;
  signal PS7_i_n_816 : STD_LOGIC;
  signal PS7_i_n_817 : STD_LOGIC;
  signal PS7_i_n_818 : STD_LOGIC;
  signal PS7_i_n_819 : STD_LOGIC;
  signal PS7_i_n_82 : STD_LOGIC;
  signal PS7_i_n_820 : STD_LOGIC;
  signal PS7_i_n_821 : STD_LOGIC;
  signal PS7_i_n_822 : STD_LOGIC;
  signal PS7_i_n_823 : STD_LOGIC;
  signal PS7_i_n_824 : STD_LOGIC;
  signal PS7_i_n_825 : STD_LOGIC;
  signal PS7_i_n_826 : STD_LOGIC;
  signal PS7_i_n_827 : STD_LOGIC;
  signal PS7_i_n_828 : STD_LOGIC;
  signal PS7_i_n_829 : STD_LOGIC;
  signal PS7_i_n_83 : STD_LOGIC;
  signal PS7_i_n_830 : STD_LOGIC;
  signal PS7_i_n_831 : STD_LOGIC;
  signal PS7_i_n_832 : STD_LOGIC;
  signal PS7_i_n_833 : STD_LOGIC;
  signal PS7_i_n_834 : STD_LOGIC;
  signal PS7_i_n_835 : STD_LOGIC;
  signal PS7_i_n_836 : STD_LOGIC;
  signal PS7_i_n_837 : STD_LOGIC;
  signal PS7_i_n_838 : STD_LOGIC;
  signal PS7_i_n_839 : STD_LOGIC;
  signal PS7_i_n_84 : STD_LOGIC;
  signal PS7_i_n_840 : STD_LOGIC;
  signal PS7_i_n_841 : STD_LOGIC;
  signal PS7_i_n_842 : STD_LOGIC;
  signal PS7_i_n_843 : STD_LOGIC;
  signal PS7_i_n_844 : STD_LOGIC;
  signal PS7_i_n_845 : STD_LOGIC;
  signal PS7_i_n_846 : STD_LOGIC;
  signal PS7_i_n_847 : STD_LOGIC;
  signal PS7_i_n_848 : STD_LOGIC;
  signal PS7_i_n_849 : STD_LOGIC;
  signal PS7_i_n_85 : STD_LOGIC;
  signal PS7_i_n_850 : STD_LOGIC;
  signal PS7_i_n_851 : STD_LOGIC;
  signal PS7_i_n_852 : STD_LOGIC;
  signal PS7_i_n_853 : STD_LOGIC;
  signal PS7_i_n_854 : STD_LOGIC;
  signal PS7_i_n_855 : STD_LOGIC;
  signal PS7_i_n_856 : STD_LOGIC;
  signal PS7_i_n_857 : STD_LOGIC;
  signal PS7_i_n_858 : STD_LOGIC;
  signal PS7_i_n_859 : STD_LOGIC;
  signal PS7_i_n_86 : STD_LOGIC;
  signal PS7_i_n_860 : STD_LOGIC;
  signal PS7_i_n_861 : STD_LOGIC;
  signal PS7_i_n_862 : STD_LOGIC;
  signal PS7_i_n_863 : STD_LOGIC;
  signal PS7_i_n_864 : STD_LOGIC;
  signal PS7_i_n_865 : STD_LOGIC;
  signal PS7_i_n_866 : STD_LOGIC;
  signal PS7_i_n_867 : STD_LOGIC;
  signal PS7_i_n_868 : STD_LOGIC;
  signal PS7_i_n_869 : STD_LOGIC;
  signal PS7_i_n_87 : STD_LOGIC;
  signal PS7_i_n_870 : STD_LOGIC;
  signal PS7_i_n_871 : STD_LOGIC;
  signal PS7_i_n_872 : STD_LOGIC;
  signal PS7_i_n_873 : STD_LOGIC;
  signal PS7_i_n_874 : STD_LOGIC;
  signal PS7_i_n_875 : STD_LOGIC;
  signal PS7_i_n_876 : STD_LOGIC;
  signal PS7_i_n_877 : STD_LOGIC;
  signal PS7_i_n_878 : STD_LOGIC;
  signal PS7_i_n_879 : STD_LOGIC;
  signal PS7_i_n_88 : STD_LOGIC;
  signal PS7_i_n_880 : STD_LOGIC;
  signal PS7_i_n_881 : STD_LOGIC;
  signal PS7_i_n_882 : STD_LOGIC;
  signal PS7_i_n_883 : STD_LOGIC;
  signal PS7_i_n_884 : STD_LOGIC;
  signal PS7_i_n_885 : STD_LOGIC;
  signal PS7_i_n_886 : STD_LOGIC;
  signal PS7_i_n_887 : STD_LOGIC;
  signal PS7_i_n_888 : STD_LOGIC;
  signal PS7_i_n_889 : STD_LOGIC;
  signal PS7_i_n_89 : STD_LOGIC;
  signal PS7_i_n_890 : STD_LOGIC;
  signal PS7_i_n_891 : STD_LOGIC;
  signal PS7_i_n_892 : STD_LOGIC;
  signal PS7_i_n_893 : STD_LOGIC;
  signal PS7_i_n_894 : STD_LOGIC;
  signal PS7_i_n_895 : STD_LOGIC;
  signal PS7_i_n_896 : STD_LOGIC;
  signal PS7_i_n_897 : STD_LOGIC;
  signal PS7_i_n_898 : STD_LOGIC;
  signal PS7_i_n_899 : STD_LOGIC;
  signal PS7_i_n_9 : STD_LOGIC;
  signal PS7_i_n_900 : STD_LOGIC;
  signal PS7_i_n_901 : STD_LOGIC;
  signal PS7_i_n_902 : STD_LOGIC;
  signal PS7_i_n_903 : STD_LOGIC;
  signal PS7_i_n_904 : STD_LOGIC;
  signal PS7_i_n_905 : STD_LOGIC;
  signal PS7_i_n_906 : STD_LOGIC;
  signal PS7_i_n_907 : STD_LOGIC;
  signal PS7_i_n_908 : STD_LOGIC;
  signal PS7_i_n_909 : STD_LOGIC;
  signal PS7_i_n_910 : STD_LOGIC;
  signal PS7_i_n_911 : STD_LOGIC;
  signal PS7_i_n_912 : STD_LOGIC;
  signal PS7_i_n_913 : STD_LOGIC;
  signal PS7_i_n_914 : STD_LOGIC;
  signal PS7_i_n_915 : STD_LOGIC;
  signal PS7_i_n_916 : STD_LOGIC;
  signal PS7_i_n_917 : STD_LOGIC;
  signal PS7_i_n_918 : STD_LOGIC;
  signal PS7_i_n_919 : STD_LOGIC;
  signal PS7_i_n_920 : STD_LOGIC;
  signal PS7_i_n_921 : STD_LOGIC;
  signal PS7_i_n_922 : STD_LOGIC;
  signal PS7_i_n_923 : STD_LOGIC;
  signal PS7_i_n_924 : STD_LOGIC;
  signal PS7_i_n_925 : STD_LOGIC;
  signal PS7_i_n_926 : STD_LOGIC;
  signal PS7_i_n_927 : STD_LOGIC;
  signal PS7_i_n_928 : STD_LOGIC;
  signal PS7_i_n_929 : STD_LOGIC;
  signal PS7_i_n_930 : STD_LOGIC;
  signal PS7_i_n_931 : STD_LOGIC;
  signal PS7_i_n_932 : STD_LOGIC;
  signal PS7_i_n_933 : STD_LOGIC;
  signal PS7_i_n_934 : STD_LOGIC;
  signal PS7_i_n_935 : STD_LOGIC;
  signal PS7_i_n_936 : STD_LOGIC;
  signal PS7_i_n_94 : STD_LOGIC;
  signal PS7_i_n_96 : STD_LOGIC;
  signal PS7_i_n_97 : STD_LOGIC;
  signal PS7_i_n_98 : STD_LOGIC;
  signal PS7_i_n_99 : STD_LOGIC;
  signal SDIO0_CMD_T_n : STD_LOGIC;
  signal SDIO0_DATA_T_n : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal SDIO1_CMD_T_n : STD_LOGIC;
  signal SDIO1_DATA_T_n : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal SPI0_MISO_T_n : STD_LOGIC;
  signal SPI0_MOSI_T_n : STD_LOGIC;
  signal SPI0_SCLK_T_n : STD_LOGIC;
  signal SPI0_SS_T_n : STD_LOGIC;
  signal SPI1_MISO_T_n : STD_LOGIC;
  signal SPI1_MOSI_T_n : STD_LOGIC;
  signal SPI1_SCLK_T_n : STD_LOGIC;
  signal SPI1_SS_T_n : STD_LOGIC;
  signal \TRACE_CTL_PIPE[0]\ : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \TRACE_CTL_PIPE[0]\ : signal is "true";
  signal \TRACE_CTL_PIPE[1]\ : STD_LOGIC;
  attribute RTL_KEEP of \TRACE_CTL_PIPE[1]\ : signal is "true";
  signal \TRACE_CTL_PIPE[2]\ : STD_LOGIC;
  attribute RTL_KEEP of \TRACE_CTL_PIPE[2]\ : signal is "true";
  signal \TRACE_CTL_PIPE[3]\ : STD_LOGIC;
  attribute RTL_KEEP of \TRACE_CTL_PIPE[3]\ : signal is "true";
  signal \TRACE_CTL_PIPE[4]\ : STD_LOGIC;
  attribute RTL_KEEP of \TRACE_CTL_PIPE[4]\ : signal is "true";
  signal \TRACE_CTL_PIPE[5]\ : STD_LOGIC;
  attribute RTL_KEEP of \TRACE_CTL_PIPE[5]\ : signal is "true";
  signal \TRACE_CTL_PIPE[6]\ : STD_LOGIC;
  attribute RTL_KEEP of \TRACE_CTL_PIPE[6]\ : signal is "true";
  signal \TRACE_CTL_PIPE[7]\ : STD_LOGIC;
  attribute RTL_KEEP of \TRACE_CTL_PIPE[7]\ : signal is "true";
  signal \TRACE_DATA_PIPE[0]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \TRACE_DATA_PIPE[0]\ : signal is "true";
  signal \TRACE_DATA_PIPE[1]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \TRACE_DATA_PIPE[1]\ : signal is "true";
  signal \TRACE_DATA_PIPE[2]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \TRACE_DATA_PIPE[2]\ : signal is "true";
  signal \TRACE_DATA_PIPE[3]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \TRACE_DATA_PIPE[3]\ : signal is "true";
  signal \TRACE_DATA_PIPE[4]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \TRACE_DATA_PIPE[4]\ : signal is "true";
  signal \TRACE_DATA_PIPE[5]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \TRACE_DATA_PIPE[5]\ : signal is "true";
  signal \TRACE_DATA_PIPE[6]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \TRACE_DATA_PIPE[6]\ : signal is "true";
  signal \TRACE_DATA_PIPE[7]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \TRACE_DATA_PIPE[7]\ : signal is "true";
  signal buffered_DDR_Addr : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal buffered_DDR_BankAddr : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal buffered_DDR_CAS_n : STD_LOGIC;
  signal buffered_DDR_CKE : STD_LOGIC;
  signal buffered_DDR_CS_n : STD_LOGIC;
  signal buffered_DDR_Clk : STD_LOGIC;
  signal buffered_DDR_Clk_n : STD_LOGIC;
  signal buffered_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal buffered_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal buffered_DDR_DQS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal buffered_DDR_DQS_n : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal buffered_DDR_DRSTB : STD_LOGIC;
  signal buffered_DDR_ODT : STD_LOGIC;
  signal buffered_DDR_RAS_n : STD_LOGIC;
  signal buffered_DDR_VRN : STD_LOGIC;
  signal buffered_DDR_VRP : STD_LOGIC;
  signal buffered_DDR_WEB : STD_LOGIC;
  signal buffered_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal buffered_PS_CLK : STD_LOGIC;
  signal buffered_PS_PORB : STD_LOGIC;
  signal buffered_PS_SRSTB : STD_LOGIC;
  signal gpio_out_t_n : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_PS7_i_EMIOENET0GMIITXEN_UNCONNECTED : STD_LOGIC;
  signal NLW_PS7_i_EMIOENET0GMIITXER_UNCONNECTED : STD_LOGIC;
  signal NLW_PS7_i_EMIOENET1GMIITXEN_UNCONNECTED : STD_LOGIC;
  signal NLW_PS7_i_EMIOENET1GMIITXER_UNCONNECTED : STD_LOGIC;
  signal NLW_PS7_i_EMIOPJTAGTDO_UNCONNECTED : STD_LOGIC;
  signal NLW_PS7_i_EMIOPJTAGTDTN_UNCONNECTED : STD_LOGIC;
  signal NLW_PS7_i_EMIOTRACECTL_UNCONNECTED : STD_LOGIC;
  signal NLW_PS7_i_EMIOENET0GMIITXD_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_PS7_i_EMIOENET1GMIITXD_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_PS7_i_EMIOTRACEDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_PS7_i_MAXIGP0ARCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_PS7_i_MAXIGP0AWCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_PS7_i_MAXIGP1ARCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_PS7_i_MAXIGP1AWCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of DDR_CAS_n_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of DDR_CKE_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of DDR_CS_n_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of DDR_Clk_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of DDR_Clk_n_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of DDR_DRSTB_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of DDR_ODT_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of DDR_RAS_n_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of DDR_VRN_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of DDR_VRP_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of DDR_WEB_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of PS7_i : label is "PRIMITIVE";
  attribute BOX_TYPE of PS_CLK_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of PS_PORB_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of PS_SRSTB_BIBUF : label is "PRIMITIVE";
  attribute BOX_TYPE of \buffer_fclk_clk_0.FCLK_CLK_0_BUFG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \buffer_fclk_clk_1.FCLK_CLK_1_BUFG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[0].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[10].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[11].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[12].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[13].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[14].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[15].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[16].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[17].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[18].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[19].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[1].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[20].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[21].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[22].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[23].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[24].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[25].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[26].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[27].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[28].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[29].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[2].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[30].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[31].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[32].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[33].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[34].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[35].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[36].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[37].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[38].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[39].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[3].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[40].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[41].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[42].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[43].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[44].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[45].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[46].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[47].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[48].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[49].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[4].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[50].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[51].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[52].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[53].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[5].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[6].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[7].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[8].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk13[9].MIO_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk14[0].DDR_BankAddr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk14[1].DDR_BankAddr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk14[2].DDR_BankAddr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[0].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[10].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[11].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[12].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[13].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[14].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[1].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[2].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[3].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[4].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[5].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[6].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[7].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[8].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk15[9].DDR_Addr_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk16[0].DDR_DM_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk16[1].DDR_DM_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk16[2].DDR_DM_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk16[3].DDR_DM_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[0].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[10].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[11].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[12].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[13].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[14].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[15].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[16].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[17].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[18].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[19].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[1].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[20].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[21].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[22].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[23].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[24].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[25].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[26].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[27].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[28].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[29].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[2].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[30].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[31].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[3].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[4].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[5].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[6].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[7].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[8].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk17[9].DDR_DQ_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk18[0].DDR_DQS_n_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk18[1].DDR_DQS_n_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk18[2].DDR_DQS_n_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk18[3].DDR_DQS_n_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk19[0].DDR_DQS_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk19[1].DDR_DQS_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk19[2].DDR_DQS_BIBUF\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk19[3].DDR_DQS_BIBUF\ : label is "PRIMITIVE";
begin
  CAN0_PHY_TX <= \<const0>\;
  CAN1_PHY_TX <= \<const0>\;
  DMA0_DATYPE(1) <= \<const0>\;
  DMA0_DATYPE(0) <= \<const0>\;
  DMA0_DAVALID <= \<const0>\;
  DMA0_DRREADY <= \<const0>\;
  DMA0_RSTN <= \<const0>\;
  DMA1_DATYPE(1) <= \<const0>\;
  DMA1_DATYPE(0) <= \<const0>\;
  DMA1_DAVALID <= \<const0>\;
  DMA1_DRREADY <= \<const0>\;
  DMA1_RSTN <= \<const0>\;
  DMA2_DATYPE(1) <= \<const0>\;
  DMA2_DATYPE(0) <= \<const0>\;
  DMA2_DAVALID <= \<const0>\;
  DMA2_DRREADY <= \<const0>\;
  DMA2_RSTN <= \<const0>\;
  DMA3_DATYPE(1) <= \<const0>\;
  DMA3_DATYPE(0) <= \<const0>\;
  DMA3_DAVALID <= \<const0>\;
  DMA3_DRREADY <= \<const0>\;
  DMA3_RSTN <= \<const0>\;
  ENET0_GMII_TXD(7) <= \<const0>\;
  ENET0_GMII_TXD(6) <= \<const0>\;
  ENET0_GMII_TXD(5) <= \<const0>\;
  ENET0_GMII_TXD(4) <= \<const0>\;
  ENET0_GMII_TXD(3) <= \<const0>\;
  ENET0_GMII_TXD(2) <= \<const0>\;
  ENET0_GMII_TXD(1) <= \<const0>\;
  ENET0_GMII_TXD(0) <= \<const0>\;
  ENET0_GMII_TX_EN <= \<const0>\;
  ENET0_GMII_TX_ER <= \<const0>\;
  ENET0_MDIO_MDC <= \<const0>\;
  ENET0_MDIO_O <= \<const0>\;
  ENET0_MDIO_T <= \<const0>\;
  ENET0_PTP_DELAY_REQ_RX <= \<const0>\;
  ENET0_PTP_DELAY_REQ_TX <= \<const0>\;
  ENET0_PTP_PDELAY_REQ_RX <= \<const0>\;
  ENET0_PTP_PDELAY_REQ_TX <= \<const0>\;
  ENET0_PTP_PDELAY_RESP_RX <= \<const0>\;
  ENET0_PTP_PDELAY_RESP_TX <= \<const0>\;
  ENET0_PTP_SYNC_FRAME_RX <= \<const0>\;
  ENET0_PTP_SYNC_FRAME_TX <= \<const0>\;
  ENET0_SOF_RX <= \<const0>\;
  ENET0_SOF_TX <= \<const0>\;
  ENET1_GMII_TXD(7) <= \<const0>\;
  ENET1_GMII_TXD(6) <= \<const0>\;
  ENET1_GMII_TXD(5) <= \<const0>\;
  ENET1_GMII_TXD(4) <= \<const0>\;
  ENET1_GMII_TXD(3) <= \<const0>\;
  ENET1_GMII_TXD(2) <= \<const0>\;
  ENET1_GMII_TXD(1) <= \<const0>\;
  ENET1_GMII_TXD(0) <= \<const0>\;
  ENET1_GMII_TX_EN <= \<const0>\;
  ENET1_GMII_TX_ER <= \<const0>\;
  ENET1_MDIO_MDC <= \<const0>\;
  ENET1_MDIO_O <= \<const0>\;
  ENET1_MDIO_T <= \<const0>\;
  ENET1_PTP_DELAY_REQ_RX <= \<const0>\;
  ENET1_PTP_DELAY_REQ_TX <= \<const0>\;
  ENET1_PTP_PDELAY_REQ_RX <= \<const0>\;
  ENET1_PTP_PDELAY_REQ_TX <= \<const0>\;
  ENET1_PTP_PDELAY_RESP_RX <= \<const0>\;
  ENET1_PTP_PDELAY_RESP_TX <= \<const0>\;
  ENET1_PTP_SYNC_FRAME_RX <= \<const0>\;
  ENET1_PTP_SYNC_FRAME_TX <= \<const0>\;
  ENET1_SOF_RX <= \<const0>\;
  ENET1_SOF_TX <= \<const0>\;
  EVENT_EVENTO <= \<const0>\;
  EVENT_STANDBYWFE(1) <= \<const0>\;
  EVENT_STANDBYWFE(0) <= \<const0>\;
  EVENT_STANDBYWFI(1) <= \<const0>\;
  EVENT_STANDBYWFI(0) <= \<const0>\;
  FCLK_CLK0 <= \^fclk_clk0\;
  FCLK_CLK2 <= \<const0>\;
  FCLK_CLK3 <= \<const0>\;
  FCLK_RESET1_N <= \<const0>\;
  FCLK_RESET2_N <= \<const0>\;
  FCLK_RESET3_N <= \<const0>\;
  FTMT_F2P_TRIGACK_0 <= \<const0>\;
  FTMT_F2P_TRIGACK_1 <= \<const0>\;
  FTMT_F2P_TRIGACK_2 <= \<const0>\;
  FTMT_F2P_TRIGACK_3 <= \<const0>\;
  FTMT_P2F_DEBUG(31) <= \<const0>\;
  FTMT_P2F_DEBUG(30) <= \<const0>\;
  FTMT_P2F_DEBUG(29) <= \<const0>\;
  FTMT_P2F_DEBUG(28) <= \<const0>\;
  FTMT_P2F_DEBUG(27) <= \<const0>\;
  FTMT_P2F_DEBUG(26) <= \<const0>\;
  FTMT_P2F_DEBUG(25) <= \<const0>\;
  FTMT_P2F_DEBUG(24) <= \<const0>\;
  FTMT_P2F_DEBUG(23) <= \<const0>\;
  FTMT_P2F_DEBUG(22) <= \<const0>\;
  FTMT_P2F_DEBUG(21) <= \<const0>\;
  FTMT_P2F_DEBUG(20) <= \<const0>\;
  FTMT_P2F_DEBUG(19) <= \<const0>\;
  FTMT_P2F_DEBUG(18) <= \<const0>\;
  FTMT_P2F_DEBUG(17) <= \<const0>\;
  FTMT_P2F_DEBUG(16) <= \<const0>\;
  FTMT_P2F_DEBUG(15) <= \<const0>\;
  FTMT_P2F_DEBUG(14) <= \<const0>\;
  FTMT_P2F_DEBUG(13) <= \<const0>\;
  FTMT_P2F_DEBUG(12) <= \<const0>\;
  FTMT_P2F_DEBUG(11) <= \<const0>\;
  FTMT_P2F_DEBUG(10) <= \<const0>\;
  FTMT_P2F_DEBUG(9) <= \<const0>\;
  FTMT_P2F_DEBUG(8) <= \<const0>\;
  FTMT_P2F_DEBUG(7) <= \<const0>\;
  FTMT_P2F_DEBUG(6) <= \<const0>\;
  FTMT_P2F_DEBUG(5) <= \<const0>\;
  FTMT_P2F_DEBUG(4) <= \<const0>\;
  FTMT_P2F_DEBUG(3) <= \<const0>\;
  FTMT_P2F_DEBUG(2) <= \<const0>\;
  FTMT_P2F_DEBUG(1) <= \<const0>\;
  FTMT_P2F_DEBUG(0) <= \<const0>\;
  FTMT_P2F_TRIG_0 <= \<const0>\;
  FTMT_P2F_TRIG_1 <= \<const0>\;
  FTMT_P2F_TRIG_2 <= \<const0>\;
  FTMT_P2F_TRIG_3 <= \<const0>\;
  GPIO_O(63) <= \<const0>\;
  GPIO_O(62) <= \<const0>\;
  GPIO_O(61) <= \<const0>\;
  GPIO_O(60) <= \<const0>\;
  GPIO_O(59) <= \<const0>\;
  GPIO_O(58) <= \<const0>\;
  GPIO_O(57) <= \<const0>\;
  GPIO_O(56) <= \<const0>\;
  GPIO_O(55) <= \<const0>\;
  GPIO_O(54) <= \<const0>\;
  GPIO_O(53) <= \<const0>\;
  GPIO_O(52) <= \<const0>\;
  GPIO_O(51) <= \<const0>\;
  GPIO_O(50) <= \<const0>\;
  GPIO_O(49) <= \<const0>\;
  GPIO_O(48) <= \<const0>\;
  GPIO_O(47) <= \<const0>\;
  GPIO_O(46) <= \<const0>\;
  GPIO_O(45) <= \<const0>\;
  GPIO_O(44) <= \<const0>\;
  GPIO_O(43) <= \<const0>\;
  GPIO_O(42) <= \<const0>\;
  GPIO_O(41) <= \<const0>\;
  GPIO_O(40) <= \<const0>\;
  GPIO_O(39) <= \<const0>\;
  GPIO_O(38) <= \<const0>\;
  GPIO_O(37) <= \<const0>\;
  GPIO_O(36) <= \<const0>\;
  GPIO_O(35) <= \<const0>\;
  GPIO_O(34) <= \<const0>\;
  GPIO_O(33) <= \<const0>\;
  GPIO_O(32) <= \<const0>\;
  GPIO_O(31) <= \<const0>\;
  GPIO_O(30) <= \<const0>\;
  GPIO_O(29) <= \<const0>\;
  GPIO_O(28) <= \<const0>\;
  GPIO_O(27) <= \<const0>\;
  GPIO_O(26) <= \<const0>\;
  GPIO_O(25) <= \<const0>\;
  GPIO_O(24) <= \<const0>\;
  GPIO_O(23) <= \<const0>\;
  GPIO_O(22) <= \<const0>\;
  GPIO_O(21) <= \<const0>\;
  GPIO_O(20) <= \<const0>\;
  GPIO_O(19) <= \<const0>\;
  GPIO_O(18) <= \<const0>\;
  GPIO_O(17) <= \<const0>\;
  GPIO_O(16) <= \<const0>\;
  GPIO_O(15) <= \<const0>\;
  GPIO_O(14) <= \<const0>\;
  GPIO_O(13) <= \<const0>\;
  GPIO_O(12) <= \<const0>\;
  GPIO_O(11) <= \<const0>\;
  GPIO_O(10) <= \<const0>\;
  GPIO_O(9) <= \<const0>\;
  GPIO_O(8) <= \<const0>\;
  GPIO_O(7) <= \<const0>\;
  GPIO_O(6) <= \<const0>\;
  GPIO_O(5) <= \<const0>\;
  GPIO_O(4) <= \<const0>\;
  GPIO_O(3) <= \<const0>\;
  GPIO_O(2) <= \<const0>\;
  GPIO_O(1) <= \<const0>\;
  GPIO_O(0) <= \<const0>\;
  GPIO_T(63) <= \<const0>\;
  GPIO_T(62) <= \<const0>\;
  GPIO_T(61) <= \<const0>\;
  GPIO_T(60) <= \<const0>\;
  GPIO_T(59) <= \<const0>\;
  GPIO_T(58) <= \<const0>\;
  GPIO_T(57) <= \<const0>\;
  GPIO_T(56) <= \<const0>\;
  GPIO_T(55) <= \<const0>\;
  GPIO_T(54) <= \<const0>\;
  GPIO_T(53) <= \<const0>\;
  GPIO_T(52) <= \<const0>\;
  GPIO_T(51) <= \<const0>\;
  GPIO_T(50) <= \<const0>\;
  GPIO_T(49) <= \<const0>\;
  GPIO_T(48) <= \<const0>\;
  GPIO_T(47) <= \<const0>\;
  GPIO_T(46) <= \<const0>\;
  GPIO_T(45) <= \<const0>\;
  GPIO_T(44) <= \<const0>\;
  GPIO_T(43) <= \<const0>\;
  GPIO_T(42) <= \<const0>\;
  GPIO_T(41) <= \<const0>\;
  GPIO_T(40) <= \<const0>\;
  GPIO_T(39) <= \<const0>\;
  GPIO_T(38) <= \<const0>\;
  GPIO_T(37) <= \<const0>\;
  GPIO_T(36) <= \<const0>\;
  GPIO_T(35) <= \<const0>\;
  GPIO_T(34) <= \<const0>\;
  GPIO_T(33) <= \<const0>\;
  GPIO_T(32) <= \<const0>\;
  GPIO_T(31) <= \<const0>\;
  GPIO_T(30) <= \<const0>\;
  GPIO_T(29) <= \<const0>\;
  GPIO_T(28) <= \<const0>\;
  GPIO_T(27) <= \<const0>\;
  GPIO_T(26) <= \<const0>\;
  GPIO_T(25) <= \<const0>\;
  GPIO_T(24) <= \<const0>\;
  GPIO_T(23) <= \<const0>\;
  GPIO_T(22) <= \<const0>\;
  GPIO_T(21) <= \<const0>\;
  GPIO_T(20) <= \<const0>\;
  GPIO_T(19) <= \<const0>\;
  GPIO_T(18) <= \<const0>\;
  GPIO_T(17) <= \<const0>\;
  GPIO_T(16) <= \<const0>\;
  GPIO_T(15) <= \<const0>\;
  GPIO_T(14) <= \<const0>\;
  GPIO_T(13) <= \<const0>\;
  GPIO_T(12) <= \<const0>\;
  GPIO_T(11) <= \<const0>\;
  GPIO_T(10) <= \<const0>\;
  GPIO_T(9) <= \<const0>\;
  GPIO_T(8) <= \<const0>\;
  GPIO_T(7) <= \<const0>\;
  GPIO_T(6) <= \<const0>\;
  GPIO_T(5) <= \<const0>\;
  GPIO_T(4) <= \<const0>\;
  GPIO_T(3) <= \<const0>\;
  GPIO_T(2) <= \<const0>\;
  GPIO_T(1) <= \<const0>\;
  GPIO_T(0) <= \<const0>\;
  I2C0_SCL_O <= \<const0>\;
  I2C0_SCL_T <= \<const0>\;
  I2C0_SDA_O <= \<const0>\;
  I2C0_SDA_T <= \<const0>\;
  I2C1_SCL_O <= \<const0>\;
  I2C1_SCL_T <= \<const0>\;
  I2C1_SDA_O <= \<const0>\;
  I2C1_SDA_T <= \<const0>\;
  IRQ_P2F_CAN0 <= \<const0>\;
  IRQ_P2F_CAN1 <= \<const0>\;
  IRQ_P2F_CTI <= \<const0>\;
  IRQ_P2F_DMAC0 <= \<const0>\;
  IRQ_P2F_DMAC1 <= \<const0>\;
  IRQ_P2F_DMAC2 <= \<const0>\;
  IRQ_P2F_DMAC3 <= \<const0>\;
  IRQ_P2F_DMAC4 <= \<const0>\;
  IRQ_P2F_DMAC5 <= \<const0>\;
  IRQ_P2F_DMAC6 <= \<const0>\;
  IRQ_P2F_DMAC7 <= \<const0>\;
  IRQ_P2F_DMAC_ABORT <= \<const0>\;
  IRQ_P2F_ENET0 <= \<const0>\;
  IRQ_P2F_ENET1 <= \<const0>\;
  IRQ_P2F_ENET_WAKE0 <= \<const0>\;
  IRQ_P2F_ENET_WAKE1 <= \<const0>\;
  IRQ_P2F_GPIO <= \<const0>\;
  IRQ_P2F_I2C0 <= \<const0>\;
  IRQ_P2F_I2C1 <= \<const0>\;
  IRQ_P2F_QSPI <= \<const0>\;
  IRQ_P2F_SDIO0 <= \<const0>\;
  IRQ_P2F_SDIO1 <= \<const0>\;
  IRQ_P2F_SMC <= \<const0>\;
  IRQ_P2F_SPI0 <= \<const0>\;
  IRQ_P2F_SPI1 <= \<const0>\;
  IRQ_P2F_UART0 <= \<const0>\;
  IRQ_P2F_UART1 <= \<const0>\;
  IRQ_P2F_USB0 <= \<const0>\;
  IRQ_P2F_USB1 <= \<const0>\;
  M_AXI_GP0_ARCACHE(3) <= \<const0>\;
  M_AXI_GP0_ARCACHE(2) <= \<const0>\;
  M_AXI_GP0_ARCACHE(1) <= \<const0>\;
  M_AXI_GP0_ARCACHE(0) <= \<const0>\;
  M_AXI_GP0_ARESETN <= \<const0>\;
  M_AXI_GP0_ARLOCK(1) <= \<const0>\;
  M_AXI_GP0_ARLOCK(0) <= \<const0>\;
  M_AXI_GP0_ARQOS(3) <= \<const0>\;
  M_AXI_GP0_ARQOS(2) <= \<const0>\;
  M_AXI_GP0_ARQOS(1) <= \<const0>\;
  M_AXI_GP0_ARQOS(0) <= \<const0>\;
  M_AXI_GP0_ARSIZE(2) <= \<const0>\;
  M_AXI_GP0_ARSIZE(1 downto 0) <= \^m_axi_gp0_arsize\(1 downto 0);
  M_AXI_GP0_AWCACHE(3) <= \<const0>\;
  M_AXI_GP0_AWCACHE(2) <= \<const0>\;
  M_AXI_GP0_AWCACHE(1) <= \<const0>\;
  M_AXI_GP0_AWCACHE(0) <= \<const0>\;
  M_AXI_GP0_AWLOCK(1) <= \<const0>\;
  M_AXI_GP0_AWLOCK(0) <= \<const0>\;
  M_AXI_GP0_AWQOS(3) <= \<const0>\;
  M_AXI_GP0_AWQOS(2) <= \<const0>\;
  M_AXI_GP0_AWQOS(1) <= \<const0>\;
  M_AXI_GP0_AWQOS(0) <= \<const0>\;
  M_AXI_GP0_AWSIZE(2) <= \<const0>\;
  M_AXI_GP0_AWSIZE(1 downto 0) <= \^m_axi_gp0_awsize\(1 downto 0);
  M_AXI_GP0_WID(11) <= \<const0>\;
  M_AXI_GP0_WID(10) <= \<const0>\;
  M_AXI_GP0_WID(9) <= \<const0>\;
  M_AXI_GP0_WID(8) <= \<const0>\;
  M_AXI_GP0_WID(7) <= \<const0>\;
  M_AXI_GP0_WID(6) <= \<const0>\;
  M_AXI_GP0_WID(5) <= \<const0>\;
  M_AXI_GP0_WID(4) <= \<const0>\;
  M_AXI_GP0_WID(3) <= \<const0>\;
  M_AXI_GP0_WID(2) <= \<const0>\;
  M_AXI_GP0_WID(1) <= \<const0>\;
  M_AXI_GP0_WID(0) <= \<const0>\;
  M_AXI_GP0_WLAST <= \<const0>\;
  M_AXI_GP1_ARADDR(31) <= \<const0>\;
  M_AXI_GP1_ARADDR(30) <= \<const0>\;
  M_AXI_GP1_ARADDR(29) <= \<const0>\;
  M_AXI_GP1_ARADDR(28) <= \<const0>\;
  M_AXI_GP1_ARADDR(27) <= \<const0>\;
  M_AXI_GP1_ARADDR(26) <= \<const0>\;
  M_AXI_GP1_ARADDR(25) <= \<const0>\;
  M_AXI_GP1_ARADDR(24) <= \<const0>\;
  M_AXI_GP1_ARADDR(23) <= \<const0>\;
  M_AXI_GP1_ARADDR(22) <= \<const0>\;
  M_AXI_GP1_ARADDR(21) <= \<const0>\;
  M_AXI_GP1_ARADDR(20) <= \<const0>\;
  M_AXI_GP1_ARADDR(19) <= \<const0>\;
  M_AXI_GP1_ARADDR(18) <= \<const0>\;
  M_AXI_GP1_ARADDR(17) <= \<const0>\;
  M_AXI_GP1_ARADDR(16) <= \<const0>\;
  M_AXI_GP1_ARADDR(15) <= \<const0>\;
  M_AXI_GP1_ARADDR(14) <= \<const0>\;
  M_AXI_GP1_ARADDR(13) <= \<const0>\;
  M_AXI_GP1_ARADDR(12) <= \<const0>\;
  M_AXI_GP1_ARADDR(11) <= \<const0>\;
  M_AXI_GP1_ARADDR(10) <= \<const0>\;
  M_AXI_GP1_ARADDR(9) <= \<const0>\;
  M_AXI_GP1_ARADDR(8) <= \<const0>\;
  M_AXI_GP1_ARADDR(7) <= \<const0>\;
  M_AXI_GP1_ARADDR(6) <= \<const0>\;
  M_AXI_GP1_ARADDR(5) <= \<const0>\;
  M_AXI_GP1_ARADDR(4) <= \<const0>\;
  M_AXI_GP1_ARADDR(3) <= \<const0>\;
  M_AXI_GP1_ARADDR(2) <= \<const0>\;
  M_AXI_GP1_ARADDR(1) <= \<const0>\;
  M_AXI_GP1_ARADDR(0) <= \<const0>\;
  M_AXI_GP1_ARBURST(1) <= \<const0>\;
  M_AXI_GP1_ARBURST(0) <= \<const0>\;
  M_AXI_GP1_ARCACHE(3) <= \<const0>\;
  M_AXI_GP1_ARCACHE(2) <= \<const0>\;
  M_AXI_GP1_ARCACHE(1) <= \<const0>\;
  M_AXI_GP1_ARCACHE(0) <= \<const0>\;
  M_AXI_GP1_ARESETN <= \<const0>\;
  M_AXI_GP1_ARID(11) <= \<const0>\;
  M_AXI_GP1_ARID(10) <= \<const0>\;
  M_AXI_GP1_ARID(9) <= \<const0>\;
  M_AXI_GP1_ARID(8) <= \<const0>\;
  M_AXI_GP1_ARID(7) <= \<const0>\;
  M_AXI_GP1_ARID(6) <= \<const0>\;
  M_AXI_GP1_ARID(5) <= \<const0>\;
  M_AXI_GP1_ARID(4) <= \<const0>\;
  M_AXI_GP1_ARID(3) <= \<const0>\;
  M_AXI_GP1_ARID(2) <= \<const0>\;
  M_AXI_GP1_ARID(1) <= \<const0>\;
  M_AXI_GP1_ARID(0) <= \<const0>\;
  M_AXI_GP1_ARLEN(3) <= \<const0>\;
  M_AXI_GP1_ARLEN(2) <= \<const0>\;
  M_AXI_GP1_ARLEN(1) <= \<const0>\;
  M_AXI_GP1_ARLEN(0) <= \<const0>\;
  M_AXI_GP1_ARLOCK(1) <= \<const0>\;
  M_AXI_GP1_ARLOCK(0) <= \<const0>\;
  M_AXI_GP1_ARPROT(2) <= \<const0>\;
  M_AXI_GP1_ARPROT(1) <= \<const0>\;
  M_AXI_GP1_ARPROT(0) <= \<const0>\;
  M_AXI_GP1_ARQOS(3) <= \<const0>\;
  M_AXI_GP1_ARQOS(2) <= \<const0>\;
  M_AXI_GP1_ARQOS(1) <= \<const0>\;
  M_AXI_GP1_ARQOS(0) <= \<const0>\;
  M_AXI_GP1_ARSIZE(2) <= \<const0>\;
  M_AXI_GP1_ARSIZE(1) <= \<const0>\;
  M_AXI_GP1_ARSIZE(0) <= \<const0>\;
  M_AXI_GP1_ARVALID <= \<const0>\;
  M_AXI_GP1_AWADDR(31) <= \<const0>\;
  M_AXI_GP1_AWADDR(30) <= \<const0>\;
  M_AXI_GP1_AWADDR(29) <= \<const0>\;
  M_AXI_GP1_AWADDR(28) <= \<const0>\;
  M_AXI_GP1_AWADDR(27) <= \<const0>\;
  M_AXI_GP1_AWADDR(26) <= \<const0>\;
  M_AXI_GP1_AWADDR(25) <= \<const0>\;
  M_AXI_GP1_AWADDR(24) <= \<const0>\;
  M_AXI_GP1_AWADDR(23) <= \<const0>\;
  M_AXI_GP1_AWADDR(22) <= \<const0>\;
  M_AXI_GP1_AWADDR(21) <= \<const0>\;
  M_AXI_GP1_AWADDR(20) <= \<const0>\;
  M_AXI_GP1_AWADDR(19) <= \<const0>\;
  M_AXI_GP1_AWADDR(18) <= \<const0>\;
  M_AXI_GP1_AWADDR(17) <= \<const0>\;
  M_AXI_GP1_AWADDR(16) <= \<const0>\;
  M_AXI_GP1_AWADDR(15) <= \<const0>\;
  M_AXI_GP1_AWADDR(14) <= \<const0>\;
  M_AXI_GP1_AWADDR(13) <= \<const0>\;
  M_AXI_GP1_AWADDR(12) <= \<const0>\;
  M_AXI_GP1_AWADDR(11) <= \<const0>\;
  M_AXI_GP1_AWADDR(10) <= \<const0>\;
  M_AXI_GP1_AWADDR(9) <= \<const0>\;
  M_AXI_GP1_AWADDR(8) <= \<const0>\;
  M_AXI_GP1_AWADDR(7) <= \<const0>\;
  M_AXI_GP1_AWADDR(6) <= \<const0>\;
  M_AXI_GP1_AWADDR(5) <= \<const0>\;
  M_AXI_GP1_AWADDR(4) <= \<const0>\;
  M_AXI_GP1_AWADDR(3) <= \<const0>\;
  M_AXI_GP1_AWADDR(2) <= \<const0>\;
  M_AXI_GP1_AWADDR(1) <= \<const0>\;
  M_AXI_GP1_AWADDR(0) <= \<const0>\;
  M_AXI_GP1_AWBURST(1) <= \<const0>\;
  M_AXI_GP1_AWBURST(0) <= \<const0>\;
  M_AXI_GP1_AWCACHE(3) <= \<const0>\;
  M_AXI_GP1_AWCACHE(2) <= \<const0>\;
  M_AXI_GP1_AWCACHE(1) <= \<const0>\;
  M_AXI_GP1_AWCACHE(0) <= \<const0>\;
  M_AXI_GP1_AWID(11) <= \<const0>\;
  M_AXI_GP1_AWID(10) <= \<const0>\;
  M_AXI_GP1_AWID(9) <= \<const0>\;
  M_AXI_GP1_AWID(8) <= \<const0>\;
  M_AXI_GP1_AWID(7) <= \<const0>\;
  M_AXI_GP1_AWID(6) <= \<const0>\;
  M_AXI_GP1_AWID(5) <= \<const0>\;
  M_AXI_GP1_AWID(4) <= \<const0>\;
  M_AXI_GP1_AWID(3) <= \<const0>\;
  M_AXI_GP1_AWID(2) <= \<const0>\;
  M_AXI_GP1_AWID(1) <= \<const0>\;
  M_AXI_GP1_AWID(0) <= \<const0>\;
  M_AXI_GP1_AWLEN(3) <= \<const0>\;
  M_AXI_GP1_AWLEN(2) <= \<const0>\;
  M_AXI_GP1_AWLEN(1) <= \<const0>\;
  M_AXI_GP1_AWLEN(0) <= \<const0>\;
  M_AXI_GP1_AWLOCK(1) <= \<const0>\;
  M_AXI_GP1_AWLOCK(0) <= \<const0>\;
  M_AXI_GP1_AWPROT(2) <= \<const0>\;
  M_AXI_GP1_AWPROT(1) <= \<const0>\;
  M_AXI_GP1_AWPROT(0) <= \<const0>\;
  M_AXI_GP1_AWQOS(3) <= \<const0>\;
  M_AXI_GP1_AWQOS(2) <= \<const0>\;
  M_AXI_GP1_AWQOS(1) <= \<const0>\;
  M_AXI_GP1_AWQOS(0) <= \<const0>\;
  M_AXI_GP1_AWSIZE(2) <= \<const0>\;
  M_AXI_GP1_AWSIZE(1) <= \<const0>\;
  M_AXI_GP1_AWSIZE(0) <= \<const0>\;
  M_AXI_GP1_AWVALID <= \<const0>\;
  M_AXI_GP1_BREADY <= \<const0>\;
  M_AXI_GP1_RREADY <= \<const0>\;
  M_AXI_GP1_WDATA(31) <= \<const0>\;
  M_AXI_GP1_WDATA(30) <= \<const0>\;
  M_AXI_GP1_WDATA(29) <= \<const0>\;
  M_AXI_GP1_WDATA(28) <= \<const0>\;
  M_AXI_GP1_WDATA(27) <= \<const0>\;
  M_AXI_GP1_WDATA(26) <= \<const0>\;
  M_AXI_GP1_WDATA(25) <= \<const0>\;
  M_AXI_GP1_WDATA(24) <= \<const0>\;
  M_AXI_GP1_WDATA(23) <= \<const0>\;
  M_AXI_GP1_WDATA(22) <= \<const0>\;
  M_AXI_GP1_WDATA(21) <= \<const0>\;
  M_AXI_GP1_WDATA(20) <= \<const0>\;
  M_AXI_GP1_WDATA(19) <= \<const0>\;
  M_AXI_GP1_WDATA(18) <= \<const0>\;
  M_AXI_GP1_WDATA(17) <= \<const0>\;
  M_AXI_GP1_WDATA(16) <= \<const0>\;
  M_AXI_GP1_WDATA(15) <= \<const0>\;
  M_AXI_GP1_WDATA(14) <= \<const0>\;
  M_AXI_GP1_WDATA(13) <= \<const0>\;
  M_AXI_GP1_WDATA(12) <= \<const0>\;
  M_AXI_GP1_WDATA(11) <= \<const0>\;
  M_AXI_GP1_WDATA(10) <= \<const0>\;
  M_AXI_GP1_WDATA(9) <= \<const0>\;
  M_AXI_GP1_WDATA(8) <= \<const0>\;
  M_AXI_GP1_WDATA(7) <= \<const0>\;
  M_AXI_GP1_WDATA(6) <= \<const0>\;
  M_AXI_GP1_WDATA(5) <= \<const0>\;
  M_AXI_GP1_WDATA(4) <= \<const0>\;
  M_AXI_GP1_WDATA(3) <= \<const0>\;
  M_AXI_GP1_WDATA(2) <= \<const0>\;
  M_AXI_GP1_WDATA(1) <= \<const0>\;
  M_AXI_GP1_WDATA(0) <= \<const0>\;
  M_AXI_GP1_WID(11) <= \<const0>\;
  M_AXI_GP1_WID(10) <= \<const0>\;
  M_AXI_GP1_WID(9) <= \<const0>\;
  M_AXI_GP1_WID(8) <= \<const0>\;
  M_AXI_GP1_WID(7) <= \<const0>\;
  M_AXI_GP1_WID(6) <= \<const0>\;
  M_AXI_GP1_WID(5) <= \<const0>\;
  M_AXI_GP1_WID(4) <= \<const0>\;
  M_AXI_GP1_WID(3) <= \<const0>\;
  M_AXI_GP1_WID(2) <= \<const0>\;
  M_AXI_GP1_WID(1) <= \<const0>\;
  M_AXI_GP1_WID(0) <= \<const0>\;
  M_AXI_GP1_WLAST <= \<const0>\;
  M_AXI_GP1_WSTRB(3) <= \<const0>\;
  M_AXI_GP1_WSTRB(2) <= \<const0>\;
  M_AXI_GP1_WSTRB(1) <= \<const0>\;
  M_AXI_GP1_WSTRB(0) <= \<const0>\;
  M_AXI_GP1_WVALID <= \<const0>\;
  PJTAG_TDO <= \<const0>\;
  SDIO0_BUSPOW <= \<const0>\;
  SDIO0_BUSVOLT(2) <= \<const0>\;
  SDIO0_BUSVOLT(1) <= \<const0>\;
  SDIO0_BUSVOLT(0) <= \<const0>\;
  SDIO0_CLK <= \<const0>\;
  SDIO0_CMD_O <= \<const0>\;
  SDIO0_CMD_T <= \<const0>\;
  SDIO0_DATA_O(3) <= \<const0>\;
  SDIO0_DATA_O(2) <= \<const0>\;
  SDIO0_DATA_O(1) <= \<const0>\;
  SDIO0_DATA_O(0) <= \<const0>\;
  SDIO0_DATA_T(3) <= \<const0>\;
  SDIO0_DATA_T(2) <= \<const0>\;
  SDIO0_DATA_T(1) <= \<const0>\;
  SDIO0_DATA_T(0) <= \<const0>\;
  SDIO0_LED <= \<const0>\;
  SDIO1_BUSPOW <= \<const0>\;
  SDIO1_BUSVOLT(2) <= \<const0>\;
  SDIO1_BUSVOLT(1) <= \<const0>\;
  SDIO1_BUSVOLT(0) <= \<const0>\;
  SDIO1_CLK <= \<const0>\;
  SDIO1_CMD_O <= \<const0>\;
  SDIO1_CMD_T <= \<const0>\;
  SDIO1_DATA_O(3) <= \<const0>\;
  SDIO1_DATA_O(2) <= \<const0>\;
  SDIO1_DATA_O(1) <= \<const0>\;
  SDIO1_DATA_O(0) <= \<const0>\;
  SDIO1_DATA_T(3) <= \<const0>\;
  SDIO1_DATA_T(2) <= \<const0>\;
  SDIO1_DATA_T(1) <= \<const0>\;
  SDIO1_DATA_T(0) <= \<const0>\;
  SDIO1_LED <= \<const0>\;
  SPI0_MISO_O <= \<const0>\;
  SPI0_MISO_T <= \<const0>\;
  SPI0_MOSI_O <= \<const0>\;
  SPI0_MOSI_T <= \<const0>\;
  SPI0_SCLK_O <= \<const0>\;
  SPI0_SCLK_T <= \<const0>\;
  SPI0_SS1_O <= \<const0>\;
  SPI0_SS2_O <= \<const0>\;
  SPI0_SS_O <= \<const0>\;
  SPI0_SS_T <= \<const0>\;
  SPI1_MISO_O <= \<const0>\;
  SPI1_MISO_T <= \<const0>\;
  SPI1_MOSI_O <= \<const0>\;
  SPI1_MOSI_T <= \<const0>\;
  SPI1_SCLK_O <= \<const0>\;
  SPI1_SCLK_T <= \<const0>\;
  SPI1_SS1_O <= \<const0>\;
  SPI1_SS2_O <= \<const0>\;
  SPI1_SS_O <= \<const0>\;
  SPI1_SS_T <= \<const0>\;
  S_AXI_ACP_ARESETN <= \<const0>\;
  S_AXI_ACP_ARREADY <= \<const0>\;
  S_AXI_ACP_AWREADY <= \<const0>\;
  S_AXI_ACP_BID(2) <= \<const0>\;
  S_AXI_ACP_BID(1) <= \<const0>\;
  S_AXI_ACP_BID(0) <= \<const0>\;
  S_AXI_ACP_BRESP(1) <= \<const0>\;
  S_AXI_ACP_BRESP(0) <= \<const0>\;
  S_AXI_ACP_BVALID <= \<const0>\;
  S_AXI_ACP_RDATA(63) <= \<const0>\;
  S_AXI_ACP_RDATA(62) <= \<const0>\;
  S_AXI_ACP_RDATA(61) <= \<const0>\;
  S_AXI_ACP_RDATA(60) <= \<const0>\;
  S_AXI_ACP_RDATA(59) <= \<const0>\;
  S_AXI_ACP_RDATA(58) <= \<const0>\;
  S_AXI_ACP_RDATA(57) <= \<const0>\;
  S_AXI_ACP_RDATA(56) <= \<const0>\;
  S_AXI_ACP_RDATA(55) <= \<const0>\;
  S_AXI_ACP_RDATA(54) <= \<const0>\;
  S_AXI_ACP_RDATA(53) <= \<const0>\;
  S_AXI_ACP_RDATA(52) <= \<const0>\;
  S_AXI_ACP_RDATA(51) <= \<const0>\;
  S_AXI_ACP_RDATA(50) <= \<const0>\;
  S_AXI_ACP_RDATA(49) <= \<const0>\;
  S_AXI_ACP_RDATA(48) <= \<const0>\;
  S_AXI_ACP_RDATA(47) <= \<const0>\;
  S_AXI_ACP_RDATA(46) <= \<const0>\;
  S_AXI_ACP_RDATA(45) <= \<const0>\;
  S_AXI_ACP_RDATA(44) <= \<const0>\;
  S_AXI_ACP_RDATA(43) <= \<const0>\;
  S_AXI_ACP_RDATA(42) <= \<const0>\;
  S_AXI_ACP_RDATA(41) <= \<const0>\;
  S_AXI_ACP_RDATA(40) <= \<const0>\;
  S_AXI_ACP_RDATA(39) <= \<const0>\;
  S_AXI_ACP_RDATA(38) <= \<const0>\;
  S_AXI_ACP_RDATA(37) <= \<const0>\;
  S_AXI_ACP_RDATA(36) <= \<const0>\;
  S_AXI_ACP_RDATA(35) <= \<const0>\;
  S_AXI_ACP_RDATA(34) <= \<const0>\;
  S_AXI_ACP_RDATA(33) <= \<const0>\;
  S_AXI_ACP_RDATA(32) <= \<const0>\;
  S_AXI_ACP_RDATA(31) <= \<const0>\;
  S_AXI_ACP_RDATA(30) <= \<const0>\;
  S_AXI_ACP_RDATA(29) <= \<const0>\;
  S_AXI_ACP_RDATA(28) <= \<const0>\;
  S_AXI_ACP_RDATA(27) <= \<const0>\;
  S_AXI_ACP_RDATA(26) <= \<const0>\;
  S_AXI_ACP_RDATA(25) <= \<const0>\;
  S_AXI_ACP_RDATA(24) <= \<const0>\;
  S_AXI_ACP_RDATA(23) <= \<const0>\;
  S_AXI_ACP_RDATA(22) <= \<const0>\;
  S_AXI_ACP_RDATA(21) <= \<const0>\;
  S_AXI_ACP_RDATA(20) <= \<const0>\;
  S_AXI_ACP_RDATA(19) <= \<const0>\;
  S_AXI_ACP_RDATA(18) <= \<const0>\;
  S_AXI_ACP_RDATA(17) <= \<const0>\;
  S_AXI_ACP_RDATA(16) <= \<const0>\;
  S_AXI_ACP_RDATA(15) <= \<const0>\;
  S_AXI_ACP_RDATA(14) <= \<const0>\;
  S_AXI_ACP_RDATA(13) <= \<const0>\;
  S_AXI_ACP_RDATA(12) <= \<const0>\;
  S_AXI_ACP_RDATA(11) <= \<const0>\;
  S_AXI_ACP_RDATA(10) <= \<const0>\;
  S_AXI_ACP_RDATA(9) <= \<const0>\;
  S_AXI_ACP_RDATA(8) <= \<const0>\;
  S_AXI_ACP_RDATA(7) <= \<const0>\;
  S_AXI_ACP_RDATA(6) <= \<const0>\;
  S_AXI_ACP_RDATA(5) <= \<const0>\;
  S_AXI_ACP_RDATA(4) <= \<const0>\;
  S_AXI_ACP_RDATA(3) <= \<const0>\;
  S_AXI_ACP_RDATA(2) <= \<const0>\;
  S_AXI_ACP_RDATA(1) <= \<const0>\;
  S_AXI_ACP_RDATA(0) <= \<const0>\;
  S_AXI_ACP_RID(2) <= \<const0>\;
  S_AXI_ACP_RID(1) <= \<const0>\;
  S_AXI_ACP_RID(0) <= \<const0>\;
  S_AXI_ACP_RLAST <= \<const0>\;
  S_AXI_ACP_RRESP(1) <= \<const0>\;
  S_AXI_ACP_RRESP(0) <= \<const0>\;
  S_AXI_ACP_RVALID <= \<const0>\;
  S_AXI_ACP_WREADY <= \<const0>\;
  S_AXI_GP0_ARESETN <= \<const0>\;
  S_AXI_GP0_ARREADY <= \<const0>\;
  S_AXI_GP0_AWREADY <= \<const0>\;
  S_AXI_GP0_BID(5) <= \<const0>\;
  S_AXI_GP0_BID(4) <= \<const0>\;
  S_AXI_GP0_BID(3) <= \<const0>\;
  S_AXI_GP0_BID(2) <= \<const0>\;
  S_AXI_GP0_BID(1) <= \<const0>\;
  S_AXI_GP0_BID(0) <= \<const0>\;
  S_AXI_GP0_BRESP(1) <= \<const0>\;
  S_AXI_GP0_BRESP(0) <= \<const0>\;
  S_AXI_GP0_BVALID <= \<const0>\;
  S_AXI_GP0_RDATA(31) <= \<const0>\;
  S_AXI_GP0_RDATA(30) <= \<const0>\;
  S_AXI_GP0_RDATA(29) <= \<const0>\;
  S_AXI_GP0_RDATA(28) <= \<const0>\;
  S_AXI_GP0_RDATA(27) <= \<const0>\;
  S_AXI_GP0_RDATA(26) <= \<const0>\;
  S_AXI_GP0_RDATA(25) <= \<const0>\;
  S_AXI_GP0_RDATA(24) <= \<const0>\;
  S_AXI_GP0_RDATA(23) <= \<const0>\;
  S_AXI_GP0_RDATA(22) <= \<const0>\;
  S_AXI_GP0_RDATA(21) <= \<const0>\;
  S_AXI_GP0_RDATA(20) <= \<const0>\;
  S_AXI_GP0_RDATA(19) <= \<const0>\;
  S_AXI_GP0_RDATA(18) <= \<const0>\;
  S_AXI_GP0_RDATA(17) <= \<const0>\;
  S_AXI_GP0_RDATA(16) <= \<const0>\;
  S_AXI_GP0_RDATA(15) <= \<const0>\;
  S_AXI_GP0_RDATA(14) <= \<const0>\;
  S_AXI_GP0_RDATA(13) <= \<const0>\;
  S_AXI_GP0_RDATA(12) <= \<const0>\;
  S_AXI_GP0_RDATA(11) <= \<const0>\;
  S_AXI_GP0_RDATA(10) <= \<const0>\;
  S_AXI_GP0_RDATA(9) <= \<const0>\;
  S_AXI_GP0_RDATA(8) <= \<const0>\;
  S_AXI_GP0_RDATA(7) <= \<const0>\;
  S_AXI_GP0_RDATA(6) <= \<const0>\;
  S_AXI_GP0_RDATA(5) <= \<const0>\;
  S_AXI_GP0_RDATA(4) <= \<const0>\;
  S_AXI_GP0_RDATA(3) <= \<const0>\;
  S_AXI_GP0_RDATA(2) <= \<const0>\;
  S_AXI_GP0_RDATA(1) <= \<const0>\;
  S_AXI_GP0_RDATA(0) <= \<const0>\;
  S_AXI_GP0_RID(5) <= \<const0>\;
  S_AXI_GP0_RID(4) <= \<const0>\;
  S_AXI_GP0_RID(3) <= \<const0>\;
  S_AXI_GP0_RID(2) <= \<const0>\;
  S_AXI_GP0_RID(1) <= \<const0>\;
  S_AXI_GP0_RID(0) <= \<const0>\;
  S_AXI_GP0_RLAST <= \<const0>\;
  S_AXI_GP0_RRESP(1) <= \<const0>\;
  S_AXI_GP0_RRESP(0) <= \<const0>\;
  S_AXI_GP0_RVALID <= \<const0>\;
  S_AXI_GP0_WREADY <= \<const0>\;
  S_AXI_GP1_ARESETN <= \<const0>\;
  S_AXI_GP1_ARREADY <= \<const0>\;
  S_AXI_GP1_AWREADY <= \<const0>\;
  S_AXI_GP1_BID(5) <= \<const0>\;
  S_AXI_GP1_BID(4) <= \<const0>\;
  S_AXI_GP1_BID(3) <= \<const0>\;
  S_AXI_GP1_BID(2) <= \<const0>\;
  S_AXI_GP1_BID(1) <= \<const0>\;
  S_AXI_GP1_BID(0) <= \<const0>\;
  S_AXI_GP1_BRESP(1) <= \<const0>\;
  S_AXI_GP1_BRESP(0) <= \<const0>\;
  S_AXI_GP1_BVALID <= \<const0>\;
  S_AXI_GP1_RDATA(31) <= \<const0>\;
  S_AXI_GP1_RDATA(30) <= \<const0>\;
  S_AXI_GP1_RDATA(29) <= \<const0>\;
  S_AXI_GP1_RDATA(28) <= \<const0>\;
  S_AXI_GP1_RDATA(27) <= \<const0>\;
  S_AXI_GP1_RDATA(26) <= \<const0>\;
  S_AXI_GP1_RDATA(25) <= \<const0>\;
  S_AXI_GP1_RDATA(24) <= \<const0>\;
  S_AXI_GP1_RDATA(23) <= \<const0>\;
  S_AXI_GP1_RDATA(22) <= \<const0>\;
  S_AXI_GP1_RDATA(21) <= \<const0>\;
  S_AXI_GP1_RDATA(20) <= \<const0>\;
  S_AXI_GP1_RDATA(19) <= \<const0>\;
  S_AXI_GP1_RDATA(18) <= \<const0>\;
  S_AXI_GP1_RDATA(17) <= \<const0>\;
  S_AXI_GP1_RDATA(16) <= \<const0>\;
  S_AXI_GP1_RDATA(15) <= \<const0>\;
  S_AXI_GP1_RDATA(14) <= \<const0>\;
  S_AXI_GP1_RDATA(13) <= \<const0>\;
  S_AXI_GP1_RDATA(12) <= \<const0>\;
  S_AXI_GP1_RDATA(11) <= \<const0>\;
  S_AXI_GP1_RDATA(10) <= \<const0>\;
  S_AXI_GP1_RDATA(9) <= \<const0>\;
  S_AXI_GP1_RDATA(8) <= \<const0>\;
  S_AXI_GP1_RDATA(7) <= \<const0>\;
  S_AXI_GP1_RDATA(6) <= \<const0>\;
  S_AXI_GP1_RDATA(5) <= \<const0>\;
  S_AXI_GP1_RDATA(4) <= \<const0>\;
  S_AXI_GP1_RDATA(3) <= \<const0>\;
  S_AXI_GP1_RDATA(2) <= \<const0>\;
  S_AXI_GP1_RDATA(1) <= \<const0>\;
  S_AXI_GP1_RDATA(0) <= \<const0>\;
  S_AXI_GP1_RID(5) <= \<const0>\;
  S_AXI_GP1_RID(4) <= \<const0>\;
  S_AXI_GP1_RID(3) <= \<const0>\;
  S_AXI_GP1_RID(2) <= \<const0>\;
  S_AXI_GP1_RID(1) <= \<const0>\;
  S_AXI_GP1_RID(0) <= \<const0>\;
  S_AXI_GP1_RLAST <= \<const0>\;
  S_AXI_GP1_RRESP(1) <= \<const0>\;
  S_AXI_GP1_RRESP(0) <= \<const0>\;
  S_AXI_GP1_RVALID <= \<const0>\;
  S_AXI_GP1_WREADY <= \<const0>\;
  S_AXI_HP0_ARESETN <= \<const0>\;
  S_AXI_HP0_ARREADY <= \<const0>\;
  S_AXI_HP0_AWREADY <= \<const0>\;
  S_AXI_HP0_BID(5) <= \<const0>\;
  S_AXI_HP0_BID(4) <= \<const0>\;
  S_AXI_HP0_BID(3) <= \<const0>\;
  S_AXI_HP0_BID(2) <= \<const0>\;
  S_AXI_HP0_BID(1) <= \<const0>\;
  S_AXI_HP0_BID(0) <= \<const0>\;
  S_AXI_HP0_BRESP(1) <= \<const0>\;
  S_AXI_HP0_BRESP(0) <= \<const0>\;
  S_AXI_HP0_BVALID <= \<const0>\;
  S_AXI_HP0_RACOUNT(2) <= \<const0>\;
  S_AXI_HP0_RACOUNT(1) <= \<const0>\;
  S_AXI_HP0_RACOUNT(0) <= \<const0>\;
  S_AXI_HP0_RCOUNT(7) <= \<const0>\;
  S_AXI_HP0_RCOUNT(6) <= \<const0>\;
  S_AXI_HP0_RCOUNT(5) <= \<const0>\;
  S_AXI_HP0_RCOUNT(4) <= \<const0>\;
  S_AXI_HP0_RCOUNT(3) <= \<const0>\;
  S_AXI_HP0_RCOUNT(2) <= \<const0>\;
  S_AXI_HP0_RCOUNT(1) <= \<const0>\;
  S_AXI_HP0_RCOUNT(0) <= \<const0>\;
  S_AXI_HP0_RDATA(63) <= \<const0>\;
  S_AXI_HP0_RDATA(62) <= \<const0>\;
  S_AXI_HP0_RDATA(61) <= \<const0>\;
  S_AXI_HP0_RDATA(60) <= \<const0>\;
  S_AXI_HP0_RDATA(59) <= \<const0>\;
  S_AXI_HP0_RDATA(58) <= \<const0>\;
  S_AXI_HP0_RDATA(57) <= \<const0>\;
  S_AXI_HP0_RDATA(56) <= \<const0>\;
  S_AXI_HP0_RDATA(55) <= \<const0>\;
  S_AXI_HP0_RDATA(54) <= \<const0>\;
  S_AXI_HP0_RDATA(53) <= \<const0>\;
  S_AXI_HP0_RDATA(52) <= \<const0>\;
  S_AXI_HP0_RDATA(51) <= \<const0>\;
  S_AXI_HP0_RDATA(50) <= \<const0>\;
  S_AXI_HP0_RDATA(49) <= \<const0>\;
  S_AXI_HP0_RDATA(48) <= \<const0>\;
  S_AXI_HP0_RDATA(47) <= \<const0>\;
  S_AXI_HP0_RDATA(46) <= \<const0>\;
  S_AXI_HP0_RDATA(45) <= \<const0>\;
  S_AXI_HP0_RDATA(44) <= \<const0>\;
  S_AXI_HP0_RDATA(43) <= \<const0>\;
  S_AXI_HP0_RDATA(42) <= \<const0>\;
  S_AXI_HP0_RDATA(41) <= \<const0>\;
  S_AXI_HP0_RDATA(40) <= \<const0>\;
  S_AXI_HP0_RDATA(39) <= \<const0>\;
  S_AXI_HP0_RDATA(38) <= \<const0>\;
  S_AXI_HP0_RDATA(37) <= \<const0>\;
  S_AXI_HP0_RDATA(36) <= \<const0>\;
  S_AXI_HP0_RDATA(35) <= \<const0>\;
  S_AXI_HP0_RDATA(34) <= \<const0>\;
  S_AXI_HP0_RDATA(33) <= \<const0>\;
  S_AXI_HP0_RDATA(32) <= \<const0>\;
  S_AXI_HP0_RDATA(31) <= \<const0>\;
  S_AXI_HP0_RDATA(30) <= \<const0>\;
  S_AXI_HP0_RDATA(29) <= \<const0>\;
  S_AXI_HP0_RDATA(28) <= \<const0>\;
  S_AXI_HP0_RDATA(27) <= \<const0>\;
  S_AXI_HP0_RDATA(26) <= \<const0>\;
  S_AXI_HP0_RDATA(25) <= \<const0>\;
  S_AXI_HP0_RDATA(24) <= \<const0>\;
  S_AXI_HP0_RDATA(23) <= \<const0>\;
  S_AXI_HP0_RDATA(22) <= \<const0>\;
  S_AXI_HP0_RDATA(21) <= \<const0>\;
  S_AXI_HP0_RDATA(20) <= \<const0>\;
  S_AXI_HP0_RDATA(19) <= \<const0>\;
  S_AXI_HP0_RDATA(18) <= \<const0>\;
  S_AXI_HP0_RDATA(17) <= \<const0>\;
  S_AXI_HP0_RDATA(16) <= \<const0>\;
  S_AXI_HP0_RDATA(15) <= \<const0>\;
  S_AXI_HP0_RDATA(14) <= \<const0>\;
  S_AXI_HP0_RDATA(13) <= \<const0>\;
  S_AXI_HP0_RDATA(12) <= \<const0>\;
  S_AXI_HP0_RDATA(11) <= \<const0>\;
  S_AXI_HP0_RDATA(10) <= \<const0>\;
  S_AXI_HP0_RDATA(9) <= \<const0>\;
  S_AXI_HP0_RDATA(8) <= \<const0>\;
  S_AXI_HP0_RDATA(7) <= \<const0>\;
  S_AXI_HP0_RDATA(6) <= \<const0>\;
  S_AXI_HP0_RDATA(5) <= \<const0>\;
  S_AXI_HP0_RDATA(4) <= \<const0>\;
  S_AXI_HP0_RDATA(3) <= \<const0>\;
  S_AXI_HP0_RDATA(2) <= \<const0>\;
  S_AXI_HP0_RDATA(1) <= \<const0>\;
  S_AXI_HP0_RDATA(0) <= \<const0>\;
  S_AXI_HP0_RID(5) <= \<const0>\;
  S_AXI_HP0_RID(4) <= \<const0>\;
  S_AXI_HP0_RID(3) <= \<const0>\;
  S_AXI_HP0_RID(2) <= \<const0>\;
  S_AXI_HP0_RID(1) <= \<const0>\;
  S_AXI_HP0_RID(0) <= \<const0>\;
  S_AXI_HP0_RLAST <= \<const0>\;
  S_AXI_HP0_RRESP(1) <= \<const0>\;
  S_AXI_HP0_RRESP(0) <= \<const0>\;
  S_AXI_HP0_RVALID <= \<const0>\;
  S_AXI_HP0_WACOUNT(5) <= \<const0>\;
  S_AXI_HP0_WACOUNT(4) <= \<const0>\;
  S_AXI_HP0_WACOUNT(3) <= \<const0>\;
  S_AXI_HP0_WACOUNT(2) <= \<const0>\;
  S_AXI_HP0_WACOUNT(1) <= \<const0>\;
  S_AXI_HP0_WACOUNT(0) <= \<const0>\;
  S_AXI_HP0_WCOUNT(7) <= \<const0>\;
  S_AXI_HP0_WCOUNT(6) <= \<const0>\;
  S_AXI_HP0_WCOUNT(5) <= \<const0>\;
  S_AXI_HP0_WCOUNT(4) <= \<const0>\;
  S_AXI_HP0_WCOUNT(3) <= \<const0>\;
  S_AXI_HP0_WCOUNT(2) <= \<const0>\;
  S_AXI_HP0_WCOUNT(1) <= \<const0>\;
  S_AXI_HP0_WCOUNT(0) <= \<const0>\;
  S_AXI_HP0_WREADY <= \<const0>\;
  S_AXI_HP1_ARESETN <= \<const0>\;
  S_AXI_HP1_ARREADY <= \<const0>\;
  S_AXI_HP1_AWREADY <= \<const0>\;
  S_AXI_HP1_BID(5) <= \<const0>\;
  S_AXI_HP1_BID(4) <= \<const0>\;
  S_AXI_HP1_BID(3) <= \<const0>\;
  S_AXI_HP1_BID(2) <= \<const0>\;
  S_AXI_HP1_BID(1) <= \<const0>\;
  S_AXI_HP1_BID(0) <= \<const0>\;
  S_AXI_HP1_BRESP(1) <= \<const0>\;
  S_AXI_HP1_BRESP(0) <= \<const0>\;
  S_AXI_HP1_BVALID <= \<const0>\;
  S_AXI_HP1_RACOUNT(2) <= \<const0>\;
  S_AXI_HP1_RACOUNT(1) <= \<const0>\;
  S_AXI_HP1_RACOUNT(0) <= \<const0>\;
  S_AXI_HP1_RCOUNT(7) <= \<const0>\;
  S_AXI_HP1_RCOUNT(6) <= \<const0>\;
  S_AXI_HP1_RCOUNT(5) <= \<const0>\;
  S_AXI_HP1_RCOUNT(4) <= \<const0>\;
  S_AXI_HP1_RCOUNT(3) <= \<const0>\;
  S_AXI_HP1_RCOUNT(2) <= \<const0>\;
  S_AXI_HP1_RCOUNT(1) <= \<const0>\;
  S_AXI_HP1_RCOUNT(0) <= \<const0>\;
  S_AXI_HP1_RDATA(63) <= \<const0>\;
  S_AXI_HP1_RDATA(62) <= \<const0>\;
  S_AXI_HP1_RDATA(61) <= \<const0>\;
  S_AXI_HP1_RDATA(60) <= \<const0>\;
  S_AXI_HP1_RDATA(59) <= \<const0>\;
  S_AXI_HP1_RDATA(58) <= \<const0>\;
  S_AXI_HP1_RDATA(57) <= \<const0>\;
  S_AXI_HP1_RDATA(56) <= \<const0>\;
  S_AXI_HP1_RDATA(55) <= \<const0>\;
  S_AXI_HP1_RDATA(54) <= \<const0>\;
  S_AXI_HP1_RDATA(53) <= \<const0>\;
  S_AXI_HP1_RDATA(52) <= \<const0>\;
  S_AXI_HP1_RDATA(51) <= \<const0>\;
  S_AXI_HP1_RDATA(50) <= \<const0>\;
  S_AXI_HP1_RDATA(49) <= \<const0>\;
  S_AXI_HP1_RDATA(48) <= \<const0>\;
  S_AXI_HP1_RDATA(47) <= \<const0>\;
  S_AXI_HP1_RDATA(46) <= \<const0>\;
  S_AXI_HP1_RDATA(45) <= \<const0>\;
  S_AXI_HP1_RDATA(44) <= \<const0>\;
  S_AXI_HP1_RDATA(43) <= \<const0>\;
  S_AXI_HP1_RDATA(42) <= \<const0>\;
  S_AXI_HP1_RDATA(41) <= \<const0>\;
  S_AXI_HP1_RDATA(40) <= \<const0>\;
  S_AXI_HP1_RDATA(39) <= \<const0>\;
  S_AXI_HP1_RDATA(38) <= \<const0>\;
  S_AXI_HP1_RDATA(37) <= \<const0>\;
  S_AXI_HP1_RDATA(36) <= \<const0>\;
  S_AXI_HP1_RDATA(35) <= \<const0>\;
  S_AXI_HP1_RDATA(34) <= \<const0>\;
  S_AXI_HP1_RDATA(33) <= \<const0>\;
  S_AXI_HP1_RDATA(32) <= \<const0>\;
  S_AXI_HP1_RDATA(31) <= \<const0>\;
  S_AXI_HP1_RDATA(30) <= \<const0>\;
  S_AXI_HP1_RDATA(29) <= \<const0>\;
  S_AXI_HP1_RDATA(28) <= \<const0>\;
  S_AXI_HP1_RDATA(27) <= \<const0>\;
  S_AXI_HP1_RDATA(26) <= \<const0>\;
  S_AXI_HP1_RDATA(25) <= \<const0>\;
  S_AXI_HP1_RDATA(24) <= \<const0>\;
  S_AXI_HP1_RDATA(23) <= \<const0>\;
  S_AXI_HP1_RDATA(22) <= \<const0>\;
  S_AXI_HP1_RDATA(21) <= \<const0>\;
  S_AXI_HP1_RDATA(20) <= \<const0>\;
  S_AXI_HP1_RDATA(19) <= \<const0>\;
  S_AXI_HP1_RDATA(18) <= \<const0>\;
  S_AXI_HP1_RDATA(17) <= \<const0>\;
  S_AXI_HP1_RDATA(16) <= \<const0>\;
  S_AXI_HP1_RDATA(15) <= \<const0>\;
  S_AXI_HP1_RDATA(14) <= \<const0>\;
  S_AXI_HP1_RDATA(13) <= \<const0>\;
  S_AXI_HP1_RDATA(12) <= \<const0>\;
  S_AXI_HP1_RDATA(11) <= \<const0>\;
  S_AXI_HP1_RDATA(10) <= \<const0>\;
  S_AXI_HP1_RDATA(9) <= \<const0>\;
  S_AXI_HP1_RDATA(8) <= \<const0>\;
  S_AXI_HP1_RDATA(7) <= \<const0>\;
  S_AXI_HP1_RDATA(6) <= \<const0>\;
  S_AXI_HP1_RDATA(5) <= \<const0>\;
  S_AXI_HP1_RDATA(4) <= \<const0>\;
  S_AXI_HP1_RDATA(3) <= \<const0>\;
  S_AXI_HP1_RDATA(2) <= \<const0>\;
  S_AXI_HP1_RDATA(1) <= \<const0>\;
  S_AXI_HP1_RDATA(0) <= \<const0>\;
  S_AXI_HP1_RID(5) <= \<const0>\;
  S_AXI_HP1_RID(4) <= \<const0>\;
  S_AXI_HP1_RID(3) <= \<const0>\;
  S_AXI_HP1_RID(2) <= \<const0>\;
  S_AXI_HP1_RID(1) <= \<const0>\;
  S_AXI_HP1_RID(0) <= \<const0>\;
  S_AXI_HP1_RLAST <= \<const0>\;
  S_AXI_HP1_RRESP(1) <= \<const0>\;
  S_AXI_HP1_RRESP(0) <= \<const0>\;
  S_AXI_HP1_RVALID <= \<const0>\;
  S_AXI_HP1_WACOUNT(5) <= \<const0>\;
  S_AXI_HP1_WACOUNT(4) <= \<const0>\;
  S_AXI_HP1_WACOUNT(3) <= \<const0>\;
  S_AXI_HP1_WACOUNT(2) <= \<const0>\;
  S_AXI_HP1_WACOUNT(1) <= \<const0>\;
  S_AXI_HP1_WACOUNT(0) <= \<const0>\;
  S_AXI_HP1_WCOUNT(7) <= \<const0>\;
  S_AXI_HP1_WCOUNT(6) <= \<const0>\;
  S_AXI_HP1_WCOUNT(5) <= \<const0>\;
  S_AXI_HP1_WCOUNT(4) <= \<const0>\;
  S_AXI_HP1_WCOUNT(3) <= \<const0>\;
  S_AXI_HP1_WCOUNT(2) <= \<const0>\;
  S_AXI_HP1_WCOUNT(1) <= \<const0>\;
  S_AXI_HP1_WCOUNT(0) <= \<const0>\;
  S_AXI_HP1_WREADY <= \<const0>\;
  S_AXI_HP2_ARESETN <= \<const0>\;
  S_AXI_HP2_ARREADY <= \<const0>\;
  S_AXI_HP2_AWREADY <= \<const0>\;
  S_AXI_HP2_BID(5) <= \<const0>\;
  S_AXI_HP2_BID(4) <= \<const0>\;
  S_AXI_HP2_BID(3) <= \<const0>\;
  S_AXI_HP2_BID(2) <= \<const0>\;
  S_AXI_HP2_BID(1) <= \<const0>\;
  S_AXI_HP2_BID(0) <= \<const0>\;
  S_AXI_HP2_BRESP(1) <= \<const0>\;
  S_AXI_HP2_BRESP(0) <= \<const0>\;
  S_AXI_HP2_BVALID <= \<const0>\;
  S_AXI_HP2_RACOUNT(2) <= \<const0>\;
  S_AXI_HP2_RACOUNT(1) <= \<const0>\;
  S_AXI_HP2_RACOUNT(0) <= \<const0>\;
  S_AXI_HP2_RCOUNT(7) <= \<const0>\;
  S_AXI_HP2_RCOUNT(6) <= \<const0>\;
  S_AXI_HP2_RCOUNT(5) <= \<const0>\;
  S_AXI_HP2_RCOUNT(4) <= \<const0>\;
  S_AXI_HP2_RCOUNT(3) <= \<const0>\;
  S_AXI_HP2_RCOUNT(2) <= \<const0>\;
  S_AXI_HP2_RCOUNT(1) <= \<const0>\;
  S_AXI_HP2_RCOUNT(0) <= \<const0>\;
  S_AXI_HP2_RDATA(63) <= \<const0>\;
  S_AXI_HP2_RDATA(62) <= \<const0>\;
  S_AXI_HP2_RDATA(61) <= \<const0>\;
  S_AXI_HP2_RDATA(60) <= \<const0>\;
  S_AXI_HP2_RDATA(59) <= \<const0>\;
  S_AXI_HP2_RDATA(58) <= \<const0>\;
  S_AXI_HP2_RDATA(57) <= \<const0>\;
  S_AXI_HP2_RDATA(56) <= \<const0>\;
  S_AXI_HP2_RDATA(55) <= \<const0>\;
  S_AXI_HP2_RDATA(54) <= \<const0>\;
  S_AXI_HP2_RDATA(53) <= \<const0>\;
  S_AXI_HP2_RDATA(52) <= \<const0>\;
  S_AXI_HP2_RDATA(51) <= \<const0>\;
  S_AXI_HP2_RDATA(50) <= \<const0>\;
  S_AXI_HP2_RDATA(49) <= \<const0>\;
  S_AXI_HP2_RDATA(48) <= \<const0>\;
  S_AXI_HP2_RDATA(47) <= \<const0>\;
  S_AXI_HP2_RDATA(46) <= \<const0>\;
  S_AXI_HP2_RDATA(45) <= \<const0>\;
  S_AXI_HP2_RDATA(44) <= \<const0>\;
  S_AXI_HP2_RDATA(43) <= \<const0>\;
  S_AXI_HP2_RDATA(42) <= \<const0>\;
  S_AXI_HP2_RDATA(41) <= \<const0>\;
  S_AXI_HP2_RDATA(40) <= \<const0>\;
  S_AXI_HP2_RDATA(39) <= \<const0>\;
  S_AXI_HP2_RDATA(38) <= \<const0>\;
  S_AXI_HP2_RDATA(37) <= \<const0>\;
  S_AXI_HP2_RDATA(36) <= \<const0>\;
  S_AXI_HP2_RDATA(35) <= \<const0>\;
  S_AXI_HP2_RDATA(34) <= \<const0>\;
  S_AXI_HP2_RDATA(33) <= \<const0>\;
  S_AXI_HP2_RDATA(32) <= \<const0>\;
  S_AXI_HP2_RDATA(31) <= \<const0>\;
  S_AXI_HP2_RDATA(30) <= \<const0>\;
  S_AXI_HP2_RDATA(29) <= \<const0>\;
  S_AXI_HP2_RDATA(28) <= \<const0>\;
  S_AXI_HP2_RDATA(27) <= \<const0>\;
  S_AXI_HP2_RDATA(26) <= \<const0>\;
  S_AXI_HP2_RDATA(25) <= \<const0>\;
  S_AXI_HP2_RDATA(24) <= \<const0>\;
  S_AXI_HP2_RDATA(23) <= \<const0>\;
  S_AXI_HP2_RDATA(22) <= \<const0>\;
  S_AXI_HP2_RDATA(21) <= \<const0>\;
  S_AXI_HP2_RDATA(20) <= \<const0>\;
  S_AXI_HP2_RDATA(19) <= \<const0>\;
  S_AXI_HP2_RDATA(18) <= \<const0>\;
  S_AXI_HP2_RDATA(17) <= \<const0>\;
  S_AXI_HP2_RDATA(16) <= \<const0>\;
  S_AXI_HP2_RDATA(15) <= \<const0>\;
  S_AXI_HP2_RDATA(14) <= \<const0>\;
  S_AXI_HP2_RDATA(13) <= \<const0>\;
  S_AXI_HP2_RDATA(12) <= \<const0>\;
  S_AXI_HP2_RDATA(11) <= \<const0>\;
  S_AXI_HP2_RDATA(10) <= \<const0>\;
  S_AXI_HP2_RDATA(9) <= \<const0>\;
  S_AXI_HP2_RDATA(8) <= \<const0>\;
  S_AXI_HP2_RDATA(7) <= \<const0>\;
  S_AXI_HP2_RDATA(6) <= \<const0>\;
  S_AXI_HP2_RDATA(5) <= \<const0>\;
  S_AXI_HP2_RDATA(4) <= \<const0>\;
  S_AXI_HP2_RDATA(3) <= \<const0>\;
  S_AXI_HP2_RDATA(2) <= \<const0>\;
  S_AXI_HP2_RDATA(1) <= \<const0>\;
  S_AXI_HP2_RDATA(0) <= \<const0>\;
  S_AXI_HP2_RID(5) <= \<const0>\;
  S_AXI_HP2_RID(4) <= \<const0>\;
  S_AXI_HP2_RID(3) <= \<const0>\;
  S_AXI_HP2_RID(2) <= \<const0>\;
  S_AXI_HP2_RID(1) <= \<const0>\;
  S_AXI_HP2_RID(0) <= \<const0>\;
  S_AXI_HP2_RLAST <= \<const0>\;
  S_AXI_HP2_RRESP(1) <= \<const0>\;
  S_AXI_HP2_RRESP(0) <= \<const0>\;
  S_AXI_HP2_RVALID <= \<const0>\;
  S_AXI_HP2_WACOUNT(5) <= \<const0>\;
  S_AXI_HP2_WACOUNT(4) <= \<const0>\;
  S_AXI_HP2_WACOUNT(3) <= \<const0>\;
  S_AXI_HP2_WACOUNT(2) <= \<const0>\;
  S_AXI_HP2_WACOUNT(1) <= \<const0>\;
  S_AXI_HP2_WACOUNT(0) <= \<const0>\;
  S_AXI_HP2_WCOUNT(7) <= \<const0>\;
  S_AXI_HP2_WCOUNT(6) <= \<const0>\;
  S_AXI_HP2_WCOUNT(5) <= \<const0>\;
  S_AXI_HP2_WCOUNT(4) <= \<const0>\;
  S_AXI_HP2_WCOUNT(3) <= \<const0>\;
  S_AXI_HP2_WCOUNT(2) <= \<const0>\;
  S_AXI_HP2_WCOUNT(1) <= \<const0>\;
  S_AXI_HP2_WCOUNT(0) <= \<const0>\;
  S_AXI_HP2_WREADY <= \<const0>\;
  S_AXI_HP3_ARESETN <= \<const0>\;
  S_AXI_HP3_ARREADY <= \<const0>\;
  S_AXI_HP3_AWREADY <= \<const0>\;
  S_AXI_HP3_BID(5) <= \<const0>\;
  S_AXI_HP3_BID(4) <= \<const0>\;
  S_AXI_HP3_BID(3) <= \<const0>\;
  S_AXI_HP3_BID(2) <= \<const0>\;
  S_AXI_HP3_BID(1) <= \<const0>\;
  S_AXI_HP3_BID(0) <= \<const0>\;
  S_AXI_HP3_BRESP(1) <= \<const0>\;
  S_AXI_HP3_BRESP(0) <= \<const0>\;
  S_AXI_HP3_BVALID <= \<const0>\;
  S_AXI_HP3_RACOUNT(2) <= \<const0>\;
  S_AXI_HP3_RACOUNT(1) <= \<const0>\;
  S_AXI_HP3_RACOUNT(0) <= \<const0>\;
  S_AXI_HP3_RCOUNT(7) <= \<const0>\;
  S_AXI_HP3_RCOUNT(6) <= \<const0>\;
  S_AXI_HP3_RCOUNT(5) <= \<const0>\;
  S_AXI_HP3_RCOUNT(4) <= \<const0>\;
  S_AXI_HP3_RCOUNT(3) <= \<const0>\;
  S_AXI_HP3_RCOUNT(2) <= \<const0>\;
  S_AXI_HP3_RCOUNT(1) <= \<const0>\;
  S_AXI_HP3_RCOUNT(0) <= \<const0>\;
  S_AXI_HP3_RDATA(63) <= \<const0>\;
  S_AXI_HP3_RDATA(62) <= \<const0>\;
  S_AXI_HP3_RDATA(61) <= \<const0>\;
  S_AXI_HP3_RDATA(60) <= \<const0>\;
  S_AXI_HP3_RDATA(59) <= \<const0>\;
  S_AXI_HP3_RDATA(58) <= \<const0>\;
  S_AXI_HP3_RDATA(57) <= \<const0>\;
  S_AXI_HP3_RDATA(56) <= \<const0>\;
  S_AXI_HP3_RDATA(55) <= \<const0>\;
  S_AXI_HP3_RDATA(54) <= \<const0>\;
  S_AXI_HP3_RDATA(53) <= \<const0>\;
  S_AXI_HP3_RDATA(52) <= \<const0>\;
  S_AXI_HP3_RDATA(51) <= \<const0>\;
  S_AXI_HP3_RDATA(50) <= \<const0>\;
  S_AXI_HP3_RDATA(49) <= \<const0>\;
  S_AXI_HP3_RDATA(48) <= \<const0>\;
  S_AXI_HP3_RDATA(47) <= \<const0>\;
  S_AXI_HP3_RDATA(46) <= \<const0>\;
  S_AXI_HP3_RDATA(45) <= \<const0>\;
  S_AXI_HP3_RDATA(44) <= \<const0>\;
  S_AXI_HP3_RDATA(43) <= \<const0>\;
  S_AXI_HP3_RDATA(42) <= \<const0>\;
  S_AXI_HP3_RDATA(41) <= \<const0>\;
  S_AXI_HP3_RDATA(40) <= \<const0>\;
  S_AXI_HP3_RDATA(39) <= \<const0>\;
  S_AXI_HP3_RDATA(38) <= \<const0>\;
  S_AXI_HP3_RDATA(37) <= \<const0>\;
  S_AXI_HP3_RDATA(36) <= \<const0>\;
  S_AXI_HP3_RDATA(35) <= \<const0>\;
  S_AXI_HP3_RDATA(34) <= \<const0>\;
  S_AXI_HP3_RDATA(33) <= \<const0>\;
  S_AXI_HP3_RDATA(32) <= \<const0>\;
  S_AXI_HP3_RDATA(31) <= \<const0>\;
  S_AXI_HP3_RDATA(30) <= \<const0>\;
  S_AXI_HP3_RDATA(29) <= \<const0>\;
  S_AXI_HP3_RDATA(28) <= \<const0>\;
  S_AXI_HP3_RDATA(27) <= \<const0>\;
  S_AXI_HP3_RDATA(26) <= \<const0>\;
  S_AXI_HP3_RDATA(25) <= \<const0>\;
  S_AXI_HP3_RDATA(24) <= \<const0>\;
  S_AXI_HP3_RDATA(23) <= \<const0>\;
  S_AXI_HP3_RDATA(22) <= \<const0>\;
  S_AXI_HP3_RDATA(21) <= \<const0>\;
  S_AXI_HP3_RDATA(20) <= \<const0>\;
  S_AXI_HP3_RDATA(19) <= \<const0>\;
  S_AXI_HP3_RDATA(18) <= \<const0>\;
  S_AXI_HP3_RDATA(17) <= \<const0>\;
  S_AXI_HP3_RDATA(16) <= \<const0>\;
  S_AXI_HP3_RDATA(15) <= \<const0>\;
  S_AXI_HP3_RDATA(14) <= \<const0>\;
  S_AXI_HP3_RDATA(13) <= \<const0>\;
  S_AXI_HP3_RDATA(12) <= \<const0>\;
  S_AXI_HP3_RDATA(11) <= \<const0>\;
  S_AXI_HP3_RDATA(10) <= \<const0>\;
  S_AXI_HP3_RDATA(9) <= \<const0>\;
  S_AXI_HP3_RDATA(8) <= \<const0>\;
  S_AXI_HP3_RDATA(7) <= \<const0>\;
  S_AXI_HP3_RDATA(6) <= \<const0>\;
  S_AXI_HP3_RDATA(5) <= \<const0>\;
  S_AXI_HP3_RDATA(4) <= \<const0>\;
  S_AXI_HP3_RDATA(3) <= \<const0>\;
  S_AXI_HP3_RDATA(2) <= \<const0>\;
  S_AXI_HP3_RDATA(1) <= \<const0>\;
  S_AXI_HP3_RDATA(0) <= \<const0>\;
  S_AXI_HP3_RID(5) <= \<const0>\;
  S_AXI_HP3_RID(4) <= \<const0>\;
  S_AXI_HP3_RID(3) <= \<const0>\;
  S_AXI_HP3_RID(2) <= \<const0>\;
  S_AXI_HP3_RID(1) <= \<const0>\;
  S_AXI_HP3_RID(0) <= \<const0>\;
  S_AXI_HP3_RLAST <= \<const0>\;
  S_AXI_HP3_RRESP(1) <= \<const0>\;
  S_AXI_HP3_RRESP(0) <= \<const0>\;
  S_AXI_HP3_RVALID <= \<const0>\;
  S_AXI_HP3_WACOUNT(5) <= \<const0>\;
  S_AXI_HP3_WACOUNT(4) <= \<const0>\;
  S_AXI_HP3_WACOUNT(3) <= \<const0>\;
  S_AXI_HP3_WACOUNT(2) <= \<const0>\;
  S_AXI_HP3_WACOUNT(1) <= \<const0>\;
  S_AXI_HP3_WACOUNT(0) <= \<const0>\;
  S_AXI_HP3_WCOUNT(7) <= \<const0>\;
  S_AXI_HP3_WCOUNT(6) <= \<const0>\;
  S_AXI_HP3_WCOUNT(5) <= \<const0>\;
  S_AXI_HP3_WCOUNT(4) <= \<const0>\;
  S_AXI_HP3_WCOUNT(3) <= \<const0>\;
  S_AXI_HP3_WCOUNT(2) <= \<const0>\;
  S_AXI_HP3_WCOUNT(1) <= \<const0>\;
  S_AXI_HP3_WCOUNT(0) <= \<const0>\;
  S_AXI_HP3_WREADY <= \<const0>\;
  TRACE_CLK_OUT <= \<const0>\;
  TRACE_CTL <= \TRACE_CTL_PIPE[0]\;
  TRACE_DATA(1 downto 0) <= \TRACE_DATA_PIPE[0]\(1 downto 0);
  TTC0_WAVE0_OUT <= \<const0>\;
  TTC0_WAVE1_OUT <= \<const0>\;
  TTC0_WAVE2_OUT <= \<const0>\;
  TTC1_WAVE0_OUT <= \<const0>\;
  TTC1_WAVE1_OUT <= \<const0>\;
  TTC1_WAVE2_OUT <= \<const0>\;
  UART0_DTRN <= \<const0>\;
  UART0_RTSN <= \<const0>\;
  UART0_TX <= \<const0>\;
  UART1_DTRN <= \<const0>\;
  UART1_RTSN <= \<const0>\;
  UART1_TX <= \<const0>\;
  USB0_PORT_INDCTL(1) <= \<const0>\;
  USB0_PORT_INDCTL(0) <= \<const0>\;
  USB0_VBUS_PWRSELECT <= \<const0>\;
  USB1_PORT_INDCTL(1) <= \<const0>\;
  USB1_PORT_INDCTL(0) <= \<const0>\;
  USB1_VBUS_PWRSELECT <= \<const0>\;
  WDT_RST_OUT <= \<const0>\;
DDR_CAS_n_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_CAS_n,
      PAD => DDR_CAS_n
    );
DDR_CKE_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_CKE,
      PAD => DDR_CKE
    );
DDR_CS_n_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_CS_n,
      PAD => DDR_CS_n
    );
DDR_Clk_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Clk,
      PAD => DDR_Clk
    );
DDR_Clk_n_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Clk_n,
      PAD => DDR_Clk_n
    );
DDR_DRSTB_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DRSTB,
      PAD => DDR_DRSTB
    );
DDR_ODT_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_ODT,
      PAD => DDR_ODT
    );
DDR_RAS_n_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_RAS_n,
      PAD => DDR_RAS_n
    );
DDR_VRN_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_VRN,
      PAD => DDR_VRN
    );
DDR_VRP_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_VRP,
      PAD => DDR_VRP
    );
DDR_WEB_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_WEB,
      PAD => DDR_WEB
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
PS7_i: unisim.vcomponents.PS7
     port map (
      DDRA(14 downto 0) => buffered_DDR_Addr(14 downto 0),
      DDRARB(3 downto 0) => B"0000",
      DDRBA(2 downto 0) => buffered_DDR_BankAddr(2 downto 0),
      DDRCASB => buffered_DDR_CAS_n,
      DDRCKE => buffered_DDR_CKE,
      DDRCKN => buffered_DDR_Clk_n,
      DDRCKP => buffered_DDR_Clk,
      DDRCSB => buffered_DDR_CS_n,
      DDRDM(3 downto 0) => buffered_DDR_DM(3 downto 0),
      DDRDQ(31 downto 0) => buffered_DDR_DQ(31 downto 0),
      DDRDQSN(3 downto 0) => buffered_DDR_DQS_n(3 downto 0),
      DDRDQSP(3 downto 0) => buffered_DDR_DQS(3 downto 0),
      DDRDRSTB => buffered_DDR_DRSTB,
      DDRODT => buffered_DDR_ODT,
      DDRRASB => buffered_DDR_RAS_n,
      DDRVRN => buffered_DDR_VRN,
      DDRVRP => buffered_DDR_VRP,
      DDRWEB => buffered_DDR_WEB,
      DMA0ACLK => '0',
      DMA0DAREADY => '0',
      DMA0DATYPE(1) => PS7_i_n_224,
      DMA0DATYPE(0) => PS7_i_n_225,
      DMA0DAVALID => PS7_i_n_0,
      DMA0DRLAST => '0',
      DMA0DRREADY => PS7_i_n_1,
      DMA0DRTYPE(1 downto 0) => B"00",
      DMA0DRVALID => '0',
      DMA0RSTN => PS7_i_n_2,
      DMA1ACLK => '0',
      DMA1DAREADY => '0',
      DMA1DATYPE(1) => PS7_i_n_226,
      DMA1DATYPE(0) => PS7_i_n_227,
      DMA1DAVALID => PS7_i_n_3,
      DMA1DRLAST => '0',
      DMA1DRREADY => PS7_i_n_4,
      DMA1DRTYPE(1 downto 0) => B"00",
      DMA1DRVALID => '0',
      DMA1RSTN => PS7_i_n_5,
      DMA2ACLK => '0',
      DMA2DAREADY => '0',
      DMA2DATYPE(1) => PS7_i_n_228,
      DMA2DATYPE(0) => PS7_i_n_229,
      DMA2DAVALID => PS7_i_n_6,
      DMA2DRLAST => '0',
      DMA2DRREADY => PS7_i_n_7,
      DMA2DRTYPE(1 downto 0) => B"00",
      DMA2DRVALID => '0',
      DMA2RSTN => PS7_i_n_8,
      DMA3ACLK => '0',
      DMA3DAREADY => '0',
      DMA3DATYPE(1) => PS7_i_n_230,
      DMA3DATYPE(0) => PS7_i_n_231,
      DMA3DAVALID => PS7_i_n_9,
      DMA3DRLAST => '0',
      DMA3DRREADY => PS7_i_n_10,
      DMA3DRTYPE(1 downto 0) => B"00",
      DMA3DRVALID => '0',
      DMA3RSTN => PS7_i_n_11,
      EMIOCAN0PHYRX => '0',
      EMIOCAN0PHYTX => PS7_i_n_12,
      EMIOCAN1PHYRX => '0',
      EMIOCAN1PHYTX => PS7_i_n_13,
      EMIOENET0EXTINTIN => '0',
      EMIOENET0GMIICOL => '0',
      EMIOENET0GMIICRS => '0',
      EMIOENET0GMIIRXCLK => '0',
      EMIOENET0GMIIRXD(7 downto 0) => B"00000000",
      EMIOENET0GMIIRXDV => '0',
      EMIOENET0GMIIRXER => '0',
      EMIOENET0GMIITXCLK => '0',
      EMIOENET0GMIITXD(7 downto 0) => NLW_PS7_i_EMIOENET0GMIITXD_UNCONNECTED(7 downto 0),
      EMIOENET0GMIITXEN => NLW_PS7_i_EMIOENET0GMIITXEN_UNCONNECTED,
      EMIOENET0GMIITXER => NLW_PS7_i_EMIOENET0GMIITXER_UNCONNECTED,
      EMIOENET0MDIOI => '0',
      EMIOENET0MDIOMDC => PS7_i_n_16,
      EMIOENET0MDIOO => PS7_i_n_17,
      EMIOENET0MDIOTN => ENET0_MDIO_T_n,
      EMIOENET0PTPDELAYREQRX => PS7_i_n_19,
      EMIOENET0PTPDELAYREQTX => PS7_i_n_20,
      EMIOENET0PTPPDELAYREQRX => PS7_i_n_21,
      EMIOENET0PTPPDELAYREQTX => PS7_i_n_22,
      EMIOENET0PTPPDELAYRESPRX => PS7_i_n_23,
      EMIOENET0PTPPDELAYRESPTX => PS7_i_n_24,
      EMIOENET0PTPSYNCFRAMERX => PS7_i_n_25,
      EMIOENET0PTPSYNCFRAMETX => PS7_i_n_26,
      EMIOENET0SOFRX => PS7_i_n_27,
      EMIOENET0SOFTX => PS7_i_n_28,
      EMIOENET1EXTINTIN => '0',
      EMIOENET1GMIICOL => '0',
      EMIOENET1GMIICRS => '0',
      EMIOENET1GMIIRXCLK => '0',
      EMIOENET1GMIIRXD(7 downto 0) => B"00000000",
      EMIOENET1GMIIRXDV => '0',
      EMIOENET1GMIIRXER => '0',
      EMIOENET1GMIITXCLK => '0',
      EMIOENET1GMIITXD(7 downto 0) => NLW_PS7_i_EMIOENET1GMIITXD_UNCONNECTED(7 downto 0),
      EMIOENET1GMIITXEN => NLW_PS7_i_EMIOENET1GMIITXEN_UNCONNECTED,
      EMIOENET1GMIITXER => NLW_PS7_i_EMIOENET1GMIITXER_UNCONNECTED,
      EMIOENET1MDIOI => '0',
      EMIOENET1MDIOMDC => PS7_i_n_31,
      EMIOENET1MDIOO => PS7_i_n_32,
      EMIOENET1MDIOTN => ENET1_MDIO_T_n,
      EMIOENET1PTPDELAYREQRX => PS7_i_n_34,
      EMIOENET1PTPDELAYREQTX => PS7_i_n_35,
      EMIOENET1PTPPDELAYREQRX => PS7_i_n_36,
      EMIOENET1PTPPDELAYREQTX => PS7_i_n_37,
      EMIOENET1PTPPDELAYRESPRX => PS7_i_n_38,
      EMIOENET1PTPPDELAYRESPTX => PS7_i_n_39,
      EMIOENET1PTPSYNCFRAMERX => PS7_i_n_40,
      EMIOENET1PTPSYNCFRAMETX => PS7_i_n_41,
      EMIOENET1SOFRX => PS7_i_n_42,
      EMIOENET1SOFTX => PS7_i_n_43,
      EMIOGPIOI(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      EMIOGPIOO(63) => PS7_i_n_873,
      EMIOGPIOO(62) => PS7_i_n_874,
      EMIOGPIOO(61) => PS7_i_n_875,
      EMIOGPIOO(60) => PS7_i_n_876,
      EMIOGPIOO(59) => PS7_i_n_877,
      EMIOGPIOO(58) => PS7_i_n_878,
      EMIOGPIOO(57) => PS7_i_n_879,
      EMIOGPIOO(56) => PS7_i_n_880,
      EMIOGPIOO(55) => PS7_i_n_881,
      EMIOGPIOO(54) => PS7_i_n_882,
      EMIOGPIOO(53) => PS7_i_n_883,
      EMIOGPIOO(52) => PS7_i_n_884,
      EMIOGPIOO(51) => PS7_i_n_885,
      EMIOGPIOO(50) => PS7_i_n_886,
      EMIOGPIOO(49) => PS7_i_n_887,
      EMIOGPIOO(48) => PS7_i_n_888,
      EMIOGPIOO(47) => PS7_i_n_889,
      EMIOGPIOO(46) => PS7_i_n_890,
      EMIOGPIOO(45) => PS7_i_n_891,
      EMIOGPIOO(44) => PS7_i_n_892,
      EMIOGPIOO(43) => PS7_i_n_893,
      EMIOGPIOO(42) => PS7_i_n_894,
      EMIOGPIOO(41) => PS7_i_n_895,
      EMIOGPIOO(40) => PS7_i_n_896,
      EMIOGPIOO(39) => PS7_i_n_897,
      EMIOGPIOO(38) => PS7_i_n_898,
      EMIOGPIOO(37) => PS7_i_n_899,
      EMIOGPIOO(36) => PS7_i_n_900,
      EMIOGPIOO(35) => PS7_i_n_901,
      EMIOGPIOO(34) => PS7_i_n_902,
      EMIOGPIOO(33) => PS7_i_n_903,
      EMIOGPIOO(32) => PS7_i_n_904,
      EMIOGPIOO(31) => PS7_i_n_905,
      EMIOGPIOO(30) => PS7_i_n_906,
      EMIOGPIOO(29) => PS7_i_n_907,
      EMIOGPIOO(28) => PS7_i_n_908,
      EMIOGPIOO(27) => PS7_i_n_909,
      EMIOGPIOO(26) => PS7_i_n_910,
      EMIOGPIOO(25) => PS7_i_n_911,
      EMIOGPIOO(24) => PS7_i_n_912,
      EMIOGPIOO(23) => PS7_i_n_913,
      EMIOGPIOO(22) => PS7_i_n_914,
      EMIOGPIOO(21) => PS7_i_n_915,
      EMIOGPIOO(20) => PS7_i_n_916,
      EMIOGPIOO(19) => PS7_i_n_917,
      EMIOGPIOO(18) => PS7_i_n_918,
      EMIOGPIOO(17) => PS7_i_n_919,
      EMIOGPIOO(16) => PS7_i_n_920,
      EMIOGPIOO(15) => PS7_i_n_921,
      EMIOGPIOO(14) => PS7_i_n_922,
      EMIOGPIOO(13) => PS7_i_n_923,
      EMIOGPIOO(12) => PS7_i_n_924,
      EMIOGPIOO(11) => PS7_i_n_925,
      EMIOGPIOO(10) => PS7_i_n_926,
      EMIOGPIOO(9) => PS7_i_n_927,
      EMIOGPIOO(8) => PS7_i_n_928,
      EMIOGPIOO(7) => PS7_i_n_929,
      EMIOGPIOO(6) => PS7_i_n_930,
      EMIOGPIOO(5) => PS7_i_n_931,
      EMIOGPIOO(4) => PS7_i_n_932,
      EMIOGPIOO(3) => PS7_i_n_933,
      EMIOGPIOO(2) => PS7_i_n_934,
      EMIOGPIOO(1) => PS7_i_n_935,
      EMIOGPIOO(0) => PS7_i_n_936,
      EMIOGPIOTN(63 downto 0) => gpio_out_t_n(63 downto 0),
      EMIOI2C0SCLI => '0',
      EMIOI2C0SCLO => PS7_i_n_44,
      EMIOI2C0SCLTN => I2C0_SCL_T_n,
      EMIOI2C0SDAI => '0',
      EMIOI2C0SDAO => PS7_i_n_46,
      EMIOI2C0SDATN => I2C0_SDA_T_n,
      EMIOI2C1SCLI => '0',
      EMIOI2C1SCLO => PS7_i_n_48,
      EMIOI2C1SCLTN => I2C1_SCL_T_n,
      EMIOI2C1SDAI => '0',
      EMIOI2C1SDAO => PS7_i_n_50,
      EMIOI2C1SDATN => I2C1_SDA_T_n,
      EMIOPJTAGTCK => '0',
      EMIOPJTAGTDI => '0',
      EMIOPJTAGTDO => NLW_PS7_i_EMIOPJTAGTDO_UNCONNECTED,
      EMIOPJTAGTDTN => NLW_PS7_i_EMIOPJTAGTDTN_UNCONNECTED,
      EMIOPJTAGTMS => '0',
      EMIOSDIO0BUSPOW => PS7_i_n_54,
      EMIOSDIO0BUSVOLT(2) => PS7_i_n_321,
      EMIOSDIO0BUSVOLT(1) => PS7_i_n_322,
      EMIOSDIO0BUSVOLT(0) => PS7_i_n_323,
      EMIOSDIO0CDN => '0',
      EMIOSDIO0CLK => PS7_i_n_55,
      EMIOSDIO0CLKFB => '0',
      EMIOSDIO0CMDI => '0',
      EMIOSDIO0CMDO => PS7_i_n_56,
      EMIOSDIO0CMDTN => SDIO0_CMD_T_n,
      EMIOSDIO0DATAI(3 downto 0) => B"0000",
      EMIOSDIO0DATAO(3) => PS7_i_n_689,
      EMIOSDIO0DATAO(2) => PS7_i_n_690,
      EMIOSDIO0DATAO(1) => PS7_i_n_691,
      EMIOSDIO0DATAO(0) => PS7_i_n_692,
      EMIOSDIO0DATATN(3 downto 0) => SDIO0_DATA_T_n(3 downto 0),
      EMIOSDIO0LED => PS7_i_n_58,
      EMIOSDIO0WP => '0',
      EMIOSDIO1BUSPOW => PS7_i_n_59,
      EMIOSDIO1BUSVOLT(2) => PS7_i_n_324,
      EMIOSDIO1BUSVOLT(1) => PS7_i_n_325,
      EMIOSDIO1BUSVOLT(0) => PS7_i_n_326,
      EMIOSDIO1CDN => '0',
      EMIOSDIO1CLK => PS7_i_n_60,
      EMIOSDIO1CLKFB => '0',
      EMIOSDIO1CMDI => '0',
      EMIOSDIO1CMDO => PS7_i_n_61,
      EMIOSDIO1CMDTN => SDIO1_CMD_T_n,
      EMIOSDIO1DATAI(3 downto 0) => B"0000",
      EMIOSDIO1DATAO(3) => PS7_i_n_697,
      EMIOSDIO1DATAO(2) => PS7_i_n_698,
      EMIOSDIO1DATAO(1) => PS7_i_n_699,
      EMIOSDIO1DATAO(0) => PS7_i_n_700,
      EMIOSDIO1DATATN(3 downto 0) => SDIO1_DATA_T_n(3 downto 0),
      EMIOSDIO1LED => PS7_i_n_63,
      EMIOSDIO1WP => '0',
      EMIOSPI0MI => '0',
      EMIOSPI0MO => PS7_i_n_64,
      EMIOSPI0MOTN => SPI0_MOSI_T_n,
      EMIOSPI0SCLKI => '0',
      EMIOSPI0SCLKO => PS7_i_n_66,
      EMIOSPI0SCLKTN => SPI0_SCLK_T_n,
      EMIOSPI0SI => '0',
      EMIOSPI0SO => PS7_i_n_68,
      EMIOSPI0SSIN => '0',
      EMIOSPI0SSNTN => SPI0_SS_T_n,
      EMIOSPI0SSON(2) => PS7_i_n_327,
      EMIOSPI0SSON(1) => PS7_i_n_328,
      EMIOSPI0SSON(0) => PS7_i_n_329,
      EMIOSPI0STN => SPI0_MISO_T_n,
      EMIOSPI1MI => '0',
      EMIOSPI1MO => PS7_i_n_71,
      EMIOSPI1MOTN => SPI1_MOSI_T_n,
      EMIOSPI1SCLKI => '0',
      EMIOSPI1SCLKO => PS7_i_n_73,
      EMIOSPI1SCLKTN => SPI1_SCLK_T_n,
      EMIOSPI1SI => '0',
      EMIOSPI1SO => PS7_i_n_75,
      EMIOSPI1SSIN => '0',
      EMIOSPI1SSNTN => SPI1_SS_T_n,
      EMIOSPI1SSON(2) => PS7_i_n_330,
      EMIOSPI1SSON(1) => PS7_i_n_331,
      EMIOSPI1SSON(0) => PS7_i_n_332,
      EMIOSPI1STN => SPI1_MISO_T_n,
      EMIOSRAMINTIN => '0',
      EMIOTRACECLK => '0',
      EMIOTRACECTL => NLW_PS7_i_EMIOTRACECTL_UNCONNECTED,
      EMIOTRACEDATA(31 downto 0) => NLW_PS7_i_EMIOTRACEDATA_UNCONNECTED(31 downto 0),
      EMIOTTC0CLKI(2 downto 0) => B"000",
      EMIOTTC0WAVEO(2) => PS7_i_n_333,
      EMIOTTC0WAVEO(1) => PS7_i_n_334,
      EMIOTTC0WAVEO(0) => PS7_i_n_335,
      EMIOTTC1CLKI(2 downto 0) => B"000",
      EMIOTTC1WAVEO(2) => PS7_i_n_336,
      EMIOTTC1WAVEO(1) => PS7_i_n_337,
      EMIOTTC1WAVEO(0) => PS7_i_n_338,
      EMIOUART0CTSN => '0',
      EMIOUART0DCDN => '0',
      EMIOUART0DSRN => '0',
      EMIOUART0DTRN => PS7_i_n_79,
      EMIOUART0RIN => '0',
      EMIOUART0RTSN => PS7_i_n_80,
      EMIOUART0RX => '1',
      EMIOUART0TX => PS7_i_n_81,
      EMIOUART1CTSN => '0',
      EMIOUART1DCDN => '0',
      EMIOUART1DSRN => '0',
      EMIOUART1DTRN => PS7_i_n_82,
      EMIOUART1RIN => '0',
      EMIOUART1RTSN => PS7_i_n_83,
      EMIOUART1RX => '1',
      EMIOUART1TX => PS7_i_n_84,
      EMIOUSB0PORTINDCTL(1) => PS7_i_n_232,
      EMIOUSB0PORTINDCTL(0) => PS7_i_n_233,
      EMIOUSB0VBUSPWRFAULT => '0',
      EMIOUSB0VBUSPWRSELECT => PS7_i_n_85,
      EMIOUSB1PORTINDCTL(1) => PS7_i_n_234,
      EMIOUSB1PORTINDCTL(0) => PS7_i_n_235,
      EMIOUSB1VBUSPWRFAULT => '0',
      EMIOUSB1VBUSPWRSELECT => PS7_i_n_86,
      EMIOWDTCLKI => '0',
      EMIOWDTRSTO => PS7_i_n_87,
      EVENTEVENTI => '0',
      EVENTEVENTO => PS7_i_n_88,
      EVENTSTANDBYWFE(1) => PS7_i_n_236,
      EVENTSTANDBYWFE(0) => PS7_i_n_237,
      EVENTSTANDBYWFI(1) => PS7_i_n_238,
      EVENTSTANDBYWFI(0) => PS7_i_n_239,
      FCLKCLK(3) => PS7_i_n_705,
      FCLKCLK(2) => PS7_i_n_706,
      FCLKCLK(1 downto 0) => FCLK_CLK_unbuffered(1 downto 0),
      FCLKCLKTRIGN(3 downto 0) => B"0000",
      FCLKRESETN(3) => PS7_i_n_709,
      FCLKRESETN(2) => PS7_i_n_710,
      FCLKRESETN(1) => PS7_i_n_711,
      FCLKRESETN(0) => FCLK_RESET0_N,
      FPGAIDLEN => '0',
      FTMDTRACEINATID(3 downto 0) => B"0000",
      FTMDTRACEINCLOCK => '0',
      FTMDTRACEINDATA(31 downto 0) => B"00000000000000000000000000000000",
      FTMDTRACEINVALID => '0',
      FTMTF2PDEBUG(31 downto 0) => B"00000000000000000000000000000000",
      FTMTF2PTRIG(3 downto 0) => B"0000",
      FTMTF2PTRIGACK(3) => PS7_i_n_713,
      FTMTF2PTRIGACK(2) => PS7_i_n_714,
      FTMTF2PTRIGACK(1) => PS7_i_n_715,
      FTMTF2PTRIGACK(0) => PS7_i_n_716,
      FTMTP2FDEBUG(31) => PS7_i_n_401,
      FTMTP2FDEBUG(30) => PS7_i_n_402,
      FTMTP2FDEBUG(29) => PS7_i_n_403,
      FTMTP2FDEBUG(28) => PS7_i_n_404,
      FTMTP2FDEBUG(27) => PS7_i_n_405,
      FTMTP2FDEBUG(26) => PS7_i_n_406,
      FTMTP2FDEBUG(25) => PS7_i_n_407,
      FTMTP2FDEBUG(24) => PS7_i_n_408,
      FTMTP2FDEBUG(23) => PS7_i_n_409,
      FTMTP2FDEBUG(22) => PS7_i_n_410,
      FTMTP2FDEBUG(21) => PS7_i_n_411,
      FTMTP2FDEBUG(20) => PS7_i_n_412,
      FTMTP2FDEBUG(19) => PS7_i_n_413,
      FTMTP2FDEBUG(18) => PS7_i_n_414,
      FTMTP2FDEBUG(17) => PS7_i_n_415,
      FTMTP2FDEBUG(16) => PS7_i_n_416,
      FTMTP2FDEBUG(15) => PS7_i_n_417,
      FTMTP2FDEBUG(14) => PS7_i_n_418,
      FTMTP2FDEBUG(13) => PS7_i_n_419,
      FTMTP2FDEBUG(12) => PS7_i_n_420,
      FTMTP2FDEBUG(11) => PS7_i_n_421,
      FTMTP2FDEBUG(10) => PS7_i_n_422,
      FTMTP2FDEBUG(9) => PS7_i_n_423,
      FTMTP2FDEBUG(8) => PS7_i_n_424,
      FTMTP2FDEBUG(7) => PS7_i_n_425,
      FTMTP2FDEBUG(6) => PS7_i_n_426,
      FTMTP2FDEBUG(5) => PS7_i_n_427,
      FTMTP2FDEBUG(4) => PS7_i_n_428,
      FTMTP2FDEBUG(3) => PS7_i_n_429,
      FTMTP2FDEBUG(2) => PS7_i_n_430,
      FTMTP2FDEBUG(1) => PS7_i_n_431,
      FTMTP2FDEBUG(0) => PS7_i_n_432,
      FTMTP2FTRIG(3) => PS7_i_n_717,
      FTMTP2FTRIG(2) => PS7_i_n_718,
      FTMTP2FTRIG(1) => PS7_i_n_719,
      FTMTP2FTRIG(0) => PS7_i_n_720,
      FTMTP2FTRIGACK(3 downto 0) => B"0000",
      IRQF2P(19 downto 0) => B"00000000000000000000",
      IRQP2F(28) => PS7_i_n_292,
      IRQP2F(27) => PS7_i_n_293,
      IRQP2F(26) => PS7_i_n_294,
      IRQP2F(25) => PS7_i_n_295,
      IRQP2F(24) => PS7_i_n_296,
      IRQP2F(23) => PS7_i_n_297,
      IRQP2F(22) => PS7_i_n_298,
      IRQP2F(21) => PS7_i_n_299,
      IRQP2F(20) => PS7_i_n_300,
      IRQP2F(19) => PS7_i_n_301,
      IRQP2F(18) => PS7_i_n_302,
      IRQP2F(17) => PS7_i_n_303,
      IRQP2F(16) => PS7_i_n_304,
      IRQP2F(15) => PS7_i_n_305,
      IRQP2F(14) => PS7_i_n_306,
      IRQP2F(13) => PS7_i_n_307,
      IRQP2F(12) => PS7_i_n_308,
      IRQP2F(11) => PS7_i_n_309,
      IRQP2F(10) => PS7_i_n_310,
      IRQP2F(9) => PS7_i_n_311,
      IRQP2F(8) => PS7_i_n_312,
      IRQP2F(7) => PS7_i_n_313,
      IRQP2F(6) => PS7_i_n_314,
      IRQP2F(5) => PS7_i_n_315,
      IRQP2F(4) => PS7_i_n_316,
      IRQP2F(3) => PS7_i_n_317,
      IRQP2F(2) => PS7_i_n_318,
      IRQP2F(1) => PS7_i_n_319,
      IRQP2F(0) => PS7_i_n_320,
      MAXIGP0ACLK => \^fclk_clk0\,
      MAXIGP0ARADDR(31 downto 0) => M_AXI_GP0_ARADDR(31 downto 0),
      MAXIGP0ARBURST(1 downto 0) => M_AXI_GP0_ARBURST(1 downto 0),
      MAXIGP0ARCACHE(3) => PS7_i_n_721,
      MAXIGP0ARCACHE(2) => PS7_i_n_722,
      MAXIGP0ARCACHE(1) => NLW_PS7_i_MAXIGP0ARCACHE_UNCONNECTED(1),
      MAXIGP0ARCACHE(0) => PS7_i_n_724,
      MAXIGP0ARESETN => PS7_i_n_89,
      MAXIGP0ARID(11 downto 0) => M_AXI_GP0_ARID(11 downto 0),
      MAXIGP0ARLEN(3 downto 0) => M_AXI_GP0_ARLEN(3 downto 0),
      MAXIGP0ARLOCK(1) => PS7_i_n_242,
      MAXIGP0ARLOCK(0) => PS7_i_n_243,
      MAXIGP0ARPROT(2 downto 0) => M_AXI_GP0_ARPROT(2 downto 0),
      MAXIGP0ARQOS(3) => PS7_i_n_729,
      MAXIGP0ARQOS(2) => PS7_i_n_730,
      MAXIGP0ARQOS(1) => PS7_i_n_731,
      MAXIGP0ARQOS(0) => PS7_i_n_732,
      MAXIGP0ARREADY => M_AXI_GP0_ARREADY,
      MAXIGP0ARSIZE(1 downto 0) => \^m_axi_gp0_arsize\(1 downto 0),
      MAXIGP0ARVALID => M_AXI_GP0_ARVALID,
      MAXIGP0AWADDR(31 downto 0) => M_AXI_GP0_AWADDR(31 downto 0),
      MAXIGP0AWBURST(1 downto 0) => M_AXI_GP0_AWBURST(1 downto 0),
      MAXIGP0AWCACHE(3) => PS7_i_n_733,
      MAXIGP0AWCACHE(2) => PS7_i_n_734,
      MAXIGP0AWCACHE(1) => NLW_PS7_i_MAXIGP0AWCACHE_UNCONNECTED(1),
      MAXIGP0AWCACHE(0) => PS7_i_n_736,
      MAXIGP0AWID(11 downto 0) => M_AXI_GP0_AWID(11 downto 0),
      MAXIGP0AWLEN(3 downto 0) => M_AXI_GP0_AWLEN(3 downto 0),
      MAXIGP0AWLOCK(1) => PS7_i_n_248,
      MAXIGP0AWLOCK(0) => PS7_i_n_249,
      MAXIGP0AWPROT(2 downto 0) => M_AXI_GP0_AWPROT(2 downto 0),
      MAXIGP0AWQOS(3) => PS7_i_n_741,
      MAXIGP0AWQOS(2) => PS7_i_n_742,
      MAXIGP0AWQOS(1) => PS7_i_n_743,
      MAXIGP0AWQOS(0) => PS7_i_n_744,
      MAXIGP0AWREADY => M_AXI_GP0_AWREADY,
      MAXIGP0AWSIZE(1 downto 0) => \^m_axi_gp0_awsize\(1 downto 0),
      MAXIGP0AWVALID => M_AXI_GP0_AWVALID,
      MAXIGP0BID(11 downto 0) => M_AXI_GP0_BID(11 downto 0),
      MAXIGP0BREADY => M_AXI_GP0_BREADY,
      MAXIGP0BRESP(1 downto 0) => M_AXI_GP0_BRESP(1 downto 0),
      MAXIGP0BVALID => M_AXI_GP0_BVALID,
      MAXIGP0RDATA(31 downto 0) => M_AXI_GP0_RDATA(31 downto 0),
      MAXIGP0RID(11 downto 0) => M_AXI_GP0_RID(11 downto 0),
      MAXIGP0RLAST => M_AXI_GP0_RLAST,
      MAXIGP0RREADY => M_AXI_GP0_RREADY,
      MAXIGP0RRESP(1 downto 0) => M_AXI_GP0_RRESP(1 downto 0),
      MAXIGP0RVALID => M_AXI_GP0_RVALID,
      MAXIGP0WDATA(31 downto 0) => M_AXI_GP0_WDATA(31 downto 0),
      MAXIGP0WID(11) => PS7_i_n_176,
      MAXIGP0WID(10) => PS7_i_n_177,
      MAXIGP0WID(9) => PS7_i_n_178,
      MAXIGP0WID(8) => PS7_i_n_179,
      MAXIGP0WID(7) => PS7_i_n_180,
      MAXIGP0WID(6) => PS7_i_n_181,
      MAXIGP0WID(5) => PS7_i_n_182,
      MAXIGP0WID(4) => PS7_i_n_183,
      MAXIGP0WID(3) => PS7_i_n_184,
      MAXIGP0WID(2) => PS7_i_n_185,
      MAXIGP0WID(1) => PS7_i_n_186,
      MAXIGP0WID(0) => PS7_i_n_187,
      MAXIGP0WLAST => PS7_i_n_94,
      MAXIGP0WREADY => M_AXI_GP0_WREADY,
      MAXIGP0WSTRB(3 downto 0) => M_AXI_GP0_WSTRB(3 downto 0),
      MAXIGP0WVALID => M_AXI_GP0_WVALID,
      MAXIGP1ACLK => '0',
      MAXIGP1ARADDR(31) => PS7_i_n_529,
      MAXIGP1ARADDR(30) => PS7_i_n_530,
      MAXIGP1ARADDR(29) => PS7_i_n_531,
      MAXIGP1ARADDR(28) => PS7_i_n_532,
      MAXIGP1ARADDR(27) => PS7_i_n_533,
      MAXIGP1ARADDR(26) => PS7_i_n_534,
      MAXIGP1ARADDR(25) => PS7_i_n_535,
      MAXIGP1ARADDR(24) => PS7_i_n_536,
      MAXIGP1ARADDR(23) => PS7_i_n_537,
      MAXIGP1ARADDR(22) => PS7_i_n_538,
      MAXIGP1ARADDR(21) => PS7_i_n_539,
      MAXIGP1ARADDR(20) => PS7_i_n_540,
      MAXIGP1ARADDR(19) => PS7_i_n_541,
      MAXIGP1ARADDR(18) => PS7_i_n_542,
      MAXIGP1ARADDR(17) => PS7_i_n_543,
      MAXIGP1ARADDR(16) => PS7_i_n_544,
      MAXIGP1ARADDR(15) => PS7_i_n_545,
      MAXIGP1ARADDR(14) => PS7_i_n_546,
      MAXIGP1ARADDR(13) => PS7_i_n_547,
      MAXIGP1ARADDR(12) => PS7_i_n_548,
      MAXIGP1ARADDR(11) => PS7_i_n_549,
      MAXIGP1ARADDR(10) => PS7_i_n_550,
      MAXIGP1ARADDR(9) => PS7_i_n_551,
      MAXIGP1ARADDR(8) => PS7_i_n_552,
      MAXIGP1ARADDR(7) => PS7_i_n_553,
      MAXIGP1ARADDR(6) => PS7_i_n_554,
      MAXIGP1ARADDR(5) => PS7_i_n_555,
      MAXIGP1ARADDR(4) => PS7_i_n_556,
      MAXIGP1ARADDR(3) => PS7_i_n_557,
      MAXIGP1ARADDR(2) => PS7_i_n_558,
      MAXIGP1ARADDR(1) => PS7_i_n_559,
      MAXIGP1ARADDR(0) => PS7_i_n_560,
      MAXIGP1ARBURST(1) => PS7_i_n_252,
      MAXIGP1ARBURST(0) => PS7_i_n_253,
      MAXIGP1ARCACHE(3) => PS7_i_n_749,
      MAXIGP1ARCACHE(2) => PS7_i_n_750,
      MAXIGP1ARCACHE(1) => NLW_PS7_i_MAXIGP1ARCACHE_UNCONNECTED(1),
      MAXIGP1ARCACHE(0) => PS7_i_n_752,
      MAXIGP1ARESETN => PS7_i_n_96,
      MAXIGP1ARID(11) => PS7_i_n_188,
      MAXIGP1ARID(10) => PS7_i_n_189,
      MAXIGP1ARID(9) => PS7_i_n_190,
      MAXIGP1ARID(8) => PS7_i_n_191,
      MAXIGP1ARID(7) => PS7_i_n_192,
      MAXIGP1ARID(6) => PS7_i_n_193,
      MAXIGP1ARID(5) => PS7_i_n_194,
      MAXIGP1ARID(4) => PS7_i_n_195,
      MAXIGP1ARID(3) => PS7_i_n_196,
      MAXIGP1ARID(2) => PS7_i_n_197,
      MAXIGP1ARID(1) => PS7_i_n_198,
      MAXIGP1ARID(0) => PS7_i_n_199,
      MAXIGP1ARLEN(3) => PS7_i_n_753,
      MAXIGP1ARLEN(2) => PS7_i_n_754,
      MAXIGP1ARLEN(1) => PS7_i_n_755,
      MAXIGP1ARLEN(0) => PS7_i_n_756,
      MAXIGP1ARLOCK(1) => PS7_i_n_254,
      MAXIGP1ARLOCK(0) => PS7_i_n_255,
      MAXIGP1ARPROT(2) => PS7_i_n_345,
      MAXIGP1ARPROT(1) => PS7_i_n_346,
      MAXIGP1ARPROT(0) => PS7_i_n_347,
      MAXIGP1ARQOS(3) => PS7_i_n_757,
      MAXIGP1ARQOS(2) => PS7_i_n_758,
      MAXIGP1ARQOS(1) => PS7_i_n_759,
      MAXIGP1ARQOS(0) => PS7_i_n_760,
      MAXIGP1ARREADY => '0',
      MAXIGP1ARSIZE(1) => PS7_i_n_256,
      MAXIGP1ARSIZE(0) => PS7_i_n_257,
      MAXIGP1ARVALID => PS7_i_n_97,
      MAXIGP1AWADDR(31) => PS7_i_n_561,
      MAXIGP1AWADDR(30) => PS7_i_n_562,
      MAXIGP1AWADDR(29) => PS7_i_n_563,
      MAXIGP1AWADDR(28) => PS7_i_n_564,
      MAXIGP1AWADDR(27) => PS7_i_n_565,
      MAXIGP1AWADDR(26) => PS7_i_n_566,
      MAXIGP1AWADDR(25) => PS7_i_n_567,
      MAXIGP1AWADDR(24) => PS7_i_n_568,
      MAXIGP1AWADDR(23) => PS7_i_n_569,
      MAXIGP1AWADDR(22) => PS7_i_n_570,
      MAXIGP1AWADDR(21) => PS7_i_n_571,
      MAXIGP1AWADDR(20) => PS7_i_n_572,
      MAXIGP1AWADDR(19) => PS7_i_n_573,
      MAXIGP1AWADDR(18) => PS7_i_n_574,
      MAXIGP1AWADDR(17) => PS7_i_n_575,
      MAXIGP1AWADDR(16) => PS7_i_n_576,
      MAXIGP1AWADDR(15) => PS7_i_n_577,
      MAXIGP1AWADDR(14) => PS7_i_n_578,
      MAXIGP1AWADDR(13) => PS7_i_n_579,
      MAXIGP1AWADDR(12) => PS7_i_n_580,
      MAXIGP1AWADDR(11) => PS7_i_n_581,
      MAXIGP1AWADDR(10) => PS7_i_n_582,
      MAXIGP1AWADDR(9) => PS7_i_n_583,
      MAXIGP1AWADDR(8) => PS7_i_n_584,
      MAXIGP1AWADDR(7) => PS7_i_n_585,
      MAXIGP1AWADDR(6) => PS7_i_n_586,
      MAXIGP1AWADDR(5) => PS7_i_n_587,
      MAXIGP1AWADDR(4) => PS7_i_n_588,
      MAXIGP1AWADDR(3) => PS7_i_n_589,
      MAXIGP1AWADDR(2) => PS7_i_n_590,
      MAXIGP1AWADDR(1) => PS7_i_n_591,
      MAXIGP1AWADDR(0) => PS7_i_n_592,
      MAXIGP1AWBURST(1) => PS7_i_n_258,
      MAXIGP1AWBURST(0) => PS7_i_n_259,
      MAXIGP1AWCACHE(3) => PS7_i_n_761,
      MAXIGP1AWCACHE(2) => PS7_i_n_762,
      MAXIGP1AWCACHE(1) => NLW_PS7_i_MAXIGP1AWCACHE_UNCONNECTED(1),
      MAXIGP1AWCACHE(0) => PS7_i_n_764,
      MAXIGP1AWID(11) => PS7_i_n_200,
      MAXIGP1AWID(10) => PS7_i_n_201,
      MAXIGP1AWID(9) => PS7_i_n_202,
      MAXIGP1AWID(8) => PS7_i_n_203,
      MAXIGP1AWID(7) => PS7_i_n_204,
      MAXIGP1AWID(6) => PS7_i_n_205,
      MAXIGP1AWID(5) => PS7_i_n_206,
      MAXIGP1AWID(4) => PS7_i_n_207,
      MAXIGP1AWID(3) => PS7_i_n_208,
      MAXIGP1AWID(2) => PS7_i_n_209,
      MAXIGP1AWID(1) => PS7_i_n_210,
      MAXIGP1AWID(0) => PS7_i_n_211,
      MAXIGP1AWLEN(3) => PS7_i_n_765,
      MAXIGP1AWLEN(2) => PS7_i_n_766,
      MAXIGP1AWLEN(1) => PS7_i_n_767,
      MAXIGP1AWLEN(0) => PS7_i_n_768,
      MAXIGP1AWLOCK(1) => PS7_i_n_260,
      MAXIGP1AWLOCK(0) => PS7_i_n_261,
      MAXIGP1AWPROT(2) => PS7_i_n_348,
      MAXIGP1AWPROT(1) => PS7_i_n_349,
      MAXIGP1AWPROT(0) => PS7_i_n_350,
      MAXIGP1AWQOS(3) => PS7_i_n_769,
      MAXIGP1AWQOS(2) => PS7_i_n_770,
      MAXIGP1AWQOS(1) => PS7_i_n_771,
      MAXIGP1AWQOS(0) => PS7_i_n_772,
      MAXIGP1AWREADY => '0',
      MAXIGP1AWSIZE(1) => PS7_i_n_262,
      MAXIGP1AWSIZE(0) => PS7_i_n_263,
      MAXIGP1AWVALID => PS7_i_n_98,
      MAXIGP1BID(11 downto 0) => B"000000000000",
      MAXIGP1BREADY => PS7_i_n_99,
      MAXIGP1BRESP(1 downto 0) => B"00",
      MAXIGP1BVALID => '0',
      MAXIGP1RDATA(31 downto 0) => B"00000000000000000000000000000000",
      MAXIGP1RID(11 downto 0) => B"000000000000",
      MAXIGP1RLAST => '0',
      MAXIGP1RREADY => PS7_i_n_100,
      MAXIGP1RRESP(1 downto 0) => B"00",
      MAXIGP1RVALID => '0',
      MAXIGP1WDATA(31) => PS7_i_n_593,
      MAXIGP1WDATA(30) => PS7_i_n_594,
      MAXIGP1WDATA(29) => PS7_i_n_595,
      MAXIGP1WDATA(28) => PS7_i_n_596,
      MAXIGP1WDATA(27) => PS7_i_n_597,
      MAXIGP1WDATA(26) => PS7_i_n_598,
      MAXIGP1WDATA(25) => PS7_i_n_599,
      MAXIGP1WDATA(24) => PS7_i_n_600,
      MAXIGP1WDATA(23) => PS7_i_n_601,
      MAXIGP1WDATA(22) => PS7_i_n_602,
      MAXIGP1WDATA(21) => PS7_i_n_603,
      MAXIGP1WDATA(20) => PS7_i_n_604,
      MAXIGP1WDATA(19) => PS7_i_n_605,
      MAXIGP1WDATA(18) => PS7_i_n_606,
      MAXIGP1WDATA(17) => PS7_i_n_607,
      MAXIGP1WDATA(16) => PS7_i_n_608,
      MAXIGP1WDATA(15) => PS7_i_n_609,
      MAXIGP1WDATA(14) => PS7_i_n_610,
      MAXIGP1WDATA(13) => PS7_i_n_611,
      MAXIGP1WDATA(12) => PS7_i_n_612,
      MAXIGP1WDATA(11) => PS7_i_n_613,
      MAXIGP1WDATA(10) => PS7_i_n_614,
      MAXIGP1WDATA(9) => PS7_i_n_615,
      MAXIGP1WDATA(8) => PS7_i_n_616,
      MAXIGP1WDATA(7) => PS7_i_n_617,
      MAXIGP1WDATA(6) => PS7_i_n_618,
      MAXIGP1WDATA(5) => PS7_i_n_619,
      MAXIGP1WDATA(4) => PS7_i_n_620,
      MAXIGP1WDATA(3) => PS7_i_n_621,
      MAXIGP1WDATA(2) => PS7_i_n_622,
      MAXIGP1WDATA(1) => PS7_i_n_623,
      MAXIGP1WDATA(0) => PS7_i_n_624,
      MAXIGP1WID(11) => PS7_i_n_212,
      MAXIGP1WID(10) => PS7_i_n_213,
      MAXIGP1WID(9) => PS7_i_n_214,
      MAXIGP1WID(8) => PS7_i_n_215,
      MAXIGP1WID(7) => PS7_i_n_216,
      MAXIGP1WID(6) => PS7_i_n_217,
      MAXIGP1WID(5) => PS7_i_n_218,
      MAXIGP1WID(4) => PS7_i_n_219,
      MAXIGP1WID(3) => PS7_i_n_220,
      MAXIGP1WID(2) => PS7_i_n_221,
      MAXIGP1WID(1) => PS7_i_n_222,
      MAXIGP1WID(0) => PS7_i_n_223,
      MAXIGP1WLAST => PS7_i_n_101,
      MAXIGP1WREADY => '0',
      MAXIGP1WSTRB(3) => PS7_i_n_773,
      MAXIGP1WSTRB(2) => PS7_i_n_774,
      MAXIGP1WSTRB(1) => PS7_i_n_775,
      MAXIGP1WSTRB(0) => PS7_i_n_776,
      MAXIGP1WVALID => PS7_i_n_102,
      MIO(53 downto 0) => buffered_MIO(53 downto 0),
      PSCLK => buffered_PS_CLK,
      PSPORB => buffered_PS_PORB,
      PSSRSTB => buffered_PS_SRSTB,
      SAXIACPACLK => '0',
      SAXIACPARADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIACPARBURST(1 downto 0) => B"00",
      SAXIACPARCACHE(3 downto 0) => B"0000",
      SAXIACPARESETN => PS7_i_n_103,
      SAXIACPARID(2 downto 0) => B"000",
      SAXIACPARLEN(3 downto 0) => B"0000",
      SAXIACPARLOCK(1 downto 0) => B"00",
      SAXIACPARPROT(2 downto 0) => B"000",
      SAXIACPARQOS(3 downto 0) => B"0000",
      SAXIACPARREADY => PS7_i_n_104,
      SAXIACPARSIZE(1 downto 0) => B"00",
      SAXIACPARUSER(4 downto 0) => B"00000",
      SAXIACPARVALID => '0',
      SAXIACPAWADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIACPAWBURST(1 downto 0) => B"00",
      SAXIACPAWCACHE(3 downto 0) => B"0000",
      SAXIACPAWID(2 downto 0) => B"000",
      SAXIACPAWLEN(3 downto 0) => B"0000",
      SAXIACPAWLOCK(1 downto 0) => B"00",
      SAXIACPAWPROT(2 downto 0) => B"000",
      SAXIACPAWQOS(3 downto 0) => B"0000",
      SAXIACPAWREADY => PS7_i_n_105,
      SAXIACPAWSIZE(1 downto 0) => B"00",
      SAXIACPAWUSER(4 downto 0) => B"00000",
      SAXIACPAWVALID => '0',
      SAXIACPBID(2) => PS7_i_n_351,
      SAXIACPBID(1) => PS7_i_n_352,
      SAXIACPBID(0) => PS7_i_n_353,
      SAXIACPBREADY => '0',
      SAXIACPBRESP(1) => PS7_i_n_264,
      SAXIACPBRESP(0) => PS7_i_n_265,
      SAXIACPBVALID => PS7_i_n_106,
      SAXIACPRDATA(63) => PS7_i_n_1001,
      SAXIACPRDATA(62) => PS7_i_n_1002,
      SAXIACPRDATA(61) => PS7_i_n_1003,
      SAXIACPRDATA(60) => PS7_i_n_1004,
      SAXIACPRDATA(59) => PS7_i_n_1005,
      SAXIACPRDATA(58) => PS7_i_n_1006,
      SAXIACPRDATA(57) => PS7_i_n_1007,
      SAXIACPRDATA(56) => PS7_i_n_1008,
      SAXIACPRDATA(55) => PS7_i_n_1009,
      SAXIACPRDATA(54) => PS7_i_n_1010,
      SAXIACPRDATA(53) => PS7_i_n_1011,
      SAXIACPRDATA(52) => PS7_i_n_1012,
      SAXIACPRDATA(51) => PS7_i_n_1013,
      SAXIACPRDATA(50) => PS7_i_n_1014,
      SAXIACPRDATA(49) => PS7_i_n_1015,
      SAXIACPRDATA(48) => PS7_i_n_1016,
      SAXIACPRDATA(47) => PS7_i_n_1017,
      SAXIACPRDATA(46) => PS7_i_n_1018,
      SAXIACPRDATA(45) => PS7_i_n_1019,
      SAXIACPRDATA(44) => PS7_i_n_1020,
      SAXIACPRDATA(43) => PS7_i_n_1021,
      SAXIACPRDATA(42) => PS7_i_n_1022,
      SAXIACPRDATA(41) => PS7_i_n_1023,
      SAXIACPRDATA(40) => PS7_i_n_1024,
      SAXIACPRDATA(39) => PS7_i_n_1025,
      SAXIACPRDATA(38) => PS7_i_n_1026,
      SAXIACPRDATA(37) => PS7_i_n_1027,
      SAXIACPRDATA(36) => PS7_i_n_1028,
      SAXIACPRDATA(35) => PS7_i_n_1029,
      SAXIACPRDATA(34) => PS7_i_n_1030,
      SAXIACPRDATA(33) => PS7_i_n_1031,
      SAXIACPRDATA(32) => PS7_i_n_1032,
      SAXIACPRDATA(31) => PS7_i_n_1033,
      SAXIACPRDATA(30) => PS7_i_n_1034,
      SAXIACPRDATA(29) => PS7_i_n_1035,
      SAXIACPRDATA(28) => PS7_i_n_1036,
      SAXIACPRDATA(27) => PS7_i_n_1037,
      SAXIACPRDATA(26) => PS7_i_n_1038,
      SAXIACPRDATA(25) => PS7_i_n_1039,
      SAXIACPRDATA(24) => PS7_i_n_1040,
      SAXIACPRDATA(23) => PS7_i_n_1041,
      SAXIACPRDATA(22) => PS7_i_n_1042,
      SAXIACPRDATA(21) => PS7_i_n_1043,
      SAXIACPRDATA(20) => PS7_i_n_1044,
      SAXIACPRDATA(19) => PS7_i_n_1045,
      SAXIACPRDATA(18) => PS7_i_n_1046,
      SAXIACPRDATA(17) => PS7_i_n_1047,
      SAXIACPRDATA(16) => PS7_i_n_1048,
      SAXIACPRDATA(15) => PS7_i_n_1049,
      SAXIACPRDATA(14) => PS7_i_n_1050,
      SAXIACPRDATA(13) => PS7_i_n_1051,
      SAXIACPRDATA(12) => PS7_i_n_1052,
      SAXIACPRDATA(11) => PS7_i_n_1053,
      SAXIACPRDATA(10) => PS7_i_n_1054,
      SAXIACPRDATA(9) => PS7_i_n_1055,
      SAXIACPRDATA(8) => PS7_i_n_1056,
      SAXIACPRDATA(7) => PS7_i_n_1057,
      SAXIACPRDATA(6) => PS7_i_n_1058,
      SAXIACPRDATA(5) => PS7_i_n_1059,
      SAXIACPRDATA(4) => PS7_i_n_1060,
      SAXIACPRDATA(3) => PS7_i_n_1061,
      SAXIACPRDATA(2) => PS7_i_n_1062,
      SAXIACPRDATA(1) => PS7_i_n_1063,
      SAXIACPRDATA(0) => PS7_i_n_1064,
      SAXIACPRID(2) => PS7_i_n_354,
      SAXIACPRID(1) => PS7_i_n_355,
      SAXIACPRID(0) => PS7_i_n_356,
      SAXIACPRLAST => PS7_i_n_107,
      SAXIACPRREADY => '0',
      SAXIACPRRESP(1) => PS7_i_n_266,
      SAXIACPRRESP(0) => PS7_i_n_267,
      SAXIACPRVALID => PS7_i_n_108,
      SAXIACPWDATA(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      SAXIACPWID(2 downto 0) => B"000",
      SAXIACPWLAST => '0',
      SAXIACPWREADY => PS7_i_n_109,
      SAXIACPWSTRB(7 downto 0) => B"00000000",
      SAXIACPWVALID => '0',
      SAXIGP0ACLK => '0',
      SAXIGP0ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIGP0ARBURST(1 downto 0) => B"00",
      SAXIGP0ARCACHE(3 downto 0) => B"0000",
      SAXIGP0ARESETN => PS7_i_n_110,
      SAXIGP0ARID(5 downto 0) => B"000000",
      SAXIGP0ARLEN(3 downto 0) => B"0000",
      SAXIGP0ARLOCK(1 downto 0) => B"00",
      SAXIGP0ARPROT(2 downto 0) => B"000",
      SAXIGP0ARQOS(3 downto 0) => B"0000",
      SAXIGP0ARREADY => PS7_i_n_111,
      SAXIGP0ARSIZE(1 downto 0) => B"00",
      SAXIGP0ARVALID => '0',
      SAXIGP0AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIGP0AWBURST(1 downto 0) => B"00",
      SAXIGP0AWCACHE(3 downto 0) => B"0000",
      SAXIGP0AWID(5 downto 0) => B"000000",
      SAXIGP0AWLEN(3 downto 0) => B"0000",
      SAXIGP0AWLOCK(1 downto 0) => B"00",
      SAXIGP0AWPROT(2 downto 0) => B"000",
      SAXIGP0AWQOS(3 downto 0) => B"0000",
      SAXIGP0AWREADY => PS7_i_n_112,
      SAXIGP0AWSIZE(1 downto 0) => B"00",
      SAXIGP0AWVALID => '0',
      SAXIGP0BID(5) => PS7_i_n_777,
      SAXIGP0BID(4) => PS7_i_n_778,
      SAXIGP0BID(3) => PS7_i_n_779,
      SAXIGP0BID(2) => PS7_i_n_780,
      SAXIGP0BID(1) => PS7_i_n_781,
      SAXIGP0BID(0) => PS7_i_n_782,
      SAXIGP0BREADY => '0',
      SAXIGP0BRESP(1) => PS7_i_n_268,
      SAXIGP0BRESP(0) => PS7_i_n_269,
      SAXIGP0BVALID => PS7_i_n_113,
      SAXIGP0RDATA(31) => PS7_i_n_625,
      SAXIGP0RDATA(30) => PS7_i_n_626,
      SAXIGP0RDATA(29) => PS7_i_n_627,
      SAXIGP0RDATA(28) => PS7_i_n_628,
      SAXIGP0RDATA(27) => PS7_i_n_629,
      SAXIGP0RDATA(26) => PS7_i_n_630,
      SAXIGP0RDATA(25) => PS7_i_n_631,
      SAXIGP0RDATA(24) => PS7_i_n_632,
      SAXIGP0RDATA(23) => PS7_i_n_633,
      SAXIGP0RDATA(22) => PS7_i_n_634,
      SAXIGP0RDATA(21) => PS7_i_n_635,
      SAXIGP0RDATA(20) => PS7_i_n_636,
      SAXIGP0RDATA(19) => PS7_i_n_637,
      SAXIGP0RDATA(18) => PS7_i_n_638,
      SAXIGP0RDATA(17) => PS7_i_n_639,
      SAXIGP0RDATA(16) => PS7_i_n_640,
      SAXIGP0RDATA(15) => PS7_i_n_641,
      SAXIGP0RDATA(14) => PS7_i_n_642,
      SAXIGP0RDATA(13) => PS7_i_n_643,
      SAXIGP0RDATA(12) => PS7_i_n_644,
      SAXIGP0RDATA(11) => PS7_i_n_645,
      SAXIGP0RDATA(10) => PS7_i_n_646,
      SAXIGP0RDATA(9) => PS7_i_n_647,
      SAXIGP0RDATA(8) => PS7_i_n_648,
      SAXIGP0RDATA(7) => PS7_i_n_649,
      SAXIGP0RDATA(6) => PS7_i_n_650,
      SAXIGP0RDATA(5) => PS7_i_n_651,
      SAXIGP0RDATA(4) => PS7_i_n_652,
      SAXIGP0RDATA(3) => PS7_i_n_653,
      SAXIGP0RDATA(2) => PS7_i_n_654,
      SAXIGP0RDATA(1) => PS7_i_n_655,
      SAXIGP0RDATA(0) => PS7_i_n_656,
      SAXIGP0RID(5) => PS7_i_n_783,
      SAXIGP0RID(4) => PS7_i_n_784,
      SAXIGP0RID(3) => PS7_i_n_785,
      SAXIGP0RID(2) => PS7_i_n_786,
      SAXIGP0RID(1) => PS7_i_n_787,
      SAXIGP0RID(0) => PS7_i_n_788,
      SAXIGP0RLAST => PS7_i_n_114,
      SAXIGP0RREADY => '0',
      SAXIGP0RRESP(1) => PS7_i_n_270,
      SAXIGP0RRESP(0) => PS7_i_n_271,
      SAXIGP0RVALID => PS7_i_n_115,
      SAXIGP0WDATA(31 downto 0) => B"00000000000000000000000000000000",
      SAXIGP0WID(5 downto 0) => B"000000",
      SAXIGP0WLAST => '0',
      SAXIGP0WREADY => PS7_i_n_116,
      SAXIGP0WSTRB(3 downto 0) => B"0000",
      SAXIGP0WVALID => '0',
      SAXIGP1ACLK => '0',
      SAXIGP1ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIGP1ARBURST(1 downto 0) => B"00",
      SAXIGP1ARCACHE(3 downto 0) => B"0000",
      SAXIGP1ARESETN => PS7_i_n_117,
      SAXIGP1ARID(5 downto 0) => B"000000",
      SAXIGP1ARLEN(3 downto 0) => B"0000",
      SAXIGP1ARLOCK(1 downto 0) => B"00",
      SAXIGP1ARPROT(2 downto 0) => B"000",
      SAXIGP1ARQOS(3 downto 0) => B"0000",
      SAXIGP1ARREADY => PS7_i_n_118,
      SAXIGP1ARSIZE(1 downto 0) => B"00",
      SAXIGP1ARVALID => '0',
      SAXIGP1AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIGP1AWBURST(1 downto 0) => B"00",
      SAXIGP1AWCACHE(3 downto 0) => B"0000",
      SAXIGP1AWID(5 downto 0) => B"000000",
      SAXIGP1AWLEN(3 downto 0) => B"0000",
      SAXIGP1AWLOCK(1 downto 0) => B"00",
      SAXIGP1AWPROT(2 downto 0) => B"000",
      SAXIGP1AWQOS(3 downto 0) => B"0000",
      SAXIGP1AWREADY => PS7_i_n_119,
      SAXIGP1AWSIZE(1 downto 0) => B"00",
      SAXIGP1AWVALID => '0',
      SAXIGP1BID(5) => PS7_i_n_789,
      SAXIGP1BID(4) => PS7_i_n_790,
      SAXIGP1BID(3) => PS7_i_n_791,
      SAXIGP1BID(2) => PS7_i_n_792,
      SAXIGP1BID(1) => PS7_i_n_793,
      SAXIGP1BID(0) => PS7_i_n_794,
      SAXIGP1BREADY => '0',
      SAXIGP1BRESP(1) => PS7_i_n_272,
      SAXIGP1BRESP(0) => PS7_i_n_273,
      SAXIGP1BVALID => PS7_i_n_120,
      SAXIGP1RDATA(31) => PS7_i_n_657,
      SAXIGP1RDATA(30) => PS7_i_n_658,
      SAXIGP1RDATA(29) => PS7_i_n_659,
      SAXIGP1RDATA(28) => PS7_i_n_660,
      SAXIGP1RDATA(27) => PS7_i_n_661,
      SAXIGP1RDATA(26) => PS7_i_n_662,
      SAXIGP1RDATA(25) => PS7_i_n_663,
      SAXIGP1RDATA(24) => PS7_i_n_664,
      SAXIGP1RDATA(23) => PS7_i_n_665,
      SAXIGP1RDATA(22) => PS7_i_n_666,
      SAXIGP1RDATA(21) => PS7_i_n_667,
      SAXIGP1RDATA(20) => PS7_i_n_668,
      SAXIGP1RDATA(19) => PS7_i_n_669,
      SAXIGP1RDATA(18) => PS7_i_n_670,
      SAXIGP1RDATA(17) => PS7_i_n_671,
      SAXIGP1RDATA(16) => PS7_i_n_672,
      SAXIGP1RDATA(15) => PS7_i_n_673,
      SAXIGP1RDATA(14) => PS7_i_n_674,
      SAXIGP1RDATA(13) => PS7_i_n_675,
      SAXIGP1RDATA(12) => PS7_i_n_676,
      SAXIGP1RDATA(11) => PS7_i_n_677,
      SAXIGP1RDATA(10) => PS7_i_n_678,
      SAXIGP1RDATA(9) => PS7_i_n_679,
      SAXIGP1RDATA(8) => PS7_i_n_680,
      SAXIGP1RDATA(7) => PS7_i_n_681,
      SAXIGP1RDATA(6) => PS7_i_n_682,
      SAXIGP1RDATA(5) => PS7_i_n_683,
      SAXIGP1RDATA(4) => PS7_i_n_684,
      SAXIGP1RDATA(3) => PS7_i_n_685,
      SAXIGP1RDATA(2) => PS7_i_n_686,
      SAXIGP1RDATA(1) => PS7_i_n_687,
      SAXIGP1RDATA(0) => PS7_i_n_688,
      SAXIGP1RID(5) => PS7_i_n_795,
      SAXIGP1RID(4) => PS7_i_n_796,
      SAXIGP1RID(3) => PS7_i_n_797,
      SAXIGP1RID(2) => PS7_i_n_798,
      SAXIGP1RID(1) => PS7_i_n_799,
      SAXIGP1RID(0) => PS7_i_n_800,
      SAXIGP1RLAST => PS7_i_n_121,
      SAXIGP1RREADY => '0',
      SAXIGP1RRESP(1) => PS7_i_n_274,
      SAXIGP1RRESP(0) => PS7_i_n_275,
      SAXIGP1RVALID => PS7_i_n_122,
      SAXIGP1WDATA(31 downto 0) => B"00000000000000000000000000000000",
      SAXIGP1WID(5 downto 0) => B"000000",
      SAXIGP1WLAST => '0',
      SAXIGP1WREADY => PS7_i_n_123,
      SAXIGP1WSTRB(3 downto 0) => B"0000",
      SAXIGP1WVALID => '0',
      SAXIHP0ACLK => '0',
      SAXIHP0ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIHP0ARBURST(1 downto 0) => B"00",
      SAXIHP0ARCACHE(3 downto 0) => B"0000",
      SAXIHP0ARESETN => PS7_i_n_124,
      SAXIHP0ARID(5 downto 0) => B"000000",
      SAXIHP0ARLEN(3 downto 0) => B"0000",
      SAXIHP0ARLOCK(1 downto 0) => B"00",
      SAXIHP0ARPROT(2 downto 0) => B"000",
      SAXIHP0ARQOS(3 downto 0) => B"0000",
      SAXIHP0ARREADY => PS7_i_n_125,
      SAXIHP0ARSIZE(1 downto 0) => B"00",
      SAXIHP0ARVALID => '0',
      SAXIHP0AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIHP0AWBURST(1 downto 0) => B"00",
      SAXIHP0AWCACHE(3 downto 0) => B"0000",
      SAXIHP0AWID(5 downto 0) => B"000000",
      SAXIHP0AWLEN(3 downto 0) => B"0000",
      SAXIHP0AWLOCK(1 downto 0) => B"00",
      SAXIHP0AWPROT(2 downto 0) => B"000",
      SAXIHP0AWQOS(3 downto 0) => B"0000",
      SAXIHP0AWREADY => PS7_i_n_126,
      SAXIHP0AWSIZE(1 downto 0) => B"00",
      SAXIHP0AWVALID => '0',
      SAXIHP0BID(5) => PS7_i_n_801,
      SAXIHP0BID(4) => PS7_i_n_802,
      SAXIHP0BID(3) => PS7_i_n_803,
      SAXIHP0BID(2) => PS7_i_n_804,
      SAXIHP0BID(1) => PS7_i_n_805,
      SAXIHP0BID(0) => PS7_i_n_806,
      SAXIHP0BREADY => '0',
      SAXIHP0BRESP(1) => PS7_i_n_276,
      SAXIHP0BRESP(0) => PS7_i_n_277,
      SAXIHP0BVALID => PS7_i_n_127,
      SAXIHP0RACOUNT(2) => PS7_i_n_357,
      SAXIHP0RACOUNT(1) => PS7_i_n_358,
      SAXIHP0RACOUNT(0) => PS7_i_n_359,
      SAXIHP0RCOUNT(7) => PS7_i_n_1337,
      SAXIHP0RCOUNT(6) => PS7_i_n_1338,
      SAXIHP0RCOUNT(5) => PS7_i_n_1339,
      SAXIHP0RCOUNT(4) => PS7_i_n_1340,
      SAXIHP0RCOUNT(3) => PS7_i_n_1341,
      SAXIHP0RCOUNT(2) => PS7_i_n_1342,
      SAXIHP0RCOUNT(1) => PS7_i_n_1343,
      SAXIHP0RCOUNT(0) => PS7_i_n_1344,
      SAXIHP0RDATA(63) => PS7_i_n_1065,
      SAXIHP0RDATA(62) => PS7_i_n_1066,
      SAXIHP0RDATA(61) => PS7_i_n_1067,
      SAXIHP0RDATA(60) => PS7_i_n_1068,
      SAXIHP0RDATA(59) => PS7_i_n_1069,
      SAXIHP0RDATA(58) => PS7_i_n_1070,
      SAXIHP0RDATA(57) => PS7_i_n_1071,
      SAXIHP0RDATA(56) => PS7_i_n_1072,
      SAXIHP0RDATA(55) => PS7_i_n_1073,
      SAXIHP0RDATA(54) => PS7_i_n_1074,
      SAXIHP0RDATA(53) => PS7_i_n_1075,
      SAXIHP0RDATA(52) => PS7_i_n_1076,
      SAXIHP0RDATA(51) => PS7_i_n_1077,
      SAXIHP0RDATA(50) => PS7_i_n_1078,
      SAXIHP0RDATA(49) => PS7_i_n_1079,
      SAXIHP0RDATA(48) => PS7_i_n_1080,
      SAXIHP0RDATA(47) => PS7_i_n_1081,
      SAXIHP0RDATA(46) => PS7_i_n_1082,
      SAXIHP0RDATA(45) => PS7_i_n_1083,
      SAXIHP0RDATA(44) => PS7_i_n_1084,
      SAXIHP0RDATA(43) => PS7_i_n_1085,
      SAXIHP0RDATA(42) => PS7_i_n_1086,
      SAXIHP0RDATA(41) => PS7_i_n_1087,
      SAXIHP0RDATA(40) => PS7_i_n_1088,
      SAXIHP0RDATA(39) => PS7_i_n_1089,
      SAXIHP0RDATA(38) => PS7_i_n_1090,
      SAXIHP0RDATA(37) => PS7_i_n_1091,
      SAXIHP0RDATA(36) => PS7_i_n_1092,
      SAXIHP0RDATA(35) => PS7_i_n_1093,
      SAXIHP0RDATA(34) => PS7_i_n_1094,
      SAXIHP0RDATA(33) => PS7_i_n_1095,
      SAXIHP0RDATA(32) => PS7_i_n_1096,
      SAXIHP0RDATA(31) => PS7_i_n_1097,
      SAXIHP0RDATA(30) => PS7_i_n_1098,
      SAXIHP0RDATA(29) => PS7_i_n_1099,
      SAXIHP0RDATA(28) => PS7_i_n_1100,
      SAXIHP0RDATA(27) => PS7_i_n_1101,
      SAXIHP0RDATA(26) => PS7_i_n_1102,
      SAXIHP0RDATA(25) => PS7_i_n_1103,
      SAXIHP0RDATA(24) => PS7_i_n_1104,
      SAXIHP0RDATA(23) => PS7_i_n_1105,
      SAXIHP0RDATA(22) => PS7_i_n_1106,
      SAXIHP0RDATA(21) => PS7_i_n_1107,
      SAXIHP0RDATA(20) => PS7_i_n_1108,
      SAXIHP0RDATA(19) => PS7_i_n_1109,
      SAXIHP0RDATA(18) => PS7_i_n_1110,
      SAXIHP0RDATA(17) => PS7_i_n_1111,
      SAXIHP0RDATA(16) => PS7_i_n_1112,
      SAXIHP0RDATA(15) => PS7_i_n_1113,
      SAXIHP0RDATA(14) => PS7_i_n_1114,
      SAXIHP0RDATA(13) => PS7_i_n_1115,
      SAXIHP0RDATA(12) => PS7_i_n_1116,
      SAXIHP0RDATA(11) => PS7_i_n_1117,
      SAXIHP0RDATA(10) => PS7_i_n_1118,
      SAXIHP0RDATA(9) => PS7_i_n_1119,
      SAXIHP0RDATA(8) => PS7_i_n_1120,
      SAXIHP0RDATA(7) => PS7_i_n_1121,
      SAXIHP0RDATA(6) => PS7_i_n_1122,
      SAXIHP0RDATA(5) => PS7_i_n_1123,
      SAXIHP0RDATA(4) => PS7_i_n_1124,
      SAXIHP0RDATA(3) => PS7_i_n_1125,
      SAXIHP0RDATA(2) => PS7_i_n_1126,
      SAXIHP0RDATA(1) => PS7_i_n_1127,
      SAXIHP0RDATA(0) => PS7_i_n_1128,
      SAXIHP0RDISSUECAP1EN => '0',
      SAXIHP0RID(5) => PS7_i_n_807,
      SAXIHP0RID(4) => PS7_i_n_808,
      SAXIHP0RID(3) => PS7_i_n_809,
      SAXIHP0RID(2) => PS7_i_n_810,
      SAXIHP0RID(1) => PS7_i_n_811,
      SAXIHP0RID(0) => PS7_i_n_812,
      SAXIHP0RLAST => PS7_i_n_128,
      SAXIHP0RREADY => '0',
      SAXIHP0RRESP(1) => PS7_i_n_278,
      SAXIHP0RRESP(0) => PS7_i_n_279,
      SAXIHP0RVALID => PS7_i_n_129,
      SAXIHP0WACOUNT(5) => PS7_i_n_813,
      SAXIHP0WACOUNT(4) => PS7_i_n_814,
      SAXIHP0WACOUNT(3) => PS7_i_n_815,
      SAXIHP0WACOUNT(2) => PS7_i_n_816,
      SAXIHP0WACOUNT(1) => PS7_i_n_817,
      SAXIHP0WACOUNT(0) => PS7_i_n_818,
      SAXIHP0WCOUNT(7) => PS7_i_n_1345,
      SAXIHP0WCOUNT(6) => PS7_i_n_1346,
      SAXIHP0WCOUNT(5) => PS7_i_n_1347,
      SAXIHP0WCOUNT(4) => PS7_i_n_1348,
      SAXIHP0WCOUNT(3) => PS7_i_n_1349,
      SAXIHP0WCOUNT(2) => PS7_i_n_1350,
      SAXIHP0WCOUNT(1) => PS7_i_n_1351,
      SAXIHP0WCOUNT(0) => PS7_i_n_1352,
      SAXIHP0WDATA(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      SAXIHP0WID(5 downto 0) => B"000000",
      SAXIHP0WLAST => '0',
      SAXIHP0WREADY => PS7_i_n_130,
      SAXIHP0WRISSUECAP1EN => '0',
      SAXIHP0WSTRB(7 downto 0) => B"00000000",
      SAXIHP0WVALID => '0',
      SAXIHP1ACLK => '0',
      SAXIHP1ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIHP1ARBURST(1 downto 0) => B"00",
      SAXIHP1ARCACHE(3 downto 0) => B"0000",
      SAXIHP1ARESETN => PS7_i_n_131,
      SAXIHP1ARID(5 downto 0) => B"000000",
      SAXIHP1ARLEN(3 downto 0) => B"0000",
      SAXIHP1ARLOCK(1 downto 0) => B"00",
      SAXIHP1ARPROT(2 downto 0) => B"000",
      SAXIHP1ARQOS(3 downto 0) => B"0000",
      SAXIHP1ARREADY => PS7_i_n_132,
      SAXIHP1ARSIZE(1 downto 0) => B"00",
      SAXIHP1ARVALID => '0',
      SAXIHP1AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIHP1AWBURST(1 downto 0) => B"00",
      SAXIHP1AWCACHE(3 downto 0) => B"0000",
      SAXIHP1AWID(5 downto 0) => B"000000",
      SAXIHP1AWLEN(3 downto 0) => B"0000",
      SAXIHP1AWLOCK(1 downto 0) => B"00",
      SAXIHP1AWPROT(2 downto 0) => B"000",
      SAXIHP1AWQOS(3 downto 0) => B"0000",
      SAXIHP1AWREADY => PS7_i_n_133,
      SAXIHP1AWSIZE(1 downto 0) => B"00",
      SAXIHP1AWVALID => '0',
      SAXIHP1BID(5) => PS7_i_n_819,
      SAXIHP1BID(4) => PS7_i_n_820,
      SAXIHP1BID(3) => PS7_i_n_821,
      SAXIHP1BID(2) => PS7_i_n_822,
      SAXIHP1BID(1) => PS7_i_n_823,
      SAXIHP1BID(0) => PS7_i_n_824,
      SAXIHP1BREADY => '0',
      SAXIHP1BRESP(1) => PS7_i_n_280,
      SAXIHP1BRESP(0) => PS7_i_n_281,
      SAXIHP1BVALID => PS7_i_n_134,
      SAXIHP1RACOUNT(2) => PS7_i_n_360,
      SAXIHP1RACOUNT(1) => PS7_i_n_361,
      SAXIHP1RACOUNT(0) => PS7_i_n_362,
      SAXIHP1RCOUNT(7) => PS7_i_n_1353,
      SAXIHP1RCOUNT(6) => PS7_i_n_1354,
      SAXIHP1RCOUNT(5) => PS7_i_n_1355,
      SAXIHP1RCOUNT(4) => PS7_i_n_1356,
      SAXIHP1RCOUNT(3) => PS7_i_n_1357,
      SAXIHP1RCOUNT(2) => PS7_i_n_1358,
      SAXIHP1RCOUNT(1) => PS7_i_n_1359,
      SAXIHP1RCOUNT(0) => PS7_i_n_1360,
      SAXIHP1RDATA(63) => PS7_i_n_1129,
      SAXIHP1RDATA(62) => PS7_i_n_1130,
      SAXIHP1RDATA(61) => PS7_i_n_1131,
      SAXIHP1RDATA(60) => PS7_i_n_1132,
      SAXIHP1RDATA(59) => PS7_i_n_1133,
      SAXIHP1RDATA(58) => PS7_i_n_1134,
      SAXIHP1RDATA(57) => PS7_i_n_1135,
      SAXIHP1RDATA(56) => PS7_i_n_1136,
      SAXIHP1RDATA(55) => PS7_i_n_1137,
      SAXIHP1RDATA(54) => PS7_i_n_1138,
      SAXIHP1RDATA(53) => PS7_i_n_1139,
      SAXIHP1RDATA(52) => PS7_i_n_1140,
      SAXIHP1RDATA(51) => PS7_i_n_1141,
      SAXIHP1RDATA(50) => PS7_i_n_1142,
      SAXIHP1RDATA(49) => PS7_i_n_1143,
      SAXIHP1RDATA(48) => PS7_i_n_1144,
      SAXIHP1RDATA(47) => PS7_i_n_1145,
      SAXIHP1RDATA(46) => PS7_i_n_1146,
      SAXIHP1RDATA(45) => PS7_i_n_1147,
      SAXIHP1RDATA(44) => PS7_i_n_1148,
      SAXIHP1RDATA(43) => PS7_i_n_1149,
      SAXIHP1RDATA(42) => PS7_i_n_1150,
      SAXIHP1RDATA(41) => PS7_i_n_1151,
      SAXIHP1RDATA(40) => PS7_i_n_1152,
      SAXIHP1RDATA(39) => PS7_i_n_1153,
      SAXIHP1RDATA(38) => PS7_i_n_1154,
      SAXIHP1RDATA(37) => PS7_i_n_1155,
      SAXIHP1RDATA(36) => PS7_i_n_1156,
      SAXIHP1RDATA(35) => PS7_i_n_1157,
      SAXIHP1RDATA(34) => PS7_i_n_1158,
      SAXIHP1RDATA(33) => PS7_i_n_1159,
      SAXIHP1RDATA(32) => PS7_i_n_1160,
      SAXIHP1RDATA(31) => PS7_i_n_1161,
      SAXIHP1RDATA(30) => PS7_i_n_1162,
      SAXIHP1RDATA(29) => PS7_i_n_1163,
      SAXIHP1RDATA(28) => PS7_i_n_1164,
      SAXIHP1RDATA(27) => PS7_i_n_1165,
      SAXIHP1RDATA(26) => PS7_i_n_1166,
      SAXIHP1RDATA(25) => PS7_i_n_1167,
      SAXIHP1RDATA(24) => PS7_i_n_1168,
      SAXIHP1RDATA(23) => PS7_i_n_1169,
      SAXIHP1RDATA(22) => PS7_i_n_1170,
      SAXIHP1RDATA(21) => PS7_i_n_1171,
      SAXIHP1RDATA(20) => PS7_i_n_1172,
      SAXIHP1RDATA(19) => PS7_i_n_1173,
      SAXIHP1RDATA(18) => PS7_i_n_1174,
      SAXIHP1RDATA(17) => PS7_i_n_1175,
      SAXIHP1RDATA(16) => PS7_i_n_1176,
      SAXIHP1RDATA(15) => PS7_i_n_1177,
      SAXIHP1RDATA(14) => PS7_i_n_1178,
      SAXIHP1RDATA(13) => PS7_i_n_1179,
      SAXIHP1RDATA(12) => PS7_i_n_1180,
      SAXIHP1RDATA(11) => PS7_i_n_1181,
      SAXIHP1RDATA(10) => PS7_i_n_1182,
      SAXIHP1RDATA(9) => PS7_i_n_1183,
      SAXIHP1RDATA(8) => PS7_i_n_1184,
      SAXIHP1RDATA(7) => PS7_i_n_1185,
      SAXIHP1RDATA(6) => PS7_i_n_1186,
      SAXIHP1RDATA(5) => PS7_i_n_1187,
      SAXIHP1RDATA(4) => PS7_i_n_1188,
      SAXIHP1RDATA(3) => PS7_i_n_1189,
      SAXIHP1RDATA(2) => PS7_i_n_1190,
      SAXIHP1RDATA(1) => PS7_i_n_1191,
      SAXIHP1RDATA(0) => PS7_i_n_1192,
      SAXIHP1RDISSUECAP1EN => '0',
      SAXIHP1RID(5) => PS7_i_n_825,
      SAXIHP1RID(4) => PS7_i_n_826,
      SAXIHP1RID(3) => PS7_i_n_827,
      SAXIHP1RID(2) => PS7_i_n_828,
      SAXIHP1RID(1) => PS7_i_n_829,
      SAXIHP1RID(0) => PS7_i_n_830,
      SAXIHP1RLAST => PS7_i_n_135,
      SAXIHP1RREADY => '0',
      SAXIHP1RRESP(1) => PS7_i_n_282,
      SAXIHP1RRESP(0) => PS7_i_n_283,
      SAXIHP1RVALID => PS7_i_n_136,
      SAXIHP1WACOUNT(5) => PS7_i_n_831,
      SAXIHP1WACOUNT(4) => PS7_i_n_832,
      SAXIHP1WACOUNT(3) => PS7_i_n_833,
      SAXIHP1WACOUNT(2) => PS7_i_n_834,
      SAXIHP1WACOUNT(1) => PS7_i_n_835,
      SAXIHP1WACOUNT(0) => PS7_i_n_836,
      SAXIHP1WCOUNT(7) => PS7_i_n_1361,
      SAXIHP1WCOUNT(6) => PS7_i_n_1362,
      SAXIHP1WCOUNT(5) => PS7_i_n_1363,
      SAXIHP1WCOUNT(4) => PS7_i_n_1364,
      SAXIHP1WCOUNT(3) => PS7_i_n_1365,
      SAXIHP1WCOUNT(2) => PS7_i_n_1366,
      SAXIHP1WCOUNT(1) => PS7_i_n_1367,
      SAXIHP1WCOUNT(0) => PS7_i_n_1368,
      SAXIHP1WDATA(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      SAXIHP1WID(5 downto 0) => B"000000",
      SAXIHP1WLAST => '0',
      SAXIHP1WREADY => PS7_i_n_137,
      SAXIHP1WRISSUECAP1EN => '0',
      SAXIHP1WSTRB(7 downto 0) => B"00000000",
      SAXIHP1WVALID => '0',
      SAXIHP2ACLK => '0',
      SAXIHP2ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIHP2ARBURST(1 downto 0) => B"00",
      SAXIHP2ARCACHE(3 downto 0) => B"0000",
      SAXIHP2ARESETN => PS7_i_n_138,
      SAXIHP2ARID(5 downto 0) => B"000000",
      SAXIHP2ARLEN(3 downto 0) => B"0000",
      SAXIHP2ARLOCK(1 downto 0) => B"00",
      SAXIHP2ARPROT(2 downto 0) => B"000",
      SAXIHP2ARQOS(3 downto 0) => B"0000",
      SAXIHP2ARREADY => PS7_i_n_139,
      SAXIHP2ARSIZE(1 downto 0) => B"00",
      SAXIHP2ARVALID => '0',
      SAXIHP2AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIHP2AWBURST(1 downto 0) => B"00",
      SAXIHP2AWCACHE(3 downto 0) => B"0000",
      SAXIHP2AWID(5 downto 0) => B"000000",
      SAXIHP2AWLEN(3 downto 0) => B"0000",
      SAXIHP2AWLOCK(1 downto 0) => B"00",
      SAXIHP2AWPROT(2 downto 0) => B"000",
      SAXIHP2AWQOS(3 downto 0) => B"0000",
      SAXIHP2AWREADY => PS7_i_n_140,
      SAXIHP2AWSIZE(1 downto 0) => B"00",
      SAXIHP2AWVALID => '0',
      SAXIHP2BID(5) => PS7_i_n_837,
      SAXIHP2BID(4) => PS7_i_n_838,
      SAXIHP2BID(3) => PS7_i_n_839,
      SAXIHP2BID(2) => PS7_i_n_840,
      SAXIHP2BID(1) => PS7_i_n_841,
      SAXIHP2BID(0) => PS7_i_n_842,
      SAXIHP2BREADY => '0',
      SAXIHP2BRESP(1) => PS7_i_n_284,
      SAXIHP2BRESP(0) => PS7_i_n_285,
      SAXIHP2BVALID => PS7_i_n_141,
      SAXIHP2RACOUNT(2) => PS7_i_n_363,
      SAXIHP2RACOUNT(1) => PS7_i_n_364,
      SAXIHP2RACOUNT(0) => PS7_i_n_365,
      SAXIHP2RCOUNT(7) => PS7_i_n_1369,
      SAXIHP2RCOUNT(6) => PS7_i_n_1370,
      SAXIHP2RCOUNT(5) => PS7_i_n_1371,
      SAXIHP2RCOUNT(4) => PS7_i_n_1372,
      SAXIHP2RCOUNT(3) => PS7_i_n_1373,
      SAXIHP2RCOUNT(2) => PS7_i_n_1374,
      SAXIHP2RCOUNT(1) => PS7_i_n_1375,
      SAXIHP2RCOUNT(0) => PS7_i_n_1376,
      SAXIHP2RDATA(63) => PS7_i_n_1193,
      SAXIHP2RDATA(62) => PS7_i_n_1194,
      SAXIHP2RDATA(61) => PS7_i_n_1195,
      SAXIHP2RDATA(60) => PS7_i_n_1196,
      SAXIHP2RDATA(59) => PS7_i_n_1197,
      SAXIHP2RDATA(58) => PS7_i_n_1198,
      SAXIHP2RDATA(57) => PS7_i_n_1199,
      SAXIHP2RDATA(56) => PS7_i_n_1200,
      SAXIHP2RDATA(55) => PS7_i_n_1201,
      SAXIHP2RDATA(54) => PS7_i_n_1202,
      SAXIHP2RDATA(53) => PS7_i_n_1203,
      SAXIHP2RDATA(52) => PS7_i_n_1204,
      SAXIHP2RDATA(51) => PS7_i_n_1205,
      SAXIHP2RDATA(50) => PS7_i_n_1206,
      SAXIHP2RDATA(49) => PS7_i_n_1207,
      SAXIHP2RDATA(48) => PS7_i_n_1208,
      SAXIHP2RDATA(47) => PS7_i_n_1209,
      SAXIHP2RDATA(46) => PS7_i_n_1210,
      SAXIHP2RDATA(45) => PS7_i_n_1211,
      SAXIHP2RDATA(44) => PS7_i_n_1212,
      SAXIHP2RDATA(43) => PS7_i_n_1213,
      SAXIHP2RDATA(42) => PS7_i_n_1214,
      SAXIHP2RDATA(41) => PS7_i_n_1215,
      SAXIHP2RDATA(40) => PS7_i_n_1216,
      SAXIHP2RDATA(39) => PS7_i_n_1217,
      SAXIHP2RDATA(38) => PS7_i_n_1218,
      SAXIHP2RDATA(37) => PS7_i_n_1219,
      SAXIHP2RDATA(36) => PS7_i_n_1220,
      SAXIHP2RDATA(35) => PS7_i_n_1221,
      SAXIHP2RDATA(34) => PS7_i_n_1222,
      SAXIHP2RDATA(33) => PS7_i_n_1223,
      SAXIHP2RDATA(32) => PS7_i_n_1224,
      SAXIHP2RDATA(31) => PS7_i_n_1225,
      SAXIHP2RDATA(30) => PS7_i_n_1226,
      SAXIHP2RDATA(29) => PS7_i_n_1227,
      SAXIHP2RDATA(28) => PS7_i_n_1228,
      SAXIHP2RDATA(27) => PS7_i_n_1229,
      SAXIHP2RDATA(26) => PS7_i_n_1230,
      SAXIHP2RDATA(25) => PS7_i_n_1231,
      SAXIHP2RDATA(24) => PS7_i_n_1232,
      SAXIHP2RDATA(23) => PS7_i_n_1233,
      SAXIHP2RDATA(22) => PS7_i_n_1234,
      SAXIHP2RDATA(21) => PS7_i_n_1235,
      SAXIHP2RDATA(20) => PS7_i_n_1236,
      SAXIHP2RDATA(19) => PS7_i_n_1237,
      SAXIHP2RDATA(18) => PS7_i_n_1238,
      SAXIHP2RDATA(17) => PS7_i_n_1239,
      SAXIHP2RDATA(16) => PS7_i_n_1240,
      SAXIHP2RDATA(15) => PS7_i_n_1241,
      SAXIHP2RDATA(14) => PS7_i_n_1242,
      SAXIHP2RDATA(13) => PS7_i_n_1243,
      SAXIHP2RDATA(12) => PS7_i_n_1244,
      SAXIHP2RDATA(11) => PS7_i_n_1245,
      SAXIHP2RDATA(10) => PS7_i_n_1246,
      SAXIHP2RDATA(9) => PS7_i_n_1247,
      SAXIHP2RDATA(8) => PS7_i_n_1248,
      SAXIHP2RDATA(7) => PS7_i_n_1249,
      SAXIHP2RDATA(6) => PS7_i_n_1250,
      SAXIHP2RDATA(5) => PS7_i_n_1251,
      SAXIHP2RDATA(4) => PS7_i_n_1252,
      SAXIHP2RDATA(3) => PS7_i_n_1253,
      SAXIHP2RDATA(2) => PS7_i_n_1254,
      SAXIHP2RDATA(1) => PS7_i_n_1255,
      SAXIHP2RDATA(0) => PS7_i_n_1256,
      SAXIHP2RDISSUECAP1EN => '0',
      SAXIHP2RID(5) => PS7_i_n_843,
      SAXIHP2RID(4) => PS7_i_n_844,
      SAXIHP2RID(3) => PS7_i_n_845,
      SAXIHP2RID(2) => PS7_i_n_846,
      SAXIHP2RID(1) => PS7_i_n_847,
      SAXIHP2RID(0) => PS7_i_n_848,
      SAXIHP2RLAST => PS7_i_n_142,
      SAXIHP2RREADY => '0',
      SAXIHP2RRESP(1) => PS7_i_n_286,
      SAXIHP2RRESP(0) => PS7_i_n_287,
      SAXIHP2RVALID => PS7_i_n_143,
      SAXIHP2WACOUNT(5) => PS7_i_n_849,
      SAXIHP2WACOUNT(4) => PS7_i_n_850,
      SAXIHP2WACOUNT(3) => PS7_i_n_851,
      SAXIHP2WACOUNT(2) => PS7_i_n_852,
      SAXIHP2WACOUNT(1) => PS7_i_n_853,
      SAXIHP2WACOUNT(0) => PS7_i_n_854,
      SAXIHP2WCOUNT(7) => PS7_i_n_1377,
      SAXIHP2WCOUNT(6) => PS7_i_n_1378,
      SAXIHP2WCOUNT(5) => PS7_i_n_1379,
      SAXIHP2WCOUNT(4) => PS7_i_n_1380,
      SAXIHP2WCOUNT(3) => PS7_i_n_1381,
      SAXIHP2WCOUNT(2) => PS7_i_n_1382,
      SAXIHP2WCOUNT(1) => PS7_i_n_1383,
      SAXIHP2WCOUNT(0) => PS7_i_n_1384,
      SAXIHP2WDATA(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      SAXIHP2WID(5 downto 0) => B"000000",
      SAXIHP2WLAST => '0',
      SAXIHP2WREADY => PS7_i_n_144,
      SAXIHP2WRISSUECAP1EN => '0',
      SAXIHP2WSTRB(7 downto 0) => B"00000000",
      SAXIHP2WVALID => '0',
      SAXIHP3ACLK => '0',
      SAXIHP3ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIHP3ARBURST(1 downto 0) => B"00",
      SAXIHP3ARCACHE(3 downto 0) => B"0000",
      SAXIHP3ARESETN => PS7_i_n_145,
      SAXIHP3ARID(5 downto 0) => B"000000",
      SAXIHP3ARLEN(3 downto 0) => B"0000",
      SAXIHP3ARLOCK(1 downto 0) => B"00",
      SAXIHP3ARPROT(2 downto 0) => B"000",
      SAXIHP3ARQOS(3 downto 0) => B"0000",
      SAXIHP3ARREADY => PS7_i_n_146,
      SAXIHP3ARSIZE(1 downto 0) => B"00",
      SAXIHP3ARVALID => '0',
      SAXIHP3AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      SAXIHP3AWBURST(1 downto 0) => B"00",
      SAXIHP3AWCACHE(3 downto 0) => B"0000",
      SAXIHP3AWID(5 downto 0) => B"000000",
      SAXIHP3AWLEN(3 downto 0) => B"0000",
      SAXIHP3AWLOCK(1 downto 0) => B"00",
      SAXIHP3AWPROT(2 downto 0) => B"000",
      SAXIHP3AWQOS(3 downto 0) => B"0000",
      SAXIHP3AWREADY => PS7_i_n_147,
      SAXIHP3AWSIZE(1 downto 0) => B"00",
      SAXIHP3AWVALID => '0',
      SAXIHP3BID(5) => PS7_i_n_855,
      SAXIHP3BID(4) => PS7_i_n_856,
      SAXIHP3BID(3) => PS7_i_n_857,
      SAXIHP3BID(2) => PS7_i_n_858,
      SAXIHP3BID(1) => PS7_i_n_859,
      SAXIHP3BID(0) => PS7_i_n_860,
      SAXIHP3BREADY => '0',
      SAXIHP3BRESP(1) => PS7_i_n_288,
      SAXIHP3BRESP(0) => PS7_i_n_289,
      SAXIHP3BVALID => PS7_i_n_148,
      SAXIHP3RACOUNT(2) => PS7_i_n_366,
      SAXIHP3RACOUNT(1) => PS7_i_n_367,
      SAXIHP3RACOUNT(0) => PS7_i_n_368,
      SAXIHP3RCOUNT(7) => PS7_i_n_1385,
      SAXIHP3RCOUNT(6) => PS7_i_n_1386,
      SAXIHP3RCOUNT(5) => PS7_i_n_1387,
      SAXIHP3RCOUNT(4) => PS7_i_n_1388,
      SAXIHP3RCOUNT(3) => PS7_i_n_1389,
      SAXIHP3RCOUNT(2) => PS7_i_n_1390,
      SAXIHP3RCOUNT(1) => PS7_i_n_1391,
      SAXIHP3RCOUNT(0) => PS7_i_n_1392,
      SAXIHP3RDATA(63) => PS7_i_n_1257,
      SAXIHP3RDATA(62) => PS7_i_n_1258,
      SAXIHP3RDATA(61) => PS7_i_n_1259,
      SAXIHP3RDATA(60) => PS7_i_n_1260,
      SAXIHP3RDATA(59) => PS7_i_n_1261,
      SAXIHP3RDATA(58) => PS7_i_n_1262,
      SAXIHP3RDATA(57) => PS7_i_n_1263,
      SAXIHP3RDATA(56) => PS7_i_n_1264,
      SAXIHP3RDATA(55) => PS7_i_n_1265,
      SAXIHP3RDATA(54) => PS7_i_n_1266,
      SAXIHP3RDATA(53) => PS7_i_n_1267,
      SAXIHP3RDATA(52) => PS7_i_n_1268,
      SAXIHP3RDATA(51) => PS7_i_n_1269,
      SAXIHP3RDATA(50) => PS7_i_n_1270,
      SAXIHP3RDATA(49) => PS7_i_n_1271,
      SAXIHP3RDATA(48) => PS7_i_n_1272,
      SAXIHP3RDATA(47) => PS7_i_n_1273,
      SAXIHP3RDATA(46) => PS7_i_n_1274,
      SAXIHP3RDATA(45) => PS7_i_n_1275,
      SAXIHP3RDATA(44) => PS7_i_n_1276,
      SAXIHP3RDATA(43) => PS7_i_n_1277,
      SAXIHP3RDATA(42) => PS7_i_n_1278,
      SAXIHP3RDATA(41) => PS7_i_n_1279,
      SAXIHP3RDATA(40) => PS7_i_n_1280,
      SAXIHP3RDATA(39) => PS7_i_n_1281,
      SAXIHP3RDATA(38) => PS7_i_n_1282,
      SAXIHP3RDATA(37) => PS7_i_n_1283,
      SAXIHP3RDATA(36) => PS7_i_n_1284,
      SAXIHP3RDATA(35) => PS7_i_n_1285,
      SAXIHP3RDATA(34) => PS7_i_n_1286,
      SAXIHP3RDATA(33) => PS7_i_n_1287,
      SAXIHP3RDATA(32) => PS7_i_n_1288,
      SAXIHP3RDATA(31) => PS7_i_n_1289,
      SAXIHP3RDATA(30) => PS7_i_n_1290,
      SAXIHP3RDATA(29) => PS7_i_n_1291,
      SAXIHP3RDATA(28) => PS7_i_n_1292,
      SAXIHP3RDATA(27) => PS7_i_n_1293,
      SAXIHP3RDATA(26) => PS7_i_n_1294,
      SAXIHP3RDATA(25) => PS7_i_n_1295,
      SAXIHP3RDATA(24) => PS7_i_n_1296,
      SAXIHP3RDATA(23) => PS7_i_n_1297,
      SAXIHP3RDATA(22) => PS7_i_n_1298,
      SAXIHP3RDATA(21) => PS7_i_n_1299,
      SAXIHP3RDATA(20) => PS7_i_n_1300,
      SAXIHP3RDATA(19) => PS7_i_n_1301,
      SAXIHP3RDATA(18) => PS7_i_n_1302,
      SAXIHP3RDATA(17) => PS7_i_n_1303,
      SAXIHP3RDATA(16) => PS7_i_n_1304,
      SAXIHP3RDATA(15) => PS7_i_n_1305,
      SAXIHP3RDATA(14) => PS7_i_n_1306,
      SAXIHP3RDATA(13) => PS7_i_n_1307,
      SAXIHP3RDATA(12) => PS7_i_n_1308,
      SAXIHP3RDATA(11) => PS7_i_n_1309,
      SAXIHP3RDATA(10) => PS7_i_n_1310,
      SAXIHP3RDATA(9) => PS7_i_n_1311,
      SAXIHP3RDATA(8) => PS7_i_n_1312,
      SAXIHP3RDATA(7) => PS7_i_n_1313,
      SAXIHP3RDATA(6) => PS7_i_n_1314,
      SAXIHP3RDATA(5) => PS7_i_n_1315,
      SAXIHP3RDATA(4) => PS7_i_n_1316,
      SAXIHP3RDATA(3) => PS7_i_n_1317,
      SAXIHP3RDATA(2) => PS7_i_n_1318,
      SAXIHP3RDATA(1) => PS7_i_n_1319,
      SAXIHP3RDATA(0) => PS7_i_n_1320,
      SAXIHP3RDISSUECAP1EN => '0',
      SAXIHP3RID(5) => PS7_i_n_861,
      SAXIHP3RID(4) => PS7_i_n_862,
      SAXIHP3RID(3) => PS7_i_n_863,
      SAXIHP3RID(2) => PS7_i_n_864,
      SAXIHP3RID(1) => PS7_i_n_865,
      SAXIHP3RID(0) => PS7_i_n_866,
      SAXIHP3RLAST => PS7_i_n_149,
      SAXIHP3RREADY => '0',
      SAXIHP3RRESP(1) => PS7_i_n_290,
      SAXIHP3RRESP(0) => PS7_i_n_291,
      SAXIHP3RVALID => PS7_i_n_150,
      SAXIHP3WACOUNT(5) => PS7_i_n_867,
      SAXIHP3WACOUNT(4) => PS7_i_n_868,
      SAXIHP3WACOUNT(3) => PS7_i_n_869,
      SAXIHP3WACOUNT(2) => PS7_i_n_870,
      SAXIHP3WACOUNT(1) => PS7_i_n_871,
      SAXIHP3WACOUNT(0) => PS7_i_n_872,
      SAXIHP3WCOUNT(7) => PS7_i_n_1393,
      SAXIHP3WCOUNT(6) => PS7_i_n_1394,
      SAXIHP3WCOUNT(5) => PS7_i_n_1395,
      SAXIHP3WCOUNT(4) => PS7_i_n_1396,
      SAXIHP3WCOUNT(3) => PS7_i_n_1397,
      SAXIHP3WCOUNT(2) => PS7_i_n_1398,
      SAXIHP3WCOUNT(1) => PS7_i_n_1399,
      SAXIHP3WCOUNT(0) => PS7_i_n_1400,
      SAXIHP3WDATA(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      SAXIHP3WID(5 downto 0) => B"000000",
      SAXIHP3WLAST => '0',
      SAXIHP3WREADY => PS7_i_n_151,
      SAXIHP3WRISSUECAP1EN => '0',
      SAXIHP3WSTRB(7 downto 0) => B"00000000",
      SAXIHP3WVALID => '0'
    );
PS_CLK_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_PS_CLK,
      PAD => PS_CLK
    );
PS_PORB_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_PS_PORB,
      PAD => PS_PORB
    );
PS_SRSTB_BIBUF: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_PS_SRSTB,
      PAD => PS_SRSTB
    );
\buffer_fclk_clk_0.FCLK_CLK_0_BUFG\: unisim.vcomponents.BUFG
     port map (
      I => FCLK_CLK_unbuffered(0),
      O => \^fclk_clk0\
    );
\buffer_fclk_clk_1.FCLK_CLK_1_BUFG\: unisim.vcomponents.BUFG
     port map (
      I => FCLK_CLK_unbuffered(1),
      O => FCLK_CLK1
    );
\genblk13[0].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(0),
      PAD => MIO(0)
    );
\genblk13[10].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(10),
      PAD => MIO(10)
    );
\genblk13[11].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(11),
      PAD => MIO(11)
    );
\genblk13[12].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(12),
      PAD => MIO(12)
    );
\genblk13[13].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(13),
      PAD => MIO(13)
    );
\genblk13[14].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(14),
      PAD => MIO(14)
    );
\genblk13[15].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(15),
      PAD => MIO(15)
    );
\genblk13[16].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(16),
      PAD => MIO(16)
    );
\genblk13[17].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(17),
      PAD => MIO(17)
    );
\genblk13[18].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(18),
      PAD => MIO(18)
    );
\genblk13[19].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(19),
      PAD => MIO(19)
    );
\genblk13[1].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(1),
      PAD => MIO(1)
    );
\genblk13[20].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(20),
      PAD => MIO(20)
    );
\genblk13[21].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(21),
      PAD => MIO(21)
    );
\genblk13[22].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(22),
      PAD => MIO(22)
    );
\genblk13[23].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(23),
      PAD => MIO(23)
    );
\genblk13[24].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(24),
      PAD => MIO(24)
    );
\genblk13[25].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(25),
      PAD => MIO(25)
    );
\genblk13[26].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(26),
      PAD => MIO(26)
    );
\genblk13[27].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(27),
      PAD => MIO(27)
    );
\genblk13[28].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(28),
      PAD => MIO(28)
    );
\genblk13[29].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(29),
      PAD => MIO(29)
    );
\genblk13[2].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(2),
      PAD => MIO(2)
    );
\genblk13[30].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(30),
      PAD => MIO(30)
    );
\genblk13[31].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(31),
      PAD => MIO(31)
    );
\genblk13[32].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(32),
      PAD => MIO(32)
    );
\genblk13[33].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(33),
      PAD => MIO(33)
    );
\genblk13[34].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(34),
      PAD => MIO(34)
    );
\genblk13[35].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(35),
      PAD => MIO(35)
    );
\genblk13[36].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(36),
      PAD => MIO(36)
    );
\genblk13[37].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(37),
      PAD => MIO(37)
    );
\genblk13[38].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(38),
      PAD => MIO(38)
    );
\genblk13[39].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(39),
      PAD => MIO(39)
    );
\genblk13[3].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(3),
      PAD => MIO(3)
    );
\genblk13[40].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(40),
      PAD => MIO(40)
    );
\genblk13[41].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(41),
      PAD => MIO(41)
    );
\genblk13[42].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(42),
      PAD => MIO(42)
    );
\genblk13[43].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(43),
      PAD => MIO(43)
    );
\genblk13[44].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(44),
      PAD => MIO(44)
    );
\genblk13[45].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(45),
      PAD => MIO(45)
    );
\genblk13[46].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(46),
      PAD => MIO(46)
    );
\genblk13[47].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(47),
      PAD => MIO(47)
    );
\genblk13[48].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(48),
      PAD => MIO(48)
    );
\genblk13[49].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(49),
      PAD => MIO(49)
    );
\genblk13[4].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(4),
      PAD => MIO(4)
    );
\genblk13[50].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(50),
      PAD => MIO(50)
    );
\genblk13[51].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(51),
      PAD => MIO(51)
    );
\genblk13[52].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(52),
      PAD => MIO(52)
    );
\genblk13[53].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(53),
      PAD => MIO(53)
    );
\genblk13[5].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(5),
      PAD => MIO(5)
    );
\genblk13[6].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(6),
      PAD => MIO(6)
    );
\genblk13[7].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(7),
      PAD => MIO(7)
    );
\genblk13[8].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(8),
      PAD => MIO(8)
    );
\genblk13[9].MIO_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_MIO(9),
      PAD => MIO(9)
    );
\genblk14[0].DDR_BankAddr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_BankAddr(0),
      PAD => DDR_BankAddr(0)
    );
\genblk14[1].DDR_BankAddr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_BankAddr(1),
      PAD => DDR_BankAddr(1)
    );
\genblk14[2].DDR_BankAddr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_BankAddr(2),
      PAD => DDR_BankAddr(2)
    );
\genblk15[0].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(0),
      PAD => DDR_Addr(0)
    );
\genblk15[10].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(10),
      PAD => DDR_Addr(10)
    );
\genblk15[11].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(11),
      PAD => DDR_Addr(11)
    );
\genblk15[12].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(12),
      PAD => DDR_Addr(12)
    );
\genblk15[13].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(13),
      PAD => DDR_Addr(13)
    );
\genblk15[14].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(14),
      PAD => DDR_Addr(14)
    );
\genblk15[1].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(1),
      PAD => DDR_Addr(1)
    );
\genblk15[2].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(2),
      PAD => DDR_Addr(2)
    );
\genblk15[3].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(3),
      PAD => DDR_Addr(3)
    );
\genblk15[4].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(4),
      PAD => DDR_Addr(4)
    );
\genblk15[5].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(5),
      PAD => DDR_Addr(5)
    );
\genblk15[6].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(6),
      PAD => DDR_Addr(6)
    );
\genblk15[7].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(7),
      PAD => DDR_Addr(7)
    );
\genblk15[8].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(8),
      PAD => DDR_Addr(8)
    );
\genblk15[9].DDR_Addr_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_Addr(9),
      PAD => DDR_Addr(9)
    );
\genblk16[0].DDR_DM_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DM(0),
      PAD => DDR_DM(0)
    );
\genblk16[1].DDR_DM_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DM(1),
      PAD => DDR_DM(1)
    );
\genblk16[2].DDR_DM_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DM(2),
      PAD => DDR_DM(2)
    );
\genblk16[3].DDR_DM_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DM(3),
      PAD => DDR_DM(3)
    );
\genblk17[0].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(0),
      PAD => DDR_DQ(0)
    );
\genblk17[10].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(10),
      PAD => DDR_DQ(10)
    );
\genblk17[11].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(11),
      PAD => DDR_DQ(11)
    );
\genblk17[12].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(12),
      PAD => DDR_DQ(12)
    );
\genblk17[13].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(13),
      PAD => DDR_DQ(13)
    );
\genblk17[14].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(14),
      PAD => DDR_DQ(14)
    );
\genblk17[15].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(15),
      PAD => DDR_DQ(15)
    );
\genblk17[16].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(16),
      PAD => DDR_DQ(16)
    );
\genblk17[17].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(17),
      PAD => DDR_DQ(17)
    );
\genblk17[18].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(18),
      PAD => DDR_DQ(18)
    );
\genblk17[19].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(19),
      PAD => DDR_DQ(19)
    );
\genblk17[1].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(1),
      PAD => DDR_DQ(1)
    );
\genblk17[20].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(20),
      PAD => DDR_DQ(20)
    );
\genblk17[21].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(21),
      PAD => DDR_DQ(21)
    );
\genblk17[22].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(22),
      PAD => DDR_DQ(22)
    );
\genblk17[23].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(23),
      PAD => DDR_DQ(23)
    );
\genblk17[24].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(24),
      PAD => DDR_DQ(24)
    );
\genblk17[25].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(25),
      PAD => DDR_DQ(25)
    );
\genblk17[26].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(26),
      PAD => DDR_DQ(26)
    );
\genblk17[27].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(27),
      PAD => DDR_DQ(27)
    );
\genblk17[28].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(28),
      PAD => DDR_DQ(28)
    );
\genblk17[29].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(29),
      PAD => DDR_DQ(29)
    );
\genblk17[2].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(2),
      PAD => DDR_DQ(2)
    );
\genblk17[30].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(30),
      PAD => DDR_DQ(30)
    );
\genblk17[31].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(31),
      PAD => DDR_DQ(31)
    );
\genblk17[3].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(3),
      PAD => DDR_DQ(3)
    );
\genblk17[4].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(4),
      PAD => DDR_DQ(4)
    );
\genblk17[5].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(5),
      PAD => DDR_DQ(5)
    );
\genblk17[6].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(6),
      PAD => DDR_DQ(6)
    );
\genblk17[7].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(7),
      PAD => DDR_DQ(7)
    );
\genblk17[8].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(8),
      PAD => DDR_DQ(8)
    );
\genblk17[9].DDR_DQ_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQ(9),
      PAD => DDR_DQ(9)
    );
\genblk18[0].DDR_DQS_n_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQS_n(0),
      PAD => DDR_DQS_n(0)
    );
\genblk18[1].DDR_DQS_n_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQS_n(1),
      PAD => DDR_DQS_n(1)
    );
\genblk18[2].DDR_DQS_n_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQS_n(2),
      PAD => DDR_DQS_n(2)
    );
\genblk18[3].DDR_DQS_n_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQS_n(3),
      PAD => DDR_DQS_n(3)
    );
\genblk19[0].DDR_DQS_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQS(0),
      PAD => DDR_DQS(0)
    );
\genblk19[1].DDR_DQS_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQS(1),
      PAD => DDR_DQS(1)
    );
\genblk19[2].DDR_DQS_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQS(2),
      PAD => DDR_DQS(2)
    );
\genblk19[3].DDR_DQS_BIBUF\: unisim.vcomponents.BIBUF
     port map (
      IO => buffered_DDR_DQS(3),
      PAD => DDR_DQS(3)
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_CTL_PIPE[0]\
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[0]\(1)
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[7]\(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[7]\(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[6]\(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[6]\(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[5]\(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[5]\(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[4]\(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[4]\(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[3]\(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[3]\(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[0]\(0)
    );
i_20: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[2]\(1)
    );
i_21: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[2]\(0)
    );
i_22: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[1]\(1)
    );
i_23: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_DATA_PIPE[1]\(0)
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_CTL_PIPE[7]\
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_CTL_PIPE[6]\
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_CTL_PIPE[5]\
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_CTL_PIPE[4]\
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_CTL_PIPE[3]\
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_CTL_PIPE[2]\
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => \TRACE_CTL_PIPE[1]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_upcnt_n is
  port (
    Q : out STD_LOGIC_VECTOR ( 5 downto 0 );
    seq_clr : in STD_LOGIC;
    seq_cnt_en : in STD_LOGIC;
    slowest_sync_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_upcnt_n : entity is "upcnt_n";
end dwa_ps_bd_upcnt_n;

architecture STRUCTURE of dwa_ps_bd_upcnt_n is
  signal \^q\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal clear : STD_LOGIC;
  signal q_int0 : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \q_int[1]_i_1\ : label is "soft_lutpair127";
  attribute SOFT_HLUTNM of \q_int[2]_i_1\ : label is "soft_lutpair127";
  attribute SOFT_HLUTNM of \q_int[3]_i_1\ : label is "soft_lutpair126";
  attribute SOFT_HLUTNM of \q_int[4]_i_1\ : label is "soft_lutpair126";
begin
  Q(5 downto 0) <= \^q\(5 downto 0);
\q_int[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => q_int0(0)
    );
\q_int[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => q_int0(1)
    );
\q_int[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => q_int0(2)
    );
\q_int[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => q_int0(3)
    );
\q_int[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => q_int0(4)
    );
\q_int[5]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => seq_clr,
      O => clear
    );
\q_int[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(4),
      I5 => \^q\(5),
      O => q_int0(5)
    );
\q_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => seq_cnt_en,
      D => q_int0(0),
      Q => \^q\(0),
      R => clear
    );
\q_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => seq_cnt_en,
      D => q_int0(1),
      Q => \^q\(1),
      R => clear
    );
\q_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => seq_cnt_en,
      D => q_int0(2),
      Q => \^q\(2),
      R => clear
    );
\q_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => seq_cnt_en,
      D => q_int0(3),
      Q => \^q\(3),
      R => clear
    );
\q_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => seq_cnt_en,
      D => q_int0(4),
      Q => \^q\(4),
      R => clear
    );
\q_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => seq_cnt_en,
      D => q_int0(5),
      Q => \^q\(5),
      R => clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_b_channel is
  port (
    si_rs_bvalid : out STD_LOGIC;
    cnt_read : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bready : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \s_bresp_acc_reg[1]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    areset_d1 : in STD_LOGIC;
    shandshake : in STD_LOGIC;
    aclk : in STD_LOGIC;
    si_rs_bready : in STD_LOGIC;
    m_axi_bvalid : in STD_LOGIC;
    b_push : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_b_channel : entity is "axi_protocol_converter_v2_1_22_b2s_b_channel";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_b_channel;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_b_channel is
  signal bid_fifo_0_n_4 : STD_LOGIC;
  signal bid_fifo_0_n_5 : STD_LOGIC;
  signal \bresp_cnt[7]_i_3_n_0\ : STD_LOGIC;
  signal bresp_cnt_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal bresp_fifo_0_n_0 : STD_LOGIC;
  signal bresp_push : STD_LOGIC;
  signal mhandshake : STD_LOGIC;
  signal mhandshake_r : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s_bresp_acc0 : STD_LOGIC;
  signal \s_bresp_acc[0]_i_1_n_0\ : STD_LOGIC;
  signal \s_bresp_acc[1]_i_1_n_0\ : STD_LOGIC;
  signal \s_bresp_acc_reg_n_0_[0]\ : STD_LOGIC;
  signal \s_bresp_acc_reg_n_0_[1]\ : STD_LOGIC;
  signal shandshake_r : STD_LOGIC;
  signal \^si_rs_bvalid\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bresp_cnt[1]_i_1\ : label is "soft_lutpair125";
  attribute SOFT_HLUTNM of \bresp_cnt[2]_i_1\ : label is "soft_lutpair125";
  attribute SOFT_HLUTNM of \bresp_cnt[3]_i_1\ : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of \bresp_cnt[4]_i_1\ : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of \bresp_cnt[6]_i_1\ : label is "soft_lutpair124";
  attribute SOFT_HLUTNM of \bresp_cnt[7]_i_2\ : label is "soft_lutpair124";
begin
  si_rs_bvalid <= \^si_rs_bvalid\;
bid_fifo_0: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo
     port map (
      Q(7 downto 0) => bresp_cnt_reg(7 downto 0),
      SR(0) => s_bresp_acc0,
      aclk => aclk,
      addr(1 downto 0) => cnt_read(1 downto 0),
      areset_d1 => areset_d1,
      b_push => b_push,
      \bresp_cnt_reg[1]\ => bid_fifo_0_n_4,
      \cnt_read_reg[1]_0\ => bid_fifo_0_n_5,
      \in\(15 downto 0) => \in\(15 downto 0),
      mhandshake_r => mhandshake_r,
      \out\(11 downto 0) => \out\(11 downto 0),
      sel => bresp_push,
      shandshake_r => shandshake_r
    );
\bresp_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bresp_cnt_reg(0),
      O => p_0_in(0)
    );
\bresp_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => bresp_cnt_reg(1),
      I1 => bresp_cnt_reg(0),
      O => p_0_in(1)
    );
\bresp_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => bresp_cnt_reg(2),
      I1 => bresp_cnt_reg(0),
      I2 => bresp_cnt_reg(1),
      O => p_0_in(2)
    );
\bresp_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => bresp_cnt_reg(3),
      I1 => bresp_cnt_reg(1),
      I2 => bresp_cnt_reg(0),
      I3 => bresp_cnt_reg(2),
      O => p_0_in(3)
    );
\bresp_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => bresp_cnt_reg(4),
      I1 => bresp_cnt_reg(2),
      I2 => bresp_cnt_reg(0),
      I3 => bresp_cnt_reg(1),
      I4 => bresp_cnt_reg(3),
      O => p_0_in(4)
    );
\bresp_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => bresp_cnt_reg(5),
      I1 => bresp_cnt_reg(3),
      I2 => bresp_cnt_reg(1),
      I3 => bresp_cnt_reg(0),
      I4 => bresp_cnt_reg(2),
      I5 => bresp_cnt_reg(4),
      O => p_0_in(5)
    );
\bresp_cnt[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => bresp_cnt_reg(6),
      I1 => \bresp_cnt[7]_i_3_n_0\,
      O => p_0_in(6)
    );
\bresp_cnt[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => bresp_cnt_reg(7),
      I1 => \bresp_cnt[7]_i_3_n_0\,
      I2 => bresp_cnt_reg(6),
      O => p_0_in(7)
    );
\bresp_cnt[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => bresp_cnt_reg(5),
      I1 => bresp_cnt_reg(3),
      I2 => bresp_cnt_reg(1),
      I3 => bresp_cnt_reg(0),
      I4 => bresp_cnt_reg(2),
      I5 => bresp_cnt_reg(4),
      O => \bresp_cnt[7]_i_3_n_0\
    );
\bresp_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(0),
      Q => bresp_cnt_reg(0),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(1),
      Q => bresp_cnt_reg(1),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(2),
      Q => bresp_cnt_reg(2),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(3),
      Q => bresp_cnt_reg(3),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(4),
      Q => bresp_cnt_reg(4),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(5),
      Q => bresp_cnt_reg(5),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(6),
      Q => bresp_cnt_reg(6),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(7),
      Q => bresp_cnt_reg(7),
      R => s_bresp_acc0
    );
bresp_fifo_0: entity work.\dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized0\
     port map (
      aclk => aclk,
      areset_d1 => areset_d1,
      areset_d1_reg => bresp_fifo_0_n_0,
      bvalid_i_reg => bid_fifo_0_n_5,
      \cnt_read_reg[1]_0\ => bid_fifo_0_n_4,
      \in\(1) => \s_bresp_acc_reg_n_0_[1]\,
      \in\(0) => \s_bresp_acc_reg_n_0_[0]\,
      m_axi_bready => m_axi_bready,
      m_axi_bvalid => m_axi_bvalid,
      mhandshake => mhandshake,
      mhandshake_r => mhandshake_r,
      \s_bresp_acc_reg[1]\(1 downto 0) => \s_bresp_acc_reg[1]_0\(1 downto 0),
      sel => bresp_push,
      shandshake_r => shandshake_r,
      si_rs_bready => si_rs_bready,
      si_rs_bvalid => \^si_rs_bvalid\
    );
bvalid_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => bresp_fifo_0_n_0,
      Q => \^si_rs_bvalid\,
      R => '0'
    );
mhandshake_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => mhandshake,
      Q => mhandshake_r,
      R => areset_d1
    );
\s_bresp_acc[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EACECCCC"
    )
        port map (
      I0 => m_axi_bresp(0),
      I1 => \s_bresp_acc_reg_n_0_[0]\,
      I2 => \s_bresp_acc_reg_n_0_[1]\,
      I3 => m_axi_bresp(1),
      I4 => mhandshake,
      I5 => s_bresp_acc0,
      O => \s_bresp_acc[0]_i_1_n_0\
    );
\s_bresp_acc[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00EA"
    )
        port map (
      I0 => \s_bresp_acc_reg_n_0_[1]\,
      I1 => m_axi_bresp(1),
      I2 => mhandshake,
      I3 => s_bresp_acc0,
      O => \s_bresp_acc[1]_i_1_n_0\
    );
\s_bresp_acc_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_bresp_acc[0]_i_1_n_0\,
      Q => \s_bresp_acc_reg_n_0_[0]\,
      R => '0'
    );
\s_bresp_acc_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_bresp_acc[1]_i_1_n_0\,
      Q => \s_bresp_acc_reg_n_0_[1]\,
      R => '0'
    );
shandshake_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => shandshake,
      Q => shandshake_r,
      R => areset_d1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator is
  port (
    next_pending_r : out STD_LOGIC;
    next_pending_r_0 : out STD_LOGIC;
    sel_first_reg_0 : out STD_LOGIC;
    sel_first_reg_1 : out STD_LOGIC;
    sel_first : out STD_LOGIC;
    \axlen_cnt_reg[5]\ : out STD_LOGIC;
    \axlen_cnt_reg[2]\ : out STD_LOGIC;
    axaddr_wrap0 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \axaddr_wrap_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \axaddr_incr_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axburst_eq1_reg_0 : out STD_LOGIC;
    \axlen_cnt_reg[0]\ : out STD_LOGIC;
    \axaddr_offset_r_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_second_len_r_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_boundary_axaddr_r_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \m_payload_i_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    aclk : in STD_LOGIC;
    sel_first_i : in STD_LOGIC;
    s_axburst_eq0_reg_0 : in STD_LOGIC;
    s_axburst_eq1_reg_1 : in STD_LOGIC;
    sel_first_reg_2 : in STD_LOGIC;
    sel_first_reg_3 : in STD_LOGIC;
    \axlen_cnt_reg[3]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    si_rs_awvalid : in STD_LOGIC;
    \axlen_cnt_reg[3]_0\ : in STD_LOGIC;
    \axaddr_wrap_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_incr_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \next\ : in STD_LOGIC;
    \axaddr_wrap_reg[0]\ : in STD_LOGIC;
    next_pending_r_reg : in STD_LOGIC;
    axaddr_incr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \axlen_cnt_reg[5]_0\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_second_len_r_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_cnt_r_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    \wrap_boundary_axaddr_r_reg[6]\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \axaddr_wrap_reg[11]_0\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator : entity is "axi_protocol_converter_v2_1_22_b2s_cmd_translator";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator is
  signal s_axburst_eq0 : STD_LOGIC;
  signal s_axburst_eq1 : STD_LOGIC;
begin
\FSM_sequential_state[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axburst_eq1,
      I1 => \axlen_cnt_reg[3]\(11),
      I2 => s_axburst_eq0,
      O => s_axburst_eq1_reg_0
    );
incr_cmd_0: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd
     port map (
      Q(1 downto 0) => Q(1 downto 0),
      aclk => aclk,
      axaddr_incr(11 downto 0) => axaddr_incr(11 downto 0),
      \axaddr_incr_reg[11]_0\(11 downto 0) => \axaddr_incr_reg[11]\(11 downto 0),
      \axaddr_incr_reg[3]_0\(3 downto 0) => \axaddr_incr_reg[3]\(3 downto 0),
      \axlen_cnt_reg[3]_0\(9 downto 6) => \axlen_cnt_reg[3]\(15 downto 12),
      \axlen_cnt_reg[3]_0\(5 downto 4) => \axlen_cnt_reg[3]\(10 downto 9),
      \axlen_cnt_reg[3]_0\(3 downto 0) => \axlen_cnt_reg[3]\(3 downto 0),
      \axlen_cnt_reg[3]_1\ => \axlen_cnt_reg[3]_0\,
      \axlen_cnt_reg[4]_0\ => \axaddr_wrap_reg[0]\,
      \axlen_cnt_reg[5]_0\ => \axlen_cnt_reg[5]\,
      \axlen_cnt_reg[5]_1\ => \axlen_cnt_reg[5]_0\,
      \m_payload_i_reg[3]\(3 downto 0) => \m_payload_i_reg[3]\(3 downto 0),
      \next\ => \next\,
      next_pending_r => next_pending_r,
      next_pending_r_reg_0 => next_pending_r_reg,
      sel_first_reg_0 => sel_first_reg_1,
      sel_first_reg_1 => sel_first_reg_2,
      si_rs_awvalid => si_rs_awvalid
    );
s_axburst_eq0_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => s_axburst_eq0_reg_0,
      Q => s_axburst_eq0,
      R => '0'
    );
s_axburst_eq1_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => s_axburst_eq1_reg_1,
      Q => s_axburst_eq1,
      R => '0'
    );
sel_first_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => sel_first_i,
      Q => sel_first_reg_0,
      R => '0'
    );
wrap_cmd_0: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd
     port map (
      D(3 downto 0) => D(3 downto 0),
      E(0) => E(0),
      Q(1 downto 0) => Q(1 downto 0),
      aclk => aclk,
      \axaddr_offset_r_reg[3]_0\(3 downto 0) => \axaddr_offset_r_reg[3]\(3 downto 0),
      axaddr_wrap0(11 downto 0) => axaddr_wrap0(11 downto 0),
      \axaddr_wrap_reg[0]_0\ => \axaddr_wrap_reg[0]\,
      \axaddr_wrap_reg[11]_0\(11 downto 0) => \axaddr_wrap_reg[11]\(11 downto 0),
      \axaddr_wrap_reg[11]_1\(11 downto 0) => \axaddr_wrap_reg[11]_0\(11 downto 0),
      \axaddr_wrap_reg[3]_0\(3 downto 0) => \axaddr_wrap_reg[3]\(3 downto 0),
      \axlen_cnt_reg[0]_0\ => \axlen_cnt_reg[0]\,
      \axlen_cnt_reg[2]_0\ => \axlen_cnt_reg[2]\,
      \axlen_cnt_reg[3]_0\(8 downto 5) => \axlen_cnt_reg[3]\(15 downto 12),
      \axlen_cnt_reg[3]_0\(4 downto 0) => \axlen_cnt_reg[3]\(8 downto 4),
      \axlen_cnt_reg[3]_1\ => \axlen_cnt_reg[3]_0\,
      \next\ => \next\,
      next_pending_r_0 => next_pending_r_0,
      next_pending_r_reg_0 => next_pending_r_reg,
      sel_first => sel_first,
      sel_first_reg_0 => sel_first_reg_3,
      si_rs_awvalid => si_rs_awvalid,
      \wrap_boundary_axaddr_r_reg[11]_0\(11 downto 0) => \wrap_boundary_axaddr_r_reg[11]\(11 downto 0),
      \wrap_boundary_axaddr_r_reg[6]_0\(6 downto 0) => \wrap_boundary_axaddr_r_reg[6]\(6 downto 0),
      \wrap_cnt_r_reg[3]_0\(3 downto 0) => \wrap_cnt_r_reg[3]\(3 downto 0),
      \wrap_second_len_r_reg[3]_0\(3 downto 0) => \wrap_second_len_r_reg[3]\(3 downto 0),
      \wrap_second_len_r_reg[3]_1\(3 downto 0) => \wrap_second_len_r_reg[3]_0\(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator_1 is
  port (
    sel_first_reg_0 : out STD_LOGIC;
    sel_first_reg_1 : out STD_LOGIC;
    sel_first_reg_2 : out STD_LOGIC;
    \axlen_cnt_reg[7]\ : out STD_LOGIC;
    \axaddr_wrap_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_wrap_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \axaddr_wrap_reg[7]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_incr_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M00_AXI_0_arready : out STD_LOGIC;
    r_rlast : out STD_LOGIC;
    \axlen_cnt_reg[0]\ : out STD_LOGIC;
    \axaddr_offset_r_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_second_len_r_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_boundary_axaddr_r_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \m_payload_i_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    aclk : in STD_LOGIC;
    sel_first_i : in STD_LOGIC;
    sel_first_reg_3 : in STD_LOGIC;
    sel_first_reg_4 : in STD_LOGIC;
    \axlen_cnt_reg[3]\ : in STD_LOGIC;
    \axlen_cnt_reg[3]_0\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    si_rs_arvalid : in STD_LOGIC;
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_incr_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    r_push : in STD_LOGIC;
    \axaddr_wrap_reg[0]\ : in STD_LOGIC;
    next_pending_r_reg : in STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    \axaddr_incr_reg[11]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_incr_reg[7]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_incr_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axlen_cnt_reg[7]_0\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_second_len_r_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_cnt_r_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    \wrap_boundary_axaddr_r_reg[6]\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \axaddr_wrap_reg[11]_0\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \axaddr_incr_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator_1 : entity is "axi_protocol_converter_v2_1_22_b2s_cmd_translator";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator_1;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator_1 is
  signal incr_next_pending : STD_LOGIC;
  signal s_axburst_eq0 : STD_LOGIC;
  signal s_axburst_eq1 : STD_LOGIC;
  signal wrap_cmd_0_n_25 : STD_LOGIC;
  signal wrap_cmd_0_n_26 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_3\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of r_rlast_r_i_1 : label is "soft_lutpair15";
begin
\FSM_sequential_state[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00088808"
    )
        port map (
      I0 => m_axi_arready,
      I1 => Q(0),
      I2 => s_axburst_eq0,
      I3 => \axlen_cnt_reg[3]_0\(11),
      I4 => s_axburst_eq1,
      O => M00_AXI_0_arready
    );
incr_cmd_0: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_incr_cmd_2
     port map (
      Q(1 downto 0) => Q(1 downto 0),
      aclk => aclk,
      \axaddr_incr_reg[0]_0\(0) => \axaddr_incr_reg[0]\(0),
      \axaddr_incr_reg[11]_0\(11 downto 0) => \axaddr_incr_reg[11]\(11 downto 0),
      \axaddr_incr_reg[11]_1\(3 downto 0) => \axaddr_incr_reg[11]_0\(3 downto 0),
      \axaddr_incr_reg[3]_0\(3 downto 0) => \axaddr_incr_reg[3]\(3 downto 0),
      \axaddr_incr_reg[3]_1\(3 downto 0) => \axaddr_incr_reg[3]_0\(3 downto 0),
      \axaddr_incr_reg[7]_0\(3 downto 0) => \axaddr_incr_reg[7]\(3 downto 0),
      \axlen_cnt_reg[3]_0\ => \axlen_cnt_reg[3]\,
      \axlen_cnt_reg[3]_1\(9 downto 6) => \axlen_cnt_reg[3]_0\(15 downto 12),
      \axlen_cnt_reg[3]_1\(5 downto 4) => \axlen_cnt_reg[3]_0\(10 downto 9),
      \axlen_cnt_reg[3]_1\(3 downto 0) => \axlen_cnt_reg[3]_0\(3 downto 0),
      \axlen_cnt_reg[4]_0\ => \axaddr_wrap_reg[0]\,
      \axlen_cnt_reg[7]_0\ => \axlen_cnt_reg[7]\,
      \axlen_cnt_reg[7]_1\ => \axlen_cnt_reg[7]_0\,
      incr_next_pending => incr_next_pending,
      m_axi_arready => m_axi_arready,
      \m_payload_i_reg[3]\(3 downto 0) => \m_payload_i_reg[3]\(3 downto 0),
      next_pending_r_reg_0 => next_pending_r_reg,
      r_push => r_push,
      sel_first_reg_0 => sel_first_reg_1,
      sel_first_reg_1 => sel_first_reg_3,
      si_rs_arvalid => si_rs_arvalid
    );
r_rlast_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => s_axburst_eq0,
      I1 => \axlen_cnt_reg[3]_0\(11),
      I2 => s_axburst_eq1,
      O => r_rlast
    );
s_axburst_eq0_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => wrap_cmd_0_n_25,
      Q => s_axburst_eq0,
      R => '0'
    );
s_axburst_eq1_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => wrap_cmd_0_n_26,
      Q => s_axburst_eq1,
      R => '0'
    );
sel_first_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => sel_first_i,
      Q => sel_first_reg_0,
      R => '0'
    );
wrap_cmd_0: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wrap_cmd_3
     port map (
      D(3 downto 0) => D(3 downto 0),
      E(0) => E(0),
      O(3 downto 0) => O(3 downto 0),
      Q(0) => Q(1),
      S(3 downto 0) => S(3 downto 0),
      aclk => aclk,
      \axaddr_offset_r_reg[3]_0\(3 downto 0) => \axaddr_offset_r_reg[3]\(3 downto 0),
      \axaddr_wrap_reg[0]_0\ => \axaddr_wrap_reg[0]\,
      \axaddr_wrap_reg[11]_0\(11 downto 0) => \axaddr_wrap_reg[11]\(11 downto 0),
      \axaddr_wrap_reg[11]_1\(11 downto 0) => \axaddr_wrap_reg[11]_0\(11 downto 0),
      \axaddr_wrap_reg[3]_0\(3 downto 0) => \axaddr_wrap_reg[3]\(3 downto 0),
      \axaddr_wrap_reg[7]_0\(3 downto 0) => \axaddr_wrap_reg[7]\(3 downto 0),
      \axlen_cnt_reg[0]_0\ => \axlen_cnt_reg[0]\,
      \axlen_cnt_reg[3]_0\(9 downto 5) => \axlen_cnt_reg[3]_0\(15 downto 11),
      \axlen_cnt_reg[3]_0\(4 downto 0) => \axlen_cnt_reg[3]_0\(8 downto 4),
      \axlen_cnt_reg[3]_1\ => \axlen_cnt_reg[3]\,
      incr_next_pending => incr_next_pending,
      \m_payload_i_reg[39]\ => wrap_cmd_0_n_25,
      \m_payload_i_reg[39]_0\ => wrap_cmd_0_n_26,
      next_pending_r_reg_0 => next_pending_r_reg,
      sel_first_i => sel_first_i,
      sel_first_reg_0 => sel_first_reg_2,
      sel_first_reg_1 => sel_first_reg_4,
      si_rs_arvalid => si_rs_arvalid,
      \wrap_boundary_axaddr_r_reg[11]_0\(11 downto 0) => \wrap_boundary_axaddr_r_reg[11]\(11 downto 0),
      \wrap_boundary_axaddr_r_reg[6]_0\(6 downto 0) => \wrap_boundary_axaddr_r_reg[6]\(6 downto 0),
      \wrap_cnt_r_reg[3]_0\(3 downto 0) => \wrap_cnt_r_reg[3]\(3 downto 0),
      \wrap_second_len_r_reg[3]_0\(3 downto 0) => \wrap_second_len_r_reg[3]\(3 downto 0),
      \wrap_second_len_r_reg[3]_1\(3 downto 0) => \wrap_second_len_r_reg[3]_0\(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_r_channel is
  port (
    \cnt_read_reg[2]\ : out STD_LOGIC;
    \cnt_read_reg[4]\ : out STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 33 downto 0 );
    r_push_r_reg_0 : out STD_LOGIC_VECTOR ( 12 downto 0 );
    r_push : in STD_LOGIC;
    aclk : in STD_LOGIC;
    r_rlast : in STD_LOGIC;
    \cnt_read_reg[4]_0\ : in STD_LOGIC;
    si_rs_rready : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 33 downto 0 );
    D : in STD_LOGIC_VECTOR ( 11 downto 0 );
    areset_d1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_r_channel : entity is "axi_protocol_converter_v2_1_22_b2s_r_channel";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_r_channel;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_r_channel is
  signal r_push_r : STD_LOGIC;
  signal rd_data_fifo_0_n_0 : STD_LOGIC;
  signal rd_data_fifo_0_n_3 : STD_LOGIC;
  signal trans_in : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal transaction_fifo_0_n_1 : STD_LOGIC;
begin
\r_arid_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(0),
      Q => trans_in(1),
      R => '0'
    );
\r_arid_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(10),
      Q => trans_in(11),
      R => '0'
    );
\r_arid_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(11),
      Q => trans_in(12),
      R => '0'
    );
\r_arid_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(1),
      Q => trans_in(2),
      R => '0'
    );
\r_arid_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(2),
      Q => trans_in(3),
      R => '0'
    );
\r_arid_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(3),
      Q => trans_in(4),
      R => '0'
    );
\r_arid_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(4),
      Q => trans_in(5),
      R => '0'
    );
\r_arid_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(5),
      Q => trans_in(6),
      R => '0'
    );
\r_arid_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(6),
      Q => trans_in(7),
      R => '0'
    );
\r_arid_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(7),
      Q => trans_in(8),
      R => '0'
    );
\r_arid_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(8),
      Q => trans_in(9),
      R => '0'
    );
\r_arid_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => D(9),
      Q => trans_in(10),
      R => '0'
    );
r_push_r_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => r_push,
      Q => r_push_r,
      R => '0'
    );
r_rlast_r_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => r_rlast,
      Q => trans_in(0),
      R => '0'
    );
rd_data_fifo_0: entity work.\dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized1\
     port map (
      aclk => aclk,
      areset_d1 => areset_d1,
      \cnt_read_reg[2]_0\ => \cnt_read_reg[2]\,
      \cnt_read_reg[4]_0\ => rd_data_fifo_0_n_3,
      \cnt_read_reg[4]_1\ => \cnt_read_reg[4]_0\,
      \in\(33 downto 0) => \in\(33 downto 0),
      m_axi_rready => m_axi_rready,
      m_axi_rvalid => m_axi_rvalid,
      m_valid_i_reg => transaction_fifo_0_n_1,
      \out\(33 downto 0) => \out\(33 downto 0),
      r_push_r => r_push_r,
      s_ready_i_reg => rd_data_fifo_0_n_0,
      si_rs_rready => si_rs_rready
    );
transaction_fifo_0: entity work.\dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_simple_fifo__parameterized2\
     port map (
      \FSM_sequential_state_reg[0]\ => rd_data_fifo_0_n_3,
      aclk => aclk,
      areset_d1 => areset_d1,
      \cnt_read_reg[4]_0\ => \cnt_read_reg[4]\,
      \cnt_read_reg[4]_1\ => transaction_fifo_0_n_1,
      \cnt_read_reg[4]_2\ => \cnt_read_reg[4]_0\,
      \cnt_read_reg[4]_3\ => rd_data_fifo_0_n_0,
      \in\(12 downto 0) => trans_in(12 downto 0),
      r_push_r => r_push_r,
      r_push_r_reg(12 downto 0) => r_push_r_reg_0(12 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_register_slice_v2_1_22_axi_register_slice is
  port (
    s_ready_i_reg : out STD_LOGIC;
    s_ready_i_reg_0 : out STD_LOGIC;
    si_rs_awvalid : out STD_LOGIC;
    m_valid_i_reg : out STD_LOGIC;
    si_rs_bready : out STD_LOGIC;
    si_rs_arvalid : out STD_LOGIC;
    m_valid_i_reg_0 : out STD_LOGIC;
    si_rs_rready : out STD_LOGIC;
    \axaddr_incr_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 53 downto 0 );
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_incr_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \m_payload_i_reg[61]\ : out STD_LOGIC_VECTOR ( 53 downto 0 );
    \axaddr_wrap_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axaddr_incr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \m_payload_i_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \m_payload_i_reg[7]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \m_payload_i_reg[45]\ : out STD_LOGIC;
    \FSM_sequential_state_reg[0]\ : out STD_LOGIC;
    \m_payload_i_reg[6]\ : out STD_LOGIC;
    axaddr_offset : out STD_LOGIC_VECTOR ( 0 to 0 );
    shandshake : out STD_LOGIC;
    \FSM_sequential_state_reg[1]\ : out STD_LOGIC;
    \m_payload_i_reg[5]\ : out STD_LOGIC;
    \m_payload_i_reg[45]_0\ : out STD_LOGIC;
    s_ready_i_reg_1 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \m_payload_i_reg[4]\ : out STD_LOGIC;
    \m_payload_i_reg[1]\ : out STD_LOGIC;
    \m_payload_i_reg[2]\ : out STD_LOGIC;
    \m_payload_i_reg[1]_0\ : out STD_LOGIC;
    \m_payload_i_reg[6]_0\ : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \m_payload_i_reg[1]_1\ : out STD_LOGIC;
    \m_payload_i_reg[2]_0\ : out STD_LOGIC;
    \m_payload_i_reg[1]_2\ : out STD_LOGIC;
    \m_payload_i_reg[2]_1\ : out STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \m_payload_i_reg[13]\ : out STD_LOGIC_VECTOR ( 13 downto 0 );
    \m_payload_i_reg[46]\ : out STD_LOGIC_VECTOR ( 46 downto 0 );
    aclk : in STD_LOGIC;
    s_ready_i0 : in STD_LOGIC;
    m_valid_i0 : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_valid_i_reg_1 : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    \M00_AXI_0_araddr[11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \M00_AXI_0_araddr[11]_0\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \M00_AXI_0_awaddr[11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \M00_AXI_0_awaddr[11]_0\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    b_push : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    \axaddr_incr_reg[3]_1\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_incr_reg[3]_2\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    next_pending_r_reg : in STD_LOGIC;
    \axaddr_offset_r_reg[2]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \axaddr_offset_r_reg[2]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    si_rs_bvalid : in STD_LOGIC;
    \wrap_second_len_r_reg[3]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    next_pending_r_reg_0 : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sel_first : in STD_LOGIC;
    sel_first_0 : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \M00_AXI_0_araddr[11]_1\ : in STD_LOGIC;
    sel_first_1 : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \skid_buffer_reg[1]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \skid_buffer_reg[46]\ : in STD_LOGIC_VECTOR ( 12 downto 0 );
    \skid_buffer_reg[33]\ : in STD_LOGIC_VECTOR ( 33 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    \m_payload_i_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_register_slice_v2_1_22_axi_register_slice : entity is "axi_register_slice_v2_1_22_axi_register_slice";
end dwa_ps_bd_axi_register_slice_v2_1_22_axi_register_slice;

architecture STRUCTURE of dwa_ps_bd_axi_register_slice_v2_1_22_axi_register_slice is
  signal \ar.ar_pipe_n_1\ : STD_LOGIC;
  signal \ar.ar_pipe_n_104\ : STD_LOGIC;
  signal \r.r_pipe_n_1\ : STD_LOGIC;
begin
\ar.ar_pipe\: entity work.dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice
     port map (
      D(6 downto 0) => D(6 downto 0),
      \FSM_sequential_state_reg[1]\ => \FSM_sequential_state_reg[1]\,
      \M00_AXI_0_araddr[11]\(11 downto 0) => \M00_AXI_0_araddr[11]\(11 downto 0),
      \M00_AXI_0_araddr[11]_0\(11 downto 0) => \M00_AXI_0_araddr[11]_0\(11 downto 0),
      \M00_AXI_0_araddr[11]_1\ => \M00_AXI_0_araddr[11]_1\,
      O(3 downto 0) => O(3 downto 0),
      Q(53 downto 0) => Q(53 downto 0),
      S(3 downto 0) => S(3 downto 0),
      aclk => aclk,
      aresetn => aresetn,
      \aresetn_d_reg[0]_0\ => \ar.ar_pipe_n_1\,
      \aresetn_d_reg[0]_1\ => \ar.ar_pipe_n_104\,
      \axaddr_incr_reg[3]\(3 downto 0) => \axaddr_incr_reg[3]\(3 downto 0),
      \axaddr_incr_reg[3]_0\(3 downto 0) => \axaddr_incr_reg[3]_2\(3 downto 0),
      m_axi_araddr(11 downto 0) => m_axi_araddr(11 downto 0),
      \m_payload_i_reg[0]_0\(0) => \m_payload_i_reg[0]\(0),
      \m_payload_i_reg[1]_0\ => \m_payload_i_reg[1]\,
      \m_payload_i_reg[1]_1\ => \m_payload_i_reg[1]_0\,
      \m_payload_i_reg[2]_0\ => \m_payload_i_reg[2]\,
      \m_payload_i_reg[2]_1\ => \m_payload_i_reg[2]_0\,
      \m_payload_i_reg[3]_0\(3 downto 0) => \m_payload_i_reg[3]\(3 downto 0),
      \m_payload_i_reg[45]_0\ => \m_payload_i_reg[45]_0\,
      \m_payload_i_reg[4]_0\ => \m_payload_i_reg[4]\,
      \m_payload_i_reg[5]_0\ => \m_payload_i_reg[5]\,
      \m_payload_i_reg[7]_0\(3 downto 0) => \m_payload_i_reg[7]\(3 downto 0),
      m_valid_i0 => m_valid_i0,
      m_valid_i_reg_0 => \r.r_pipe_n_1\,
      next_pending_r_reg => next_pending_r_reg_0,
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_arid(11 downto 0) => s_axi_arid(11 downto 0),
      s_axi_arlen(3 downto 0) => s_axi_arlen(3 downto 0),
      s_axi_arprot(2 downto 0) => s_axi_arprot(2 downto 0),
      s_axi_arsize(1 downto 0) => s_axi_arsize(1 downto 0),
      s_ready_i0 => s_ready_i0,
      s_ready_i_reg_0 => s_ready_i_reg_0,
      sel_first_1 => sel_first_1,
      si_rs_arvalid => si_rs_arvalid,
      \wrap_second_len_r_reg[3]\(1 downto 0) => \wrap_second_len_r_reg[3]\(1 downto 0)
    );
\aw.aw_pipe\: entity work.dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice_0
     port map (
      E(0) => E(0),
      \FSM_sequential_state_reg[0]\ => \FSM_sequential_state_reg[0]\,
      \M00_AXI_0_awaddr[11]\(11 downto 0) => \M00_AXI_0_awaddr[11]\(11 downto 0),
      \M00_AXI_0_awaddr[11]_0\(11 downto 0) => \M00_AXI_0_awaddr[11]_0\(11 downto 0),
      Q(53 downto 0) => \m_payload_i_reg[61]\(53 downto 0),
      aclk => aclk,
      axaddr_incr(11 downto 0) => axaddr_incr(11 downto 0),
      \axaddr_incr_reg[3]\(3 downto 0) => \axaddr_incr_reg[3]_0\(3 downto 0),
      \axaddr_incr_reg[3]_0\(3 downto 0) => \axaddr_incr_reg[3]_1\(3 downto 0),
      axaddr_offset(0) => axaddr_offset(0),
      \axaddr_offset_r_reg[2]\(1 downto 0) => \axaddr_offset_r_reg[2]\(1 downto 0),
      \axaddr_offset_r_reg[2]_0\(0) => \axaddr_offset_r_reg[2]_0\(0),
      \axaddr_wrap_reg[3]\(3 downto 0) => \axaddr_wrap_reg[3]\(3 downto 0),
      b_push => b_push,
      m_axi_awaddr(11 downto 0) => m_axi_awaddr(11 downto 0),
      \m_payload_i_reg[1]_0\ => \m_payload_i_reg[1]_1\,
      \m_payload_i_reg[1]_1\ => \m_payload_i_reg[1]_2\,
      \m_payload_i_reg[2]_0\ => \m_payload_i_reg[2]_1\,
      \m_payload_i_reg[45]_0\ => \m_payload_i_reg[45]\,
      \m_payload_i_reg[6]_0\ => \m_payload_i_reg[6]\,
      \m_payload_i_reg[6]_1\(6 downto 0) => \m_payload_i_reg[6]_0\(6 downto 0),
      m_valid_i_reg_0 => si_rs_awvalid,
      m_valid_i_reg_1 => \r.r_pipe_n_1\,
      next_pending_r_reg => next_pending_r_reg,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awid(11 downto 0) => s_axi_awid(11 downto 0),
      s_axi_awlen(3 downto 0) => s_axi_awlen(3 downto 0),
      s_axi_awprot(2 downto 0) => s_axi_awprot(2 downto 0),
      s_axi_awsize(1 downto 0) => s_axi_awsize(1 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_ready_i_reg_0 => s_ready_i_reg,
      s_ready_i_reg_1 => \ar.ar_pipe_n_1\,
      sel_first => sel_first,
      sel_first_0 => sel_first_0
    );
\b.b_pipe\: entity work.\dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized1\
     port map (
      aclk => aclk,
      \m_payload_i_reg[13]_0\(13 downto 0) => \m_payload_i_reg[13]\(13 downto 0),
      m_valid_i_reg_0 => m_valid_i_reg,
      m_valid_i_reg_1 => \r.r_pipe_n_1\,
      \out\(11 downto 0) => \out\(11 downto 0),
      s_axi_bready => s_axi_bready,
      s_ready_i_reg_0 => si_rs_bready,
      s_ready_i_reg_1 => \ar.ar_pipe_n_1\,
      shandshake => shandshake,
      si_rs_bvalid => si_rs_bvalid,
      \skid_buffer_reg[1]_0\(1 downto 0) => \skid_buffer_reg[1]\(1 downto 0)
    );
\r.r_pipe\: entity work.\dwa_ps_bd_axi_register_slice_v2_1_22_axic_register_slice__parameterized2\
     port map (
      aclk => aclk,
      \aresetn_d_reg[1]_inv_0\ => \r.r_pipe_n_1\,
      \aresetn_d_reg[1]_inv_1\ => \ar.ar_pipe_n_104\,
      \m_payload_i_reg[46]_0\(46 downto 0) => \m_payload_i_reg[46]\(46 downto 0),
      m_valid_i_reg_0 => m_valid_i_reg_0,
      m_valid_i_reg_1 => m_valid_i_reg_1,
      s_axi_rready => s_axi_rready,
      s_ready_i_reg_0 => si_rs_rready,
      s_ready_i_reg_1 => s_ready_i_reg_1,
      s_ready_i_reg_2 => \ar.ar_pipe_n_1\,
      \skid_buffer_reg[33]_0\(33 downto 0) => \skid_buffer_reg[33]\(33 downto 0),
      \skid_buffer_reg[46]_0\(12 downto 0) => \skid_buffer_reg[46]\(12 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_dwa_ps_bd_processing_system7_0_0 is
  port (
    TTC0_WAVE0_OUT : out STD_LOGIC;
    TTC0_WAVE1_OUT : out STD_LOGIC;
    TTC0_WAVE2_OUT : out STD_LOGIC;
    USB0_PORT_INDCTL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    USB0_VBUS_PWRSELECT : out STD_LOGIC;
    USB0_VBUS_PWRFAULT : in STD_LOGIC;
    M_AXI_GP0_ARVALID : out STD_LOGIC;
    M_AXI_GP0_AWVALID : out STD_LOGIC;
    M_AXI_GP0_BREADY : out STD_LOGIC;
    M_AXI_GP0_RREADY : out STD_LOGIC;
    M_AXI_GP0_WLAST : out STD_LOGIC;
    M_AXI_GP0_WVALID : out STD_LOGIC;
    M_AXI_GP0_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ACLK : in STD_LOGIC;
    M_AXI_GP0_ARREADY : in STD_LOGIC;
    M_AXI_GP0_AWREADY : in STD_LOGIC;
    M_AXI_GP0_BVALID : in STD_LOGIC;
    M_AXI_GP0_RLAST : in STD_LOGIC;
    M_AXI_GP0_RVALID : in STD_LOGIC;
    M_AXI_GP0_WREADY : in STD_LOGIC;
    M_AXI_GP0_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_CLK1 : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of dwa_ps_bd_dwa_ps_bd_processing_system7_0_0 : entity is "dwa_ps_bd_processing_system7_0_0,processing_system7_v5_5_processing_system7,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of dwa_ps_bd_dwa_ps_bd_processing_system7_0_0 : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_dwa_ps_bd_processing_system7_0_0 : entity is "dwa_ps_bd_processing_system7_0_0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of dwa_ps_bd_dwa_ps_bd_processing_system7_0_0 : entity is "processing_system7_v5_5_processing_system7,Vivado 2020.2";
end dwa_ps_bd_dwa_ps_bd_processing_system7_0_0;

architecture STRUCTURE of dwa_ps_bd_dwa_ps_bd_processing_system7_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^m_axi_gp0_arsize\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^m_axi_gp0_awsize\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_CAN0_PHY_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_CAN1_PHY_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_DMA0_DAVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_DMA0_DRREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_DMA0_RSTN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_DMA1_DAVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_DMA1_DRREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_DMA1_RSTN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_DMA2_DAVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_DMA2_DRREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_DMA2_RSTN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_DMA3_DAVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_DMA3_DRREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_DMA3_RSTN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_GMII_TX_EN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_GMII_TX_ER_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_MDIO_MDC_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_MDIO_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_MDIO_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_PTP_DELAY_REQ_RX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_PTP_DELAY_REQ_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_PTP_PDELAY_REQ_RX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_PTP_PDELAY_REQ_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_PTP_PDELAY_RESP_RX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_PTP_PDELAY_RESP_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_PTP_SYNC_FRAME_RX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_PTP_SYNC_FRAME_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_SOF_RX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET0_SOF_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_GMII_TX_EN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_GMII_TX_ER_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_MDIO_MDC_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_MDIO_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_MDIO_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_PTP_DELAY_REQ_RX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_PTP_DELAY_REQ_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_PTP_PDELAY_REQ_RX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_PTP_PDELAY_REQ_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_PTP_PDELAY_RESP_RX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_PTP_PDELAY_RESP_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_PTP_SYNC_FRAME_RX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_PTP_SYNC_FRAME_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_SOF_RX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ENET1_SOF_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_EVENT_EVENTO_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_FCLK_CLK2_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_FCLK_CLK3_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_FCLK_RESET1_N_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_FCLK_RESET2_N_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_FCLK_RESET3_N_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_FTMT_F2P_TRIGACK_0_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_FTMT_F2P_TRIGACK_1_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_FTMT_F2P_TRIGACK_2_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_FTMT_F2P_TRIGACK_3_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_FTMT_P2F_TRIG_0_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_FTMT_P2F_TRIG_1_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_FTMT_P2F_TRIG_2_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_FTMT_P2F_TRIG_3_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_I2C0_SCL_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_I2C0_SCL_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_I2C0_SDA_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_I2C0_SDA_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_I2C1_SCL_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_I2C1_SCL_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_I2C1_SDA_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_I2C1_SDA_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_CAN0_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_CAN1_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_CTI_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_DMAC0_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_DMAC1_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_DMAC2_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_DMAC3_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_DMAC4_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_DMAC5_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_DMAC6_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_DMAC7_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_DMAC_ABORT_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_ENET0_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_ENET1_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_ENET_WAKE0_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_ENET_WAKE1_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_GPIO_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_I2C0_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_I2C1_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_QSPI_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_SDIO0_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_SDIO1_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_SMC_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_SPI0_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_SPI1_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_UART0_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_UART1_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_USB0_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_IRQ_P2F_USB1_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_M_AXI_GP0_ARESETN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_M_AXI_GP0_WLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_M_AXI_GP1_ARESETN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_M_AXI_GP1_ARVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_M_AXI_GP1_AWVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_M_AXI_GP1_BREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_M_AXI_GP1_RREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_M_AXI_GP1_WLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_M_AXI_GP1_WVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_PJTAG_TDO_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SDIO0_BUSPOW_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SDIO0_CLK_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SDIO0_CMD_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SDIO0_CMD_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SDIO0_LED_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SDIO1_BUSPOW_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SDIO1_CLK_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SDIO1_CMD_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SDIO1_CMD_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SDIO1_LED_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI0_MISO_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI0_MISO_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI0_MOSI_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI0_MOSI_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI0_SCLK_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI0_SCLK_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI0_SS1_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI0_SS2_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI0_SS_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI0_SS_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI1_MISO_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI1_MISO_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI1_MOSI_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI1_MOSI_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI1_SCLK_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI1_SCLK_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI1_SS1_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI1_SS2_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI1_SS_O_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_SPI1_SS_T_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_ACP_ARESETN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_ACP_ARREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_ACP_AWREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_ACP_BVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_ACP_RLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_ACP_RVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_ACP_WREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP0_ARESETN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP0_ARREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP0_AWREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP0_BVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP0_RLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP0_RVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP0_WREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP1_ARESETN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP1_ARREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP1_AWREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP1_BVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP1_RLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP1_RVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_GP1_WREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP0_ARESETN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP0_ARREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP0_AWREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP0_BVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP0_RLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP0_RVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP0_WREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP1_ARESETN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP1_ARREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP1_AWREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP1_BVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP1_RLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP1_RVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP1_WREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP2_ARESETN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP2_ARREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP2_AWREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP2_BVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP2_RLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP2_RVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP2_WREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP3_ARESETN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP3_ARREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP3_AWREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP3_BVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP3_RLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP3_RVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_S_AXI_HP3_WREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_TRACE_CLK_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_TRACE_CTL_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_TTC0_WAVE0_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_TTC0_WAVE1_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_TTC0_WAVE2_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_TTC1_WAVE0_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_TTC1_WAVE1_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_TTC1_WAVE2_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_UART0_DTRN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_UART0_RTSN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_UART0_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_UART1_DTRN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_UART1_RTSN_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_UART1_TX_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_USB0_VBUS_PWRSELECT_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_USB1_VBUS_PWRSELECT_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_WDT_RST_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_DMA0_DATYPE_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_DMA1_DATYPE_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_DMA2_DATYPE_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_DMA3_DATYPE_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_ENET0_GMII_TXD_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_ENET1_GMII_TXD_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_EVENT_STANDBYWFE_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_EVENT_STANDBYWFI_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_FTMT_P2F_DEBUG_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_GPIO_O_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_GPIO_T_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_M_AXI_GP0_ARCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_M_AXI_GP0_ARLOCK_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_M_AXI_GP0_ARQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_M_AXI_GP0_ARSIZE_UNCONNECTED : STD_LOGIC_VECTOR ( 2 to 2 );
  signal NLW_inst_M_AXI_GP0_AWCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_M_AXI_GP0_AWLOCK_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_M_AXI_GP0_AWQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_M_AXI_GP0_AWSIZE_UNCONNECTED : STD_LOGIC_VECTOR ( 2 to 2 );
  signal NLW_inst_M_AXI_GP0_WID_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_inst_M_AXI_GP1_ARADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_M_AXI_GP1_ARBURST_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_M_AXI_GP1_ARCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_M_AXI_GP1_ARID_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_inst_M_AXI_GP1_ARLEN_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_M_AXI_GP1_ARLOCK_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_M_AXI_GP1_ARPROT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_M_AXI_GP1_ARQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_M_AXI_GP1_ARSIZE_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_M_AXI_GP1_AWADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_M_AXI_GP1_AWBURST_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_M_AXI_GP1_AWCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_M_AXI_GP1_AWID_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_inst_M_AXI_GP1_AWLEN_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_M_AXI_GP1_AWLOCK_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_M_AXI_GP1_AWPROT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_M_AXI_GP1_AWQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_M_AXI_GP1_AWSIZE_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_M_AXI_GP1_WDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_M_AXI_GP1_WID_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_inst_M_AXI_GP1_WSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_SDIO0_BUSVOLT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_SDIO0_DATA_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_SDIO0_DATA_T_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_SDIO1_BUSVOLT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_SDIO1_DATA_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_SDIO1_DATA_T_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_S_AXI_ACP_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_S_AXI_ACP_BRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_ACP_RDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_S_AXI_ACP_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_S_AXI_ACP_RRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_GP0_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_GP0_BRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_GP0_RDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_S_AXI_GP0_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_GP0_RRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_GP1_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_GP1_BRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_GP1_RDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_S_AXI_GP1_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_GP1_RRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_HP0_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_HP0_BRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_HP0_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_S_AXI_HP0_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_S_AXI_HP0_RDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_S_AXI_HP0_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_HP0_RRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_HP0_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_HP0_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_S_AXI_HP1_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_HP1_BRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_HP1_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_S_AXI_HP1_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_S_AXI_HP1_RDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_S_AXI_HP1_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_HP1_RRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_HP1_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_HP1_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_S_AXI_HP2_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_HP2_BRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_HP2_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_S_AXI_HP2_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_S_AXI_HP2_RDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_S_AXI_HP2_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_HP2_RRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_HP2_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_HP2_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_S_AXI_HP3_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_HP3_BRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_HP3_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_S_AXI_HP3_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_S_AXI_HP3_RDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_S_AXI_HP3_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_HP3_RRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_S_AXI_HP3_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_S_AXI_HP3_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_TRACE_DATA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_USB0_PORT_INDCTL_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_USB1_PORT_INDCTL_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_DM_WIDTH : integer;
  attribute C_DM_WIDTH of inst : label is 4;
  attribute C_DQS_WIDTH : integer;
  attribute C_DQS_WIDTH of inst : label is 4;
  attribute C_DQ_WIDTH : integer;
  attribute C_DQ_WIDTH of inst : label is 32;
  attribute C_EMIO_GPIO_WIDTH : integer;
  attribute C_EMIO_GPIO_WIDTH of inst : label is 64;
  attribute C_EN_EMIO_ENET0 : integer;
  attribute C_EN_EMIO_ENET0 of inst : label is 0;
  attribute C_EN_EMIO_ENET1 : integer;
  attribute C_EN_EMIO_ENET1 of inst : label is 0;
  attribute C_EN_EMIO_PJTAG : integer;
  attribute C_EN_EMIO_PJTAG of inst : label is 0;
  attribute C_EN_EMIO_TRACE : integer;
  attribute C_EN_EMIO_TRACE of inst : label is 0;
  attribute C_FCLK_CLK0_BUF : string;
  attribute C_FCLK_CLK0_BUF of inst : label is "TRUE";
  attribute C_FCLK_CLK1_BUF : string;
  attribute C_FCLK_CLK1_BUF of inst : label is "TRUE";
  attribute C_FCLK_CLK2_BUF : string;
  attribute C_FCLK_CLK2_BUF of inst : label is "FALSE";
  attribute C_FCLK_CLK3_BUF : string;
  attribute C_FCLK_CLK3_BUF of inst : label is "FALSE";
  attribute C_GP0_EN_MODIFIABLE_TXN : integer;
  attribute C_GP0_EN_MODIFIABLE_TXN of inst : label is 1;
  attribute C_GP1_EN_MODIFIABLE_TXN : integer;
  attribute C_GP1_EN_MODIFIABLE_TXN of inst : label is 1;
  attribute C_INCLUDE_ACP_TRANS_CHECK : integer;
  attribute C_INCLUDE_ACP_TRANS_CHECK of inst : label is 0;
  attribute C_INCLUDE_TRACE_BUFFER : integer;
  attribute C_INCLUDE_TRACE_BUFFER of inst : label is 0;
  attribute C_IRQ_F2P_MODE : string;
  attribute C_IRQ_F2P_MODE of inst : label is "DIRECT";
  attribute C_MIO_PRIMITIVE : integer;
  attribute C_MIO_PRIMITIVE of inst : label is 54;
  attribute C_M_AXI_GP0_ENABLE_STATIC_REMAP : integer;
  attribute C_M_AXI_GP0_ENABLE_STATIC_REMAP of inst : label is 0;
  attribute C_M_AXI_GP0_ID_WIDTH : integer;
  attribute C_M_AXI_GP0_ID_WIDTH of inst : label is 12;
  attribute C_M_AXI_GP0_THREAD_ID_WIDTH : integer;
  attribute C_M_AXI_GP0_THREAD_ID_WIDTH of inst : label is 12;
  attribute C_M_AXI_GP1_ENABLE_STATIC_REMAP : integer;
  attribute C_M_AXI_GP1_ENABLE_STATIC_REMAP of inst : label is 0;
  attribute C_M_AXI_GP1_ID_WIDTH : integer;
  attribute C_M_AXI_GP1_ID_WIDTH of inst : label is 12;
  attribute C_M_AXI_GP1_THREAD_ID_WIDTH : integer;
  attribute C_M_AXI_GP1_THREAD_ID_WIDTH of inst : label is 12;
  attribute C_NUM_F2P_INTR_INPUTS : integer;
  attribute C_NUM_F2P_INTR_INPUTS of inst : label is 1;
  attribute C_PACKAGE_NAME : string;
  attribute C_PACKAGE_NAME of inst : label is "clg400";
  attribute C_PS7_SI_REV : string;
  attribute C_PS7_SI_REV of inst : label is "PRODUCTION";
  attribute C_S_AXI_ACP_ARUSER_VAL : integer;
  attribute C_S_AXI_ACP_ARUSER_VAL of inst : label is 31;
  attribute C_S_AXI_ACP_AWUSER_VAL : integer;
  attribute C_S_AXI_ACP_AWUSER_VAL of inst : label is 31;
  attribute C_S_AXI_ACP_ID_WIDTH : integer;
  attribute C_S_AXI_ACP_ID_WIDTH of inst : label is 3;
  attribute C_S_AXI_GP0_ID_WIDTH : integer;
  attribute C_S_AXI_GP0_ID_WIDTH of inst : label is 6;
  attribute C_S_AXI_GP1_ID_WIDTH : integer;
  attribute C_S_AXI_GP1_ID_WIDTH of inst : label is 6;
  attribute C_S_AXI_HP0_DATA_WIDTH : integer;
  attribute C_S_AXI_HP0_DATA_WIDTH of inst : label is 64;
  attribute C_S_AXI_HP0_ID_WIDTH : integer;
  attribute C_S_AXI_HP0_ID_WIDTH of inst : label is 6;
  attribute C_S_AXI_HP1_DATA_WIDTH : integer;
  attribute C_S_AXI_HP1_DATA_WIDTH of inst : label is 64;
  attribute C_S_AXI_HP1_ID_WIDTH : integer;
  attribute C_S_AXI_HP1_ID_WIDTH of inst : label is 6;
  attribute C_S_AXI_HP2_DATA_WIDTH : integer;
  attribute C_S_AXI_HP2_DATA_WIDTH of inst : label is 64;
  attribute C_S_AXI_HP2_ID_WIDTH : integer;
  attribute C_S_AXI_HP2_ID_WIDTH of inst : label is 6;
  attribute C_S_AXI_HP3_DATA_WIDTH : integer;
  attribute C_S_AXI_HP3_DATA_WIDTH of inst : label is 64;
  attribute C_S_AXI_HP3_ID_WIDTH : integer;
  attribute C_S_AXI_HP3_ID_WIDTH of inst : label is 6;
  attribute C_TRACE_BUFFER_CLOCK_DELAY : integer;
  attribute C_TRACE_BUFFER_CLOCK_DELAY of inst : label is 12;
  attribute C_TRACE_BUFFER_FIFO_SIZE : integer;
  attribute C_TRACE_BUFFER_FIFO_SIZE of inst : label is 128;
  attribute C_TRACE_INTERNAL_WIDTH : integer;
  attribute C_TRACE_INTERNAL_WIDTH of inst : label is 2;
  attribute C_TRACE_PIPELINE_WIDTH : integer;
  attribute C_TRACE_PIPELINE_WIDTH of inst : label is 8;
  attribute C_USE_AXI_NONSECURE : integer;
  attribute C_USE_AXI_NONSECURE of inst : label is 0;
  attribute C_USE_DEFAULT_ACP_USER_VAL : integer;
  attribute C_USE_DEFAULT_ACP_USER_VAL of inst : label is 0;
  attribute C_USE_M_AXI_GP0 : integer;
  attribute C_USE_M_AXI_GP0 of inst : label is 1;
  attribute C_USE_M_AXI_GP1 : integer;
  attribute C_USE_M_AXI_GP1 of inst : label is 0;
  attribute C_USE_S_AXI_ACP : integer;
  attribute C_USE_S_AXI_ACP of inst : label is 0;
  attribute C_USE_S_AXI_GP0 : integer;
  attribute C_USE_S_AXI_GP0 of inst : label is 0;
  attribute C_USE_S_AXI_GP1 : integer;
  attribute C_USE_S_AXI_GP1 of inst : label is 0;
  attribute C_USE_S_AXI_HP0 : integer;
  attribute C_USE_S_AXI_HP0 of inst : label is 0;
  attribute C_USE_S_AXI_HP1 : integer;
  attribute C_USE_S_AXI_HP1 of inst : label is 0;
  attribute C_USE_S_AXI_HP2 : integer;
  attribute C_USE_S_AXI_HP2 of inst : label is 0;
  attribute C_USE_S_AXI_HP3 : integer;
  attribute C_USE_S_AXI_HP3 of inst : label is 0;
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of inst : label is "dwa_ps_bd_processing_system7_0_0.hwdef";
  attribute POWER : string;
  attribute POWER of inst : label is "<PROCESSOR name={system} numA9Cores={2} clockFreq={667} load={0.5} /><MEMORY name={code} memType={DDR3} dataWidth={32} clockFreq={533.333333} readRate={0.5} writeRate={0.5} /><IO interface={GPIO_Bank_1} ioStandard={LVCMOS18} bidis={2} ioBank={Vcco_p1} clockFreq={1} usageRate={0.5} /><IO interface={GPIO_Bank_0} ioStandard={LVCMOS33} bidis={9} ioBank={Vcco_p0} clockFreq={1} usageRate={0.5} /><IO interface={Timer} ioStandard={} bidis={0} ioBank={} clockFreq={111.111115} usageRate={0.5} /><IO interface={UART} ioStandard={LVCMOS18} bidis={2} ioBank={Vcco_p1} clockFreq={50.000000} usageRate={0.5} /><IO interface={SD} ioStandard={LVCMOS18} bidis={8} ioBank={Vcco_p1} clockFreq={25.000000} usageRate={0.5} /><IO interface={USB} ioStandard={LVCMOS18} bidis={12} ioBank={Vcco_p1} clockFreq={60} usageRate={0.5} /><IO interface={GigE} ioStandard={LVCMOS18} bidis={14} ioBank={Vcco_p1} clockFreq={125.000000} usageRate={0.5} /><IO interface={QSPI} ioStandard={LVCMOS33} bidis={7} ioBank={Vcco_p0} clockFreq={200} usageRate={0.5} /><PLL domain={Processor} vco={1333.333} /><PLL domain={Memory} vco={1066.667} /><PLL domain={IO} vco={1000.000} /><AXI interface={M_AXI_GP0} dataWidth={32} clockFreq={100} usageRate={0.5} />/>";
  attribute USE_TRACE_DATA_EDGE_DETECTOR : integer;
  attribute USE_TRACE_DATA_EDGE_DETECTOR of inst : label is 0;
  attribute x_interface_info : string;
  attribute x_interface_info of DDR_CAS_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CAS_N";
  attribute x_interface_info of DDR_CKE : signal is "xilinx.com:interface:ddrx:1.0 DDR CKE";
  attribute x_interface_info of DDR_CS_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CS_N";
  attribute x_interface_info of DDR_Clk : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_P";
  attribute x_interface_info of DDR_Clk_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_N";
  attribute x_interface_info of DDR_DRSTB : signal is "xilinx.com:interface:ddrx:1.0 DDR RESET_N";
  attribute x_interface_info of DDR_ODT : signal is "xilinx.com:interface:ddrx:1.0 DDR ODT";
  attribute x_interface_info of DDR_RAS_n : signal is "xilinx.com:interface:ddrx:1.0 DDR RAS_N";
  attribute x_interface_info of DDR_VRN : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN";
  attribute x_interface_info of DDR_VRP : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP";
  attribute x_interface_info of DDR_WEB : signal is "xilinx.com:interface:ddrx:1.0 DDR WE_N";
  attribute x_interface_info of FCLK_CLK0 : signal is "xilinx.com:signal:clock:1.0 FCLK_CLK0 CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of FCLK_CLK0 : signal is "XIL_INTERFACENAME FCLK_CLK0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of FCLK_CLK1 : signal is "xilinx.com:signal:clock:1.0 FCLK_CLK1 CLK";
  attribute x_interface_parameter of FCLK_CLK1 : signal is "XIL_INTERFACENAME FCLK_CLK1, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK1, INSERT_VIP 0";
  attribute x_interface_info of FCLK_RESET0_N : signal is "xilinx.com:signal:reset:1.0 FCLK_RESET0_N RST";
  attribute x_interface_parameter of FCLK_RESET0_N : signal is "XIL_INTERFACENAME FCLK_RESET0_N, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of M_AXI_GP0_ACLK : signal is "xilinx.com:signal:clock:1.0 M_AXI_GP0_ACLK CLK";
  attribute x_interface_parameter of M_AXI_GP0_ACLK : signal is "XIL_INTERFACENAME M_AXI_GP0_ACLK, ASSOCIATED_BUSIF M_AXI_GP0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of M_AXI_GP0_ARREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARREADY";
  attribute x_interface_info of M_AXI_GP0_ARVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARVALID";
  attribute x_interface_info of M_AXI_GP0_AWREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWREADY";
  attribute x_interface_info of M_AXI_GP0_AWVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWVALID";
  attribute x_interface_info of M_AXI_GP0_BREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 BREADY";
  attribute x_interface_info of M_AXI_GP0_BVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 BVALID";
  attribute x_interface_info of M_AXI_GP0_RLAST : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RLAST";
  attribute x_interface_info of M_AXI_GP0_RREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RREADY";
  attribute x_interface_info of M_AXI_GP0_RVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RVALID";
  attribute x_interface_info of M_AXI_GP0_WLAST : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WLAST";
  attribute x_interface_info of M_AXI_GP0_WREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WREADY";
  attribute x_interface_info of M_AXI_GP0_WVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WVALID";
  attribute x_interface_info of PS_CLK : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK";
  attribute x_interface_info of PS_PORB : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB";
  attribute x_interface_parameter of PS_PORB : signal is "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false";
  attribute x_interface_info of PS_SRSTB : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB";
  attribute x_interface_info of USB0_VBUS_PWRFAULT : signal is "xilinx.com:display_processing_system7:usbctrl:1.0 USBIND_0 VBUS_PWRFAULT";
  attribute x_interface_info of USB0_VBUS_PWRSELECT : signal is "xilinx.com:display_processing_system7:usbctrl:1.0 USBIND_0 VBUS_PWRSELECT";
  attribute x_interface_info of DDR_Addr : signal is "xilinx.com:interface:ddrx:1.0 DDR ADDR";
  attribute x_interface_info of DDR_BankAddr : signal is "xilinx.com:interface:ddrx:1.0 DDR BA";
  attribute x_interface_info of DDR_DM : signal is "xilinx.com:interface:ddrx:1.0 DDR DM";
  attribute x_interface_info of DDR_DQ : signal is "xilinx.com:interface:ddrx:1.0 DDR DQ";
  attribute x_interface_info of DDR_DQS : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_P";
  attribute x_interface_parameter of DDR_DQS : signal is "XIL_INTERFACENAME DDR, CAN_DEBUG false, TIMEPERIOD_PS 1250, MEMORY_TYPE COMPONENTS, DATA_WIDTH 8, CS_ENABLED true, DATA_MASK_ENABLED true, SLOT Single, MEM_ADDR_MAP ROW_COLUMN_BANK, BURST_LENGTH 8, AXI_ARBITRATION_SCHEME TDM, CAS_LATENCY 11, CAS_WRITE_LATENCY 11";
  attribute x_interface_info of DDR_DQS_n : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_N";
  attribute x_interface_info of MIO : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO";
  attribute x_interface_info of M_AXI_GP0_ARADDR : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARADDR";
  attribute x_interface_info of M_AXI_GP0_ARBURST : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARBURST";
  attribute x_interface_info of M_AXI_GP0_ARCACHE : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARCACHE";
  attribute x_interface_info of M_AXI_GP0_ARID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARID";
  attribute x_interface_info of M_AXI_GP0_ARLEN : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARLEN";
  attribute x_interface_info of M_AXI_GP0_ARLOCK : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARLOCK";
  attribute x_interface_info of M_AXI_GP0_ARPROT : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARPROT";
  attribute x_interface_info of M_AXI_GP0_ARQOS : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARQOS";
  attribute x_interface_info of M_AXI_GP0_ARSIZE : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARSIZE";
  attribute x_interface_info of M_AXI_GP0_AWADDR : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWADDR";
  attribute x_interface_info of M_AXI_GP0_AWBURST : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWBURST";
  attribute x_interface_info of M_AXI_GP0_AWCACHE : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWCACHE";
  attribute x_interface_info of M_AXI_GP0_AWID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWID";
  attribute x_interface_info of M_AXI_GP0_AWLEN : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWLEN";
  attribute x_interface_info of M_AXI_GP0_AWLOCK : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWLOCK";
  attribute x_interface_info of M_AXI_GP0_AWPROT : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWPROT";
  attribute x_interface_info of M_AXI_GP0_AWQOS : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWQOS";
  attribute x_interface_info of M_AXI_GP0_AWSIZE : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWSIZE";
  attribute x_interface_info of M_AXI_GP0_BID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 BID";
  attribute x_interface_info of M_AXI_GP0_BRESP : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 BRESP";
  attribute x_interface_info of M_AXI_GP0_RDATA : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RDATA";
  attribute x_interface_parameter of M_AXI_GP0_RDATA : signal is "XIL_INTERFACENAME M_AXI_GP0, SUPPORTS_NARROW_BURST 0, NUM_WRITE_OUTSTANDING 8, NUM_READ_OUTSTANDING 8, DATA_WIDTH 32, PROTOCOL AXI3, FREQ_HZ 100000000, ID_WIDTH 12, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, MAX_BURST_LENGTH 16, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of M_AXI_GP0_RID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RID";
  attribute x_interface_info of M_AXI_GP0_RRESP : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RRESP";
  attribute x_interface_info of M_AXI_GP0_WDATA : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WDATA";
  attribute x_interface_info of M_AXI_GP0_WID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WID";
  attribute x_interface_info of M_AXI_GP0_WSTRB : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WSTRB";
  attribute x_interface_info of USB0_PORT_INDCTL : signal is "xilinx.com:display_processing_system7:usbctrl:1.0 USBIND_0 PORT_INDCTL";
begin
  M_AXI_GP0_ARCACHE(3) <= \<const0>\;
  M_AXI_GP0_ARCACHE(2) <= \<const0>\;
  M_AXI_GP0_ARCACHE(1) <= \<const0>\;
  M_AXI_GP0_ARCACHE(0) <= \<const0>\;
  M_AXI_GP0_ARLOCK(1) <= \<const0>\;
  M_AXI_GP0_ARLOCK(0) <= \<const0>\;
  M_AXI_GP0_ARQOS(3) <= \<const0>\;
  M_AXI_GP0_ARQOS(2) <= \<const0>\;
  M_AXI_GP0_ARQOS(1) <= \<const0>\;
  M_AXI_GP0_ARQOS(0) <= \<const0>\;
  M_AXI_GP0_ARSIZE(2) <= \<const0>\;
  M_AXI_GP0_ARSIZE(1 downto 0) <= \^m_axi_gp0_arsize\(1 downto 0);
  M_AXI_GP0_AWCACHE(3) <= \<const0>\;
  M_AXI_GP0_AWCACHE(2) <= \<const0>\;
  M_AXI_GP0_AWCACHE(1) <= \<const0>\;
  M_AXI_GP0_AWCACHE(0) <= \<const0>\;
  M_AXI_GP0_AWLOCK(1) <= \<const0>\;
  M_AXI_GP0_AWLOCK(0) <= \<const0>\;
  M_AXI_GP0_AWQOS(3) <= \<const0>\;
  M_AXI_GP0_AWQOS(2) <= \<const0>\;
  M_AXI_GP0_AWQOS(1) <= \<const0>\;
  M_AXI_GP0_AWQOS(0) <= \<const0>\;
  M_AXI_GP0_AWSIZE(2) <= \<const0>\;
  M_AXI_GP0_AWSIZE(1 downto 0) <= \^m_axi_gp0_awsize\(1 downto 0);
  M_AXI_GP0_WID(11) <= \<const0>\;
  M_AXI_GP0_WID(10) <= \<const0>\;
  M_AXI_GP0_WID(9) <= \<const0>\;
  M_AXI_GP0_WID(8) <= \<const0>\;
  M_AXI_GP0_WID(7) <= \<const0>\;
  M_AXI_GP0_WID(6) <= \<const0>\;
  M_AXI_GP0_WID(5) <= \<const0>\;
  M_AXI_GP0_WID(4) <= \<const0>\;
  M_AXI_GP0_WID(3) <= \<const0>\;
  M_AXI_GP0_WID(2) <= \<const0>\;
  M_AXI_GP0_WID(1) <= \<const0>\;
  M_AXI_GP0_WID(0) <= \<const0>\;
  M_AXI_GP0_WLAST <= \<const0>\;
  TTC0_WAVE0_OUT <= \<const0>\;
  TTC0_WAVE1_OUT <= \<const0>\;
  TTC0_WAVE2_OUT <= \<const0>\;
  USB0_PORT_INDCTL(1) <= \<const0>\;
  USB0_PORT_INDCTL(0) <= \<const0>\;
  USB0_VBUS_PWRSELECT <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.dwa_ps_bd_processing_system7_v5_5_processing_system7
     port map (
      CAN0_PHY_RX => '0',
      CAN0_PHY_TX => NLW_inst_CAN0_PHY_TX_UNCONNECTED,
      CAN1_PHY_RX => '0',
      CAN1_PHY_TX => NLW_inst_CAN1_PHY_TX_UNCONNECTED,
      Core0_nFIQ => '0',
      Core0_nIRQ => '0',
      Core1_nFIQ => '0',
      Core1_nIRQ => '0',
      DDR_ARB(3 downto 0) => B"0000",
      DDR_Addr(14 downto 0) => DDR_Addr(14 downto 0),
      DDR_BankAddr(2 downto 0) => DDR_BankAddr(2 downto 0),
      DDR_CAS_n => DDR_CAS_n,
      DDR_CKE => DDR_CKE,
      DDR_CS_n => DDR_CS_n,
      DDR_Clk => DDR_Clk,
      DDR_Clk_n => DDR_Clk_n,
      DDR_DM(3 downto 0) => DDR_DM(3 downto 0),
      DDR_DQ(31 downto 0) => DDR_DQ(31 downto 0),
      DDR_DQS(3 downto 0) => DDR_DQS(3 downto 0),
      DDR_DQS_n(3 downto 0) => DDR_DQS_n(3 downto 0),
      DDR_DRSTB => DDR_DRSTB,
      DDR_ODT => DDR_ODT,
      DDR_RAS_n => DDR_RAS_n,
      DDR_VRN => DDR_VRN,
      DDR_VRP => DDR_VRP,
      DDR_WEB => DDR_WEB,
      DMA0_ACLK => '0',
      DMA0_DAREADY => '0',
      DMA0_DATYPE(1 downto 0) => NLW_inst_DMA0_DATYPE_UNCONNECTED(1 downto 0),
      DMA0_DAVALID => NLW_inst_DMA0_DAVALID_UNCONNECTED,
      DMA0_DRLAST => '0',
      DMA0_DRREADY => NLW_inst_DMA0_DRREADY_UNCONNECTED,
      DMA0_DRTYPE(1 downto 0) => B"00",
      DMA0_DRVALID => '0',
      DMA0_RSTN => NLW_inst_DMA0_RSTN_UNCONNECTED,
      DMA1_ACLK => '0',
      DMA1_DAREADY => '0',
      DMA1_DATYPE(1 downto 0) => NLW_inst_DMA1_DATYPE_UNCONNECTED(1 downto 0),
      DMA1_DAVALID => NLW_inst_DMA1_DAVALID_UNCONNECTED,
      DMA1_DRLAST => '0',
      DMA1_DRREADY => NLW_inst_DMA1_DRREADY_UNCONNECTED,
      DMA1_DRTYPE(1 downto 0) => B"00",
      DMA1_DRVALID => '0',
      DMA1_RSTN => NLW_inst_DMA1_RSTN_UNCONNECTED,
      DMA2_ACLK => '0',
      DMA2_DAREADY => '0',
      DMA2_DATYPE(1 downto 0) => NLW_inst_DMA2_DATYPE_UNCONNECTED(1 downto 0),
      DMA2_DAVALID => NLW_inst_DMA2_DAVALID_UNCONNECTED,
      DMA2_DRLAST => '0',
      DMA2_DRREADY => NLW_inst_DMA2_DRREADY_UNCONNECTED,
      DMA2_DRTYPE(1 downto 0) => B"00",
      DMA2_DRVALID => '0',
      DMA2_RSTN => NLW_inst_DMA2_RSTN_UNCONNECTED,
      DMA3_ACLK => '0',
      DMA3_DAREADY => '0',
      DMA3_DATYPE(1 downto 0) => NLW_inst_DMA3_DATYPE_UNCONNECTED(1 downto 0),
      DMA3_DAVALID => NLW_inst_DMA3_DAVALID_UNCONNECTED,
      DMA3_DRLAST => '0',
      DMA3_DRREADY => NLW_inst_DMA3_DRREADY_UNCONNECTED,
      DMA3_DRTYPE(1 downto 0) => B"00",
      DMA3_DRVALID => '0',
      DMA3_RSTN => NLW_inst_DMA3_RSTN_UNCONNECTED,
      ENET0_EXT_INTIN => '0',
      ENET0_GMII_COL => '0',
      ENET0_GMII_CRS => '0',
      ENET0_GMII_RXD(7 downto 0) => B"00000000",
      ENET0_GMII_RX_CLK => '0',
      ENET0_GMII_RX_DV => '0',
      ENET0_GMII_RX_ER => '0',
      ENET0_GMII_TXD(7 downto 0) => NLW_inst_ENET0_GMII_TXD_UNCONNECTED(7 downto 0),
      ENET0_GMII_TX_CLK => '0',
      ENET0_GMII_TX_EN => NLW_inst_ENET0_GMII_TX_EN_UNCONNECTED,
      ENET0_GMII_TX_ER => NLW_inst_ENET0_GMII_TX_ER_UNCONNECTED,
      ENET0_MDIO_I => '0',
      ENET0_MDIO_MDC => NLW_inst_ENET0_MDIO_MDC_UNCONNECTED,
      ENET0_MDIO_O => NLW_inst_ENET0_MDIO_O_UNCONNECTED,
      ENET0_MDIO_T => NLW_inst_ENET0_MDIO_T_UNCONNECTED,
      ENET0_PTP_DELAY_REQ_RX => NLW_inst_ENET0_PTP_DELAY_REQ_RX_UNCONNECTED,
      ENET0_PTP_DELAY_REQ_TX => NLW_inst_ENET0_PTP_DELAY_REQ_TX_UNCONNECTED,
      ENET0_PTP_PDELAY_REQ_RX => NLW_inst_ENET0_PTP_PDELAY_REQ_RX_UNCONNECTED,
      ENET0_PTP_PDELAY_REQ_TX => NLW_inst_ENET0_PTP_PDELAY_REQ_TX_UNCONNECTED,
      ENET0_PTP_PDELAY_RESP_RX => NLW_inst_ENET0_PTP_PDELAY_RESP_RX_UNCONNECTED,
      ENET0_PTP_PDELAY_RESP_TX => NLW_inst_ENET0_PTP_PDELAY_RESP_TX_UNCONNECTED,
      ENET0_PTP_SYNC_FRAME_RX => NLW_inst_ENET0_PTP_SYNC_FRAME_RX_UNCONNECTED,
      ENET0_PTP_SYNC_FRAME_TX => NLW_inst_ENET0_PTP_SYNC_FRAME_TX_UNCONNECTED,
      ENET0_SOF_RX => NLW_inst_ENET0_SOF_RX_UNCONNECTED,
      ENET0_SOF_TX => NLW_inst_ENET0_SOF_TX_UNCONNECTED,
      ENET1_EXT_INTIN => '0',
      ENET1_GMII_COL => '0',
      ENET1_GMII_CRS => '0',
      ENET1_GMII_RXD(7 downto 0) => B"00000000",
      ENET1_GMII_RX_CLK => '0',
      ENET1_GMII_RX_DV => '0',
      ENET1_GMII_RX_ER => '0',
      ENET1_GMII_TXD(7 downto 0) => NLW_inst_ENET1_GMII_TXD_UNCONNECTED(7 downto 0),
      ENET1_GMII_TX_CLK => '0',
      ENET1_GMII_TX_EN => NLW_inst_ENET1_GMII_TX_EN_UNCONNECTED,
      ENET1_GMII_TX_ER => NLW_inst_ENET1_GMII_TX_ER_UNCONNECTED,
      ENET1_MDIO_I => '0',
      ENET1_MDIO_MDC => NLW_inst_ENET1_MDIO_MDC_UNCONNECTED,
      ENET1_MDIO_O => NLW_inst_ENET1_MDIO_O_UNCONNECTED,
      ENET1_MDIO_T => NLW_inst_ENET1_MDIO_T_UNCONNECTED,
      ENET1_PTP_DELAY_REQ_RX => NLW_inst_ENET1_PTP_DELAY_REQ_RX_UNCONNECTED,
      ENET1_PTP_DELAY_REQ_TX => NLW_inst_ENET1_PTP_DELAY_REQ_TX_UNCONNECTED,
      ENET1_PTP_PDELAY_REQ_RX => NLW_inst_ENET1_PTP_PDELAY_REQ_RX_UNCONNECTED,
      ENET1_PTP_PDELAY_REQ_TX => NLW_inst_ENET1_PTP_PDELAY_REQ_TX_UNCONNECTED,
      ENET1_PTP_PDELAY_RESP_RX => NLW_inst_ENET1_PTP_PDELAY_RESP_RX_UNCONNECTED,
      ENET1_PTP_PDELAY_RESP_TX => NLW_inst_ENET1_PTP_PDELAY_RESP_TX_UNCONNECTED,
      ENET1_PTP_SYNC_FRAME_RX => NLW_inst_ENET1_PTP_SYNC_FRAME_RX_UNCONNECTED,
      ENET1_PTP_SYNC_FRAME_TX => NLW_inst_ENET1_PTP_SYNC_FRAME_TX_UNCONNECTED,
      ENET1_SOF_RX => NLW_inst_ENET1_SOF_RX_UNCONNECTED,
      ENET1_SOF_TX => NLW_inst_ENET1_SOF_TX_UNCONNECTED,
      EVENT_EVENTI => '0',
      EVENT_EVENTO => NLW_inst_EVENT_EVENTO_UNCONNECTED,
      EVENT_STANDBYWFE(1 downto 0) => NLW_inst_EVENT_STANDBYWFE_UNCONNECTED(1 downto 0),
      EVENT_STANDBYWFI(1 downto 0) => NLW_inst_EVENT_STANDBYWFI_UNCONNECTED(1 downto 0),
      FCLK_CLK0 => FCLK_CLK0,
      FCLK_CLK1 => FCLK_CLK1,
      FCLK_CLK2 => NLW_inst_FCLK_CLK2_UNCONNECTED,
      FCLK_CLK3 => NLW_inst_FCLK_CLK3_UNCONNECTED,
      FCLK_CLKTRIG0_N => '0',
      FCLK_CLKTRIG1_N => '0',
      FCLK_CLKTRIG2_N => '0',
      FCLK_CLKTRIG3_N => '0',
      FCLK_RESET0_N => FCLK_RESET0_N,
      FCLK_RESET1_N => NLW_inst_FCLK_RESET1_N_UNCONNECTED,
      FCLK_RESET2_N => NLW_inst_FCLK_RESET2_N_UNCONNECTED,
      FCLK_RESET3_N => NLW_inst_FCLK_RESET3_N_UNCONNECTED,
      FPGA_IDLE_N => '0',
      FTMD_TRACEIN_ATID(3 downto 0) => B"0000",
      FTMD_TRACEIN_CLK => '0',
      FTMD_TRACEIN_DATA(31 downto 0) => B"00000000000000000000000000000000",
      FTMD_TRACEIN_VALID => '0',
      FTMT_F2P_DEBUG(31 downto 0) => B"00000000000000000000000000000000",
      FTMT_F2P_TRIGACK_0 => NLW_inst_FTMT_F2P_TRIGACK_0_UNCONNECTED,
      FTMT_F2P_TRIGACK_1 => NLW_inst_FTMT_F2P_TRIGACK_1_UNCONNECTED,
      FTMT_F2P_TRIGACK_2 => NLW_inst_FTMT_F2P_TRIGACK_2_UNCONNECTED,
      FTMT_F2P_TRIGACK_3 => NLW_inst_FTMT_F2P_TRIGACK_3_UNCONNECTED,
      FTMT_F2P_TRIG_0 => '0',
      FTMT_F2P_TRIG_1 => '0',
      FTMT_F2P_TRIG_2 => '0',
      FTMT_F2P_TRIG_3 => '0',
      FTMT_P2F_DEBUG(31 downto 0) => NLW_inst_FTMT_P2F_DEBUG_UNCONNECTED(31 downto 0),
      FTMT_P2F_TRIGACK_0 => '0',
      FTMT_P2F_TRIGACK_1 => '0',
      FTMT_P2F_TRIGACK_2 => '0',
      FTMT_P2F_TRIGACK_3 => '0',
      FTMT_P2F_TRIG_0 => NLW_inst_FTMT_P2F_TRIG_0_UNCONNECTED,
      FTMT_P2F_TRIG_1 => NLW_inst_FTMT_P2F_TRIG_1_UNCONNECTED,
      FTMT_P2F_TRIG_2 => NLW_inst_FTMT_P2F_TRIG_2_UNCONNECTED,
      FTMT_P2F_TRIG_3 => NLW_inst_FTMT_P2F_TRIG_3_UNCONNECTED,
      GPIO_I(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      GPIO_O(63 downto 0) => NLW_inst_GPIO_O_UNCONNECTED(63 downto 0),
      GPIO_T(63 downto 0) => NLW_inst_GPIO_T_UNCONNECTED(63 downto 0),
      I2C0_SCL_I => '0',
      I2C0_SCL_O => NLW_inst_I2C0_SCL_O_UNCONNECTED,
      I2C0_SCL_T => NLW_inst_I2C0_SCL_T_UNCONNECTED,
      I2C0_SDA_I => '0',
      I2C0_SDA_O => NLW_inst_I2C0_SDA_O_UNCONNECTED,
      I2C0_SDA_T => NLW_inst_I2C0_SDA_T_UNCONNECTED,
      I2C1_SCL_I => '0',
      I2C1_SCL_O => NLW_inst_I2C1_SCL_O_UNCONNECTED,
      I2C1_SCL_T => NLW_inst_I2C1_SCL_T_UNCONNECTED,
      I2C1_SDA_I => '0',
      I2C1_SDA_O => NLW_inst_I2C1_SDA_O_UNCONNECTED,
      I2C1_SDA_T => NLW_inst_I2C1_SDA_T_UNCONNECTED,
      IRQ_F2P(0) => '0',
      IRQ_P2F_CAN0 => NLW_inst_IRQ_P2F_CAN0_UNCONNECTED,
      IRQ_P2F_CAN1 => NLW_inst_IRQ_P2F_CAN1_UNCONNECTED,
      IRQ_P2F_CTI => NLW_inst_IRQ_P2F_CTI_UNCONNECTED,
      IRQ_P2F_DMAC0 => NLW_inst_IRQ_P2F_DMAC0_UNCONNECTED,
      IRQ_P2F_DMAC1 => NLW_inst_IRQ_P2F_DMAC1_UNCONNECTED,
      IRQ_P2F_DMAC2 => NLW_inst_IRQ_P2F_DMAC2_UNCONNECTED,
      IRQ_P2F_DMAC3 => NLW_inst_IRQ_P2F_DMAC3_UNCONNECTED,
      IRQ_P2F_DMAC4 => NLW_inst_IRQ_P2F_DMAC4_UNCONNECTED,
      IRQ_P2F_DMAC5 => NLW_inst_IRQ_P2F_DMAC5_UNCONNECTED,
      IRQ_P2F_DMAC6 => NLW_inst_IRQ_P2F_DMAC6_UNCONNECTED,
      IRQ_P2F_DMAC7 => NLW_inst_IRQ_P2F_DMAC7_UNCONNECTED,
      IRQ_P2F_DMAC_ABORT => NLW_inst_IRQ_P2F_DMAC_ABORT_UNCONNECTED,
      IRQ_P2F_ENET0 => NLW_inst_IRQ_P2F_ENET0_UNCONNECTED,
      IRQ_P2F_ENET1 => NLW_inst_IRQ_P2F_ENET1_UNCONNECTED,
      IRQ_P2F_ENET_WAKE0 => NLW_inst_IRQ_P2F_ENET_WAKE0_UNCONNECTED,
      IRQ_P2F_ENET_WAKE1 => NLW_inst_IRQ_P2F_ENET_WAKE1_UNCONNECTED,
      IRQ_P2F_GPIO => NLW_inst_IRQ_P2F_GPIO_UNCONNECTED,
      IRQ_P2F_I2C0 => NLW_inst_IRQ_P2F_I2C0_UNCONNECTED,
      IRQ_P2F_I2C1 => NLW_inst_IRQ_P2F_I2C1_UNCONNECTED,
      IRQ_P2F_QSPI => NLW_inst_IRQ_P2F_QSPI_UNCONNECTED,
      IRQ_P2F_SDIO0 => NLW_inst_IRQ_P2F_SDIO0_UNCONNECTED,
      IRQ_P2F_SDIO1 => NLW_inst_IRQ_P2F_SDIO1_UNCONNECTED,
      IRQ_P2F_SMC => NLW_inst_IRQ_P2F_SMC_UNCONNECTED,
      IRQ_P2F_SPI0 => NLW_inst_IRQ_P2F_SPI0_UNCONNECTED,
      IRQ_P2F_SPI1 => NLW_inst_IRQ_P2F_SPI1_UNCONNECTED,
      IRQ_P2F_UART0 => NLW_inst_IRQ_P2F_UART0_UNCONNECTED,
      IRQ_P2F_UART1 => NLW_inst_IRQ_P2F_UART1_UNCONNECTED,
      IRQ_P2F_USB0 => NLW_inst_IRQ_P2F_USB0_UNCONNECTED,
      IRQ_P2F_USB1 => NLW_inst_IRQ_P2F_USB1_UNCONNECTED,
      MIO(53 downto 0) => MIO(53 downto 0),
      M_AXI_GP0_ACLK => '0',
      M_AXI_GP0_ARADDR(31 downto 0) => M_AXI_GP0_ARADDR(31 downto 0),
      M_AXI_GP0_ARBURST(1 downto 0) => M_AXI_GP0_ARBURST(1 downto 0),
      M_AXI_GP0_ARCACHE(3 downto 0) => NLW_inst_M_AXI_GP0_ARCACHE_UNCONNECTED(3 downto 0),
      M_AXI_GP0_ARESETN => NLW_inst_M_AXI_GP0_ARESETN_UNCONNECTED,
      M_AXI_GP0_ARID(11 downto 0) => M_AXI_GP0_ARID(11 downto 0),
      M_AXI_GP0_ARLEN(3 downto 0) => M_AXI_GP0_ARLEN(3 downto 0),
      M_AXI_GP0_ARLOCK(1 downto 0) => NLW_inst_M_AXI_GP0_ARLOCK_UNCONNECTED(1 downto 0),
      M_AXI_GP0_ARPROT(2 downto 0) => M_AXI_GP0_ARPROT(2 downto 0),
      M_AXI_GP0_ARQOS(3 downto 0) => NLW_inst_M_AXI_GP0_ARQOS_UNCONNECTED(3 downto 0),
      M_AXI_GP0_ARREADY => M_AXI_GP0_ARREADY,
      M_AXI_GP0_ARSIZE(2) => NLW_inst_M_AXI_GP0_ARSIZE_UNCONNECTED(2),
      M_AXI_GP0_ARSIZE(1 downto 0) => \^m_axi_gp0_arsize\(1 downto 0),
      M_AXI_GP0_ARVALID => M_AXI_GP0_ARVALID,
      M_AXI_GP0_AWADDR(31 downto 0) => M_AXI_GP0_AWADDR(31 downto 0),
      M_AXI_GP0_AWBURST(1 downto 0) => M_AXI_GP0_AWBURST(1 downto 0),
      M_AXI_GP0_AWCACHE(3 downto 0) => NLW_inst_M_AXI_GP0_AWCACHE_UNCONNECTED(3 downto 0),
      M_AXI_GP0_AWID(11 downto 0) => M_AXI_GP0_AWID(11 downto 0),
      M_AXI_GP0_AWLEN(3 downto 0) => M_AXI_GP0_AWLEN(3 downto 0),
      M_AXI_GP0_AWLOCK(1 downto 0) => NLW_inst_M_AXI_GP0_AWLOCK_UNCONNECTED(1 downto 0),
      M_AXI_GP0_AWPROT(2 downto 0) => M_AXI_GP0_AWPROT(2 downto 0),
      M_AXI_GP0_AWQOS(3 downto 0) => NLW_inst_M_AXI_GP0_AWQOS_UNCONNECTED(3 downto 0),
      M_AXI_GP0_AWREADY => M_AXI_GP0_AWREADY,
      M_AXI_GP0_AWSIZE(2) => NLW_inst_M_AXI_GP0_AWSIZE_UNCONNECTED(2),
      M_AXI_GP0_AWSIZE(1 downto 0) => \^m_axi_gp0_awsize\(1 downto 0),
      M_AXI_GP0_AWVALID => M_AXI_GP0_AWVALID,
      M_AXI_GP0_BID(11 downto 0) => M_AXI_GP0_BID(11 downto 0),
      M_AXI_GP0_BREADY => M_AXI_GP0_BREADY,
      M_AXI_GP0_BRESP(1 downto 0) => M_AXI_GP0_BRESP(1 downto 0),
      M_AXI_GP0_BVALID => M_AXI_GP0_BVALID,
      M_AXI_GP0_RDATA(31 downto 0) => M_AXI_GP0_RDATA(31 downto 0),
      M_AXI_GP0_RID(11 downto 0) => M_AXI_GP0_RID(11 downto 0),
      M_AXI_GP0_RLAST => M_AXI_GP0_RLAST,
      M_AXI_GP0_RREADY => M_AXI_GP0_RREADY,
      M_AXI_GP0_RRESP(1 downto 0) => M_AXI_GP0_RRESP(1 downto 0),
      M_AXI_GP0_RVALID => M_AXI_GP0_RVALID,
      M_AXI_GP0_WDATA(31 downto 0) => M_AXI_GP0_WDATA(31 downto 0),
      M_AXI_GP0_WID(11 downto 0) => NLW_inst_M_AXI_GP0_WID_UNCONNECTED(11 downto 0),
      M_AXI_GP0_WLAST => NLW_inst_M_AXI_GP0_WLAST_UNCONNECTED,
      M_AXI_GP0_WREADY => M_AXI_GP0_WREADY,
      M_AXI_GP0_WSTRB(3 downto 0) => M_AXI_GP0_WSTRB(3 downto 0),
      M_AXI_GP0_WVALID => M_AXI_GP0_WVALID,
      M_AXI_GP1_ACLK => '0',
      M_AXI_GP1_ARADDR(31 downto 0) => NLW_inst_M_AXI_GP1_ARADDR_UNCONNECTED(31 downto 0),
      M_AXI_GP1_ARBURST(1 downto 0) => NLW_inst_M_AXI_GP1_ARBURST_UNCONNECTED(1 downto 0),
      M_AXI_GP1_ARCACHE(3 downto 0) => NLW_inst_M_AXI_GP1_ARCACHE_UNCONNECTED(3 downto 0),
      M_AXI_GP1_ARESETN => NLW_inst_M_AXI_GP1_ARESETN_UNCONNECTED,
      M_AXI_GP1_ARID(11 downto 0) => NLW_inst_M_AXI_GP1_ARID_UNCONNECTED(11 downto 0),
      M_AXI_GP1_ARLEN(3 downto 0) => NLW_inst_M_AXI_GP1_ARLEN_UNCONNECTED(3 downto 0),
      M_AXI_GP1_ARLOCK(1 downto 0) => NLW_inst_M_AXI_GP1_ARLOCK_UNCONNECTED(1 downto 0),
      M_AXI_GP1_ARPROT(2 downto 0) => NLW_inst_M_AXI_GP1_ARPROT_UNCONNECTED(2 downto 0),
      M_AXI_GP1_ARQOS(3 downto 0) => NLW_inst_M_AXI_GP1_ARQOS_UNCONNECTED(3 downto 0),
      M_AXI_GP1_ARREADY => '0',
      M_AXI_GP1_ARSIZE(2 downto 0) => NLW_inst_M_AXI_GP1_ARSIZE_UNCONNECTED(2 downto 0),
      M_AXI_GP1_ARVALID => NLW_inst_M_AXI_GP1_ARVALID_UNCONNECTED,
      M_AXI_GP1_AWADDR(31 downto 0) => NLW_inst_M_AXI_GP1_AWADDR_UNCONNECTED(31 downto 0),
      M_AXI_GP1_AWBURST(1 downto 0) => NLW_inst_M_AXI_GP1_AWBURST_UNCONNECTED(1 downto 0),
      M_AXI_GP1_AWCACHE(3 downto 0) => NLW_inst_M_AXI_GP1_AWCACHE_UNCONNECTED(3 downto 0),
      M_AXI_GP1_AWID(11 downto 0) => NLW_inst_M_AXI_GP1_AWID_UNCONNECTED(11 downto 0),
      M_AXI_GP1_AWLEN(3 downto 0) => NLW_inst_M_AXI_GP1_AWLEN_UNCONNECTED(3 downto 0),
      M_AXI_GP1_AWLOCK(1 downto 0) => NLW_inst_M_AXI_GP1_AWLOCK_UNCONNECTED(1 downto 0),
      M_AXI_GP1_AWPROT(2 downto 0) => NLW_inst_M_AXI_GP1_AWPROT_UNCONNECTED(2 downto 0),
      M_AXI_GP1_AWQOS(3 downto 0) => NLW_inst_M_AXI_GP1_AWQOS_UNCONNECTED(3 downto 0),
      M_AXI_GP1_AWREADY => '0',
      M_AXI_GP1_AWSIZE(2 downto 0) => NLW_inst_M_AXI_GP1_AWSIZE_UNCONNECTED(2 downto 0),
      M_AXI_GP1_AWVALID => NLW_inst_M_AXI_GP1_AWVALID_UNCONNECTED,
      M_AXI_GP1_BID(11 downto 0) => B"000000000000",
      M_AXI_GP1_BREADY => NLW_inst_M_AXI_GP1_BREADY_UNCONNECTED,
      M_AXI_GP1_BRESP(1 downto 0) => B"00",
      M_AXI_GP1_BVALID => '0',
      M_AXI_GP1_RDATA(31 downto 0) => B"00000000000000000000000000000000",
      M_AXI_GP1_RID(11 downto 0) => B"000000000000",
      M_AXI_GP1_RLAST => '0',
      M_AXI_GP1_RREADY => NLW_inst_M_AXI_GP1_RREADY_UNCONNECTED,
      M_AXI_GP1_RRESP(1 downto 0) => B"00",
      M_AXI_GP1_RVALID => '0',
      M_AXI_GP1_WDATA(31 downto 0) => NLW_inst_M_AXI_GP1_WDATA_UNCONNECTED(31 downto 0),
      M_AXI_GP1_WID(11 downto 0) => NLW_inst_M_AXI_GP1_WID_UNCONNECTED(11 downto 0),
      M_AXI_GP1_WLAST => NLW_inst_M_AXI_GP1_WLAST_UNCONNECTED,
      M_AXI_GP1_WREADY => '0',
      M_AXI_GP1_WSTRB(3 downto 0) => NLW_inst_M_AXI_GP1_WSTRB_UNCONNECTED(3 downto 0),
      M_AXI_GP1_WVALID => NLW_inst_M_AXI_GP1_WVALID_UNCONNECTED,
      PJTAG_TCK => '0',
      PJTAG_TDI => '0',
      PJTAG_TDO => NLW_inst_PJTAG_TDO_UNCONNECTED,
      PJTAG_TMS => '0',
      PS_CLK => PS_CLK,
      PS_PORB => PS_PORB,
      PS_SRSTB => PS_SRSTB,
      SDIO0_BUSPOW => NLW_inst_SDIO0_BUSPOW_UNCONNECTED,
      SDIO0_BUSVOLT(2 downto 0) => NLW_inst_SDIO0_BUSVOLT_UNCONNECTED(2 downto 0),
      SDIO0_CDN => '0',
      SDIO0_CLK => NLW_inst_SDIO0_CLK_UNCONNECTED,
      SDIO0_CLK_FB => '0',
      SDIO0_CMD_I => '0',
      SDIO0_CMD_O => NLW_inst_SDIO0_CMD_O_UNCONNECTED,
      SDIO0_CMD_T => NLW_inst_SDIO0_CMD_T_UNCONNECTED,
      SDIO0_DATA_I(3 downto 0) => B"0000",
      SDIO0_DATA_O(3 downto 0) => NLW_inst_SDIO0_DATA_O_UNCONNECTED(3 downto 0),
      SDIO0_DATA_T(3 downto 0) => NLW_inst_SDIO0_DATA_T_UNCONNECTED(3 downto 0),
      SDIO0_LED => NLW_inst_SDIO0_LED_UNCONNECTED,
      SDIO0_WP => '0',
      SDIO1_BUSPOW => NLW_inst_SDIO1_BUSPOW_UNCONNECTED,
      SDIO1_BUSVOLT(2 downto 0) => NLW_inst_SDIO1_BUSVOLT_UNCONNECTED(2 downto 0),
      SDIO1_CDN => '0',
      SDIO1_CLK => NLW_inst_SDIO1_CLK_UNCONNECTED,
      SDIO1_CLK_FB => '0',
      SDIO1_CMD_I => '0',
      SDIO1_CMD_O => NLW_inst_SDIO1_CMD_O_UNCONNECTED,
      SDIO1_CMD_T => NLW_inst_SDIO1_CMD_T_UNCONNECTED,
      SDIO1_DATA_I(3 downto 0) => B"0000",
      SDIO1_DATA_O(3 downto 0) => NLW_inst_SDIO1_DATA_O_UNCONNECTED(3 downto 0),
      SDIO1_DATA_T(3 downto 0) => NLW_inst_SDIO1_DATA_T_UNCONNECTED(3 downto 0),
      SDIO1_LED => NLW_inst_SDIO1_LED_UNCONNECTED,
      SDIO1_WP => '0',
      SPI0_MISO_I => '0',
      SPI0_MISO_O => NLW_inst_SPI0_MISO_O_UNCONNECTED,
      SPI0_MISO_T => NLW_inst_SPI0_MISO_T_UNCONNECTED,
      SPI0_MOSI_I => '0',
      SPI0_MOSI_O => NLW_inst_SPI0_MOSI_O_UNCONNECTED,
      SPI0_MOSI_T => NLW_inst_SPI0_MOSI_T_UNCONNECTED,
      SPI0_SCLK_I => '0',
      SPI0_SCLK_O => NLW_inst_SPI0_SCLK_O_UNCONNECTED,
      SPI0_SCLK_T => NLW_inst_SPI0_SCLK_T_UNCONNECTED,
      SPI0_SS1_O => NLW_inst_SPI0_SS1_O_UNCONNECTED,
      SPI0_SS2_O => NLW_inst_SPI0_SS2_O_UNCONNECTED,
      SPI0_SS_I => '0',
      SPI0_SS_O => NLW_inst_SPI0_SS_O_UNCONNECTED,
      SPI0_SS_T => NLW_inst_SPI0_SS_T_UNCONNECTED,
      SPI1_MISO_I => '0',
      SPI1_MISO_O => NLW_inst_SPI1_MISO_O_UNCONNECTED,
      SPI1_MISO_T => NLW_inst_SPI1_MISO_T_UNCONNECTED,
      SPI1_MOSI_I => '0',
      SPI1_MOSI_O => NLW_inst_SPI1_MOSI_O_UNCONNECTED,
      SPI1_MOSI_T => NLW_inst_SPI1_MOSI_T_UNCONNECTED,
      SPI1_SCLK_I => '0',
      SPI1_SCLK_O => NLW_inst_SPI1_SCLK_O_UNCONNECTED,
      SPI1_SCLK_T => NLW_inst_SPI1_SCLK_T_UNCONNECTED,
      SPI1_SS1_O => NLW_inst_SPI1_SS1_O_UNCONNECTED,
      SPI1_SS2_O => NLW_inst_SPI1_SS2_O_UNCONNECTED,
      SPI1_SS_I => '0',
      SPI1_SS_O => NLW_inst_SPI1_SS_O_UNCONNECTED,
      SPI1_SS_T => NLW_inst_SPI1_SS_T_UNCONNECTED,
      SRAM_INTIN => '0',
      S_AXI_ACP_ACLK => '0',
      S_AXI_ACP_ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_ACP_ARBURST(1 downto 0) => B"00",
      S_AXI_ACP_ARCACHE(3 downto 0) => B"0000",
      S_AXI_ACP_ARESETN => NLW_inst_S_AXI_ACP_ARESETN_UNCONNECTED,
      S_AXI_ACP_ARID(2 downto 0) => B"000",
      S_AXI_ACP_ARLEN(3 downto 0) => B"0000",
      S_AXI_ACP_ARLOCK(1 downto 0) => B"00",
      S_AXI_ACP_ARPROT(2 downto 0) => B"000",
      S_AXI_ACP_ARQOS(3 downto 0) => B"0000",
      S_AXI_ACP_ARREADY => NLW_inst_S_AXI_ACP_ARREADY_UNCONNECTED,
      S_AXI_ACP_ARSIZE(2 downto 0) => B"000",
      S_AXI_ACP_ARUSER(4 downto 0) => B"00000",
      S_AXI_ACP_ARVALID => '0',
      S_AXI_ACP_AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_ACP_AWBURST(1 downto 0) => B"00",
      S_AXI_ACP_AWCACHE(3 downto 0) => B"0000",
      S_AXI_ACP_AWID(2 downto 0) => B"000",
      S_AXI_ACP_AWLEN(3 downto 0) => B"0000",
      S_AXI_ACP_AWLOCK(1 downto 0) => B"00",
      S_AXI_ACP_AWPROT(2 downto 0) => B"000",
      S_AXI_ACP_AWQOS(3 downto 0) => B"0000",
      S_AXI_ACP_AWREADY => NLW_inst_S_AXI_ACP_AWREADY_UNCONNECTED,
      S_AXI_ACP_AWSIZE(2 downto 0) => B"000",
      S_AXI_ACP_AWUSER(4 downto 0) => B"00000",
      S_AXI_ACP_AWVALID => '0',
      S_AXI_ACP_BID(2 downto 0) => NLW_inst_S_AXI_ACP_BID_UNCONNECTED(2 downto 0),
      S_AXI_ACP_BREADY => '0',
      S_AXI_ACP_BRESP(1 downto 0) => NLW_inst_S_AXI_ACP_BRESP_UNCONNECTED(1 downto 0),
      S_AXI_ACP_BVALID => NLW_inst_S_AXI_ACP_BVALID_UNCONNECTED,
      S_AXI_ACP_RDATA(63 downto 0) => NLW_inst_S_AXI_ACP_RDATA_UNCONNECTED(63 downto 0),
      S_AXI_ACP_RID(2 downto 0) => NLW_inst_S_AXI_ACP_RID_UNCONNECTED(2 downto 0),
      S_AXI_ACP_RLAST => NLW_inst_S_AXI_ACP_RLAST_UNCONNECTED,
      S_AXI_ACP_RREADY => '0',
      S_AXI_ACP_RRESP(1 downto 0) => NLW_inst_S_AXI_ACP_RRESP_UNCONNECTED(1 downto 0),
      S_AXI_ACP_RVALID => NLW_inst_S_AXI_ACP_RVALID_UNCONNECTED,
      S_AXI_ACP_WDATA(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      S_AXI_ACP_WID(2 downto 0) => B"000",
      S_AXI_ACP_WLAST => '0',
      S_AXI_ACP_WREADY => NLW_inst_S_AXI_ACP_WREADY_UNCONNECTED,
      S_AXI_ACP_WSTRB(7 downto 0) => B"00000000",
      S_AXI_ACP_WVALID => '0',
      S_AXI_GP0_ACLK => '0',
      S_AXI_GP0_ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_GP0_ARBURST(1 downto 0) => B"00",
      S_AXI_GP0_ARCACHE(3 downto 0) => B"0000",
      S_AXI_GP0_ARESETN => NLW_inst_S_AXI_GP0_ARESETN_UNCONNECTED,
      S_AXI_GP0_ARID(5 downto 0) => B"000000",
      S_AXI_GP0_ARLEN(3 downto 0) => B"0000",
      S_AXI_GP0_ARLOCK(1 downto 0) => B"00",
      S_AXI_GP0_ARPROT(2 downto 0) => B"000",
      S_AXI_GP0_ARQOS(3 downto 0) => B"0000",
      S_AXI_GP0_ARREADY => NLW_inst_S_AXI_GP0_ARREADY_UNCONNECTED,
      S_AXI_GP0_ARSIZE(2 downto 0) => B"000",
      S_AXI_GP0_ARVALID => '0',
      S_AXI_GP0_AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_GP0_AWBURST(1 downto 0) => B"00",
      S_AXI_GP0_AWCACHE(3 downto 0) => B"0000",
      S_AXI_GP0_AWID(5 downto 0) => B"000000",
      S_AXI_GP0_AWLEN(3 downto 0) => B"0000",
      S_AXI_GP0_AWLOCK(1 downto 0) => B"00",
      S_AXI_GP0_AWPROT(2 downto 0) => B"000",
      S_AXI_GP0_AWQOS(3 downto 0) => B"0000",
      S_AXI_GP0_AWREADY => NLW_inst_S_AXI_GP0_AWREADY_UNCONNECTED,
      S_AXI_GP0_AWSIZE(2 downto 0) => B"000",
      S_AXI_GP0_AWVALID => '0',
      S_AXI_GP0_BID(5 downto 0) => NLW_inst_S_AXI_GP0_BID_UNCONNECTED(5 downto 0),
      S_AXI_GP0_BREADY => '0',
      S_AXI_GP0_BRESP(1 downto 0) => NLW_inst_S_AXI_GP0_BRESP_UNCONNECTED(1 downto 0),
      S_AXI_GP0_BVALID => NLW_inst_S_AXI_GP0_BVALID_UNCONNECTED,
      S_AXI_GP0_RDATA(31 downto 0) => NLW_inst_S_AXI_GP0_RDATA_UNCONNECTED(31 downto 0),
      S_AXI_GP0_RID(5 downto 0) => NLW_inst_S_AXI_GP0_RID_UNCONNECTED(5 downto 0),
      S_AXI_GP0_RLAST => NLW_inst_S_AXI_GP0_RLAST_UNCONNECTED,
      S_AXI_GP0_RREADY => '0',
      S_AXI_GP0_RRESP(1 downto 0) => NLW_inst_S_AXI_GP0_RRESP_UNCONNECTED(1 downto 0),
      S_AXI_GP0_RVALID => NLW_inst_S_AXI_GP0_RVALID_UNCONNECTED,
      S_AXI_GP0_WDATA(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_GP0_WID(5 downto 0) => B"000000",
      S_AXI_GP0_WLAST => '0',
      S_AXI_GP0_WREADY => NLW_inst_S_AXI_GP0_WREADY_UNCONNECTED,
      S_AXI_GP0_WSTRB(3 downto 0) => B"0000",
      S_AXI_GP0_WVALID => '0',
      S_AXI_GP1_ACLK => '0',
      S_AXI_GP1_ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_GP1_ARBURST(1 downto 0) => B"00",
      S_AXI_GP1_ARCACHE(3 downto 0) => B"0000",
      S_AXI_GP1_ARESETN => NLW_inst_S_AXI_GP1_ARESETN_UNCONNECTED,
      S_AXI_GP1_ARID(5 downto 0) => B"000000",
      S_AXI_GP1_ARLEN(3 downto 0) => B"0000",
      S_AXI_GP1_ARLOCK(1 downto 0) => B"00",
      S_AXI_GP1_ARPROT(2 downto 0) => B"000",
      S_AXI_GP1_ARQOS(3 downto 0) => B"0000",
      S_AXI_GP1_ARREADY => NLW_inst_S_AXI_GP1_ARREADY_UNCONNECTED,
      S_AXI_GP1_ARSIZE(2 downto 0) => B"000",
      S_AXI_GP1_ARVALID => '0',
      S_AXI_GP1_AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_GP1_AWBURST(1 downto 0) => B"00",
      S_AXI_GP1_AWCACHE(3 downto 0) => B"0000",
      S_AXI_GP1_AWID(5 downto 0) => B"000000",
      S_AXI_GP1_AWLEN(3 downto 0) => B"0000",
      S_AXI_GP1_AWLOCK(1 downto 0) => B"00",
      S_AXI_GP1_AWPROT(2 downto 0) => B"000",
      S_AXI_GP1_AWQOS(3 downto 0) => B"0000",
      S_AXI_GP1_AWREADY => NLW_inst_S_AXI_GP1_AWREADY_UNCONNECTED,
      S_AXI_GP1_AWSIZE(2 downto 0) => B"000",
      S_AXI_GP1_AWVALID => '0',
      S_AXI_GP1_BID(5 downto 0) => NLW_inst_S_AXI_GP1_BID_UNCONNECTED(5 downto 0),
      S_AXI_GP1_BREADY => '0',
      S_AXI_GP1_BRESP(1 downto 0) => NLW_inst_S_AXI_GP1_BRESP_UNCONNECTED(1 downto 0),
      S_AXI_GP1_BVALID => NLW_inst_S_AXI_GP1_BVALID_UNCONNECTED,
      S_AXI_GP1_RDATA(31 downto 0) => NLW_inst_S_AXI_GP1_RDATA_UNCONNECTED(31 downto 0),
      S_AXI_GP1_RID(5 downto 0) => NLW_inst_S_AXI_GP1_RID_UNCONNECTED(5 downto 0),
      S_AXI_GP1_RLAST => NLW_inst_S_AXI_GP1_RLAST_UNCONNECTED,
      S_AXI_GP1_RREADY => '0',
      S_AXI_GP1_RRESP(1 downto 0) => NLW_inst_S_AXI_GP1_RRESP_UNCONNECTED(1 downto 0),
      S_AXI_GP1_RVALID => NLW_inst_S_AXI_GP1_RVALID_UNCONNECTED,
      S_AXI_GP1_WDATA(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_GP1_WID(5 downto 0) => B"000000",
      S_AXI_GP1_WLAST => '0',
      S_AXI_GP1_WREADY => NLW_inst_S_AXI_GP1_WREADY_UNCONNECTED,
      S_AXI_GP1_WSTRB(3 downto 0) => B"0000",
      S_AXI_GP1_WVALID => '0',
      S_AXI_HP0_ACLK => '0',
      S_AXI_HP0_ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_HP0_ARBURST(1 downto 0) => B"00",
      S_AXI_HP0_ARCACHE(3 downto 0) => B"0000",
      S_AXI_HP0_ARESETN => NLW_inst_S_AXI_HP0_ARESETN_UNCONNECTED,
      S_AXI_HP0_ARID(5 downto 0) => B"000000",
      S_AXI_HP0_ARLEN(3 downto 0) => B"0000",
      S_AXI_HP0_ARLOCK(1 downto 0) => B"00",
      S_AXI_HP0_ARPROT(2 downto 0) => B"000",
      S_AXI_HP0_ARQOS(3 downto 0) => B"0000",
      S_AXI_HP0_ARREADY => NLW_inst_S_AXI_HP0_ARREADY_UNCONNECTED,
      S_AXI_HP0_ARSIZE(2 downto 0) => B"000",
      S_AXI_HP0_ARVALID => '0',
      S_AXI_HP0_AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_HP0_AWBURST(1 downto 0) => B"00",
      S_AXI_HP0_AWCACHE(3 downto 0) => B"0000",
      S_AXI_HP0_AWID(5 downto 0) => B"000000",
      S_AXI_HP0_AWLEN(3 downto 0) => B"0000",
      S_AXI_HP0_AWLOCK(1 downto 0) => B"00",
      S_AXI_HP0_AWPROT(2 downto 0) => B"000",
      S_AXI_HP0_AWQOS(3 downto 0) => B"0000",
      S_AXI_HP0_AWREADY => NLW_inst_S_AXI_HP0_AWREADY_UNCONNECTED,
      S_AXI_HP0_AWSIZE(2 downto 0) => B"000",
      S_AXI_HP0_AWVALID => '0',
      S_AXI_HP0_BID(5 downto 0) => NLW_inst_S_AXI_HP0_BID_UNCONNECTED(5 downto 0),
      S_AXI_HP0_BREADY => '0',
      S_AXI_HP0_BRESP(1 downto 0) => NLW_inst_S_AXI_HP0_BRESP_UNCONNECTED(1 downto 0),
      S_AXI_HP0_BVALID => NLW_inst_S_AXI_HP0_BVALID_UNCONNECTED,
      S_AXI_HP0_RACOUNT(2 downto 0) => NLW_inst_S_AXI_HP0_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP0_RCOUNT(7 downto 0) => NLW_inst_S_AXI_HP0_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_RDATA(63 downto 0) => NLW_inst_S_AXI_HP0_RDATA_UNCONNECTED(63 downto 0),
      S_AXI_HP0_RDISSUECAP1_EN => '0',
      S_AXI_HP0_RID(5 downto 0) => NLW_inst_S_AXI_HP0_RID_UNCONNECTED(5 downto 0),
      S_AXI_HP0_RLAST => NLW_inst_S_AXI_HP0_RLAST_UNCONNECTED,
      S_AXI_HP0_RREADY => '0',
      S_AXI_HP0_RRESP(1 downto 0) => NLW_inst_S_AXI_HP0_RRESP_UNCONNECTED(1 downto 0),
      S_AXI_HP0_RVALID => NLW_inst_S_AXI_HP0_RVALID_UNCONNECTED,
      S_AXI_HP0_WACOUNT(5 downto 0) => NLW_inst_S_AXI_HP0_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP0_WCOUNT(7 downto 0) => NLW_inst_S_AXI_HP0_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_WDATA(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      S_AXI_HP0_WID(5 downto 0) => B"000000",
      S_AXI_HP0_WLAST => '0',
      S_AXI_HP0_WREADY => NLW_inst_S_AXI_HP0_WREADY_UNCONNECTED,
      S_AXI_HP0_WRISSUECAP1_EN => '0',
      S_AXI_HP0_WSTRB(7 downto 0) => B"00000000",
      S_AXI_HP0_WVALID => '0',
      S_AXI_HP1_ACLK => '0',
      S_AXI_HP1_ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_HP1_ARBURST(1 downto 0) => B"00",
      S_AXI_HP1_ARCACHE(3 downto 0) => B"0000",
      S_AXI_HP1_ARESETN => NLW_inst_S_AXI_HP1_ARESETN_UNCONNECTED,
      S_AXI_HP1_ARID(5 downto 0) => B"000000",
      S_AXI_HP1_ARLEN(3 downto 0) => B"0000",
      S_AXI_HP1_ARLOCK(1 downto 0) => B"00",
      S_AXI_HP1_ARPROT(2 downto 0) => B"000",
      S_AXI_HP1_ARQOS(3 downto 0) => B"0000",
      S_AXI_HP1_ARREADY => NLW_inst_S_AXI_HP1_ARREADY_UNCONNECTED,
      S_AXI_HP1_ARSIZE(2 downto 0) => B"000",
      S_AXI_HP1_ARVALID => '0',
      S_AXI_HP1_AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_HP1_AWBURST(1 downto 0) => B"00",
      S_AXI_HP1_AWCACHE(3 downto 0) => B"0000",
      S_AXI_HP1_AWID(5 downto 0) => B"000000",
      S_AXI_HP1_AWLEN(3 downto 0) => B"0000",
      S_AXI_HP1_AWLOCK(1 downto 0) => B"00",
      S_AXI_HP1_AWPROT(2 downto 0) => B"000",
      S_AXI_HP1_AWQOS(3 downto 0) => B"0000",
      S_AXI_HP1_AWREADY => NLW_inst_S_AXI_HP1_AWREADY_UNCONNECTED,
      S_AXI_HP1_AWSIZE(2 downto 0) => B"000",
      S_AXI_HP1_AWVALID => '0',
      S_AXI_HP1_BID(5 downto 0) => NLW_inst_S_AXI_HP1_BID_UNCONNECTED(5 downto 0),
      S_AXI_HP1_BREADY => '0',
      S_AXI_HP1_BRESP(1 downto 0) => NLW_inst_S_AXI_HP1_BRESP_UNCONNECTED(1 downto 0),
      S_AXI_HP1_BVALID => NLW_inst_S_AXI_HP1_BVALID_UNCONNECTED,
      S_AXI_HP1_RACOUNT(2 downto 0) => NLW_inst_S_AXI_HP1_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP1_RCOUNT(7 downto 0) => NLW_inst_S_AXI_HP1_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP1_RDATA(63 downto 0) => NLW_inst_S_AXI_HP1_RDATA_UNCONNECTED(63 downto 0),
      S_AXI_HP1_RDISSUECAP1_EN => '0',
      S_AXI_HP1_RID(5 downto 0) => NLW_inst_S_AXI_HP1_RID_UNCONNECTED(5 downto 0),
      S_AXI_HP1_RLAST => NLW_inst_S_AXI_HP1_RLAST_UNCONNECTED,
      S_AXI_HP1_RREADY => '0',
      S_AXI_HP1_RRESP(1 downto 0) => NLW_inst_S_AXI_HP1_RRESP_UNCONNECTED(1 downto 0),
      S_AXI_HP1_RVALID => NLW_inst_S_AXI_HP1_RVALID_UNCONNECTED,
      S_AXI_HP1_WACOUNT(5 downto 0) => NLW_inst_S_AXI_HP1_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP1_WCOUNT(7 downto 0) => NLW_inst_S_AXI_HP1_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP1_WDATA(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      S_AXI_HP1_WID(5 downto 0) => B"000000",
      S_AXI_HP1_WLAST => '0',
      S_AXI_HP1_WREADY => NLW_inst_S_AXI_HP1_WREADY_UNCONNECTED,
      S_AXI_HP1_WRISSUECAP1_EN => '0',
      S_AXI_HP1_WSTRB(7 downto 0) => B"00000000",
      S_AXI_HP1_WVALID => '0',
      S_AXI_HP2_ACLK => '0',
      S_AXI_HP2_ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_HP2_ARBURST(1 downto 0) => B"00",
      S_AXI_HP2_ARCACHE(3 downto 0) => B"0000",
      S_AXI_HP2_ARESETN => NLW_inst_S_AXI_HP2_ARESETN_UNCONNECTED,
      S_AXI_HP2_ARID(5 downto 0) => B"000000",
      S_AXI_HP2_ARLEN(3 downto 0) => B"0000",
      S_AXI_HP2_ARLOCK(1 downto 0) => B"00",
      S_AXI_HP2_ARPROT(2 downto 0) => B"000",
      S_AXI_HP2_ARQOS(3 downto 0) => B"0000",
      S_AXI_HP2_ARREADY => NLW_inst_S_AXI_HP2_ARREADY_UNCONNECTED,
      S_AXI_HP2_ARSIZE(2 downto 0) => B"000",
      S_AXI_HP2_ARVALID => '0',
      S_AXI_HP2_AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_HP2_AWBURST(1 downto 0) => B"00",
      S_AXI_HP2_AWCACHE(3 downto 0) => B"0000",
      S_AXI_HP2_AWID(5 downto 0) => B"000000",
      S_AXI_HP2_AWLEN(3 downto 0) => B"0000",
      S_AXI_HP2_AWLOCK(1 downto 0) => B"00",
      S_AXI_HP2_AWPROT(2 downto 0) => B"000",
      S_AXI_HP2_AWQOS(3 downto 0) => B"0000",
      S_AXI_HP2_AWREADY => NLW_inst_S_AXI_HP2_AWREADY_UNCONNECTED,
      S_AXI_HP2_AWSIZE(2 downto 0) => B"000",
      S_AXI_HP2_AWVALID => '0',
      S_AXI_HP2_BID(5 downto 0) => NLW_inst_S_AXI_HP2_BID_UNCONNECTED(5 downto 0),
      S_AXI_HP2_BREADY => '0',
      S_AXI_HP2_BRESP(1 downto 0) => NLW_inst_S_AXI_HP2_BRESP_UNCONNECTED(1 downto 0),
      S_AXI_HP2_BVALID => NLW_inst_S_AXI_HP2_BVALID_UNCONNECTED,
      S_AXI_HP2_RACOUNT(2 downto 0) => NLW_inst_S_AXI_HP2_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP2_RCOUNT(7 downto 0) => NLW_inst_S_AXI_HP2_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP2_RDATA(63 downto 0) => NLW_inst_S_AXI_HP2_RDATA_UNCONNECTED(63 downto 0),
      S_AXI_HP2_RDISSUECAP1_EN => '0',
      S_AXI_HP2_RID(5 downto 0) => NLW_inst_S_AXI_HP2_RID_UNCONNECTED(5 downto 0),
      S_AXI_HP2_RLAST => NLW_inst_S_AXI_HP2_RLAST_UNCONNECTED,
      S_AXI_HP2_RREADY => '0',
      S_AXI_HP2_RRESP(1 downto 0) => NLW_inst_S_AXI_HP2_RRESP_UNCONNECTED(1 downto 0),
      S_AXI_HP2_RVALID => NLW_inst_S_AXI_HP2_RVALID_UNCONNECTED,
      S_AXI_HP2_WACOUNT(5 downto 0) => NLW_inst_S_AXI_HP2_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP2_WCOUNT(7 downto 0) => NLW_inst_S_AXI_HP2_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP2_WDATA(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      S_AXI_HP2_WID(5 downto 0) => B"000000",
      S_AXI_HP2_WLAST => '0',
      S_AXI_HP2_WREADY => NLW_inst_S_AXI_HP2_WREADY_UNCONNECTED,
      S_AXI_HP2_WRISSUECAP1_EN => '0',
      S_AXI_HP2_WSTRB(7 downto 0) => B"00000000",
      S_AXI_HP2_WVALID => '0',
      S_AXI_HP3_ACLK => '0',
      S_AXI_HP3_ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_HP3_ARBURST(1 downto 0) => B"00",
      S_AXI_HP3_ARCACHE(3 downto 0) => B"0000",
      S_AXI_HP3_ARESETN => NLW_inst_S_AXI_HP3_ARESETN_UNCONNECTED,
      S_AXI_HP3_ARID(5 downto 0) => B"000000",
      S_AXI_HP3_ARLEN(3 downto 0) => B"0000",
      S_AXI_HP3_ARLOCK(1 downto 0) => B"00",
      S_AXI_HP3_ARPROT(2 downto 0) => B"000",
      S_AXI_HP3_ARQOS(3 downto 0) => B"0000",
      S_AXI_HP3_ARREADY => NLW_inst_S_AXI_HP3_ARREADY_UNCONNECTED,
      S_AXI_HP3_ARSIZE(2 downto 0) => B"000",
      S_AXI_HP3_ARVALID => '0',
      S_AXI_HP3_AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_HP3_AWBURST(1 downto 0) => B"00",
      S_AXI_HP3_AWCACHE(3 downto 0) => B"0000",
      S_AXI_HP3_AWID(5 downto 0) => B"000000",
      S_AXI_HP3_AWLEN(3 downto 0) => B"0000",
      S_AXI_HP3_AWLOCK(1 downto 0) => B"00",
      S_AXI_HP3_AWPROT(2 downto 0) => B"000",
      S_AXI_HP3_AWQOS(3 downto 0) => B"0000",
      S_AXI_HP3_AWREADY => NLW_inst_S_AXI_HP3_AWREADY_UNCONNECTED,
      S_AXI_HP3_AWSIZE(2 downto 0) => B"000",
      S_AXI_HP3_AWVALID => '0',
      S_AXI_HP3_BID(5 downto 0) => NLW_inst_S_AXI_HP3_BID_UNCONNECTED(5 downto 0),
      S_AXI_HP3_BREADY => '0',
      S_AXI_HP3_BRESP(1 downto 0) => NLW_inst_S_AXI_HP3_BRESP_UNCONNECTED(1 downto 0),
      S_AXI_HP3_BVALID => NLW_inst_S_AXI_HP3_BVALID_UNCONNECTED,
      S_AXI_HP3_RACOUNT(2 downto 0) => NLW_inst_S_AXI_HP3_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP3_RCOUNT(7 downto 0) => NLW_inst_S_AXI_HP3_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP3_RDATA(63 downto 0) => NLW_inst_S_AXI_HP3_RDATA_UNCONNECTED(63 downto 0),
      S_AXI_HP3_RDISSUECAP1_EN => '0',
      S_AXI_HP3_RID(5 downto 0) => NLW_inst_S_AXI_HP3_RID_UNCONNECTED(5 downto 0),
      S_AXI_HP3_RLAST => NLW_inst_S_AXI_HP3_RLAST_UNCONNECTED,
      S_AXI_HP3_RREADY => '0',
      S_AXI_HP3_RRESP(1 downto 0) => NLW_inst_S_AXI_HP3_RRESP_UNCONNECTED(1 downto 0),
      S_AXI_HP3_RVALID => NLW_inst_S_AXI_HP3_RVALID_UNCONNECTED,
      S_AXI_HP3_WACOUNT(5 downto 0) => NLW_inst_S_AXI_HP3_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP3_WCOUNT(7 downto 0) => NLW_inst_S_AXI_HP3_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP3_WDATA(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      S_AXI_HP3_WID(5 downto 0) => B"000000",
      S_AXI_HP3_WLAST => '0',
      S_AXI_HP3_WREADY => NLW_inst_S_AXI_HP3_WREADY_UNCONNECTED,
      S_AXI_HP3_WRISSUECAP1_EN => '0',
      S_AXI_HP3_WSTRB(7 downto 0) => B"00000000",
      S_AXI_HP3_WVALID => '0',
      TRACE_CLK => '0',
      TRACE_CLK_OUT => NLW_inst_TRACE_CLK_OUT_UNCONNECTED,
      TRACE_CTL => NLW_inst_TRACE_CTL_UNCONNECTED,
      TRACE_DATA(1 downto 0) => NLW_inst_TRACE_DATA_UNCONNECTED(1 downto 0),
      TTC0_CLK0_IN => '0',
      TTC0_CLK1_IN => '0',
      TTC0_CLK2_IN => '0',
      TTC0_WAVE0_OUT => NLW_inst_TTC0_WAVE0_OUT_UNCONNECTED,
      TTC0_WAVE1_OUT => NLW_inst_TTC0_WAVE1_OUT_UNCONNECTED,
      TTC0_WAVE2_OUT => NLW_inst_TTC0_WAVE2_OUT_UNCONNECTED,
      TTC1_CLK0_IN => '0',
      TTC1_CLK1_IN => '0',
      TTC1_CLK2_IN => '0',
      TTC1_WAVE0_OUT => NLW_inst_TTC1_WAVE0_OUT_UNCONNECTED,
      TTC1_WAVE1_OUT => NLW_inst_TTC1_WAVE1_OUT_UNCONNECTED,
      TTC1_WAVE2_OUT => NLW_inst_TTC1_WAVE2_OUT_UNCONNECTED,
      UART0_CTSN => '0',
      UART0_DCDN => '0',
      UART0_DSRN => '0',
      UART0_DTRN => NLW_inst_UART0_DTRN_UNCONNECTED,
      UART0_RIN => '0',
      UART0_RTSN => NLW_inst_UART0_RTSN_UNCONNECTED,
      UART0_RX => '1',
      UART0_TX => NLW_inst_UART0_TX_UNCONNECTED,
      UART1_CTSN => '0',
      UART1_DCDN => '0',
      UART1_DSRN => '0',
      UART1_DTRN => NLW_inst_UART1_DTRN_UNCONNECTED,
      UART1_RIN => '0',
      UART1_RTSN => NLW_inst_UART1_RTSN_UNCONNECTED,
      UART1_RX => '1',
      UART1_TX => NLW_inst_UART1_TX_UNCONNECTED,
      USB0_PORT_INDCTL(1 downto 0) => NLW_inst_USB0_PORT_INDCTL_UNCONNECTED(1 downto 0),
      USB0_VBUS_PWRFAULT => '0',
      USB0_VBUS_PWRSELECT => NLW_inst_USB0_VBUS_PWRSELECT_UNCONNECTED,
      USB1_PORT_INDCTL(1 downto 0) => NLW_inst_USB1_PORT_INDCTL_UNCONNECTED(1 downto 0),
      USB1_VBUS_PWRFAULT => '0',
      USB1_VBUS_PWRSELECT => NLW_inst_USB1_VBUS_PWRSELECT_UNCONNECTED,
      WDT_CLK_IN => '0',
      WDT_RST_OUT => NLW_inst_WDT_RST_OUT_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_lpf is
  port (
    lpf_int : out STD_LOGIC;
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_lpf : entity is "lpf";
end dwa_ps_bd_lpf;

architecture STRUCTURE of dwa_ps_bd_lpf is
  signal \ACTIVE_LOW_EXT.ACT_LO_EXT_n_0\ : STD_LOGIC;
  signal Q : STD_LOGIC;
  signal exr_lpf : STD_LOGIC_VECTOR ( 0 to 0 );
  signal lpf_exr : STD_LOGIC;
  signal lpf_int0 : STD_LOGIC;
  signal p_1_in4_in : STD_LOGIC;
  signal p_2_in3_in : STD_LOGIC;
  signal p_3_in6_in : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of POR_SRL_I : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of POR_SRL_I : label is "SRL16";
  attribute srl_name : string;
  attribute srl_name of POR_SRL_I : label is "rst_ps7_0_100M/U0/\EXT_LPF/POR_SRL_I ";
begin
\ACTIVE_LOW_EXT.ACT_LO_EXT\: entity work.dwa_ps_bd_cdc_sync
     port map (
      exr_lpf(0) => exr_lpf(0),
      ext_reset_in => ext_reset_in,
      lpf_exr => lpf_exr,
      lpf_exr_reg => \ACTIVE_LOW_EXT.ACT_LO_EXT_n_0\,
      p_1_in4_in => p_1_in4_in,
      p_2_in3_in => p_2_in3_in,
      scndry_out => p_3_in6_in,
      slowest_sync_clk => slowest_sync_clk
    );
\EXT_LPF[1].exr_lpf_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_3_in6_in,
      Q => p_2_in3_in,
      R => '0'
    );
\EXT_LPF[2].exr_lpf_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_2_in3_in,
      Q => p_1_in4_in,
      R => '0'
    );
\EXT_LPF[3].exr_lpf_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_1_in4_in,
      Q => exr_lpf(0),
      R => '0'
    );
POR_SRL_I: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"FFFF"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => '1',
      CLK => slowest_sync_clk,
      D => '0',
      Q => Q
    );
lpf_exr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => \ACTIVE_LOW_EXT.ACT_LO_EXT_n_0\,
      Q => lpf_exr,
      R => '0'
    );
lpf_int_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => lpf_exr,
      I1 => Q,
      O => lpf_int0
    );
lpf_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => lpf_int0,
      Q => lpf_int,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_sequence_psr is
  port (
    bsr_reg_0 : out STD_LOGIC;
    pr_reg_0 : out STD_LOGIC;
    lpf_int : in STD_LOGIC;
    slowest_sync_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_sequence_psr : entity is "sequence_psr";
end dwa_ps_bd_sequence_psr;

architecture STRUCTURE of dwa_ps_bd_sequence_psr is
  signal Bsr_out : STD_LOGIC;
  signal Core_i_1_n_0 : STD_LOGIC;
  signal MB_out : STD_LOGIC;
  signal Pr_out : STD_LOGIC;
  signal \bsr_dec_reg_n_0_[0]\ : STD_LOGIC;
  signal \bsr_dec_reg_n_0_[2]\ : STD_LOGIC;
  signal bsr_i_1_n_0 : STD_LOGIC;
  signal \core_dec[0]_i_1_n_0\ : STD_LOGIC;
  signal \core_dec[2]_i_1_n_0\ : STD_LOGIC;
  signal \core_dec_reg_n_0_[0]\ : STD_LOGIC;
  signal from_sys_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_3_out : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal p_5_out : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \pr_dec0__0\ : STD_LOGIC;
  signal \pr_dec_reg_n_0_[0]\ : STD_LOGIC;
  signal \pr_dec_reg_n_0_[1]\ : STD_LOGIC;
  signal \pr_dec_reg_n_0_[2]\ : STD_LOGIC;
  signal pr_i_1_n_0 : STD_LOGIC;
  signal seq_clr : STD_LOGIC;
  signal seq_cnt : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal seq_cnt_en : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ACTIVE_LOW_BSR_OUT_DFF[0].FDRE_BSR_N_i_1\ : label is "soft_lutpair130";
  attribute SOFT_HLUTNM of \ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N_i_1\ : label is "soft_lutpair131";
  attribute SOFT_HLUTNM of Core_i_1 : label is "soft_lutpair129";
  attribute SOFT_HLUTNM of \bsr_dec[0]_i_1\ : label is "soft_lutpair128";
  attribute SOFT_HLUTNM of \bsr_dec[2]_i_1\ : label is "soft_lutpair132";
  attribute SOFT_HLUTNM of bsr_i_1 : label is "soft_lutpair130";
  attribute SOFT_HLUTNM of \core_dec[0]_i_1\ : label is "soft_lutpair128";
  attribute SOFT_HLUTNM of \core_dec[2]_i_1\ : label is "soft_lutpair132";
  attribute SOFT_HLUTNM of from_sys_i_1 : label is "soft_lutpair129";
  attribute SOFT_HLUTNM of pr_i_1 : label is "soft_lutpair131";
begin
\ACTIVE_LOW_BSR_OUT_DFF[0].FDRE_BSR_N_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Bsr_out,
      O => bsr_reg_0
    );
\ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Pr_out,
      O => pr_reg_0
    );
Core_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => MB_out,
      I1 => p_0_in,
      O => Core_i_1_n_0
    );
Core_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => Core_i_1_n_0,
      Q => MB_out,
      S => lpf_int
    );
SEQ_COUNTER: entity work.dwa_ps_bd_upcnt_n
     port map (
      Q(5 downto 0) => seq_cnt(5 downto 0),
      seq_clr => seq_clr,
      seq_cnt_en => seq_cnt_en,
      slowest_sync_clk => slowest_sync_clk
    );
\bsr_dec[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0090"
    )
        port map (
      I0 => seq_cnt_en,
      I1 => seq_cnt(4),
      I2 => seq_cnt(3),
      I3 => seq_cnt(5),
      O => p_5_out(0)
    );
\bsr_dec[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pr_dec_reg_n_0_[1]\,
      I1 => \bsr_dec_reg_n_0_[0]\,
      O => p_5_out(2)
    );
\bsr_dec_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_5_out(0),
      Q => \bsr_dec_reg_n_0_[0]\,
      R => '0'
    );
\bsr_dec_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_5_out(2),
      Q => \bsr_dec_reg_n_0_[2]\,
      R => '0'
    );
bsr_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Bsr_out,
      I1 => \bsr_dec_reg_n_0_[2]\,
      O => bsr_i_1_n_0
    );
bsr_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => bsr_i_1_n_0,
      Q => Bsr_out,
      S => lpf_int
    );
\core_dec[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9000"
    )
        port map (
      I0 => seq_cnt_en,
      I1 => seq_cnt(4),
      I2 => seq_cnt(5),
      I3 => seq_cnt(3),
      O => \core_dec[0]_i_1_n_0\
    );
\core_dec[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pr_dec_reg_n_0_[1]\,
      I1 => \core_dec_reg_n_0_[0]\,
      O => \core_dec[2]_i_1_n_0\
    );
\core_dec_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => \core_dec[0]_i_1_n_0\,
      Q => \core_dec_reg_n_0_[0]\,
      R => '0'
    );
\core_dec_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => \core_dec[2]_i_1_n_0\,
      Q => p_0_in,
      R => '0'
    );
from_sys_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => MB_out,
      I1 => seq_cnt_en,
      O => from_sys_i_1_n_0
    );
from_sys_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => from_sys_i_1_n_0,
      Q => seq_cnt_en,
      S => lpf_int
    );
pr_dec0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0018"
    )
        port map (
      I0 => seq_cnt_en,
      I1 => seq_cnt(0),
      I2 => seq_cnt(2),
      I3 => seq_cnt(1),
      O => \pr_dec0__0\
    );
\pr_dec[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1080"
    )
        port map (
      I0 => seq_cnt_en,
      I1 => seq_cnt(5),
      I2 => seq_cnt(3),
      I3 => seq_cnt(4),
      O => p_3_out(0)
    );
\pr_dec[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pr_dec_reg_n_0_[1]\,
      I1 => \pr_dec_reg_n_0_[0]\,
      O => p_3_out(2)
    );
\pr_dec_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_3_out(0),
      Q => \pr_dec_reg_n_0_[0]\,
      R => '0'
    );
\pr_dec_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => \pr_dec0__0\,
      Q => \pr_dec_reg_n_0_[1]\,
      R => '0'
    );
\pr_dec_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_3_out(2),
      Q => \pr_dec_reg_n_0_[2]\,
      R => '0'
    );
pr_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Pr_out,
      I1 => \pr_dec_reg_n_0_[2]\,
      O => pr_i_1_n_0
    );
pr_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => pr_i_1_n_0,
      Q => Pr_out,
      S => lpf_int
    );
seq_clr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => '1',
      Q => seq_clr,
      R => lpf_int
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_ar_channel is
  port (
    sel_first : out STD_LOGIC;
    sel_first_reg : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \FSM_sequential_state_reg[1]\ : out STD_LOGIC;
    \axaddr_wrap_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \axaddr_incr_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    r_push : out STD_LOGIC;
    m_axi_arvalid : out STD_LOGIC;
    m_valid_i0 : out STD_LOGIC;
    s_ready_i0 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    r_rlast : out STD_LOGIC;
    \s_arid_r_reg[11]_0\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \m_payload_i_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    aclk : in STD_LOGIC;
    si_rs_arvalid : in STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    \s_arid_r_reg[11]_1\ : in STD_LOGIC_VECTOR ( 30 downto 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_incr_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_second_len_r_reg[3]\ : in STD_LOGIC;
    \axaddr_offset_r_reg[0]\ : in STD_LOGIC;
    \FSM_sequential_state_reg[0]\ : in STD_LOGIC;
    \axaddr_offset_r_reg[2]\ : in STD_LOGIC;
    \axaddr_offset_r_reg[2]_0\ : in STD_LOGIC;
    next_pending_r_reg : in STD_LOGIC;
    \axaddr_offset_r_reg[1]\ : in STD_LOGIC;
    \axaddr_offset_r_reg[1]_0\ : in STD_LOGIC;
    \axaddr_offset_r_reg[3]\ : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_ready_i_reg : in STD_LOGIC;
    O : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_incr_reg[7]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_incr_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    D : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_ar_channel : entity is "axi_protocol_converter_v2_1_22_b2s_ar_channel";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_ar_channel;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_ar_channel is
  signal \^fsm_sequential_state_reg[1]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ar_cmd_fsm_0_n_0 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_1 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_10 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_16 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_17 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_19 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_2 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_20 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_21 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_22 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_23 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_24 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_25 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_26 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_27 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_28 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_29 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_3 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_30 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_31 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_32 : STD_LOGIC;
  signal ar_cmd_fsm_0_n_33 : STD_LOGIC;
  signal cmd_translator_0_n_0 : STD_LOGIC;
  signal cmd_translator_0_n_20 : STD_LOGIC;
  signal cmd_translator_0_n_21 : STD_LOGIC;
  signal cmd_translator_0_n_22 : STD_LOGIC;
  signal cmd_translator_0_n_23 : STD_LOGIC;
  signal cmd_translator_0_n_24 : STD_LOGIC;
  signal cmd_translator_0_n_25 : STD_LOGIC;
  signal cmd_translator_0_n_26 : STD_LOGIC;
  signal cmd_translator_0_n_27 : STD_LOGIC;
  signal cmd_translator_0_n_3 : STD_LOGIC;
  signal cmd_translator_0_n_4 : STD_LOGIC;
  signal cmd_translator_0_n_40 : STD_LOGIC;
  signal cmd_translator_0_n_42 : STD_LOGIC;
  signal cmd_translator_0_n_5 : STD_LOGIC;
  signal cmd_translator_0_n_51 : STD_LOGIC;
  signal cmd_translator_0_n_52 : STD_LOGIC;
  signal cmd_translator_0_n_53 : STD_LOGIC;
  signal cmd_translator_0_n_54 : STD_LOGIC;
  signal cmd_translator_0_n_55 : STD_LOGIC;
  signal cmd_translator_0_n_56 : STD_LOGIC;
  signal cmd_translator_0_n_57 : STD_LOGIC;
  signal cmd_translator_0_n_58 : STD_LOGIC;
  signal cmd_translator_0_n_59 : STD_LOGIC;
  signal cmd_translator_0_n_6 : STD_LOGIC;
  signal cmd_translator_0_n_60 : STD_LOGIC;
  signal cmd_translator_0_n_61 : STD_LOGIC;
  signal cmd_translator_0_n_62 : STD_LOGIC;
  signal cmd_translator_0_n_7 : STD_LOGIC;
  signal \^r_push\ : STD_LOGIC;
  signal \^sel_first\ : STD_LOGIC;
  signal sel_first_i : STD_LOGIC;
  signal \^sel_first_reg\ : STD_LOGIC;
  signal \wrap_cmd_0/axaddr_offset\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \wrap_cmd_0/axaddr_offset_r\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \wrap_cmd_0/wrap_second_len\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \wrap_cmd_0/wrap_second_len_r\ : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  \FSM_sequential_state_reg[1]\ <= \^fsm_sequential_state_reg[1]\;
  Q(1 downto 0) <= \^q\(1 downto 0);
  r_push <= \^r_push\;
  sel_first <= \^sel_first\;
  sel_first_reg <= \^sel_first_reg\;
ar_cmd_fsm_0: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_rd_cmd_fsm
     port map (
      D(3) => ar_cmd_fsm_0_n_0,
      D(2) => ar_cmd_fsm_0_n_1,
      D(1) => ar_cmd_fsm_0_n_2,
      D(0) => ar_cmd_fsm_0_n_3,
      E(0) => ar_cmd_fsm_0_n_20,
      \FSM_sequential_state_reg[0]_0\ => \FSM_sequential_state_reg[0]\,
      \FSM_sequential_state_reg[1]_0\ => ar_cmd_fsm_0_n_10,
      \FSM_sequential_state_reg[1]_1\ => \^fsm_sequential_state_reg[1]\,
      \FSM_sequential_state_reg[1]_2\ => \^r_push\,
      \FSM_sequential_state_reg[1]_3\ => cmd_translator_0_n_40,
      M00_AXI_0_arready => ar_cmd_fsm_0_n_16,
      M00_AXI_0_arready_0 => ar_cmd_fsm_0_n_17,
      M00_AXI_0_arready_1 => ar_cmd_fsm_0_n_19,
      O(3) => cmd_translator_0_n_24,
      O(2) => cmd_translator_0_n_25,
      O(1) => cmd_translator_0_n_26,
      O(0) => cmd_translator_0_n_27,
      Q(1 downto 0) => \^q\(1 downto 0),
      aclk => aclk,
      areset_d1 => areset_d1,
      \axaddr_incr_reg[0]\ => \^sel_first\,
      axaddr_offset(3 downto 0) => \wrap_cmd_0/axaddr_offset\(3 downto 0),
      \axaddr_offset_r_reg[0]\ => \axaddr_offset_r_reg[0]\,
      \axaddr_offset_r_reg[1]\ => \axaddr_offset_r_reg[1]\,
      \axaddr_offset_r_reg[1]_0\ => \axaddr_offset_r_reg[1]_0\,
      \axaddr_offset_r_reg[2]\ => \axaddr_offset_r_reg[2]\,
      \axaddr_offset_r_reg[2]_0\ => \axaddr_offset_r_reg[2]_0\,
      \axaddr_offset_r_reg[3]\(3 downto 0) => \wrap_cmd_0/axaddr_offset_r\(3 downto 0),
      \axaddr_offset_r_reg[3]_0\(13) => \s_arid_r_reg[11]_1\(18),
      \axaddr_offset_r_reg[3]_0\(12) => \s_arid_r_reg[11]_1\(15),
      \axaddr_offset_r_reg[3]_0\(11 downto 0) => \s_arid_r_reg[11]_1\(11 downto 0),
      \axaddr_offset_r_reg[3]_1\ => \axaddr_offset_r_reg[3]\,
      \axaddr_wrap_reg[10]\ => cmd_translator_0_n_42,
      \axaddr_wrap_reg[11]\(11) => cmd_translator_0_n_51,
      \axaddr_wrap_reg[11]\(10) => cmd_translator_0_n_52,
      \axaddr_wrap_reg[11]\(9) => cmd_translator_0_n_53,
      \axaddr_wrap_reg[11]\(8) => cmd_translator_0_n_54,
      \axaddr_wrap_reg[11]\(7) => cmd_translator_0_n_55,
      \axaddr_wrap_reg[11]\(6) => cmd_translator_0_n_56,
      \axaddr_wrap_reg[11]\(5) => cmd_translator_0_n_57,
      \axaddr_wrap_reg[11]\(4) => cmd_translator_0_n_58,
      \axaddr_wrap_reg[11]\(3) => cmd_translator_0_n_59,
      \axaddr_wrap_reg[11]\(2) => cmd_translator_0_n_60,
      \axaddr_wrap_reg[11]\(1) => cmd_translator_0_n_61,
      \axaddr_wrap_reg[11]\(0) => cmd_translator_0_n_62,
      \axaddr_wrap_reg[3]\(3) => cmd_translator_0_n_4,
      \axaddr_wrap_reg[3]\(2) => cmd_translator_0_n_5,
      \axaddr_wrap_reg[3]\(1) => cmd_translator_0_n_6,
      \axaddr_wrap_reg[3]\(0) => cmd_translator_0_n_7,
      \axaddr_wrap_reg[7]\(3) => cmd_translator_0_n_20,
      \axaddr_wrap_reg[7]\(2) => cmd_translator_0_n_21,
      \axaddr_wrap_reg[7]\(1) => cmd_translator_0_n_22,
      \axaddr_wrap_reg[7]\(0) => cmd_translator_0_n_23,
      \axlen_cnt_reg[7]\ => cmd_translator_0_n_3,
      m_axi_arready => m_axi_arready,
      m_axi_arvalid => m_axi_arvalid,
      \m_payload_i_reg[11]\(11) => ar_cmd_fsm_0_n_22,
      \m_payload_i_reg[11]\(10) => ar_cmd_fsm_0_n_23,
      \m_payload_i_reg[11]\(9) => ar_cmd_fsm_0_n_24,
      \m_payload_i_reg[11]\(8) => ar_cmd_fsm_0_n_25,
      \m_payload_i_reg[11]\(7) => ar_cmd_fsm_0_n_26,
      \m_payload_i_reg[11]\(6) => ar_cmd_fsm_0_n_27,
      \m_payload_i_reg[11]\(5) => ar_cmd_fsm_0_n_28,
      \m_payload_i_reg[11]\(4) => ar_cmd_fsm_0_n_29,
      \m_payload_i_reg[11]\(3) => ar_cmd_fsm_0_n_30,
      \m_payload_i_reg[11]\(2) => ar_cmd_fsm_0_n_31,
      \m_payload_i_reg[11]\(1) => ar_cmd_fsm_0_n_32,
      \m_payload_i_reg[11]\(0) => ar_cmd_fsm_0_n_33,
      m_valid_i0 => m_valid_i0,
      m_valid_i_reg(0) => E(0),
      s_axi_arvalid => s_axi_arvalid,
      s_ready_i0 => s_ready_i0,
      s_ready_i_reg => s_ready_i_reg,
      sel_first_i => sel_first_i,
      sel_first_reg(0) => ar_cmd_fsm_0_n_21,
      sel_first_reg_0 => \^sel_first_reg\,
      sel_first_reg_1 => cmd_translator_0_n_0,
      si_rs_arvalid => si_rs_arvalid,
      \wrap_second_len_r_reg[3]\(3 downto 0) => \wrap_cmd_0/wrap_second_len\(3 downto 0),
      \wrap_second_len_r_reg[3]_0\(3 downto 0) => \wrap_cmd_0/wrap_second_len_r\(3 downto 0),
      \wrap_second_len_r_reg[3]_1\ => \wrap_second_len_r_reg[3]\
    );
cmd_translator_0: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator_1
     port map (
      D(3 downto 0) => \wrap_cmd_0/axaddr_offset\(3 downto 0),
      E(0) => ar_cmd_fsm_0_n_20,
      M00_AXI_0_arready => cmd_translator_0_n_40,
      O(3) => cmd_translator_0_n_24,
      O(2) => cmd_translator_0_n_25,
      O(1) => cmd_translator_0_n_26,
      O(0) => cmd_translator_0_n_27,
      Q(1 downto 0) => \^q\(1 downto 0),
      S(3 downto 0) => S(3 downto 0),
      aclk => aclk,
      \axaddr_incr_reg[0]\(0) => ar_cmd_fsm_0_n_21,
      \axaddr_incr_reg[11]\(11 downto 0) => \axaddr_incr_reg[11]\(11 downto 0),
      \axaddr_incr_reg[11]_0\(3 downto 0) => O(3 downto 0),
      \axaddr_incr_reg[3]\(3 downto 0) => \axaddr_incr_reg[3]\(3 downto 0),
      \axaddr_incr_reg[3]_0\(3 downto 0) => \axaddr_incr_reg[3]_0\(3 downto 0),
      \axaddr_incr_reg[7]\(3 downto 0) => \axaddr_incr_reg[7]\(3 downto 0),
      \axaddr_offset_r_reg[3]\(3 downto 0) => \wrap_cmd_0/axaddr_offset_r\(3 downto 0),
      \axaddr_wrap_reg[0]\ => ar_cmd_fsm_0_n_19,
      \axaddr_wrap_reg[11]\(11 downto 0) => \axaddr_wrap_reg[11]\(11 downto 0),
      \axaddr_wrap_reg[11]_0\(11) => ar_cmd_fsm_0_n_22,
      \axaddr_wrap_reg[11]_0\(10) => ar_cmd_fsm_0_n_23,
      \axaddr_wrap_reg[11]_0\(9) => ar_cmd_fsm_0_n_24,
      \axaddr_wrap_reg[11]_0\(8) => ar_cmd_fsm_0_n_25,
      \axaddr_wrap_reg[11]_0\(7) => ar_cmd_fsm_0_n_26,
      \axaddr_wrap_reg[11]_0\(6) => ar_cmd_fsm_0_n_27,
      \axaddr_wrap_reg[11]_0\(5) => ar_cmd_fsm_0_n_28,
      \axaddr_wrap_reg[11]_0\(4) => ar_cmd_fsm_0_n_29,
      \axaddr_wrap_reg[11]_0\(3) => ar_cmd_fsm_0_n_30,
      \axaddr_wrap_reg[11]_0\(2) => ar_cmd_fsm_0_n_31,
      \axaddr_wrap_reg[11]_0\(1) => ar_cmd_fsm_0_n_32,
      \axaddr_wrap_reg[11]_0\(0) => ar_cmd_fsm_0_n_33,
      \axaddr_wrap_reg[3]\(3) => cmd_translator_0_n_4,
      \axaddr_wrap_reg[3]\(2) => cmd_translator_0_n_5,
      \axaddr_wrap_reg[3]\(1) => cmd_translator_0_n_6,
      \axaddr_wrap_reg[3]\(0) => cmd_translator_0_n_7,
      \axaddr_wrap_reg[7]\(3) => cmd_translator_0_n_20,
      \axaddr_wrap_reg[7]\(2) => cmd_translator_0_n_21,
      \axaddr_wrap_reg[7]\(1) => cmd_translator_0_n_22,
      \axaddr_wrap_reg[7]\(0) => cmd_translator_0_n_23,
      \axlen_cnt_reg[0]\ => cmd_translator_0_n_42,
      \axlen_cnt_reg[3]\ => \^fsm_sequential_state_reg[1]\,
      \axlen_cnt_reg[3]_0\(15 downto 4) => \s_arid_r_reg[11]_1\(18 downto 7),
      \axlen_cnt_reg[3]_0\(3 downto 0) => \s_arid_r_reg[11]_1\(3 downto 0),
      \axlen_cnt_reg[7]\ => cmd_translator_0_n_3,
      \axlen_cnt_reg[7]_0\ => ar_cmd_fsm_0_n_10,
      m_axi_arready => m_axi_arready,
      \m_payload_i_reg[3]\(3 downto 0) => \m_payload_i_reg[3]\(3 downto 0),
      next_pending_r_reg => next_pending_r_reg,
      r_push => \^r_push\,
      r_rlast => r_rlast,
      sel_first_i => sel_first_i,
      sel_first_reg_0 => cmd_translator_0_n_0,
      sel_first_reg_1 => \^sel_first\,
      sel_first_reg_2 => \^sel_first_reg\,
      sel_first_reg_3 => ar_cmd_fsm_0_n_17,
      sel_first_reg_4 => ar_cmd_fsm_0_n_16,
      si_rs_arvalid => si_rs_arvalid,
      \wrap_boundary_axaddr_r_reg[11]\(11) => cmd_translator_0_n_51,
      \wrap_boundary_axaddr_r_reg[11]\(10) => cmd_translator_0_n_52,
      \wrap_boundary_axaddr_r_reg[11]\(9) => cmd_translator_0_n_53,
      \wrap_boundary_axaddr_r_reg[11]\(8) => cmd_translator_0_n_54,
      \wrap_boundary_axaddr_r_reg[11]\(7) => cmd_translator_0_n_55,
      \wrap_boundary_axaddr_r_reg[11]\(6) => cmd_translator_0_n_56,
      \wrap_boundary_axaddr_r_reg[11]\(5) => cmd_translator_0_n_57,
      \wrap_boundary_axaddr_r_reg[11]\(4) => cmd_translator_0_n_58,
      \wrap_boundary_axaddr_r_reg[11]\(3) => cmd_translator_0_n_59,
      \wrap_boundary_axaddr_r_reg[11]\(2) => cmd_translator_0_n_60,
      \wrap_boundary_axaddr_r_reg[11]\(1) => cmd_translator_0_n_61,
      \wrap_boundary_axaddr_r_reg[11]\(0) => cmd_translator_0_n_62,
      \wrap_boundary_axaddr_r_reg[6]\(6 downto 0) => D(6 downto 0),
      \wrap_cnt_r_reg[3]\(3) => ar_cmd_fsm_0_n_0,
      \wrap_cnt_r_reg[3]\(2) => ar_cmd_fsm_0_n_1,
      \wrap_cnt_r_reg[3]\(1) => ar_cmd_fsm_0_n_2,
      \wrap_cnt_r_reg[3]\(0) => ar_cmd_fsm_0_n_3,
      \wrap_second_len_r_reg[3]\(3 downto 0) => \wrap_cmd_0/wrap_second_len_r\(3 downto 0),
      \wrap_second_len_r_reg[3]_0\(3 downto 0) => \wrap_cmd_0/wrap_second_len\(3 downto 0)
    );
\s_arid_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_arid_r_reg[11]_1\(19),
      Q => \s_arid_r_reg[11]_0\(0),
      R => '0'
    );
\s_arid_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_arid_r_reg[11]_1\(29),
      Q => \s_arid_r_reg[11]_0\(10),
      R => '0'
    );
\s_arid_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_arid_r_reg[11]_1\(30),
      Q => \s_arid_r_reg[11]_0\(11),
      R => '0'
    );
\s_arid_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_arid_r_reg[11]_1\(20),
      Q => \s_arid_r_reg[11]_0\(1),
      R => '0'
    );
\s_arid_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_arid_r_reg[11]_1\(21),
      Q => \s_arid_r_reg[11]_0\(2),
      R => '0'
    );
\s_arid_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_arid_r_reg[11]_1\(22),
      Q => \s_arid_r_reg[11]_0\(3),
      R => '0'
    );
\s_arid_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_arid_r_reg[11]_1\(23),
      Q => \s_arid_r_reg[11]_0\(4),
      R => '0'
    );
\s_arid_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_arid_r_reg[11]_1\(24),
      Q => \s_arid_r_reg[11]_0\(5),
      R => '0'
    );
\s_arid_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_arid_r_reg[11]_1\(25),
      Q => \s_arid_r_reg[11]_0\(6),
      R => '0'
    );
\s_arid_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_arid_r_reg[11]_1\(26),
      Q => \s_arid_r_reg[11]_0\(7),
      R => '0'
    );
\s_arid_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_arid_r_reg[11]_1\(27),
      Q => \s_arid_r_reg[11]_0\(8),
      R => '0'
    );
\s_arid_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_arid_r_reg[11]_1\(28),
      Q => \s_arid_r_reg[11]_0\(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_aw_channel is
  port (
    sel_first_0 : out STD_LOGIC;
    sel_first : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \FSM_sequential_state_reg[0]\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    b_push : out STD_LOGIC;
    \axaddr_wrap_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \axaddr_incr_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \axaddr_offset_r_reg[2]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    \in\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \m_payload_i_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    aclk : in STD_LOGIC;
    \s_awid_r_reg[11]_0\ : in STD_LOGIC_VECTOR ( 30 downto 0 );
    si_rs_awvalid : in STD_LOGIC;
    \axaddr_offset_r_reg[2]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \axaddr_wrap_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axaddr_incr_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wrap_second_len_r_reg[3]\ : in STD_LOGIC;
    \axaddr_offset_r_reg[0]\ : in STD_LOGIC;
    next_pending_r_reg : in STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    \axaddr_offset_r_reg[3]\ : in STD_LOGIC;
    \axaddr_offset_r_reg[1]\ : in STD_LOGIC;
    \axaddr_offset_r_reg[1]_0\ : in STD_LOGIC;
    cnt_read : in STD_LOGIC_VECTOR ( 1 downto 0 );
    axaddr_incr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    D : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_aw_channel : entity is "axi_protocol_converter_v2_1_22_b2s_aw_channel";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_aw_channel;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_aw_channel is
  signal \^fsm_sequential_state_reg[0]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal aw_cmd_fsm_0_n_10 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_18 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_2 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_20 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_21 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_22 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_23 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_25 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_26 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_27 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_28 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_29 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_3 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_30 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_31 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_32 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_33 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_34 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_35 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_36 : STD_LOGIC;
  signal aw_cmd_fsm_0_n_9 : STD_LOGIC;
  signal axaddr_wrap0 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal cmd_translator_0_n_2 : STD_LOGIC;
  signal cmd_translator_0_n_43 : STD_LOGIC;
  signal cmd_translator_0_n_44 : STD_LOGIC;
  signal cmd_translator_0_n_5 : STD_LOGIC;
  signal cmd_translator_0_n_6 : STD_LOGIC;
  signal \incr_cmd_0/next_pending_r\ : STD_LOGIC;
  signal \next\ : STD_LOGIC;
  signal \^sel_first\ : STD_LOGIC;
  signal \^sel_first_0\ : STD_LOGIC;
  signal sel_first_i : STD_LOGIC;
  signal wrap_boundary_axaddr_r : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \wrap_cmd_0/axaddr_offset\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \wrap_cmd_0/axaddr_offset_r\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \wrap_cmd_0/next_pending_r\ : STD_LOGIC;
  signal \wrap_cmd_0/wrap_second_len\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \wrap_cmd_0/wrap_second_len_r\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal wrap_cnt : STD_LOGIC_VECTOR ( 3 downto 2 );
begin
  \FSM_sequential_state_reg[0]\ <= \^fsm_sequential_state_reg[0]\;
  Q(1 downto 0) <= \^q\(1 downto 0);
  sel_first <= \^sel_first\;
  sel_first_0 <= \^sel_first_0\;
aw_cmd_fsm_0: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_wr_cmd_fsm
     port map (
      D(3 downto 2) => wrap_cnt(3 downto 2),
      D(1) => aw_cmd_fsm_0_n_2,
      D(0) => aw_cmd_fsm_0_n_3,
      E(0) => E(0),
      \FSM_sequential_state_reg[0]_0\ => aw_cmd_fsm_0_n_9,
      \FSM_sequential_state_reg[0]_1\ => aw_cmd_fsm_0_n_10,
      \FSM_sequential_state_reg[0]_2\ => \^fsm_sequential_state_reg[0]\,
      \FSM_sequential_state_reg[1]_0\ => cmd_translator_0_n_43,
      M00_AXI_0_awready => b_push,
      Q(1 downto 0) => \^q\(1 downto 0),
      aclk => aclk,
      areset_d1 => areset_d1,
      axaddr_offset(2) => \wrap_cmd_0/axaddr_offset\(3),
      axaddr_offset(1 downto 0) => \wrap_cmd_0/axaddr_offset\(1 downto 0),
      \axaddr_offset_r_reg[0]\ => \axaddr_offset_r_reg[0]\,
      \axaddr_offset_r_reg[1]\ => \axaddr_offset_r_reg[1]\,
      \axaddr_offset_r_reg[1]_0\ => \axaddr_offset_r_reg[1]_0\,
      \axaddr_offset_r_reg[3]\(2) => \wrap_cmd_0/axaddr_offset_r\(3),
      \axaddr_offset_r_reg[3]\(1 downto 0) => \wrap_cmd_0/axaddr_offset_r\(1 downto 0),
      \axaddr_offset_r_reg[3]_0\(14) => \s_awid_r_reg[11]_0\(18),
      \axaddr_offset_r_reg[3]_0\(13 downto 12) => \s_awid_r_reg[11]_0\(15 downto 14),
      \axaddr_offset_r_reg[3]_0\(11 downto 0) => \s_awid_r_reg[11]_0\(11 downto 0),
      \axaddr_offset_r_reg[3]_1\ => \axaddr_offset_r_reg[3]\,
      axaddr_wrap0(11 downto 0) => axaddr_wrap0(11 downto 0),
      \axaddr_wrap_reg[11]\(11 downto 0) => wrap_boundary_axaddr_r(11 downto 0),
      \axaddr_wrap_reg[11]_0\ => cmd_translator_0_n_44,
      \axlen_cnt_reg[2]\ => aw_cmd_fsm_0_n_18,
      \axlen_cnt_reg[2]_0\ => aw_cmd_fsm_0_n_20,
      cnt_read(1 downto 0) => cnt_read(1 downto 0),
      m_axi_awready => m_axi_awready,
      m_axi_awvalid => m_axi_awvalid,
      m_valid_i_reg(0) => aw_cmd_fsm_0_n_21,
      \next\ => \next\,
      next_pending_r => \incr_cmd_0/next_pending_r\,
      next_pending_r_0 => \wrap_cmd_0/next_pending_r\,
      s_axburst_eq0_reg => cmd_translator_0_n_5,
      s_axburst_eq0_reg_0 => cmd_translator_0_n_6,
      s_axburst_eq1_reg => next_pending_r_reg,
      sel_first => \^sel_first\,
      sel_first_i => sel_first_i,
      sel_first_reg => aw_cmd_fsm_0_n_22,
      sel_first_reg_0 => aw_cmd_fsm_0_n_23,
      sel_first_reg_1 => \^sel_first_0\,
      sel_first_reg_2 => cmd_translator_0_n_2,
      si_rs_awvalid => si_rs_awvalid,
      \wrap_boundary_axaddr_r_reg[11]\(11) => aw_cmd_fsm_0_n_25,
      \wrap_boundary_axaddr_r_reg[11]\(10) => aw_cmd_fsm_0_n_26,
      \wrap_boundary_axaddr_r_reg[11]\(9) => aw_cmd_fsm_0_n_27,
      \wrap_boundary_axaddr_r_reg[11]\(8) => aw_cmd_fsm_0_n_28,
      \wrap_boundary_axaddr_r_reg[11]\(7) => aw_cmd_fsm_0_n_29,
      \wrap_boundary_axaddr_r_reg[11]\(6) => aw_cmd_fsm_0_n_30,
      \wrap_boundary_axaddr_r_reg[11]\(5) => aw_cmd_fsm_0_n_31,
      \wrap_boundary_axaddr_r_reg[11]\(4) => aw_cmd_fsm_0_n_32,
      \wrap_boundary_axaddr_r_reg[11]\(3) => aw_cmd_fsm_0_n_33,
      \wrap_boundary_axaddr_r_reg[11]\(2) => aw_cmd_fsm_0_n_34,
      \wrap_boundary_axaddr_r_reg[11]\(1) => aw_cmd_fsm_0_n_35,
      \wrap_boundary_axaddr_r_reg[11]\(0) => aw_cmd_fsm_0_n_36,
      \wrap_second_len_r_reg[0]\(0) => \axaddr_offset_r_reg[2]_0\(0),
      \wrap_second_len_r_reg[3]\(3 downto 0) => \wrap_cmd_0/wrap_second_len\(3 downto 0),
      \wrap_second_len_r_reg[3]_0\(3 downto 0) => \wrap_cmd_0/wrap_second_len_r\(3 downto 0),
      \wrap_second_len_r_reg[3]_1\ => \wrap_second_len_r_reg[3]\
    );
cmd_translator_0: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_cmd_translator
     port map (
      D(3) => \wrap_cmd_0/axaddr_offset\(3),
      D(2) => \axaddr_offset_r_reg[2]_0\(0),
      D(1 downto 0) => \wrap_cmd_0/axaddr_offset\(1 downto 0),
      E(0) => aw_cmd_fsm_0_n_21,
      Q(1 downto 0) => \^q\(1 downto 0),
      aclk => aclk,
      axaddr_incr(11 downto 0) => axaddr_incr(11 downto 0),
      \axaddr_incr_reg[11]\(11 downto 0) => \axaddr_incr_reg[11]\(11 downto 0),
      \axaddr_incr_reg[3]\(3 downto 0) => \axaddr_incr_reg[3]\(3 downto 0),
      \axaddr_offset_r_reg[3]\(3) => \wrap_cmd_0/axaddr_offset_r\(3),
      \axaddr_offset_r_reg[3]\(2) => \axaddr_offset_r_reg[2]\(0),
      \axaddr_offset_r_reg[3]\(1 downto 0) => \wrap_cmd_0/axaddr_offset_r\(1 downto 0),
      axaddr_wrap0(11 downto 0) => axaddr_wrap0(11 downto 0),
      \axaddr_wrap_reg[0]\ => aw_cmd_fsm_0_n_10,
      \axaddr_wrap_reg[11]\(11 downto 0) => \axaddr_wrap_reg[11]\(11 downto 0),
      \axaddr_wrap_reg[11]_0\(11) => aw_cmd_fsm_0_n_25,
      \axaddr_wrap_reg[11]_0\(10) => aw_cmd_fsm_0_n_26,
      \axaddr_wrap_reg[11]_0\(9) => aw_cmd_fsm_0_n_27,
      \axaddr_wrap_reg[11]_0\(8) => aw_cmd_fsm_0_n_28,
      \axaddr_wrap_reg[11]_0\(7) => aw_cmd_fsm_0_n_29,
      \axaddr_wrap_reg[11]_0\(6) => aw_cmd_fsm_0_n_30,
      \axaddr_wrap_reg[11]_0\(5) => aw_cmd_fsm_0_n_31,
      \axaddr_wrap_reg[11]_0\(4) => aw_cmd_fsm_0_n_32,
      \axaddr_wrap_reg[11]_0\(3) => aw_cmd_fsm_0_n_33,
      \axaddr_wrap_reg[11]_0\(2) => aw_cmd_fsm_0_n_34,
      \axaddr_wrap_reg[11]_0\(1) => aw_cmd_fsm_0_n_35,
      \axaddr_wrap_reg[11]_0\(0) => aw_cmd_fsm_0_n_36,
      \axaddr_wrap_reg[3]\(3 downto 0) => \axaddr_wrap_reg[3]\(3 downto 0),
      \axlen_cnt_reg[0]\ => cmd_translator_0_n_44,
      \axlen_cnt_reg[2]\ => cmd_translator_0_n_6,
      \axlen_cnt_reg[3]\(15 downto 4) => \s_awid_r_reg[11]_0\(18 downto 7),
      \axlen_cnt_reg[3]\(3 downto 0) => \s_awid_r_reg[11]_0\(3 downto 0),
      \axlen_cnt_reg[3]_0\ => \^fsm_sequential_state_reg[0]\,
      \axlen_cnt_reg[5]\ => cmd_translator_0_n_5,
      \axlen_cnt_reg[5]_0\ => aw_cmd_fsm_0_n_9,
      \m_payload_i_reg[3]\(3 downto 0) => \m_payload_i_reg[3]\(3 downto 0),
      \next\ => \next\,
      next_pending_r => \incr_cmd_0/next_pending_r\,
      next_pending_r_0 => \wrap_cmd_0/next_pending_r\,
      next_pending_r_reg => next_pending_r_reg,
      s_axburst_eq0_reg_0 => aw_cmd_fsm_0_n_18,
      s_axburst_eq1_reg_0 => cmd_translator_0_n_43,
      s_axburst_eq1_reg_1 => aw_cmd_fsm_0_n_20,
      sel_first => \^sel_first\,
      sel_first_i => sel_first_i,
      sel_first_reg_0 => cmd_translator_0_n_2,
      sel_first_reg_1 => \^sel_first_0\,
      sel_first_reg_2 => aw_cmd_fsm_0_n_23,
      sel_first_reg_3 => aw_cmd_fsm_0_n_22,
      si_rs_awvalid => si_rs_awvalid,
      \wrap_boundary_axaddr_r_reg[11]\(11 downto 0) => wrap_boundary_axaddr_r(11 downto 0),
      \wrap_boundary_axaddr_r_reg[6]\(6 downto 0) => D(6 downto 0),
      \wrap_cnt_r_reg[3]\(3 downto 2) => wrap_cnt(3 downto 2),
      \wrap_cnt_r_reg[3]\(1) => aw_cmd_fsm_0_n_2,
      \wrap_cnt_r_reg[3]\(0) => aw_cmd_fsm_0_n_3,
      \wrap_second_len_r_reg[3]\(3 downto 0) => \wrap_cmd_0/wrap_second_len_r\(3 downto 0),
      \wrap_second_len_r_reg[3]_0\(3 downto 0) => \wrap_cmd_0/wrap_second_len\(3 downto 0)
    );
\s_awid_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(19),
      Q => \in\(4),
      R => '0'
    );
\s_awid_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(29),
      Q => \in\(14),
      R => '0'
    );
\s_awid_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(30),
      Q => \in\(15),
      R => '0'
    );
\s_awid_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(20),
      Q => \in\(5),
      R => '0'
    );
\s_awid_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(21),
      Q => \in\(6),
      R => '0'
    );
\s_awid_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(22),
      Q => \in\(7),
      R => '0'
    );
\s_awid_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(23),
      Q => \in\(8),
      R => '0'
    );
\s_awid_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(24),
      Q => \in\(9),
      R => '0'
    );
\s_awid_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(25),
      Q => \in\(10),
      R => '0'
    );
\s_awid_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(26),
      Q => \in\(11),
      R => '0'
    );
\s_awid_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(27),
      Q => \in\(12),
      R => '0'
    );
\s_awid_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(28),
      Q => \in\(13),
      R => '0'
    );
\s_awlen_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(15),
      Q => \in\(0),
      R => '0'
    );
\s_awlen_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(16),
      Q => \in\(1),
      R => '0'
    );
\s_awlen_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(17),
      Q => \in\(2),
      R => '0'
    );
\s_awlen_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_awid_r_reg[11]_0\(18),
      Q => \in\(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_proc_sys_reset is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute C_AUX_RESET_HIGH : string;
  attribute C_AUX_RESET_HIGH of dwa_ps_bd_proc_sys_reset : entity is "1'b0";
  attribute C_AUX_RST_WIDTH : integer;
  attribute C_AUX_RST_WIDTH of dwa_ps_bd_proc_sys_reset : entity is 4;
  attribute C_EXT_RESET_HIGH : string;
  attribute C_EXT_RESET_HIGH of dwa_ps_bd_proc_sys_reset : entity is "1'b0";
  attribute C_EXT_RST_WIDTH : integer;
  attribute C_EXT_RST_WIDTH of dwa_ps_bd_proc_sys_reset : entity is 4;
  attribute C_FAMILY : string;
  attribute C_FAMILY of dwa_ps_bd_proc_sys_reset : entity is "zynq";
  attribute C_NUM_BUS_RST : integer;
  attribute C_NUM_BUS_RST of dwa_ps_bd_proc_sys_reset : entity is 1;
  attribute C_NUM_INTERCONNECT_ARESETN : integer;
  attribute C_NUM_INTERCONNECT_ARESETN of dwa_ps_bd_proc_sys_reset : entity is 1;
  attribute C_NUM_PERP_ARESETN : integer;
  attribute C_NUM_PERP_ARESETN of dwa_ps_bd_proc_sys_reset : entity is 1;
  attribute C_NUM_PERP_RST : integer;
  attribute C_NUM_PERP_RST of dwa_ps_bd_proc_sys_reset : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_proc_sys_reset : entity is "proc_sys_reset";
end dwa_ps_bd_proc_sys_reset;

architecture STRUCTURE of dwa_ps_bd_proc_sys_reset is
  signal \<const0>\ : STD_LOGIC;
  signal SEQ_n_0 : STD_LOGIC;
  signal SEQ_n_1 : STD_LOGIC;
  signal lpf_int : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \ACTIVE_LOW_BSR_OUT_DFF[0].FDRE_BSR_N\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N\ : label is "PRIMITIVE";
begin
  bus_struct_reset(0) <= \<const0>\;
  mb_reset <= \<const0>\;
  peripheral_reset(0) <= \<const0>\;
\ACTIVE_LOW_BSR_OUT_DFF[0].FDRE_BSR_N\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => SEQ_n_0,
      Q => interconnect_aresetn(0),
      R => '0'
    );
\ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => SEQ_n_1,
      Q => peripheral_aresetn(0),
      R => '0'
    );
EXT_LPF: entity work.dwa_ps_bd_lpf
     port map (
      ext_reset_in => ext_reset_in,
      lpf_int => lpf_int,
      slowest_sync_clk => slowest_sync_clk
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
SEQ: entity work.dwa_ps_bd_sequence_psr
     port map (
      bsr_reg_0 => SEQ_n_0,
      lpf_int => lpf_int,
      pr_reg_0 => SEQ_n_1,
      slowest_sync_clk => slowest_sync_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s is
  port (
    s_axi_rvalid : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 22 downto 0 );
    s_axi_arready : out STD_LOGIC;
    \m_payload_i_reg[34]\ : out STD_LOGIC_VECTOR ( 22 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    \m_payload_i_reg[13]\ : out STD_LOGIC_VECTOR ( 13 downto 0 );
    \m_payload_i_reg[46]\ : out STD_LOGIC_VECTOR ( 46 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arvalid : out STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_arready : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    aclk : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 33 downto 0 );
    s_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awready : in STD_LOGIC;
    m_axi_bvalid : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s : entity is "axi_protocol_converter_v2_1_22_b2s";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s is
  signal \RD.ar_channel_0_n_1\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_10\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_11\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_12\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_13\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_14\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_15\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_16\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_17\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_18\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_19\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_20\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_21\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_22\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_23\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_24\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_25\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_26\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_27\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_28\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_4\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_47\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_48\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_49\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_5\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_50\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_6\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_7\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_8\ : STD_LOGIC;
  signal \RD.ar_channel_0_n_9\ : STD_LOGIC;
  signal \RD.r_channel_0_n_0\ : STD_LOGIC;
  signal \RD.r_channel_0_n_1\ : STD_LOGIC;
  signal SI_REG_n_10 : STD_LOGIC;
  signal SI_REG_n_11 : STD_LOGIC;
  signal SI_REG_n_128 : STD_LOGIC;
  signal SI_REG_n_129 : STD_LOGIC;
  signal SI_REG_n_130 : STD_LOGIC;
  signal SI_REG_n_131 : STD_LOGIC;
  signal SI_REG_n_144 : STD_LOGIC;
  signal SI_REG_n_145 : STD_LOGIC;
  signal SI_REG_n_146 : STD_LOGIC;
  signal SI_REG_n_147 : STD_LOGIC;
  signal SI_REG_n_148 : STD_LOGIC;
  signal SI_REG_n_149 : STD_LOGIC;
  signal SI_REG_n_150 : STD_LOGIC;
  signal SI_REG_n_151 : STD_LOGIC;
  signal SI_REG_n_152 : STD_LOGIC;
  signal SI_REG_n_153 : STD_LOGIC;
  signal SI_REG_n_154 : STD_LOGIC;
  signal SI_REG_n_155 : STD_LOGIC;
  signal SI_REG_n_156 : STD_LOGIC;
  signal SI_REG_n_157 : STD_LOGIC;
  signal SI_REG_n_158 : STD_LOGIC;
  signal SI_REG_n_161 : STD_LOGIC;
  signal SI_REG_n_162 : STD_LOGIC;
  signal SI_REG_n_163 : STD_LOGIC;
  signal SI_REG_n_164 : STD_LOGIC;
  signal SI_REG_n_165 : STD_LOGIC;
  signal SI_REG_n_166 : STD_LOGIC;
  signal SI_REG_n_167 : STD_LOGIC;
  signal SI_REG_n_168 : STD_LOGIC;
  signal SI_REG_n_169 : STD_LOGIC;
  signal SI_REG_n_170 : STD_LOGIC;
  signal SI_REG_n_171 : STD_LOGIC;
  signal SI_REG_n_172 : STD_LOGIC;
  signal SI_REG_n_173 : STD_LOGIC;
  signal SI_REG_n_174 : STD_LOGIC;
  signal SI_REG_n_175 : STD_LOGIC;
  signal SI_REG_n_176 : STD_LOGIC;
  signal SI_REG_n_177 : STD_LOGIC;
  signal SI_REG_n_178 : STD_LOGIC;
  signal SI_REG_n_179 : STD_LOGIC;
  signal SI_REG_n_180 : STD_LOGIC;
  signal SI_REG_n_181 : STD_LOGIC;
  signal SI_REG_n_182 : STD_LOGIC;
  signal SI_REG_n_183 : STD_LOGIC;
  signal SI_REG_n_184 : STD_LOGIC;
  signal SI_REG_n_185 : STD_LOGIC;
  signal SI_REG_n_186 : STD_LOGIC;
  signal SI_REG_n_29 : STD_LOGIC;
  signal SI_REG_n_30 : STD_LOGIC;
  signal SI_REG_n_66 : STD_LOGIC;
  signal SI_REG_n_67 : STD_LOGIC;
  signal SI_REG_n_68 : STD_LOGIC;
  signal SI_REG_n_69 : STD_LOGIC;
  signal SI_REG_n_70 : STD_LOGIC;
  signal SI_REG_n_71 : STD_LOGIC;
  signal SI_REG_n_72 : STD_LOGIC;
  signal SI_REG_n_73 : STD_LOGIC;
  signal SI_REG_n_8 : STD_LOGIC;
  signal SI_REG_n_9 : STD_LOGIC;
  signal \WR.aw_channel_0_n_19\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_20\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_21\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_22\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_23\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_24\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_25\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_26\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_27\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_28\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_29\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_30\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_4\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_49\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_5\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_50\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_51\ : STD_LOGIC;
  signal \WR.aw_channel_0_n_52\ : STD_LOGIC;
  signal \ar.ar_pipe/m_valid_i0\ : STD_LOGIC;
  signal \ar.ar_pipe/p_1_in\ : STD_LOGIC;
  signal \ar.ar_pipe/s_ready_i0\ : STD_LOGIC;
  signal \ar_cmd_fsm_0/state\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal areset_d1 : STD_LOGIC;
  signal areset_d1_i_1_n_0 : STD_LOGIC;
  signal \aw_cmd_fsm_0/state\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axaddr_incr : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal axaddr_wrap : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal axsize : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal b_awid : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal b_awlen : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal b_push : STD_LOGIC;
  signal \bid_fifo_0/cnt_read\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \cmd_translator_0/incr_cmd_0/sel_first\ : STD_LOGIC;
  signal \cmd_translator_0/incr_cmd_0/sel_first_0\ : STD_LOGIC;
  signal \cmd_translator_0/wrap_cmd_0/axaddr_offset\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \cmd_translator_0/wrap_cmd_0/axaddr_offset_r\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal r_push : STD_LOGIC;
  signal r_rlast : STD_LOGIC;
  signal s_arid : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s_arid_r : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s_awid : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \^s_axi_arready\ : STD_LOGIC;
  signal sel_first : STD_LOGIC;
  signal shandshake : STD_LOGIC;
  signal si_rs_araddr : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal si_rs_arburst : STD_LOGIC_VECTOR ( 1 to 1 );
  signal si_rs_arlen : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal si_rs_arvalid : STD_LOGIC;
  signal si_rs_awaddr : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal si_rs_awburst : STD_LOGIC_VECTOR ( 1 to 1 );
  signal si_rs_awlen : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal si_rs_awvalid : STD_LOGIC;
  signal si_rs_bid : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal si_rs_bready : STD_LOGIC;
  signal si_rs_bresp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal si_rs_bvalid : STD_LOGIC;
  signal si_rs_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal si_rs_rid : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal si_rs_rlast : STD_LOGIC;
  signal si_rs_rready : STD_LOGIC;
  signal si_rs_rresp : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  s_axi_arready <= \^s_axi_arready\;
\RD.ar_channel_0\: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_ar_channel
     port map (
      D(6) => SI_REG_n_165,
      D(5) => SI_REG_n_166,
      D(4) => SI_REG_n_167,
      D(3) => SI_REG_n_168,
      D(2) => SI_REG_n_169,
      D(1) => SI_REG_n_170,
      D(0) => SI_REG_n_171,
      E(0) => \ar.ar_pipe/p_1_in\,
      \FSM_sequential_state_reg[0]\ => \RD.r_channel_0_n_1\,
      \FSM_sequential_state_reg[1]\ => \RD.ar_channel_0_n_4\,
      O(3) => SI_REG_n_152,
      O(2) => SI_REG_n_153,
      O(1) => SI_REG_n_154,
      O(0) => SI_REG_n_155,
      Q(1 downto 0) => \ar_cmd_fsm_0/state\(1 downto 0),
      S(3) => SI_REG_n_66,
      S(2) => SI_REG_n_67,
      S(1) => SI_REG_n_68,
      S(0) => SI_REG_n_69,
      aclk => aclk,
      areset_d1 => areset_d1,
      \axaddr_incr_reg[11]\(11) => \RD.ar_channel_0_n_17\,
      \axaddr_incr_reg[11]\(10) => \RD.ar_channel_0_n_18\,
      \axaddr_incr_reg[11]\(9) => \RD.ar_channel_0_n_19\,
      \axaddr_incr_reg[11]\(8) => \RD.ar_channel_0_n_20\,
      \axaddr_incr_reg[11]\(7) => \RD.ar_channel_0_n_21\,
      \axaddr_incr_reg[11]\(6) => \RD.ar_channel_0_n_22\,
      \axaddr_incr_reg[11]\(5) => \RD.ar_channel_0_n_23\,
      \axaddr_incr_reg[11]\(4) => \RD.ar_channel_0_n_24\,
      \axaddr_incr_reg[11]\(3) => \RD.ar_channel_0_n_25\,
      \axaddr_incr_reg[11]\(2) => \RD.ar_channel_0_n_26\,
      \axaddr_incr_reg[11]\(1) => \RD.ar_channel_0_n_27\,
      \axaddr_incr_reg[11]\(0) => \RD.ar_channel_0_n_28\,
      \axaddr_incr_reg[3]\(3) => SI_REG_n_8,
      \axaddr_incr_reg[3]\(2) => SI_REG_n_9,
      \axaddr_incr_reg[3]\(1) => SI_REG_n_10,
      \axaddr_incr_reg[3]\(0) => SI_REG_n_11,
      \axaddr_incr_reg[3]_0\(3) => SI_REG_n_144,
      \axaddr_incr_reg[3]_0\(2) => SI_REG_n_145,
      \axaddr_incr_reg[3]_0\(1) => SI_REG_n_146,
      \axaddr_incr_reg[3]_0\(0) => SI_REG_n_147,
      \axaddr_incr_reg[7]\(3) => SI_REG_n_148,
      \axaddr_incr_reg[7]\(2) => SI_REG_n_149,
      \axaddr_incr_reg[7]\(1) => SI_REG_n_150,
      \axaddr_incr_reg[7]\(0) => SI_REG_n_151,
      \axaddr_offset_r_reg[0]\ => SI_REG_n_175,
      \axaddr_offset_r_reg[1]\ => SI_REG_n_184,
      \axaddr_offset_r_reg[1]_0\ => SI_REG_n_173,
      \axaddr_offset_r_reg[2]\ => SI_REG_n_172,
      \axaddr_offset_r_reg[2]_0\ => SI_REG_n_174,
      \axaddr_offset_r_reg[3]\ => SI_REG_n_162,
      \axaddr_wrap_reg[11]\(11) => \RD.ar_channel_0_n_5\,
      \axaddr_wrap_reg[11]\(10) => \RD.ar_channel_0_n_6\,
      \axaddr_wrap_reg[11]\(9) => \RD.ar_channel_0_n_7\,
      \axaddr_wrap_reg[11]\(8) => \RD.ar_channel_0_n_8\,
      \axaddr_wrap_reg[11]\(7) => \RD.ar_channel_0_n_9\,
      \axaddr_wrap_reg[11]\(6) => \RD.ar_channel_0_n_10\,
      \axaddr_wrap_reg[11]\(5) => \RD.ar_channel_0_n_11\,
      \axaddr_wrap_reg[11]\(4) => \RD.ar_channel_0_n_12\,
      \axaddr_wrap_reg[11]\(3) => \RD.ar_channel_0_n_13\,
      \axaddr_wrap_reg[11]\(2) => \RD.ar_channel_0_n_14\,
      \axaddr_wrap_reg[11]\(1) => \RD.ar_channel_0_n_15\,
      \axaddr_wrap_reg[11]\(0) => \RD.ar_channel_0_n_16\,
      m_axi_arready => m_axi_arready,
      m_axi_arvalid => m_axi_arvalid,
      \m_payload_i_reg[3]\(3) => \RD.ar_channel_0_n_47\,
      \m_payload_i_reg[3]\(2) => \RD.ar_channel_0_n_48\,
      \m_payload_i_reg[3]\(1) => \RD.ar_channel_0_n_49\,
      \m_payload_i_reg[3]\(0) => \RD.ar_channel_0_n_50\,
      m_valid_i0 => \ar.ar_pipe/m_valid_i0\,
      next_pending_r_reg => SI_REG_n_163,
      r_push => r_push,
      r_rlast => r_rlast,
      \s_arid_r_reg[11]_0\(11 downto 0) => s_arid_r(11 downto 0),
      \s_arid_r_reg[11]_1\(30 downto 19) => s_arid(11 downto 0),
      \s_arid_r_reg[11]_1\(18 downto 15) => si_rs_arlen(3 downto 0),
      \s_arid_r_reg[11]_1\(14) => si_rs_arburst(1),
      \s_arid_r_reg[11]_1\(13) => SI_REG_n_29,
      \s_arid_r_reg[11]_1\(12) => SI_REG_n_30,
      \s_arid_r_reg[11]_1\(11 downto 0) => si_rs_araddr(11 downto 0),
      s_axi_arvalid => s_axi_arvalid,
      s_ready_i0 => \ar.ar_pipe/s_ready_i0\,
      s_ready_i_reg => \^s_axi_arready\,
      sel_first => \cmd_translator_0/incr_cmd_0/sel_first\,
      sel_first_reg => \RD.ar_channel_0_n_1\,
      si_rs_arvalid => si_rs_arvalid,
      \wrap_second_len_r_reg[3]\ => SI_REG_n_161
    );
\RD.r_channel_0\: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_r_channel
     port map (
      D(11 downto 0) => s_arid_r(11 downto 0),
      aclk => aclk,
      areset_d1 => areset_d1,
      \cnt_read_reg[2]\ => \RD.r_channel_0_n_0\,
      \cnt_read_reg[4]\ => \RD.r_channel_0_n_1\,
      \cnt_read_reg[4]_0\ => SI_REG_n_164,
      \in\(33 downto 0) => \in\(33 downto 0),
      m_axi_rready => m_axi_rready,
      m_axi_rvalid => m_axi_rvalid,
      \out\(33 downto 32) => si_rs_rresp(1 downto 0),
      \out\(31 downto 0) => si_rs_rdata(31 downto 0),
      r_push => r_push,
      r_push_r_reg_0(12 downto 1) => si_rs_rid(11 downto 0),
      r_push_r_reg_0(0) => si_rs_rlast,
      r_rlast => r_rlast,
      si_rs_rready => si_rs_rready
    );
SI_REG: entity work.dwa_ps_bd_axi_register_slice_v2_1_22_axi_register_slice
     port map (
      D(6) => SI_REG_n_165,
      D(5) => SI_REG_n_166,
      D(4) => SI_REG_n_167,
      D(3) => SI_REG_n_168,
      D(2) => SI_REG_n_169,
      D(1) => SI_REG_n_170,
      D(0) => SI_REG_n_171,
      E(0) => \WR.aw_channel_0_n_5\,
      \FSM_sequential_state_reg[0]\ => SI_REG_n_157,
      \FSM_sequential_state_reg[1]\ => SI_REG_n_161,
      \M00_AXI_0_araddr[11]\(11) => \RD.ar_channel_0_n_17\,
      \M00_AXI_0_araddr[11]\(10) => \RD.ar_channel_0_n_18\,
      \M00_AXI_0_araddr[11]\(9) => \RD.ar_channel_0_n_19\,
      \M00_AXI_0_araddr[11]\(8) => \RD.ar_channel_0_n_20\,
      \M00_AXI_0_araddr[11]\(7) => \RD.ar_channel_0_n_21\,
      \M00_AXI_0_araddr[11]\(6) => \RD.ar_channel_0_n_22\,
      \M00_AXI_0_araddr[11]\(5) => \RD.ar_channel_0_n_23\,
      \M00_AXI_0_araddr[11]\(4) => \RD.ar_channel_0_n_24\,
      \M00_AXI_0_araddr[11]\(3) => \RD.ar_channel_0_n_25\,
      \M00_AXI_0_araddr[11]\(2) => \RD.ar_channel_0_n_26\,
      \M00_AXI_0_araddr[11]\(1) => \RD.ar_channel_0_n_27\,
      \M00_AXI_0_araddr[11]\(0) => \RD.ar_channel_0_n_28\,
      \M00_AXI_0_araddr[11]_0\(11) => \RD.ar_channel_0_n_5\,
      \M00_AXI_0_araddr[11]_0\(10) => \RD.ar_channel_0_n_6\,
      \M00_AXI_0_araddr[11]_0\(9) => \RD.ar_channel_0_n_7\,
      \M00_AXI_0_araddr[11]_0\(8) => \RD.ar_channel_0_n_8\,
      \M00_AXI_0_araddr[11]_0\(7) => \RD.ar_channel_0_n_9\,
      \M00_AXI_0_araddr[11]_0\(6) => \RD.ar_channel_0_n_10\,
      \M00_AXI_0_araddr[11]_0\(5) => \RD.ar_channel_0_n_11\,
      \M00_AXI_0_araddr[11]_0\(4) => \RD.ar_channel_0_n_12\,
      \M00_AXI_0_araddr[11]_0\(3) => \RD.ar_channel_0_n_13\,
      \M00_AXI_0_araddr[11]_0\(2) => \RD.ar_channel_0_n_14\,
      \M00_AXI_0_araddr[11]_0\(1) => \RD.ar_channel_0_n_15\,
      \M00_AXI_0_araddr[11]_0\(0) => \RD.ar_channel_0_n_16\,
      \M00_AXI_0_araddr[11]_1\ => \RD.ar_channel_0_n_1\,
      \M00_AXI_0_awaddr[11]\(11) => \WR.aw_channel_0_n_19\,
      \M00_AXI_0_awaddr[11]\(10) => \WR.aw_channel_0_n_20\,
      \M00_AXI_0_awaddr[11]\(9) => \WR.aw_channel_0_n_21\,
      \M00_AXI_0_awaddr[11]\(8) => \WR.aw_channel_0_n_22\,
      \M00_AXI_0_awaddr[11]\(7) => \WR.aw_channel_0_n_23\,
      \M00_AXI_0_awaddr[11]\(6) => \WR.aw_channel_0_n_24\,
      \M00_AXI_0_awaddr[11]\(5) => \WR.aw_channel_0_n_25\,
      \M00_AXI_0_awaddr[11]\(4) => \WR.aw_channel_0_n_26\,
      \M00_AXI_0_awaddr[11]\(3) => \WR.aw_channel_0_n_27\,
      \M00_AXI_0_awaddr[11]\(2) => \WR.aw_channel_0_n_28\,
      \M00_AXI_0_awaddr[11]\(1) => \WR.aw_channel_0_n_29\,
      \M00_AXI_0_awaddr[11]\(0) => \WR.aw_channel_0_n_30\,
      \M00_AXI_0_awaddr[11]_0\(11 downto 0) => axaddr_wrap(11 downto 0),
      O(3) => SI_REG_n_152,
      O(2) => SI_REG_n_153,
      O(1) => SI_REG_n_154,
      O(0) => SI_REG_n_155,
      Q(53 downto 42) => s_arid(11 downto 0),
      Q(41 downto 38) => si_rs_arlen(3 downto 0),
      Q(37) => si_rs_arburst(1),
      Q(36) => SI_REG_n_29,
      Q(35) => SI_REG_n_30,
      Q(34 downto 12) => \m_payload_i_reg[34]\(22 downto 0),
      Q(11 downto 0) => si_rs_araddr(11 downto 0),
      S(3) => SI_REG_n_66,
      S(2) => SI_REG_n_67,
      S(1) => SI_REG_n_68,
      S(0) => SI_REG_n_69,
      aclk => aclk,
      aresetn => aresetn,
      axaddr_incr(11 downto 0) => axaddr_incr(11 downto 0),
      \axaddr_incr_reg[3]\(3) => SI_REG_n_8,
      \axaddr_incr_reg[3]\(2) => SI_REG_n_9,
      \axaddr_incr_reg[3]\(1) => SI_REG_n_10,
      \axaddr_incr_reg[3]\(0) => SI_REG_n_11,
      \axaddr_incr_reg[3]_0\(3) => SI_REG_n_70,
      \axaddr_incr_reg[3]_0\(2) => SI_REG_n_71,
      \axaddr_incr_reg[3]_0\(1) => SI_REG_n_72,
      \axaddr_incr_reg[3]_0\(0) => SI_REG_n_73,
      \axaddr_incr_reg[3]_1\(3) => \WR.aw_channel_0_n_49\,
      \axaddr_incr_reg[3]_1\(2) => \WR.aw_channel_0_n_50\,
      \axaddr_incr_reg[3]_1\(1) => \WR.aw_channel_0_n_51\,
      \axaddr_incr_reg[3]_1\(0) => \WR.aw_channel_0_n_52\,
      \axaddr_incr_reg[3]_2\(3) => \RD.ar_channel_0_n_47\,
      \axaddr_incr_reg[3]_2\(2) => \RD.ar_channel_0_n_48\,
      \axaddr_incr_reg[3]_2\(1) => \RD.ar_channel_0_n_49\,
      \axaddr_incr_reg[3]_2\(0) => \RD.ar_channel_0_n_50\,
      axaddr_offset(0) => \cmd_translator_0/wrap_cmd_0/axaddr_offset\(2),
      \axaddr_offset_r_reg[2]\(1 downto 0) => \aw_cmd_fsm_0/state\(1 downto 0),
      \axaddr_offset_r_reg[2]_0\(0) => \cmd_translator_0/wrap_cmd_0/axaddr_offset_r\(2),
      \axaddr_wrap_reg[3]\(3) => SI_REG_n_128,
      \axaddr_wrap_reg[3]\(2) => SI_REG_n_129,
      \axaddr_wrap_reg[3]\(1) => SI_REG_n_130,
      \axaddr_wrap_reg[3]\(0) => SI_REG_n_131,
      b_push => b_push,
      m_axi_araddr(11 downto 0) => m_axi_araddr(11 downto 0),
      m_axi_awaddr(11 downto 0) => m_axi_awaddr(11 downto 0),
      \m_payload_i_reg[0]\(0) => \ar.ar_pipe/p_1_in\,
      \m_payload_i_reg[13]\(13 downto 0) => \m_payload_i_reg[13]\(13 downto 0),
      \m_payload_i_reg[1]\ => SI_REG_n_173,
      \m_payload_i_reg[1]_0\ => SI_REG_n_175,
      \m_payload_i_reg[1]_1\ => SI_REG_n_183,
      \m_payload_i_reg[1]_2\ => SI_REG_n_185,
      \m_payload_i_reg[2]\ => SI_REG_n_174,
      \m_payload_i_reg[2]_0\ => SI_REG_n_184,
      \m_payload_i_reg[2]_1\ => SI_REG_n_186,
      \m_payload_i_reg[3]\(3) => SI_REG_n_144,
      \m_payload_i_reg[3]\(2) => SI_REG_n_145,
      \m_payload_i_reg[3]\(1) => SI_REG_n_146,
      \m_payload_i_reg[3]\(0) => SI_REG_n_147,
      \m_payload_i_reg[45]\ => SI_REG_n_156,
      \m_payload_i_reg[45]_0\ => SI_REG_n_163,
      \m_payload_i_reg[46]\(46 downto 0) => \m_payload_i_reg[46]\(46 downto 0),
      \m_payload_i_reg[4]\ => SI_REG_n_172,
      \m_payload_i_reg[5]\ => SI_REG_n_162,
      \m_payload_i_reg[61]\(53 downto 42) => s_awid(11 downto 0),
      \m_payload_i_reg[61]\(41 downto 38) => si_rs_awlen(3 downto 0),
      \m_payload_i_reg[61]\(37) => si_rs_awburst(1),
      \m_payload_i_reg[61]\(36 downto 35) => axsize(1 downto 0),
      \m_payload_i_reg[61]\(34 downto 12) => Q(22 downto 0),
      \m_payload_i_reg[61]\(11 downto 0) => si_rs_awaddr(11 downto 0),
      \m_payload_i_reg[6]\ => SI_REG_n_158,
      \m_payload_i_reg[6]_0\(6) => SI_REG_n_176,
      \m_payload_i_reg[6]_0\(5) => SI_REG_n_177,
      \m_payload_i_reg[6]_0\(4) => SI_REG_n_178,
      \m_payload_i_reg[6]_0\(3) => SI_REG_n_179,
      \m_payload_i_reg[6]_0\(2) => SI_REG_n_180,
      \m_payload_i_reg[6]_0\(1) => SI_REG_n_181,
      \m_payload_i_reg[6]_0\(0) => SI_REG_n_182,
      \m_payload_i_reg[7]\(3) => SI_REG_n_148,
      \m_payload_i_reg[7]\(2) => SI_REG_n_149,
      \m_payload_i_reg[7]\(1) => SI_REG_n_150,
      \m_payload_i_reg[7]\(0) => SI_REG_n_151,
      m_valid_i0 => \ar.ar_pipe/m_valid_i0\,
      m_valid_i_reg => s_axi_bvalid,
      m_valid_i_reg_0 => s_axi_rvalid,
      m_valid_i_reg_1 => \RD.r_channel_0_n_0\,
      next_pending_r_reg => \WR.aw_channel_0_n_4\,
      next_pending_r_reg_0 => \RD.ar_channel_0_n_4\,
      \out\(11 downto 0) => si_rs_bid(11 downto 0),
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_arid(11 downto 0) => s_axi_arid(11 downto 0),
      s_axi_arlen(3 downto 0) => s_axi_arlen(3 downto 0),
      s_axi_arprot(2 downto 0) => s_axi_arprot(2 downto 0),
      s_axi_arsize(1 downto 0) => s_axi_arsize(1 downto 0),
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awid(11 downto 0) => s_axi_awid(11 downto 0),
      s_axi_awlen(3 downto 0) => s_axi_awlen(3 downto 0),
      s_axi_awprot(2 downto 0) => s_axi_awprot(2 downto 0),
      s_axi_awsize(1 downto 0) => s_axi_awsize(1 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_rready => s_axi_rready,
      s_ready_i0 => \ar.ar_pipe/s_ready_i0\,
      s_ready_i_reg => s_axi_awready,
      s_ready_i_reg_0 => \^s_axi_arready\,
      s_ready_i_reg_1 => SI_REG_n_164,
      sel_first => sel_first,
      sel_first_0 => \cmd_translator_0/incr_cmd_0/sel_first_0\,
      sel_first_1 => \cmd_translator_0/incr_cmd_0/sel_first\,
      shandshake => shandshake,
      si_rs_arvalid => si_rs_arvalid,
      si_rs_awvalid => si_rs_awvalid,
      si_rs_bready => si_rs_bready,
      si_rs_bvalid => si_rs_bvalid,
      si_rs_rready => si_rs_rready,
      \skid_buffer_reg[1]\(1 downto 0) => si_rs_bresp(1 downto 0),
      \skid_buffer_reg[33]\(33 downto 32) => si_rs_rresp(1 downto 0),
      \skid_buffer_reg[33]\(31 downto 0) => si_rs_rdata(31 downto 0),
      \skid_buffer_reg[46]\(12 downto 1) => si_rs_rid(11 downto 0),
      \skid_buffer_reg[46]\(0) => si_rs_rlast,
      \wrap_second_len_r_reg[3]\(1 downto 0) => \ar_cmd_fsm_0/state\(1 downto 0)
    );
\WR.aw_channel_0\: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_aw_channel
     port map (
      D(6) => SI_REG_n_176,
      D(5) => SI_REG_n_177,
      D(4) => SI_REG_n_178,
      D(3) => SI_REG_n_179,
      D(2) => SI_REG_n_180,
      D(1) => SI_REG_n_181,
      D(0) => SI_REG_n_182,
      E(0) => \WR.aw_channel_0_n_5\,
      \FSM_sequential_state_reg[0]\ => \WR.aw_channel_0_n_4\,
      Q(1 downto 0) => \aw_cmd_fsm_0/state\(1 downto 0),
      aclk => aclk,
      areset_d1 => areset_d1,
      axaddr_incr(11 downto 0) => axaddr_incr(11 downto 0),
      \axaddr_incr_reg[11]\(11) => \WR.aw_channel_0_n_19\,
      \axaddr_incr_reg[11]\(10) => \WR.aw_channel_0_n_20\,
      \axaddr_incr_reg[11]\(9) => \WR.aw_channel_0_n_21\,
      \axaddr_incr_reg[11]\(8) => \WR.aw_channel_0_n_22\,
      \axaddr_incr_reg[11]\(7) => \WR.aw_channel_0_n_23\,
      \axaddr_incr_reg[11]\(6) => \WR.aw_channel_0_n_24\,
      \axaddr_incr_reg[11]\(5) => \WR.aw_channel_0_n_25\,
      \axaddr_incr_reg[11]\(4) => \WR.aw_channel_0_n_26\,
      \axaddr_incr_reg[11]\(3) => \WR.aw_channel_0_n_27\,
      \axaddr_incr_reg[11]\(2) => \WR.aw_channel_0_n_28\,
      \axaddr_incr_reg[11]\(1) => \WR.aw_channel_0_n_29\,
      \axaddr_incr_reg[11]\(0) => \WR.aw_channel_0_n_30\,
      \axaddr_incr_reg[3]\(3) => SI_REG_n_70,
      \axaddr_incr_reg[3]\(2) => SI_REG_n_71,
      \axaddr_incr_reg[3]\(1) => SI_REG_n_72,
      \axaddr_incr_reg[3]\(0) => SI_REG_n_73,
      \axaddr_offset_r_reg[0]\ => SI_REG_n_183,
      \axaddr_offset_r_reg[1]\ => SI_REG_n_186,
      \axaddr_offset_r_reg[1]_0\ => SI_REG_n_185,
      \axaddr_offset_r_reg[2]\(0) => \cmd_translator_0/wrap_cmd_0/axaddr_offset_r\(2),
      \axaddr_offset_r_reg[2]_0\(0) => \cmd_translator_0/wrap_cmd_0/axaddr_offset\(2),
      \axaddr_offset_r_reg[3]\ => SI_REG_n_158,
      \axaddr_wrap_reg[11]\(11 downto 0) => axaddr_wrap(11 downto 0),
      \axaddr_wrap_reg[3]\(3) => SI_REG_n_128,
      \axaddr_wrap_reg[3]\(2) => SI_REG_n_129,
      \axaddr_wrap_reg[3]\(1) => SI_REG_n_130,
      \axaddr_wrap_reg[3]\(0) => SI_REG_n_131,
      b_push => b_push,
      cnt_read(1 downto 0) => \bid_fifo_0/cnt_read\(1 downto 0),
      \in\(15 downto 4) => b_awid(11 downto 0),
      \in\(3 downto 0) => b_awlen(3 downto 0),
      m_axi_awready => m_axi_awready,
      m_axi_awvalid => m_axi_awvalid,
      \m_payload_i_reg[3]\(3) => \WR.aw_channel_0_n_49\,
      \m_payload_i_reg[3]\(2) => \WR.aw_channel_0_n_50\,
      \m_payload_i_reg[3]\(1) => \WR.aw_channel_0_n_51\,
      \m_payload_i_reg[3]\(0) => \WR.aw_channel_0_n_52\,
      next_pending_r_reg => SI_REG_n_156,
      \s_awid_r_reg[11]_0\(30 downto 19) => s_awid(11 downto 0),
      \s_awid_r_reg[11]_0\(18 downto 15) => si_rs_awlen(3 downto 0),
      \s_awid_r_reg[11]_0\(14) => si_rs_awburst(1),
      \s_awid_r_reg[11]_0\(13 downto 12) => axsize(1 downto 0),
      \s_awid_r_reg[11]_0\(11 downto 0) => si_rs_awaddr(11 downto 0),
      sel_first => sel_first,
      sel_first_0 => \cmd_translator_0/incr_cmd_0/sel_first_0\,
      si_rs_awvalid => si_rs_awvalid,
      \wrap_second_len_r_reg[3]\ => SI_REG_n_157
    );
\WR.b_channel_0\: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s_b_channel
     port map (
      aclk => aclk,
      areset_d1 => areset_d1,
      b_push => b_push,
      cnt_read(1 downto 0) => \bid_fifo_0/cnt_read\(1 downto 0),
      \in\(15 downto 4) => b_awid(11 downto 0),
      \in\(3 downto 0) => b_awlen(3 downto 0),
      m_axi_bready => m_axi_bready,
      m_axi_bresp(1 downto 0) => m_axi_bresp(1 downto 0),
      m_axi_bvalid => m_axi_bvalid,
      \out\(11 downto 0) => si_rs_bid(11 downto 0),
      \s_bresp_acc_reg[1]_0\(1 downto 0) => si_rs_bresp(1 downto 0),
      shandshake => shandshake,
      si_rs_bready => si_rs_bready,
      si_rs_bvalid => si_rs_bvalid
    );
areset_d1_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aresetn,
      O => areset_d1_i_1_n_0
    );
areset_d1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => areset_d1_i_1_n_0,
      Q => areset_d1,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_dwa_ps_bd_rst_ps7_0_100M_1 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of dwa_ps_bd_dwa_ps_bd_rst_ps7_0_100M_1 : entity is "dwa_ps_bd_rst_ps7_0_100M_1,proc_sys_reset,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of dwa_ps_bd_dwa_ps_bd_rst_ps7_0_100M_1 : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_dwa_ps_bd_rst_ps7_0_100M_1 : entity is "dwa_ps_bd_rst_ps7_0_100M_1";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of dwa_ps_bd_dwa_ps_bd_rst_ps7_0_100M_1 : entity is "proc_sys_reset,Vivado 2020.2";
end dwa_ps_bd_dwa_ps_bd_rst_ps7_0_100M_1;

architecture STRUCTURE of dwa_ps_bd_dwa_ps_bd_rst_ps7_0_100M_1 is
  signal \<const0>\ : STD_LOGIC;
  signal NLW_U0_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_AUX_RESET_HIGH : string;
  attribute C_AUX_RESET_HIGH of U0 : label is "1'b0";
  attribute C_AUX_RST_WIDTH : integer;
  attribute C_AUX_RST_WIDTH of U0 : label is 4;
  attribute C_EXT_RESET_HIGH : string;
  attribute C_EXT_RESET_HIGH of U0 : label is "1'b0";
  attribute C_EXT_RST_WIDTH : integer;
  attribute C_EXT_RST_WIDTH of U0 : label is 4;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "zynq";
  attribute C_NUM_BUS_RST : integer;
  attribute C_NUM_BUS_RST of U0 : label is 1;
  attribute C_NUM_INTERCONNECT_ARESETN : integer;
  attribute C_NUM_INTERCONNECT_ARESETN of U0 : label is 1;
  attribute C_NUM_PERP_ARESETN : integer;
  attribute C_NUM_PERP_ARESETN of U0 : label is 1;
  attribute C_NUM_PERP_RST : integer;
  attribute C_NUM_PERP_RST of U0 : label is 1;
  attribute x_interface_info : string;
  attribute x_interface_info of aux_reset_in : signal is "xilinx.com:signal:reset:1.0 aux_reset RST";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of aux_reset_in : signal is "XIL_INTERFACENAME aux_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of ext_reset_in : signal is "xilinx.com:signal:reset:1.0 ext_reset RST";
  attribute x_interface_parameter of ext_reset_in : signal is "XIL_INTERFACENAME ext_reset, BOARD.ASSOCIATED_PARAM RESET_BOARD_INTERFACE, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of mb_debug_sys_rst : signal is "xilinx.com:signal:reset:1.0 dbg_reset RST";
  attribute x_interface_parameter of mb_debug_sys_rst : signal is "XIL_INTERFACENAME dbg_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute x_interface_info of mb_reset : signal is "xilinx.com:signal:reset:1.0 mb_rst RST";
  attribute x_interface_parameter of mb_reset : signal is "XIL_INTERFACENAME mb_rst, POLARITY ACTIVE_HIGH, TYPE PROCESSOR, INSERT_VIP 0";
  attribute x_interface_info of slowest_sync_clk : signal is "xilinx.com:signal:clock:1.0 clock CLK";
  attribute x_interface_parameter of slowest_sync_clk : signal is "XIL_INTERFACENAME clock, ASSOCIATED_RESET mb_reset:bus_struct_reset:interconnect_aresetn:peripheral_aresetn:peripheral_reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of bus_struct_reset : signal is "xilinx.com:signal:reset:1.0 bus_struct_reset RST";
  attribute x_interface_parameter of bus_struct_reset : signal is "XIL_INTERFACENAME bus_struct_reset, POLARITY ACTIVE_HIGH, TYPE INTERCONNECT, INSERT_VIP 0";
  attribute x_interface_info of interconnect_aresetn : signal is "xilinx.com:signal:reset:1.0 interconnect_low_rst RST";
  attribute x_interface_parameter of interconnect_aresetn : signal is "XIL_INTERFACENAME interconnect_low_rst, POLARITY ACTIVE_LOW, TYPE INTERCONNECT, INSERT_VIP 0";
  attribute x_interface_info of peripheral_aresetn : signal is "xilinx.com:signal:reset:1.0 peripheral_low_rst RST";
  attribute x_interface_parameter of peripheral_aresetn : signal is "XIL_INTERFACENAME peripheral_low_rst, POLARITY ACTIVE_LOW, TYPE PERIPHERAL, INSERT_VIP 0";
  attribute x_interface_info of peripheral_reset : signal is "xilinx.com:signal:reset:1.0 peripheral_high_rst RST";
  attribute x_interface_parameter of peripheral_reset : signal is "XIL_INTERFACENAME peripheral_high_rst, POLARITY ACTIVE_HIGH, TYPE PERIPHERAL, INSERT_VIP 0";
begin
  bus_struct_reset(0) <= \<const0>\;
  mb_reset <= \<const0>\;
  peripheral_reset(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.dwa_ps_bd_proc_sys_reset
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_U0_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => ext_reset_in,
      interconnect_aresetn(0) => interconnect_aresetn(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_U0_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => peripheral_aresetn(0),
      peripheral_reset(0) => NLW_U0_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => slowest_sync_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_axi_protocol_converter_v2_1_22_axi_protocol_converter is
  port (
    s_axi_rvalid : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 22 downto 0 );
    s_axi_arready : out STD_LOGIC;
    \m_payload_i_reg[34]\ : out STD_LOGIC_VECTOR ( 22 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    \m_payload_i_reg[13]\ : out STD_LOGIC_VECTOR ( 13 downto 0 );
    \m_payload_i_reg[46]\ : out STD_LOGIC_VECTOR ( 46 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arvalid : out STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_arready : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    aclk : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 33 downto 0 );
    s_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awready : in STD_LOGIC;
    m_axi_bvalid : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_axi_protocol_converter_v2_1_22_axi_protocol_converter : entity is "axi_protocol_converter_v2_1_22_axi_protocol_converter";
end dwa_ps_bd_axi_protocol_converter_v2_1_22_axi_protocol_converter;

architecture STRUCTURE of dwa_ps_bd_axi_protocol_converter_v2_1_22_axi_protocol_converter is
begin
\gen_axilite.gen_b2s_conv.axilite_b2s\: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_b2s
     port map (
      Q(22 downto 0) => Q(22 downto 0),
      aclk => aclk,
      aresetn => aresetn,
      \in\(33 downto 0) => \in\(33 downto 0),
      m_axi_araddr(11 downto 0) => m_axi_araddr(11 downto 0),
      m_axi_arready => m_axi_arready,
      m_axi_arvalid => m_axi_arvalid,
      m_axi_awaddr(11 downto 0) => m_axi_awaddr(11 downto 0),
      m_axi_awready => m_axi_awready,
      m_axi_awvalid => m_axi_awvalid,
      m_axi_bready => m_axi_bready,
      m_axi_bresp(1 downto 0) => m_axi_bresp(1 downto 0),
      m_axi_bvalid => m_axi_bvalid,
      m_axi_rready => m_axi_rready,
      m_axi_rvalid => m_axi_rvalid,
      \m_payload_i_reg[13]\(13 downto 0) => \m_payload_i_reg[13]\(13 downto 0),
      \m_payload_i_reg[34]\(22 downto 0) => \m_payload_i_reg[34]\(22 downto 0),
      \m_payload_i_reg[46]\(46 downto 0) => \m_payload_i_reg[46]\(46 downto 0),
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_arid(11 downto 0) => s_axi_arid(11 downto 0),
      s_axi_arlen(3 downto 0) => s_axi_arlen(3 downto 0),
      s_axi_arprot(2 downto 0) => s_axi_arprot(2 downto 0),
      s_axi_arready => s_axi_arready,
      s_axi_arsize(1 downto 0) => s_axi_arsize(1 downto 0),
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awid(11 downto 0) => s_axi_awid(11 downto 0),
      s_axi_awlen(3 downto 0) => s_axi_awlen(3 downto 0),
      s_axi_awprot(2 downto 0) => s_axi_awprot(2 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awsize(1 downto 0) => s_axi_awsize(1 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rready => s_axi_rready,
      s_axi_rvalid => s_axi_rvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_dwa_ps_bd_auto_pc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of dwa_ps_bd_dwa_ps_bd_auto_pc_0 : entity is "dwa_ps_bd_auto_pc_0,axi_protocol_converter_v2_1_22_axi_protocol_converter,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of dwa_ps_bd_dwa_ps_bd_auto_pc_0 : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_dwa_ps_bd_auto_pc_0 : entity is "dwa_ps_bd_auto_pc_0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of dwa_ps_bd_dwa_ps_bd_auto_pc_0 : entity is "axi_protocol_converter_v2_1_22_axi_protocol_converter,Vivado 2020.2";
end dwa_ps_bd_dwa_ps_bd_auto_pc_0;

architecture STRUCTURE of dwa_ps_bd_dwa_ps_bd_auto_pc_0 is
  signal \^m_axi_wready\ : STD_LOGIC;
  signal \^s_axi_wdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s_axi_wstrb\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^s_axi_wvalid\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of aclk : signal is "xilinx.com:signal:clock:1.0 CLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of aclk : signal is "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, ASSOCIATED_BUSIF S_AXI:M_AXI, ASSOCIATED_RESET ARESETN, INSERT_VIP 0";
  attribute x_interface_info of aresetn : signal is "xilinx.com:signal:reset:1.0 RST RST";
  attribute x_interface_parameter of aresetn : signal is "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, INSERT_VIP 0, TYPE INTERCONNECT";
  attribute x_interface_info of m_axi_arready : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARREADY";
  attribute x_interface_info of m_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARVALID";
  attribute x_interface_info of m_axi_awready : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWREADY";
  attribute x_interface_info of m_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWVALID";
  attribute x_interface_info of m_axi_bready : signal is "xilinx.com:interface:aximm:1.0 M_AXI BREADY";
  attribute x_interface_info of m_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI BVALID";
  attribute x_interface_info of m_axi_rready : signal is "xilinx.com:interface:aximm:1.0 M_AXI RREADY";
  attribute x_interface_parameter of m_axi_rready : signal is "XIL_INTERFACENAME M_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of m_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI RVALID";
  attribute x_interface_info of m_axi_wready : signal is "xilinx.com:interface:aximm:1.0 M_AXI WREADY";
  attribute x_interface_info of m_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI WVALID";
  attribute x_interface_info of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute x_interface_info of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute x_interface_info of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute x_interface_info of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute x_interface_info of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute x_interface_info of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute x_interface_info of s_axi_rlast : signal is "xilinx.com:interface:aximm:1.0 S_AXI RLAST";
  attribute x_interface_info of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute x_interface_parameter of s_axi_rready : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI3, FREQ_HZ 100000000, ID_WIDTH 12, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 16, PHASE 0.000, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute x_interface_info of s_axi_wlast : signal is "xilinx.com:interface:aximm:1.0 S_AXI WLAST";
  attribute x_interface_info of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute x_interface_info of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute x_interface_info of m_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARADDR";
  attribute x_interface_info of m_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARPROT";
  attribute x_interface_info of m_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWADDR";
  attribute x_interface_info of m_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWPROT";
  attribute x_interface_info of m_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 M_AXI BRESP";
  attribute x_interface_info of m_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 M_AXI RDATA";
  attribute x_interface_info of m_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 M_AXI RRESP";
  attribute x_interface_info of m_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 M_AXI WDATA";
  attribute x_interface_info of m_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 M_AXI WSTRB";
  attribute x_interface_info of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute x_interface_info of s_axi_arburst : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARBURST";
  attribute x_interface_info of s_axi_arcache : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE";
  attribute x_interface_info of s_axi_arid : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARID";
  attribute x_interface_info of s_axi_arlen : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARLEN";
  attribute x_interface_info of s_axi_arlock : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK";
  attribute x_interface_info of s_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARPROT";
  attribute x_interface_info of s_axi_arqos : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARQOS";
  attribute x_interface_info of s_axi_arsize : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE";
  attribute x_interface_info of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute x_interface_info of s_axi_awburst : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWBURST";
  attribute x_interface_info of s_axi_awcache : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE";
  attribute x_interface_info of s_axi_awid : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWID";
  attribute x_interface_info of s_axi_awlen : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWLEN";
  attribute x_interface_info of s_axi_awlock : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK";
  attribute x_interface_info of s_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWPROT";
  attribute x_interface_info of s_axi_awqos : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWQOS";
  attribute x_interface_info of s_axi_awsize : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE";
  attribute x_interface_info of s_axi_bid : signal is "xilinx.com:interface:aximm:1.0 S_AXI BID";
  attribute x_interface_info of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute x_interface_info of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute x_interface_info of s_axi_rid : signal is "xilinx.com:interface:aximm:1.0 S_AXI RID";
  attribute x_interface_info of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute x_interface_info of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute x_interface_info of s_axi_wid : signal is "xilinx.com:interface:aximm:1.0 S_AXI WID";
  attribute x_interface_info of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
begin
  \^m_axi_wready\ <= m_axi_wready;
  \^s_axi_wdata\(31 downto 0) <= s_axi_wdata(31 downto 0);
  \^s_axi_wstrb\(3 downto 0) <= s_axi_wstrb(3 downto 0);
  \^s_axi_wvalid\ <= s_axi_wvalid;
  m_axi_wdata(31 downto 0) <= \^s_axi_wdata\(31 downto 0);
  m_axi_wstrb(3 downto 0) <= \^s_axi_wstrb\(3 downto 0);
  m_axi_wvalid <= \^s_axi_wvalid\;
  s_axi_wready <= \^m_axi_wready\;
inst: entity work.dwa_ps_bd_axi_protocol_converter_v2_1_22_axi_protocol_converter
     port map (
      Q(22 downto 20) => m_axi_awprot(2 downto 0),
      Q(19 downto 0) => m_axi_awaddr(31 downto 12),
      aclk => aclk,
      aresetn => aresetn,
      \in\(33 downto 32) => m_axi_rresp(1 downto 0),
      \in\(31 downto 0) => m_axi_rdata(31 downto 0),
      m_axi_araddr(11 downto 0) => m_axi_araddr(11 downto 0),
      m_axi_arready => m_axi_arready,
      m_axi_arvalid => m_axi_arvalid,
      m_axi_awaddr(11 downto 0) => m_axi_awaddr(11 downto 0),
      m_axi_awready => m_axi_awready,
      m_axi_awvalid => m_axi_awvalid,
      m_axi_bready => m_axi_bready,
      m_axi_bresp(1 downto 0) => m_axi_bresp(1 downto 0),
      m_axi_bvalid => m_axi_bvalid,
      m_axi_rready => m_axi_rready,
      m_axi_rvalid => m_axi_rvalid,
      \m_payload_i_reg[13]\(13 downto 2) => s_axi_bid(11 downto 0),
      \m_payload_i_reg[13]\(1 downto 0) => s_axi_bresp(1 downto 0),
      \m_payload_i_reg[34]\(22 downto 20) => m_axi_arprot(2 downto 0),
      \m_payload_i_reg[34]\(19 downto 0) => m_axi_araddr(31 downto 12),
      \m_payload_i_reg[46]\(46 downto 35) => s_axi_rid(11 downto 0),
      \m_payload_i_reg[46]\(34) => s_axi_rlast,
      \m_payload_i_reg[46]\(33 downto 32) => s_axi_rresp(1 downto 0),
      \m_payload_i_reg[46]\(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_arid(11 downto 0) => s_axi_arid(11 downto 0),
      s_axi_arlen(3 downto 0) => s_axi_arlen(3 downto 0),
      s_axi_arprot(2 downto 0) => s_axi_arprot(2 downto 0),
      s_axi_arready => s_axi_arready,
      s_axi_arsize(1 downto 0) => s_axi_arsize(1 downto 0),
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awid(11 downto 0) => s_axi_awid(11 downto 0),
      s_axi_awlen(3 downto 0) => s_axi_awlen(3 downto 0),
      s_axi_awprot(2 downto 0) => s_axi_awprot(2 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awsize(1 downto 0) => s_axi_awsize(1 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rready => s_axi_rready,
      s_axi_rvalid => s_axi_rvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_s00_couplers_imp_166NYF5 is
  port (
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_s00_couplers_imp_166NYF5 : entity is "s00_couplers_imp_166NYF5";
end dwa_ps_bd_s00_couplers_imp_166NYF5;

architecture STRUCTURE of dwa_ps_bd_s00_couplers_imp_166NYF5 is
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of auto_pc : label is "dwa_ps_bd_auto_pc_0,axi_protocol_converter_v2_1_22_axi_protocol_converter,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of auto_pc : label is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of auto_pc : label is "axi_protocol_converter_v2_1_22_axi_protocol_converter,Vivado 2020.2";
begin
auto_pc: entity work.dwa_ps_bd_dwa_ps_bd_auto_pc_0
     port map (
      aclk => S00_ACLK,
      aresetn => S00_ARESETN,
      m_axi_araddr(31 downto 0) => M00_AXI_araddr(31 downto 0),
      m_axi_arprot(2 downto 0) => M00_AXI_arprot(2 downto 0),
      m_axi_arready => M00_AXI_arready,
      m_axi_arvalid => M00_AXI_arvalid,
      m_axi_awaddr(31 downto 0) => M00_AXI_awaddr(31 downto 0),
      m_axi_awprot(2 downto 0) => M00_AXI_awprot(2 downto 0),
      m_axi_awready => M00_AXI_awready,
      m_axi_awvalid => M00_AXI_awvalid,
      m_axi_bready => M00_AXI_bready,
      m_axi_bresp(1 downto 0) => M00_AXI_bresp(1 downto 0),
      m_axi_bvalid => M00_AXI_bvalid,
      m_axi_rdata(31 downto 0) => M00_AXI_rdata(31 downto 0),
      m_axi_rready => M00_AXI_rready,
      m_axi_rresp(1 downto 0) => M00_AXI_rresp(1 downto 0),
      m_axi_rvalid => M00_AXI_rvalid,
      m_axi_wdata(31 downto 0) => M00_AXI_wdata(31 downto 0),
      m_axi_wready => M00_AXI_wready,
      m_axi_wstrb(3 downto 0) => M00_AXI_wstrb(3 downto 0),
      m_axi_wvalid => M00_AXI_wvalid,
      s_axi_araddr(31 downto 0) => S00_AXI_araddr(31 downto 0),
      s_axi_arburst(1 downto 0) => S00_AXI_arburst(1 downto 0),
      s_axi_arcache(3 downto 0) => B"0000",
      s_axi_arid(11 downto 0) => S00_AXI_arid(11 downto 0),
      s_axi_arlen(3 downto 0) => S00_AXI_arlen(3 downto 0),
      s_axi_arlock(1 downto 0) => B"00",
      s_axi_arprot(2 downto 0) => S00_AXI_arprot(2 downto 0),
      s_axi_arqos(3 downto 0) => B"0000",
      s_axi_arready => S00_AXI_arready,
      s_axi_arsize(2) => '0',
      s_axi_arsize(1 downto 0) => S00_AXI_arsize(1 downto 0),
      s_axi_arvalid => S00_AXI_arvalid,
      s_axi_awaddr(31 downto 0) => S00_AXI_awaddr(31 downto 0),
      s_axi_awburst(1 downto 0) => S00_AXI_awburst(1 downto 0),
      s_axi_awcache(3 downto 0) => B"0000",
      s_axi_awid(11 downto 0) => S00_AXI_awid(11 downto 0),
      s_axi_awlen(3 downto 0) => S00_AXI_awlen(3 downto 0),
      s_axi_awlock(1 downto 0) => B"00",
      s_axi_awprot(2 downto 0) => S00_AXI_awprot(2 downto 0),
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => S00_AXI_awready,
      s_axi_awsize(2) => '0',
      s_axi_awsize(1 downto 0) => S00_AXI_awsize(1 downto 0),
      s_axi_awvalid => S00_AXI_awvalid,
      s_axi_bid(11 downto 0) => S00_AXI_bid(11 downto 0),
      s_axi_bready => S00_AXI_bready,
      s_axi_bresp(1 downto 0) => S00_AXI_bresp(1 downto 0),
      s_axi_bvalid => S00_AXI_bvalid,
      s_axi_rdata(31 downto 0) => S00_AXI_rdata(31 downto 0),
      s_axi_rid(11 downto 0) => S00_AXI_rid(11 downto 0),
      s_axi_rlast => S00_AXI_rlast,
      s_axi_rready => S00_AXI_rready,
      s_axi_rresp(1 downto 0) => S00_AXI_rresp(1 downto 0),
      s_axi_rvalid => S00_AXI_rvalid,
      s_axi_wdata(31 downto 0) => S00_AXI_wdata(31 downto 0),
      s_axi_wid(11 downto 0) => B"000000000000",
      s_axi_wlast => '0',
      s_axi_wready => S00_AXI_wready,
      s_axi_wstrb(3 downto 0) => S00_AXI_wstrb(3 downto 0),
      s_axi_wvalid => S00_AXI_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd_dwa_ps_bd_ps7_0_axi_periph_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dwa_ps_bd_dwa_ps_bd_ps7_0_axi_periph_0 : entity is "dwa_ps_bd_ps7_0_axi_periph_0";
end dwa_ps_bd_dwa_ps_bd_ps7_0_axi_periph_0;

architecture STRUCTURE of dwa_ps_bd_dwa_ps_bd_ps7_0_axi_periph_0 is
begin
s00_couplers: entity work.dwa_ps_bd_s00_couplers_imp_166NYF5
     port map (
      M00_AXI_araddr(31 downto 0) => M00_AXI_araddr(31 downto 0),
      M00_AXI_arprot(2 downto 0) => M00_AXI_arprot(2 downto 0),
      M00_AXI_arready => M00_AXI_arready,
      M00_AXI_arvalid => M00_AXI_arvalid,
      M00_AXI_awaddr(31 downto 0) => M00_AXI_awaddr(31 downto 0),
      M00_AXI_awprot(2 downto 0) => M00_AXI_awprot(2 downto 0),
      M00_AXI_awready => M00_AXI_awready,
      M00_AXI_awvalid => M00_AXI_awvalid,
      M00_AXI_bready => M00_AXI_bready,
      M00_AXI_bresp(1 downto 0) => M00_AXI_bresp(1 downto 0),
      M00_AXI_bvalid => M00_AXI_bvalid,
      M00_AXI_rdata(31 downto 0) => M00_AXI_rdata(31 downto 0),
      M00_AXI_rready => M00_AXI_rready,
      M00_AXI_rresp(1 downto 0) => M00_AXI_rresp(1 downto 0),
      M00_AXI_rvalid => M00_AXI_rvalid,
      M00_AXI_wdata(31 downto 0) => M00_AXI_wdata(31 downto 0),
      M00_AXI_wready => M00_AXI_wready,
      M00_AXI_wstrb(3 downto 0) => M00_AXI_wstrb(3 downto 0),
      M00_AXI_wvalid => M00_AXI_wvalid,
      S00_ACLK => S00_ACLK,
      S00_ARESETN => S00_ARESETN,
      S00_AXI_araddr(31 downto 0) => S00_AXI_araddr(31 downto 0),
      S00_AXI_arburst(1 downto 0) => S00_AXI_arburst(1 downto 0),
      S00_AXI_arid(11 downto 0) => S00_AXI_arid(11 downto 0),
      S00_AXI_arlen(3 downto 0) => S00_AXI_arlen(3 downto 0),
      S00_AXI_arprot(2 downto 0) => S00_AXI_arprot(2 downto 0),
      S00_AXI_arready => S00_AXI_arready,
      S00_AXI_arsize(1 downto 0) => S00_AXI_arsize(1 downto 0),
      S00_AXI_arvalid => S00_AXI_arvalid,
      S00_AXI_awaddr(31 downto 0) => S00_AXI_awaddr(31 downto 0),
      S00_AXI_awburst(1 downto 0) => S00_AXI_awburst(1 downto 0),
      S00_AXI_awid(11 downto 0) => S00_AXI_awid(11 downto 0),
      S00_AXI_awlen(3 downto 0) => S00_AXI_awlen(3 downto 0),
      S00_AXI_awprot(2 downto 0) => S00_AXI_awprot(2 downto 0),
      S00_AXI_awready => S00_AXI_awready,
      S00_AXI_awsize(1 downto 0) => S00_AXI_awsize(1 downto 0),
      S00_AXI_awvalid => S00_AXI_awvalid,
      S00_AXI_bid(11 downto 0) => S00_AXI_bid(11 downto 0),
      S00_AXI_bready => S00_AXI_bready,
      S00_AXI_bresp(1 downto 0) => S00_AXI_bresp(1 downto 0),
      S00_AXI_bvalid => S00_AXI_bvalid,
      S00_AXI_rdata(31 downto 0) => S00_AXI_rdata(31 downto 0),
      S00_AXI_rid(11 downto 0) => S00_AXI_rid(11 downto 0),
      S00_AXI_rlast => S00_AXI_rlast,
      S00_AXI_rready => S00_AXI_rready,
      S00_AXI_rresp(1 downto 0) => S00_AXI_rresp(1 downto 0),
      S00_AXI_rvalid => S00_AXI_rvalid,
      S00_AXI_wdata(31 downto 0) => S00_AXI_wdata(31 downto 0),
      S00_AXI_wready => S00_AXI_wready,
      S00_AXI_wstrb(3 downto 0) => S00_AXI_wstrb(3 downto 0),
      S00_AXI_wvalid => S00_AXI_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dwa_ps_bd is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FCLK_CLK1_0 : out STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    M00_AXI_0_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_0_arready : in STD_LOGIC;
    M00_AXI_0_arvalid : out STD_LOGIC;
    M00_AXI_0_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_0_awready : in STD_LOGIC;
    M00_AXI_0_awvalid : out STD_LOGIC;
    M00_AXI_0_bready : out STD_LOGIC;
    M00_AXI_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_0_bvalid : in STD_LOGIC;
    M00_AXI_0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_rready : out STD_LOGIC;
    M00_AXI_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_0_rvalid : in STD_LOGIC;
    M00_AXI_0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_wready : in STD_LOGIC;
    M00_AXI_0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_0_wvalid : out STD_LOGIC;
    aclk : out STD_LOGIC;
    peripheral_aresetn_0 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of dwa_ps_bd : entity is true;
  attribute hw_handoff : string;
  attribute hw_handoff of dwa_ps_bd : entity is "dwa_ps_bd.hwdef";
end dwa_ps_bd;

architecture STRUCTURE of dwa_ps_bd is
  signal \^aclk\ : STD_LOGIC;
  signal processing_system7_0_FCLK_RESET0_N : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARSIZE : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWSIZE : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WVALID : STD_LOGIC;
  signal rst_ps7_0_100M_interconnect_aresetn_0 : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_WLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_ARCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARLOCK_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARSIZE_UNCONNECTED : STD_LOGIC_VECTOR ( 2 to 2 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWLOCK_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWSIZE_UNCONNECTED : STD_LOGIC_VECTOR ( 2 to 2 );
  signal NLW_processing_system7_0_M_AXI_GP0_WID_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_rst_ps7_0_100M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_ps7_0_100M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_ps7_0_100M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of processing_system7_0 : label is "dwa_ps_bd_processing_system7_0_0,processing_system7_v5_5_processing_system7,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of processing_system7_0 : label is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of processing_system7_0 : label is "processing_system7_v5_5_processing_system7,Vivado 2020.2";
  attribute CHECK_LICENSE_TYPE of rst_ps7_0_100M : label is "dwa_ps_bd_rst_ps7_0_100M_1,proc_sys_reset,{}";
  attribute DowngradeIPIdentifiedWarnings of rst_ps7_0_100M : label is "yes";
  attribute X_CORE_INFO of rst_ps7_0_100M : label is "proc_sys_reset,Vivado 2020.2";
  attribute x_interface_info : string;
  attribute x_interface_info of DDR_cas_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CAS_N";
  attribute x_interface_info of DDR_ck_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_N";
  attribute x_interface_info of DDR_ck_p : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_P";
  attribute x_interface_info of DDR_cke : signal is "xilinx.com:interface:ddrx:1.0 DDR CKE";
  attribute x_interface_info of DDR_cs_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CS_N";
  attribute x_interface_info of DDR_odt : signal is "xilinx.com:interface:ddrx:1.0 DDR ODT";
  attribute x_interface_info of DDR_ras_n : signal is "xilinx.com:interface:ddrx:1.0 DDR RAS_N";
  attribute x_interface_info of DDR_reset_n : signal is "xilinx.com:interface:ddrx:1.0 DDR RESET_N";
  attribute x_interface_info of DDR_we_n : signal is "xilinx.com:interface:ddrx:1.0 DDR WE_N";
  attribute x_interface_info of FCLK_CLK1_0 : signal is "xilinx.com:signal:clock:1.0 CLK.FCLK_CLK1_0 CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of FCLK_CLK1_0 : signal is "XIL_INTERFACENAME CLK.FCLK_CLK1_0, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK1, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute x_interface_info of FIXED_IO_ddr_vrn : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN";
  attribute x_interface_parameter of FIXED_IO_ddr_vrn : signal is "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false";
  attribute x_interface_info of FIXED_IO_ddr_vrp : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP";
  attribute x_interface_info of FIXED_IO_ps_clk : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK";
  attribute x_interface_info of FIXED_IO_ps_porb : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB";
  attribute x_interface_info of FIXED_IO_ps_srstb : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB";
  attribute x_interface_info of M00_AXI_0_arready : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARREADY";
  attribute x_interface_info of M00_AXI_0_arvalid : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARVALID";
  attribute x_interface_info of M00_AXI_0_awready : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWREADY";
  attribute x_interface_info of M00_AXI_0_awvalid : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWVALID";
  attribute x_interface_info of M00_AXI_0_bready : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 BREADY";
  attribute x_interface_info of M00_AXI_0_bvalid : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 BVALID";
  attribute x_interface_info of M00_AXI_0_rready : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 RREADY";
  attribute x_interface_info of M00_AXI_0_rvalid : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 RVALID";
  attribute x_interface_info of M00_AXI_0_wready : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 WREADY";
  attribute x_interface_info of M00_AXI_0_wvalid : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 WVALID";
  attribute x_interface_info of aclk : signal is "xilinx.com:signal:clock:1.0 CLK.ACLK CLK";
  attribute x_interface_parameter of aclk : signal is "XIL_INTERFACENAME CLK.ACLK, CLK_DOMAIN dwa_ps_bd_processing_system7_0_0_FCLK_CLK0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute x_interface_info of DDR_addr : signal is "xilinx.com:interface:ddrx:1.0 DDR ADDR";
  attribute x_interface_parameter of DDR_addr : signal is "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250";
  attribute x_interface_info of DDR_ba : signal is "xilinx.com:interface:ddrx:1.0 DDR BA";
  attribute x_interface_info of DDR_dm : signal is "xilinx.com:interface:ddrx:1.0 DDR DM";
  attribute x_interface_info of DDR_dq : signal is "xilinx.com:interface:ddrx:1.0 DDR DQ";
  attribute x_interface_info of DDR_dqs_n : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_N";
  attribute x_interface_info of DDR_dqs_p : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_P";
  attribute x_interface_info of FIXED_IO_mio : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO";
  attribute x_interface_info of M00_AXI_0_araddr : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARADDR";
  attribute x_interface_parameter of M00_AXI_0_araddr : signal is "XIL_INTERFACENAME M00_AXI_0, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 4, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 4, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute x_interface_info of M00_AXI_0_arprot : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARPROT";
  attribute x_interface_info of M00_AXI_0_awaddr : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWADDR";
  attribute x_interface_info of M00_AXI_0_awprot : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWPROT";
  attribute x_interface_info of M00_AXI_0_bresp : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 BRESP";
  attribute x_interface_info of M00_AXI_0_rdata : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 RDATA";
  attribute x_interface_info of M00_AXI_0_rresp : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 RRESP";
  attribute x_interface_info of M00_AXI_0_wdata : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 WDATA";
  attribute x_interface_info of M00_AXI_0_wstrb : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_0 WSTRB";
  attribute x_interface_info of peripheral_aresetn_0 : signal is "xilinx.com:signal:reset:1.0 RST.PERIPHERAL_ARESETN_0 RST";
  attribute x_interface_parameter of peripheral_aresetn_0 : signal is "XIL_INTERFACENAME RST.PERIPHERAL_ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  aclk <= \^aclk\;
processing_system7_0: entity work.dwa_ps_bd_dwa_ps_bd_processing_system7_0_0
     port map (
      DDR_Addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_BankAddr(2 downto 0) => DDR_ba(2 downto 0),
      DDR_CAS_n => DDR_cas_n,
      DDR_CKE => DDR_cke,
      DDR_CS_n => DDR_cs_n,
      DDR_Clk => DDR_ck_p,
      DDR_Clk_n => DDR_ck_n,
      DDR_DM(3 downto 0) => DDR_dm(3 downto 0),
      DDR_DQ(31 downto 0) => DDR_dq(31 downto 0),
      DDR_DQS(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_DQS_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_DRSTB => DDR_reset_n,
      DDR_ODT => DDR_odt,
      DDR_RAS_n => DDR_ras_n,
      DDR_VRN => FIXED_IO_ddr_vrn,
      DDR_VRP => FIXED_IO_ddr_vrp,
      DDR_WEB => DDR_we_n,
      FCLK_CLK0 => \^aclk\,
      FCLK_CLK1 => FCLK_CLK1_0,
      FCLK_RESET0_N => processing_system7_0_FCLK_RESET0_N,
      MIO(53 downto 0) => FIXED_IO_mio(53 downto 0),
      M_AXI_GP0_ACLK => '0',
      M_AXI_GP0_ARADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      M_AXI_GP0_ARBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      M_AXI_GP0_ARCACHE(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARCACHE_UNCONNECTED(3 downto 0),
      M_AXI_GP0_ARID(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      M_AXI_GP0_ARLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      M_AXI_GP0_ARLOCK(1 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARLOCK_UNCONNECTED(1 downto 0),
      M_AXI_GP0_ARPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      M_AXI_GP0_ARQOS(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARQOS_UNCONNECTED(3 downto 0),
      M_AXI_GP0_ARREADY => processing_system7_0_M_AXI_GP0_ARREADY,
      M_AXI_GP0_ARSIZE(2) => NLW_processing_system7_0_M_AXI_GP0_ARSIZE_UNCONNECTED(2),
      M_AXI_GP0_ARSIZE(1 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(1 downto 0),
      M_AXI_GP0_ARVALID => processing_system7_0_M_AXI_GP0_ARVALID,
      M_AXI_GP0_AWADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      M_AXI_GP0_AWBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      M_AXI_GP0_AWCACHE(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWCACHE_UNCONNECTED(3 downto 0),
      M_AXI_GP0_AWID(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      M_AXI_GP0_AWLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      M_AXI_GP0_AWLOCK(1 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWLOCK_UNCONNECTED(1 downto 0),
      M_AXI_GP0_AWPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      M_AXI_GP0_AWQOS(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWQOS_UNCONNECTED(3 downto 0),
      M_AXI_GP0_AWREADY => processing_system7_0_M_AXI_GP0_AWREADY,
      M_AXI_GP0_AWSIZE(2) => NLW_processing_system7_0_M_AXI_GP0_AWSIZE_UNCONNECTED(2),
      M_AXI_GP0_AWSIZE(1 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(1 downto 0),
      M_AXI_GP0_AWVALID => processing_system7_0_M_AXI_GP0_AWVALID,
      M_AXI_GP0_BID(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      M_AXI_GP0_BREADY => processing_system7_0_M_AXI_GP0_BREADY,
      M_AXI_GP0_BRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      M_AXI_GP0_BVALID => processing_system7_0_M_AXI_GP0_BVALID,
      M_AXI_GP0_RDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      M_AXI_GP0_RID(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      M_AXI_GP0_RLAST => processing_system7_0_M_AXI_GP0_RLAST,
      M_AXI_GP0_RREADY => processing_system7_0_M_AXI_GP0_RREADY,
      M_AXI_GP0_RRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      M_AXI_GP0_RVALID => processing_system7_0_M_AXI_GP0_RVALID,
      M_AXI_GP0_WDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      M_AXI_GP0_WID(11 downto 0) => NLW_processing_system7_0_M_AXI_GP0_WID_UNCONNECTED(11 downto 0),
      M_AXI_GP0_WLAST => NLW_processing_system7_0_M_AXI_GP0_WLAST_UNCONNECTED,
      M_AXI_GP0_WREADY => processing_system7_0_M_AXI_GP0_WREADY,
      M_AXI_GP0_WSTRB(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      M_AXI_GP0_WVALID => processing_system7_0_M_AXI_GP0_WVALID,
      PS_CLK => FIXED_IO_ps_clk,
      PS_PORB => FIXED_IO_ps_porb,
      PS_SRSTB => FIXED_IO_ps_srstb,
      TTC0_WAVE0_OUT => NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED,
      TTC0_WAVE1_OUT => NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED,
      TTC0_WAVE2_OUT => NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED,
      USB0_PORT_INDCTL(1 downto 0) => NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED(1 downto 0),
      USB0_VBUS_PWRFAULT => '0',
      USB0_VBUS_PWRSELECT => NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED
    );
ps7_0_axi_periph: entity work.dwa_ps_bd_dwa_ps_bd_ps7_0_axi_periph_0
     port map (
      ACLK => '0',
      ARESETN => '0',
      M00_ACLK => '0',
      M00_ARESETN => '0',
      M00_AXI_araddr(31 downto 0) => M00_AXI_0_araddr(31 downto 0),
      M00_AXI_arprot(2 downto 0) => M00_AXI_0_arprot(2 downto 0),
      M00_AXI_arready => M00_AXI_0_arready,
      M00_AXI_arvalid => M00_AXI_0_arvalid,
      M00_AXI_awaddr(31 downto 0) => M00_AXI_0_awaddr(31 downto 0),
      M00_AXI_awprot(2 downto 0) => M00_AXI_0_awprot(2 downto 0),
      M00_AXI_awready => M00_AXI_0_awready,
      M00_AXI_awvalid => M00_AXI_0_awvalid,
      M00_AXI_bready => M00_AXI_0_bready,
      M00_AXI_bresp(1 downto 0) => M00_AXI_0_bresp(1 downto 0),
      M00_AXI_bvalid => M00_AXI_0_bvalid,
      M00_AXI_rdata(31 downto 0) => M00_AXI_0_rdata(31 downto 0),
      M00_AXI_rready => M00_AXI_0_rready,
      M00_AXI_rresp(1 downto 0) => M00_AXI_0_rresp(1 downto 0),
      M00_AXI_rvalid => M00_AXI_0_rvalid,
      M00_AXI_wdata(31 downto 0) => M00_AXI_0_wdata(31 downto 0),
      M00_AXI_wready => M00_AXI_0_wready,
      M00_AXI_wstrb(3 downto 0) => M00_AXI_0_wstrb(3 downto 0),
      M00_AXI_wvalid => M00_AXI_0_wvalid,
      S00_ACLK => \^aclk\,
      S00_ARESETN => rst_ps7_0_100M_interconnect_aresetn_0,
      S00_AXI_araddr(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => B"0000",
      S00_AXI_arid(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      S00_AXI_arlen(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      S00_AXI_arlock(1 downto 0) => B"00",
      S00_AXI_arprot(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => B"0000",
      S00_AXI_arready => processing_system7_0_M_AXI_GP0_ARREADY,
      S00_AXI_arsize(2) => '0',
      S00_AXI_arsize(1 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(1 downto 0),
      S00_AXI_arvalid => processing_system7_0_M_AXI_GP0_ARVALID,
      S00_AXI_awaddr(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => B"0000",
      S00_AXI_awid(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      S00_AXI_awlen(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      S00_AXI_awlock(1 downto 0) => B"00",
      S00_AXI_awprot(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => B"0000",
      S00_AXI_awready => processing_system7_0_M_AXI_GP0_AWREADY,
      S00_AXI_awsize(2) => '0',
      S00_AXI_awsize(1 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(1 downto 0),
      S00_AXI_awvalid => processing_system7_0_M_AXI_GP0_AWVALID,
      S00_AXI_bid(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      S00_AXI_bready => processing_system7_0_M_AXI_GP0_BREADY,
      S00_AXI_bresp(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      S00_AXI_bvalid => processing_system7_0_M_AXI_GP0_BVALID,
      S00_AXI_rdata(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      S00_AXI_rid(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      S00_AXI_rlast => processing_system7_0_M_AXI_GP0_RLAST,
      S00_AXI_rready => processing_system7_0_M_AXI_GP0_RREADY,
      S00_AXI_rresp(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      S00_AXI_rvalid => processing_system7_0_M_AXI_GP0_RVALID,
      S00_AXI_wdata(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      S00_AXI_wid(11 downto 0) => B"000000000000",
      S00_AXI_wlast => '0',
      S00_AXI_wready => processing_system7_0_M_AXI_GP0_WREADY,
      S00_AXI_wstrb(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      S00_AXI_wvalid => processing_system7_0_M_AXI_GP0_WVALID
    );
rst_ps7_0_100M: entity work.dwa_ps_bd_dwa_ps_bd_rst_ps7_0_100M_1
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_ps7_0_100M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => processing_system7_0_FCLK_RESET0_N,
      interconnect_aresetn(0) => rst_ps7_0_100M_interconnect_aresetn_0,
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_ps7_0_100M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => peripheral_aresetn_0(0),
      peripheral_reset(0) => NLW_rst_ps7_0_100M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => \^aclk\
    );
end STRUCTURE;
