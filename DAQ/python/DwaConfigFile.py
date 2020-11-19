import dwaTools as dwa  #FIXME: make these internal methods???
import configparser
import string
import logging
logger = logging.getLogger(__name__)


class DwaConfigFile():

    def __init__(self, filename):
        self.load(filename)
        print("FINAL VERSION:")
        print(self.config)


    def load(self, filename):
        print(f"Config filename: {filename}")
        self.configIsValid = False
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
                                     "stimTime", "stimMag",
                                     "cyclesPerFreq", "adcSamplesPerCycle",
                                     "relayMask", "coilDrive", "digipot",
                                     "client_IP",
                                     "noiseFreqMin", "noiseFreqMax", "noiseFreqStep",
                                     "noiseSettlingTime", "noiseSamplingPeriod", "noiseAdcSamplesPerFreq",
                                     "relayWireTop", "relayWireBot", "relayBusTop", "relayBusBot"]

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

        # get a list of keys in the FPGA section
        SECTION = "FPGA"
        # read in the key=val pairs
        # but only use the keys that are listed above
        # if a valid key is absent from the config file, return None
        # This is different from "key=" with an empty value, which returns ""
        for option in self.validOptions[SECTION]:
            try:
                self.config[option] = cp.get(SECTION, option, fallback=None)
            except:
                print("EXCEPTION: not sure why/how...")

        # which options were ignored?
        options = cp.options(SECTION)
        print("Options present in the config file = ")
        print(options)
        for option in options:
            #if option not in self.validOptions[SECTION]:
            if option not in self.config:
                print(f"WARNING: option in config file was ignored: {option}")

        print("Done reading the config file")
        print(self.config)
        print("\n")


    def setDefaults(self):
        self.defaults = {}
        # setting noiseFreqMax=noiseFreqMin "turns off" mains noise subtraction
        self.defaults["noiseFreqMin"]           = "00000370"  # [1/16Hz]
        self.defaults["noiseFreqMax"]           = "00000370"  # [1/16Hz] 
        self.defaults["noiseFreqStep"]          = "00000010"  # [1/16Hz]
        self.defaults["noiseAdcSamplesPerFreq"] = "00000100"  # [unitless] (256 samples) limited to 256
        self.defaults["noiseSamplingPeriod"]    = "0000CB73"  # [10ns]   32 samp/cycle @ 60 Hz
        self.defaults["noiseSettlingTime"]      = "00001000"  # [2.56us]  "00001000" ~ 10ms

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
        configParams = self.config.keys()
        for cp in configParams:
            if self.config[cp] == None:
                if cp in self.defaults:
                    print(f"  WARNING: missing key: {cp}, using default: {self.defaults[cp]}")
                    self.config[cp] = self.defaults[cp]
                else:
                    print(f"  ERROR: missing key: {cp}")
                    self.invalidEntries[cp] = "Key is missing"
            elif self.config[cp].strip() == "":
                if cp in self.defaults:
                    print(f"  WARNING: empty value: {cp}, using default: {self.defaults[cp]}")
                    self.config[cp] = self.defaults[cp]
                else:
                    print(f"  ERROR: empty value: {cp}")
                    self.invalidEntries[cp] = "Value is empty"

        # Validate IP address format
        # FIXME: check that format is either: a.b.c.d
        #        or a hex version of that (8 characters, each pair is a number between 0 and 255)
        # see e.g. https://stackoverflow.com/questions/319279/how-to-validate-ip-address-in-python

        # Validate the digipot entry
        # must be 8 x 8-bit hex values
        digi = self.config['digipot']
        if len(digi) != 16:
            self.invalidEntries['digipot'] = f"Expecting 16 characters, got {len(digi)}: [{digi}]"
            print(f"  ERROR: digipot value incorrect length: [{digi}]")
        elif not all(c in string.hexdigits for c in digi):
            self.invalidEntries['digipot'] = f"Invalid hex string for digipot: [{digi}]"
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
        #                self.invalidEntries['digipot'] = f"Digipot setting too large: [{digi}] [{dv}]"
        #                print(f"  ERROR: digipot setting too large: [{digi}] [{dv}]")
        #        except:
        #            self.invalidEntries['digipot'] = f"Invalid hex string for digipot: [{digi}] [{dv}]"
        #            print(f"  ERROR: digipot value invalid hex string: [{digi}] [{dv}]")
            
        # Summary: were there any problems?
        if len(self.invalidEntries) == 0:
            print("  No errors found in the config file")
            self.configIsValid = True
        else:
            self.configIsValid = False
            print("  Invalid entries in the config file:")
            for key, val in self.invalidEntries.items():
                print(f"    {key}: {val}")

                
    def postProcess(self):

        # Convert to human readable values:
        # Frequencies to Hz:
        freqKeys = ['stimFreqReq', 'stimFreqMin', 'stimFreqMax', 'stimFreqStep']
        base = 16
        for fk in freqKeys:
            freq_Hz = float(int(self.config[fk], base)) / 16.
            self.config[f"{fk}_Hz"] = f"{freq_Hz:.4f}"


        hexToDecKeys = ['cyclesPerFreq', 'adcSamplesPerCycle']
        for hd in hexToDecKeys:
            val = int(self.config[hd], base)
            self.config[f"{hd}_dec"] = f"{val:d}"


        # Split out the v3 relay register values, 16bits each
        # Bus relays (2 boards, 32bits each board)
        self.config["relayBusTop1"] = self.config["relayBusTop"][:4]
        self.config["relayBusTop0"] = self.config["relayBusTop"][4:]
        self.config["relayBusBot1"] = self.config["relayBusBot"][:4]
        self.config["relayBusBot0"] = self.config["relayBusBot"][4:]
        # Wire relays (2 boards, 64bits each board)
        self.config["relayWireTop3"] = self.config["relayWireTop"][:4]
        self.config["relayWireTop2"] = self.config["relayWireTop"][4:8]
        self.config["relayWireTop1"] = self.config["relayWireTop"][8:12]
        self.config["relayWireTop0"] = self.config["relayWireTop"][12:]
        #
        self.config["relayWireBot3"] = self.config["relayWireBot"][:4]
        self.config["relayWireBot2"] = self.config["relayWireBot"][4:8]
        self.config["relayWireBot1"] = self.config["relayWireBot"][8:12]
        self.config["relayWireBot0"] = self.config["relayWireBot"][12:]

        
    def getConfigDict(self):
        return self.config
