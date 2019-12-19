

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

set_property IOSTANDARD LVCMOS25 [get_ports led[0]]
set_property PACKAGE_PIN C20 [get_ports led[0]]

set_property IOSTANDARD LVCMOS25 [get_ports led[1]]
set_property PACKAGE_PIN B20 [get_ports led[1]]

set_property IOSTANDARD LVCMOS25 [get_ports led[2]]
set_property PACKAGE_PIN B19 [get_ports led[2]]

set_property IOSTANDARD LVCMOS25 [get_ports led[3]]
set_property PACKAGE_PIN A20 [get_ports led[3]]

set_property IOSTANDARD LVCMOS25 [get_ports adcCnv]
set_property PACKAGE_PIN  [get_ports adcCnv]

set_property IOSTANDARD LVCMOS25 [get_ports adcSck]
set_property PACKAGE_PIN  [get_ports adcSck]

set_property IOSTANDARD LVCMOS25 [get_ports adcDataSerial[0]]
set_property PACKAGE_PIN  [get_ports adcDataSerial[0]]

set_property IOSTANDARD LVCMOS25 [get_ports adcDataSerial[1]]
set_property PACKAGE_PIN  [get_ports adcDataSerial[1]]

set_property IOSTANDARD LVCMOS25 [get_ports adcDataSerial[2]]
set_property PACKAGE_PIN  [get_ports adcDataSerial[2]]

set_property IOSTANDARD LVCMOS25 [get_ports adcDataSerial[3]]
set_property PACKAGE_PIN  [get_ports adcDataSerial[3]]

set_property IOSTANDARD LVCMOS25 [get_ports adcSrcSyncClk]
set_property PACKAGE_PIN  [get_ports adcSrcSyncClk]

set_property IOSTANDARD LVCMOS25 [get_ports mainsSquare]
set_property PACKAGE_PIN G18 [get_ports mainsSquare]

# temp clock false paths.  Replace with sync fifos
set_false_path -from [get_clocks aclk] -to [get_clocks BB_CLK]
set_false_path -from [get_clocks BB_CLK] -to [get_clocks aclk]