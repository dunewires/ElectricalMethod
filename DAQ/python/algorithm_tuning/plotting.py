"""
Plotting functions for the resonance analysis. 

Plot waveforms, CWT coefficients, and the fit to the resonances.
"""

import sys
import numpy as np
import matplotlib.pyplot as plt
from scipy import signal
from run_processing import load_measurement

sys.path.append("../processing")

import tension_algorithm_v2 as ta

SEGMENT_COLORS = ["red", "green", "blue"]
"""Segments are always categorized as red, green, or blue."""


def plot_scan(scan_dict, figsize=(10, 10), color="k", lw=1, **plot_kwargs):
    """Plot the waveforms for all eight channels of a given scan.

    The scan is a dictionary with keys corresponding to the wire segments and values
    corresponding to the frequency and amplitude arrays.

    Parameters
    ----------
    scan_dict : dict
        Dictionary with wire segments as keys and dictionaries with frequency and amplitude
        arrays as values.

    Returns
    -------
    fig : matplotlib.figure.Figure
        Figure object
    """
    fig, axes = plt.subplots(
        4, 2, figsize=figsize, constrained_layout=True, sharex=True, sharey=True
    )
    apa_channels = scan_dict["apa_channels"]
    layer = scan_dict["layer"]
    side = scan_dict["side"]
    for i, channel in enumerate(apa_channels):
        ax = axes[i // 2, i % 2]
        show_best_fit = "fit_tensions" in scan_dict[channel]
        plot_channel(
            scan_dict[channel],
            layer=layer,
            side=side,
            ax=ax,
            set_ax_labels=False,
            color=color,
            lw=lw,
            show_best_fit=show_best_fit,
            expectation_line_kw={"lw": 1.0},
            **plot_kwargs,
        )
        # Write segment name on the plot
        ax.text(
            0.5,
            0.95,
            f"DWA:{i} APA:{layer}{side}{channel}",
            transform=ax.transAxes,
            va="top",
            ha="center",
        )

    # Add x-axis label only to the bottom row of axes
    for ax in axes[-1, :]:
        ax.set_xlabel("Frequency (Hz)")
    # Add y-axis label only to the left column of axes
    for ax in axes[:, 0]:
        ax.set_ylabel("Amplitude")
    return fig


def plot_channel(
    channel_dict,
    layer=None,
    side=None,
    ax=None,
    set_ax_labels=True,
    show_expectation=True,
    show_best_fit=False,
    expectation_line_kw={},
    best_fit_line_kw={},
    plot_raw=False,
    **plot_kwargs,
):
    """Plot the waveforms for a single channel of a given scan.

    The channel is a dictionary with keys corresponding to the frequency and amplitude
    arrays.

    Parameters
    ----------
    channel_dict : dict
        Dictionary with frequency and amplitude arrays.
    ax : matplotlib.axes.Axes, optional
        Axes object to plot on, by default None
    set_ax_labels : bool, optional
        Whether to set the x- and y-axis labels, by default True

    Returns
    -------
    ax : matplotlib.axes.Axes
        Axes object
    """

    algo = ta.TensionAlgorithmV2(0)
    default_expectation_line_kw = {"ls": "--", "lw": 1.5}
    expectation_line_kw = {**default_expectation_line_kw, **expectation_line_kw}

    default_best_fit_line_kw = {"ls": "-", "lw": 2}
    best_fit_line_kw = {**default_best_fit_line_kw, **best_fit_line_kw}

    default_plot_kw = {"color": "k", "lw": 1}
    plot_kwargs = {**default_plot_kw, **plot_kwargs}

    if show_best_fit:
        assert "fit" in channel_dict, "Must have fit tensions to show best fit."
        assert "frequencies" in channel_dict["fit"], "Must have fit frequencies to show best fit."
        assert layer is not None, "Must specify both layer and side."
        assert side is not None, "Must specify both layer and side."

    if ax is None:
        fig, ax = plt.subplots(1, 1, figsize=plot_kwargs.pop("figsize", (10, 5)))

    freq = channel_dict["freq"]
    if plot_raw:
        ampl = channel_dict["ampl"]
    else:
        ampl = algo.cumsum_and_baseline_subtracted(freq, channel_dict["ampl"])
    ax.plot(freq, ampl, **plot_kwargs)
    segments = channel_dict["segments"]

    if show_best_fit:
        for segment, tension, c in zip(segments, channel_dict["fit"]["tensions"], SEGMENT_COLORS):
            ax.plot([], [], color=c, label=f"{layer}{side}{segment}: {tension:.2f} N")
        ax.legend(ncol=len(segments), loc="lower center")

    if show_expectation:
        expected_frequencies = channel_dict["freq_expectation"]
        for segment, freq_arr, c in zip(segments, expected_frequencies, SEGMENT_COLORS):
            for freq in freq_arr:
                ax.axvline(freq, color=c, **expectation_line_kw)

    if show_best_fit:
        fit_frequencies = channel_dict["fit"]["frequencies"]
        for segment, freq_arr, c in zip(segments, fit_frequencies, SEGMENT_COLORS):
            for freq in freq_arr:
                ax.axvline(freq, color=c, **best_fit_line_kw)

    if set_ax_labels:
        ax.set_xlabel("Frequency (Hz)")
        ax.set_ylabel("Amplitude")

    return ax


def plot_channel_cwt_matr(
    channel_dict,
    widths=(8, 16),
    ax=None,
    **plot_kwargs,
):
    algo = ta.TensionAlgorithmV2(0)
    freq, ampl = channel_dict["freq"], channel_dict["ampl"]
    ampl = algo.cumsum_and_baseline_subtracted(freq, ampl)
    cwtmatr = signal.cwt(ampl, signal.morlet2, widths=np.arange(*widths))

    if ax is None:
        fig, ax = plt.subplots(1, 1, figsize=plot_kwargs.pop("figsize", (10, 5)))
    # For cwt matrix plotting it is advisable to flip the y-axis
    # so that the low frequencies are at the bottom.
    cwtmatr_flip = np.flipud(cwtmatr)
    p = ax.imshow(
        np.abs(cwtmatr_flip),
        extent=[np.min(freq), np.max(freq), np.min(widths), np.max(widths)],
        cmap="PRGn",
        aspect="auto",
    )
    ax.set_xlabel("Frequency (Hz)")
    ax.set_ylabel("Width")
    return ax


def plot_channel_cwt(
    channel_dict,
    layer=None,
    side=None,
    ax=None,
    set_ax_labels=True,
    show_best_fit=False,
    expectation_line_kw={},
    best_fit_line_kw={},
    gauss_scale=10,
    widths=(8, 16),
    **plot_kwargs,
):
    """Plot the wavelet-transformed waveforms for a single channel of a given scan.

    The input waveform is transformed with the CWT, of which the average is taken
    over the widths. The average is then plotted.
    If a best fit is given, the reconvoluted waveform is also plotted.
    """

    algo = ta.TensionAlgorithmV2(0)
    default_expectation_line_kw = {"ls": "--", "lw": 1.5}
    expectation_line_kw = {**default_expectation_line_kw, **expectation_line_kw}

    default_best_fit_line_kw = {"ls": "-", "lw": 2}
    best_fit_line_kw = {**default_best_fit_line_kw, **best_fit_line_kw}

    default_plot_kw = {"color": "k", "lw": 1}
    plot_kwargs = {**default_plot_kw, **plot_kwargs}

    if show_best_fit:
        assert "fit" in channel_dict, "Must have fit tensions to show best fit."
        assert "frequencies" in channel_dict["fit"], "Must have fit frequencies to show best fit."
        assert layer is not None, "Must specify both layer and side."
        assert side is not None, "Must specify both layer and side."

    if ax is None:
        fig, ax = plt.subplots(1, 1, figsize=plot_kwargs.pop("figsize", (10, 5)))

    freq, ampl = channel_dict["freq"], channel_dict["ampl"]
    ampl = algo.cumsum_and_baseline_subtracted(freq, ampl)
    # run the CWT, use function imported from resonance_analysis with the default widths.
    # The function also does the averaging over the widths for us.
    corr_amplitude = algo._transform_cwt_amplitude(ampl, widths=widths)
    ax.plot(freq, corr_amplitude, **plot_kwargs)

    segments = channel_dict["segments"]

    if show_best_fit:
        for segment, tension, c in zip(segments, channel_dict["fit"]["tensions"], SEGMENT_COLORS):
            ax.plot([], [], color=c, label=f"{layer}{side}{segment}: {tension:.2f} N")
        ax.legend(ncol=len(segments), loc="lower center")

        fit_tensions = channel_dict["fit"]["tensions"]
        fit_weights = channel_dict["fit"]["weights"]
        print(fit_weights)
        default_frequencies = channel_dict["freq_expectation"]
        x, reconvolved_amplitude = reconvolve_with_tension_adjustment(
            freq, fit_weights, default_frequencies, fit_tensions, gauss_scale=gauss_scale
        )
        ax.plot(x, reconvolved_amplitude, label="reconvolved amplitude", **best_fit_line_kw)

        fit_frequencies = channel_dict["fit"]["frequencies"]
        for segment, freq_arr, c in zip(segments, fit_frequencies, SEGMENT_COLORS):
            for freq in freq_arr:
                ax.axvline(freq, color=c, **best_fit_line_kw)

    if set_ax_labels:
        ax.set_xlabel("Frequency (Hz)")
        ax.set_ylabel("Amplitude")

    return ax
