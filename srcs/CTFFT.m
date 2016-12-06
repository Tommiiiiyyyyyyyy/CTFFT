% 

clear

[x_o, n, N, w] = CTFFT_prm();%


[x] = CTFFT_ftt(N, n, x_o, w);%
