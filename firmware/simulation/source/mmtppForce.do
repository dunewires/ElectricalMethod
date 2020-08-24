restart -force -nowave

force -freeze sim:/BCCLK320 1 0, 0 1.562 ns -r 3.125 ns
force -freeze sim:/TX_FRAME_CLK 1 0, 0 12.5 ns -r 25 ns
force -freeze sim:/BCCLK40 1 0, 0 12.5 ns -r 25 ns
force -freeze sim:/PLAXI_ACLK 1 0, 0 3.5 ns -r 7 ns
# simulation starts before fibers can sync
# need to change to match number of fibers.


force -freeze sim:/tb_axi_file_io/TOP_MMTPP_INST/GBT_ART_DECODE_1/forceBxSync true 1

force -deposit sim:/tb_axi_file_io/RESET true 0 -cancel 250ns

view wave 
