--------------------------------------------------------------------------------
-- Title       : DWA Header Generator Test Bench
-- Project     : DUNE DWA
--------------------------------------------------------------------------------
-- File        : headerGenerator.vhd
-- Author      : Nathan Felt felt@fas.harvard.edu
-- Company     : Harvard University LPPC
-- Created     : Thu May  2 11:04:21 2019
-- Last update : Tue Jun  9 00:35:52 2020
-- Platform    : DWA microZed
-- Standard    : VHDL-2008
-------------------------------------------------------------------------------
-- Description: Test bench for the Header Generator
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library duneDwa;
use duneDwa.global_def.all;

entity tb_headerGenerator is
end tb_headerGenerator;

architecture tb of tb_headerGenerator is

  -----------------------------------------------------------------------
  -- Timing constants
  -----------------------------------------------------------------------
  signal fromDaqReg     : fromDaqRegType;
  signal toDaqReg       : toDaqRegType;
  signal internalDwaReg : internalDwaRegType;

  signal runOdometer        : unsigned(23 downto 0);
  signal fpgaSerialNum      : unsigned(23 downto 0);             

  signal udpDataRen         : boolean;
  signal sendRunHdr         : boolean;
  signal sendAdcData        : boolean;
  signal sendStatusHdr      : boolean;

  signal firmwareId_date    : unsigned(47 downto 0);
  signal firmwareId_hash    : unsigned(31 downto 0);
  signal stimPeriodActive   : unsigned(23 downto 0);
  signal stimPeriodCounter  : unsigned(23 downto 0);
  signal adcSamplingPeriod  : unsigned(23 downto 0);

  signal adcDataRdy   : std_logic_vector(7 downto 0);
  signal adcDataRen   : std_logic_vector(7 downto 0);
  signal adcData      : slv_vector_type(7 downto 0)(31 downto 0);
  
  signal udpRequestComplete :  boolean := false;
  signal udpDataRdy         :  boolean := false;
  
  signal reset     : boolean   := false;
  signal dwaClk100 : std_logic := '0';

begin

  headerGenerator_inst : entity duneDwa.headerGenerator
    port map (
      fromDaqReg     => fromDaqReg,
      toDaqReg       => toDaqReg,
      internalDwaReg => internalDwaReg,


      runOdometer          =>   runOdometer,
      fpgaSerialNum        =>   fpgaSerialNum,
      
      udpDataRen           =>   udpDataRen,         
      sendRunHdr           =>   sendRunHdr,        
      sendAdcData          =>   sendAdcData,        
      sendStatusHdr        =>   sendStatusHdr,      

      firmwareId_date      =>   firmwareId_date,    
      firmwareId_hash      =>   firmwareId_hash,    
      stimPeriodActive     =>   stimPeriodActive,  
      stimPeriodCounter    =>   stimPeriodCounter,  
      adcSamplingPeriod    =>   adcSamplingPeriod,  

      adcDataRdy           =>   adcDataRdy,         
      adcDataRen           =>   adcDataRen,         
      adcData              =>   adcData,            

      udpRequestComplete   =>   udpRequestComplete, 
      --udpDataRdy           =>   udpDataRdy,
      
      reset     => reset,
      dwaClk100 => dwaClk100
    );

end tb;

