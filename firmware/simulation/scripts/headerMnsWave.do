onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcBusy_del
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/noiseReadoutCnt
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/noiseReadoutBusy
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/freqSet
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/toDaqReg
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/timerCnt
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/sendRunHdr
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/sendAdcData
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/scanDone
add wave -noupdate -group wtaCtrl -expand /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/fromDaqReg
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/dwaClk100
add wave -noupdate -group wtaCtrl -color {Light Blue} /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/ctrlState
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/ctrlStart_del
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcStart
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcBusy
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcAutoDc_af
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/acStim_enable
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcBusy_del
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/noiseReadoutCnt
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/noiseReadoutBusy
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/freqSet
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/toDaqReg
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/timerCnt
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/sendRunHdr
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/sendAdcData
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/scanDone
add wave -noupdate -group wtaCtrl -expand /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/fromDaqReg
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/dwaClk100
add wave -noupdate -group wtaCtrl -color {Light Blue} /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/ctrlState
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/ctrlStart_del
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcStart
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcBusy
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcAutoDc_af
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/acStim_enable
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpPktCnt
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpDataRdy_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpDataRdy_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpCnt_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpCnt_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/toDaqReg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/stimPeriodCounter
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/stimPeriodActive_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/stimPeriodActive
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/state_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/state_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/sendRunHdr
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/sendAdcData
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/runOdometer
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/rqstType_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/rqstType
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/registerId
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/REG_STATUS
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/REG_RUN
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadLog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadFLog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadF
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadElog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadE
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadCLog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadC
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadALog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadA
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headFDataList
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headEDataList
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headCnt_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headCnt_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headCDataList
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headADataList
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/fromDaqReg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/dwaClk100
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcSamplingPeriod_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcSamplingPeriod
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcSamplesPerFreq
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcRegNum
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcIdx_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcIdx
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcDataRen
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcDataRdy
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcData
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpPktCnt
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpDataRdy_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpDataRdy_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpCnt_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpCnt_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/toDaqReg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/stimPeriodCounter
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/stimPeriodActive_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/stimPeriodActive
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/state_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/state_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/sendRunHdr
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/sendAdcData
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/runOdometer
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/rqstType_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/rqstType
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/registerId
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/REG_STATUS
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/REG_RUN
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadLog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadFLog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadF
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadElog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadE
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadCLog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadC
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadALog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadA
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headFDataList
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headEDataList
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headCnt_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headCnt_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headCDataList
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headADataList
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/fromDaqReg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/dwaClk100
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcSamplingPeriod_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcSamplingPeriod
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcSamplesPerFreq
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcRegNum
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcIdx_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcIdx
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcDataRen
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcDataRdy
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcData
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/trigger
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/timerCnt
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/reset
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/fromDaqReg
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dwaClk100
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelStrb
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelSsclkEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelSsclkDwa
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelSsclk
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallel
add wave -noupdate -group adcReadout -color Red /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcStart
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/cnvSyncStrb
add wave -noupdate -group adcReadout -color Magenta /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv
add wave -noupdate -group adcReadout -color Cyan /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/cnvPeriodCnt
add wave -noupdate -group adcReadout -color Cyan /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv_nPeriodRn
add wave -noupdate -group adcReadout -color Cyan /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/cnvCnt
add wave -noupdate -group adcReadout -color Cyan /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv_nCnvRn
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/cnvDone
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSrcSyncClkEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSrcSyncClkDwa
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSrcSyncClk
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSckEnableEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSckEnable
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSckEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSck
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcDataSerialEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcDataSerialDwa
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv_nPeriod
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv_nCnv
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcBusy
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/trigger
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/timerCnt
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/reset
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/fromDaqReg
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dwaClk100
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelStrb
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelSsclkEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelSsclkDwa
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallelSsclk
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/dataParallel
add wave -noupdate -group adcReadout -color Red /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcStart
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/cnvSyncStrb
add wave -noupdate -group adcReadout -color Magenta /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv
add wave -noupdate -group adcReadout -color Cyan /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/cnvPeriodCnt
add wave -noupdate -group adcReadout -color Cyan /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv_nPeriodRn
add wave -noupdate -group adcReadout -color Cyan /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/cnvCnt
add wave -noupdate -group adcReadout -color Cyan /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv_nCnvRn
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/cnvDone
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSrcSyncClkEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSrcSyncClkDwa
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSrcSyncClk
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSckEnableEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSckEnable
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSckEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcSck
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcDataSerialEmu
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcDataSerialDwa
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv_nPeriod
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv_nCnv
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcBusy
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/vioProbeOut0
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/toDaqReg
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/senseWireMNSDataStrb
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/senseWireMNSData
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/senseWireDataStrb
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/senseWireData
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/noiseReadoutBusy
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/noiseCorrSamp
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/noiseAvg8
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/noiseAccum
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/mnsStatePos
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/mnsState
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/memWea
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/memDin
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/fromDaqReg
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/freqSet
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/freqPtr
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/freqInRange
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/dwaClk100
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/cnvCntStrb
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/cnvCnt
add wave -noupdate -group mns /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/adcStart
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/toDaqReg.senseWireGain
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/sdi
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/writeReg
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/shiftReg
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/phaseStep
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/phaseOFDone
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/phaseOF
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/odlyTap
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/odlyLd
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/fineCount
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/dwaClk200
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/clk200Step
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/bPClkPeriodCnt
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/bPClk
add wave -noupdate /tb_adc_emu/mainsSquare
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/toDaqReg.senseWireGain
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/sdi
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/writeReg
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/shiftReg
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/phaseStep
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/phaseOFDone
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/phaseOF
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/odlyTap
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/odlyLd
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/fineCount
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/dwaClk200
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/clk200Step
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/bPClkPeriodCnt
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/bandPassClkGen_inst/bPClk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {624060000000 fs} 0}
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
WaveRestoreZoom {0 fs} {30567177758572 fs}
