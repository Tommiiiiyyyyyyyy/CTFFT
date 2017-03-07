% Cooley-Tukey FFT code and counting its number of calculations.
% CTFFT_prm.m, CTFFT_fft, COUNT.m must exist in the same directory.

clear

[x_o, n, N, w] = CTFFT_prm();% Read CTFFT_prm.m file.


[x, COUNT] = CTFFT_ftt_COUNT(N, n, x_o, w);% Read CTFFT_fft.m file.
