# ElectricalMethod: QC for DUNE APA wires

## ⚠️ Use `stable` branch for production. ⚠️ 
The `master` branch contains all of the latest developments, but may not be stable. If you are not a developer and do not intend to test new features, check out the `stable` branch.
### Installation 

Clone this repository and out the `stable` branch with 
```
git clone https://github.com/dunewires/ElectricalMethod.git
cd ElectricalMethod
git checkout stable
```
Then, navigate to the `python` directory and install required packages with
```
cd DAQ/python
pip install -r requirements.txt
```
Finally, start the GUI application with
```
python dwaDAQ.py
```
