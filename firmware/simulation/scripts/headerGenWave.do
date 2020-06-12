onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headAStart
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headFStart
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headCStart
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDwaReg.headARdy
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDaqReg.headARen
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDwaReg.headAData
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDwaReg.headFRdy
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDaqReg.headFRen
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDwaReg.headFData
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDwaReg.headCRdy
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDaqReg.headCRen
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDwaReg.headCData
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headACnt
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headFCnt
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headCCnt
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDwaReg
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDaqReg
add wave -noupdate -expand -group TOP -expand -group headerGen -expand /tb_headergenerator/headerGenerator_inst/headADataList
add wave -noupdate -expand -group TOP -expand -group headerGen -expand /tb_headergenerator/headerGenerator_inst/headFDataList
add wave -noupdate -expand -group TOP -expand -group headerGen -expand /tb_headergenerator/headerGenerator_inst/headCDataList
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
