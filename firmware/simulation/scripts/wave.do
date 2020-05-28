onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/senseWireDataStrb
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/senseWireDataSel
add wave -noupdate -group top -subitemconfig {/tb_adc_emu/top_tension_analyzer_1/senseWireData(7) {-format Analog-Step -height 84 -max 80.0} /tb_adc_emu/top_tension_analyzer_1/senseWireData(6) {-format Analog-Step -height 84 -max 80.0} /tb_adc_emu/top_tension_analyzer_1/senseWireData(5) {-format Analog-Step -height 84 -max 80.0} /tb_adc_emu/top_tension_analyzer_1/senseWireData(4) {-format Analog-Step -height 84 -max 80.0} /tb_adc_emu/top_tension_analyzer_1/senseWireData(3) {-format Analog-Step -height 84 -max 80.0} /tb_adc_emu/top_tension_analyzer_1/senseWireData(2) {-format Analog-Step -height 84 -max 80.0} /tb_adc_emu/top_tension_analyzer_1/senseWireData(1) {-format Analog-Step -height 84 -max 80.0} /tb_adc_emu/top_tension_analyzer_1/senseWireData(0) {-format Analog-Step -height 84 -max 80.0}} /tb_adc_emu/top_tension_analyzer_1/senseWireData
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/regToDwa
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/regFromDwa_strb
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/regFromDwa
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/mainsTrig_filter
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/mainsTrig
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/mainsSquare_del2
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/mainsSquare_del1
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/mainsSquare
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/mainsMinus_wen
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/mainsMinus_enable
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/mainsMinus_data
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/m_axis_tvalid
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/m_axis_tready
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/m_axis_tid
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/m_axis_tdata
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/m_axis_resetn
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/led
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/headDataStrb
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/headData
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/HASH_CODE
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/freqReq_vio
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/freqReq
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/fifoAutoDC_wen
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/fifoAutoDC_ren
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/fifoAutoDC_rdBusy
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/fifoAutoDC_ff
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/fifoAutoDC_ef
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/fifoAutoDC_dout
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/fifoAutoDC_din
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/dwaClk100
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/dwaClk10
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/dpotShdn_b
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/dpotSdo
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/dpotSdi
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/dpotSck
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/dpotPr_b
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/dpotMag
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/dpotCs_b
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/DATE_CODE
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/DAC_SDI
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/DAC_LD_B
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/DAC_CS_B
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/DAC_CLR_B
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/DAC_CLK
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/ctrl_stimTime
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/ctrl_freqStep
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/ctrl_freqSet
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/ctrl_freqMin
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/ctrl_freqMax
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/ctrl_ctrlStart
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/ctrl_busy_del
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/ctrl_busy
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/ctrl_adcFifo_af
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/ctrl_adc_nSamples
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/ctrl_acStim_nPeriod
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/ctrl_acStim_enable
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/crtl_finish
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/CoilDrive
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/BB_CLK_P
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/BB_CLK_N
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/auto
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcStart
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcSrcSyncClk
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcSck
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcSamp_nStimPeriodSamp
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcSamp_nStimPeriod
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcHScale
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcDone
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcDataSerial
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcCnv_nPeriod
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcCnv_nCnv
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcCnv
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcBusy
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcAutoDc_wen
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcAutoDC_dValid
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcAutoDC_data
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcAutoDc_chSel
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/adcAutoDc_af
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/acStimX200_periodCnt
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/acStimX200_oddr
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/acStimX200_obuf
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/acStimX200_nPeriod
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/acStimX200
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/acStim_oddr
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/acStim_nPeriod
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/acStim_mag
add wave -noupdate -group top /tb_adc_emu/top_tension_analyzer_1/acStim_enable
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/timerCnt
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/stimTime
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/status
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/scanDone
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/reset
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/headDataStrb
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/headDataBeginCnt
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/headDataBegin
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/headDataAdcCnt
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/headDataAdc
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/headData
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/freqStep
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/freqSet
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/freqMin
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/freqMax
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/dwaClk100
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/ctrlState
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/ctrlStart_del
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/ctrlStart
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/ctrlBusy
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcStart
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcDone
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcCnv_nPeriod
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcCnv_nCnv
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcBusy
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcAutoDc_af
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/acStim_nPeriod
add wave -noupdate -group ctrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/acStim_enable
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/trigger
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/timerCnt
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/reset
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dwaClk100
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelStrb
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelSsclkEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelSsclkDwa
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelSsclk
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallel
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/ctrlState_next
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/ctrlState
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/cnvSyncStrb
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/cnvPeriodCnt
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/cnvCnt
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcStart
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSrcSyncClkEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSrcSyncClkDwa
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSrcSyncClk
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSckEnableEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSckEnable
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSckEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSck
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcDone
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcDataSerialEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcDataSerialDwa
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv_nPeriod
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv_nCnv
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcBusy
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/acStim_nPeriod
add wave -noupdate -expand -group adcDds /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adc_dds_io_inst/tvalid
add wave -noupdate -expand -group adcDds /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adc_dds_io_inst/tdata
add wave -noupdate -expand -group adcDds /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adc_dds_io_inst/sinGenData
add wave -noupdate -expand -group adcDds /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adc_dds_io_inst/sinGenChan
add wave -noupdate -expand -group adcDds /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adc_dds_io_inst/dwaClk100
add wave -noupdate -expand -group adcDds /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adc_dds_io_inst/adcSrcSyncClk
add wave -noupdate -expand -group adcDds /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adc_dds_io_inst/adcSck
add wave -noupdate -expand -group adcDds /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adc_dds_io_inst/adcDataSerial
add wave -noupdate -expand -group adcDds /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adc_dds_io_inst/adcDataPar
add wave -noupdate -expand -group adcDds /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adc_dds_io_inst/adcCnv_del
add wave -noupdate -expand -group adcDds /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adc_dds_io_inst/adcCnv
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
WaveRestoreZoom {233494570088 fs} {240342391049 fs}
