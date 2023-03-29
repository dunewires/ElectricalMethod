import json
import os
import sys
import numpy as np
import pandas as pd

sys.path.append("../mappings")
from channel_frequencies import get_frequency_expectation
from peak_deconvolution import resonance_fit_scipy


def blank_tension_result():
    return {"tension": {}, "continuity": {}}


def new_results_dict(STAGES, APA_LAYERS, APA_SIDES, MAX_WIRE_SEGMENT):
    resultsDict = {}
    for stage in STAGES:
        resultsDict[stage] = {}
        for layer in APA_LAYERS:
            resultsDict[stage][layer] = {}
            for side in APA_SIDES:
                resultsDict[stage][layer][side] = {}
                for i in range(1, MAX_WIRE_SEGMENT[layer] + 1):
                    resultsDict[stage][layer][side][str(i).zfill(5)] = blank_tension_result()
    return resultsDict


def process_scan(resultsDict, dirName, model_x_g, maxFreq=250.0, verbosity=0):
    """Process a scan with a given directory name and update the given results dictionary."""
    try:  # Ensure that there is an amplitudeData.json file present!
        if verbosity > 0:
            print(dirName + "/amplitudeData.json")
        with open(dirName + "/amplitudeData.json", "r") as fh:
            data = json.load(fh)

    except:
        # print(f"Could not find scan (bad json file?) {dirName}...")
        return None, None, None

    stage = data["stage"]
    layer = data["layer"]
    side = data["side"]
    scanId = os.path.basename(dirName)
    scanType = data["type"]
    if verbosity > 0:
        print("Processing ", stage, layer, side, scanId, scanType)
    results = []
    apaChannels = data["apaChannels"]

    if scanType == "Continuity":
        for reg, apaCh in enumerate(apaChannels):
            dwaCh = str(reg)
            if verbosity > 0:
                print(f"Processing {reg}")
            # print(data[dwaCh].keys())
            apaCh = data["apaChannels"][reg]
            if not apaCh:
                results.append("no channel")
            a = np.array(data[dwaCh]["ampl"])
            # If 80% of the values are above 30000, it's probably a bridged channel
            if len(a) > 0 and len(a[a > 30000]) / len(a) > 0.8:
                results.append("bridged")
            else:
                results.append("ok")
    else:
        for reg in range(8):
            dwaCh = str(reg)
            # print(data[dwaCh].keys())
            apaCh = data["apaChannels"][reg]
            if verbosity > 0:
                print(f"Processing {reg}: APA {apaCh}")
            if not apaCh:
                if verbosity > 0:
                    print(f"DWA Chan {reg}: No channel")
                results.append(None)
                continue

            f = np.array(data[dwaCh]["freq"])
            a = np.array(data[dwaCh]["ampl"])
            if len(f) == 0 or len(f) < 50:
                if verbosity > 0:
                    print(f"DWA Chan {reg}: Not a valid scan")
                results.append(None)
                continue

            (
                segments,
                opt_res_arr,
                best_tensions,
                best_tension_confidences,
                fpks,
            ) = resonance_fit_scipy(f, a, apaCh, layer)
            # print('best',best_tensions)
            results.append(best_tensions)
            if resultsDict:
                update_results_dict_tension(
                    resultsDict,
                    stage,
                    layer,
                    side,
                    scanId,
                    segments,
                    best_tensions,
                    best_tension_confidences,
                )


def update_results_dict_tension(
    resultsDict, stage, layer, side, scanId, wireSegments, tensions, tension_confidences
):
    for i, wireSegment in enumerate(wireSegments):
        tension = tensions[i]
        tension_confidence = tension_confidences[i]
        wireSegmentStr = str(wireSegment).zfill(5)
        if wireSegmentStr not in resultsDict[stage][layer][side].keys():
            resultsDict[stage][layer][side][wireSegmentStr] = blank_tension_result()
        if not tension:
            continue
        elif tension == -1:
            resultsDict[stage][layer][side][wireSegmentStr]["tension"][scanId] = {
                "tension": "Not Found"
            }
        elif tension > 0:
            resultsDict[stage][layer][side][str(wireSegment).zfill(5)]["tension"][scanId] = {
                "tension": tension,
                "tension_confidence": tension_confidence,
                "submitted": "Auto",
                "algo_ver": "peak_deconvolution",
            }


def load_json_at_index(df, index):
    file_path = df.iloc[index]["json_path"]
    if not os.path.exists(file_path):
        return None
    with open(file_path, "r") as f:
        data = json.load(f)
    return data


def load_raw_data(directory, include_wires=False):
    """Load raw data from a given directory.

    Parameters
    ----------
    directory : str
        Path to directory containing scan folders

    Returns
    -------
    df : pd.DataFrame
        DataFrame with scan IDs and metadata
    """
    folders = os.listdir(directory)
    datetimes = [f.split("_")[0] for f in folders if f.endswith("_T")]
    layers = [f.split("_")[1] for f in folders if f.endswith("_T")]
    sides = [f.split("_")[2] for f in folders if f.endswith("_T")]
    headboard_num = [int(f.split("_")[3]) for f in folders if f.endswith("_T")]
    wires = [[int(w) for w in f.split("_")[4].split("-")] for f in folders if f.endswith("_T")]
    folders = [f for f in folders if f.endswith("_T")]

    df = pd.DataFrame({"datetime": datetimes})
    df["datetime"] = pd.to_datetime(df["datetime"], format="%Y%m%dT%H%M%S")
    df["layer"] = layers
    df["side"] = sides
    df["headboard_num"] = headboard_num
    if include_wires:
        df["wires"] = wires
    df["json_path"] = [
        os.path.join(directory, f, "amplitudeData.json") for f in folders if f.endswith("_T")
    ]
    df["scan_id"] = folders

    return df


def load_measurement(df, scan_id):
    """Load measurement data from a given scan ID

    Parameters
    ----------
    df : pd.DataFrame
        DataFrame with scan IDs
    scan_id : str
        Scan ID string

    Returns
    -------
    out_dict : dict
        Dictionary with wire APA channels as keys and dictionaries with frequency and amplitude
        arrays as values.
        The dictionary also contains the segments and their frequency expectations for each channel
        and the Layer and Side of the measurement.
    """
    index = np.arange(len(df))[df["scan_id"] == scan_id][0]
    data = load_json_at_index(df, index)
    if data is None:
        return None
    apa_channels = data["apaChannels"]
    layer = data["layer"]
    side = data["side"]

    out_dict = {}
    out_dict["layer"] = layer
    out_dict["side"] = side
    out_dict["apa_channels"] = apa_channels
    for i, channel in enumerate(apa_channels):
        x = np.array(data[str(i)]["freq"])
        if len(x) == 0:
            out_dict[channel] = {"freq": [], "ampl": []}
            continue
        y = np.array(data[str(i)]["ampl"])

        out_dict[channel] = {"freq": x, "ampl": y}
        segments, frequency_expectation = get_frequency_expectation(channel, layer)
        out_dict[channel]["freq_expectation"] = frequency_expectation
        out_dict[channel]["segments"] = segments
    return out_dict
