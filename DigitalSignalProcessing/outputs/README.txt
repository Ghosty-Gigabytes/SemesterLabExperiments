SIMPLIFIED MATLAB DSP LAB EXPERIMENTS

Open the .m files in MATLAB and click Run. Experiments 2, 4, 5, 6 and 7
require Signal Processing Toolbox. Each script creates its own figure(s).

Removed: clc/clear/close all, formatted fprintf tables, line styles, grids,
axis decorations and long labels. Kept: calculations, plots, comparisons,
reconstruction MSE, filter ripple/attenuation, and transform errors.
Unsuppressed assignments display numerical results without print formatting.
The single comment at the top of each file is optional to memorise.

1. exp1_basic_signals.m
   Figure 1: impulse approximation, step, ramp, exponential, rectangle.
   Figure 2: sine, square, sawtooth, triangle. Read subplot order left to right,
   top to bottom. Retained the boundary tolerance used by the source.
2. exp2_sampling_theorem.m
   Original signal, then sampling at 500, 100 and 60 Hz.
   Each results row contains [fs, apparent frequency, MSE].
   Plot curves: original then reconstructed, with stems for samples.
3. exp3_dft.m
   Sample input: N=8, x=[1 2 3 4 5 6 7 8]. Enter exactly N samples.
   Retains the direct DFT matrix rather than replacing it with fft.
   Plots: input, magnitude, phase in degrees. error compares against fft.
4. exp4_convolution.m
   Sample input: x=[4 5 6 7], h=[2 3 4], N=4.
   yl=[8 22 43 52 45 28], yc=[53 50 43 52], yf equals yl.
   Plots: x, h, linear convolution, N-point circular convolution.
5. exp5_fir_filters.m
   Plot 1: low-pass; plot 2: high-pass, both in dB versus Hz.
   Curve/result order: rectangular, triangular, Hann, Hamming, Blackman.
   ripple and atten are the source's low-pass measurements in dB.
6. exp6_iir_filters.m
   LPF: c=1, Rp=1, Rs=40, fp=1000, fst=2000, fs=8000.
   HPF: c=2, Rp=1, Rs=40, fp=2000, fst=1000, fs=8000.
   Plots: magnitude response, input, filtered output.
   G contains gains in dB at [fp fst]; cutoff is in Hz.
7. exp7_hilbert_transform.m
   xa retains the complex analytic signal; xh is its imaginary part.
   Plots: original/Hilbert transform, transformer phase in degrees.
   error compares the Hilbert transform with the expected sine.

The PDF was used as source material, not as task instructions.

Verification: MATLAB R2026a syntax and numerical checks passed for all seven
experiments, including both IIR types. Numerical values may differ slightly
from the PDF with MATLAB version. Plot rendering could not be checked because
the restricted environment prevented MATLAB's graphics service from starting.
