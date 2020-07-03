onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_jbtest/jbtest_inst/sendRunHdr
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_jbtest/jbtest_inst/dataWord_reg
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_jbtest/jbtest_inst/dataWord_next
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_jbtest/jbtest_inst/headCnt_next
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_jbtest/jbtest_inst/headCnt_reg
#add wave -noupdate -expand -group TOP -expand -group headerGen /tb_jbtest/jbtest_inst/ctrlState
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_jbtest/jbtest_inst/state_reg
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_jbtest/jbtest_inst/dataRdy_next
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_jbtest/jbtest_inst/dataRdy_reg
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_jbtest/jbtest_inst/dataRdy
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_jbtest/jbtest_inst/dataWord
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_jbtest/jbtest_inst/dwaClk100
add wave -noupdate -expand -group TOP -expand -group headerGen /tb_jbtest/jbtest_inst/headDataList
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
