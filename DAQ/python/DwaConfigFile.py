import configparser
import string
import logging
logger = logging.getLogger(__name__)

SECTIONS = ["FPGA","DAQ"]

class DwaConfigFile():

    def __init__(self, filename, sections=None):
        self.sections = SECTIONS[:] if sections is None else sections
        self.load(filename)
        print("FINAL VERSION:")
        print(self.config)


    def load(self, filename):
        print(f"Config filename: {filename}")
        self.configIsValid = False
        self.sectionIsValid = {}
        for sec in self.sections:
            self.sectionIsValid[sec] = False
        self.fname = filename
        self.setDefaults()
        self.ingest()
        self.setValidOptions()
        self.config = {}
        self.invalidEntries = {}
        self.parse()
        self.validate()
        self.postProcess()
        
    def ingest(self):
        # read in the config file as raw text
        with open(self.fname) as fh:
            self.rawText = fh.read()

    def getRawText(self):
        return self.rawText
        
    def setValidOptions(self):
        self.validOptions = {}
        self.validOptions["FPGA"] = ["auto",
                                     "stimFreqReq", "stimFreqMin", "stimFreqMax", "stimFreqStep",
                                     "stimTime", "stimMag", "stimTimeInitial",
                                     "cyclesPerFreq", "adcSamplesPerCycle",
                                     # "relayMask", "coilDrive",  # v2 only (defunct)
                                     "digipot",
                                     "client_IP",
                                     "noiseFreqMin", "noiseFreqMax", "noiseFreqStep",
                                     "noiseSettlingTime", "noiseSamplingPeriod", "noiseAdcSamplesPerFreq",
                                     "relayWireTop", "relayWireBot", "relayBusTop", "relayBusBot"]

        self.validOptions["DAQ"] = ["DWA_IP", "statusPeriodSec", "verbose"]

    def parse(self):
        """Parse the DWA configuration parameters from a file
        """
        # Can use lists in this configuration file with:
        # [Foo]
        # fibs: [1,1,2,3,5,8,13]
        # >>> json.loads(config.get("Foo","fibs"))
        # [1, 1, 2, 3, 5, 8, 13
        # see: https://stackoverflow.com/questions/335695/lists-in-configparser

        cp = configparser.ConfigParser(inline_comment_prefixes="#", strict=False,
                                       empty_lines_in_values=False)
        cp.optionxform = str  # preserve case of keys
        cp.read(self.fname)

        for SEC in self.sections:
            print(f"Parsing section {SEC}")
            self.config[SEC] = {}
            # get a list of keys
            # read in the key=val pairs
            # but only use the valid keys that are listed above
            # if a valid key is absent from the config file, return None
            # This is different from "key=" with an empty value, which returns ""
            for option in self.validOptions[SEC]:
                try:
                    self.config[SEC][option] = cp.get(SEC, option, fallback=None)
                except:
                    print("EXCEPTION: not sure why/how...")
            
            # which options were ignored?
            options = cp.options(SEC)
            print("Options present in the config file = ")
            print(options)
            for option in options:
                #if option not in self.validOptions[SEC]:
                if option not in self.config[SEC]:
                    print(f"WARNING: option in config file was ignored: {option}")

        print("Done reading the config file")
        print(self.config)
        print("\n")


    def setDefaults(self):
        self.defaults = {}
        for SEC in SECTIONS:
            self.defaults[SEC] = {}
        
        # setting noiseFreqMax=noiseFreqMin "turns off" mains noise subtraction
        self.defaults["FPGA"]["noiseFreqMin"]           = "00000370"  # [1/16Hz]
        self.defaults["FPGA"]["noiseFreqMax"]           = "00000370"  # [1/16Hz] 
        self.defaults["FPGA"]["noiseFreqStep"]          = "00000010"  # [1/16Hz]
        self.defaults["FPGA"]["noiseAdcSamplesPerFreq"] = "00000100"  # [unitless] (256 samples) limited to 256
        self.defaults["FPGA"]["noiseSamplingPeriod"]    = "0000CB73"  # [10ns]   32 samp/cycle @ 60 Hz
        self.defaults["FPGA"]["noiseSettlingTime"]      = "00001000"  # [2.56us]  "00001000" ~ 10ms
        #
        self.defaults["FPGA"]["stimTimeInitial"]   = "00060000"  # [2.56us]  "00060000" ~ 1.01 seconds
        #
        self.defaults["FPGA"]["relayWireTop"]  = "0000000000000000" # 64-bit  top3top2top1top0
        self.defaults["FPGA"]["relayWireBot"]  = "0000000000000000" # 64-bit  bot3bot2bot1bot0
        self.defaults["FPGA"]["relayBusTop"]   = "00000000"         # 32-bit  top1top0
        self.defaults["FPGA"]["relayBusBot"]   = "00000000"         # 32-bit  bot1bot0


        # 
        self.defaults["DAQ"]["statusPeriodSec"] = 1  # seconds (float)
        self.defaults["DAQ"]["verbose"]         = 1  # verbosity level (integer)
        
    def validate(self):
        """ validate the values read from a config file
        Check for:
        * Missing keys (replace with defaults where appropriate)
        * Empty values
        * Valid digipot settings
        * FIXME: IP address
        """

        print("Validating entries in the config file...")
        
        # Check for missing and empty entries
        for SEC in self.sections:
            self.invalidEntries[SEC] = {}
            configParams = self.config[SEC].keys()
            for cp in configParams:
                if self.config[SEC][cp] == None:
                    if cp in self.defaults[SEC]:
                        print(f"  WARNING: missing key: {cp}, using default: {self.defaults[SEC][cp]}")
                        self.config[SEC][cp] = self.defaults[SEC][cp]
                    else:
                        print(f"  ERROR: missing key: {cp}")
                        self.invalidEntries[SEC][cp] = "Key is missing"
                elif self.config[SEC][cp].strip() == "":
                    if cp in self.defaults[SEC]:
                        print(f"  WARNING: empty value: {cp}, using default: {self.defaults[SEC][cp]}")
                        self.config[SEC][cp] = self.defaults[SEC][cp]
                    else:
                        print(f"  ERROR: empty value: {cp}")
                        self.invalidEntries[SEC][cp] = "Value is empty"
                        
        if 'FPGA' in self.sections:
            # Validate IP address format
            # FIXME: check that format is either: a.b.c.d
            #        or a hex version of that (8 characters, each pair is a number between 0 and 255)
            # see e.g. https://stackoverflow.com/questions/319279/how-to-validate-ip-address-in-python
    
            # Validate the digipot entry
            # must be 8 x 8-bit hex values
            digi = self.config['FPGA']['digipot']
            if len(digi) != 16:
                self.invalidEntries['FPGA']['digipot'] = f"Expecting 16 characters, got {len(digi)}: [{digi}]"
                print(f"  ERROR: digipot value incorrect length: [{digi}]")
            elif not all(c in string.hexdigits for c in digi):
                self.invalidEntries['FPGA']['digipot'] = f"Invalid hex string for digipot: [{digi}]"
                print(f"  ERROR: digipot value invalid hex string: [{digi}]")
    
    
            # Validate the v3 relay entries (192 bits total)
            print("FIXME: need to add v3 relay validation")
    
            #else:  # verify the content of the string are valid for our digipots (8-bit hex strings)
            #    nDigipots = 8
            #    digiVals = [digi[2*x:2*x+2] for x in range(nDigipots)]
            #    for dv in digiVals:
            #        try:
            #            base = 16
            #            if int(dv, base) > 255:
            #                self.invalidEntries['FPGA']['digipot'] = f"Digipot setting too large: [{digi}] [{dv}]"
            #                print(f"  ERROR: digipot setting too large: [{digi}] [{dv}]")
            #        except:
            #            self.invalidEntries['FPGA']['digipot'] = f"Invalid hex string for digipot: [{digi}] [{dv}]"
            #            print(f"  ERROR: digipot value invalid hex string: [{digi}] [{dv}]")
            
        # Summary: were there any problems?
        self.configIsValid = True
        for SEC in self.sections:
            print(f"Summary of status of configuration file section {SEC}:")
            if len(self.invalidEntries[SEC]) == 0:
                print(f"  No errors found in the config file section {SEC}")
                self.sectionIsValid[SEC] = True
            else:
                self.sectionIsValid[SEC] = False
                self.configIsValid = False
                print(f"  Invalid entries in the config file section {SEC}:")
                for key, val in self.invalidEntries[SEC].items():
                    print(f"    {key}: {val}")

                
    def postProcess(self):

        if 'FPGA' in self.sections:
            # Convert to human readable values:
            # Frequencies to Hz:
            freqKeys = ['stimFreqReq', 'stimFreqMin', 'stimFreqMax', 'stimFreqStep']
            base = 16
            for fk in freqKeys:
                freq_Hz = float(int(self.config['FPGA'][fk], base)) / 16.
                self.config['FPGA'][f"{fk}_Hz"] = f"{freq_Hz:.4f}"
    
            hexToDecKeys = ['cyclesPerFreq', 'adcSamplesPerCycle']
            base = 16
            for hd in hexToDecKeys:
                val = int(self.config['FPGA'][hd], base)
                self.config['FPGA'][f"{hd}_dec"] = f"{val:d}"
    
            # stimTime (hex counts of 2.56us steps to seconds)
            stimTimes = ['stimTime', 'stimTimeInitial']
            base = 16
            for st in stimTimes:
                st_sec = int(self.config['FPGA'][st], base)*2.56e-6  # convert to seconds
                self.config['FPGA'][f'{st}_s'] = f"{st_sec:.3f}"
                
            # Split out the v3 relay register values, 16bits each
            # Bus relays (2 boards, 32bits each board)
            self.config['FPGA']["relayBusTop1"] = self.config['FPGA']["relayBusTop"][:4]
            self.config['FPGA']["relayBusTop0"] = self.config['FPGA']["relayBusTop"][4:]
            self.config['FPGA']["relayBusBot1"] = self.config['FPGA']["relayBusBot"][:4]
            self.config['FPGA']["relayBusBot0"] = self.config['FPGA']["relayBusBot"][4:]
            # Wire relays (2 boards, 64bits each board)
            self.config['FPGA']["relayWireTop3"] = self.config['FPGA']["relayWireTop"][:4]
            self.config['FPGA']["relayWireTop2"] = self.config['FPGA']["relayWireTop"][4:8]
            self.config['FPGA']["relayWireTop1"] = self.config['FPGA']["relayWireTop"][8:12]
            self.config['FPGA']["relayWireTop0"] = self.config['FPGA']["relayWireTop"][12:]
            # 
            self.config['FPGA']["relayWireBot3"] = self.config['FPGA']["relayWireBot"][:4]
            self.config['FPGA']["relayWireBot2"] = self.config['FPGA']["relayWireBot"][4:8]
            self.config['FPGA']["relayWireBot1"] = self.config['FPGA']["relayWireBot"][8:12]
            self.config['FPGA']["relayWireBot0"] = self.config['FPGA']["relayWireBot"][12:]

        if 'DAQ' in self.sections:
            # convert seconds into a hex string in units of 2.56 microseconds
            self.config['DAQ']['statusPeriodSec'] = int(self.config['DAQ']['statusPeriodSec'])
            self.config['DAQ']['statusPeriod'] = f"{int(self.config['DAQ']['statusPeriodSec'] / 2.56e-6):08X}"
            #statusPeriod_sec = int(self.config['DAQ']['statusPeriodSec'], base)*2.56e-6  # convert to seconds
            self.config['DAQ']['verbose'] = int(self.config['DAQ']['verbose'])
        
    def getConfigDict(self, section=None):
        if section == None:
            return self.config
        else:
            section = section.upper()
            if section not in SECTIONS:
                print(f"ERROR: Invalid section specified: {section}")
                print("Returning empty dictionary")
                return {}
            return self.config[section]
