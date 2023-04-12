"""
This script is used to tune the settings of the new resonance fitting algorithm.

The resonance fitting algorithm models the observed waveforms as a series of resonances,
each of which is modeled by a Templateian function (after a CWT transform). For a given channel,
the algorithm finds the optimal placement of resonances and calculates the tension of each segment 
by minimizing the sum of the squared residuals between the observed and modeled waveforms.

This script tunes the algorithm by working in the opposite direction: Tensions are given
from a file containing human-labeled data (or laser measurements) that are assumed as "ground truth".
Then, the width and offset of the Templateian function are varied to find the best fit for each
resonance. The best fit is determined by minimizing the sum of the squared residuals between
the observed and modeled waveforms.
"""

import argparse
import os
import sys
import numpy as np

import pandas as pd
from scipy import optimize
sys.path.append("../")
sys.path.append("../processing")
sys.path.append("../mappings")
from run_processing import convert_top_level_dir_to_dataframe, load_measurement
import tension_algorithm_v2 as ta


def merge_dataframes(raw_df, truth_df):
    """Merge the raw data and truth data dataframes.

    The truth dataframe contains one row for each segment, while the raw dataframe
    has one row for each measurement of eight APA channels.
    We want to create a new dataframe with one row per measured spectrum, i.e. one
    row per scan ID and APA channel. The new dataframe will contain the tension values
    for each segment.
    """

    # Create a new dataframe with one row per measured spectrum
    merged_df = truth_df[
        ["scan_id", "apa_channel", "headboard_num", "side", "layer", "datetime"]
    ].drop_duplicates()
    # Add column for json_path
    merged_df["json_path"] = None
    merged_df["tension_1"] = np.nan
    merged_df["tension_2"] = np.nan
    merged_df["tension_3"] = np.nan

    # For each row in the merged dataframe, find all the rows in the truth dataframe
    # that have the same scan ID and APA channel. We extract the tension
    # in ascending order of segment number.
    for index, row in merged_df.iterrows():
        scan_id = row["scan_id"]
        # Check that the scan ID exists in the raw dataframe
        if scan_id not in raw_df["scan_id"].values:
            continue
        # Get the json_path for the scan ID from the raw_df
        merged_df.loc[index, "json_path"] = raw_df.loc[
            raw_df["scan_id"] == scan_id, "json_path"
        ].values[0]
        apa_channel = row["apa_channel"]
        tension_segment_list = truth_df.loc[
            (truth_df["scan_id"] == scan_id) & (truth_df["apa_channel"] == apa_channel),
            ["segment", "true_tension"],
        ].to_numpy()
        # Sort along segment axis
        tension_segment_list = sorted(tension_segment_list, key=lambda x: x[0])
        # Extract the tension values
        tension_list = [x[1] for x in tension_segment_list]
        # Add the tension values to the raw dataframe
        merged_df.loc[index, "tension_1"] = tension_list[0]
        if len(tension_list) > 1:
            merged_df.loc[index, "tension_2"] = tension_list[1]
        if len(tension_list) > 2:
            merged_df.loc[index, "tension_3"] = tension_list[2]

    # Drop rows where the json_path is null
    merged_df = merged_df[merged_df["json_path"].notnull()]
    # Drop rows where the tension values are all null
    merged_df = merged_df[merged_df["tension_1"].notnull()]
    # reset index
    merged_df.reset_index(drop=True, inplace=True)
    return merged_df


def get_channel_data(df, scan_id, apa_channel):
    """Get the measurement data for a given channel.

    The output dict contains the waveform as well as the expected resonance frequencies
    at the nominal tension for each segment.
    """

    measurement_dict = load_measurement(df, scan_id)
    channel_dict = measurement_dict[apa_channel]

    # Add the tranformed waveform to the dict
    freq, ampl = channel_dict["freq"], channel_dict["ampl"]
    # Get cleaned waveform
    algo = ta.TensionAlgorithmV2(0)
    cleaned_signal = algo.cumsum_and_baseline_subtracted(freq, ampl)
    avg_ampl = algo._transform_cwt_amplitude(cleaned_signal)

    channel_dict["cwt_transformed"] = avg_ampl
    # Add truth information
    tension_1 = df.loc[
        (df["scan_id"] == scan_id) & (df["apa_channel"] == apa_channel), "tension_1"
    ].values[0]
    tension_2 = df.loc[
        (df["scan_id"] == scan_id) & (df["apa_channel"] == apa_channel), "tension_2"
    ].values[0]
    tension_3 = df.loc[
        (df["scan_id"] == scan_id) & (df["apa_channel"] == apa_channel), "tension_3"
    ].values[0]
    tensions = []
    if not np.isnan(tension_1):
        tensions.append(tension_1)
    if not np.isnan(tension_2):
        tensions.append(tension_2)
    if not np.isnan(tension_3):
        tensions.append(tension_3)
    channel_dict["true_tensions"] = tensions
    return channel_dict


def make_channel_data_dict(df):
    """Make a dict with the channel data for each scan ID and APA channel.

    The dict is indexed by scan ID and APA channel.
    """
    channel_data_dict = {}
    for index, row in df.iterrows():
        scan_id = row["scan_id"]
        apa_channel = row["apa_channel"]
        channel_data_dict[(scan_id, apa_channel)] = get_channel_data(df, scan_id, apa_channel)
    return channel_data_dict


def calculate_residual(
    channel_data,
    template_scale=16.0,
    tension_offset=0.0,
    template_offset=2.0,
    template_offset_multiplier=1.0,
    template_dof=10.0,
    fit_tensions_locally=False,
):
    algo = ta.TensionAlgorithmV2(0)
    true_tensions = np.array(channel_data["true_tensions"]) + tension_offset
    if not fit_tensions_locally:
        return algo._tension_fit_residual(
            true_tensions,
            channel_data["freq"],
            channel_data["cwt_transformed"],
            channel_data["freq_expectation"],
            template_scale=template_scale,
            template_dof=template_dof,
            a=template_offset_multiplier,
            b=template_offset,
            downsample=2,
        )

    # Minimize the residual locally with respect to the tensions.
    def loss_function(tensions):
        return algo._tension_fit_residual(
            tensions,
            channel_data["freq"],
            channel_data["cwt_transformed"],
            channel_data["freq_expectation"],
            template_scale=template_scale,
            template_dof=template_dof,
            a=template_offset_multiplier,
            b=template_offset,
            downsample=2,
        )

    # Set boundaries for the tensions to within 0.5 N of the true tensions
    bounds = [(x - 0.5, x + 0.5) for x in true_tensions]
    # Use the true tensions as initial guess
    result = optimize.minimize(loss_function, true_tensions, bounds=bounds, method="L-BFGS-B")
    return result.fun


def optimize_tensions_offset(
    channel_data,
    template_scale=16.0,
    template_offset=2.0,
    template_offset_multiplier=1.0,
):
    """Optimize the tension offset for a given channel.

    The offset is optimized by minimizing the residual of the tension fit.
    """

    def fit_residual(offset):
        return calculate_residual(
            channel_data,
            template_scale=template_scale,
            tension_offset=offset,
            template_offset=template_offset,
            template_offset_multiplier=template_offset_multiplier,
        )

    # optimize fit residual with scipy minimize
    result = optimize.minimize(fit_residual, 0.0, method="Nelder-Mead")
    # return best offset and best residual
    return result.x[0], result.fun


def optimize_batch(channel_data_list, verbosity=0, fit_tensions_locally=False):
    """Optimize the algorithm parameters for a batch of channels."""

    def fit_residual(params):
        residual = 0.0
        for channel_data in channel_data_list:
            residual += calculate_residual(
                channel_data,
                template_scale=params[0],
                tension_offset=0.0,
                template_offset=params[1],
                template_offset_multiplier=1.0,
                template_dof=params[2],
                fit_tensions_locally=fit_tensions_locally,
            )
        if verbosity > 1:
            print(f"Params: {params}  Residual: {residual}")
        return residual

    initial_guess = [16.0, 2.0, 10.0]
    bounds = [(10.0, 20.0), (0.0, 10.0), (1.0, 20.0)]
    # optimize fit residual with scipy minimize
    result = optimize.minimize(
        fit_residual,
        initial_guess,
        bounds=bounds,
        method="Nelder-Mead",
        options={"disp": verbosity > 1},
    )
    if verbosity > 0:
        print(result)
    # return best parameters and best residual
    return result.x, result.fun


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

    parser.add_argument(
        "input_dir",
        help="Directory containing the raw data files.",
        type=path_exists,
    )

    parser.add_argument(
        "--truth-csv",
        dest="truth_csv_path",
        help="Path to the CSV file containing the truth data (human labeled or laser).",
        required=True,
        type=path_exists,
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
        "--debug",
        dest="debug",
        help="Run in debug mode.",
        required=False,
        action="store_true",
    )

    parser.add_argument(
        "--layer",
        dest="layer",
        help="Use only events from this layer for the fit.",
        required=False,
        type=str,
        default=None,
    )

    parser.add_argument(
        "--local-fit",
        dest="local_fit",
        help="Fit the tensions locally.",
        required=False,
        action="store_true",
    )

    args = parser.parse_args()
    input_dir = args.input_dir
    verbosity = args.verbose
    print("Verbosity:", verbosity)
    debug = args.debug

    # Load the raw data
    raw_df = convert_top_level_dir_to_dataframe(input_dir)

    # Load the truth data
    truth_df = pd.read_csv(args.truth_csv_path, comment="#")
    # Rename the column "tension" to "true_tension" to avoid confusion
    truth_df.rename(columns={"tension": "true_tension"}, inplace=True)

    # The set of available layers is the set of layers that are present in both the truth and the raw data
    available_layers = set(truth_df["layer"].unique()).intersection(set(raw_df["layer"].unique()))
    if args.layer:
        if args.layer not in available_layers:
            print(f"Layer {args.layer} not found in the data.")
            print(f"Available layers: {available_layers}")
            sys.exit(0)
        truth_df = truth_df.loc[truth_df["layer"] == args.layer]
        raw_df = raw_df.loc[raw_df["layer"] == args.layer]
    # Merge the raw and truth dataframes
    merged_df = merge_dataframes(raw_df, truth_df)
    if len(merged_df) == 0:
        print(f"No data found for layer {args.layer}")
        sys.exit(0)
    print("Number of scans used to calibrate:", len(merged_df))

    # Make a dict with the channel data for each scan ID and APA channel
    channel_data_dict = make_channel_data_dict(merged_df)

    # Optimize the tension offset for each channel in a batch
    channel_data_list = list(channel_data_dict.values())
    if args.local_fit:
        print("Fitting tensions locally. This may increase runtime.")
    params, residual = optimize_batch(
        channel_data_list, verbosity=verbosity, fit_tensions_locally=args.local_fit
    )
    print("Best parameters:")
    print("Template scale:", params[0])
    print("Template offset:", params[1])
    print("Template degrees of freedom:", params[2])
    print("Average residual:", residual / len(channel_data_list))
