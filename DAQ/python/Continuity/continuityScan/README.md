# Directory storing all the calibration continuity scan #

The directory should include 8 subdirectories. 

1) 47L (stores 8 different configuration calibration scan)
2) 47R (stored 10 differenet configuration calibration scan)
3) 100L (stores 8 different configuration calibration scan)
4) 100R (stored 10 differenet configuration calibration scan)
5) 150L (stores 8 different configuration calibration scan)
6) 150R (stored 10 differenet configuration calibration scan)
7) 220L (stores 8 different configuration calibration scan)
8) 220R (stored 10 differenet configuration calibration scan)

L and R represents Left and Right, and the number in the subdirectory name is the value of capacitor on calibration board.
Inside each subdirectory, configuration scans are stored. 

Left subdirectory (47L, 100L, 150L, 220L) stores U1, U2, V17, V18, V33, V34, X17, and X18 configuration.
Right subdirectory (47R, 100R, 150R, 220R) stores U17, U18, U33, U34, V1, V2, X1, X2, X33, and X34 configuration.
The channels that get measured in each configuration can be found in this [excel sheet](https://docs.google.com/spreadsheets/d/1MbXsYzxeqTToQGv9gs0lDOcJWrgWE2vt3xvsC5aTyvI/edit#gid=449751801)
