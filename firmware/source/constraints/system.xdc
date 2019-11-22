
set_property PACKAGE_PIN BB21 [get_ports acStim_obuf]


set_property PACKAGE_PIN BB23 [get_ports acStimX200_obuf]

# lvcmos18 is selected for xadcinputs only to make it compatible with the vcco during DRC :P
# does not change the functionality and can be anything conpatible.
set_property IOSTANDARD LVCMOS18 [get_ports V_p]
set_property PACKAGE_PIN AA21 [get_ports V_p]

set_property IOSTANDARD LVCMOS18 [get_ports Vaux0_P]
set_property PACKAGE_PIN AN38 [get_ports Vaux0_P]

set_property IOSTANDARD LVCMOS18 [get_ports Vaux8_p]
set_property PACKAGE_PIN AM41 [get_ports Vaux8_p]

set_property IOSTANDARD DIFF_SSTL15 [get_ports sysclk_p]
set_property PACKAGE_PIN E19 [get_ports sysclk_p]
