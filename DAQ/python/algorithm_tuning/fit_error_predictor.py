"""
This script is used to fit a model predicting the error of the resonance fitting algorithm.

The model takes as input the dictionary of fit diagnostics that is returned by the algorithm after each fit
and attempts to predict the absolute error of the result. This can be used to give a confidence score to the
fit result.

The user needs to pass the path to the raw waveforms as well as a path to a file containing fit results
and a path to a file containing labeled `true` tension values. The script will run the `_get_fit_diagnostics`
function of the algorithm for each waveform and then use the labeled tension values to train a model to predict
the error of the fit. The resulting scikit-learn model is saved to a pickle file.
"""

import argparse
import os
import sys

import pandas as pd
import numpy as np

sys.path.append("../")
sys.path.append("../processing")
sys.path.append("../mappings")
from run_processing import convert_top_level_dir_to_dataframe
import tension_algorithm_v2 as ta

from tune_waveform_modeling import (
    merge_dataframes,
    make_channel_data_dict,
)


def add_fit_tensions(channel_data_dict, fit_result_df):
    for scan_id, apa_channel in channel_data_dict:
        channel_data = channel_data_dict[(scan_id, apa_channel)]
        fit_result = fit_result_df.loc[
            (fit_result_df["scan_id"] == scan_id) & (fit_result_df["apa_channel"] == apa_channel),
            ["segment", "tension"],
        ].to_numpy()
        if len(fit_result) == 0:
            continue
        # sort by segment and extract tension
        fit_result = fit_result[fit_result[:, 0].argsort()]
        fit_tensions = fit_result[:, 1]

        channel_data["fit_tensions"] = fit_tensions
    return channel_data_dict


def get_fit_diagnostics(
    channel_data,
):
    algo = ta.TensionAlgorithmV2(0)
    true_tensions = np.array(channel_data["true_tensions"])
    cwt_transformed_ampl = channel_data["cwt_transformed"]
    freq = channel_data["freq"]
    fit_tensions = channel_data["fit_tensions"]

    fit_diagnostics = algo._get_fit_diagnostics(
        fit_tensions,
        freq,
        cwt_transformed_ampl,
        channel_data["freq_expectation"],
        channel_data["layer"],
        downsample=2,
        weight_merge_width=5,
    )

    # Add the true tension to the fit diagnostics
    fit_diagnostics["true_tensions"] = true_tensions
    return fit_diagnostics

def make_features_and_labels(channel_data_dict, feature_keys=None):
    """Make the features and labels for the model.
    
    The features and labels are produced for each measured tension. When a scan
    contains multiple tensions, the features and labels are placed in separate 
    rows in the resulting arrays. If a feature applies to the whole scan (such as the fit residual),
    it is repeated for each tension.
    """
    features = []
    labels = []
    for scan_id, apa_channel in channel_data_dict:
        channel_data = channel_data_dict[(scan_id, apa_channel)]
        fit_diagnostics = get_fit_diagnostics(channel_data)
        if feature_keys is None:
            feature_keys = fit_diagnostics.keys()
        n_tensions = len(channel_data["true_tensions"])
        for i in range(n_tensions):
            feature_row = []
            for key in feature_keys:
                if key not in fit_diagnostics:
                    raise ValueError(f"Feature key {key} not found in fit diagnostics.")
                # Check if the feature is a list or numpy array. If so, use the value at the current tension index.
                # Otherwise, use the value for the whole scan.
                if isinstance(fit_diagnostics[key], list) or isinstance(fit_diagnostics[key], np.ndarray):
                    if i >= len(fit_diagnostics[key]):
                        import pdb; pdb.set_trace()
                    feature_row.append(fit_diagnostics[key][i])
                else:
                    feature_row.append(fit_diagnostics[key])
            features.append(feature_row)
            labels.append(np.abs(channel_data["true_tensions"][i] - channel_data["fit_tensions"][i]))

    features = np.array(features)
    labels = np.array(labels)

    return features, labels


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

    parser.add_argument(
        "--fit-results-csv",
        dest="fit_results_csv_path",
        help="Path to the CSV file containing the fit results.",
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
        "--output",
        dest="output_path",
        help="Path to the output file.",
        required=True,
        type=parent_dir_exists,
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

    # Load the fit results
    fit_result_df = pd.read_csv(args.fit_results_csv_path, comment="#")
    channel_data_dict = add_fit_tensions(channel_data_dict, fit_result_df)

    feature_keys = ["min_weights", "weight_ratio_min_max", "max_unmatched_peak_weight"]
    # Make the features and labels
    features, labels = make_features_and_labels(channel_data_dict, feature_keys=feature_keys)

    if verbosity > 1:
        print("Features (first 10 rows):")
        print(features[:10])
        print("Labels (first 10 rows):")
        print(labels[:10])
    # Make the model
    from sklearn.tree import DecisionTreeRegressor, export_text
    model = DecisionTreeRegressor(max_depth=3)

    # Train the model
    model.fit(features, labels)

    if verbosity > 0:
        print("Feature importances:")
        for i, feature in enumerate(feature_keys):
            print(f"{feature}: {model.feature_importances_[i]}")
        print("Tree structure:")
        print(export_text(model, feature_names=feature_keys))

    # Save the model
    import joblib
    joblib.dump(model, args.output_path)