onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib fifo_autoDatacollection_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_autoDatacollection.udo}

run -all

quit -force
