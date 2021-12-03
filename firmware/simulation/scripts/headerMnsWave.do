onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/fromDaqReg
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/toDaqReg
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sda
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/scl
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/dwaClk100
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/dwaClk10
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sdaState
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/cmdState
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/cmdStateNext
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/deviceAddr
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/serialAddress
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/shiftRegOut
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/serString
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/shiftRegIn
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/bitCnt
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/wordCnt
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/nWord
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/nRxWord
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/waitCnt
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/stateDbg
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/stateDbgCmd
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/clkCnt
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/serialCmdEnable
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sdoEn
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sdoEn_del
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/shiftRegInEn
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sclHold
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sendStop
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sdoStop
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sdo
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sdo_del
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/writeBusy
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/writeBusy_d
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/writeStart
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/writeDone
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/vioUpdate_del1
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/vioUpdate_del2
add wave -noupdate -expand -group snSignals /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/dummyWrite
add wave -noupdate -expand -group snSignals -divider {New Divider}
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/startupSeq
add wave -noupdate -color Gold /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/initAddrStrb
add wave -noupdate -color Gold /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/memAddr
add wave -noupdate -color Gold /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/initReadStrb
add wave -noupdate -color Gold /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/memRead
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/readBusy
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/startupDone
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/memWrite
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/readBusy_d
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/readStart
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/readDone
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {499230000000 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 208
configure wave -valuecolwidth 210
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits fs
update
WaveRestoreZoom {434879506720 fs} {584299940840 fs}
