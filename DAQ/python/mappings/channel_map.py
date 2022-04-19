from channel_frequencies import check_valid_wire_layer
import numpy as np

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
    if wire_layer == 'V':
        board_number = (apa_channel - 1) // 40 + 1
    if wire_layer == 'U':
        board_number = 11 - apa_channel_to_board_number('V', apa_channel)
    if wire_layer == 'G':
        if apa_channel > 49:
            apa_channel -= 49
            board_number = (apa_channel - 1) // 48 + 2
        else:
            board_number = 1

    return board_number


def apa_channel_to_wire_relay(wire_layer: str, apa_channel: int, is_flex_connection_winderlike: bool = True):
    '''Return the relay wire associated to the given wire layer and APA channel. Wire relays for the bottom relay board are numbered from 1 to 64 and from 65 to 128 for the top relay board. A boolean specifying if the flex cable hardware connection to the probe board is oriented as for the mechanical support in the winder, True, or as for the installation of the upper APA, False, is required.'''
    
    wire_layer = check_valid_wire_layer(wire_layer)
    
    board_channel = apa_channel_to_board_channel(wire_layer, apa_channel)

    # There is an offset and a gap due to wire layers alternating in groups of 8 wire relays.
    layer_offset = {'X': 0, 'V': 16, 'U': 16, 'G': 0}
    if is_flex_connection_winderlike:
        starting_relay = {'X': 128, 'V': 128, 'U': 1, 'G': 128}
        direction_of_increase = {'X': -1, 'V': -1, 'U': 1, 'G': -1}
    else:
        starting_relay = {'X': 1, 'V': 1, 'U': 128, 'G': 1}
        direction_of_increase = {'X': 1, 'V': 1, 'U': -1, 'G': 1}

    if wire_layer == 'G' and apa_channel <= 49:
        board_channel -= 1

    channel_offset = layer_offset[wire_layer] + ((board_channel - 1) // 8) * 24 + ((board_channel - 1) % 8)

    wire_relay = starting_relay[wire_layer] + direction_of_increase[wire_layer]*channel_offset

    if wire_layer == 'G' and apa_channel == 1:
        if is_flex_connection_winderlike:
            wire_relay = 113
        else:
            wire_relay = 16

    return wire_relay

def electrical_side_to_physical_side(electrical_side: str, wire_layer: str, wire_segment: int):
    '''Return the the corrected physical side for middle segments on the U and V layers.'''
    if wire_layer in ['X','G']: return electrical_side
    if wire_segment > 400 and wire_segment < 801:
        return 'A' if electrical_side == 'B' else 'B'
    return electrical_side

def wire_relay_to_dwa_channel(wire_relay: int):
    '''Return the DWA channel from 0 to 7 associated to the given wire relay.'''
    return ((wire_relay - 1) % 16) // 2

def apa_channel_to_dwa_channel(wire_layer: str, apa_channel: int, is_flex_connection_winderlike: bool = True):
    '''Return the DWA channel from 0 to 7 associated to the given APA channel, depending on the orientation of the connection between the flex cable and the probe board.'''
    return wire_relay_to_dwa_channel(apa_channel_to_wire_relay(wire_layer, apa_channel, is_flex_connection_winderlike))

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

    if wire_layer == "V":
        return np.array([ \
            np.array([ 1, 3, 5, 7, 9,11,13,15]), \
            np.array([ 2, 4, 6, 8,10,12,14,16]), \
            np.array([17,19,21,23,25,27,29,31]), \
            np.array([18,20,22,24,26,28,30,32]), \
            np.array([33,35,37,39]), \
            np.array([34,36,38,40]) \
        ], dtype=object) + (headboard_number - 1)*40

    if wire_layer == "U":
        return np.array([ \
            np.array([ 1, 3, 5, 7, 9,11,13,15]), \
            np.array([ 2, 4, 6, 8,10,12,14,16]), \
            np.array([17,19,21,23,25,27,29,31]), \
            np.array([18,20,22,24,26,28,30,32]), \
            np.array([33,35,37,39]), \
            np.array([34,36,38,40]) \
        ], dtype=object) + (10 - headboard_number)*40


    if wire_layer == "X":
        return np.array([ \
            [ 1, 3, 5, 7, 9,11,13,15], \
            [ 2, 4, 6, 8,10,12,14,16], \
            [17,19,21,23,25,27,29,31], \
            [18,20,22,24,26,28,30,32], \
            [33,35,37,39,41,43,45,47], \
            [34,36,38,40,42,44,46,48] \
        ], dtype=object) + (headboard_number - 1)*48

    if wire_layer == "G" and headboard_number == 1:
        return np.array([ \
            [ 2, 4, 6, 8,10,12,14,16], \
            [ 3, 5, 7, 9,11,13,15,17], \
            [18,20,22,24,26,28,30,32], \
            [19,21,23,25,27,29,31,33], \
            [34,36,38,40,42,44,46,48],
            [35,37,39,41,43,45,47,49], [1] \
        ], dtype=object)

    if wire_layer == "G" and headboard_number > 1:
        return np.array([ \
            [ 1, 3, 5, 7, 9,11,13,15], \
            [ 2, 4, 6, 8,10,12,14,16], \
            [17,19,21,23,25,27,29,31], \
            [18,20,22,24,26,28,30,32], \
            [33,35,37,39,41,43,45,47], \
            [34,36,38,40,42,44,46,48] \
        ], dtype=object) + 49 + (headboard_number - 2)*48    

def get_grouping_number(wire_layer: str, apa_channel: int):
    '''Returns the grouping number for the given layer and apa_channel.'''
    headboard = apa_channel_to_board_number(wire_layer, apa_channel)
    groupings = channel_groupings(wire_layer, headboard)
    for i, group in enumerate(groupings):
        if apa_channel in group:
            return i+1
    return -1