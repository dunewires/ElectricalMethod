from channel_frequencies import check_valid_wire_layer
import numpy as np


def wire_to_apa_channel(wire_layer: str, wire_number: int):
    '''Return the APA channel associated to the given wire layer and wire number.'''

    wire_layer = check_valid_wire_layer(wire_layer)

    if wire_layer in {'X', 'G'}:
        apa_channel = wire_number
    if wire_layer in {'V', 'U'}:
        apa_channel = (wire_number - 1) % 400 + 1

    return apa_channel


def apa_channel_to_board_channel(wire_layer: str, apa_channel: int):
    '''Return the board channel associated to the given wire layer and APA channel. Board channel goes from 1 to 48 for X, from 1 to 40 for V and U and from 1 to 48 for G except for the first G board which goes from 1 to 49.'''
    
    wire_layer = check_valid_wire_layer(wire_layer)

    if wire_layer == 'X':
        board_channel = (apa_channel - 1) % 48 + 1
    if wire_layer in {'V', 'U'}:
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

    wire_layer = check_valid_wire_layer(wire_layer)

    if wire_layer == 'X':
        board_number = (apa_channel - 1) // 48 + 1
    if wire_layer in {'V', 'U'}:
        board_number = (apa_channel - 1) // 40 + 1
    if wire_layer == 'G':
        if apa_channel > 49:
            apa_channel -= 49
            board_number = (apa_channel - 1) // 48 + 2
        else:
            board_number = 1

    return board_number


def apa_channel_to_wire_relay(wire_layer: str, apa_channel: int):
    '''Return the relay wire associated to the given wire layer and APA channel. Wire relays for the bottom relay board are numbered from 1 to 64 and from 65 to 128 for the top relay board.'''
    
    wire_layer = check_valid_wire_layer(wire_layer)
    
    board_channel = apa_channel_to_board_channel(wire_layer, apa_channel)

    # There is an offset and gap due to wire layers alternating in groups of 8 wire relay.
    layer_offset = {'X': 0, 'V': 16, 'U': 16, 'G': 0}
    starting_relay = {'X': 128, 'V': 128, 'U': 1, 'G': 128}
    direction_of_increase = {'X': -1, 'V': -1, 'U': 1, 'G': -1}

    if wire_layer == 'G' and apa_channel <= 49:
        board_channel -= 1

    channel_offset = layer_offset[wire_layer] + ((board_channel - 1) // 8) * 24 + ((board_channel - 1) % 8)

    wire_relay = starting_relay[wire_layer] + direction_of_increase[wire_layer]*channel_offset

    if wire_layer == 'G' and apa_channel == 1:
        wire_relay = 113

    return wire_relay


def wire_relay_to_dwa_channel(wire_relay: int):
    '''Return the DWA channel from 0 to 7 associated to the given wire relay.'''
    return ((wire_relay - 1) % 16) // 2

def check_valid_headboard_number(wire_layer: int, headboard_number: int):
    '''Make sure that the headboard number is valid.'''
    check_valid_wire_layer(wire_layer)
    if headboard_number < 1 or headboard_number > 10:
        raise ValueError('Invalid headboard number: only 1-10 can be used.')
    return headboard_number

def channel_groupings(wire_layer: str, headboard_number: int):
    '''Returns a list of lists, with each sublist being a set of channels for a scan.'''

    wire_layer = check_valid_wire_layer(wire_layer)
    headboard_number = check_valid_headboard_number(wire_layer, headboard_number)

    if wire_layer == "U" or wire_layer == "V":
        return np.array([ \
            [ 1, 3, 5, 7, 9,11,13,15], \
            [ 2, 4, 6, 8,10,12,14,16], \
            [17,19,21,23,25,27,29,31], \
            [18,20,22,24,26,28,30,32], \
            [33,35,37,39], \
            [34,36,38,40] \
        ], dtype=object) + (headboard_number - 1)*40

    if wire_layer == "X":
        return np.array([ \
            [ 1, 3, 5, 7, 9,11,13,15], \
            [ 2, 4, 6, 8,10,12,14,16], \
            [17,19,21,23,25,27,29,31], \
            [18,20,22,24,26,28,30,32], \
            [33,35,37,39,41,43,45,47], \
            [34,36,38,40,42,44,46,48] \
        ]) + (headboard_number - 1)*48

    if wire_layer == "G" and headboard_number == 1:
        return np.array([ \
            [ 1, 3, 5, 7, 9,11,13,15], \
            [ 2, 4, 6, 8,10,12,14,16], \
            [17,19,21,23,25,27,29,31], \
            [18,20,22,24,26,28,30,32], \
            [33,35,37,39,41,43,45,47], \
            [34,36,38,40,42,44,46,48], [49] \
        ])

    if wire_layer == "G" and headboard_number > 1:
        return np.array([ \
            [ 1, 3, 5, 7, 9,11,13,15], \
            [ 2, 4, 6, 8,10,12,14,16], \
            [17,19,21,23,25,27,29,31], \
            [18,20,22,24,26,28,30,32], \
            [33,35,37,39,41,43,45,47], \
            [34,36,38,40,42,44,46,48] \
        ]) + 49 + (headboard_number - 2)*48    
    