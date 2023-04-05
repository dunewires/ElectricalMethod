"""Converts a JSON file that is produced by the GUI app (or the processing script) into a CSV table.

The columns of the table are:
    stage, scan_id, datetime, side, layer, headboard_num, apa_channel, dwa_channel, segment, tension, confidence, submitted, algo_ver

The JSON file is expected to have the following structure:
    | <stage> (e.g. "Winding")
    |-- <layer> (e.g. "U")
        |-- <side> (e.g. "A")
            |-- <segment number> formatted as f"{segment:05d}"
                |-- "tension"
                    |-- <scan_id>
                        |-- "tension"
                        |-- "tension_confidence"
                        |-- "submitted"
                        |-- "algo_ver"

The script first finds all unique combinations of layer, side and segment number. If there is more than one
scan ID for a wire, the time and date are extracted and the later date is used. The script then creates the 
Pandas DataFrame with the columns listed above. The DataFrame is then saved to a CSV file.
"""

import sys
import numpy as np
import pandas as pd
from datetime import datetime

sys.path.append("mappings/")
from channel_frequencies import wire_to_apa_channel
from channel_map import apa_channel_to_dwa_channel


def convert_dict_to_dataframe(input_dict):
    """Converts a dictionary to a Pandas DataFrame.

    The dictionary is expected to have the following structure:
        | <stage> (e.g. "Winding")
        |-- <layer> (e.g. "U")
            |-- <side> (e.g. "A")
                |-- <segment number> formatted as f"{segment:05d}"
                    |-- "tension"
                        |-- <scan_id>
                            |-- "tension"
                            |-- "tension_confidence"
                            |-- "submitted"
                            |-- "algo_ver"

    The columns of the DataFrame are:
        stage, scan_id, datetime, side, layer, headboard_num, apa_channel, dwa_channel, segment, tension, confidence, submitted, algo_ver

    Args:
        input_dict (dict): Dictionary with the structure described above.

    Returns:
        pandas.DataFrame: DataFrame with the columns described above.
    """
    # Find all unique combinations of stage, layer, side and segment number
    unique_combinations = set()
    for stage in input_dict:
        for layer in input_dict[stage]:
            for side in input_dict[stage][layer]:
                for segment in input_dict[stage][layer][side]:
                    # We only want to add a combination if the tension data is not an empty dictionary
                    if input_dict[stage][layer][side][segment]["tension"]:
                        unique_combinations.add((stage, layer, side, segment))

    # Find the latest scan ID for each wire. The time and date is included in the scan ID string.
    def datetime_from_scan_id(scan_id):
        return datetime.strptime(scan_id.split("_")[0], "%Y%m%dT%H%M%S")

    scan_ids = {}
    for stage in input_dict:
        for layer in input_dict[stage]:
            for side in input_dict[stage][layer]:
                for segment in input_dict[stage][layer][side]:
                    if input_dict[stage][layer][side][segment]["tension"]:
                        scan_id = max(
                            input_dict[stage][layer][side][segment]["tension"].keys(),
                            key=datetime_from_scan_id,
                        )
                        scan_ids[(stage, layer, side, segment)] = scan_id

    # Create the DataFrame
    data = []

    def headboard_num_from_scan_id(scan_id):
        return int(scan_id.split("_")[3])

    for stage, layer, side, segment in unique_combinations:
        scan_id = scan_ids[(stage, layer, side, segment)]
        datetime_str = datetime_from_scan_id(scan_id)
        if scan_id not in input_dict[stage][layer][side][segment]["tension"]:
            import pdb; pdb.set_trace()
        tension = input_dict[stage][layer][side][segment]["tension"][scan_id]["tension"]
        try:
            tension = float(tension)
        except ValueError:
            tension = np.nan
        except TypeError:
            tension = np.nan

        if "tension_confidence" in input_dict[stage][layer][side][segment]["tension"][scan_id]:
            confidence = input_dict[stage][layer][side][segment]["tension"][scan_id][
                "tension_confidence"
            ]
        else:
            confidence = np.nan
        if "submitted" in input_dict[stage][layer][side][segment]["tension"][scan_id]:
            submitted = input_dict[stage][layer][side][segment]["tension"][scan_id]["submitted"]
        else:
            submitted = None
        if "algo_ver" in input_dict[stage][layer][side][segment]["tension"][scan_id]:
            algo_ver = input_dict[stage][layer][side][segment]["tension"][scan_id]["algo_ver"]
        else:
            algo_ver = None
        headboard_num = headboard_num_from_scan_id(scan_id)
        apa_channel = wire_to_apa_channel(layer, int(segment))
        dwa_channel = apa_channel_to_dwa_channel(layer, apa_channel)
        data.append(
            [
                stage,
                scan_id,
                datetime_str,
                side,
                layer,
                headboard_num,
                apa_channel,
                dwa_channel,
                int(segment),
                tension,
                confidence,
                submitted,
                algo_ver,
            ]
        )
    df = pd.DataFrame(
        data,
        columns=[
            "stage",
            "scan_id",
            "datetime",
            "side",
            "layer",
            "headboard_num",
            "apa_channel",
            "dwa_channel",
            "segment",
            "tension",
            "confidence",
            "submitted",
            "algo_ver",
        ],
    )
    # Sort dataframe by scan ID, dwa channel and segment and reset index
    df = df.sort_values(by=["stage", "scan_id", "dwa_channel", "segment"]).reset_index(drop=True)
    return df


if __name__ == "__main__":
    import argparse
    import json

    parser = argparse.ArgumentParser(
        description="Converts a JSON file that is produced by the GUI app (or the processing script) into a CSV table."
    )
    parser.add_argument("input_json", help="Path to the JSON file.")
    parser.add_argument("output_csv", help="Path to the CSV file.")
    args = parser.parse_args()

    with open(args.input_json, "r") as f:
        input_dict = json.load(f)

    df = convert_dict_to_dataframe(input_dict)
    df.to_csv(args.output_csv, index=False)
