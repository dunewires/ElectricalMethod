# Continuity Instruction/Steps 

## 1. Steps to get the calibration factors for each DWA
* perform DWA scan with calibration board (47pF, 100pF. 150pF, 220pF). 

* Organize the scan data following the structure guide at the top of makeTxt4Cap.py (example: [continuityScan](https://github.com/dunewires/ElectricalMethod/tree/development/DAQ/python/Continuity/continuityScan))

* run 
```bash
python makeTxt4Cap.py Json_Scan_File
```

* This file will produce two text files ([extractFromJson.txt](https://github.com/dunewires/ElectricalMethod/blob/development/Continuity/extractFromJson.txt) and [nameData.txt](https://github.com/dunewires/ElectricalMethod/blob/development/Continuity/nameData.txt))

* The first file, [extractFromJson.txt](https://github.com/dunewires/ElectricalMethod/blob/development/Continuity/extractFromJson.txt) has the {Cap, Frequency, Amplitude} data 

* The second file, [nameData.txt](https://github.com/dunewires/ElectricalMethod/blob/development/Continuity/nameData.txt) just has the list of the name of the APA channel tested 

* run 
```bash
python CalibrationPickle.py' 
```

* it will create a dictionary, where key is the name of the APA channel and the contents is the calibration factor

* This result will be pickled as [fit.picckle](https://github.com/dunewires/ElectricalMethod/blob/development/Continuity/fit.pickle)

## 2. Steps to get theh calibrated capacitance values with DWA scan 
* run 
```bash
wireCapCalc.py YEAR TYPE
```

* Here, YEAR is the year when the scan was taken (2020/2021/... etc), and TYPE should be either A or B. A and B stands for After and Before the calibration respectively. 

* The result will be plotted, and also be saved as text file as  [wireChannelResult_A.txt](https://github.com/dunewires/ElectricalMethod/blob/development/Continuity/wireChannelResult_A.txt) or [wireChannelResult_B.txt](https://github.com/dunewires/ElectricalMethod/blob/development/Continuity/wireChannelResult_B.txt)
 
