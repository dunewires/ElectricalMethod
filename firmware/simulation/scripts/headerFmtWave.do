onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group topTA -expand /tb_adc_emu/top_tension_analyzer_1/toDaqReg
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/senseWireDataStrb
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/senseWireDataSel
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/senseWireData
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/sendRunHdr
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/sendAdcData
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/mainsTrig_filter
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/mainsTrig
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/mainsSquare_del2
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/mainsSquare_del1
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/mainsSquare
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/led
add wave -noupdate -group topTA -expand /tb_adc_emu/top_tension_analyzer_1/fromDaqReg
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/freqReqAxi
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/freqReq
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/fifoAdcData_wen
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/fifoAdcData_ren
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/fifoAdcData_rdBusy
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/fifoAdcData_pf
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/fifoAdcData_ff
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/fifoAdcData_ef
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/fifoAdcData_dout
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/fifoAdcData_din
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/dwaClk100
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/dwaClk10
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/dpotShdn_b
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/dpotSdo
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/dpotSdi
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/dpotSck
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/dpotPr_b
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/dpotMag
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/dpotCs_b
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/DAC_SDI
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/DAC_LD_B
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/DAC_CS_B
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/DAC_CLR_B
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/DAC_CLK
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/CoilDrive
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/auto
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/adcStart
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/adcSrcSyncClk
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/adcSck
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/adcDone
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/adcDataSerial
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/adcCnv_nPeriod
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/adcCnv_nCnv
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/adcCnv
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/adcBusy
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/adcAutoDc_af
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/acStimX200_periodCnt
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/acStimX200_oddr
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/acStimX200_obuf
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/acStimX200_nHPeriodAuto
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/acStimX200_nHPeriod
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/acStimX200
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/acStim_trigger
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/acStim_oddr
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/acStim_nHPeriod
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/acStim_mag
add wave -noupdate -group topTA /tb_adc_emu/top_tension_analyzer_1/acStim_enable
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/toDaqReg
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/timerCnt
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/sendRunHdr
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/sendAdcData
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/scanDone
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/fromDaqReg
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/dwaClk100
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/ctrlState
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/ctrlStart_del
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcStart
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcDone
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcBusy
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcAutoDc_af
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/acStimX200_nHPeriod
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/acStim_enable
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/fromDaqReg
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/toDaqReg
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/runOdometer
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/fpgaSerialNum
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpDataRen
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/sendRunHdr
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/sendAdcData
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/sendStatusHdr
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/firmwareId_date
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/firmwareId_hash
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/stimPeriodActive
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/stimPeriodCounter
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcSamplingPeriod
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcDataRdy
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcDataRen
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcData
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/reset
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/dwaClk100
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/state_reg
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/state_next
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/rqstType
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/registerId
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpHdrRen
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcIdx
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headADataList
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headFDataList
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headCDataList
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headEDataList
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headCnt_reg
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headCnt_next
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpDataRdy_reg
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpDataRdy_next
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcRegNum
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcSamplesPerFreq
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpCnt_reg
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpCnt_next
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpPktCnt
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/REG_RUN
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/REG_STATUS
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadA
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadALog
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadF
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadFLog
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadC
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadCLog
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadE
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadElog
add wave -noupdate -expand -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadLog
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/trigger
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/timerCnt
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/reset
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dwaClk100
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelStrb
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelSsclkEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelSsclkDwa
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelSsclk
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallel
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
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/acStim_nHPeriod
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {301076052 fs} 0}
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
WaveRestoreZoom {0 fs} {4769172778 fs}
