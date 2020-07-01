######################################################################
#
# File name : headerGenSim.do
# Created on: Wed Jun 3 14:47:29 EDT 2020
#
######################################################################
# simulation for the headerGenerator
# all of the Xilinx libraries have been removed and are needed only 
# to support the use of IP
######################################################################

vsim -voptargs="+acc" -L duneDwa  duneDwa.tb_headerGenerator 

# start wave before force to catch anything that happens there

do scripts/headerGenWave.do
do scripts/headerGenForce.do
run 800ns
