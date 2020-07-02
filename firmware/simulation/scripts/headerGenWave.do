onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/sendRunHdr
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/sendAdcData
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/sendStatusHdr
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/ctrlState
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/udpDataRen
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/udpHdrRen
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/registerId
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/adcIdx
add wave -noupdate -expand -group TOP -expand -group headerGen -expand /tb_headergenerator/headerGenerator_inst/adcDataRen
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/toDaqReg.udpDataWord
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/toDaqReg.udpDataRdy
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/udpRequestComplete
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/udpPktCnt
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headACnt
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headFCnt
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headCCnt
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/toDaqReg
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDaqReg
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headADataList
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headEDataList
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headFDataList
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headCDataList
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/dwaClk100
add wave -noupdate /tb_headergenerator/headerGenerator_inst/nHeadALog
add wave -noupdate /tb_headergenerator/headerGenerator_inst/nHeadFLog
add wave -noupdate /tb_headergenerator/headerGenerator_inst/nHeadCLog
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {234022327936 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 208
configure wave -valuecolwidth 63
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
WaveRestoreZoom {0 fs} {259272096 fs}
