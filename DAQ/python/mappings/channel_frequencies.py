import numpy as np
from scipy import optimize
import sys

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


def check_valid_wire_layer(wire_layer: str):
    wire_layer = wire_layer.upper()
    if wire_layer not in {'X', 'V', 'U', 'G'}:
        raise ValueError('Invalid wire layer identifier value: only "X", "U", "V" or "G" can be used.')
    return wire_layer


def physical_wire_position(wire_layer: str, wire_number: int, position_type: str):
    """Given a wire layer letter ("X", "V", "U" or "G"), physical wire number and position type ("start" or "end"), return the corresponding physical wire's position tuple in millimeters along the (length, width) axes of the APA."""

    X_WIRE_NUMBER_MAX = 480
    VU_WIRE_NUMBER_MAX = 1151
    G_WIRE_NUMBER_MAX = 481

    wire_layer = check_valid_wire_layer(wire_layer)
    position_type = position_type.lower()
    
    if wire_layer not in {'X', 'V', 'U', 'G'}:
        raise ValueError('Invalid wire layer identifier value: only "X", "U", "V" or "G" can be used.')
    
    if wire_layer in {'X'}:
        if not 1 <= wire_number <= X_WIRE_NUMBER_MAX:
            raise ValueError(f'Invalid X physical wire number value: only 1 to {X_WIRE_NUMBER_MAX} can be used.')
    elif wire_layer in {'V', 'U'}:
        if not 1 <= wire_number <= VU_WIRE_NUMBER_MAX:
            raise ValueError('Invalid V or U physical wire number value: only 1 to {UV_WIRE_NUMBER_MAX} can be used.')
    elif wire_layer in {'G'}:
        if not 1 <= wire_number <= G_WIRE_NUMBER_MAX:
            raise ValueError('Invalid G physical wire number value: only 1 to {G_WIRE_NUMBER_MAX} can be used.')

    if position_type not in {'start','end'}:
        raise ValueError('Invalid position type value: only "start" or "end" can be used.')

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

l_physical_wire = {
    "X": l_physical_wire_X,
    "V": l_physical_wire_V,
    "U": l_physical_wire_U,
    "G": l_physical_wire_G,
}

def length_to_frequency(length, tension=6.5, density=1.52e-4):
    return (tension/4/density/(length/1000)**2)**0.5

def wire_to_apa_channel(wire_layer: str, wire_segment: int):
    '''Return the APA channel associated to the given wire layer and wire number.'''
    wire_layer = check_valid_wire_layer(wire_layer)

    if wire_layer in {'X', 'G'}:
        apa_channel = wire_segment
    if wire_layer in {'V', 'U'}:
        apa_channel = (wire_segment - 1) % 400 + 1

    return apa_channel

def length_of_wire_segment(wire_layer: str, wire_segment: int):
    '''Return the length of the wire segment.'''
    try:
        length = l_physical_wire[wire_layer][wire_segment].length()
    except:
        print(f"Wire length for layer {wire_layer} segment {wire_segment} not found.")
        return None
    return length

def channel_frequencies_per_wire(wire_layer: str, channel_number: int, thresh = sys.float_info.max):
    """Wire segment: part of wire between combs or ends."""
    
    wire_layer = check_valid_wire_layer(wire_layer)

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
                    freq = length_to_frequency(length)
                    if freq < thresh: wire_freqs.append(length_to_frequency(length))
                channel_freqs[f'{index+1}'] = wire_freqs

    if wire_layer == 'U':
        for index,wire in enumerate(l_physical_wire_U):
            if index%400 == channel_number-1:
                wire_freqs = []
                for length in wire.lengths():
                    freq = length_to_frequency(length)
                    if freq < thresh: wire_freqs.append(length_to_frequency(length))
                channel_freqs[f'{index+1}'] = wire_freqs
    
    if wire_layer == 'G':
        wire_freqs = []
        for length in l_physical_wire_G[channel_number-1].lengths():
            wire_freqs.append(length_to_frequency(length))
        channel_freqs[f'{channel_number}'] = wire_freqs
    
    return channel_freqs


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


def wire_frequencies_from_channels(wire_layer: str, channel_numbers: list, thresh = sys.float_info.max):
    """Return a dictionary where the keys are the wire numbers for the given channels and the values are their resonance frequencies."""
    allwires = {}
    for ch in channel_numbers:
        allwires.update(channel_frequencies_per_wire(wire_layer, ch, thresh))
    return allwires

def closest_index_to(arr, val):
    """Helper function that returns the the index of arr that contains the value closest to val"""
    closestVal = 9e9
    closestInd = 0
    for i,e in enumerate(arr):
        if abs(e-val) < closestVal:
            closestVal = abs(e-val)
            closestInd = i
    return closestInd

# def wire_range_data(wire_freq_data, range_radius = 0.15):
#     """
#     Converts the frequency data into a list of frequency range dictionaries. Ex: {"wireSegments": [23], "range": [60,80]}.
#     The radius of the range is set by range_radius
#     """
#     range_data = []
#     for w in wire_freq_data:
#         i = closest_index_to(wire_freq_data[w],70)
#         f = wire_freq_data[w][i]
#         f_range = [round(f*(1-range_radius),2), round(f*(1+range_radius),2)]
#         range_data.append({"wireSegments": [int(w)], "range": f_range})
#     return range_data


def wire_range_data(wire_layer: str, wire_freq_data, range_radius):
    """
    Converts the frequency data into a list of frequency range dictionaries. Ex: {"wireSegments": [23], "range": [60,80]}.
    The range is independant of the wire, and depends only on the layer 
    """
    range_data = []
    for w in wire_freq_data.keys():
        if wire_layer == "X" or wire_layer == "G":
            f_range = [74, 102]
        else:
            res_array = np.array(wire_freq_data[w])
            #res_sub_200 = res_array[(res_array<200)]
            if len(res_array)==0:
                maxf = 51
            else:
                maxf = round(np.max(res_array)*1.2)
            f_range = [50, maxf]
        range_data.append({"wireSegments": [int(w)], "range": f_range})
    print('rd ',range_data)
    return range_data

def combine_range_data(range_data_a, range_data_b):
    """
    Combine multiple sets of wire_range_data and merge the frequency ranges.
    """
    wires_a = range_data_a["wireSegments"]
    wires_b = range_data_b["wireSegments"]
    range_a = range_data_a["range"]
    range_b = range_data_b["range"]
    if (range_a[1] > range_b[0] and range_a[0] < range_b[1]) or (range_b[1] > range_a[0] and range_b[0] < range_a[1]):
        return [{"wireSegments": wires_a + wires_b,
                "range": [min(range_a[0], range_b[0]), max(range_a[1], range_b[1])]
                }]
    else: return [range_data_a, range_data_b]
        

def reduce_range_data(range_data):
    """
    Takes a list of range data dictionaries and keeps combining entries until they have been fully reduced.
    """
    if len(range_data)<1: return []
    reduced_range_data = [range_data[0]]
    for i, range_data_a in enumerate(range_data):
        if i == 0: continue
        # Loop over rangeData in reduced_range_data to try to find a range it combines with
        overlap_index = -1
        for j, range_data_b in enumerate(reduced_range_data):
            combined = combine_range_data(range_data_a, range_data_b)
            if len(combined) == 1: 
                overlap_index = j
        if overlap_index >= 0: # overlap found, combine them
            reduced_range_data[overlap_index] = combine_range_data(range_data_a, reduced_range_data[overlap_index])[0]
        else: # no overlap found, add it
            reduced_range_data.append(range_data_a)
        
    return reduced_range_data
    
def cull_range_data(reduced_range_data, thresh = 1000.):
    """Remove entries from the list of range data dictionaries that feature a frequency above threshhold."""
    # Eliminate frequency ranges from reduced_range_data that cannot be achieved
    culled_range_data = []
    for rangeData in reduced_range_data:
        if rangeData["range"][1] <= thresh:
            rangeData["wireSegments"] = sorted(rangeData["wireSegments"])
            culled_range_data.append(rangeData)
    return culled_range_data

def append_channel_info(culled_range_data, channel_numbers):
    """Adds the list of channels to each range_data dictionary"""
    range_data_with_channel_info = []
    for rangeData in culled_range_data:
        rangeData["apaChannels"] = channel_numbers
        range_data_with_channel_info.append(rangeData)
    return range_data_with_channel_info
        
def get_range_data_for_channels(wire_layer: str, channel_numbers: list, thresh = sys.float_info.max, range_radius = 0.2):
    """
    Produces a full reduced and culled set of frequency range dictionaries for a set of channels.
    """
    wire_freq_data = wire_frequencies_from_channels(wire_layer, channel_numbers, thresh)
    print("wire_freq_data",thresh,wire_freq_data)
    #range_data = wire_range_data(wire_freq_data, range_radius) # Swtiched to a constant method where range depends only on the layer
    range_data = wire_range_data(wire_layer, wire_freq_data, range_radius)
    print("range_data",range_data)
    reduced_range_data = reduce_range_data(range_data)
    print("reduced_range_data",reduced_range_data)
    culled_range_data = cull_range_data(reduced_range_data)
    print("culled_range_data",culled_range_data)
    range_data_with_channel_info = append_channel_info(culled_range_data, channel_numbers)
    print("range_data_with_channel_info",range_data_with_channel_info)
    return range_data_with_channel_info

def compute_tensions_from_resonances(wire_freqs_expected, freqs_measured, nominal_tension):
    '''Return a list of wire tensions given the expected and measured frequencies in an APA channel. The expected frequencies are to be given as a list of lists of frequencies, with each inner list corresponding to the frequencies associated to a single wire in that APA channel. The order of these inner wire lists determine the order of the returned wire tensions. The expected frequencies must only be given for frequency ranges that have been measured. The measured frequencies are to be given as an overall list of measured frequencies for that APA channel.'''

    def assignment_cost(x):
        wire_freqs_expected_array = np.array([freq*x[i] for i, freqs in enumerate(wire_freqs_expected) for freq in freqs])
        wire_freqs_measured_array = np.array([freq for freq in freqs_measured])
        
        cost_matrix = np.abs(np.subtract.outer(wire_freqs_expected_array, wire_freqs_measured_array))

        row_index, col_index = optimize.linear_sum_assignment(cost_matrix)

        return cost_matrix[row_index, col_index].sum()

    val = optimize.minimize(assignment_cost, (1,)*len(wire_freqs_expected))

    return (val.x**2 * nominal_tension).tolist()

def get_expected_resonances(wire_layer, channel, thresh = 1000.):
    '''
    Return a pair of lists
    List 1: A list of the wires associated with a channel
    List 2: A list of lists, with each sublist at index i corresponding to the resonances of the wire at index i of List 1. 
    '''
    freqs = wire_frequencies_from_channels(wire_layer, [channel])
    freqs_in_range = {}
    for w in freqs:
        for res in freqs[w]:
            if res<thresh:
                if w in freqs_in_range.keys():
                    freqs_in_range[w].append(res)
                else:
                    freqs_in_range[w] = [res]
 
    return [int(w) for w in freqs_in_range], [freqs_in_range[w] for w in freqs_in_range]


