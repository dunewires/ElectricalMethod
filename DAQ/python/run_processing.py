"""Run the waveform analysis on a directory of raw data without invoking the GUI.

This runs the same algorithm as the GUI app, but from the console. The result is stored in 
the same JSON format as the GUI app. The algorithm version can be set alongside a number
of configuration parameters.

The basic operation runs as follows:

First, the raw data is read from the input directory and turned into a pandas DataFrame with
one row per Scan ID. The row contains the path to the raw data file with the waveforms that 
correspond to that scan.
The code then iterates over the rows of the DataFrame, reading the raw data and running the
waveform analysis, which results in best fit tensions for each segment. The results are stored
in a new DataFrame with one row per segment. The row contains the Scan ID, the segment number,
the best fit tension, and the uncertainties on the tension. The DataFrame is then converted
to a JSON file in the same output format as the GUI app.
"""

import os
import sys
import pandas as pd
import numpy as np

import json
import tqdm
from dwa_daq_constants import APA_LAYERS, APA_SIDES, APA_STAGES_SCANS, MAX_WIRE_SEGMENT

sys.path.append("processing/")
sys.path.append("mappings/")
import process_scan
import channel_frequencies


def convert_top_level_dir_to_dataframe(input_dir):
    """Convert a top level directory of raw data into a pandas DataFrame.

    The DataFrame has one row per Scan ID. The row contains the path to the raw data file with
    the waveforms that correspond to that scan.
    """
    folders = os.listdir(input_dir)
    datetimes = [f.split("_")[0] for f in folders if f.endswith("_T")]
    layers = [f.split("_")[1] for f in folders if f.endswith("_T")]
    sides = [f.split("_")[2] for f in folders if f.endswith("_T")]
    headboard_num = [int(f.split("_")[3]) for f in folders if f.endswith("_T")]
    wires = [f.split("_")[4] for f in folders if f.endswith("_T")]
    folders = [f for f in folders if f.endswith("_T")]

    df = pd.DataFrame({"datetime": datetimes})
    df["datetime"] = pd.to_datetime(df["datetime"], format="%Y%m%dT%H%M%S")
    df["layer"] = layers
    df["side"] = sides
    df["headboard_num"] = headboard_num
    # df["wires"] = wires
    df["json_path"] = [
        os.path.join(input_dir, f, "amplitudeData.json") for f in folders if f.endswith("_T")
    ]
    df["scan_id"] = folders

    return df


def load_json_at_index(df, index):
    file_path = df.iloc[index]["json_path"]
    if not os.path.exists(file_path):
        return None
    with open(file_path, "r") as f:
        data = json.load(f)
    return data


def load_measurement(df, scan_id, algorithm_version="v2", verbosity=0):
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
    headboard_num = df.loc[index, "headboard_num"].astype(int)

    out_dict = {}
    out_dict["layer"] = layer
    out_dict["side"] = side
    out_dict["apa_channels"] = apa_channels
    out_dict["headboard_num"] = headboard_num

    processing_algorithm = process_scan.get_tension_algorithm(
        algorithm_version, verbosity=verbosity
    )
    for i, channel in enumerate(apa_channels):
        x = np.array(data[str(i)]["freq"])
        if len(x) == 0:
            out_dict[channel] = {"freq": [], "ampl": []}
            continue
        y = np.array(data[str(i)]["ampl"])
        y = processing_algorithm.cumsum_and_baseline_subtracted(x, y)
        out_dict[channel] = {"freq": x, "ampl": y}
        segments, frequency_expectation = channel_frequencies.get_frequency_expectation(
            channel, layer
        )
        out_dict[channel]["freq_expectation"] = frequency_expectation
        out_dict[channel]["segments"] = segments
    return out_dict


def process_raw_data_to_dict(raw_df, algorithm_version="v2", verbosity=0, max_freq=300):
    processing_algorithm = process_scan.get_tension_algorithm(
        algorithm_version, verbosity=verbosity
    )
    results_dict = {}
    for index, row in tqdm.tqdm(raw_df.iterrows(), total=len(raw_df)):
        scan_id = row["scan_id"]
        scan_dict = load_measurement(raw_df, scan_id)
        if scan_dict is None:
            continue
        for dwa_channel in range(8):
            apa_channel = scan_dict["apa_channels"][dwa_channel]
            if apa_channel is None or (not apa_channel > 0):
                # If a measurement is missing, the APA channel will be -1
                continue
            layer = scan_dict["layer"]
            side = scan_dict["side"]
            frequencies = scan_dict[apa_channel]["freq"]
            if len(frequencies) == 0:
                continue
            amplitudes = scan_dict[apa_channel]["ampl"]

            (
                wire_segments,
                selected_moved_res_arr,
                selected_tension,
                confidences,
            ) = processing_algorithm.process_channel(
                layer, apa_channel, frequencies, amplitudes, max_freq=max_freq, nominal_tension=6.5
            )

            scan_dict[apa_channel]["wire_segments"] = wire_segments
            scan_dict[apa_channel]["selected_moved_res_arr"] = selected_moved_res_arr
            scan_dict[apa_channel]["selected_tension"] = selected_tension
            scan_dict[apa_channel]["confidences"] = confidences

        results_dict[scan_id] = scan_dict
    return results_dict

def results_dict_to_dataframe(results_dict):
    """Convert a results dictionary to a pandas DataFrame."""
    data_list = []
    # We need three nested loops: Outermost over all scan IDs, then over all APA channels, then over all
    # wire segments.
    for scan_id, scan_dict in results_dict.items():
        apa_channels = scan_dict["apa_channels"]
        side = scan_dict["side"]
        layer = scan_dict["layer"]
        headboard_num = scan_dict["headboard_num"]
        for dwa_channel, apa_channel in enumerate(apa_channels):
            if apa_channel is None or (not apa_channel > 0):
                continue
            if "segments" not in scan_dict[apa_channel]:
                continue

            wire_segments = scan_dict[apa_channel]["segments"]
            selected_tension = scan_dict[apa_channel]["selected_tension"]
            confidences = scan_dict[apa_channel]["confidences"]

            for segment, tension, confidence in zip(wire_segments, selected_tension, confidences):
                data_list.append(
                    {
                        "scan_id": scan_id,
                        "side": side,
                        "layer": layer,
                        "headboard_num": headboard_num,
                        "apa_channel": apa_channel,
                        "dwa_channel": dwa_channel,
                        "segment": segment,
                        "tension": tension,
                        "confidence": confidence,
                    }
                )
    result_df = pd.DataFrame(data_list)
    return result_df


def convert_result_dict_to_json(results_dict_from_raw, stage="Winding"):
    """Convert the result dict to a JSON file.

    Parameters
    ----------
    results_dict_from_raw : dict
        Dictionary with scan IDs as keys and dictionaries with APA channels as keys and
        dictionaries with frequency and amplitude arrays as values.
    stage : str
        The stage of the measurement.
    
    Returns
    -------
    dict
        Output dictionary in the format expected by the GUI.
    """

    # The input 
    result_dict = process_scan.new_results_dict(
        APA_STAGES_SCANS, APA_LAYERS, APA_SIDES, MAX_WIRE_SEGMENT
    )

    # iterate over scan_ids
    for scan_id, scan_dict in results_dict_from_raw.items():
        layer = scan_dict["layer"]
        side = scan_dict["side"]
        apa_channels = scan_dict["apa_channels"]
        for dwa_channel, apa_channel in enumerate(apa_channels):
            if apa_channel is None or (not apa_channel > 0):
                continue
            if "segments" not in scan_dict[apa_channel]:
                continue

            segments = scan_dict[apa_channel]["segments"]
            best_tensions = scan_dict[apa_channel]["selected_tension"]
            best_tension_confidences = scan_dict[apa_channel]["confidences"]

            process_scan.update_results_dict_tension(
                result_dict,
                stage,
                layer,
                side,
                scan_id,
                segments,
                best_tensions,
                best_tension_confidences,
            )
    
    return result_dict

if __name__ == "__main__":
    import argparse
    # Parse the command line arguments
    parser = argparse.ArgumentParser()
    
    # define argument type that checks if the path exists
    def path_exists(path):
        if not os.path.exists(path):
            raise argparse.ArgumentTypeError(f"Path {path} does not exist.")
        return path
    # define argument type that checks if the parent directory exists
    def parent_dir_exists(path):
        parent_dir = os.path.dirname(path)
        if not os.path.exists(parent_dir):
            raise argparse.ArgumentTypeError(f"Path {parent_dir} does not exist.")
        return path

    parser.add_argument(
        "input_dir",
        help="Directory containing the raw data files.",
        type=path_exists,
    )
    
    parser.add_argument(
        "--json",
        dest="output_json_path",
        help="Path to the output JSON file.",
        type=parent_dir_exists,
        required=False,
        default=None,
    )

    parser.add_argument(
        "--csv",
        dest="output_csv_path",
        help="Path to the output CSV file.",
        required=False,
        default=None,
        type=parent_dir_exists,
    )

    # The verbosity level can be passed as "-v" or "-vv", etc.
    parser.add_argument(
        "-v",
        "--verbose",
        action="count",
        default=0,
        help="Increase output verbosity.",
    )

    args = parser.parse_args()
    input_dir = args.input_dir
    verbosity = args.verbose
    print("Verbosity:", verbosity)
    output_csv_path = args.output_csv_path

    output_json_path = args.output_json_path
    if output_json_path is None:
        # By default, we place the processed data in <file_dir>/scanData/processed with the same name as the
        # input directory and a .json extension.
        output_json_path = os.path.join(
            os.path.dirname(__file__),
            "scan_data", "processed",
            os.path.basename(input_dir) + ".json",
        )

    # Load the raw data
    raw_df = convert_top_level_dir_to_dataframe(input_dir)

    # Process the raw data
    results_dict = process_raw_data_to_dict(raw_df, algorithm_version="v2", verbosity=verbosity, max_freq=300)

    # Convert the results dict to a DataFrame
    result_df = results_dict_to_dataframe(results_dict)

    # Save the DataFrame to a CSV file
    if output_csv_path is not None:
        result_df.to_csv(output_csv_path, index=False)

    # Convert the results dict to a JSON file
    result_json = convert_result_dict_to_json(results_dict, stage="Winding")
    with open(output_json_path, "w") as f:
        json.dump(result_json, f)

    