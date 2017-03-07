% Cooley-Tukey FFT code.
% CTFFT_prm.m and CTFFT_fft must exist in the same directory.

clear

[x_o, n, N, w] = CTFFT_prm();% Read CTFFT_prm.m file.


[x] = CTFFT_ftt(N, n, x_o, w);% Read CTFFT_fft.m file.
