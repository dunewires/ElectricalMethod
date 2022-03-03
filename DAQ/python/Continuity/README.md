# Continuity Instruction/Steps 

## 1. Steps to get the calibration factors for each DWA
* perform DWA scan with calibration board (47pF, 100pF. 150pF, 220pF). 

* Organize the scan data following the structure guide at the top of makeTxt4Cap.py (example: [continuityScan](https://github.com/dunewires/ElectricalMethod/tree/development/DAQ/python/Continuity/continuityScan))

* run 
```bash
python makeTxt4Cap.py continuityScan
```

* This file will produce two text files ([extractFromJson.txt](https://github.com/dunewires/ElectricalMethod/blob/development/DAQ/python/Continuity/example/extractFromJson.txt) and [nameData.txt](https://github.com/dunewires/ElectricalMethod/blob/development/DAQ/python/Continuity/example/nameData.txt))

* The first file, [extractFromJson.txt](https://github.com/dunewires/ElectricalMethod/blob/development/DAQ/python/Continuity/example/extractFromJson.txt) has the {Cap, Frequency, Amplitude} data 

* The second file, [nameData.txt](https://github.com/dunewires/ElectricalMethod/blob/development/DAQ/python/Continuity/example/nameData.txt) just has the list of the name of the APA channel tested 

* run 
```bash
python CalibrationPickle.py' 
```

* it will create a dictionary, where key is the name of the APA channel and the contents is the calibration factor

* This result will be pickled as [fit.picckle](https://github.com/dunewires/ElectricalMethod/blob/development/DAQ/python/Continuity/fit.pickle)

## 2. Steps to get theh calibrated capacitance values and pass/fail for the continuity test with DWA scan 
* [capacitanceFile.py](https://github.com/dunewires/ElectricalMethod/blob/development/DAQ/python/Continuity/capacitanceFile.py) has a function 'connectivityTest' which returns an array of [channelNameArr, booleanArr, uncalibratedCapArr, calibratedCapArr]
