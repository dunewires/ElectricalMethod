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

import ast
import os
import sys
import pandas as pd
import numpy as np
import argparse

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
    folders = [f for f in os.listdir(input_dir) if f.endswith("_T")]
    datetimes = [f.split("_")[0] for f in folders]
    layers = [f.split("_")[1] for f in folders]
    sides = [f.split("_")[2] for f in folders]
    headboard_num = [int(f.split("_")[3]) for f in folders]
    wires = [f.split("_")[4] for f in folders]

    json_folders = [f for f in folders if f.endswith("_T")]
    json_paths = [os.path.join(input_dir, f, "amplitudeData.json") for f in json_folders]

    df = pd.DataFrame({"datetime": datetimes})
    df["datetime"] = pd.to_datetime(df["datetime"], format="%Y%m%dT%H%M%S")
    df["layer"] = layers
    df["side"] = sides
    df["headboard_num"] = headboard_num
    # df["wires"] = wires
    df["json_path"] = json_paths
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
    datetime = df.loc[index, "datetime"]
    out_dict = {}
    out_dict["layer"] = layer
    out_dict["side"] = side
    out_dict["apa_channels"] = apa_channels
    out_dict["headboard_num"] = headboard_num
    out_dict["datetime"] = datetime

    for i, channel in enumerate(apa_channels):
        x = np.array(data[str(i)]["freq"])
        if len(x) == 0:
            out_dict[channel] = {"freq": [], "ampl": []}
            continue
        y = np.array(data[str(i)]["ampl"])
        out_dict[channel] = {"freq": x, "ampl": y}
        segments, frequency_expectation = channel_frequencies.get_expected_resonances_unique(
            channel, layer
        )
        out_dict[channel]["freq_expectation"] = frequency_expectation
        out_dict[channel]["segments"] = segments
    return out_dict


def process_raw_data_to_dict(raw_df, algorithm_version="v2", verbosity=0, max_freq=300, debug=False, **kwargs):
    processing_algorithm = process_scan.get_tension_algorithm(
        algorithm_version, verbosity=verbosity
    )
    results_dict = {}
    max_index = len(raw_df)
    if debug:
        max_index = 10
    for index, row in tqdm.tqdm(raw_df.iterrows(), total=len(raw_df)):
        if index >= max_index:
            break
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
                selected_tensions,
                confidences,
            ) = processing_algorithm.process_channel(
                layer, apa_channel, frequencies, amplitudes, max_freq=max_freq, nominal_tension=6.5, **kwargs
            )

            scan_dict[apa_channel]["wire_segments"] = wire_segments
            scan_dict[apa_channel]["selected_moved_res_arr"] = selected_moved_res_arr
            scan_dict[apa_channel]["selected_tensions"] = selected_tensions
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
        datetime = scan_dict["datetime"]
        for dwa_channel, apa_channel in enumerate(apa_channels):
            if apa_channel is None or (not apa_channel > 0):
                continue
            if "segments" not in scan_dict[apa_channel]:
                continue

            wire_segments = scan_dict[apa_channel]["segments"]
            selected_tensions = scan_dict[apa_channel]["selected_tensions"]
            confidences = scan_dict[apa_channel]["confidences"]

            if len(selected_tensions) == 0:
                continue

            for segment, tension, confidence in zip(wire_segments, selected_tensions, confidences):
                try:
                    tension = float(tension)
                except TypeError:
                    tension = np.nan
                    confidence = np.nan
                if tension < 0:
                    tension = np.nan
                    confidence = np.nan
                data_list.append(
                    {
                        "scan_id": scan_id,
                        "datetime": datetime,
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
            best_tensions = scan_dict[apa_channel]["selected_tensions"]
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

def to_csv_with_comments(df, path_or_buf=None, comment_lines=None, **kwargs):
    if path_or_buf is None:
        raise ValueError("You must provide a file path or buffer to write the CSV data to.")
    
    # Write comments to file first
    if comment_lines is not None:
        with open(path_or_buf, 'w') as file:
            for comment in comment_lines:
                file.write(f"# {comment}\n")

    # Write DataFrame contents to file using to_csv
    df.to_csv(path_or_buf=path_or_buf, index=False, header=True, mode='a', **kwargs)

class ParseKwargsAction(argparse.Action):
    def __call__(self, parser, namespace, values, option_string=None):
        try:
            kwargs_dict = ast.literal_eval(values)
            setattr(namespace, self.dest, kwargs_dict)
        except Exception as e:
            raise argparse.ArgumentTypeError(f"Invalid value for {option_string}: {values}. Error: {e}")

def get_default_algo_kwargs(algorithm_version):
    processing_algorithm = process_scan.get_tension_algorithm(
        algorithm_version, verbosity=0
    )
    available_settings = processing_algorithm.get_available_settings()
    default_dict = dict([(key, value["default"]) for key, value in available_settings.items()])
    return default_dict

if __name__ == "__main__":
    

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
    
    # define argument type for Python dictionary
    def dict_from_str(string):
        dict = eval(string)

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

    parser.add_argument(
        "--version",
        dest="algo_version",
        help="Version of the algorithm to use.",
        required=False,
        default="v1",
        type=str,
    )

    parser.add_argument(
        "--kwargs",
        dest="algo_kwargs",
        help="Keyword arguments to pass to the algorithm.",
        required=False,
        action=ParseKwargsAction,
        default={},
    )

    parser.add_argument(
        "--debug",
        dest="debug",
        help="Run in debug mode.",
        required=False,
        action="store_true",
    )

    args = parser.parse_args()
    input_dir = args.input_dir
    verbosity = args.verbose
    print("Verbosity:", verbosity)
    output_csv_path = args.output_csv_path

    assert args.algo_version in ["v1", "v2"], "Algorithm version must be v1 or v2."
 
    output_json_path = args.output_json_path
    if output_json_path is None:
        # By default, we place the processed data in <file_dir>/scanData/processed with the same name as the
        # input directory and a .json extension.
        output_json_path = os.path.join(
            os.path.dirname(__file__),
            "scan_data",
            "processed",
            os.path.basename(input_dir) + ".json",
        )

    # Load the raw data
    raw_df = convert_top_level_dir_to_dataframe(input_dir)

    # Process the raw data
    results_dict = process_raw_data_to_dict(
        raw_df, algorithm_version=args.algo_version, verbosity=verbosity, max_freq=300, debug=args.debug, **args.algo_kwargs
    )

    # Convert the results dict to a DataFrame
    result_df = results_dict_to_dataframe(results_dict)

    # Save the DataFrame to a CSV file
    comment_lines = [
        "This file contains the results of the tension measurement algorithm.",
        f"Algorithm version: {args.algo_version}",
        f"Input directory: {input_dir}",
        f"Output JSON file: {output_json_path}",
    ]

    
    # We want to add not only the kwargs that were set, but also all the default values
    # to the comment lines. This way, we can see what the default values were when the
    # file was created.
    algo_kwargs = get_default_algo_kwargs(args.algo_version)
    algo_kwargs.update(args.algo_kwargs)

    if algo_kwargs:
        comment_lines.append("Algorithm keyword arguments:")
        for key, value in algo_kwargs.items():
            comment_lines.append(f"{key}: {value}")
    
    if output_csv_path is not None:
        to_csv_with_comments(result_df, path_or_buf=output_csv_path, comment_lines=comment_lines)

    # Convert the results dict to a JSON file
    result_json = convert_result_dict_to_json(results_dict, stage="Winding")
    with open(output_json_path, "w") as f:
        json.dump(result_json, f)
