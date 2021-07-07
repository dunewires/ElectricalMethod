onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib dwa_ps_bd_opt

do {wave.do}

view wave
view structure
view signals

do {dwa_ps_bd.udo}

run -all

quit -force
