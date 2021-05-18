import channel_map

def configure_relays(wire_layer: str, apa_channels: list):
    '''Return dictionary of relay firmware configuration values given a wire layer and a list of APA channels to be read out in that layer.'''

    def raise_incompatible_channels(message = ''):
        raise ValueError('Trying to configure incompatible APA channels: ' + message)
    
    def fill_wire_relays_bottom_and_top(relays_bottom_and_top, relay):
        if relay <= 64:
            relays_bottom_and_top[0].append(relay)
        else:
            relays_bottom_and_top[1].append(relay-64)
    
    # Bottom relay board is index 0, top is 1
    wire_signal_relays_bottom_and_top = [[], []]
    wire_bias_relays_bottom_and_top = [[], []]
    wire_relays_bottom_and_top = [[], []]

    if len(apa_channels) < 1:
        raise_incompatible_channels('no APA channels provided.')
    board_number = channel_map.apa_channel_to_board_number(wire_layer, apa_channels[0])

    for apa_channel in apa_channels:
        # Check if all APA channels are on a single head board
        if board_number != channel_map.apa_channel_to_board_number(wire_layer, apa_channel):
            raise_incompatible_channels(' channels are associated to more than one head board.')
        
        # Add wire signal relays
        fill_wire_relays_bottom_and_top(wire_signal_relays_bottom_and_top,
                                        channel_map.apa_channel_to_wire_relay(wire_layer, apa_channel))
        
        # Add part of wire bias relays
        if channel_map.apa_channel_to_board_channel(wire_layer, apa_channel) != 1:
            fill_wire_relays_bottom_and_top(wire_bias_relays_bottom_and_top,
                                            channel_map.apa_channel_to_wire_relay(wire_layer, apa_channel-1))

        # Add remaining part of wire bias relays, taking into account that last APA channel is different per layer and per board
        if ((wire_layer == 'X' and channel_map.apa_channel_to_board_channel(wire_layer, apa_channel) != 48)
                or (wire_layer in {'V', 'U'} and channel_map.apa_channel_to_board_channel(wire_layer, apa_channel) != 40)
                or (wire_layer == 'G' and channel_map.apa_channel_to_board_number(wire_layer, apa_channel) == 1
                    and channel_map.apa_channel_to_board_channel(wire_layer, apa_channel) != 49)
                or (wire_layer == 'G' and channel_map.apa_channel_to_board_number(wire_layer, apa_channel) != 1
                    and channel_map.apa_channel_to_board_channel(wire_layer, apa_channel) != 48)):
            fill_wire_relays_bottom_and_top(wire_bias_relays_bottom_and_top,
                                            channel_map.apa_channel_to_wire_relay(wire_layer, apa_channel+1))

    # Check no DWA channel is used twice
    dwa_channels = []
    for wire_signal_relays in wire_signal_relays_bottom_and_top:
        for relay in wire_signal_relays:
            dwa_channels.append(channel_map.wire_relay_to_dwa_channel(relay))
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

    wire_config = {
        'relayWireTop': format(concatenated_wire_relays_bottom_and_top[1], '016X'),
        'relayWireBot': format(concatenated_wire_relays_bottom_and_top[0], '016X'),
        'relayBusTop': format(concatenated_bus_relays_bottom_and_top[1], '08X'),
        'relayBusBot': format(concatenated_bus_relays_bottom_and_top[0], '08X')
    }

    return wire_config