onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headAStart
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDwaReg.headARdy
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDaqReg.headARen
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDwaReg.headAData
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/headACnt
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDwaReg
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/fromDaqReg
add wave -noupdate -expand -group TOP -expand -group headerGen -expand /tb_headergenerator/headerGenerator_inst/headADataList
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_headergenerator/headerGenerator_inst/dwaClk100
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
WaveRestoreZoom {0 fs} {645165449 fs}
