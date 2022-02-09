Continuity Instruction/Steps 

#1. 
1-1. perform DWA scan with calibration board (47pF, 100pF. 150pF, 220pF)
1-2. Organize the scan data following the structure guide at the top of makeTxt4Cap.py (example: JasonFiles2)
1-3. run 'python makeTxt4Cap.py Json_Scan_File'
1-4. This file will produce two text files (extractFromJson.txt and nameData.txt)
1-5. The first file, extractFromJson.txt has the [Cap, Frequency, Amplitude] data 
1-6. The second file, nameData.txt file just outputs the list of the name of the APA channel tested 
1-7. run 'python CalibrationPickle.py' 
1-8. it will create a dictionary, where key is the name of the APA channel and the contents is the calibration factor
1-9. This result will be pickled as fit.picckle
