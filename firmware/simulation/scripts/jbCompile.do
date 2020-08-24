######################################################################
#
######################################################################
vlib modelsim_lib/msim/duneDwa

vmap duneDwa modelsim_lib/msim/duneDwa

vcom -64 -2008 -work duneDwa  \
"../source/hdl/jbtest.vhd" \
"./source/tb_jbtest.vhd" \

