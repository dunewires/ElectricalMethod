

set_property IOSTANDARD LVCMOS25 [get_ports acStimX200_obuf]
set_property PACKAGE_PIN T5 [get_ports acStimX200_obuf]


# lvcmos18 is selected for xadcinputs only to make it compatible with the vcco during DRC :P
# does not change the functionality and can be anything conpatible.
set_property IOSTANDARD LVCMOS18 [get_ports V_p]
set_property PACKAGE_PIN K9 [get_ports V_p]
# 1.8 v supplied by uZED NC on DWA

set_property IOSTANDARD LVDS_25 [get_ports BB_CLK_P]
set_property PACKAGE_PIN K17 [get_ports BB_CLK_P]
set_property DIFF_TERM  TRUE [get_ports BB_CLK_P]

set_property IOSTANDARD LVCMOS33 [get_ports DAC_SDI]
set_property PACKAGE_PIN P15 [get_ports DAC_SDI]

set_property IOSTANDARD LVCMOS33 [get_ports DAC_CS_B]
set_property PACKAGE_PIN W19 [get_ports DAC_CS_B]

set_property IOSTANDARD LVCMOS33 [get_ports DAC_LD_B]
set_property PACKAGE_PIN P18 [get_ports DAC_LD_B]

set_property IOSTANDARD LVCMOS33 [get_ports DAC_CLR_B]
set_property PACKAGE_PIN P16 [get_ports DAC_CLR_B]

set_property IOSTANDARD LVCMOS33 [get_ports DAC_CLK]
set_property PACKAGE_PIN N17 [get_ports DAC_CLK]

set_property IOSTANDARD LVCMOS33 [get_ports dpotSdi]
set_property PACKAGE_PIN R16 [get_ports dpotSdi]
set_property IOSTANDARD LVCMOS33 [get_ports dpotSdo]
set_property PACKAGE_PIN T17 [get_ports dpotSdo]
set_property IOSTANDARD LVCMOS33 [get_ports dpotPr_b]
set_property PACKAGE_PIN V17 [get_ports dpotPr_b]
set_property IOSTANDARD LVCMOS33 [get_ports dpotCs_b]
set_property PACKAGE_PIN R18 [get_ports dpotCs_b]
set_property IOSTANDARD LVCMOS33 [get_ports dpotSck]
set_property PACKAGE_PIN W18 [get_ports dpotSck]
set_property IOSTANDARD LVCMOS33 [get_ports dpotShdn_b]
set_property PACKAGE_PIN R17 [get_ports dpotShdn_b]

#DWA V2 CoilDrive[0]
set_property IOSTANDARD LVCMOS33 [get_ports CD_Din]
set_property PACKAGE_PIN U13 [get_ports CD_Din]


#DWA V2 CoilDrive[1]
set_property IOSTANDARD LVCMOS33 [get_ports CD_SCLR_b[3]]
set_property PACKAGE_PIN V12 [get_ports CD_SCLR_b[3]]

#DWA V2 CoilDrive[2]unconnected
# set_property IOSTANDARD LVCMOS33 [get_ports s]
# set_property PACKAGE_PIN V13 [get_ports s]

#DWA V2 CoilDrive[3]
set_property IOSTANDARD LVCMOS33 [get_ports CD_SCLR_b[1]]
set_property PACKAGE_PIN W13 [get_ports CD_SCLR_b[1]]

#DWA V2 CoilDrive[4]
set_property IOSTANDARD LVCMOS33 [get_ports CD_SCK[3]]
set_property PACKAGE_PIN T14 [get_ports CD_SCK[3]]

#DWA V2 CoilDrive[5]
set_property IOSTANDARD LVCMOS33 [get_ports CD_RCK[3]]
set_property PACKAGE_PIN P14 [get_ports CD_RCK[3]]

#DWA V2 CoilDrive[6]
set_property IOSTANDARD LVCMOS33 [get_ports CD_SCK[1]]
set_property PACKAGE_PIN T15 [get_ports CD_SCK[1]]

#DWA V2 CoilDrive[7]
set_property IOSTANDARD LVCMOS33 [get_ports CD_RCK[1]]
set_property PACKAGE_PIN R14 [get_ports CD_RCK[1]]

#DWA V2 CoilDrive[8]
set_property IOSTANDARD LVCMOS33 [get_ports CD_G_b[3]]
set_property PACKAGE_PIN Y16 [get_ports CD_G_b[3]]

#DWA V2 CoilDrive[9]
set_property IOSTANDARD LVCMOS33 [get_ports CD_Dout[3]]
set_property PACKAGE_PIN W14 [get_ports CD_Dout[3]]

#DWA V2 CoilDrive[10]
set_property IOSTANDARD LVCMOS33 [get_ports CD_G_b[1]]
set_property PACKAGE_PIN Y17 [get_ports CD_G_b[1]]

#DWA V2 CoilDrive[11]
set_property IOSTANDARD LVCMOS33 [get_ports CD_Dout[1]]
set_property PACKAGE_PIN Y14 [get_ports CD_Dout[1]]

#DWA V2 CoilDrive[12]
set_property IOSTANDARD LVCMOS33 [get_ports CD_SCLR_b[2]]
set_property PACKAGE_PIN T16 [get_ports CD_SCLR_b[2]]

#DWA V2 CoilDrive[13]
set_property IOSTANDARD LVCMOS33 [get_ports CD_SCK[2]]
set_property PACKAGE_PIN V15 [get_ports CD_SCK[2]]

#DWA V2 CoilDrive[14]
set_property IOSTANDARD LVCMOS33 [get_ports CD_SCLR_b[0]]
set_property PACKAGE_PIN U17 [get_ports CD_SCLR_b[0]]

#DWA V2 CoilDrive[15]
set_property IOSTANDARD LVCMOS33 [get_ports CD_SCK[0]]
set_property PACKAGE_PIN W15 [get_ports CD_SCK[0]]

#DWA V2 CoilDrive[16]
set_property IOSTANDARD LVCMOS33 [get_ports CD_RCK[2]]
set_property PACKAGE_PIN U14 [get_ports CD_RCK[2]]

#DWA V2 CoilDrive[17]
set_property IOSTANDARD LVCMOS33 [get_ports CD_G_b[2]]
set_property PACKAGE_PIN U18 [get_ports CD_G_b[2]]

#DWA V2 CoilDrive[18]
set_property IOSTANDARD LVCMOS33 [get_ports CD_RCK[0]]
set_property PACKAGE_PIN U15 [get_ports CD_RCK[0]]

#DWA V2 CoilDrive[19]
set_property IOSTANDARD LVCMOS33 [get_ports CD_G_b[0]]
set_property PACKAGE_PIN U19 [get_ports CD_G_b[0]]

#DWA V2 CoilDrive[20]
set_property IOSTANDARD LVCMOS33 [get_ports CD_Dout[2]]
set_property PACKAGE_PIN N18 [get_ports CD_Dout[2]]

#DWA V2 CoilDrive[21]
set_property IOSTANDARD LVCMOS33 [get_ports SNUM_SDA]
set_property PACKAGE_PIN N20 [get_ports SNUM_SDA]
set_property PULLUP TRUE [get_ports SNUM_SDA]

#DWA V2 CoilDrive[22]
set_property IOSTANDARD LVCMOS33 [get_ports CD_Dout[0]]
set_property PACKAGE_PIN P19 [get_ports CD_Dout[0]]

#DWA V2 CoilDrive[23]
set_property IOSTANDARD LVCMOS33 [get_ports SNUM_SCL]
set_property PACKAGE_PIN P20 [get_ports SNUM_SCL]

#DWA V2 CoilDrive[24]
set_property IOSTANDARD LVCMOS33 [get_ports SNUM_A[2]]
set_property PACKAGE_PIN T20 [get_ports SNUM_A[2]]

#DWA V2 CoilDrive[25]
set_property IOSTANDARD LVCMOS33 [get_ports SNUM_A[1]]
set_property PACKAGE_PIN V20 [get_ports SNUM_A[1]]

#DWA V2 CoilDrive[26] unconnected
# set_property IOSTANDARD LVCMOS33 [get_ports s]
# set_property PACKAGE_PIN U20 [get_ports s]

#DWA V2 CoilDrive[27]
set_property IOSTANDARD LVCMOS33 [get_ports SNUM_A[0]]
set_property PACKAGE_PIN W20 [get_ports SNUM_A[0]]

#DWA V2 CoilDrive 28:31 unconnected
# set_property IOSTANDARD LVCMOS33 [get_ports CoilDrive[28]]
# set_property PACKAGE_PIN Y18 [get_ports CoilDrive[28]]
# 
# set_property IOSTANDARD LVCMOS33 [get_ports CoilDrive[29]]
# set_property PACKAGE_PIN V16 [get_ports CoilDrive[29]]
# 
# set_property IOSTANDARD LVCMOS33 [get_ports CoilDrive[30]]
# set_property PACKAGE_PIN Y19 [get_ports CoilDrive[30]]
# 
# set_property IOSTANDARD LVCMOS33 [get_ports CoilDrive[31]]
# set_property PACKAGE_PIN W16 [get_ports CoilDrive[31]]

set_property IOSTANDARD LVCMOS25 [get_ports led[0]]
set_property PACKAGE_PIN C20 [get_ports led[0]]

set_property IOSTANDARD LVCMOS25 [get_ports led[1]]
set_property PACKAGE_PIN B19 [get_ports led[1]]

set_property IOSTANDARD LVCMOS25 [get_ports led[2]]
set_property PACKAGE_PIN B20 [get_ports led[2]]

set_property IOSTANDARD LVCMOS25 [get_ports led[3]]
set_property PACKAGE_PIN A20 [get_ports led[3]]

set_property IOSTANDARD LVCMOS25 [get_ports pButton[0]]
set_property PACKAGE_PIN G19 [get_ports pButton[0]]

set_property IOSTANDARD LVCMOS25 [get_ports pButton[1]]
set_property PACKAGE_PIN J20 [get_ports pButton[1]]

set_property IOSTANDARD LVCMOS25 [get_ports pButton[2]]
set_property PACKAGE_PIN G20 [get_ports pButton[2]]

set_property IOSTANDARD LVCMOS25 [get_ports pButton[3]]
set_property PACKAGE_PIN H20 [get_ports pButton[3]]

set_property IOSTANDARD LVCMOS25 [get_ports adcCnv]
set_property PACKAGE_PIN G17 [get_ports adcCnv]

set_property IOSTANDARD LVDS_25 [get_ports adcSck_p]
set_property PACKAGE_PIN M19 [get_ports adcSck_p]

set_property IOSTANDARD LVDS_25 [get_ports adcDataSerial_p[0]]
set_property PACKAGE_PIN M17 [get_ports adcDataSerial_p[0]]

set_property IOSTANDARD LVDS_25 [get_ports adcDataSerial_p[1]]
set_property PACKAGE_PIN K19 [get_ports adcDataSerial_p[1]]

set_property IOSTANDARD LVDS_25 [get_ports adcDataSerial_p[2]]
set_property PACKAGE_PIN J18 [get_ports adcDataSerial_p[2]]

set_property IOSTANDARD LVDS_25 [get_ports adcDataSerial_p[3]]
set_property PACKAGE_PIN F19 [get_ports adcDataSerial_p[3]]

set_property IOSTANDARD LVDS_25 [get_ports adcSrcSyncClk_p]
set_property PACKAGE_PIN H16 [get_ports adcSrcSyncClk_p]

set_property IOSTANDARD LVCMOS25 [get_ports mainsSquare]
set_property PACKAGE_PIN G18 [get_ports mainsSquare]

# temp clock false paths.  Replace with sync clock
set_false_path -from [get_clocks aclk] -to [get_clocks BB_CLK]
set_false_path -from [get_clocks BB_CLK] -to [get_clocks aclk]

create_clock -period 10.000 -name {dwa_ps_bd_i/processing_system7_0/inst/PS7_i/FCLKCLK[0]} -waveform {0.000 5.000} [get_pins {dwa_ps_bd_i/processing_system7_0/inst/PS7_i/FCLKCLK[0]}]
