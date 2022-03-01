import DwaMicrozed as duz
from contextlib import redirect_stdout
from os import devnull

print('Beginning of DWA hardware test.')

digipots = 'FFDDBB9977553311'
stimMag = '012'
relays = {}
relays['relayWireBot0'] = '00001111'
relays['relayWireBot1'] = '00002222'
relays['relayWireBot2'] = '00003333'
relays['relayWireBot3'] = '00004444'
relays['relayBusBot0'] = '00005555'
relays['relayBusBot1'] = '00006666'
relays['relayWireTop0'] = '00007777'
relays['relayWireTop1'] = '00008888'
relays['relayWireTop2'] = '00009999'
relays['relayWireTop3'] = '0000AAAA'
relays['relayBusTop0'] = '0000BBBB'
relays['relayBusTop1'] = '0000CCCC'

print('Writing values for digipots, AC amplitude and relays to firmware...')
devnull_file = open(devnull, 'w')
with redirect_stdout(devnull_file):
    # Use default IP address, triggered by hardware jumper between pins 0 and 1 on 2x4 header
    uz = duz.DwaMicrozed(ip='140.247.123.186')
    uz.sleepPostWrite = 0.5
    uz.setDigipots(digipots)
    uz.setStimMag(stimMag)
    uz.setRelays(relays)
print('Done.')

print('Reading back values for digipots, AC amplitude and relays from firmware...')
with redirect_stdout(devnull_file):
    digipots_read_low = format(uz.readValue('0000000F')[2], '08X')
    digipots_read_high = format(uz.readValue('00000010')[2], '08X')
    stimMag_read = format(uz.readValue('00000008')[2], '03X')
    relays_read = {}
    relays_read['relayWireBot0'] = format(uz.readValue('00000020')[2], '08X')
    relays_read['relayWireBot1'] = format(uz.readValue('00000021')[2], '08X')
    relays_read['relayWireBot2'] = format(uz.readValue('00000022')[2], '08X')
    relays_read['relayWireBot3'] = format(uz.readValue('00000023')[2], '08X')
    relays_read['relayBusBot0'] = format(uz.readValue('00000024')[2], '08X')
    relays_read['relayBusBot1'] = format(uz.readValue('00000025')[2], '08X')
    relays_read['relayWireTop0'] = format(uz.readValue('00000026')[2], '08X')
    relays_read['relayWireTop1'] = format(uz.readValue('00000027')[2], '08X')
    relays_read['relayWireTop2'] = format(uz.readValue('00000028')[2], '08X')
    relays_read['relayWireTop3'] = format(uz.readValue('00000029')[2], '08X')
    relays_read['relayBusTop0'] = format(uz.readValue('0000002A')[2], '08X')
    relays_read['relayBusTop1'] = format(uz.readValue('0000002B')[2], '08X')
print('Done.')

values_written = (digipots, stimMag, relays)
values_read = (digipots_read_high + digipots_read_low, stimMag_read, relays_read)
if values_written == values_read:
    print('Values successfully written and read back.')
else:
    raise ValueError(f'Values not successfully written and read back: {values_written = } not equal to {values_read = }')

print('End of hardware test.')


print('Beginning of DWA initializtion.')

serial_number_int = 0

while serial_number_int < 31 or serial_number_int > 40:
    print('Enter serial number of analog board (31-40):')
    serial_number_input = input()
    serial_number_int = int(serial_number_input)

serial_number = format(serial_number_int, '08X')

# IP adress starts with 192.168.140 to be compatible with PLC (avoid ending with .10 or .11 for possible conflict with winder computers)
ip_address = 'C0A88C'+format(serial_number_int, '02X')

# Use similar MAC address to default one but with ending changed
mac_address_msb = '00842B2B'
mac_address_lsb = '0097DA'+format(serial_number_int, '02X')

print('Initializing DWA serial number, local IP address and MAC address...')

with redirect_stdout(devnull_file):
    # Use default IP address, triggered by hardware jumper between pins 0 and 1 on 2x4 header
    uz.dwaInitialize(serial_number, ip_address, mac_address_msb, mac_address_lsb)
print('Done.')

print('Reading back values for DWA serial number, local IP address and MAC address from firmware...')
# Read back values and convert
with redirect_stdout(devnull_file):
    serial_number_read = format(uz.readValue('00000032')[2], '08X')
    ip_address_read = format(uz.readValue('00000032')[2], '08X')
    mac_address_msb_read = format(uz.readValue('00000032')[2], '08X')
    mac_address_lsb_read = format(uz.readValue('00000032')[2], '08X')
print('Done.')

values_written = (serial_number, ip_address, mac_address_msb, mac_address_lsb)
values_read = (serial_number_read, ip_address_read, mac_address_msb_read, mac_address_lsb_read)
if values_written == values_read:
    ip_address_split = [str(int(ip_address[i:i+2], 16)) for i in range(0, len(ip_address), 2)]
    mac_address = mac_address_msb[2:] + mac_address_lsb[2:]
    mac_address_split = [mac_address[i:i+2] for i in range(0, len(mac_address), 2)]
    print('Values successfully written and read back.')
    print('DWA serial number: ' + serial_number_input)
    print('Local IP address: ' + '.'.join(ip_address_split))
    print('MAC address: ' + ':'.join(mac_address_split))
else:
    raise ValueError(f'Values not successfully written and read back: {values_written=} not equal to {values_read=}')

print('End of DWA initializtion.')
