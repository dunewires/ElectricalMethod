import channel_frequencies

def get_measured_resonances(layer_data, wire_layer, channel, thresh = 1000.):
    '''
    Returns a list the the measured resonances for the givven channel.
    '''
    wires, _ = channel_frequencies.get_expected_resonances(wire_layer, channel, thresh)
    # Do we have all the scans we need?
    measured_resonances = []
    for w in wires: 
        if w not in layer_data.keys(): return []
        measured_resonances.append(layer_data[w])
    non_duplicates = []
    for rl in measured_resonances:
        for r in rl:
            if r not in non_duplicates: non_duplicates.append(r)
    return non_duplicates

def get_pointer_table(sietch, apa_uuid, stage):
    '''
    Obtain most recent pointer table entry.
    '''
    tension_frame_uuid = get_tension_frame_uuid_from_apa_uuid(sietch, apa_uuid)
    mostRecentPointerTableLookup = ""
    try:
        mostRecentPointerTableLookup = sietch.api("/search/test?limit=1", {
            "formId": "wire_tension_pointer", 
            "componentUuid": tension_frame_uuid,
            "stage": stage,
            # "layer": layer
        })
    except:
        # No pointer table found for UUID
        # TODO: Make popup message
        return

    if mostRecentPointerTableLookup:
        mostRecentPointerTableDBid = mostRecentPointerTableLookup[0]["_id"]
        # Get table from database
        pointerTable = sietch.api("/test/"+mostRecentPointerTableDBid)
        return pointerTable

def get_layer_data(sietch, apa_uuid, side, wire_layer, stage):
    '''
    Gets pointer table associated with the given tension frame, then loops over all the pointers for the given 
    side and layer and returns a dictionary with the resonances.
    '''
    # Get table from database
    pointerTable = get_pointer_table(sietch, apa_uuid, stage)
    # Lookup table found, loop over layers
    wirePointersAllLayers = pointerTable["data"]["wires"]
    
    if wire_layer not in wirePointersAllLayers.keys():
        # TODO: Make popup message
        print("No pointer table found for layer "+wire_layer+".")
        return
    
    wirePointersForLayer = wirePointersAllLayers[wire_layer]   
        
    # Separate the A and B sides
    pointers = wirePointersForLayer[side]

    # Get list of database ids for the individual wire measurements
    recordIds = [x["testId"] for x in pointers]
    
    # Get database entries for the individual wire resonance measurements
    resonanceEntries = sietch.api("/test/getBulk",recordIds)
    
    # Extract the list of resonances from the database entries
    resonanceDictionaries = [entry["data"]["wires"] for entry in resonanceEntries]
    layer_data = {}
    for d in resonanceDictionaries:
        for w in d.keys():
            layer_data[w] = d[w]
    return layer_data

def get_tension_frame_uuid_from_apa_uuid(sietch, apa_uuid):
    '''
    Given an APA UUID, return the associated tension frame UUID
    '''
    tension_frames_metadata = sietch.api("/search/component", {
        "type":"Tension Frame",
    })
    for t in tension_frames_metadata:
        tension_frame_data = sietch.api("/component/"+t["componentUuid"])
        if tension_frame_data["data"]["apa"] == apa_uuid: return t["componentUuid"]
    return None
