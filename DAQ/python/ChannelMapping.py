def wire_to_apa_channel(wire_layer: str, wire_number: int):
    '''Return the APA channel associated to the given wire layer and wire number.'''
    if wire_layer in {'X','G'}:
        apa_channel = wire_number
    if wire_layer in {'V','U'}:
        apa_channel = (wire_number - 1) % 400 + 1
    return apa_channel

def apa_channel_to_board_channel(wire_layer: str, apa_channel: int):
    '''Return the board channel associated to the given wire layer and APA channel. Board channel goes from 1 to 48 for X, from 1 to 40 for V and U and from 1 to 48 for G except for the first G board which goes from 1 to 49.'''
    if wire_layer == 'X':
        board_channel = (apa_channel - 1) % 48 + 1
    if wire_layer in {'V','U'}:
        board_channel = (apa_channel - 1) % 40 + 1
    if wire_layer == 'G':
        if apa_channel > 49:
            apa_channel -= 49
            board_channel = (apa_channel - 1) % 48 + 1
        else:
            board_channel = (apa_channel - 1) % 49 + 1
    return board_channel

def apa_channel_to_board_number(wire_layer: str, apa_channel: int):
    '''Return the board number associated to the given wire layer and APA channel.'''
    if wire_layer == 'X':
        board_number = (apa_channel - 1) // 48 + 1
    if wire_layer in {'V','U'}:
        board_number = (apa_channel - 1) // 40 + 1
    if wire_layer == 'G':
        if apa_channel > 49:
            apa_channel -= 49
            board_number = (apa_channel - 1) // 48 + 2
        else:
            board_number = 1
    return board_number

def apa_channel_to_wire_relay_channel(wire_layer: str, apa_channel: int):
    '''Return the relay wire associated to the given wire layer and APA channel. Wire relays for the bottom relay board are numbered from 1 to 64 and for the top relay board from 65 to 128.'''

    board_channel = apa_channel_to_board_channel(wire_layer, apa_channel)

    # There is an offset and gap due to wire layers alternating in groups of 8 wire relay channels.

    layer_offset = {'X': 0, 'V': 16, 'U': 16, 'G': 0}
    starting_channel = {'X': 128, 'V': 128, 'U': 1, 'G': 128}
    direction_of_increase = {'X': -1, 'V': -1, 'U': 1, 'G': -1}

    if wire_layer == 'G' and apa_channel <= 49:
        board_channel -= 1

    channel_offset = layer_offset[wire_layer] + ((board_channel - 1) // 8) * 24 + ((board_channel - 1) % 8)

    wire_relay_channel = starting_channel[wire_layer] + direction_of_increase[wire_layer]*channel_offset

<<<<<<< HEAD:DAQ/python/ChannelMapping.py

def get_resonances_for_channels(wire_layer: str, channel_numbers: list):
    resonances = {}
    for chan in channel_numbers:
        chan_resonances = channel_frequencies_per_wire(wire_layer, chan)
        for wire in chan_resonances.keys():
            resonances[wire] = chan_resonances[wire]
    return resonances

def get_resonance_ranges(wire_layer: str, channel_numbers: list):
    if wire_layer == "X" or wire_layer =="G":
        return [[80,90]]
    
    # U and V layer logic
    


def all_APA_frequencies():
    """Return a dictionary of layers containing dictionaries of channels containing dictionaries of wires each containing a list of frequencies, encompassing all frequencies in an APA."""
=======
    if wire_layer == 'G' and apa_channel == 1:
        wire_relay_channel = 113
>>>>>>> c7b87c5b1f24dadb94e6f91c77ecbc3a113430dd:DAQ/python/mappings/channel_map.py

    return wire_relay_channel

def wire_relay_channel_to_dwa_channel(wire_relay_channel: int):
    '''Return the DWA channel from 0 to 7 associated to the given wire relay.'''
    return ((wire_relay_channel - 1) % 16) // 2