set_property IOSTANDARD LVCMOS18 [get_ports acStim_obuf]
set_property PACKAGE_PIN G14 [get_ports acStim_obuf]

set_property IOSTANDARD LVCMOS18 [get_ports acStimX200_obuf]
set_property PACKAGE_PIN L17 [get_ports acStimX200_obuf]

# lvcmos18 is selected for xadcinputs only to make it compatible with the vcco during DRC :P
# does not change the functionality and can be anything conpatible.
set_property IOSTANDARD LVCMOS18 [get_ports V_p]
set_property PACKAGE_PIN K9 [get_ports V_p]

set_property IOSTANDARD LVCMOS18 [get_ports Vaux0_P]
set_property PACKAGE_PIN C20 [get_ports Vaux0_P]

set_property IOSTANDARD LVCMOS18 [get_ports Vaux8_p]
set_property PACKAGE_PIN B19 [get_ports Vaux8_p]

set_property IOSTANDARD LVCMOS18 [get_ports BB_CLK]
set_property PACKAGE_PIN K17 [get_ports BB_CLK]

set_property IOSTANDARD LVCMOS18 [get_ports BB_CLK_EN]
set_property PACKAGE_PIN K18 [get_ports BB_CLK_EN]

set_property IOSTANDARD LVCMOS18 [get_ports led[0]]
set_property PACKAGE_PIN M17 [get_ports led[0]]

set_property IOSTANDARD LVCMOS18 [get_ports led[1]]
set_property PACKAGE_PIN M18 [get_ports led[1]]

set_property IOSTANDARD LVCMOS18 [get_ports led[2]]
set_property PACKAGE_PIN K19 [get_ports led[2]]

set_property IOSTANDARD LVCMOS18 [get_ports led[3]]
set_property PACKAGE_PIN J19 [get_ports led[3]]

set_property IOSTANDARD LVCMOS18 [get_ports mainsSquare]
set_property PACKAGE_PIN L16 [get_ports mainsSquare]

# temp clock false paths.  Replace with sync fifos
set_false_path -from [get_clocks aclk] -to [get_clocks BB_CLK]
set_false_path -from [get_clocks BB_CLK] -to [get_clocks aclk]