######################################################################
#
# File name : headerGenCompile.do
# Created on: Wed Jun 3 14:47:29 EDT 2020
#
######################################################################
vlib modelsim_lib/msim/duneDwa

vmap duneDwa modelsim_lib/msim/duneDwa

vcom -64 -2008 -work duneDwa  \
"../source/packages/global_def.vhd" \
"../source/hdl/headerGenerator.vhd" \
"./source/tb_headerGenerator.vhd" \

