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

    if wire_layer == 'G' and apa_channel == 1:
        wire_relay_channel = 113

    return wire_relay_channel

def get_frequencies_for_channels(wire_layer: str, channel_numbers: list):
    # windowRadius: Scan this fraction above and below resonance
    #if wire_layer == "G" or wire_layer =="X":
    #    return [round(85*(1-windowRadius),2), round(85*(1+windowRadius),2)]
    # U and V
    allwires = {}
    for ch in channel_numbers:
        allwires.update(channel_frequencies_per_wire(wire_layer, ch))
    return allwires

def closest_index_to(arr, val):
    closestVal = 9e9
    closestInd = 0
    for i,e in enumerate(arr):
        if abs(e-val)<closestVal:
            closestVal = abs(e-val)
            closestInd = i
    return closestInd

def all_range_data(channelRangeData, windowRadius = 0.15):
    allRangeData = []
    for w in channelRangeData:
        i = closest_index_to(channelRangeData[w],70)
        f = channelRangeData[w][i]
        fRange = [round(f*(1-windowRadius),2), round(f*(1+windowRadius),2)]
        allRangeData.append({"wires": [w], "range": fRange})
    return allRangeData

def combine_range_data(rangeDataA, rangeDataB):
    wiresA = rangeDataA["wires"]
    wiresB = rangeDataB["wires"]
    rangeA = rangeDataA["range"]
    rangeB = rangeDataB["range"]
    if (rangeA[1] > rangeB[0] and rangeA[0] < rangeB[1]) or (rangeB[1] > rangeA[0] and rangeB[0] < rangeA[1]):
        return [{"wires": wiresA + wiresB,
                "range": [min(rangeA[0], rangeB[0]), max(rangeA[1], rangeB[1])]
                }]
    else: return [rangeDataA, rangeDataB]
        

def reduce_range_data(allRangeData):
    if len(allRangeData)<1: return []
    reducedRangeData = [allRangeData[0]]
    for i, rangeDataA in enumerate(allRangeData):
        if i == 0: continue
        # Loop over rangeData in reducedRangeData to try to find a range it combines with
        overlap_index = -1
        for j, rangeDataB in enumerate(reducedRangeData):
            combined = combine_range_data(rangeDataA, rangeDataB)
            if len(combined) == 1: 
                overlap_index = j
        if overlap_index >= 0: # overlap found, combine them
            reducedRangeData[overlap_index] = combine_range_data(rangeDataA, reducedRangeData[overlap_index])[0]
        else: # no overlap found, add it
            reducedRangeData.append(rangeDataA)
        
    print(reducedRangeData)
    return reducedRangeData
    
def cull_range_data(reducedRangeData, thresh = 1000.):
    # Eliminate frequency ranges from reducedRangeData that cannot be achieved
    culledRangeData = []
    for rangeData in reducedRangeData:
        if rangeData["range"][1] <= thresh:
            rangeData["wires"] = sorted(rangeData["wires"])
            culledRangeData.append(rangeData)
    return culledRangeData
        
def get_range_data_for_channels(wire_layer: str, channel_numbers: list, windowRadius = 0.15):
    channelFreqData = get_frequencies_for_channels(wire_layer, channel_numbers)
    allRangeData = all_range_data(channelFreqData, windowRadius)
    reducedRangeData = reduce_range_data(allRangeData)
    culledRangeData = cull_range_data(reducedRangeData)
    return culledRangeData
    

def all_apa_frequencies():
    """Return a dictionary of layers containing dictionaries of channels containing dictionaries of wires each containing a list of frequencies, encompassing all frequencies in an APA."""

    all_freqs = {'layer_X': {}, 'layer_V': {}, 'layer_U': {}, 'layer_G': {}}
    
    for channel_number in range(481):
        if channel_number < 480:
            all_freqs['layer_X'][f'channel_{channel_number+1}'] = channel_frequencies_per_wire('X',channel_number+1)
        if channel_number < 400:
            all_freqs['layer_V'][f'channel_{channel_number+1}'] = channel_frequencies_per_wire('V',channel_number+1)
            all_freqs['layer_U'][f'channel_{channel_number+1}'] = channel_frequencies_per_wire('U',channel_number+1)
        all_freqs['layer_G'][f'channel_{channel_number+1}'] = channel_frequencies_per_wire('G',channel_number+1)

    return all_freqs

def wire_relay_channel_to_dwa_channel(wire_relay_channel: int):
    '''Return the DWA channel from 0 to 7 associated to the given wire relay.'''
    return ((wire_relay_channel - 1) % 16) // 2

class PhysicalWire():
    """A physical wire that is soldered at both ends."""
    def __init__(self, x_start, y_start, x_end, y_end):
        self.x_start = x_start
        self.y_start = y_start
        self.x_end = x_end
        self.y_end = y_end

    def length(self):
        return ((self.x_start-self.x_end)**2+(self.y_start-self.y_end)**2)**0.5

    def lengths(self):
        lengths = []
        nodes = [0, 1163, 2347, 3531, 4715, 5997.32]
        crossing_indices = []
        for index,value in enumerate(nodes):
            if(self.x_end < value and value < self.x_start):
                crossing_indices.append(index)
                
        if len(crossing_indices) == 0:
            lengths.append(self.length())
        else:
            lengths.append(self.length()*(nodes[crossing_indices[0]]-self.x_end)/(self.x_start-self.x_end))    
            for index,value in enumerate(crossing_indices):
                if(index != len(crossing_indices)-1):
                    lengths.append(self.length()*(nodes[value+1]-nodes[value])/(self.x_start-self.x_end))
            lengths.append(self.length()*(self.x_start-nodes[crossing_indices[-1]])/(self.x_start-self.x_end))
        return lengths

def physical_wire_position(wire_layer: str, wire_number: int, position_type: str):
    """Given a wire layer letter ("X", "V", "U" or "G"), physical wire number and position type ("start" or "end"), return the corresponding physical wire's position tuple in millimeters along the (length, width) axes of the APA."""

    X_WIRE_NUMBER_MAX = 480
    VU_WIRE_NUMBER_MAX = 1151
    G_WIRE_NUMBER_MAX = 481

    wire_layer = wire_layer.upper()
    position_type = position_type.lower()
    
    if wire_layer not in ('X','V','U','G'):
        raise ValueError('Wrong wire layer identifier value: only "X", "U", "V" or "G" can be used.')
    
    if wire_layer in ('X'):
        if not 1 <= wire_number <= X_WIRE_NUMBER_MAX:
            raise ValueError(f'Wrong X physical wire number value: only 1 to {X_WIRE_NUMBER_MAX} can be used.')
    elif wire_layer in ('V','U'):
        if not 1 <= wire_number <= VU_WIRE_NUMBER_MAX:
            raise ValueError('Wrong V or U physical wire number value: only 1 to {UV_WIRE_NUMBER_MAX} can be used.')
    elif wire_layer in ('G'):
        if not 1 <= wire_number <= G_WIRE_NUMBER_MAX:
            raise ValueError('Wrong G physical wire number value: only 1 to {G_WIRE_NUMBER_MAX} can be used.')

    if position_type not in ('start','end'):
        raise ValueError('Wrong position type value: only "start" or "end" can be used.')

    x_near_offset = 0
    x_near_pitch = 0
    y_near_offset = 0
    y_near_pitch = 0
    x_far_offset = 0
    x_far_pitch = 0
    y_far_offset = 0
    y_far_pitch = 0
    wire_number_edge_transition = 0
    
    if wire_layer == 'X':
        y_far_offset = -2300/X_WIRE_NUMBER_MAX/2
        y_far_pitch = 2300/X_WIRE_NUMBER_MAX
        if position_type == 'start':
            x_far_offset = 5987.62

    if wire_layer == 'V':
        if position_type == 'start':
            wire_number_edge_transition = 751
            x_near_offset = -24
            x_near_pitch = 8
            x_far_offset = 5987.6
            y_far_pitch = 5.75
        if position_type == 'end':
            wire_number_edge_transition = 402
            y_near_offset = -16.25
            y_near_pitch = 5.75
            x_far_pitch = 8
            y_far_offset = 2300

    if wire_layer == 'U':
        if position_type == 'start':
            wire_number_edge_transition = 751
            x_near_offset = -19.1
            x_near_pitch = 8
            y_near_offset = 2306.7
            x_far_offset = 5991
            y_far_offset = 2306.7
            y_far_pitch = -5.75
        if position_type == 'end':
            wire_number_edge_transition = 403
            y_near_offset = 2322.95
            y_near_pitch = -5.75
            x_far_offset = -6.5
            x_far_pitch = 8

    if wire_layer == 'G':
        y_far_offset = -2300/X_WIRE_NUMBER_MAX
        y_far_pitch = 2300/X_WIRE_NUMBER_MAX
        if position_type == 'start':
            x_far_offset = 5997.32

    if wire_number <= wire_number_edge_transition:
        x_pos = x_near_offset + wire_number*x_near_pitch
        y_pos = y_near_offset + wire_number*y_near_pitch
    else:
        x_pos = x_far_offset + (wire_number-wire_number_edge_transition)*x_far_pitch
        y_pos = y_far_offset + (wire_number-wire_number_edge_transition)*y_far_pitch

    return (x_pos, y_pos)

l_physical_wire_X = []
l_physical_wire_V = []
l_physical_wire_U = []
l_physical_wire_G = []
for index in range(1151):
    if index < 480:
        l_physical_wire_X.append(PhysicalWire(*physical_wire_position('X',index+1,'start'),*physical_wire_position('X',index+1,'end')))
    l_physical_wire_V.append(PhysicalWire(*physical_wire_position('V',index+1,'start'),*physical_wire_position('V',index+1,'end')))
    l_physical_wire_U.append(PhysicalWire(*physical_wire_position('U',index+1,'start'),*physical_wire_position('U',index+1,'end')))
    if index < 481:
        l_physical_wire_G.append(PhysicalWire(*physical_wire_position('G',index+1,'start'),*physical_wire_position('G',index+1,'end')))

def length_to_frequency(length):
    # TODO parameterize tension and density

    return round((6.5/4/1.6e-4/(length/1000)**2)**0.5, 2)

def channel_frequencies_per_wire(wire_layer: str, channel_number: int):
    """Wire segment: part of wire between combs or ends."""
    # TODO: raise exception if input is wrong

    channel_freqs = {}

    if wire_layer == 'X':
        wire_freqs = []
        for length in l_physical_wire_X[channel_number-1].lengths():
            wire_freqs.append(length_to_frequency(length))
        channel_freqs[f'{channel_number}'] = wire_freqs

    if wire_layer == 'V':
        for index,wire in enumerate(l_physical_wire_V):
            if index%400 == channel_number-1:
                wire_freqs = []
                for length in wire.lengths():
                    wire_freqs.append(length_to_frequency(length))
                channel_freqs[f'{index+1}'] = wire_freqs

    if wire_layer == 'U':
        for index,wire in enumerate(l_physical_wire_U):
            if index%400 == channel_number-1:
                wire_freqs = []
                for length in wire.lengths():
                    wire_freqs.append(length_to_frequency(length))
                channel_freqs[f'{index+1}'] = wire_freqs
    
    if wire_layer == 'G':
        wire_freqs = []
        for length in l_physical_wire_G[channel_number-1].lengths():
            wire_freqs.append(length_to_frequency(length))
        channel_freqs[f'{channel_number}'] = wire_freqs
    
    return channel_freqs



