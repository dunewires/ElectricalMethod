#%%
import DwaMicrozed as duz
from contextlib import redirect_stdout
from os import devnull

serial_number_int = 0

while serial_number_int < 31 or serial_number_int > 40:
    print('Enter serial number of analog board (31-40):')
    serial_number_input = input()
    serial_number_int = int(serial_number_input)

serial_number = format(serial_number_int, '08X')

# IP adress starts with 192.168.140 to be compatible with PLC (avoid ending with .10 or .11)
ip_address = 'C0A88C'+format(serial_number_int, '02X')

# Use similar MAC address to default one but with ending changed
mac_address_msb = '00842B2B'
mac_address_lsb = '0097DA'+format(serial_number_int, '02X')

print('Initializing DWA serial number, local IP address and MAC address...')

devnull_file open(devnull, 'w')
with redirect_stdout(devnull_file):
    # Use default IP address, triggered by hardware jumper between pins 0 and 1 on 2x4 header
    uz = duz.DwaMicrozed(ip='140.247.123.186')
    uz.initialize_dwa(serial_number, ip_address, mac_address_msb, mac_address_lsb)

print('Initialized DWA serial number, local IP address and MAC address.')
print('Validating values from firmware...')
# Read back values and convert
with redirect_stdout(devnull_file):
    serial_number_output = uz.readValue('00000032')[2]
    ip_adress_output = uz.readValue('00000032')[2]
    mac_adress_msb_output = uz.readValue('00000032')[2]
    mac_adress_lsb_output = uz.readValue('00000032')[2]

if (serial_number, ip_address, mac_address_msb, mac_address_lsb) == (serial_number_output, ip_address_output, mac_address_msb_output, mac_address_lsb_output):
    ip_address_split = [str(int(ip_address[i:i+2], 16)) for i in range(0, len(ip_address), 2)]
    mac_address = mac_address_msb[2:] + mac_address_lsb[2:]
    mac_address_split = [mac_address[i:i+2] for i in range(0, len(mac_address), 2)]
    print('Validated values:')
    print('DWA serial number: ' + serial_number_input)
    print('Local IP address: ' + '.'.join(ip_address_split))
    print('MAC address: ' + ':'.join(mac_address_split))

else:
    raise ValueError('Read back initialization values do not correspond to written initialization values.')