
library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
library std;
--use std.textio.all;
--use ieee.std_logic_textio.all;
use std.textio.all;

entity axi_file_io is
  generic (
    sim_file        : string := "/matlab/defaultSimFile.txt";
    mon_outFileName : string := "/simData/mon_outFile.txt";
    l1a_outFileName : string := "/simData/l1a_outFile.txt"
  );
  port (
    --    GBT_ENABLE : in std_logic;

    PLAXI_WDATA  : out unsigned(31 downto 0) := x"A0A0A0A0";
    PLAXI_WSTRB  : out boolean               := false;
    PLAXI_AWADDR : out unsigned(5 downto 0)  := "010011";

    PLAXI_RDATA  : in  unsigned(31 downto 0) := x"A8A8A8A8";
    PLAXI_RSTRB  : out boolean               := false;
    PLAXI_ARADDR : out unsigned(5 downto 0)  := "000000";
    PLAXI_ACLK   : in  std_logic;

    l1a_efifoData : in std_logic_vector(15 downto 0) := (others => '0');
    l1a_efifoWe   : in boolean;
    l1a_efifoClk  : in std_logic := '0';

    mon_efifoData : in std_logic_vector(15 downto 0) := (others => '0');
    mon_efifoWe   : in boolean;
    mon_efifoClk  : in std_logic := '0'
  );
end axi_file_io;

architecture behav of axi_file_io is
  --  signal ENABLE     : boolean := false;
  signal dataread     : unsigned(7 downto 0);
  signal datatosave   : unsigned(7 downto 0);
  signal linenumber   : integer := 1;
  signal ART_DATA_int : std_logic_vector(31 downto 0);

begin

  reading : process

    file infile        : text;
    variable inline    : line;
    variable FIFO_DATA : bit_vector(31 downto 0) := x"A0A0A0A0";
    variable FIFO_ADDR : bit_vector(5 downto 0)  := "000011";
    variable fstatus   : file_open_status;
    variable ENABLE    : boolean := false;

  begin
    PLAXI_WDATA  <= x"A0A0A0A0";
    PLAXI_AWADDR <= "000001";
    PLAXI_WSTRB  <= false;
    if not ENABLE then
      wait for 100 ns;
      wait until PLAXI_ACLK = '0' and PLAXI_ACLK'event;
      --wait until GBT_ENABLE = '1';
      ENABLE := true;
      file_open(fstatus, infile, sim_file, read_mode);

    elsif (not endfile(infile)) then
      readline(infile, inline);

      hread(inline, FIFO_DATA);
      hread(inline, FIFO_ADDR);

      PLAXI_WSTRB  <= true;
      PLAXI_WDATA  <= unsigned(to_stdLogicVector(FIFO_DATA));
      PLAXI_AWADDR <= unsigned(to_stdLogicVector(FIFO_ADDR));
    else
      file_close(infile); -- closes file
      PLAXI_WSTRB <= false;
      wait;
    end if;
    wait until PLAXI_ACLK = '1' and PLAXI_ACLK'event;
  end process reading;

  writing_mon : process
    file mon_outFile     : text;
    variable mon_fStatus : file_open_status;
    variable wordCnt:integer := 0;
    variable mon_outLine : line;
  begin
    file_open(mon_fStatus, mon_outFile, mon_outFileName, write_mode);
    wait until mon_efifoWe;
    while mon_efifoWe loop
      wait until rising_edge(mon_efifoClk);
      hwrite(mon_outLine, mon_efifoData(15 downto 8));
      write(mon_outLine, string'(" "));
      hwrite(mon_outLine, mon_efifoData(7 downto 0));
      write(mon_outLine, string'(" "));
      if wordCnt = 21 then
        writeline(mon_outFile, mon_outLine);
        wordCnt := 0;
      else 
        wordCnt := wordCnt +1;
      end if;
      wait until falling_edge(mon_efifoClk);
    end loop;
  end process writing_mon;

  writing_l1a : process
    file l1a_outFile     : text;
    variable l1a_fStatus : file_open_status;
    variable l1a_outLine : line;
  begin
    file_open(l1a_fStatus, l1a_outFile, l1a_outFileName, write_mode);
    wait until l1a_efifoWe;
    while l1a_efifoWe loop
      wait until rising_edge(l1a_efifoClk);
      hwrite(l1a_outLine, l1a_efifoData);
      writeline(l1a_outFile, l1a_outLine);
      wait until falling_edge(l1a_efifoClk);
    end loop;
  end process writing_l1a;


end architecture behav;
