import socket
#import nmap
#import getmac
import urllib.request
import os
import sys
from channel_map import *


def configure_ip_addresses(client_ip=None):
    '''Return a dictionary of a configuration value for the IP address of the UDP receiver client, i.e. the computer running the DAQ, given the IP address of the client in format 'X.X.X.X'. If no client IP address is given, attempt finding it using a website.'''
    # TODO check if external IP should be used
    # TODO return dwa_ip

    # def configure_ip_addresses(dwa_mac=None, client_ip=None, dwa_ip=None):
    # '''Return a dictionary of configuration values for Format of input IP addresses: 'X.X.X.X' and format of input MAC address: 'XX:XX:XX:XX:XX:XX'.'''
    # def find_dwa_ip(computer_ip):
    #     return_ip = None
    #     nm = nmap.PortScanner()
    #     nm.scan(f'{computer_ip}/24', arguments='-sn')
    #     all_ips = nm.all_hosts()
    #     for ip in all_ips:
    #         if mac := getmac.get_mac_address(ip=ip) is not None:
    #             if dwa_mac.upper() == mac.upper():
    #                 return_ip = ip
    #                 break
    #     return return_ip

    # If no client IP is provided, get external IP address of computer by using website
    if client_ip is None:
        try:
            client_ip = urllib.request.urlopen('https://api.ipify.org').read().decode()
        except:
            raise ValueError('Could not find IP address of client. IP address of client needs to be provided manually.')

    # if dwa_ip is None:
    #     # If no DWA IP is provided, get external IP address of computer by using website
    #     if dwa_mac is not None:
    #         local_ip = socket.gethostbyname(socket.gethostname())
    #         dwa_ip = find_dwa_ip(local_ip)

    #         if dwa_ip is None:
    #             dwa_ip = find_dwa_ip(client_ip)

    #         if dwa_ip is None:
    #             raise ValueError("Could not find IP address of DWA. IP address of DWA needs to be provided manually.")
    #     else:
    #         raise ValueError("Need to provide either the MAC address or the IP address of the DWA.")
    # 
    # return {'client_IP': client_ip, 'DWA_IP': dwa_ip}
    return {'client_IP': client_ip}


def configure_run_type(auto=1):
    '''Return a dictionary of a configuration value for the type of run, either fixed frequency or frequency scan for the given values 0 and 1 respectively.'''
    return {'auto': format(auto,'01X')}


def configure_fixed_frequency(stim_freq_req=90):
    '''Return a dictionary of a configuration value for the fixed stimulus frequency given an input frequency value in hertz.'''
    # TODO change unit_factor to 256 after firmware change
    
    unit_factor = 256
    return {'stimFreqReq': format(int(stim_freq_req * unit_factor), '06X')}


def configure_scan_frequencies(stim_freq_min, stim_freq_max, stim_freq_step=1/16):
    '''Return a dictionary of configuration values for the scan stimulus frequencies, i.e. the scan minimum and maximum frequencies and the scan frequency step size, given input frequency values in hertz.'''
    # TODO change unit_factor to 256 after firmware change
    
    unit_factor = 256

    if stim_freq_min > stim_freq_max:
        raise ValueError('Scan minimum frequency is larger than scan maximum frequency.')

    return {'stimFreqMin': format(int(stim_freq_min * unit_factor), '06X'),
            'stimFreqMax': format(int(stim_freq_max * unit_factor), '06X'),
            'stimFreqStep': format(int(stim_freq_step * unit_factor), '06X')}


def configure_wait_times(stim_time_initial=2, stim_time=0.5):
    '''Return a dictionary of configuration values for the initial and subsequent stimulus wait times given input time values in seconds.'''
    
    unit_factor = 1/2.56e-6
    return {'stimTimeInitial': format(int(stim_time_initial * unit_factor), '06X'),
            'stimTime': format(int(stim_time * unit_factor), '06X')}


def configure_gains(stim_freq_max: int, *,
                    stim_mag=None, digipot=None):
    '''Return a dictionary of configuration values for the gains of the stimulus amplitude and read-out signals given the scan maximum frequency in hertz. Configuration values can also be provided directly, bypassing the determination based on the scan maximum frequency.'''

    digipot_config_single = 0xFF

    if stim_freq_max > 200:
        digipot_config_single -= int((stim_freq_max-200)//4)
    
    digipot_config = digipot_config_single
    for index in range(7):
        digipot_config <<= 8
        digipot_config |= digipot_config_single

    return {'stimMag': format(0xB00 if stim_mag is None else stim_mag, '03X'),
            'digipot': format(digipot_config if digipot is None else digipot, '016X')}


def configure_sampling(cycles_per_freq=2, samples_per_cycle=16):
    '''Return a dictionary of configuration values for the sampling parameters: the number of sampled cycles per stimulus frequency and the number of samples, equally spaced in time, per stimulus cycle.'''
    return {'cyclesPerFreq': format(cycles_per_freq, '06X'),
            'adcSamplesPerCycle': format(samples_per_cycle, '06X')}


def configure_relays(wire_layer: str, apa_channels: list, *,
                     relay_wire_top=None, relay_wire_bot=None, relay_bus_top=None, relay_bus_bot=None):
    '''Return a dictionary of configuration values for the relays given a wire layer and the list of APA channels to be read out in that layer. Configuration values can also be provided directly, bypassing the determination based on the wire layer and list of APA channels.'''

    def raise_incompatible_channels(message=''):
        raise ValueError('Trying to configure incompatible APA channels: ' + message)
    
    def fill_wire_relays_bottom_and_top(relays_bottom_and_top, relay):
        if relay <= 64:
            relays_bottom_and_top[0].append(relay)
        else:
            relays_bottom_and_top[1].append(relay-64)

    wire_layer = check_valid_wire_layer(wire_layer)

    # Bottom relay board is index 0, top is 1
    wire_signal_relays_bottom_and_top = [[], []]
    wire_bias_relays_bottom_and_top = [[], []]
    wire_relays_bottom_and_top = [[], []]

    # Get first board number with an arbitrary default value of 1 for the case when the apa_channels list is empty
    board_number = 1
    if len(apa_channels) >= 1:
        board_number = apa_channel_to_board_number(wire_layer, apa_channels[0])

    for apa_channel in apa_channels:
        # Check if all APA channels are on a single head board
        if board_number != apa_channel_to_board_number(wire_layer, apa_channel):
            raise_incompatible_channels(' channels are associated with more than one head board.')
        
        # Add wire signal relays
        fill_wire_relays_bottom_and_top(wire_signal_relays_bottom_and_top,
                                        apa_channel_to_wire_relay(wire_layer, apa_channel))
        
        # Add part of wire bias relays
        if apa_channel_to_board_channel(wire_layer, apa_channel) != 1:
            fill_wire_relays_bottom_and_top(wire_bias_relays_bottom_and_top,
                                            apa_channel_to_wire_relay(wire_layer, apa_channel-1))

        # Add remaining part of wire bias relays, taking into account that last APA channel is different per layer and per board
        if ((wire_layer == 'X' and apa_channel_to_board_channel(wire_layer, apa_channel) != 48)
                or (wire_layer in {'V', 'U'} and apa_channel_to_board_channel(wire_layer, apa_channel) != 40)
                or (wire_layer == 'G' and apa_channel_to_board_number(wire_layer, apa_channel) == 1
                    and apa_channel_to_board_channel(wire_layer, apa_channel) != 49)
                or (wire_layer == 'G' and apa_channel_to_board_number(wire_layer, apa_channel) != 1
                    and apa_channel_to_board_channel(wire_layer, apa_channel) != 48)):
            fill_wire_relays_bottom_and_top(wire_bias_relays_bottom_and_top, apa_channel_to_wire_relay(wire_layer, apa_channel+1))

    # Check no DWA channel is used twice
    dwa_channels = []
    for wire_signal_relays in wire_signal_relays_bottom_and_top:
        for relay in wire_signal_relays:
            dwa_channels.append(wire_relay_to_dwa_channel(relay))
    if len(dwa_channels) > len(set(dwa_channels)):
        raise_incompatible_channels('a DWA channel is used for more than one APA channel.')

    # Remove duplicate wire bias relays and join together all wire relays
    wire_bias_relays_bottom_and_top = [list(set(wire_bias_relays)) for wire_bias_relays in wire_bias_relays_bottom_and_top]
    for wire_signal_relays, wire_bias_relays, wire_relays in zip(wire_signal_relays_bottom_and_top, wire_bias_relays_bottom_and_top, wire_relays_bottom_and_top):
        wire_relays.extend(wire_signal_relays)
        wire_relays.extend(wire_bias_relays)
    
    bus_signal_relays_bottom_and_top = [[], []]
    bus_bias_relays_bottom_and_top = [[], []]
    bus_relays_bottom_and_top = [[], []]

    # Loop over bottom and top relay boards
    for wire_signal_relays, wire_bias_relays, bus_signal_relays, bus_bias_relays in zip(wire_signal_relays_bottom_and_top, wire_bias_relays_bottom_and_top, bus_signal_relays_bottom_and_top, bus_bias_relays_bottom_and_top):
        # Add bus signal relay associated to wire signal relay
        for relay in wire_signal_relays:
            bus_signal_address = (relay-1) % 16 + 1
            if bus_signal_address % 2 == 1:
                bus_signal_relays.append(bus_signal_address*2)
            else:
                bus_signal_relays.append(bus_signal_address*2 - 1)
        # Add bus bias relay associated to wire bias relay
        for relay in wire_bias_relays:
            bus_bias_address = (relay-1) % 16 + 1
            if bus_bias_address % 2 == 1:
                bus_bias_relays.append(bus_bias_address*2 - 1)
            else:
                bus_bias_relays.append(bus_bias_address*2)
    
    # Remove duplicate bus bias relays and join together all bus relays
    bus_bias_relays_bottom_and_top = [list(set(bus_bias_relays)) for bus_bias_relays in bus_bias_relays_bottom_and_top]
    for bus_signal_relays, bus_bias_relays, bus_relays in zip(bus_signal_relays_bottom_and_top, bus_bias_relays_bottom_and_top, bus_relays_bottom_and_top):
        bus_relays.extend(bus_signal_relays)
        bus_relays.extend(bus_bias_relays)

    # Check compatibility of every bus relay among its consecutive group of four bus relays: either using a single bus channel for both bias and signal or having opposite polarity HV DC on neighbouring channels
    for bus_relays in bus_relays_bottom_and_top:
        groups_of_four = []
        for group_index in range(32//4):
            groups_of_four.append([])
        for relay in bus_relays:
            groups_of_four[(relay-1)//4].append(relay)
        for group in groups_of_four:
            for relay1 in group:
                for relay2 in group:
                    if abs(relay1-relay2) not in {0, 2}:
                        raise_incompatible_channels('conflicting bus usage.')

    # Compute configuration values corresponding to active relays
    concatenated_wire_relays_bottom_and_top = []
    concatenated_bus_relays_bottom_and_top = []

    for wire_relays in wire_relays_bottom_and_top:
        concatenated_wire_relays = 0
        for relay in wire_relays:
            concatenated_wire_relays |= 1<<(relay-1)
        concatenated_wire_relays_bottom_and_top.append(concatenated_wire_relays)
    
    for bus_relays in bus_relays_bottom_and_top:
        concatenated_bus_relays = 0
        for relay in bus_relays:
            concatenated_bus_relays |= 1<<(relay-1)
        concatenated_bus_relays_bottom_and_top.append(concatenated_bus_relays)

    relay_config = {}
    relay_config['relayWireTop'] = format(concatenated_wire_relays_bottom_and_top[1] if relay_wire_top is None else relay_wire_top, '016X') 
    relay_config['relayWireBot'] = format(concatenated_wire_relays_bottom_and_top[0] if relay_wire_bot is None else relay_wire_bot, '016X')
    relay_config['relayBusTop'] = format(concatenated_bus_relays_bottom_and_top[1] if relay_bus_top is None else relay_bus_top, '08X')
    relay_config['relayBusBot'] = format(concatenated_bus_relays_bottom_and_top[0] if relay_bus_bot is None else relay_bus_bot, '08X')

    return relay_config


def configure_noise_subtraction(stim_freq_min, stim_freq_max, *,
                                noise_freq_min=None, noise_freq_max=None, noise_freq_step=1, noise_settling_time=0.01, noise_samples_per_freq=32, noise_sampling_period=1/55/32):
    '''Return a dictionary of configuration values for the noise-subtraction parameters, i.e. the minimum and maximum frequencies and the frequency step size for sampling noise, the wait time before noise sampling, the total number of samples per frequency and the sampling period, given the scan minimum and maximum frequencies in hertz. Configuration values, in hertz and seconds, can also be provided directly, bypassing the determination based on the scan minimum and maximum frequencies.'''

    unit_factor_freq = 16
    unit_factor_time = 1/2.56e-6
    unit_factor_period = 1/10e-9

    NOISE_MIN = 40
    NOISE_MAX = 70

    if stim_freq_min < NOISE_MAX and stim_freq_max > NOISE_MIN:
        if noise_freq_min is None:
            if stim_freq_min < NOISE_MIN:
                noise_freq_min = NOISE_MIN
            else:
                noise_freq_min = stim_freq_min
        if noise_freq_max is None:
            if stim_freq_max > NOISE_MAX:
                noise_freq_max = NOISE_MAX
            else:
                noise_freq_max = stim_freq_max
    elif noise_freq_min is None and noise_freq_max is None:
        noise_freq_min = noise_freq_max = NOISE_MIN
    elif noise_freq_min is None:
        noise_freq_min = noise_freq_max
    elif noise_freq_max is None:
        noise_freq_max = noise_freq_min

    if noise_freq_min > noise_freq_max:
        raise ValueError('Noise-subtraction minimum frequency is larger than noise-subtraction maximum frequency.')

    noise_sampling_period = 1 / ((NOISE_MAX + NOISE_MIN)/2) / noise_samples_per_freq

    return {'noiseFreqMin': format(int(noise_freq_min * unit_factor_freq), '06X'),
            'noiseFreqMax': format(int(noise_freq_max * unit_factor_freq), '06X'),
            'noiseFreqStep': format(int(noise_freq_step * unit_factor_freq), '06X'),
            'noiseSettlingTime': format(int(noise_settling_time * unit_factor_time), '06X'),
            'noiseAdcSamplesPerFreq': format(noise_samples_per_freq, '02X'),
            'noiseSamplingPeriod': format(int(noise_sampling_period * unit_factor_period), '06X')}


def configure_default():
    '''Return a dictionary with default values for all configuration parameters.'''
    
    configs = configure_ip_addresses(client_ip='192.0.2.254')
    configs.update(configure_run_type())
    configs.update(configure_fixed_frequency())
    configs.update(configure_scan_frequencies(stim_freq_min=99, stim_freq_max=100))
    configs.update(configure_wait_times())
    configs.update(configure_gains(stim_freq_max=100, stim_mag=0xBB8, digipot=0x7766554433221100))
    configs.update(configure_sampling())
    configs.update(configure_relays(wire_layer='X', apa_channels=[]))
    configs.update(configure_noise_subtraction(stim_freq_min=99, stim_freq_max=100))
    return configs


def write_config(generated_config, outfilename, subdir="config"):
    outfilename = os.path.join(subdir, outfilename)
    with open(outfilename, 'w') as outconfigfile:
        for header in generated_config.keys():
            outconfigfile.write("["+header+"]\n")
            subconfig = generated_config[header]
            for key in subconfig.keys():
                outconfigfile.write(key + " = " + str(subconfig[key]) + "\n")
