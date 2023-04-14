from typing import List, Tuple, Optional, Dict, Any, Union
from abc import ABC, abstractmethod
import numpy as np

class TensionAlgorithmBase(ABC):
    def __init__(self, verbosity):
        self.verbosity = verbosity
        self.available_settings = {}

    def get_available_settings(self) -> Dict[str, Any]:
        """
        Get the available settings for the algorithm.

        This defines the keyword arguments that are accepted by the `process_channel` method.

        Returns:
            Dict[str, Any]: A dictionary of available settings.
        """
        return self.available_settings

    def check_kwargs(self, kwargs) -> None:
        """
        Check that the keyword arguments are valid.

        Args:
            **kwargs: Arbitrary keyword arguments.

        Returns:
            None
        """
        # Check that all keyword arguments are valid
        for key in kwargs:
            if key not in self.available_settings:
                raise ValueError(f"Invalid keyword argument: {key}")
        
        expected_type = {
            "float": float,
            "integer": int,
            "string": str,
            "boolean": bool,
            "choice": str
        }

        # Check that the keyword arguments are of the correct type
        for key, value in kwargs.items():
            if self.available_settings[key]["type"] == "choice":
                if value not in self.available_settings[key]["choices"]:
                    raise ValueError(f"Invalid choice for {key}: {value}")
            elif not isinstance(value, expected_type[self.available_settings[key]["type"]]):
                raise ValueError(f"Invalid type for {key}: {value}")
        
        # Check that the keyword arguments are within the allowed range if the "bounds" key is present
        for key, value in kwargs.items():
            if "bounds" in self.available_settings[key]:
                if value < self.available_settings[key]["bounds"][0] or value > self.available_settings[key]["bounds"][1]:
                    raise ValueError(f"Invalid value for {key}: {value}")
        
        # Pop all kwargs for which the "enabled" conditions are not met.
        # If the "enabled" key is present, it will contain a dictionary where the keys are the names of other kwargs
        # and the values are the values that the other kwargs must have for this one to be enabled.
        kwargs_to_pop = []
        for key, value in kwargs.items():
            if "enabled" in self.available_settings[key]:
                for other_key, other_value in self.available_settings[key]["enabled"].items():
                    if kwargs[other_key] != other_value:
                        kwargs_to_pop.append(key)
                        break
        
        for key in kwargs_to_pop:
            kwargs.pop(key)

    @abstractmethod # This must be implemented by derived classes
    def process_channel(self, layer: int, apa_channel: int, freq_arr: np.ndarray, ampl_arr: np.ndarray, 
                        max_freq: float = 250., nominal_tension: float = 6.5, **kwargs) -> Tuple[List, List, List, List]:
        """
        Process a given channel to find the optimal placement of resonances and calculate the tension of each segment.
        
        Args:
            layer (int): The layer of the channel.
            apa_channel (int): The channel number.
            freq_arr (np.ndarray): A NumPy array of frequency values.
            ampl_arr (np.ndarray): A NumPy array of amplitude values.
            max_freq (float, optional): The maximum frequency to search for resonances. Defaults to 250.
            nominal_tension (float, optional): The nominal tension value. Defaults to 6.5.
            **kwargs: Arbitrary keyword arguments depending on the version of the algorithm.
        
        Returns:
            Tuple[List, List, List, List]: A tuple containing the following lists:
                - wire_segments: The list of wire segments corresponding to the channel.
                - selected_moved_res_arr: The list of selected moved resonance arrays.
                - selected_tension: The list of selected tension values.
                - confidences: The list of confidence values for each tension value.
        """
    
    @abstractmethod # This must be implemented by derived classes
    def cumsum_and_baseline_subtracted(self, freq_arr: np.ndarray, ampl_arr: np.ndarray) -> np.ndarray:
        """
        Take the raw amplitude array and generate a waveform to display in plots for manual correction.
        
        Args:
            freq_arr (np.ndarray): A NumPy array of frequency values.
            ampl_arr (np.ndarray): A NumPy array of amplitude values.
        
        Returns:
            np.ndarray: A NumPy array of baseline-subtracted amplitude values.
        """

    def print_if_verbose(self, message: str, verbosity_level: int = 1) -> None:
        """
        Print a message if the given verbosity level is greater than or equal to the specified verbosity level.

        Args:
            message (str): The message to be printed.
            verbosity (int): The current verbosity level.
            verbosity_level (int, optional): The minimum verbosity level required to print the message. Defaults to 1.

        Returns:
            None
        """
        # Check if the current verbosity level is greater than or equal to the specified verbosity level
        if self.verbosity >= verbosity_level:
            print(message)

    def get_default_values(self, segments: List[float]) -> Tuple[List[List[float]], List[float], List[float]]:
        """
        Generate default values for resonances, tensions, and confidences based on the segments list.

        Args:
            segments (List[int]): A list of segments.
            verbosity (int, optional): Verbosity level for displaying errors. Defaults to 1.

        Returns:
            Tuple[List[int], List[List[float]], List[int], List[int]]: A tuple containing:
                - segments (List[int]): The input segments list.
                - default_res_arr (List[List[float]]): A list of empty lists, one for each segment.
                - default_tensions (List[int]): A list of -1 values, one for each segment.
                - default_confidences (List[int]): A list of -1 values, one for each segment.
        """
        # Create default arrays with the same length as the segments
        default_res_arr = [[] for s in segments]
        default_tensions = [-1 for s in segments]
        default_confidences = [-1 for s in segments]

        return segments, default_res_arr, default_tensions, default_confidences


