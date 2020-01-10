import configparser
import json

config = configparser.ConfigParser()
config.read('dwaConfig.ini')

myfibs = json.loads(config.get("Foo", "fibs"))
print(type(myfibs))
print(myfibs)
print()
print(type(config.get("fpga","mykey")))
print(config.get("fpga","mykey"))
mybars = json.loads(config.get("Bar", "files_to_check"))
print(type(mybars))
print(mybars)

