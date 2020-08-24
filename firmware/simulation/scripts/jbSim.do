######################################################################
######################################################################

vsim -voptargs="+acc" -L duneDwa  duneDwa.tb_jbtest

# start wave before force to catch anything that happens there

do scripts/jbWave.do
do scripts/jbForce.do
run 150ns
