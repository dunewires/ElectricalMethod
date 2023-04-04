import os
import unittest
import sys

sys.path.append('../')

import process_scan
from dwa_daq_constants import *

class TestProcessScan(unittest.TestCase):
    def test_process_scan_integration_1(self):
        self._test_process_scan_integration('20230209T081356_X_B_10_433-435-437-439-441-443-445-447_T', 
                                            ('Tension', [447, 445, 443, 441, 439, 437, 435, 433], 
                                             [[5.84], [5.71], [6.94], [7.5], [5.78], [6.49], [6.18], [6.48]]))

    def test_process_scan_integration_2(self):
        self._test_process_scan_integration('20230209T081542_V_B_10_361-363-365-367-369-371-373-375-761-763-765-767-769-771-773-775_T', 
                                            ('Tension', [375, 373, 371, 369, 367, 365, 363, 361], 
                                             [[5.96, 6.85], [6.26, 6.81], [5.95, 6.9], [5.97, 6.74], [6.24, 6.69], [5.87, 6.76], [5.48, 7.27], [5.57, 7.13]]))

    # Add more test methods for each expected output

    def _test_process_scan_integration(self, dir_name, expected_output):
        # Define test data
        results_dict = process_scan.new_results_dict(APA_STAGES, APA_LAYERS, APA_SIDES, MAX_WIRE_SEGMENT)
        max_freq = 350.0
        version = "v1"
        verbosity = 2
        path = 'test/raw_scans'

        # Call the function being tested
        scan_type, apa_channels, tension_results = process_scan.process_scan(results_dict, os.path.join(path, dir_name), max_freq, version, verbosity)

        # Get the expected output for the current directory
        expected_scan_type, expected_apa_channels, expected_tension_results = expected_output

        # Assert that the function returned the expected values
        self.assertEqual(scan_type, expected_scan_type)
        self.assertEqual(apa_channels, expected_apa_channels)
        if tension_results is not None and expected_tension_results is not None:
            for chan_tensions, expected_chan_tensions in zip(tension_results, expected_tension_results):
                for seg_tension, expected_seg_tension in zip(chan_tensions, expected_chan_tensions):
                    self.assertAlmostEqual(seg_tension, expected_seg_tension, delta=0.5)
        else:
            self.assertEqual(tension_results, expected_tension_results)

if __name__ == '__main__':
    unittest.main(module='test_process_scan')
