onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_adc_emu/mainsSquare
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/wordCnt
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/waitCnt
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/vioUpdate_del2
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/vioUpdate_del1
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/vioUpdate
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/updateLatch_cdc2
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/updateLatch_cdc1
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/updateLatch
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/updateBusy_cdc2
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/updateBusy_cdc1
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/updateBusy
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/toDaqReg
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/stateDbg
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sNDone
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/shiftRegIn
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/shiftReg
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/serialCmd
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/serialAddress
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sdoEn_del
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sdoEn
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sdo_del
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sdo
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sdaState
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sda
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/sclHold
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/scl
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/isTx
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/fromDaqReg
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/forceUpdate
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/dwaClkSer
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/dwaClk100
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/dwaClk10
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/commStateNext
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/commState
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/cmdStateNext
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/cmdState
add wave -noupdate -expand -group {serial PROM} /tb_adc_emu/top_tension_analyzer_1/serialPromInterface_inst/bitCnt
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/updateLatch_cdc2
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/updateLatch_cdc1
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/updateLatch
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/waitCnt
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/toDaqReg
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/stringLength
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/stringCnt
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/srclr_b
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/shiftRegOut
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/shiftRegIn
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/shiftCnt
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/serialStringOut
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/sdo
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/sdi
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/sck
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/relayCfgState
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/rck
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/g_b
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/fromDaqReg
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/dwaClk2
add wave -noupdate -group coilDrive /tb_adc_emu/top_tension_analyzer_1/wireRelayInterface_inst/clkEn
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/toDaqReg
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/stimFreqReq
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/senseWireMNSDataStrb
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/senseWireMNSData
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/senseWireDataStrb
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/senseWireDataSel
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/senseWireData
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/sendRunHdr
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/sendAdcData
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/noiseResetBusy
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/noiseReadoutBusy
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/mainsTrig_filter
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/mainsTrig
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/mainsSquare_del2
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/mainsSquare_del1
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/mainsSquare
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/led
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/hGStateDbg
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/fromDaqReg
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/fifoAdcData_ren
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/fifoAdcData_rdBusy
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/fifoAdcData_pf
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/fifoAdcData_ff
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/fifoAdcData_ef
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/dwaClk100
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/dwaClk10
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/dpotShdn_b
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/dpotSdo
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/dpotSdi
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/dpotSck
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/dpotPr_b
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/dpotMag
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/dpotCs_b
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/DAC_SDI
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/DAC_LD_B
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/DAC_CS_B
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/DAC_CLR_B
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/DAC_CLK
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/ctrlFreqSet
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/ctrl_acStim_enable
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/auto
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/adcStart
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/adcSrcSyncClk
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/adcSck
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/adcDataSerial
add wave -noupdate -group rop -expand /tb_adc_emu/top_tension_analyzer_1/adcData
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/adcCnv_nPeriod
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/adcCnv_nCnv
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/adcCnv
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/adcBusy
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/adcAutoDc_af
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/acStimX200_periodCnt
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/acStimX200_oddr
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/acStimX200_obuf
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/acStimX200_nHPeriodAuto
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/acStimX200_nHPeriod
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/acStimX200
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/acStim_trigger
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/acStim_oddr
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/acStim_nHPeriod
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/acStim_mag
add wave -noupdate -group rop /tb_adc_emu/top_tension_analyzer_1/acStim_enable
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcBusy_del
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/noiseResetBusy
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/noiseReadoutCnt
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/noiseReadoutBusy
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/freqSet
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
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcBusy
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/adcAutoDc_af
add wave -noupdate -group wtaCtrl /tb_adc_emu/top_tension_analyzer_1/wtaController_inst/acStim_enable
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/fromDaqReg
add wave -noupdate -group headerGen -childformat {{/tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/toDaqReg.udpDataWord -radix decimal}} -expand -subitemconfig {/tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/toDaqReg.udpDataWord {-format Analog-Step -height 84 -max 1124073872.0 -min -1431699454.0 -radix decimal}} /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/toDaqReg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/runOdometer
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/fpgaSerialNum
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/sendRunHdr
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/sendAdcData
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/sendStatusHdr
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/firmwareId_date
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/firmwareId_hash
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/stimPeriodActive
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/stimPeriodCounter
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcSamplingPeriod
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcDataRdy
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcDataRen
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcData
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/dwaClk100
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/state_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/state_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/rqstType
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/registerId
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcIdx
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headADataList
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headFDataList
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headCDataList
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headEDataList
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headCnt_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/headCnt_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpDataRdy_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpDataRdy_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcRegNum
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/adcSamplesPerFreq
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpCnt_reg
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpCnt_next
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/udpPktCnt
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/REG_RUN
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/REG_STATUS
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadA
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadALog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadF
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadFLog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadC
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadCLog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadE
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadElog
add wave -noupdate -group headerGen /tb_adc_emu/top_tension_analyzer_1/headerGenerator_inst/nHeadLog
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
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcStart
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcCnv
add wave -noupdate -group adcReadout /tb_adc_emu/top_tension_analyzer_1/adcReadout_inst/adcBusy
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/toDaqReg
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/senseWireMNSDataStrb
add wave -noupdate -group {noise correction} -expand /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/senseWireMNSData
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/senseWireDataStrb
add wave -noupdate -group {noise correction} -expand /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/senseWireData
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/senseWireAccDataStrb
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/senseWireAccData
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/resetNoiseData
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/resetBusy
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/noiseReadoutBusy_del
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/noiseReadoutBusy
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/noiseDataEn
add wave -noupdate -group {noise correction} -expand /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/noiseData
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/mem_rstb_busy
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/mem_rstb
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/mem_rsta_busy
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/mem_resetBBusy
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/mem_resetABusy
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/fromDaqReg
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/cnvCnt
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/freqSet
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/dwaClk100
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/cnvPeriodCnt
add wave -noupdate -group {noise correction} /tb_adc_emu/top_tension_analyzer_1/mainsNoiseCorrection_inst/adcStart
add wave -noupdate -group dpot /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/dpotState
add wave -noupdate -group dpot /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/update
add wave -noupdate -group dpot /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/shiftReg
add wave -noupdate -group dpot /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/shiftCnt
add wave -noupdate -group dpot /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/shdn_b
add wave -noupdate -group dpot /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/serialString
add wave -noupdate -group dpot /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/sdo
add wave -noupdate -group dpot /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/sdi
add wave -noupdate -group dpot /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/sck
add wave -noupdate -group dpot /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/pr_b
add wave -noupdate -group dpot /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/cs_b
add wave -noupdate -group dpot /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/clkEn
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/toDaqReg.senseWireGain
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/sdi
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/writeReg
add wave -noupdate /tb_adc_emu/top_tension_analyzer_1/dpotInterface_inst/shiftReg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {266800100000 fs} 0}
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
WaveRestoreZoom {261744623525 fs} {266441655941 fs}
