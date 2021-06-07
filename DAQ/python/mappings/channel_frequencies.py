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


def length_to_frequency(length, tension=6.5, density=1.6e-4):
    return (tension/4/density/(length/1000)**2)**0.5


def channel_frequencies_per_wire(wire_layer: str, channel_number: int):
    """Wire segment: part of wire between combs or ends."""
    
    wire_layer = check_valid_wire_layer(wire_layer)

    channel_freqs = {}

    if wire_layer == 'X':
        wire_freqs = []
        for length in l_physical_wire_X[channel_number-1].lengths():
            wire_freqs.append(length_to_frequency(length))
        channel_freqs[f'wire_{len(channel_freqs)+1}'] = wire_freqs

    if wire_layer == 'V':
        for index,wire in enumerate(l_physical_wire_V):
            if index%400 == channel_number-1:
                wire_freqs = []
                for length in wire.lengths():
                    wire_freqs.append(length_to_frequency(length))
                channel_freqs[f'wire_{len(channel_freqs)+1}'] = wire_freqs

    if wire_layer == 'U':
        for index,wire in enumerate(l_physical_wire_U):
            if index%400 == channel_number-1:
                wire_freqs = []
                for length in wire.lengths():
                    wire_freqs.append(length_to_frequency(length))
                channel_freqs[f'wire_{len(channel_freqs)+1}'] = wire_freqs
    
    if wire_layer == 'G':
        wire_freqs = []
        for length in l_physical_wire_G[channel_number-1].lengths():
            wire_freqs.append(length_to_frequency(length))
        channel_freqs[f'wire_{len(channel_freqs)+1}'] = wire_freqs
    
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